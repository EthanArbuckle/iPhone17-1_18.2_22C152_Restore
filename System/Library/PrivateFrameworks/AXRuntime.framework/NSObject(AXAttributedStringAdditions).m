@interface NSObject(AXAttributedStringAdditions)
- (id)_accessibilityAttributedLocalizedString;
- (uint64_t)isAXAttributedString;
- (void)_setAccessibilityAttributedLocalizedString:()AXAttributedStringAdditions;
@end

@implementation NSObject(AXAttributedStringAdditions)

- (uint64_t)isAXAttributedString
{
  return 0;
}

- (void)_setAccessibilityAttributedLocalizedString:()AXAttributedStringAdditions
{
  id v4 = a3;
  if (v4 == a1)
  {
    v5 = AXRuntimeLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[NSObject(AXAttributedStringAdditions) _setAccessibilityAttributedLocalizedString:](v5);
    }

    __assert_rtn("-[NSObject(AXAttributedStringAdditions) _setAccessibilityAttributedLocalizedString:]", "AXAttributedString.m", 820, "false");
  }
  id v6 = v4;
  objc_setAssociatedObject(a1, &AXAttributedLocalizedString, v4, (void *)0x301);
}

- (id)_accessibilityAttributedLocalizedString
{
  return objc_getAssociatedObject(a1, &AXAttributedLocalizedString);
}

- (void)_setAccessibilityAttributedLocalizedString:()AXAttributedStringAdditions .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BA657000, log, OS_LOG_TYPE_ERROR, "Attempting to associate string with itself!", v1, 2u);
}

@end