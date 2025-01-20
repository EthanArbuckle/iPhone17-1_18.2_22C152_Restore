@interface FBSDisplayConfiguration
- (id)clb_displayConfigurationForNonClarityUIApp;
@end

@implementation FBSDisplayConfiguration

- (id)clb_displayConfigurationForNonClarityUIApp
{
  uint64_t v3 = sub_10000730C();
  sub_1000254CC(v3, (uint64_t)v10);
  double v4 = *(double *)v10;
  double v5 = *(double *)&v10[1];
  v6 = [(FBSDisplayConfiguration *)self currentMode];
  id v7 = objc_msgSend(v6, "_copyWithOverrideSize:", v4, v5);

  id v8 = [(FBSDisplayConfiguration *)self copyWithOverrideMode:v7];

  return v8;
}

@end