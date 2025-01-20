@interface MKVibrantLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation MKVibrantLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKVibrantLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKVibrantLabel", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKVibrantLabel", @"attributedText", "@", 0);
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(MKVibrantLabelAccessibility *)self safeValueForKey:@"attributedText"];
  v4 = __UIAccessibilityCastAsClass();

  if (v4 && [v4 length])
  {
    uint64_t v5 = [v4 string];
  }
  else
  {
    uint64_t v5 = [(MKVibrantLabelAccessibility *)self safeStringForKey:@"text"];
  }
  v6 = (void *)v5;

  return v6;
}

@end