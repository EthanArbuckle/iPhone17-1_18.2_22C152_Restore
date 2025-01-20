@interface HUQuickControlVisualEffect
+ (id)effectWithType:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)effectConfig;
- (unint64_t)effectType;
@end

@implementation HUQuickControlVisualEffect

+ (id)effectWithType:(unint64_t)a3
{
  v4 = objc_alloc_init(HUQuickControlVisualEffect);
  v4->_effectType = a3;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[1] = [(HUQuickControlVisualEffect *)self effectType];
  return v4;
}

- (id)effectConfig
{
  unint64_t v2 = [(HUQuickControlVisualEffect *)self effectType];
  if (v2 == 2)
  {
    v7 = [MEMORY[0x1E4F428B8] colorWithWhite:0.4 alpha:1.0];
    v8 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.35];
    v9 = [MEMORY[0x1E4F433C0] layerWithVibrantColor:v7 tintColor:v8 filterType:*MEMORY[0x1E4F3A368] filterAttributes:&unk_1F19B5CA0];
    v10 = [MEMORY[0x1E4F433B0] configWithContentConfig:v9];

    goto LABEL_10;
  }
  if (v2 == 1)
  {
    v3 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.4];
    v4 = (void *)MEMORY[0x1E4F433B8];
    uint64_t v6 = *MEMORY[0x1E4F3A220];
    v5 = v3;
  }
  else
  {
    if (v2)
    {
      v9 = 0;
      goto LABEL_9;
    }
    v3 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.9];
    v4 = (void *)MEMORY[0x1E4F433B8];
    v5 = v3;
    uint64_t v6 = 0;
  }
  v9 = [v4 layerWithTintColor:v5 filterType:v6];

LABEL_9:
  v10 = [MEMORY[0x1E4F433B0] configWithContentConfig:v9];
LABEL_10:

  return v10;
}

- (unint64_t)effectType
{
  return self->_effectType;
}

@end