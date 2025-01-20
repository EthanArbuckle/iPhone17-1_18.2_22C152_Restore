@interface NSSymbolReplaceContentTransition
+ (NSSymbolReplaceContentTransition)replaceDownUpTransition;
+ (NSSymbolReplaceContentTransition)replaceOffUpTransition;
+ (NSSymbolReplaceContentTransition)replaceUpUpTransition;
+ (NSSymbolReplaceContentTransition)transition;
+ (id)magicTransitionWithFallback:(id)a3;
- (NSSymbolReplaceContentTransition)transitionWithByLayer;
- (NSSymbolReplaceContentTransition)transitionWithWholeSymbol;
- (id)_rbOptionsMutable;
- (id)_withStyle:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_layerBehavior;
- (int64_t)_style;
- (void)set_layerBehavior:(int64_t)a3;
- (void)set_style:(int64_t)a3;
@end

@implementation NSSymbolReplaceContentTransition

+ (NSSymbolReplaceContentTransition)transition
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSymbolReplaceContentTransition;
  v2 = objc_msgSendSuper2(&v4, sel__transitionWithType_, 7);
  v2[2] = 0;
  v2[3] = 0;

  return (NSSymbolReplaceContentTransition *)v2;
}

+ (NSSymbolReplaceContentTransition)replaceDownUpTransition
{
  v2 = [a1 transition];
  v3 = [v2 _withStyle:1];

  return (NSSymbolReplaceContentTransition *)v3;
}

+ (NSSymbolReplaceContentTransition)replaceUpUpTransition
{
  v2 = [a1 transition];
  v3 = [v2 _withStyle:2];

  return (NSSymbolReplaceContentTransition *)v3;
}

+ (NSSymbolReplaceContentTransition)replaceOffUpTransition
{
  v2 = [a1 transition];
  v3 = [v2 _withStyle:3];

  return (NSSymbolReplaceContentTransition *)v3;
}

- (id)_withStyle:(int64_t)a3
{
  *((void *)self + 3) = a3;
  return self;
}

- (NSSymbolReplaceContentTransition)transitionWithByLayer
{
  v2 = [(NSSymbolReplaceContentTransition *)self copyWithZone:0];
  v2[2] = 1;

  return (NSSymbolReplaceContentTransition *)v2;
}

- (NSSymbolReplaceContentTransition)transitionWithWholeSymbol
{
  v2 = [(NSSymbolReplaceContentTransition *)self copyWithZone:0];
  v2[2] = 2;

  return (NSSymbolReplaceContentTransition *)v2;
}

+ (id)magicTransitionWithFallback:(id)a3
{
  return +[NSSymbolMagicReplaceContentTransition transitionWithFallback:a3];
}

- (id)_rbOptionsMutable
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  +[NSSymbolEffect _addLayerBehavior:self->_layerBehavior ToOptions:v3];
  if ((unint64_t)(self->_style - 1) >= 3)
  {
    if (dyld_program_sdk_at_least()) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = 96;
    }
  }
  else
  {
    uint64_t v4 = (LODWORD(self->_style) + 97);
  }
  v5 = [NSNumber numberWithUnsignedInt:v4];
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x263F639B0]];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSSymbolReplaceContentTransition;
  id result = [(NSSymbolContentTransition *)&v5 copyWithZone:a3];
  *((void *)result + 3) = self->_style;
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

- (int64_t)_style
{
  return self->_style;
}

- (void)set_style:(int64_t)a3
{
  self->_style = a3;
}

@end