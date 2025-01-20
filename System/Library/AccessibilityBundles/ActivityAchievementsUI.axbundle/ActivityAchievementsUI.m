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
    v4 = [v2 localizedStringForKey:v1 value:&stru_4220 table:@"Accessibility"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t AXCFormattedString()
{
  return _AXCFormattedString();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return ___UIAccessibilityCastAsClass();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_isAccessibilityUserDefinedElement(void *a1, const char *a2, ...)
{
  return [a1 isAccessibilityUserDefinedElement];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedAttributedTitleString(void *a1, const char *a2, ...)
{
  return [a1 localizedAttributedTitleString];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_validateClass_hasInstanceVariable_withType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateClass:hasInstanceVariable:withType:");
}