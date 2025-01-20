@interface NSSymbolMagicReplaceContentTransition
+ (id)transition;
+ (id)transitionWithFallback:(id)a3;
- (NSSymbolReplaceContentTransition)_fallback;
- (id)_rbOptionsMutable;
- (id)copyWithZone:(_NSZone *)a3;
- (void)set_fallback:(id)a3;
@end

@implementation NSSymbolMagicReplaceContentTransition

+ (id)transition
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSymbolMagicReplaceContentTransition;
  v2 = objc_msgSendSuper2(&v4, sel__transitionWithType_, 11);

  return v2;
}

+ (id)transitionWithFallback:(id)a3
{
  id v4 = a3;
  v5 = [a1 transition];
  v6 = (void *)v5[2];
  v5[2] = v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NSSymbolMagicReplaceContentTransition;
  v5 = -[NSSymbolContentTransition copyWithZone:](&v10, sel_copyWithZone_);
  v6 = [(NSSymbolMagicReplaceContentTransition *)self _fallback];
  uint64_t v7 = [v6 copyWithZone:a3];
  v8 = (void *)v5[2];
  v5[2] = v7;

  return v5;
}

- (id)_rbOptionsMutable
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  +[NSSymbolEffect _addLayerBehavior:[(NSSymbolReplaceContentTransition *)self->_fallback _layerBehavior] ToOptions:v3];
  int64_t v4 = [(NSSymbolReplaceContentTransition *)self->_fallback _style];
  if ((unint64_t)(v4 - 1) >= 3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = (v4 + 1);
  }
  v6 = [NSNumber numberWithUnsignedInt:v5];
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x263F639B0]];

  return v3;
}

- (NSSymbolReplaceContentTransition)_fallback
{
  return self->_fallback;
}

- (void)set_fallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end