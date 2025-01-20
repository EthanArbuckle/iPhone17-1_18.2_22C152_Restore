@interface MFTheme
+ (Class)visualEffectClassAllowingBlur:(BOOL)a3;
+ (id)defaultBlurEffect;
+ (id)visualEffectViewAllowingBlur:(BOOL)a3;
+ (id)visualEffectViewAllowingBlur:(BOOL)a3 withBlurEffect:(id)a4;
@end

@implementation MFTheme

+ (Class)visualEffectClassAllowingBlur:(BOOL)a3
{
  v3 = objc_opt_class();
  return (Class)v3;
}

+ (id)visualEffectViewAllowingBlur:(BOOL)a3
{
  id v4 = objc_alloc((Class)[a1 visualEffectClassAllowingBlur:a3]);
  v5 = [a1 defaultBlurEffect];
  v6 = (void *)[v4 initWithEffect:v5];

  [v6 _setGroupName:@"default-background-group"];
  return v6;
}

+ (id)visualEffectViewAllowingBlur:(BOOL)a3 withBlurEffect:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "visualEffectClassAllowingBlur:", v4)), "initWithEffect:", v6);

  [v7 _setGroupName:@"default-background-group"];
  return v7;
}

+ (id)defaultBlurEffect
{
  return (id)[MEMORY[0x263F824D8] effectWithStyle:1100];
}

@end