@interface CNSaveRequestContactIdentifierCollector
- (CNSaveRequest)request;
- (CNSaveRequestContactIdentifierCollector)initWithSaveRequest:(id)a3;
- (NSArray)allContactIdentifiers;
- (NSArray)insertedContactIdentifiers;
- (NSMutableArray)allIdentifiers;
- (NSMutableArray)insertedIdentifiers;
- (void)collectIdentifiers;
- (void)visitAddContactEvent:(id)a3;
- (void)visitDeleteContactEvent:(id)a3;
- (void)visitDifferentMeCardEvent:(id)a3;
- (void)visitLinkContactsEvent:(id)a3;
- (void)visitPreferredContactForImageEvent:(id)a3;
- (void)visitPreferredContactForNameEvent:(id)a3;
- (void)visitUnlinkContactEvent:(id)a3;
- (void)visitUpdateContactEvent:(id)a3;
@end

@implementation CNSaveRequestContactIdentifierCollector

- (CNSaveRequestContactIdentifierCollector)initWithSaveRequest:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNSaveRequestContactIdentifierCollector;
  v6 = [(CNSaveRequestContactIdentifierCollector *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    allIdentifiers = v7->_allIdentifiers;
    v7->_allIdentifiers = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    insertedIdentifiers = v7->_insertedIdentifiers;
    v7->_insertedIdentifiers = (NSMutableArray *)v10;

    v12 = v7;
  }

  return v7;
}

- (void)collectIdentifiers
{
}

- (NSArray)allContactIdentifiers
{
  v2 = (void *)[(NSMutableArray *)self->_allIdentifiers copy];

  return (NSArray *)v2;
}

- (NSArray)insertedContactIdentifiers
{
  v2 = (void *)[(NSMutableArray *)self->_insertedIdentifiers copy];

  return (NSArray *)v2;
}

- (void)visitAddContactEvent:(id)a3
{
  allIdentifiers = self->_allIdentifiers;
  id v5 = a3;
  v6 = [v5 contact];
  v7 = [v6 identifier];
  [(NSMutableArray *)allIdentifiers addObject:v7];

  insertedIdentifiers = self->_insertedIdentifiers;
  id v10 = [v5 contact];

  v9 = [v10 identifier];
  [(NSMutableArray *)insertedIdentifiers addObject:v9];
}

- (void)visitUpdateContactEvent:(id)a3
{
  allIdentifiers = self->_allIdentifiers;
  id v5 = [a3 contact];
  v4 = [v5 identifier];
  [(NSMutableArray *)allIdentifiers addObject:v4];
}

- (void)visitDeleteContactEvent:(id)a3
{
  allIdentifiers = self->_allIdentifiers;
  id v4 = [a3 contactIdentifier];
  [(NSMutableArray *)allIdentifiers addObject:v4];
}

- (void)visitLinkContactsEvent:(id)a3
{
  allIdentifiers = self->_allIdentifiers;
  id v5 = a3;
  v6 = [v5 fromContact];
  v7 = [v6 identifier];
  [(NSMutableArray *)allIdentifiers addObject:v7];

  uint64_t v8 = self->_allIdentifiers;
  id v10 = [v5 toContact];

  v9 = [v10 identifier];
  [(NSMutableArray *)v8 addObject:v9];
}

- (void)visitPreferredContactForImageEvent:(id)a3
{
  allIdentifiers = self->_allIdentifiers;
  id v5 = a3;
  v6 = [v5 preferredContact];
  v7 = [v6 identifier];
  [(NSMutableArray *)allIdentifiers addObject:v7];

  uint64_t v8 = self->_allIdentifiers;
  id v10 = [v5 unifiedContact];

  v9 = [v10 identifier];
  [(NSMutableArray *)v8 addObject:v9];
}

- (void)visitPreferredContactForNameEvent:(id)a3
{
  allIdentifiers = self->_allIdentifiers;
  id v5 = a3;
  v6 = [v5 preferredContact];
  v7 = [v6 identifier];
  [(NSMutableArray *)allIdentifiers addObject:v7];

  uint64_t v8 = self->_allIdentifiers;
  id v10 = [v5 unifiedContact];

  v9 = [v10 identifier];
  [(NSMutableArray *)v8 addObject:v9];
}

- (void)visitUnlinkContactEvent:(id)a3
{
  allIdentifiers = self->_allIdentifiers;
  id v5 = [a3 contact];
  id v4 = [v5 identifier];
  [(NSMutableArray *)allIdentifiers addObject:v4];
}

- (void)visitDifferentMeCardEvent:(id)a3
{
  allIdentifiers = self->_allIdentifiers;
  id v4 = [a3 contactIdentifier];
  [(NSMutableArray *)allIdentifiers _cn_addNonNilObject:v4];
}

- (CNSaveRequest)request
{
  return (CNSaveRequest *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableArray)allIdentifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableArray)insertedIdentifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertedIdentifiers, 0);
  objc_storeStrong((id *)&self->_allIdentifiers, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end