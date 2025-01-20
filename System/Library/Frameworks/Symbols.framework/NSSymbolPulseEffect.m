@interface NSSymbolPulseEffect
+ (NSSymbolPulseEffect)effect;
- (NSSymbolPulseEffect)effectWithByLayer;
- (NSSymbolPulseEffect)effectWithWholeSymbol;
- (id)_rbOptionsMutable;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_layerBehavior;
- (void)set_layerBehavior:(int64_t)a3;
@end

@implementation NSSymbolPulseEffect

+ (NSSymbolPulseEffect)effect
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSymbolPulseEffect;
  v2 = objc_msgSendSuper2(&v4, sel__effectWithType_, 2);
  v2[2] = 0;

  return (NSSymbolPulseEffect *)v2;
}

- (NSSymbolPulseEffect)effectWithByLayer
{
  v2 = [(NSSymbolPulseEffect *)self copyWithZone:0];
  v2[2] = 1;

  return (NSSymbolPulseEffect *)v2;
}

- (NSSymbolPulseEffect)effectWithWholeSymbol
{
  v2 = [(NSSymbolPulseEffect *)self copyWithZone:0];
  v2[2] = 2;

  return (NSSymbolPulseEffect *)v2;
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
  v5.super_class = (Class)NSSymbolPulseEffect;
  id result = [(NSSymbolEffect *)&v5 copyWithZone:a3];
  *((void *)result + 2) = self->_layerBehavior;
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

@end