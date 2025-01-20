@interface GKBubbleFlowOverlayViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown;
@end

@implementation GKBubbleFlowOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKBubbleFlowOverlayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown
{
  return 1;
}

@end