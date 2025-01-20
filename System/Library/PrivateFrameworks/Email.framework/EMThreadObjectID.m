@interface EMThreadObjectID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (EMCollectionItemID)collectionItemID;
- (EMThreadObjectID)init;
- (EMThreadObjectID)initWithCoder:(id)a3;
- (EMThreadObjectID)initWithCollectionItemID:(id)a3 threadScope:(id)a4;
- (EMThreadObjectID)initWithConversationID:(int64_t)a3 threadScope:(id)a4;
- (EMThreadScope)threadScope;
- (NSString)debugDescription;
- (NSString)ef_publicDescription;
- (id)cachedSelf;
- (int64_t)conversationID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMThreadObjectID

- (EMThreadObjectID)initWithConversationID:(int64_t)a3 threadScope:(id)a4
{
  id v6 = a4;
  v7 = [[EMThreadCollectionItemID alloc] initWithConversationID:a3];
  v8 = [(EMThreadObjectID *)self initWithCollectionItemID:v7 threadScope:v6];

  return v8;
}

- (id)cachedSelf
{
  if (cachedSelf_onceToken_44_0 != -1) {
    dispatch_once(&cachedSelf_onceToken_44_0, &__block_literal_global_46_0);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_42_0);
  v3 = objc_msgSend((id)cachedSelf_sUniqueObjectIDs_43_0, "ef_uniquedObject:", self);
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_42_0);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadScope, 0);
  objc_storeStrong((id *)&self->_collectionItemID, 0);
}

- (EMThreadObjectID)initWithCollectionItemID:(id)a3 threadScope:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EMThreadObjectID;
  v9 = [(EMObjectID *)&v14 initAsEphemeralID:0];
  v10 = v9;
  v11 = v9;
  if (v9)
  {
    objc_storeStrong(v9 + 5, a3);
    objc_storeStrong(v10 + 6, a4);
  }
  v12 = [v11 cachedSelf];

  return v12;
}

id __34__EMThreadObjectID_initWithCoder___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  v12.receiver = v2;
  v12.super_class = (Class)EMThreadObjectID;
  id v4 = objc_msgSendSuper2(&v12, sel_initWithCoder_, v3);
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_collectionItemID"];
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_threadScope"];
    uint64_t v9 = *(void *)(a1 + 40);
    v10 = *(void **)(v9 + 48);
    *(void *)(v9 + 48) = v8;
  }
  return v4;
}

void __36__EMThreadObjectID_encodeWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v7.receiver = *(id *)(a1 + 40);
  v7.super_class = (Class)EMThreadObjectID;
  objc_msgSendSuper2(&v7, sel_encodeWithCoder_, v2);
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) collectionItemID];
  [v3 encodeObject:v4 forKey:@"EFPropertyKey_collectionItemID"];

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) threadScope];
  [v5 encodeObject:v6 forKey:@"EFPropertyKey_threadScope"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EMThreadObjectID *)a3;
  if (v4 == self)
  {
    unsigned __int8 v6 = 1;
  }
  else if ([(EMThreadObjectID *)v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v5 = v4;
    if ([(EMObjectID *)self isEphemeral])
    {
      v12.receiver = self;
      v12.super_class = (Class)EMThreadObjectID;
      unsigned __int8 v6 = [(EMObjectID *)&v12 isEqual:v5];
    }
    else
    {
      objc_super v7 = [(EMThreadObjectID *)self collectionItemID];
      uint64_t v8 = [(EMThreadObjectID *)v5 collectionItemID];
      if ([v7 isEqual:v8])
      {
        uint64_t v9 = [(EMThreadObjectID *)self threadScope];
        v10 = [(EMThreadObjectID *)v5 threadScope];
        unsigned __int8 v6 = [v9 isEqual:v10];
      }
      else
      {
        unsigned __int8 v6 = 0;
      }
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  if ([(EMObjectID *)self isEphemeral])
  {
    v8.receiver = self;
    v8.super_class = (Class)EMThreadObjectID;
    return [(EMObjectID *)&v8 hash];
  }
  else
  {
    id v4 = [(EMThreadObjectID *)self collectionItemID];
    uint64_t v5 = [v4 hash];

    unsigned __int8 v6 = [(EMThreadObjectID *)self threadScope];
    unint64_t v3 = 33 * v5 + [v6 hash] + 1089;
  }
  return v3;
}

- (EMCollectionItemID)collectionItemID
{
  return self->_collectionItemID;
}

- (EMThreadScope)threadScope
{
  return self->_threadScope;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  EFEncodeCacheableInstance();
}

- (EMThreadObjectID)initWithCoder:(id)a3
{
  id v8 = a3;
  uint64_t v9 = self;
  id v4 = self;
  id v5 = v8;
  EFDecodeCacheableInstance();
  unsigned __int8 v6 = (EMThreadObjectID *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)conversationID
{
  uint64_t v2 = [(EMThreadObjectID *)self _threadCollectionItemID];
  id v3 = v2;
  if (v2) {
    int64_t v4 = [v2 conversationID];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __30__EMThreadObjectID_cachedSelf__block_invoke()
{
  cachedSelf_sTableLock_42_0 = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:10000];
  v1 = (void *)cachedSelf_sUniqueObjectIDs_43_0;
  cachedSelf_sUniqueObjectIDs_43_0 = v0;
}

- (EMThreadObjectID)init
{
  v7.receiver = self;
  v7.super_class = (Class)EMThreadObjectID;
  uint64_t v2 = [(EMObjectID *)&v7 initAsEphemeralID:1];
  if (v2)
  {
    id v3 = [[EMThreadCollectionItemID alloc] initWithConversationID:-1];
    int64_t v4 = (void *)v2[5];
    v2[5] = v3;
  }
  id v5 = [v2 cachedSelf];

  return v5;
}

- (NSString)debugDescription
{
  id v3 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)EMThreadObjectID;
  int64_t v4 = [(EMObjectID *)&v11 description];
  id v5 = [(EMThreadObjectID *)self collectionItemID];
  unsigned __int8 v6 = [v5 debugDescription];
  objc_super v7 = [(EMThreadObjectID *)self threadScope];
  id v8 = [v7 debugDescription];
  uint64_t v9 = (void *)[v3 initWithFormat:@"%@ %@, %@", v4, v6, v8];

  return (NSString *)v9;
}

- (NSString)ef_publicDescription
{
  id v3 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)EMThreadObjectID;
  int64_t v4 = [(EMObjectID *)&v11 description];
  id v5 = [(EMThreadObjectID *)self collectionItemID];
  unsigned __int8 v6 = [v5 description];
  objc_super v7 = [(EMThreadObjectID *)self threadScope];
  id v8 = objc_msgSend(v7, "ef_publicDescription");
  uint64_t v9 = (void *)[v3 initWithFormat:@"%@ %@, %@", v4, v6, v8];

  return (NSString *)v9;
}

@end