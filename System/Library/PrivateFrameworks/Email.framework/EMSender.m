@interface EMSender
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (EMSender)initWithCoder:(id)a3;
- (EMSender)initWithDatabaseID:(int64_t)a3 addresses:(id)a4 contactIdentifier:(id)a5 bucket:(int64_t)a6;
- (NSArray)addresses;
- (NSString)contactIdentifier;
- (NSString)displayName;
- (id)_bestDisplayNameFromDisplayNames:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)bucket;
- (int64_t)compare:(id)a3;
- (int64_t)databaseID;
- (unint64_t)hash;
- (void)addAddress:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)removeAddress:(id)a3;
- (void)setBucket:(int64_t)a3;
- (void)setDatabaseID:(int64_t)a3;
@end

@implementation EMSender

- (EMSender)initWithDatabaseID:(int64_t)a3 addresses:(id)a4 contactIdentifier:(id)a5 bucket:(int64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)EMSender;
  v12 = [(EMSender *)&v21 init];
  v13 = v12;
  if (v12)
  {
    v12->_databaseID = a3;
    id v14 = objc_alloc(MEMORY[0x1E4F60DA0]);
    v15 = (void *)[v10 mutableCopy];
    uint64_t v16 = [v14 initWithObject:v15];
    addresses = v13->_addresses;
    v13->_addresses = (EFLocked *)v16;

    uint64_t v18 = [v11 copy];
    contactIdentifier = v13->_contactIdentifier;
    v13->_contactIdentifier = (NSString *)v18;

    v13->_bucket = a6;
  }

  return v13;
}

- (void)dealloc
{
  id v3 = (id)EFAtomicObjectRelease();
  v4.receiver = self;
  v4.super_class = (Class)EMSender;
  [(EMSender *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (EMSender *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else if ([(EMSender *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    int64_t v6 = [(EMSender *)self databaseID];
    BOOL v7 = v6 == [(EMSender *)v5 databaseID];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return 1;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(EMSender *)self displayName];
  int64_t v6 = [v4 displayName];
  int64_t v7 = [v5 localizedStandardCompare:v6];

  if (!v7)
  {
    v8 = [(EMSender *)self addresses];
    v9 = [v4 addresses];
    unint64_t v10 = [v8 count];
    if (v10 >= [v9 count])
    {
      unint64_t v11 = [v8 count];
      if (v11 <= [v9 count])
      {
        v12 = [v8 firstObject];
        v13 = [v12 stringValue];
        id v14 = [v9 firstObject];
        v15 = [v14 stringValue];
        int64_t v7 = [v13 localizedStandardCompare:v15];
      }
      else
      {
        int64_t v7 = 1;
      }
    }
    else
    {
      int64_t v7 = -1;
    }
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t v5 = [(EMSender *)self databaseID];
  int64_t v6 = [(EMSender *)self addresses];
  int64_t v7 = [(EMSender *)self contactIdentifier];
  v8 = objc_msgSend(v4, "initWithDatabaseID:addresses:contactIdentifier:bucket:", v5, v6, v7, -[EMSender bucket](self, "bucket"));

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMSender)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EMSender;
  int64_t v5 = [(EMSender *)&v18 init];
  if (v5)
  {
    v5->_databaseID = [v4 decodeInt64ForKey:@"EFPropertyKey_databaseID"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_contactIdentifier"];
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v6;

    v5->_bucket = [v4 decodeIntegerForKey:@"EFPropertyKey_bucket"];
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    unint64_t v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"EFPropertyKey_addresses"];

    id v13 = objc_alloc(MEMORY[0x1E4F60DA0]);
    id v14 = (void *)[v12 mutableCopy];
    uint64_t v15 = [v13 initWithObject:v14];
    addresses = v5->_addresses;
    v5->_addresses = (EFLocked *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeInt64:forKey:", -[EMSender databaseID](self, "databaseID"), @"EFPropertyKey_databaseID");
  id v4 = [(EMSender *)self addresses];
  [v6 encodeObject:v4 forKey:@"EFPropertyKey_addresses"];

  int64_t v5 = [(EMSender *)self contactIdentifier];
  [v6 encodeObject:v5 forKey:@"EFPropertyKey_contactIdentifier"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[EMSender bucket](self, "bucket"), @"EFPropertyKey_bucket");
}

- (void)addAddress:(id)a3
{
  id v4 = a3;
  addresses = self->_addresses;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __23__EMSender_addAddress___block_invoke;
  v7[3] = &unk_1E63E6640;
  id v8 = v4;
  id v6 = v4;
  [(EFLocked *)addresses performWhileLocked:v7];
}

uint64_t __23__EMSender_addAddress___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (void)removeAddress:(id)a3
{
  id v4 = a3;
  addresses = self->_addresses;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __26__EMSender_removeAddress___block_invoke;
  v7[3] = &unk_1E63E6640;
  id v8 = v4;
  id v6 = v4;
  [(EFLocked *)addresses performWhileLocked:v7];
}

uint64_t __26__EMSender_removeAddress___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObject:*(void *)(a1 + 32)];
}

- (NSArray)addresses
{
  return (NSArray *)[(EFLocked *)self->_addresses getObject];
}

- (NSString)displayName
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = EFAtomicObjectLoad();
  if (!v3)
  {
    id v4 = [(EMSender *)self addresses];
    uint64_t v16 = objc_msgSend(v4, "ef_compactMap:", &__block_literal_global_50);
    int64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28BD0]) initWithArray:v16];
    id v6 = objc_msgSend(v5, "ef_mostCommonObjects");
    uint64_t v7 = [v6 count];
    if (v7)
    {
      if (v7 == 1) {
        [v6 firstObject];
      }
      else {
      id v13 = [(EMSender *)self _bestDisplayNameFromDisplayNames:v6];
      }
      if (!v13)
      {
LABEL_17:
        id v3 = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = v4;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v8);
            }
            v12 = [*(id *)(*((void *)&v17 + 1) + 8 * i) emailAddressValue];
            id v13 = [v12 simpleAddress];

            if (v13)
            {

              goto LABEL_19;
            }
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

      id v14 = [v8 firstObject];
      id v13 = [v14 stringValue];

      if (!v13) {
        goto LABEL_17;
      }
    }
LABEL_19:
    id v3 = EFAtomicObjectSetIfNil();

    goto LABEL_20;
  }
LABEL_21:
  return (NSString *)v3;
}

id __23__EMSender_displayName__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 emailAddressValue];
  id v3 = [v2 displayName];

  return v3;
}

- (id)_bestDisplayNameFromDisplayNames:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v24;
  uint64_t v3 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v3)
  {
    BOOL v33 = 0;
    BOOL v30 = 0;
    unint64_t v27 = 0;
    uint64_t v31 = *(void *)v35;
    do
    {
      uint64_t v32 = v3;
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v35 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        id v6 = [MEMORY[0x1E4F5A470] componentsFromString:v5];
        uint64_t v7 = [v6 givenName];
        id v8 = (void *)v7;
        BOOL v9 = v7 != 0;
        if (!v33 || v7)
        {
          uint64_t v10 = [v6 familyName];
          unint64_t v11 = (void *)v10;
          BOOL v29 = v10 != 0;
          if (!v30 || v10)
          {
            BOOL v26 = v9;
            v12 = [v6 namePrefix];

            id v13 = [v6 middleName];

            id v14 = [v6 nameSuffix];

            uint64_t v15 = [v6 nickname];
            uint64_t v16 = v15;
            BOOL v17 = v12 != 0;
            uint64_t v18 = 1;
            if (v12) {
              uint64_t v18 = 2;
            }
            if (v13) {
              BOOL v17 = v18;
            }
            if (v14) {
              unint64_t v19 = v17 + 1;
            }
            else {
              unint64_t v19 = v17;
            }

            if (v16) {
              ++v19;
            }
            if (v27 <= v19)
            {
              if (v8 != 0 && !v33 || v11 != 0 && !v30 || v19 > v27)
              {
                [v25 removeAllObjects];
                BOOL v33 = v26;
                BOOL v30 = v29;
                unint64_t v27 = v19;
              }
              [v25 addObject:v5];
            }
          }
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v3);
  }

  if ([v25 count] == 1)
  {
    long long v20 = [v25 firstObject];
  }
  else
  {
    objc_super v21 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"length" ascending:0];
    v38 = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
    [v25 sortUsingDescriptors:v22];

    long long v20 = [v25 firstObject];
  }
  return v20;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (int64_t)bucket
{
  return self->_bucket;
}

- (void)setBucket:(int64_t)a3
{
  self->_bucket = a3;
}

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (void)setDatabaseID:(int64_t)a3
{
  self->_databaseID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
}

@end