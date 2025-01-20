@interface HKMedicalIDEditorNameAndPhotoCell
+ (BOOL)showsLabelAndValue;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (CGRect)_separatorFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (HKMedicalIDEditorNameAndPhotoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIButton)editPhotoButton;
- (UIButton)editPhotoLabelButton;
- (UIImage)photo;
- (void)_adjustEditPhotoButtonFontSizeIfNecessary;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_largeTextLayoutSubviews;
- (void)_regularLayoutSubviews;
- (void)layoutSubviews;
- (void)setName:(id)a3;
- (void)setPhoto:(id)a3;
@end

@implementation HKMedicalIDEditorNameAndPhotoCell

- (HKMedicalIDEditorNameAndPhotoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v47.receiver = self;
  v47.super_class = (Class)HKMedicalIDEditorNameAndPhotoCell;
  v4 = [(HKMedicalIDEditorMultilineStringCell *)&v47 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
    editPhotoButton = v4->_editPhotoButton;
    v4->_editPhotoButton = v5;

    v7 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
    editPhotoLabelButton = v4->_editPhotoLabelButton;
    v4->_editPhotoLabelButton = v7;

    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    nameBottomSeparator = v4->_nameBottomSeparator;
    v4->_nameBottomSeparator = v9;

    v11 = [(HKMedicalIDEditorMultilineStringCell *)v4 textView];
    [v11 setAutocorrectionType:1];

    v12 = [(HKMedicalIDEditorMultilineStringCell *)v4 textView];
    [v12 setAutocapitalizationType:1];

    v13 = [(HKMedicalIDEditorMultilineStringCell *)v4 textView];
    [v13 setReturnKeyType:9];

    v14 = [(HKMedicalIDEditorMultilineStringCell *)v4 textView];
    [v14 setDelegate:v4];

    v15 = [MEMORY[0x1E4FB1618] labelColor];
    v16 = [(HKMedicalIDEditorMultilineStringCell *)v4 textView];
    [v16 setTextColor:v15];

    v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v18 = [v17 localizedStringForKey:@"name" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [(HKMedicalIDEditorMultilineStringCell *)v4 setPlaceholder:v18];

    -[HKMedicalIDEditorMultilineStringCell setTextViewExtraMargins:](v4, "setTextViewExtraMargins:", 26.0, 58.0, 0.0, 0.0);
    v19 = [MEMORY[0x1E4FB1618] tableSeparatorColor];
    [(UIView *)v4->_nameBottomSeparator setBackgroundColor:v19];

    v20 = [(UIButton *)v4->_editPhotoButton imageView];
    v21 = [v20 layer];
    [v21 setMasksToBounds:1];

    v22 = [(UIButton *)v4->_editPhotoButton imageView];
    [v22 setContentMode:2];

    id v23 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    uint64_t v24 = [v23 CGColor];
    v25 = [(UIButton *)v4->_editPhotoButton layer];
    [v25 setBorderColor:v24];

    v26 = [(UIButton *)v4->_editPhotoButton titleLabel];
    [v26 setTextAlignment:1];

    v27 = [(UIButton *)v4->_editPhotoButton titleLabel];
    [v27 setLineBreakMode:0];

    v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v29 = [v28 localizedStringForKey:@"edit_photo_accessibility" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [(UIButton *)v4->_editPhotoButton setAccessibilityLabel:v29];

    v30 = v4->_editPhotoButton;
    v31 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v32 = [v31 localizedStringForKey:@"add_photo" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [(UIButton *)v30 setTitle:v32 forState:0];

    v33 = v4->_editPhotoButton;
    v34 = HKHealthKeyColor();
    [(UIButton *)v33 setTitleColor:v34 forState:0];

    [(HKMedicalIDEditorNameAndPhotoCell *)v4 _adjustEditPhotoButtonFontSizeIfNecessary];
    [(UIButton *)v4->_editPhotoLabelButton setHidden:1];
    v35 = [(UIButton *)v4->_editPhotoLabelButton titleLabel];
    [v35 setTextAlignment:1];

    v36 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v37 = [v36 localizedStringForKey:@"edit_photo_accessibility" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [(UIButton *)v4->_editPhotoLabelButton setAccessibilityLabel:v37];

    v38 = v4->_editPhotoLabelButton;
    v39 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v40 = [v39 localizedStringForKey:@"edit_photo" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [(UIButton *)v38 setTitle:v40 forState:0];

    v41 = v4->_editPhotoLabelButton;
    v42 = HKHealthKeyColor();
    [(UIButton *)v41 setTitleColor:v42 forState:0];

    v43 = [(HKMedicalIDEditorNameAndPhotoCell *)v4 contentView];
    [v43 addSubview:v4->_editPhotoButton];

    v44 = [(HKMedicalIDEditorNameAndPhotoCell *)v4 contentView];
    [v44 addSubview:v4->_editPhotoLabelButton];

    v45 = [(HKMedicalIDEditorNameAndPhotoCell *)v4 contentView];
    [v45 addSubview:v4->_nameBottomSeparator];

    [(HKMedicalIDEditorNameAndPhotoCell *)v4 _contentSizeCategoryDidChange:0];
  }
  return v4;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKMedicalIDEditorNameAndPhotoCell;
  [(HKMedicalIDEditorMultilineStringCell *)&v6 _contentSizeCategoryDidChange:a3];
  v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  v5 = [(UIButton *)self->_editPhotoLabelButton titleLabel];
  [v5 setFont:v4];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HKMedicalIDEditorNameAndPhotoCell;
  [(HKMedicalIDEditorMultilineStringCell *)&v3 layoutSubviews];
  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory()) {
    [(HKMedicalIDEditorNameAndPhotoCell *)self _largeTextLayoutSubviews];
  }
  else {
    [(HKMedicalIDEditorNameAndPhotoCell *)self _regularLayoutSubviews];
  }
}

- (void)_regularLayoutSubviews
{
  -[HKMedicalIDEditorMultilineStringCell setTextViewExtraMargins:](self, "setTextViewExtraMargins:", 26.0, 58.0, 0.0, 0.0);
  BOOL v3 = [(UIView *)self hk_isLeftToRight];
  v4 = [(HKMedicalIDEditorNameAndPhotoCell *)self contentView];
  [v4 bounds];
  double v6 = v5;

  if (v3) {
    double v7 = 16.0;
  }
  else {
    double v7 = v6 + -60.0 + -16.0;
  }
  v8 = [(HKMedicalIDEditorNameAndPhotoCell *)self photo];

  if (v8)
  {
    v9 = [(UIButton *)self->_editPhotoLabelButton titleLabel];
    [v9 intrinsicContentSize];
    double v11 = v10;
    double v39 = v12;

    v13 = [(UIButton *)self->_editPhotoLabelButton titleLabel];
    v14 = [v13 font];

    [v14 _scaledValueForValue:16.5];
    [v14 ascender];
    uint64_t v15 = 0x404E000000000000;
    if (v3)
    {
      double v16 = 16.0;
      double v17 = 26.0;
    }
    else
    {
      double v17 = 26.0;
      double v16 = v6 + -60.0 + -16.0;
    }
    uint64_t v18 = 0x404E000000000000;
    CGRectGetMidX(*(CGRect *)(&v15 - 2));
    UIRoundToViewScale();
    double v19 = v21;
    v41.size.width = 60.0;
    v41.origin.y = 26.0;
    v41.origin.x = v7;
    v41.size.height = 60.0;
    CGRectGetMaxY(v41);
    UIRoundToViewScale();
    double v20 = v22;
  }
  else
  {
    double v19 = *MEMORY[0x1E4F1DB28];
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v39 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  UIRoundToViewScale();
  double v24 = v23;
  v25 = [(HKMedicalIDEditorMultilineStringCell *)self textView];
  [v25 frame];
  double v27 = v26;

  v28 = [(HKMedicalIDEditorNameAndPhotoCell *)self photo];

  if (v28)
  {
    v29 = [(UIButton *)self->_editPhotoButton layer];
    [v29 setBorderWidth:0.0];

    v30 = [(UIButton *)self->_editPhotoButton layer];
    [v30 setCornerRadius:0.0];

    v31 = [(UIButton *)self->_editPhotoButton imageView];
    v32 = [v31 layer];
    [v32 setCornerRadius:30.0];
  }
  else
  {
    UIRoundToViewScale();
    double v34 = v33;
    v35 = [(UIButton *)self->_editPhotoButton layer];
    [v35 setBorderWidth:v34];

    v31 = [(UIButton *)self->_editPhotoButton layer];
    [v31 setCornerRadius:30.0];
  }

  if (v3) {
    double v36 = v7 + 76.0;
  }
  else {
    double v36 = v7 + -16.0 - (v7 + -16.0);
  }
  if (v3) {
    double v37 = v6 - (v7 + 76.0);
  }
  else {
    double v37 = v7 + -16.0;
  }
  [(UIButton *)self->_editPhotoButton setFrame:v7];
  -[UIButton setFrame:](self->_editPhotoLabelButton, "setFrame:", v19, v20, v11, v39);
  nameBottomSeparator = self->_nameBottomSeparator;
  -[UIView setFrame:](nameBottomSeparator, "setFrame:", v36, v27 - v24 + -4.0 + 26.0, v37, v24);
}

- (void)_largeTextLayoutSubviews
{
  [(HKMedicalIDEditorNameAndPhotoCell *)self _adjustEditPhotoButtonFontSizeIfNecessary];
  double v61 = 0.0;
  -[HKMedicalIDEditorMultilineStringCell setTextViewExtraMargins:](self, "setTextViewExtraMargins:", 26.0, 0.0, 0.0, 0.0);
  BOOL v3 = [(UIView *)self hk_isLeftToRight];
  v4 = [(HKMedicalIDEditorNameAndPhotoCell *)self contentView];
  [v4 bounds];
  double v6 = v5;

  double v60 = v6;
  double v7 = (v6 + -120.0) * 0.5;
  v8 = [(HKMedicalIDEditorNameAndPhotoCell *)self photo];

  if (v8)
  {
    v9 = [(UIButton *)self->_editPhotoLabelButton titleLabel];
    [v9 intrinsicContentSize];
    double v11 = v10;
    double v62 = v12;

    v13 = [(UIButton *)self->_editPhotoLabelButton titleLabel];
    v14 = [v13 font];

    [v14 _scaledValueForValue:16.5];
    [v14 ascender];
    v65.origin.y = 26.0;
    v65.origin.x = (v6 + -120.0) * 0.5;
    v65.size.width = 120.0;
    v65.size.height = 120.0;
    CGRectGetMidX(v65);
    UIRoundToViewScale();
    double v16 = v15;
    v66.origin.y = 26.0;
    v66.origin.x = (v6 + -120.0) * 0.5;
    v66.size.width = 120.0;
    v66.size.height = 120.0;
    CGRectGetMaxY(v66);
    UIRoundToViewScale();
    double v18 = v17;
  }
  else
  {
    double v16 = *MEMORY[0x1E4F1DB28];
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v62 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v19 = [(HKMedicalIDEditorMultilineStringCell *)self textView];
  [v19 frame];
  double v21 = v20;
  double v23 = v22;
  CGFloat v25 = v24;

  uint64_t v26 = [(HKMedicalIDEditorNameAndPhotoCell *)self photo];
  double v27 = (void *)v26;
  double v58 = v18;
  double v59 = v16;
  if (v26) {
    double v28 = v16;
  }
  else {
    double v28 = v7;
  }
  if (v26) {
    double v29 = v18;
  }
  else {
    double v29 = 26.0;
  }
  double v30 = 120.0;
  if (v26) {
    double v31 = v11;
  }
  else {
    double v31 = 120.0;
  }
  if (v26) {
    double v30 = v62;
  }
  double v32 = CGRectGetMaxY(*(CGRect *)&v28) + 5.0;

  double v33 = [(HKMedicalIDEditorMultilineStringCell *)self placeholderLabel];
  [v33 frame];
  double v54 = v34;
  double v55 = v35;
  double v56 = v36;

  if (v3)
  {
    [(HKMedicalIDEditorNameAndPhotoCell *)self separatorInset];
    double v61 = v37;
  }
  [(HKMedicalIDEditorNameAndPhotoCell *)self separatorInset];
  double v53 = v38;
  double v57 = v25;
  v67.origin.x = v21;
  v67.origin.y = v32;
  v67.size.width = v23;
  v67.size.height = v25;
  double MaxY = CGRectGetMaxY(v67);
  v40 = [(HKMedicalIDEditorMultilineStringCell *)self textView];
  CGRect v41 = [v40 font];
  [v41 lineHeight];
  double v43 = v42;

  v44 = [(HKMedicalIDEditorNameAndPhotoCell *)self photo];

  if (v44)
  {
    v45 = [(UIButton *)self->_editPhotoButton layer];
    [v45 setBorderWidth:0.0];

    v46 = [(UIButton *)self->_editPhotoButton layer];
    [v46 setCornerRadius:0.0];

    objc_super v47 = [(UIButton *)self->_editPhotoButton imageView];
    v48 = [v47 layer];
    [v48 setCornerRadius:60.0];
  }
  else
  {
    UIRoundToViewScale();
    double v50 = v49;
    v51 = [(UIButton *)self->_editPhotoButton layer];
    [v51 setBorderWidth:v50];

    objc_super v47 = [(UIButton *)self->_editPhotoButton layer];
    [v47 setCornerRadius:60.0];
  }

  -[UIButton setFrame:](self->_editPhotoButton, "setFrame:", v7, 26.0, 120.0, 120.0);
  -[UIButton setFrame:](self->_editPhotoLabelButton, "setFrame:", v59, v58, v11, v62);
  -[UIView setFrame:](self->_nameBottomSeparator, "setFrame:", v61, MaxY + -1.0 + v43 * -0.5 + 26.0, v60 - v53, 1.0);
  v52 = [(HKMedicalIDEditorMultilineStringCell *)self textView];
  objc_msgSend(v52, "setFrame:", v21, v32, v23, v57);

  id v63 = [(HKMedicalIDEditorMultilineStringCell *)self placeholderLabel];
  objc_msgSend(v63, "setFrame:", v54, v32, v56, v55);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HKMedicalIDEditorNameAndPhotoCell;
  -[HKMedicalIDEditorMultilineStringCell sizeThatFits:](&v11, sel_sizeThatFits_, a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  [(UIButton *)self->_editPhotoLabelButton frame];
  double v8 = CGRectGetMaxY(v13) + 4.0;
  if (v7 >= v8) {
    double v9 = v7;
  }
  else {
    double v9 = v8;
  }
  double v10 = v5;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)setName:(id)a3
{
  id v4 = (id)[a3 copy];
  [(HKMedicalIDEditorMultilineStringCell *)self setStringValue:v4];
}

- (void)setPhoto:(id)a3
{
  id v11 = a3;
  id v4 = [(HKMedicalIDEditorNameAndPhotoCell *)self photo];

  id v6 = v11;
  if (v4 != v11)
  {
    [(UIButton *)self->_editPhotoButton setImage:v11 forState:0];
    editPhotoButton = self->_editPhotoButton;
    if (v11)
    {
      [(UIButton *)self->_editPhotoButton setTitle:0 forState:0];
      [(UIButton *)self->_editPhotoButton setContentVerticalAlignment:3];
      [(UIButton *)self->_editPhotoButton setContentHorizontalAlignment:3];
    }
    else
    {
      double v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      double v9 = [v8 localizedStringForKey:@"add_photo" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      [(UIButton *)editPhotoButton setTitle:v9 forState:0];

      [(UIButton *)self->_editPhotoButton setContentVerticalAlignment:0];
      [(UIButton *)self->_editPhotoButton setContentHorizontalAlignment:0];
      double v10 = [(UIButton *)self->_editPhotoButton titleLabel];
      [v10 setTextAlignment:1];
    }
    [(UIButton *)self->_editPhotoLabelButton setHidden:v11 == 0];
    uint64_t v5 = [(HKMedicalIDEditorNameAndPhotoCell *)self setNeedsLayout];
    id v6 = v11;
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (UIImage)photo
{
  return [(UIButton *)self->_editPhotoButton imageForState:0];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

+ (BOOL)showsLabelAndValue
{
  return 0;
}

- (void)_adjustEditPhotoButtonFontSizeIfNecessary
{
  v26[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v4 = [v3 localizedStringForKey:@"add_photo" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  BOOL IsUsingAccessibilityContentSizeCategory = HKUIApplicationIsUsingAccessibilityContentSizeCategory();
  double v6 = 1.0;
  if (IsUsingAccessibilityContentSizeCategory) {
    double v6 = 2.0;
  }
  double v7 = v6 * 14.0;
  if (v6 * 14.0 >= 10.0)
  {
    double v8 = v6 * 60.0;
    uint64_t v9 = *MEMORY[0x1E4FB06F8];
    double v24 = v6 * 60.0 * 0.5 * (v6 * 60.0 * 0.5);
    do
    {
      double v10 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:", v7, *(void *)&v24, v9);
      v26[0] = v10;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 1, v11, 0, v8, v8);
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;

      v27.origin.x = v13;
      v27.origin.y = v15;
      v27.size.width = v17;
      v27.size.height = v19;
      CGFloat v20 = CGRectGetWidth(v27) * 0.5;
      v28.origin.x = v13;
      v28.origin.y = v15;
      v28.size.width = v17;
      v28.size.height = v19;
      CGFloat Height = CGRectGetHeight(v28);
      if (v20 * v20 + Height * 0.5 * (Height * 0.5) <= v24) {
        break;
      }
      double v7 = v7 + -0.5;
    }
    while (v7 >= 10.0);
  }
  double v22 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v7];
  double v23 = [(UIButton *)self->_editPhotoButton titleLabel];
  [v23 setFont:v22];
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  if ([v10 length])
  {
    if ([v10 length] != 1)
    {
      uint64_t v21 = 0;
      double v12 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\n+" options:1 error:&v21];
      CGFloat v13 = objc_msgSend(v12, "stringByReplacingMatchesInString:options:range:withTemplate:", v10, 0, 0, objc_msgSend(v10, "length"), @" ");
      double v14 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      CGFloat v15 = [v13 stringByTrimmingCharactersInSet:v14];

      double v16 = [v9 beginningOfDocument];
      CGFloat v17 = [v9 positionFromPosition:v16 offset:location];
      double v18 = [v9 positionFromPosition:v17 offset:length];
      CGFloat v19 = [v9 textRangeFromPosition:v17 toPosition:v18];
      [v9 replaceRange:v19 withText:v15];
      [(HKMedicalIDEditorMultilineStringCell *)self textViewDidChangeSelection:v9];

      goto LABEL_7;
    }
    if ([v10 isEqualToString:@"\n"])
    {
      [v9 resignFirstResponder];
LABEL_7:
      BOOL v11 = 0;
      goto LABEL_8;
    }
  }
  BOOL v11 = 1;
LABEL_8:

  return v11;
}

- (CGRect)_separatorFrame
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIButton)editPhotoButton
{
  return self->_editPhotoButton;
}

- (UIButton)editPhotoLabelButton
{
  return self->_editPhotoLabelButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editPhotoLabelButton, 0);
  objc_storeStrong((id *)&self->_editPhotoButton, 0);
  objc_storeStrong((id *)&self->_nameBottomSeparator, 0);
}

@end