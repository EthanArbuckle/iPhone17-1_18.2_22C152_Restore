@interface CNAccountsAndGroupsSection
- (BOOL)isAllContactsGlobalSection;
- (BOOL)isEqual:(id)a3;
- (NSArray)items;
- (NSString)identifier;
- (NSString)title;
- (id)titleProvider;
- (unint64_t)hash;
- (void)setIdentifier:(id)a3;
- (void)setIsAllContactsGlobalSection:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleProvider:(id)a3;
@end

@implementation CNAccountsAndGroupsSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_titleProvider, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setTitleProvider:(id)a3
{
}

- (id)titleProvider
{
  return self->_titleProvider;
}

- (void)setItems:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setIsAllContactsGlobalSection:(BOOL)a3
{
  self->_isAllContactsGlobalSection = a3;
}

- (BOOL)isAllContactsGlobalSection
{
  return self->_isAllContactsGlobalSection;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CNAccountsAndGroupsSection *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([(CNAccountsAndGroupsSection *)v4 identifier],
          v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      v6 = [(CNAccountsAndGroupsSection *)v4 identifier];
      v7 = [(CNAccountsAndGroupsSection *)self identifier];
      char v8 = [v6 isEqualToString:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [(CNAccountsAndGroupsSection *)self identifier];
  if (v3)
  {
    v4 = [(CNAccountsAndGroupsSection *)self identifier];
    id v5 = (id)[v4 hash];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CNAccountsAndGroupsSection;
    id v5 = [(CNAccountsAndGroupsSection *)&v7 hash];
  }

  return (unint64_t)v5;
}

- (NSString)title
{
  if (!self->_title)
  {
    v3 = [(CNAccountsAndGroupsSection *)self titleProvider];

    if (v3)
    {
      v4 = [(CNAccountsAndGroupsSection *)self titleProvider];
      v4[2]();
      id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      title = self->_title;
      self->_title = v5;
    }
  }
  objc_super v7 = self->_title;

  return v7;
}

@end