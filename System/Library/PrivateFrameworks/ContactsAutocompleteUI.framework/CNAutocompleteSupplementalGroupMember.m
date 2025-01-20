@interface CNAutocompleteSupplementalGroupMember
- (CNAutocompleteSupplementalGroupMember)initWithName:(id)a3 address:(id)a4 addressType:(int64_t)a5;
- (CNAutocompleteSupplementalGroupMember)initWithNameComponents:(id)a3 address:(id)a4 addressType:(int64_t)a5;
- (NSPersonNameComponents)nameComponents;
- (NSString)address;
- (NSString)name;
- (int64_t)addressType;
@end

@implementation CNAutocompleteSupplementalGroupMember

- (CNAutocompleteSupplementalGroupMember)initWithName:(id)a3 address:(id)a4 addressType:(int64_t)a5
{
  id v9 = a3;
  v10 = [(CNAutocompleteSupplementalGroupMember *)self initWithNameComponents:0 address:a4 addressType:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_name, a3);
  }

  return v11;
}

- (CNAutocompleteSupplementalGroupMember)initWithNameComponents:(id)a3 address:(id)a4 addressType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CNAutocompleteSupplementalGroupMember;
  v10 = [(CNAutocompleteSupplementalGroupMember *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    nameComponents = v10->_nameComponents;
    v10->_nameComponents = (NSPersonNameComponents *)v11;

    uint64_t v13 = [v9 copy];
    address = v10->_address;
    v10->_address = (NSString *)v13;

    v10->_addressType = a5;
  }

  return v10;
}

- (NSString)address
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)addressType
{
  return self->_addressType;
}

- (NSPersonNameComponents)nameComponents
{
  return (NSPersonNameComponents *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);

  objc_storeStrong((id *)&self->_address, 0);
}

@end