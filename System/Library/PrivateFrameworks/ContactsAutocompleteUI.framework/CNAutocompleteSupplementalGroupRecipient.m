@interface CNAutocompleteSupplementalGroupRecipient
- (CNAutocompleteSupplementalGroupRecipient)initWithIdentifier:(id)a3 title:(id)a4 members:(id)a5;
- (NSArray)members;
- (NSString)identifier;
- (NSString)title;
@end

@implementation CNAutocompleteSupplementalGroupRecipient

- (CNAutocompleteSupplementalGroupRecipient)initWithIdentifier:(id)a3 title:(id)a4 members:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CNAutocompleteSupplementalGroupRecipient;
  v11 = [(CNAutocompleteSupplementalGroupRecipient *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    title = v11->_title;
    v11->_title = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    members = v11->_members;
    v11->_members = (NSArray *)v16;
  }
  return v11;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)members
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_members, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end