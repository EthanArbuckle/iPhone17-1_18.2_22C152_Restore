@interface SNClassificationResult
+ (BOOL)supportsSecureCoding;
+ (SNClassificationResult)new;
- (BOOL)isEqual:(id)a3;
- (CMTimeRange)timeRange;
- (NSArray)classifications;
- (NSDictionary)classificationDictionary;
- (NSString)classifierIdentifier;
- (NSString)description;
- (SNClassification)classificationForIdentifier:(NSString *)identifier;
- (SNClassificationResult)init;
- (SNClassificationResult)initWithBinarySampleRepresentation:(id)a3;
- (SNClassificationResult)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (SNClassificationResult)initWithClassificationDictionary:(id)a3;
- (SNClassificationResult)initWithCoder:(id)a3;
- (SNClassificationResult)initWithImpl:(id)a3;
- (id)_initPrivate:(id)a3;
- (id)binarySampleRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)impl;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setClassificationDictionary:(id)a3;
- (void)setClassifierIdentifier:(id)a3;
- (void)setTimeRange:(id *)a3;
@end

@implementation SNClassificationResult

- (NSArray)classifications
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(_SNClassificationResult *)self->_impl classifications];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [[SNClassification alloc] initWithImpl:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (CMTimeRange)timeRange
{
  result = (CMTimeRange *)self->_impl;
  if (result) {
    return (CMTimeRange *)[(CMTimeRange *)result timeRange];
  }
  *(_OWORD *)&retstr->start.epoch = 0u;
  *(_OWORD *)&retstr->duration.timescale = 0u;
  *(_OWORD *)&retstr->start.value = 0u;
  return result;
}

- (SNClassificationResult)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"-init is not a valid initializer for the class SNClassificationResult" userInfo:0];
  objc_exception_throw(v2);
}

+ (SNClassificationResult)new
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"+new is not a valid class method for the class SNClassificationResult" userInfo:0];
  objc_exception_throw(v2);
}

- (SNClassification)classificationForIdentifier:(NSString *)identifier
{
  v3 = [(_SNClassificationResult *)self->_impl classificationForIdentifier:identifier];
  if (v3) {
    v4 = [[SNClassification alloc] initWithImpl:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (void)setTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var3;
  v4[0] = *(_OWORD *)&a3->var0.var0;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&a3->var1.var1;
  [(_SNClassificationResult *)self->_impl setTimeRange:v4];
}

- (NSString)classifierIdentifier
{
  return (NSString *)MEMORY[0x1F4181798](self->_impl, sel_classifierIdentifier);
}

- (void)setClassifierIdentifier:(id)a3
{
}

- (SNClassificationResult)initWithClassificationDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNClassificationResult;
  uint64_t v5 = [(SNClassificationResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [[_SNClassificationResult alloc] initWithClassificationDictionary:v4];
    impl = v5->_impl;
    v5->_impl = v6;

    if (!v5->_impl)
    {

      uint64_t v5 = 0;
    }
  }

  return v5;
}

- (NSDictionary)classificationDictionary
{
  return (NSDictionary *)MEMORY[0x1F4181798](self->_impl, sel_classificationDictionary);
}

- (void)setClassificationDictionary:(id)a3
{
}

- (SNClassificationResult)initWithImpl:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNClassificationResult;
  uint64_t v6 = [(SNClassificationResult *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_impl, a3);
  }

  return v7;
}

- (id)_initPrivate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNClassificationResult;
  id v5 = [(SNClassificationResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [[_SNClassificationResult alloc] _initPrivate:v4];
    impl = v5->_impl;
    v5->_impl = v6;

    if (!v5->_impl)
    {

      id v5 = 0;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(_SNClassificationResult *)self->_impl copyWithZone:a3];
  uint64_t v7 = (void *)[v5 initWithImpl:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SNClassificationResult *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(_SNClassificationResult *)self->_impl isEqual:v5->_impl];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  return MEMORY[0x1F4181798](self->_impl, sel_hash);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SNClassificationResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SNClassificationResult;
  id v5 = [(SNClassificationResult *)&v10 init];
  BOOL v6 = v5;
  if (!v4
    || v5
    && (uint64_t v7 = [[_SNClassificationResult alloc] initWithCoder:v4], impl = v6->_impl, v6->_impl = v7, impl, !v6->_impl))
  {

    BOOL v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  if (a3) {
    MEMORY[0x1F4181798](self->_impl, sel_encodeWithCoder_);
  }
}

- (SNClassificationResult)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SNClassificationResult;
  objc_super v10 = [(SNClassificationResult *)&v14 init];
  if (v10)
  {
    long long v11 = [[_SNClassificationResult alloc] initWithBinarySampleRepresentation:v8 metadata:v9 timestamp:a5];
    impl = v10->_impl;
    v10->_impl = v11;

    if (!v10->_impl)
    {

      objc_super v10 = 0;
    }
  }

  return v10;
}

- (SNClassificationResult)initWithBinarySampleRepresentation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNClassificationResult;
  id v5 = [(SNClassificationResult *)&v9 init];
  if (v5)
  {
    BOOL v6 = [[_SNClassificationResult alloc] initWithBinarySampleRepresentation:v4];
    impl = v5->_impl;
    v5->_impl = v6;

    if (!v5->_impl)
    {

      id v5 = 0;
    }
  }

  return v5;
}

- (id)binarySampleRepresentation
{
  return (id)MEMORY[0x1F4181798](self->_impl, sel_binarySampleRepresentation);
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F4181798](self->_impl, sel_description);
}

- (id)impl
{
  return self->_impl;
}

- (void).cxx_destruct
{
}

@end