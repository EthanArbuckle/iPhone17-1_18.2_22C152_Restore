@interface GKUILabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation GKUILabelAccessibility

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
  v3 = [(GKUILabelAccessibility *)self accessibilityIdentifier];
  if ([v3 isEqualToString:@"ComposeHeaderFieldValueLabel"])
  {
    v4 = [(GKUILabelAccessibility *)self accessibilityLabel];
    v5 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v6 = [v4 stringByTrimmingCharactersInSet:v5];
    unsigned __int8 v7 = [v6 length] != 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GKUILabelAccessibility;
    unsigned __int8 v7 = [(GKUILabelAccessibility *)&v9 isAccessibilityElement];
  }

  return v7;
}

@end