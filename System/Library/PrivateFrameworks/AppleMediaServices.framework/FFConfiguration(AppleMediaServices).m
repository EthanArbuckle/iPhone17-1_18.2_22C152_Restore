@interface FFConfiguration(AppleMediaServices)
- (id)ams_safeStateForFeature:()AppleMediaServices domain:;
- (id)ams_safeStateForFeature:()AppleMediaServices domain:level:;
@end

@implementation FFConfiguration(AppleMediaServices)

- (id)ams_safeStateForFeature:()AppleMediaServices domain:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 stateForFeature:v6 domain:v7];

  return v8;
}

- (id)ams_safeStateForFeature:()AppleMediaServices domain:level:
{
  id v8 = a3;
  id v9 = a4;
  v10 = [a1 stateForFeature:v8 domain:v9 level:a5];

  return v10;
}

@end