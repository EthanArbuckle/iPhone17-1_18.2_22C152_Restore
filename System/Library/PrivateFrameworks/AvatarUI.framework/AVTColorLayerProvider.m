@interface AVTColorLayerProvider
- (id)providerForColorIntoLayer;
- (id)providerForGradientFromColor;
- (void)renderColorForColorPreset:(id)a3 skinColor:(id)a4 intoLayer:(id)a5;
- (void)renderColorGradientForModelColor:(id)a3 skinColor:(id)a4 handler:(id)a5;
@end

@implementation AVTColorLayerProvider

- (id)providerForColorIntoLayer
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__AVTColorLayerProvider_providerForColorIntoLayer__block_invoke;
  v4[3] = &unk_263FF28F0;
  v4[4] = self;
  v2 = (void *)[v4 copy];
  return v2;
}

uint64_t __50__AVTColorLayerProvider_providerForColorIntoLayer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) renderColorForColorPreset:a2 skinColor:a3 intoLayer:a4];
}

- (id)providerForGradientFromColor
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__AVTColorLayerProvider_providerForGradientFromColor__block_invoke;
  v4[3] = &unk_263FF2918;
  v4[4] = self;
  v2 = (void *)[v4 copy];
  return v2;
}

uint64_t __53__AVTColorLayerProvider_providerForGradientFromColor__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) renderColorGradientForModelColor:a2 skinColor:a3 handler:a4];
}

- (void)renderColorForColorPreset:(id)a3 skinColor:(id)a4 intoLayer:(id)a5
{
}

- (void)renderColorGradientForModelColor:(id)a3 skinColor:(id)a4 handler:(id)a5
{
  v7 = (void (**)(id, void *))a5;
  id v8 = a4;
  id v9 = a3;
  id v17 = [v9 baseColorPreset];
  [v9 rangeMin];
  int v11 = v10;
  [v9 rangeMax];
  int v13 = v12;

  LODWORD(v14) = v11;
  LODWORD(v15) = v13;
  v16 = [v17 gradientLayerWithRangeMin:v8 max:v14 withSkinColor:v15];

  v7[2](v7, v16);
}

@end