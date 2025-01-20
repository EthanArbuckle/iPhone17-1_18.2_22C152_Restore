@interface CNContactStoreContactsFetchResult
- (CNContactStoreContactsFetchResult)initWithContacts:(id)a3;
- (NSArray)value;
- (void)setValue:(id)a3;
@end

@implementation CNContactStoreContactsFetchResult

- (CNContactStoreContactsFetchResult)initWithContacts:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContactStoreContactsFetchResult;
  v5 = [(CNContactStoreContactsFetchResult *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    value = v5->_value;
    v5->_value = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSArray)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end