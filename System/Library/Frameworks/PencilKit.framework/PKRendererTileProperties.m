@interface PKRendererTileProperties
- (BOOL)isEqual:(id)a3;
- (BOOL)sixChannelMode;
- (CGAffineTransform)drawingTransform;
- (CGPoint)offset;
- (PKRendererTileProperties)initWithLevel:(int64_t)a3 offset:(CGPoint)a4 drawingTransform:(CGAffineTransform *)a5 sixChannelMode:(BOOL)a6;
- (int64_t)level;
- (unint64_t)hash;
@end

@implementation PKRendererTileProperties

- (PKRendererTileProperties)initWithLevel:(int64_t)a3 offset:(CGPoint)a4 drawingTransform:(CGAffineTransform *)a5 sixChannelMode:(BOOL)a6
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v14.receiver = self;
  v14.super_class = (Class)PKRendererTileProperties;
  result = [(PKRendererTileProperties *)&v14 init];
  if (result)
  {
    result->_level = a3;
    result->_offset.CGFloat x = x;
    result->_offset.CGFloat y = y;
    result->_sixChannelMode = a6;
    long long v12 = *(_OWORD *)&a5->a;
    long long v13 = *(_OWORD *)&a5->c;
    *(_OWORD *)&result->_drawingTransform.tCGFloat x = *(_OWORD *)&a5->tx;
    *(_OWORD *)&result->_drawingTransform.c = v13;
    *(_OWORD *)&result->_drawingTransform.a = v12;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_level ^ ((uint64_t)self->_offset.x << 8) ^ ((uint64_t)self->_offset.y << 16);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v12 = 0;
    goto LABEL_9;
  }
  id v5 = v4;
  int64_t v6 = [(PKRendererTileProperties *)self level];
  if (v6 == [v5 level])
  {
    [v5 offset];
    double v8 = v7;
    double v10 = v9;
    [(PKRendererTileProperties *)self offset];
    BOOL v12 = 0;
    if (v8 != v13 || v10 != v11) {
      goto LABEL_7;
    }
    int v14 = [(PKRendererTileProperties *)self sixChannelMode];
    if (v14 == [v5 sixChannelMode])
    {
      [(PKRendererTileProperties *)self drawingTransform];
      if (v5) {
        [v5 drawingTransform];
      }
      else {
        memset(v16, 0, sizeof(v16));
      }
      BOOL v12 = DKDNearlyEqualTransforms(v17, (double *)v16);
      goto LABEL_7;
    }
  }
  BOOL v12 = 0;
LABEL_7:

LABEL_9:
  return v12;
}

- (int64_t)level
{
  return self->_level;
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)sixChannelMode
{
  return self->_sixChannelMode;
}

- (CGAffineTransform)drawingTransform
{
  long long v3 = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[1].d;
  return self;
}

@end