@interface CNMeCardSharingAudienceDataSource
- (BOOL)shouldShowEveryone;
- (BOOL)supportsSelection;
- (CNMeCardSharingAudienceDataSource)initWithSelectedSharingAudience:(unint64_t)a3;
- (CNMeCardSharingRowItem)selectedItem;
- (NSArray)items;
- (NSArray)valuesArray;
- (id)itemForIndex:(unint64_t)a3;
- (id)sectionFooterLabel;
- (id)sectionHeaderLabel;
- (unint64_t)indexForSharingAudience:(unint64_t)a3;
- (unint64_t)numberOfItems;
- (unint64_t)selectedIndex;
- (unint64_t)selectedSharingAudience;
- (unint64_t)sharingAudienceForIndex:(unint64_t)a3;
- (void)didSelectItemAtIndex:(unint64_t)a3;
- (void)reloadItems;
- (void)setItems:(id)a3;
- (void)setSelectedItem:(id)a3;
- (void)setSelectedSharingAudience:(unint64_t)a3;
- (void)setShouldShowEveryone:(BOOL)a3;
- (void)setValuesArray:(id)a3;
@end

@implementation CNMeCardSharingAudienceDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_valuesArray, 0);

  objc_storeStrong((id *)&self->_selectedItem, 0);
}

- (void)setItems:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setValuesArray:(id)a3
{
}

- (NSArray)valuesArray
{
  return self->_valuesArray;
}

- (void)setShouldShowEveryone:(BOOL)a3
{
  self->_shouldShowEveryone = a3;
}

- (BOOL)shouldShowEveryone
{
  return self->_shouldShowEveryone;
}

- (void)setSelectedItem:(id)a3
{
}

- (CNMeCardSharingRowItem)selectedItem
{
  return self->_selectedItem;
}

- (unint64_t)selectedSharingAudience
{
  return self->_selectedSharingAudience;
}

- (void)didSelectItemAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_items count] > a3)
  {
    items = self->_items;
    v8 = self->_selectedItem;
    v6 = [(NSArray *)items objectAtIndexedSubscript:a3];
    [(CNMeCardSharingRowItem *)v8 setIsSelected:0];
    [(CNMeCardSharingRowItem *)v6 setIsSelected:1];
    selectedItem = self->_selectedItem;
    self->_selectedItem = v6;

    self->_selectedSharingAudience = [(CNMeCardSharingAudienceDataSource *)self sharingAudienceForIndex:a3];
  }
}

- (id)itemForIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_items count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSArray *)self->_items objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (unint64_t)numberOfItems
{
  return [(NSArray *)self->_items count];
}

- (id)sectionFooterLabel
{
  unint64_t selectedSharingAudience = self->_selectedSharingAudience;
  if (selectedSharingAudience == 2)
  {
    v3 = CNContactsUIBundle();
    v4 = v3;
    v5 = @"SHARING_AUDIENCE_ALWAYS_ASK_FOOTER";
    goto LABEL_5;
  }
  if (selectedSharingAudience == 1)
  {
    v3 = CNContactsUIBundle();
    v4 = v3;
    v5 = @"SHARING_AUDIENCE_CONTACTS_ONLY_FOOTER";
LABEL_5:
    v6 = [v3 localizedStringForKey:v5 value:&stru_1ED8AC728 table:@"Localized"];

    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (id)sectionHeaderLabel
{
  v2 = CNContactsUIBundle();
  v3 = [v2 localizedStringForKey:@"SHARING_AUDIENCE_SECTION_HEADER" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

- (void)reloadItems
{
  id v19 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  v4 = [CNMeCardSharingRowItem alloc];
  v5 = CNContactsUIBundle();
  v6 = [v5 localizedStringForKey:@"SHARING_AUDIENCE_CONTACTS_ONLY" value:&stru_1ED8AC728 table:@"Localized"];
  v7 = [(CNMeCardSharingRowItem *)v4 initWithLabel:v6 accessoryView:0];

  [v19 addObject:v7];
  [v3 addObject:&unk_1ED9159C8];
  v8 = [CNMeCardSharingRowItem alloc];
  v9 = CNContactsUIBundle();
  v10 = [v9 localizedStringForKey:@"SHARING_AUDIENCE_ALWAYS_ASK" value:&stru_1ED8AC728 table:@"Localized"];
  v11 = [(CNMeCardSharingRowItem *)v8 initWithLabel:v10 accessoryView:0];

  [v19 addObject:v11];
  [v3 addObject:&unk_1ED9159E0];
  v12 = (NSArray *)[v19 copy];
  items = self->_items;
  self->_items = v12;

  v14 = (NSArray *)[v3 copy];
  valuesArray = self->_valuesArray;
  self->_valuesArray = v14;

  unint64_t v16 = [(CNMeCardSharingAudienceDataSource *)self indexForSharingAudience:self->_selectedSharingAudience];
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = [(NSArray *)self->_items objectAtIndexedSubscript:v16];
    selectedItem = self->_selectedItem;
    self->_selectedItem = v17;

    [(CNMeCardSharingRowItem *)self->_selectedItem setIsSelected:1];
  }
}

- (unint64_t)sharingAudienceForIndex:(unint64_t)a3
{
  v3 = [(NSArray *)self->_valuesArray objectAtIndexedSubscript:a3];
  unint64_t v4 = [v3 integerValue];

  return v4;
}

- (unint64_t)indexForSharingAudience:(unint64_t)a3
{
  unint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  unint64_t v5 = [(NSArray *)self->_valuesArray indexOfObject:v4];

  return v5;
}

- (unint64_t)selectedIndex
{
  return [(CNMeCardSharingAudienceDataSource *)self indexForSharingAudience:self->_selectedSharingAudience];
}

- (BOOL)supportsSelection
{
  return 1;
}

- (void)setSelectedSharingAudience:(unint64_t)a3
{
  if (self->_selectedSharingAudience != a3)
  {
    self->_unint64_t selectedSharingAudience = a3;
    unint64_t v4 = -[CNMeCardSharingAudienceDataSource indexForSharingAudience:](self, "indexForSharingAudience:");
    [(CNMeCardSharingAudienceDataSource *)self didSelectItemAtIndex:v4];
  }
}

- (CNMeCardSharingAudienceDataSource)initWithSelectedSharingAudience:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNMeCardSharingAudienceDataSource;
  unint64_t v4 = [(CNMeCardSharingAudienceDataSource *)&v8 init];
  unint64_t v5 = v4;
  if (v4)
  {
    v4->_unint64_t selectedSharingAudience = a3;
    [(CNMeCardSharingAudienceDataSource *)v4 reloadItems];
    v6 = v5;
  }

  return v5;
}

@end