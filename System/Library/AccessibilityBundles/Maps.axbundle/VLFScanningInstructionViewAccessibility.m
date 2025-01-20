@interface VLFScanningInstructionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)updateForCurrentState;
@end

@implementation VLFScanningInstructionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VLFScanningInstructionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)updateForCurrentState
{
  v2.receiver = self;
  v2.super_class = (Class)VLFScanningInstructionViewAccessibility;
  [(VLFScanningInstructionViewAccessibility *)&v2 updateForCurrentState];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end