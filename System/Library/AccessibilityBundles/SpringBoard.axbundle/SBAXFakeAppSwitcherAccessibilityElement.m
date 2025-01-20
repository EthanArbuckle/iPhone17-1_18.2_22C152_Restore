@interface SBAXFakeAppSwitcherAccessibilityElement
- (BOOL)_accessibilityScrollToVisible;
- (id)appLayout;
- (id)deckSwitcherDelegate;
- (void)setAppLayout:(id)a3;
- (void)setDeckSwitcherDelegate:(id)a3;
@end

@implementation SBAXFakeAppSwitcherAccessibilityElement

- (BOOL)_accessibilityScrollToVisible
{
  return 1;
}

void __72__SBAXFakeAppSwitcherAccessibilityElement__accessibilityScrollToVisible__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) deckSwitcherDelegate];
  v2 = [*(id *)(a1 + 32) appLayout];
  [v3 _scrollToAppLayout:v2 animated:1 alignment:2 completion:0];
}

- (id)deckSwitcherDelegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_deckSwitcherDelegate);

  return WeakRetained;
}

- (void)setDeckSwitcherDelegate:(id)a3
{
}

- (id)appLayout
{
  return self->_appLayout;
}

- (void)setAppLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_appLayout, 0);

  objc_destroyWeak(&self->_deckSwitcherDelegate);
}

@end