@interface FKBankConnectOsloProviderResponse
- (BOOL)isErrorResponse;
- (FKBankConnectOsloProviderResponse)initWithDictionary:(id)a3;
- (id)accountForPrimaryIdentifier:(id)a3;
- (id)balanceForPrimaryIdentifier:(id)a3;
- (id)description;
- (id)initForError;
- (id)primaryAccountIdentifiers;
- (unint64_t)count;
- (void)setIsErrorResponse:(BOOL)a3;
@end

@implementation FKBankConnectOsloProviderResponse

- (id)accountForPrimaryIdentifier:(id)a3
{
  return [(NSDictionary *)self->_primaryAccountIdentifiersToAccounts objectForKey:a3];
}

- (id)balanceForPrimaryIdentifier:(id)a3
{
  v3 = [(NSDictionary *)self->_primaryAccountIdentifiersToAccounts objectForKey:a3];
  v4 = [v3 balance];

  return v4;
}

- (id)primaryAccountIdentifiers
{
  return [(NSDictionary *)self->_primaryAccountIdentifiersToAccounts allKeys];
}

- (FKBankConnectOsloProviderResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FKBankConnectOsloProviderResponse;
  v5 = [(FKBankConnectOsloProviderResponse *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_isErrorResponse = 0;
    uint64_t v7 = [v4 copy];
    primaryAccountIdentifiersToAccounts = v6->_primaryAccountIdentifiersToAccounts;
    v6->_primaryAccountIdentifiersToAccounts = (NSDictionary *)v7;
  }
  return v6;
}

- (unint64_t)count
{
  if (self->_isErrorResponse) {
    return 1;
  }
  else {
    return [(NSDictionary *)self->_primaryAccountIdentifiersToAccounts count];
  }
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  objc_msgSend(v3, "appendFormat:", @"<%@: %p; %@>",
    objc_opt_class(),
    self,
    self->_primaryAccountIdentifiersToAccounts);

  return v3;
}

- (id)initForError
{
  v6.receiver = self;
  v6.super_class = (Class)FKBankConnectOsloProviderResponse;
  v2 = [(FKBankConnectOsloProviderResponse *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_isErrorResponse = 1;
    primaryAccountIdentifiersToAccounts = v2->_primaryAccountIdentifiersToAccounts;
    v2->_primaryAccountIdentifiersToAccounts = (NSDictionary *)MEMORY[0x263EFFA78];
  }
  return v3;
}

- (BOOL)isErrorResponse
{
  return self->_isErrorResponse;
}

- (void)setIsErrorResponse:(BOOL)a3
{
  self->_isErrorResponse = a3;
}

- (void).cxx_destruct
{
}

@end