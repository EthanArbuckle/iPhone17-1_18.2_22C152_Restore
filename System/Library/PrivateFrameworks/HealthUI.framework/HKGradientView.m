@interface HKGradientView
+ (Class)layerClass;
+ (id)hk_verticalWaveformMaskGradientWithInsetLocation:(double)a3;
- (HKGradient)gradient;
- (HKGradientView)initWithGradient:(id)a3;
- (void)_updateGradientLayer;
- (void)maskAllCornersWithRadius:(double)a3;
- (void)maskCorners:(unint64_t)a3 radius:(double)a4;
- (void)setGradient:(id)a3;
@end

@implementation HKGradientView

- (HKGradientView)initWithGradient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKGradientView;
  v6 = -[HKGradientView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_gradient, a3);
    [(HKGradientView *)v7 _updateGradientLayer];
  }

  return v7;
}

- (void)setGradient:(id)a3
{
  uint64_t v5 = (uint64_t)a3;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v5 = [(id)v5 isEqual:self->_gradient];
    uint64_t v6 = v7;
    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_gradient, a3);
      uint64_t v5 = [(HKGradientView *)self _updateGradientLayer];
      uint64_t v6 = v7;
    }
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (void)maskCorners:(unint64_t)a3 radius:(double)a4
{
  unint64_t v6 = a3 & 0xF;
  uint64_t v7 = [(HKGradientView *)self layer];
  [v7 setCornerRadius:a4];

  id v8 = [(HKGradientView *)self layer];
  [v8 setMaskedCorners:v6];
}

- (void)maskAllCornersWithRadius:(double)a3
{
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)_updateGradientLayer
{
  id v8 = [(HKGradientView *)self layer];
  v3 = [(HKGradientView *)self gradient];
  v4 = [v3 colors];
  uint64_t v5 = objc_msgSend(v4, "hk_map:", &__block_literal_global_42);
  [v8 setColors:v5];

  unint64_t v6 = [(HKGradientView *)self gradient];
  uint64_t v7 = [v6 locations];
  [v8 setLocations:v7];
}

uint64_t __38__HKGradientView__updateGradientLayer__block_invoke(int a1, id a2)
{
  id v2 = a2;
  return [v2 CGColor];
}

- (HKGradient)gradient
{
  return self->_gradient;
}

- (void).cxx_destruct
{
}

+ (id)hk_verticalWaveformMaskGradientWithInsetLocation:(double)a3
{
  v17[4] = *MEMORY[0x1E4F143B8];
  v4 = [HKGradient alloc];
  uint64_t v5 = [MEMORY[0x1E4FB1618] clearColor];
  v17[0] = v5;
  unint64_t v6 = [MEMORY[0x1E4FB1618] blackColor];
  v17[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4FB1618] blackColor];
  v17[2] = v7;
  id v8 = [MEMORY[0x1E4FB1618] clearColor];
  v17[3] = v8;
  objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
  v16[0] = &unk_1F3C22AE0;
  v10 = [NSNumber numberWithDouble:a3];
  v16[1] = v10;
  v11 = [NSNumber numberWithDouble:1.0 - a3];
  v16[2] = v11;
  v16[3] = &unk_1F3C22AF0;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  v13 = [(HKGradient *)v4 initWithColors:v9 locations:v12];

  v14 = [[HKGradientView alloc] initWithGradient:v13];
  return v14;
}

@end