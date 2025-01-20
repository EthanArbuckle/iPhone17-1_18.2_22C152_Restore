@interface MRUEqualizerView
- (BOOL)isAnimating;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRUEqualizerView)initWithNumberOfBars:(unint64_t)a3 width:(double)a4 spacing:(double)a5;
- (MRUVisualStylingProvider)stylingProvider;
- (NSArray)barViews;
- (double)spacing;
- (double)width;
- (int64_t)visualStyle;
- (void)layoutSubviews;
- (void)setAnimating:(BOOL)a3;
- (void)setBarViews:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setSpacing:(double)a3;
- (void)setStylingProvider:(id)a3;
- (void)setVisualStyle:(int64_t)a3;
- (void)setWidth:(double)a3;
- (void)startAnimating;
- (void)stopAnimating;
- (void)updateBarHeights;
- (void)updateVisualStyling;
@end

@implementation MRUEqualizerView

- (MRUEqualizerView)initWithNumberOfBars:(unint64_t)a3 width:(double)a4 spacing:(double)a5
{
  v17.receiver = self;
  v17.super_class = (Class)MRUEqualizerView;
  v8 = [(MRUEqualizerView *)&v17 init];
  v9 = v8;
  if (v8)
  {
    v8->_width = a4;
    v8->_spacing = a5;
    v8->_visualStyle = 0;
    for (i = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      v12 = [v11 layer];
      objc_msgSend(v12, "setAnchorPoint:", 0.5, 1.0);

      v13 = [v11 layer];
      [v13 setCornerRadius:1.0];

      [(MRUEqualizerView *)v9 addSubview:v11];
      [i addObject:v11];
    }
    uint64_t v14 = [i copy];
    barViews = v9->_barViews;
    v9->_barViews = (NSArray *)v14;
  }
  return v9;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MRUEqualizerView;
  [(MRUEqualizerView *)&v3 layoutSubviews];
  if (!self->_animating) {
    [(MRUEqualizerView *)self updateBarHeights];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MRUEqualizerView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)MRUEqualizerView;
  -[MRUEqualizerView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  if (self->_animating)
  {
    [(MRUEqualizerView *)self bounds];
    if (v13 != v9 || v12 != v11) {
      [(MRUEqualizerView *)self startAnimating];
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  unint64_t v5 = [(NSArray *)self->_barViews count];
  double v6 = self->_spacing * (double)(v5 - 1);
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  double v7 = v6 + (double)v5 * self->_width;
  double v8 = height;
  result.CGFloat height = v8;
  result.double width = v7;
  return result;
}

- (void)setAnimating:(BOOL)a3
{
  if (self->_animating != a3)
  {
    self->_animating = a3;
    if (a3) {
      [(MRUEqualizerView *)self startAnimating];
    }
    else {
      [(MRUEqualizerView *)self stopAnimating];
    }
  }
}

- (void)setStylingProvider:(id)a3
{
  unint64_t v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    double v7 = v5;
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRUEqualizerView *)self updateVisualStyling];
    unint64_t v5 = v7;
  }
}

- (void)setVisualStyle:(int64_t)a3
{
  if (self->_visualStyle != a3)
  {
    self->_visualStyle = a3;
    [(MRUEqualizerView *)self updateVisualStyling];
  }
}

- (void)updateVisualStyling
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = self->_barViews;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", self->_visualStyle, *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)updateBarHeights
{
  BOOL animating = self->_animating;
  [(MRUEqualizerView *)self bounds];
  double Height = CGRectGetHeight(v7);
  barViews = self->_barViews;
  v6[1] = 3221225472;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[2] = __36__MRUEqualizerView_updateBarHeights__block_invoke;
  v6[3] = &unk_1E5F0E7E8;
  if (!animating) {
    double Height = Height * 0.3;
  }
  v6[4] = self;
  *(double *)&v6[5] = Height;
  [(NSArray *)barViews enumerateObjectsUsingBlock:v6];
}

void __36__MRUEqualizerView_updateBarHeights__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v4 = *(double **)(a1 + 32);
  double v5 = (v4[54] + v4[55]) * (double)a3;
  id v6 = a2;
  [v4 bounds];
  objc_msgSend(v6, "setFrame:", v5, CGRectGetHeight(v8) - *(double *)(a1 + 40), *(double *)(*(void *)(a1 + 32) + 432));
}

- (void)startAnimating
{
  [(MRUEqualizerView *)self updateBarHeights];
  barViews = self->_barViews;

  [(NSArray *)barViews enumerateObjectsUsingBlock:&__block_literal_global_19];
}

void __34__MRUEqualizerView_startAnimating__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  id v9 = objc_alloc_init(MEMORY[0x1E4F39BD8]);
  long long v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v6, v8 * 7.0 / 12.0);
  v18[0] = v10;
  long long v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v6, v8);
  v18[1] = v11;
  double v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v6, v8 * 5.0 / 12.0);
  v18[2] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  [v9 setValues:v13];

  [v9 setKeyPath:@"bounds"];
  [v9 setKeyTimes:&unk_1F069F2C0];
  [v9 setDuration:2.0];
  *(float *)&double v14 = (float)a3 + 1.0;
  [v9 setSpeed:v14];
  LODWORD(v15) = 2139095040;
  [v9 setRepeatCount:v15];
  v16 = [v4 layer];

  objc_super v17 = objc_msgSend(NSString, "stringWithFormat:", @"BarAnimation_%ld", a3 + 1);
  [v16 addAnimation:v9 forKey:v17];
}

- (void)stopAnimating
{
  [(MRUEqualizerView *)self updateBarHeights];
  barViews = self->_barViews;

  [(NSArray *)barViews enumerateObjectsUsingBlock:&__block_literal_global_19_0];
}

void __33__MRUEqualizerView_stopAnimating__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v4 = a2;
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  id v18 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  id v9 = (void *)MEMORY[0x1E4F29238];
  long long v10 = [v4 layer];
  long long v11 = [v10 presentationLayer];
  [v11 bounds];
  double v12 = objc_msgSend(v9, "valueWithCGRect:");
  [v18 setFromValue:v12];

  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v6, v8);
  [v18 setToValue:v13];

  [v18 setKeyPath:@"bounds"];
  [v18 setDuration:0.25];
  *(float *)&double v14 = (float)a3 + 1.0;
  [v18 setSpeed:v14];
  LODWORD(v15) = 1.0;
  [v18 setRepeatCount:v15];
  v16 = [v4 layer];

  objc_super v17 = objc_msgSend(NSString, "stringWithFormat:", @"BarAnimation_%ld", a3 + 1);
  [v16 addAnimation:v18 forKey:v17];
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (NSArray)barViews
{
  return self->_barViews;
}

- (void)setBarViews:(id)a3
{
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_double width = a3;
}

- (double)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
}

- (int64_t)visualStyle
{
  return self->_visualStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barViews, 0);

  objc_storeStrong((id *)&self->_stylingProvider, 0);
}

@end