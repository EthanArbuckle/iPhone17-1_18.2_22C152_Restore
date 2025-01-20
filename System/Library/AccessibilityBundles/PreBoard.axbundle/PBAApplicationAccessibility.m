@interface PBAApplicationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation PBAApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBAApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

- (id)accessibilityLabel
{
  return &stru_26F785E80;
}

@end