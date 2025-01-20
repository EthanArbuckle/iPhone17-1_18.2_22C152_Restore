@interface HUStatusDetailsTitleDescriptionCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (HFStringGenerator)descriptionText;
- (HFStringGenerator)titleText;
- (HUGridLayoutOptions)layoutOptions;
- (HUStatusDetailsTitleDescriptionCell)initWithFrame:(CGRect)a3;
- (NSArray)labelConstraints;
- (UILabel)titleLabel;
- (UITextView)descriptionTextView;
- (void)_layoutContentApplyingFrames:(BOOL)a3 forTargetSize:(CGSize)a4 desiredSize:(CGSize *)a5;
- (void)layoutSubviews;
- (void)setDescriptionText:(id)a3;
- (void)setDescriptionTextView:(id)a3;
- (void)setLabelConstraints:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleText:(id)a3;
@end

@implementation HUStatusDetailsTitleDescriptionCell

- (HUStatusDetailsTitleDescriptionCell)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)HUStatusDetailsTitleDescriptionCell;
  v3 = -[HUStatusDetailsTitleDescriptionCell initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    [(HUStatusDetailsTitleDescriptionCell *)v3 setTitleLabel:v4];

    v5 = [(HUStatusDetailsTitleDescriptionCell *)v3 titleLabel];
    [v5 setNumberOfLines:0];

    v6 = [(HUStatusDetailsTitleDescriptionCell *)v3 contentView];
    v7 = [(HUStatusDetailsTitleDescriptionCell *)v3 titleLabel];
    [v6 addSubview:v7];

    id v8 = objc_alloc(MEMORY[0x1E4F42F58]);
    v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(HUStatusDetailsTitleDescriptionCell *)v3 setDescriptionTextView:v9];

    v10 = [(HUStatusDetailsTitleDescriptionCell *)v3 descriptionTextView];
    [v10 setDelegate:v3];

    v11 = [(HUStatusDetailsTitleDescriptionCell *)v3 descriptionTextView];
    [v11 setEditable:0];

    v12 = [(HUStatusDetailsTitleDescriptionCell *)v3 descriptionTextView];
    [v12 _setInteractiveTextSelectionDisabled:1];

    v13 = [(HUStatusDetailsTitleDescriptionCell *)v3 descriptionTextView];
    [v13 setScrollEnabled:0];

    v14 = [(HUStatusDetailsTitleDescriptionCell *)v3 descriptionTextView];
    [v14 setBackgroundColor:0];

    double v15 = *MEMORY[0x1E4F437F8];
    double v16 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v17 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    v19 = [(HUStatusDetailsTitleDescriptionCell *)v3 descriptionTextView];
    objc_msgSend(v19, "setTextContainerInset:", v15, v16, v17, v18);

    v20 = [(HUStatusDetailsTitleDescriptionCell *)v3 descriptionTextView];
    v21 = [v20 textContainer];
    [v21 setLineFragmentPadding:0.0];

    v22 = [(HUStatusDetailsTitleDescriptionCell *)v3 contentView];
    v23 = [(HUStatusDetailsTitleDescriptionCell *)v3 descriptionTextView];
    [v22 addSubview:v23];
  }
  return v3;
}

- (HFStringGenerator)titleText
{
  v2 = [(HUStatusDetailsTitleDescriptionCell *)self titleLabel];
  v3 = [v2 attributedText];

  return (HFStringGenerator *)v3;
}

- (void)setTitleText:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 stringWithAttributes:MEMORY[0x1E4F1CC08]];
  v5 = [v4 string];
  v6 = [v5 localizedUppercaseString];

  id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v12 = *MEMORY[0x1E4F42510];
  id v8 = [MEMORY[0x1E4F428B8] systemGrayColor];
  v13[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10 = (void *)[v7 initWithString:v6 attributes:v9];
  v11 = [(HUStatusDetailsTitleDescriptionCell *)self titleLabel];
  [v11 setAttributedText:v10];
}

- (HFStringGenerator)descriptionText
{
  v2 = [(HUStatusDetailsTitleDescriptionCell *)self descriptionTextView];
  v3 = [v2 attributedText];

  return (HFStringGenerator *)v3;
}

- (void)setDescriptionText:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F42B58];
  id v5 = a3;
  v6 = [v4 prominentInsetGroupedHeaderConfiguration];
  v14[0] = *MEMORY[0x1E4F42508];
  id v7 = [v6 secondaryTextProperties];
  id v8 = [v7 font];
  v15[0] = v8;
  v14[1] = *MEMORY[0x1E4F42510];
  v9 = [v6 secondaryTextProperties];
  v10 = [v9 color];
  v15[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  uint64_t v12 = [v5 stringWithAttributes:v11];

  v13 = [(HUStatusDetailsTitleDescriptionCell *)self descriptionTextView];
  [v13 setAttributedText:v12];
}

- (void)setLayoutOptions:(id)a3
{
  id v8 = a3;
  if (([v8 isEqual:self->_layoutOptions] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    id v5 = [(HUStatusDetailsTitleDescriptionCell *)self layoutOptions];
    v6 = [v5 sectionHeaderFont];
    id v7 = [(HUStatusDetailsTitleDescriptionCell *)self titleLabel];
    [v7 setFont:v6];

    [(HUStatusDetailsTitleDescriptionCell *)self invalidateIntrinsicContentSize];
    [(HUStatusDetailsTitleDescriptionCell *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  long long v5 = *MEMORY[0x1E4F1DB30];
  -[HUStatusDetailsTitleDescriptionCell _layoutContentApplyingFrames:forTargetSize:desiredSize:](self, "_layoutContentApplyingFrames:forTargetSize:desiredSize:", 0, &v5, a3.width, a3.height);
  double v4 = *((double *)&v5 + 1);
  double v3 = *(double *)&v5;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_layoutContentApplyingFrames:(BOOL)a3 forTargetSize:(CGSize)a4 desiredSize:(CGSize *)a5
{
  double height = a4.height;
  double width = a4.width;
  BOOL v8 = a3;
  double v10 = *MEMORY[0x1E4F1DAD8];
  v11 = [(HUStatusDetailsTitleDescriptionCell *)self titleLabel];
  objc_msgSend(v11, "sizeThatFits:", width, height);
  double v13 = v12;

  v14 = [(HUStatusDetailsTitleDescriptionCell *)self layoutOptions];
  [v14 sectionTitleMargin];
  double v16 = v15;

  if (v8)
  {
    double v17 = [(HUStatusDetailsTitleDescriptionCell *)self titleLabel];
    objc_msgSend(v17, "setFrame:", v10, v16, width, v13);
  }
  double v18 = [(HUStatusDetailsTitleDescriptionCell *)self descriptionTextView];
  v19 = [v18 font];
  [v19 _scaledValueForValue:20.0];
  double v21 = HURoundToScreenScale(v20);

  v22 = [(HUStatusDetailsTitleDescriptionCell *)self titleLabel];
  v23 = [v22 font];
  [v23 descender];
  double v25 = v13 + v16 + v24;

  v26 = [(HUStatusDetailsTitleDescriptionCell *)self descriptionTextView];
  id v44 = [v26 font];

  v27 = [(HUStatusDetailsTitleDescriptionCell *)self descriptionTextView];
  objc_msgSend(v27, "sizeThatFits:", width, height);
  double v29 = v28;

  [v44 ascender];
  double v31 = v21 + v25 - v30;
  if (v8)
  {
    v32 = [(HUStatusDetailsTitleDescriptionCell *)self descriptionTextView];
    objc_msgSend(v32, "setFrame:", v10, v31, width, v29);
  }
  v33 = v44;
  if (a5)
  {
    v46.origin.CGFloat x = v10;
    v46.origin.CGFloat y = v16;
    v46.size.double width = width;
    v46.size.double height = v13;
    v50.origin.CGFloat x = v10;
    v50.origin.CGFloat y = v31;
    v50.size.double width = width;
    v50.size.double height = v29;
    CGRect v47 = CGRectUnion(v46, v50);
    CGFloat x = v47.origin.x;
    CGFloat y = v47.origin.y;
    CGFloat v36 = v47.size.width;
    v47.origin.CGFloat x = v10;
    v47.origin.CGFloat y = v31;
    v47.size.double width = width;
    v47.size.double height = v29;
    double MaxY = CGRectGetMaxY(v47);
    [v44 lineHeight];
    double v39 = v38;
    [v44 ascender];
    CGFloat v41 = MaxY - (v39 - v40) + 14.0;
    v48.origin.CGFloat x = x;
    v48.origin.CGFloat y = y;
    v48.size.double width = v36;
    v48.size.double height = v41;
    CGFloat MaxX = CGRectGetMaxX(v48);
    v49.origin.CGFloat x = x;
    v49.origin.CGFloat y = y;
    v49.size.double width = v36;
    v49.size.double height = v41;
    CGFloat v43 = CGRectGetMaxY(v49);
    v33 = v44;
    a5->double width = MaxX;
    a5->double height = v43;
  }
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)HUStatusDetailsTitleDescriptionCell;
  [(HUStatusDetailsTitleDescriptionCell *)&v5 layoutSubviews];
  [(HUStatusDetailsTitleDescriptionCell *)self bounds];
  -[HUStatusDetailsTitleDescriptionCell _layoutContentApplyingFrames:forTargetSize:desiredSize:](self, "_layoutContentApplyingFrames:forTargetSize:desiredSize:", 1, 0, v3, v4);
}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (UITextView)descriptionTextView
{
  return self->_descriptionTextView;
}

- (void)setDescriptionTextView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (NSArray)labelConstraints
{
  return self->_labelConstraints;
}

- (void)setLabelConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelConstraints, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_descriptionTextView, 0);

  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end