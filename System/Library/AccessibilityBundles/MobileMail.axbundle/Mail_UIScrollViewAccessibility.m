@interface Mail_UIScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (UIEdgeInsets)_accessibilityVisibleContentInset;
@end

@implementation Mail_UIScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (UIEdgeInsets)_accessibilityVisibleContentInset
{
  v17.receiver = self;
  v17.super_class = (Class)Mail_UIScrollViewAccessibility;
  [(Mail_UIScrollViewAccessibility *)&v17 _accessibilityVisibleContentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(Mail_UIScrollViewAccessibility *)self accessibilityIdentification];
  int v12 = [v11 isEqualToString:@"kAXMailContentViewWebViewIdentifier"];

  double v13 = 0.0;
  if (!v12) {
    double v13 = v4;
  }
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

@end