@interface CATransformLayer
- (CATransformLayer)init;
- (CATransformLayer)initWithLayer:(id)a3;
@end

@implementation CATransformLayer

- (CATransformLayer)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)CATransformLayer;
  result = [(CALayer *)&v3 init];
  if (result) {
    atomic_fetch_or((atomic_uint *volatile)result->super._attr.layer + 1, 0x10000u);
  }
  return result;
}

- (CATransformLayer)initWithLayer:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)CATransformLayer;
  result = [(CALayer *)&v4 initWithLayer:a3];
  if (result) {
    atomic_fetch_or((atomic_uint *volatile)result->super._attr.layer + 1, 0x10000u);
  }
  return result;
}

@end