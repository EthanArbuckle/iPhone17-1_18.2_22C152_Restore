@interface HNDMouseKeyDevice
- (BOOL)handleHIDEvent:(id)a3;
- (BOOL)keyRepeatTimerIsRunning;
- (BOOL)load;
- (BOOL)mouseKeyActionIsMovement:(unint64_t)a3;
- (BOOL)secondaryButton;
- (BOOL)tertiaryButton;
- (BOOL)wheel;
- (HNDMouseKeyDevice)init;
- (double)mouseKeysMovementDelay;
- (double)mouseKeysRepeatDelay;
- (id)actionOverrideForUsagePage:(unsigned int)a3 usage:(unsigned int)a4;
- (id)mouse;
- (int64_t)mouseKeysMovementMultiplier;
- (unint64_t)mouseKeyActionForKeyCode:(unsigned __int16)a3;
- (void)canUseMainKeyboardKeysPreferenceDidChange;
- (void)invalidateTimers;
- (void)movePointerWithMouseKeyAction:(unint64_t)a3;
- (void)movePointerWithMouseKeyAction:(unint64_t)a3 increment:(double)a4;
- (void)reevaluateTimers;
- (void)repeatMouseKeyMovementAction:(unint64_t)a3;
- (void)resetInternalState;
- (void)startMovementHoldWithMouseKeyAction:(unint64_t)a3;
- (void)unload;
@end

@implementation HNDMouseKeyDevice

- (HNDMouseKeyDevice)init
{
  v15.receiver = self;
  v15.super_class = (Class)HNDMouseKeyDevice;
  v2 = [(HNDMouseDevice *)&v15 init];
  if (v2)
  {
    v3 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    initialDelayTimer = v2->_initialDelayTimer;
    v2->_initialDelayTimer = v3;

    uint64_t v5 = objc_opt_new();
    activeDownMovementDirections = v2->_activeDownMovementDirections;
    v2->_activeDownMovementDirections = (NSMutableArray *)v5;

    objc_initWeak(&location, v2);
    v7 = +[AXSettings sharedInstance];
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    v11 = sub_100061E34;
    v12 = &unk_1001AAA68;
    objc_copyWeak(&v13, &location);
    [v7 registerUpdateBlock:&v9 forRetrieveSelector:"assistiveTouchMouseKeysUseMainKeyboardKeys" withListener:v2];

    objc_destroyWeak(&v13);
    [(HNDMouseKeyDevice *)v2 canUseMainKeyboardKeysPreferenceDidChange];
    objc_destroyWeak(&location);
  }
  return v2;
}

- (BOOL)load
{
  self->super.super._isLoaded = 1;
  return 1;
}

- (void)unload
{
  [(HNDMouseKeyDevice *)self resetInternalState];
  v3.receiver = self;
  v3.super_class = (Class)HNDMouseKeyDevice;
  [(HNDDevice *)&v3 unload];
}

- (void)canUseMainKeyboardKeysPreferenceDidChange
{
  objc_super v3 = +[AXSettings sharedInstance];
  self->_canUseMainKeyboardKeys = [v3 assistiveTouchMouseKeysUseMainKeyboardKeys];

  [(HNDMouseKeyDevice *)self resetInternalState];
}

- (void)resetInternalState
{
  [(HNDMouseKeyDevice *)self invalidateTimers];
  activeDownMovementDirections = self->_activeDownMovementDirections;

  [(NSMutableArray *)activeDownMovementDirections removeAllObjects];
}

- (BOOL)secondaryButton
{
  return 0;
}

- (BOOL)tertiaryButton
{
  return 0;
}

- (BOOL)wheel
{
  return 0;
}

- (id)mouse
{
  return 0;
}

- (id)actionOverrideForUsagePage:(unsigned int)a3 usage:(unsigned int)a4
{
  return 0;
}

- (BOOL)mouseKeyActionIsMovement:(unint64_t)a3
{
  return (a3 > 0xC) | (0x1FEu >> a3) & 1;
}

- (unint64_t)mouseKeyActionForKeyCode:(unsigned __int16)a3
{
  if ((a3 - 88) < 0xC) {
    return qword_100197830[(__int16)(a3 - 88)];
  }
  if (!self->_canUseMainKeyboardKeys) {
    return 0;
  }
  if ((int)a3 <= 35)
  {
    switch(a3)
    {
      case 0xCu:
        unint64_t result = 9;
        break;
      case 0xDu:
        unint64_t result = 6;
        break;
      case 0xEu:
LABEL_9:
        unint64_t result = 7;
        break;
      case 0xFu:
        unint64_t result = 8;
        break;
      case 0x10u:
        unint64_t result = 10;
        break;
      case 0x12u:
LABEL_10:
        unint64_t result = 5;
        break;
      case 0x18u:
LABEL_11:
        unint64_t result = 4;
        break;
      default:
        return 0;
    }
  }
  else
  {
    switch(a3)
    {
      case 'O':
        goto LABEL_10;
      case 'P':
        goto LABEL_11;
      case 'Q':
        goto LABEL_9;
      case 'R':
        unint64_t result = 2;
        break;
      default:
        if (a3 != 55) {
          return 0;
        }
        unint64_t result = 11;
        break;
    }
  }
  return result;
}

- (BOOL)handleHIDEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 keyInfo];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = +[AXSettings sharedInstance];
    if ([v7 assistiveTouchMouseKeysEnabled] && _AXSAssistiveTouchEnabled())
    {
      BOOL IsSwitchControlRunning = UIAccessibilityIsSwitchControlRunning();

      if (!IsSwitchControlRunning)
      {
        v9 = ASTLogMouse();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          sub_100114B18(v4, v9);
        }

        uint64_t v10 = [v4 keyInfo];
        id v11 = [v10 keyCode];

        unint64_t v12 = [(HNDMouseKeyDevice *)self mouseKeyActionForKeyCode:v11];
        if ([v4 type] != 11)
        {
          if ([v4 type] == 10)
          {
            switch(v12)
            {
              case 9uLL:
              case 0xAuLL:
                id v17 = [objc_allocWithZone((Class)HNDEvent) init];
                int v18 = 1;
                [v17 setType:1];
                goto LABEL_25;
              case 0xBuLL:
                id v17 = [objc_allocWithZone((Class)HNDEvent) init];
                [v17 setType:2];
                int v18 = 1;
LABEL_25:
                [v17 setButtonNumber:1];
                v23 = [(HNDDevice *)self delegate];
                [v23 device:self didPostEvent:v17];

                break;
              case 0xCuLL:
                id v24 = [objc_allocWithZone((Class)HNDEvent) init];
                int v18 = 1;
                [v24 setType:1];
                [v24 setButtonNumber:2];
                [v24 setActionOverride:AXAssistiveTouchIconTypeOpenMenu];
                v25 = [(HNDDevice *)self delegate];
                [v25 device:self didPostEvent:v24];

                break;
              default:
                if (![(HNDMouseKeyDevice *)self mouseKeyActionIsMovement:v12]) {
                  goto LABEL_31;
                }
                v26 = +[NSNumber numberWithUnsignedInteger:v12];
                if ([(NSMutableArray *)self->_activeDownMovementDirections containsObject:v26])[(NSMutableArray *)self->_activeDownMovementDirections removeObject:v26]; {
                [(NSMutableArray *)self->_activeDownMovementDirections addObject:v26];
                }
                [(HNDMouseKeyDevice *)self startMovementHoldWithMouseKeyAction:v12];

                int v18 = 1;
                break;
            }
          }
          else
          {
LABEL_31:
            int v18 = 0;
          }
          goto LABEL_32;
        }
        if ([(HNDMouseKeyDevice *)self mouseKeyActionIsMovement:v12])
        {
          activeDownMovementDirections = self->_activeDownMovementDirections;
          v14 = +[NSNumber numberWithUnsignedInteger:v12];
          [(NSMutableArray *)activeDownMovementDirections removeObject:v14];

          if (![(HNDMouseKeyDevice *)self keyRepeatTimerIsRunning]) {
            [(HNDMouseKeyDevice *)self movePointerWithMouseKeyAction:v12];
          }
        }
        else
        {
          if (v12 != 12)
          {
            if (v12 == 9)
            {
              id v19 = [objc_allocWithZone((Class)HNDEvent) init];
              [v19 setType:2];
              int v18 = 1;
              [v19 setButtonNumber:1];
              v20 = [(HNDDevice *)self delegate];
              [v20 device:self didPostEvent:v19];
            }
            else
            {
              int v18 = 0;
            }
            goto LABEL_23;
          }
          id v21 = [objc_allocWithZone((Class)HNDEvent) init];
          [v21 setType:2];
          [v21 setButtonNumber:2];
          [v21 setActionOverride:AXAssistiveTouchIconTypeOpenMenu];
          v22 = [(HNDDevice *)self delegate];
          [v22 device:self didPostEvent:v21];
        }
        int v18 = 1;
LABEL_23:
        [(HNDMouseKeyDevice *)self reevaluateTimers];
LABEL_32:
        BOOL v15 = v18 != 0;
        goto LABEL_13;
      }
    }
    else
    {
    }
  }
  BOOL v15 = 0;
LABEL_13:

  return v15;
}

- (void)reevaluateTimers
{
  [(HNDMouseKeyDevice *)self invalidateTimers];
  objc_super v3 = [(NSMutableArray *)self->_activeDownMovementDirections lastObject];
  id v4 = [v3 unsignedIntegerValue];

  if ([(HNDMouseKeyDevice *)self mouseKeyActionIsMovement:v4])
  {
    [(HNDMouseKeyDevice *)self repeatMouseKeyMovementAction:v4];
  }
}

- (int64_t)mouseKeysMovementMultiplier
{
  v2 = +[AXSettings sharedInstance];
  objc_super v3 = (char *)[v2 assistiveTouchMouseKeysMaxSpeed] + 1;

  return (int64_t)v3;
}

- (double)mouseKeysMovementDelay
{
  v2 = +[AXSettings sharedInstance];
  double v3 = (double)(uint64_t)[v2 assistiveTouchMouseKeysDelay] * -0.1 + 0.405;

  return v3;
}

- (double)mouseKeysRepeatDelay
{
  return 0.017;
}

- (void)movePointerWithMouseKeyAction:(unint64_t)a3
{
}

- (void)movePointerWithMouseKeyAction:(unint64_t)a3 increment:(double)a4
{
  double v7 = 0.0;
  double v8 = 1.0;
  switch(a3)
  {
    case 1uLL:
      double v8 = -1.0;
      goto LABEL_6;
    case 2uLL:
      double v8 = -1.0;
      goto LABEL_9;
    case 3uLL:
      double v8 = -1.0;
      goto LABEL_8;
    case 4uLL:
      double v8 = 0.0;
      goto LABEL_6;
    case 5uLL:
      double v8 = 0.0;
      goto LABEL_8;
    case 6uLL:
LABEL_6:
      double v7 = -1.0 - a4;
      goto LABEL_9;
    case 7uLL:
      goto LABEL_9;
    case 8uLL:
LABEL_8:
      double v7 = a4 + 1.0;
LABEL_9:
      double v9 = v7 * (double)[(HNDMouseKeyDevice *)self mouseKeysMovementMultiplier];
      double v10 = v8 - a4;
      if (v8 > 0.0) {
        double v10 = v8 + a4;
      }
      if (v8 == 0.0) {
        double v11 = v8;
      }
      else {
        double v11 = v10;
      }
      double v12 = v11 * (double)[(HNDMouseKeyDevice *)self mouseKeysMovementMultiplier];
      id v14 = [objc_allocWithZone((Class)HNDEvent) init];
      [v14 setType:3];
      [v14 setDeltaX:v9];
      [v14 setDeltaY:v12];
      id v13 = [(HNDDevice *)self delegate];
      [v13 device:self didPostEvent:v14];

      break;
    default:
      return;
  }
}

- (void)startMovementHoldWithMouseKeyAction:(unint64_t)a3
{
  [(HNDMouseKeyDevice *)self invalidateTimers];
  [(HNDMouseKeyDevice *)self movePointerWithMouseKeyAction:a3];
  objc_initWeak(&location, self);
  initialDelayTimer = self->_initialDelayTimer;
  [(HNDMouseKeyDevice *)self mouseKeysMovementDelay];
  double v7 = v6;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000628C4;
  v8[3] = &unk_1001ACAB0;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  [(AXDispatchTimer *)initialDelayTimer afterDelay:v8 processBlock:v7];
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)repeatMouseKeyMovementAction:(unint64_t)a3
{
  [(HNDMouseKeyDevice *)self invalidateTimers];
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  objc_initWeak(&location, self);
  [(HNDMouseKeyDevice *)self mouseKeysRepeatDelay];
  double v6 = v5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  id v9[2] = sub_100062A60;
  v9[3] = &unk_1001ACAD8;
  v9[4] = v12;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  double v7 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v9 block:v6];
  repeatTimer = self->_repeatTimer;
  self->_repeatTimer = v7;

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  _Block_object_dispose(v12, 8);
}

- (BOOL)keyRepeatTimerIsRunning
{
  repeatTimer = self->_repeatTimer;
  if (repeatTimer) {
    LOBYTE(repeatTimer) = [(NSTimer *)repeatTimer isValid];
  }
  return (char)repeatTimer;
}

- (void)invalidateTimers
{
  [(AXDispatchTimer *)self->_initialDelayTimer cancel];
  [(NSTimer *)self->_repeatTimer invalidate];
  repeatTimer = self->_repeatTimer;
  self->_repeatTimer = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDownMovementDirections, 0);
  objc_storeStrong((id *)&self->_repeatTimer, 0);

  objc_storeStrong((id *)&self->_initialDelayTimer, 0);
}

@end