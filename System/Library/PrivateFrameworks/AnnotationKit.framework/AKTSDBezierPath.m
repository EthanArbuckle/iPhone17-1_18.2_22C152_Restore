@interface AKTSDBezierPath
+ (double)defaultFlatness;
+ (double)defaultLineWidth;
+ (double)defaultMiterLimit;
+ (double)flatness;
+ (double)lineWidth;
+ (double)miterLimit;
+ (id)bezierPath;
+ (id)bezierPathWithCGPath:(CGPath *)a3;
+ (id)bezierPathWithOvalInRect:(CGRect)a3;
+ (id)bezierPathWithRect:(CGRect)a3;
+ (id)bezierPathWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4;
+ (id)bezierPathWithStart:(CGPoint)a3 end:(CGPoint)a4;
+ (unint64_t)defaultLineCapStyle;
+ (unint64_t)defaultLineJoinStyle;
+ (unint64_t)defaultWindingRule;
+ (unint64_t)lineCapStyle;
+ (unint64_t)lineJoinStyle;
+ (unint64_t)windingRule;
+ (void)clipRect:(CGRect)a3;
+ (void)fillRect:(CGRect)a3;
+ (void)initialize;
+ (void)setDefaultFlatness:(double)a3;
+ (void)setDefaultLineCapStyle:(unint64_t)a3;
+ (void)setDefaultLineJoinStyle:(unint64_t)a3;
+ (void)setDefaultLineWidth:(double)a3;
+ (void)setDefaultMiterLimit:(double)a3;
+ (void)setDefaultWindingRule:(unint64_t)a3;
+ (void)setFlatness:(double)a3;
+ (void)setLineCapStyle:(unint64_t)a3;
+ (void)setLineJoinStyle:(unint64_t)a3;
+ (void)setLineWidth:(double)a3;
+ (void)setMiterLimit:(double)a3;
+ (void)setWindingRule:(unint64_t)a3;
+ (void)strokeLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4;
+ (void)strokeRect:(CGRect)a3;
- (AKTSDBezierPath)init;
- (AKTSDBezierPath)initWithCString:(const char *)a3;
- (AKTSDBezierPath)initWithCoder:(id)a3;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)isClockwise;
- (BOOL)isEmpty;
- (BOOL)isFlat;
- (CGPath)CGPath;
- (CGPoint)currentPoint;
- (CGPoint)gradientAt:(double)a3 fromElement:(int64_t)a4;
- (CGPoint)gradientAt:(float)a3;
- (CGPoint)myGradientAt:(float)a3;
- (CGPoint)myGradientAt:(float)a3 fromElement:(int64_t)a4;
- (CGPoint)nearestAngleOnPathToLine:(CGPoint)a3[2];
- (CGPoint)nearestPointOnPathToLine:(CGPoint)a3[2];
- (CGPoint)pointAt:(double)a3 fromElement:(int64_t)a4;
- (CGPoint)rawGradientAt:(float)a3 fromElement:(int64_t)a4;
- (CGPoint)transformedCoordinate:(CGPoint)a3 withPressure:(id)a4;
- (CGPoint)transformedTotalCoordinate:(CGPoint)a3 betweenElement:(int64_t)a4 andElement:(int64_t)a5 withPressure:(id)a6 getElement:(int64_t *)a7 getPercentage:(float *)a8;
- (CGPoint)transformedTotalCoordinate:(CGPoint)a3 inElement:(int64_t)a4 withPressure:(id)a5;
- (CGRect)bounds;
- (CGRect)controlPointBounds;
- (const)cString;
- (double)calculateLengthOfElement:(int64_t)a3;
- (double)curvatureAt:(double)a3 fromElement:(int)a4;
- (double)flatness;
- (double)length;
- (double)lengthOfElement:(int64_t)a3;
- (double)lengthToElement:(int64_t)a3;
- (double)lineWidth;
- (double)miterLimit;
- (float)curvatureAt:(float)a3;
- (float)elementPercentageFromElement:(int)a3 forOverallPercentage:(float)a4;
- (id)_copyFlattenedPath;
- (id)bezierPathByFlatteningPath;
- (id)bezierPathByReversingPath;
- (id)chisel;
- (id)copyFromSegment:(int)a3 t:(float)a4 toSegment:(int)a5 t:(float)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)pressure;
- (int64_t)elementCount;
- (int64_t)elementPercentage:(float *)a3 forOverallPercentage:(float)a4;
- (unint64_t)elementAtIndex:(int64_t)a3;
- (unint64_t)elementAtIndex:(int64_t)a3 allPoints:(CGPoint *)a4;
- (unint64_t)elementAtIndex:(int64_t)a3 associatedPoints:(CGPoint *)a4;
- (unint64_t)lineCapStyle;
- (unint64_t)lineJoinStyle;
- (unint64_t)windingRule;
- (void)_addPathSegment:(int64_t)a3 point:(CGPoint)a4;
- (void)_appendArcSegmentWithCenter:(CGPoint)a3 radius:(double)a4 angle1:(double)a5 angle2:(double)a6;
- (void)_appendToPath:(id)a3;
- (void)_deviceClosePath;
- (void)_deviceCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5;
- (void)_deviceLineToPoint:(CGPoint)a3;
- (void)_deviceMoveToPoint:(CGPoint)a3;
- (void)_doPath;
- (void)addClip;
- (void)addIntersectionsWithLine:(CGPoint)a3[2] to:(id)a4;
- (void)addIntersectionsWithPath:(id)a3 to:(id)a4;
- (void)addIntersectionsWithPath:(id)a3 to:(id)a4 allIntersections:(BOOL)a5 reversed:(BOOL)a6;
- (void)appendBezierPath:(id)a3;
- (void)appendBezierPath:(id)a3 fromSegment:(int64_t)a4 t:(double)a5 toSegment:(int64_t)a6 t:(double)a7 withoutMove:(BOOL)a8;
- (void)appendBezierPath:(id)a3 fromSegment:(int64_t)a4 toSegment:(int64_t)a5;
- (void)appendBezierPathWithArcFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 radius:(double)a5;
- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6;
- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6 clockwise:(BOOL)a7;
- (void)appendBezierPathWithOvalInRect:(CGRect)a3;
- (void)appendBezierPathWithPoints:(CGPoint *)a3 count:(int64_t)a4;
- (void)appendBezierPathWithRect:(CGRect)a3;
- (void)calculateLengths;
- (void)closePath;
- (void)curveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fill;
- (void)flattenIntoPath:(id)a3;
- (void)getLineDash:(double *)a3 count:(int64_t *)a4 phase:(double *)a5;
- (void)getStartPoint:(CGPoint *)a3 andEndPoint:(CGPoint *)a4;
- (void)lineToPoint:(CGPoint)a3;
- (void)recursiveSubdivideOntoPath:(id)a3 into:(id)a4;
- (void)recursiveSubdivideOntoPath:(id)a3 withScaling:(id)a4 inElementRange:(_NSRange)a5 into:(id)a6;
- (void)recursiveSubdivideOntoPath:(id)a3 withScaling:(id)a4 into:(id)a5;
- (void)relativeCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5;
- (void)relativeLineToPoint:(CGPoint)a3;
- (void)relativeMoveToPoint:(CGPoint)a3;
- (void)removeAllPoints;
- (void)setAssociatedPoints:(CGPoint *)a3 atIndex:(int64_t)a4;
- (void)setFlatness:(double)a3;
- (void)setLineCapStyle:(unint64_t)a3;
- (void)setLineDash:(const double *)a3 count:(int64_t)a4 phase:(double)a5;
- (void)setLineJoinStyle:(unint64_t)a3;
- (void)setLineWidth:(double)a3;
- (void)setMiterLimit:(double)a3;
- (void)setWindingRule:(unint64_t)a3;
- (void)stroke;
- (void)subdivideBezierWithFlatness:(double)a3 startPoint:(CGPoint)a4 controlPoint1:(CGPoint)a5 controlPoint2:(CGPoint)a6 endPoint:(CGPoint)a7;
- (void)transformUsingAffineTransform:(CGAffineTransform *)a3;
@end

@implementation AKTSDBezierPath

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    MEMORY[0x270F9A6D0](AKTSDBezierPath, sel_setVersion_);
  }
}

+ (id)bezierPath
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)bezierPathWithStart:(CGPoint)a3 end:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  v8 = [a1 bezierPath];
  objc_msgSend(v8, "moveToPoint:", v7, v6);
  objc_msgSend(v8, "lineToPoint:", x, y);

  return v8;
}

+ (id)bezierPathWithRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = [a1 bezierPath];
  objc_msgSend(v7, "appendBezierPathWithRect:", x, y, width, height);

  return v7;
}

+ (id)bezierPathWithOvalInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = [a1 bezierPath];
  objc_msgSend(v7, "appendBezierPathWithOvalInRect:", x, y, width, height);

  return v7;
}

+ (id)bezierPathWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4
{
  return 0;
}

+ (id)bezierPathWithCGPath:(CGPath *)a3
{
  v4 = [a1 bezierPath];
  CGPathApply(a3, v4, (CGPathApplierFunction)sub_237646CAC);

  return v4;
}

+ (void)fillRect:(CGRect)a3
{
  if (a3.size.width >= 0.0)
  {
    CGFloat height = a3.size.height;
    if (a3.size.height >= 0.0)
    {
      CGFloat width = a3.size.width;
      CGFloat y = a3.origin.y;
      CGFloat x = a3.origin.x;
      CurrentContext = UIGraphicsGetCurrentContext();
      CGFloat v8 = x;
      CGFloat v9 = y;
      CGFloat v10 = width;
      CGFloat v11 = height;
      CGContextFillRect(CurrentContext, *(CGRect *)&v8);
    }
  }
}

+ (void)strokeRect:(CGRect)a3
{
  if (a3.size.width >= 0.0)
  {
    CGFloat height = a3.size.height;
    if (a3.size.height >= 0.0)
    {
      CGFloat width = a3.size.width;
      CGFloat y = a3.origin.y;
      CGFloat x = a3.origin.x;
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextSaveGState(CurrentContext);
      CGContextSetLineCap(CurrentContext, (CGLineCap)qword_268925138);
      CGContextSetLineJoin(CurrentContext, (CGLineJoin)qword_268925140);
      sub_237646A08(CurrentContext, *(CGFloat *)&qword_2689234B8);
      CGContextSetMiterLimit(CurrentContext, *(CGFloat *)&qword_2689234C0);
      CGContextBeginPath(CurrentContext);
      v17.origin.CGFloat x = x;
      v17.origin.CGFloat y = y;
      v17.size.CGFloat width = width;
      v17.size.CGFloat height = height;
      CGFloat MinX = CGRectGetMinX(v17);
      v18.origin.CGFloat x = x;
      v18.origin.CGFloat y = y;
      v18.size.CGFloat width = width;
      v18.size.CGFloat height = height;
      CGFloat MinY = CGRectGetMinY(v18);
      CGContextMoveToPoint(CurrentContext, MinX, MinY);
      v19.origin.CGFloat x = x;
      v19.origin.CGFloat y = y;
      v19.size.CGFloat width = width;
      v19.size.CGFloat height = height;
      CGFloat MaxX = CGRectGetMaxX(v19);
      v20.origin.CGFloat x = x;
      v20.origin.CGFloat y = y;
      v20.size.CGFloat width = width;
      v20.size.CGFloat height = height;
      CGFloat v11 = CGRectGetMinY(v20);
      CGContextAddLineToPoint(CurrentContext, MaxX, v11);
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.CGFloat width = width;
      v21.size.CGFloat height = height;
      CGFloat v12 = CGRectGetMaxX(v21);
      v22.origin.CGFloat x = x;
      v22.origin.CGFloat y = y;
      v22.size.CGFloat width = width;
      v22.size.CGFloat height = height;
      CGFloat MaxY = CGRectGetMaxY(v22);
      CGContextAddLineToPoint(CurrentContext, v12, MaxY);
      v23.origin.CGFloat x = x;
      v23.origin.CGFloat y = y;
      v23.size.CGFloat width = width;
      v23.size.CGFloat height = height;
      CGFloat v14 = CGRectGetMinX(v23);
      v24.origin.CGFloat x = x;
      v24.origin.CGFloat y = y;
      v24.size.CGFloat width = width;
      v24.size.CGFloat height = height;
      CGFloat v15 = CGRectGetMaxY(v24);
      CGContextAddLineToPoint(CurrentContext, v14, v15);
      CGContextClosePath(CurrentContext);
      CGContextStrokePath(CurrentContext);
      CGContextRestoreGState(CurrentContext);
    }
  }
}

+ (void)clipRect:(CGRect)a3
{
  if (a3.size.width >= 0.0)
  {
    CGFloat height = a3.size.height;
    if (a3.size.height >= 0.0)
    {
      CGFloat width = a3.size.width;
      CGFloat y = a3.origin.y;
      CGFloat x = a3.origin.x;
      CurrentContext = UIGraphicsGetCurrentContext();
      CGFloat v8 = x;
      CGFloat v9 = y;
      CGFloat v10 = width;
      CGFloat v11 = height;
      CGContextClipToRect(CurrentContext, *(CGRect *)&v8);
    }
  }
}

+ (void)strokeLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v6 = a3.y;
  CGFloat v7 = a3.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextSetLineCap(CurrentContext, (CGLineCap)qword_268925138);
  CGContextSetLineJoin(CurrentContext, (CGLineJoin)qword_268925140);
  sub_237646A08(CurrentContext, *(CGFloat *)&qword_2689234B8);
  CGContextBeginPath(CurrentContext);
  CGContextMoveToPoint(CurrentContext, v7, v6);
  CGContextAddLineToPoint(CurrentContext, x, y);
  CGContextStrokePath(CurrentContext);

  CGContextRestoreGState(CurrentContext);
}

+ (void)setDefaultMiterLimit:(double)a3
{
  qword_2689234C0 = *(void *)&a3;
}

+ (double)defaultMiterLimit
{
  return *(double *)&qword_2689234C0;
}

+ (void)setDefaultFlatness:(double)a3
{
  qword_2689234C8 = *(void *)&a3;
}

+ (double)defaultFlatness
{
  return *(double *)&qword_2689234C8;
}

+ (void)setDefaultWindingRule:(unint64_t)a3
{
  qword_268925148 = a3;
}

+ (unint64_t)defaultWindingRule
{
  return qword_268925148;
}

+ (void)setDefaultLineCapStyle:(unint64_t)a3
{
  qword_268925138 = a3;
}

+ (unint64_t)defaultLineCapStyle
{
  return qword_268925138;
}

+ (void)setDefaultLineJoinStyle:(unint64_t)a3
{
  qword_268925140 = a3;
}

+ (unint64_t)defaultLineJoinStyle
{
  return qword_268925140;
}

+ (void)setDefaultLineWidth:(double)a3
{
  qword_2689234B8 = *(void *)&a3;
}

+ (double)defaultLineWidth
{
  return *(double *)&qword_2689234B8;
}

- (AKTSDBezierPath)init
{
  v9.receiver = self;
  v9.super_class = (Class)AKTSDBezierPath;
  id v2 = [(AKTSDBezierPath *)&v9 init];
  v3 = (AKTSDBezierPath *)v2;
  if (v2)
  {
    int v4 = *((_DWORD *)v2 + 42);
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *((void *)v2 + 19) = 0;
    *((void *)v2 + 20) = 0;
    *((void *)v2 + 5) = 0;
    *((void *)v2 + 6) = -1;
    *((void *)v2 + 7) = 0;
    int v5 = ((8 * qword_268925148) | ((_BYTE)qword_268925138 << 6)) | 5 | v4 & 0xFFFFF800 | (16 * (qword_268925140 & 0xF));
    *((void *)v2 + 8) = qword_2689234B8;
    uint64_t v6 = qword_2689234C8;
    *((void *)v2 + 13) = qword_2689234C0;
    *((void *)v2 + 14) = v6;
    *((void *)v2 + 15) = 0;
    *((void *)v2 + 16) = 0;
    *((void *)v2 + 17) = 0;
    *((_DWORD *)v2 + 42) = v5;
    CGFloat v7 = v2;
  }

  return v3;
}

- (void)dealloc
{
  free(self->sfr_head);
  free(self->sfr_elementLength);
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (sfr_dashedLinePattern) {
    free(sfr_dashedLinePattern);
  }
  sfr_path = self->sfr_path;
  if (sfr_path) {
    CFRelease(sfr_path);
  }
  sfr_extraSegments = self->sfr_extraSegments;
  if (sfr_extraSegments) {
    free(sfr_extraSegments);
  }
  v6.receiver = self;
  v6.super_class = (Class)AKTSDBezierPath;
  [(AKTSDBezierPath *)&v6 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 appendBezierPath:self];
  objc_msgSend(v4, "setWindingRule:", -[AKTSDBezierPath windingRule](self, "windingRule"));
  objc_msgSend(v4, "setLineCapStyle:", -[AKTSDBezierPath lineCapStyle](self, "lineCapStyle"));
  objc_msgSend(v4, "setLineJoinStyle:", -[AKTSDBezierPath lineJoinStyle](self, "lineJoinStyle"));
  [(AKTSDBezierPath *)self lineWidth];
  objc_msgSend(v4, "setLineWidth:");
  [(AKTSDBezierPath *)self miterLimit];
  objc_msgSend(v4, "setMiterLimit:");
  [(AKTSDBezierPath *)self flatness];
  objc_msgSend(v4, "setFlatness:");
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (sfr_dashedLinePattern) {
    [v4 setLineDash:sfr_dashedLinePattern count:self->sfr_dashedLineCount phase:self->sfr_dashedLinePhase];
  }
  return v4;
}

- (void)lineToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(AKTSDBezierPath *)self isEmpty]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"No current point for line"];
  }

  -[AKTSDBezierPath _deviceLineToPoint:](self, "_deviceLineToPoint:", x, y);
}

- (void)curveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  if ([(AKTSDBezierPath *)self isEmpty]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"No current point for curve"];
  }

  MEMORY[0x270F9A6D0](self, sel__deviceCurveToPoint_controlPoint1_controlPoint2_);
}

- (void)closePath
{
}

- (void)removeAllPoints
{
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF);
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = sfr_bpFlags;
  self->sfr_elementCount = 0;
  self->sfr_extraSegmentCount = 0;
  self->sfr_lastSubpathIndedouble x = -1;
  sfr_path = self->sfr_path;
  if (sfr_path)
  {
    CFRelease(sfr_path);
    self->sfr_path = 0;
    $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = self->sfr_bpFlags;
  }
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags | 1);
}

- (void)relativeMoveToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(AKTSDBezierPath *)self currentPoint];
  double v7 = x + v6;
  double v9 = y + v8;

  -[AKTSDBezierPath _deviceMoveToPoint:](self, "_deviceMoveToPoint:", v7, v9);
}

- (void)relativeLineToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(AKTSDBezierPath *)self currentPoint];
  double v7 = x + v6;
  double v9 = y + v8;

  -[AKTSDBezierPath _deviceLineToPoint:](self, "_deviceLineToPoint:", v7, v9);
}

- (void)relativeCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  [(AKTSDBezierPath *)self currentPoint];

  MEMORY[0x270F9A6D0](self, sel__deviceCurveToPoint_controlPoint1_controlPoint2_);
}

- (double)lineWidth
{
  return self->sfr_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->sfr_lineWidth = a3;
}

- (unint64_t)lineCapStyle
{
  return *(_DWORD *)&self->sfr_bpFlags >> 6;
}

- (void)setLineCapStyle:(unint64_t)a3
{
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFF3F | ((a3 & 3) << 6));
}

- (unint64_t)lineJoinStyle
{
  return ((unint64_t)self->sfr_bpFlags >> 4) & 3;
}

- (void)setLineJoinStyle:(unint64_t)a3
{
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFFCF | (16 * (a3 & 0xF)));
}

- (unint64_t)windingRule
{
  return ((unint64_t)self->sfr_bpFlags >> 3) & 1;
}

- (void)setWindingRule:(unint64_t)a3
{
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFFF7 | (8 * (a3 & 0x1F)));
}

- (double)miterLimit
{
  return self->sfr_miterLimit;
}

- (void)setMiterLimit:(double)a3
{
  self->sfr_miterLimit = a3;
}

- (double)flatness
{
  return self->sfr_flatness;
}

- (void)setFlatness:(double)a3
{
  self->sfr_flatness = a3;
}

- (void)setLineDash:(const double *)a3 count:(int64_t)a4 phase:(double)a5
{
  if (!a3) {
    goto LABEL_14;
  }
  int64_t v6 = a4;
  BOOL v7 = a4 < 0;
  if (a4 >= 0) {
    unint64_t v8 = a4;
  }
  else {
    unint64_t v8 = -a4;
  }
  if (a4 >= 0) {
    size_t v9 = 8 * v8;
  }
  else {
    size_t v9 = -8 * v8;
  }
  if (!(8 * v8)) {
    BOOL v7 = 0;
  }
  if (v8 >> 61 || v7)
  {
LABEL_14:
    p_sfr_dashedLinePattern = &self->sfr_dashedLinePattern;
    sfr_dashedLinePattern = self->sfr_dashedLinePattern;
    if (sfr_dashedLinePattern)
    {
      free(sfr_dashedLinePattern);
      *p_sfr_dashedLinePattern = 0;
      p_sfr_dashedLinePattern[1] = 0;
      p_sfr_dashedLinePattern[2] = 0;
    }
  }
  else
  {
    CGFloat v11 = a3;
    CGFloat v12 = self->sfr_dashedLinePattern;
    if (v12) {
      v13 = (double *)malloc_type_realloc(v12, v9, 0x9EE8C79BuLL);
    }
    else {
      v13 = (double *)malloc_type_malloc(v9, 0x87648000uLL);
    }
    self->sfr_dashedLinePattern = v13;
    self->sfr_dashedLineCount = v6;
    self->sfr_dashedLinePhase = a5;
    if (v6 >= 1)
    {
      do
      {
        uint64_t v16 = *(void *)v11++;
        *(void *)v13++ = v16;
        --v6;
      }
      while (v6);
    }
  }
}

- (void)getLineDash:(double *)a3 count:(int64_t *)a4 phase:(double *)a5
{
  if (a4) {
    *a4 = self->sfr_dashedLineCount;
  }
  if (a5) {
    *a5 = self->sfr_dashedLinePhase;
  }
  if (a3)
  {
    sfr_dashedLinePattern = self->sfr_dashedLinePattern;
    if (sfr_dashedLinePattern)
    {
      for (unint64_t i = self->sfr_dashedLineCount; i; --i)
      {
        uint64_t v7 = *(void *)sfr_dashedLinePattern++;
        *(void *)a3++ = v7;
      }
    }
  }
}

- (void)_doPath
{
  if (!self->sfr_path && ![(AKTSDBezierPath *)self isEmpty])
  {
    Mutable = CGPathCreateMutable();
    int64_t sfr_elementCount = self->sfr_elementCount;
    if (sfr_elementCount >= 1)
    {
      sfr_head = self->sfr_head;
      int64_t v6 = &sfr_head[6 * sfr_elementCount];
      sfr_extraSegments = (CGFloat *)self->sfr_extraSegments;
      do
      {
        switch(*(_DWORD *)sfr_head & 0xF)
        {
          case 0:
            CGPathMoveToPoint(Mutable, 0, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
            break;
          case 1:
            CGPathAddLineToPoint(Mutable, 0, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
            break;
          case 2:
            CGPathAddCurveToPoint(Mutable, 0, *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
            sfr_extraSegments += 4;
            break;
          case 3:
            CGPathCloseSubpath(Mutable);
            break;
          default:
            break;
        }
        sfr_head += 6;
      }
      while (sfr_head < v6);
    }
    self->sfr_path = Mutable;
  }
}

- (void)stroke
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextSetLineCap(CurrentContext, (CGLineCap)[(AKTSDBezierPath *)self lineCapStyle]);
  CGContextSetLineJoin(CurrentContext, (CGLineJoin)[(AKTSDBezierPath *)self lineJoinStyle]);
  sub_237646A08(CurrentContext, self->sfr_lineWidth);
  CGContextSetMiterLimit(CurrentContext, self->sfr_miterLimit);
  CGContextSetFlatness(CurrentContext, self->sfr_flatness);
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (sfr_dashedLinePattern) {
    CGContextSetLineDash(CurrentContext, self->sfr_dashedLinePhase, sfr_dashedLinePattern, self->sfr_dashedLineCount);
  }
  sub_2376479DC(self, CurrentContext);
  CGContextStrokePath(CurrentContext);

  CGContextRestoreGState(CurrentContext);
}

- (void)fill
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextSetFlatness(CurrentContext, self->sfr_flatness);
  sub_2376479DC(self, CurrentContext);
  if ([(AKTSDBezierPath *)self windingRule]) {
    CGContextEOFillPath(CurrentContext);
  }
  else {
    CGContextFillPath(CurrentContext);
  }

  CGContextRestoreGState(CurrentContext);
}

- (void)addClip
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetFlatness(CurrentContext, self->sfr_flatness);
  CGContextBeginPath(CurrentContext);
  sub_2376479DC(self, CurrentContext);
  if ([(AKTSDBezierPath *)self windingRule]) {
    CGContextEOClip(CurrentContext);
  }
  else {
    CGContextClip(CurrentContext);
  }

  CGContextBeginPath(CurrentContext);
}

- (void)subdivideBezierWithFlatness:(double)a3 startPoint:(CGPoint)a4 controlPoint1:(CGPoint)a5 controlPoint2:(CGPoint)a6 endPoint:(CGPoint)a7
{
  float64x2_t v8 = (float64x2_t)a4;
  a4.double x = a7.x;
  *(CGFloat *)&long long v7 = a7.y;
  CGFloat y = a5.y;
  float64x2_t v11 = vsubq_f64((float64x2_t)a5, v8);
  CGFloat v12 = a6.y;
  CGPoint v38 = a4;
  long long v39 = v7;
  CGFloat v13 = a7.y;
  float64x2_t v14 = vsubq_f64((float64x2_t)a6, (float64x2_t)a5);
  float64x2_t v15 = vsubq_f64(v14, v11);
  float64x2_t v16 = vsubq_f64(vsubq_f64((float64x2_t)a4, (float64x2_t)a6), v14);
  float64x2_t v17 = (float64x2_t)vzip2q_s64((int64x2_t)v15, (int64x2_t)v16);
  float64x2_t v18 = (float64x2_t)vzip1q_s64((int64x2_t)v15, (int64x2_t)v16);
  float64x2_t v19 = vmlaq_f64(vmulq_f64(v17, v17), v18, v18);
  if (v19.f64[0] <= v19.f64[1]) {
    v19.f64[0] = v19.f64[1];
  }
  double v20 = a3 * a3;
  double v21 = v19.f64[0] * 9.0 * 0.0625;
  if (v21 > v20)
  {
    float64x2_t v22 = vsubq_f64(v16, v15);
    __asm
    {
      FMOV            V5.2D, #3.0
      FMOV            V6.2D, #6.0
    }
    float64x2_t v29 = vmulq_f64(v22, _Q6);
    float64x2_t v30 = vmlaq_f64(v22, _Q5, vaddq_f64(v11, v15));
    float64x2_t v31 = vmulq_f64(vaddq_f64(v15, v22), _Q6);
    uint64_t v32 = 1;
    __asm
    {
      FMOV            V2.2D, #0.125
      FMOV            V3.2D, #0.25
      FMOV            V4.2D, #0.5
    }
    do
    {
      uint64_t v36 = v32;
      float64x2_t v29 = vmulq_f64(v29, _Q2);
      float64x2_t v31 = vsubq_f64(vmulq_f64(v31, _Q3), v29);
      float64x2_t v30 = vsubq_f64(vmulq_f64(v30, _Q4), vmulq_f64(v31, _Q4));
      v32 *= 2;
      double v21 = v21 * 0.0625;
    }
    while (v21 > v20 && v32 <= 0x10000);
    if (v32 >= 2)
    {
      unint64_t v37 = (2 * v36) | 1;
      do
      {
        float64x2_t v42 = v29;
        float64x2_t v43 = vaddq_f64(v8, v30);
        float64x2_t v40 = vaddq_f64(v30, v31);
        float64x2_t v41 = vaddq_f64(v29, v31);
        -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", *(_OWORD *)&v43, v38, v39);
        float64x2_t v30 = v40;
        float64x2_t v31 = v41;
        float64x2_t v29 = v42;
        float64x2_t v8 = v43;
        --v37;
      }
      while (v37 > 2);
    }
  }

  -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", v38.x, *(double *)&v39);
}

- (void)flattenIntoPath:(id)a3
{
  id v8 = a3;
  int64_t sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    int64_t v6 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          objc_msgSend(v8, "moveToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          break;
        case 1:
          objc_msgSend(v8, "lineToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          break;
        case 2:
          objc_msgSend(v8, "subdivideBezierWithFlatness:startPoint:controlPoint1:controlPoint2:endPoint:", *(double *)&qword_2689234C8, *(double *)&sfr_head[-4], *(double *)&sfr_head[-2], *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(void *)&sfr_head[2], *(void *)&sfr_head[4]);
          sfr_extraSegments += 4;
          break;
        case 3:
          [v8 closePath];
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v6);
  }
}

- (id)bezierPathByFlatteningPath
{
  if ((*(unsigned char *)&self->sfr_bpFlags & 4) != 0)
  {
    id v3 = (id)[(AKTSDBezierPath *)self copy];
  }
  else
  {
    id v3 = objc_alloc_init((Class)objc_opt_class());
    [(AKTSDBezierPath *)self flattenIntoPath:v3];
  }

  return v3;
}

- (id)_copyFlattenedPath
{
  id v3 = objc_alloc_init((Class)objc_opt_class());
  [(AKTSDBezierPath *)self flattenIntoPath:v3];
  return v3;
}

- (id)bezierPathByReversingPath
{
  if (self->sfr_elementCount > 1)
  {
    id v3 = objc_alloc_init((Class)objc_opt_class());
    int64_t sfr_elementCount = self->sfr_elementCount;
    if (sfr_elementCount >= 2)
    {
      sfr_head = self->sfr_head;
      unint64_t v6 = (unint64_t)&sfr_head[6 * sfr_elementCount];
      sfr_extraSegments = (double *)self->sfr_extraSegments;
      id v8 = sfr_head + 6;
      do
      {
        size_t v9 = v8;
        uint64_t v10 = *(void *)&sfr_head[6] & 0xFLL;
        if (v10) {
          BOOL v11 = (unint64_t)&sfr_head[12] >= v6;
        }
        else {
          BOOL v11 = 1;
        }
        if (v11)
        {
          if (v10) {
            CGFloat v12 = v9;
          }
          else {
            CGFloat v12 = sfr_head;
          }
          objc_msgSend(v3, "moveToPoint:", *(double *)&v12[2], *(double *)&v12[4]);
          char v13 = 0;
          float64x2_t v14 = (double *)&v12[-2];
          while (1)
          {
            switch(v14[1] & 0xF)
            {
              case 0:
                goto LABEL_25;
              case 1:
                if ((v13 & 1) != 0 && (*(unsigned char *)(v14 - 2) & 0xF) == 0) {
                  goto LABEL_20;
                }
                objc_msgSend(v3, "lineToPoint:", *(v14 - 1), *v14);
                goto LABEL_24;
              case 2:
                objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", *(v14 - 1), *v14, sfr_extraSegments[4 * (*((void *)v14 + 1) >> 4) + 2], sfr_extraSegments[4 * (*((void *)v14 + 1) >> 4) + 3], sfr_extraSegments[4 * (*((void *)v14 + 1) >> 4)], sfr_extraSegments[4 * (*((void *)v14 + 1) >> 4) + 1]);
                if (v13)
                {
                  if ((*(unsigned char *)(v14 - 2) & 0xF) == 0) {
LABEL_20:
                  }
                    [v3 closePath];
LABEL_22:
                  char v13 = 1;
                }
                else
                {
                  char v13 = 0;
                }
LABEL_24:
                v14 -= 3;
                break;
              case 3:
                objc_msgSend(v3, "lineToPoint:", *(v14 - 1), *v14);
                goto LABEL_22;
              default:
                goto LABEL_24;
            }
          }
        }
LABEL_25:
        id v8 = v9 + 6;
        sfr_head = v9;
      }
      while ((unint64_t)&v9[6] < v6);
    }
  }
  else
  {
    id v3 = (id)[(AKTSDBezierPath *)self copy];
  }

  return v3;
}

- (void)transformUsingAffineTransform:(CGAffineTransform *)a3
{
  int64_t sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    unint64_t v6 = &sfr_head[6 * sfr_elementCount];
    do
    {
      *(float64x2_t *)&sfr_head[2] = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, *(double *)&sfr_head[4]), *(float64x2_t *)&a3->a, *(double *)&sfr_head[2]));
      sfr_head += 6;
    }
    while (sfr_head < v6);
  }
  sfr_extraSegments = (double *)self->sfr_extraSegments;
  if (sfr_extraSegments)
  {
    int64_t sfr_extraSegmentCount = self->sfr_extraSegmentCount;
    if (sfr_extraSegmentCount >= 1)
    {
      size_t v9 = &sfr_extraSegments[4 * sfr_extraSegmentCount];
      do
      {
        *(float64x2_t *)sfr_extraSegments = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, sfr_extraSegments[1]), *(float64x2_t *)&a3->a, *sfr_extraSegments));
        *((float64x2_t *)sfr_extraSegments + 1) = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, sfr_extraSegments[3]), *(float64x2_t *)&a3->a, sfr_extraSegments[2]));
        sfr_extraSegments += 4;
      }
      while (sfr_extraSegments < v9);
    }
  }
  sfr_path = self->sfr_path;
  if (sfr_path)
  {
    CFRelease(sfr_path);
    self->sfr_path = 0;
  }
  *(_DWORD *)&self->sfr_bpFlags |= 1u;
}

- (CGPath)CGPath
{
  return (CGPath *)self->sfr_path;
}

- (BOOL)isEmpty
{
  return self->sfr_elementCount == 0;
}

- (CGPoint)currentPoint
{
  if ([(AKTSDBezierPath *)self isEmpty]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"No current point for line"];
  }
  id v3 = &self->sfr_head[6 * self->sfr_elementCount];
  double v4 = *(double *)&v3[-4];
  double v5 = *(double *)&v3[-2];
  result.CGFloat y = v5;
  result.double x = v4;
  return result;
}

- (CGRect)controlPointBounds
{
  if ([(AKTSDBezierPath *)self isEmpty]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"No current point for control point bounds"];
  }
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = self->sfr_bpFlags;
  if (*(unsigned char *)&sfr_bpFlags)
  {
    sfr_head = self->sfr_head;
    int64_t sfr_elementCount = self->sfr_elementCount;
    float64x2_t v9 = *(float64x2_t *)&sfr_head[2];
    if (sfr_elementCount < 2)
    {
      CGPoint v4 = *(CGPoint *)&sfr_head[2];
    }
    else
    {
      unint64_t v10 = (unint64_t)&sfr_head[6 * sfr_elementCount];
      BOOL v11 = sfr_head + 6;
      CGPoint v4 = (CGPoint)v9;
      do
      {
        if ((*(_DWORD *)v11 & 0xF) != 3 && ((*(_DWORD *)v11 & 0xF) != 0 || (unint64_t)&v11[6] < v10))
        {
          float64x2_t v13 = *(float64x2_t *)&v11[2];
          CGPoint v4 = (CGPoint)vbslq_s8((int8x16_t)vcgtq_f64(v13, (float64x2_t)v4), (int8x16_t)v4, (int8x16_t)v13);
          float64x2_t v9 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v13, v9), (int8x16_t)v13, (int8x16_t)v9);
        }
        v11 += 6;
      }
      while ((unint64_t)v11 < v10);
    }
    sfr_extraSegments = (float64x2_t *)self->sfr_extraSegments;
    if (sfr_extraSegments)
    {
      int64_t sfr_extraSegmentCount = self->sfr_extraSegmentCount;
      if (sfr_extraSegmentCount >= 1)
      {
        float64x2_t v16 = &sfr_extraSegments[2 * sfr_extraSegmentCount];
        do
        {
          float64x2_t v17 = *sfr_extraSegments;
          float64x2_t v18 = sfr_extraSegments[1];
          sfr_extraSegments += 2;
          float64x2_t v19 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v17, (float64x2_t)v4), (int8x16_t)v4, (int8x16_t)v17);
          float64x2_t v20 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v17, v9), (int8x16_t)v17, (int8x16_t)v9);
          CGPoint v4 = (CGPoint)vbslq_s8((int8x16_t)vcgtq_f64(v18, v19), (int8x16_t)v19, (int8x16_t)v18);
          float64x2_t v9 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v18, v20), (int8x16_t)v18, (int8x16_t)v20);
        }
        while (sfr_extraSegments < v16);
      }
    }
    self->sfr_controlPointBounds.origin = v4;
    float64x2_t size = vsubq_f64(v9, (float64x2_t)v4);
    self->sfr_controlPointBounds.float64x2_t size = (CGSize)size;
    self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags & 0xFFFFFFFE);
    double y = v4.y;
  }
  else
  {
    v4.double x = self->sfr_controlPointBounds.origin.x;
    double y = self->sfr_controlPointBounds.origin.y;
    float64x2_t size = (float64x2_t)self->sfr_controlPointBounds.size;
  }
  double v21 = size.f64[1];
  result.size.CGFloat width = size.f64[0];
  result.origin.double x = v4.x;
  result.size.CGFloat height = v21;
  result.origin.double y = y;
  return result;
}

- (CGRect)bounds
{
  if ((*(unsigned char *)&self->sfr_bpFlags & 4) != 0)
  {
    [(AKTSDBezierPath *)self controlPointBounds];
  }
  else
  {
    [(AKTSDBezierPath *)self _doPath];
    sfr_path = (const CGPath *)self->sfr_path;
    if (sfr_path) {
      return CGPathGetPathBoundingBox(sfr_path);
    }
    else {
      return *(CGRect *)*(void *)&MEMORY[0x263F001A8];
    }
  }
  return result;
}

- (BOOL)isFlat
{
  int64_t v3 = [(AKTSDBezierPath *)self elementCount];
  if (!v3) {
    return 1;
  }
  unint64_t v4 = v3;
  if ([(AKTSDBezierPath *)self elementAtIndex:0] == 2) {
    return 0;
  }
  uint64_t v6 = 1;
  do
  {
    unint64_t v7 = v6;
    if (v4 == v6) {
      break;
    }
    unint64_t v8 = [(AKTSDBezierPath *)self elementAtIndex:v6];
    uint64_t v6 = v7 + 1;
  }
  while (v8 != 2);
  return v7 >= v4;
}

- (BOOL)isClockwise
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AKTSDBezierPath *)self elementCount];
  if (v3 < 1)
  {
    float v9 = 0.0;
  }
  else
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    char v6 = 0;
    double v7 = *MEMORY[0x263F00148];
    double v8 = *(double *)(MEMORY[0x263F00148] + 8);
    float v9 = 0.0;
    double v10 = v8;
    double v11 = *MEMORY[0x263F00148];
    do
    {
      switch([(AKTSDBezierPath *)self elementAtIndex:v5 associatedPoints:&v15])
      {
        case 0uLL:
          double v11 = v15;
          double v10 = v16;
          double v7 = v15;
          double v8 = v16;
          break;
        case 1uLL:
          if (v7 != v15 || v8 != v16) {
            float v9 = v7 * v16 - v8 * v15 + v9;
          }
          char v6 = 1;
          double v7 = v15;
          double v8 = v16;
          break;
        case 2uLL:
          NSLog(&cfstr_WarningPathSho.isa);
          break;
        case 3uLL:
          BOOL v13 = v7 == v11 && v8 == v10;
          char v6 = 0;
          if (!v13) {
            float v9 = v7 * v10 - v8 * v11 + v9;
          }
          break;
        default:
          break;
      }
      ++v5;
    }
    while (v4 != v5);
    if (v6) {
      float v9 = v7 * v10 - v8 * v11 + v9;
    }
  }
  return v9 >= 0.0;
}

- (double)calculateLengthOfElement:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v3 = 0.0;
  if (a3)
  {
    unint64_t v4 = [(AKTSDBezierPath *)self elementAtIndex:a3 allPoints:&v9];
    switch(v4)
    {
      case 3uLL:
        goto LABEL_5;
      case 2uLL:
        float v8 = 0.0;
        sub_23764AC08((uint64_t)&v9, &v8);
        return v8;
      case 1uLL:
LABEL_5:
        float v5 = (v10 - v12) * (v10 - v12) + (v9 - v11) * (v9 - v11);
        return sqrtf(v5);
    }
  }
  return v3;
}

- (void)calculateLengths
{
  self->sfr_totalLength = 0.0;
  int64_t v3 = [(AKTSDBezierPath *)self elementCount];
  sfr_elementMadouble x = self->sfr_elementMax;
  BOOL v5 = sfr_elementMax < 0;
  if (sfr_elementMax >= 0) {
    unint64_t v6 = self->sfr_elementMax;
  }
  else {
    unint64_t v6 = -sfr_elementMax;
  }
  if (!(8 * v6)) {
    BOOL v5 = 0;
  }
  if (!(v6 >> 61) && !v5)
  {
    uint64_t v7 = v3;
    if (sfr_elementMax >= 0) {
      size_t v8 = 8 * v6;
    }
    else {
      size_t v8 = -8 * v6;
    }
    self->sfr_elementLength = (double *)malloc_type_realloc(self->sfr_elementLength, v8, 0x7A580F34uLL);
    if (v7 >= 1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        [(AKTSDBezierPath *)self calculateLengthOfElement:i];
        self->sfr_elementLength[i] = v10;
        self->sfr_totalLength = v10 + self->sfr_totalLength;
      }
    }
  }
  *(_DWORD *)&self->sfr_bpFlags |= 0x400u;
}

- (double)length
{
  if ((*((unsigned char *)&self->sfr_bpFlags + 1) & 4) == 0) {
    [(AKTSDBezierPath *)self calculateLengths];
  }
  return self->sfr_totalLength;
}

- (double)lengthOfElement:(int64_t)a3
{
  if ((*((unsigned char *)&self->sfr_bpFlags + 1) & 4) == 0) {
    [(AKTSDBezierPath *)self calculateLengths];
  }
  return self->sfr_elementLength[a3];
}

- (double)lengthToElement:(int64_t)a3
{
  if ((*((unsigned char *)&self->sfr_bpFlags + 1) & 4) == 0) {
    [(AKTSDBezierPath *)self calculateLengths];
  }
  if (a3 < 1) {
    return 0.0;
  }
  sfr_elementLength = self->sfr_elementLength;
  double result = 0.0;
  do
  {
    double v7 = *sfr_elementLength++;
    double result = result + v7;
    --a3;
  }
  while (a3);
  return result;
}

- (int64_t)elementCount
{
  return self->sfr_elementCount;
}

- (unint64_t)elementAtIndex:(int64_t)a3
{
  return [(AKTSDBezierPath *)self elementAtIndex:a3 associatedPoints:0];
}

- (unint64_t)elementAtIndex:(int64_t)a3 associatedPoints:(CGPoint *)a4
{
  if (a3 < 0 || self->sfr_elementCount <= a3)
  {
    double v7 = (void *)MEMORY[0x263EFF940];
    uint64_t v8 = *MEMORY[0x263EFF578];
    double v9 = NSStringFromSelector(a2);
    [v7 raise:v8, @"%@: index (%ld) beyond bounds (%ld)", v9, a3, self->sfr_elementCount format];
  }
  sfr_head = self->sfr_head;
  double v11 = &sfr_head[6 * a3];
  if (a4)
  {
    if ((*(void *)v11 & 0xFLL) == 2)
    {
      double v12 = (CGPoint *)((char *)self->sfr_extraSegments + 32 * (*(void *)v11 >> 4));
      *a4 = *v12;
      a4[1] = v12[1];
      a4 += 2;
    }
    *a4 = *(CGPoint *)&sfr_head[6 * a3 + 2];
  }
  return *(void *)v11 & 0xFLL;
}

- (unint64_t)elementAtIndex:(int64_t)a3 allPoints:(CGPoint *)a4
{
  if (a3 < 0 || self->sfr_elementCount <= a3)
  {
    double v7 = (void *)MEMORY[0x263EFF940];
    uint64_t v8 = *MEMORY[0x263EFF578];
    double v9 = NSStringFromSelector(a2);
    [v7 raise:v8, @"%@: index (%ld) beyond bounds (%ld)", v9, a3, self->sfr_elementCount format];
  }
  sfr_head = self->sfr_head;
  double v11 = &sfr_head[6 * a3];
  if (a4)
  {
    unint64_t v12 = *(void *)v11;
    if ((*(void *)v11 & 0xFLL) != 0)
    {
      *a4 = *(CGPoint *)&sfr_head[6 * a3 - 4];
      unint64_t v12 = *(void *)v11;
    }
    if ((v12 & 0xF) != 0)
    {
      if ((v12 & 0xF) == 2)
      {
        uint64_t v13 = (CGPoint *)((char *)self->sfr_extraSegments + 32 * (v12 >> 4));
        a4[1] = *v13;
        a4[2] = v13[1];
        a4 += 3;
      }
      else
      {
        ++a4;
      }
    }
    *a4 = *(CGPoint *)&sfr_head[6 * a3 + 2];
  }
  return *(void *)v11 & 0xFLL;
}

- (void)setAssociatedPoints:(CGPoint *)a3 atIndex:(int64_t)a4
{
  if (a4 < 0 || self->sfr_elementCount <= a4)
  {
    double v7 = (void *)MEMORY[0x263EFF940];
    uint64_t v8 = *MEMORY[0x263EFF578];
    double v9 = NSStringFromSelector(a2);
    [v7 raise:v8, @"%@: index (%ld) beyond bounds (%ld)", v9, a4, self->sfr_elementCount format];
  }
  sfr_head = self->sfr_head;
  if ((*(void *)&sfr_head[6 * a4] & 0xFLL) == 2)
  {
    double v11 = (CGPoint *)((char *)self->sfr_extraSegments + 32 * (*(void *)&sfr_head[6 * a4] >> 4));
    *double v11 = *a3;
    CGPoint v12 = a3[1];
    a3 += 2;
    v11[1] = v12;
  }
  *(CGPoint *)&sfr_head[6 * a4 + 2] = *a3;
  sfr_path = self->sfr_path;
  if (sfr_path)
  {
    CFRelease(sfr_path);
    self->sfr_path = 0;
  }
  *(_DWORD *)&self->sfr_bpFlags |= 1u;
}

- (void)_appendToPath:(id)a3
{
  id v8 = a3;
  int64_t sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    unint64_t v6 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          objc_msgSend(v8, "moveToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          break;
        case 1:
          objc_msgSend(v8, "lineToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          break;
        case 2:
          objc_msgSend(v8, "curveToPoint:controlPoint1:controlPoint2:", *(double *)&sfr_head[2], *(double *)&sfr_head[4], *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3]);
          sfr_extraSegments += 4;
          break;
        case 3:
          [v8 closePath];
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v6);
  }
}

- (void)appendBezierPath:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    [v4 _appendToPath:self];
  }
  else
  {
    uint64_t v6 = [v4 elementCount];
    if (v6 >= 1)
    {
      uint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        switch([v4 elementAtIndex:i associatedPoints:&v9])
        {
          case 0:
            -[AKTSDBezierPath moveToPoint:](self, "moveToPoint:", v9, v10);
            break;
          case 1:
            -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", v9, v10);
            break;
          case 2:
            -[AKTSDBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v13, v14, v9, v10, v11, v12);
            break;
          case 3:
            [(AKTSDBezierPath *)self closePath];
            break;
          default:
            continue;
        }
      }
    }
  }
}

- (void)appendBezierPathWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[AKTSDBezierPath moveToPoint:](self, "moveToPoint:");
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", MaxX, CGRectGetMinY(v13));
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double v9 = CGRectGetMaxX(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", v9, CGRectGetMaxY(v15));
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", MinX, CGRectGetMaxY(v17));

  [(AKTSDBezierPath *)self closePath];
}

- (void)appendBezierPathWithPoints:(CGPoint *)a3 count:(int64_t)a4
{
  int64_t v4 = a4 - 1;
  if (a4 >= 1)
  {
    if ([(AKTSDBezierPath *)self isEmpty] || (*(_DWORD *)&self->sfr_bpFlags & 0x300) == 0x100) {
      -[AKTSDBezierPath moveToPoint:](self, "moveToPoint:", a3->x, a3->y);
    }
    else {
      -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", a3->x, a3->y);
    }
    if ((unint64_t)a4 >= 2)
    {
      p_CGFloat y = &a3[1].y;
      do
      {
        -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", *(p_y - 1), *p_y);
        p_y += 2;
        --v4;
      }
      while (v4);
    }
  }
}

- (void)appendBezierPathWithOvalInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  long long v13 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v16.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v16.c = v13;
  *(_OWORD *)&v16.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  id v8 = objc_alloc_init(AKTSDBezierPath);
  -[AKTSDBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:](v8, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), 1.0, -45.0, 315.0);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGFloat MidX = CGRectGetMidX(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v18);
  *(_OWORD *)&v15.a = *(_OWORD *)&v16.a;
  *(_OWORD *)&v15.c = v13;
  *(_OWORD *)&v15.tCGFloat x = *(_OWORD *)&v16.tx;
  CGAffineTransformTranslate(&v16, &v15, MidX, MidY);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGFloat v11 = CGRectGetWidth(v19) * 0.5;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGFloat v12 = CGRectGetHeight(v20);
  CGAffineTransform v14 = v16;
  CGAffineTransformScale(&v15, &v14, v11, v12 * 0.5);
  CGAffineTransform v16 = v15;
  [(AKTSDBezierPath *)v8 transformUsingAffineTransform:&v15];
  [(AKTSDBezierPath *)self appendBezierPath:v8];
}

- (void)_appendArcSegmentWithCenter:(CGPoint)a3 radius:(double)a4 angle1:(double)a5 angle2:(double)a6
{
  __sincos_stret((a6 - a5) * 0.5);
  __sincos_stret(a5);
  __sincos_stret(a6);

  MEMORY[0x270F9A6D0](self, sel__deviceCurveToPoint_controlPoint1_controlPoint2_);
}

- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6 clockwise:(BOOL)a7
{
  double y = a3.y;
  double x = a3.x;
  if (__fpclassifyd(a5) < 3 || __fpclassifyd(a6) <= 2)
  {
    CGAffineTransform v15 = (void *)MEMORY[0x263EFF940];
    uint64_t v16 = *MEMORY[0x263EFF4A0];
    CGRect v17 = NSStringFromSelector(a2);
    [v15 raise:v16, @"%@: illegal angle argument", v17 format];
  }
  double v18 = a5 * 3.14159265 / 180.0;
  double v19 = a6 * 3.14159265;
  __double2 v20 = __sincos_stret(v18);
  double v21 = x + a4 * v20.__cosval;
  double v22 = y + a4 * v20.__sinval;
  if ([(AKTSDBezierPath *)self isEmpty]) {
    -[AKTSDBezierPath _deviceMoveToPoint:](self, "_deviceMoveToPoint:", v21, v22);
  }
  else {
    -[AKTSDBezierPath _deviceLineToPoint:](self, "_deviceLineToPoint:", v21, v22);
  }
  double v23 = v19 / 180.0;
  if (a7)
  {
    for (; v18 < v23; double v18 = v18 + 6.28318531)
      ;
    double v24 = v18 - v23;
    if (v18 - v23 > 1.57079633)
    {
      do
      {
        double v25 = v18 + -1.57079633;
        -[AKTSDBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v18, v18 + -1.57079633);
        double v24 = v25 - v23;
        double v18 = v18 + -1.57079633;
      }
      while (v25 - v23 > 1.57079633);
      goto LABEL_19;
    }
LABEL_18:
    double v25 = v18;
    goto LABEL_19;
  }
  for (; v23 < v18; double v23 = v23 + 6.28318531)
    ;
  double v24 = v23 - v18;
  if (v23 - v18 <= 1.57079633) {
    goto LABEL_18;
  }
  do
  {
    double v25 = v18 + 1.57079633;
    -[AKTSDBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v18, v18 + 1.57079633);
    double v24 = v23 - v25;
    double v18 = v18 + 1.57079633;
  }
  while (v23 - v25 > 1.57079633);
LABEL_19:
  if (v24 > 0.0)
  {
    -[AKTSDBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v25, v23);
  }
}

- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6
{
}

- (void)appendBezierPathWithArcFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 radius:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  double v8 = a3.y;
  double v9 = a3.x;
  CGFloat v37 = *(double *)(MEMORY[0x263F000D0] + 8);
  CGFloat v38 = *MEMORY[0x263F000D0];
  CGFloat v35 = *(double *)(MEMORY[0x263F000D0] + 24);
  CGFloat v36 = *(double *)(MEMORY[0x263F000D0] + 16);
  CGFloat v33 = *(double *)(MEMORY[0x263F000D0] + 40);
  CGFloat v34 = *(double *)(MEMORY[0x263F000D0] + 32);
  [(AKTSDBezierPath *)self currentPoint];
  double v13 = v11;
  double v14 = v12;
  if (v11 == v9 && v12 == v8)
  {
    double v17 = v9 - v11;
    double v16 = v8 - v12;
    double v18 = 0.0;
    double v30 = 0.0;
  }
  else
  {
    double v30 = a5;
    double v16 = v8 - v12;
    double v17 = v9 - v11;
    double v18 = atan2(v8 - v12, v17);
  }
  v39.a = v38;
  v39.b = v37;
  v39.c = v36;
  v39.d = v35;
  v39.tdouble x = v34;
  v39.tdouble y = v33;
  CGAffineTransformRotate(&v40, &v39, -v18);
  double v19 = v40.tx + v16 * v40.c + v40.a * v17;
  double v20 = v40.ty + v16 * v40.d + v40.b * v17;
  double v32 = v14;
  double v21 = v40.tx + (y - v14) * v40.c + v40.a * (x - v13);
  double v22 = v40.ty + (y - v14) * v40.d + v40.b * (x - v13);
  BOOL v23 = v19 == v21 && v20 == v22;
  double v24 = 0.0;
  if (!v23) {
    double v24 = 3.14159265 - fabs(atan2(v22 - v20, v21 - v19));
  }
  double v25 = sin(v24 * 0.5);
  double v31 = v13;
  if (v25 == 0.0)
  {
    double v26 = 0.0;
    double v27 = v20;
    double v28 = 0.0;
    double v29 = 0.0;
  }
  else
  {
    double v19 = v19 - v30 * fabs(cos(v24 * 0.5) / v25);
    if (v22 <= v20)
    {
      double v27 = -v30;
      double v29 = v24 + -1.57079633;
      double v26 = 1.57079633;
    }
    else
    {
      double v29 = 1.57079633 - v24;
      double v26 = -1.57079633;
      double v27 = v30;
    }
    double v28 = v30;
  }
  v39.a = v38;
  v39.b = v37;
  v39.c = v36;
  v39.d = v35;
  v39.tdouble x = v34;
  v39.tdouble y = v33;
  CGAffineTransformRotate(&v40, &v39, v18);
  -[AKTSDBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:](self, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", v22 <= v20, v31 + v40.tx + v27 * v40.c + v40.a * v19, v32 + v40.ty + v27 * v40.d + v40.b * v19, v28, (v18 + v26) * 180.0 / 3.14159265, (v18 + v29) * 180.0 / 3.14159265);
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if ((byte_268925150 & 1) == 0) {
    byte_268925150 = 1;
  }
  [(AKTSDBezierPath *)self _doPath];
  sfr_path = (const CGPath *)self->sfr_path;
  if (!sfr_path) {
    return 0;
  }
  BOOL v7 = [(AKTSDBezierPath *)self windingRule] == 1;
  CGFloat v8 = x;
  CGFloat v9 = y;

  return CGPathContainsPoint(sfr_path, 0, *(CGPoint *)&v8, v7);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    unint64_t v5 = [(AKTSDBezierPath *)self windingRule];
    unint64_t v6 = [(AKTSDBezierPath *)self lineCapStyle];
    unint64_t v7 = [(AKTSDBezierPath *)self lineJoinStyle];
    int64_t sfr_elementCount = self->sfr_elementCount;
    if (sfr_elementCount >= 1)
    {
      sfr_head = self->sfr_head;
      double v11 = &sfr_head[6 * sfr_elementCount];
      sfr_extraSegments = (float64x2_t *)self->sfr_extraSegments;
      size_t v13 = 9 * (sfr_elementCount + 2 * self->sfr_extraSegmentCount);
      double v14 = (char *)malloc_type_malloc(v13, 0xCA1BBA45uLL);
      CGAffineTransform v15 = v14;
      do
      {
        uint64_t v16 = *(void *)sfr_head;
        if ((*(void *)sfr_head & 0xFLL) == 2)
        {
          *CGAffineTransform v15 = 2;
          *(int8x8_t *)(v15 + 1) = vrev32_s8((int8x8_t)vcvt_f32_f64(*sfr_extraSegments));
          v15[9] = 2;
          *(int8x8_t *)(v15 + 10) = vrev32_s8((int8x8_t)vcvt_f32_f64(sfr_extraSegments[1]));
          v15 += 18;
          sfr_extraSegments += 2;
          uint64_t v16 = *(void *)sfr_head;
        }
        *CGAffineTransform v15 = v16 & 0xF;
        *(int8x8_t *)(v15 + 1) = vrev32_s8((int8x8_t)vcvt_f32_f64(*(float64x2_t *)&sfr_head[2]));
        v15 += 9;
        sfr_head += 6;
      }
      while (sfr_head < v11);
      [v4 encodeBytes:v14 length:v13 forKey:@"TSDSegments"];
      free(v14);
    }
    if (v5)
    {
      *(float *)&double v8 = (float)v5;
      [v4 encodeFloat:@"TSDWindingRule" forKey:v8];
    }
    if (v6)
    {
      *(float *)&double v8 = (float)v6;
      [v4 encodeFloat:@"TSDCapStyle" forKey:v8];
    }
    if (v7)
    {
      *(float *)&double v8 = (float)v7;
      [v4 encodeFloat:@"TSDJoinStyle" forKey:v8];
    }
    if (self->sfr_lineWidth != 1.0) {
      objc_msgSend(v4, "encodeDouble:forKey:", @"TSDLineWidth");
    }
    if (self->sfr_miterLimit != 10.0) {
      objc_msgSend(v4, "encodeDouble:forKey:", @"TSDMiterLimit");
    }
    if (self->sfr_flatness != 0.6) {
      objc_msgSend(v4, "encodeDouble:forKey:", @"TSDFlatness");
    }
    if (self->sfr_dashedLineCount)
    {
      [v4 encodeDouble:@"TSDDashPhase" forKey:self->sfr_dashedLinePhase];
      size_t v17 = 4 * self->sfr_dashedLineCount;
      double v18 = malloc_type_malloc(v17, 0xDC1F855BuLL);
      double v19 = v18;
      int64_t sfr_dashedLineCount = self->sfr_dashedLineCount;
      if (sfr_dashedLineCount >= 1)
      {
        sfr_dashedLinePattern = self->sfr_dashedLinePattern;
        double v22 = v18;
        do
        {
          double v23 = *sfr_dashedLinePattern++;
          *(float *)&unsigned int v24 = v23;
          *v22++ = bswap32(v24);
          --sfr_dashedLineCount;
        }
        while (sfr_dashedLineCount);
      }
      [v4 encodeBytes:v18 length:v17 forKey:@"TSDDashPatterns"];
      free(v19);
    }
  }
  else
  {
    float v52 = (float)(self->sfr_elementCount + 2 * self->sfr_extraSegmentCount);
    int v51 = [(AKTSDBezierPath *)self windingRule];
    int v50 = [(AKTSDBezierPath *)self lineCapStyle];
    int v49 = [(AKTSDBezierPath *)self lineJoinStyle];
    float sfr_lineWidth = self->sfr_lineWidth;
    double sfr_flatness = self->sfr_flatness;
    float sfr_miterLimit = self->sfr_miterLimit;
    float v47 = sfr_miterLimit;
    float v48 = sfr_lineWidth;
    float v28 = sfr_flatness;
    float v45 = (float)self->sfr_dashedLineCount;
    float v46 = v28;
    [v4 encodeValueOfObjCType:"i" at:&v52];
    int64_t v29 = self->sfr_elementCount;
    if (v29 >= 1)
    {
      double v30 = self->sfr_head;
      double v31 = &v30[6 * v29];
      double v32 = (double *)self->sfr_extraSegments;
      do
      {
        char v44 = *(unsigned char *)v30 & 0xF;
        if (v44 == 2)
        {
          float v33 = *v32;
          float v34 = v32[1];
          float v42 = v34;
          float v43 = v33;
          objc_msgSend(v4, "encodeValuesOfObjCTypes:", "cff", &v44, &v43, &v42);
          float v35 = v32[2];
          float v36 = v32[3];
          float v42 = v36;
          float v43 = v35;
          objc_msgSend(v4, "encodeValuesOfObjCTypes:", "cff", &v44, &v43, &v42);
          v32 += 4;
        }
        float v37 = *(double *)&v30[2];
        float v38 = *(double *)&v30[4];
        float v42 = v38;
        float v43 = v37;
        objc_msgSend(v4, "encodeValuesOfObjCTypes:", "cff", &v44, &v43, &v42);
        v30 += 6;
      }
      while (v30 < v31);
    }
    objc_msgSend(v4, "encodeValuesOfObjCTypes:", "iiifffi", &v51, &v50, &v49, &v48, &v47, &v46, &v45);
    if (self->sfr_dashedLineCount)
    {
      float sfr_dashedLinePhase = self->sfr_dashedLinePhase;
      float v43 = sfr_dashedLinePhase;
      [v4 encodeValueOfObjCType:"f" at:&v43];
      if ((uint64_t)self->sfr_dashedLineCount >= 1)
      {
        int64_t v40 = 0;
        do
        {
          float v41 = self->sfr_dashedLinePattern[v40];
          float v43 = v41;
          [v4 encodeValueOfObjCType:"f" at:&v43];
          ++v40;
        }
        while (v40 < (int64_t)self->sfr_dashedLineCount);
      }
    }
  }
}

- (AKTSDBezierPath)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(AKTSDBezierPath *)self init];
  if (v5)
  {
    if ([v4 allowsKeyedCoding])
    {
      unint64_t v47 = 0;
      id v6 = v4;
      unint64_t v7 = [v6 decodeBytesForKey:@"TSDSegments" returnedLength:&v47];
      if (v7)
      {
        if (v47)
        {
          unint64_t v8 = v7 + v47;
          if (v7 < v7 + v47)
          {
            do
            {
              unint64_t v9 = v7 + 9;
              float64x2_t v10 = vcvtq_f64_f32((float32x2_t)vrev32_s8(*(int8x8_t *)(v7 + 1)));
              switch(*(unsigned char *)v7)
              {
                case 0:
                  [(AKTSDBezierPath *)v5 moveToPoint:*(_OWORD *)&v10];
                  break;
                case 1:
                  [(AKTSDBezierPath *)v5 lineToPoint:*(_OWORD *)&v10];
                  break;
                case 2:
                  unint64_t v9 = v7 + 27;
                  [(AKTSDBezierPath *)v5 curveToPoint:vcvtq_f64_f32((float32x2_t)vrev32_s8(*(int8x8_t *)(v7 + 19))) controlPoint1:*(_OWORD *)&v10 controlPoint2:vcvtq_f64_f32((float32x2_t)vrev32_s8(*(int8x8_t *)(v7 + 10)))];
                  break;
                case 3:
                  [(AKTSDBezierPath *)v5 closePath];
                  break;
                default:
                  break;
              }
              unint64_t v7 = v9;
            }
            while (v9 < v8);
          }
        }
      }
      -[AKTSDBezierPath setWindingRule:](v5, "setWindingRule:", (int)[v6 decodeInt32ForKey:@"TSDWindingRule"]);
      -[AKTSDBezierPath setLineCapStyle:](v5, "setLineCapStyle:", (int)[v6 decodeInt32ForKey:@"TSDCapStyle"]);
      -[AKTSDBezierPath setLineJoinStyle:](v5, "setLineJoinStyle:", (int)[v6 decodeInt32ForKey:@"TSDJoinStyle"]);
      int v11 = [v6 containsValueForKey:@"TSDLineWidth"];
      double v12 = 1.0;
      if (v11) {
        objc_msgSend(v6, "decodeDoubleForKey:", @"TSDLineWidth", 1.0);
      }
      v5->float sfr_lineWidth = v12;
      int v13 = [v6 containsValueForKey:@"TSDMiterLimit"];
      double v14 = 10.0;
      if (v13) {
        objc_msgSend(v6, "decodeDoubleForKey:", @"TSDMiterLimit", 10.0);
      }
      v5->float sfr_miterLimit = v14;
      if ([v6 containsValueForKey:@"TSDFlatness"]) {
        [v6 decodeDoubleForKey:@"TSDFlatness"];
      }
      else {
        uint64_t v15 = 0x3FE3333333333333;
      }
      *(void *)&v5->double sfr_flatness = v15;
      id v22 = v6;
      uint64_t v23 = [v22 decodeBytesForKey:@"TSDDashPatterns" returnedLength:&v47];
      if (v23 && v47)
      {
        unsigned int v24 = (unsigned int *)v23;
        unint64_t v25 = v23 + v47;
        v5->float sfr_dashedLineCount = v47 >> 2;
        [v22 decodeDoubleForKey:@"TSDDashPhase"];
        v5->float sfr_dashedLinePhase = v26;
        double v27 = (double *)malloc_type_malloc(8 * v5->sfr_dashedLineCount, 0x100004000313F17uLL);
        v5->sfr_dashedLinePattern = v27;
        while ((unint64_t)v24 < v25)
        {
          unsigned int v28 = *v24++;
          *v27++ = COERCE_FLOAT(bswap32(v28));
        }
      }
    }
    else
    {
      LODWORD(v47) = 0;
      char v46 = 0;
      float v45 = 0.0;
      uint64_t v43 = 0;
      uint64_t v44 = 0;
      uint64_t v16 = [v4 versionForClassName:@"AKTSDBezierPath"];
      [v4 decodeValueOfObjCType:"i" at:&v47 size:4];
      if (v47)
      {
        unsigned int v17 = 0;
        do
        {
          objc_msgSend(v4, "decodeValuesOfObjCTypes:", "cff", &v46, &v45, (char *)&v44 + 4);
          double v18 = v45;
          double v19 = *((float *)&v44 + 1);
          switch(v46)
          {
            case 0:
              -[AKTSDBezierPath moveToPoint:](v5, "moveToPoint:", v45, *((float *)&v44 + 1));
              break;
            case 1:
              -[AKTSDBezierPath lineToPoint:](v5, "lineToPoint:", v45, *((float *)&v44 + 1));
              break;
            case 2:
              objc_msgSend(v4, "decodeValuesOfObjCTypes:", "cff", &v46, &v45, (char *)&v44 + 4);
              double v20 = v45;
              double v21 = *((float *)&v44 + 1);
              objc_msgSend(v4, "decodeValuesOfObjCTypes:", "cff", &v46, &v45, (char *)&v44 + 4);
              v17 += 2;
              -[AKTSDBezierPath curveToPoint:controlPoint1:controlPoint2:](v5, "curveToPoint:controlPoint1:controlPoint2:", v45, *((float *)&v44 + 1), v18, v19, v20, v21);
              break;
            case 3:
              [(AKTSDBezierPath *)v5 closePath];
              break;
            default:
              break;
          }
          ++v17;
        }
        while (v17 < v47);
      }
      if (v16 > 523)
      {
        float sfr_lineWidth = v5->sfr_lineWidth;
        double sfr_flatness = v5->sfr_flatness;
        float sfr_miterLimit = v5->sfr_miterLimit;
        float v41 = sfr_miterLimit;
        float v42 = sfr_lineWidth;
        float v32 = sfr_flatness;
        float sfr_dashedLineCount = (float)v5->sfr_dashedLineCount;
        float v40 = v32;
        objc_msgSend(v4, "decodeValuesOfObjCTypes:", "iiifffi", &v44, &v43, (char *)&v43 + 4, &v42, &v41, &v40, &sfr_dashedLineCount);
        [(AKTSDBezierPath *)v5 setWindingRule:v44];
        [(AKTSDBezierPath *)v5 setLineCapStyle:v43];
        [(AKTSDBezierPath *)v5 setLineJoinStyle:HIDWORD(v43)];
        v5->float sfr_lineWidth = v42;
        double v33 = v40;
        v5->float sfr_miterLimit = v41;
        v5->double sfr_flatness = v33;
        unint64_t v34 = (unint64_t)sfr_dashedLineCount;
        v5->float sfr_dashedLineCount = (unint64_t)sfr_dashedLineCount;
        if (v34)
        {
          float v38 = 0.0;
          [v4 decodeValueOfObjCType:"f" at:&v38 size:4];
          v5->float sfr_dashedLinePhase = v38;
          v5->sfr_dashedLinePattern = (double *)malloc_type_malloc(8 * v5->sfr_dashedLineCount, 0x100004000313F17uLL);
          if (v5->sfr_dashedLineCount)
          {
            unint64_t v35 = 0;
            do
            {
              [v4 decodeValueOfObjCType:"f" at:&v38 size:4];
              v5->sfr_dashedLinePattern[v35++] = v38;
            }
            while (v35 < v5->sfr_dashedLineCount);
          }
        }
      }
      else
      {
        float v42 = 0.0;
        LOBYTE(v41) = 0;
        objc_msgSend(v4, "decodeValuesOfObjCTypes:", "iiifc", &v44, &v43, (char *)&v43 + 4, &v42, &v41);
        v5->float sfr_lineWidth = v42;
        [(AKTSDBezierPath *)v5 setWindingRule:v44];
        [(AKTSDBezierPath *)v5 setLineCapStyle:v43];
        [(AKTSDBezierPath *)v5 setLineJoinStyle:HIDWORD(v43)];
      }
    }
    float v36 = v5;
  }

  return v5;
}

- (const)cString
{
  *(void *)&v15[255] = *MEMORY[0x263EF8340];
  int64_t v3 = [MEMORY[0x263EFF990] data];
  int64_t sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    id v6 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    while (2)
    {
      if (sfr_head == self->sfr_head)
      {
        unint64_t v8 = &v14;
        size_t v9 = 256;
      }
      else
      {
        char v14 = 32;
        unint64_t v8 = v15;
        size_t v9 = 255;
      }
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          int v10 = snprintf(v8, v9, "M %f %f");
          goto LABEL_12;
        case 1:
          int v10 = snprintf(v8, v9, "L %f %f");
          goto LABEL_12;
        case 2:
          int v10 = snprintf(v8, v9, "C %f %f %f %f %f %f", *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          sfr_extraSegments += 4;
          goto LABEL_12;
        case 3:
          char *v8 = 90;
          int v10 = 1;
LABEL_12:
          if (v10 < 1) {
            break;
          }
          if (v10 >= (int)v9) {
            break;
          }
          [v3 appendBytes:&v14 length:&v8[v10] - &v14];
          sfr_head += 6;
          if (sfr_head >= v6) {
            break;
          }
          continue;
        default:
          goto LABEL_15;
      }
      break;
    }
  }
LABEL_15:
  char v14 = 0;
  [v3 appendBytes:&v14 length:1];
  id v11 = v3;
  double v12 = (const char *)[v11 bytes];

  return v12;
}

- (AKTSDBezierPath)initWithCString:(const char *)a3
{
  id v4 = [(AKTSDBezierPath *)self init];
  unint64_t v5 = v4;
  if (a3)
  {
    if (v4)
    {
      if (*a3)
      {
        char v12 = 0;
        int v11 = 0;
        if (sscanf(a3, " %c%n", &v12, &v11) >= 1)
        {
          do
          {
            id v6 = &a3[v11];
            int v11 = 0;
            uint64_t v9 = 0;
            uint64_t v10 = 0;
            uint64_t v8 = 0;
            if (v12 > 98)
            {
              if (v12 > 108)
              {
                if (v12 == 122) {
                  goto LABEL_24;
                }
                if (v12 != 113)
                {
                  if (v12 == 109)
                  {
LABEL_15:
                    if (sscanf(v6, " %g %g%n", (char *)&v10 + 4, &v10, &v11) == 2) {
                      -[AKTSDBezierPath moveToPoint:](v5, "moveToPoint:", *((float *)&v10 + 1), *(float *)&v10);
                    }
                    goto LABEL_29;
                  }
                  goto LABEL_29;
                }
                goto LABEL_25;
              }
              if (v12 == 99)
              {
LABEL_27:
                if (sscanf(v6, " %g %g %g %g %g %g%n", (char *)&v9 + 4, &v9, (char *)&v8 + 4, &v8, (char *)&v10 + 4, &v10, &v11) == 6)-[AKTSDBezierPath curveToPoint:controlPoint1:controlPoint2:](v5, "curveToPoint:controlPoint1:controlPoint2:", *((float *)&v10 + 1), *(float *)&v10, *((float *)&v9 + 1), *(float *)&v9, *((float *)&v8 + 1), *(float *)&v8); {
                goto LABEL_29;
                }
              }
              if (v12 == 108)
              {
LABEL_22:
                if (sscanf(v6, " %g %g%n", (char *)&v10 + 4, &v10, &v11) != 2) {
                  goto LABEL_29;
                }
LABEL_26:
                -[AKTSDBezierPath lineToPoint:](v5, "lineToPoint:", *((float *)&v10 + 1), *(float *)&v10);
              }
            }
            else
            {
              if (v12 > 76)
              {
                if (v12 == 77) {
                  goto LABEL_15;
                }
                if (v12 != 81)
                {
                  if (v12 != 90) {
                    goto LABEL_29;
                  }
LABEL_24:
                  [(AKTSDBezierPath *)v5 closePath];
                  goto LABEL_29;
                }
LABEL_25:
                if (sscanf(v6, " %g %g %g %g%n", (char *)&v10 + 4, &v10, (char *)&v9 + 4, &v9, &v11) == 4) {
                  goto LABEL_26;
                }
                goto LABEL_29;
              }
              if (v12 == 67) {
                goto LABEL_27;
              }
              if (v12 == 76) {
                goto LABEL_22;
              }
            }
LABEL_29:
            a3 = &v6[v11];
          }
          while (sscanf(a3, " %c%n", &v12, &v11) > 0);
        }
      }
    }
  }
  return v5;
}

- (void)_addPathSegment:(int64_t)a3 point:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  int64_t sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount == self->sfr_elementMax)
  {
    int64_t v9 = sfr_elementCount + 0x4000000000000000;
    uint64_t v10 = 2 * sfr_elementCount;
    int64_t v11 = v10 + 10;
    BOOL v12 = __OFADD__(v10, 10);
    if ((v9 & 0x8000000000000000) == 0 && !v12)
    {
      BOOL v13 = v11 < 0;
      if (v11 >= 0) {
        unint64_t v14 = v11;
      }
      else {
        unint64_t v14 = -v11;
      }
      BOOL v15 = !is_mul_ok(v14, 0x18uLL);
      uint64_t v16 = 24 * v14;
      if (!v16) {
        BOOL v13 = 0;
      }
      if (v15
        || v13
        || (v11 >= 0 ? (size_t v17 = v16) : (size_t v17 = -v16),
            (double v18 = (PATHSEGMENT *)malloc_type_realloc(self->sfr_head, v17, 0xCAE44AAuLL)) == 0))
      {
        NSLog(&cfstr_ErrorAktsdbezi.isa, a2);
      }
      else
      {
        self->sfr_elementMaCGFloat x = v11;
        self->sfr_head = v18;
      }
      if ((*((unsigned char *)&self->sfr_bpFlags + 1) & 4) != 0)
      {
        sfr_elementMaCGFloat x = self->sfr_elementMax;
        BOOL v20 = sfr_elementMax < 0;
        if (sfr_elementMax >= 0) {
          unint64_t v21 = self->sfr_elementMax;
        }
        else {
          unint64_t v21 = -sfr_elementMax;
        }
        if (!(8 * v21)) {
          BOOL v20 = 0;
        }
        if (v21 >> 61
          || v20
          || (sfr_elementMax >= 0 ? (size_t v22 = 8 * v21) : (size_t v22 = -8 * v21),
              (uint64_t v23 = (double *)malloc_type_realloc(self->sfr_elementLength, v22, 0x395D4DCCuLL)) == 0))
        {
          NSLog(&cfstr_ErrorAktsdbezi_0.isa);
        }
        else
        {
          self->sfr_elementLength = v23;
        }
      }
    }
  }
  sfr_head = self->sfr_head;
  if (sfr_head)
  {
    *(void *)&sfr_head[6 * self->sfr_elementCount] = *(void *)&sfr_head[6 * self->sfr_elementCount] & 0xFFFFFFFFFFFFFFF0 | a3 & 0xF;
    *(void *)&self->sfr_head[6 * self->sfr_elementCount] &= 0xFuLL;
    int64_t v25 = self->sfr_elementCount;
    double v26 = &self->sfr_head[6 * v25];
    *(CGFloat *)&v26[2] = x;
    *(CGFloat *)&v26[4] = y;
    self->int64_t sfr_elementCount = v25 + 1;
    sfr_path = self->sfr_path;
    if (sfr_path)
    {
      CFRelease(sfr_path);
      self->sfr_path = 0;
    }
    $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = self->sfr_bpFlags;
    self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags | 1);
    if (a3 != 2 && (*(_WORD *)&sfr_bpFlags & 0x400) != 0)
    {
      [(AKTSDBezierPath *)self lengthOfElement:self->sfr_elementCount - 1];
      self->sfr_elementLength[self->sfr_elementCount - 1] = v29;
      self->sfr_totalLength = v29 + self->sfr_totalLength;
    }
  }
}

- (void)_deviceMoveToPoint:(CGPoint)a3
{
  int v4 = (*(_DWORD *)&self->sfr_bpFlags >> 8) & 3;
  if (v4 == 2)
  {
    sfr_head = self->sfr_head;
    int64_t v6 = self->sfr_elementCount - 1;
    if ((*(unsigned char *)&sfr_head[6 * v6] & 0xF) == 0) {
      goto LABEL_6;
    }
  }
  else if (v4 == 1)
  {
    sfr_head = self->sfr_head;
    int64_t v6 = self->sfr_elementCount - 1;
LABEL_6:
    *(CGPoint *)&sfr_head[6 * v6 + 2] = a3;
    goto LABEL_7;
  }
  -[AKTSDBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 0, a3.x, a3.y);
  int64_t v6 = self->sfr_elementCount - 1;
LABEL_7:
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF | 0x200);
  self->sfr_lastSubpathIndeCGFloat x = v6;
}

- (void)_deviceLineToPoint:(CGPoint)a3
{
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF | 0x200);
}

- (void)_deviceCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  CGFloat v7 = a4.y;
  CGFloat v8 = a4.x;
  -[AKTSDBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 2, a3.x, a3.y);
  int64_t sfr_extraSegmentCount = self->sfr_extraSegmentCount;
  if (sfr_extraSegmentCount == self->sfr_extraSegmentMax)
  {
    int64_t v11 = sfr_extraSegmentCount + 0x4000000000000000;
    uint64_t v12 = 2 * sfr_extraSegmentCount;
    int64_t v13 = v12 + 10;
    BOOL v14 = __OFADD__(v12, 10);
    if ((v11 & 0x8000000000000000) == 0 && !v14)
    {
      BOOL v15 = v13 < 0;
      if (v13 >= 0) {
        unint64_t v16 = v13;
      }
      else {
        unint64_t v16 = -v13;
      }
      if (!(32 * v16)) {
        BOOL v15 = 0;
      }
      if (v16 >> 59
        || v15
        || (v13 >= 0 ? (size_t v17 = 32 * v16) : (size_t v17 = -32 * v16),
            (double v18 = malloc_type_realloc(self->sfr_extraSegments, v17, 0xDDCB3BD5uLL)) == 0))
      {
        NSLog(&cfstr_ErrorAktsdbezi_1.isa);
      }
      else
      {
        self->sfr_extraSegments = v18;
        self->sfr_extraSegmentMaCGFloat x = v13;
      }
    }
  }
  int64_t v19 = self->sfr_extraSegmentCount;
  BOOL v20 = (CGFloat *)((char *)self->sfr_extraSegments + 32 * v19);
  *BOOL v20 = v8;
  v20[1] = v7;
  v20[2] = x;
  v20[3] = y;
  self->int64_t sfr_extraSegmentCount = v19 + 1;
  unint64_t v21 = &self->sfr_head[6 * self->sfr_elementCount];
  *(void *)&v21[-6] = *(void *)&v21[-6] & 0xFLL | (16 * v19);
  LODWORD(v21) = self->sfr_bpFlags;
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(v21 & 0xFFFFFCFB | 0x200);
  if (((unsigned __int16)v21 & 0x400) != 0)
  {
    [(AKTSDBezierPath *)self lengthOfElement:self->sfr_elementCount - 1];
    self->sfr_elementLength[self->sfr_elementCount - 1] = v22;
    self->sfr_totalLength = v22 + self->sfr_totalLength;
  }
}

- (void)_deviceClosePath
{
  if ((*(_DWORD *)&self->sfr_bpFlags & 0x300) == 0x200)
  {
    int64_t v3 = &self->sfr_head[6 * self->sfr_lastSubpathIndex];
    -[AKTSDBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 3, *(double *)&v3[2], *(double *)&v3[4]);
    int v4 = &self->sfr_head[6 * self->sfr_lastSubpathIndex];
    -[AKTSDBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 0, *(double *)&v4[2], *(double *)&v4[4]);
    self->sfr_lastSubpathIndeCGFloat x = self->sfr_elementCount - 1;
    self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF | 0x100);
  }
}

+ (void)setMiterLimit:(double)a3
{
}

+ (double)miterLimit
{
  MEMORY[0x270F9A6D0](a1, sel_defaultMiterLimit);
  return result;
}

+ (void)setFlatness:(double)a3
{
}

+ (double)flatness
{
  MEMORY[0x270F9A6D0](a1, sel_defaultFlatness);
  return result;
}

+ (void)setWindingRule:(unint64_t)a3
{
}

+ (unint64_t)windingRule
{
  return MEMORY[0x270F9A6D0](a1, sel_defaultWindingRule);
}

+ (void)setLineCapStyle:(unint64_t)a3
{
}

+ (unint64_t)lineCapStyle
{
  return MEMORY[0x270F9A6D0](a1, sel_defaultLineCapStyle);
}

+ (void)setLineJoinStyle:(unint64_t)a3
{
}

+ (unint64_t)lineJoinStyle
{
  return MEMORY[0x270F9A6D0](a1, sel_defaultLineJoinStyle);
}

+ (void)setLineWidth:(double)a3
{
}

+ (double)lineWidth
{
  MEMORY[0x270F9A6D0](a1, sel_defaultLineWidth);
  return result;
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int64_t v3 = [MEMORY[0x263F089D8] string];
  objc_msgSend(v3, "appendFormat:", @"AKTSDBezierPath <%p>", self);
  if (![(AKTSDBezierPath *)self isEmpty])
  {
    [(AKTSDBezierPath *)self bounds];
    int v4 = NSStringFromCGRect(v19);
    [(AKTSDBezierPath *)self controlPointBounds];
    unint64_t v5 = NSStringFromCGRect(v20);
    [v3 appendFormat:@"\n  Bounds: %@", v4];
    [v3 appendFormat:@"\n  Control point bounds: %@", v5];
    uint64_t v6 = [(AKTSDBezierPath *)self elementCount];
    if (v6 >= 1)
    {
      uint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        switch([(AKTSDBezierPath *)self elementAtIndex:i associatedPoints:v14])
        {
          case 0uLL:
            objc_msgSend(v3, "appendFormat:", @"\n    %f %f moveto", v14[0], v10, v11, v12, v13);
            break;
          case 1uLL:
            objc_msgSend(v3, "appendFormat:", @"\n    %f %f lineto", v14[0], v10, v11, v12, v13);
            break;
          case 2uLL:
            objc_msgSend(v3, "appendFormat:", @"\n    %f %f %f %f %f %f curveto", v14[0], v14[1], v15, v16);
            break;
          case 3uLL:
            [v3 appendString:@"\n    closepath"];
            break;
          default:
            continue;
        }
      }
    }
  }

  return v3;
}

- (void)getStartPoint:(CGPoint *)a3 andEndPoint:(CGPoint *)a4
{
  v10[2] = *MEMORY[0x263EF8340];
  [(AKTSDBezierPath *)self elementAtIndex:0 associatedPoints:a3];
  unint64_t v7 = [(AKTSDBezierPath *)self elementAtIndex:[(AKTSDBezierPath *)self elementCount] - 1 associatedPoints:v9];
  CGFloat v8 = (CGPoint *)v9;
  if (v7 == 2) {
    CGFloat v8 = (CGPoint *)v10;
  }
  if (v7 == 3) {
    CGFloat v8 = a3;
  }
  *a4 = *v8;
}

- (void)addIntersectionsWithPath:(id)a3 to:(id)a4 allIntersections:(BOOL)a5 reversed:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  unint64_t v32 = [v10 count];
  float v36 = self;
  uint64_t v11 = [(AKTSDBezierPath *)self elementCount];
  uint64_t v12 = [v9 elementCount];
  if (v11 < 2) {
    goto LABEL_30;
  }
  uint64_t v13 = v12;
  if (v12 < 2) {
    goto LABEL_30;
  }
  if (v6) {
    uint64_t v14 = v11 - 1;
  }
  else {
    uint64_t v14 = 0;
  }
  if (v6) {
    uint64_t v15 = -1;
  }
  else {
    uint64_t v15 = v11;
  }
  uint64_t v16 = -1;
  if (!v6) {
    uint64_t v16 = 1;
  }
  uint64_t v34 = v16;
  uint64_t v35 = v15;
  while (2)
  {
    uint64_t v17 = [(AKTSDBezierPath *)v36 elementAtIndex:v14 allPoints:v38];
    if (!v17) {
      goto LABEL_29;
    }
    uint64_t v18 = v17;
    uint64_t v19 = 0;
    do
    {
      uint64_t v20 = [v9 elementAtIndex:v19 allPoints:v37];
      if (!v20) {
        goto LABEL_26;
      }
      if (v18 != 2)
      {
        if (v20 != 2)
        {
          sub_2376BE470(v38[0].f64, (double *)v37, v14, v19, v10);
          goto LABEL_26;
        }
        double v27 = (float64x2_t *)v37;
        unsigned int v28 = v38;
        uint64_t v29 = v19;
        uint64_t v30 = v14;
        int v31 = 1;
LABEL_24:
        sub_2376BE150(v27->f64, v28->f64, v29, v30, v31, v10);
        goto LABEL_26;
      }
      if (v20 != 2)
      {
        double v27 = v38;
        unsigned int v28 = (float64x2_t *)v37;
        uint64_t v29 = v14;
        uint64_t v30 = v19;
        int v31 = 0;
        goto LABEL_24;
      }
      id v21 = v10;
      uint64_t v22 = [v21 count];
      v40[0] = v38[0];
      v40[1] = v38[1];
      v40[2] = v38[2];
      v40[3] = v38[3];
      v39[0] = v37[0];
      v39[1] = v37[1];
      v39[2] = v37[2];
      v39[3] = v37[3];
      sub_2376C27EC(v40, (double *)v39, v14, v19, 0, v21, 1.0, 0.0, 1.0, 0.0);
      uint64_t v23 = [v21 count];
      if (v22 < v23)
      {
        uint64_t v24 = v23;
        do
        {
          int64_t v25 = [v21 objectAtIndex:v22];
          [v25 t];
          objc_msgSend(v25, "setPoint:", sub_2376BD9D4(v38, v26));

          ++v22;
        }
        while (v24 != v22);
      }

LABEL_26:
      ++v19;
    }
    while (v19 != v13);
    if (a5 || v32 >= [v10 count])
    {
LABEL_29:
      v14 += v34;
      if (v14 == v35) {
        break;
      }
      continue;
    }
    break;
  }
LABEL_30:
}

- (void)addIntersectionsWithPath:(id)a3 to:(id)a4
{
}

- (void)addIntersectionsWithLine:(CGPoint)a3[2] to:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a4;
  long long v11 = *MEMORY[0x263F00148];
  int64_t v7 = [(AKTSDBezierPath *)self elementCount];
  if (v7)
  {
    int64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
    {
      switch(-[AKTSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", i, v13, v11, v12))
      {
        case 0uLL:
          long long v11 = v13[0];
          long long v12 = v13[0];
          continue;
        case 1uLL:
          goto LABEL_7;
        case 2uLL:
          sub_2376BE150((double *)&v12, &a3->x, i, -1, 0, v6);
          long long v10 = v13[2];
          goto LABEL_8;
        case 3uLL:
          v13[0] = v11;
LABEL_7:
          sub_2376BE470((double *)&v12, &a3->x, i, -1, v6);
          long long v10 = v13[0];
LABEL_8:
          long long v12 = v10;
          break;
        default:
          continue;
      }
    }
  }
}

- (void)appendBezierPath:(id)a3 fromSegment:(int64_t)a4 toSegment:(int64_t)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a4 < a5)
  {
    int64_t v6 = a4;
    do
    {
      switch([a3 elementAtIndex:v6 associatedPoints:&v9])
      {
        case 0:
          -[AKTSDBezierPath moveToPoint:](self, "moveToPoint:", v9, v10);
          break;
        case 1:
          -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", v9, v10);
          break;
        case 2:
          -[AKTSDBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v13, v14, v9, v10, v11, v12);
          break;
        case 3:
          [(AKTSDBezierPath *)self closePath];
          break;
        default:
          break;
      }
      ++v6;
    }
    while (a5 != v6);
  }
}

- (void)appendBezierPath:(id)a3 fromSegment:(int64_t)a4 t:(double)a5 toSegment:(int64_t)a6 t:(double)a7 withoutMove:(BOOL)a8
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v14 = a3;
  int64_t v15 = [v14 elementCount];
  int64_t v16 = v15;
  BOOL v18 = a4 < 1 || v15 <= a4;
  if (v18) {
    int64_t v19 = -1;
  }
  else {
    int64_t v19 = a4;
  }
  if (a6 <= 0) {
    a6 = v15 + 1;
  }
  if (v19 != a6)
  {
    if (!v18)
    {
      switch([v14 elementAtIndex:a4 allPoints:&v34])
      {
        case 0:
          if (!a8) {
            [(AKTSDBezierPath *)self moveToPoint:*(_OWORD *)&v34];
          }
          break;
        case 1:
        case 3:
          if (!a8) {
            -[AKTSDBezierPath moveToPoint:](self, "moveToPoint:", v35 * a5 + v34.f64[0] * (1.0 - a5), v36 * a5 + v34.f64[1] * (1.0 - a5));
          }
          -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", v35, v36);
          break;
        case 2:
          sub_2376BDA2C(&v34, (uint64_t)&v26, a5, 1.0);
          if (!a8) {
            -[AKTSDBezierPath moveToPoint:](self, "moveToPoint:", v26, v27);
          }
          -[AKTSDBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v32, v33, v28, v29, v30, v31);
          break;
        default:
          break;
      }
    }
    if (a6 >= v16) {
      int64_t v22 = v16;
    }
    else {
      int64_t v22 = a6;
    }
    int64_t v23 = v19 + 1;
    if (v23 < v22)
    {
      char v24 = 0;
      do
      {
        switch([v14 elementAtIndex:v23 associatedPoints:&v34])
        {
          case 0:
            [(AKTSDBezierPath *)self moveToPoint:*(_OWORD *)&v34];
            goto LABEL_47;
          case 1:
            [(AKTSDBezierPath *)self lineToPoint:*(_OWORD *)&v34];
            break;
          case 2:
            -[AKTSDBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v37, v38, *(_OWORD *)&v34, v35, v36);
            break;
          case 3:
            if (v24)
            {
              [(AKTSDBezierPath *)self closePath];
LABEL_47:
              char v24 = 1;
            }
            else
            {
              [(AKTSDBezierPath *)self lineToPoint:*(_OWORD *)&v34];
              char v24 = 0;
            }
            break;
          default:
            break;
        }
        ++v23;
      }
      while (v22 != v23);
    }
    if (a6 < 1 || a6 >= v16) {
      goto LABEL_58;
    }
    uint64_t v25 = [v14 elementAtIndex:a6 allPoints:&v34];
    if (v25 != 3)
    {
      if (v25 == 2)
      {
        sub_2376BDA2C(&v34, (uint64_t)&v26, 0.0, a7);
LABEL_57:
        -[AKTSDBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v32, v33, v28, v29, v30, v31);
        goto LABEL_58;
      }
      if (v25 != 1) {
        goto LABEL_58;
      }
    }
LABEL_55:
    -[AKTSDBezierPath lineToPoint:](self, "lineToPoint:", v35 * a7 + v34.f64[0] * (1.0 - a7), v36 * a7 + v34.f64[1] * (1.0 - a7));
    goto LABEL_58;
  }
  if (a7 < a5 || v19 >= v15) {
    LOBYTE(v18) = 1;
  }
  if (v18) {
    goto LABEL_58;
  }
  uint64_t v21 = [v14 elementAtIndex:v19 allPoints:&v34];
  switch(v21)
  {
    case 3:
      goto LABEL_22;
    case 2:
      sub_2376BDA2C(&v34, (uint64_t)&v26, a5, a7);
      if (!a8) {
        -[AKTSDBezierPath moveToPoint:](self, "moveToPoint:", v26, v27);
      }
      goto LABEL_57;
    case 1:
LABEL_22:
      if (!a8) {
        -[AKTSDBezierPath moveToPoint:](self, "moveToPoint:", v35 * a5 + v34.f64[0] * (1.0 - a5), v36 * a5 + v34.f64[1] * (1.0 - a5));
      }
      goto LABEL_55;
  }
LABEL_58:
}

- (id)copyFromSegment:(int)a3 t:(float)a4 toSegment:(int)a5 t:(float)a6
{
  id v11 = objc_alloc_init((Class)objc_opt_class());
  [v11 appendBezierPath:self fromSegment:a3 t:a5 toSegment:0 t:a4 withoutMove:a6];
  objc_msgSend(v11, "setWindingRule:", -[AKTSDBezierPath windingRule](self, "windingRule"));
  objc_msgSend(v11, "setLineCapStyle:", -[AKTSDBezierPath lineCapStyle](self, "lineCapStyle"));
  objc_msgSend(v11, "setLineJoinStyle:", -[AKTSDBezierPath lineJoinStyle](self, "lineJoinStyle"));
  [(AKTSDBezierPath *)self lineWidth];
  objc_msgSend(v11, "setLineWidth:");
  return v11;
}

- (CGPoint)nearestPointOnPathToLine:(CGPoint)a3[2]
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  double v5 = *MEMORY[0x263F00148];
  double v6 = *(double *)(MEMORY[0x263F00148] + 8);
  long long v25 = *MEMORY[0x263F00148];
  int64_t v7 = [(AKTSDBezierPath *)self elementCount];
  if (v7)
  {
    int64_t v8 = v7;
    uint64_t v9 = 0;
    float v10 = 3.4028e38;
    while (1)
    {
      unint64_t v11 = [(AKTSDBezierPath *)self elementAtIndex:v9 associatedPoints:v27];
      if (v11 == 2) {
        break;
      }
      if (v11 == 3)
      {
        long long v12 = v25;
LABEL_9:
        v27[0] = v12;
        unint64_t v11 = 2;
      }
      double x = a3[1].x;
      CGFloat y = a3[1].y;
      CGFloat v16 = y - a3->y;
      double v17 = x - a3->x;
      float v18 = v17 * v17 + v16 * v16;
      double v19 = (float)(1.0 / sqrtf(v18));
      *(float *)&CGFloat y = *((double *)v27 + 1) * -(v17 * v19)
                   + v16 * v19 * *(double *)v27
                   - (y * -(v17 * v19)
                    + v16 * v19 * x);
      float v20 = fabsf(*(float *)&y);
      if (v10 > v20)
      {
        double v6 = *((double *)v27 + 1);
        double v5 = *(double *)v27;
        float v10 = v20;
      }
      float64x2_t v26 = (float64x2_t)v27[0];
      if (!v11) {
        long long v25 = v27[0];
      }
      if (v8 == ++v9) {
        goto LABEL_15;
      }
    }
    double v23 = 0.0;
    double v24 = 0.0;
    sub_2376BDBAC(&v26, &a3->x, (uint64_t)&v23);
    if (v13 < v10)
    {
      double v6 = v24;
      double v5 = v23;
      float v10 = v13;
    }
    long long v12 = v27[2];
    goto LABEL_9;
  }
LABEL_15:
  double v21 = v5;
  double v22 = v6;
  result.CGFloat y = v22;
  result.double x = v21;
  return result;
}

- (CGPoint)nearestAngleOnPathToLine:(CGPoint)a3[2]
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  double v5 = *MEMORY[0x263F00148];
  double v6 = *(double *)(MEMORY[0x263F00148] + 8);
  double x = a3[1].x;
  double y = a3[1].y;
  double v9 = a3->x;
  float64x2_t v77 = *(float64x2_t *)MEMORY[0x263F00148];
  int64_t v10 = [(AKTSDBezierPath *)self elementCount];
  if (v10)
  {
    int64_t v11 = v10;
    double v12 = sub_237684610(x, y, v9);
    double v14 = sub_23768465C(v12, v13);
    double v16 = v15;
    uint64_t v17 = 0;
    float v18 = -2.0;
    double v73 = v15;
    double v74 = v14;
    while (1)
    {
      unint64_t v19 = -[AKTSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v17, &v79, *(void *)&v73, *(void *)&v74);
      if (v19 == 3) {
        break;
      }
      uint64_t v20 = v19;
      if (v19 == 2)
      {
        double v75 = v6;
        double v76 = v5;
        double v21 = a3->x;
        double v22 = sub_237684610(a3[1].x, a3[1].y, a3->x);
        double v24 = sub_23768465C(v22, v23);
        double v26 = v25;
        double v27 = sub_237684610(v78.f64[0], v78.f64[1], v21);
        double v29 = sub_23768465C(v27, v28);
        double v31 = sub_23768467C(v24, v26, v29, v30);
        v83.f64[0] = 0.0;
        v83.f64[1] = v31;
        double v32 = sub_237684610(v79.f64[0], v79.f64[1], v21);
        double v34 = sub_23768465C(v32, v33);
        double v36 = sub_23768467C(v24, v26, v34, v35);
        uint64_t v84 = 0x3FD5555555555555;
        double v85 = v36;
        double v37 = sub_237684610(v80, v81, v21);
        double v39 = sub_23768465C(v37, v38);
        double v41 = sub_23768467C(v24, v26, v39, v40);
        uint64_t v86 = 0x3FE5555555555555;
        double v87 = v41;
        double v42 = sub_237684610(v82[0], v82[1], v21);
        double v44 = sub_23768465C(v42, v43);
        double v46 = sub_23768467C(v24, v26, v44, v45);
        uint64_t v88 = 0x3FF0000000000000;
        double v89 = v46;
        double v47 = v36 * 9.0 + v31 * -3.0 + v41 * -9.0 + v46 * 3.0;
        double v48 = v36 * -12.0 + v31 * 6.0 + v41 * 6.0;
        double v49 = sqrt((v36 * 3.0 + v31 * -3.0) * (v47 * -4.0) + v48 * v48);
        double v50 = (-v48 - v49) / (v47 + v47);
        double v51 = sub_2376BD9D4(&v83, (v49 - v48) / (v47 + v47));
        double v53 = v52;
        double v54 = sub_2376BD9D4(&v83, v50);
        BOOL v57 = v54 <= 1.0 && v54 >= 0.0 && v53 <= v55;
        if ((v57 || (v51 >= 0.0 ? (BOOL v58 = v51 > 1.0) : (BOOL v58 = 1), v58))
          && (v54 >= 0.0 ? (v59 = v54 > 1.0) : (v59 = 1), double v51 = v54, v53 = v55, v59))
        {
          double v60 = -2.0;
          double v61 = 0.0;
          double v62 = 0.0;
        }
        else
        {
          double v61 = sub_2376BD9D4(&v78, v51);
          double v60 = fabs(v53);
        }
        double v6 = v75;
        double v5 = v76;
        float v64 = v60;
        if (v18 < v64)
        {
          float v18 = v64;
          double v6 = v62;
          double v5 = v61;
        }
        v63 = (float64x2_t *)v82;
        double v16 = v73;
        double v14 = v74;
        goto LABEL_28;
      }
LABEL_29:
      float64x2_t v65 = v79;
      double v66 = sub_237684610(v79.f64[0], v79.f64[1], a3->x);
      double v68 = sub_23768465C(v66, v67);
      float v70 = sub_23768467C(v14, v16, v68, v69);
      if (v18 < v70)
      {
        float v18 = v70;
        double v6 = v65.f64[1];
        double v5 = v65.f64[0];
      }
      float64x2_t v78 = v79;
      if (!v20) {
        float64x2_t v77 = v79;
      }
      if (v11 == ++v17) {
        goto LABEL_34;
      }
    }
    v63 = &v77;
LABEL_28:
    float64x2_t v79 = *v63;
    uint64_t v20 = 2;
    goto LABEL_29;
  }
LABEL_34:
  double v71 = v5;
  double v72 = v6;
  result.double y = v72;
  result.double x = v71;
  return result;
}

- (id)pressure
{
  return 0;
}

- (int64_t)elementPercentage:(float *)a3 forOverallPercentage:(float)a4
{
  [(AKTSDBezierPath *)self length];
  float v8 = v7;
  if (a4 < 0.0)
  {
    int64_t v9 = 0;
    do
      [(AKTSDBezierPath *)self lengthOfElement:++v9];
    while (v10 == 0.0);
    [(AKTSDBezierPath *)self lengthOfElement:v9];
    double v12 = (float)(v8 * a4) / v11;
LABEL_12:
    float v19 = v12;
    goto LABEL_13;
  }
  float v13 = v8 * a4;
  uint64_t v14 = [(AKTSDBezierPath *)self elementCount];
  if (v14 < 2)
  {
LABEL_9:
    int64_t v9 = v14;
    do
      [(AKTSDBezierPath *)self lengthOfElement:--v9];
    while (v17 == 0.0);
    [(AKTSDBezierPath *)self lengthOfElement:v9];
    double v12 = v13 / v18 + 1.0;
    goto LABEL_12;
  }
  int64_t v9 = 1;
  while (1)
  {
    [(AKTSDBezierPath *)self lengthOfElement:v9];
    float v16 = v15;
    float v13 = v13 - v16;
    if (v13 < 0.0) {
      break;
    }
    if (v14 == ++v9) {
      goto LABEL_9;
    }
  }
  float v19 = (float)(v13 + v16) / v16;
LABEL_13:
  *a3 = v19;
  return v9;
}

- (CGPoint)pointAt:(double)a3 fromElement:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  switch([(AKTSDBezierPath *)self elementAtIndex:a4 allPoints:&v24])
  {
    case 0uLL:
      float64x2_t v7 = v24;
      break;
    case 1uLL:
    case 3uLL:
      float64x2_t v7 = vmlaq_n_f64(vmulq_n_f64(v25, a3), v24, 1.0 - a3);
      break;
    case 2uLL:
      if (a3 >= 0.0)
      {
        double v13 = 1.0;
        if (a3 <= 1.0)
        {
          __asm { FMOV            V4.2D, #3.0 }
          float64x2_t v7 = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_f64(v25, _Q4), a3), 1.0 - a3), 1.0 - a3), vmulq_n_f64(vmulq_n_f64(v24, 1.0 - a3), 1.0 - a3), 1.0 - a3), vmulq_n_f64(vmulq_n_f64(vmulq_f64(v26, _Q4), a3), a3), 1.0 - a3), vmulq_n_f64(vmulq_n_f64(v27, a3), a3), a3);
          break;
        }
        *(float *)&double v13 = a3;
        [(AKTSDBezierPath *)self rawGradientAt:a4 fromElement:v13];
        double v10 = sub_23768461C(v14, v15, a3 + -1.0);
        double v12 = v27.f64[1];
        double v11 = v27.f64[0];
      }
      else
      {
        *(float *)&double v6 = a3;
        [(AKTSDBezierPath *)self rawGradientAt:a4 fromElement:v6];
        double v10 = sub_23768461C(v8, v9, a3);
        double v12 = v24.f64[1];
        double v11 = v24.f64[0];
      }
      v7.f64[0] = sub_237684604(v11, v12, v10);
      v7.f64[1] = v16;
      break;
    default:
      float64x2_t v7 = *(float64x2_t *)MEMORY[0x263F00148];
      break;
  }
  double v22 = v7.f64[1];
  result.double x = v7.f64[0];
  result.double y = v22;
  return result;
}

- (CGPoint)gradientAt:(double)a3 fromElement:(int64_t)a4
{
  *(float *)&a3 = a3;
  [(AKTSDBezierPath *)self rawGradientAt:a4 fromElement:a3];
  float v6 = v4 * v4 + v5 * v5;
  double v7 = (float)(1.0 / sqrtf(v6));
  double v8 = v5 * v7;
  double v9 = v4 * v7;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (CGPoint)gradientAt:(float)a3
{
  float v7 = 0.0;
  int64_t v4 = -[AKTSDBezierPath elementPercentage:forOverallPercentage:](self, "elementPercentage:forOverallPercentage:", &v7);
  [(AKTSDBezierPath *)self gradientAt:v4 fromElement:v7];
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (CGPoint)transformedCoordinate:(CGPoint)a3 withPressure:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  float v26 = 0.0;
  *(float *)&double v8 = x;
  int64_t v9 = [(AKTSDBezierPath *)self elementPercentage:&v26 forOverallPercentage:v8];
  [(AKTSDBezierPath *)self pointAt:v9 fromElement:v26];
  double v11 = v10;
  double v13 = v12;
  [(AKTSDBezierPath *)self gradientAt:v9 fromElement:v26];
  double v15 = v14;
  double v17 = v16;
  [(AKTSDBezierPath *)self lineWidth];
  double v19 = v18;
  if (v7) {
    [v7 pressureAt:x];
  }
  else {
    double v20 = 1.0;
  }
  double v21 = y * (v19 * v20);
  double v22 = v11 - v17 * v21;
  double v23 = v13 + v15 * v21;

  double v24 = v22;
  double v25 = v23;
  result.double y = v25;
  result.double x = v24;
  return result;
}

- (CGPoint)transformedTotalCoordinate:(CGPoint)a3 inElement:(int64_t)a4 withPressure:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a5;
  *(float *)&double v10 = x;
  [(AKTSDBezierPath *)self elementPercentageFromElement:a4 forOverallPercentage:v10];
  double v12 = v11;
  [(AKTSDBezierPath *)self pointAt:a4 fromElement:v11];
  double v14 = v13;
  double v16 = v15;
  [(AKTSDBezierPath *)self gradientAt:a4 fromElement:v12];
  double v18 = v17;
  double v20 = v19;
  [(AKTSDBezierPath *)self lineWidth];
  double v22 = v21;
  if (v9) {
    [v9 pressureAt:x];
  }
  else {
    double v23 = 1.0;
  }
  double v24 = y * (v22 * v23);
  double v25 = v14 - v20 * v24;
  double v26 = v16 + v18 * v24;

  double v27 = v25;
  double v28 = v26;
  result.double y = v28;
  result.double x = v27;
  return result;
}

- (CGPoint)transformedTotalCoordinate:(CGPoint)a3 betweenElement:(int64_t)a4 andElement:(int64_t)a5 withPressure:(id)a6 getElement:(int64_t *)a7 getPercentage:(float *)a8
{
  double y = a3.y;
  double x = a3.x;
  id v15 = a6;
  float v37 = 0.0;
  float v16 = x;
  *(float *)&double v17 = v16;
  int64_t v18 = [(AKTSDBezierPath *)self elementPercentage:&v37 forOverallPercentage:v17];
  if (v18 >= a4)
  {
    if (v18 <= a5)
    {
      float v20 = v37;
      a4 = v18;
    }
    else
    {
      *(float *)&double v19 = x;
      [(AKTSDBezierPath *)self elementPercentageFromElement:a5 forOverallPercentage:v19];
      float v37 = v20;
      a4 = a5;
    }
  }
  else
  {
    *(float *)&double v19 = x;
    [(AKTSDBezierPath *)self elementPercentageFromElement:a4 forOverallPercentage:v19];
    float v37 = v20;
  }
  [(AKTSDBezierPath *)self pointAt:a4 fromElement:v20];
  double v22 = v21;
  double v24 = v23;
  [(AKTSDBezierPath *)self gradientAt:a4 fromElement:v37];
  double v26 = v25;
  double v28 = v27;
  [(AKTSDBezierPath *)self lineWidth];
  double v30 = v29;
  if (v15) {
    [v15 pressureAt:x];
  }
  else {
    double v31 = 1.0;
  }
  double v32 = y * (v30 * v31);
  double v33 = v22 - v28 * v32;
  double v34 = v24 + v26 * v32;
  *a7 = a4;
  *a8 = v37;

  double v35 = v33;
  double v36 = v34;
  result.double y = v36;
  result.double x = v35;
  return result;
}

- (float)elementPercentageFromElement:(int)a3 forOverallPercentage:(float)a4
{
  [(AKTSDBezierPath *)self length];
  double v8 = v7;
  if (a3 < 1)
  {
    float v10 = 0.0;
  }
  else
  {
    uint64_t v9 = 0;
    float v10 = 0.0;
    do
    {
      [(AKTSDBezierPath *)self lengthOfElement:v9];
      float v10 = v11 + v10;
      ++v9;
    }
    while (a3 != v9);
  }
  float v12 = v8 * a4;
  double v13 = (float)(v12 - v10);
  [(AKTSDBezierPath *)self lengthOfElement:a3];
  return v13 / v14;
}

- (CGPoint)rawGradientAt:(float)a3 fromElement:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  float64x2_t v14 = *(float64x2_t *)MEMORY[0x263F00148];
  switch([(AKTSDBezierPath *)self elementAtIndex:a4 allPoints:&v15])
  {
    case 0uLL:
      NSLog(&cfstr_GaCanTHandleMo.isa);
      goto LABEL_4;
    case 1uLL:
    case 3uLL:
      float64x2_t v5 = vsubq_f64(v16, v15);
      break;
    case 2uLL:
      float v6 = 0.01;
      if (a3 >= 0.01) {
        float v6 = a3;
      }
      if (v6 > 0.99) {
        float v6 = 0.99;
      }
      __asm
      {
        FMOV            V4.2D, #-3.0
        FMOV            V5.2D, #3.0
      }
      float64x2_t v5 = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmulq_f64(v16, _Q5), (float)((float)((float)(v6 * -4.0) + 1.0) + (float)((float)(v6 * 3.0) * v6))), vmulq_n_f64(vmulq_f64(v15, _Q4), (float)(v6 + -1.0)), (float)(v6 + -1.0)), vmulq_n_f64(vmulq_f64(v17, _Q5), v6), (float)((float)(v6 * -3.0) + 2.0)), vmulq_n_f64(vmulq_f64(v18, _Q5), v6), v6);
      break;
    default:
LABEL_4:
      float64x2_t v5 = v14;
      break;
  }
  double v13 = v5.f64[1];
  result.double x = v5.f64[0];
  result.double y = v13;
  return result;
}

- (CGPoint)myGradientAt:(float)a3
{
  int v15 = 0;
  int64_t v4 = -[AKTSDBezierPath elementPercentage:forOverallPercentage:](self, "elementPercentage:forOverallPercentage:", &v15);
  LODWORD(v5) = v15;
  [(AKTSDBezierPath *)self rawGradientAt:v4 fromElement:v5];
  double v7 = v6;
  double v9 = v8;
  [(AKTSDBezierPath *)self length];
  double v11 = v10;
  [(AKTSDBezierPath *)self lengthOfElement:v4];
  double v13 = sub_23768461C(v7, v9, v11 / v12);
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (CGPoint)myGradientAt:(float)a3 fromElement:(int64_t)a4
{
  -[AKTSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:");
  double v7 = v6;
  double v9 = v8;
  [(AKTSDBezierPath *)self length];
  double v11 = v10;
  [(AKTSDBezierPath *)self lengthOfElement:a4];

  double v13 = sub_23768461C(v7, v9, v11 / v12);
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (float)curvatureAt:(float)a3
{
  float v8 = 0.0;
  int64_t v4 = -[AKTSDBezierPath elementPercentage:forOverallPercentage:](self, "elementPercentage:forOverallPercentage:", &v8);
  [(AKTSDBezierPath *)self curvatureAt:v4 fromElement:v8];
  double v6 = v5;
  float result = 0.5;
  if (v6 <= 0.5)
  {
    float result = -0.5;
    if (v6 >= -0.5) {
      return v6;
    }
  }
  return result;
}

- (double)curvatureAt:(double)a3 fromElement:(int)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(AKTSDBezierPath *)self elementAtIndex:a4 allPoints:&v13];
  if (v5 == 2)
  {
    double v7 = 0.01;
    if (a3 >= 0.01) {
      double v7 = a3;
    }
    if (v7 > 0.99) {
      double v7 = 0.99;
    }
    double v8 = (v7 * (v7 * (v19 - v17) + (1.0 - v7) * (v17 - v15)) + (1.0 - v7)
                                                             * (v7 * (v17 - v15) + (1.0 - v7) * (v15 - v13)))
       * 3.0;
    double v9 = (v7 * (v7 * (v20 - v18) + (1.0 - v7) * (v18 - v16)) + (1.0 - v7)
                                                             * (v7 * (v18 - v16) + (1.0 - v7) * (v16 - v14)))
       * 3.0;
    float v10 = v8 * ((v7 * (v20 - v18 - (v18 - v16)) + (1.0 - v7) * (v18 - v16 - (v16 - v14))) * 6.0)
        - v9 * ((v7 * (v19 - v17 - (v17 - v15)) + (1.0 - v7) * (v17 - v15 - (v15 - v13))) * 6.0);
    return (float)(v10 / pow(v9 * v9 + v8 * v8, 1.5));
  }
  else
  {
    double v6 = 0.0;
    if (!v5) {
      NSLog(&cfstr_CaCanTHandleMo.isa);
    }
  }
  return v6;
}

- (void)recursiveSubdivideOntoPath:(id)a3 into:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[AKTSDBezierPath recursiveSubdivideOntoPath:withScaling:inElementRange:into:](self, "recursiveSubdivideOntoPath:withScaling:inElementRange:into:", v7, 0, [v7 elementCount] - 1, v6, 0.0, 1.0);
}

- (void)recursiveSubdivideOntoPath:(id)a3 withScaling:(id)a4 into:(id)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a5;
  id v10 = a3;
  -[AKTSDBezierPath recursiveSubdivideOntoPath:withScaling:inElementRange:into:](self, "recursiveSubdivideOntoPath:withScaling:inElementRange:into:", v10, 0, [v10 elementCount] - 1, v9, var0, var1);
}

- (void)recursiveSubdivideOntoPath:(id)a3 withScaling:(id)a4 inElementRange:(_NSRange)a5 into:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  double var1 = a4.var1;
  double var0 = a4.var0;
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v81 = a6;
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  double v13 = [AKTSDPathCut alloc];
  [v11 lengthToElement:location];
  double v15 = v14;
  [v11 length];
  double v17 = [(AKTSDPathCut *)v13 initWithSegment:location atT:v15 / v16 withSkew:0.0];
  [v12 addObject:v17];
  [v11 miterLimit];
  NSUInteger v19 = location + length;
  NSUInteger v20 = location + 1;
  if (v20 < v19)
  {
    double v76 = v18 * 0.995;
    NSUInteger v21 = length - 1;
    do
    {
      NSUInteger v22 = v20 + 1;
      objc_msgSend(v11, "lengthOfElement:", v20 + 1, *(void *)&v76);
      if (v23 >= 0.1)
      {
        [v11 lengthOfElement:v20];
        if (v24 >= 0.1)
        {
          double v25 = var0;
          [v11 gradientAt:v20 fromElement:1.0];
          double v28 = sub_23768465C(v26, v27);
          double v30 = v29;
          [v11 gradientAt:v20 + 1 fromElement:0.0];
          double v33 = sub_23768465C(v31, v32);
          double v35 = v34;
          float v36 = sub_23768467C(v28, v30, v33, v34);
          if (v36 >= 0.99)
          {
            double var0 = v25;
          }
          else
          {
            objc_msgSend(v11, "lengthToElement:", v20 + 1, v36);
            double v79 = v37;
            [v11 length];
            double v39 = v38;
            float v40 = 0.0;
            if (v22 < v19)
            {
              double v77 = v38;
              double v41 = sub_23768461C(v33, v35, -1.0);
              double v42 = sub_237684604(v28, v30, v41);
              double v44 = v43;
              double v45 = -sub_23768467C(v28, v30, v42, v43);
              double v46 = sub_2376846D4(0, v28, v30);
              float v40 = v45 / sub_23768467C(v42, v44, v46, v47);
              float v48 = fmin(fmax((float)-v36, -1.0), 1.0);
              float v49 = acosf(v48);
              float v50 = sinf(v49 * 0.5);
              double v39 = v77;
              if (1.0 / v50 > v76) {
                float v40 = 0.0;
              }
            }
            float v51 = v79 / v39;
            double v52 = [[AKTSDPathCut alloc] initWithSegment:v20 atT:v51 withSkew:v40];

            [v12 addObject:v52];
            double v17 = v52;
            double var0 = v25;
          }
        }
      }
      NSUInteger v20 = v22;
      --v21;
    }
    while (v21);
  }
  if (v19)
  {
    do
    {
      [v11 lengthOfElement:v19];
      BOOL v54 = v53 < 0.1;
      if (v53 >= 0.1) {
        break;
      }
      --v19;
    }
    while (v19);
  }
  else
  {
    BOOL v54 = 1;
  }
  double v55 = [AKTSDPathCut alloc];
  [v11 lengthToElement:v19 + 1];
  double v57 = v56;
  [v11 length];
  BOOL v59 = [(AKTSDPathCut *)v55 initWithSegment:v19 atT:v57 / v58 withSkew:0.0];

  [v12 addObject:v59];
  if (!v54)
  {
    double v80 = v59;
    float64x2_t v84 = *(float64x2_t *)MEMORY[0x263F00148];
    int64_t v60 = [(AKTSDBezierPath *)self elementCount];
    if (v60)
    {
      int64_t v61 = v60;
      uint64_t v62 = 0;
      BOOL v63 = 0;
      do
      {
        unint64_t v64 = [(AKTSDBezierPath *)self elementAtIndex:v62 associatedPoints:&v86];
        BOOL v65 = v64 == 0;
        if (v64)
        {
          unint64_t v66 = v64;
          if (v64 == 2)
          {
            v86.f64[0] = var0 + v86.f64[0] * var1;
            double v87 = var0 + v87 * var1;
            v89.f64[0] = var0 + v89.f64[0] * var1;
            float64x2_t v82 = v89;
            sub_2376C0254(&v85, v11, 0, v81, v63, v12);
            float64x2_t v85 = v82;
          }
          else
          {
            if (v64 == 3)
            {
              float64x2_t v86 = v84;
              float64x2_t v67 = v84;
            }
            else
            {
              v67.f64[0] = var0 + v86.f64[0] * var1;
              v86.f64[0] = v67.f64[0];
            }
            float64x2_t v68 = v85;
            double v69 = sub_237684610(v67.f64[0], v86.f64[1], v85.f64[0]);
            double v71 = v70;
            float64x2_t v89 = v86;
            double v72 = sub_23768461C(v69, v70, 0.33);
            v86.f64[0] = sub_237684604(v68.f64[0], v68.f64[1], v72);
            v86.f64[1] = v73;
            double v74 = sub_23768461C(v69, v71, 0.66);
            double v87 = sub_237684604(v68.f64[0], v68.f64[1], v74);
            uint64_t v88 = v75;
            float64x2_t v83 = v89;
            sub_2376C0254(&v85, v11, 0, v81, v63, v12);
            float64x2_t v85 = v83;
            if (v66 == 3) {
              [v81 closePath];
            }
          }
        }
        else
        {
          v86.f64[0] = var0 + v86.f64[0] * var1;
          float64x2_t v84 = v86;
          float64x2_t v85 = v86;
        }
        ++v62;
        BOOL v63 = v65;
      }
      while (v61 != v62);
    }
    BOOL v59 = v80;
  }
}

- (id)chisel
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  int64_t v3 = +[AKTSDBezierPath bezierPath];
  [(AKTSDBezierPath *)self lineWidth];
  float v5 = v4 * 0.5;
  int64_t v6 = [(AKTSDBezierPath *)self elementCount];
  if (!v6)
  {
    BOOL v9 = 1;
    uint64_t v54 = -1;
    goto LABEL_60;
  }
  int64_t v7 = v6;
  uint64_t v8 = 0;
  BOOL v9 = 1;
  float v10 = 9.0;
  float v11 = -3.0;
  do
  {
    BOOL v12 = v9;
    unint64_t v13 = [(AKTSDBezierPath *)self elementAtIndex:v8 allPoints:&v111];
    BOOL v9 = v13 == 0;
    if (!v13) {
      goto LABEL_56;
    }
    unint64_t v14 = v13;
    [(AKTSDBezierPath *)self rawGradientAt:v8 fromElement:0.0];
    if (v15 <= 0.0) {
      float v16 = -v5;
    }
    else {
      float v16 = v5;
    }
    if (v14 == 2)
    {
      float v17 = v111.f64[0];
      float v18 = v112;
      float v19 = v114;
      float v20 = v116;
      float v21 = (float)((float)((float)(v18 * v10) + (float)(v17 * v11)) + (float)(v19 * -9.0)) + (float)(v20 * 3.0);
      float v22 = (float)((float)(v18 * -12.0) + (float)(v17 * 6.0)) + (float)(v19 * 6.0);
      float v23 = (float)(v18 * 3.0) + (float)(v17 * v11);
      float v24 = (float)(v23 * (float)(v21 * -4.0)) + (float)(v22 * v22);
      if (v24 <= 0.0)
      {
        double v35 = v16;
        double v36 = v111.f64[1] + v16;
        if (v12) {
          objc_msgSend(v3, "moveToPoint:", v111.f64[0], v36);
        }
        else {
          objc_msgSend(v3, "lineToPoint:", v111.f64[0], v36);
        }
        double v40 = v116;
        double v41 = v117 + v35;
        double v42 = v112;
        double v43 = v113 + v35;
        double v44 = v114;
        double v45 = v115;
        goto LABEL_55;
      }
      float v25 = sqrtf(v24);
      float v26 = (float)((float)-v22 - v25) / (float)(v21 + v21);
      float v27 = (float)(v25 - v22) / (float)(v21 + v21);
      if (v27 >= v26) {
        float v28 = v27;
      }
      else {
        float v28 = v26;
      }
      if (v27 < v26) {
        float v26 = v27;
      }
      double v29 = fabsf(v21);
      float v30 = (float)-v23 / v22;
      if (v29 <= 0.001) {
        float v31 = 10.0;
      }
      else {
        float v31 = v28;
      }
      if (v29 <= 0.001) {
        float v32 = v30;
      }
      else {
        float v32 = v26;
      }
      if (v32 > 0.0 && v32 < 1.0)
      {
        double v37 = v32;
        sub_2376BDA2C(&v111, (uint64_t)&v103, 0.0, v32);
        double v38 = v16;
        double v39 = v104 + v38;
        if (v12) {
          objc_msgSend(v3, "moveToPoint:", v103, v39);
        }
        else {
          objc_msgSend(v3, "lineToPoint:", v103, v39);
        }
        objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v109, v110 + v38, v105, v106 + v38, v107, v108 + v38);
        double v46 = v37 + 0.01;
        *(float *)&double v46 = v37 + 0.01;
        [(AKTSDBezierPath *)self rawGradientAt:v8 fromElement:v46];
        BOOL v12 = 0;
        if (v47 <= 0.0) {
          float v16 = -v5;
        }
        else {
          float v16 = v5;
        }
      }
      else
      {
        float v32 = 0.0;
      }
      double v48 = v32;
      if (v31 > 0.0 && v31 < 1.0)
      {
        double v50 = v31;
        sub_2376BDA2C(&v111, (uint64_t)&v103, v48, v31);
        double v51 = v104 + v16;
        if (v12) {
          objc_msgSend(v3, "moveToPoint:", v103, v51);
        }
        else {
          objc_msgSend(v3, "lineToPoint:", v103, v51);
        }
        float v10 = 9.0;
        objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v109, v110 + v16, v105, v106 + v16, v107, v108 + v16);
        double v52 = v50 + 0.01;
        *(float *)&double v52 = v50 + 0.01;
        [(AKTSDBezierPath *)self rawGradientAt:v8 fromElement:v52];
        if (v53 <= 0.0) {
          float v16 = -v5;
        }
        else {
          float v16 = v5;
        }
        sub_2376BDA2C(&v111, (uint64_t)&v103, v50, 1.0);
      }
      else
      {
        sub_2376BDA2C(&v111, (uint64_t)&v103, v48, 1.0);
        if (v12)
        {
          double v35 = v16;
          objc_msgSend(v3, "moveToPoint:", v103, v104 + v16);
          float v10 = 9.0;
          float v11 = -3.0;
LABEL_54:
          double v40 = v109;
          double v41 = v110 + v35;
          double v42 = v105;
          double v43 = v106 + v35;
          double v44 = v107;
          double v45 = v108;
LABEL_55:
          objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v40, v41, v42, v43, v44, v45 + v35);
          goto LABEL_56;
        }
        float v10 = 9.0;
      }
      float v11 = -3.0;
      double v35 = v16;
      objc_msgSend(v3, "lineToPoint:", v103, v104 + v16);
      goto LABEL_54;
    }
    double v34 = v111.f64[1] + v16;
    if (v12) {
      objc_msgSend(v3, "moveToPoint:", v111.f64[0], v34);
    }
    else {
      objc_msgSend(v3, "lineToPoint:", v111.f64[0], v34);
    }
    objc_msgSend(v3, "lineToPoint:", v112, v113 + v16);
LABEL_56:
    ++v8;
  }
  while (v7 != v8);
  uint64_t v54 = v7 - 1;
  if (v54)
  {
LABEL_60:
    if (*MEMORY[0x263F00148] >= 0.0) {
      float v55 = -v5;
    }
    else {
      float v55 = v5;
    }
    double v56 = v55;
    float v57 = 9.0;
    float v58 = -3.0;
    do
    {
      unint64_t v59 = [(AKTSDBezierPath *)self elementAtIndex:v54 allPoints:&v111];
      BOOL v61 = v59 == 0;
      if (v59)
      {
        unint64_t v62 = v59;
        LODWORD(v60) = 1.0;
        [(AKTSDBezierPath *)self rawGradientAt:v54 fromElement:v60];
        if (v63 >= 0.0) {
          float v64 = -v5;
        }
        else {
          float v64 = v5;
        }
        if (v62 == 2)
        {
          float v65 = v111.f64[0];
          float v66 = v112;
          float v67 = v114;
          float v68 = v116;
          float v69 = (float)((float)((float)(v66 * v57) + (float)(v65 * v58)) + (float)(v67 * -9.0)) + (float)(v68 * 3.0);
          float v70 = (float)((float)(v66 * -12.0) + (float)(v65 * 6.0)) + (float)(v67 * 6.0);
          float v71 = (float)(v66 * 3.0) + (float)(v65 * v58);
          float v72 = (float)(v71 * (float)(v69 * -4.0)) + (float)(v70 * v70);
          if (v72 <= 0.0)
          {
            double v85 = v64;
            if (v9) {
              objc_msgSend(v3, "moveToPoint:");
            }
            else {
              objc_msgSend(v3, "lineToPoint:");
            }
            double v89 = v111.f64[0];
            double v90 = v111.f64[1] + v85;
            double v91 = v114;
            double v92 = v115 + v85;
            double v93 = v112;
            double v94 = v113;
          }
          else
          {
            float v73 = sqrtf(v72);
            float v74 = (float)((float)-v70 - v73) / (float)(v69 + v69);
            float v75 = (float)(v73 - v70) / (float)(v69 + v69);
            if (v75 <= v74) {
              float v76 = v75;
            }
            else {
              float v76 = v74;
            }
            if (v75 > v74) {
              float v74 = v75;
            }
            double v77 = fabsf(v69);
            float v78 = (float)-v71 / v70;
            if (v77 <= 0.001) {
              float v79 = 10.0;
            }
            else {
              float v79 = v76;
            }
            if (v77 <= 0.001) {
              float v80 = v78;
            }
            else {
              float v80 = v74;
            }
            if (v80 > 0.0 && v80 < 1.0)
            {
              double v86 = v80;
              sub_2376BDA2C(&v111, (uint64_t)&v103, v80, 1.0);
              double v87 = v64;
              double v88 = v110 + v87;
              if (v9) {
                objc_msgSend(v3, "moveToPoint:", v109, v88);
              }
              else {
                objc_msgSend(v3, "lineToPoint:", v109, v88);
              }
              objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v103, v104 + v87, v107, v108 + v87, v105, v106 + v87);
              double v95 = v86 + -0.01;
              *(float *)&double v95 = v86 + -0.01;
              [(AKTSDBezierPath *)self rawGradientAt:v54 fromElement:v95];
              BOOL v9 = 0;
              if (v96 >= 0.0) {
                float v64 = -v5;
              }
              else {
                float v64 = v5;
              }
            }
            else
            {
              float v80 = 1.0;
            }
            if (v79 > 0.0 && v79 < 1.0)
            {
              double v98 = v79;
              sub_2376BDA2C(&v111, (uint64_t)&v103, v79, v80);
              double v99 = v110 + v64;
              if (v9) {
                objc_msgSend(v3, "moveToPoint:", v109, v99);
              }
              else {
                objc_msgSend(v3, "lineToPoint:", v109, v99);
              }
              float v57 = 9.0;
              objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v103, v104 + v64, v107, v108 + v64, v105, v106 + v64);
              double v100 = v98 + -0.01;
              *(float *)&double v100 = v98 + -0.01;
              [(AKTSDBezierPath *)self rawGradientAt:v54 fromElement:v100];
              if (v101 >= 0.0) {
                float v64 = -v5;
              }
              else {
                float v64 = v5;
              }
              sub_2376BDA2C(&v111, (uint64_t)&v103, 0.0, v98);
            }
            else
            {
              sub_2376BDA2C(&v111, (uint64_t)&v103, 0.0, v80);
              if (v9)
              {
                double v85 = v64;
                objc_msgSend(v3, "moveToPoint:", v109, v110 + v64);
                float v57 = 9.0;
                float v58 = -3.0;
                goto LABEL_117;
              }
              float v57 = 9.0;
            }
            float v58 = -3.0;
            double v85 = v64;
            objc_msgSend(v3, "lineToPoint:", v109, v110 + v64);
LABEL_117:
            double v89 = v103;
            double v90 = v104 + v85;
            double v91 = v107;
            double v92 = v108 + v85;
            double v93 = v105;
            double v94 = v106;
          }
          objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v89, v90, v91, v92, v93, v94 + v85);
          goto LABEL_119;
        }
        double v84 = v113 + v64;
        if (v9) {
          objc_msgSend(v3, "moveToPoint:", v112, v84);
        }
        else {
          objc_msgSend(v3, "lineToPoint:", v112, v84);
        }
        double v82 = v111.f64[0];
        double v83 = v111.f64[1] + v64;
      }
      else
      {
        double v82 = v111.f64[0];
        double v83 = v111.f64[1] - v56;
      }
      objc_msgSend(v3, "lineToPoint:", v82, v83);
LABEL_119:
      BOOL v9 = v61;
      --v54;
    }
    while (v54);
  }

  return v3;
}

@end