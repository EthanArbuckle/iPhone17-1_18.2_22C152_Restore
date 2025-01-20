@interface EKEventDetailRecurrenceCell
- (double)height;
- (id)_myTableView;
- (id)_recurrenceLabel;
- (void)layoutForWidth:(double)a3 position:(int)a4;
- (void)layoutSubviews;
- (void)setRecurrenceString:(id)a3;
@end

@implementation EKEventDetailRecurrenceCell

- (id)_recurrenceLabel
{
  recurrenceLabel = self->_recurrenceLabel;
  if (!recurrenceLabel)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_recurrenceLabel;
    self->_recurrenceLabel = v5;

    [(UILabel *)self->_recurrenceLabel setNumberOfLines:0];
    [(UILabel *)self->_recurrenceLabel setLineBreakMode:0];
    [(UILabel *)self->_recurrenceLabel setTextAlignment:2];
    v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)self->_recurrenceLabel setFont:v7];

    v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)self->_recurrenceLabel setTextColor:v8];

    v9 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)self->_recurrenceLabel setBackgroundColor:v9];

    v10 = [(EKEventDetailRecurrenceCell *)self contentView];
    [v10 addSubview:self->_recurrenceLabel];

    recurrenceLabel = self->_recurrenceLabel;
  }

  return recurrenceLabel;
}

- (void)setRecurrenceString:(id)a3
{
  id v4 = a3;
  id v5 = [(EKEventDetailRecurrenceCell *)self _recurrenceLabel];
  [v5 setText:v4];
}

- (id)_myTableView
{
  v2 = [(EKEventDetailRecurrenceCell *)self superview];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)layoutForWidth:(double)a3 position:(int)a4
{
  v6.receiver = self;
  v6.super_class = (Class)EKEventDetailRecurrenceCell;
  -[EKEventDetailCell layoutForWidth:position:](&v6, sel_layoutForWidth_position_, *(void *)&a4);
  self->_lastLayoutWidth = a3;
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)EKEventDetailRecurrenceCell;
  [(EKUITableViewCell *)&v20 layoutSubviews];
  v3 = [(EKEventDetailRecurrenceCell *)self _recurrenceLabel];
  id v4 = [(EKEventDetailRecurrenceCell *)self textLabel];
  [v4 frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v13 = [(EKEventDetailRecurrenceCell *)self _myTableView];
  v14 = v13;
  if (v13)
  {
    [v13 _backgroundInset];
    double v16 = v15 + 11.0;
  }
  else
  {
    double v16 = 11.0;
  }
  v21.origin.x = v6;
  v21.origin.y = v8;
  v21.size.width = v10;
  v21.size.height = v12;
  double v17 = v16 + CGRectGetMaxX(v21) + 10.0;
  double v18 = self->_lastLayoutWidth - v17 - v16;
  objc_msgSend(v3, "sizeThatFits:", v18, 3.40282347e38);
  -[UILabel setFrame:](self->_recurrenceLabel, "setFrame:", v17, 9.0, v18, v19);
}

- (double)height
{
  v2 = [(EKEventDetailRecurrenceCell *)self _recurrenceLabel];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;

  return v6 + v4 * 2.0;
}

- (void).cxx_destruct
{
}

@end