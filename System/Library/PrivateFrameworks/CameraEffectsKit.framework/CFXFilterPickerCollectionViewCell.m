@interface CFXFilterPickerCollectionViewCell
+ (UIColor)selectionColor;
- (BOOL)isInCompactMode;
- (UILabel)titleView;
- (UIView)selectionView;
- (void)CFX_updateLayerProperties;
- (void)CFX_updateSelectionView;
- (void)CFX_updateTitle;
- (void)configureCellAppearence;
- (void)prepareForReuse;
- (void)setCompactMode:(BOOL)a3;
- (void)setEffect:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionView:(id)a3;
- (void)setTitleView:(id)a3;
@end

@implementation CFXFilterPickerCollectionViewCell

- (void)configureCellAppearence
{
  [(CFXFilterPickerCollectionViewCell *)self CFX_updateLayerProperties];
  v3 = [(CFXFilterPickerCollectionViewCell *)self selectionView];
  [v3 setAlpha:0.0];

  if ([(CFXFilterPickerCollectionViewCell *)self isInCompactMode])
  {
    id v4 = [(CFXFilterPickerCollectionViewCell *)self titleView];
    [v4 setAlpha:0.0];
  }
}

+ (UIColor)selectionColor
{
  if (selectionColor_onceToken != -1) {
    dispatch_once(&selectionColor_onceToken, &__block_literal_global_52);
  }
  v2 = (void *)selectionColor_selectionColor;
  return (UIColor *)v2;
}

uint64_t __51__CFXFilterPickerCollectionViewCell_selectionColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F1C550] systemYellowColor];
  uint64_t v1 = selectionColor_selectionColor;
  selectionColor_selectionColor = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)CFXFilterPickerCollectionViewCell;
  [(CFXEffectPickerCollectionViewCell *)&v6 prepareForReuse];
  v3 = [(CFXFilterPickerCollectionViewCell *)self selectionView];
  [v3 setAlpha:0.0];

  id v4 = [(CFXFilterPickerCollectionViewCell *)self titleView];
  [v4 setText:0];

  if ([(CFXFilterPickerCollectionViewCell *)self isInCompactMode])
  {
    v5 = [(CFXFilterPickerCollectionViewCell *)self titleView];
    [v5 setAlpha:0.0];
  }
}

- (void)setEffect:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CFXFilterPickerCollectionViewCell;
  [(CFXEffectPickerCollectionViewCell *)&v4 setEffect:a3];
  [(CFXFilterPickerCollectionViewCell *)self CFX_updateTitle];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CFXFilterPickerCollectionViewCell;
  [(CFXFilterPickerCollectionViewCell *)&v4 setSelected:a3];
  [(CFXFilterPickerCollectionViewCell *)self CFX_updateSelectionView];
  [(CFXFilterPickerCollectionViewCell *)self CFX_updateTitle];
}

- (void)setCompactMode:(BOOL)a3
{
  self->_compactMode = a3;
  [(CFXFilterPickerCollectionViewCell *)self CFX_updateLayerProperties];
  [(CFXFilterPickerCollectionViewCell *)self CFX_updateTitle];
  [(CFXFilterPickerCollectionViewCell *)self CFX_updateSelectionView];
}

- (void)CFX_updateLayerProperties
{
  BOOL v3 = [(CFXFilterPickerCollectionViewCell *)self isInCompactMode];
  objc_super v4 = (uint64_t *)&kCompactFilterPickerCellContentCornerRadius;
  if (!v3) {
    objc_super v4 = &kDefaultEffectPickerCellContentCornerRadius;
  }
  double v5 = *(double *)v4;
  objc_super v6 = [(CFXEffectPickerCollectionViewCell *)self imageView];
  v7 = [v6 layer];
  [v7 setCornerRadius:v5];

  v8 = [(CFXFilterPickerCollectionViewCell *)self selectionView];
  v9 = [v8 layer];
  [v9 setBorderWidth:3.0];

  v10 = [(CFXFilterPickerCollectionViewCell *)self selectionView];
  v11 = [v10 layer];
  [v11 setCornerRadius:12.0];

  v12 = [(CFXFilterPickerCollectionViewCell *)self selectionView];
  [v12 setClipsToBounds:1];

  id v16 = +[CFXFilterPickerCollectionViewCell selectionColor];
  uint64_t v13 = [v16 CGColor];
  v14 = [(CFXFilterPickerCollectionViewCell *)self selectionView];
  v15 = [v14 layer];
  [v15 setBorderColor:v13];
}

- (void)CFX_updateSelectionView
{
  double v3 = 0.0;
  if (![(CFXFilterPickerCollectionViewCell *)self isInCompactMode]) {
    double v3 = (double)[(CFXFilterPickerCollectionViewCell *)self isSelected];
  }
  id v4 = [(CFXFilterPickerCollectionViewCell *)self selectionView];
  [v4 setAlpha:v3];
}

- (void)CFX_updateTitle
{
  int v3 = [(CFXFilterPickerCollectionViewCell *)self isSelected];
  id v4 = [(CFXEffectPickerCollectionViewCell *)self effect];
  double v5 = [v4 localizedTitle];
  objc_super v6 = [(CFXFilterPickerCollectionViewCell *)self titleView];
  [v6 setText:v5];

  if (v3) {
    [(id)objc_opt_class() selectionColor];
  }
  else {
  v7 = [MEMORY[0x263F1C550] whiteColor];
  }
  v8 = [(CFXFilterPickerCollectionViewCell *)self titleView];
  [v8 setTextColor:v7];

  double v9 = (double)([(CFXFilterPickerCollectionViewCell *)self isInCompactMode] ^ 1);
  id v10 = [(CFXFilterPickerCollectionViewCell *)self titleView];
  [v10 setAlpha:v9];
}

- (BOOL)isInCompactMode
{
  return self->_compactMode;
}

- (UILabel)titleView
{
  return (UILabel *)objc_getProperty(self, a2, 672, 1);
}

- (void)setTitleView:(id)a3
{
}

- (UIView)selectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionView);
  return (UIView *)WeakRetained;
}

- (void)setSelectionView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_selectionView);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end