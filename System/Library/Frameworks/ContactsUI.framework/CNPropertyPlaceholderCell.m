@interface CNPropertyPlaceholderCell
+ (BOOL)shouldIndentWhileEditing;
- (BOOL)shouldPerformDefaultAction;
- (UILabel)label;
- (double)minCellHeight;
- (id)labelView;
- (void)setCardGroupItem:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation CNPropertyPlaceholderCell

- (void).cxx_destruct
{
}

- (void)setLabel:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (double)minCellHeight
{
  return 44.0;
}

- (void)setCardGroupItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactCell *)self cardGroupItem];

  if (v5 != v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)CNPropertyPlaceholderCell;
    [(CNContactCell *)&v8 setCardGroupItem:v4];
    v6 = [v4 title];
    v7 = [(CNPropertyPlaceholderCell *)self label];
    [v7 setText:v6];
  }
}

- (BOOL)shouldPerformDefaultAction
{
  return 1;
}

- (id)labelView
{
  label = self->_label;
  if (!label)
  {
    id v4 = [(CNLabeledCell *)self standardLabelView];
    id v5 = self->_label;
    self->_label = v4;

    label = self->_label;
  }

  return label;
}

+ (BOOL)shouldIndentWhileEditing
{
  return objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1;
}

@end