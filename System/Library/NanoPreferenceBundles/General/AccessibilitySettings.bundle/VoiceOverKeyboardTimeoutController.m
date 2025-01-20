@interface VoiceOverKeyboardTimeoutController
- (double)maximumValueForSpecifier:(id)a3;
- (double)minimumValueForSpecifier:(id)a3;
- (double)stepValueForSpecifier:(id)a3;
- (double)valueForSpecifier:(id)a3;
- (id)actionDetailControllerDelegate;
- (id)specifiers;
- (id)stringValueForSpecifier:(id)a3;
- (void)specifier:(id)a3 setValue:(double)a4;
@end

@implementation VoiceOverKeyboardTimeoutController

- (id)actionDetailControllerDelegate
{
  v2 = [(VoiceOverKeyboardTimeoutController *)self specifier];
  v3 = [v2 userInfo];
  v4 = [v3 objectForKeyedSubscript:@"VoiceOverKeyboardTimeoutControllerDelegateKey"];

  return v4;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF980] array];
    v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    v7 = settingsLocString(@"KEYBOARD_TIMING_TIMEOUT_FOOTER", @"VoiceOverSettings");
    [v6 setProperty:v7 forKey:*MEMORY[0x263F600F8]];

    [v5 addObject:v6];
    v8 = objc_msgSend(MEMORY[0x263F5FC40], "ax_stepperSpecifierWithDelegate:", self);
    [v8 setProperty:&unk_26FB00700 forKey:*MEMORY[0x263F60308]];
    [v5 addObject:v8];
    v9 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (double)valueForSpecifier:(id)a3
{
  uint64_t v3 = [(VoiceOverKeyboardTimeoutController *)self actionDetailControllerDelegate];
  v4 = [v3 keyboardTimeout];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (void)specifier:(id)a3 setValue:(double)a4
{
  id v6 = [(VoiceOverKeyboardTimeoutController *)self actionDetailControllerDelegate];
  double v5 = [NSNumber numberWithDouble:a4];
  [v6 setKeyboardTimeout:v5];
}

- (double)stepValueForSpecifier:(id)a3
{
  return 0.5;
}

- (double)minimumValueForSpecifier:(id)a3
{
  return *MEMORY[0x263F21440];
}

- (double)maximumValueForSpecifier:(id)a3
{
  return *MEMORY[0x263F21438];
}

- (id)stringValueForSpecifier:(id)a3
{
  [(VoiceOverKeyboardTimeoutController *)self valueForSpecifier:a3];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithDouble:");
  v4 = AXFormatNumberWithOptions();

  return v4;
}

@end