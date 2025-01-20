@interface MADMultiModalResult
+ (BOOL)supportsSecureCoding;
- (MADMultiModalResult)initWithCoder:(id)a3;
- (id)description;
@end

@implementation MADMultiModalResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMultiModalResult)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MADMultiModalResult;
  return [(MADMultiModalResult *)&v4 init];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p>", v5, self];

  return v3;
}

@end