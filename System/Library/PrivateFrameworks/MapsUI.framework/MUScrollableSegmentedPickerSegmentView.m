@interface MUScrollableSegmentedPickerSegmentView
- (MUScrollableSegmentedPickerCategory)viewModel;
- (MUScrollableSegmentedPickerSegmentView)initWithFrame:(CGRect)a3;
- (void)_setupLabel;
- (void)_updateAppearance;
- (void)_updateFont;
- (void)_updateSelectionAppearance;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setViewModel:(id)a3;
@end

@implementation MUScrollableSegmentedPickerSegmentView

- (MUScrollableSegmentedPickerSegmentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUScrollableSegmentedPickerSegmentView;
  v3 = -[MUScrollableSegmentedPickerSegmentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUScrollableSegmentedPickerSegmentView *)v3 _setupLabel];
    [(MUScrollableSegmentedPickerSegmentView *)v4 _updateSelectionAppearance];
  }
  return v4;
}

- (void)_setupLabel
{
  v11[1] = *MEMORY[0x1E4F143B8];
  [(MUScrollableSegmentedPickerSegmentView *)self setClipsToBounds:1];
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  label = self->_label;
  self->_label = v4;

  [(MUScrollableSegmentedPickerSegmentView *)self _updateFont];
  [(MUScrollableSegmentedPickerSegmentView *)self addSubview:self->_label];
  objc_super v6 = [[MUEdgeLayout alloc] initWithItem:self->_label container:self];
  edgeLayout = self->_edgeLayout;
  self->_edgeLayout = v6;

  -[MUEdgeLayout setInsets:](self->_edgeLayout, "setInsets:", 8.0, 16.0, 8.0, 16.0);
  [(MUConstraintLayout *)self->_edgeLayout activate];
  v8 = self;
  v11[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v10 = (id)[(MUScrollableSegmentedPickerSegmentView *)self registerForTraitChanges:v9 withAction:sel__updateFont];
}

- (void)setViewModel:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_viewModel] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(MUScrollableSegmentedPickerSegmentView *)self _updateAppearance];
  }
}

- (void)_updateAppearance
{
  id v3 = [(MUScrollableSegmentedPickerCategory *)self->_viewModel categoryName];
  [(UILabel *)self->_label setText:v3];

  id v4 = [(MUScrollableSegmentedPickerCategory *)self->_viewModel categoryName];
  [(MUScrollableSegmentedPickerSegmentView *)self setAccessibilityLabel:v4];
}

- (void)_updateFont
{
  objc_msgSend(MEMORY[0x1E4FB08E0], "_mapsui_preferredFontForTextStyle:maxContentSizeCategory:weight:withSymbolicTraits:", *MEMORY[0x1E4FB2908], *MEMORY[0x1E4FB27B8], 0, *MEMORY[0x1E4FB09E0]);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_label setFont:v3];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MUScrollableSegmentedPickerSegmentView;
  [(MUScrollableSegmentedPickerSegmentView *)&v4 setSelected:a3];
  [(MUScrollableSegmentedPickerSegmentView *)self _updateSelectionAppearance];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MUScrollableSegmentedPickerSegmentView;
  [(MUScrollableSegmentedPickerSegmentView *)&v4 setHighlighted:a3];
  [(MUScrollableSegmentedPickerSegmentView *)self _updateSelectionAppearance];
}

- (void)_updateSelectionAppearance
{
  if ([(MUScrollableSegmentedPickerSegmentView *)self isSelected]) {
    [MEMORY[0x1E4FB1618] systemWhiteColor];
  }
  else {
  id v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  if ([(MUScrollableSegmentedPickerSegmentView *)self isHighlighted])
  {
    uint64_t v3 = [v5 colorWithAlphaComponent:0.300000012];

    id v4 = (id)v3;
  }
  else
  {
    id v4 = v5;
  }
  id v6 = v4;
  [(UILabel *)self->_label setTextColor:v4];
}

- (MUScrollableSegmentedPickerCategory)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_edgeLayout, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end