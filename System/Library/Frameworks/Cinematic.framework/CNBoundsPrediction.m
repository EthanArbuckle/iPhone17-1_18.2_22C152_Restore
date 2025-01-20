@interface CNBoundsPrediction
+ (id)_predictionFromInternal:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGRect)normalizedBounds;
- (float)confidence;
- (id)_initWithNormalizedBounds:(CGRect)a3 confidence:(float)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setConfidence:(float)confidence;
- (void)setNormalizedBounds:(CGRect)normalizedBounds;
@end

@implementation CNBoundsPrediction

- (id)_initWithNormalizedBounds:(CGRect)a3 confidence:(float)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)CNBoundsPrediction;
  v9 = [(CNBoundsPrediction *)&v13 init];
  v10 = v9;
  if (v9)
  {
    -[CNBoundsPrediction setNormalizedBounds:](v9, "setNormalizedBounds:", x, y, width, height);
    *(float *)&double v11 = a4;
    [(CNBoundsPrediction *)v10 setConfidence:v11];
  }
  return v10;
}

+ (id)_predictionFromInternal:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_alloc_init((Class)a1);
    [v4 rect];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [v4 confidence];
    int v15 = v14;

    LODWORD(v16) = v15;
    v17 = objc_msgSend(v5, "_initWithNormalizedBounds:confidence:", v7, v9, v11, v13, v16);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(CNBoundsPrediction *)self normalizedBounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(CNBoundsPrediction *)self confidence];
  LODWORD(v14) = v13;
  int v15 = objc_msgSend(v4, "_initWithNormalizedBounds:confidence:", v6, v8, v10, v12, v14);

  return v15;
}

- (unint64_t)hash
{
  [(CNBoundsPrediction *)self normalizedBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(CNBoundsPrediction *)self confidence];
  double v12 = v11;
  v18.origin.double x = v4;
  v18.origin.double y = v6;
  v18.size.double width = v8;
  v18.size.double height = v10;
  CGFloat v13 = CGRectGetMinX(v18) + v12;
  v19.origin.double x = v4;
  v19.origin.double y = v6;
  v19.size.double width = v8;
  v19.size.double height = v10;
  CGFloat v14 = v13 + CGRectGetMinY(v19);
  v20.origin.double x = v4;
  v20.origin.double y = v6;
  v20.size.double width = v8;
  v20.size.double height = v10;
  CGFloat v15 = v14 + CGRectGetWidth(v20);
  v21.origin.double x = v4;
  v21.origin.double y = v6;
  v21.size.double width = v8;
  v21.size.double height = v10;
  float v16 = v15 + CGRectGetHeight(v21);
  return (unint64_t)(v16 * 32767.0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(CNBoundsPrediction *)self normalizedBounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    [v5 normalizedBounds];
    v24.origin.double x = v14;
    v24.origin.double y = v15;
    v24.size.double width = v16;
    v24.size.double height = v17;
    v23.origin.double x = v7;
    v23.origin.double y = v9;
    v23.size.double width = v11;
    v23.size.double height = v13;
    if (CGRectEqualToRect(v23, v24))
    {
      [(CNBoundsPrediction *)self confidence];
      float v19 = v18;
      [v5 confidence];
      BOOL v21 = v19 == v20;
    }
    else
    {
      BOOL v21 = 0;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (CGRect)normalizedBounds
{
  objc_copyStruct(v6, &self->_normalizedBounds, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setNormalizedBounds:(CGRect)normalizedBounds
{
  CGRect v3 = normalizedBounds;
  objc_copyStruct(&self->_normalizedBounds, &v3, 32, 1, 0);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)confidence
{
  self->_confidence = confidence;
}

@end