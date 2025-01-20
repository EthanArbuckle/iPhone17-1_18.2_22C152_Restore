@interface SBCoverSheetWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityElementsHidden;
- (id)accessibilityIdentifier;
@end

@implementation SBCoverSheetWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBCoverSheetWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityIdentifier
{
  return @"SBCoverSheetWindow";
}

- (BOOL)accessibilityElementsHidden
{
  if (AXSBOnenessOrXCUITestIsCurrentlyRequestingClientDuringContinuitySession()) {
    return 1;
  }
  v3 = [MEMORY[0x263F22968] server];
  char v4 = [v3 isControlCenterVisible];

  return v4;
}

@end