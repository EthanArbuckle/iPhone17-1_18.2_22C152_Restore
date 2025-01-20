@interface NSSymbolRotateEffect
+ (id)effect;
+ (id)rotateClockwiseEffect;
+ (id)rotateCounterClockwiseEffect;
- (NSSymbolRotateEffect)effectWithByLayer;
- (NSSymbolRotateEffect)effectWithWholeSymbol;
- (id)_rbOptionsMutable;
- (id)_withClockwise:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_isClockwise;
- (int64_t)_layerBehavior;
- (void)set_isClockwise:(int64_t)a3;
- (void)set_layerBehavior:(int64_t)a3;
@end

@implementation NSSymbolRotateEffect

- (id)_withClockwise:(int64_t)a3
{
  *((void *)self + 3) = a3;
  return self;
}

+ (id)effect
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSymbolRotateEffect;
  v2 = objc_msgSendSuper2(&v4, sel__effectWithType_, 10);
  v2[2] = 0;
  v2[3] = 0;

  return v2;
}

+ (id)rotateClockwiseEffect
{
  v2 = [a1 effect];
  v3 = [v2 _withClockwise:1];

  return v3;
}

+ (id)rotateCounterClockwiseEffect
{
  v2 = [a1 effect];
  v3 = [v2 _withClockwise:2];

  return v3;
}

- (NSSymbolRotateEffect)effectWithByLayer
{
  v2 = [(NSSymbolRotateEffect *)self copyWithZone:0];
  v2[2] = 1;

  return (NSSymbolRotateEffect *)v2;
}

- (NSSymbolRotateEffect)effectWithWholeSymbol
{
  v2 = [(NSSymbolRotateEffect *)self copyWithZone:0];
  v2[2] = 2;

  return (NSSymbolRotateEffect *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSSymbolRotateEffect;
  id result = [(NSSymbolEffect *)&v5 copyWithZone:a3];
  *((void *)result + 2) = self->_layerBehavior;
  *((void *)result + 3) = self->_isClockwise;
  return result;
}

- (id)_rbOptionsMutable
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(id)objc_opt_class() _addLayerBehavior:self->_layerBehavior ToOptions:v3];
  int64_t isClockwise = self->_isClockwise;
  if (isClockwise == 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2 * (isClockwise == 2);
  }
  v6 = [NSNumber numberWithUnsignedInt:v5];
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x263F639B8]];

  return v3;
}

- (int64_t)_layerBehavior
{
  return self->_layerBehavior;
}

- (void)set_layerBehavior:(int64_t)a3
{
  self->_layerBehavior = a3;
}

- (int64_t)_isClockwise
{
  return self->_isClockwise;
}

- (void)set_isClockwise:(int64_t)a3
{
  self->_int64_t isClockwise = a3;
}

@end