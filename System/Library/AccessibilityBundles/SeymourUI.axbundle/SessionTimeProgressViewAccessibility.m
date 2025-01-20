@interface SessionTimeProgressViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDidUpdateTimer:(double)a3 percentage:(float)a4;
@end

@implementation SessionTimeProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.SessionTimeProgressView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SeymourUI.SessionTimeProgressView", @"accessibilityDidUpdateTimer:percentage:", "v", "d", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SeymourUI.SessionTimeProgressView", @"accessibilityShowRemaining", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SessionTimeProgressViewAccessibility;
  return *MEMORY[0x263F1CF68] | [(SessionTimeProgressViewAccessibility *)&v3 accessibilityTraits];
}

- (void)accessibilityDidUpdateTimer:(double)a3 percentage:(float)a4
{
  uint64_t v6 = ((int)a3 / 60);
  uint64_t v7 = ((int)a3 % 60);
  int v8 = [(SessionTimeProgressViewAccessibility *)self safeBoolForKey:@"accessibilityShowRemaining"];
  v9 = NSString;
  if (v8) {
    v10 = @"timer.remaining.format";
  }
  else {
    v10 = @"timer.format";
  }
  v11 = accessibilityLocalizedString(v10);
  objc_msgSend(v9, "stringWithFormat:", v11, v6, v7);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  v12 = NSString;
  v13 = accessibilityLocalizedString(@"percent.complete.format");
  v14 = objc_msgSend(v12, "stringWithFormat:", v13, (int)(float)(a4 * 100.0));

  v15 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v17, v14);
  if (v15)
  {
    v16 = AXLabelForElements();
    [(SessionTimeProgressViewAccessibility *)self setAccessibilityLabel:v16];
  }
}

@end