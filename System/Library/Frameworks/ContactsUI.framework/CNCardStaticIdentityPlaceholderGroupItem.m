@interface CNCardStaticIdentityPlaceholderGroupItem
- (NSString)title;
@end

@implementation CNCardStaticIdentityPlaceholderGroupItem

- (NSString)title
{
  v2 = CNContactsUIBundle();
  v3 = [v2 localizedStringForKey:@"CARD_ACTION_ADD_STATIC_IDENTITY" value:&stru_1ED8AC728 table:@"Localized-NARWHAL"];

  return (NSString *)v3;
}

@end