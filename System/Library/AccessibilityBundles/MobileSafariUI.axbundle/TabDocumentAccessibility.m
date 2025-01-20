@interface TabDocumentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_webView:(id)a3 takeFocus:(int64_t)a4;
- (void)setActive:(BOOL)a3;
@end

@implementation TabDocumentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TabDocument";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabDocument", @"setActive:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabDocument", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabDocument", @"isActive", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabDocument", @"_webView:takeFocus:", "v", "@", "q", 0);
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(TabDocumentAccessibility *)self safeBoolForKey:@"isActive"];
  v6.receiver = self;
  v6.super_class = (Class)TabDocumentAccessibility;
  [(TabDocumentAccessibility *)&v6 setActive:v3];
  if (v3 && (v5 & 1) == 0) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  }
}

- (void)_webView:(id)a3 takeFocus:(int64_t)a4
{
  id v6 = a3;
  if (([v6 _accessibilityIsFKARunningForFocusItem] & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)TabDocumentAccessibility;
    [(TabDocumentAccessibility *)&v7 _webView:v6 takeFocus:a4];
  }
}

@end