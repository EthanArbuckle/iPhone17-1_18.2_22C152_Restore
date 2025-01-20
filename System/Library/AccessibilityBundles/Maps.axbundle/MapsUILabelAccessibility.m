@interface MapsUILabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation MapsUILabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UILabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v3 = [(MapsUILabelAccessibility *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"calloutViewSubtitle"];

  if (v4)
  {
    v5 = [(MapsUILabelAccessibility *)self accessibilityLabel];
    v6 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    v7 = [v5 stringByTrimmingCharactersInSet:v6];
    uint64_t v8 = [v7 length];

    if (!v8) {
      return 0;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)MapsUILabelAccessibility;
  return [(MapsUILabelAccessibility *)&v10 isAccessibilityElement];
}

@end