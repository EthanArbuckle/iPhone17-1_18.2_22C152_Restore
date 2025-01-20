@interface _MKUserLocationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation _MKUserLocationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_MKUserLocationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v6.receiver = self;
  v6.super_class = (Class)_MKUserLocationViewAccessibility;
  unint64_t v2 = *MEMORY[0x263F21B48] | [(_MKUserLocationViewAccessibility *)&v6 accessibilityTraits];
  Class v3 = NSClassFromString(&cfstr_Vkmapviewtourg.isa);
  if (v3)
  {
    Class v4 = v3;
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([(objc_class *)v4 shouldSuppressLocationUpdates] & 1) == 0)
    {
      v2 |= *MEMORY[0x263F21C38];
    }
  }
  return v2;
}

@end