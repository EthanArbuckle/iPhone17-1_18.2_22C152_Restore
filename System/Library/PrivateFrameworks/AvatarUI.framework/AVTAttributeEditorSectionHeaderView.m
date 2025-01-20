@interface AVTAttributeEditorSectionHeaderView
+ (id)reuseIdentifier;
- (AVTAttributeEditorSectionHeaderView)initWithFrame:(CGRect)a3;
- (AVTAttributeEditorSectionHeaderViewDelegate)delegate;
- (AVTAvatarAttributeEditorSectionSupplementalPicker)supplementalPicker;
- (NSString)displayString;
- (UIButton)accessoryButton;
- (UILabel)label;
- (id)chevronImage;
- (void)createAccessoryButtonIfNeeded;
- (void)layoutSubviews;
- (void)setAccessoryButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayString:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSupplementalPicker:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateButtonForSelectedSectionItem;
- (void)updateMenu;
@end

@implementation AVTAttributeEditorSectionHeaderView

+ (id)reuseIdentifier
{
  return @"AVTAttributeRowHeaderView";
}

- (AVTAttributeEditorSectionHeaderView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AVTAttributeEditorSectionHeaderView;
  v3 = -[AVTAttributeEditorSectionHeaderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] clearColor];
    [(AVTAttributeEditorSectionHeaderView *)v3 setBackgroundColor:v4];

    id v5 = objc_alloc(MEMORY[0x263F1C768]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v6;

    [(UILabel *)v3->_label setNumberOfLines:2];
    [(AVTAttributeEditorSectionHeaderView *)v3 addSubview:v3->_label];
  }
  return v3;
}

- (void)createAccessoryButtonIfNeeded
{
  v3 = [(AVTAttributeEditorSectionHeaderView *)self accessoryButton];

  if (!v3)
  {
    v4 = [MEMORY[0x263F1C488] buttonWithType:1];
    [(AVTAttributeEditorSectionHeaderView *)self setAccessoryButton:v4];

    id v5 = [(AVTAttributeEditorSectionHeaderView *)self accessoryButton];
    [v5 setShowsMenuAsPrimaryAction:1];

    uint64_t v6 = [(AVTAttributeEditorSectionHeaderView *)self accessoryButton];
    v7 = [v6 titleLabel];
    [v7 setLineBreakMode:2];

    id v8 = [(AVTAttributeEditorSectionHeaderView *)self accessoryButton];
    [(AVTAttributeEditorSectionHeaderView *)self addSubview:v8];
  }
}

- (void)updateMenu
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v4 = [(AVTAttributeEditorSectionHeaderView *)self supplementalPicker];
  id v5 = [v4 choices];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x263F1C3C0];
        v12 = [v10 localizedName];
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __49__AVTAttributeEditorSectionHeaderView_updateMenu__block_invoke;
        v17[3] = &unk_263FF11B0;
        v17[4] = self;
        v17[5] = v10;
        v13 = [v11 actionWithTitle:v12 image:0 identifier:0 handler:v17];

        if ([v10 isSelected]) {
          [v13 setState:1];
        }
        [v3 addObject:v13];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  v14 = [MEMORY[0x263F1C7A8] menuWithTitle:&stru_26BF058D0 children:v3];
  v15 = [(AVTAttributeEditorSectionHeaderView *)self accessoryButton];
  [v15 setMenu:v14];
}

void __49__AVTAttributeEditorSectionHeaderView_updateMenu__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [v2 supplementalPicker];
  id v5 = [*(id *)(a1 + 32) accessoryButton];
  [v6 sectionHeaderView:v2 didSelectItem:v3 forPicker:v4 sender:v5];
}

- (void)setDisplayString:(id)a3
{
  v4 = (void *)[a3 copy];
  id v5 = [(AVTAttributeEditorSectionHeaderView *)self label];
  [v5 setText:v4];

  id v7 = +[AVTUIFontRepository attributeTitleFont];
  id v6 = [(AVTAttributeEditorSectionHeaderView *)self label];
  [v6 setFont:v7];
}

- (NSString)displayString
{
  v2 = [(AVTAttributeEditorSectionHeaderView *)self label];
  uint64_t v3 = [v2 text];

  return (NSString *)v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVTAttributeEditorSectionHeaderView;
  [(AVTAttributeEditorSectionHeaderView *)&v5 traitCollectionDidChange:a3];
  v4 = [(AVTAttributeEditorSectionHeaderView *)self accessoryButton];

  if (v4) {
    [(AVTAttributeEditorSectionHeaderView *)self updateButtonForSelectedSectionItem];
  }
}

- (void)layoutSubviews
{
  uint64_t v3 = [(AVTAttributeEditorSectionHeaderView *)self label];
  v4 = [v3 font];
  [v4 _scaledValueForValue:18.0];
  double v6 = v5;

  double v7 = fmin(v6, 30.0);
  [(AVTAttributeEditorSectionHeaderView *)self bounds];
  double v8 = CGRectGetMaxY(v20) + 12.0 + v7 * -2.0;
  objc_super v9 = [(AVTAttributeEditorSectionHeaderView *)self accessoryButton];

  if (v9)
  {
    v10 = [(AVTAttributeEditorSectionHeaderView *)self accessoryButton];
    [v10 intrinsicContentSize];
    double v12 = v11;

    [(AVTAttributeEditorSectionHeaderView *)self bounds];
    double v13 = CGRectGetMaxX(v21) - v12 + -20.0;
    if ([(AVTAttributeEditorSectionHeaderView *)self isRTL]) {
      double v13 = 20.0;
    }
    v14 = [(AVTAttributeEditorSectionHeaderView *)self accessoryButton];
    objc_msgSend(v14, "setFrame:", v13, v7, v12, v8);

    double v15 = v12 + 20.0;
  }
  else
  {
    double v15 = 0.0;
  }
  [(AVTAttributeEditorSectionHeaderView *)self bounds];
  double v16 = CGRectGetMaxX(v22) + -40.0 - v15;
  if ([(AVTAttributeEditorSectionHeaderView *)self isRTL]) {
    double v17 = v15 + 20.0;
  }
  else {
    double v17 = 20.0;
  }
  long long v18 = [(AVTAttributeEditorSectionHeaderView *)self label];
  objc_msgSend(v18, "setFrame:", v17, v7, v16, v8);

  v19.receiver = self;
  v19.super_class = (Class)AVTAttributeEditorSectionHeaderView;
  [(AVTAttributeEditorSectionHeaderView *)&v19 layoutSubviews];
}

- (void)setSupplementalPicker:(id)a3
{
  double v5 = (AVTAvatarAttributeEditorSectionSupplementalPicker *)a3;
  p_supplementalPicker = &self->_supplementalPicker;
  if (self->_supplementalPicker != v5)
  {
    objc_super v9 = v5;
    objc_storeStrong((id *)p_supplementalPicker, a3);
    if (v9)
    {
      [(AVTAttributeEditorSectionHeaderView *)self createAccessoryButtonIfNeeded];
      [(AVTAttributeEditorSectionHeaderView *)self updateMenu];
      p_supplementalPicker = (AVTAvatarAttributeEditorSectionSupplementalPicker **)[(AVTAttributeEditorSectionHeaderView *)self updateButtonForSelectedSectionItem];
    }
    else
    {
      double v7 = [(AVTAttributeEditorSectionHeaderView *)self accessoryButton];

      double v5 = 0;
      if (!v7) {
        goto LABEL_7;
      }
      double v8 = [(AVTAttributeEditorSectionHeaderView *)self accessoryButton];
      [v8 removeFromSuperview];

      p_supplementalPicker = (AVTAvatarAttributeEditorSectionSupplementalPicker **)[(AVTAttributeEditorSectionHeaderView *)self setAccessoryButton:0];
    }
    double v5 = v9;
  }
LABEL_7:
  MEMORY[0x270F9A758](p_supplementalPicker, v5);
}

- (void)updateButtonForSelectedSectionItem
{
  v24[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AVTAttributeEditorSectionHeaderView *)self supplementalPicker];
  v4 = [v3 choices];
  unint64_t v5 = [v4 count];

  if (v5 <= 1)
  {
    double v6 = [(AVTAttributeEditorSectionHeaderView *)self accessoryButton];
    [v6 removeFromSuperview];

    [(AVTAttributeEditorSectionHeaderView *)self setAccessoryButton:0];
  }
  double v7 = +[AVTUIFontRepository attributeTitleButtonFont];
  id v8 = objc_alloc(MEMORY[0x263F089B8]);
  objc_super v9 = [(AVTAttributeEditorSectionHeaderView *)self supplementalPicker];
  v10 = [v9 localizedTitle];
  uint64_t v23 = *MEMORY[0x263F1C238];
  v24[0] = v7;
  double v11 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
  double v12 = (void *)[v8 initWithString:v10 attributes:v11];

  id v13 = objc_alloc_init(MEMORY[0x263F1C370]);
  objc_msgSend(v13, "setBounds:", 0.0, 0.0, 4.0, 4.0);
  id v14 = objc_alloc_init(MEMORY[0x263F1C6B0]);
  [v13 setImage:v14];

  double v15 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v13];
  id v16 = objc_alloc_init(MEMORY[0x263F1C370]);
  double v17 = [(AVTAttributeEditorSectionHeaderView *)self chevronImage];
  [v16 setImage:v17];

  long long v18 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v16];
  objc_super v19 = (void *)[v18 mutableCopy];

  if ([(AVTAttributeEditorSectionHeaderView *)self isRTL])
  {
    [v12 insertAttributedString:v19 atIndex:0];
    [v12 insertAttributedString:v15 atIndex:1];
  }
  else
  {
    [v12 appendAttributedString:v15];
    [v12 appendAttributedString:v19];
  }
  uint64_t v20 = *MEMORY[0x263F1C240];
  CGRect v21 = [(AVTAttributeEditorSectionHeaderView *)self tintColor];
  objc_msgSend(v12, "addAttribute:value:range:", v20, v21, 0, objc_msgSend(v12, "length"));

  CGRect v22 = [(AVTAttributeEditorSectionHeaderView *)self accessoryButton];
  [v22 setAttributedTitle:v12 forState:0];

  [(AVTAttributeEditorSectionHeaderView *)self setNeedsLayout];
}

- (id)chevronImage
{
  uint64_t v3 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D260] scale:1];
  v4 = [MEMORY[0x263F1C6B0] systemImageNamed:@"chevron.down" withConfiguration:v3];
  unint64_t v5 = [(AVTAttributeEditorSectionHeaderView *)self tintColor];
  double v6 = [v4 imageWithTintColor:v5];

  return v6;
}

- (AVTAttributeEditorSectionHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTAttributeEditorSectionHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTAvatarAttributeEditorSectionSupplementalPicker)supplementalPicker
{
  return self->_supplementalPicker;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIButton)accessoryButton
{
  return self->_accessoryButton;
}

- (void)setAccessoryButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryButton, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_supplementalPicker, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end