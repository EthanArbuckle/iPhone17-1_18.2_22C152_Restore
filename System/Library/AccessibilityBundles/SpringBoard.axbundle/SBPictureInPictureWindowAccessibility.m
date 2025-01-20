@interface SBPictureInPictureWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsIsolatedWindow;
- (BOOL)_accessibilityUseWindowBoundsForOutOfBoundsChecking;
- (CGRect)accessibilityFrame;
- (id)_accessibilityElementCommunityIdentifier;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
@end

@implementation SBPictureInPictureWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBPictureInPictureWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_accessibilityIsIsolatedWindow
{
  return 1;
}

- (id)_accessibilityElementCommunityIdentifier
{
  return @"PIPWindow";
}

- (BOOL)_accessibilityUseWindowBoundsForOutOfBoundsChecking
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  Class v3 = NSClassFromString(&cfstr_Pglayerhostvie.isa);
  if (v3
    && ([(SBPictureInPictureWindowAccessibility *)self _accessibilityDescendantOfType:v3], (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    [v4 accessibilityFrame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)SBPictureInPictureWindowAccessibility;
    [(SBPictureInPictureWindowAccessibility *)&v22 accessibilityFrame];
    double v7 = v14;
    double v9 = v15;
    double v11 = v16;
    double v13 = v17;
  }
  double v18 = v7;
  double v19 = v9;
  double v20 = v11;
  double v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"pip.element.community.name");
}

- (id)accessibilityIdentifier
{
  return @"PIP-SBInteractionPassThroughView";
}

@end