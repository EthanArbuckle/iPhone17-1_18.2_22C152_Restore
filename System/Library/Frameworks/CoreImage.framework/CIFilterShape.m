@interface CIFilterShape
+ (CIFilterShape)shapeWithRect:(CGRect)r;
+ (id)_shapeInfinite;
- (CGRect)extent;
- (CGSRegionObject)CGSRegion;
- (CIFilterShape)initWithRect:(CGRect)r;
- (CIFilterShape)initWithStruct:(filterShape *)a3;
- (CIFilterShape)insetByX:(int)dx Y:(int)dy;
- (CIFilterShape)intersectWith:(CIFilterShape *)s2;
- (CIFilterShape)intersectWithRect:(CGRect)r;
- (CIFilterShape)transformBy:(CGAffineTransform *)m interior:(BOOL)flag;
- (CIFilterShape)unionWith:(CIFilterShape *)s2;
- (CIFilterShape)unionWithRect:(CGRect)r;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
@end

@implementation CIFilterShape

- (void)dealloc
{
  priv = self->_priv;
  if (priv) {
    free(priv);
  }
  self->_priv = 0;
  v4.receiver = self;
  v4.super_class = (Class)CIFilterShape;
  [(CIFilterShape *)&v4 dealloc];
}

+ (id)_shapeInfinite
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (CIFilterShape)shapeWithRect:(CGRect)r
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithRect:", r.origin.x, r.origin.y, r.size.width, r.size.height);

  return (CIFilterShape *)v3;
}

- (CIFilterShape)initWithRect:(CGRect)r
{
  CGFloat height = r.size.height;
  CGFloat width = r.size.width;
  CGFloat y = r.origin.y;
  CGFloat x = r.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)CIFilterShape;
  v7 = [(CIFilterShape *)&v14 init];
  if (v7)
  {
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    CGRect v16 = CGRectStandardize(v15);
    CGFloat v8 = v16.origin.x;
    CGFloat v9 = v16.origin.y;
    CGFloat v10 = v16.size.width;
    CGFloat v11 = v16.size.height;
    v7->_priv = 0;
    if (!CGRectIsInfinite(v16))
    {
      v12 = (CGRect *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
      v17.origin.CGFloat x = v8;
      v17.origin.CGFloat y = v9;
      v17.size.CGFloat width = v10;
      v17.size.CGFloat height = v11;
      CGRect *v12 = CGRectIntegral(v17);
      v7->_priv = v12;
    }
  }
  return v7;
}

- (CIFilterShape)initWithStruct:(filterShape *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CIFilterShape;
  objc_super v4 = [(CIFilterShape *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_priv = 0;
    if (a3)
    {
      v6 = (CGSize *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
      CGSize size = a3->var0.size;
      CGSize *v6 = (CGSize)a3->var0.origin;
      v6[1] = size;
      v5->_priv = v6;
    }
  }
  return v5;
}

- (CIFilterShape)transformBy:(CGAffineTransform *)m interior:(BOOL)flag
{
  if (self->_priv)
  {
    BOOL v4 = flag;
    long long v7 = *(_OWORD *)&m->c;
    *(_OWORD *)&v14.double a = *(_OWORD *)&m->a;
    *(_OWORD *)&v14.c = v7;
    *(_OWORD *)&v14.tdouble x = *(_OWORD *)&m->tx;
    if (CGAffineTransformIsIdentity(&v14))
    {
      return (CIFilterShape *)(id)[(CIFilterShape *)self copy];
    }
    else
    {
      double a = m->a;
      double b = m->b;
      if (m->a == 1.0 && b == 0.0 && m->c == 0.0 && m->d == 1.0 && m->tx == floor(m->tx) && m->ty == floor(m->ty))
      {
        [(CIFilterShape *)self extent];
        CGRect v17 = CGRectOffset(v16, m->tx, m->ty);
      }
      else
      {
        if ((b != 0.0 || m->c != 0.0) && a == 0.0) {
          double a = m->d;
        }
        [(CIFilterShape *)self extent];
        long long v11 = *(_OWORD *)&m->c;
        *(_OWORD *)&v14.double a = *(_OWORD *)&m->a;
        *(_OWORD *)&v14.c = v11;
        *(_OWORD *)&v14.tdouble x = *(_OWORD *)&m->tx;
        CGRect v19 = CGRectApplyAffineTransform(v18, &v14);
        if (v4)
        {
          CGRect v20 = CGRectStandardize(v19);
          double x = v20.origin.x;
          double y = v20.origin.y;
          v17.origin.double x = ceil(v20.origin.x);
          v17.origin.double y = ceil(v20.origin.y);
          v17.size.CGFloat width = floor(x + v20.size.width) - v17.origin.x;
          v17.size.CGFloat height = floor(y + v20.size.height) - v17.origin.y;
        }
        else
        {
          CGRect v17 = CGRectIntegral(v19);
        }
      }
      return +[CIFilterShape shapeWithRect:](CIFilterShape, "shapeWithRect:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
    }
  }
  else
  {
    return (CIFilterShape *)+[CIFilterShape _shapeInfinite];
  }
}

- (CIFilterShape)insetByX:(int)dx Y:(int)dy
{
  if (self->_priv)
  {
    [(CIFilterShape *)self extent];
    CGRect v9 = CGRectInset(v8, (double)dx, (double)dy);
    return +[CIFilterShape shapeWithRect:](CIFilterShape, "shapeWithRect:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
  }
  else
  {
    return (CIFilterShape *)+[CIFilterShape _shapeInfinite];
  }
}

- (CIFilterShape)unionWith:(CIFilterShape *)s2
{
  if (!s2) {
    return 0;
  }
  if (self->_priv && s2->_priv)
  {
    [(CIFilterShape *)self extent];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    [(CIFilterShape *)s2 extent];
    v20.origin.double x = v12;
    v20.origin.double y = v13;
    v20.size.CGFloat width = v14;
    v20.size.CGFloat height = v15;
    v18.origin.double x = v5;
    v18.origin.double y = v7;
    v18.size.CGFloat width = v9;
    v18.size.CGFloat height = v11;
    CGRect v19 = CGRectUnion(v18, v20);
    return +[CIFilterShape shapeWithRect:](CIFilterShape, "shapeWithRect:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
  }
  else
  {
    return (CIFilterShape *)+[CIFilterShape _shapeInfinite];
  }
}

- (CIFilterShape)unionWithRect:(CGRect)r
{
  CGRect v10 = CGRectStandardize(r);
  if (self->_priv
    && (x = v10.origin.x, y = v10.origin.y, width = v10.size.width, CGFloat height = v10.size.height, !CGRectIsInfinite(v10)))
  {
    [(CIFilterShape *)self extent];
    v13.origin.CGFloat x = x;
    v13.origin.CGFloat y = y;
    v13.size.CGFloat width = width;
    v13.size.CGFloat height = height;
    CGRect v12 = CGRectUnion(v11, v13);
    return +[CIFilterShape shapeWithRect:](CIFilterShape, "shapeWithRect:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
  }
  else
  {
    return (CIFilterShape *)+[CIFilterShape _shapeInfinite];
  }
}

- (CIFilterShape)intersectWith:(CIFilterShape *)s2
{
  if (!s2) {
    return 0;
  }
  priv = s2->_priv;
  if (self->_priv)
  {
    if (priv)
    {
      [(CIFilterShape *)self extent];
      CGFloat v6 = v5;
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      [(CIFilterShape *)s2 extent];
      v22.origin.CGFloat x = v13;
      v22.origin.CGFloat y = v14;
      v22.size.CGFloat width = v15;
      v22.size.CGFloat height = v16;
      v20.origin.CGFloat x = v6;
      v20.origin.CGFloat y = v8;
      v20.size.CGFloat width = v10;
      v20.size.CGFloat height = v12;
      CGRect v21 = CGRectIntersection(v20, v22);
      return +[CIFilterShape shapeWithRect:](CIFilterShape, "shapeWithRect:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    }
    goto LABEL_10;
  }
  if (priv)
  {
    self = s2;
LABEL_10:
    CGRect v18 = (void *)[(CIFilterShape *)self copy];
    return (CIFilterShape *)v18;
  }

  return (CIFilterShape *)+[CIFilterShape _shapeInfinite];
}

- (CIFilterShape)intersectWithRect:(CGRect)r
{
  CGRect v11 = CGRectStandardize(r);
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  if (self->_priv) {
    goto LABEL_2;
  }
  if (!CGRectIsInfinite(v11))
  {
    if (!self->_priv)
    {
      v14.origin.CGFloat x = x;
      v14.origin.CGFloat y = y;
      v14.size.CGFloat width = width;
      v14.size.CGFloat height = height;
LABEL_11:
      return +[CIFilterShape shapeWithRect:](CIFilterShape, "shapeWithRect:", v14.origin.x, v14.origin.y, v14.size.width, v14.size.height);
    }
LABEL_2:
    v12.origin.CGFloat x = x;
    v12.origin.CGFloat y = y;
    v12.size.CGFloat width = width;
    v12.size.CGFloat height = height;
    if (CGRectIsInfinite(v12))
    {
      CGFloat v8 = (void *)[(CIFilterShape *)self copy];
      return (CIFilterShape *)v8;
    }
    [(CIFilterShape *)self extent];
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    CGRect v14 = CGRectIntersection(v13, v15);
    goto LABEL_11;
  }

  return (CIFilterShape *)+[CIFilterShape _shapeInfinite];
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = +[CIFilterShape allocWithZone:a3];
  priv = self->_priv;

  return [(CIFilterShape *)v4 initWithStruct:priv];
}

- (CGRect)extent
{
  priv = (double *)self->_priv;
  if (!priv) {
    priv = (double *)MEMORY[0x1E4F1DB10];
  }
  double v3 = priv[2];
  double v4 = priv[3];
  double v5 = *priv;
  double v6 = priv[1];
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (id)description
{
  [(CIFilterShape *)self extent];
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  if (CGRectIsInfinite(v12)) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"<CIFilterShape: %p extent [infinite]>", self, v8, v9, v10, v11);
  }
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  if (CGRectIsEmpty(v13)) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"<CIFilterShape: %p extent [empty]>", self, v8, v9, v10, v11);
  }
  else {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"<CIFilterShape: %p extent [%g %g %g %g]>", self, *(void *)&x, *(void *)&y, *(void *)&width, *(void *)&height);
  }
}

- (CGSRegionObject)CGSRegion
{
  [(CIFilterShape *)self extent];
  if (!CGRectIsInfinite(v3)) {
    CGSNewRegionWithRect();
  }
  return 0;
}

@end