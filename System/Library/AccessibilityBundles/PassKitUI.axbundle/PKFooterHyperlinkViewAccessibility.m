@interface PKFooterHyperlinkViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityInternalTextLinks;
@end

@implementation PKFooterHyperlinkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKFooterHyperlinkView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilityInternalTextLinks
{
  v2 = [(PKFooterHyperlinkViewAccessibility *)self safeUIViewForKey:@"_textView"];
  v3 = [v2 _accessibilityInternalTextLinks];

  return v3;
}

@end