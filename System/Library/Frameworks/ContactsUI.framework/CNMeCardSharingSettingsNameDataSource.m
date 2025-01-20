@interface CNMeCardSharingSettingsNameDataSource
- (BOOL)supportsSelection;
- (CNContact)contact;
- (NSArray)items;
- (NSString)formattedName;
- (id)itemForIndex:(unint64_t)a3;
- (id)sectionFooterLabel;
- (id)sectionHeaderLabel;
- (unint64_t)numberOfItems;
- (void)setContact:(id)a3;
- (void)setFormattedName:(id)a3;
- (void)setItems:(id)a3;
@end

@implementation CNMeCardSharingSettingsNameDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedName, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)setFormattedName:(id)a3
{
}

- (NSString)formattedName
{
  return self->_formattedName;
}

- (void)setItems:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (id)itemForIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)numberOfItems
{
  return 2;
}

- (id)sectionFooterLabel
{
  return 0;
}

- (id)sectionHeaderLabel
{
  return 0;
}

- (BOOL)supportsSelection
{
  return 0;
}

@end