@interface CNContactChangeRequest
+ (BOOL)supportsSecureCoding;
+ (id)contactChangeRequestWithKind:(int64_t)a3 contacts:(id)a4 linkIdentifier:(id)a5;
- (CNContactChangeRequest)initWithCoder:(id)a3;
- (CNContactChangeRequest)initWithKind:(int64_t)a3 contacts:(id)a4 linkIdentifier:(id)a5;
- (NSArray)contactIdentifiers;
- (NSArray)contacts;
- (NSString)linkIdentifier;
- (int64_t)kind;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNContactChangeRequest

+ (id)contactChangeRequestWithKind:(int64_t)a3 contacts:(id)a4 linkIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = (void *)[objc_alloc((Class)a1) initWithKind:a3 contacts:v9 linkIdentifier:v8];

  return v10;
}

- (CNContactChangeRequest)initWithKind:(int64_t)a3 contacts:(id)a4 linkIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNContactChangeRequest;
  v10 = [(CNContactChangeRequest *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    contacts = v10->_contacts;
    v10->_contacts = (NSArray *)v11;

    v10->_kind = a3;
    uint64_t v13 = [v9 copy];
    linkIdentifier = v10->_linkIdentifier;
    v10->_linkIdentifier = (NSString *)v13;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactChangeRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNContactChangeRequest;
  v5 = [(CNContactChangeRequest *)&v16 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_contacts"];
    contacts = v5->_contacts;
    v5->_contacts = (NSArray *)v9;

    v5->_kind = [v4 decodeIntegerForKey:@"_kind"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_linkIdentifier"];
    v12 = (NSString *)[v11 copy];
    linkIdentifier = v5->_linkIdentifier;
    v5->_linkIdentifier = v12;

    objc_storeStrong((id *)&v5->_linkIdentifier, v12);
    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  contacts = self->_contacts;
  id v5 = a3;
  [v5 encodeObject:contacts forKey:@"_contacts"];
  [v5 encodeInteger:self->_kind forKey:@"_kind"];
  [v5 encodeObject:self->_linkIdentifier forKey:@"_linkIdentifier"];
}

- (NSArray)contactIdentifiers
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_contacts, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = self->_contacts;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v9 isUnified])
        {
          long long v19 = 0u;
          long long v20 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          v10 = objc_msgSend(v9, "linkedContactsFromStoreWithIdentifier:", 0, 0);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v18;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v18 != v13) {
                  objc_enumerationMutation(v10);
                }
                v15 = [*(id *)(*((void *)&v17 + 1) + 8 * j) identifier];
                [v3 addObject:v15];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v12);
          }
        }
        else
        {
          v10 = [v9 identifier];
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (int64_t)kind
{
  return self->_kind;
}

- (NSString)linkIdentifier
{
  return self->_linkIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkIdentifier, 0);

  objc_storeStrong((id *)&self->_contacts, 0);
}

@end