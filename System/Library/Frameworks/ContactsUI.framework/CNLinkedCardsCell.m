@interface CNLinkedCardsCell
+ (BOOL)wantsChevron;
- (BOOL)shouldPerformDefaultAction;
- (CNPropertyCellDelegate)delegate;
- (UILabel)nameLabel;
- (UILabel)sourceLabel;
- (id)labelView;
- (id)titleForContact:(id)a3;
- (id)valueView;
- (void)performDefaultAction;
- (void)setCardGroupItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateConstraints;
@end

@implementation CNLinkedCardsCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_sourceLabel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (UILabel)sourceLabel
{
  return self->_sourceLabel;
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
  v3.super_class = (Class)CNLinkedCardsCell;
  [(CNContactCell *)&v3 updateConstraints];
  -[UILabel setNumberOfLines:](self->_sourceLabel, "setNumberOfLines:", objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1);
  -[UILabel setNumberOfLines:](self->_nameLabel, "setNumberOfLines:", objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1);
}

- (id)titleForContact:(id)a3
{
  id v4 = a3;
  v5 = [(CNLinkedCardsCell *)self delegate];
  v6 = [v5 contactViewCache];

  v7 = [v6 containerForContact:v4];
  if ([v7 type] == 1003)
  {
    v8 = [v7 name];
  }
  else
  {
    v9 = [v6 accountForContact:v4];
    v8 = objc_msgSend(MEMORY[0x1E4F1B8A8], "_cnui_displayNameForACAccount:", v9);
  }

  return v8;
}

- (void)setCardGroupItem:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNLinkedCardsCell;
  id v5 = [(CNContactCell *)&v13 cardGroupItem];

  if (v5 != v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)CNLinkedCardsCell;
    [(CNContactCell *)&v12 setCardGroupItem:v4];
    v6 = [v4 contact];
    if (v6)
    {
      v7 = [(CNLinkedCardsCell *)self titleForContact:v6];
      v8 = [(CNLinkedCardsCell *)self sourceLabel];
      [v8 setText:v7];

      id v9 = objc_alloc_init(MEMORY[0x1E4F1B910]);
      [v9 setStyle:0];
      [v9 setFallbackStyle:-1];
      v10 = [v9 stringFromContact:v6];
      v11 = [(CNLinkedCardsCell *)self nameLabel];
      [v11 setText:v10];
    }
  }
}

- (void)performDefaultAction
{
  id v4 = [(CNLinkedCardsCell *)self delegate];
  objc_super v3 = [(CNContactCell *)self cardGroupItem];
  [v4 propertyCell:self performActionForItem:v3 withTransportType:0];
}

- (BOOL)shouldPerformDefaultAction
{
  return 1;
}

- (id)valueView
{
  nameLabel = self->_nameLabel;
  if (!nameLabel)
  {
    id v4 = [(CNLabeledCell *)self standardValueView];
    id v5 = self->_nameLabel;
    self->_nameLabel = v4;

    nameLabel = self->_nameLabel;
  }

  return nameLabel;
}

- (id)labelView
{
  sourceLabel = self->_sourceLabel;
  if (!sourceLabel)
  {
    id v4 = [(CNLabeledCell *)self standardLabelView];
    id v5 = self->_sourceLabel;
    self->_sourceLabel = v4;

    sourceLabel = self->_sourceLabel;
  }

  return sourceLabel;
}

+ (BOOL)wantsChevron
{
  return 1;
}

@end