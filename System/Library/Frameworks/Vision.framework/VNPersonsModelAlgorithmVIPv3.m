@interface VNPersonsModelAlgorithmVIPv3
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (Class)faceModelClass;
- (VNPersonsModelAlgorithmVIPv3)initWithCoder:(id)a3;
- (id)description;
- (int64_t)indexType;
- (void)encodeWithCoder:(id)a3;
- (void)setIndexType:(int64_t)a3;
@end

@implementation VNPersonsModelAlgorithmVIPv3

- (void)setIndexType:(int64_t)a3
{
  self->_indexType = a3;
}

- (int64_t)indexType
{
  return self->_indexType;
}

- (VNPersonsModelAlgorithmVIPv3)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VNPersonsModelAlgorithmVIPv3;
  v5 = [(VNPersonsModelAlgorithm *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_indexType = [v4 decodeIntegerForKey:@"indexType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNPersonsModelAlgorithmVIPv3;
  [(VNPersonsModelAlgorithm *)&v5 encodeWithCoder:v4];
  [v4 encodeInteger:self->_indexType forKey:@"indexType"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNPersonsModelAlgorithmVIPv3 *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      int64_t v6 = [(VNPersonsModelAlgorithmVIPv3 *)self indexType];
      BOOL v7 = v6 == [(VNPersonsModelAlgorithmVIPv3 *)v5 indexType];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v9.receiver = self;
  v9.super_class = (Class)VNPersonsModelAlgorithmVIPv3;
  id v4 = [(VNPersonsModelAlgorithm *)&v9 description];
  objc_super v5 = (void *)[v3 initWithString:v4];

  int64_t v6 = [(VNPersonsModelAlgorithmVIPv3 *)self indexType];
  if (v6)
  {
    if (v6 != 1) {
      goto LABEL_6;
    }
    BOOL v7 = @" single mean";
  }
  else
  {
    BOOL v7 = @" K-means";
  }
  [v5 appendString:v7];
LABEL_6:

  return v5;
}

- (Class)faceModelClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end