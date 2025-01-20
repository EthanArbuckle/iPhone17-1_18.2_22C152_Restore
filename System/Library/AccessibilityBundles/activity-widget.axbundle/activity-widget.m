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
    v4 = [v2 localizedStringForKey:v1 value:&stru_4238 table:@"Accessibility"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __UIAccessibilityCastAsClass()
{
  return ___UIAccessibilityCastAsClass();
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

id objc_msgSend__accessibilityLoadAccessibilityInformation(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityLoadAccessibilityInformation];
}

id objc_msgSend__axExerciseHeaderValueView(void *a1, const char *a2, ...)
{
  return [a1 _axExerciseHeaderValueView];
}

id objc_msgSend__axMoveHeaderValueView(void *a1, const char *a2, ...)
{
  return [a1 _axMoveHeaderValueView];
}

id objc_msgSend__axStandHeaderValueView(void *a1, const char *a2, ...)
{
  return [a1 _axStandHeaderValueView];
}

id objc_msgSend__axUpdateViewAccessibilityElements(void *a1, const char *a2, ...)
{
  return [a1 _axUpdateViewAccessibilityElements];
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return [a1 accessibilityLabel];
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return [a1 headerView];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_valueView(void *a1, const char *a2, ...)
{
  return [a1 valueView];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}