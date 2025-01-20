@interface GCControllerTouchpad
- (BOOL)calculateRelativePositionWithDigitizerX:(float)a3 digitizerY:(float)a4 touchDown:(BOOL)a5;
- (BOOL)determineTouchStateWithDigitizerX:(float)a3 digitizerY:(float)a4 touchDown:(BOOL)a5;
- (BOOL)reportsAbsoluteTouchSurfaceValues;
- (BOOL)setDigitizerX:(float)a3 digitizerY:(float)a4 touchDown:(BOOL)a5 queue:(id)a6;
- (CGPoint)addCGPoint:(CGPoint)a3 toPoint:(CGPoint)a4;
- (CGPoint)clampPoint:(CGPoint)a3 toLength:(double)a4;
- (CGPoint)mulCGPoint:(CGPoint)a3 byScalar:(double)a4;
- (CGPoint)normalizeCGPoint:(CGPoint)a3;
- (CGPoint)scaleCGPoint:(CGPoint)a3 toLength:(double)a4;
- (CGPoint)subCGPoint:(CGPoint)a3 fromPoint:(CGPoint)a4;
- (GCControllerButtonInput)button;
- (GCControllerDirectionPad)touchSurface;
- (GCControllerTouchpad)initWithCoder:(id)a3;
- (GCControllerTouchpad)initWithDescriptionName:(id)a3;
- (GCControllerTouchpadHandler)touchDown;
- (GCControllerTouchpadHandler)touchMoved;
- (GCControllerTouchpadHandler)touchUp;
- (GCTouchState)touchState;
- (double)distanceBetweenCGPoint:(CGPoint)a3 andCGPoint:(CGPoint)a4;
- (double)magnitudeForCGPoint:(CGPoint)a3;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)reportDigitizerChange:(id)a3;
- (void)setReportsAbsoluteTouchSurfaceValues:(BOOL)reportsAbsoluteTouchSurfaceValues;
- (void)setTouchDown:(GCControllerTouchpadHandler)touchDown;
- (void)setTouchMoved:(GCControllerTouchpadHandler)touchMoved;
- (void)setTouchSurface:(id)a3;
- (void)setTouchUp:(GCControllerTouchpadHandler)touchUp;
- (void)setValueForXAxis:(float)xAxis yAxis:(float)yAxis touchDown:(BOOL)touchDown buttonValue:(float)buttonValue;
@end

@implementation GCControllerTouchpad

- (GCControllerTouchpad)initWithDescriptionName:(id)a3
{
  v4 = (__CFString *)a3;
  v16.receiver = self;
  v16.super_class = (Class)GCControllerTouchpad;
  v5 = [(GCControllerElement *)&v16 init];
  v6 = v5;
  if (v5)
  {
    if (v4) {
      v7 = v4;
    }
    else {
      v7 = @"Touchpad";
    }
    p_descriptionName = &v5->_descriptionName;
    objc_storeStrong((id *)&v5->_descriptionName, v7);
    [(GCControllerElement *)v6 setPrimaryAlias:*p_descriptionName];
    v9 = +[NSString stringWithFormat:@"%@ %@", *p_descriptionName, @"Surface"];
    v10 = [[GCControllerDirectionPad alloc] initWithDigital:0 descriptionName:v9];
    touchSurface = v6->_touchSurface;
    v6->_touchSurface = v10;

    [(GCControllerElement *)v6->_touchSurface setCollection:v6];
    v12 = +[NSString stringWithFormat:@"%@ %@", *p_descriptionName, @"Button"];
    v13 = [[GCControllerButtonInput alloc] initWithDescriptionName:v12];
    button = v6->_button;
    v6->_button = v13;

    [(GCControllerButtonInput *)v6->_button setTouchedAndValueDistinct:1];
    [(GCControllerElement *)v6->_button setCollection:v6];
    v6->_touchState = 0;
    v6->_touchpadRelativeWindowSize = 0.5;
    v6->_touchpadRelativeOriginBufferSize = 0.225;
    v6->_reportsAbsoluteTouchSurfaceValues = 1;
    v6->_previousButtonState = 0.0;
    [(GCControllerButtonInput *)v6->_button setNonAnalog:1];
  }
  return v6;
}

- (GCControllerTouchpad)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCControllerTouchpad;
  v5 = [(GCControllerElement *)&v9 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"_touchpadRelativeWindowSize"];
    v5->_touchpadRelativeWindowSize = v6;
    [v4 decodeFloatForKey:@"_touchpadRelativeOriginBufferRadius"];
    v5->_touchpadRelativeOriginBufferSize = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  float touchpadRelativeWindowSize = self->_touchpadRelativeWindowSize;
  id v7 = a3;
  *(float *)&double v5 = touchpadRelativeWindowSize;
  [v7 encodeFloat:@"_touchpadRelativeWindowSize" forKey:v5];
  *(float *)&double v6 = self->_touchpadRelativeOriginBufferSize;
  [v7 encodeFloat:@"_touchpadRelativeOriginBufferSize" forKey:v6];
}

- (BOOL)calculateRelativePositionWithDigitizerX:(float)a3 digitizerY:(float)a4 touchDown:(BOOL)a5
{
  double v6 = a3;
  double v7 = a4;
  p_absoluteWindowLocation = &self->_absoluteWindowLocation;
  -[GCControllerTouchpad distanceBetweenCGPoint:andCGPoint:](self, "distanceBetweenCGPoint:andCGPoint:", a5, a3, a4, self->_absoluteWindowLocation.x, self->_absoluteWindowLocation.y);
  float touchpadRelativeWindowSize = self->_touchpadRelativeWindowSize;
  if (v10 >= (float)(self->_touchpadRelativeOriginBufferSize * touchpadRelativeWindowSize)
    || self->_reportsAbsoluteTouchSurfaceValues)
  {
    BOOL leftBufferZone = 1;
    self->_BOOL leftBufferZone = 1;
    self->_absolutePosition.x = v6;
    self->_absolutePosition.y = v7;
    -[GCControllerTouchpad mulCGPoint:byScalar:](self, "mulCGPoint:byScalar:", v6 - p_absoluteWindowLocation->x, v7 - p_absoluteWindowLocation->y, 1.0 / touchpadRelativeWindowSize);
    double v13 = v12;
    double v15 = v14;
    -[GCControllerTouchpad normalizeCGPoint:](self, "normalizeCGPoint:");
    double v17 = v16;
    double v19 = v18;
    -[GCControllerTouchpad scaleCGPoint:toLength:](self, "scaleCGPoint:toLength:");
    -[GCControllerTouchpad addCGPoint:toPoint:](self, "addCGPoint:toPoint:");
    p_relativePosition = &self->_relativePosition;
    CGFloat v23 = self->_absolutePosition.y - v22;
    self->_relativePosition.x = self->_absolutePosition.x - v20;
    self->_relativePosition.y = v23;
    -[GCControllerTouchpad mulCGPoint:byScalar:](self, "mulCGPoint:byScalar:");
    self->_relativePosition.x = v24;
    self->_relativePosition.y = v25;
    -[GCControllerTouchpad magnitudeForCGPoint:](self, "magnitudeForCGPoint:", v13, v15);
    if (v26 > 1.0)
    {
      double v27 = 1.0 - self->_touchpadRelativeWindowSize;
      -[GCControllerTouchpad subCGPoint:fromPoint:](self, "subCGPoint:fromPoint:", v17, v19, v13, v15);
      -[GCControllerTouchpad addCGPoint:toPoint:](self, "addCGPoint:toPoint:", p_absoluteWindowLocation->x, p_absoluteWindowLocation->y, v28, v29);
      p_absoluteWindowLocation->x = v30;
      p_absoluteWindowLocation->y = v31;
      if (self->_beganTouchOutsideBounds)
      {
        -[GCControllerTouchpad magnitudeForCGPoint:](self, "magnitudeForCGPoint:");
        if (v32 <= v27) {
          self->_beganTouchOutsideBounds = 0;
        }
      }
      else
      {
        -[GCControllerTouchpad clampPoint:toLength:](self, "clampPoint:toLength:");
        p_absoluteWindowLocation->x = v33;
        p_absoluteWindowLocation->y = v34;
      }
      -[GCControllerTouchpad scaleCGPoint:toLength:](self, "scaleCGPoint:toLength:", p_relativePosition->x, self->_relativePosition.y, 1.0);
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
  if (self->_reportsAbsoluteTouchSurfaceValues) {
    double v5 = &OBJC_IVAR___GCControllerTouchpad__absolutePosition;
  }
  else {
    double v5 = &OBJC_IVAR___GCControllerTouchpad__relativePosition;
  }
  double v6 = (double *)((char *)self + *v5);
  double v8 = *v6;
  double v7 = v6[1];
  [(GCControllerButtonInput *)self->_button value];
  float v10 = v9;
  BOOL v11 = [(GCControllerButtonInput *)self->_button isPressed];
  self->_previousButtonState = v10;
  int64_t touchState = self->_touchState;
  switch(touchState)
  {
    case 0:
      double v19 = [(GCControllerDirectionPad *)self->_touchSurface xAxis];
      [v19 _setValue:v4 queue:0.0];

      double v20 = [(GCControllerDirectionPad *)self->_touchSurface yAxis];
      [v20 _setValue:v4 queue:0.0];

      double v17 = (double *)v25;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      double v18 = __46__GCControllerTouchpad_reportDigitizerChange___block_invoke_3;
      goto LABEL_10;
    case 2:
      v21 = [(GCControllerDirectionPad *)self->_touchSurface xAxis];
      *(float *)&double v22 = v8;
      [v21 _setValue:v4 queue:v22];

      CGFloat v23 = [(GCControllerDirectionPad *)self->_touchSurface yAxis];
      *(float *)&double v24 = v7;
      [v23 _setValue:v4 queue:v24];

      double v17 = (double *)block;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      double v18 = __46__GCControllerTouchpad_reportDigitizerChange___block_invoke_2;
      goto LABEL_10;
    case 1:
      double v13 = [(GCControllerDirectionPad *)self->_touchSurface xAxis];
      *(float *)&double v14 = v8;
      [v13 _setValue:v4 queue:v14];

      double v15 = [(GCControllerDirectionPad *)self->_touchSurface yAxis];
      *(float *)&double v16 = v7;
      [v15 _setValue:v4 queue:v16];

      double v17 = (double *)v27;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      double v18 = __46__GCControllerTouchpad_reportDigitizerChange___block_invoke;
LABEL_10:
      *((void *)v17 + 2) = v18;
      *((void *)v17 + 3) = &unk_26D22B808;
      *((void *)v17 + 4) = self;
      v17[5] = v8;
      v17[6] = v7;
      *((float *)v17 + 14) = v10;
      *((unsigned char *)v17 + 60) = v11;
      dispatch_async(v4, v17);
      break;
  }
}

void __46__GCControllerTouchpad_reportDigitizerChange___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) touchDown];

  if (v2)
  {
    id v5 = [*(id *)(a1 + 32) touchDown];
    float v3 = *(double *)(a1 + 40);
    float v4 = *(double *)(a1 + 48);
    (*((void (**)(id, void, void, float, float, float))v5 + 2))(v5, *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 60), v3, v4, *(float *)(a1 + 56));
  }
}

void __46__GCControllerTouchpad_reportDigitizerChange___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) touchMoved];

  if (v2)
  {
    id v5 = [*(id *)(a1 + 32) touchMoved];
    float v3 = *(double *)(a1 + 40);
    float v4 = *(double *)(a1 + 48);
    (*((void (**)(id, void, void, float, float, float))v5 + 2))(v5, *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 60), v3, v4, *(float *)(a1 + 56));
  }
}

void __46__GCControllerTouchpad_reportDigitizerChange___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) touchUp];

  if (v2)
  {
    id v5 = [*(id *)(a1 + 32) touchUp];
    float v3 = *(double *)(a1 + 40);
    float v4 = *(double *)(a1 + 48);
    (*((void (**)(id, void, void, float, float, float))v5 + 2))(v5, *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 60), v3, v4, *(float *)(a1 + 56));
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

- (BOOL)setDigitizerX:(float)a3 digitizerY:(float)a4 touchDown:(BOOL)a5 queue:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  [(GCControllerButtonInput *)self->_button value];
  float v12 = v11;
  float previousButtonState = self->_previousButtonState;
  *(float *)&double v14 = a3;
  *(float *)&double v15 = a4;
  if (![(GCControllerTouchpad *)self determineTouchStateWithDigitizerX:v6 digitizerY:v14 touchDown:v15]&& v12 == previousButtonState)
  {
    goto LABEL_3;
  }
  if (self->_touchState == 1)
  {
    self->_absoluteTouchDownPosition.x = a3;
    self->_absoluteTouchDownPosition.y = a4;
    self->_absoluteWindowLocation = self->_absoluteTouchDownPosition;
    self->_absolutePosition.x = a3;
    self->_absolutePosition.y = a4;
    self->_relativePosition = CGPointZero;
    self->_BOOL leftBufferZone = 0;
    double v19 = 1.0 - self->_touchpadRelativeWindowSize;
    -[GCControllerTouchpad magnitudeForCGPoint:](self, "magnitudeForCGPoint:", self->_absoluteWindowLocation.x, self->_absoluteWindowLocation.y);
    if (v20 > v19) {
      self->_beganTouchOutsideBounds = 1;
    }
    goto LABEL_9;
  }
  *(float *)&double v16 = a3;
  *(float *)&double v17 = a4;
  if ([(GCControllerTouchpad *)self calculateRelativePositionWithDigitizerX:v6 digitizerY:v16 touchDown:v17]|| v12 != previousButtonState)
  {
LABEL_9:
    [(GCControllerTouchpad *)self reportDigitizerChange:v10];
    BOOL v18 = 1;
    goto LABEL_10;
  }
LABEL_3:
  BOOL v18 = 0;
LABEL_10:

  return v18;
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
  -[GCControllerTouchpad magnitudeForCGPoint:](self, "magnitudeForCGPoint:");
  double v6 = y / v5;
  double v7 = x / v5;
  result.double y = v6;
  result.double x = v7;
  return result;
}

- (CGPoint)scaleCGPoint:(CGPoint)a3 toLength:(double)a4
{
  -[GCControllerTouchpad normalizeCGPoint:](self, "normalizeCGPoint:", a3.x, a3.y);
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
  -[GCControllerTouchpad magnitudeForCGPoint:](self, "magnitudeForCGPoint:");
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

- (id)description
{
  unint64_t touchState = self->_touchState;
  if (touchState > 2) {
    double v4 = &stru_26D27BBB8;
  }
  else {
    double v4 = off_26D22B828[touchState];
  }
  descriptionName = self->_descriptionName;
  double v6 = [(GCControllerTouchpad *)self button];
  if ([v6 isPressed]) {
    double v7 = @"Pressed";
  }
  else {
    double v7 = @"Not Pressed";
  }
  double v8 = [(GCControllerTouchpad *)self touchSurface];
  double v9 = +[NSString stringWithFormat:@"%@ (%@, %@, %@)", descriptionName, v4, v7, v8];

  return v9;
}

- (id)debugDescription
{
  float v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  double v5 = [(GCControllerTouchpad *)self description];
  double v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return v6;
}

- (void)setValueForXAxis:(float)xAxis yAxis:(float)yAxis touchDown:(BOOL)touchDown buttonValue:(float)buttonValue
{
  BOOL v7 = touchDown;
  double v26 = [(GCControllerElement *)self device];
  if (v26)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    float v12 = v26;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_16;
    }
    char v13 = [v26 isSnapshot];
    float v12 = v26;
    if ((v13 & 1) == 0) {
      goto LABEL_16;
    }
    double v14 = [v26 handlerQueue];
  }
  else
  {
    double v14 = &_dispatch_main_q;
    id v15 = &_dispatch_main_q;
  }
  double v16 = self;
  id v17 = v14;
  id v18 = [(GCControllerTouchpad *)v16 button];
  id v19 = v17;
  int v21 = !v7;
  if (buttonValue <= 0.0) {
    int v21 = 1;
  }
  if (buttonValue != 0.0 && v21) {
    -[GCControllerTouchpad setValueForXAxis:yAxis:touchDown:buttonValue:]();
  }
  *(float *)&double v20 = buttonValue;
  char v22 = [v18 _setValue:v19 queue:v20];
  int v23 = [v18 _setTouched:v7 queue:v19];
  if ((v22 & 1) != 0 || v23) {
    [0 addObject:v18];
  }

  *(float *)&double v24 = xAxis;
  *(float *)&double v25 = yAxis;
  if ([(GCControllerTouchpad *)v16 setDigitizerX:v7 digitizerY:v19 touchDown:v24 queue:v25])
  {
    [0 addObject:v16];
  }

  float v12 = v26;
LABEL_16:
}

- (GCControllerButtonInput)button
{
  return self->_button;
}

- (GCControllerTouchpadHandler)touchDown
{
  return self->_touchDown;
}

- (void)setTouchDown:(GCControllerTouchpadHandler)touchDown
{
}

- (GCControllerTouchpadHandler)touchMoved
{
  return self->_touchMoved;
}

- (void)setTouchMoved:(GCControllerTouchpadHandler)touchMoved
{
}

- (GCControllerTouchpadHandler)touchUp
{
  return self->_touchUp;
}

- (void)setTouchUp:(GCControllerTouchpadHandler)touchUp
{
}

- (GCControllerDirectionPad)touchSurface
{
  return self->_touchSurface;
}

- (void)setTouchSurface:(id)a3
{
}

- (GCTouchState)touchState
{
  return self->_touchState;
}

- (BOOL)reportsAbsoluteTouchSurfaceValues
{
  return self->_reportsAbsoluteTouchSurfaceValues;
}

- (void)setReportsAbsoluteTouchSurfaceValues:(BOOL)reportsAbsoluteTouchSurfaceValues
{
  self->_reportsAbsoluteTouchSurfaceValues = reportsAbsoluteTouchSurfaceValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchSurface, 0);
  objc_storeStrong(&self->_touchUp, 0);
  objc_storeStrong(&self->_touchMoved, 0);
  objc_storeStrong(&self->_touchDown, 0);
  objc_storeStrong((id *)&self->_button, 0);

  objc_storeStrong((id *)&self->_descriptionName, 0);
}

- (void)setValueForXAxis:yAxis:touchDown:buttonValue:.cold.1()
{
  __assert_rtn("setButtonValueAndTouched", "GCControllerButtonInput_Private.h", 38, "(value > 0 && touched) || value == 0");
}

@end