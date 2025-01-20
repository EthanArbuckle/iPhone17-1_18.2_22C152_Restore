@interface CNCardLinkedCardsPlaceholderGroupItem
- (NSString)title;
@end

@implementation CNCardLinkedCardsPlaceholderGroupItem

- (NSString)title
{
  v2 = CNContactsUIBundle();
  v3 = [v2 localizedStringForKey:@"LINK_ANOTHER_CONTACT_TABLE_CELL_TITLE" value:&stru_1ED8AC728 table:@"Localized"];

  return (NSString *)v3;
}

@end