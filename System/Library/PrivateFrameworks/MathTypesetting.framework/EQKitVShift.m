@interface EQKitVShift
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)canContainBoxes;
- (BOOL)isEqual:(id)a3;
- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4;
- (CGRect)erasableBounds;
- (EQKitBox)box;
- (EQKitVShift)initWithBox:(id)a3 offset:(double)a4;
- (double)depth;
- (double)height;
- (double)offset;
- (double)width;
- (id)containedBoxes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)hitTest:(CGPoint)a3;
- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4;
@end

@implementation EQKitVShift

- (EQKitVShift)initWithBox:(id)a3 offset:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EQKitVShift;
  v8 = [(EQKitVShift *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_box, a3);
    v9->_offset = a4;
  }

  return v9;
}

- (BOOL)canContainBoxes
{
  return 1;
}

- (id)containedBoxes
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [(EQKitVShift *)self box];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (double)width
{
  [(EQKitBox *)self->_box width];
  return result;
}

- (double)height
{
  [(EQKitBox *)self->_box height];
  return v3 + self->_offset;
}

- (double)depth
{
  [(EQKitBox *)self->_box depth];
  return v3 - self->_offset;
}

- (CGRect)erasableBounds
{
  [(EQKitBox *)self->_box erasableBounds];
  double v7 = -self->_offset;

  return CGRectOffset(*(CGRect *)&v3, 0.0, v7);
}

- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EQKitVShift;
  -[EQKitBox renderIntoContext:offset:](&v8, sel_renderIntoContext_offset_, v7, x, y);
  -[EQKitBox renderIntoContext:offset:](self->_box, "renderIntoContext:offset:", v7, x, y - self->_offset);
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  return -[EQKitBox appendOpticalAlignToSpec:offset:](self->_box, "appendOpticalAlignToSpec:offset:", a3, a4.x, a4.y - self->_offset);
}

- (id)hitTest:(CGPoint)a3
{
  return -[EQKitBox hitTest:](self->_box, "hitTest:", a3.x, a3.y - self->_offset);
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  v6 = (EQKitVShift *)a4;
  if (v6 != self)
  {
    if (![(EQKitBox *)self->_box p_getTransform:a3 fromDescendant:v6])
    {
      BOOL v9 = 0;
      goto LABEL_6;
    }
    long long v7 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v11.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v11.c = v7;
    *(_OWORD *)&v11.tdouble x = *(_OWORD *)&a3->tx;
    CGAffineTransformTranslate(&v12, &v11, 0.0, -self->_offset);
    long long v8 = *(_OWORD *)&v12.c;
    *(_OWORD *)&a3->a = *(_OWORD *)&v12.a;
    *(_OWORD *)&a3->c = v8;
    *(_OWORD *)&a3->tdouble x = *(_OWORD *)&v12.tx;
  }
  BOOL v9 = 1;
LABEL_6:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(EQKitVShift *)self box];
  [(EQKitVShift *)self offset];
  v6 = objc_msgSend(v4, "initWithBox:offset:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EQKitVShift *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(EQKitVShift *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    [(EQKitVShift *)self offset];
    double v7 = v6;
    [(EQKitVShift *)v5 offset];
    if (v7 == v8)
    {
      BOOL v9 = [(EQKitVShift *)self box];
      v10 = [(EQKitVShift *)v5 box];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitVShift *)self height];
  uint64_t v6 = v5;
  [(EQKitVShift *)self depth];
  uint64_t v8 = v7;
  [(EQKitVShift *)self width];
  uint64_t v10 = v9;
  [(EQKitVShift *)self offset];
  uint64_t v12 = v11;
  v13 = [(EQKitVShift *)self box];
  v14 = [v3 stringWithFormat:@"<%@ %p>: height=%f depth=%f width=%f offset=%f box=%@ ", v4, self, v6, v8, v10, v12, v13];

  return v14;
}

- (EQKitBox)box
{
  return self->_box;
}

- (double)offset
{
  return self->_offset;
}

- (void).cxx_destruct
{
}

@end