@interface NTKFaceLibraryOverlayViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityElementsHidden;
@end

@implementation NTKFaceLibraryOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKFaceLibraryOverlayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  return AXRequestingClient() == 3;
}

@end