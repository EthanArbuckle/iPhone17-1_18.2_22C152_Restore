@interface SBSeparatorViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_axPerformGestureForAction:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityActionsForSideAppDivider;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
@end

@implementation SBSeparatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBSeparatorView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"side.app.divider");
}

- (BOOL)accessibilityPerformEscape
{
  v2 = [MEMORY[0x263F22968] server];
  char v3 = [v2 performMedusaGesture:3];

  return v3;
}

- (id)accessibilityCustomActions
{
  char v3 = [(SBSeparatorViewAccessibility *)self _accessibilityActionsForSideAppDivider];
  if ([v3 count])
  {
    id v4 = v3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBSeparatorViewAccessibility;
    id v4 = [(SBSeparatorViewAccessibility *)&v7 accessibilityCustomActions];
  }
  v5 = v4;

  return v5;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"side.app.resize.hint");
}

- (id)_accessibilityActionsForSideAppDivider
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F22968] server];
  char v3 = [v2 allowedMedusaGestures];

  id v27 = [MEMORY[0x263EFF980] array];
  id v4 = AXSpringBoardPrimaryAppLabel();
  v5 = AXSpringBoardSideAppLabel();
  uint64_t v24 = [(id)*MEMORY[0x263F1D020] userInterfaceLayoutDirection];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
LABEL_3:
    uint64_t v9 = 0;
    while (2)
    {
      if (*(void *)v29 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = [*(id *)(*((void *)&v28 + 1) + 8 * v9) unsignedIntegerValue];
      switch(v10)
      {
        case 0:
          v11 = @"side.app.resize.half.width";
          goto LABEL_43;
        case 1:
          if ([v4 length])
          {
            v15 = NSString;
            v16 = accessibilityLocalizedString(@"side.app.resize.shrink.format");
            objc_msgSend(v15, "stringWithFormat:", v16, v4);
            goto LABEL_27;
          }
          v11 = @"side.app.shrink.left.app";
          goto LABEL_43;
        case 2:
          if (![v5 length])
          {
            v11 = @"side.app.shrink.right.app";
            goto LABEL_43;
          }
          v12 = NSString;
          v13 = accessibilityLocalizedString(@"side.app.resize.shrink.format");
          v14 = objc_msgSend(v12, "stringWithFormat:", v13, v5);

          if (v14) {
            goto LABEL_28;
          }
          goto LABEL_29;
        case 3:
          if ([v4 length])
          {
            v17 = NSString;
            v18 = @"side.app.resize.expand.format";
            goto LABEL_21;
          }
          if (v24 == 1) {
            goto LABEL_34;
          }
          goto LABEL_41;
        case 4:
          if ([v5 length])
          {
            v19 = NSString;
            v20 = @"side.app.resize.expand.format";
            goto LABEL_26;
          }
          if (v24 == 1) {
LABEL_41:
          }
            v11 = @"side.app.resize.expand.left";
          else {
LABEL_34:
          }
            v11 = @"side.app.resize.expand.right";
          goto LABEL_43;
        case 7:
          if ([v4 length])
          {
            v17 = NSString;
            v18 = @"app.pip.nib.action.create.slideover.app";
            goto LABEL_21;
          }
          if (v24 == 1) {
            goto LABEL_36;
          }
          goto LABEL_38;
        case 8:
          if ([v5 length])
          {
            v19 = NSString;
            v20 = @"app.pip.nib.action.create.slideover.app";
            goto LABEL_26;
          }
          if (v24 == 1) {
LABEL_38:
          }
            v11 = @"side.app.slideover.left";
          else {
LABEL_36:
          }
            v11 = @"side.app.slideover.right";
          goto LABEL_43;
        case 11:
          if (![v4 length])
          {
            v11 = @"side.app.remove.left.app";
            goto LABEL_43;
          }
          v17 = NSString;
          v18 = @"side.app.remove.app";
LABEL_21:
          v16 = accessibilityLocalizedString(v18);
          objc_msgSend(v17, "stringWithFormat:", v16, v4);
          goto LABEL_27;
        case 12:
          if ([v5 length])
          {
            v19 = NSString;
            v20 = @"side.app.remove.app";
LABEL_26:
            v16 = accessibilityLocalizedString(v20);
            objc_msgSend(v19, "stringWithFormat:", v16, v5);
            v14 = LABEL_27:;

            if (v14)
            {
LABEL_28:
              v21 = [[AXSBSideAppCustomAction alloc] initWithName:v14 gesture:v10 target:self selector:sel__axPerformGestureForAction_];
              [v27 axSafelyAddObject:v21];
            }
          }
          else
          {
            v11 = @"side.app.remove.right.app";
LABEL_43:
            v14 = accessibilityLocalizedString(v11);
            if (v14) {
              goto LABEL_28;
            }
          }
LABEL_29:
          if (v7 != ++v9) {
            continue;
          }
          uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
          uint64_t v7 = v22;
          if (!v22) {
            goto LABEL_46;
          }
          goto LABEL_3;
        default:
          goto LABEL_29;
      }
    }
  }
LABEL_46:

  return v27;
}

- (BOOL)_axPerformGestureForAction:(id)a3
{
  char v3 = (void *)MEMORY[0x263F22968];
  id v4 = a3;
  v5 = [v3 server];
  uint64_t v6 = [v4 gesture];

  LOBYTE(v4) = [v5 performMedusaGesture:v6];
  return (char)v4;
}

@end