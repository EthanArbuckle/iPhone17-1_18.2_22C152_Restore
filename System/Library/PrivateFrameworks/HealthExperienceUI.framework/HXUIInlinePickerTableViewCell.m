@interface HXUIInlinePickerTableViewCell
- (BOOL)expanded;
- (CGRect)_contentLabelFrame;
- (CGRect)_pickerFrame;
- (CGSize)contentLabelHeightForBoundsSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (HXUIInlinePickerTableViewCell)initWithTitle:(id)a3;
- (UIPickerView)pickerView;
- (double)expandedHeight;
- (void)layoutSubviews;
- (void)setDisplayName:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setValue:(id)a3;
@end

@implementation HXUIInlinePickerTableViewCell

- (HXUIInlinePickerTableViewCell)initWithTitle:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F29128] UUID];
  v6 = [v5 UUIDString];

  v19.receiver = self;
  v19.super_class = (Class)HXUIInlinePickerTableViewCell;
  v7 = [(HXUIInlinePickerTableViewCell *)&v19 initWithStyle:0 reuseIdentifier:v6];
  if (v7)
  {
    v8 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    [(HXUIInlinePickerTableViewCell *)v7 setBackgroundColor:v8];

    [(HXUIInlinePickerTableViewCell *)v7 setSelectionStyle:0];
    v9 = objc_alloc_init(HXUIPickerLabelView);
    contentLabel = v7->_contentLabel;
    v7->_contentLabel = v9;

    [(HXUIPickerLabelView *)v7->_contentLabel setText:v4];
    v11 = [(HXUIInlinePickerTableViewCell *)v7 contentView];
    [v11 addSubview:v7->_contentLabel];

    [(HXUIInlinePickerTableViewCell *)v7 _contentLabelFrame];
    -[HXUIPickerLabelView setFrame:](v7->_contentLabel, "setFrame:");
    v12 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E4FB1A98]);
    picker = v7->_picker;
    v7->_picker = v12;

    [(UIPickerView *)v7->_picker setAlpha:0.0];
    v14 = [(HXUIInlinePickerTableViewCell *)v7 contentView];
    [v14 addSubview:v7->_picker];

    [(HXUIInlinePickerTableViewCell *)v7 _pickerFrame];
    -[UIPickerView setFrame:](v7->_picker, "setFrame:");
    v15 = self;
    v20[0] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    id v17 = (id)[(HXUIInlinePickerTableViewCell *)v7 registerForTraitChanges:v16 withHandler:&__block_literal_global];
  }
  return v7;
}

uint64_t __47__HXUIInlinePickerTableViewCell_initWithTitle___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setNeedsLayout];
}

- (CGRect)_contentLabelFrame
{
  [(HXUIInlinePickerTableViewCell *)self bounds];
  double v4 = v3 + -30.0;
  -[HXUIInlinePickerTableViewCell contentLabelHeightForBoundsSize:](self, "contentLabelHeightForBoundsSize:", v3 + -30.0, 10000.0);
  double v6 = v5;
  double v7 = 15.0;
  double v8 = 4.0;
  double v9 = v4;
  result.size.height = v6;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)_pickerFrame
{
  [(HXUIInlinePickerTableViewCell *)self _contentLabelFrame];
  CGFloat MaxY = CGRectGetMaxY(v11);
  [(HXUIInlinePickerTableViewCell *)self bounds];
  double v5 = v4;
  -[UIPickerView sizeThatFits:](self->_picker, "sizeThatFits:", v4, 10000.0);
  double v7 = v6;
  double v8 = 0.0;
  double v9 = MaxY;
  double v10 = v5;
  result.size.height = v7;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HXUIInlinePickerTableViewCell;
  [(HXUIInlinePickerTableViewCell *)&v3 layoutSubviews];
  [(HXUIInlinePickerTableViewCell *)self _contentLabelFrame];
  -[HXUIPickerLabelView setFrame:](self->_contentLabel, "setFrame:");
  [(HXUIInlinePickerTableViewCell *)self _pickerFrame];
  -[UIPickerView setFrame:](self->_picker, "setFrame:");
}

- (UIPickerView)pickerView
{
  return self->_picker;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
  double v5 = 0.0;
  if (a3) {
    double v5 = 1.0;
  }
  [(UIPickerView *)self->_picker setAlpha:v5];
  if (a3) {
    [MEMORY[0x1E4FB1618] systemBlueColor];
  }
  else {
  id v6 = [MEMORY[0x1E4FB1618] labelColor];
  }
  [(HXUIPickerLabelView *)self->_contentLabel setDetailTextColor:v6];
}

- (void)setDisplayName:(id)a3
{
}

- (void)setValue:(id)a3
{
}

- (CGSize)contentLabelHeightForBoundsSize:(CGSize)a3
{
  double v3 = a3.width + -30.0;
  if (v3 < 0.0) {
    double v3 = 0.0;
  }
  -[HXUIPickerLabelView sizeThatFits:](self->_contentLabel, "sizeThatFits:", v3, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[HXUIInlinePickerTableViewCell contentLabelHeightForBoundsSize:](self, "contentLabelHeightForBoundsSize:");
  double v7 = v6;
  double v9 = v8;
  if ([(HXUIInlinePickerTableViewCell *)self expanded])
  {
    -[UIPickerView sizeThatFits:](self->_picker, "sizeThatFits:", width, height);
    double v9 = v9 + v10;
    double v7 = width;
  }
  double v11 = v9 + 8.0;
  double v12 = v7;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (double)expandedHeight
{
  [(HXUIInlinePickerTableViewCell *)self _pickerFrame];
  return CGRectGetMaxY(v3) + 4.0;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_picker, 0);
  objc_storeStrong((id *)&self->_contentLabel, 0);
}

@end