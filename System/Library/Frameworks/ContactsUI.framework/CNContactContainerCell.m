@interface CNContactContainerCell
+ (BOOL)wantsChevron;
- (BOOL)shouldPerformDefaultAction;
- (CNPropertyCellDelegate)delegate;
- (UILabel)accountLabel;
- (UILabel)accountNameLabel;
- (id)labelView;
- (id)valueView;
- (void)performDefaultAction;
- (void)setCardGroupItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateConstraints;
@end

@implementation CNContactContainerCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountNameLabel, 0);
  objc_storeStrong((id *)&self->_accountLabel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (UILabel)accountNameLabel
{
  return self->_accountNameLabel;
}

- (UILabel)accountLabel
{
  return self->_accountLabel;
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
  v3.super_class = (Class)CNContactContainerCell;
  [(CNContactCell *)&v3 updateConstraints];
  -[UILabel setNumberOfLines:](self->_accountLabel, "setNumberOfLines:", objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1);
  -[UILabel setNumberOfLines:](self->_accountNameLabel, "setNumberOfLines:", objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1);
}

- (void)setCardGroupItem:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CNContactContainerCell;
  id v5 = [(CNContactCell *)&v22 cardGroupItem];

  if (v5 != v4)
  {
    v21.receiver = self;
    v21.super_class = (Class)CNContactContainerCell;
    [(CNContactCell *)&v21 setCardGroupItem:v4];
    if (v4)
    {
      v6 = [v4 containers];
      unint64_t v7 = [v6 count];

      if (v7 < 2)
      {
        v14 = [v4 containers];
        v9 = [v14 firstObject];

        v15 = [(CNContactContainerCell *)self delegate];
        v10 = [v15 contactViewCache];

        v11 = [v10 accountForContainer:v9];
        objc_msgSend(MEMORY[0x1E4F1B8A8], "_cnui_displayNameForACAccount:", v11);
      }
      else
      {
        v8 = NSString;
        v9 = CNContactsUIBundle();
        v10 = [v9 localizedStringForKey:@"N_ACCOUNTS" value:&stru_1ED8AC728 table:@"Localized"];
        v11 = [v4 containers];
        objc_msgSend(v8, "localizedStringWithFormat:", v10, objc_msgSend(v11, "count"));
      v13 = };

      v16 = CNContactsUIBundle();
      v17 = [v16 localizedStringForKey:@"ACCOUNT_CARD_ITEM_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
      v18 = [(CNContactContainerCell *)self accountLabel];
      [v18 setText:v17];

      v19 = v13;
      if (!v13)
      {
        v16 = CNContactsUIBundle();
        v19 = [v16 localizedStringForKey:@"UNKNOWN_SOURCE_STRING" value:&stru_1ED8AC728 table:@"Localized"];
      }
      v20 = [(CNContactContainerCell *)self accountNameLabel];
      [v20 setText:v19];

      if (!v13)
      {
      }
    }
    else
    {
      v12 = [(CNContactContainerCell *)self accountLabel];
      [v12 setText:0];

      v13 = [(CNContactContainerCell *)self accountNameLabel];
      [v13 setText:0];
    }
  }
}

- (void)performDefaultAction
{
  id v4 = [(CNContactContainerCell *)self delegate];
  objc_super v3 = [(CNContactCell *)self cardGroupItem];
  [v4 propertyCell:self performActionForItem:v3 withTransportType:0];
}

- (BOOL)shouldPerformDefaultAction
{
  return 1;
}

- (id)valueView
{
  accountNameLabel = self->_accountNameLabel;
  if (!accountNameLabel)
  {
    id v4 = [(CNLabeledCell *)self standardValueView];
    id v5 = self->_accountNameLabel;
    self->_accountNameLabel = v4;

    accountNameLabel = self->_accountNameLabel;
  }

  return accountNameLabel;
}

- (id)labelView
{
  accountLabel = self->_accountLabel;
  if (!accountLabel)
  {
    id v4 = [(CNLabeledCell *)self standardLabelView];
    id v5 = self->_accountLabel;
    self->_accountLabel = v4;

    accountLabel = self->_accountLabel;
  }

  return accountLabel;
}

+ (BOOL)wantsChevron
{
  return 1;
}

@end