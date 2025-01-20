@interface NSSymbolVariableColorEffect
+ (NSSymbolVariableColorEffect)effect;
- (NSSymbolVariableColorEffect)effectWithCumulative;
- (NSSymbolVariableColorEffect)effectWithDimInactiveLayers;
- (NSSymbolVariableColorEffect)effectWithHideInactiveLayers;
- (NSSymbolVariableColorEffect)effectWithIterative;
- (NSSymbolVariableColorEffect)effectWithNonReversing;
- (NSSymbolVariableColorEffect)effectWithReversing;
- (id)_rbOptionsMutable;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_fillStyle;
- (int64_t)_inactiveStyle;
- (int64_t)_playbackStyle;
- (void)set_fillStyle:(int64_t)a3;
- (void)set_inactiveStyle:(int64_t)a3;
- (void)set_playbackStyle:(int64_t)a3;
@end

@implementation NSSymbolVariableColorEffect

+ (NSSymbolVariableColorEffect)effect
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSymbolVariableColorEffect;
  v2 = objc_msgSendSuper2(&v4, sel__effectWithType_, 1);
  v2[2] = 0;
  v2[3] = 0;
  v2[4] = 0;

  return (NSSymbolVariableColorEffect *)v2;
}

- (NSSymbolVariableColorEffect)effectWithIterative
{
  v2 = [(NSSymbolVariableColorEffect *)self copyWithZone:0];
  v2[4] = 1;

  return (NSSymbolVariableColorEffect *)v2;
}

- (NSSymbolVariableColorEffect)effectWithCumulative
{
  v2 = [(NSSymbolVariableColorEffect *)self copyWithZone:0];
  v2[4] = 2;

  return (NSSymbolVariableColorEffect *)v2;
}

- (NSSymbolVariableColorEffect)effectWithReversing
{
  v2 = [(NSSymbolVariableColorEffect *)self copyWithZone:0];
  v2[3] = 1;

  return (NSSymbolVariableColorEffect *)v2;
}

- (NSSymbolVariableColorEffect)effectWithNonReversing
{
  v2 = [(NSSymbolVariableColorEffect *)self copyWithZone:0];
  v2[3] = 2;

  return (NSSymbolVariableColorEffect *)v2;
}

- (NSSymbolVariableColorEffect)effectWithHideInactiveLayers
{
  v2 = [(NSSymbolVariableColorEffect *)self copyWithZone:0];
  v2[2] = 1;

  return (NSSymbolVariableColorEffect *)v2;
}

- (NSSymbolVariableColorEffect)effectWithDimInactiveLayers
{
  v2 = [(NSSymbolVariableColorEffect *)self copyWithZone:0];
  v2[2] = 2;

  return (NSSymbolVariableColorEffect *)v2;
}

- (id)_rbOptionsMutable
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  unsigned int v4 = self->_fillStyle == 1;
  if (self->_playbackStyle == 1) {
    v4 |= 8u;
  }
  if (self->_inactiveStyle == 1) {
    uint64_t v5 = v4 | 2;
  }
  else {
    uint64_t v5 = v4;
  }
  v6 = [NSNumber numberWithUnsignedInt:v5];
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x263F639D0]];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSSymbolVariableColorEffect;
  id result = [(NSSymbolEffect *)&v5 copyWithZone:a3];
  *((void *)result + 2) = self->_inactiveStyle;
  *((void *)result + 3) = self->_playbackStyle;
  *((void *)result + 4) = self->_fillStyle;
  return result;
}

- (int64_t)_inactiveStyle
{
  return self->_inactiveStyle;
}

- (void)set_inactiveStyle:(int64_t)a3
{
  self->_inactiveStyle = a3;
}

- (int64_t)_playbackStyle
{
  return self->_playbackStyle;
}

- (void)set_playbackStyle:(int64_t)a3
{
  self->_playbackStyle = a3;
}

- (int64_t)_fillStyle
{
  return self->_fillStyle;
}

- (void)set_fillStyle:(int64_t)a3
{
  self->_fillStyle = a3;
}

@end