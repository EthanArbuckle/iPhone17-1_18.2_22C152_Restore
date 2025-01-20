@interface VMMessageTranscriptViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityActivateTextViewLink:(id)a3;
@end

@implementation VMMessageTranscriptViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VMMessageTranscriptView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VMMessageTranscriptView", @"openFeedbackURL:", "v", "@", 0);
  [v3 validateClass:@"VMMessageTranscriptView" hasInstanceVariable:@"_feedbackTextView" withType:"UITextView"];
  [v3 validateClass:@"VMMessageTranscriptView" hasInstanceVariable:@"_textView" withType:"UITextView"];
}

- (BOOL)_accessibilityActivateTextViewLink:(id)a3
{
  id v4 = a3;
  v5 = [v4 accessibilityContainer];
  v6 = [v5 accessibilityContainer];
  v7 = [(VMMessageTranscriptViewAccessibility *)self safeValueForKey:@"_feedbackTextView"];

  if (v6 == v7)
  {
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __75__VMMessageTranscriptViewAccessibility__accessibilityActivateTextViewLink___block_invoke;
    v20 = &unk_265134E30;
    v21 = self;
    id v22 = v4;
    AXPerformSafeBlock();

    unsigned __int8 v11 = 1;
  }
  else
  {
    v8 = [v4 accessibilityContainer];
    v9 = [v8 accessibilityContainer];
    v10 = [(VMMessageTranscriptViewAccessibility *)self safeValueForKey:@"_textView"];

    if (v9 == v10)
    {
      v12 = [(VMMessageTranscriptViewAccessibility *)self safeUIViewForKey:@"_textView"];
      v13 = (void *)MEMORY[0x263F08D40];
      [v4 accessibilityActivationPoint];
      v14 = objc_msgSend(v13, "valueWithPoint:");
      unsigned __int8 v11 = [v12 _accessibilityShowContextMenuWithTargetPointValue:v14];
    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)VMMessageTranscriptViewAccessibility;
      unsigned __int8 v11 = [(VMMessageTranscriptViewAccessibility *)&v16 _accessibilityActivateTextViewLink:v4];
    }
  }

  return v11;
}

void __75__VMMessageTranscriptViewAccessibility__accessibilityActivateTextViewLink___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) url];
  [v1 openFeedbackURL:v2];
}

@end