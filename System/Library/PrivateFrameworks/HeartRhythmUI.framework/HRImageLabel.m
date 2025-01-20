@interface HRImageLabel
- (BOOL)_isTextTallerThanImage;
- (BOOL)boldText;
- (CGSize)imageSize;
- (HRImageLabel)initWithImage:(id)a3 size:(CGSize)a4 text:(id)a5;
- (HRImageLabel)initWithImage:(id)a3 size:(CGSize)a4 text:(id)a5 userInterfaceStyleChanged:(id)a6;
- (NSArray)imageTextAlignmentConstraints;
- (NSLayoutConstraint)imageLeadingConstraint;
- (NSLayoutConstraint)imageTrailingConstraint;
- (NSString)text;
- (UIImage)image;
- (UIImageView)imageView;
- (UILabel)textLabel;
- (double)imageLeadingSpacing;
- (double)imageTrailingSpacing;
- (id)_textLabelBoldFont;
- (id)_textLabelFont;
- (id)_textLabelFontStyle;
- (id)initWIthImage:(id)a3 text:(id)a4;
- (id)userInterfaceStyleChanged;
- (int64_t)currentUserInterfaceStyle;
- (int64_t)imageAlignment;
- (void)_setUpConstraints;
- (void)_setUpUI;
- (void)_updateCurrentUserInterfaceStyleIfNeeded;
- (void)_updateImageTextAlignmentConstraints;
- (void)_updateTextLabelFont;
- (void)layoutSubviews;
- (void)setBoldText:(BOOL)a3;
- (void)setCurrentUserInterfaceStyle:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setImageAlignment:(int64_t)a3;
- (void)setImageLeadingConstraint:(id)a3;
- (void)setImageLeadingSpacing:(double)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setImageTextAlignmentConstraints:(id)a3;
- (void)setImageTrailingConstraint:(id)a3;
- (void)setImageTrailingSpacing:(double)a3;
- (void)setImageView:(id)a3;
- (void)setText:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)setUserInterfaceStyleChanged:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HRImageLabel

- (HRImageLabel)initWithImage:(id)a3 size:(CGSize)a4 text:(id)a5 userInterfaceStyleChanged:(id)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HRImageLabel;
  v15 = -[HRImageLabel initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_image, a3);
    v16->_imageSize.CGFloat width = width;
    v16->_imageSize.CGFloat height = height;
    objc_storeStrong((id *)&v16->_text, a5);
    v16->_imageAlignment = 0;
    uint64_t v17 = MEMORY[0x223C72F50](v14);
    id userInterfaceStyleChanged = v16->_userInterfaceStyleChanged;
    v16->_id userInterfaceStyleChanged = (id)v17;

    [(HRImageLabel *)v16 _setUpUI];
    [(HRImageLabel *)v16 _setUpConstraints];
  }

  return v16;
}

- (HRImageLabel)initWithImage:(id)a3 size:(CGSize)a4 text:(id)a5
{
  return -[HRImageLabel initWithImage:size:text:userInterfaceStyleChanged:](self, "initWithImage:size:text:userInterfaceStyleChanged:", a3, a5, 0, a4.width, a4.height);
}

- (id)initWIthImage:(id)a3 text:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImage:size:text:", v7, v6, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));

  return v8;
}

- (void)setImageAlignment:(int64_t)a3
{
  self->_imageAlignment = a3;
  [(HRImageLabel *)self _updateImageTextAlignmentConstraints];
}

- (void)setBoldText:(BOOL)a3
{
  self->_boldText = a3;
  [(HRImageLabel *)self _updateTextLabelFont];
  [(HRImageLabel *)self _updateImageTextAlignmentConstraints];
}

- (void)setImageLeadingSpacing:(double)a3
{
  self->_imageLeadingSpacing = a3;
  id v4 = [(HRImageLabel *)self imageLeadingConstraint];
  [v4 setConstant:a3];
}

- (void)setImageTrailingSpacing:(double)a3
{
  self->_imageTrailingSpacing = a3;
  id v4 = [(HRImageLabel *)self imageTrailingConstraint];
  [v4 setConstant:a3];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HRImageLabel;
  [(HRImageLabel *)&v9 traitCollectionDidChange:a3];
  id v4 = [(HRImageLabel *)self textLabel];
  v5 = [v4 font];
  id v6 = [(HRImageLabel *)self traitCollection];
  id v7 = [v5 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v6];

  v8 = [(HRImageLabel *)self textLabel];
  [v8 setFont:v7];

  [(HRImageLabel *)self _updateImageTextAlignmentConstraints];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HRImageLabel;
  [(HRImageLabel *)&v3 layoutSubviews];
  [(HRImageLabel *)self _updateCurrentUserInterfaceStyleIfNeeded];
  [(HRImageLabel *)self _updateImageTextAlignmentConstraints];
}

- (void)_updateCurrentUserInterfaceStyleIfNeeded
{
  objc_super v3 = [(HRImageLabel *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if ([(HRImageLabel *)self currentUserInterfaceStyle] != v4)
  {
    [(HRImageLabel *)self setCurrentUserInterfaceStyle:v4];
    v5 = [(HRImageLabel *)self userInterfaceStyleChanged];

    if (v5)
    {
      id v6 = [(HRImageLabel *)self userInterfaceStyleChanged];
      v6[2](v6, self, v4);
    }
  }
}

- (void)_setUpUI
{
  id v3 = objc_alloc(MEMORY[0x263F1C6D0]);
  uint64_t v4 = [(HRImageLabel *)self image];
  v5 = (void *)[v3 initWithImage:v4];
  [(HRImageLabel *)self setImageView:v5];

  id v6 = [(HRImageLabel *)self imageView];
  [v6 setContentMode:1];

  id v7 = [(HRImageLabel *)self imageView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(HRImageLabel *)self imageView];
  [(HRImageLabel *)self addSubview:v8];

  id v9 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HRImageLabel *)self setTextLabel:v9];

  v10 = [(HRImageLabel *)self text];
  v11 = [(HRImageLabel *)self textLabel];
  [v11 setText:v10];

  id v12 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  id v13 = [(HRImageLabel *)self textLabel];
  [v13 setFont:v12];

  id v14 = [(HRImageLabel *)self textLabel];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = [(HRImageLabel *)self textLabel];
  [v15 setNumberOfLines:0];

  id v16 = [(HRImageLabel *)self textLabel];
  [(HRImageLabel *)self addSubview:v16];
}

- (void)_setUpConstraints
{
  [(HRImageLabel *)self imageSize];
  if (v4 != *MEMORY[0x263F001B0] || v3 != *(double *)(MEMORY[0x263F001B0] + 8))
  {
    id v6 = [(HRImageLabel *)self imageView];
    id v7 = [v6 widthAnchor];
    [(HRImageLabel *)self imageSize];
    v8 = objc_msgSend(v7, "constraintEqualToConstant:");
    [v8 setActive:1];

    id v9 = [(HRImageLabel *)self imageView];
    v10 = [v9 heightAnchor];
    [(HRImageLabel *)self imageSize];
    id v12 = [v10 constraintEqualToConstant:v11];
    [v12 setActive:1];
  }
  [(HRImageLabel *)self setImageLeadingSpacing:0.0];
  [(HRImageLabel *)self setImageTrailingSpacing:14.0];
  id v13 = [(HRImageLabel *)self imageView];
  id v14 = [v13 leadingAnchor];
  v15 = [(HRImageLabel *)self leadingAnchor];
  [(HRImageLabel *)self imageLeadingSpacing];
  id v16 = objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15);
  [(HRImageLabel *)self setImageLeadingConstraint:v16];

  uint64_t v17 = [(HRImageLabel *)self imageLeadingConstraint];
  [v17 setActive:1];

  v18 = [(HRImageLabel *)self textLabel];
  v19 = [v18 leadingAnchor];
  objc_super v20 = [(HRImageLabel *)self imageView];
  v21 = [v20 trailingAnchor];
  [(HRImageLabel *)self imageTrailingSpacing];
  v22 = objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21);
  [(HRImageLabel *)self setImageTrailingConstraint:v22];

  v23 = [(HRImageLabel *)self imageTrailingConstraint];
  [v23 setActive:1];

  v24 = [(HRImageLabel *)self textLabel];
  v25 = [v24 trailingAnchor];
  v26 = [(HRImageLabel *)self trailingAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  [v27 setActive:1];

  [(HRImageLabel *)self _updateImageTextAlignmentConstraints];
}

- (void)_updateTextLabelFont
{
  if ([(HRImageLabel *)self boldText]) {
    [(HRImageLabel *)self _textLabelBoldFont];
  }
  else {
  id v4 = [(HRImageLabel *)self _textLabelFont];
  }
  double v3 = [(HRImageLabel *)self textLabel];
  [v3 setFont:v4];
}

- (void)_updateImageTextAlignmentConstraints
{
  v66[3] = *MEMORY[0x263EF8340];
  double v3 = [(HRImageLabel *)self imageTextAlignmentConstraints];

  if (v3)
  {
    id v4 = [(HRImageLabel *)self imageTextAlignmentConstraints];
    [(HRImageLabel *)self removeConstraints:v4];

    [(HRImageLabel *)self setImageTextAlignmentConstraints:0];
  }
  switch([(HRImageLabel *)self imageAlignment])
  {
    case 0:
      v5 = [(HRImageLabel *)self imageView];
      id v6 = [v5 centerYAnchor];
      id v7 = [(HRImageLabel *)self textLabel];
      v8 = [v7 centerYAnchor];
      id v9 = [v6 constraintEqualToAnchor:v8];

      LODWORD(v10) = 1144750080;
      [v9 setPriority:v10];
      if ([(HRImageLabel *)self _isTextTallerThanImage])
      {
        double v11 = [(HRImageLabel *)self textLabel];
        id v12 = [v11 topAnchor];
        id v13 = [(HRImageLabel *)self topAnchor];
        id v14 = [v12 constraintEqualToAnchor:v13];

        [(HRImageLabel *)self textLabel];
      }
      else
      {
        v47 = [(HRImageLabel *)self imageView];
        v48 = [v47 topAnchor];
        v49 = [(HRImageLabel *)self topAnchor];
        id v14 = [v48 constraintEqualToAnchor:v49];

        [(HRImageLabel *)self imageView];
      v50 = };
      v51 = [v50 bottomAnchor];
      v52 = [(HRImageLabel *)self bottomAnchor];
      v26 = [v51 constraintEqualToAnchor:v52];

      v66[0] = v14;
      v66[1] = v26;
      v66[2] = v9;
      v45 = (void *)MEMORY[0x263EFF8C0];
      v46 = (void **)v66;
      goto LABEL_14;
    case 1:
      v15 = [(HRImageLabel *)self textLabel];
      id v16 = [v15 topAnchor];
      uint64_t v17 = [(HRImageLabel *)self topAnchor];
      id v9 = [v16 constraintEqualToAnchor:v17];

      [v9 setActive:1];
      v18 = [(HRImageLabel *)self imageView];
      v19 = [v18 centerYAnchor];
      objc_super v20 = [(HRImageLabel *)self textLabel];
      v21 = [v20 topAnchor];
      id v14 = [v19 constraintEqualToAnchor:v21];

      v22 = [(HRImageLabel *)self textLabel];
      v23 = [v22 font];
      [v23 lineHeight];
      [v14 setConstant:v24 * 0.5];

      LODWORD(v25) = 1144750080;
      [v14 setPriority:v25];
      v65[0] = v9;
      v65[1] = v14;
      v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:2];
      [(HRImageLabel *)self setImageTextAlignmentConstraints:v26];
      goto LABEL_15;
    case 2:
      v27 = [(HRImageLabel *)self textLabel];
      v28 = [v27 topAnchor];
      v29 = [(HRImageLabel *)self topAnchor];
      id v9 = [v28 constraintEqualToAnchor:v29];

      [v9 setActive:1];
      v30 = [(HRImageLabel *)self imageView];
      v31 = [v30 topAnchor];
      v32 = [(HRImageLabel *)self topAnchor];
      id v14 = [v31 constraintEqualToAnchor:v32];

      LODWORD(v33) = 1148846080;
      [v14 setPriority:v33];
      LODWORD(v30) = [(HRImageLabel *)self _isTextTallerThanImage];
      v34 = [(HRImageLabel *)self bottomAnchor];
      if (v30) {
        [(HRImageLabel *)self textLabel];
      }
      else {
      v53 = [(HRImageLabel *)self imageView];
      }
      v54 = [v53 bottomAnchor];
      v26 = [v34 constraintEqualToAnchor:v54];

      LODWORD(v55) = 1144750080;
      [v26 setPriority:v55];
      v62 = v9;
      v63 = v14;
      v64 = v26;
      v45 = (void *)MEMORY[0x263EFF8C0];
      v46 = &v62;
      goto LABEL_14;
    case 3:
      v35 = [(HRImageLabel *)self textLabel];
      v36 = [v35 topAnchor];
      v37 = [(HRImageLabel *)self topAnchor];
      id v9 = [v36 constraintEqualToAnchor:v37];

      [v9 setActive:1];
      v38 = [(HRImageLabel *)self imageView];
      v39 = [v38 firstBaselineAnchor];
      v40 = [(HRImageLabel *)self textLabel];
      v41 = [v40 firstBaselineAnchor];
      id v14 = [v39 constraintEqualToAnchor:v41];

      [v14 setActive:1];
      v42 = [(HRImageLabel *)self bottomAnchor];
      v43 = [(HRImageLabel *)self textLabel];
      v44 = [v43 bottomAnchor];
      v26 = [v42 constraintEqualToAnchor:v44];

      [v26 setActive:1];
      v59 = v9;
      v60 = v14;
      v61 = v26;
      v45 = (void *)MEMORY[0x263EFF8C0];
      v46 = &v59;
LABEL_14:
      v56 = objc_msgSend(v45, "arrayWithObjects:count:", v46, 3, v59, v60, v61, v62, v63, v64);
      [(HRImageLabel *)self setImageTextAlignmentConstraints:v56];

LABEL_15:
      break;
    default:
      break;
  }
  v57 = (void *)MEMORY[0x263F08938];
  v58 = [(HRImageLabel *)self imageTextAlignmentConstraints];
  [v57 activateConstraints:v58];
}

- (BOOL)_isTextTallerThanImage
{
  v2 = self;
  double v3 = [(HRImageLabel *)self textLabel];
  [v3 frame];
  double Height = CGRectGetHeight(v7);
  [(HRImageLabel *)v2 imageSize];
  LOBYTE(v2) = Height > v5;

  return (char)v2;
}

- (id)_textLabelFontStyle
{
  return (id)*MEMORY[0x263F1D2C0];
}

- (id)_textLabelFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  double v3 = [(HRImageLabel *)self _textLabelFontStyle];
  id v4 = [v2 preferredFontForTextStyle:v3];

  return v4;
}

- (id)_textLabelBoldFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  double v3 = [(HRImageLabel *)self _textLabelFontStyle];
  id v4 = objc_msgSend(v2, "hk_preferredFontForTextStyle:symbolicTraits:", v3, 2);

  return v4;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (int64_t)imageAlignment
{
  return self->_imageAlignment;
}

- (BOOL)boldText
{
  return self->_boldText;
}

- (double)imageLeadingSpacing
{
  return self->_imageLeadingSpacing;
}

- (double)imageTrailingSpacing
{
  return self->_imageTrailingSpacing;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSLayoutConstraint)imageLeadingConstraint
{
  return self->_imageLeadingConstraint;
}

- (void)setImageLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageTrailingConstraint
{
  return self->_imageTrailingConstraint;
}

- (void)setImageTrailingConstraint:(id)a3
{
}

- (NSArray)imageTextAlignmentConstraints
{
  return self->_imageTextAlignmentConstraints;
}

- (void)setImageTextAlignmentConstraints:(id)a3
{
}

- (int64_t)currentUserInterfaceStyle
{
  return self->_currentUserInterfaceStyle;
}

- (void)setCurrentUserInterfaceStyle:(int64_t)a3
{
  self->_currentUserInterfaceStyle = a3;
}

- (id)userInterfaceStyleChanged
{
  return self->_userInterfaceStyleChanged;
}

- (void)setUserInterfaceStyleChanged:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInterfaceStyleChanged, 0);
  objc_storeStrong((id *)&self->_imageTextAlignmentConstraints, 0);
  objc_storeStrong((id *)&self->_imageTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_imageLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end