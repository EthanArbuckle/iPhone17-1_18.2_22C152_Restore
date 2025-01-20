@interface CNAvatarCacheChangeAnalysis
- (CNAvatarCacheChangeAnalysis)initWithCurrentChangeHistoryToken:(id)a3 identifiersOfAffectedContacts:(id)a4;
- (NSArray)identifiersOfAffectedContacts;
- (NSData)currentChangeHistoryToken;
- (id)description;
@end

@implementation CNAvatarCacheChangeAnalysis

- (CNAvatarCacheChangeAnalysis)initWithCurrentChangeHistoryToken:(id)a3 identifiersOfAffectedContacts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNAvatarCacheChangeAnalysis;
  v8 = [(CNAvatarCacheChangeAnalysis *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    currentChangeHistoryToken = v8->_currentChangeHistoryToken;
    v8->_currentChangeHistoryToken = (NSData *)v9;

    uint64_t v11 = [v7 copy];
    identifiersOfAffectedContacts = v8->_identifiersOfAffectedContacts;
    v8->_identifiersOfAffectedContacts = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"identifiers" object:self->_identifiersOfAffectedContacts];
  id v5 = (id)[v3 appendName:@"token" object:self->_currentChangeHistoryToken];
  id v6 = [v3 build];

  return v6;
}

- (NSData)currentChangeHistoryToken
{
  return self->_currentChangeHistoryToken;
}

- (NSArray)identifiersOfAffectedContacts
{
  return self->_identifiersOfAffectedContacts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersOfAffectedContacts, 0);
  objc_storeStrong((id *)&self->_currentChangeHistoryToken, 0);
}

@end