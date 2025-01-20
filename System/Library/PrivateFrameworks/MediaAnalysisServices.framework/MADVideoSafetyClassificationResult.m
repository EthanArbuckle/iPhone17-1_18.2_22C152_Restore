@interface MADVideoSafetyClassificationResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isSensitive;
- (MADVideoSafetyClassificationResult)initWithCoder:(id)a3;
- (MADVideoSafetyClassificationResult)initWithIsSensitive:(BOOL)a3 scoresForLabels:(id)a4;
- (NSDictionary)scoresForLabels;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADVideoSafetyClassificationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVideoSafetyClassificationResult)initWithIsSensitive:(BOOL)a3 scoresForLabels:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MADVideoSafetyClassificationResult;
  v8 = [(MADVideoSafetyClassificationResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_isSensitive = a3;
    objc_storeStrong((id *)&v8->_scoresForLabels, a4);
  }

  return v9;
}

- (MADVideoSafetyClassificationResult)initWithCoder:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADVideoSafetyClassificationResult;
  v5 = [(MADVideoResult *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
    v8 = [v6 setWithArray:v7];

    v5->_isSensitive = [v4 decodeBoolForKey:@"IsSensitive"];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"ScoresForLabels"];
    scoresForLabels = v5->_scoresForLabels;
    v5->_scoresForLabels = (NSDictionary *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADVideoSafetyClassificationResult;
  id v4 = a3;
  [(MADVideoResult *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_isSensitive, @"IsSensitive", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_scoresForLabels forKey:@"ScoresForLabels"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p", v5, self];

  if (self->_isSensitive) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [v3 appendFormat:@", isSensitive: %@", v6];
  id v7 = [(NSDictionary *)self->_scoresForLabels description];
  [v3 appendFormat:@", ScoresForLabels: %@", v7];

  [v3 appendString:@">"];
  return v3;
}

- (BOOL)isSensitive
{
  return self->_isSensitive;
}

- (NSDictionary)scoresForLabels
{
  return self->_scoresForLabels;
}

- (void).cxx_destruct
{
}

@end