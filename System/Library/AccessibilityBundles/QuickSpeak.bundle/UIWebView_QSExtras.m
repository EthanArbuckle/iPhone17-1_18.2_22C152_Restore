@interface UIWebView_QSExtras
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilitySpeakSelectionTextInputResponder;
- (void)_accessibilityPauseSpeaking:(id)a3;
- (void)_accessibilitySpeak:(id)a3;
@end

@implementation UIWebView_QSExtras

+ (id)safeCategoryTargetClassName
{
  return @"UIWebView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilitySpeak:(id)a3
{
  id v6 = a3;
  v4 = [(UIWebView_QSExtras *)self safeValueForKey:@"_internal"];
  v5 = [v4 safeValueForKey:@"browserView"];

  if (objc_opt_respondsToSelector()) {
    [v5 _accessibilitySpeak:v6];
  }
}

- (id)_accessibilitySpeakSelectionTextInputResponder
{
  v2 = [(UIWebView_QSExtras *)self safeValueForKey:@"_internal"];
  v3 = [v2 safeValueForKey:@"browserView"];

  return v3;
}

- (void)_accessibilityPauseSpeaking:(id)a3
{
  id v6 = a3;
  v4 = [(UIWebView_QSExtras *)self safeValueForKey:@"_internal"];
  v5 = [v4 safeValueForKey:@"browserView"];

  if (objc_opt_respondsToSelector()) {
    [v5 _accessibilityPauseSpeaking:v6];
  }
}

@end