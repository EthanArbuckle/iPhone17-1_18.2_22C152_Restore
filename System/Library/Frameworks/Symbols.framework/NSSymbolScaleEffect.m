@interface NSSymbolScaleEffect
+ (NSSymbolScaleEffect)effect;
+ (NSSymbolScaleEffect)scaleDownEffect;
+ (NSSymbolScaleEffect)scaleUpEffect;
- (NSSymbolScaleEffect)effectWithByLayer;
- (NSSymbolScaleEffect)effectWithWholeSymbol;
- (id)_rbOptionsMutable;
- (id)_withScaleLevel:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_layerBehavior;
- (int64_t)_level;
- (void)set_layerBehavior:(int64_t)a3;
- (void)set_level:(int64_t)a3;
@end

@implementation NSSymbolScaleEffect

+ (NSSymbolScaleEffect)effect
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSymbolScaleEffect;
  v2 = objc_msgSendSuper2(&v4, sel__effectWithType_, 4);
  v2[2] = 0;
  v2[3] = 0;

  return (NSSymbolScaleEffect *)v2;
}

+ (NSSymbolScaleEffect)scaleUpEffect
{
  v2 = [a1 effect];
  v3 = [v2 _withScaleLevel:1];

  return (NSSymbolScaleEffect *)v3;
}

+ (NSSymbolScaleEffect)scaleDownEffect
{
  v2 = [a1 effect];
  v3 = [v2 _withScaleLevel:2];

  return (NSSymbolScaleEffect *)v3;
}

- (id)_withScaleLevel:(int64_t)a3
{
  *((void *)self + 3) = a3;
  return self;
}

- (NSSymbolScaleEffect)effectWithByLayer
{
  v2 = [(NSSymbolScaleEffect *)self copyWithZone:0];
  v2[2] = 1;

  return (NSSymbolScaleEffect *)v2;
}

- (NSSymbolScaleEffect)effectWithWholeSymbol
{
  v2 = [(NSSymbolScaleEffect *)self copyWithZone:0];
  v2[2] = 2;

  return (NSSymbolScaleEffect *)v2;
}

- (id)_rbOptionsMutable
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(id)objc_opt_class() _addLayerBehavior:self->_layerBehavior ToOptions:v3];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSSymbolScaleEffect;
  id result = [(NSSymbolEffect *)&v5 copyWithZone:a3];
  *((void *)result + 2) = self->_layerBehavior;
  *((void *)result + 3) = self->_level;
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

- (int64_t)_level
{
  return self->_level;
}

- (void)set_level:(int64_t)a3
{
  self->_level = a3;
}

@end