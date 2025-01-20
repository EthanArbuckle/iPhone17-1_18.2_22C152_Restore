@interface HNDGamePadDevice
- (BOOL)_astGameControllerEnabled;
- (BOOL)isCurrentlyTappingAndHolding;
- (BOOL)isIgnoringInputs;
- (CADisplayLink)displayLink;
- (GCController)currentGameController;
- (HNDGamePadDevice)init;
- (float)currentLeftXDisplacement;
- (float)currentLeftYDisplacement;
- (float)currentRightXDisplacement;
- (float)currentRightYDisplacement;
- (float)currentXDisplacement;
- (float)currentYDisplacement;
- (void)_controllerConnected:(id)a3;
- (void)_controllerDidBecomeCurrent:(id)a3;
- (void)_sendEventForButtonNumber:(unint64_t)a3 value:(BOOL)a4;
- (void)_sendEventForCurrentDisplacement:(id)a3;
- (void)_setupCurrentController;
- (void)_toggleIgnoreInputs;
- (void)dealloc;
- (void)handleReportCallback:(int)a3 report:(char *)a4 reportLength:(int64_t)a5;
- (void)handleValueCallback:(__IOHIDValue *)a3;
- (void)setCurrentGameController:(id)a3;
- (void)setCurrentLeftXDisplacement:(float)a3;
- (void)setCurrentLeftYDisplacement:(float)a3;
- (void)setCurrentRightXDisplacement:(float)a3;
- (void)setCurrentRightYDisplacement:(float)a3;
- (void)setCurrentXDisplacement:(float)a3;
- (void)setCurrentYDisplacement:(float)a3;
- (void)setCurrentlyTappingAndHolding:(BOOL)a3;
- (void)setDisplayLink:(id)a3;
- (void)setIgnoringInputs:(BOOL)a3;
@end

@implementation HNDGamePadDevice

- (HNDGamePadDevice)init
{
  v19.receiver = self;
  v19.super_class = (Class)HNDGamePadDevice;
  v2 = [(HNDGamePadDevice *)&v19 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    v4 = (void *)qword_1001F0A98;
    uint64_t v28 = qword_1001F0A98;
    if (!qword_1001F0A98)
    {
      v20 = _NSConcreteStackBlock;
      uint64_t v21 = 3221225472;
      v22 = sub_100064C2C;
      v23 = &unk_1001AC038;
      v24 = &v25;
      v5 = (void *)sub_100064C7C();
      v6 = dlsym(v5, "GCControllerDidConnectNotification");
      *(void *)(v24[1] + 24) = v6;
      qword_1001F0A98 = *(void *)(v24[1] + 24);
      v4 = (void *)v26[3];
    }
    _Block_object_dispose(&v25, 8);
    if (!v4) {
      sub_100114BB0();
    }
    [v3 addObserver:v2 selector:"_controllerConnected:" name:*v4 object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    v8 = (void *)qword_1001F0AA8;
    uint64_t v28 = qword_1001F0AA8;
    if (!qword_1001F0AA8)
    {
      v20 = _NSConcreteStackBlock;
      uint64_t v21 = 3221225472;
      v22 = sub_100064DE8;
      v23 = &unk_1001AC038;
      v24 = &v25;
      v9 = (void *)sub_100064C7C();
      v10 = dlsym(v9, "GCControllerDidBecomeCurrentNotification");
      *(void *)(v24[1] + 24) = v10;
      qword_1001F0AA8 = *(void *)(v24[1] + 24);
      v8 = (void *)v26[3];
    }
    _Block_object_dispose(&v25, 8);
    if (!v8) {
      sub_100114C28();
    }
    [v7 addObserver:v2 selector:"_controllerDidBecomeCurrent:" name:*v8 object:0];

    v11 = [sub_100063B10() current];
    currentGameController = v2->_currentGameController;
    v2->_currentGameController = v11;
    v13 = v11;

    [(HNDGamePadDevice *)v2 _setupCurrentController];
    uint64_t v14 = +[CADisplayLink displayLinkWithTarget:v2 selector:"_sendEventForCurrentDisplacement:"];
    displayLink = v2->_displayLink;
    v2->_displayLink = (CADisplayLink *)v14;

    CAFrameRateRange v29 = CAFrameRateRangeMake(5.0, 30.0, 30.0);
    -[CADisplayLink setPreferredFrameRateRange:](v2->_displayLink, "setPreferredFrameRateRange:", *(double *)&v29.minimum, *(double *)&v29.maximum, *(double *)&v29.preferred);
    v16 = v2->_displayLink;
    v17 = +[NSRunLoop currentRunLoop];
    [(CADisplayLink *)v16 addToRunLoop:v17 forMode:NSRunLoopCommonModes];
  }
  return v2;
}

- (void)setCurrentGameController:(id)a3
{
  objc_storeStrong((id *)&self->_currentGameController, a3);

  [(HNDGamePadDevice *)self _setupCurrentController];
}

- (void)_sendEventForCurrentDisplacement:(id)a3
{
  [(HNDGamePadDevice *)self currentLeftXDisplacement];
  float v5 = v4;
  [(HNDGamePadDevice *)self currentLeftYDisplacement];
  float v7 = v6;
  [(HNDGamePadDevice *)self currentRightXDisplacement];
  float v9 = v8;
  [(HNDGamePadDevice *)self currentRightYDisplacement];
  float v11 = -v10;
  BOOL v12 = fabsf(v5) > 0.1;
  int v13 = fabsf(v7) > 0.1 || v12;
  if (v13) {
    double v14 = 5.0;
  }
  else {
    double v14 = 0.8;
  }
  if (((v13 & 1) != 0 || fabsf(v9) > 0.1 || fabsf(v11) > 0.1)
    && ![(HNDGamePadDevice *)self isIgnoringInputs])
  {
    if (v13) {
      float v18 = v5;
    }
    else {
      float v18 = v9;
    }
    double v19 = v14 * v18;
    *(float *)&double v19 = v19;
    if (v13) {
      float v20 = -v7;
    }
    else {
      float v20 = v11;
    }
    *(float *)&double v15 = -v7;
    -[HNDGamePadDevice setCurrentXDisplacement:](self, "setCurrentXDisplacement:", v19, v15);
    double v17 = v14 * v20;
    float v16 = v17;
  }
  else
  {
    float v16 = 0.0;
    [(HNDGamePadDevice *)self setCurrentXDisplacement:0.0];
  }
  *(float *)&double v17 = v16;
  [(HNDGamePadDevice *)self setCurrentYDisplacement:v17];
  [(HNDGamePadDevice *)self currentXDisplacement];
  if (v21 != 0.0 || ([(HNDGamePadDevice *)self currentYDisplacement], v22 != 0.0))
  {
    id v26 = [objc_allocWithZone((Class)HNDEvent) init];
    [v26 setType:3];
    [(HNDGamePadDevice *)self currentXDisplacement];
    [v26 setDeltaX:v23];
    [(HNDGamePadDevice *)self currentYDisplacement];
    [v26 setDeltaY:v24];
    [v26 setIsGamepadEvent:1];
    uint64_t v25 = [(HNDDevice *)self delegate];
    [v25 device:self didPostEvent:v26];
  }
}

- (void)_sendEventForButtonNumber:(unint64_t)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(HNDGamePadDevice *)self isIgnoringInputs])
  {
    if (v4) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    if (a3 == 4 && v4)
    {
      [(HNDGamePadDevice *)self setCurrentlyTappingAndHolding:[(HNDGamePadDevice *)self isCurrentlyTappingAndHolding] ^ 1];
      id v13 = (id)objc_opt_new();
      if ([(HNDGamePadDevice *)self isCurrentlyTappingAndHolding]) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = 2;
      }
      [v13 setType:v8];
      [v13 setButtonNumber:1];
      float v9 = self;
      unint64_t v10 = 1;
    }
    else
    {
      if (a3 == 4) {
        return;
      }
      id v13 = (id)objc_opt_new();
      [v13 setType:v7];
      [v13 setButtonNumber:a3];
      float v9 = self;
      unint64_t v10 = a3;
    }
    float v11 = [(HNDDevice *)v9 actionOverrideForUsagePage:0 usage:v10];
    [v13 setActionOverride:v11];

    [v13 setIsGamepadEvent:1];
    BOOL v12 = [(HNDDevice *)self delegate];
    [v12 device:self didPostEvent:v13];
  }
}

- (void)_setupCurrentController
{
  LOBYTE(location[0]) = 0;
  sub_100063B10();
  v3 = [(HNDGamePadDevice *)self currentGameController];
  BOOL v4 = __UIAccessibilityCastAsClass();

  objc_initWeak(location, self);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10006440C;
  v31[3] = &unk_1001ACB28;
  objc_copyWeak(&v32, location);
  float v5 = [v4 extendedGamepad];
  float v6 = [v5 buttonA];
  [v6 setValueChangedHandler:v31];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100064460;
  v29[3] = &unk_1001ACB28;
  objc_copyWeak(&v30, location);
  uint64_t v7 = [v4 extendedGamepad];
  uint64_t v8 = [v7 buttonB];
  [v8 setValueChangedHandler:v29];

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000644B4;
  v27[3] = &unk_1001ACB28;
  objc_copyWeak(&v28, location);
  float v9 = [v4 extendedGamepad];
  unint64_t v10 = [v9 buttonX];
  [v10 setValueChangedHandler:v27];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100064508;
  v25[3] = &unk_1001ACB28;
  objc_copyWeak(&v26, location);
  float v11 = [v4 extendedGamepad];
  BOOL v12 = [v11 buttonY];
  [v12 setValueChangedHandler:v25];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10006455C;
  v23[3] = &unk_1001ACB50;
  objc_copyWeak(&v24, location);
  id v13 = [v4 extendedGamepad];
  double v14 = [v13 leftThumbstick];
  [v14 setValueChangedHandler:v23];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000645D4;
  v21[3] = &unk_1001ACB50;
  objc_copyWeak(&v22, location);
  double v15 = [v4 extendedGamepad];
  float v16 = [v15 rightThumbstick];
  [v16 setValueChangedHandler:v21];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10006464C;
  v19[3] = &unk_1001ACB28;
  objc_copyWeak(&v20, location);
  double v17 = [v4 extendedGamepad];
  float v18 = [v17 buttonMenu];
  [v18 setValueChangedHandler:v19];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(location);
}

- (void)_controllerConnected:(id)a3
{
  id v4 = a3;
  sub_100063B10();
  float v5 = [v4 object];
  float v6 = __UIAccessibilityCastAsClass();

  [(HNDGamePadDevice *)self setCurrentGameController:v6];
}

- (void)_controllerDidBecomeCurrent:(id)a3
{
  id v4 = a3;
  sub_100063B10();
  float v5 = [v4 object];
  float v6 = __UIAccessibilityCastAsClass();

  [(HNDGamePadDevice *)self setCurrentGameController:v6];
}

- (BOOL)_astGameControllerEnabled
{
  v2 = +[AXSettings sharedInstance];
  if ([v2 assistiveTouchGameControllerEnabled]
    && _AXSAssistiveTouchEnabled())
  {
    BOOL v3 = !UIAccessibilityIsSwitchControlRunning();
  }
  else
  {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (void)handleReportCallback:(int)a3 report:(char *)a4 reportLength:(int64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  if (![(HNDGamePadDevice *)self _astGameControllerEnabled])
  {
    v9.receiver = self;
    v9.super_class = (Class)HNDGamePadDevice;
    [(HNDDevice *)&v9 handleReportCallback:v7 report:a4 reportLength:a5];
  }
}

- (void)handleValueCallback:(__IOHIDValue *)a3
{
  if (![(HNDGamePadDevice *)self _astGameControllerEnabled])
  {
    v5.receiver = self;
    v5.super_class = (Class)HNDGamePadDevice;
    [(HNDDevice *)&v5 handleValueCallback:a3];
  }
}

- (void)_toggleIgnoreInputs
{
  unsigned int v3 = [(HNDGamePadDevice *)self isIgnoringInputs];
  [(HNDGamePadDevice *)self setIgnoringInputs:v3 ^ 1];
  if (v3) {
    id v4 = @"GAME_MODE_DISABLED";
  }
  else {
    id v4 = @"GAME_MODE_ENABLED";
  }
  sub_100040EC8(v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v5 = +[HNDHandManager sharedManager];
  float v6 = [v5 currentDisplayManager];
  uint64_t v7 = [v6 rocker];
  [v7 showBannerWithText:v8];
}

- (void)setCurrentlyTappingAndHolding:(BOOL)a3
{
  if (self->_currentlyTappingAndHolding != a3)
  {
    self->_currentlyTappingAndHolding = a3;
    if (a3) {
      unsigned int v3 = @"TAP_AND_HOLD_ENABLED";
    }
    else {
      unsigned int v3 = @"TAP_AND_HOLD_DISABLED";
    }
    sub_100040EC8(v3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = +[HNDHandManager sharedManager];
    objc_super v5 = [v4 currentDisplayManager];
    float v6 = [v5 rocker];
    [v6 showBannerWithText:v7];
  }
}

- (void)dealloc
{
  [(CADisplayLink *)self->_displayLink invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HNDGamePadDevice;
  [(HNDDevice *)&v3 dealloc];
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (float)currentLeftXDisplacement
{
  return self->_currentLeftXDisplacement;
}

- (void)setCurrentLeftXDisplacement:(float)a3
{
  self->_currentLeftXDisplacement = a3;
}

- (float)currentLeftYDisplacement
{
  return self->_currentLeftYDisplacement;
}

- (void)setCurrentLeftYDisplacement:(float)a3
{
  self->_currentLeftYDisplacement = a3;
}

- (float)currentRightXDisplacement
{
  return self->_currentRightXDisplacement;
}

- (void)setCurrentRightXDisplacement:(float)a3
{
  self->_currentRightXDisplacement = a3;
}

- (float)currentRightYDisplacement
{
  return self->_currentRightYDisplacement;
}

- (void)setCurrentRightYDisplacement:(float)a3
{
  self->_currentRightYDisplacement = a3;
}

- (float)currentXDisplacement
{
  return self->_currentXDisplacement;
}

- (void)setCurrentXDisplacement:(float)a3
{
  self->_currentXDisplacement = a3;
}

- (float)currentYDisplacement
{
  return self->_currentYDisplacement;
}

- (void)setCurrentYDisplacement:(float)a3
{
  self->_currentYDisplacement = a3;
}

- (BOOL)isCurrentlyTappingAndHolding
{
  return self->_currentlyTappingAndHolding;
}

- (BOOL)isIgnoringInputs
{
  return self->_ignoringInputs;
}

- (void)setIgnoringInputs:(BOOL)a3
{
  self->_ignoringInputs = a3;
}

- (GCController)currentGameController
{
  return self->_currentGameController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentGameController, 0);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end