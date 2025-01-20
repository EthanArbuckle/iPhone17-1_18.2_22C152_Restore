@interface AXDynamicTypeImageView
- (AXDynamicTypeImageView)initWithFrame:(CGRect)a3;
- (AXDynamicTypeImageView)initWithImage:(id)a3;
- (AXDynamicTypeImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
- (CGSize)_scaledSizeForSize:(CGSize)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)maximumContentSizeCategory;
- (NSString)minimumContentSizeCategory;
- (UIFontMetrics)fontMetrics;
- (void)_commonInit;
- (void)_traitCollectionDidChange:(id)a3;
- (void)setFontMetrics:(id)a3;
- (void)setMaximumContentSizeCategory:(id)a3;
- (void)setMinimumContentSizeCategory:(id)a3;
@end

@implementation AXDynamicTypeImageView

- (void)_commonInit
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FB17A8] defaultMetrics];
  fontMetrics = self->_fontMetrics;
  self->_fontMetrics = v3;

  v5 = (void *)*MEMORY[0x1E4FB27F0];
  objc_storeStrong((id *)&self->_minimumContentSizeCategory, (id)*MEMORY[0x1E4FB27F0]);
  objc_storeStrong((id *)&self->_maximumContentSizeCategory, v5);
  objc_initWeak(&location, self);
  v11[0] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__AXDynamicTypeImageView__commonInit__block_invoke;
  v8[3] = &unk_1E649C608;
  objc_copyWeak(&v9, &location);
  id v7 = (id)[(AXDynamicTypeImageView *)self registerForTraitChanges:v6 withHandler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __37__AXDynamicTypeImageView__commonInit__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _traitCollectionDidChange:v4];
}

- (AXDynamicTypeImageView)initWithImage:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXDynamicTypeImageView;
  v3 = [(AXDynamicTypeImageView *)&v6 initWithImage:a3];
  id v4 = v3;
  if (v3) {
    [(AXDynamicTypeImageView *)v3 _commonInit];
  }
  return v4;
}

- (AXDynamicTypeImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AXDynamicTypeImageView;
  id v4 = [(AXDynamicTypeImageView *)&v7 initWithImage:a3 highlightedImage:a4];
  v5 = v4;
  if (v4) {
    [(AXDynamicTypeImageView *)v4 _commonInit];
  }
  return v5;
}

- (AXDynamicTypeImageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXDynamicTypeImageView;
  v3 = -[AXDynamicTypeImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(AXDynamicTypeImageView *)v3 _commonInit];
  }
  return v4;
}

- (CGSize)_scaledSizeForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (a3.width >= 0.0 && a3.height >= 0.0)
  {
    objc_super v6 = [(AXDynamicTypeImageView *)self traitCollection];
    objc_super v7 = [v6 preferredContentSizeCategory];

    v8 = [(AXDynamicTypeImageView *)self maximumContentSizeCategory];
    id v9 = AXUIContentSizeCategoryMin(v7, v8);

    v10 = [(AXDynamicTypeImageView *)self minimumContentSizeCategory];
    v11 = AXUIContentSizeCategoryMax(v9, v10);

    v12 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v11];
    v13 = [(AXDynamicTypeImageView *)self fontMetrics];
    [v13 scaledValueForValue:v12 compatibleWithTraitCollection:width];
    double width = v14;
    v15 = [(AXDynamicTypeImageView *)self fontMetrics];
    [v15 scaledValueForValue:v12 compatibleWithTraitCollection:height];
    double height = v16;
  }
  double v17 = width;
  double v18 = height;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v5.receiver = self;
  v5.super_class = (Class)AXDynamicTypeImageView;
  [(AXDynamicTypeImageView *)&v5 intrinsicContentSize];
  -[AXDynamicTypeImageView _scaledSizeForSize:](self, "_scaledSizeForSize:");
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXDynamicTypeImageView;
  -[AXDynamicTypeImageView sizeThatFits:](&v6, sel_sizeThatFits_, a3.width, a3.height);
  -[AXDynamicTypeImageView _scaledSizeForSize:](self, "_scaledSizeForSize:");
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (void)_traitCollectionDidChange:(id)a3
{
  double v4 = [a3 preferredContentSizeCategory];
  double v5 = [(AXDynamicTypeImageView *)self traitCollection];
  objc_super v6 = [v5 preferredContentSizeCategory];
  char v7 = [v4 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    [(AXDynamicTypeImageView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setMinimumContentSizeCategory:(id)a3
{
  double v5 = (NSString *)a3;
  p_minimumContentSizeCategory = &self->_minimumContentSizeCategory;
  if (self->_minimumContentSizeCategory != v5)
  {
    char v7 = v5;
    objc_storeStrong((id *)p_minimumContentSizeCategory, a3);
    p_minimumContentSizeCategory = (NSString **)[(AXDynamicTypeImageView *)self invalidateIntrinsicContentSize];
    double v5 = v7;
  }

  MEMORY[0x1F41817F8](p_minimumContentSizeCategory, v5);
}

- (void)setMaximumContentSizeCategory:(id)a3
{
  double v5 = (NSString *)a3;
  p_maximumContentSizeCategory = &self->_maximumContentSizeCategory;
  if (self->_maximumContentSizeCategory != v5)
  {
    char v7 = v5;
    objc_storeStrong((id *)p_maximumContentSizeCategory, a3);
    p_maximumContentSizeCategory = (NSString **)[(AXDynamicTypeImageView *)self invalidateIntrinsicContentSize];
    double v5 = v7;
  }

  MEMORY[0x1F41817F8](p_maximumContentSizeCategory, v5);
}

- (void)setFontMetrics:(id)a3
{
  double v5 = (UIFontMetrics *)a3;
  p_fontMetrics = &self->_fontMetrics;
  if (self->_fontMetrics != v5)
  {
    char v7 = v5;
    objc_storeStrong((id *)p_fontMetrics, a3);
    p_fontMetrics = (UIFontMetrics **)[(AXDynamicTypeImageView *)self invalidateIntrinsicContentSize];
    double v5 = v7;
  }

  MEMORY[0x1F41817F8](p_fontMetrics, v5);
}

- (UIFontMetrics)fontMetrics
{
  return self->_fontMetrics;
}

- (NSString)minimumContentSizeCategory
{
  return self->_minimumContentSizeCategory;
}

- (NSString)maximumContentSizeCategory
{
  return self->_maximumContentSizeCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_minimumContentSizeCategory, 0);

  objc_storeStrong((id *)&self->_fontMetrics, 0);
}

@end