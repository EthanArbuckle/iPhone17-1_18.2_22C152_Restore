@interface CNCardLinkedCardsGroup
- (NSArray)linkedContacts;
- (id)displayItems;
- (id)editingItems;
- (id)title;
- (void)setLinkedContacts:(id)a3;
@end

@implementation CNCardLinkedCardsGroup

- (void).cxx_destruct
{
}

- (void)setLinkedContacts:(id)a3
{
}

- (NSArray)linkedContacts
{
  return self->_linkedContacts;
}

- (id)editingItems
{
  v2 = [(CNCardLinkedCardsGroup *)self displayItems];
  v3 = (void *)[v2 mutableCopy];

  v4 = objc_alloc_init(CNCardLinkedCardsPlaceholderGroupItem);
  [v3 addObject:v4];

  return v3;
}

- (id)displayItems
{
  v2 = [(CNCardLinkedCardsGroup *)self linkedContacts];
  v3 = objc_msgSend(v2, "_cn_filter:", &__block_literal_global_2127);

  if ((unint64_t)[v3 count] < 2)
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v4 = objc_msgSend(v3, "_cn_map:", &__block_literal_global_10);
  }

  return v4;
}

CNCardLinkedCardsGroupItem *__38__CNCardLinkedCardsGroup_displayItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[CNCardLinkedCardsGroupItem alloc] initWithContact:v2];

  return v3;
}

uint64_t __38__CNCardLinkedCardsGroup_displayItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isImplicitAugmentation] ^ 1;
}

- (id)title
{
  id v2 = CNContactsUIBundle();
  v3 = [v2 localizedStringForKey:@"LINKED_CARDS_TABLE_SECTION_TITLE" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

@end