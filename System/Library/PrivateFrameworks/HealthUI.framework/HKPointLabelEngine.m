@interface HKPointLabelEngine
- ($0E6BBD292B1800C35F8F1E99FBACE02D)_computeRenderingDataForValue:(SEL)a3 transformedPoint:(double)a4 previousSlope:(CGPoint)a5 nextSlope:(int64_t)a6 previousOptions:(int64_t)a7;
- ($0E6BBD292B1800C35F8F1E99FBACE02D)currentRenderingData;
- ($0E6BBD292B1800C35F8F1E99FBACE02D)previousRenderingData;
- ($0E6BBD292B1800C35F8F1E99FBACE02D)renderingData;
- (BOOL)isLabelShiftingEnabled;
- (BOOL)lastRenderOverlapped;
- (BOOL)processLastPoint;
- (BOOL)processTransformedPoint:(CGPoint)a3 untransformedPoint:(CGPoint)a4;
- (CGPoint)currentTransformedPoint;
- (CGPoint)currentUntransformedPoint;
- (CGPoint)previousTransformedPoint;
- (CGPoint)previousUntransformedPoint;
- (CGRect)boundingRegion;
- (HKPointLabelEngine)initWithBoundingRegion:(CGRect)a3 isLabelShiftingEnabled:(BOOL)a4 labelSizeBlock:(id)a5;
- (id)sizeForValue;
- (int64_t)_slopeForPoint:(CGPoint)a3 otherPoint:(CGPoint)a4;
- (int64_t)state;
- (void)_layoutTransformRectVerticallyForData:(id *)a3 withTransformedPoint:(CGPoint)a4;
- (void)_transformRectIfNeededForData:(id *)a3 withTransformedPoint:(CGPoint)a4;
- (void)setCurrentRenderingData:(id *)a3;
- (void)setCurrentTransformedPoint:(CGPoint)a3;
- (void)setCurrentUntransformedPoint:(CGPoint)a3;
- (void)setIsLabelShiftingEnabled:(BOOL)a3;
- (void)setLastRenderOverlapped:(BOOL)a3;
- (void)setPreviousRenderingData:(id *)a3;
- (void)setPreviousTransformedPoint:(CGPoint)a3;
- (void)setPreviousUntransformedPoint:(CGPoint)a3;
- (void)setState:(int64_t)a3;
@end

@implementation HKPointLabelEngine

- (HKPointLabelEngine)initWithBoundingRegion:(CGRect)a3 isLabelShiftingEnabled:(BOOL)a4 labelSizeBlock:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKPointLabelEngine;
  v12 = [(HKPointLabelEngine *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_boundingRegion.origin.CGFloat x = x;
    v12->_boundingRegion.origin.CGFloat y = y;
    v12->_boundingRegion.size.CGFloat width = width;
    v12->_boundingRegion.size.CGFloat height = height;
    v12->_isLabelShiftingEnabled = a4;
    v14 = _Block_copy(v11);
    id sizeForValue = v13->_sizeForValue;
    v13->_id sizeForValue = v14;

    v13->_currentUntransformedPoint.CGFloat y = 0.0;
    *(_OWORD *)&v13->_currentTransformedPoint.CGFloat y = 0u;
    *(_OWORD *)&v13->_previousUntransformedPoint.CGFloat y = 0u;
    *(_OWORD *)&v13->_previousTransformedPoint.CGFloat y = 0u;
    *(_OWORD *)&v13->_state = 0u;
    CGPoint v17 = (CGPoint)*MEMORY[0x1E4F1DB28];
    CGSize v16 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v13->_previousRenderingData.transformedRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v13->_previousRenderingData.transformedRect.size = v16;
    *(_OWORD *)&v13->_previousRenderingData.labelValue = 0uLL;
    v13->_currentRenderingData.transformedRect.origin = v17;
    v13->_currentRenderingData.transformedRect.size = v16;
    *(_OWORD *)&v13->_currentRenderingData.labelValue = 0uLL;
    v13->_lastRenderOverlapped = 0;
  }

  return v13;
}

- (BOOL)processTransformedPoint:(CGPoint)a3 untransformedPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  int64_t state = self->_state;
  if (state == 2)
  {
    p_currentTransformedPoint = &self->_currentTransformedPoint;
    int64_t v14 = -[HKPointLabelEngine _slopeForPoint:otherPoint:](self, "_slopeForPoint:otherPoint:", self->_currentTransformedPoint.x, self->_currentTransformedPoint.y, self->_previousTransformedPoint.x, self->_previousTransformedPoint.y);
    int64_t v15 = -[HKPointLabelEngine _slopeForPoint:otherPoint:](self, "_slopeForPoint:otherPoint:", p_currentTransformedPoint->x, self->_currentTransformedPoint.y, v7, v6);
    if (!self->_lastRenderOverlapped)
    {
      CGSize size = self->_currentRenderingData.transformedRect.size;
      self->_previousRenderingData.transformedRect.origin = self->_currentRenderingData.transformedRect.origin;
      self->_previousRenderingData.transformedRect.CGSize size = size;
      *(_OWORD *)&self->_previousRenderingData.labelValue = *(_OWORD *)&self->_currentRenderingData.labelValue;
    }
    p_CGFloat y = &self->_currentUntransformedPoint.y;
    -[HKPointLabelEngine _computeRenderingDataForValue:transformedPoint:previousSlope:nextSlope:previousOptions:](self, "_computeRenderingDataForValue:transformedPoint:previousSlope:nextSlope:previousOptions:", v14, v15, self->_previousRenderingData.options, self->_currentUntransformedPoint.y, self->_currentTransformedPoint.x, self->_currentTransformedPoint.y);
    self->_currentRenderingData.transformedRect.origin = v20;
    self->_currentRenderingData.transformedRect.CGSize size = v21;
    *(_OWORD *)&self->_currentRenderingData.labelValue = v22;
    BOOL v17 = CGRectIntersectsRect(self->_currentRenderingData.transformedRect, self->_previousRenderingData.transformedRect);
    self->_lastRenderOverlapped = v17;
    char v10 = !v17;
    self->_previousTransformedPoint = *p_currentTransformedPoint;
    self->_previousUntransformedPoint = self->_currentUntransformedPoint;
    self->_currentTransformedPoint.CGFloat x = v7;
    self->_currentTransformedPoint.CGFloat y = v6;
    self->_currentUntransformedPoint.CGFloat x = x;
    goto LABEL_9;
  }
  if (state == 1)
  {
    char v10 = 1;
    -[HKPointLabelEngine _computeRenderingDataForValue:transformedPoint:previousSlope:nextSlope:previousOptions:](self, "_computeRenderingDataForValue:transformedPoint:previousSlope:nextSlope:previousOptions:", 1, -[HKPointLabelEngine _slopeForPoint:otherPoint:](self, "_slopeForPoint:otherPoint:", self->_previousTransformedPoint.x, self->_previousTransformedPoint.y, a3.x, a3.y), 1, self->_previousUntransformedPoint.y, self->_previousTransformedPoint.x, self->_previousTransformedPoint.y);
    self->_currentRenderingData.transformedRect.CGSize size = v21;
    *(_OWORD *)&self->_currentRenderingData.labelValue = v22;
    CGSize v18 = self->_currentRenderingData.transformedRect.size;
    *(_OWORD *)&self->_previousRenderingData.labelValue = *(_OWORD *)&self->_currentRenderingData.labelValue;
    self->_currentRenderingData.transformedRect.origin = v20;
    self->_previousRenderingData.transformedRect.origin = self->_currentRenderingData.transformedRect.origin;
    self->_previousRenderingData.transformedRect.CGSize size = v18;
    self->_currentTransformedPoint.CGFloat x = v7;
    self->_currentTransformedPoint.CGFloat y = v6;
    self->_currentUntransformedPoint.CGFloat x = x;
    p_CGFloat y = &self->_currentUntransformedPoint.y;
LABEL_9:
    int64_t v12 = 2;
    goto LABEL_10;
  }
  char v10 = 0;
  if (!state)
  {
    self->_previousTransformedPoint = a3;
    p_CGFloat y = &self->_previousUntransformedPoint.y;
    int64_t v12 = 1;
    self->_previousUntransformedPoint.CGFloat x = a4.x;
LABEL_10:
    *p_CGFloat y = y;
    self->_int64_t state = v12;
  }
  return v10;
}

- (BOOL)processLastPoint
{
  int64_t state = self->_state;
  if (state == 2)
  {
    int64_t v5 = -[HKPointLabelEngine _slopeForPoint:otherPoint:](self, "_slopeForPoint:otherPoint:", self->_currentTransformedPoint.x, self->_currentTransformedPoint.y, self->_previousTransformedPoint.x, self->_previousTransformedPoint.y);
    if (!self->_lastRenderOverlapped)
    {
      CGSize size = self->_currentRenderingData.transformedRect.size;
      self->_previousRenderingData.transformedRect.origin = self->_currentRenderingData.transformedRect.origin;
      self->_previousRenderingData.transformedRect.CGSize size = size;
      *(_OWORD *)&self->_previousRenderingData.labelValue = *(_OWORD *)&self->_currentRenderingData.labelValue;
    }
    -[HKPointLabelEngine _computeRenderingDataForValue:transformedPoint:previousSlope:nextSlope:previousOptions:](self, "_computeRenderingDataForValue:transformedPoint:previousSlope:nextSlope:previousOptions:", v5, 1, self->_previousRenderingData.options, self->_currentUntransformedPoint.y, self->_currentTransformedPoint.x, self->_currentTransformedPoint.y);
    self->_currentRenderingData.transformedRect.origin = v9;
    self->_currentRenderingData.transformedRect.CGSize size = v10;
    *(_OWORD *)&self->_currentRenderingData.labelValue = v11;
    BOOL v7 = CGRectIntersectsRect(self->_currentRenderingData.transformedRect, self->_previousRenderingData.transformedRect);
    self->_lastRenderOverlapped = v7;
    return !v7;
  }
  else if (state == 1)
  {
    BOOL v4 = 1;
    -[HKPointLabelEngine _computeRenderingDataForValue:transformedPoint:previousSlope:nextSlope:previousOptions:](self, "_computeRenderingDataForValue:transformedPoint:previousSlope:nextSlope:previousOptions:", 1, 1, 1, self->_previousUntransformedPoint.y, self->_previousTransformedPoint.x, self->_previousTransformedPoint.y);
    self->_currentRenderingData.transformedRect.origin = v9;
    self->_currentRenderingData.transformedRect.CGSize size = v10;
    *(_OWORD *)&self->_currentRenderingData.labelValue = v11;
  }
  else
  {
    return 0;
  }
  return v4;
}

- ($0E6BBD292B1800C35F8F1E99FBACE02D)renderingData
{
  CGPoint origin = self[4].var0.origin;
  retstr->var0.CGPoint origin = *(CGPoint *)&self[3].var1;
  retstr->var0.CGSize size = (CGSize)origin;
  *(CGSize *)&retstr->var1 = self[4].var0.size;
  return self;
}

- (int64_t)_slopeForPoint:(CGPoint)a3 otherPoint:(CGPoint)a4
{
  double v4 = vabdd_f64(a3.x, a4.x);
  if (a3.x != 0.0 && a4.x != 0.0)
  {
    double v5 = fabs(a3.x);
    double v6 = fabs(a4.x);
    if (v5 >= v6) {
      double v5 = v6;
    }
    if (v4 > v5 / 1.0e10) {
      goto LABEL_10;
    }
    return 2 * (a3.y > a4.y);
  }
  if (a3.x == 0.0 && a4.x == 0.0) {
    return 2 * (a3.y > a4.y);
  }
LABEL_10:
  double v8 = (a3.y - a4.y) / v4;
  int64_t v9 = 2;
  if (v8 >= -0.05) {
    int64_t v9 = 1;
  }
  if (v8 <= 0.05) {
    return v9;
  }
  else {
    return 0;
  }
}

- ($0E6BBD292B1800C35F8F1E99FBACE02D)_computeRenderingDataForValue:(SEL)a3 transformedPoint:(double)a4 previousSlope:(CGPoint)a5 nextSlope:(int64_t)a6 previousOptions:(int64_t)a7
{
  double y = a5.y;
  double x = a5.x;
  CGSize v12 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  retstr->var0.CGPoint origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  retstr->var0.CGSize size = v12;
  retstr->var2 = 0;
  if (a6 == 2)
  {
    if ((unint64_t)(a7 - 1) >= 2)
    {
      if (a7) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (a6 == 1)
  {
    if (a7 == 1)
    {
LABEL_13:
      retstr->var2 = a8;
      goto LABEL_14;
    }
    if (a7 != 2) {
      goto LABEL_14;
    }
LABEL_10:
    a8 = 1;
    goto LABEL_13;
  }
  if (!a6 && a7 == 2)
  {
LABEL_12:
    a8 |= 2uLL;
    goto LABEL_13;
  }
LABEL_14:
  retstr->var1 = a4;
  retstr->var0.size.CGFloat width = (*((double (**)(void))self->_sizeForValue + 2))();
  retstr->var0.size.CGFloat height = v13;
  result = ($0E6BBD292B1800C35F8F1E99FBACE02D *)-[HKPointLabelEngine _layoutTransformRectVerticallyForData:withTransformedPoint:](self, "_layoutTransformRectVerticallyForData:withTransformedPoint:", retstr, x, y);
  if (self->_isLabelShiftingEnabled)
  {
    [(HKPointLabelEngine *)self boundingRegion];
    v45.origin.double x = v15;
    v45.origin.double y = v16;
    v45.size.CGFloat width = v17;
    v45.size.CGFloat height = v18;
    CGRect v40 = CGRectIntersection(retstr->var0, v45);
    result = ($0E6BBD292B1800C35F8F1E99FBACE02D *)CGRectIsNull(v40);
    if ((result & 1) == 0)
    {
      double v19 = retstr->var0.origin.x;
      [(HKPointLabelEngine *)self boundingRegion];
      if (v19 < v20)
      {
        [(HKPointLabelEngine *)self boundingRegion];
        retstr->var0.origin.double x = v21;
      }
      double v22 = retstr->var0.origin.y;
      [(HKPointLabelEngine *)self boundingRegion];
      if (v22 >= v23)
      {
        CGFloat v24 = retstr->var0.origin.y;
      }
      else
      {
        [(HKPointLabelEngine *)self boundingRegion];
        retstr->var0.origin.double y = v24;
      }
      CGFloat v25 = retstr->var0.origin.x;
      CGFloat width = retstr->var0.size.width;
      CGFloat height = retstr->var0.size.height;
      double MaxX = CGRectGetMaxX(*(CGRect *)(&v24 - 1));
      [(HKPointLabelEngine *)self boundingRegion];
      double v29 = CGRectGetMaxX(v41);
      CGFloat v30 = retstr->var0.origin.x;
      if (MaxX > v29)
      {
        CGFloat v31 = retstr->var0.origin.y;
        CGFloat v32 = retstr->var0.size.width;
        CGFloat v33 = retstr->var0.size.height;
        double v34 = CGRectGetMaxX(*(CGRect *)&v30);
        [(HKPointLabelEngine *)self boundingRegion];
        CGFloat v30 = retstr->var0.origin.x - (v34 - CGRectGetMaxX(v42));
        retstr->var0.origin.double x = v30;
      }
      CGFloat v35 = retstr->var0.origin.y;
      CGFloat v36 = retstr->var0.size.width;
      CGFloat v37 = retstr->var0.size.height;
      double MaxY = CGRectGetMaxY(*(CGRect *)&v30);
      [(HKPointLabelEngine *)self boundingRegion];
      if (MaxY > CGRectGetMaxY(v43))
      {
        double v39 = CGRectGetMaxY(retstr->var0);
        [(HKPointLabelEngine *)self boundingRegion];
        retstr->var0.origin.double y = retstr->var0.origin.y - (v39 - CGRectGetMaxY(v44));
      }
    }
  }
  return result;
}

- (void)_layoutTransformRectVerticallyForData:(id *)a3 withTransformedPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  -[HKPointLabelEngine _transformRectIfNeededForData:withTransformedPoint:](self, "_transformRectIfNeededForData:withTransformedPoint:");
  if (a3->var2)
  {
    double v10 = a3->var0.origin.y;
    [(HKPointLabelEngine *)self boundingRegion];
    if (v10 >= v11) {
      return;
    }
    int64_t v9 = a3->var2 & 0xFFFFFFFFFFFFFFFELL;
  }
  else
  {
    double MaxY = CGRectGetMaxY(a3->var0);
    [(HKPointLabelEngine *)self boundingRegion];
    if (MaxY <= CGRectGetMaxY(v13)) {
      return;
    }
    int64_t v9 = a3->var2 | 1;
  }
  a3->var2 = v9;
  -[HKPointLabelEngine _transformRectIfNeededForData:withTransformedPoint:](self, "_transformRectIfNeededForData:withTransformedPoint:", a3, x, y);
}

- (void)_transformRectIfNeededForData:(id *)a3 withTransformedPoint:(CGPoint)a4
{
  int64_t var2 = a3->var2;
  a3->var0.origin.double x = a4.x + a3->var0.size.width * -0.5;
  if (var2) {
    double v5 = a4.y - *(double *)&HKPointLabelEngineVerticalOffset - a3->var0.size.height;
  }
  else {
    double v5 = a4.y + *(double *)&HKPointLabelEngineVerticalOffset;
  }
  a3->var0.origin.double y = v5;
}

- (CGRect)boundingRegion
{
  double x = self->_boundingRegion.origin.x;
  double y = self->_boundingRegion.origin.y;
  double width = self->_boundingRegion.size.width;
  double height = self->_boundingRegion.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isLabelShiftingEnabled
{
  return self->_isLabelShiftingEnabled;
}

- (void)setIsLabelShiftingEnabled:(BOOL)a3
{
  self->_isLabelShiftingEnabled = a3;
}

- (id)sizeForValue
{
  return self->_sizeForValue;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (CGPoint)previousTransformedPoint
{
  double x = self->_previousTransformedPoint.x;
  double y = self->_previousTransformedPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPreviousTransformedPoint:(CGPoint)a3
{
  self->_previousTransformedPoint = a3;
}

- (CGPoint)previousUntransformedPoint
{
  double x = self->_previousUntransformedPoint.x;
  double y = self->_previousUntransformedPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPreviousUntransformedPoint:(CGPoint)a3
{
  self->_previousUntransformedPoint = a3;
}

- (CGPoint)currentTransformedPoint
{
  double x = self->_currentTransformedPoint.x;
  double y = self->_currentTransformedPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCurrentTransformedPoint:(CGPoint)a3
{
  self->_currentTransformedPoint = a3;
}

- (CGPoint)currentUntransformedPoint
{
  double x = self->_currentUntransformedPoint.x;
  double y = self->_currentUntransformedPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCurrentUntransformedPoint:(CGPoint)a3
{
  self->_currentUntransformedPoint = a3;
}

- ($0E6BBD292B1800C35F8F1E99FBACE02D)previousRenderingData
{
  CGPoint origin = self[3].var0.origin;
  retstr->var0.CGPoint origin = *(CGPoint *)&self[2].var1;
  retstr->var0.CGSize size = (CGSize)origin;
  *(CGSize *)&retstr->var1 = self[3].var0.size;
  return self;
}

- (void)setPreviousRenderingData:(id *)a3
{
  CGPoint origin = a3->var0.origin;
  long long v4 = *(_OWORD *)&a3->var1;
  self->_previousRenderingData.transformedRect.CGSize size = a3->var0.size;
  *(_OWORD *)&self->_previousRenderingData.labelValue = v4;
  self->_previousRenderingData.transformedRect.CGPoint origin = origin;
}

- ($0E6BBD292B1800C35F8F1E99FBACE02D)currentRenderingData
{
  CGPoint origin = self[4].var0.origin;
  retstr->var0.CGPoint origin = *(CGPoint *)&self[3].var1;
  retstr->var0.CGSize size = (CGSize)origin;
  *(CGSize *)&retstr->var1 = self[4].var0.size;
  return self;
}

- (void)setCurrentRenderingData:(id *)a3
{
  CGPoint origin = a3->var0.origin;
  long long v4 = *(_OWORD *)&a3->var1;
  self->_currentRenderingData.transformedRect.CGSize size = a3->var0.size;
  *(_OWORD *)&self->_currentRenderingData.labelValue = v4;
  self->_currentRenderingData.transformedRect.CGPoint origin = origin;
}

- (BOOL)lastRenderOverlapped
{
  return self->_lastRenderOverlapped;
}

- (void)setLastRenderOverlapped:(BOOL)a3
{
  self->_lastRenderOverlapped = a3;
}

- (void).cxx_destruct
{
}

@end