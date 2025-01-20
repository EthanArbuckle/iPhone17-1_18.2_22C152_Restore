@interface HNDApplication
+ (BOOL)usesScenes;
+ (double)preferredWindowLevel;
- (BOOL)_accessibilityApplicationDidBecomeFocused;
- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5;
- (BOOL)_shouldAllowKeyboardArbiter;
- (BOOL)_supportedOnLockScreen;
- (BOOL)isSuspended;
- (HNDApplication)init;
- (id)_accessibilityMainWindow;
- (id)_accessibilityScannerCurrentFocusContext;
- (id)_accessibilityScannerCurrentLoopElements;
- (id)_accessibilityScannerCurrentLoopElementsForFocusContext:(id)a3;
- (id)_iosAccessibilityAttributeValue:(int64_t)a3;
- (unint64_t)_accessibilityScannerCurrentLoopIndex;
@end

@implementation HNDApplication

- (HNDApplication)init
{
  v5.receiver = self;
  v5.super_class = (Class)HNDApplication;
  v2 = [(HNDApplication *)&v5 init];
  if (v2)
  {
    v3 = +[AXValidationManager sharedInstance];
    [v3 performValidations:&stru_1001AD0D0 withPreValidationHandler:&stru_1001AD0F0 postValidationHandler:0];
  }
  return v2;
}

+ (BOOL)usesScenes
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___HNDApplication;
  return objc_msgSendSuper2(&v3, "usesScenes");
}

- (BOOL)isSuspended
{
  return 0;
}

- (BOOL)_supportedOnLockScreen
{
  return 1;
}

- (BOOL)_shouldAllowKeyboardArbiter
{
  return 0;
}

- (id)_accessibilityScannerCurrentFocusContext
{
  if (UIAccessibilityIsSwitchControlRunning())
  {
    v2 = +[SCATScannerManager sharedManager];
    objc_super v3 = [v2 activeScannerDriver];

    if ([v3 isActive])
    {
      v4 = [v3 focusContext];
    }
    else
    {
      _AXLogWithFacility();
      v4 = 0;
    }
  }
  else
  {
    _AXLogWithFacility();
    v4 = 0;
  }

  return v4;
}

- (id)_accessibilityScannerCurrentLoopElements
{
  objc_super v3 = [(HNDApplication *)self _accessibilityScannerCurrentFocusContext];
  v4 = [(HNDApplication *)self _accessibilityScannerCurrentLoopElementsForFocusContext:v3];

  return v4;
}

- (id)_accessibilityScannerCurrentLoopElementsForFocusContext:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_super v5 = [v3 element];
    if ([v4 selectBehavior] == 4)
    {
      if (([v5 isGroup] & 1) == 0) {
        _AXAssert();
      }
      id v6 = v5;
    }
    else
    {
      int v18 = 0;
      id v6 = +[NSMutableArray arrayWithObject:v5];
      char v17 = 0;
      id v7 = v5;
      v8 = v7;
      do
      {
        v9 = v8;
        v10 = +[SCATScannerManager sharedManager];
        v11 = [v10 activeElementManager];
        v8 = [v11 siblingOfElement:v8 inDirection:0 didWrap:&v17 options:&v18];

        if (v17) {
          break;
        }
        [v6 addObject:v8];
      }
      while (!v17);
      char v17 = 0;
      id v12 = v7;

      while (!v17)
      {
        v13 = v12;
        v14 = +[SCATScannerManager sharedManager];
        v15 = [v14 activeElementManager];
        id v12 = [v15 siblingOfElement:v12 inDirection:1 didWrap:&v17 options:&v18];

        if (v17) {
          break;
        }
        [v6 insertObject:v12 atIndex:0];
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (unint64_t)_accessibilityScannerCurrentLoopIndex
{
  id v3 = [(HNDApplication *)self _accessibilityScannerCurrentFocusContext];
  if (v3)
  {
    v4 = [(HNDApplication *)self _accessibilityScannerCurrentLoopElementsForFocusContext:v3];
    if ([v3 selectBehavior] == 4)
    {
      unint64_t v5 = (unint64_t)[v4 count];
    }
    else
    {
      id v6 = [v3 element];
      unint64_t v5 = (unint64_t)[v4 indexOfObject:v6];

      if (v5 == 0x7FFFFFFFFFFFFFFFLL)
      {
        _AXAssert();
        unint64_t v5 = 0x7FFFFFFFLL;
      }
    }
  }
  else
  {
    unint64_t v5 = 0x7FFFFFFFLL;
  }

  return v5;
}

- (id)_accessibilityMainWindow
{
  v2 = +[HNDHandManager sharedManager];
  id v3 = [v2 mainWindow];

  return v3;
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3
{
  unint64_t v5 = +[AXSettings sharedInstance];
  unsigned __int8 v6 = [v5 appValidationTestingMode];

  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    switch(a3)
    {
      case 1990:
        v8 = [(HNDApplication *)self _accessibilityScannerCurrentLoopElements];
        uint64_t v9 = sub_10007D4C0(v8);
        goto LABEL_11;
      case 1991:
        uint64_t v10 = +[NSNumber numberWithUnsignedInteger:[(HNDApplication *)self _accessibilityScannerCurrentLoopIndex]];
        goto LABEL_15;
      case 1992:
        if (_AXSAssistiveTouchScannerEnabled())
        {
          v11 = +[SCATScannerManager sharedManager];
          id v12 = [v11 pointPicker];
          [v12 lastReceivedPoint];
          uint64_t v14 = v13;
          uint64_t v16 = v15;
        }
        else
        {
          v11 = +[HNDHandManager sharedManager];
          [v11 currentPointForPointer];
          uint64_t v14 = v17;
          uint64_t v16 = v18;
        }

        valuePtr[0] = v14;
        valuePtr[1] = v16;
        uint64_t v10 = (uint64_t)AXValueCreate(kAXValueTypeCGPoint, valuePtr);
        goto LABEL_15;
      case 1993:
        v8 = +[SCATScannerManager sharedManager];
        uint64_t v9 = [v8 recentSpeechOutputStrings];
        goto LABEL_11;
      default:
        if (a3 == 5060)
        {
          v8 = +[HNDHandManager sharedManager];
          uint64_t v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 nubbitVisible]);
LABEL_11:
          id v7 = (void *)v9;
        }
        else
        {
          v20.receiver = self;
          v20.super_class = (Class)HNDApplication;
          uint64_t v10 = [(HNDApplication *)&v20 _iosAccessibilityAttributeValue:a3];
LABEL_15:
          id v7 = (void *)v10;
        }
        break;
    }
  }

  return v7;
}

- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  if (v6 == 6002)
  {
    objc_opt_class();
    id v12 = __UIAccessibilityCastAsClass();
    uint64_t v13 = [v12 objectForKey:@"buttonNumber"];
    id v14 = [v13 integerValue];
    char v20 = 0;
    objc_opt_class();
    uint64_t v15 = __UIAccessibilityCastAsClass();
    uint64_t v16 = [v15 objectForKey:@"isDown"];
    BOOL v17 = +[HNDVirtualHIDMouse handleButtonNumber:isDown:](HNDVirtualHIDMouse, "handleButtonNumber:isDown:", v14, [v16 BOOLValue]);
  }
  else
  {
    if (v6 == 6001)
    {
      char v20 = 0;
      objc_opt_class();
      uint64_t v9 = __UIAccessibilityCastAsClass();
      uint64_t v10 = [v9 objectForKey:@"delta"];
      [v10 CGPointValue];
      unsigned __int8 v11 = +[HNDVirtualHIDMouse handleScrollWithDelta:](HNDVirtualHIDMouse, "handleScrollWithDelta:");
    }
    else
    {
      if (v6 != 6000)
      {
        v19.receiver = self;
        v19.super_class = (Class)HNDApplication;
        BOOL v17 = [(HNDApplication *)&v19 _iosAccessibilityPerformAction:v6 withValue:v8 fencePort:v5];
        goto LABEL_9;
      }
      char v20 = 0;
      objc_opt_class();
      uint64_t v9 = __UIAccessibilityCastAsClass();
      uint64_t v10 = [v9 objectForKey:@"delta"];
      [v10 CGPointValue];
      unsigned __int8 v11 = +[HNDVirtualHIDMouse handleMovementWithDelta:](HNDVirtualHIDMouse, "handleMovementWithDelta:");
    }
    BOOL v17 = v11;
  }
LABEL_9:

  return v17;
}

- (BOOL)_accessibilityApplicationDidBecomeFocused
{
  id v3 = [(HNDApplication *)self _accessibilityNativeFocusElement];
  if (!v3)
  {
    v4 = FKALogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Manually poking focus system in AssistiveTouch because no focused item was found.", v6, 2u);
    }

    AXPerformSafeBlock();
    [(HNDApplication *)self _accessibilityMoveFocusWithHeading:16];
  }

  return 1;
}

+ (double)preferredWindowLevel
{
  return 10000010.0;
}

@end