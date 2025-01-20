@interface BBThreadsMuteAssertion
+ (BOOL)supportsSecureCoding;
+ (id)threadsMuteAssertion;
+ (id)threadsMuteAssertionWithExpirationDateByThreadID:(id)a3;
- (BBThreadsMuteAssertion)initWithCoder:(id)a3;
- (BOOL)isActiveForThreadIdentifier:(id)a3 currentDate:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)expirationDateByThreadID;
- (NSSet)threadIDs;
- (id)_initWithExpirationDateByThreadID:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)toUNCMuteAssertion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)getNextExpirationDate:(id *)a3 wasPurged:(BOOL *)a4 currentDate:(id)a5;
- (void)setMutedUntilDate:(id)a3 forThreadIdentifier:(id)a4;
- (void)setUnmutedForThreadIdentifier:(id)a3;
@end

@implementation BBThreadsMuteAssertion

+ (id)threadsMuteAssertion
{
  v2 = [BBThreadsMuteAssertion alloc];
  id v3 = [(BBThreadsMuteAssertion *)v2 _initWithExpirationDateByThreadID:MEMORY[0x263EFFA78]];
  return v3;
}

+ (id)threadsMuteAssertionWithExpirationDateByThreadID:(id)a3
{
  id v3 = a3;
  id v4 = [[BBThreadsMuteAssertion alloc] _initWithExpirationDateByThreadID:v3];

  return v4;
}

- (id)_initWithExpirationDateByThreadID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BBThreadsMuteAssertion;
  v5 = [(BBMuteAssertion *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    v7 = (void *)v5[1];
    v5[1] = v6;
  }
  return v5;
}

- (NSDictionary)expirationDateByThreadID
{
  v2 = (void *)[(NSMutableDictionary *)self->_mutableExpirationDateByThreadID copy];
  return (NSDictionary *)v2;
}

- (BOOL)isActiveForThreadIdentifier:(id)a3 currentDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 length])
  {
    v8 = [(NSMutableDictionary *)self->_mutableExpirationDateByThreadID objectForKey:v6];
    if (!v7)
    {
LABEL_4:
      id v9 = [MEMORY[0x263EFF910] now];
      goto LABEL_7;
    }
  }
  else
  {
    v8 = 0;
    if (!v7) {
      goto LABEL_4;
    }
  }
  id v9 = v7;
LABEL_7:
  v10 = v9;
  if (v8) {
    BOOL v11 = [v8 compare:v9] == 1;
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)setMutedUntilDate:(id)a3 forThreadIdentifier:(id)a4
{
}

- (void)setUnmutedForThreadIdentifier:(id)a3
{
}

- (void)getNextExpirationDate:(id *)a3 wasPurged:(BOOL *)a4 currentDate:(id)a5
{
  v18 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a5;
  v19 = a4;
  *a4 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v8 = [(NSMutableDictionary *)self->_mutableExpirationDateByThreadID allKeys];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    BOOL v11 = 0;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v15 = -[NSMutableDictionary valueForKey:](self->_mutableExpirationDateByThreadID, "valueForKey:", v14, v18);
        if ([(BBThreadsMuteAssertion *)self isActiveForThreadIdentifier:v14 currentDate:v7])
        {
          if (!v11 || [v15 compare:v11] == -1)
          {
            id v16 = v15;

            BOOL v11 = v16;
          }
        }
        else
        {
          [(NSMutableDictionary *)self->_mutableExpirationDateByThreadID removeObjectForKey:v14];
          BOOL *v19 = 1;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
  else
  {
    BOOL v11 = 0;
  }

  id v17 = v11;
  id *v18 = v17;
}

- (NSSet)threadIDs
{
  v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [(NSMutableDictionary *)self->_mutableExpirationDateByThreadID allKeys];
  id v4 = (void *)[v3 copy];
  v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (unint64_t)hash
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 1;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 31;
  mutableExpirationDateByThreadID = self->_mutableExpirationDateByThreadID;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__BBThreadsMuteAssertion_hash__block_invoke;
  v5[3] = &unk_264297568;
  v5[4] = &v7;
  v5[5] = v6;
  [(NSMutableDictionary *)mutableExpirationDateByThreadID enumerateKeysAndObjectsUsingBlock:v5];
  unint64_t v3 = v8[3];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __30__BBThreadsMuteAssertion_hash__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v7 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 hash] + v6 * v5;
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v10 = [v7 hash];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v10 + v9 * v8;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    && (id v4 = v3) != 0)
  {
    uint64_t v5 = v4;
    char v6 = BSEqualDictionaries();
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; expirationDateByThreadID: %@>",
               objc_opt_class(),
               self,
               self->_mutableExpirationDateByThreadID);
}

- (id)toUNCMuteAssertion
{
  return (id)[MEMORY[0x263F84308] threadsMuteAssertionWithExpirationDateByThreadID:self->_mutableExpirationDateByThreadID];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->_mutableExpirationDateByThreadID mutableCopy];
  char v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BBThreadsMuteAssertion;
  id v4 = a3;
  [(BBMuteAssertion *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_mutableExpirationDateByThreadID, @"expirationDateByThreadID", v5.receiver, v5.super_class);
}

- (BBThreadsMuteAssertion)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BBThreadsMuteAssertion;
  objc_super v5 = [(BBMuteAssertion *)&v10 initWithCoder:v4];
  if (v5)
  {
    char v6 = BBAllowedClasses();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"expirationDateByThreadID"];
    mutableExpirationDateByThreadID = v5->_mutableExpirationDateByThreadID;
    v5->_mutableExpirationDateByThreadID = (NSMutableDictionary *)v7;
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end