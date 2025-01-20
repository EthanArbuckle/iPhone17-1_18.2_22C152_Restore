@interface HealthAppTrendsLinkBuilder
- (id)URLForHealthTrends;
@end

@implementation HealthAppTrendsLinkBuilder

- (id)URLForHealthTrends
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F29088]);
  v3 = +[HAServicesDefines internalHealthAppURLScheme];
  [v2 setScheme:v3];

  v4 = +[HAServicesDefines healthTrendsHostName];
  [v2 setHost:v4];

  v5 = [v2 URL];

  return v5;
}

@end