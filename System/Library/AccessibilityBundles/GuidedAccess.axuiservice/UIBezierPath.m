@interface UIBezierPath
+ (UIBezierPath)bezierPathWithPoints:(id)a3;
+ (id)smoothPathForFingerPath:(id)a3;
+ (void)_enumerateShapeRecognizersUsingBlock:(id)a3;
+ (void)_enumerateShapeSimplifiersUsingBlock:(id)a3;
+ (void)_enumerateShapeSmoothersUsingBlock:(id)a3;
- (BOOL)_gaxIsSimpleRectangle;
- (BOOL)containsPath:(id)a3;
- (BOOL)containsPath:(id)a3 withMarginOfError:(double)a4;
- (BOOL)intersectsPath:(id)a3;
- (BOOL)isEqualPoints:(id)a3;
- (CGPoint)_pointOnPathAtIntersectionOfCenterAndPoint:(CGPoint)a3;
- (CGPoint)bottomLeftPoint;
- (CGPoint)bottomLeftPointOnPath;
- (CGPoint)bottomRightPoint;
- (CGPoint)bottomRightPointOnPath;
- (CGPoint)boundsCenter;
- (CGPoint)topLeftPoint;
- (CGPoint)topLeftPointOnPath;
- (CGPoint)topRightPoint;
- (CGPoint)topRightPointOnPath;
- (UIBezierPath)bezierPathWithUniformInset:(double)a3;
- (double)distanceFromStartingPointForPointWithElementIndex:(unint64_t)a3;
- (double)length;
- (id)_gaxPathContext;
- (id)bezierPathByApplyingTransformation:(id)a3;
- (id)bezierPathConstrainedToFrame:(CGRect)a3;
- (id)description;
- (id)equivalentPathForDirection:(int)a3;
- (id)equivalentPathStartingWithElementAtIndex:(unint64_t)a3;
- (id)equivalentPathStartingWithFirstElementMatchingCondition:(id)a3;
- (int)direction;
- (unint64_t)numberOfElements;
- (void)_gaxSetSimpleRectangle:(BOOL)a3;
- (void)appendElementOfType:(int)a3 withSinglePoint:(CGPoint)a4;
- (void)copyBezierPathPointsExcludingControlPoints;
- (void)enumerateElementsUsingBlock:(id)a3;
- (void)enumerateLinePointsContextsUsingBlock:(id)a3;
- (void)enumerateLineSegmentContextsUsingBlock:(id)a3;
@end

@implementation UIBezierPath

+ (void)_enumerateShapeSimplifiersUsingBlock:(id)a3
{
  char v6 = 0;
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  (*((void (**)(id, uint64_t, char *))a3 + 2))(v4, v5, &v6);
}

+ (void)_enumerateShapeRecognizersUsingBlock:(id)a3
{
  v3 = (void (**)(id, uint64_t, unsigned char *))a3;
  char v6 = 0;
  uint64_t v4 = objc_opt_class();
  v3[2](v3, v4, &v6);
  if (!v6)
  {
    uint64_t v5 = objc_opt_class();
    v3[2](v3, v5, &v6);
  }
}

+ (void)_enumerateShapeSmoothersUsingBlock:(id)a3
{
  char v6 = 0;
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  (*((void (**)(id, uint64_t, char *))a3 + 2))(v4, v5, &v6);
}

+ (id)smoothPathForFingerPath:(id)a3
{
  uint64_t v22 = 0;
  v23 = (id *)&v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_1E030;
  v26 = sub_1E040;
  id v4 = a3;
  id v27 = v4;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1E048;
  v21[3] = &unk_5D7F8;
  v21[4] = &v22;
  [a1 _enumerateShapeSimplifiersUsingBlock:v21];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_1E030;
  v19[4] = sub_1E040;
  id v20 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1E030;
  v16 = sub_1E040;
  id v17 = v23[5];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1E0C0;
  v10[3] = &unk_5D848;
  v10[4] = &v22;
  v10[5] = v19;
  v10[6] = v18;
  v10[7] = &v12;
  v10[8] = v11;
  [a1 _enumerateShapeRecognizersUsingBlock:v10];
  id v6 = (id)v13[5];
  if (v6 && v6 != v23[5]) {
    objc_storeStrong(v23 + 5, v6);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1E410;
  v9[3] = &unk_5D7F8;
  v9[4] = &v22;
  [a1 _enumerateShapeSmoothersUsingBlock:v9];
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v19, 8);

  id v7 = v23[5];
  _Block_object_dispose(&v22, 8);

  return v7;
}

+ (UIBezierPath)bezierPathWithPoints:(id)a3
{
  id v3 = a3;
  id v4 = +[UIBezierPath bezierPath];
  if (v3)
  {
    [v3 CGPointValue];
    objc_msgSend(v4, "moveToPoint:");
    v10 = (id *)&v13;
    id v5 = v12;
    if (v5)
    {
      id v6 = v5;
      do
      {
        [v6 CGPointValue];
        objc_msgSend(v4, "addLineToPoint:");
        id v7 = v10++;
        id v8 = *v7;

        id v6 = v8;
      }
      while (v8);
    }
    [v4 closePath];
  }

  return (UIBezierPath *)v4;
}

- (CGPoint)boundsCenter
{
  [(UIBezierPath *)self bounds];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGFloat MidX = CGRectGetMidX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v11);
  double v8 = MidX;
  result.CGFloat y = MidY;
  result.CGFloat x = v8;
  return result;
}

- (unint64_t)numberOfElements
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2C258;
  v4[3] = &unk_5DD00;
  v4[4] = &v5;
  [(UIBezierPath *)self enumerateElementsUsingBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)enumerateElementsUsingBlock:(id)a3
{
  id v4 = self;
  id v5 = a3;
  [(UIBezierPath *)v4 CGPath];
  AX_CGPathEnumerateElementsUsingBlock();
}

- (CGPoint)topLeftPoint
{
  [(UIBezierPath *)self bounds];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGFloat MinX = CGRectGetMinX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v11);
  double v8 = MinX;
  result.CGFloat y = MinY;
  result.CGFloat x = v8;
  return result;
}

- (CGPoint)topRightPoint
{
  [(UIBezierPath *)self bounds];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGFloat MaxX = CGRectGetMaxX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v11);
  double v8 = MaxX;
  result.CGFloat y = MinY;
  result.CGFloat x = v8;
  return result;
}

- (CGPoint)bottomRightPoint
{
  [(UIBezierPath *)self bounds];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGFloat MaxX = CGRectGetMaxX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v11);
  double v8 = MaxX;
  result.CGFloat y = MaxY;
  result.CGFloat x = v8;
  return result;
}

- (CGPoint)bottomLeftPoint
{
  [(UIBezierPath *)self bounds];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGFloat MinX = CGRectGetMinX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v11);
  double v8 = MinX;
  result.CGFloat y = MaxY;
  result.CGFloat x = v8;
  return result;
}

- (CGPoint)topLeftPointOnPath
{
  [(UIBezierPath *)self topLeftPoint];

  -[UIBezierPath _pointOnPathAtIntersectionOfCenterAndPoint:](self, "_pointOnPathAtIntersectionOfCenterAndPoint:");
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (CGPoint)topRightPointOnPath
{
  [(UIBezierPath *)self topRightPoint];

  -[UIBezierPath _pointOnPathAtIntersectionOfCenterAndPoint:](self, "_pointOnPathAtIntersectionOfCenterAndPoint:");
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (CGPoint)bottomRightPointOnPath
{
  [(UIBezierPath *)self bottomRightPoint];

  -[UIBezierPath _pointOnPathAtIntersectionOfCenterAndPoint:](self, "_pointOnPathAtIntersectionOfCenterAndPoint:");
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (CGPoint)bottomLeftPointOnPath
{
  [(UIBezierPath *)self bottomLeftPoint];

  -[UIBezierPath _pointOnPathAtIntersectionOfCenterAndPoint:](self, "_pointOnPathAtIntersectionOfCenterAndPoint:");
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (double)length
{
  unint64_t v2 = [(UIBezierPath *)self _gaxPathContext];
  double v3 = 0.0;
  if ([v2 linePointsContexts])
  {
    uint64_t Count = AXCArrayGetCount();
    if (Count)
    {
      uint64_t v5 = Count - 1;
      if (Count - 1 >= (unint64_t)AXCArrayGetCount())
      {
        AXCArrayGetCount();
        _AXAssert();
      }
      double v3 = *(double *)(_AXCArrayGetUnderlyingArray() + 48 * v5 + 16);
    }
  }

  return v3;
}

- (double)distanceFromStartingPointForPointWithElementIndex:(unint64_t)a3
{
  double v4 = [(UIBezierPath *)self _gaxPathContext];
  id v5 = [v4 linePointsContexts];
  id v6 = [v4 linePointsIndicesPerElementIndices];
  double v7 = 0.0;
  if (v5 && v6 && AXCArrayGetCount() > a3)
  {
    if (AXCArrayGetCount() <= a3)
    {
      AXCArrayGetCount();
      _AXAssert();
    }
    unint64_t v8 = *(void *)(_AXCArrayGetUnderlyingArray() + 8 * a3);
    if (v8 < AXCArrayGetCount())
    {
      if (v8 >= AXCArrayGetCount())
      {
        AXCArrayGetCount();
        _AXAssert();
      }
      double v7 = *(double *)(_AXCArrayGetUnderlyingArray() + 48 * v8 + 16);
    }
  }

  return v7;
}

- (BOOL)containsPath:(id)a3
{
  return [(UIBezierPath *)self containsPath:a3 withMarginOfError:0.0];
}

- (BOOL)containsPath:(id)a3 withMarginOfError:(double)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  if (a4 == 0.0
    && [(UIBezierPath *)self _gaxIsSimpleRectangle]
    && [v6 _gaxIsSimpleRectangle])
  {
    [(UIBezierPath *)self bounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [v6 bounds];
    v27.origin.CGFloat x = v15;
    v27.origin.CGFloat y = v16;
    v27.size.CGFloat width = v17;
    v27.size.CGFloat height = v18;
    v26.origin.CGFloat x = v8;
    v26.origin.CGFloat y = v10;
    v26.size.CGFloat width = v12;
    v26.size.CGFloat height = v14;
    BOOL v19 = CGRectContainsRect(v26, v27);
    *((unsigned char *)v23 + 24) = v19;
  }
  else
  {
    *((unsigned char *)v23 + 24) = 1;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_2C8AC;
    v21[3] = &unk_5DD28;
    *(double *)&v21[6] = a4;
    v21[4] = self;
    void v21[5] = &v22;
    [v6 enumerateElementsUsingBlock:v21];
    BOOL v19 = *((unsigned char *)v23 + 24) != 0;
  }
  _Block_object_dispose(&v22, 8);

  return v19;
}

- (BOOL)intersectsPath:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  char v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  if ([(UIBezierPath *)self _gaxIsSimpleRectangle]
    && [v4 _gaxIsSimpleRectangle])
  {
    [(UIBezierPath *)self bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [v4 bounds];
    v29.origin.CGFloat x = v13;
    v29.origin.CGFloat y = v14;
    v29.size.CGFloat width = v15;
    v29.size.CGFloat height = v16;
    v28.origin.CGFloat x = v6;
    v28.origin.CGFloat y = v8;
    v28.size.CGFloat width = v10;
    v28.size.CGFloat height = v12;
    BOOL v17 = CGRectIntersectsRect(v28, v29);
    *((unsigned char *)v25 + 24) = v17;
  }
  else
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_2CB5C;
    v21[3] = &unk_5DD50;
    id v18 = v4;
    id v22 = v18;
    v23 = &v24;
    [(UIBezierPath *)self enumerateElementsUsingBlock:v21];
    if (!*((unsigned char *)v25 + 24))
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_2CBB0;
      v20[3] = &unk_5DD50;
      v20[4] = self;
      v20[5] = &v24;
      [v18 enumerateElementsUsingBlock:v20];
    }

    BOOL v17 = *((unsigned char *)v25 + 24) != 0;
  }
  _Block_object_dispose(&v24, 8);

  return v17;
}

- (int)direction
{
  unint64_t v2 = self;
  [(UIBezierPath *)self boundsCenter];
  uint64_t v7 = 0;
  CGFloat v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2CCD8;
  v6[3] = &unk_5DD78;
  v6[4] = &v7;
  v6[5] = v3;
  v6[6] = v4;
  [(UIBezierPath *)v2 enumerateLineSegmentContextsUsingBlock:v6];
  LODWORD(v2) = v8[3] < 0.0;
  _Block_object_dispose(&v7, 8);
  return (int)v2;
}

- (id)equivalentPathForDirection:(int)a3
{
  if ([(UIBezierPath *)self direction] == a3)
  {
    uint64_t v4 = self;
  }
  else
  {
    double v5 = (const void *)AXCArrayCreate();
    uint64_t v6 = AXCArrayCreate();
    uint64_t v7 = (const void *)v6;
    uint64_t v4 = 0;
    if (v5 && v6)
    {
      uint64_t v4 = +[UIBezierPath bezierPath];
      uint64_t v21 = 0;
      id v22 = &v21;
      uint64_t v23 = 0x2020000000;
      uint64_t v24 = 0;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_2D010;
      v20[3] = &unk_5DDA0;
      v20[5] = v5;
      void v20[6] = v7;
      v20[4] = &v21;
      [(UIBezierPath *)self enumerateElementsUsingBlock:v20];
      unint64_t v8 = v22[3];
      if (v8)
      {
        unint64_t v9 = 0;
        char v10 = 0;
        char v11 = 0;
        uint64_t v12 = -1;
        do
        {
          unint64_t v13 = v8 + v12;
          if (v13 >= AXCArrayGetCount())
          {
            AXCArrayGetCount();
            _AXAssert();
          }
          int v14 = *(_DWORD *)(_AXCArrayGetUnderlyingArray() + 4 * v13);
          if (v13 >= AXCArrayGetCount())
          {
            AXCArrayGetCount();
            _AXAssert();
          }
          UnderlyingArraCGFloat y = _AXCArrayGetUnderlyingArray();
          if (v14 == 4)
          {
            char v10 = 1;
          }
          else
          {
            CGFloat v16 = (double *)(UnderlyingArray + 16 * v13);
            double v17 = *v16;
            double v18 = v16[1];
            if (v14 == 1)
            {
              -[UIBezierPath appendElementOfType:withSinglePoint:](v4, "appendElementOfType:withSinglePoint:", (v11 & 1) == 0, v17, v18);
              char v11 = 0;
            }
            else if (!v14)
            {
              -[UIBezierPath appendElementOfType:withSinglePoint:](v4, "appendElementOfType:withSinglePoint:", 1, v17, v18);
              if (v10) {
                [(UIBezierPath *)v4 closePath];
              }
              char v10 = 0;
              char v11 = 1;
            }
          }
          ++v9;
          unint64_t v8 = v22[3];
          --v12;
        }
        while (v9 < v8);
      }
      _Block_object_dispose(&v21, 8);
    }
    if (v5) {
      CFRelease(v5);
    }
    if (v7) {
      CFRelease(v7);
    }
  }

  return v4;
}

- (UIBezierPath)bezierPathWithUniformInset:(double)a3
{
  if ([(UIBezierPath *)self _gaxIsSimpleRectangle])
  {
    [(UIBezierPath *)self bounds];
    CGRect v12 = CGRectInset(v11, a3, a3);
    double v5 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
  }
  else
  {
    [(UIBezierPath *)self boundsCenter];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_2D1A8;
    v9[3] = &unk_5DDC0;
    v9[4] = v6;
    void v9[5] = v7;
    *(double *)&v9[6] = a3;
    double v5 = [(UIBezierPath *)self bezierPathByApplyingTransformation:v9];
  }

  return (UIBezierPath *)v5;
}

- (id)bezierPathByApplyingTransformation:(id)a3
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_2D2F4;
  v9[3] = &unk_5DDE8;
  id v11 = a3;
  id v4 = (id)objc_opt_new();
  id v10 = v4;
  id v5 = v11;
  [(UIBezierPath *)self enumerateElementsUsingBlock:v9];
  uint64_t v6 = v10;
  id v7 = v4;

  return v7;
}

- (id)equivalentPathStartingWithElementAtIndex:(unint64_t)a3
{
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_2D518;
  v14[3] = &unk_5DE10;
  CGFloat v16 = v18;
  unint64_t v17 = a3;
  id v5 = (id)objc_opt_new();
  id v15 = v5;
  [(UIBezierPath *)self enumerateElementsUsingBlock:v14];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_2D5D0;
  v10[3] = &unk_5DE10;
  CGRect v12 = v18;
  unint64_t v13 = a3;
  id v6 = v5;
  id v11 = v6;
  [(UIBezierPath *)self enumerateElementsUsingBlock:v10];
  id v7 = v11;
  id v8 = v6;

  _Block_object_dispose(v18, 8);

  return v8;
}

- (id)equivalentPathStartingWithFirstElementMatchingCondition:(id)a3
{
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  unint64_t v9 = sub_2D7D8;
  id v10 = &unk_5DE38;
  id v4 = a3;
  id v11 = v4;
  CGRect v12 = &v13;
  [(UIBezierPath *)self enumerateElementsUsingBlock:&v7];
  if (v14[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = -[UIBezierPath equivalentPathStartingWithElementAtIndex:](self, "equivalentPathStartingWithElementAtIndex:", v7, v8, v9, v10);
  }

  _Block_object_dispose(&v13, 8);

  return v5;
}

- (id)bezierPathConstrainedToFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(UIBezierPath *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v77.origin.CGFloat x = x;
  v77.origin.CGFloat y = y;
  v77.size.CGFloat width = width;
  v77.size.CGFloat height = height;
  v87.origin.CGFloat x = v9;
  v87.origin.CGFloat y = v11;
  v87.size.CGFloat width = v13;
  v87.size.CGFloat height = v15;
  if (CGRectContainsRect(v77, v87))
  {
    uint64_t v16 = self;
LABEL_3:
    unint64_t v17 = v16;
    goto LABEL_16;
  }
  v78.origin.CGFloat x = x;
  v78.origin.CGFloat y = y;
  v78.size.CGFloat width = width;
  v78.size.CGFloat height = height;
  v88.origin.CGFloat x = v9;
  v88.origin.CGFloat y = v11;
  v88.size.CGFloat width = v13;
  v88.size.CGFloat height = v15;
  if (!CGRectIntersectsRect(v78, v88))
  {
    unint64_t v17 = 0;
    goto LABEL_16;
  }
  if ([(UIBezierPath *)self _gaxIsSimpleRectangle])
  {
    v79.origin.CGFloat x = v9;
    v79.origin.CGFloat y = v11;
    v79.size.CGFloat width = v13;
    v79.size.CGFloat height = v15;
    v89.origin.CGFloat x = x;
    v89.origin.CGFloat y = y;
    v89.size.CGFloat width = width;
    v89.size.CGFloat height = height;
    CGRect v80 = CGRectIntersection(v79, v89);
    +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v80.origin.x, v80.origin.y, v80.size.width, v80.size.height);
    uint64_t v16 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  v81.origin.CGFloat x = x;
  v81.origin.CGFloat y = y;
  v81.size.CGFloat width = width;
  v81.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v81);
  v82.origin.CGFloat x = x;
  v82.origin.CGFloat y = y;
  v82.size.CGFloat width = width;
  v82.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v82);
  v83.origin.CGFloat x = x;
  v83.origin.CGFloat y = y;
  v83.size.CGFloat width = width;
  v83.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v83);
  v84.origin.CGFloat x = x;
  v84.origin.CGFloat y = y;
  v84.size.CGFloat width = width;
  v84.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v84);
  v85.origin.CGFloat x = x;
  v85.origin.CGFloat y = y;
  v85.size.CGFloat width = width;
  v85.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v85);
  v86.origin.CGFloat x = x;
  v86.origin.CGFloat y = y;
  v86.size.CGFloat width = width;
  v86.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v86);
  CGFloat v39 = height;
  CGFloat v37 = MinY;
  GAX_CGPointGetAngleFormedBySegmentToPoint(MidX, MidY, MinX);
  uint64_t v38 = v22;
  GAX_CGPointGetAngleFormedBySegmentToPoint(MidX, MidY, MaxX);
  uint64_t v24 = v23;
  GAX_CGPointGetAngleFormedBySegmentToPoint(MidX, MidY, MaxX);
  uint64_t v26 = v25;
  GAX_CGPointGetAngleFormedBySegmentToPoint(MidX, MidY, MinX);
  v75[0] = 1;
  v75[1] = v38;
  v75[2] = v24;
  v75[3] = 2;
  v75[4] = v24;
  v75[5] = v26;
  v75[6] = 3;
  v75[7] = v26;
  v75[8] = v27;
  v75[9] = 4;
  v75[10] = v27;
  v75[11] = 0x400921FB54442D18;
  v75[12] = 4;
  v75[13] = 0xC00921FB54442D18;
  v75[14] = v38;
  v74[0] = 1;
  *(double *)&v74[1] = MinX;
  *(CGFloat *)&v74[2] = v37;
  *(double *)&v74[3] = MaxX;
  *(CGFloat *)&v74[4] = v37;
  v74[5] = 2;
  *(double *)&v74[6] = MaxX;
  *(CGFloat *)&v74[7] = v37;
  *(double *)&v74[8] = MaxX;
  *(CGFloat *)&v74[9] = MaxY;
  v74[10] = 3;
  *(double *)&v74[11] = MaxX;
  *(CGFloat *)&v74[12] = MaxY;
  *(double *)&v74[13] = MinX;
  *(CGFloat *)&v74[14] = MaxY;
  v74[15] = 4;
  *(double *)&v74[16] = MinX;
  *(CGFloat *)&v74[17] = MaxY;
  *(double *)&v74[18] = MinX;
  *(CGFloat *)&v74[19] = v37;
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_2DF4C;
  v73[3] = &unk_5DE58;
  v73[4] = 4;
  v73[5] = v74;
  CGRect v28 = objc_retainBlock(v73);
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_2E064;
  v72[3] = &unk_5DE78;
  *(double *)&v72[4] = MidX;
  *(double *)&v72[5] = MidY;
  v72[6] = 5;
  v72[7] = v75;
  CGRect v29 = objc_retainBlock(v72);
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_2E0DC;
  v71[3] = &unk_5DE98;
  v71[4] = 4;
  v71[5] = v74;
  v30 = objc_retainBlock(v71);
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_2E17C;
  v70[3] = &unk_5DEB8;
  *(CGFloat *)&v70[4] = x;
  *(CGFloat *)&v70[5] = y;
  *(CGFloat *)&v70[6] = width;
  *(CGFloat *)&v70[7] = v39;
  v31 = [(UIBezierPath *)self equivalentPathStartingWithFirstElementMatchingCondition:v70];
  uint64_t v32 = AXCArrayCreate();
  v33 = (const void *)v32;
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x2020000000;
  v69[3] = 0;
  if (v31 && v32)
  {
    v34 = objc_opt_new();
    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x3010000000;
    v67[3] = &unk_583BD;
    CGPoint v68 = CGPointZero;
    v65[0] = 0;
    v65[1] = v65;
    v65[2] = 0x3010000000;
    v65[3] = &unk_583BD;
    CGPoint v66 = v68;
    v63[0] = 0;
    v63[1] = v63;
    v63[2] = 0x2020000000;
    char v64 = 0;
    v62[0] = 0;
    v62[1] = v62;
    v62[2] = 0x2020000000;
    v62[3] = 1;
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2020000000;
    char v61 = 0;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_2E19C;
    v42[3] = &unk_5DEE0;
    v47 = v67;
    v48 = v65;
    v35 = v34;
    CGFloat v53 = x;
    CGFloat v54 = y;
    CGFloat v55 = width;
    CGFloat v56 = v39;
    v43 = v35;
    v49 = v63;
    v50 = &v58;
    v44 = v28;
    v45 = v29;
    v51 = v62;
    v52 = v69;
    v57 = v33;
    v46 = v30;
    [v31 enumerateElementsUsingBlock:v42];
    if (!*((unsigned char *)v59 + 24)) {
      [(UIBezierPath *)v35 closePath];
    }

    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(v62, 8);
    _Block_object_dispose(v63, 8);
    _Block_object_dispose(v65, 8);
    _Block_object_dispose(v67, 8);
    goto LABEL_14;
  }
  v35 = 0;
  unint64_t v17 = 0;
  if (v32)
  {
LABEL_14:
    CFRelease(v33);
    unint64_t v17 = v35;
  }
  _Block_object_dispose(v69, 8);

LABEL_16:

  return v17;
}

- (void)enumerateLinePointsContextsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(UIBezierPath *)self _gaxPathContext];
  if ([v5 linePointsContexts])
  {
    uint64_t Count = AXCArrayGetCount();
    if (Count)
    {
      unint64_t v7 = Count;
      uint64_t v8 = Count - 1;
      if (Count - 1 >= (unint64_t)AXCArrayGetCount())
      {
        AXCArrayGetCount();
        _AXAssert();
      }
      if (*(double *)(_AXCArrayGetUnderlyingArray() + 48 * v8 + 16) > 0.0)
      {
        uint64_t v9 = 0;
        unint64_t v10 = 0;
        char v17 = 0;
        do
        {
          if (v10 >= AXCArrayGetCount())
          {
            AXCArrayGetCount();
            _AXAssert();
          }
          UnderlyingArraCGFloat y = _AXCArrayGetUnderlyingArray();
          long long v12 = *(_OWORD *)(UnderlyingArray + v9 + 32);
          long long v15 = *(_OWORD *)(UnderlyingArray + v9 + 16);
          long long v16 = v12;
          CGFloat v13 = (void (*)(void *, _OWORD *, unint64_t, char *))v4[2];
          v14[0] = *(_OWORD *)(UnderlyingArray + v9);
          v14[1] = v15;
          v14[2] = v12;
          v14[3] = v14[0];
          v13(v4, v14, v10++, &v17);
          if (v10 >= v7) {
            break;
          }
          v9 += 48;
        }
        while (!v17);
      }
    }
  }
}

- (void)enumerateLineSegmentContextsUsingBlock:(id)a3
{
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x5010000000;
  v9[3] = &unk_583BD;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2E914;
  v5[3] = &unk_5DF08;
  unint64_t v7 = v9;
  id v4 = a3;
  id v6 = v4;
  uint64_t v8 = v13;
  [(UIBezierPath *)self enumerateLinePointsContextsUsingBlock:v5];

  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v13, 8);
}

- (void)appendElementOfType:(int)a3 withSinglePoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if (a3 != 1)
  {
    if (a3) {
      return;
    }
    goto LABEL_5;
  }
  if ([(UIBezierPath *)self isEmpty])
  {
LABEL_5:
    -[UIBezierPath moveToPoint:](self, "moveToPoint:", x, y);
    return;
  }

  -[UIBezierPath addLineToPoint:](self, "addLineToPoint:", x, y);
}

- (void)copyBezierPathPointsExcludingControlPoints
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  uint64_t v9 = AXCArrayCreate();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2EB88;
  v5[3] = &unk_5DD00;
  void v5[4] = &v6;
  [(UIBezierPath *)self enumerateElementsUsingBlock:v5];
  uint64_t v3 = (void *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)description
{
  uint64_t v3 = [(UIBezierPath *)self copyBezierPathPointsExcludingControlPoints];
  AXCArraySort();
  v14.receiver = self;
  v14.super_class = (Class)UIBezierPath;
  id v4 = [(UIBezierPath *)&v14 description];
  id v5 = +[NSMutableString stringWithString:v4];

  uint64_t Count = AXCArrayGetCount();
  if (Count)
  {
    uint64_t v7 = Count;
    uint64_t v8 = 0;
    for (unint64_t i = 0; i != v7; ++i)
    {
      if (i >= AXCArrayGetCount())
      {
        AXCArrayGetCount();
        unint64_t v13 = i;
        _AXAssert();
      }
      UnderlyingArradouble y = _AXCArrayGetUnderlyingArray();
      if (i) {
        CFStringRef v11 = @", (%.1f, %.1f)";
      }
      else {
        CFStringRef v11 = @" Point(s): (%.1f, %.1f)";
      }
      objc_msgSend(v5, "appendFormat:", v11, *(void *)(UnderlyingArray + v8), *(void *)(UnderlyingArray + v8 + 8), v13);
      v8 += 16;
    }
  }
  CFRelease(v3);

  return v5;
}

- (BOOL)isEqualPoints:(id)a3
{
  id v4 = a3;
  id v5 = [(UIBezierPath *)self copyBezierPathPointsExcludingControlPoints];
  id v6 = [v4 copyBezierPathPointsExcludingControlPoints];
  uint64_t Count = AXCArrayGetCount();
  uint64_t v8 = AXCArrayGetCount();
  BOOL v9 = Count == v8;
  if (Count == v8 && (AXCArraySort(), AXCArraySort(), Count))
  {
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      if (v11 >= AXCArrayGetCount())
      {
        AXCArrayGetCount();
        _AXAssert();
      }
      UnderlyingArradouble y = _AXCArrayGetUnderlyingArray();
      double v14 = *(double *)(UnderlyingArray + v10);
      double v13 = *(double *)(UnderlyingArray + v10 + 8);
      if (v11 >= AXCArrayGetCount())
      {
        AXCArrayGetCount();
        _AXAssert();
      }
      uint64_t v15 = _AXCArrayGetUnderlyingArray();
      if (v14 != *(double *)(v15 + v10) || v13 != *(double *)(v15 + v10 + 8)) {
        break;
      }
      ++v11;
      v10 += 16;
      if (Count == v11) {
        goto LABEL_11;
      }
    }
    BOOL v9 = 0;
  }
  else
  {
LABEL_11:
    CFRelease(v5);
    CFRelease(v6);
  }

  return v9;
}

- (BOOL)_gaxIsSimpleRectangle
{
  unint64_t v2 = objc_getAssociatedObject(self, &unk_45970);
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)_gaxSetSimpleRectangle:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, &unk_45970, v4, (char *)&dword_0 + 1);
}

- (id)_gaxPathContext
{
  objc_getAssociatedObject(self, &unk_45971);
  unsigned __int8 v3 = (GAXPathContext *)objc_claimAutoreleasedReturnValue();
  id v4 = [(GAXPathContext *)v3 lastSeenCGPath];
  id v5 = self;
  id v6 = [(UIBezierPath *)v5 CGPath];
  if (v4 == v6)
  {
    uint64_t v7 = v3;
  }
  else
  {
    uint64_t v7 = [[GAXPathContext alloc] initWithLastSeenCGPath:v6];

    if (v7)
    {
      [(UIBezierPath *)v5 boundsCenter];
      uint64_t v9 = v8;
      uint64_t v11 = v10;
      id v12 = [(GAXPathContext *)v7 linePointsContexts];
      id v13 = [(GAXPathContext *)v7 linePointsIndicesPerElementIndices];
      v27[0] = 0;
      v27[1] = v27;
      v27[2] = 0x2020000000;
      v27[3] = 0;
      v25[0] = 0;
      v25[1] = v25;
      v25[2] = 0x3010000000;
      v25[3] = &unk_583BD;
      CGPoint v26 = CGPointZero;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_2F2DC;
      v24[3] = &unk_5DF90;
      v24[4] = v27;
      v24[5] = v25;
      v24[6] = v9;
      v24[7] = v11;
      v24[8] = v12;
      v24[9] = v13;
      v22[0] = 0;
      v22[1] = v22;
      v22[2] = 0x3010000000;
      v22[3] = &unk_583BD;
      CGPoint v23 = v26;
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x2020000000;
      char v21 = 0;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_2F3F4;
      v16[3] = &unk_5DFB8;
      double v14 = objc_retainBlock(v24);
      id v17 = v14;
      double v18 = v22;
      char v19 = v20;
      [(UIBezierPath *)v5 enumerateElementsUsingBlock:v16];
      objc_setAssociatedObject(v5, &unk_45971, v7, (char *)&dword_0 + 1);

      _Block_object_dispose(v20, 8);
      _Block_object_dispose(v22, 8);

      _Block_object_dispose(v25, 8);
      _Block_object_dispose(v27, 8);
    }
  }

  return v7;
}

- (CGPoint)_pointOnPathAtIntersectionOfCenterAndPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIBezierPath *)self boundsCenter];
  double v7 = v6;
  double v9 = v8;
  GAX_CGPointGetAngleFormedBySegmentToPoint(v6, v8, x);
  double v11 = v10;
  uint64_t v29 = 0;
  v30 = (double *)&v29;
  uint64_t v31 = 0x9810000000;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v32 = &unk_583BD;
  uint64_t v40 = 0;
  uint64_t v25 = 0;
  CGPoint v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = (double *)&v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v17 = 0;
  double v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_2F738;
  v16[3] = &unk_5DFE0;
  *(double *)&v16[8] = x;
  *(double *)&v16[9] = y;
  *(double *)&v16[10] = v10;
  *(double *)&v16[11] = v7;
  *(double *)&v16[12] = v9;
  void v16[4] = &v29;
  v16[5] = &v21;
  v16[6] = &v17;
  v16[7] = &v25;
  [(UIBezierPath *)self enumerateLineSegmentContextsUsingBlock:v16];
  if (*((unsigned char *)v26 + 24))
  {
    double v12 = v22[3];
    double v13 = v18[3] - v12;
    double x = v30[4] - (v30[10] - v30[4]) / v13 * v12 + (v30[10] - v30[4]) / v13 * v11;
    double y = v30[5] - (v30[11] - v30[5]) / v13 * v12 + (v30[11] - v30[5]) / v13 * v11;
  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  double v14 = x;
  double v15 = y;
  result.double y = v15;
  result.double x = v14;
  return result;
}

@end