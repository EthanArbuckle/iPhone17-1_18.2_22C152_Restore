@interface CSAdjunctItemView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeToMimic;
- (CSAdjunctItemHosting)contentHost;
- (CSAdjunctItemView)initWithRecipe:(int64_t)a3;
- (NSString)description;
- (NSString)materialGroupNameBase;
- (PLPlatterView)platterView;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_setPlatterView:(id)a3;
- (void)_updateSizeToMimic;
- (void)layoutSubviews;
- (void)setContentHost:(id)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setSizeToMimic:(CGSize)a3;
@end

@implementation CSAdjunctItemView

- (CSAdjunctItemView)initWithRecipe:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSAdjunctItemView;
  v4 = [(CSAdjunctItemView *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_recipe = a3;
    [(CSAdjunctItemView *)v4 setClipsToBounds:1];
  }
  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentHost);
  [WeakRetained preferredContentSize];
  double v7 = v6;

  id v8 = objc_loadWeakRetained((id *)&self->_platterView);
  objc_msgSend(v8, "sizeThatFitsContentWithSize:", width, v7);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.double width = v13;
  return result;
}

- (CGSize)intrinsicContentSize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentHost);
  [WeakRetained preferredContentSize];
  double v5 = v4;

  id v6 = objc_loadWeakRetained((id *)&self->_platterView);
  objc_msgSend(v6, "sizeThatFitsContentWithSize:", self->_sizeToMimic.width, v5);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  [(CSAdjunctItemView *)self _updateSizeToMimic];
  v3.receiver = self;
  v3.super_class = (Class)CSAdjunctItemView;
  [(CSAdjunctItemView *)&v3 layoutSubviews];
}

- (NSString)description
{
  return (NSString *)[(CSAdjunctItemView *)self descriptionWithMultilinePrefix:0];
}

- (void)setContentHost:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentHost);
  id v6 = WeakRetained;
  if (WeakRetained != v4)
  {
    double v7 = [WeakRetained view];
    [v7 removeFromSuperview];

    objc_storeWeak((id *)&self->_contentHost, v4);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v4 platterView], (double v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      double v9 = v8;
      self->_isContentHostPlatterView = 1;
      [v8 _setContinuousCornerRadius:18.0];
      [(CSAdjunctItemView *)self _setPlatterView:v9];
    }
    else
    {
      self->_isContentHostPlatterView = 0;
      double v9 = (void *)[objc_alloc(MEMORY[0x1E4F91460]) initWithRecipe:self->_recipe];
      if (objc_opt_respondsToSelector()) {
        uint64_t v10 = [v4 usesBackgroundView];
      }
      else {
        uint64_t v10 = 1;
      }
      [v9 setUsesBackgroundView:v10];
      [v9 setMaterialGroupNameBase:self->_materialGroupNameBase];
      [v9 _setContinuousCornerRadius:18.0];
      [(CSAdjunctItemView *)self _setPlatterView:v9];
      if (objc_opt_respondsToSelector())
      {
        [v9 _continuousCornerRadius];
        objc_msgSend(v4, "setContainerCornerRadius:");
      }
      double v11 = [v9 customContentView];
      double v12 = [v4 view];
      [v11 addSubview:v12];

      if (objc_opt_respondsToSelector())
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        double v13 = objc_msgSend(v4, "requiredVisualStyleCategories", 0);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v21;
          do
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v21 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = [*(id *)(*((void *)&v20 + 1) + 8 * v17) integerValue];
              v19 = [v9 visualStylingProviderForCategory:v18];
              [v4 setVisualStylingProvider:v19 forCategory:v18];

              ++v17;
            }
            while (v15 != v17);
            uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v15);
        }
      }
    }

    [(CSAdjunctItemView *)self invalidateIntrinsicContentSize];
    [(CSAdjunctItemView *)self setNeedsLayout];
  }
}

- (void)setSizeToMimic:(CGSize)a3
{
  if (self->_sizeToMimic.width != a3.width || self->_sizeToMimic.height != a3.height)
  {
    self->_sizeToMimic = a3;
    [(CSAdjunctItemView *)self _updateSizeToMimic];
    [(CSAdjunctItemView *)self invalidateIntrinsicContentSize];
    [(CSAdjunctItemView *)self setNeedsLayout];
  }
}

- (void)setMaterialGroupNameBase:(id)a3
{
  p_materialGroupNameBase = &self->_materialGroupNameBase;
  id v7 = a3;
  if (([v7 isEqualToString:*p_materialGroupNameBase] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
    if (!self->_isContentHostPlatterView)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_platterView);
      [WeakRetained setMaterialGroupNameBase:*p_materialGroupNameBase];
    }
  }
}

- (id)succinctDescription
{
  v2 = [(CSAdjunctItemView *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(CSAdjunctItemView *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(CSAdjunctItemView *)self succinctDescriptionBuilder];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platterView);
  id v6 = (id)[v4 appendObject:WeakRetained withName:@"platterView"];

  id v7 = MTStringFromMaterialRecipe();
  [v4 appendString:v7 withName:@"materialRecipe"];

  id v8 = (id)[v4 appendObject:self->_materialGroupNameBase withName:@"materialGroupBaseName"];
  id v9 = objc_loadWeakRetained((id *)&self->_contentHost);
  id v10 = (id)[v4 appendObject:v9 withName:@"contentHost"];

  id v11 = (id)[v4 appendBool:self->_isContentHostPlatterView withName:@"isContentHostPlatterView"];
  id v12 = (id)objc_msgSend(v4, "appendSize:withName:", @"sizeToMimic", self->_sizeToMimic.width, self->_sizeToMimic.height);

  return v4;
}

- (void)_updateSizeToMimic
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentHost);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(WeakRetained, "setContainerSize:", self->_sizeToMimic.width, self->_sizeToMimic.height);
  }
}

- (void)_setPlatterView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platterView);
  if (WeakRetained != obj)
  {
    [WeakRetained removeFromSuperview];
    objc_storeWeak((id *)&self->_platterView, obj);
    [(CSAdjunctItemView *)self bounds];
    objc_msgSend(obj, "setFrame:");
    [(CSAdjunctItemView *)self addSubview:obj];
    [obj setAutoresizingMask:18];
  }
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (CGSize)sizeToMimic
{
  double width = self->_sizeToMimic.width;
  double height = self->_sizeToMimic.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CSAdjunctItemHosting)contentHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentHost);

  return (CSAdjunctItemHosting *)WeakRetained;
}

- (PLPlatterView)platterView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platterView);

  return (PLPlatterView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_platterView);
  objc_destroyWeak((id *)&self->_contentHost);

  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
}

@end