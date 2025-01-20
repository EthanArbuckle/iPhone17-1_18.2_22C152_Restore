@interface VoiceOverDelayUntilSpeakController
- (double)maximumValueForSpecifier:(id)a3;
- (double)minimumValueForSpecifier:(id)a3;
- (double)stepValueForSpecifier:(id)a3;
- (double)valueForSpecifier:(id)a3;
- (id)specifiers;
- (id)stringValueForSpecifier:(id)a3;
- (void)specifier:(id)a3 setValue:(double)a4;
@end

@implementation VoiceOverDelayUntilSpeakController

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF980] array];
    v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    v7 = settingsLocString(@"DELAY_TO_SPEAK_FOOTER", @"VoiceOverSettings");
    [v6 setProperty:v7 forKey:*MEMORY[0x263F600F8]];

    [v5 addObject:v6];
    v8 = objc_msgSend(MEMORY[0x263F5FC40], "ax_stepperSpecifierWithDelegate:", self);
    [v5 addObject:v8];
    v9 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (double)valueForSpecifier:(id)a3
{
  uint64_t v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  [v3 doubleForKey:*MEMORY[0x263F22AF0]];
  double v5 = v4;

  double result = 0.0;
  if (v5 >= 0.0) {
    return v5;
  }
  return result;
}

- (void)specifier:(id)a3 setValue:(double)a4
{
  objc_msgSend(NSNumber, "numberWithDouble:", a3, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = *MEMORY[0x263F22AF0];
  v6 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  [(AccessibilityBridgeBaseController *)self setGizmoPref:v7 forKey:v5 domainAccessor:v6];
}

- (double)stepValueForSpecifier:(id)a3
{
  return 0.05;
}

- (double)minimumValueForSpecifier:(id)a3
{
  return *MEMORY[0x263F21450];
}

- (double)maximumValueForSpecifier:(id)a3
{
  return *MEMORY[0x263F21448];
}

- (id)stringValueForSpecifier:(id)a3
{
  [(VoiceOverDelayUntilSpeakController *)self valueForSpecifier:a3];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithDouble:");
  double v4 = AXFormatNumberWithOptions();

  return v4;
}

@end