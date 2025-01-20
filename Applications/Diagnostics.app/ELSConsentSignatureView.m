@interface ELSConsentSignatureView
- (BOOL)isForceTouchAvailable;
- (BOOL)isTouchTypeStylus:(id)a3;
- (BOOL)signatureExists;
- (CGSize)signatureImageSize;
- (ELSConsentSignatureView)initWithCoder:(id)a3;
- (ELSConsentSignatureView)initWithFrame:(CGRect)a3;
- (ELSConsentSignatureViewDelegate)delegate;
- (NSArray)backgroundLines;
- (NSArray)signaturePath;
- (NSMutableArray)pathArray;
- (UIBezierPath)currentPath;
- (UIColor)lineColor;
- (UIGestureRecognizer)signatureGestureRecognizer;
- (double)lineWidth;
- (double)lineWidthVariation;
- (double)placeholderPoint;
- (id)pathWithRoundedStyle;
- (id)signatureImage;
- (void)clear;
- (void)commitCurrentPath;
- (void)drawRect:(CGRect)a3;
- (void)gestureTouchesBegan:(id)a3 withEvent:(id)a4;
- (void)gestureTouchesMoved:(id)a3 withEvent:(id)a4;
- (void)makeSignatureGestureRecognizer;
- (void)setBackgroundLines:(id)a3;
- (void)setCurrentPath:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLineColor:(id)a3;
- (void)setLineWidth:(double)a3;
- (void)setLineWidthVariation:(double)a3;
- (void)setPathArray:(id)a3;
- (void)setSignatureGestureRecognizer:(id)a3;
- (void)setSignaturePath:(id)a3;
@end

@implementation ELSConsentSignatureView

- (ELSConsentSignatureView)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ELSConsentSignatureView;
  v3 = [(ELSConsentSignatureView *)&v11 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    v3->_lineWidth = 1.0;
    v3->_lineWidthVariation = 3.0;
    id v5 = +[UIColor lightGrayColor];
    id v6 = [v5 CGColor];
    v7 = [(ELSConsentSignatureView *)v4 layer];
    [v7 setBorderColor:v6];

    v8 = [(ELSConsentSignatureView *)v4 layer];
    [v8 setBorderWidth:1.0];

    v9 = [(ELSConsentSignatureView *)v4 layer];
    [v9 setCornerRadius:10.0];

    [(ELSConsentSignatureView *)v4 makeSignatureGestureRecognizer];
  }
  return v4;
}

- (ELSConsentSignatureView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ELSConsentSignatureView;
  v3 = -[ELSConsentSignatureView initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_lineWidth = 1.0;
    v3->_lineWidthVariation = 3.0;
    id v5 = +[UIColor lightGrayColor];
    id v6 = [v5 CGColor];
    v7 = [(ELSConsentSignatureView *)v4 layer];
    [v7 setBorderColor:v6];

    v8 = [(ELSConsentSignatureView *)v4 layer];
    [v8 setBorderWidth:1.0];

    v9 = [(ELSConsentSignatureView *)v4 layer];
    [v9 setCornerRadius:10.0];

    [(ELSConsentSignatureView *)v4 makeSignatureGestureRecognizer];
  }
  return v4;
}

- (id)pathWithRoundedStyle
{
  v3 = +[UIBezierPath bezierPath];
  [v3 setLineCapStyle:1];
  [(ELSConsentSignatureView *)self lineWidth];
  [v3 setLineWidth:];
  [v3 setLineJoinStyle:1];

  return v3;
}

- (void)makeSignatureGestureRecognizer
{
  if (!self->_signatureGestureRecognizer)
  {
    v3 = (UIGestureRecognizer *)objc_opt_new();
    signatureGestureRecognizer = self->_signatureGestureRecognizer;
    self->_signatureGestureRecognizer = v3;

    [(UIGestureRecognizer *)self->_signatureGestureRecognizer setEventDelegate:self];
    id v5 = self->_signatureGestureRecognizer;
    [(ELSConsentSignatureView *)self addGestureRecognizer:v5];
  }
}

- (UIColor)lineColor
{
  lineColor = self->_lineColor;
  if (!lineColor)
  {
    v4 = +[UIColor blackColor];
    id v5 = self->_lineColor;
    self->_lineColor = v4;

    lineColor = self->_lineColor;
  }

  return lineColor;
}

- (NSMutableArray)pathArray
{
  pathArray = self->_pathArray;
  if (!pathArray)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    id v5 = self->_pathArray;
    self->_pathArray = v4;

    pathArray = self->_pathArray;
  }

  return pathArray;
}

- (double)placeholderPoint
{
  [(ELSConsentSignatureView *)self bounds];
  double v3 = v2 * 0.7;
  v4 = +[UIFont systemFontOfSize:12.0];
  [v4 pointSize];
  double v6 = v3 + -5.0 - v5;
  [v4 descender];
  double v8 = v6 + v7;

  return v8;
}

- (NSArray)backgroundLines
{
  backgroundLines = self->_backgroundLines;
  if (!backgroundLines)
  {
    [(ELSConsentSignatureView *)self bounds];
    double v5 = v4;
    [(ELSConsentSignatureView *)self bounds];
    double v7 = v6;
    double v8 = +[UIBezierPath bezierPath];
    double v9 = v7 * 0.7;
    [v8 moveToPoint:0.0, v9];
    [v8 addLineToPoint:v5, v9];
    v13 = v8;
    v10 = +[NSArray arrayWithObjects:&v13 count:1];
    objc_super v11 = self->_backgroundLines;
    self->_backgroundLines = v10;

    backgroundLines = self->_backgroundLines;
  }

  return backgroundLines;
}

- (BOOL)isForceTouchAvailable
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001ABD8;
  block[3] = &unk_10014B0D8;
  block[4] = self;
  if (qword_100186918 != -1) {
    dispatch_once(&qword_100186918, block);
  }
  return byte_100186910;
}

- (BOOL)isTouchTypeStylus:(id)a3
{
  id v3 = a3;
  BOOL v4 = (objc_opt_respondsToSelector() & 1) != 0 && [v3 type] == (id)2;

  return v4;
}

- (void)gestureTouchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v21 = [v7 anyObject];
  double v8 = [(ELSConsentSignatureView *)self pathWithRoundedStyle];
  [(ELSConsentSignatureView *)self setCurrentPath:v8];

  [(ELSConsentSignatureView *)self setNeedsDisplay];
  [v21 previousLocationInView:self];
  self->previousPoint1.x = v9;
  self->previousPoint1.y = v10;
  [v21 previousLocationInView:self];
  self->previousPoint2.x = v11;
  self->previousPoint2.y = v12;
  p_currentPoint = &self->currentPoint;
  [v21 locationInView:self];
  self->currentPoint.x = v14;
  self->currentPoint.y = v15;
  if ([(ELSConsentSignatureView *)self isForceTouchAvailable]
    || [(ELSConsentSignatureView *)self isTouchTypeStylus:v21])
  {
    self->minPressure = 0.0;
    [v21 maximumPossibleForce];
    double v17 = v16 * 0.5;
    v18 = &OBJC_IVAR___ELSConsentSignatureView_maxPressure;
  }
  else
  {
    self->minPressure = 0.0;
    self->maxPressure = 9.0;
    [v21 timestamp];
    v18 = &OBJC_IVAR___ELSConsentSignatureView_previousTouchTime;
  }
  *(double *)((char *)&self->super.super.super.isa + *v18) = v17;
  v19 = [(ELSConsentSignatureView *)self currentPath];
  [v19 moveToPoint:p_currentPoint->x, self->currentPoint.y];

  v20 = [(ELSConsentSignatureView *)self currentPath];
  [v20 addArcWithCenter:CGPointMake(1, p_currentPoint->x) radius:self->currentPoint.y startAngle:0.1 endAngle:6.28318531 clockwise:0];

  [(ELSConsentSignatureView *)self gestureTouchesMoved:v7 withEvent:v6];
}

- (void)gestureTouchesMoved:(id)a3 withEvent:(id)a4
{
  id v65 = a4;
  id v6 = [a3 anyObject];
  [v6 locationInView:self];
  p_currentPoint = &self->currentPoint;
  double v10 = (v9 - self->currentPoint.y) * (v9 - self->currentPoint.y)
      + (v8 - self->currentPoint.x) * (v8 - self->currentPoint.x);
  if (v10 >= 25.0)
  {
    if ([(ELSConsentSignatureView *)self isForceTouchAvailable]
      || [(ELSConsentSignatureView *)self isTouchTypeStylus:v6])
    {
      [v6 force];
      double v12 = v11;
    }
    else
    {
      double maxPressure = self->maxPressure;
      [v65 timestamp];
      double v12 = maxPressure - log(sqrt(v10) / fmax(v14 - self->previousTouchTime, 0.0001));
      [v65 timestamp];
      self->previousTouchTime = v15;
    }
    double minPressure = self->minPressure;
    if (minPressure < v12) {
      double minPressure = v12;
    }
    if (self->maxPressure >= minPressure) {
      double v17 = minPressure;
    }
    else {
      double v17 = self->maxPressure;
    }
    v18 = [(ELSConsentSignatureView *)self currentPath];
    [v18 lineWidth];
    double v20 = v19;

    double v21 = v17 - self->minPressure;
    [(ELSConsentSignatureView *)self lineWidthVariation];
    double v23 = v21 * v22 / (self->maxPressure - self->minPressure);
    [(ELSConsentSignatureView *)self lineWidth];
    double v25 = v24 + v23;
    double v26 = v20 - v25;
    if (v20 - v25 < 0.0) {
      double v26 = -(v20 - v25);
    }
    if (v26 < 0.25) {
      goto LABEL_20;
    }
    if (v25 <= v20)
    {
      if (v25 >= v20)
      {
LABEL_19:
        [(ELSConsentSignatureView *)self commitCurrentPath];
        v28 = [(ELSConsentSignatureView *)self pathWithRoundedStyle];
        [(ELSConsentSignatureView *)self setCurrentPath:v28];

        v29 = [(ELSConsentSignatureView *)self currentPath];
        [v29 setLineWidth:v20];

        __asm { FMOV            V1.2D, #0.5 }
        float64x2_t v64 = vmulq_f64(vaddq_f64(*(float64x2_t *)p_currentPoint, (float64x2_t)self->previousPoint1), _Q1);
        v35 = [(ELSConsentSignatureView *)self currentPath];
        [v35 moveToPoint:*(_OWORD *)&v64];

LABEL_20:
        self->previousPoint2 = self->previousPoint1;
        [v6 previousLocationInView:self];
        self->previousPoint1.double x = v36;
        self->previousPoint1.double y = v37;
        [v6 locationInView:self];
        p_currentPoint->double x = v38;
        self->currentPoint.double y = v39;
        double y = self->previousPoint1.y;
        CGFloat v41 = (self->previousPoint1.x + self->previousPoint2.x) * 0.5;
        double v42 = (y + self->previousPoint2.y) * 0.5;
        double v43 = (v38 + self->previousPoint1.x) * 0.5;
        double v44 = (y + v39) * 0.5;
        v45 = +[UIBezierPath bezierPath];
        [v45 moveToPoint:v41, v42];
        [v45 addQuadCurveToPoint:v43 controlPoint:self->previousPoint1.x, self->previousPoint1.y];
        id v46 = v45;
        BoundingBodouble x = CGPathGetBoundingBox((CGPathRef)[v46 CGPath]);
        double x = BoundingBox.origin.x;
        double v48 = BoundingBox.origin.y;
        double width = BoundingBox.size.width;
        double height = BoundingBox.size.height;
        v51 = [(ELSConsentSignatureView *)self currentPath];
        [v51 addQuadCurveToPoint:v43 controlPoint:v44 self->previousPoint1.x, self->previousPoint1.y];

        v52 = [(ELSConsentSignatureView *)self currentPath];
        [v52 lineWidth];
        double v54 = x - v53 * 2.0;

        v55 = [(ELSConsentSignatureView *)self currentPath];
        [v55 lineWidth];
        double v57 = v48 - v56 * 2.0;

        v58 = [(ELSConsentSignatureView *)self currentPath];
        [v58 lineWidth];
        double v60 = width + v59 * 4.0;

        v61 = [(ELSConsentSignatureView *)self currentPath];
        [v61 lineWidth];
        double v63 = height + v62 * 4.0;

        -[ELSConsentSignatureView setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:", v54, v57, v60, v63);
        goto LABEL_21;
      }
      double v27 = -0.25;
    }
    else
    {
      double v27 = 0.25;
    }
    double v20 = v20 + v27;
    goto LABEL_19;
  }
LABEL_21:
}

- (void)commitCurrentPath
{
  id v3 = [(ELSConsentSignatureView *)self currentPath];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  if (v5 != CGSizeZero.width || v7 != CGSizeZero.height)
  {
    double v9 = [(ELSConsentSignatureView *)self pathArray];
    double v10 = [(ELSConsentSignatureView *)self currentPath];
    [v9 addObject:v10];

    id v11 = [(ELSConsentSignatureView *)self delegate];
    [v11 didEdit:self];
  }
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = +[UIColor whiteColor];
  [v8 setFill];

  CurrentContext = UIGraphicsGetCurrentContext();
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGContextFillRect(CurrentContext, v24);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v10 = [(ELSConsentSignatureView *)self pathArray];
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      double v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v14);
        double v16 = [(ELSConsentSignatureView *)self lineColor];
        [v16 setStroke];

        [v15 stroke];
        double v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  double v17 = [(ELSConsentSignatureView *)self lineColor];
  [v17 setStroke];

  v18 = [(ELSConsentSignatureView *)self currentPath];
  [v18 stroke];
}

- (NSArray)signaturePath
{
  double v2 = [(ELSConsentSignatureView *)self pathArray];
  id v3 = [v2 copy];

  return (NSArray *)v3;
}

- (void)setSignaturePath:(id)a3
{
  if (a3)
  {
    double v4 = (NSMutableArray *)[a3 mutableCopy];
    pathArraCGFloat y = self->_pathArray;
    self->_pathArraCGFloat y = v4;

    [(ELSConsentSignatureView *)self setNeedsDisplay];
  }
}

- (id)signatureImage
{
  [(ELSConsentSignatureView *)self signatureImageSize];
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.85);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(ELSConsentSignatureView *)self pathArray];
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        double v9 = [(ELSConsentSignatureView *)self lineColor];
        [v9 setStroke];

        [v8 stroke];
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  double v10 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v10;
}

- (BOOL)signatureExists
{
  double v2 = [(ELSConsentSignatureView *)self pathArray];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)clear
{
  BOOL v3 = [(ELSConsentSignatureView *)self pathArray];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = [(ELSConsentSignatureView *)self currentPath];

    if (v5)
    {
      uint64_t v6 = [(ELSConsentSignatureView *)self pathWithRoundedStyle];
      [(ELSConsentSignatureView *)self setCurrentPath:v6];
    }
    double v7 = [(ELSConsentSignatureView *)self pathArray];
    [v7 removeAllObjects];

    [(ELSConsentSignatureView *)self bounds];
    -[ELSConsentSignatureView setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
  }
}

- (CGSize)signatureImageSize
{
  [(ELSConsentSignatureView *)self frame];
  if (v3 == 0.0)
  {
    double v7 = 175.0;
  }
  else
  {
    [(ELSConsentSignatureView *)self frame];
    double v5 = 175.0 / v4;
    [(ELSConsentSignatureView *)self frame];
    double v7 = v6 * v5;
  }
  double v8 = 175.0;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)setLineColor:(id)a3
{
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (double)lineWidthVariation
{
  return self->_lineWidthVariation;
}

- (void)setLineWidthVariation:(double)a3
{
  self->_lineWidthVariation = a3;
}

- (ELSConsentSignatureViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ELSConsentSignatureViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIGestureRecognizer)signatureGestureRecognizer
{
  return self->_signatureGestureRecognizer;
}

- (void)setSignatureGestureRecognizer:(id)a3
{
}

- (UIBezierPath)currentPath
{
  return self->_currentPath;
}

- (void)setCurrentPath:(id)a3
{
}

- (void)setPathArray:(id)a3
{
}

- (void)setBackgroundLines:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundLines, 0);
  objc_storeStrong((id *)&self->_pathArray, 0);
  objc_storeStrong((id *)&self->_currentPath, 0);
  objc_storeStrong((id *)&self->_signatureGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lineColor, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);

  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

@end