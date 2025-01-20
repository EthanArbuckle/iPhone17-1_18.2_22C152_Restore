@interface AXElement
- (BOOL)isHandUI;
- (BOOL)isVisible;
- (BOOL)scatAssistiveTechFocused;
- (BOOL)scatBeginScanningFromSelfAfterActivation;
- (BOOL)scatCanScrollInAtLeastOneDirection;
- (BOOL)scatCanShowAlternateKeys;
- (BOOL)scatHidesGroupCursorWhenFocused;
- (BOOL)scatIndicatesOwnFocus;
- (BOOL)scatIsAXElement;
- (BOOL)scatIsAuxiliaryElement;
- (BOOL)scatIsMemberOfGroup;
- (BOOL)scatIsOnScreen;
- (BOOL)scatPathIsInSceneReferenceSpace;
- (BOOL)scatShouldActivateDirectly;
- (BOOL)scatShouldAllowDeferFocusToNativeFocusedElement;
- (BOOL)scatShouldSuppressAudioOutput;
- (BOOL)scatSupportsAction:(int)a3;
- (BOOL)scatUpdatesMenu;
- (CGPath)scatPath;
- (CGPoint)scatScreenPointForOperations;
- (CGRect)scatTextCursorFrame;
- (NSArray)scatAlternateKeys;
- (NSArray)scatCustomActions;
- (NSArray)scatCustomHardwareActions;
- (NSArray)scatDrags;
- (NSArray)scatDrops;
- (NSNumber)scatOverrideCursorTheme;
- (NSString)scatSpeakableDescription;
- (SCATAuxiliaryElementManager)scatAuxiliaryElementManager;
- (SCATElementAutoscrolling)scatAutoscrollTarget;
- (id)elemLog;
- (id)scatSupportedGestures;
- (id)windowSceneIdentifier;
- (int64_t)scatActivateBehavior;
- (void)scatUpdateValue;
- (void)setScatAssistiveTechFocused:(BOOL)a3;
- (void)setScatAutoscrollTarget:(id)a3;
@end

@implementation AXElement

- (id)elemLog
{
  v3 = [(AXElement *)self label];
  v4 = [(AXElement *)self uiElement];
  v5 = [v4 stringWithAXAttribute:2072];
  v6 = +[NSString stringWithFormat:@"%@ %@", v3, v5];

  return v6;
}

- (CGPoint)scatScreenPointForOperations
{
  [(AXElement *)self centerPoint];
  double v4 = v3;
  double v6 = v5;
  v7 = +[AXElement systemWideElement];
  objc_msgSend(v7, "convertPoint:fromContextId:", -[AXElement windowContextId](self, "windowContextId"), v4, v6);
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  [(AXElement *)self scatFrame];
  v21.origin.x = sub_100040B50(v12, v13, v14, v15);
  v20.x = v9;
  v20.y = v11;
  if (CGRectContainsPoint(v21, v20))
  {
    double v16 = v9;
    double v17 = v11;
  }
  else
  {
    AX_CGRectGetCenter();
  }
  result.y = v17;
  result.x = v16;
  return result;
}

- (BOOL)scatPathIsInSceneReferenceSpace
{
  return 1;
}

- (CGPath)scatPath
{
  return (CGPath *)[(AXElement *)self path];
}

- (CGRect)scatTextCursorFrame
{
  [(AXElement *)self textCursorFrame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)scatIsAXElement
{
  return 1;
}

- (BOOL)scatIndicatesOwnFocus
{
  return 0;
}

- (BOOL)scatShouldAllowDeferFocusToNativeFocusedElement
{
  return 1;
}

- (BOOL)scatShouldActivateDirectly
{
  double v3 = +[AXSettings sharedInstance];
  if ([v3 switchControlShouldAlwaysActivateKeyboardKeys]
    && [v3 switchControlTapBehavior] != (id)2
    && ([(AXElement *)self scatIsKeyboardKey]
     || ([(AXElement *)self keyboardContainer], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0)
     && (v7 = (void *)v6,
         unsigned __int8 v8 = [(AXElement *)self hasAnyTraits:kAXAdjustableTrait],
         v7,
         (v8 & 1) == 0)))
  {
    if ([(AXElement *)self scatIsAXElement])
    {
      CGFloat v9 = [(AXElement *)self uiElement];
      unsigned __int8 v10 = [v9 BOOLWithAXAttribute:12006];

      char v4 = v10 ^ 1;
    }
    else
    {
      char v4 = 1;
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (int64_t)scatActivateBehavior
{
  double v3 = +[AXSettings sharedInstance];
  id v4 = [v3 switchControlScanAfterTapLocation];

  if (v4 == (id)1) {
    return 1;
  }

  return (int64_t)[(AXElement *)self scannerActivateBehavior];
}

- (NSString)scatSpeakableDescription
{
  double v3 = [(AXElement *)self label];
  unint64_t v4 = (unint64_t)[(AXElement *)self traits];
  unint64_t v5 = kAXToggleTrait & ~v4;
  uint64_t v6 = [(AXElement *)self value];
  v7 = v6;
  if (!v5)
  {
    if ([v6 isEqualToString:@"1"])
    {
      unsigned __int8 v8 = @"element.on.state";
    }
    else if ([v7 isEqualToString:@"0"])
    {
      unsigned __int8 v8 = @"element.off.state";
    }
    else
    {
      if (![v7 isEqualToString:@"2"])
      {
        uint64_t v10 = 0;
        goto LABEL_10;
      }
      unsigned __int8 v8 = @"element.mixed.state";
    }
    uint64_t v10 = sub_100040EC8(v8);
LABEL_10:
    v41 = (void *)v10;
    CGFloat v9 = __AXStringForVariables();

    double v3 = v7;
    v7 = (void *)v10;
    goto LABEL_11;
  }
  v41 = v6;
  CGFloat v9 = __AXStringForVariables();
LABEL_11:

  if (!objc_msgSend(v9, "length", v41, @"__AXStringForVariablesSentinel")
    && [(AXElement *)self eligibleForIconVision])
  {
    CGFloat v11 = [(AXElement *)self uiElement];
    CGFloat v12 = [v11 arrayWithAXAttribute:2315];

    CGFloat v13 = +[AXMIconVisionEngine sharedInstance];
    CGFloat v14 = [v13 classifyImages:v12 withTimeout:0.5];

    if ([v14 length])
    {
      id v15 = v14;

      CGFloat v9 = v15;
    }
  }
  double v16 = [(AXElement *)self customContent];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v17 = [v16 countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v58;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v58 != v19) {
          objc_enumerationMutation(v16);
        }
        CGRect v21 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        if (objc_msgSend(v21, "importance", v42, v50) == (id)1)
        {
          v42 = [v21 value];
          CFStringRef v50 = @"__AXStringForVariablesSentinel";
          uint64_t v22 = __AXStringForVariables();

          CGFloat v9 = (void *)v22;
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v18);
  }
  v23 = +[AXSettings sharedInstance];
  unsigned int v24 = [v23 assistiveTouchScannerSpeechShouldSpeakTraits];

  if (v24)
  {
    unint64_t v25 = (unint64_t)[(AXElement *)self traits];
    if ((kAXSelectedTrait & ~v25) == 0)
    {
      v43 = sub_100040EC8(@"element.selected");
      CFStringRef v51 = @"__AXStringForVariablesSentinel";
      uint64_t v26 = __AXStringForVariables();

      CGFloat v9 = (void *)v26;
    }
    unint64_t v27 = (unint64_t)[(AXElement *)self traits];
    if ((kAXHeaderTrait & ~v27) == 0)
    {
      v44 = sub_100040EC8(@"element.heading");
      CFStringRef v52 = @"__AXStringForVariablesSentinel";
      uint64_t v28 = __AXStringForVariables();

      CGFloat v9 = (void *)v28;
    }
    unint64_t v29 = (unint64_t)[(AXElement *)self traits];
    if ((kAXButtonTrait & ~v29) == 0)
    {
      unint64_t v30 = (unint64_t)[(AXElement *)self traits];
      if ((kAXKeyboardKeyTrait & ~v30) != 0)
      {
        v45 = sub_100040EC8(@"element.button");
        CFStringRef v53 = @"__AXStringForVariablesSentinel";
        uint64_t v31 = __AXStringForVariables();

        CGFloat v9 = (void *)v31;
      }
    }
    unint64_t v32 = (unint64_t)[(AXElement *)self traits];
    if ((kAXLinkTrait & ~v32) == 0)
    {
      v46 = sub_100040EC8(@"element.link");
      CFStringRef v54 = @"__AXStringForVariablesSentinel";
      uint64_t v33 = __AXStringForVariables();

      CGFloat v9 = (void *)v33;
    }
    unint64_t v34 = (unint64_t)[(AXElement *)self traits];
    if ((kAXImageTrait & ~v34) == 0)
    {
      v47 = sub_100040EC8(@"element.image");
      CFStringRef v55 = @"__AXStringForVariablesSentinel";
      uint64_t v35 = __AXStringForVariables();

      CGFloat v9 = (void *)v35;
    }
    unint64_t v36 = (unint64_t)[(AXElement *)self traits];
    if ((kAXNotEnabledTrait & ~v36) == 0)
    {
      v48 = sub_100040EC8(@"element.dimmed");
      CFStringRef v56 = @"__AXStringForVariablesSentinel";
      uint64_t v37 = __AXStringForVariables();

      CGFloat v9 = (void *)v37;
    }
    unint64_t v38 = (unint64_t)[(AXElement *)self traits];
    if ((kAXAdjustableTrait & ~v38) == 0)
    {
      v49 = sub_100040EC8(@"element.adjustable");
      uint64_t v39 = __AXStringForVariables();

      CGFloat v9 = (void *)v39;
    }
  }

  return (NSString *)v9;
}

- (BOOL)scatShouldSuppressAudioOutput
{
  return 0;
}

- (NSNumber)scatOverrideCursorTheme
{
  return 0;
}

- (BOOL)scatAssistiveTechFocused
{
  return [(AXElement *)self assistiveTechFocused];
}

- (void)setScatAssistiveTechFocused:(BOOL)a3
{
}

- (BOOL)scatCanShowAlternateKeys
{
  return [(AXElement *)self hasVariantKeys];
}

- (NSArray)scatAlternateKeys
{
  return (NSArray *)[(AXElement *)self variantKeys];
}

- (BOOL)scatCanScrollInAtLeastOneDirection
{
  return [(AXElement *)self canScrollInAtLeastOneDirection];
}

- (BOOL)scatSupportsAction:(int)a3
{
  BOOL result = -[AXElement supportsAction:](self, "supportsAction:");
  if (a3 == 2010 && !result)
  {
    unint64_t v6 = (unint64_t)[(AXElement *)self traits];
    uint64_t v7 = kAXAdjustableTrait;
    unint64_t v8 = kAXAdjustableTrait & v6;
    if ((kAXIsEditingTrait & ~v6) != 0)
    {
      char v12 = 1;
    }
    else if ((kAXWebContentTrait & ~v6) != 0)
    {
      char v12 = 0;
    }
    else
    {
      CGFloat v9 = [(AXElement *)self application];
      uint64_t v10 = [v9 uiElement];
      unsigned __int8 v11 = [v10 BOOLWithAXAttribute:3005];

      char v12 = v11 ^ 1;
    }
    if (v8 == v7) {
      return 0;
    }
    else {
      return v12;
    }
  }
  return result;
}

- (id)scatSupportedGestures
{
  return [(AXElement *)self supportedGestures];
}

- (NSArray)scatCustomActions
{
  return (NSArray *)[(AXElement *)self customActions];
}

- (NSArray)scatCustomHardwareActions
{
  double v2 = [(AXElement *)self uiElement];
  double v3 = [v2 objectWithAXAttribute:95259 parameter:@"HardwareGestureActions"];

  uint64_t v8 = 0;
  unint64_t v4 = +[NSKeyedUnarchiver unarchivedArrayOfObjectsOfClass:objc_opt_class() fromData:v3 error:&v8];
  unint64_t v5 = v4;
  if (v8) {
    id v6 = &__NSArray0__struct;
  }
  else {
    id v6 = v4;
  }

  return (NSArray *)v6;
}

- (NSArray)scatDrags
{
  return (NSArray *)[(AXElement *)self drags];
}

- (NSArray)scatDrops
{
  return (NSArray *)[(AXElement *)self drops];
}

- (BOOL)scatIsMemberOfGroup
{
  double v2 = [(AXElement *)self parentGroup];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)scatIsAuxiliaryElement
{
  double v2 = [(AXElement *)self scatAuxiliaryElementManager];
  BOOL v3 = v2 != 0;

  return v3;
}

- (SCATAuxiliaryElementManager)scatAuxiliaryElementManager
{
  return 0;
}

- (BOOL)scatHidesGroupCursorWhenFocused
{
  return 0;
}

- (BOOL)scatIsOnScreen
{
  [(AXElement *)self frame];
  double MinX = CGRectGetMinX(v12);
  [(AXElement *)self frame];
  double MaxX = CGRectGetMaxX(v13);
  [(AXElement *)self frame];
  double MinY = CGRectGetMinY(v14);
  [(AXElement *)self frame];
  double MaxY = CGRectGetMaxY(v15);
  -[HNDHandManager screenFrame:]_0();
  double v8 = v7;
  -[HNDHandManager screenFrame:]_0();
  BOOL v10 = MinX >= 0.0;
  if (MinY < 0.0) {
    BOOL v10 = 0;
  }
  if (MaxX > v8) {
    BOOL v10 = 0;
  }
  return MaxY <= v9 && v10;
}

- (BOOL)scatBeginScanningFromSelfAfterActivation
{
  return 0;
}

- (BOOL)scatUpdatesMenu
{
  double v2 = [(AXElement *)self uiElement];
  unsigned __int8 v3 = [v2 BOOLWithAXAttribute:2189];

  return v3;
}

- (id)windowSceneIdentifier
{
  double v2 = [(AXElement *)self uiElement];
  unsigned __int8 v3 = [v2 stringWithAXAttribute:3056];

  return v3;
}

- (BOOL)isHandUI
{
  double v2 = [(AXElement *)self windowSceneIdentifier];
  unsigned __int8 v3 = [v2 hasPrefix:@"com.apple.RealityHUD.HandScene"];

  return v3;
}

- (BOOL)isVisible
{
  unsigned __int8 v3 = [(AXElement *)self uiElement];
  [v3 updateCache:2025];

  unint64_t v4 = [(AXElement *)self uiElement];
  LOBYTE(v3) = [v4 BOOLWithAXAttribute:2025];

  return (char)v3;
}

- (SCATElementAutoscrolling)scatAutoscrollTarget
{
  return (SCATElementAutoscrolling *)[(AXElement *)self autoscrollTarget];
}

- (void)setScatAutoscrollTarget:(id)a3
{
  id v4 = a3;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    [(AXElement *)self setAutoscrollTarget:v4];
  }
}

- (void)scatUpdateValue
{
  [(AXElement *)self updateCache:2006];

  [(AXElement *)self updateCache:2004];
}

@end