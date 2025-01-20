@interface HUControllableCollectionViewLayoutOverrideAttributes
- (CGAffineTransform)transform;
- (HUControllableCollectionViewLayoutOverrideAttributes)init;
- (double)alpha;
- (int64_t)zIndex;
- (void)setAlpha:(double)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setZIndex:(int64_t)a3;
@end

@implementation HUControllableCollectionViewLayoutOverrideAttributes

- (HUControllableCollectionViewLayoutOverrideAttributes)init
{
  v5.receiver = self;
  v5.super_class = (Class)HUControllableCollectionViewLayoutOverrideAttributes;
  result = [(HUControllableCollectionViewLayoutOverrideAttributes *)&v5 init];
  if (result)
  {
    uint64_t v3 = MEMORY[0x1E4F1DAB8];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&result->_transform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&result->_transform.c = v4;
    *(_OWORD *)&result->_transform.tx = *(_OWORD *)(v3 + 32);
    result->_zIndex = 1;
    result->_alpha = 1.0;
  }
  return result;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].b;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (int64_t)zIndex
{
  return self->_zIndex;
}

- (void)setZIndex:(int64_t)a3
{
  self->_zIndex = a3;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

@end