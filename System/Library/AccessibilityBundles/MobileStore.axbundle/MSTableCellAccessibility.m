@interface MSTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation MSTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MSTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF40];
}

@end