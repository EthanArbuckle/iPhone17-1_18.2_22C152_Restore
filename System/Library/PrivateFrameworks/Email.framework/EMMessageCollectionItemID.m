@interface EMMessageCollectionItemID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (EMMessageCollectionItemID)init;
- (EMMessageCollectionItemID)initWithCoder:(id)a3;
- (EMMessageCollectionItemID)initWithGlobalMessageID:(int64_t)a3;
- (NSString)description;
- (id)cachedSelf;
- (int64_t)globalMessageID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMMessageCollectionItemID

id __43__EMMessageCollectionItemID_initWithCoder___block_invoke(uint64_t a1)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)EMMessageCollectionItemID;
  id v2 = objc_msgSendSuper2(&v4, sel_init);
  if (v2) {
    *(void *)(*(void *)(a1 + 32) + 8) = [*(id *)(a1 + 40) decodeInt64ForKey:@"EFPropertyKey_globalMessageID"];
  }
  return v2;
}

uint64_t __45__EMMessageCollectionItemID_encodeWithCoder___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) globalMessageID];
  return [v1 encodeInt64:v2 forKey:@"EFPropertyKey_globalMessageID"];
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (EMMessageCollectionItemID *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else if ([(EMMessageCollectionItemID *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    int64_t v6 = [(EMMessageCollectionItemID *)self globalMessageID];
    BOOL v7 = v6 == [(EMMessageCollectionItemID *)v5 globalMessageID];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  int64_t v2 = [(EMMessageCollectionItemID *)self globalMessageID];
  return MEMORY[0x1F4117AE8](v2);
}

- (int64_t)globalMessageID
{
  return self->_globalMessageID;
}

- (EMMessageCollectionItemID)initWithGlobalMessageID:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)EMMessageCollectionItemID;
  objc_super v4 = [(EMMessageCollectionItemID *)&v8 init];
  v5 = v4;
  if (v4) {
    v4->_globalMessageID = a3;
  }
  int64_t v6 = [(EMMessageCollectionItemID *)v4 cachedSelf];

  return v6;
}

- (id)cachedSelf
{
  if (cachedSelf_onceToken_2 != -1) {
    dispatch_once(&cachedSelf_onceToken_2, &__block_literal_global_34);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_2);
  v3 = objc_msgSend((id)cachedSelf_sUniqueObjectIDs_2, "ef_uniquedObject:", self);
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_2);
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  EFEncodeCacheableInstance();
}

- (EMMessageCollectionItemID)initWithCoder:(id)a3
{
  id v8 = a3;
  id v3 = v8;
  id v4 = self;
  EFDecodeCacheableInstance();
  v5 = (EMMessageCollectionItemID *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __52__EMMessageCollectionItemID_EFCacheable__cachedSelf__block_invoke()
{
  cachedSelf_sTableLock_2 = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
  v1 = (void *)cachedSelf_sUniqueObjectIDs_2;
  cachedSelf_sUniqueObjectIDs_2 = v0;
}

- (EMMessageCollectionItemID)init
{
  v3.receiver = self;
  v3.super_class = (Class)EMMessageCollectionItemID;
  return [(EMMessageCollectionItemID *)&v3 init];
}

- (NSString)description
{
  int64_t v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"GlobalMessageID:%llu", -[EMMessageCollectionItemID globalMessageID](self, "globalMessageID"));
  return (NSString *)v2;
}

@end