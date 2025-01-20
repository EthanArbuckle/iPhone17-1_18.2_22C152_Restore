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
    v4 = [v2 localizedStringForKey:v1 value:&stru_46C0 table:@"Accessibility"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t AXDateStringForFormat()
{
  return _AXDateStringForFormat();
}

uint64_t AXFormatInteger()
{
  return _AXFormatInteger();
}

uint64_t AXIntegerValueFromString()
{
  return _AXIntegerValueFromString();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t UIAXFrameForElements()
{
  return _UIAXFrameForElements();
}

uint64_t __UIAXStringForVariables()
{
  return ___UIAXStringForVariables();
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

id objc_msgSend__accessibilityLoadAccessibilityInformation(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityLoadAccessibilityInformation];
}

id objc_msgSend__accessibilityPointsLabel(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityPointsLabel];
}

id objc_msgSend__axAnnotateGraphElements(void *a1, const char *a2, ...)
{
  return [a1 _axAnnotateGraphElements];
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return [a1 accessibilityLabel];
}

id objc_msgSend_accessibilityValue(void *a1, const char *a2, ...)
{
  return [a1 accessibilityValue];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedLowercaseString(void *a1, const char *a2, ...)
{
  return [a1 localizedLowercaseString];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_validateClass_isKindOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateClass:isKindOfClass:");
}