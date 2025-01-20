@interface NSSymbolBounceEffect
+ (NSSymbolBounceEffect)bounceDownEffect;
+ (NSSymbolBounceEffect)bounceUpEffect;
+ (NSSymbolBounceEffect)effect;
- (NSSymbolBounceEffect)effectWithByLayer;
- (NSSymbolBounceEffect)effectWithWholeSymbol;
- (id)_rbOptionsMutable;
- (id)_withDirection:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_direction;
- (int64_t)_layerBehavior;
- (void)set_direction:(int64_t)a3;
- (void)set_layerBehavior:(int64_t)a3;
@end

@implementation NSSymbolBounceEffect

+ (NSSymbolBounceEffect)effect
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSymbolBounceEffect;
  v2 = objc_msgSendSuper2(&v4, sel__effectWithType_, 3);
  v2[2] = 0;
  v2[3] = 0;

  return (NSSymbolBounceEffect *)v2;
}

+ (NSSymbolBounceEffect)bounceUpEffect
{
  v2 = [a1 effect];
  v3 = [v2 _withDirection:1];

  return (NSSymbolBounceEffect *)v3;
}

+ (NSSymbolBounceEffect)bounceDownEffect
{
  v2 = [a1 effect];
  v3 = [v2 _withDirection:2];

  return (NSSymbolBounceEffect *)v3;
}

- (id)_withDirection:(int64_t)a3
{
  *((void *)self + 3) = a3;
  return self;
}

- (NSSymbolBounceEffect)effectWithByLayer
{
  v2 = [(NSSymbolBounceEffect *)self copyWithZone:0];
  v2[2] = 1;

  return (NSSymbolBounceEffect *)v2;
}

- (NSSymbolBounceEffect)effectWithWholeSymbol
{
  v2 = [(NSSymbolBounceEffect *)self copyWithZone:0];
  v2[2] = 2;

  return (NSSymbolBounceEffect *)v2;
}

- (id)_rbOptionsMutable
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(id)objc_opt_class() _addLayerBehavior:self->_layerBehavior ToOptions:v3];
  int64_t direction = self->_direction;
  if (direction == 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2 * (direction == 2);
  }
  v6 = [NSNumber numberWithUnsignedInt:v5];
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x263F63970]];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSSymbolBounceEffect;
  id result = [(NSSymbolEffect *)&v5 copyWithZone:a3];
  *((void *)result + 2) = self->_layerBehavior;
  *((void *)result + 3) = self->_direction;
  return result;
}

- (int64_t)_layerBehavior
{
  return self->_layerBehavior;
}

- (void)set_layerBehavior:(int64_t)a3
{
  self->_layerBehavior = a3;
}

- (int64_t)_direction
{
  return self->_direction;
}

- (void)set_direction:(int64_t)a3
{
  self->_int64_t direction = a3;
}

@end