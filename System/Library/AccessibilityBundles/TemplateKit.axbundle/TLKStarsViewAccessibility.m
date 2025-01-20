@interface TLKStarsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation TLKStarsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TLKStarsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  uint64_t v2 = [(TLKStarsViewAccessibility *)self safeCGFloatForKey:@"starRating"];

  return (id)MEMORY[0x270F80920](v2);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end