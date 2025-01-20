@interface EKEventDetailTwoValueCell
- (BOOL)update;
- (EKEventDetailTwoValueCell)initWithEvent:(id)a3 editable:(BOOL)a4 platformStyle:(int)a5;
- (double)_layoutForWidth:(double)a3;
- (id)titleView;
- (id)value2View;
- (id)valueView;
- (int)twoValueCellStyle;
- (unsigned)visibleItems;
- (void)layoutForWidth:(double)a3 position:(int)a4;
- (void)layoutSubviews;
@end

@implementation EKEventDetailTwoValueCell

- (EKEventDetailTwoValueCell)initWithEvent:(id)a3 editable:(BOOL)a4 platformStyle:(int)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  LODWORD(self->_value2View) = a5;
  if ((a5 - 1) >= 2)
  {
    if (a5)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v13.receiver = self;
    v13.super_class = (Class)EKEventDetailTwoValueCell;
    v9 = [(EKEventDetailCell *)&v13 initWithEvent:v8 editable:v6];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)EKEventDetailTwoValueCell;
    v9 = [(EKEventDetailCell *)&v12 initWithEvent:v8 editable:v6 style:1];
  }
  self = v9;
  v10 = self;
LABEL_7:

  return v10;
}

- (unsigned)visibleItems
{
  v3 = [(EKEventDetailTwoValueCell *)self valueView];
  v4 = [v3 text];

  unsigned int v5 = v4 != 0;
  BOOL v6 = [(EKEventDetailTwoValueCell *)self value2View];
  v7 = [v6 text];

  if (v7) {
    return v5 | 2;
  }
  else {
    return v5;
  }
}

- (BOOL)update
{
  BOOL v3 = [(EKEventDetailCell *)self isEditable];
  [(EKEventDetailTwoValueCell *)self setAccessoryType:v3];
  if (!*(&self->super._lastLaidOutPosition + 1))
  {
    v4 = [(EKEventDetailTwoValueCell *)self textLabel];
    unsigned int v5 = [v4 text];

    if (v5)
    {
      BOOL v6 = [MEMORY[0x1E4FB1618] labelColor];
      v7 = [(EKEventDetailTwoValueCell *)self textLabel];
      id v8 = v7;
      v9 = v6;
    }
    else
    {
      v10 = [(EKEventDetailTwoValueCell *)self titleView];
      v11 = [MEMORY[0x1E4FB1618] labelColor];
      [v10 setTextColor:v11];

      objc_super v12 = [(EKEventDetailTwoValueCell *)self valueView];
      uint64_t v13 = *MEMORY[0x1E4FB28D8];
      v14 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
      [v12 setFont:v14];

      v15 = [(EKEventDetailTwoValueCell *)self valueView];
      v16 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [v15 setTextColor:v16];

      v17 = [(EKEventDetailTwoValueCell *)self value2View];
      v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v13];
      [v17 setFont:v18];

      BOOL v6 = [(EKEventDetailTwoValueCell *)self value2View];
      id v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      v7 = v6;
      v9 = v8;
    }
    [v7 setTextColor:v9];

    v19 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v19 pointSize];
    double v21 = v20;

    v22 = *(void **)&self->_style;
    if (v21 >= 18.5)
    {
      [v22 setNumberOfLines:0];
      [(UILabel *)self->_titleView setNumberOfLines:0];
      [(UILabel *)self->_valueView setNumberOfLines:0];
      [*(id *)&self->_style setLineBreakMode:0];
      [(UILabel *)self->_titleView setLineBreakMode:0];
      [(UILabel *)self->_valueView setLineBreakMode:0];
    }
    else
    {
      [v22 setNumberOfLines:1];
      [(UILabel *)self->_titleView setNumberOfLines:1];
      [(UILabel *)self->_valueView setNumberOfLines:1];
    }
  }
  return [(EKEventDetailTwoValueCell *)self visibleItems] || v3;
}

- (id)titleView
{
  BOOL v3 = *(void **)&self->_style;
  if (!v3)
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    unsigned int v5 = *(void **)&self->_style;
    *(void *)&self->_style = v4;

    BOOL v6 = *(void **)&self->_style;
    v7 = [MEMORY[0x1E4FB1618] labelColor];
    [v6 setTextColor:v7];

    [*(id *)&self->_style setBackgroundColor:0];
    id v8 = *(void **)&self->_style;
    v9 = [MEMORY[0x1E4FB1618] whiteColor];
    [v8 setHighlightedTextColor:v9];

    [*(id *)&self->_style setOpaque:0];
    BOOL v3 = *(void **)&self->_style;
  }

  return v3;
}

- (id)valueView
{
  titleView = self->_titleView;
  if (!titleView)
  {
    uint64_t v4 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    unsigned int v5 = self->_titleView;
    self->_titleView = v4;

    BOOL v6 = self->_titleView;
    v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v6 setTextColor:v7];

    [(UILabel *)self->_titleView setBackgroundColor:0];
    [(UILabel *)self->_titleView setOpaque:0];
    titleView = self->_titleView;
  }

  return titleView;
}

- (id)value2View
{
  valueView = self->_valueView;
  if (!valueView)
  {
    uint64_t v4 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    unsigned int v5 = self->_valueView;
    self->_valueView = v4;

    BOOL v6 = self->_valueView;
    v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v6 setTextColor:v7];

    [(UILabel *)self->_valueView setBackgroundColor:0];
    [(UILabel *)self->_valueView setOpaque:0];
    valueView = self->_valueView;
  }

  return valueView;
}

- (int)twoValueCellStyle
{
  return (int)self->_value2View;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)EKEventDetailTwoValueCell;
  [(EKUITableViewCell *)&v5 layoutSubviews];
  BOOL v3 = [(EKEventDetailTwoValueCell *)self contentView];
  [v3 bounds];
  [(EKEventDetailTwoValueCell *)self _layoutForWidth:v4];
}

- (double)_layoutForWidth:(double)a3
{
  [(EKEventDetailCell *)self detailsLeftInset];
  double v6 = v5;
  v7 = [(EKEventDetailTwoValueCell *)self titleView];
  id v8 = [(EKEventDetailTwoValueCell *)self contentView];
  [v8 addSubview:v7];

  double v9 = *MEMORY[0x1E4F1DB28];
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  [(EKEventDetailTwoValueCell *)self layoutMargins];
  double v13 = a3 - v12;
  [(EKEventDetailTwoValueCell *)self layoutMargins];
  double v42 = v13 - v14;
  objc_msgSend(*(id *)&self->_style, "setFrame:", v9, v10);
  [*(id *)&self->_style sizeToFit];
  [v7 frame];
  double v16 = v15;
  double v18 = v17;
  char IsLeftToRight = CalInterfaceIsLeftToRight();
  double v20 = v6;
  if ((IsLeftToRight & 1) == 0)
  {
    objc_msgSend(*(id *)&self->_style, "bounds", v6);
    double v20 = a3 - v6 - CGRectGetWidth(v43);
  }
  objc_msgSend(v7, "setFrame:", v20, 11.0, v16, v18);
  [(id)objc_opt_class() detailsPostLabelSpace];
  double v22 = v18 + 11.0 + v21;
  -[UILabel setFrame:](self->_titleView, "setFrame:", v9, v10, v42, v11);
  [(UILabel *)self->_titleView sizeToFit];
  v23 = [(EKEventDetailTwoValueCell *)self contentView];
  [v23 addSubview:self->_titleView];

  [(UILabel *)self->_titleView frame];
  double v25 = v24;
  double v27 = v26;
  [(UILabel *)self->_titleView sizeToFit];
  char v28 = CalInterfaceIsLeftToRight();
  double v29 = v6;
  if ((v28 & 1) == 0)
  {
    [(UILabel *)self->_titleView bounds];
    double v29 = a3 - v6 - CGRectGetWidth(v44);
  }
  -[UILabel setFrame:](self->_titleView, "setFrame:", v29, v22, v25, v27);
  [(UILabel *)self->_titleView frame];
  double v31 = v30;
  char v32 = [(EKEventDetailTwoValueCell *)self visibleItems];
  valueView = self->_valueView;
  if ((v32 & 2) != 0)
  {
    double v41 = a3;
    -[UILabel setFrame:](valueView, "setFrame:", v9, v10, v42, v11);
    [(UILabel *)self->_valueView sizeToFit];
    v34 = [(EKEventDetailTwoValueCell *)self contentView];
    [v34 addSubview:self->_valueView];

    double v22 = v22 + v31 + 1.0;
    [(UILabel *)self->_valueView frame];
    double v36 = v35;
    double v38 = v37;
    [(UILabel *)self->_valueView sizeToFit];
    if ((CalInterfaceIsLeftToRight() & 1) == 0)
    {
      [(UILabel *)self->_valueView bounds];
      double v6 = v41 - v6 - CGRectGetWidth(v45);
    }
    -[UILabel setFrame:](self->_valueView, "setFrame:", v6, v22, v36, v38);
    [(UILabel *)self->_valueView frame];
    double v31 = v39;
  }
  else
  {
    [(UILabel *)valueView removeFromSuperview];
  }

  return v31 + v22;
}

- (void)layoutForWidth:(double)a3 position:(int)a4
{
  char v4 = a4;
  v17.receiver = self;
  v17.super_class = (Class)EKEventDetailTwoValueCell;
  -[EKEventDetailCell layoutForWidth:position:](&v17, sel_layoutForWidth_position_);
  if ([(EKEventDetailTwoValueCell *)self visibleItems])
  {
    [(EKEventDetailTwoValueCell *)self _layoutForWidth:a3];
    double v8 = v7;
    [(EKEventDetailTwoValueCell *)self frame];
    double v10 = v9;
    double v12 = v11;
    if ((v4 & 4) != 0)
    {
      double v14 = ceil(v8);
      double v15 = objc_opt_class();
      if (v4) {
        [v15 detailsTopVerticalInset];
      }
      else {
        [v15 detailsBottomVerticalInset];
      }
      double v13 = v14 + v16;
    }
    else
    {
      double v13 = ceil(v8 + 7.0);
    }
    -[EKEventDetailTwoValueCell setFrame:](self, "setFrame:", v10, v12, a3, v13);
  }
  else
  {
    [(UILabel *)self->_titleView removeFromSuperview];
    [(UILabel *)self->_valueView removeFromSuperview];
    [*(id *)&self->_style removeFromSuperview];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);

  objc_storeStrong((id *)&self->_style, 0);
}

@end