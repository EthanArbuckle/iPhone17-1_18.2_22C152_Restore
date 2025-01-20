@interface CNGroupMembershipCell
+ (BOOL)wantsHorizontalLayout;
- (BOOL)allowsCellSelection;
- (CNPropertyCellDelegate)delegate;
- (UILabel)parentGroupNameLabel;
- (id)labelView;
- (void)setCardGroupItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateConstraints;
@end

@implementation CNGroupMembershipCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentGroupNameLabel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (UILabel)parentGroupNameLabel
{
  return self->_parentGroupNameLabel;
}

- (void)setDelegate:(id)a3
{
}

- (CNPropertyCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNPropertyCellDelegate *)WeakRetained;
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)CNGroupMembershipCell;
  [(CNContactCell *)&v3 updateConstraints];
  -[UILabel setNumberOfLines:](self->_parentGroupNameLabel, "setNumberOfLines:", objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1);
}

- (void)setCardGroupItem:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNGroupMembershipCell;
  id v5 = [(CNContactCell *)&v11 cardGroupItem];

  if (v5 != v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)CNGroupMembershipCell;
    [(CNContactCell *)&v10 setCardGroupItem:v4];
    v6 = [v4 group];
    v7 = v6;
    if (v6)
    {
      v8 = [v6 name];
      v9 = [(CNGroupMembershipCell *)self parentGroupNameLabel];
      [v9 setText:v8];
    }
  }
}

- (id)labelView
{
  parentGroupNameLabel = self->_parentGroupNameLabel;
  if (!parentGroupNameLabel)
  {
    id v4 = [(CNLabeledCell *)self standardLabelView];
    id v5 = self->_parentGroupNameLabel;
    self->_parentGroupNameLabel = v4;

    parentGroupNameLabel = self->_parentGroupNameLabel;
  }

  return parentGroupNameLabel;
}

- (BOOL)allowsCellSelection
{
  return 0;
}

+ (BOOL)wantsHorizontalLayout
{
  return 1;
}

@end