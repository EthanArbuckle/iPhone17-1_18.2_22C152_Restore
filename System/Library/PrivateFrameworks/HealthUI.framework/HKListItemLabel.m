@interface HKListItemLabel
+ (id)createListItem:(id)a3 itemNumber:(int)a4;
- (BOOL)boldText;
- (BOOL)centerItemViewToFirstLine;
- (CGSize)itemViewSize;
- (HKListItemLabel)initWithView:(id)a3 size:(CGSize)a4 text:(id)a5;
- (NSLayoutConstraint)itemViewTextAlignmentConstraint;
- (NSLayoutConstraint)topToTextLabelFirstBaselineConstraint;
- (NSString)text;
- (UILabel)textLabel;
- (UIView)itemView;
- (double)_textLabelLastBaselineToBottom;
- (double)_topToTextLabelFirstBaseline;
- (id)_textLabelBoldFont;
- (id)_textLabelFont;
- (id)_textLabelFontStyle;
- (void)_setUpConstraints;
- (void)_setUpUI;
- (void)_updateItemViewTextAlignmentConstraint;
- (void)_updateTextLabelFont;
- (void)setBoldText:(BOOL)a3;
- (void)setCenterItemViewToFirstLine:(BOOL)a3;
- (void)setItemView:(id)a3;
- (void)setItemViewSize:(CGSize)a3;
- (void)setItemViewTextAlignmentConstraint:(id)a3;
- (void)setText:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)setTopToTextLabelFirstBaselineConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HKListItemLabel

- (HKListItemLabel)initWithView:(id)a3 size:(CGSize)a4 text:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v10 = a3;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKListItemLabel;
  v12 = -[HKListItemLabel initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_itemView, a3);
    v13->_itemViewSize.CGFloat width = width;
    v13->_itemViewSize.CGFloat height = height;
    objc_storeStrong((id *)&v13->_text, a5);
    [(HKListItemLabel *)v13 _setUpUI];
    [(HKListItemLabel *)v13 _setUpConstraints];
  }

  return v13;
}

- (void)setCenterItemViewToFirstLine:(BOOL)a3
{
  self->_centerItemViewToFirstLine = a3;
  [(HKListItemLabel *)self _updateItemViewTextAlignmentConstraint];
}

- (void)setBoldText:(BOOL)a3
{
  self->_boldText = a3;
  [(HKListItemLabel *)self _updateTextLabelFont];
  [(HKListItemLabel *)self _updateItemViewTextAlignmentConstraint];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HKListItemLabel;
  [(HKListItemLabel *)&v9 traitCollectionDidChange:a3];
  v4 = [(HKListItemLabel *)self textLabel];
  v5 = [v4 font];
  v6 = [(HKListItemLabel *)self traitCollection];
  v7 = [v5 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v6];

  v8 = [(HKListItemLabel *)self textLabel];
  [v8 setFont:v7];

  [(HKListItemLabel *)self _updateItemViewTextAlignmentConstraint];
}

+ (id)createListItem:(id)a3 itemNumber:(int)a4
{
  id v5 = a3;
  v6 = [(id)objc_opt_class() createButtonBackgroundView];
  v7 = [HKListItemLabel alloc];
  v8 = [(id)objc_opt_class() createNumberedViewWithInteger:a4];
  [(id)objc_opt_class() listItemSize];
  objc_super v9 = -[HKListItemLabel initWithView:size:text:](v7, "initWithView:size:text:", v8, v5);

  [(HKListItemLabel *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HKListItemLabel *)v9 setCenterItemViewToFirstLine:1];
  [(HKListItemLabel *)v9 setBoldText:1];
  [v6 addSubview:v9];
  -[UIView hk_alignHorizontalConstraintsWithView:insets:](v9, "hk_alignHorizontalConstraintsWithView:insets:", v6, 0.0, 12.0, 0.0, 20.0);
  -[UIView hk_alignVerticalConstraintsWithView:insets:](v9, "hk_alignVerticalConstraintsWithView:insets:", v6, *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));

  return v6;
}

- (void)_setUpUI
{
  v3 = [(HKListItemLabel *)self itemView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v4 = [(HKListItemLabel *)self itemView];
  [(HKListItemLabel *)self addSubview:v4];

  id v5 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(HKListItemLabel *)self setTextLabel:v5];

  v6 = [(HKListItemLabel *)self text];
  v7 = [(HKListItemLabel *)self textLabel];
  [v7 setText:v6];

  v8 = [(HKListItemLabel *)self textLabel];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v9 = [(HKListItemLabel *)self textLabel];
  [v9 setNumberOfLines:0];

  [(HKListItemLabel *)self _updateTextLabelFont];
  id v10 = [(HKListItemLabel *)self textLabel];
  [(HKListItemLabel *)self addSubview:v10];
}

- (void)_setUpConstraints
{
  [(HKListItemLabel *)self itemViewSize];
  if (v4 != *MEMORY[0x1E4F1DB30] || v3 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v6 = [(HKListItemLabel *)self itemView];
    v7 = [v6 widthAnchor];
    [(HKListItemLabel *)self itemViewSize];
    v8 = objc_msgSend(v7, "constraintEqualToConstant:");
    [v8 setActive:1];

    objc_super v9 = [(HKListItemLabel *)self itemView];
    id v10 = [v9 heightAnchor];
    [(HKListItemLabel *)self itemViewSize];
    v12 = [v10 constraintEqualToConstant:v11];
    [v12 setActive:1];
  }
  v13 = [(HKListItemLabel *)self itemView];
  v14 = [v13 leadingAnchor];
  objc_super v15 = [(HKListItemLabel *)self leadingAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  v17 = [(HKListItemLabel *)self textLabel];
  v18 = [v17 leadingAnchor];
  v19 = [(HKListItemLabel *)self itemView];
  v20 = [v19 trailingAnchor];
  v21 = [v18 constraintEqualToAnchor:v20 constant:12.0];
  [v21 setActive:1];

  v22 = [(HKListItemLabel *)self textLabel];
  v23 = [v22 trailingAnchor];
  v24 = [(HKListItemLabel *)self trailingAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  [v25 setActive:1];

  [(HKListItemLabel *)self _updateItemViewTextAlignmentConstraint];
  v26 = [(HKListItemLabel *)self textLabel];
  v27 = [v26 firstBaselineAnchor];
  v28 = [(HKListItemLabel *)self topAnchor];
  [(HKListItemLabel *)self _topToTextLabelFirstBaseline];
  v29 = objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28);
  [v29 setActive:1];

  id v33 = [(HKListItemLabel *)self bottomAnchor];
  v30 = [(HKListItemLabel *)self textLabel];
  v31 = [v30 lastBaselineAnchor];
  [(HKListItemLabel *)self _textLabelLastBaselineToBottom];
  v32 = objc_msgSend(v33, "constraintEqualToAnchor:constant:", v31);
  [v32 setActive:1];
}

- (void)_updateTextLabelFont
{
  if ([(HKListItemLabel *)self boldText]) {
    [(HKListItemLabel *)self _textLabelBoldFont];
  }
  else {
  id v4 = [(HKListItemLabel *)self _textLabelFont];
  }
  double v3 = [(HKListItemLabel *)self textLabel];
  [v3 setFont:v4];
}

- (void)_updateItemViewTextAlignmentConstraint
{
  double v3 = [(HKListItemLabel *)self itemViewTextAlignmentConstraint];

  if (v3)
  {
    id v4 = [(HKListItemLabel *)self itemViewTextAlignmentConstraint];
    [(HKListItemLabel *)self removeConstraint:v4];

    [(HKListItemLabel *)self setItemViewTextAlignmentConstraint:0];
  }
  BOOL v5 = [(HKListItemLabel *)self centerItemViewToFirstLine];
  v6 = [(HKListItemLabel *)self itemView];
  v7 = [v6 centerYAnchor];
  v8 = [(HKListItemLabel *)self textLabel];
  objc_super v9 = v8;
  if (v5)
  {
    id v10 = [v8 topAnchor];
    double v11 = [v7 constraintEqualToAnchor:v10];
    [(HKListItemLabel *)self setItemViewTextAlignmentConstraint:v11];

    v6 = [(HKListItemLabel *)self textLabel];
    v7 = [v6 font];
    [v7 lineHeight];
    double v13 = v12 * 0.5;
    objc_super v9 = [(HKListItemLabel *)self itemViewTextAlignmentConstraint];
    [v9 setConstant:v13];
  }
  else
  {
    v14 = [v8 centerYAnchor];
    objc_super v15 = [v7 constraintEqualToAnchor:v14];
    [(HKListItemLabel *)self setItemViewTextAlignmentConstraint:v15];
  }
  v16 = [(HKListItemLabel *)self itemViewTextAlignmentConstraint];
  LODWORD(v17) = 1144750080;
  [v16 setPriority:v17];

  id v18 = [(HKListItemLabel *)self itemViewTextAlignmentConstraint];
  [v18 setActive:1];
}

- (id)_textLabelFontStyle
{
  return (id)*MEMORY[0x1E4FB2908];
}

- (id)_textLabelFont
{
  v2 = (void *)MEMORY[0x1E4FB08E0];
  double v3 = [(HKListItemLabel *)self _textLabelFontStyle];
  id v4 = [v2 preferredFontForTextStyle:v3];

  return v4;
}

- (id)_textLabelBoldFont
{
  v2 = (void *)MEMORY[0x1E4FB08E0];
  double v3 = [(HKListItemLabel *)self _textLabelFontStyle];
  id v4 = objc_msgSend(v2, "hk_preferredFontForTextStyle:symbolicTraits:", v3, 2);

  return v4;
}

- (double)_topToTextLabelFirstBaseline
{
  v2 = [(HKListItemLabel *)self textLabel];
  double v3 = [v2 font];
  [v3 _scaledValueForValue:32.0];
  double v5 = v4;

  return v5;
}

- (double)_textLabelLastBaselineToBottom
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v2 _scaledValueForValue:20.0];
  double v4 = v3;

  return v4;
}

- (UIView)itemView
{
  return self->_itemView;
}

- (void)setItemView:(id)a3
{
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (BOOL)centerItemViewToFirstLine
{
  return self->_centerItemViewToFirstLine;
}

- (BOOL)boldText
{
  return self->_boldText;
}

- (CGSize)itemViewSize
{
  double width = self->_itemViewSize.width;
  double height = self->_itemViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setItemViewSize:(CGSize)a3
{
  self->_itemViewSize = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSLayoutConstraint)itemViewTextAlignmentConstraint
{
  return self->_itemViewTextAlignmentConstraint;
}

- (void)setItemViewTextAlignmentConstraint:(id)a3
{
}

- (NSLayoutConstraint)topToTextLabelFirstBaselineConstraint
{
  return self->_topToTextLabelFirstBaselineConstraint;
}

- (void)setTopToTextLabelFirstBaselineConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topToTextLabelFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_itemViewTextAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
}

@end