@interface objc_LockscreenStatus
+ (BOOL)isDeviceUnlocked;
- (_TtC17StoreKitUIService21objc_LockscreenStatus)init;
@end

@implementation objc_LockscreenStatus

+ (BOOL)isDeviceUnlocked
{
  return sub_10002A454(a1, a2) & 1;
}

- (_TtC17StoreKitUIService21objc_LockscreenStatus)init
{
  return (_TtC17StoreKitUIService21objc_LockscreenStatus *)sub_10002A458();
}

@end