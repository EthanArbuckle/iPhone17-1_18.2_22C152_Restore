@interface WFSetAppearanceIntent
- (Class)settingsClientClass;
- (NSNumber)state;
- (void)applyWithSettingsClient:(id)a3 completionHandler:(id)a4;
@end

@implementation WFSetAppearanceIntent

- (void)applyWithSettingsClient:(id)a3 completionHandler:(id)a4
{
}

- (NSNumber)state
{
  uint64_t v2 = [(WFSetAppearanceIntent *)self style];
  v3 = (NSNumber *)MEMORY[0x263EFFA80];
  if (v2 != 2) {
    v3 = 0;
  }
  if (v2 == 1) {
    return (NSNumber *)MEMORY[0x263EFFA88];
  }
  else {
    return v3;
  }
}

- (Class)settingsClientClass
{
  return (Class)objc_opt_class();
}

@end