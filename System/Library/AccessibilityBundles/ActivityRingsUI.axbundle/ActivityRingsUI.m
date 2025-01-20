id accessibilityLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t vars8;

  v1 = a1;
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 localizedStringForKey:v1 value:&stru_4548 table:@"Accessibility"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t _userIsWheelchairUserWithVoiceOverOn()
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = ___userIsWheelchairUserWithVoiceOverOn_block_invoke_2;
    v4[3] = &unk_4280;
    v5 = &__block_literal_global_299;
    v6 = &v7;
    if (_userIsWheelchairUserWithVoiceOverOn_onceToken != -1) {
      dispatch_once(&_userIsWheelchairUserWithVoiceOverOn_onceToken, v4);
    }
    if (!*((unsigned char *)v8 + 24))
    {
      v0 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = ___userIsWheelchairUserWithVoiceOverOn_block_invoke_3;
      block[3] = &unk_42A8;
      v3 = &__block_literal_global_299;
      dispatch_async(v0, block);
    }
    _Block_object_dispose(&v7, 8);
  }
  return _userIsWheelchairUserWithVoiceOverOn___isWheelchair;
}

void ___userIsWheelchairUserWithVoiceOverOn_block_invoke(id a1)
{
  id v1 = objc_alloc_init((Class)HKHealthStore);
  uint64_t v4 = 0;
  v2 = [v1 wheelchairUseWithError:&v4];
  v3 = v2;
  if (!v4) {
    _userIsWheelchairUserWithVoiceOverOn___isWheelchair = [v2 wheelchairUse] == (char *)&dword_0 + 2;
  }
}

uint64_t ___userIsWheelchairUserWithVoiceOverOn_block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t ___userIsWheelchairUserWithVoiceOverOn_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t AXFormatFloatWithPercentage()
{
  return _AXFormatFloatWithPercentage();
}

uint64_t UIAXLabelForElements()
{
  return _UIAXLabelForElements();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t __UIAccessibilityCastAsClass()
{
  return ___UIAccessibilityCastAsClass();
}

uint64_t __UIAccessibilityCastAsSafeCategory()
{
  return ___UIAccessibilityCastAsSafeCategory();
}

void abort(void)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_msgSend__accessibilityCirclePathBasedOnBoundsWidth(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityCirclePathBasedOnBoundsWidth];
}

id objc_msgSend__accessibilityIsFKARunningForFocusItem(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityIsFKARunningForFocusItem];
}

id objc_msgSend__accessibilityLocalizedRingDescriptions(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityLocalizedRingDescriptions];
}

id objc_msgSend__accessibilityRingValues(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityRingValues];
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return [a1 accessibilityLabel];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_isAccessibilityUserDefinedElement(void *a1, const char *a2, ...)
{
  return [a1 isAccessibilityUserDefinedElement];
}

id objc_msgSend_opacity(void *a1, const char *a2, ...)
{
  return [a1 opacity];
}

id objc_msgSend_percentage(void *a1, const char *a2, ...)
{
  return [a1 percentage];
}

id objc_msgSend_ringGroupControllers(void *a1, const char *a2, ...)
{
  return [a1 ringGroupControllers];
}

id objc_msgSend_ringGroups(void *a1, const char *a2, ...)
{
  return [a1 ringGroups];
}

id objc_msgSend_rings(void *a1, const char *a2, ...)
{
  return [a1 rings];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_wheelchairUse(void *a1, const char *a2, ...)
{
  return [a1 wheelchairUse];
}

id objc_msgSend_wheelchairUseWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wheelchairUseWithError:");
}