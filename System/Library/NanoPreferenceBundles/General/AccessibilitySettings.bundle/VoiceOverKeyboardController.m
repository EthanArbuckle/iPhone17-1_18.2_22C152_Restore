@interface VoiceOverKeyboardController
- (id)keyboardInteractionTime;
- (id)keyboardTimeout;
- (id)modifierKey;
- (id)phoneticKey;
- (id)selectedModifier;
- (id)selectedPhoneticFeedback;
- (id)selectedTypingFeedbackWithSoftware:(BOOL)a3;
- (id)specifiers;
- (void)setKeyboardTimeout:(id)a3;
- (void)setModifier:(id)a3;
- (void)setPhoneticFeedback:(id)a3;
- (void)setTypingFeedback:(id)a3 isSoftware:(BOOL)a4;
@end

@implementation VoiceOverKeyboardController

- (id)specifiers
{
  v32[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF980] array];
    v6 = (void *)MEMORY[0x263F5FC40];
    v7 = settingsLocString(@"PHONETICS_TITLE", @"VoiceOverSettings");
    v8 = [v6 preferenceSpecifierNamed:v7 target:self set:0 get:sel_phoneticKey detail:objc_opt_class() cell:2 edit:0];

    v31 = @"VoiceOverKeyboardPhoneticFeedbackDelegateKey";
    v32[0] = self;
    v9 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    [v8 setUserInfo:v9];

    [v5 addObject:v8];
    v10 = (void *)MEMORY[0x263F5FC40];
    v11 = settingsLocString(@"TYPING_FEEDBACK", @"VoiceOverSettings");
    v12 = [v10 preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    v29 = @"VoiceOverKeyboardTypingFeedbackDelegateKey";
    v30 = self;
    v13 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    [v12 setUserInfo:v13];

    [v5 addObject:v12];
    v14 = (void *)MEMORY[0x263F5FC40];
    v15 = settingsLocString(@"KEYBOARD_MODIFIER_KEYS", @"VoiceOverSettings");
    v16 = [v14 preferenceSpecifierNamed:v15 target:self set:0 get:sel_modifierKey detail:objc_opt_class() cell:2 edit:0];

    v27 = @"VoiceOverKeyboardModifierKeyDelegateKey";
    v28 = self;
    v17 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    [v16 setUserInfo:v17];

    [v5 addObject:v16];
    v18 = (void *)MEMORY[0x263F5FC40];
    v19 = settingsLocString(@"KEYBOARD_TIMING_TIMEOUT", @"VoiceOverSettings");
    v20 = [v18 preferenceSpecifierNamed:v19 target:self set:0 get:sel_keyboardInteractionTime detail:objc_opt_class() cell:2 edit:0];

    v25 = @"VoiceOverKeyboardTimeoutControllerDelegateKey";
    v26 = self;
    v21 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    [v20 setUserInfo:v21];

    [v5 addObject:v20];
    v22 = (objc_class *)[v5 copy];
    v23 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v22;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (id)phoneticKey
{
  v2 = [(VoiceOverKeyboardController *)self selectedPhoneticFeedback];
  uint64_t v3 = +[VoiceOverKeyboardPhoneticFeedbackController phoneticFeedbackShortStringDescription:](VoiceOverKeyboardPhoneticFeedbackController, "phoneticFeedbackShortStringDescription:", [v2 integerValue]);

  return v3;
}

- (id)selectedPhoneticFeedback
{
  uint64_t v3 = *MEMORY[0x263F22B18];
  v4 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  uint64_t v5 = [(AccessibilityBridgeBaseController *)self gizmoValueForKey:v3 domainAccessor:v4];

  if (v5) {
    v6 = (void *)v5;
  }
  else {
    v6 = &unk_26FB00580;
  }

  return v6;
}

- (void)setPhoneticFeedback:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F22B18];
  id v5 = a3;
  id v6 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  [(AccessibilityBridgeBaseController *)self setGizmoPref:v5 forKey:v4 domainAccessor:v6];
}

- (id)selectedTypingFeedbackWithSoftware:(BOOL)a3
{
  uint64_t v4 = (id *)MEMORY[0x263F22B30];
  if (!a3) {
    uint64_t v4 = (id *)MEMORY[0x263F22B00];
  }
  id v5 = *v4;
  id v6 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  uint64_t v7 = [(AccessibilityBridgeBaseController *)self gizmoValueForKey:v5 domainAccessor:v6];

  if (v7) {
    v8 = (void *)v7;
  }
  else {
    v8 = &unk_26FB00598;
  }

  return v8;
}

- (void)setTypingFeedback:(id)a3 isSoftware:(BOOL)a4
{
  id v6 = (id *)MEMORY[0x263F22B30];
  if (!a4) {
    id v6 = (id *)MEMORY[0x263F22B00];
  }
  id v7 = *v6;
  id v8 = a3;
  id v9 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  [(AccessibilityBridgeBaseController *)self setGizmoPref:v8 forKey:v7 domainAccessor:v9];
}

- (id)modifierKey
{
  v2 = [(VoiceOverKeyboardController *)self selectedModifier];
  uint64_t v3 = +[VoiceOverKeyboardModifierKeyController modifierShortStringDescription:](VoiceOverKeyboardModifierKeyController, "modifierShortStringDescription:", [v2 integerValue]);

  return v3;
}

- (id)selectedModifier
{
  uint64_t v3 = *MEMORY[0x263F22B10];
  uint64_t v4 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  uint64_t v5 = [(AccessibilityBridgeBaseController *)self gizmoValueForKey:v3 domainAccessor:v4];

  if (v5) {
    id v6 = (void *)v5;
  }
  else {
    id v6 = &unk_26FB00580;
  }

  return v6;
}

- (void)setModifier:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F22B10];
  id v5 = a3;
  id v6 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  [(AccessibilityBridgeBaseController *)self setGizmoPref:v5 forKey:v4 domainAccessor:v6];
}

- (id)keyboardInteractionTime
{
  v2 = [(VoiceOverKeyboardController *)self keyboardTimeout];
  [v2 doubleValue];
  uint64_t v3 = AXLocalizedTimeSummary();

  return v3;
}

- (id)keyboardTimeout
{
  uint64_t v3 = *MEMORY[0x263F22B08];
  uint64_t v4 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  id v5 = [(AccessibilityBridgeBaseController *)self gizmoValueForKey:v3 domainAccessor:v4];

  if (!v5)
  {
    id v5 = [NSNumber numberWithDouble:*MEMORY[0x263F21430]];
  }

  return v5;
}

- (void)setKeyboardTimeout:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F22B08];
  id v5 = a3;
  id v6 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  [(AccessibilityBridgeBaseController *)self setGizmoPref:v5 forKey:v4 domainAccessor:v6];
}

@end