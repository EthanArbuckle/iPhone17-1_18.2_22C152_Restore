@interface CNStaticIdentityCell
+ (BOOL)wantsChevron;
- (BOOL)isValueTextValid;
- (BOOL)shouldPerformDefaultAction;
- (CNPropertyCellDelegate)delegate;
- (UILabel)labelLabel;
- (UILabel)valueLabel;
- (id)labelView;
- (id)valueView;
- (void)performDefaultAction;
- (void)setCardGroupItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setValueTextAttributes:(id)a3;
- (void)updateConstraints;
@end

@implementation CNStaticIdentityCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_labelLabel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (UILabel)labelLabel
{
  return self->_labelLabel;
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
  v3.super_class = (Class)CNStaticIdentityCell;
  [(CNContactCell *)&v3 updateConstraints];
  -[UILabel setNumberOfLines:](self->_labelLabel, "setNumberOfLines:", objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1);
  -[UILabel setNumberOfLines:](self->_valueLabel, "setNumberOfLines:", objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1);
}

- (void)setCardGroupItem:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNStaticIdentityCell;
  id v5 = [(CNContactCell *)&v12 cardGroupItem];

  if (v5 != v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)CNStaticIdentityCell;
    [(CNContactCell *)&v11 setCardGroupItem:v4];
    v6 = [v4 identity];
    if (v6)
    {
      v7 = CNContactsUIBundle();
      v8 = [v7 localizedStringForKey:@"CARD_ACTION_SHOW_STATIC_IDENTITY" value:&stru_1ED8AC728 table:@"Localized-NARWHAL"];
      v9 = [(CNStaticIdentityCell *)self labelLabel];
      [v9 setText:v8];

      v10 = [(CNStaticIdentityCell *)self valueLabel];
      [v10 setText:v6];
    }
  }
}

- (void)performDefaultAction
{
  id v4 = [(CNStaticIdentityCell *)self delegate];
  objc_super v3 = [(CNContactCell *)self cardGroupItem];
  [v4 propertyCell:self performActionForItem:v3 withTransportType:0];
}

- (BOOL)shouldPerformDefaultAction
{
  return 1;
}

- (BOOL)isValueTextValid
{
  v2 = [(CNStaticIdentityCell *)self valueLabel];
  objc_super v3 = [v2 text];

  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))()) {
    char v4 = 0;
  }
  else {
    char v4 = [MEMORY[0x1E4F5A700] isValidStaticKeyString:v3];
  }

  return v4;
}

- (void)setValueTextAttributes:(id)a3
{
  char v4 = (void *)[a3 mutableCopy];
  id v5 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:0 options:0];
  v6 = (void *)MEMORY[0x1E4FB08E0];
  [v5 pointSize];
  v7 = objc_msgSend(v6, "monospacedSystemFontOfSize:weight:");
  [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  if ([(CNStaticIdentityCell *)self isValueTextValid]) {
    +[CNUIColorRepository contactCardStaticIdentityValidTextColor];
  }
  else {
  v8 = +[CNUIColorRepository contactCardStaticIdentityInvalidTextColor];
  }
  [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

  v9.receiver = self;
  v9.super_class = (Class)CNStaticIdentityCell;
  [(CNLabeledCell *)&v9 setValueTextAttributes:v4];
}

- (id)valueView
{
  valueLabel = self->_valueLabel;
  if (!valueLabel)
  {
    char v4 = [(CNLabeledCell *)self standardValueView];
    id v5 = self->_valueLabel;
    self->_valueLabel = v4;

    [(CNLabeledCell *)self setValueViewNeedsHuggingContent:0];
    valueLabel = self->_valueLabel;
  }

  return valueLabel;
}

- (id)labelView
{
  labelLabel = self->_labelLabel;
  if (!labelLabel)
  {
    char v4 = [(CNLabeledCell *)self standardLabelView];
    id v5 = self->_labelLabel;
    self->_labelLabel = v4;

    labelLabel = self->_labelLabel;
  }

  return labelLabel;
}

+ (BOOL)wantsChevron
{
  return 0;
}

@end