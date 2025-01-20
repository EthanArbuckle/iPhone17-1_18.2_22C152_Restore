@interface EQKitPaddedBox
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)canContainBoxes;
- (BOOL)isEqual:(id)a3;
- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4;
- (CGRect)erasableBounds;
- (EQKitBox)box;
- (EQKitPaddedBox)initWithBox:(id)a3 height:(double)a4 width:(double)a5 depth:(double)a6 lspace:(double)a7 voffset:(double)a8;
- (double)depth;
- (double)height;
- (double)lspace;
- (double)opticalAlignWidth;
- (double)voffset;
- (double)width;
- (id)containedBoxes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)hitTest:(CGPoint)a3;
- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4;
@end

@implementation EQKitPaddedBox

- (EQKitPaddedBox)initWithBox:(id)a3 height:(double)a4 width:(double)a5 depth:(double)a6 lspace:(double)a7 voffset:(double)a8
{
  id v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)EQKitPaddedBox;
  v16 = [(EQKitPaddedBox *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_box, a3);
    v17->_height = a4;
    v17->_width = a5;
    v17->_depth = a6;
    v17->_lspace = a7;
    v17->_voffset = a8;
  }

  return v17;
}

- (BOOL)canContainBoxes
{
  return 1;
}

- (id)containedBoxes
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [(EQKitPaddedBox *)self box];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (double)width
{
  return self->_width + self->_lspace;
}

- (double)opticalAlignWidth
{
  [(EQKitBox *)self->_box opticalAlignWidth];
  return result;
}

- (double)height
{
  return self->_height + self->_voffset;
}

- (double)depth
{
  return self->_depth - self->_voffset;
}

- (CGRect)erasableBounds
{
  [(EQKitBox *)self->_box erasableBounds];
  double lspace = self->_lspace;
  double v8 = -self->_voffset;

  return CGRectOffset(*(CGRect *)&v3, lspace, v8);
}

- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EQKitPaddedBox;
  -[EQKitBox renderIntoContext:offset:](&v8, sel_renderIntoContext_offset_, v7, x, y);
  -[EQKitBox renderIntoContext:offset:](self->_box, "renderIntoContext:offset:", v7, x + self->_lspace, y - self->_voffset);
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  switch(*((_DWORD *)a3 + 6))
  {
    case 0:
    case 2:
      a4.double y = a4.y - self->_voffset;
      break;
    case 1:
    case 3:
      a4.double x = a4.x + self->_lspace;
      break;
    default:
      return [(EQKitBox *)self->_box appendOpticalAlignToSpec:a4.x offset:a4.y];
  }
  return [(EQKitBox *)self->_box appendOpticalAlignToSpec:a4.x offset:a4.y];
}

- (id)hitTest:(CGPoint)a3
{
  return -[EQKitBox hitTest:](self->_box, "hitTest:", a3.x - self->_lspace, a3.y + self->_voffset);
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  v6 = (EQKitPaddedBox *)a4;
  if (v6 != self)
  {
    if (![(EQKitBox *)self->_box p_getTransform:a3 fromDescendant:v6])
    {
      BOOL v10 = 0;
      goto LABEL_6;
    }
    long long v7 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v12.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v12.c = v7;
    double lspace = self->_lspace;
    *(_OWORD *)&v12.tdouble x = *(_OWORD *)&a3->tx;
    CGAffineTransformTranslate(&v13, &v12, lspace, -self->_voffset);
    long long v9 = *(_OWORD *)&v13.c;
    *(_OWORD *)&a3->a = *(_OWORD *)&v13.a;
    *(_OWORD *)&a3->c = v9;
    *(_OWORD *)&a3->tdouble x = *(_OWORD *)&v13.tx;
  }
  BOOL v10 = 1;
LABEL_6:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(EQKitPaddedBox *)self box];
  [(EQKitPaddedBox *)self height];
  double v7 = v6;
  [(EQKitPaddedBox *)self width];
  double v9 = v8;
  [(EQKitPaddedBox *)self depth];
  double v11 = v10;
  [(EQKitPaddedBox *)self lspace];
  double v13 = v12;
  [(EQKitPaddedBox *)self voffset];
  id v15 = (void *)[v4 initWithBox:v5 height:v7 width:v9 depth:v11 lspace:v13 voffset:v14];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EQKitPaddedBox *)a3;
  if (self == v4)
  {
    char v23 = 1;
  }
  else if ([(EQKitPaddedBox *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    [(EQKitPaddedBox *)self height];
    double v7 = v6;
    [(EQKitPaddedBox *)v5 height];
    if (v7 != v8) {
      goto LABEL_11;
    }
    [(EQKitPaddedBox *)self width];
    double v10 = v9;
    [(EQKitPaddedBox *)v5 width];
    if (v10 != v11) {
      goto LABEL_11;
    }
    [(EQKitPaddedBox *)self depth];
    double v13 = v12;
    [(EQKitPaddedBox *)v5 depth];
    if (v13 != v14) {
      goto LABEL_11;
    }
    [(EQKitPaddedBox *)self lspace];
    double v16 = v15;
    [(EQKitPaddedBox *)v5 lspace];
    if (v16 == v17
      && ([(EQKitPaddedBox *)self voffset], double v19 = v18, [(EQKitPaddedBox *)v5 voffset], v19 == v20))
    {
      v21 = [(EQKitPaddedBox *)self box];
      v22 = [(EQKitPaddedBox *)v5 box];
      char v23 = [v21 isEqual:v22];
    }
    else
    {
LABEL_11:
      char v23 = 0;
    }
  }
  else
  {
    char v23 = 0;
  }

  return v23;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitPaddedBox *)self height];
  uint64_t v6 = v5;
  [(EQKitPaddedBox *)self depth];
  uint64_t v8 = v7;
  [(EQKitPaddedBox *)self width];
  uint64_t v10 = v9;
  [(EQKitPaddedBox *)self lspace];
  uint64_t v12 = v11;
  [(EQKitPaddedBox *)self voffset];
  uint64_t v14 = v13;
  double v15 = [(EQKitPaddedBox *)self box];
  double v16 = [v3 stringWithFormat:@"<%@ %p>: height=%f depth=%f width=%f lspace=%f voffset=%f box=%@ ", v4, self, v6, v8, v10, v12, v14, v15];

  return v16;
}

- (EQKitBox)box
{
  return self->_box;
}

- (double)lspace
{
  return self->_lspace;
}

- (double)voffset
{
  return self->_voffset;
}

- (void).cxx_destruct
{
}

@end