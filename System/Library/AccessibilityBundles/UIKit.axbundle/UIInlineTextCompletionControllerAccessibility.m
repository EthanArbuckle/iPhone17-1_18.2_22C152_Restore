@interface UIInlineTextCompletionControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)acceptTextCompletionWithInteraction:(int64_t)a3 wordTerminator:(id)a4 outputHandledByCaller:(BOOL)a5;
@end

@implementation UIInlineTextCompletionControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIInlineTextCompletionController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIInlineTextCompletionController", @"acceptTextCompletionWithInteraction:wordTerminator:outputHandledByCaller:", "q", "@", "B", 0);
  objc_storeStrong(v4, obj);
}

- (id)acceptTextCompletionWithInteraction:(int64_t)a3 wordTerminator:(id)a4 outputHandledByCaller:(BOOL)a5
{
  v19 = self;
  SEL v18 = a2;
  int64_t v17 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  BOOL v15 = a5;
  v13.receiver = v19;
  v13.super_class = (Class)UIInlineTextCompletionControllerAccessibility;
  id v14 = [(UIInlineTextCompletionControllerAccessibility *)&v13 acceptTextCompletionWithInteraction:v17 wordTerminator:location outputHandledByCaller:a5];
  id v8 = (id)[MEMORY[0x263F22938] sharedInstance];
  char v9 = [v8 voiceOverInlineTextCompletionInsertionFeedback];

  char v11 = 0;
  BOOL v10 = 0;
  if ((v9 & 4) != 0)
  {
    id v12 = (id)[v14 candidate];
    char v11 = 1;
    BOOL v10 = [v12 length] != 0;
  }
  if (v11) {

  }
  if (v10) {
    UIAccessibilityPostNotification(*MEMORY[0x263F81200], 0);
  }
  id v6 = v14;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&location, 0);

  return v6;
}

@end