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
    v4 = [v2 localizedStringForKey:v1 value:&stru_8468 table:@"Accessibility"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_5220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t AXFormatInteger()
{
  return _AXFormatInteger();
}

uint64_t AXPerformSafeBlock()
{
  return _AXPerformSafeBlock();
}

uint64_t AXSafeClassFromString()
{
  return _AXSafeClassFromString();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UIAccessibilitySpeakOrQueueIfNeeded()
{
  return _UIAccessibilitySpeakOrQueueIfNeeded();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAccessibilityCastAsClass()
{
  return ___UIAccessibilityCastAsClass();
}

uint64_t __UIAccessibilitySafeClass()
{
  return ___UIAccessibilitySafeClass();
}

void abort(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_msgSend__accessibilityAddPersonSelected(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityAddPersonSelected];
}

id objc_msgSend__accessibilityCenterOfDialView(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityCenterOfDialView];
}

id objc_msgSend__accessibilityCirclePathBasedOnBoundsWidth(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityCirclePathBasedOnBoundsWidth];
}

id objc_msgSend__accessibilityClearChildren(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityClearChildren];
}

id objc_msgSend__accessibilityDialPersonViews(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityDialPersonViews];
}

id objc_msgSend__accessibilityEditingFriendsDialViewAllowed(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityEditingFriendsDialViewAllowed];
}

id objc_msgSend__accessibilityElementsForDialPersonViews(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityElementsForDialPersonViews];
}

id objc_msgSend__accessibilityIsAddPersonSlot(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityIsAddPersonSlot];
}

id objc_msgSend__accessibilityLoadAccessibilityInformation(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityLoadAccessibilityInformation];
}

id objc_msgSend__accessibilityPeopleViewController(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityPeopleViewController];
}

id objc_msgSend__accessibilityShouldEmptySlotsBeIgnored(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityShouldEmptySlotsBeIgnored];
}

id objc_msgSend__accessibilityStyle(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityStyle];
}

id objc_msgSend__accessibilityUpdateCenterPersonViewAXInfo(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityUpdateCenterPersonViewAXInfo];
}

id objc_msgSend__accessibilityUpdateDeleteButtonLabel(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityUpdateDeleteButtonLabel];
}

id objc_msgSend__accessibilityUpdateDialViewElements(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityUpdateDialViewElements];
}

id objc_msgSend__accessibilityViewController(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityViewController];
}

id objc_msgSend_accessibilityActivate(void *a1, const char *a2, ...)
{
  return [a1 accessibilityActivate];
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return [a1 accessibilityLabel];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_isAccessibilityElement(void *a1, const char *a2, ...)
{
  return [a1 isAccessibilityElement];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_validateProtocol_hasRequiredInstanceMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateProtocol:hasRequiredInstanceMethod:");
}