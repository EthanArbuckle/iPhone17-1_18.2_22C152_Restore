@interface AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell
+ (double)estimatedTitleSpaceForWidth:(double)a3;
+ (double)estimatedWidthForLabelSize:(CGSize)a3;
+ (id)cellIdentifier;
+ (id)labelFont;
- (AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell)initWithFrame:(CGRect)a3;
- (AVTAvatarAttributeEditorSectionItem)item;
- (UILabel)label;
- (void)layoutSubviews;
- (void)setItem:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell

+ (id)cellIdentifier
{
  return @"AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell";
}

+ (id)labelFont
{
  return +[AVTUIFontRepository multicolorPickerLabelFont];
}

+ (double)estimatedWidthForLabelSize:(CGSize)a3
{
  return a3.width + 20.0;
}

+ (double)estimatedTitleSpaceForWidth:(double)a3
{
  return a3 + -20.0;
}

- (AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell;
  v3 = -[AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v5;

    v7 = [(id)objc_opt_class() labelFont];
    [(UILabel *)v3->_label setFont:v7];

    v8 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [(UILabel *)v3->_label setTextColor:v8];

    v9 = [(AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell *)v3 contentView];
    [v9 addSubview:v3->_label];
  }
  return v3;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell;
  [(AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell *)&v8 layoutSubviews];
  v3 = [(AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell *)self contentView];
  [v3 bounds];
  CGFloat v4 = CGRectGetWidth(v9) + -20.0;
  uint64_t v5 = [(AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell *)self contentView];
  [v5 bounds];
  double Height = CGRectGetHeight(v10);
  v7 = [(AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell *)self label];
  objc_msgSend(v7, "setFrame:", 10.0, 0.0, v4, Height);
}

- (void)setItem:(id)a3
{
  v7 = (AVTAvatarAttributeEditorSectionItem *)a3;
  if (self->_item != v7)
  {
    objc_storeStrong((id *)&self->_item, a3);
    uint64_t v5 = [(AVTAvatarAttributeEditorSectionItem *)v7 localizedName];
    v6 = [(AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell *)self label];
    [v6 setText:v5];

    [(AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell *)self setNeedsLayout];
  }
}

- (AVTAvatarAttributeEditorSectionItem)item
{
  return self->_item;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end