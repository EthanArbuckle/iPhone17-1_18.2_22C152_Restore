@interface CNContact(ContactsUICore)
- (CNUIBackgroundColors)backgroundColors;
@end

@implementation CNContact(ContactsUICore)

- (CNUIBackgroundColors)backgroundColors
{
  v2 = [CNUIBackgroundColors alloc];
  v3 = [a1 imageBackgroundColorsData];
  v4 = [(CNUIBackgroundColors *)v2 initWithData:v3];

  return v4;
}

@end