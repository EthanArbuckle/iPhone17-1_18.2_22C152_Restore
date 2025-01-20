@interface PUPhotoEditToolControllerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityInTopLevelTabLoop;
- (BOOL)_accessibilityIsTouchContainer;
@end

@implementation PUPhotoEditToolControllerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUPhotoEditToolControllerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsTouchContainer
{
  return 1;
}

- (BOOL)_accessibilityInTopLevelTabLoop
{
  return 1;
}

@end