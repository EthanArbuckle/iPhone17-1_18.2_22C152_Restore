@interface HWBlurEffect
+ (int64_t)_backdropStyleForCurrentDevice;
- (id)effectSettings;
@end

@implementation HWBlurEffect

- (id)effectSettings
{
  id v2 = [(id)objc_opt_class() _backdropStyleForCurrentDevice];

  return +[_UIBackdropViewSettings settingsForPrivateStyle:v2];
}

+ (int64_t)_backdropStyleForCurrentDevice
{
  if (qword_33608 != -1) {
    dispatch_once(&qword_33608, &stru_286F8);
  }
  return qword_33600;
}

@end