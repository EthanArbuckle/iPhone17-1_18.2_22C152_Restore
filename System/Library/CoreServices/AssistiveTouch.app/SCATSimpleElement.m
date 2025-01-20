@interface SCATSimpleElement
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
- (id)highestAncestorGroup;
- (id)keyboardContainer;
- (id)scatSupportedGestures;
- (id)scatValue;
- (id)scrollableElement;
- (int)scatPid;
- (int64_t)scatActivateBehavior;
- (unint64_t)scatScanningBehaviorTraits;
- (unint64_t)scatTraits;
- (void)setParentGroup:(id)a3;
@end

@implementation SCATSimpleElement

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
  [(SCATSimpleElement *)self scatFrame];
  sub_100040B50(v2, v3, v4, v5);

  AX_CGRectGetCenter();
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (BOOL)scatPathIsInSceneReferenceSpace
{
  return 0;
}

- (CGRect)scatFrame
{
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPath)scatPath
{
  return 0;
}

- (unint64_t)scatTraits
{
  return kAXButtonTrait;
}

- (unint64_t)scatScanningBehaviorTraits
{
  return 15;
}

- (BOOL)scatIsValid
{
  return 1;
}

- (BOOL)scatIsAXElement
{
  return 0;
}

- (BOOL)scatShouldAllowDeferFocusToNativeFocusedElement
{
  return 1;
}

- (BOOL)scatIndicatesOwnFocus
{
  return 0;
}

- (BOOL)scatShouldActivateDirectly
{
  return 1;
}

- (int64_t)scatActivateBehavior
{
  return 1;
}

- (id)scatValue
{
  return [(SCATSimpleElement *)self accessibilityValue];
}

- (BOOL)scatShouldSuppressAudioOutput
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

- (NSNumber)scatOverrideCursorTheme
{
  return 0;
}

- (id)scrollableElement
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

- (BOOL)scatHidesGroupCursorWhenFocused
{
  return 0;
}

- (id)scatSupportedGestures
{
  return 0;
}

- (BOOL)scatCanScrollInAtLeastOneDirection
{
  return 0;
}

- (BOOL)scatSupportsAction:(int)a3
{
  return a3 == 2010;
}

- (BOOL)scatPerformAction:(int)a3
{
  return 0;
}

- (BOOL)scatPerformAction:(int)a3 withValue:(id)a4
{
  return 0;
}

- (BOOL)scatAssistiveTechFocused
{
  return 0;
}

- (BOOL)scatIsMemberOfGroup
{
  CGFloat v2 = [(SCATSimpleElement *)self parentGroup];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)scatIsAuxiliaryElement
{
  return 0;
}

- (SCATAuxiliaryElementManager)scatAuxiliaryElementManager
{
  return 0;
}

- (BOOL)scatIsOnScreen
{
  [(SCATSimpleElement *)self frame];
  double MinX = CGRectGetMinX(v12);
  [(SCATSimpleElement *)self frame];
  double MaxX = CGRectGetMaxX(v13);
  [(SCATSimpleElement *)self frame];
  double MinY = CGRectGetMinY(v14);
  [(SCATSimpleElement *)self frame];
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

- (int)scatPid
{
  return -1;
}

- (NSArray)scatDrops
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)scatDrags
{
  return (NSArray *)&__NSArray0__struct;
}

- (id)highestAncestorGroup
{
  CGFloat v2 = [(SCATSimpleElement *)self parentGroup];
  BOOL v3 = [v2 highestAncestorGroup];

  return v3;
}

- (BOOL)isGroup
{
  return 0;
}

- (id)keyboardContainer
{
  return 0;
}

- (BOOL)scatUpdatesMenu
{
  return self->scatUpdatesMenu;
}

- (BOOL)isHandUI
{
  return self->isHandUI;
}

- (BOOL)isVisible
{
  return self->isVisible;
}

- (AXElementGroup)parentGroup
{
  return self->_parentGroup;
}

- (void)setParentGroup:(id)a3
{
  self->_parentGroup = (AXElementGroup *)a3;
}

@end