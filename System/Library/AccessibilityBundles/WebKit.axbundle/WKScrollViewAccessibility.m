@interface WKScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (UIEdgeInsets)_accessibilityVisibleContentInset;
- (unint64_t)_accessibilityAutomationType;
@end

@implementation WKScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WKScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"WKScrollView" isKindOfClass:@"UIScrollView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScrollViewAccessibility", @"_accessibilityStoredVisibleContentInset", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScrollViewAccessibility", @"_accessibilityStoredShouldUseFallbackForVisibleContentInset", "@", 0);
}

- (UIEdgeInsets)_accessibilityVisibleContentInset
{
  id v3 = [(WKScrollViewAccessibility *)self _accessibilityStoredVisibleContentInset];
  v4 = v3;
  if (v3)
  {
    [v3 UIEdgeInsetsValue];
  }
  else
  {
    v9 = [(WKScrollViewAccessibility *)self _accessibilityStoredShouldUseFallbackForVisibleContentInset];

    if (!v9)
    {
      objc_opt_class();
      v18 = __UIAccessibilityCastAsClass();
      [v18 adjustedContentInset];
      double v10 = v19;
      double v11 = v20;
      double v12 = v21;
      double v13 = v22;

      goto LABEL_6;
    }
    v23.receiver = self;
    v23.super_class = (Class)WKScrollViewAccessibility;
    [(WKScrollViewAccessibility *)&v23 _accessibilityVisibleContentInset];
  }
  double v10 = v5;
  double v11 = v6;
  double v12 = v7;
  double v13 = v8;
LABEL_6:

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (unint64_t)_accessibilityAutomationType
{
  return 58;
}

@end