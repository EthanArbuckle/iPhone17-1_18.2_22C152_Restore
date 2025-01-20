@interface _UIPreviewActionSheetViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityPerformEscape;
@end

@implementation _UIPreviewActionSheetViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIPreviewActionSheetView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityPerformEscape
{
  id v3 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"accessibilityDismissActionSheet" object:0];

  return 1;
}

@end