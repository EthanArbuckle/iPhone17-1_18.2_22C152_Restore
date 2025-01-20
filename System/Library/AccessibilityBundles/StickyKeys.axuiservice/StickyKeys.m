void sub_3FB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3FDC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeCapsLockIfNeeded];
}

id sub_4A8C(uint64_t a1)
{
  [*(id *)(a1 + 32) removeConstraints:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) addConstraints:*(void *)(a1 + 48)];
  [*(id *)(a1 + 56) setAlpha:1.0];
  v2 = [*(id *)(a1 + 32) hudBackgroundView];
  [v2 setAlpha:1.0];

  v3 = *(void **)(a1 + 32);

  return [v3 layoutIfNeeded];
}

id sub_5218(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    v2 = [*(id *)(a1 + 32) hudBackgroundView];
    [v2 setAlpha:0.0];
  }
  else
  {
    [*(id *)(a1 + 40) setAlpha:0.0];
  }
  [*(id *)(a1 + 32) removeConstraints:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addConstraints:*(void *)(a1 + 56)];
  v3 = *(void **)(a1 + 32);

  return [v3 layoutIfNeeded];
}

void sub_5298(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  v2 = [*(id *)(a1 + 40) allStickyKeyLabels];
  id v3 = [v2 count];

  if (!v3)
  {
    v4 = [*(id *)(a1 + 40) hudBackgroundView];
    [v4 removeFromSuperview];

    v5 = *(void **)(a1 + 40);
    [v5 setHudBackgroundView:0];
  }
}

void sub_540C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) hudBackgroundView];
  [v1 setAlpha:0.0];
}

uint64_t sub_5454(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) hudBackgroundView];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) setHudBackgroundView:0];
  id v3 = [*(id *)(a1 + 32) allStickyKeyLabels];
  [v3 removeAllObjects];

  v4 = [*(id *)(a1 + 32) allStickyKeyHorizontalConstraints];
  [v4 removeAllObjects];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

void sub_5BA8(uint64_t a1)
{
  id v2 = +[AXUIDisplayManager sharedDisplayManager];
  [v2 removeContentViewController:*(void *)(a1 + 32) withUserInteractionEnabled:0 forService:*(void *)(a1 + 40)];
}

void AudioServicesPlaySystemSound(SystemSoundID inSystemSoundID)
{
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

uint64_t _AXAssert()
{
  return __AXAssert();
}

uint64_t _AXLogWithFacility()
{
  return __AXLogWithFacility();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend__handleStickyKeysDisabled(void *a1, const char *a2, ...)
{
  return [a1 _handleStickyKeysDisabled];
}

id objc_msgSend__handleStickyKeysToggledViaShift(void *a1, const char *a2, ...)
{
  return [a1 _handleStickyKeysToggledViaShift];
}

id objc_msgSend__removeCapsLockIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _removeCapsLockIfNeeded];
}

id objc_msgSend__showUIIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _showUIIfNeeded];
}

id objc_msgSend__stickyKeysView(void *a1, const char *a2, ...)
{
  return [a1 _stickyKeysView];
}

id objc_msgSend_allStickyKeyHorizontalConstraints(void *a1, const char *a2, ...)
{
  return [a1 allStickyKeyHorizontalConstraints];
}

id objc_msgSend_allStickyKeyLabels(void *a1, const char *a2, ...)
{
  return [a1 allStickyKeyLabels];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return [a1 constant];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_firstAttribute(void *a1, const char *a2, ...)
{
  return [a1 firstAttribute];
}

id objc_msgSend_hudBackgroundView(void *a1, const char *a2, ...)
{
  return [a1 hudBackgroundView];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_multiplier(void *a1, const char *a2, ...)
{
  return [a1 multiplier];
}

id objc_msgSend_relation(void *a1, const char *a2, ...)
{
  return [a1 relation];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_secondAttribute(void *a1, const char *a2, ...)
{
  return [a1 secondAttribute];
}

id objc_msgSend_secondItem(void *a1, const char *a2, ...)
{
  return [a1 secondItem];
}

id objc_msgSend_sharedDisplayManager(void *a1, const char *a2, ...)
{
  return [a1 sharedDisplayManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_stickyKeysBeepEnabled(void *a1, const char *a2, ...)
{
  return [a1 stickyKeysBeepEnabled];
}

id objc_msgSend_stickyKeysViewController(void *a1, const char *a2, ...)
{
  return [a1 stickyKeysViewController];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_voiceOverKeyboardModifierChoice(void *a1, const char *a2, ...)
{
  return [a1 voiceOverKeyboardModifierChoice];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}