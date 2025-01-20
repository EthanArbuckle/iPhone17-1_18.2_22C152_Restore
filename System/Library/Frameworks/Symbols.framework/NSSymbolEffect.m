@interface NSSymbolEffect
+ (BOOL)supportsSecureCoding;
+ (id)_effectWithType:(int64_t)a3;
+ (void)_addLayerBehavior:(int64_t)a3 ToOptions:(id)a4;
+ (void)_mergeEffectOptions:(id)a3 intoRBOptions:(id)a4 forEffect:(int64_t)a5;
- (NSSymbolEffect)initWithCoder:(id)a3;
- (id)_rbAnimation;
- (id)_rbOptionsMutable;
- (id)_rbOptionsWithEffectOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_effectType;
- (void)_setEffectType:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSSymbolEffect

+ (id)_effectWithType:(int64_t)a3
{
  v4 = objc_opt_new();
  v4[1] = a3;

  return v4;
}

- (void)_setEffectType:(int64_t)a3
{
  self->_effectType = a3;
}

- (id)_rbAnimation
{
  unint64_t v2 = [(NSSymbolEffect *)self _effectType] - 1;
  if (v2 <= 0xB && ((0xB3Fu >> v2) & 1) != 0)
  {
    v3 = [NSNumber numberWithUnsignedInt:dword_2463139F8[v2]];
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

+ (void)_mergeEffectOptions:(id)a3 intoRBOptions:(id)a4 forEffect:(int64_t)a5
{
  id v24 = a3;
  id v7 = a4;
  v8 = NSNumber;
  [v24 _speed];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x263F639C0]];

  uint64_t v10 = [v24 _repeatBehavior];
  if (v10 == 2)
  {
    v11 = NSNumber;
    *(float *)&double v12 = (float)[v24 _repeatCount];
    v13 = [v11 numberWithFloat:v12];
    [v7 setObject:v13 forKeyedSubscript:*MEMORY[0x263F639A0]];
  }
  else if (v10 == 1)
  {
    [v7 setObject:&unk_26FAA69D8 forKeyedSubscript:*MEMORY[0x263F639A0]];
  }
  v14 = [v24 _repeatDelay];

  if (v14)
  {
    v15 = [v24 _repeatDelay];
    [v15 doubleValue];
    double v17 = v16;

    *(float *)&double v18 = v17;
    v19 = [NSNumber numberWithFloat:v18];
    [v7 setObject:v19 forKeyedSubscript:*MEMORY[0x263F639A8]];
  }
  if ([v24 _prefersContinuous])
  {
    switch(a5)
    {
      case 3:
        v20 = (void *)MEMORY[0x263F63970];
        break;
      case 10:
        v20 = (void *)MEMORY[0x263F639B8];
        break;
      case 9:
        v20 = (void *)MEMORY[0x263F639E0];
        v21 = [v7 objectForKeyedSubscript:*MEMORY[0x263F639E0]];
        uint64_t v22 = 256;
        if (!v21) {
          goto LABEL_17;
        }
        goto LABEL_16;
      default:
        goto LABEL_18;
    }
    v21 = [v7 objectForKeyedSubscript:*v20];
    uint64_t v22 = 16;
    if (!v21)
    {
LABEL_17:
      v23 = [NSNumber numberWithUnsignedInt:v22];
      [v7 setObject:v23 forKeyedSubscript:*v20];

      goto LABEL_18;
    }
LABEL_16:
    uint64_t v22 = [v21 unsignedIntValue] | v22;
    goto LABEL_17;
  }
LABEL_18:
}

- (id)_rbOptionsWithEffectOptions:(id)a3
{
  id v4 = a3;
  v5 = [(NSSymbolEffect *)self _rbOptionsMutable];
  objc_msgSend((id)objc_opt_class(), "_mergeEffectOptions:intoRBOptions:forEffect:", v4, v5, -[NSSymbolEffect _effectType](self, "_effectType"));

  return v5;
}

+ (void)_addLayerBehavior:(int64_t)a3 ToOptions:(id)a4
{
  id v5 = a4;
  if (a3 == 1)
  {
    uint64_t v6 = MEMORY[0x263EFFA88];
  }
  else
  {
    if (a3 != 2) {
      goto LABEL_6;
    }
    uint64_t v6 = MEMORY[0x263EFFA80];
  }
  id v7 = v5;
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F63980]];
  id v5 = v7;
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id v4 = objc_opt_new();
  v4[1] = [(NSSymbolEffect *)self _effectType];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[NSSymbolEffect _effectType](self, "_effectType"), @"_effectType");
}

- (NSSymbolEffect)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = (NSSymbolEffect *)objc_opt_new();

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