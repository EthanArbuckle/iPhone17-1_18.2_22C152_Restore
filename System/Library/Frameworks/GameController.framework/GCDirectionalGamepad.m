@interface GCDirectionalGamepad
- (BOOL)allowsRotation;
- (BOOL)calculateRelativePositionWithDigitizerX:(float)a3 digitizerY:(float)a4 touchDown:(BOOL)a5;
- (BOOL)determineTouchStateWithDigitizerX:(float)a3 digitizerY:(float)a4 touchDown:(BOOL)a5;
- (BOOL)ownershipClaimingElementsZero;
- (BOOL)reportsAbsoluteDpadValues;
- (CGPoint)addCGPoint:(CGPoint)a3 toPoint:(CGPoint)a4;
- (CGPoint)clampPoint:(CGPoint)a3 toLength:(double)a4;
- (CGPoint)mulCGPoint:(CGPoint)a3 byScalar:(double)a4;
- (CGPoint)normalizeCGPoint:(CGPoint)a3;
- (CGPoint)scaleCGPoint:(CGPoint)a3 toLength:(double)a4;
- (CGPoint)subCGPoint:(CGPoint)a3 fromPoint:(CGPoint)a4;
- (GCDirectionalGamepad)initWithIdentifier:(id)a3;
- (double)distanceBetweenCGPoint:(CGPoint)a3 andCGPoint:(CGPoint)a4;
- (double)magnitudeForCGPoint:(CGPoint)a3;
- (id)centerButtonEvent:(id)a3 pressed:(BOOL)a4;
- (id)dpadDirectionEvent:(id)a3 direction:(unint64_t)a4 pressed:(BOOL)a5;
- (id)productCategory;
- (int64_t)deviceType;
- (unint64_t)owner;
- (void)digitizerTouchEvent:(id)a3 x:(double)a4 y:(double)a5 timestamp:(unint64_t)a6 forceSkipDpadRotation:(BOOL)a7;
- (void)digitizerTouchUp:(id)a3 timestamp:(unint64_t)a4 forceSkipDpadRotation:(BOOL)a5;
- (void)reportDigitizerChange:(id)a3;
- (void)reportDirectionpadChange:(id)a3 onQueue:(id)a4;
- (void)setDeviceType:(int64_t)a3;
- (void)setDpad:(id)a3 digitizerX:(double)a4 digitizerY:(double)a5 touchDown:(BOOL)a6;
- (void)setOwner:(unint64_t)a3;
- (void)setReportsAbsoluteDpadValues:(BOOL)a3;
@end

@implementation GCDirectionalGamepad

- (GCDirectionalGamepad)initWithIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GCDirectionalGamepad;
  result = [(GCMicroGamepad *)&v4 initWithIdentifier:a3];
  if (result)
  {
    result->_touchState = 0;
    result->_touchpadRelativeWindowSize = 0.5;
    result->_touchpadRelativeOriginBufferSize = 0.225;
    result->_previousButtonState = 0.0;
  }
  return result;
}

- (id)productCategory
{
  if (!GCCurrentProcessLinkedOnAfter(0x7E50901FFFFFFFFuLL))
  {
    v5 = @"Siri Remote";
    goto LABEL_9;
  }
  int64_t v3 = [(GCDirectionalGamepad *)self deviceType];
  if (v3 == 6)
  {
    objc_super v4 = (id *)&GCProductCategorySiriRemote2ndGen;
    goto LABEL_7;
  }
  if (v3 == 5)
  {
    objc_super v4 = (id *)&GCProductCategoryUniversalElectronicsRemote;
LABEL_7:
    v5 = (__CFString *)*v4;
    goto LABEL_9;
  }
  v7.receiver = self;
  v7.super_class = (Class)GCDirectionalGamepad;
  v5 = [(GCMicroGamepad *)&v7 productCategory];
LABEL_9:

  return v5;
}

- (BOOL)allowsRotation
{
  return 0;
}

- (void)setReportsAbsoluteDpadValues:(BOOL)a3
{
  v5 = [(GCMicroGamepad *)self dpad];
  char v6 = [v5 nonAnalog];

  if ((v6 & 1) == 0) {
    self->_reportsAbsoluteDpadValues = a3;
  }
}

- (BOOL)reportsAbsoluteDpadValues
{
  return self->_reportsAbsoluteDpadValues;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  if (gc_isInternalBuild())
  {
    v21 = getGCLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v38 = self;
      __int16 v39 = 2048;
      *(void *)v40 = a3;
      _os_log_impl(&dword_220998000, v21, OS_LOG_TYPE_DEFAULT, "Setting %@ device type to %ld", buf, 0x16u);
    }
  }
  v5 = [(GCMicroGamepad *)self dpad];
  [v5 setNonAnalog:0];

  if ((unint64_t)(a3 - 3) >= 2)
  {
    if (a3 == 5)
    {
      v9 = [(GCMicroGamepad *)self dpad];
      [v9 setNonAnalog:1];

      v10 = [(GCPhysicalInputProfile *)self controller];
      [v10 setForwarded:0];
    }
    else if (a3 != 6)
    {
LABEL_13:
      char v6 = [(GCPhysicalInputProfile *)self controller];
      objc_super v7 = v6;
      uint64_t v8 = 0;
      goto LABEL_14;
    }
    if (!self->_cardinalDpad)
    {
      int v11 = GCCurrentProcessLinkedOnAfter(0x7E50301FFFFFFFFuLL);
      int v12 = GCCurrentProcessLinkedOnAfter(0x7E50901FFFFFFFFuLL);
      self->_BOOL treatOnlyCenterRingAsButtonA = v11 & (v12 ^ 1);
      if (gc_isInternalBuild())
      {
        int v25 = v12;
        v22 = getGCLogger();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          BOOL treatOnlyCenterRingAsButtonA = self->_treatOnlyCenterRingAsButtonA;
          *(_DWORD *)buf = 138412802;
          if (treatOnlyCenterRingAsButtonA) {
            v24 = @"YES";
          }
          else {
            v24 = @"NO";
          }
          v38 = (GCDirectionalGamepad *)v24;
          __int16 v39 = 1024;
          *(_DWORD *)v40 = v11;
          *(_WORD *)&v40[4] = 1024;
          *(_DWORD *)&v40[6] = v25;
          _os_log_impl(&dword_220998000, v22, OS_LOG_TYPE_INFO, "GCDirectionalGamepad - treatOnlyCenterRingAsButtonA? %@ (14.5 ? %d, 15.0 ? %d)", buf, 0x18u);
        }
      }
      if (!self->_treatOnlyCenterRingAsButtonA)
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v36 = 0u;
        long long v35 = 0u;
        v32 = @"Button Center";
        LOWORD(v33) = 257;
        *(void *)&long long v36 = @"DIRECTIONAL_GAMEPAD_BUTTON_CENTER";
        v13 = [(GCPhysicalInputProfile *)self _buttonWithInfo:&v32];
        centerButton = self->_centerButton;
        self->_centerButton = v13;
      }
      long long v27 = 0u;
      uint64_t v31 = 0;
      long long v29 = 0u;
      long long v28 = 0u;
      v26 = @"Cardinal Direction Pad";
      LOWORD(v27) = 1;
      v30 = @"DIRECTIONAL_GAMEPAD_CARDINAL_DIRECTION_PAD";
      v15 = [(GCPhysicalInputProfile *)self _directionPadWithInfo:&v26];
      cardinalDpad = self->_cardinalDpad;
      self->_cardinalDpad = v15;

      v17 = [(GCMicroGamepad *)self buttonMenu];
      [v17 setUnmappedNameLocalizationKey:@"DIRECTIONAL_GAMEPAD_BUTTON_MENU"];

      v18 = _GCFConvertStringToLocalizedString();
      v19 = [(GCMicroGamepad *)self buttonMenu];
      [v19 setLocalizedName:v18];
    }
    goto LABEL_13;
  }
  char v6 = [(GCPhysicalInputProfile *)self controller];
  objc_super v7 = v6;
  uint64_t v8 = 1;
LABEL_14:
  [v6 setForwarded:v8];

  self->_deviceType = a3;
  v20 = [(GCPhysicalInputProfile *)self controller];
  [v20 setVendorName:0];
}

- (BOOL)calculateRelativePositionWithDigitizerX:(float)a3 digitizerY:(float)a4 touchDown:(BOOL)a5
{
  double v6 = a3;
  double v7 = a4;
  p_absoluteWindowLocation = &self->_absoluteWindowLocation;
  -[GCDirectionalGamepad distanceBetweenCGPoint:andCGPoint:](self, "distanceBetweenCGPoint:andCGPoint:", a5, a3, a4, self->_absoluteWindowLocation.x, self->_absoluteWindowLocation.y);
  float touchpadRelativeWindowSize = self->_touchpadRelativeWindowSize;
  if (v10 >= (float)(self->_touchpadRelativeOriginBufferSize * touchpadRelativeWindowSize)
    || self->_reportsAbsoluteDpadValues)
  {
    BOOL leftBufferZone = 1;
    self->_BOOL leftBufferZone = 1;
    self->_absolutePosition.x = v6;
    self->_absolutePosition.y = v7;
    -[GCDirectionalGamepad mulCGPoint:byScalar:](self, "mulCGPoint:byScalar:", v6 - p_absoluteWindowLocation->x, v7 - p_absoluteWindowLocation->y, 1.0 / touchpadRelativeWindowSize);
    double v13 = v12;
    double v15 = v14;
    -[GCDirectionalGamepad normalizeCGPoint:](self, "normalizeCGPoint:");
    double v17 = v16;
    double v19 = v18;
    -[GCDirectionalGamepad scaleCGPoint:toLength:](self, "scaleCGPoint:toLength:");
    -[GCDirectionalGamepad addCGPoint:toPoint:](self, "addCGPoint:toPoint:");
    p_relativePosition = &self->_relativePosition;
    CGFloat v23 = self->_absolutePosition.y - v22;
    self->_relativePosition.x = self->_absolutePosition.x - v20;
    self->_relativePosition.y = v23;
    -[GCDirectionalGamepad mulCGPoint:byScalar:](self, "mulCGPoint:byScalar:");
    self->_relativePosition.x = v24;
    self->_relativePosition.y = v25;
    -[GCDirectionalGamepad magnitudeForCGPoint:](self, "magnitudeForCGPoint:", v13, v15);
    if (v26 > 1.0)
    {
      double v27 = 1.0 - self->_touchpadRelativeWindowSize;
      -[GCDirectionalGamepad subCGPoint:fromPoint:](self, "subCGPoint:fromPoint:", v17, v19, v13, v15);
      -[GCDirectionalGamepad addCGPoint:toPoint:](self, "addCGPoint:toPoint:", p_absoluteWindowLocation->x, p_absoluteWindowLocation->y, v28, v29);
      p_absoluteWindowLocation->x = v30;
      p_absoluteWindowLocation->y = v31;
      if (self->_beganTouchOutsideBounds)
      {
        -[GCDirectionalGamepad magnitudeForCGPoint:](self, "magnitudeForCGPoint:");
        if (v32 <= v27) {
          self->_beganTouchOutsideBounds = 0;
        }
      }
      else
      {
        -[GCDirectionalGamepad clampPoint:toLength:](self, "clampPoint:toLength:");
        p_absoluteWindowLocation->x = v33;
        p_absoluteWindowLocation->y = v34;
      }
      -[GCDirectionalGamepad scaleCGPoint:toLength:](self, "scaleCGPoint:toLength:", p_relativePosition->x, self->_relativePosition.y, 1.0);
      p_relativePosition->x = v35;
      self->_relativePosition.y = v36;
      return 1;
    }
  }
  else
  {
    self->_absolutePosition = *p_absoluteWindowLocation;
    self->_relativePosition = CGPointZero;
    if (self->_touchState) {
      BOOL leftBufferZone = self->_leftBufferZone;
    }
    else {
      BOOL leftBufferZone = 1;
    }
    self->_BOOL leftBufferZone = 0;
  }
  return leftBufferZone;
}

- (void)reportDigitizerChange:(id)a3
{
  id v4 = a3;
  v5 = &OBJC_IVAR___GCDirectionalGamepad__absolutePosition;
  if (!self->_reportsAbsoluteDpadValues) {
    v5 = &OBJC_IVAR___GCDirectionalGamepad__relativePosition;
  }
  int64_t touchState = self->_touchState;
  if (!touchState)
  {
    id v27 = v4;
    double v22 = [(GCMicroGamepad *)self dpad];
    double v13 = [(GCPhysicalInputProfile *)self controller];
    double v14 = [v13 handlerQueue];
    id v15 = v22;
    CGFloat v23 = [v15 xAxis];
    char v24 = [v23 _setValue:v14 queue:0.0];

    CGFloat v25 = [v15 yAxis];
    int v26 = [v25 _setValue:v14 queue:0.0];

    if ((v24 & 1) == 0 && !v26) {
      goto LABEL_12;
    }
LABEL_11:
    [0 addObject:v15];
LABEL_12:

    id v4 = v27;
    goto LABEL_13;
  }
  double v7 = (double *)((char *)self + *v5);
  double v8 = *v7;
  double v9 = v7[1];
  if (touchState == 2 || touchState == 1)
  {
    id v27 = v4;
    double v10 = [(GCMicroGamepad *)self dpad];
    double v13 = [(GCPhysicalInputProfile *)self controller];
    double v14 = [v13 handlerQueue];
    id v15 = v10;
    double v16 = [v15 xAxis];
    float v11 = v8;
    *(float *)&double v17 = v11;
    char v18 = [v16 _setValue:v14 queue:v17];

    double v19 = [v15 yAxis];
    float v12 = v9;
    *(float *)&double v20 = v12;
    char v21 = [v19 _setValue:v14 queue:v20];

    if ((v18 & 1) == 0 && (v21 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_13:
}

- (void)reportDirectionpadChange:(id)a3 onQueue:(id)a4
{
  id v17 = a3;
  float v6 = -1.0;
  if ((self->_directionPadButtonsState & 8) != 0) {
    float v7 = -1.0;
  }
  else {
    float v7 = 0.0;
  }
  if (self->_directionPadButtonsState) {
    float v8 = 1.0;
  }
  else {
    float v8 = v7;
  }
  if ((self->_directionPadButtonsState & 4) == 0) {
    float v6 = 0.0;
  }
  if ((self->_directionPadButtonsState & 2) != 0) {
    float v9 = 1.0;
  }
  else {
    float v9 = v6;
  }
  id v10 = a4;
  float v11 = [v17 xAxis];
  *(float *)&double v12 = v9;
  char v13 = [v11 _setValue:v10 queue:v12];

  double v14 = [v17 yAxis];
  *(float *)&double v15 = v8;
  int v16 = [v14 _setValue:v10 queue:v15];

  if ((v13 & 1) != 0 || v16) {
    [0 addObject:v17];
  }
}

- (BOOL)determineTouchStateWithDigitizerX:(float)a3 digitizerY:(float)a4 touchDown:(BOOL)a5
{
  int64_t touchState = self->_touchState;
  if (touchState) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = a5;
  }
  BOOL v7 = touchState == 1 && a5;
  if (v6 || v7 || (int64_t v8 = self->_touchState, !a5))
  {
    BOOL v9 = !v7;
    uint64_t v10 = 1;
    if (!v9) {
      uint64_t v10 = 2;
    }
    if (a5) {
      int64_t v8 = v10;
    }
    else {
      int64_t v8 = 0;
    }
    self->_int64_t touchState = v8;
  }
  if (touchState) {
    LOBYTE(v11) = 0;
  }
  else {
    BOOL v11 = !a5;
  }
  return !v11 && (v8 != 2 || self->_absolutePosition.x != a3 || self->_absolutePosition.y != a4);
}

- (void)setDpad:(id)a3 digitizerX:(double)a4 digitizerY:(double)a5 touchDown:(BOOL)a6
{
  BOOL v6 = a6;
  double v7 = a5;
  double v8 = a4;
  float v10 = a4;
  float v11 = a5;
  *(float *)&a4 = v10;
  *(float *)&a5 = v11;
  if ([(GCDirectionalGamepad *)self determineTouchStateWithDigitizerX:a6 digitizerY:a4 touchDown:a5])
  {
    if (self->_touchState == 1)
    {
      self->_absoluteTouchDownPosition.x = v8;
      self->_absoluteTouchDownPosition.y = v7;
      self->_absoluteWindowLocation = self->_absoluteTouchDownPosition;
      self->_absolutePosition.x = v8;
      self->_absolutePosition.y = v7;
      self->_relativePosition = CGPointZero;
      self->_BOOL leftBufferZone = 0;
      double v14 = 1.0 - self->_touchpadRelativeWindowSize;
      -[GCDirectionalGamepad magnitudeForCGPoint:](self, "magnitudeForCGPoint:", self->_absoluteWindowLocation.x, self->_absoluteWindowLocation.y);
      if (v15 > v14) {
        self->_beganTouchOutsideBounds = 1;
      }
    }
    else
    {
      *(float *)&double v12 = v10;
      *(float *)&double v13 = v11;
      if (![(GCDirectionalGamepad *)self calculateRelativePositionWithDigitizerX:v6 digitizerY:v12 touchDown:v13])return; {
    }
      }
    id v17 = [(GCPhysicalInputProfile *)self controller];
    int v16 = [v17 handlerQueue];
    [(GCDirectionalGamepad *)self reportDigitizerChange:v16];
  }
}

- (double)magnitudeForCGPoint:(CGPoint)a3
{
  return sqrt(a3.y * a3.y + a3.x * a3.x);
}

- (double)distanceBetweenCGPoint:(CGPoint)a3 andCGPoint:(CGPoint)a4
{
  return sqrt((a4.y - a3.y) * (a4.y - a3.y) + (a4.x - a3.x) * (a4.x - a3.x));
}

- (CGPoint)normalizeCGPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[GCDirectionalGamepad magnitudeForCGPoint:](self, "magnitudeForCGPoint:");
  double v6 = y / v5;
  double v7 = x / v5;
  result.double y = v6;
  result.double x = v7;
  return result;
}

- (CGPoint)scaleCGPoint:(CGPoint)a3 toLength:(double)a4
{
  -[GCDirectionalGamepad normalizeCGPoint:](self, "normalizeCGPoint:", a3.x, a3.y);
  double v6 = v5 * a4;
  double v8 = v7 * a4;
  result.double y = v8;
  result.double x = v6;
  return result;
}

- (CGPoint)addCGPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  double v4 = a3.x + a4.x;
  double v5 = a3.y + a4.y;
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)subCGPoint:(CGPoint)a3 fromPoint:(CGPoint)a4
{
  double v4 = a4.x - a3.x;
  double v5 = a4.y - a3.y;
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)mulCGPoint:(CGPoint)a3 byScalar:(double)a4
{
  double v4 = a3.x * a4;
  double v5 = a3.y * a4;
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)clampPoint:(CGPoint)a3 toLength:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  -[GCDirectionalGamepad magnitudeForCGPoint:](self, "magnitudeForCGPoint:");
  if (v7 > a4)
  {
    double x = x / v7 * a4;
    double y = y / v7 * a4;
  }
  double v8 = x;
  double v9 = y;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (unint64_t)owner
{
  return self->_owner;
}

- (void)setOwner:(unint64_t)a3
{
  self->_owner = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerButton, 0);

  objc_storeStrong((id *)&self->_cardinalDpad, 0);
}

- (BOOL)ownershipClaimingElementsZero
{
  int64_t v3 = [(GCMicroGamepad *)self buttonA];
  [v3 value];
  if (v4 == 0.0)
  {
    double v5 = [(GCMicroGamepad *)self buttonX];
    [v5 value];
    if (v6 == 0.0)
    {
      double v7 = [(GCMicroGamepad *)self dpad];
      double v8 = [v7 xAxis];
      [v8 value];
      if (v9 == 0.0)
      {
        float v10 = [(GCMicroGamepad *)self dpad];
        float v11 = [v10 yAxis];
        [v11 value];
        BOOL v13 = v12 == 0.0;
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)digitizerTouchEvent:(id)a3 x:(double)a4 y:(double)a5 timestamp:(unint64_t)a6 forceSkipDpadRotation:(BOOL)a7
{
  id v10 = [(GCMicroGamepad *)self dpad];
  [(GCDirectionalGamepad *)self setDpad:v10 digitizerX:1 digitizerY:a4 touchDown:a5];
}

- (void)digitizerTouchUp:(id)a3 timestamp:(unint64_t)a4 forceSkipDpadRotation:(BOOL)a5
{
  id v6 = [(GCMicroGamepad *)self dpad];
  [(GCDirectionalGamepad *)self setDpad:v6 digitizerX:0 digitizerY:0.0 touchDown:0.0];
}

- (id)dpadDirectionEvent:(id)a3 direction:(unint64_t)a4 pressed:(BOOL)a5
{
  unsigned __int8 directionPadButtonsState = self->_directionPadButtonsState;
  unsigned __int8 v7 = directionPadButtonsState ^ a4;
  unsigned __int8 v8 = directionPadButtonsState | a4;
  if (!a5) {
    unsigned __int8 v8 = v7;
  }
  self->_unsigned __int8 directionPadButtonsState = v8;
  if (gc_isInternalBuild())
  {
    id v27 = getGCLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      int v28 = self->_directionPadButtonsState;
      *(_DWORD *)buf = 67109120;
      int v31 = v28;
      _os_log_impl(&dword_220998000, v27, OS_LOG_TYPE_INFO, "Button State = %x", buf, 8u);
    }
  }
  uint64_t v9 = [(GCMicroGamepad *)self dpad];
  id v10 = (void *)v9;
  if (self->_deviceType == 6)
  {
    float v11 = self->_cardinalDpad;

    if (!self->_treatOnlyCenterRingAsButtonA)
    {
      int v12 = self->_directionPadButtonsState;
      int v13 = self->_directionPadButtonsState != 0;
      double v14 = [(GCMicroGamepad *)self buttonA];
      int v15 = [v14 isPressed];

      if (v13 != v15 && !self->_centerButtonPressed)
      {
        int v16 = [(GCPhysicalInputProfile *)self controller];
        id v17 = [v16 handlerQueue];
        char v18 = v17;
        if (v17)
        {
          double v19 = v17;
        }
        else
        {
          double v19 = &_dispatch_main_q;
          id v23 = &_dispatch_main_q;
        }

        char v24 = [(GCMicroGamepad *)self buttonA];
        CGFloat v25 = v24;
        double v26 = 0.0;
        if (v12) {
          *(float *)&double v26 = 1.0;
        }
        [v24 _setValue:v19 queue:v26];

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __95__GCDirectionalGamepad_DirectionPadValueChangedDelegate__dpadDirectionEvent_direction_pressed___block_invoke;
        block[3] = &unk_26D22A8C0;
        block[4] = self;
        dispatch_async(v19, block);
      }
    }
  }
  else
  {
    float v11 = (GCControllerDirectionPad *)v9;
  }
  double v20 = [(GCPhysicalInputProfile *)self controller];
  char v21 = [v20 handlerQueue];
  [(GCDirectionalGamepad *)self reportDirectionpadChange:v11 onQueue:v21];

  return v11;
}

void __95__GCDirectionalGamepad_DirectionPadValueChangedDelegate__dpadDirectionEvent_direction_pressed___block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    id v6 = getGCLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v7 = [*(id *)(a1 + 32) controller];
      unsigned __int8 v8 = [v7 debugName];
      uint64_t v9 = [*(id *)(a1 + 32) buttonA];
      int v10 = 138412546;
      float v11 = v8;
      __int16 v12 = 2112;
      int v13 = v9;
      _os_log_impl(&dword_220998000, v6, OS_LOG_TYPE_DEFAULT, "%@ changed: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  v2 = [*(id *)(a1 + 32) valueChangedHandler];

  if (v2)
  {
    int64_t v3 = [*(id *)(a1 + 32) valueChangedHandler];
    float v4 = *(void **)(a1 + 32);
    double v5 = [v4 buttonA];
    ((void (**)(void, void *, void *))v3)[2](v3, v4, v5);
  }
}

- (id)centerButtonEvent:(id)a3 pressed:(BOOL)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  unsigned __int8 v7 = v6;
  if (self->_centerButtonPressed == v4
    || ((self->_centerButtonPressed = v4, !self->_treatOnlyCenterRingAsButtonA) ? (BOOL v8 = v4 == 0) : (BOOL v8 = 1),
        !v8 && self->_directionPadButtonsState))
  {
    id v9 = 0;
  }
  else
  {
    id v9 = v6;
    if (v9)
    {
      int v10 = [(GCPhysicalInputProfile *)self controller];
      float v11 = [v10 handlerQueue];
      __int16 v12 = v11;
      if (v11)
      {
        int v13 = v11;
      }
      else
      {
        int v13 = &_dispatch_main_q;
        id v14 = &_dispatch_main_q;
      }

      *(float *)&double v15 = (float)v4;
      [v9 _setValue:v13 queue:v15];
      if (!self->_treatOnlyCenterRingAsButtonA)
      {
        *(float *)&double v16 = (float)v4;
        [(GCControllerButtonInput *)self->_centerButton _setValue:v13 queue:v16];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __84__GCDirectionalGamepad_DirectionPadValueChangedDelegate__centerButtonEvent_pressed___block_invoke;
        block[3] = &unk_26D22A8C0;
        block[4] = self;
        dispatch_async(v13, block);
      }
    }
  }

  return v9;
}

void __84__GCDirectionalGamepad_DirectionPadValueChangedDelegate__centerButtonEvent_pressed___block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    unsigned int v4 = getGCLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      double v5 = [*(id *)(a1 + 32) controller];
      id v6 = [v5 debugName];
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 816);
      int v8 = 138412546;
      id v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_DEFAULT, "%@ changed: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  v2 = [*(id *)(a1 + 32) valueChangedHandler];

  if (v2)
  {
    int64_t v3 = [*(id *)(a1 + 32) valueChangedHandler];
    v3[2](v3, *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 816));
  }
}

@end