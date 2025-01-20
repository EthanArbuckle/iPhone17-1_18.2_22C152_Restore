@interface WKWebViewAccessibility_QSExtras
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityQScanPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)_accessibilityShouldShowSpeakBubble;
- (BOOL)_accessibilityShouldShowSpeakLanguageBubble;
- (BOOL)_accessibilityShouldShowSpeakSpellOut;
- (BOOL)_accessibilityShouldUpdateQuickSpeakContent;
- (BOOL)_accessibilitySystemShouldShowSpeakBubble;
- (id)_accessibilityQuickSpeakContent;
- (id)_axContentView;
@end

@implementation WKWebViewAccessibility_QSExtras

+ (id)safeCategoryTargetClassName
{
  return @"WKWebView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_axContentView
{
  return (id)[(WKWebViewAccessibility_QSExtras *)self safeValueForKey:@"_currentContentView"];
}

- (id)_accessibilityQuickSpeakContent
{
  v2 = [(WKWebViewAccessibility_QSExtras *)self _axContentView];
  v3 = [v2 _accessibilityQuickSpeakContent];

  return v3;
}

- (BOOL)_accessibilitySystemShouldShowSpeakBubble
{
  v2 = [(WKWebViewAccessibility_QSExtras *)self _axContentView];
  char v3 = [v2 _accessibilitySystemShouldShowSpeakBubble];

  return v3;
}

- (BOOL)_accessibilityShouldShowSpeakBubble
{
  v2 = [(WKWebViewAccessibility_QSExtras *)self _axContentView];
  char v3 = [v2 _accessibilityShouldShowSpeakBubble];

  return v3;
}

- (BOOL)_accessibilityShouldShowSpeakSpellOut
{
  v2 = [(WKWebViewAccessibility_QSExtras *)self _axContentView];
  char v3 = [v2 _accessibilityShouldShowSpeakSpellOut];

  return v3;
}

- (BOOL)_accessibilityShouldShowSpeakLanguageBubble
{
  v2 = [(WKWebViewAccessibility_QSExtras *)self _axContentView];
  char v3 = [v2 _accessibilityShouldShowSpeakLanguageBubble];

  return v3;
}

- (BOOL)_accessibilityShouldUpdateQuickSpeakContent
{
  v2 = [(WKWebViewAccessibility_QSExtras *)self _axContentView];
  char v3 = [v2 _accessibilityShouldUpdateQuickSpeakContent];

  return v3;
}

- (BOOL)_accessibilityQScanPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  v7 = [(WKWebViewAccessibility_QSExtras *)self _axContentView];
  NSClassFromString(&cfstr_Wkcontentview.isa);
  if (objc_opt_isKindOfClass()) {
    [v7 _axWaitForSpeakSelectionContentResults];
  }
  v10.receiver = self;
  v10.super_class = (Class)WKWebViewAccessibility_QSExtras;
  BOOL v8 = [(WKWebViewAccessibility_QSExtras *)&v10 _accessibilityQScanPerformAction:a3 withSender:v6];

  return v8;
}

@end