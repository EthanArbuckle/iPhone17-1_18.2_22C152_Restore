@interface BSUIVibrancyView
+ (BOOL)isDisabled;
- (BSUIVibrancyConfiguration)configuration;
- (BSUIVibrancyView)initWithFrame:(CGRect)a3;
- (void)_invalidateFilters;
- (void)_updateFilterViewsIfNeeded;
- (void)layoutSubviews;
- (void)setConfiguration:(id)a3;
@end

@implementation BSUIVibrancyView

+ (BOOL)isDisabled
{
  if (qword_1EB3A3998 != -1) {
    dispatch_once(&qword_1EB3A3998, &__block_literal_global_6);
  }
  return _MergedGlobals_1_0;
}

void __30__BSUIVibrancyView_isDisabled__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  _MergedGlobals_1_0 = [v0 BOOLForKey:@"BSUIVibrancyEffectViewDisabled"];
}

- (BSUIVibrancyView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BSUIVibrancyView;
  v3 = -[BSUIVibrancyView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(BSUIVibrancyConfiguration);
    [(BSUIVibrancyView *)v3 setConfiguration:v4];
  }
  return v3;
}

- (void)setConfiguration:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (BSUIVibrancyConfiguration *)[v6 copy];
    configuration = self->_configuration;
    self->_configuration = v4;

    [(BSUIVibrancyView *)self invalidateSubviews];
    [(BSUIVibrancyView *)self _invalidateFilters];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BSUIVibrancyView;
  [(BSUIVibrancyView *)&v3 layoutSubviews];
  [(BSUIVibrancyView *)self _update];
}

- (void)_invalidateFilters
{
  self->_needsUpdate.effectFilterViews = 1;
  [(BSUIVibrancyView *)self setNeedsLayout];
}

- (void)_updateFilterViewsIfNeeded
{
  if (self->_needsUpdate.effectFilterViews)
  {
    self->_needsUpdate.effectFilterViews = 0;
    [(BSUIVibrancyView *)self updateFilters];
  }
}

- (BSUIVibrancyConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
}

@end