@interface WFSetNightShiftIntent
- (Class)settingsClientClass;
- (void)applyWithSettingsClient:(id)a3 completionHandler:(id)a4;
@end

@implementation WFSetNightShiftIntent

- (void)applyWithSettingsClient:(id)a3 completionHandler:(id)a4
{
}

- (Class)settingsClientClass
{
  return (Class)objc_opt_class();
}

@end