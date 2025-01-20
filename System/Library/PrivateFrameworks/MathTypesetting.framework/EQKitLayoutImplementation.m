@interface EQKitLayoutImplementation
- (BOOL)layoutWithContext:(id)a3;
- (CGRect)erasableBounds;
- (CGSize)naturalSize;
- (EQKitBox)box;
- (EQKitLayoutImplementation)initWithRoot:(id)a3 environment:(id)a4;
- (EQKitRootNode)root;
- (NSString)description;
- (double)depth;
- (double)height;
- (double)naturalAlignmentOffset;
- (double)scale;
- (double)vsize;
- (double)width;
- (id)rootInspectable;
- (id)selectionForPoint:(CGPoint)a3;
- (void)dealloc;
- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4;
@end

@implementation EQKitLayoutImplementation

- (EQKitLayoutImplementation)initWithRoot:(id)a3 environment:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)EQKitLayoutImplementation;
  v6 = [(EQKitLayoutImplementation *)&v8 init];
  if (v6)
  {
    v6->mRoot = (EQKitRootNode *)a3;
    v6->mEnvironment = (EQKitEnvironment *)a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitLayoutImplementation;
  [(EQKitLayoutImplementation *)&v3 dealloc];
}

- (BOOL)layoutWithContext:(id)a3
{
  self->mBox = 0;
  self->mScale = 1.0;
  if (a3)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return self->mBox != 0;
    }
    uint64_t v5 = [(EQKitRootNode *)self->mRoot attributeCollection];
    if (!v5) {
      return self->mBox != 0;
    }
    [(EQKitEnvironment *)self->mEnvironment beginLayout];
    EQKitLayoutManager::EQKitLayoutManager(v31, a3, self->mEnvironment, v5);
    mBox = EQKitLayoutManager::layoutExpression((EQKitLayoutManager *)v31, self->mRoot, &self->mAscent, &self->mDescent, &self->mLeading, &self->mNaturalAlignmentOffset, &self->mSingleLineHeight);
    self->mBox = mBox;
    if (self->mSingleLineHeight)
    {
      double v7 = self->mAscent + self->mDescent;
    }
    else
    {
      [(EQKitBox *)mBox height];
      double v9 = v8;
      double mLeading = self->mLeading;
      double mAscent = self->mAscent;
      [(EQKitBox *)self->mBox depth];
      double v13 = v9 + mLeading * 0.5;
      if (v13 < mAscent) {
        double v13 = mAscent;
      }
      double mDescent = v12 + self->mLeading * 0.5;
      if (mDescent < self->mDescent) {
        double mDescent = self->mDescent;
      }
      double v7 = v13 + mDescent;
      mBox = self->mBox;
    }
    [(EQKitBox *)mBox width];
    if (v15 > 0.0 && v7 > 0.0)
    {
      [a3 targetSize];
      double v18 = v17;
      if (v17 <= 0.0 || (double v19 = v16, v16 <= 0.0))
      {
        [a3 containerSize];
        double v26 = v25;
        if (v25 <= 0.0) {
          goto LABEL_20;
        }
        double v27 = v24;
        if (v24 <= 0.0) {
          goto LABEL_20;
        }
        [(EQKitBox *)self->mBox width];
        *(float *)&double v28 = v26 / v28;
        float v21 = fminf(*(float *)&v28, 1.0);
        double v23 = v27 / v7;
      }
      else
      {
        [(EQKitBox *)self->mBox erasableBounds];
        float v21 = v18 / v20;
        double v23 = v19 / v22;
      }
      float v29 = v23;
      self->mScale = fminf(v21, v29);
    }
LABEL_20:
    [(EQKitEnvironment *)self->mEnvironment endLayout];
    EQKitLayoutManager::~EQKitLayoutManager((EQKitLayoutManager *)v31);
    return self->mBox != 0;
  }
  return 0;
}

- (double)scale
{
  return self->mScale;
}

- (double)height
{
  if (self->mSingleLineHeight)
  {
    p_double mAscent = &self->mAscent;
    double mScale = self->mScale;
  }
  else
  {
    [(EQKitBox *)self->mBox height];
    double mScale = v5 + self->mLeading * 0.5;
    if (mScale < self->mAscent) {
      double mScale = self->mAscent;
    }
    p_double mAscent = &self->mScale;
  }
  return *p_mAscent * mScale;
}

- (double)depth
{
  if (self->mSingleLineHeight)
  {
    p_double mDescent = &self->mDescent;
    double mScale = self->mScale;
  }
  else
  {
    [(EQKitBox *)self->mBox depth];
    double mScale = v5 + self->mLeading * 0.5;
    if (mScale < self->mDescent) {
      double mScale = self->mDescent;
    }
    p_double mDescent = &self->mScale;
  }
  return *p_mDescent * mScale;
}

- (double)width
{
  [(EQKitBox *)self->mBox width];
  return v3 * self->mScale;
}

- (double)vsize
{
  [(EQKitLayoutImplementation *)self height];
  double v4 = v3;
  [(EQKitLayoutImplementation *)self depth];
  return v4 + v5;
}

- (double)naturalAlignmentOffset
{
  return self->mNaturalAlignmentOffset * self->mScale;
}

- (CGRect)erasableBounds
{
  mBox = self->mBox;
  if (mBox)
  {
    [(EQKitBox *)mBox erasableBounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGAffineTransformMakeScale(&v12, self->mScale, self->mScale);
    v13.origin.x = v5;
    v13.origin.y = v7;
    v13.size.width = v9;
    v13.size.height = v11;
    return CGRectApplyAffineTransform(v13, &v12);
  }
  else
  {
    return *(CGRect *)*(void *)&MEMORY[0x263F001A8];
  }
}

- (id)selectionForPoint:(CGPoint)a3
{
  id result = -[EQKitBox hitTest:](self->mBox, "hitTest:", a3.x, a3.y);
  if (result)
  {
    id v4 = result;
    CGFloat v5 = [EQKitSelection alloc];
    return [(EQKitSelection *)v5 initWithBox:v4];
  }
  return result;
}

- (CGSize)naturalSize
{
  [(EQKitLayoutImplementation *)self erasableBounds];
  double v4 = v3;
  double v6 = v5;
  [(EQKitLayoutImplementation *)self width];
  if (v7 >= v4) {
    double v8 = v7;
  }
  else {
    double v8 = v4;
  }
  [(EQKitLayoutImplementation *)self height];
  double v10 = v9;
  [(EQKitLayoutImplementation *)self depth];
  double v12 = v10 + v11;
  if (v12 >= v6) {
    double v13 = v12;
  }
  else {
    double v13 = v6;
  }
  double v14 = v8 + 2.0;
  double v15 = v13 + 2.0;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = (CGContext *)[a3 cgContext];
  CGContextSaveGState(v6);
  CGContextScaleCTM(v6, self->mScale, self->mScale);
  CGAffineTransformMakeScale(&v9, 1.0 / self->mScale, 1.0 / self->mScale);
  [(EQKitBox *)self->mBox renderIntoContext:a3 offset:vaddq_f64(*(float64x2_t *)&v9.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v9.c, y), *(float64x2_t *)&v9.a, x))];
  CGContextRestoreGState(v6);
}

- (id)rootInspectable
{
  double v3 = [_EQKitInspectableBox alloc];
  mBodouble x = self->mBox;

  return [(_EQKitInspectableBox *)v3 initWithBox:mBox];
}

- (NSString)description
{
  double v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@ %p box=%@>", NSStringFromClass(v4), self, self->mBox];
}

- (EQKitRootNode)root
{
  return self->mRoot;
}

- (EQKitBox)box
{
  return self->mBox;
}

@end