@interface NSSymbolContentTransition
+ (BOOL)supportsSecureCoding;
+ (id)_transitionWithType:(int64_t)a3;
- (NSSymbolContentTransition)initWithCoder:(id)a3;
- (id)_rbAnimation;
- (id)_rbOptionsMutable;
- (id)_rbOptionsWithEffectOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_effectType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSSymbolContentTransition

+ (id)_transitionWithType:(int64_t)a3
{
  v4 = objc_opt_new();
  v4[1] = a3;

  return v4;
}

- (id)_rbAnimation
{
  int64_t v2 = [(NSSymbolContentTransition *)self _effectType];
  if (v2 == 11 || v2 == 7)
  {
    v3 = [NSNumber numberWithUnsignedInt:6];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_rbOptionsMutable
{
  return (id)[MEMORY[0x263EFF9A0] dictionary];
}

- (id)_rbOptionsWithEffectOptions:(id)a3
{
  id v4 = a3;
  v5 = [(NSSymbolContentTransition *)self _rbOptionsMutable];
  +[NSSymbolEffect _mergeEffectOptions:v4 intoRBOptions:v5 forEffect:[(NSSymbolContentTransition *)self _effectType]];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id v4 = objc_opt_new();
  v4[1] = [(NSSymbolContentTransition *)self _effectType];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[NSSymbolContentTransition _effectType](self, "_effectType"), @"_effectType");
}

- (NSSymbolContentTransition)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = (NSSymbolContentTransition *)objc_opt_new();

  if (v5) {
    v5->_effectType = [v4 decodeIntegerForKey:@"_effectType"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)_effectType
{
  return self->_effectType;
}

@end