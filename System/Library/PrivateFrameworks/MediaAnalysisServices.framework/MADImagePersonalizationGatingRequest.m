@interface MADImagePersonalizationGatingRequest
+ (BOOL)supportsSecureCoding;
- (MADImagePersonalizationGatingResult)gatingResult;
- (id)description;
@end

@implementation MADImagePersonalizationGatingRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADImagePersonalizationGatingResult)gatingResult
{
  v2 = [(MADRequest *)self results];
  v3 = [v2 firstObject];

  return (MADImagePersonalizationGatingResult *)v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  v6 = [(MADRequest *)self results];
  [v3 appendFormat:@"results: %@, ", v6];

  v7 = [(MADRequest *)self error];
  [v3 appendFormat:@"error: %@>", v7];

  return v3;
}

@end