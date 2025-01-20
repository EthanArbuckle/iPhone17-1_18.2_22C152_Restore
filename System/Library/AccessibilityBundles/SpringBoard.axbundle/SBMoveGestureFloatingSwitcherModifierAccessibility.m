@interface SBMoveGestureFloatingSwitcherModifierAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_updateForGestureDidBeginWithEvent:(id)a3;
- (id)_updateForGestureDidChangeWithEvent:(id)a3;
- (id)_updateForGestureDidEndWithEvent:(id)a3;
- (int64_t)_axFloatingConfigurationForGestureEvent:(id)a3 withZeroVelocity:(BOOL)a4;
- (int64_t)_axGetCurrentFloatingConfiguration;
- (int64_t)_axGetFinishedFloatingConfiguration;
- (int64_t)_axInitialFloatingConfiguration;
- (void)_axSetCurrentFloatingConfiguration:(int64_t)a3;
- (void)_axSetFinishedFloatingConfiguration:(int64_t)a3;
@end

@implementation SBMoveGestureFloatingSwitcherModifierAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBMoveGestureFloatingSwitcherModifier";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_axGetCurrentFloatingConfiguration
{
  return (int)__UIAccessibilityGetAssociatedInt();
}

- (void)_axSetCurrentFloatingConfiguration:(int64_t)a3
{
}

- (int64_t)_axGetFinishedFloatingConfiguration
{
  return (int)__UIAccessibilityGetAssociatedInt();
}

- (void)_axSetFinishedFloatingConfiguration:(int64_t)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBMoveGestureFloatingSwitcherModifier" isKindOfClass:@"SBSwitcherModifier"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMoveGestureFloatingSwitcherModifier", @"initialFloatingConfiguration", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMoveGestureFloatingSwitcherModifier", @"_updateForGestureDidBeginWithEvent:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMoveGestureFloatingSwitcherModifier", @"_updateForGestureDidChangeWithEvent:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMoveGestureFloatingSwitcherModifier", @"_updateForGestureDidEndWithEvent:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMoveGestureFloatingSwitcherModifier", @"containerViewBounds", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  [v3 validateClass:@"SBSwitcherModifier"];
  [v3 validateClass:@"SBSwitcherModifier" conformsToProtocol:@"SBSwitcherContextProviding"];
  [v3 validateProtocol:@"SBSwitcherContextProviding" hasRequiredInstanceMethod:@"switcherViewBounds"];
  [v3 validateProtocol:@"SBSwitcherContextProviding" hasRequiredInstanceMethod:@"medusaSettings"];
  [v3 validateClass:@"SBGestureSwitcherModifierEvent"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBGestureSwitcherModifierEvent", @"translationInContainerView", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBGestureSwitcherModifierEvent", @"velocityInContainerView", "{CGPoint=dd}", 0);
  [v3 validateClass:@"SBMedusaSettings"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMedusaSettings", @"movePanGestureNegativeVelocityThreshold", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMedusaSettings", @"movePanGesturePositiveVelocityThreshold", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMedusaSettings", @"movePanGestureThresholdPercentage", "d", 0);
}

- (id)_updateForGestureDidBeginWithEvent:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBMoveGestureFloatingSwitcherModifierAccessibility;
  v4 = [(SBMoveGestureFloatingSwitcherModifierAccessibility *)&v6 _updateForGestureDidBeginWithEvent:a3];
  [(SBMoveGestureFloatingSwitcherModifierAccessibility *)self _axSetCurrentFloatingConfiguration:[(SBMoveGestureFloatingSwitcherModifierAccessibility *)self _axInitialFloatingConfiguration]];

  return v4;
}

- (id)_updateForGestureDidChangeWithEvent:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SBMoveGestureFloatingSwitcherModifierAccessibility;
  id v4 = a3;
  v5 = [(SBMoveGestureFloatingSwitcherModifierAccessibility *)&v14 _updateForGestureDidChangeWithEvent:v4];
  int64_t v6 = [(SBMoveGestureFloatingSwitcherModifierAccessibility *)self _axGetCurrentFloatingConfiguration];
  int64_t v7 = [(SBMoveGestureFloatingSwitcherModifierAccessibility *)self _axFloatingConfigurationForGestureEvent:v4 withZeroVelocity:1];

  if (v6 != v7 && (unint64_t)(v7 - 1) <= 1)
  {
    [(SBMoveGestureFloatingSwitcherModifierAccessibility *)self _axSetCurrentFloatingConfiguration:v7];
    int v8 = [(SBMoveGestureFloatingSwitcherModifierAccessibility *)self _accessibilityIsRTL];
    if (v7 == 2)
    {
      v9 = @"lift.move.app.right";
      v10 = @"lift.move.app.left";
    }
    else
    {
      if (v7 != 1)
      {
        v12 = 0;
LABEL_12:
        UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v12);

        goto LABEL_13;
      }
      v9 = @"lift.move.app.left";
      v10 = @"lift.move.app.right";
    }
    if (v8) {
      v11 = v10;
    }
    else {
      v11 = v9;
    }
    v12 = accessibilityLocalizedString(v11);
    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (id)_updateForGestureDidEndWithEvent:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBMoveGestureFloatingSwitcherModifierAccessibility;
  id v4 = a3;
  v5 = [(SBMoveGestureFloatingSwitcherModifierAccessibility *)&v8 _updateForGestureDidEndWithEvent:v4];
  int64_t v6 = -[SBMoveGestureFloatingSwitcherModifierAccessibility _axFloatingConfigurationForGestureEvent:withZeroVelocity:](self, "_axFloatingConfigurationForGestureEvent:withZeroVelocity:", v4, 0, v8.receiver, v8.super_class);

  [(SBMoveGestureFloatingSwitcherModifierAccessibility *)self _axSetFinishedFloatingConfiguration:v6];

  return v5;
}

- (int64_t)_axInitialFloatingConfiguration
{
  return [(SBMoveGestureFloatingSwitcherModifierAccessibility *)self safeIntegerForKey:@"initialFloatingConfiguration"];
}

- (int64_t)_axFloatingConfigurationForGestureEvent:(id)a3 withZeroVelocity:(BOOL)a4
{
  id v6 = a3;
  int64_t v7 = [(SBMoveGestureFloatingSwitcherModifierAccessibility *)self _axInitialFloatingConfiguration];
  [(SBMoveGestureFloatingSwitcherModifierAccessibility *)self safeCGRectForKey:@"switcherViewBounds"];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(SBMoveGestureFloatingSwitcherModifierAccessibility *)self safeCGRectForKey:@"containerViewBounds"];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  [v6 safeCGPointForKey:@"translationInContainerView"];
  double v60 = v24;
  uint64_t v25 = 0;
  if (!a4) {
    objc_msgSend(v6, "safeCGPointForKey:", @"velocityInContainerView", 0.0);
  }
  uint64_t v58 = v25;
  v61.origin.x = v17;
  v61.origin.y = v19;
  v61.size.width = v21;
  v61.size.height = v23;
  double Width = CGRectGetWidth(v61);
  id v27 = [(SBMoveGestureFloatingSwitcherModifierAccessibility *)self safeValueForKey:@"medusaSettings"];
  v62.origin.x = v9;
  v62.origin.y = v11;
  v62.size.width = v13;
  v62.size.height = v15;
  double MinX = CGRectGetMinX(v62);
  v63.origin.x = v9;
  v63.origin.y = v11;
  v63.size.width = v13;
  v63.size.height = v15;
  double MaxX = CGRectGetMaxX(v63);
  double v30 = Width * 0.5;
  v31 = (id *)MEMORY[0x263F1D020];
  double v32 = Width * 0.5 + MinX + 24.0;
  if ([(id)*MEMORY[0x263F1D020] userInterfaceLayoutDirection] == 1) {
    double v33 = MaxX + -24.0 - v30;
  }
  else {
    double v33 = v30 + MinX + 24.0;
  }
  if (objc_msgSend(*v31, "userInterfaceLayoutDirection", v58) != 1) {
    double v32 = MaxX + -24.0 - v30;
  }
  double v34 = MinX + -24.0 - v30;
  double v35 = v30 + MaxX + 24.0;
  if ([*v31 userInterfaceLayoutDirection] == 1) {
    double v36 = v35;
  }
  else {
    double v36 = MinX + -24.0 - v30;
  }
  if ([*v31 userInterfaceLayoutDirection] == 1) {
    double v35 = v34;
  }
  uint64_t v37 = [*v31 userInterfaceLayoutDirection];
  BOOL v38 = v32 >= v60;
  if (v37 == 1) {
    BOOL v38 = v32 <= v60;
  }
  BOOL v39 = v33 <= v60;
  if (v37 == 1) {
    BOOL v39 = v33 >= v60;
  }
  if ((v7 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
    int v40 = v39;
  }
  else {
    int v40 = v38;
  }
  switch(v7)
  {
    case 0:
    case 4:
      BOOL v41 = v40 == 0;
      if (v40) {
        double v36 = v33;
      }
      else {
        double v36 = v32;
      }
      if (v40) {
        double v33 = v32;
      }
      else {
        double v33 = v35;
      }
      int v40 = 1;
      if (v41) {
        uint64_t v42 = 2;
      }
      else {
        uint64_t v42 = 1;
      }
      goto LABEL_47;
    case 1:
      if (v40)
      {
        double v36 = v33;
        double v33 = v32;
        uint64_t v42 = 1;
      }
      else
      {
        uint64_t v42 = 3;
      }
      if (v40) {
        uint64_t v43 = 2;
      }
      else {
        uint64_t v43 = 1;
      }
      int v40 = 0;
      break;
    case 2:
      BOOL v41 = v40 == 0;
      if (v40) {
        double v36 = v33;
      }
      else {
        double v36 = v32;
      }
      if (v40) {
        double v33 = v32;
      }
      else {
        double v33 = v35;
      }
      if (v40) {
        uint64_t v42 = 1;
      }
      else {
        uint64_t v42 = 2;
      }
LABEL_47:
      if (v41) {
        uint64_t v43 = 4;
      }
      else {
        uint64_t v43 = 2;
      }
      break;
    case 3:
      if (v40)
      {
        double v36 = v33;
        double v33 = v32;
        uint64_t v42 = 1;
      }
      else
      {
        uint64_t v42 = 3;
      }
      if (v40) {
        uint64_t v43 = 2;
      }
      else {
        uint64_t v43 = 1;
      }
      break;
    default:
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      int v40 = 0;
      double v33 = 0.0;
      double v36 = 0.0;
      break;
  }
  if ([*v31 userInterfaceLayoutDirection] == 1) {
    double v44 = v33;
  }
  else {
    double v44 = v36;
  }
  if ([*v31 userInterfaceLayoutDirection] == 1) {
    double v45 = v36;
  }
  else {
    double v45 = v33;
  }
  if ([*v31 userInterfaceLayoutDirection] == 1) {
    int64_t v46 = v43;
  }
  else {
    int64_t v46 = v42;
  }
  if ([*v31 userInterfaceLayoutDirection] == 1) {
    uint64_t v43 = v42;
  }
  int v47 = v40 ^ ([*v31 userInterfaceLayoutDirection] == 1);
  [v27 safeCGFloatForKey:@"movePanGestureNegativeVelocityThreshold"];
  double v49 = v48;
  [v27 safeCGFloatForKey:@"movePanGesturePositiveVelocityThreshold"];
  double v51 = v50;
  [v27 safeCGFloatForKey:@"movePanGestureThresholdPercentage"];
  if (v47) {
    double v53 = -v49;
  }
  else {
    double v53 = v51;
  }
  double v54 = -v51;
  if (!v47) {
    double v54 = v49;
  }
  if (v44 >= v45) {
    -[SBMoveGestureFloatingSwitcherModifierAccessibility _axFloatingConfigurationForGestureEvent:withZeroVelocity:]();
  }
  if (v53 <= 0.0) {
    -[SBMoveGestureFloatingSwitcherModifierAccessibility _axFloatingConfigurationForGestureEvent:withZeroVelocity:]();
  }
  if (v54 >= 0.0) {
    -[SBMoveGestureFloatingSwitcherModifierAccessibility _axFloatingConfigurationForGestureEvent:withZeroVelocity:]();
  }
  if (v44 >= v60) {
    double v55 = v44;
  }
  else {
    double v55 = v60;
  }
  if (v45 <= v55) {
    double v55 = v45;
  }
  int64_t v56 = v43;
  if (v53 > v59)
  {
    int64_t v56 = v46;
    if (v54 < v59)
    {
      if (v47) {
        double v52 = 1.0 - v52;
      }
      if (v55 <= v44 + (v45 - v44) * v52) {
        int64_t v56 = v46;
      }
      else {
        int64_t v56 = v43;
      }
    }
  }

  return v56;
}

- (void)_axFloatingConfigurationForGestureEvent:withZeroVelocity:.cold.1()
{
}

- (void)_axFloatingConfigurationForGestureEvent:withZeroVelocity:.cold.2()
{
}

- (void)_axFloatingConfigurationForGestureEvent:withZeroVelocity:.cold.3()
{
}

@end