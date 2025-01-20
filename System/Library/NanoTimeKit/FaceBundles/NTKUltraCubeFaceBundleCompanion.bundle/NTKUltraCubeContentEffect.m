@interface NTKUltraCubeContentEffect
+ (id)contentEffectWithColorEffect:(unint64_t)a3 colorPalette:(id)a4;
- (NTKUltraCubeColorPalette)palette;
- (unint64_t)colorEffect;
- (void)setColorEffect:(unint64_t)a3;
- (void)setPalette:(id)a3;
@end

@implementation NTKUltraCubeContentEffect

+ (id)contentEffectWithColorEffect:(unint64_t)a3 colorPalette:(id)a4
{
  id v5 = a4;
  v6 = objc_alloc_init(NTKUltraCubeContentEffect);
  [(NTKUltraCubeContentEffect *)v6 setColorEffect:a3];
  [(NTKUltraCubeContentEffect *)v6 setPalette:v5];

  return v6;
}

- (unint64_t)colorEffect
{
  return self->_colorEffect;
}

- (void)setColorEffect:(unint64_t)a3
{
  self->_colorEffect = a3;
}

- (NTKUltraCubeColorPalette)palette
{
  return self->_palette;
}

- (void)setPalette:(id)a3
{
}

- (void).cxx_destruct
{
}

@end