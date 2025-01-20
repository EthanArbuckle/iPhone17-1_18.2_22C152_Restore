@interface MTVisualStyling
- (CAFilter)composedFilter;
- (MTCoreMaterialVisualStyling)_coreMaterialVisualStyling;
- (MTVisualStyling)initWithCoreMaterialVisualStyling:(id)a3;
- (NSString)visualStyleName;
- (NSString)visualStyleSetName;
- (UIColor)color;
- (double)alpha;
- (id)_layerConfig;
- (id)visualEffect;
- (void)applyToView:(id)a3 withColorBlock:(id)a4;
@end

@implementation MTVisualStyling

- (void)applyToView:(id)a3 withColorBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__MTVisualStyling_VisualStylingSupport__applyToView_withColorBlock___block_invoke;
  v12[3] = &unk_264256B88;
  v14 = &v15;
  id v8 = v7;
  v12[4] = self;
  id v13 = v8;
  v9 = (void (**)(void, void))MEMORY[0x2166C1FA0](v12);
  v10 = [(MTVisualStyling *)self _coreMaterialVisualStyling];
  v11 = [v6 layer];
  [v10 _applyToLayer:v11 withColorBlock:v9];

  if (!*((unsigned char *)v16 + 24)) {
    v9[2](v9, 0);
  }

  _Block_object_dispose(&v15, 8);
}

- (MTCoreMaterialVisualStyling)_coreMaterialVisualStyling
{
  return self->_coreMaterialVisualStyling;
}

void __68__MTVisualStyling_VisualStylingSupport__applyToView_withColorBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  if (*(void *)(a1 + 40))
  {
    v4 = [*(id *)(a1 + 32) color];
    v5 = v4;
    if (!a2 || v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [MEMORY[0x263F1C550] colorWithCGColor:a2];
    }
    id v8 = v6;

    id v7 = v8;
    if (v8)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      id v7 = v8;
    }
  }
}

- (UIColor)color
{
  v3 = [(MTCoreMaterialVisualStyling *)self->_coreMaterialVisualStyling tintColorName];
  if (![v3 length]) {
    goto LABEL_7;
  }
  SEL v4 = NSSelectorFromString((NSString *)v3);
  if (!v4) {
    goto LABEL_7;
  }
  SEL v5 = v4;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_7;
  }
  id v6 = [MEMORY[0x263F1C550] performSelector:v5];
  uint64_t v7 = [(MTCoreMaterialVisualStyling *)self->_coreMaterialVisualStyling tintColorUIStyle];
  if (v7 >= 1)
  {
    id v8 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:v7];
    uint64_t v9 = [v6 resolvedColorWithTraitCollection:v8];

    id v6 = (void *)v9;
  }
  if (!v6)
  {
LABEL_7:
    id v6 = objc_msgSend(MEMORY[0x263F1C550], "colorWithCGColor:", -[MTCoreMaterialVisualStyling tintColor](self->_coreMaterialVisualStyling, "tintColor"));
  }

  return (UIColor *)v6;
}

- (MTVisualStyling)initWithCoreMaterialVisualStyling:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTVisualStyling;
  id v6 = [(MTVisualStyling *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_coreMaterialVisualStyling, a3);
  }

  return v7;
}

- (NSString)visualStyleSetName
{
  return (NSString *)[(MTCoreMaterialVisualStyling *)self->_coreMaterialVisualStyling visualStyleSetName];
}

- (NSString)visualStyleName
{
  return (NSString *)[(MTCoreMaterialVisualStyling *)self->_coreMaterialVisualStyling visualStyleName];
}

- (id)_layerConfig
{
  v20[1] = *MEMORY[0x263EF8340];
  id v17 = 0;
  uint64_t v18 = 0;
  [(MTCoreMaterialVisualStyling *)self->_coreMaterialVisualStyling _getCompositingFilter:&v17 tintColor:&v18];
  unint64_t v3 = (unint64_t)v17;
  if (v3 | v18)
  {
    SEL v4 = (void *)MEMORY[0x263F1CD68];
    objc_msgSend(MEMORY[0x263F1C550], "colorWithCGColor:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v4 layerWithTintColor:v5 filterType:v3];
  }
  else
  {
    uint64_t v16 = 0;
    unsigned __int8 v15 = 0;
    coreMaterialVisualStyling = self->_coreMaterialVisualStyling;
    id v14 = 0;
    [(MTCoreMaterialVisualStyling *)coreMaterialVisualStyling _getFilterType:&v14 vibrantColor:&v16 tintColor:&v18 inputReversed:&v15];
    id v5 = v14;
    id v6 = 0;
    if (v5 && v16 && v18)
    {
      id v8 = (void *)MEMORY[0x263F1CD70];
      objc_super v9 = objc_msgSend(MEMORY[0x263F1C550], "colorWithCGColor:");
      v10 = [MEMORY[0x263F1C550] colorWithCGColor:v18];
      v19 = @"inputReversed";
      v11 = [NSNumber numberWithBool:v15];
      v20[0] = v11;
      v12 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      id v6 = [v8 layerWithVibrantColor:v9 tintColor:v10 filterType:v5 filterAttributes:v12];
    }
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (double)alpha
{
  [(MTCoreMaterialVisualStyling *)self->_coreMaterialVisualStyling tintAlpha];
  return result;
}

- (CAFilter)composedFilter
{
  return (CAFilter *)[(MTCoreMaterialVisualStyling *)self->_coreMaterialVisualStyling _composedFilter];
}

- (id)visualEffect
{
  unint64_t v3 = [(MTCoreMaterialVisualStyling *)self->_coreMaterialVisualStyling _composedFilter];
  SEL v4 = [v3 type];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F15DB8]];

  if (v5)
  {
    id v6 = [v3 valueForKey:*MEMORY[0x263F367A8]];
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = (void *)MEMORY[0x263F1CB58];
      [v6 CAColorMatrixValue];
      [(MTVisualStyling *)self alpha];
      objc_msgSend(v8, "_vibrantEffectWithCAColorMatrix:alpha:", &v11);
      objc_super v9 = (_MTVisualStylingVibrancyEffect *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v9 = 0;
    }
  }
  else
  {
    objc_super v9 = [[_MTVisualStylingVibrancyEffect alloc] initWithVisualStyling:self];
  }

  return v9;
}

@end