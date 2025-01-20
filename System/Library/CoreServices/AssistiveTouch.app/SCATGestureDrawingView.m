@interface SCATGestureDrawingView
+ (BOOL)_isValidPositionFor90ControlWithXAlignment:(unint64_t)a3 yAlignment:(unint64_t)a4 size:(CGSize)a5 nearestPoint:(CGPoint)a6 centerPoint:(CGPoint)a7 frame:(CGRect *)a8;
+ (CGRect)_bestFrameFor90ControlAtAngle:(double)a3 size:(CGSize)a4 centerPoint:(CGPoint)a5;
+ (CGRect)_frameFor90ControlWithXAlignment:(unint64_t)a3 yAlignment:(unint64_t)a4 size:(CGSize)a5 nearestPoint:(CGPoint)a6;
+ (CGRect)_frameWithIntegralOrigin:(CGRect)result;
- (BOOL)areFingersHighlighted;
- (BOOL)areFingersPressed;
- (BOOL)showsCurvatureControls;
- (BOOL)showsRotation90Controls;
- (BOOL)showsRotationControls;
- (CGPoint)_tailPoint;
- (CGRect)frameForToolbar;
- (NSArray)fingerPositions;
- (NSArray)rotation90Controls;
- (SCATGestureArrowView)decreaseCurveControl;
- (SCATGestureArrowView)increaseCurveControl;
- (SCATGestureArrowView)rotateClockwiseControl;
- (SCATGestureArrowView)rotateCounterclockwiseControl;
- (SCATGestureArrowView)straightenCurveControl;
- (SCATGestureDrawingView)initWithFrame:(CGRect)a3;
- (SCATOutlineLabel)rotate90ClockwiseButton;
- (SCATOutlineLabel)rotate90CounterclockwiseButton;
- (double)_actualDistanceForFingerTrail;
- (double)_midAngleForCurvedTrailWithTailPoint:(CGPoint)a3 fingerTrailDistance:(double)a4 distanceAlongArc:(double)a5 useSecondIntersectionPointIfNecessary:(BOOL)a6;
- (double)angle;
- (double)curvature;
- (double)previewDistance;
- (id)_newControlArrowForCurvature:(BOOL)a3;
- (id)_newRotate90Button;
- (void)_adjustArrowViewsForNumberOfFingers:(unint64_t)a3;
- (void)_updateControls;
- (void)_updateCurvatureControl:(id)a3 withTailPoint:(CGPoint)a4 tailAngle:(double)a5 distance:(double)a6 curvature:(double)a7;
- (void)_updateCurvatureControls;
- (void)_updateRotation90Controls;
- (void)_updateRotationControls;
- (void)setAngle:(double)a3;
- (void)setCurvature:(double)a3;
- (void)setFingerPositions:(id)a3;
- (void)setFingersHighlighted:(BOOL)a3;
- (void)setFingersPressed:(BOOL)a3;
- (void)setFrameForToolbar:(CGRect)a3;
- (void)setPreviewDistance:(double)a3;
- (void)setShowsCurvatureControls:(BOOL)a3;
- (void)setShowsRotation90Controls:(BOOL)a3;
- (void)setShowsRotationControls:(BOOL)a3;
@end

@implementation SCATGestureDrawingView

- (SCATGestureDrawingView)initWithFrame:(CGRect)a3
{
  v30.receiver = self;
  v30.super_class = (Class)SCATGestureDrawingView;
  v3 = -[SCATGestureDrawingView initWithFrame:](&v30, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SCATGestureDrawingView *)v3 _newControlArrowForCurvature:0];
    rotateClockwiseControl = v4->_rotateClockwiseControl;
    v4->_rotateClockwiseControl = v5;

    v7 = [(SCATGestureDrawingView *)v4 _newControlArrowForCurvature:0];
    rotateCounterclockwiseControl = v4->_rotateCounterclockwiseControl;
    v4->_rotateCounterclockwiseControl = v7;

    v9 = [(SCATGestureDrawingView *)v4 _newRotate90Button];
    rotate90ClockwiseButton = v4->_rotate90ClockwiseButton;
    v4->_rotate90ClockwiseButton = v9;

    v11 = [(SCATGestureDrawingView *)v4 _newRotate90Button];
    rotate90CounterclockwiseButton = v4->_rotate90CounterclockwiseButton;
    v4->_rotate90CounterclockwiseButton = v11;

    v13 = [(SCATGestureDrawingView *)v4 _newControlArrowForCurvature:1];
    increaseCurveControl = v4->_increaseCurveControl;
    v4->_increaseCurveControl = v13;

    v15 = [(SCATGestureDrawingView *)v4 _newControlArrowForCurvature:1];
    decreaseCurveControl = v4->_decreaseCurveControl;
    v4->_decreaseCurveControl = v15;

    v17 = [(SCATGestureDrawingView *)v4 _newControlArrowForCurvature:1];
    straightenCurveControl = v4->_straightenCurveControl;
    v4->_straightenCurveControl = v17;

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v31[0] = v4->_rotateCounterclockwiseControl;
    v31[1] = v4->_rotateClockwiseControl;
    v31[2] = v4->_rotate90CounterclockwiseButton;
    v31[3] = v4->_rotate90ClockwiseButton;
    v31[4] = v4->_increaseCurveControl;
    v31[5] = v4->_decreaseCurveControl;
    v31[6] = v4->_straightenCurveControl;
    v19 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 7, 0);
    id v20 = [v19 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v27;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          [v24 setHidden:1];
          [(SCATGestureDrawingView *)v4 addSubview:v24];
        }
        id v21 = [v19 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v21);
    }
  }
  return v4;
}

- (void)setFingersPressed:(BOOL)a3
{
  if (self->_fingersPressed != a3)
  {
    BOOL v3 = a3;
    self->_fingersPressed = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = self->_arrowViews;
    id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "setPressed:", v3, (void)v9);
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)setFingersHighlighted:(BOOL)a3
{
  if (self->_fingersHighlighted != a3)
  {
    BOOL v3 = a3;
    self->_fingersHighlighted = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = self->_arrowViews;
    id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "setHighlighted:", v3, (void)v9);
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)setShowsRotationControls:(BOOL)a3
{
  if (self->_showsRotationControls != a3)
  {
    self->_showsRotationControls = a3;
    [(SCATGestureDrawingView *)self _updateRotationControls];
  }
}

- (void)setShowsRotation90Controls:(BOOL)a3
{
  if (self->_showsRotation90Controls != a3)
  {
    self->_showsRotation90Controls = a3;
    [(SCATGestureDrawingView *)self _updateRotation90Controls];
  }
}

- (void)setShowsCurvatureControls:(BOOL)a3
{
  if (self->_showsCurvatureControls != a3)
  {
    self->_showsCurvatureControls = a3;
    [(SCATGestureDrawingView *)self _updateCurvatureControls];
  }
}

- (NSArray)fingerPositions
{
  BOOL v3 = +[NSMutableArray arrayWithCapacity:[(NSMutableArray *)self->_arrowViews count]];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_arrowViews;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "tailPoint", (void)v11);
        long long v9 = NSStringFromCGPoint(v17);
        [v3 addObject:v9];
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)setFingerPositions:(id)a3
{
  id v8 = a3;
  -[SCATGestureDrawingView _adjustArrowViewsForNumberOfFingers:](self, "_adjustArrowViewsForNumberOfFingers:", [v8 count]);
  if ([v8 count])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [(NSMutableArray *)self->_arrowViews objectAtIndex:v4];
      id v6 = [v8 objectAtIndex:v4];
      CGPoint v7 = CGPointFromString(v6);
      objc_msgSend(v5, "setTailPoint:", v7.x, v7.y);

      ++v4;
    }
    while (v4 < (unint64_t)[v8 count]);
  }
  [(SCATGestureDrawingView *)self _updateControls];
}

- (double)angle
{
  v2 = [(NSMutableArray *)self->_arrowViews lastObject];
  [v2 tailAngle];
  double v4 = v3;

  return v4;
}

- (void)setAngle:(double)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_arrowViews;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "setTailAngle:", a3, (void)v10);
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(SCATGestureDrawingView *)self _updateControls];
}

- (double)curvature
{
  v2 = [(NSMutableArray *)self->_arrowViews lastObject];
  [v2 curvature];
  double v4 = v3;

  return v4;
}

- (void)setCurvature:(double)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_arrowViews;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "setCurvature:", a3, (void)v10);
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(SCATGestureDrawingView *)self _updateControls];
}

- (double)previewDistance
{
  v2 = [(NSMutableArray *)self->_arrowViews lastObject];
  [v2 distance];
  double v4 = v3;

  return v4;
}

- (void)setPreviewDistance:(double)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_arrowViews;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "setDistance:", a3, (void)v10);
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(SCATGestureDrawingView *)self _updateControls];
}

- (void)setFrameForToolbar:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_frameForToolbar = &self->_frameForToolbar;
  if (!CGRectEqualToRect(self->_frameForToolbar, a3))
  {
    p_frameForToolbar->origin.CGFloat x = x;
    p_frameForToolbar->origin.CGFloat y = y;
    p_frameForToolbar->size.CGFloat width = width;
    p_frameForToolbar->size.CGFloat height = height;
  }
}

- (id)_newControlArrowForCurvature:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(SCATGestureArrowView);
  [(SCATGestureArrowView *)v5 setIsControlArrow:1];
  [(SCATGestureArrowView *)v5 setGestureDrawingView:self];
  if (v3) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 5;
  }
  [(SCATGestureArrowView *)v5 setStyle:v6];
  [(SCATGestureArrowView *)v5 setShouldClearFingerCircle:v3];
  return v5;
}

- (id)_newRotate90Button
{
  v2 = +[SCATStyleProvider sharedStyleProvider];
  BOOL v3 = objc_alloc_init(SCATOutlineLabel);
  double v4 = sub_100040EC8(@"DrawingRotate90");
  id v5 = AXFormatInteger();
  uint64_t v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5);

  [(SCATOutlineLabel *)v3 setText:v6];
  id v7 = [v2 controlArrowColor];
  [(SCATOutlineLabel *)v3 setTextColor:v7];

  uint64_t v8 = [v2 controlArrowHighlightedColor];
  [(SCATOutlineLabel *)v3 setHighlightedTextColor:v8];

  long long v9 = [v2 controlArrowOutlineColor];
  [(SCATOutlineLabel *)v3 setOutlineColor:v9];

  [v2 controlArrowOutlineThickness];
  -[SCATOutlineLabel setOutlineThickness:](v3, "setOutlineThickness:");
  [(SCATOutlineLabel *)v3 setTextAlignment:1];
  long long v10 = +[SCATStyleProvider sharedStyleProvider];
  long long v11 = [v10 rotation90ControlFont];

  [(SCATOutlineLabel *)v3 setFont:v11];
  [(SCATOutlineLabel *)v3 sizeToFit];

  return v3;
}

- (void)_adjustArrowViewsForNumberOfFingers:(unint64_t)a3
{
  arrowViews = self->_arrowViews;
  if (!arrowViews)
  {
    uint64_t v6 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:a3];
    id v7 = self->_arrowViews;
    self->_arrowViews = v6;

    arrowViews = self->_arrowViews;
  }
  id v8 = [(NSMutableArray *)arrowViews count];
  unint64_t v9 = a3 - (void)v8;
  if (a3 >= (unint64_t)v8)
  {
    if (a3 > (unint64_t)v8)
    {
      do
      {
        long long v12 = objc_alloc_init(SCATGestureArrowView);
        [(SCATGestureArrowView *)v12 setGestureDrawingView:self];
        [(SCATGestureArrowView *)v12 setStyle:3];
        [(SCATGestureDrawingView *)self addSubview:v12];
        [(NSMutableArray *)self->_arrowViews addObject:v12];

        --v9;
      }
      while (v9);
    }
  }
  else
  {
    for (unint64_t i = (unint64_t)v8 - 1; i >= a3; --i)
    {
      long long v11 = [(NSMutableArray *)self->_arrowViews objectAtIndex:i];
      [v11 removeFromSuperview];
      [(NSMutableArray *)self->_arrowViews removeObjectAtIndex:i];
    }
  }
}

- (CGPoint)_tailPoint
{
  v2 = [(SCATGestureDrawingView *)self fingerPositions];
  BOOL v3 = [v2 lastObject];
  CGPoint v4 = CGPointFromString(v3);

  double x = v4.x;
  double y = v4.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)_actualDistanceForFingerTrail
{
  v2 = [(NSMutableArray *)self->_arrowViews lastObject];
  [v2 actualDistanceForPreview];
  double v4 = v3;

  return v4;
}

- (void)_updateControls
{
  [(SCATGestureDrawingView *)self _updateRotationControls];
  [(SCATGestureDrawingView *)self _updateRotation90Controls];

  [(SCATGestureDrawingView *)self _updateCurvatureControls];
}

+ (CGRect)_frameFor90ControlWithXAlignment:(unint64_t)a3 yAlignment:(unint64_t)a4 size:(CGSize)a5 nearestPoint:(CGPoint)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  if (a3 == 2)
  {
    double x = a6.x - a5.width;
  }
  else if (a3 == 1)
  {
    double x = a6.x + a5.width * -0.5;
  }
  else
  {
    double x = CGRectZero.origin.x;
    if (!a3) {
      double x = a6.x;
    }
  }
  if (a4 == 2)
  {
    double y = a6.y - a5.height;
  }
  else if (a4 == 1)
  {
    double y = a6.y + a5.height * -0.5;
  }
  else
  {
    double y = CGRectZero.origin.y;
    if (!a4) {
      double y = a6.y;
    }
  }
  double v10 = width;
  double v11 = height;
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

+ (BOOL)_isValidPositionFor90ControlWithXAlignment:(unint64_t)a3 yAlignment:(unint64_t)a4 size:(CGSize)a5 nearestPoint:(CGPoint)a6 centerPoint:(CGPoint)a7 frame:(CGRect *)a8
{
  double y = a6.y;
  double x = a6.x;
  double height = a5.height;
  double width = a5.width;
  if (a3 == 1 && a4 == 1) {
    _AXAssert();
  }
  objc_msgSend(a1, "_frameFor90ControlWithXAlignment:yAlignment:size:nearestPoint:", a3, a4, width, height, x, y);
  double v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  AX_CGPointGetDistanceToPoint();
  double v25 = v24;
  AX_CGPointGetDistanceToPoint();
  double v43 = v26;
  v44.origin.double x = v17;
  v44.origin.double y = v19;
  v44.size.double width = v21;
  v44.size.double height = v23;
  CGRectGetMidX(v44);
  v45.origin.double x = v17;
  v45.origin.double y = v19;
  v45.size.double width = v21;
  v45.size.double height = v23;
  CGRectGetMinY(v45);
  AX_CGPointGetDistanceToPoint();
  double v42 = v27;
  v46.origin.double x = v17;
  v46.origin.double y = v19;
  v46.size.double width = v21;
  v46.size.double height = v23;
  CGRectGetMaxX(v46);
  v47.origin.double x = v17;
  v47.origin.double y = v19;
  v47.size.double width = v21;
  v47.size.double height = v23;
  CGRectGetMinY(v47);
  AX_CGPointGetDistanceToPoint();
  double v41 = v28;
  v48.origin.double x = v17;
  v48.origin.double y = v19;
  v48.size.double width = v21;
  v48.size.double height = v23;
  CGRectGetMinX(v48);
  v49.origin.double x = v17;
  v49.origin.double y = v19;
  v49.size.double width = v21;
  v49.size.double height = v23;
  CGRectGetMidY(v49);
  AX_CGPointGetDistanceToPoint();
  double v40 = v29;
  v50.origin.double x = v17;
  v50.origin.double y = v19;
  v50.size.double width = v21;
  v50.size.double height = v23;
  CGRectGetMaxX(v50);
  v51.origin.double x = v17;
  v51.origin.double y = v19;
  v51.size.double width = v21;
  v51.size.double height = v23;
  CGRectGetMidY(v51);
  AX_CGPointGetDistanceToPoint();
  double v39 = v30;
  v52.origin.double x = v17;
  v52.origin.double y = v19;
  v52.size.double width = v21;
  v52.size.double height = v23;
  CGRectGetMinX(v52);
  v53.origin.double x = v17;
  v53.origin.double y = v19;
  v53.size.double width = v21;
  v53.size.double height = v23;
  CGRectGetMaxY(v53);
  AX_CGPointGetDistanceToPoint();
  double v38 = v31;
  v54.origin.double x = v17;
  v54.origin.double y = v19;
  v54.size.double width = v21;
  v54.size.double height = v23;
  CGRectGetMidX(v54);
  v55.origin.double x = v17;
  v55.origin.double y = v19;
  v55.size.double width = v21;
  v55.size.double height = v23;
  CGRectGetMaxY(v55);
  AX_CGPointGetDistanceToPoint();
  double v37 = v32;
  v56.origin.double x = v17;
  v56.origin.double y = v19;
  v56.size.double width = v21;
  v56.size.double height = v23;
  CGRectGetMaxX(v56);
  v57.origin.double x = v17;
  v57.origin.double y = v19;
  v57.size.double width = v21;
  v57.size.double height = v23;
  CGRectGetMaxY(v57);
  AX_CGPointGetDistanceToPoint();
  if (a8)
  {
    double v34 = v17 + 3.0;
    if (a3 != 1) {
      double v34 = v17;
    }
    a8->origin.double x = v34;
    a8->origin.double y = v19;
    a8->size.double width = v21;
    a8->size.double height = v23;
  }
  BOOL v35 = v43 >= v25;
  if (v41 < v25) {
    BOOL v35 = 0;
  }
  if (v38 < v25) {
    BOOL v35 = 0;
  }
  if (v33 < v25) {
    BOOL v35 = 0;
  }
  if (v42 < v25) {
    BOOL v35 = 0;
  }
  if (v40 < v25) {
    BOOL v35 = 0;
  }
  if (v39 < v25) {
    BOOL v35 = 0;
  }
  return v37 >= v25 && v35;
}

+ (CGRect)_bestFrameFor90ControlAtAngle:(double)a3 size:(CGSize)a4 centerPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double height = a4.height;
  double width = a4.width;
  double v11 = +[SCATStyleProvider sharedStyleProvider];
  [v11 rotation90ControlNearestRadius];
  double v13 = v12;
  __double2 v14 = __sincos_stret(a3);
  double v15 = x + v13 * v14.__cosval;
  double v16 = y + v13 * v14.__sinval;
  CGSize size = CGRectNull.size;
  CGPoint origin = CGRectNull.origin;
  CGSize v30 = size;
  if ((objc_msgSend(a1, "_isValidPositionFor90ControlWithXAlignment:yAlignment:size:nearestPoint:centerPoint:frame:", 1, 0, &origin, width, height, v15, v16, x, y) & 1) == 0&& (objc_msgSend(a1, "_isValidPositionFor90ControlWithXAlignment:yAlignment:size:nearestPoint:centerPoint:frame:", 1, 2, &origin, width, height,
                        v15,
                        v16,
                        x,
                        y) & 1) == 0
    && (objc_msgSend(a1, "_isValidPositionFor90ControlWithXAlignment:yAlignment:size:nearestPoint:centerPoint:frame:", 0, 1, &origin, width, height, v15, v16, x, y) & 1) == 0&& (objc_msgSend(a1, "_isValidPositionFor90ControlWithXAlignment:yAlignment:size:nearestPoint:centerPoint:frame:", 2, 1, &origin, width, height,
                        v15,
                        v16,
                        x,
                        y) & 1) == 0
    && (objc_msgSend(a1, "_isValidPositionFor90ControlWithXAlignment:yAlignment:size:nearestPoint:centerPoint:frame:", 0, 0, &origin, width, height, v15, v16, x, y) & 1) == 0&& (objc_msgSend(a1, "_isValidPositionFor90ControlWithXAlignment:yAlignment:size:nearestPoint:centerPoint:frame:", 0, 2, &origin, width, height,
                        v15,
                        v16,
                        x,
                        y) & 1) == 0
    && (objc_msgSend(a1, "_isValidPositionFor90ControlWithXAlignment:yAlignment:size:nearestPoint:centerPoint:frame:", 2, 0, &origin, width, height, v15, v16, x, y) & 1) == 0&& (objc_msgSend(a1, "_isValidPositionFor90ControlWithXAlignment:yAlignment:size:nearestPoint:centerPoint:frame:", 2, 2, &origin, width, height,
                        v15,
                        v16,
                        x,
                        y) & 1) == 0)
  {
    v31.double x = x;
    v31.double y = y;
    double v18 = NSStringFromCGPoint(v31);
    v32.double x = v15;
    v32.double y = v16;
    CGFloat v19 = NSStringFromCGPoint(v32);
    v33.double width = width;
    v33.double height = height;
    double v28 = NSStringFromCGSize(v33);
    _AXAssert();

    objc_msgSend(a1, "_frameFor90ControlWithXAlignment:yAlignment:size:nearestPoint:", 1, 0, width, height, v15, v16, v18, v19, v28);
    origin.double x = v20;
    origin.double y = v21;
    v30.double width = v22;
    v30.double height = v23;
  }

  double v25 = origin.y;
  double v24 = origin.x;
  double v27 = v30.height;
  double v26 = v30.width;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

+ (CGRect)_frameWithIntegralOrigin:(CGRect)result
{
  double v3 = round(result.origin.x);
  double v4 = round(result.origin.y);
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)_updateRotation90Controls
{
  if ([(SCATGestureDrawingView *)self showsRotation90Controls])
  {
    [(SCATOutlineLabel *)self->_rotate90ClockwiseButton frame];
    double v4 = v3;
    double v6 = v5;
    [(SCATGestureDrawingView *)self _tailPoint];
    double v8 = v7;
    double v10 = v9;
    double v11 = objc_opt_class();
    [(SCATGestureDrawingView *)self angle];
    objc_msgSend(v11, "_bestFrameFor90ControlAtAngle:size:centerPoint:", v12 + 1.57079633, v4, v6, v8, v10);
    objc_msgSend((id)objc_opt_class(), "_frameWithIntegralOrigin:", v13, v14, v15, v16);
    -[SCATOutlineLabel setFrame:](self->_rotate90ClockwiseButton, "setFrame:");
    double v17 = objc_opt_class();
    [(SCATGestureDrawingView *)self angle];
    objc_msgSend(v17, "_bestFrameFor90ControlAtAngle:size:centerPoint:", v18 + -1.57079633, v4, v6, v8, v10);
    objc_msgSend((id)objc_opt_class(), "_frameWithIntegralOrigin:", v19, v20, v21, v22);
    -[SCATOutlineLabel setFrame:](self->_rotate90CounterclockwiseButton, "setFrame:");
  }
  [(SCATOutlineLabel *)self->_rotate90ClockwiseButton setHidden:[(SCATGestureDrawingView *)self showsRotation90Controls] ^ 1];
  uint64_t v23 = [(SCATGestureDrawingView *)self showsRotation90Controls] ^ 1;
  rotate90CounterclockwiseButton = self->_rotate90CounterclockwiseButton;

  [(SCATOutlineLabel *)rotate90CounterclockwiseButton setHidden:v23];
}

- (double)_midAngleForCurvedTrailWithTailPoint:(CGPoint)a3 fingerTrailDistance:(double)a4 distanceAlongArc:(double)a5 useSecondIntersectionPointIfNecessary:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a3.y;
  double x = a3.x;
  double v12 = +[SCATStyleProvider sharedStyleProvider];
  CGPoint v26 = CGPointZero;
  [(SCATGestureDrawingView *)self curvature];
  double v14 = fabs(1.0 / v13);
  [(SCATGestureDrawingView *)self angle];
  double v16 = v15;
  [(SCATGestureDrawingView *)self curvature];
  +[SCATGestureArrowView getCurveArcCenter:startAngle:endAngle:updatedFingerAngle:updatedFingerCenter:withFingerAngle:fingerCenter:curveRadius:distanceToMove:onLeft:](SCATGestureArrowView, "getCurveArcCenter:startAngle:endAngle:updatedFingerAngle:updatedFingerCenter:withFingerAngle:fingerCenter:curveRadius:distanceToMove:onLeft:", 0, 0, 0, 0, &v26, v17 < 0.0, v16, x, y, v14, a5);
  double v18 = atan2(v26.y - y, v26.x - x);
  if (v6)
  {
    objc_msgSend(v12, "controlArrowThickness", v18);
    double v20 = v14 * 6.28318531 - a5;
    if (v20 - (v19 + v19) < a4)
    {
      [(SCATGestureDrawingView *)self angle];
      double v22 = v21;
      [(SCATGestureDrawingView *)self curvature];
      +[SCATGestureArrowView getCurveArcCenter:startAngle:endAngle:updatedFingerAngle:updatedFingerCenter:withFingerAngle:fingerCenter:curveRadius:distanceToMove:onLeft:](SCATGestureArrowView, "getCurveArcCenter:startAngle:endAngle:updatedFingerAngle:updatedFingerCenter:withFingerAngle:fingerCenter:curveRadius:distanceToMove:onLeft:", 0, 0, 0, 0, &v26, v23 < 0.0, v22, x, y, v14, v20);
    }
    double v18 = atan2(v26.y - y, v26.x - x);
  }
  double v24 = v18;

  return v24;
}

- (void)_updateRotationControls
{
  if ([(SCATGestureDrawingView *)self showsRotationControls])
  {
    double v3 = +[SCATStyleProvider sharedStyleProvider];
    [(SCATGestureDrawingView *)self angle];
    [(SCATGestureArrowView *)self->_rotateClockwiseControl setTailAngle:v4 + 1.57079633];
    [v3 rotationControlAngleAwayFromMidAngle];
    double v6 = v5;
    [v3 rotationControlLength];
    double v8 = v7;
    [v3 rotationControlCurveRadius];
    double v10 = v9;
    [(SCATGestureDrawingView *)self _tailPoint];
    double v12 = v11;
    double v14 = v13;
    [(SCATGestureDrawingView *)self _tailPoint];
    double v36 = v16;
    double v37 = v15;
    [(SCATGestureDrawingView *)self angle];
    double v18 = v17;
    [(SCATGestureDrawingView *)self angle];
    double v20 = v19;
    [(SCATGestureDrawingView *)self curvature];
    if (v21 != 0.0)
    {
      [(SCATGestureDrawingView *)self _actualDistanceForFingerTrail];
      double v23 = v22;
      double v24 = v8;
      if (v10 <= v22) {
        double v25 = v10;
      }
      else {
        double v25 = v22;
      }
      [(SCATGestureDrawingView *)self curvature];
      -[SCATGestureDrawingView _midAngleForCurvedTrailWithTailPoint:fingerTrailDistance:distanceAlongArc:useSecondIntersectionPointIfNecessary:](self, "_midAngleForCurvedTrailWithTailPoint:fingerTrailDistance:distanceAlongArc:useSecondIntersectionPointIfNecessary:", v26 > 0.0, v12, v14, v23, v25);
      double v18 = v27;
      [(SCATGestureDrawingView *)self curvature];
      double v29 = v25;
      double v8 = v24;
      -[SCATGestureDrawingView _midAngleForCurvedTrailWithTailPoint:fingerTrailDistance:distanceAlongArc:useSecondIntersectionPointIfNecessary:](self, "_midAngleForCurvedTrailWithTailPoint:fingerTrailDistance:distanceAlongArc:useSecondIntersectionPointIfNecessary:", v28 < 0.0, v37, v36, v23, v29);
      double v20 = v30;
    }
    double v31 = v6 + v18;
    __double2 v32 = __sincos_stret(v31);
    -[SCATGestureArrowView setTailPoint:](self->_rotateClockwiseControl, "setTailPoint:", v12 + v10 * v32.__cosval, v14 + v10 * v32.__sinval);
    [(SCATGestureArrowView *)self->_rotateClockwiseControl setDistance:v8];
    [(SCATGestureArrowView *)self->_rotateClockwiseControl setTailAngle:v31 + 1.57079633];
    [(SCATGestureArrowView *)self->_rotateClockwiseControl setCurvature:1.0 / v10];
    __double2 v33 = __sincos_stret(v20 - v6);
    -[SCATGestureArrowView setTailPoint:](self->_rotateCounterclockwiseControl, "setTailPoint:", v37 + v10 * v33.__cosval, v36 + v10 * v33.__sinval);
    [(SCATGestureArrowView *)self->_rotateCounterclockwiseControl setDistance:v8];
    [(SCATGestureArrowView *)self->_rotateCounterclockwiseControl setTailAngle:v20 - v6 + -1.57079633];
    [(SCATGestureArrowView *)self->_rotateCounterclockwiseControl setCurvature:-1.0 / v10];
  }
  [(SCATGestureArrowView *)self->_rotateClockwiseControl setHidden:[(SCATGestureDrawingView *)self showsRotationControls] ^ 1];
  uint64_t v34 = [(SCATGestureDrawingView *)self showsRotationControls] ^ 1;
  rotateCounterclockwiseControl = self->_rotateCounterclockwiseControl;

  [(SCATGestureArrowView *)rotateCounterclockwiseControl setHidden:v34];
}

- (void)_updateCurvatureControl:(id)a3 withTailPoint:(CGPoint)a4 tailAngle:(double)a5 distance:(double)a6 curvature:(double)a7
{
  double y = a4.y;
  double x = a4.x;
  id v12 = a3;
  objc_msgSend(v12, "setTailPoint:", x, y);
  [v12 setTailAngle:a5];
  [v12 setDistance:a6];
  [v12 setCurvature:a7];
}

- (void)_updateCurvatureControls
{
  if ([(SCATGestureDrawingView *)self showsCurvatureControls])
  {
    [(SCATGestureDrawingView *)self _tailPoint];
    double v4 = v3;
    double v6 = v5;
    [(SCATGestureDrawingView *)self angle];
    double v8 = v7;
    [(SCATGestureDrawingView *)self previewDistance];
    double v10 = v9;
    [(SCATGestureDrawingView *)self curvature];
    double v12 = fmax(v11 * 0.0001, 0.01);
    [(SCATGestureDrawingView *)self curvature];
    double v14 = v13 + v12;
    if (v14 >= 0.005) {
      double v15 = v14;
    }
    else {
      double v15 = 0.005;
    }
    [(SCATGestureDrawingView *)self curvature];
    double v17 = v16 - v12;
    if (v17 <= -0.005) {
      double v18 = v17;
    }
    else {
      double v18 = -0.005;
    }
    -[SCATGestureDrawingView _updateCurvatureControl:withTailPoint:tailAngle:distance:curvature:](self, "_updateCurvatureControl:withTailPoint:tailAngle:distance:curvature:", self->_increaseCurveControl, v4, v6, v8, v10, v15);
    -[SCATGestureDrawingView _updateCurvatureControl:withTailPoint:tailAngle:distance:curvature:](self, "_updateCurvatureControl:withTailPoint:tailAngle:distance:curvature:", self->_decreaseCurveControl, v4, v6, v8, v10, v18);
    -[SCATGestureDrawingView _updateCurvatureControl:withTailPoint:tailAngle:distance:curvature:](self, "_updateCurvatureControl:withTailPoint:tailAngle:distance:curvature:", self->_straightenCurveControl, v4, v6, v8, v10, 0.0);
  }
  uint64_t v19 = [(SCATGestureDrawingView *)self showsCurvatureControls] ^ 1;
  double v20 = [(SCATGestureDrawingView *)self increaseCurveControl];
  [v20 setHidden:v19];

  uint64_t v21 = [(SCATGestureDrawingView *)self showsCurvatureControls] ^ 1;
  double v22 = [(SCATGestureDrawingView *)self decreaseCurveControl];
  [v22 setHidden:v21];

  if ([(SCATGestureDrawingView *)self showsCurvatureControls])
  {
    [(SCATGestureDrawingView *)self curvature];
    BOOL v24 = v23 == 0.0;
  }
  else
  {
    BOOL v24 = 1;
  }
  id v25 = [(SCATGestureDrawingView *)self straightenCurveControl];
  [v25 setHidden:v24];
}

- (BOOL)areFingersPressed
{
  return self->_fingersPressed;
}

- (BOOL)areFingersHighlighted
{
  return self->_fingersHighlighted;
}

- (BOOL)showsRotationControls
{
  return self->_showsRotationControls;
}

- (BOOL)showsRotation90Controls
{
  return self->_showsRotation90Controls;
}

- (BOOL)showsCurvatureControls
{
  return self->_showsCurvatureControls;
}

- (SCATGestureArrowView)rotateClockwiseControl
{
  return self->_rotateClockwiseControl;
}

- (SCATGestureArrowView)rotateCounterclockwiseControl
{
  return self->_rotateCounterclockwiseControl;
}

- (SCATOutlineLabel)rotate90ClockwiseButton
{
  return self->_rotate90ClockwiseButton;
}

- (SCATOutlineLabel)rotate90CounterclockwiseButton
{
  return self->_rotate90CounterclockwiseButton;
}

- (SCATGestureArrowView)increaseCurveControl
{
  return self->_increaseCurveControl;
}

- (SCATGestureArrowView)decreaseCurveControl
{
  return self->_decreaseCurveControl;
}

- (SCATGestureArrowView)straightenCurveControl
{
  return self->_straightenCurveControl;
}

- (CGRect)frameForToolbar
{
  double x = self->_frameForToolbar.origin.x;
  double y = self->_frameForToolbar.origin.y;
  double width = self->_frameForToolbar.size.width;
  double height = self->_frameForToolbar.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSArray)rotation90Controls
{
  return self->_rotation90Controls;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotation90Controls, 0);
  objc_storeStrong((id *)&self->_straightenCurveControl, 0);
  objc_storeStrong((id *)&self->_decreaseCurveControl, 0);
  objc_storeStrong((id *)&self->_increaseCurveControl, 0);
  objc_storeStrong((id *)&self->_rotate90CounterclockwiseButton, 0);
  objc_storeStrong((id *)&self->_rotate90ClockwiseButton, 0);
  objc_storeStrong((id *)&self->_rotateCounterclockwiseControl, 0);
  objc_storeStrong((id *)&self->_rotateClockwiseControl, 0);

  objc_storeStrong((id *)&self->_arrowViews, 0);
}

@end