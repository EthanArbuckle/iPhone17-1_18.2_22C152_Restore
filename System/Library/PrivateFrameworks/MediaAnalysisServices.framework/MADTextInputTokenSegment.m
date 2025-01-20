@interface MADTextInputTokenSegment
+ (BOOL)supportsSecureCoding;
- (MADTextInputTokenSegment)initWithCoder:(id)a3;
- (MADTextInputTokenSegment)initWithTokenIDs:(id)a3;
- (NSArray)tokenIDs;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADTextInputTokenSegment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADTextInputTokenSegment)initWithTokenIDs:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADTextInputTokenSegment;
  v5 = [(MADTextInputTokenSegment *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    tokenIDs = v5->_tokenIDs;
    v5->_tokenIDs = (NSArray *)v6;
  }
  return v5;
}

- (MADTextInputTokenSegment)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADTextInputTokenSegment;
  v5 = [(MADTextInputSegment *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"TokenIDs"];
    tokenIDs = v5->_tokenIDs;
    v5->_tokenIDs = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADTextInputTokenSegment;
  id v4 = a3;
  [(MADTextInputSegment *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tokenIDs, @"TokenIDs", v5.receiver, v5.super_class);
}

- (int64_t)type
{
  return 3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"tokenIDs: %@>", self->_tokenIDs];
  return v3;
}

- (NSArray)tokenIDs
{
  return self->_tokenIDs;
}

- (void).cxx_destruct
{
}

@end