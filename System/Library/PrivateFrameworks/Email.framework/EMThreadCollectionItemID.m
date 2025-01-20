@interface EMThreadCollectionItemID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (EMThreadCollectionItemID)init;
- (EMThreadCollectionItemID)initWithCoder:(id)a3;
- (EMThreadCollectionItemID)initWithConversationID:(int64_t)a3;
- (NSString)description;
- (id)cachedSelf;
- (int64_t)conversationID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMThreadCollectionItemID

- (NSString)description
{
  id v3 = [NSString alloc];
  [(EMThreadCollectionItemID *)self conversationID];
  v4 = EFStringWithInt64();
  v5 = (void *)[v3 initWithFormat:@"ConversationID:%@", v4];

  return (NSString *)v5;
}

- (EMThreadCollectionItemID)initWithConversationID:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)EMThreadCollectionItemID;
  v4 = [(EMThreadCollectionItemID *)&v8 init];
  v5 = v4;
  if (v4) {
    v4->_conversationID = a3;
  }
  v6 = [(EMThreadCollectionItemID *)v4 cachedSelf];

  return v6;
}

- (id)cachedSelf
{
  if (cachedSelf_onceToken_5 != -1) {
    dispatch_once(&cachedSelf_onceToken_5, &__block_literal_global_55);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_5);
  id v3 = objc_msgSend((id)cachedSelf_sUniqueObjectIDs_5, "ef_uniquedObject:", self);
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_5);
  return v3;
}

uint64_t __44__EMThreadCollectionItemID_encodeWithCoder___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) conversationID];
  return [v1 encodeInt64:v2 forKey:@"EFPropertyKey_conversationID"];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EMThreadCollectionItemID *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else if ([(EMThreadCollectionItemID *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    int64_t v6 = [(EMThreadCollectionItemID *)self conversationID];
    BOOL v7 = v6 == [(EMThreadCollectionItemID *)v5 conversationID];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(EMThreadCollectionItemID *)self conversationID] + 33;
}

- (int64_t)conversationID
{
  return self->_conversationID;
}

id __42__EMThreadCollectionItemID_initWithCoder___block_invoke(uint64_t a1)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)EMThreadCollectionItemID;
  id v2 = objc_msgSendSuper2(&v4, sel_init);
  if (v2) {
    *(void *)(*(void *)(a1 + 32) + 8) = [*(id *)(a1 + 40) decodeInt64ForKey:@"EFPropertyKey_conversationID"];
  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  EFEncodeCacheableInstance();
}

- (EMThreadCollectionItemID)initWithCoder:(id)a3
{
  id v8 = a3;
  id v3 = v8;
  id v4 = self;
  EFDecodeCacheableInstance();
  v5 = (EMThreadCollectionItemID *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __51__EMThreadCollectionItemID_EFCacheable__cachedSelf__block_invoke()
{
  cachedSelf_sTableLock_5 = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
  v1 = (void *)cachedSelf_sUniqueObjectIDs_5;
  cachedSelf_sUniqueObjectIDs_5 = v0;
}

- (EMThreadCollectionItemID)init
{
}

@end