@interface PUTileControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_axConformsToFullScreenTileControllerDelegate;
@end

@implementation PUTileControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUTileController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axConformsToFullScreenTileControllerDelegate
{
  return 0;
}

@end