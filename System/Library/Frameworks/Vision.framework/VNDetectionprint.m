@interface VNDetectionprint
+ (BOOL)supportsSecureCoding;
+ (id)knownTensorKeysForRequestRevision:(unint64_t)a3 error:(id *)a4;
+ (id)tensorShapeForKey:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)tensorKeys;
- (VNDetectionprint)initWithCoder:(id)a3;
- (VNDetectionprint)initWithTensorsDictionary:(id)a3 originatingRequestSpecifier:(id)a4;
- (VNDetectionprint)initWithTensorsDictionary:(id)a3 requestRevision:(unint64_t)a4;
- (VNRequestSpecifier)originatingRequestSpecifier;
- (id)tensorForKey:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (unint64_t)requestRevision;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNDetectionprint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingRequestSpecifier, 0);

  objc_storeStrong((id *)&self->_tensorsDictionary, 0);
}

- (VNRequestSpecifier)originatingRequestSpecifier
{
  return self->_originatingRequestSpecifier;
}

- (unint64_t)requestRevision
{
  v2 = [(VNDetectionprint *)self originatingRequestSpecifier];
  unint64_t v3 = [v2 requestRevision];

  return v3;
}

- (VNDetectionprint)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v5, "initWithObjects:", v6, v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"tensors"];
  if (!v9) {
    goto LABEL_6;
  }
  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"request"];
  if (v10) {
    goto LABEL_3;
  }
  if ([v4 containsValueForKey:@"request"])
  {
LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  id v15 = 0;
  uint64_t v10 = objc_msgSend((id)objc_opt_class(), "originatingRequestSpecifierForRequestRevision:error:", objc_msgSend(v4, "decodeIntegerForKey:", @"requestRevision"), &v15);
  id v14 = v15;
  v11 = v14;
  if (!v10)
  {
    [v4 failWithError:v14];
    v12 = 0;
    goto LABEL_4;
  }

LABEL_3:
  self = [(VNDetectionprint *)self initWithTensorsDictionary:v9 originatingRequestSpecifier:v10];
  v11 = (void *)v10;
  v12 = self;
LABEL_4:

LABEL_7:
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_tensorsDictionary forKey:@"tensors"];
  [v4 encodeObject:self->_originatingRequestSpecifier forKey:@"request"];
}

- (VNDetectionprint)initWithTensorsDictionary:(id)a3 requestRevision:(unint64_t)a4
{
  id v6 = a3;
  id v12 = 0;
  uint64_t v7 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:a4 error:&v12];
  id v8 = v12;
  v9 = [v8 localizedDescription];
  +[VNError VNAssert:v7 != 0 log:v9];

  uint64_t v10 = [(VNDetectionprint *)self initWithTensorsDictionary:v6 originatingRequestSpecifier:v7];
  return v10;
}

- (VNDetectionprint)initWithTensorsDictionary:(id)a3 originatingRequestSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VNDetectionprint;
  id v8 = [(VNDetectionprint *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    tensorsDictionary = v8->_tensorsDictionary;
    v8->_tensorsDictionary = (NSDictionary *)v9;

    objc_storeStrong((id *)&v8->_originatingRequestSpecifier, a4);
  }

  return v8;
}

- (id)tensorForKey:(id)a3 error:(id *)a4
{
  id v6 = (NSString *)a3;
  id v7 = [(NSDictionary *)self->_tensorsDictionary objectForKey:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else if (a4)
  {
    _unavailableTensorKeyError(v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (NSArray)tensorKeys
{
  return [(NSDictionary *)self->_tensorsDictionary allKeys];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNDetectionprint *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(VNDetectionprint *)self originatingRequestSpecifier];
      id v7 = [(VNDetectionprint *)v5 originatingRequestSpecifier];
      char v8 = [v6 isEqual:v7];

      BOOL v9 = (v8 & 1) != 0
        && [(NSDictionary *)self->_tensorsDictionary isEqualToDictionary:v5->_tensorsDictionary];
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_tensorsDictionary hash] ^ __ROR8__([(VNRequestSpecifier *)self->_originatingRequestSpecifier hash], 51);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)tensorShapeForKey:(id)a3 error:(id *)a4
{
  id v5 = (NSString *)a3;
  if (+[VNDetectionprint tensorShapeForKey:error:]::onceToken != -1) {
    dispatch_once(&+[VNDetectionprint tensorShapeForKey:error:]::onceToken, &__block_literal_global_20232);
  }
  id v6 = [(id)+[VNDetectionprint tensorShapeForKey:error:]::tensorShapes objectForKeyedSubscript:v5];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else if (a4)
  {
    _unavailableTensorKeyError(v5);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void __44__VNDetectionprint_tensorShapeForKey_error___block_invoke()
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"VNDetectionprintTensorKeyMixed2";
  v0 = (void *)[objc_alloc(MEMORY[0x1E4FB3E98]) initWithBatchNumber:1 channels:288 height:35 width:35];
  v7[0] = v0;
  v6[1] = @"VNDetectionprintTensorKeyMixed6";
  v1 = (void *)[objc_alloc(MEMORY[0x1E4FB3E98]) initWithBatchNumber:1 channels:768 height:17 width:17];
  v7[1] = v1;
  v6[2] = @"VNDetectionprintTensorKeyStride8FeatureMap";
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB3E98]) initWithBatchNumber:1 channels:128 height:45 width:45];
  v7[2] = v2;
  v6[3] = @"VNDetectionprintTensorKeyStride16FeatureMap";
  unint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4FB3E98]) initWithBatchNumber:1 channels:168 height:23 width:23];
  v7[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
  id v5 = (void *)+[VNDetectionprint tensorShapeForKey:error:]::tensorShapes;
  +[VNDetectionprint tensorShapeForKey:error:]::tensorShapes = v4;
}

+ (id)knownTensorKeysForRequestRevision:(unint64_t)a3 error:(id *)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    v10[0] = @"VNDetectionprintTensorKeyStride8FeatureMap";
    v10[1] = @"VNDetectionprintTensorKeyStride16FeatureMap";
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = v10;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v11[0] = @"VNDetectionprintTensorKeyMixed2";
    v11[1] = @"VNDetectionprintTensorKeyMixed6";
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = v11;
LABEL_5:
    id v6 = [v4 arrayWithObjects:v5 count:2];
    goto LABEL_9;
  }
  if (a4)
  {
    id v8 = +[VNError errorForUnsupportedRevision:a3 ofRequestClass:objc_opt_class()];
    id v6 = 0;
    *a4 = v8;
  }
  else
  {
    id v6 = 0;
  }
LABEL_9:

  return v6;
}

@end