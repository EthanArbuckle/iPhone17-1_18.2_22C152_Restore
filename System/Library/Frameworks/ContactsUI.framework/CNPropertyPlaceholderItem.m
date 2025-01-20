@interface CNPropertyPlaceholderItem
- (CNPropertyPlaceholderItem)initWithProperty:(id)a3;
- (NSString)property;
- (NSString)title;
- (void)setProperty:(id)a3;
@end

@implementation CNPropertyPlaceholderItem

- (void).cxx_destruct
{
}

- (void)setProperty:(id)a3
{
}

- (NSString)property
{
  return self->_property;
}

- (NSString)title
{
  v2 = [(CNPropertyPlaceholderItem *)self property];
  if ([v2 isEqualToString:@"birthdays"])
  {
    id v3 = (id)*MEMORY[0x1E4F1AD90];

    v2 = v3;
  }
  v4 = CNUILocalizedStringForPropertyWithFormatKey(@"ADD_NEW_ITEM", v2);

  return (NSString *)v4;
}

- (CNPropertyPlaceholderItem)initWithProperty:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNPropertyPlaceholderItem;
  v6 = [(CNPropertyPlaceholderItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_property, a3);
  }

  return v7;
}

@end