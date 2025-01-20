@interface NSSymbolDisappearEffect
+ (NSSymbolDisappearEffect)disappearDownEffect;
+ (NSSymbolDisappearEffect)disappearUpEffect;
+ (NSSymbolDisappearEffect)effect;
- (NSSymbolDisappearEffect)effectWithByLayer;
- (NSSymbolDisappearEffect)effectWithWholeSymbol;
- (id)_rbOptionsMutable;
- (id)_withStyle:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_layerBehavior;
- (int64_t)_style;
- (void)set_layerBehavior:(int64_t)a3;
- (void)set_style:(int64_t)a3;
@end

@implementation NSSymbolDisappearEffect

+ (NSSymbolDisappearEffect)effect
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSymbolDisappearEffect;
  v2 = objc_msgSendSuper2(&v4, sel__effectWithType_, 6);
  v2[2] = 0;
  v2[3] = 0;

  return (NSSymbolDisappearEffect *)v2;
}

+ (NSSymbolDisappearEffect)disappearUpEffect
{
  v2 = [a1 effect];
  v3 = [v2 _withStyle:1];

  return (NSSymbolDisappearEffect *)v3;
}

+ (NSSymbolDisappearEffect)disappearDownEffect
{
  v2 = [a1 effect];
  v3 = [v2 _withStyle:2];

  return (NSSymbolDisappearEffect *)v3;
}

- (id)_withStyle:(int64_t)a3
{
  *((void *)self + 3) = a3;
  return self;
}

- (NSSymbolDisappearEffect)effectWithByLayer
{
  v2 = [(NSSymbolDisappearEffect *)self copyWithZone:0];
  v2[2] = 1;

  return (NSSymbolDisappearEffect *)v2;
}

- (NSSymbolDisappearEffect)effectWithWholeSymbol
{
  v2 = [(NSSymbolDisappearEffect *)self copyWithZone:0];
  v2[2] = 2;

  return (NSSymbolDisappearEffect *)v2;
}

- (id)_rbOptionsMutable
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(id)objc_opt_class() _addLayerBehavior:self->_layerBehavior ToOptions:v3];
  int64_t style = self->_style;
  if (style == 1) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2 * (style == 2);
  }
  v6 = [NSNumber numberWithUnsignedInt:v5];
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x263F63968]];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSSymbolDisappearEffect;
  id result = [(NSSymbolEffect *)&v5 copyWithZone:a3];
  *((void *)result + 2) = self->_layerBehavior;
  *((void *)result + 3) = self->_style;
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

- (int64_t)_style
{
  return self->_style;
}

- (void)set_style:(int64_t)a3
{
  self->_int64_t style = a3;
}

@end