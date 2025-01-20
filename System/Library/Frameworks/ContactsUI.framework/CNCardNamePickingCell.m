@interface CNCardNamePickingCell
- (BOOL)isSuggested;
- (UILabel)nameLabel;
- (UILabel)sourceLabel;
- (id)labelView;
- (id)valueView;
- (void)setCardGroupItem:(id)a3;
@end

@implementation CNCardNamePickingCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);

  objc_storeStrong((id *)&self->_sourceLabel, 0);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (UILabel)sourceLabel
{
  return self->_sourceLabel;
}

- (BOOL)isSuggested
{
  return 0;
}

- (void)setCardGroupItem:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNCardNamePickingCell;
  id v5 = [(CNContactCell *)&v12 cardGroupItem];

  if (v5 != v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)CNCardNamePickingCell;
    [(CNContactCell *)&v11 setCardGroupItem:v4];
    v6 = CNContactsUIBundle();
    v7 = [v6 localizedStringForKey:@"NAME_LABEL" value:@"Name" table:@"Localized"];
    v8 = [(CNCardNamePickingCell *)self sourceLabel];
    [v8 setText:v7];

    v9 = [v4 displayName];
    v10 = [(CNCardNamePickingCell *)self nameLabel];
    [v10 setText:v9];
  }
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

@end