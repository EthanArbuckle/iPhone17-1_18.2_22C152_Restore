@interface EMMessageObjectID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (EMMailboxScope)mailboxScope;
- (EMMessageCollectionItemID)collectionItemID;
- (EMMessageObjectID)init;
- (EMMessageObjectID)initWithCoder:(id)a3;
- (EMMessageObjectID)initWithCollectionItemID:(id)a3 mailboxScope:(id)a4;
- (EMMessageObjectID)initWithCollectionItemID:(id)a3 predicate:(id)a4 mailboxTypeResolver:(id)a5;
- (EMMessageObjectID)initWithGlobalMessageID:(int64_t)a3 mailboxScope:(id)a4;
- (id)description;
- (int64_t)globalMessageID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMMessageObjectID

- (int64_t)globalMessageID
{
  v2 = [(EMMessageObjectID *)self collectionItemID];
  int64_t v3 = [v2 globalMessageID];

  return v3;
}

- (unint64_t)hash
{
  if ([(EMObjectID *)self isEphemeral])
  {
    v6.receiver = self;
    v6.super_class = (Class)EMMessageObjectID;
    return [(EMObjectID *)&v6 hash];
  }
  else
  {
    v4 = [(EMMessageObjectID *)self collectionItemID];
    unint64_t v3 = [v4 hash];
  }
  return v3;
}

- (EMMessageCollectionItemID)collectionItemID
{
  return self->_collectionItemID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxScope, 0);
  objc_storeStrong((id *)&self->_collectionItemID, 0);
}

- (EMMessageObjectID)initWithCollectionItemID:(id)a3 mailboxScope:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EMMessageObjectID;
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

- (BOOL)isEqual:(id)a3
{
  v4 = (EMMessageObjectID *)a3;
  if (v4 == self)
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if ([(EMObjectID *)self isEphemeral] || [(EMObjectID *)v5 isEphemeral])
      {
        v12.receiver = self;
        v12.super_class = (Class)EMMessageObjectID;
        unsigned __int8 v6 = [(EMObjectID *)&v12 isEqual:v5];
      }
      else
      {
        id v7 = [(EMMessageObjectID *)self collectionItemID];
        id v8 = [(EMMessageObjectID *)v5 collectionItemID];
        if ([v7 isEqual:v8])
        {
          v9 = [(EMMessageObjectID *)self mailboxScope];
          v10 = [(EMMessageObjectID *)v5 mailboxScope];
          unsigned __int8 v6 = EFObjectsAreEqual();
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
  }

  return v6;
}

- (EMMessageObjectID)init
{
  v6.receiver = self;
  v6.super_class = (Class)EMMessageObjectID;
  v2 = [(EMObjectID *)&v6 initAsEphemeralID:1];
  if (v2)
  {
    unint64_t v3 = [[EMMessageCollectionItemID alloc] initWithGlobalMessageID:-1];
    collectionItemID = v2->_collectionItemID;
    v2->_collectionItemID = v3;
  }
  return v2;
}

- (EMMessageObjectID)initWithCollectionItemID:(id)a3 predicate:(id)a4 mailboxTypeResolver:(id)a5
{
  id v8 = a3;
  v9 = +[EMMessageListItemPredicates mailboxScopeForPredicate:a4 withMailboxTypeResolver:a5];
  v10 = [(EMMessageObjectID *)self initWithCollectionItemID:v8 mailboxScope:v9];

  return v10;
}

- (EMMessageObjectID)initWithGlobalMessageID:(int64_t)a3 mailboxScope:(id)a4
{
  id v6 = a4;
  id v7 = [[EMMessageCollectionItemID alloc] initWithGlobalMessageID:a3];
  id v8 = [(EMMessageObjectID *)self initWithCollectionItemID:v7 mailboxScope:v6];

  return v8;
}

- (id)description
{
  id v3 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)EMMessageObjectID;
  v4 = [(EMObjectID *)&v11 description];
  v5 = [(EMMessageObjectID *)self collectionItemID];
  id v6 = [v5 description];
  id v7 = [(EMMessageObjectID *)self mailboxScope];
  id v8 = [v7 description];
  v9 = (void *)[v3 initWithFormat:@"%@ %@ %@", v4, v6, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageObjectID)initWithCoder:(id)a3
{
  id v8 = a3;
  v9 = self;
  v4 = self;
  id v5 = v8;
  EFDecodeCacheableInstance();
  id v6 = (EMMessageObjectID *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __35__EMMessageObjectID_initWithCoder___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  v12.receiver = v2;
  v12.super_class = (Class)EMMessageObjectID;
  id v4 = objc_msgSendSuper2(&v12, sel_initWithCoder_, v3);
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_collectionItemID"];
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_mailboxScope"];
    uint64_t v9 = *(void *)(a1 + 40);
    v10 = *(void **)(v9 + 48);
    *(void *)(v9 + 48) = v8;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  EFEncodeCacheableInstance();
}

void __37__EMMessageObjectID_encodeWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v7.receiver = *(id *)(a1 + 40);
  v7.super_class = (Class)EMMessageObjectID;
  objc_msgSendSuper2(&v7, sel_encodeWithCoder_, v2);
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) collectionItemID];
  [v3 encodeObject:v4 forKey:@"EFPropertyKey_collectionItemID"];

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) mailboxScope];
  [v5 encodeObject:v6 forKey:@"EFPropertyKey_mailboxScope"];
}

- (EMMailboxScope)mailboxScope
{
  return self->_mailboxScope;
}

@end