@interface EMGroupedSenderObjectID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ECEmailAddressConvertible)emailAddress;
- (EMGroupedSenderCollectionItemID)collectionItemID;
- (EMGroupedSenderObjectID)init;
- (EMGroupedSenderObjectID)initWithBusinessID:(int64_t)a3 threadScope:(id)a4;
- (EMGroupedSenderObjectID)initWithCoder:(id)a3;
- (EMGroupedSenderObjectID)initWithCollectionItemID:(id)a3 predicate:(id)a4 mailboxTypeResolver:(id)a5;
- (EMGroupedSenderObjectID)initWithCollectionItemID:(id)a3 threadScope:(id)a4;
- (EMThreadScope)threadScope;
- (id)debugDescription;
- (id)description;
- (int64_t)businessID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMGroupedSenderObjectID

- (EMGroupedSenderObjectID)init
{
  v6.receiver = self;
  v6.super_class = (Class)EMGroupedSenderObjectID;
  v2 = [(EMObjectID *)&v6 initAsEphemeralID:1];
  if (v2)
  {
    v3 = [[EMGroupedSenderCollectionItemID alloc] initWithBusinessID:-1];
    collectionItemID = v2->_collectionItemID;
    v2->_collectionItemID = v3;
  }
  return v2;
}

- (EMGroupedSenderObjectID)initWithCollectionItemID:(id)a3 threadScope:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"EMGroupedSenderObjectID-BlackPearlUI.m", 39, @"Invalid parameter not satisfying: %@", @"threadScope" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)EMGroupedSenderObjectID;
  v10 = [(EMObjectID *)&v16 initAsEphemeralID:0];
  v11 = v10;
  v12 = v10;
  if (v10)
  {
    objc_storeStrong(v10 + 5, a3);
    objc_storeStrong(v11 + 6, a4);
  }
  v13 = [v12 cachedSelf];

  return v13;
}

- (EMGroupedSenderObjectID)initWithCollectionItemID:(id)a3 predicate:(id)a4 mailboxTypeResolver:(id)a5
{
  id v8 = a3;
  id v9 = +[EMMessageListItemPredicates threadScopeForPredicate:a4 withMailboxTypeResolver:a5];
  v10 = [(EMGroupedSenderObjectID *)self initWithCollectionItemID:v8 threadScope:v9];

  return v10;
}

- (EMGroupedSenderObjectID)initWithBusinessID:(int64_t)a3 threadScope:(id)a4
{
  id v6 = a4;
  v7 = [[EMGroupedSenderCollectionItemID alloc] initWithBusinessID:a3];
  id v8 = [(EMGroupedSenderObjectID *)self initWithCollectionItemID:v7 threadScope:v6];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EMGroupedSenderObjectID *)a3;
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
        v12.super_class = (Class)EMGroupedSenderObjectID;
        unsigned __int8 v6 = [(EMObjectID *)&v12 isEqual:v5];
      }
      else
      {
        v7 = [(EMGroupedSenderObjectID *)self collectionItemID];
        id v8 = [(EMGroupedSenderObjectID *)v5 collectionItemID];
        if ([v7 isEqual:v8])
        {
          id v9 = [(EMGroupedSenderObjectID *)self threadScope];
          v10 = [(EMGroupedSenderObjectID *)v5 threadScope];
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

- (unint64_t)hash
{
  if ([(EMObjectID *)self isEphemeral])
  {
    v6.receiver = self;
    v6.super_class = (Class)EMGroupedSenderObjectID;
    return [(EMObjectID *)&v6 hash];
  }
  else
  {
    v4 = [(EMGroupedSenderObjectID *)self collectionItemID];
    unint64_t v3 = [v4 hash];
  }
  return v3;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)EMGroupedSenderObjectID;
  v4 = [(EMObjectID *)&v11 description];
  v5 = [(EMGroupedSenderObjectID *)self collectionItemID];
  objc_super v6 = [v5 debugDescription];
  v7 = [(EMGroupedSenderObjectID *)self threadScope];
  id v8 = [v7 debugDescription];
  id v9 = (void *)[v3 initWithFormat:@"%@ %@ %@", v4, v6, v8];

  return v9;
}

- (id)description
{
  id v3 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)EMGroupedSenderObjectID;
  v4 = [(EMObjectID *)&v11 description];
  v5 = [(EMGroupedSenderObjectID *)self collectionItemID];
  objc_super v6 = [v5 description];
  v7 = [(EMGroupedSenderObjectID *)self threadScope];
  id v8 = [v7 description];
  id v9 = (void *)[v3 initWithFormat:@"%@ %@ %@", v4, v6, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMGroupedSenderObjectID)initWithCoder:(id)a3
{
  id v8 = a3;
  id v9 = self;
  v4 = self;
  id v5 = v8;
  EFDecodeCacheableInstance();
  objc_super v6 = (EMGroupedSenderObjectID *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __41__EMGroupedSenderObjectID_initWithCoder___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  v12.receiver = v2;
  v12.super_class = (Class)EMGroupedSenderObjectID;
  id v4 = objc_msgSendSuper2(&v12, sel_initWithCoder_, v3);
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_collectionItemID"];
    uint64_t v6 = *(void *)(a1 + 40);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_threadScope"];
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

void __43__EMGroupedSenderObjectID_encodeWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v7.receiver = *(id *)(a1 + 40);
  v7.super_class = (Class)EMGroupedSenderObjectID;
  objc_msgSendSuper2(&v7, sel_encodeWithCoder_, v2);
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) collectionItemID];
  [v3 encodeObject:v4 forKey:@"EFPropertyKey_collectionItemID"];

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) threadScope];
  [v5 encodeObject:v6 forKey:@"EFPropertyKey_threadScope"];
}

- (ECEmailAddressConvertible)emailAddress
{
  uint64_t v2 = [(EMGroupedSenderObjectID *)self collectionItemID];
  id v3 = [v2 emailAddress];

  return (ECEmailAddressConvertible *)v3;
}

- (int64_t)businessID
{
  uint64_t v2 = [(EMGroupedSenderObjectID *)self collectionItemID];
  int64_t v3 = [v2 businessID];

  return v3;
}

- (EMGroupedSenderCollectionItemID)collectionItemID
{
  return self->_collectionItemID;
}

- (EMThreadScope)threadScope
{
  return self->_threadScope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadScope, 0);
  objc_storeStrong((id *)&self->_collectionItemID, 0);
}

@end