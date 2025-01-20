@interface MTStylingProvidingSolidColorView
+ (Class)layerClass;
- (BOOL)isHighlighted;
- (NSMutableDictionary)stylingProviders;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setStylingProviders:(id)a3;
@end

@implementation MTStylingProvidingSolidColorView

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    highlightView = self->_highlightView;
    if (!highlightView)
    {
      id v5 = objc_alloc(MEMORY[0x263F1CB60]);
      [(MTStylingProvidingSolidColorView *)self bounds];
      v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
      v7 = self->_highlightView;
      self->_highlightView = v6;

      [(UIView *)self->_highlightView setUserInteractionEnabled:0];
      [(UIView *)self->_highlightView setAutoresizingMask:18];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __51__MTStylingProvidingSolidColorView_setHighlighted___block_invoke;
      v9[3] = &unk_2642569C0;
      v9[4] = self;
      [MEMORY[0x263F1CB60] performWithoutAnimation:v9];
      highlightView = self->_highlightView;
      *(_DWORD *)&a3 = self->_highlighted;
    }
    double v8 = 1.0;
    if (!a3) {
      double v8 = 0.0;
    }
    [(UIView *)highlightView setAlpha:v8];
  }
}

void __51__MTStylingProvidingSolidColorView_setHighlighted___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) layer];
  [v6 cornerRadius];
  if (v2 > 0.0)
  {
    v3 = [*(id *)(*(void *)(a1 + 32) + 408) layer];
    [v6 cornerRadius];
    objc_msgSend(v3, "setCornerRadius:");
    v4 = [v6 cornerCurve];
    [v3 setCornerCurve:v4];
  }
  [*(id *)(a1 + 32) insertSubview:*(void *)(*(void *)(a1 + 32) + 408) atIndex:0];
  id v5 = [*(id *)(a1 + 32) visualStylingProviderForCategory:2];
  [v5 automaticallyUpdateView:*(void *)(*(void *)(a1 + 32) + 408) withStyle:4 andObserverBlock:&__block_literal_global_2];

  [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:0.0];
}

id __51__MTStylingProvidingSolidColorView_setHighlighted___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 alpha];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__MTStylingProvidingSolidColorView_setHighlighted___block_invoke_3;
  v6[3] = &__block_descriptor_40_e36_v24__0__MTVisualStylingProvider_8_16l;
  v6[4] = v3;
  v4 = (void *)MEMORY[0x2166C1FA0](v6);

  return v4;
}

uint64_t __51__MTStylingProvidingSolidColorView_setHighlighted___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setAlpha:*(double *)(a1 + 32)];
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  stylingProviders = self->_stylingProviders;
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  v7 = [(NSMutableDictionary *)stylingProviders objectForKey:v6];

  if (!v7)
  {
    double v8 = [(MTStylingProvidingSolidColorView *)self _stylingProvidingSolidColorLayer];
    v9 = MTCoreMaterialVisualStyleCategoryForVisualStyleCategory(a3);
    v10 = [v8 visualStylingProviderForCategory:v9];

    v7 = [[MTVisualStylingProvider alloc] initWithCoreMaterialVisualStylingProvider:v10];
    v11 = self->_stylingProviders;
    if (!v11)
    {
      v12 = (NSMutableDictionary *)objc_opt_new();
      v13 = self->_stylingProviders;
      self->_stylingProviders = v12;

      v11 = self->_stylingProviders;
    }
    v14 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v11 setObject:v7 forKey:v14];
  }

  return v7;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (NSMutableDictionary)stylingProviders
{
  return self->_stylingProviders;
}

- (void)setStylingProviders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylingProviders, 0);

  objc_storeStrong((id *)&self->_highlightView, 0);
}

@end