@interface SBAppThumbnailViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityServesAsFirstElement;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (void)_showQuitButton:(BOOL)a3;
@end

@implementation SBAppThumbnailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBAppThumbnailView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityServesAsFirstElement
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(SBAppThumbnailViewAccessibility *)self safeValueForKey:@"_label"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityHint
{
  v2 = [(SBAppThumbnailViewAccessibility *)self safeValueForKey:@"isShowingQuitButton"];
  int v3 = [v2 BOOLValue];

  if (v3) {
    v4 = @"phone.favorite.icon.quit.hint";
  }
  else {
    v4 = @"phone.favorite.icon.launch.hint";
  }
  v5 = accessibilityLocalizedString(v4);

  return v5;
}

- (CGPoint)accessibilityActivationPoint
{
  int v3 = [(SBAppThumbnailViewAccessibility *)self safeValueForKey:@"isShowingQuitButton"];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    v5 = [(SBAppThumbnailViewAccessibility *)self safeValueForKey:@"_quitButton"];
    [v5 accessibilityActivationPoint];
    double v7 = v6;
    double v9 = v8;

    double v10 = v7;
    double v11 = v9;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBAppThumbnailViewAccessibility;
    [(SBAppThumbnailViewAccessibility *)&v12 accessibilityActivationPoint];
  }
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)_showQuitButton:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SBAppThumbnailViewAccessibility *)self safeValueForKey:@"isShowingQuitButton"];
  char v6 = [v5 BOOLValue];

  v12.receiver = self;
  v12.super_class = (Class)SBAppThumbnailViewAccessibility;
  [(SBAppThumbnailViewAccessibility *)&v12 _showQuitButton:v3];
  if (v3 && (v6 & 1) == 0)
  {
    double v7 = [(SBAppThumbnailViewAccessibility *)self safeValueForKey:@"_quitButton"];
    [v7 setIsAccessibilityElement:0];

    double v8 = NSString;
    double v9 = accessibilityLocalizedString(@"started.quit.app.mode");
    double v10 = [(SBAppThumbnailViewAccessibility *)self accessibilityLabel];
    double v11 = objc_msgSend(v8, "stringWithFormat:", v9, v10);

    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v11);
  }
}

@end