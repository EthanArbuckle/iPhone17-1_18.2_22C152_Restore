@interface MRUCAPackageView
- (BOOL)useColorFilter;
- (CALayer)packageLayer;
- (CAPackage)package;
- (CAStateController)stateController;
- (CATransform3D)permanentTransform;
- (CGSize)intrinsicContentSize;
- (MRUCAPackageAsset)asset;
- (MRUCAPackageView)initWithFrame:(CGRect)a3;
- (NSString)glyphState;
- (NSString)packageName;
- (double)scale;
- (void)clear;
- (void)layoutSubviews;
- (void)mru_applyVisualStylingWithColor:(id)a3 alpha:(double)a4 blendMode:(int64_t)a5;
- (void)mt_applyVisualStyling:(id)a3;
- (void)setAsset:(id)a3;
- (void)setGlyphState:(id)a3;
- (void)setPackage:(id)a3;
- (void)setPackageLayer:(id)a3;
- (void)setPermanentTransform:(CATransform3D *)a3;
- (void)setScale:(double)a3;
- (void)setStateController:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setUseColorFilter:(BOOL)a3;
- (void)updateFilter;
@end

@implementation MRUCAPackageView

- (void)mt_applyVisualStyling:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__MRUCAPackageView_MRUVisualStylingProviderAdditions__mt_applyVisualStyling___block_invoke;
  v3[3] = &unk_1E5F0E7C0;
  v3[4] = self;
  [a3 applyToView:self withColorBlock:v3];
}

uint64_t __77__MRUCAPackageView_MRUVisualStylingProviderAdditions__mt_applyVisualStyling___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setTintColor:a2];
}

- (void)mru_applyVisualStylingWithColor:(id)a3 alpha:(double)a4 blendMode:(int64_t)a5
{
  id v8 = a3;
  [(MRUCAPackageView *)self setAlpha:a4];
  [(MRUCAPackageView *)self _setDrawsAsBackdropOverlayWithBlendMode:a5];
  [(MRUCAPackageView *)self setTintColor:v8];
}

- (MRUCAPackageView)initWithFrame:(CGRect)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)MRUCAPackageView;
  v3 = -[MRUCAPackageView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_scale = 1.0;
    v3->_useColorFilter = 1;
    [(MRUCAPackageView *)v3 setUserInteractionEnabled:0];
    v9[0] = objc_opt_class();
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v6 = (id)[(MRUCAPackageView *)v4 registerForTraitChanges:v5 withAction:sel_updateFilter];
  }
  return v4;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)MRUCAPackageView;
  [(MRUCAPackageView *)&v13 layoutSubviews];
  v3 = [(MRUCAPackageView *)self layer];
  [v3 bounds];
  UIRectGetCenter();
  -[CALayer setPosition:](self->_packageLayer, "setPosition:");

  double scale = self->_scale;
  long long v5 = *(_OWORD *)&self->_permanentTransform.m33;
  *(_OWORD *)&v11.m31 = *(_OWORD *)&self->_permanentTransform.m31;
  *(_OWORD *)&v11.m33 = v5;
  long long v6 = *(_OWORD *)&self->_permanentTransform.m43;
  *(_OWORD *)&v11.m41 = *(_OWORD *)&self->_permanentTransform.m41;
  *(_OWORD *)&v11.m43 = v6;
  long long v7 = *(_OWORD *)&self->_permanentTransform.m13;
  *(_OWORD *)&v11.m11 = *(_OWORD *)&self->_permanentTransform.m11;
  *(_OWORD *)&v11.m13 = v7;
  long long v8 = *(_OWORD *)&self->_permanentTransform.m23;
  *(_OWORD *)&v11.m21 = *(_OWORD *)&self->_permanentTransform.m21;
  *(_OWORD *)&v11.m23 = v8;
  CATransform3DScale(&v12, &v11, scale, scale, 1.0);
  packageLayer = self->_packageLayer;
  CATransform3D v10 = v12;
  [(CALayer *)packageLayer setTransform:&v10];
  [(MRUCAPackageView *)self invalidateIntrinsicContentSize];
}

- (CGSize)intrinsicContentSize
{
  packageLayer = self->_packageLayer;
  if (packageLayer)
  {
    v4 = [(CALayer *)packageLayer valueForKeyPath:@"transform.scale.x"];
    [v4 floatValue];
    double v6 = v5;

    long long v7 = [(CALayer *)self->_packageLayer valueForKeyPath:@"transform.scale.y"];
    [v7 floatValue];
    double v9 = v8;

    [(CALayer *)self->_packageLayer size];
    double v11 = v10 * v6;
    [(CALayer *)self->_packageLayer size];
    double v13 = v12 * v9;
  }
  else
  {
    double v11 = *MEMORY[0x1E4F1DB30];
    double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v14 = v11;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)setAsset:(id)a3
{
  v4 = (MRUCAPackageAsset *)a3;
  float v5 = v4;
  if (v4)
  {
    [(MRUCAPackageAsset *)v4 permanentTransform];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
  }
  v13[4] = v18;
  v13[5] = v19;
  v13[6] = v20;
  v13[7] = v21;
  v13[0] = v14;
  v13[1] = v15;
  v13[2] = v16;
  v13[3] = v17;
  [(MRUCAPackageView *)self setPermanentTransform:v13];
  double v6 = [(MRUCAPackageAsset *)v5 packageName];
  long long v7 = [(MRUCAPackageAsset *)self->_asset packageName];
  char v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    double v9 = [(MRUCAPackageAsset *)v5 package];
    [(MRUCAPackageView *)self setPackage:v9];
  }
  asset = self->_asset;
  self->_asset = v5;
  double v11 = v5;

  double v12 = [(MRUCAPackageAsset *)v11 glyphState];

  [(MRUCAPackageView *)self setGlyphState:v12];
  [(MRUCAPackageView *)self invalidateIntrinsicContentSize];
}

- (void)setGlyphState:(id)a3
{
  v4 = (NSString *)a3;
  float v5 = 0.0;
  if (![(NSString *)self->_glyphState isEqualToString:v4])
  {
    if ([MEMORY[0x1E4FB1EB0] areAnimationsEnabled]) {
      float v5 = 1.0;
    }
    else {
      float v5 = 0.0;
    }
  }
  glyphState = self->_glyphState;
  self->_glyphState = v4;
  long long v7 = v4;

  id v9 = [(CALayer *)self->_packageLayer stateWithName:v7];
  *(float *)&double v8 = v5;
  [(CAStateController *)self->_stateController setState:v9 ofLayer:self->_packageLayer transitionSpeed:v8];
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_double scale = a3;
    [(MRUCAPackageView *)self setNeedsLayout];
  }
}

- (void)setPermanentTransform:(CATransform3D *)a3
{
  p_permanentTransform = &self->_permanentTransform;
  long long v6 = *(_OWORD *)&a3->m33;
  *(_OWORD *)&a.m31 = *(_OWORD *)&a3->m31;
  *(_OWORD *)&a.m33 = v6;
  long long v7 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&a.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&a.m43 = v7;
  long long v8 = *(_OWORD *)&a3->m13;
  *(_OWORD *)&a.m11 = *(_OWORD *)&a3->m11;
  *(_OWORD *)&a.m13 = v8;
  long long v9 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&a.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&a.m23 = v9;
  long long v10 = *(_OWORD *)&self->_permanentTransform.m33;
  *(_OWORD *)&v20.m31 = *(_OWORD *)&self->_permanentTransform.m31;
  *(_OWORD *)&v20.m33 = v10;
  long long v11 = *(_OWORD *)&self->_permanentTransform.m43;
  *(_OWORD *)&v20.m41 = *(_OWORD *)&self->_permanentTransform.m41;
  *(_OWORD *)&v20.m43 = v11;
  long long v12 = *(_OWORD *)&self->_permanentTransform.m13;
  *(_OWORD *)&v20.m11 = *(_OWORD *)&self->_permanentTransform.m11;
  *(_OWORD *)&v20.m13 = v12;
  long long v13 = *(_OWORD *)&self->_permanentTransform.m23;
  *(_OWORD *)&v20.m21 = *(_OWORD *)&self->_permanentTransform.m21;
  *(_OWORD *)&v20.m23 = v13;
  if (!CATransform3DEqualToTransform(&a, &v20))
  {
    long long v14 = *(_OWORD *)&a3->m11;
    long long v15 = *(_OWORD *)&a3->m13;
    long long v16 = *(_OWORD *)&a3->m23;
    *(_OWORD *)&p_permanentTransform->m21 = *(_OWORD *)&a3->m21;
    *(_OWORD *)&p_permanentTransform->m23 = v16;
    *(_OWORD *)&p_permanentTransform->m11 = v14;
    *(_OWORD *)&p_permanentTransform->m13 = v15;
    long long v17 = *(_OWORD *)&a3->m31;
    long long v18 = *(_OWORD *)&a3->m33;
    long long v19 = *(_OWORD *)&a3->m43;
    *(_OWORD *)&p_permanentTransform->m41 = *(_OWORD *)&a3->m41;
    *(_OWORD *)&p_permanentTransform->m43 = v19;
    *(_OWORD *)&p_permanentTransform->m31 = v17;
    *(_OWORD *)&p_permanentTransform->m33 = v18;
    [(MRUCAPackageView *)self setNeedsLayout];
  }
}

- (void)setTintColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRUCAPackageView;
  [(MRUCAPackageView *)&v4 setTintColor:a3];
  [(MRUCAPackageView *)self updateFilter];
}

- (void)setUseColorFilter:(BOOL)a3
{
  if (self->_useColorFilter != a3)
  {
    self->_useColorFilter = a3;
    [(MRUCAPackageView *)self updateFilter];
  }
}

- (void)clear
{
  [(MRUCAPackageView *)self setAsset:0];
  [(MRUCAPackageView *)self setAccessibilityIdentifier:0];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v7[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v7[5] = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v7[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v7[7] = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v7[0] = *MEMORY[0x1E4F39B10];
  v7[1] = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v7[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v7[3] = v6;
  [(MRUCAPackageView *)self setPermanentTransform:v7];
  [(MRUCAPackageView *)self invalidateIntrinsicContentSize];
}

- (void)setPackage:(id)a3
{
  objc_storeStrong((id *)&self->_package, a3);
  id v5 = a3;
  [(CALayer *)self->_packageLayer removeFromSuperlayer];
  long long v6 = [v5 rootLayer];
  -[CALayer setGeometryFlipped:](v6, "setGeometryFlipped:", [v5 isGeometryFlipped]);
  long long v7 = [(MRUCAPackageView *)self layer];
  [v7 addSublayer:v6];

  [(CALayer *)v6 bounds];
  -[MRUCAPackageView setBounds:](self, "setBounds:");
  packageLayer = self->_packageLayer;
  self->_packageLayer = v6;
  long long v9 = v6;

  long long v10 = (CAStateController *)[objc_alloc(MEMORY[0x1E4F39CB0]) initWithLayer:v9];
  stateController = self->_stateController;
  self->_stateController = v10;

  [(MRUCAPackageView *)self setNeedsLayout];
}

- (void)updateFilter
{
  long long v3 = [(MRUCAPackageView *)self layer];
  id v4 = [v3 valueForKeyPath:@"filters.colorFilter"];

  if (v4)
  {
    if (!self->_useColorFilter)
    {
      id v5 = [(MRUCAPackageView *)self layer];
      uint64_t v6 = [v5 filters];
      long long v7 = (void *)v6;
      long long v8 = (void *)MEMORY[0x1E4F1CBF0];
      if (v6) {
        long long v8 = (void *)v6;
      }
      id v9 = v8;

      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __32__MRUCAPackageView_updateFilter__block_invoke;
      v23[3] = &unk_1E5F0F000;
      id v4 = v4;
      id v24 = v4;
      long long v10 = objc_msgSend(v9, "msv_filter:", v23);

      long long v11 = [(MRUCAPackageView *)self layer];
      [v11 setFilters:v10];
    }
  }
  else if (self->_useColorFilter)
  {
    id v4 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A040]];
    [v4 setName:@"colorFilter"];
    [v4 setValue:&unk_1F069F188 forKey:*MEMORY[0x1E4F3A130]];
    [v4 setValue:&unk_1F069F1A0 forKey:*MEMORY[0x1E4F3A100]];
    long long v12 = [(MRUCAPackageView *)self layer];
    uint64_t v13 = [v12 filters];
    long long v14 = (void *)v13;
    long long v15 = (void *)MEMORY[0x1E4F1CBF0];
    if (v13) {
      long long v15 = (void *)v13;
    }
    id v16 = v15;

    long long v17 = [v16 arrayByAddingObject:v4];

    long long v18 = [(MRUCAPackageView *)self layer];
    [v18 setFilters:v17];
  }
  else
  {
    id v4 = 0;
  }
  long long v19 = [(MRUCAPackageView *)self tintColor];
  CATransform3D v20 = [(MRUCAPackageView *)self traitCollection];
  long long v21 = [v19 resolvedColorWithTraitCollection:v20];

  if (v21 && self->_useColorFilter) {
    uint64_t v22 = [v21 CGColor];
  }
  else {
    uint64_t v22 = 0;
  }
  [v4 setValue:v22 forKeyPath:*MEMORY[0x1E4F3A148]];
}

BOOL __32__MRUCAPackageView_updateFilter__block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

- (NSString)packageName
{
  v2 = [(MRUCAPackageView *)self asset];
  long long v3 = [v2 packageName];

  return (NSString *)v3;
}

- (MRUCAPackageAsset)asset
{
  return self->_asset;
}

- (NSString)glyphState
{
  return self->_glyphState;
}

- (double)scale
{
  return self->_scale;
}

- (BOOL)useColorFilter
{
  return self->_useColorFilter;
}

- (CAStateController)stateController
{
  return self->_stateController;
}

- (void)setStateController:(id)a3
{
}

- (CAPackage)package
{
  return self->_package;
}

- (CALayer)packageLayer
{
  return self->_packageLayer;
}

- (void)setPackageLayer:(id)a3
{
}

- (CATransform3D)permanentTransform
{
  long long v3 = *(_OWORD *)&self[4].m21;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[4].m13;
  *(_OWORD *)&retstr->m33 = v3;
  long long v4 = *(_OWORD *)&self[4].m31;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[4].m23;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self[3].m41;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[3].m33;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self[4].m11;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[3].m43;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageLayer, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_glyphState, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

@end