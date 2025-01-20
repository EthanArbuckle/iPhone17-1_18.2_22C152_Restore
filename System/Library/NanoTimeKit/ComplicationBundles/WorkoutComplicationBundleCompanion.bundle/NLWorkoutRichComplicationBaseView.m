@interface NLWorkoutRichComplicationBaseView
- (CLKMonochromeFilterProvider)filterProvider;
- (NLWorkoutRichComplicationBaseView)initWithFrame:(CGRect)a3;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (id)noActiveWorkoutImage;
- (id)noActiveWorkoutImageName;
- (int64_t)_filterStyle;
- (void)_updateUI;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
- (void)setFilterProvider:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NLWorkoutRichComplicationBaseView

- (NLWorkoutRichComplicationBaseView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NLWorkoutRichComplicationBaseView;
  v3 = -[NLWorkoutRichComplicationBaseView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)CLKUIColoringImageView);
    v5 = [(NLWorkoutRichComplicationBaseView *)v3 noActiveWorkoutImage];
    v6 = (CLKUIColoringImageView *)[v4 initWithImage:v5];
    staticImageView = v3->_staticImageView;
    v3->_staticImageView = v6;

    [(NLWorkoutRichComplicationBaseView *)v3 addSubview:v3->_staticImageView];
    v8 = NLWorkoutNoNonGradientTextColor();
    [(NLWorkoutRichComplicationBaseView *)v3 setTintColor:v8];

    v3->_state = 0;
    [(NLWorkoutRichComplicationBaseView *)v3 _updateUI];
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NLWorkoutRichComplicationBaseView;
  [(NLWorkoutRichComplicationBaseView *)&v3 layoutSubviews];
  [(NLWorkoutRichComplicationBaseView *)self bounds];
  CLKRectGetCenter();
  -[CLKUIColoringImageView setCenter:](self->_staticImageView, "setCenter:");
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  return -[NLWorkoutRichComplicationBaseView initWithFrame:](self, "initWithFrame:", a3, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v10 = [a3 metadata];
  v5 = [v10 objectForKeyedSubscript:@"NLWorkoutComplicationMetadataHasActiveWorkoutKey"];
  unsigned int v6 = [v5 BOOLValue];

  v7 = [v10 objectForKeyedSubscript:@"NLWorkoutComplicationMetadataActiveWorkoutIsPausedKey"];
  unsigned int v8 = [v7 BOOLValue];

  int64_t v9 = 1;
  if (v8) {
    int64_t v9 = 2;
  }
  if (!v6) {
    int64_t v9 = 0;
  }
  if (v9 != self->_state)
  {
    self->_state = v9;
    [(NLWorkoutRichComplicationBaseView *)self _updateUI];
  }
}

- (void)setFilterProvider:(id)a3
{
}

- (int64_t)_filterStyle
{
  v2 = [(NLWorkoutRichComplicationBaseView *)self filterProvider];
  objc_super v3 = [v2 device];
  int v4 = NTKShowGossamerUI();

  if (v4) {
    return 2;
  }
  else {
    return 0;
  }
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v5 = [(NLWorkoutRichComplicationBaseView *)self filterProvider];
  objc_msgSend(v5, "filtersForView:style:fraction:", self, -[NLWorkoutRichComplicationBaseView _filterStyle](self, "_filterStyle"), a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    unsigned int v6 = [(NLWorkoutRichComplicationBaseView *)self layer];
    [v6 setFilters:v7];
  }
}

- (void)updateMonochromeColor
{
  objc_super v3 = [(NLWorkoutRichComplicationBaseView *)self filterProvider];
  objc_msgSend(v3, "filtersForView:style:", self, -[NLWorkoutRichComplicationBaseView _filterStyle](self, "_filterStyle"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    int v4 = [(NLWorkoutRichComplicationBaseView *)self layer];
    [v4 setFilters:v5];
  }
}

- (void)_updateUI
{
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);

  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_filterProvider);

  objc_storeStrong((id *)&self->_staticImageView, 0);
}

- (id)noActiveWorkoutImageName
{
  return &stru_C608;
}

- (id)noActiveWorkoutImage
{
  return 0;
}

@end