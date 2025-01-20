@interface MADImageSafetyClassificationResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isSensitive;
- (MADImageSafetyClassificationResult)initWithCoder:(id)a3;
- (MADImageSafetyClassificationResult)initWithIsSensitive:(BOOL)a3 andAttributes:(id)a4;
- (NSDictionary)attributes;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADImageSafetyClassificationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADImageSafetyClassificationResult)initWithIsSensitive:(BOOL)a3 andAttributes:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MADImageSafetyClassificationResult;
  v7 = [(MADResult *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_isSensitive = a3;
    uint64_t v9 = [v6 copy];
    attributes = v8->_attributes;
    v8->_attributes = (NSDictionary *)v9;
  }
  return v8;
}

- (MADImageSafetyClassificationResult)initWithCoder:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADImageSafetyClassificationResult;
  v5 = [(MADResult *)&v12 init];
  if (v5)
  {
    v5->_isSensitive = [v4 decodeBoolForKey:@"IsSensitive"];
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Attributes"];
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL isSensitive = self->_isSensitive;
  id v5 = a3;
  [v5 encodeBool:isSensitive forKey:@"IsSensitive"];
  [v5 encodeObject:self->_attributes forKey:@"Attributes"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  objc_msgSend(v3, "appendFormat:", @"isSensitive: %d,", self->_isSensitive);
  [v3 appendFormat:@"attributes: %@>", self->_attributes];
  return v3;
}

- (BOOL)isSensitive
{
  return self->_isSensitive;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
}

@end