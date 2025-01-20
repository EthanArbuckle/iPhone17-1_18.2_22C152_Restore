@interface LargeStoryCardCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation LargeStoryCardCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ProductPageExtension.LargeStoryCardCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v3.receiver = self;
  v3.super_class = (Class)LargeStoryCardCollectionViewCellAccessibility;
  return [(LargeStoryCardCollectionViewCellAccessibility *)&v3 isAccessibilityElement];
}

@end