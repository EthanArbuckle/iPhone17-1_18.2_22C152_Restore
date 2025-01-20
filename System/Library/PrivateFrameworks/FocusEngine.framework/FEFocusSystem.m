@interface FEFocusSystem
@end

@implementation FEFocusSystem

void __47___FEFocusSystem__tickHasSeenFocusedItemTimer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hasSeenFocusedItemDidExpire];
}

void __38___FEFocusSystem__requestFocusUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateFocusIfNeeded];
}

uint64_t __55___FEFocusSystem__focusEnvironmentWillBecomeInvisible___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _focusSystemIsValid];
  if (result)
  {
    uint64_t result = _FEFocusEnvironmentIsEligibleForFocusOcclusion(*(void **)(a1 + 40), 0);
    if ((result & 1) == 0)
    {
      v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      return [v3 _focusEnvironmentWillDisappear:v4];
    }
  }
  return result;
}

void __49___FEFocusSystem__focusEnvironmentWillDisappear___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (objc_msgSend(v5, sel_allowsWeakReference)) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  v8 = v7;
  if (v5 && !v7)
  {
    v13 = logger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      int v14 = 138412290;
      id v15 = v5;
      _os_log_fault_impl(&dword_24F3F0000, v13, OS_LOG_TYPE_FAULT, "Focus system attempting to use a deallocating focus environment. Offending object: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else if (v7 && v7 != *(id *)(a1 + 32))
  {
    v9 = [[_FEFocusUpdateRequest alloc] initWithEnvironment:v7];
    [(_FEFocusUpdateRequest *)v9 setAllowsFocusingCurrentItem:1];
    [*(id *)(a1 + 40) _requestFocusUpdate:v9];
    id v10 = *(id *)(*(void *)(a1 + 40) + 8);
    v11 = v10;
    if (v10)
    {
      v12 = [v10 environment];

      if (v12 == v8) {
        *a3 = 1;
      }
    }
  }
}

void __45___FEFocusSystem__focusEnvironmentDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateFocusIfNeeded];
}

void __61___FEFocusSystem__sendWillUpdateFocusNotificationsInContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 _willUpdateFocusInContext:*(void *)(a1 + 32)];
  }
}

uint64_t __60___FEFocusSystem__sendDidUpdateFocusNotificationsInContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyEnvironment:a2 didUpdateFocusInContext:*(void *)(a1 + 40)];
}

uint64_t __71___FEFocusSystem__sendNotificationsForFocusUpdateInContext_usingBlock___block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (*(void *)(result + 32) != a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 40) + 16))();
  }
  *a3 = 1;
  return result;
}

uint64_t __71___FEFocusSystem__sendNotificationsForFocusUpdateInContext_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __105___FEFocusSystem__updateFocusImmediatelyToEnvironment_startDeferringOnLostFocus_suppressLostFocusUpdate___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 40))
  {
    uint64_t result = [*(id *)(result + 32) _effectiveFocusDeferralBehavior];
    if (result) {
      uint64_t result = [*(id *)(v1 + 32) _resetFocusDeferral];
    }
  }
  if (!*(unsigned char *)(v1 + 41))
  {
    v2 = *(void **)(v1 + 32);
    return [v2 requestFocusUpdateToEnvironment:v2];
  }
  return result;
}

uint64_t __57___FEFocusSystem__buildFocusItemAncestorCacheIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __47___FEFocusSystem__reevaluateLockedEnvironments__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateFocusIfNeeded];
}

void __44___FEFocusSystem__updateFocusUpdateThrottle__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateFocusIfNeeded];
}

@end