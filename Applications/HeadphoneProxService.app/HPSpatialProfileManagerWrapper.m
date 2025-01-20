@interface HPSpatialProfileManagerWrapper
+ (BOOL)isProxCardEnrollmentSupportedForDevice:(id)a3;
+ (id)profileEnrollmentViewController;
+ (void)setProxCardShowed:(BOOL)a3 forDevice:(id)a4;
@end

@implementation HPSpatialProfileManagerWrapper

+ (BOOL)isProxCardEnrollmentSupportedForDevice:(id)a3
{
  v3 = (Class (__cdecl *)())off_1000D4278;
  id v4 = a3;
  LOBYTE(v3) = [(objc_class *)v3() isProxCardEnrollmentSupportedForDevice:v4];

  return (char)v3;
}

+ (id)profileEnrollmentViewController
{
  Class v2 = off_1000D4278();

  return [(objc_class *)v2 profileEnrollmentViewController];
}

+ (void)setProxCardShowed:(BOOL)a3 forDevice:(id)a4
{
  BOOL v4 = a3;
  v5 = off_1000D4278;
  id v6 = a4;
  [(objc_class *)v5() setProxCardShowed:v4 forDevice:v6];
}

@end