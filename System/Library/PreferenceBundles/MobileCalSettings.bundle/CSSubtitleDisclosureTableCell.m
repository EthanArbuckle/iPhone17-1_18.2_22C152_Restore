@interface CSSubtitleDisclosureTableCell
+ (int64_t)cellStyle;
- (BOOL)canReload;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CSSubtitleDisclosureTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)_valueLabelForSpecifier:(id)a3;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation CSSubtitleDisclosureTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (CSSubtitleDisclosureTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CSSubtitleDisclosureTableCell;
  v9 = [(CSSubtitleDisclosureTableCell *)&v16 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    [(CSSubtitleDisclosureTableCell *)v9 _valueLabelForSpecifier:v8];
    v11 = +[UIApplication sharedApplication];
    v12 = [v11 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

    if (IsAccessibilityCategory)
    {
      v15.receiver = v10;
      v15.super_class = (Class)CSSubtitleDisclosureTableCell;
      [(CSSubtitleDisclosureTableCell *)&v15 layoutSubviews];
    }
  }

  return v10;
}

- (void)_valueLabelForSpecifier:(id)a3
{
  if (!a3) {
    return;
  }
  v4 = [a3 propertyForKey:PSTableCellSubtitleTextKey];
  v5 = [(CSSubtitleDisclosureTableCell *)self detailTextLabel];
  [v5 setText:v4];

  v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
  v7 = [(CSSubtitleDisclosureTableCell *)self detailTextLabel];
  [v7 setFont:v6];

  id v8 = [(CSSubtitleDisclosureTableCell *)self value];
  valueLabel = self->_valueLabel;
  id v25 = v8;
  if (!valueLabel)
  {
    v12 = 0;
    v11 = 0;
    if (!v8) {
      goto LABEL_17;
    }
LABEL_9:
    id v14 = [v8 length];
    objc_super v15 = self->_valueLabel;
    if (v14)
    {
      if (!v15)
      {
        id v16 = [objc_alloc((Class)UITableViewCell) initWithStyle:1 reuseIdentifier:&stru_1CE38];
        v17 = [v16 detailTextLabel];

        v18 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        v19 = self->_valueLabel;
        self->_valueLabel = v18;

        v20 = [v17 font];
        [(UILabel *)self->_valueLabel setFont:v20];

        v21 = [(CSSubtitleDisclosureTableCell *)self detailTextLabel];
        v22 = [v21 textColor];
        [(UILabel *)self->_valueLabel setTextColor:v22];

        -[UILabel setNumberOfLines:](self->_valueLabel, "setNumberOfLines:", [v17 numberOfLines]);
        -[UILabel setLineBreakMode:](self->_valueLabel, "setLineBreakMode:", [v17 lineBreakMode]);
        v23 = [(CSSubtitleDisclosureTableCell *)self contentView];
        [v23 addSubview:self->_valueLabel];

        objc_super v15 = self->_valueLabel;
      }
      [(UILabel *)v15 setText:v25];
    }
    else
    {
      if (!v15)
      {
LABEL_16:
        v11 = v12;
        goto LABEL_17;
      }
      [(UILabel *)v15 removeFromSuperview];
      v24 = self->_valueLabel;
      self->_valueLabel = 0;
    }
    [(CSSubtitleDisclosureTableCell *)self setNeedsLayout];
    goto LABEL_16;
  }
  uint64_t v10 = [(UILabel *)valueLabel text];
  id v8 = v25;
  v11 = v25;
  if (v25 != (id)v10)
  {
    v12 = (void *)v10;
    if (!v10) {
      goto LABEL_9;
    }
    unsigned __int8 v13 = [v25 isEqualToString:v10];
    id v8 = v25;
    v11 = v12;
    if ((v13 & 1) == 0) {
      goto LABEL_9;
    }
  }
LABEL_17:
}

- (void)layoutSubviews
{
  v75.receiver = self;
  v75.super_class = (Class)CSSubtitleDisclosureTableCell;
  [(CSSubtitleDisclosureTableCell *)&v75 layoutSubviews];
  valueLabel = self->_valueLabel;
  if (valueLabel)
  {
    [(UILabel *)valueLabel sizeToFit];
    v4 = [(CSSubtitleDisclosureTableCell *)self layoutManager];
    [v4 contentRectForCell:self forState:0];
    double v6 = v5;
    double v8 = v7;

    [(UILabel *)self->_valueLabel frame];
    CGFloat v10 = v9;
    double v12 = v11;
    double v14 = v13;
    unsigned int v15 = [(CSSubtitleDisclosureTableCell *)self _shouldReverseLayoutDirection];
    id v16 = [(CSSubtitleDisclosureTableCell *)self traitCollection];
    v17 = [v16 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v17);

    if (IsAccessibilityCategory)
    {
      v19 = [(CSSubtitleDisclosureTableCell *)self detailTextLabel];
      [v19 frame];
      double MaxX = v20;
      if (v15) {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v20);
      }

      id v25 = self->_valueLabel;
      v26 = [(CSSubtitleDisclosureTableCell *)self textLabel];
      [v26 frame];
      -[UILabel sizeThatFits:](v25, "sizeThatFits:", CGRectGetWidth(v76), 1.79769313e308);
      double v28 = v27;
      double v30 = v29;

      double v31 = 0.0;
      if (v15) {
        double v31 = v28;
      }
      CGFloat v32 = MaxX - v31;
      v33 = [(CSSubtitleDisclosureTableCell *)self textLabel];
      [v33 frame];
      double v35 = v34;
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;

      v77.origin.x = v32;
      v77.origin.y = v10;
      v77.size.width = v28;
      v77.size.height = v30;
      double v42 = v37 - CGRectGetHeight(v77) * 0.5;
      v43 = [(CSSubtitleDisclosureTableCell *)self textLabel];
      objc_msgSend(v43, "setFrame:", v35, v42, v39, v41);

      v44 = [(CSSubtitleDisclosureTableCell *)self detailTextLabel];
      [v44 frame];
      double v46 = v45;
      double v48 = v47;
      double v50 = v49;
      double v52 = v51;

      v78.origin.x = v32;
      v78.origin.y = v10;
      v78.size.width = v28;
      v78.size.height = v30;
      double v53 = v48 - CGRectGetHeight(v78) * 0.5;
      v54 = [(CSSubtitleDisclosureTableCell *)self detailTextLabel];
      objc_msgSend(v54, "setFrame:", v46, v53, v50, v52);

      v55 = [(CSSubtitleDisclosureTableCell *)self detailTextLabel];
      [v55 frame];
      double MaxY = CGRectGetMaxY(v79);

      -[UILabel setFrame:](self->_valueLabel, "setFrame:", v32, MaxY, v28, v30);
    }
    else
    {
      if (v15) {
        double v57 = 0.0;
      }
      else {
        double v57 = v6 - v12;
      }
      float v58 = (v8 - v14) * 0.5;
      double v59 = floorf(v58);
      -[UILabel setFrame:](self->_valueLabel, "setFrame:", v57, v59, v12, v14);
      v60 = [(CSSubtitleDisclosureTableCell *)self textLabel];
      [v60 frame];
      double v62 = v61;
      CGFloat v64 = v63;
      double v66 = v65;
      double v68 = v67;

      double v74 = v64;
      if (v15)
      {
        v80.origin.x = v57;
        v80.origin.y = v59;
        v80.size.width = v12;
        v80.size.height = v14;
        double v59 = v64;
        double v69 = CGRectGetMaxX(v80);
        double v57 = v62;
        double v12 = v66;
        double v14 = v68;
      }
      else
      {
        v81.origin.x = v62;
        v81.origin.y = v64;
        v81.size.width = v66;
        v81.size.height = v68;
        double v69 = CGRectGetMaxX(v81);
      }
      v82.origin.x = v57;
      v82.origin.y = v59;
      v82.size.width = v12;
      v82.size.height = v14;
      double v70 = v69 - CGRectGetMinX(v82) + 10.0;
      if (v70 > 0.0)
      {
        double v71 = v66 - v70;
        if (!v15) {
          double v70 = -0.0;
        }
        double v72 = v62 + v70;
        v73 = [(CSSubtitleDisclosureTableCell *)self textLabel];
        objc_msgSend(v73, "setFrame:", v72, v74, v71, v68);
      }
    }
  }
}

- (BOOL)canReload
{
  return 1;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSSubtitleDisclosureTableCell;
  id v4 = a3;
  [(CSSubtitleDisclosureTableCell *)&v5 refreshCellContentsWithSpecifier:v4];
  -[CSSubtitleDisclosureTableCell _valueLabelForSpecifier:](self, "_valueLabelForSpecifier:", v4, v5.receiver, v5.super_class);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v17.receiver = self;
  v17.super_class = (Class)CSSubtitleDisclosureTableCell;
  -[CSSubtitleDisclosureTableCell sizeThatFits:](&v17, "sizeThatFits:");
  double v7 = v6;
  double v9 = v8;
  CGFloat v10 = [(CSSubtitleDisclosureTableCell *)self traitCollection];
  double v11 = [v10 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v11))
  {
    valueLabel = self->_valueLabel;

    if (valueLabel)
    {
      double v13 = [(CSSubtitleDisclosureTableCell *)self textLabel];
      [v13 frame];
      CGRectGetMinX(v19);

      -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", width, height);
      double v9 = v9 + v14;
    }
  }
  else
  {
  }
  double v15 = v7;
  double v16 = v9;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void).cxx_destruct
{
}

@end