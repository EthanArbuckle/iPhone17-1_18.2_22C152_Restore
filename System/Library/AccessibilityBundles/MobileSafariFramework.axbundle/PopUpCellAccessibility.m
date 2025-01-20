@interface PopUpCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation PopUpCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SFBrowsingAssistantPopUpCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F813C0];
}

@end