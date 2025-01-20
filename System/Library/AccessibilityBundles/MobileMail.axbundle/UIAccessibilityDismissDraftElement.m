@interface UIAccessibilityDismissDraftElement
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityPerformEscape;
- (id)mailApplicationScene;
- (void)_accessibilityWithdrawActiveItem;
- (void)setMailApplicationScene:(id)a3;
@end

@implementation UIAccessibilityDismissDraftElement

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

- (void)_accessibilityWithdrawActiveItem
{
  v5 = [(UIAccessibilityDismissDraftElement *)self mailApplicationScene];
  id v3 = v5;
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  v4 = [(UIAccessibilityDismissDraftElement *)self accessibilityContainer];
  [v4 _accessibilitySetAdditionalElements:0];
}

uint64_t __70__UIAccessibilityDismissDraftElement__accessibilityWithdrawActiveItem__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _minimizeKeyCommandPressed:0];
}

- (id)mailApplicationScene
{
  id WeakRetained = objc_loadWeakRetained(&self->_mailApplicationScene);

  return WeakRetained;
}

- (void)setMailApplicationScene:(id)a3
{
}

- (void).cxx_destruct
{
}

@end