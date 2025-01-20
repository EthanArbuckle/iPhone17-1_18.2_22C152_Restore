@interface CSSRFUserSettingMonitor
+ (id)sharedInstance;
- (BOOL)isSiriRestrictedOnLockScreen;
- (CSSRFUserSettingMonitor)init;
@end

@implementation CSSRFUserSettingMonitor

- (BOOL)isSiriRestrictedOnLockScreen
{
  return 0;
}

- (CSSRFUserSettingMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSSRFUserSettingMonitor;

  return 0;
}

+ (id)sharedInstance
{
  return 0;
}

@end