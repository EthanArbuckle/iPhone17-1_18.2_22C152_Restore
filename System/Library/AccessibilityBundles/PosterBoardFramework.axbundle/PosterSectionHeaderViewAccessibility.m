@interface PosterSectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityElements;
@end

@implementation PosterSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PosterBoard.PosterSectionHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityElements
{
  return (id)MEMORY[0x263EFFA68];
}

@end