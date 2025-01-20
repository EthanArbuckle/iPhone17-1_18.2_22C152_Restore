@interface UIView
- (AXElementGroup)parentGroup;
- (BOOL)isGroup;
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
- (BOOL)scatIsKeyboardKey;
- (BOOL)scatIsMemberOfGroup;
- (BOOL)scatIsOnScreen;
- (BOOL)scatIsValid;
- (BOOL)scatPathIsInSceneReferenceSpace;
- (BOOL)scatPerformAction:(int)a3;
- (BOOL)scatPerformAction:(int)a3 withValue:(id)a4;
- (BOOL)scatShouldActivateDirectly;
- (BOOL)scatShouldAllowDeferFocusToNativeFocusedElement;
- (BOOL)scatShouldSuppressAudioOutput;
- (BOOL)scatSupportsAction:(int)a3;
- (BOOL)scatUpdatesMenu;
- (CGPath)scatPath;
- (CGPoint)scatCenterPoint;
- (CGPoint)scatScreenPointForOperations;
- (CGRect)scatFrame;
- (CGRect)scatTextCursorFrame;
- (NSArray)scatAlternateKeys;
- (NSArray)scatCustomActions;
- (NSArray)scatCustomHardwareActions;
- (NSArray)scatDrags;
- (NSArray)scatDrops;
- (NSNumber)scatOverrideCursorTheme;
- (SCATAuxiliaryElementManager)scatAuxiliaryElementManager;
- (id)_axSubviews;
- (id)highestAncestorGroup;
- (id)keyboardContainer;
- (id)scatSupportedGestures;
- (id)scatValue;
- (id)scrollableElement;
- (int64_t)scatActivateBehavior;
- (unint64_t)scatMenuItemStyle;
- (unint64_t)scatScanningBehaviorTraits;
- (unint64_t)scatTraits;
- (void)_axPrintSubviews:(int64_t)a3 string:(id)a4;
- (void)setParentGroup:(id)a3;
- (void)setScatAuxiliaryElementManager:(id)a3;
- (void)setScatMenuItemStyle:(unint64_t)a3;
- (void)setScatShouldActivateDirectly:(BOOL)a3;
@end

@implementation UIView

- (void)_axPrintSubviews:(int64_t)a3 string:(id)a4
{
  id v6 = a4;
  if (!a3)
  {
    v7 = [(UIView *)self description];
    [v6 appendFormat:@"SELF: %@\n", v7];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(UIView *)self subviews];
  id v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v11);
        if (a3 >= 1)
        {
          int64_t v13 = a3;
          do
          {
            [v6 appendString:@"    "];
            --v13;
          }
          while (v13);
        }
        v14 = [v12 description];
        [v6 appendFormat:@"%@\n", v14];

        v15 = [v12 subviews];
        id v16 = [v15 count];

        if (v16) {
          [v12 _axPrintSubviews:a3 + 1 string:v6];
        }
        v11 = (char *)v11 + 1;
      }
      while (v11 != v9);
      id v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
}

- (id)_axSubviews
{
  v3 = +[NSMutableString string];
  [(UIView *)self _axPrintSubviews:0 string:v3];

  return v3;
}

- (unint64_t)scatMenuItemStyle
{
  v2 = objc_getAssociatedObject(self, &unk_1001F0B78);
  v3 = v2;
  if (v2) {
    id v4 = [v2 integerValue];
  }
  else {
    id v4 = 0;
  }

  return (unint64_t)v4;
}

- (void)setScatMenuItemStyle:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  objc_setAssociatedObject(self, &unk_1001F0B78, v4, (void *)0x301);

  [(UIView *)self didUpdateScatMenuItemStyle];
}

- (id)keyboardContainer
{
  return 0;
}

- (id)scrollableElement
{
  return 0;
}

- (CGRect)scatTextCursorFrame
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)scatCenterPoint
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)scatScreenPointForOperations
{
  [(UIView *)self scatFrame];
  sub_100040B50(v2, v3, v4, v5);

  AX_CGRectGetCenter();
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGRect)scatFrame
{
  [(UIView *)self bounds];

  +[HNDScreen convertRect:fromView:](HNDScreen, "convertRect:fromView:", self);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGPath)scatPath
{
  return 0;
}

- (unint64_t)scatTraits
{
  if ([(UIView *)self scatShouldActivateDirectly]) {
    return kAXButtonTrait;
  }
  else {
    return 0;
  }
}

- (unint64_t)scatScanningBehaviorTraits
{
  return 15;
}

- (BOOL)scatIsValid
{
  CGFloat v2 = [(UIView *)self window];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)scatShouldAllowDeferFocusToNativeFocusedElement
{
  return 1;
}

- (BOOL)scatShouldActivateDirectly
{
  CGFloat v2 = objc_getAssociatedObject(self, &unk_1001F0BC0);
  BOOL v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (void)setScatShouldActivateDirectly:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, &unk_1001F0BC0, v4, (void *)0x303);
}

- (SCATAuxiliaryElementManager)scatAuxiliaryElementManager
{
  return (SCATAuxiliaryElementManager *)objc_getAssociatedObject(self, &unk_1001F0BC1);
}

- (void)setScatAuxiliaryElementManager:(id)a3
{
}

- (int64_t)scatActivateBehavior
{
  return 1;
}

- (NSNumber)scatOverrideCursorTheme
{
  return 0;
}

- (BOOL)scatHidesGroupCursorWhenFocused
{
  return 0;
}

- (BOOL)scatShouldSuppressAudioOutput
{
  return 0;
}

- (BOOL)scatCanScrollInAtLeastOneDirection
{
  return 0;
}

- (id)scatSupportedGestures
{
  return 0;
}

- (NSArray)scatCustomActions
{
  return 0;
}

- (NSArray)scatCustomHardwareActions
{
  return 0;
}

- (BOOL)scatSupportsAction:(int)a3
{
  return a3 == 2010;
}

- (BOOL)scatPerformAction:(int)a3
{
  NSClassFromString(@"UISegment");
  if (objc_opt_isKindOfClass())
  {
    double v7 = [(UIView *)self superview];
    id v4 = v7;
    AXPerformSafeBlock();

    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(UIView *)self sendActionsForControlEvents:64];
    return 1;
  }
  double v6 = +[NSThread callStackSymbols];
  _AXLogWithFacility();

  return 0;
}

- (BOOL)scatPerformAction:(int)a3 withValue:(id)a4
{
  return 0;
}

- (id)scatValue
{
  return [(UIView *)self accessibilityValue];
}

- (BOOL)scatIsMemberOfGroup
{
  CGFloat v2 = [(UIView *)self parentGroup];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)scatIsAuxiliaryElement
{
  CGFloat v2 = [(UIView *)self scatAuxiliaryElementManager];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)scatIsOnScreen
{
  [(UIView *)self frame];
  double MinX = CGRectGetMinX(v12);
  [(UIView *)self frame];
  double MaxX = CGRectGetMaxX(v13);
  [(UIView *)self frame];
  double MinY = CGRectGetMinY(v14);
  [(UIView *)self frame];
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
  return 0;
}

- (BOOL)isHandUI
{
  return 0;
}

- (BOOL)isVisible
{
  return [(UIView *)self _accessibilityIsVisibleByCompleteHitTest];
}

- (AXElementGroup)parentGroup
{
  return (AXElementGroup *)___UIAccessibilityGetAssociatedNonRetainedObject(self, &unk_1001F0BC2);
}

- (void)setParentGroup:(id)a3
{
}

- (id)highestAncestorGroup
{
  CGFloat v2 = [(UIView *)self parentGroup];
  BOOL v3 = [v2 highestAncestorGroup];

  return v3;
}

- (BOOL)scatPathIsInSceneReferenceSpace
{
  return 0;
}

- (BOOL)isGroup
{
  return 0;
}

- (BOOL)scatIsAXElement
{
  return 0;
}

- (BOOL)scatIndicatesOwnFocus
{
  return 0;
}

- (BOOL)scatIsKeyboardKey
{
  return 0;
}

- (BOOL)scatCanShowAlternateKeys
{
  return 0;
}

- (NSArray)scatAlternateKeys
{
  return 0;
}

- (BOOL)scatAssistiveTechFocused
{
  return 0;
}

- (NSArray)scatDrops
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)scatDrags
{
  return (NSArray *)&__NSArray0__struct;
}

@end