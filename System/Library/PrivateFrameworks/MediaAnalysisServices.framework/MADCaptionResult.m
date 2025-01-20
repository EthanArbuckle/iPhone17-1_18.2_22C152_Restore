@interface MADCaptionResult
+ (BOOL)supportsSecureCoding;
- (BOOL)containsUnsafeContent;
- (BOOL)isLowConfidence;
- (MADCaptionResult)initWithCaption:(id)a3 score:(float)a4 containsUnsafeContent:(BOOL)a5 isLowConfidence:(BOOL)a6 classificationIdentifiers:(id)a7;
- (MADCaptionResult)initWithCoder:(id)a3;
- (NSArray)classificationIdentifiers;
- (NSString)caption;
- (float)score;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADCaptionResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADCaptionResult)initWithCaption:(id)a3 score:(float)a4 containsUnsafeContent:(BOOL)a5 isLowConfidence:(BOOL)a6 classificationIdentifiers:(id)a7
{
  id v13 = a3;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)MADCaptionResult;
  v15 = [(MADResult *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_caption, a3);
    v16->_score = a4;
    v16->_containsUnsafeContent = a5;
    v16->_isLowConfidence = a6;
    objc_storeStrong((id *)&v16->_classificationIdentifiers, a7);
  }

  return v16;
}

- (MADCaptionResult)initWithCoder:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MADCaptionResult;
  v5 = [(MADResult *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Caption"];
    caption = v5->_caption;
    v5->_caption = (NSString *)v6;

    [v4 decodeFloatForKey:@"Score"];
    v5->_score = v8;
    v5->_containsUnsafeContent = [v4 decodeBoolForKey:@"ContainsUnsafeContent"];
    v5->_isLowConfidence = [v4 decodeBoolForKey:@"IsLowConfidence"];
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    v11 = [v9 setWithArray:v10];

    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"ClassificationIdentifiers"];
    classificationIdentifiers = v5->_classificationIdentifiers;
    v5->_classificationIdentifiers = (NSArray *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MADCaptionResult;
  id v4 = a3;
  [(MADResult *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_caption, @"Caption", v6.receiver, v6.super_class);
  *(float *)&double v5 = self->_score;
  [v4 encodeFloat:@"Score" forKey:v5];
  [v4 encodeBool:self->_containsUnsafeContent forKey:@"ContainsUnsafeContent"];
  [v4 encodeBool:self->_isLowConfidence forKey:@"IsLowConfidence"];
  [v4 encodeObject:self->_classificationIdentifiers forKey:@"ClassificationIdentifiers"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"Caption: %@>", self->_caption];
  objc_msgSend(v3, "appendFormat:", @"Score: %f>", self->_score);
  if (self->_containsUnsafeContent) {
    objc_super v6 = @"YES";
  }
  else {
    objc_super v6 = @"NO";
  }
  [v3 appendFormat:@"ContainsUnsafeContent: %@>", v6];
  if (self->_isLowConfidence) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v3 appendFormat:@"IsLowConfidence: %@>", v7];
  [v3 appendFormat:@"ClassificationIdentifiers: %@>", self->_classificationIdentifiers];
  return v3;
}

- (NSString)caption
{
  return self->_caption;
}

- (float)score
{
  return self->_score;
}

- (BOOL)containsUnsafeContent
{
  return self->_containsUnsafeContent;
}

- (BOOL)isLowConfidence
{
  return self->_isLowConfidence;
}

- (NSArray)classificationIdentifiers
{
  return self->_classificationIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationIdentifiers, 0);
  objc_storeStrong((id *)&self->_caption, 0);
}

@end