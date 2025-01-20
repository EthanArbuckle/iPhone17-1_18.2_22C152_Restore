@interface NSSymbolBreatheEffect
+ (id)breatheByDimmingEffect;
+ (id)breatheByScalingEffect;
+ (id)effect;
- (NSSymbolBreatheEffect)effectWithByLayer;
- (NSSymbolBreatheEffect)effectWithWholeSymbol;
- (id)_rbOptionsMutable;
- (id)_withStyle:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_layerBehavior;
- (int64_t)_style;
- (void)set_layerBehavior:(int64_t)a3;
- (void)set_style:(int64_t)a3;
@end

@implementation NSSymbolBreatheEffect

- (id)_withStyle:(int64_t)a3
{
  *((void *)self + 3) = a3;
  return self;
}

+ (id)effect
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSymbolBreatheEffect;
  v2 = objc_msgSendSuper2(&v4, sel__effectWithType_, 12);
  v2[2] = 0;
  v2[3] = 0;

  return v2;
}

+ (id)breatheByDimmingEffect
{
  v2 = [a1 effect];
  v3 = [v2 _withStyle:1];

  return v3;
}

+ (id)breatheByScalingEffect
{
  v2 = [a1 effect];
  v3 = [v2 _withStyle:2];

  return v3;
}

- (NSSymbolBreatheEffect)effectWithByLayer
{
  v2 = [(NSSymbolBreatheEffect *)self copyWithZone:0];
  v2[2] = 1;

  return (NSSymbolBreatheEffect *)v2;
}

- (NSSymbolBreatheEffect)effectWithWholeSymbol
{
  v2 = [(NSSymbolBreatheEffect *)self copyWithZone:0];
  v2[2] = 2;

  return (NSSymbolBreatheEffect *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSSymbolBreatheEffect;
  id result = [(NSSymbolEffect *)&v5 copyWithZone:a3];
  *((void *)result + 2) = self->_layerBehavior;
  *((void *)result + 3) = self->_style;
  return result;
}

- (id)_rbOptionsMutable
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(id)objc_opt_class() _addLayerBehavior:self->_layerBehavior ToOptions:v3];
  objc_super v4 = [NSNumber numberWithUnsignedInt:self->_style == 2];
  [v3 setObject:v4 forKeyedSubscript:@"breatheOptions"];

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

- (int64_t)_style
{
  return self->_style;
}

- (void)set_style:(int64_t)a3
{
  self->_style = a3;
}

@end