@interface SBVoiceOverTouchLabelElementAlertItem
- (BOOL)allowMenuButtonDismissal;
- (BOOL)reappearsAfterLock;
- (BOOL)shouldShowInEmergencyCall;
- (BOOL)shouldShowInLockScreen;
- (BOOL)willShowInAwayItems;
- (NSString)initialValue;
- (SBVoiceOverTouchLabelElementAlertItemDelegate)voiceOverAlertItemDelegate;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (void)setInitialValue:(id)a3;
- (void)setVoiceOverAlertItemDelegate:(id)a3;
@end

@implementation SBVoiceOverTouchLabelElementAlertItem

- (BOOL)shouldShowInLockScreen
{
  return 0;
}

- (BOOL)shouldShowInEmergencyCall
{
  return 0;
}

- (BOOL)willShowInAwayItems
{
  return 0;
}

- (BOOL)allowMenuButtonDismissal
{
  return 1;
}

- (BOOL)reappearsAfterLock
{
  return 0;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v5 = [(SBAlertItem *)self alertController];
  [v5 setAccessibilityIdentifier:@"VOLabelElement"];
  v6 = accessibilityLocalizedString(@"element.label.title");
  [v5 setTitle:v6];

  v7 = (void *)MEMORY[0x263F1C3F0];
  v8 = accessibilityLocalizedString(@"VoiceOver.confirmation.Cancel");
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __77__SBVoiceOverTouchLabelElementAlertItem_configure_requirePasscodeForActions___block_invoke;
  v17[3] = &unk_2651544E0;
  v17[4] = self;
  v9 = [v7 actionWithTitle:v8 style:1 handler:v17];
  [v5 addAction:v9];

  v10 = (void *)MEMORY[0x263F1C3F0];
  v11 = accessibilityLocalizedString(@"element.label.save");
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __77__SBVoiceOverTouchLabelElementAlertItem_configure_requirePasscodeForActions___block_invoke_2;
  v15[3] = &unk_265154508;
  v15[4] = self;
  id v16 = v5;
  id v12 = v5;
  v13 = [v10 actionWithTitle:v11 style:0 handler:v15];
  [v12 addAction:v13];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__SBVoiceOverTouchLabelElementAlertItem_configure_requirePasscodeForActions___block_invoke_3;
  v14[3] = &unk_265154530;
  v14[4] = self;
  [v12 addTextFieldWithConfigurationHandler:v14];
}

void __77__SBVoiceOverTouchLabelElementAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v3 voiceOverTouchLabelElementAlertItemDidCancel:*(void *)(a1 + 32)];
  }
}

void __77__SBVoiceOverTouchLabelElementAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));

  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 40) textFields];
    id v5 = [v3 firstObject];

    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v4 voiceOverTouchLabelElementAlertItemDidAccept:*(void *)(a1 + 32) withTextField:v5];
  }
}

void __77__SBVoiceOverTouchLabelElementAlertItem_configure_requirePasscodeForActions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  id v4 = [v3 initialValue];
  [v6 setText:v4];

  [v6 setDelegate:*(void *)(a1 + 32)];
  id v5 = accessibilityLocalizedString(@"element.label.label");
  [v6 setPlaceholder:v5];

  [v6 setClearButtonMode:1];
  [v6 setReturnKeyType:9];
}

- (NSString)initialValue
{
  return self->_initialValue;
}

- (void)setInitialValue:(id)a3
{
}

- (SBVoiceOverTouchLabelElementAlertItemDelegate)voiceOverAlertItemDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_voiceOverAlertItemDelegate);

  return (SBVoiceOverTouchLabelElementAlertItemDelegate *)WeakRetained;
}

- (void)setVoiceOverAlertItemDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_voiceOverAlertItemDelegate);

  objc_storeStrong((id *)&self->_initialValue, 0);
}

@end