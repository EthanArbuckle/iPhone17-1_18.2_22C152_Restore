@interface NSSymbolAppearEffect
+ (NSSymbolAppearEffect)appearDownEffect;
+ (NSSymbolAppearEffect)appearUpEffect;
+ (NSSymbolAppearEffect)effect;
- (NSSymbolAppearEffect)effectWithByLayer;
- (NSSymbolAppearEffect)effectWithWholeSymbol;
- (id)_rbOptionsMutable;
- (id)_withStyle:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_layerBehavior;
- (int64_t)_style;
- (void)set_layerBehavior:(int64_t)a3;
- (void)set_style:(int64_t)a3;
@end

@implementation NSSymbolAppearEffect

+ (NSSymbolAppearEffect)effect
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSymbolAppearEffect;
  v2 = objc_msgSendSuper2(&v4, sel__effectWithType_, 5);
  v2[2] = 0;
  v2[3] = 0;

  return (NSSymbolAppearEffect *)v2;
}

+ (NSSymbolAppearEffect)appearUpEffect
{
  v2 = [a1 effect];
  v3 = [v2 _withStyle:1];

  return (NSSymbolAppearEffect *)v3;
}

+ (NSSymbolAppearEffect)appearDownEffect
{
  v2 = [a1 effect];
  v3 = [v2 _withStyle:2];

  return (NSSymbolAppearEffect *)v3;
}

- (id)_withStyle:(int64_t)a3
{
  *((void *)self + 3) = a3;
  return self;
}

- (NSSymbolAppearEffect)effectWithByLayer
{
  v2 = [(NSSymbolAppearEffect *)self copyWithZone:0];
  v2[2] = 1;

  return (NSSymbolAppearEffect *)v2;
}

- (NSSymbolAppearEffect)effectWithWholeSymbol
{
  v2 = [(NSSymbolAppearEffect *)self copyWithZone:0];
  v2[2] = 2;

  return (NSSymbolAppearEffect *)v2;
}

- (id)_rbOptionsMutable
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(id)objc_opt_class() _addLayerBehavior:self->_layerBehavior ToOptions:v3];
  int64_t style = self->_style;
  if (style == 2) {
    unsigned int v5 = 3;
  }
  else {
    unsigned int v5 = 0;
  }
  if (style == 1) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = v5;
  }
  v7 = [NSNumber numberWithUnsignedInt:v6];
  [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x263F63968]];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSSymbolAppearEffect;
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