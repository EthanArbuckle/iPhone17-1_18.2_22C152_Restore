@interface HUStringInLabelTapGestureRecognizerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)shouldReceiveEvent:(id)a3;
@end

@implementation HUStringInLabelTapGestureRecognizerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUStringInLabelTapGestureRecognizer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HUStringInLabelTapGestureRecognizer" isKindOfClass:@"UITapGestureRecognizer"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUStringInLabelTapGestureRecognizer", @"shouldReceiveEvent:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUStringInLabelTapGestureRecognizer", @"_didTapAttributedTextInLabel: targetRange: event:", "B", "@", "{_NSRange=QQ}", "@", 0);
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HUStringInLabelTapGestureRecognizerAccessibility;
  [(HUStringInLabelTapGestureRecognizerAccessibility *)&v19 shouldReceiveEvent:v4];
  LOBYTE(v15) = 0;
  objc_opt_class();
  v5 = [(HUStringInLabelTapGestureRecognizerAccessibility *)self safeValueForKey:@"view"];
  v6 = __UIAccessibilityCastAsClass();

  if (v6)
  {
    v7 = [v6 attributedText];
    if (v7)
    {
      v8 = [(HUStringInLabelTapGestureRecognizerAccessibility *)self safeValueForKey:@"view"];
      v9 = [v8 accessibilityLabel];

      if (v9)
      {
        v10 = [v7 string];
        [v10 rangeOfString:v9 options:4];

        uint64_t v15 = 0;
        v16 = &v15;
        uint64_t v17 = 0x2020000000;
        char v18 = 0;
        id v13 = v6;
        id v14 = v4;
        AXPerformSafeBlock();
        BOOL v11 = *((unsigned char *)v16 + 24) != 0;

        _Block_object_dispose(&v15, 8);
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      v9 = AXLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[HUStringInLabelTapGestureRecognizerAccessibility shouldReceiveEvent:](v9);
      }
    }
    BOOL v11 = 0;
    goto LABEL_11;
  }
  v7 = AXLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[HUStringInLabelTapGestureRecognizerAccessibility shouldReceiveEvent:](v7);
  }
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

uint64_t __71__HUStringInLabelTapGestureRecognizerAccessibility_shouldReceiveEvent___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_didTapAttributedTextInLabel:targetRange:event:", *(void *)(a1 + 40), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)shouldReceiveEvent:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2421C7000, log, OS_LOG_TYPE_ERROR, "This class currently only supports UILabel", v1, 2u);
}

- (void)shouldReceiveEvent:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2421C7000, log, OS_LOG_TYPE_ERROR, "This class currently only supports search in label.attributedText, feel free to add label.text support too!", v1, 2u);
}

@end