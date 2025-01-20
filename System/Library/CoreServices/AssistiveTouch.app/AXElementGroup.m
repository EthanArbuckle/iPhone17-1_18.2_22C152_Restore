@interface AXElementGroup
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
- (CGRect)scatTextCursorFrame;
- (NSArray)scatAlternateKeys;
- (NSArray)scatCustomActions;
- (NSArray)scatCustomHardwareActions;
- (NSArray)scatDrags;
- (NSArray)scatDrops;
- (NSNumber)scatOverrideCursorTheme;
- (NSString)scatSpeakableDescription;
- (SCATAuxiliaryElementManager)scatAuxiliaryElementManager;
- (id)elemLog;
- (id)scatSpeakableDescription:(BOOL)a3;
- (id)scatSupportedGestures;
- (id)scatValue;
- (id)scrollableElement;
- (int)scatPid;
- (int64_t)scatActivateBehavior;
- (unint64_t)scatScanningBehaviorTraits;
- (unint64_t)scatTraits;
- (unsigned)scatDisplayId;
- (void)prepareElementsForScanning:(id)a3;
- (void)scatScrollToVisible;
- (void)setScatAuxiliaryElementManager:(id)a3;
@end

@implementation AXElementGroup

- (id)elemLog
{
  v3 = +[NSMutableString stringWithString:@"{ "];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self;
  id v5 = [(AXElementGroup *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 isGroup]) {
          [v9 elemLog];
        }
        else {
        v10 = [v9 scatSpeakableDescription];
        }
        if (![(__CFString *)v10 length])
        {

          v10 = @"[no label]";
        }
        [v3 appendFormat:@"%@ ", v10];
      }
      id v6 = [(AXElementGroup *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  [v3 appendString:@" }"];

  return v3;
}

- (unint64_t)scatTraits
{
  return 0;
}

- (BOOL)scatPathIsInSceneReferenceSpace
{
  return 0;
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
  [(AXElementGroup *)self scatFrame];
  sub_100040B50(v2, v3, v4, v5);

  AX_CGRectGetCenter();
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (BOOL)scatIsAXElement
{
  return 0;
}

- (BOOL)scatShouldAllowDeferFocusToNativeFocusedElement
{
  return 1;
}

- (BOOL)scatSupportsAction:(int)a3
{
  return 0;
}

- (BOOL)scatPerformAction:(int)a3
{
  return 0;
}

- (BOOL)scatPerformAction:(int)a3 withValue:(id)a4
{
  return 0;
}

- (CGPath)scatPath
{
  return 0;
}

- (id)scatSupportedGestures
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

- (unint64_t)scatScanningBehaviorTraits
{
  unint64_t result = (unint64_t)[(AXElementGroup *)self userDefinedScanningBehaviorTraits];
  if ((result & 0x10) != 0)
  {
    CGFloat v4 = [(AXElementGroup *)self firstLeafDescendant];
    id v5 = [v4 scanningBehaviorTraits];

    return (unint64_t)v5;
  }
  return result;
}

- (BOOL)scatIsMemberOfGroup
{
  CGFloat v2 = [(AXElementGroup *)self parentGroup];
  BOOL v3 = v2 != 0;

  return v3;
}

- (SCATAuxiliaryElementManager)scatAuxiliaryElementManager
{
  return (SCATAuxiliaryElementManager *)objc_getAssociatedObject(self, &unk_1001F0BF8);
}

- (void)setScatAuxiliaryElementManager:(id)a3
{
}

- (BOOL)scatIsAuxiliaryElement
{
  CGFloat v2 = [(AXElementGroup *)self scatAuxiliaryElementManager];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)scatShouldActivateDirectly
{
  BOOL v3 = +[AXSettings sharedInstance];
  if ([v3 switchControlShouldAlwaysActivateKeyboardKeys]
    && [v3 switchControlTapBehavior] != (id)2
    && ([(AXElementGroup *)self keyboardContainer],
        CGFloat v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    unsigned __int8 v5 = 1;
  }
  else if ([(AXElementGroup *)self count])
  {
    double v6 = [(AXElementGroup *)self objectAtIndex:0];
    unsigned __int8 v5 = [v6 scatShouldActivateDirectly];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)scatIndicatesOwnFocus
{
  id v3 = [(AXElementGroup *)self count];
  if (v3)
  {
    CGFloat v4 = [(AXElementGroup *)self objectAtIndex:0];
    unsigned __int8 v5 = [v4 scatIndicatesOwnFocus];

    LOBYTE(v3) = v5;
  }
  return (char)v3;
}

- (int64_t)scatActivateBehavior
{
  return 1;
}

- (id)scrollableElement
{
  if ([(AXElementGroup *)self count])
  {
    id v3 = [(AXElementGroup *)self objectAtIndex:0];
    CGFloat v4 = [v3 scrollableElement];
  }
  else
  {
    CGFloat v4 = 0;
  }

  return v4;
}

- (BOOL)scatCanScrollInAtLeastOneDirection
{
  id v3 = [(AXElementGroup *)self count];
  if (v3)
  {
    CGFloat v4 = [(AXElementGroup *)self objectAtIndex:0];
    unsigned __int8 v5 = [v4 scatCanScrollInAtLeastOneDirection];

    LOBYTE(v3) = v5;
  }
  return (char)v3;
}

- (id)scatSpeakableDescription:(BOOL)a3
{
  CGFloat v4 = [(AXElementGroup *)self accessibilityLabel];

  if (v4)
  {
    uint64_t v5 = [(AXElementGroup *)self accessibilityLabel];
LABEL_7:
    double v7 = (void *)v5;
    goto LABEL_8;
  }
  double v6 = [(AXElementGroup *)self label];

  if (v6)
  {
    uint64_t v5 = [(AXElementGroup *)self label];
    goto LABEL_7;
  }
  if ([(AXElementGroup *)self isKeyboardContainer])
  {
    uint64_t v5 = sub_100040EC8(@"KEYBOARD");
    goto LABEL_7;
  }
  v9 = [(AXElementGroup *)self descendantsPassingTest:&stru_1001AE410];
  v10 = sub_100040EC8(@"GROUP_DESCRIPTION");
  v11 = [v9 firstObject];
  long long v12 = [v11 scatSpeakableDescription];
  long long v13 = [v9 lastObject];
  long long v14 = [v13 scatSpeakableDescription];
  double v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v12, v14);

LABEL_8:

  return v7;
}

- (NSString)scatSpeakableDescription
{
  return (NSString *)[(AXElementGroup *)self scatSpeakableDescription:0];
}

- (id)scatValue
{
  v4.receiver = self;
  v4.super_class = (Class)AXElementGroup;
  CGFloat v2 = [(AXElementGroup *)&v4 accessibilityValue];

  return v2;
}

- (BOOL)scatShouldSuppressAudioOutput
{
  return 0;
}

- (BOOL)scatIsValid
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  CGFloat v2 = self;
  id v3 = [(AXElementGroup *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "scatIsValid", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [(AXElementGroup *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (void)scatScrollToVisible
{
  [(AXElementGroup *)self enumerateObjectsUsingBlock:&stru_1001AE450];

  [(AXElementGroup *)self enumerateObjectsWithOptions:2 usingBlock:&stru_1001AE470];
}

- (BOOL)scatIsOnScreen
{
  [(AXElementGroup *)self frame];
  double MinX = CGRectGetMinX(v12);
  [(AXElementGroup *)self frame];
  double MaxX = CGRectGetMaxX(v13);
  [(AXElementGroup *)self frame];
  double MinY = CGRectGetMinY(v14);
  [(AXElementGroup *)self frame];
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

- (unsigned)scatDisplayId
{
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000CAD6C;
  v4[3] = &unk_1001AE498;
  v4[4] = &v5;
  [(AXElementGroup *)self enumerateObjectsUsingBlock:v4];
  unsigned int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isHandUI
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unsigned int v2 = self;
  id v3 = [(AXElementGroup *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isHandUI", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [(AXElementGroup *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)isVisible
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unsigned int v2 = self;
  id v3 = [(AXElementGroup *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isVisible", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [(AXElementGroup *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (void)prepareElementsForScanning:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000CB020;
  v3[3] = &unk_1001AC550;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

- (BOOL)scatAssistiveTechFocused
{
  return 0;
}

@end