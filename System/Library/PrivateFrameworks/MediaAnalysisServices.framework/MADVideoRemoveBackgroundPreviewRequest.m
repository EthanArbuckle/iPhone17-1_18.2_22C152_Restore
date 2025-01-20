@interface MADVideoRemoveBackgroundPreviewRequest
+ (BOOL)supportsSecureCoding;
- (MADVideoRemoveBackgroundPreviewResult)result;
- (id)description;
@end

@implementation MADVideoRemoveBackgroundPreviewRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p", v5, self];

  v6 = [(MADVideoRequest *)self results];
  [v3 appendFormat:@", results: %@", v6];

  v7 = [(MADVideoRequest *)self error];
  [v3 appendFormat:@", error: %@>", v7];

  return v3;
}

- (MADVideoRemoveBackgroundPreviewResult)result
{
  v2 = [(MADVideoRequest *)self results];
  v3 = [v2 firstObject];

  return (MADVideoRemoveBackgroundPreviewResult *)v3;
}

@end