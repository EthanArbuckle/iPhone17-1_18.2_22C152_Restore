@interface CKBrowserSwitcherFooterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
- (void)adjustMagnificationAtPoint:(CGPoint)a3 minifyImmediately:(BOOL)a4;
@end

@implementation CKBrowserSwitcherFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKBrowserSwitcherFooterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBrowserSwitcherFooterView", @"adjustMagnificationAtPoint:minifyImmediately:", "v", "{CGPoint=dd}", "B", 0);
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"app.store.collection.view.text");
}

- (void)adjustMagnificationAtPoint:(CGPoint)a3 minifyImmediately:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v8.receiver = self;
    v8.super_class = (Class)CKBrowserSwitcherFooterViewAccessibility;
    -[CKBrowserSwitcherFooterViewAccessibility adjustMagnificationAtPoint:minifyImmediately:](&v8, sel_adjustMagnificationAtPoint_minifyImmediately_, v4, x, y);
  }
}

@end