@interface VNEntityIdentificationModelAlgorithmVIPv3
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (Class)trainedModelClass;
- (VNEntityIdentificationModelAlgorithmVIPv3)initWithCoder:(id)a3;
- (id)description;
- (int64_t)indexType;
- (void)encodeWithCoder:(id)a3;
- (void)setIndexType:(int64_t)a3;
@end

@implementation VNEntityIdentificationModelAlgorithmVIPv3

- (void)setIndexType:(int64_t)a3
{
  self->_indexType = a3;
}

- (int64_t)indexType
{
  return self->_indexType;
}

- (VNEntityIdentificationModelAlgorithmVIPv3)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VNEntityIdentificationModelAlgorithmVIPv3;
  v5 = [(VNEntityIdentificationModelAlgorithm *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_indexType = [v4 decodeIntegerForKey:@"indexType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VNEntityIdentificationModelAlgorithmVIPv3;
  id v4 = a3;
  [(VNEntityIdentificationModelAlgorithm *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_indexType, @"indexType", v5.receiver, v5.super_class);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNEntityIdentificationModelAlgorithmVIPv3 *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      int64_t v6 = [(VNEntityIdentificationModelAlgorithmVIPv3 *)self indexType];
      uint64_t v7 = [(VNEntityIdentificationModelAlgorithmVIPv3 *)v5 indexType];

      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v9.receiver = self;
  v9.super_class = (Class)VNEntityIdentificationModelAlgorithmVIPv3;
  id v4 = [(VNEntityIdentificationModelAlgorithm *)&v9 description];
  objc_super v5 = (void *)[v3 initWithString:v4];

  int64_t v6 = [(VNEntityIdentificationModelAlgorithmVIPv3 *)self indexType];
  if (v6)
  {
    if (v6 != 1) {
      goto LABEL_6;
    }
    uint64_t v7 = @" single mean";
  }
  else
  {
    uint64_t v7 = @" K-means";
  }
  [v5 appendString:v7];
LABEL_6:

  return v5;
}

- (Class)trainedModelClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end