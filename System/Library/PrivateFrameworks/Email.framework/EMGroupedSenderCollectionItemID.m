@interface EMGroupedSenderCollectionItemID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ECEmailAddressConvertible)emailAddress;
- (EMGroupedSenderCollectionItemID)init;
- (EMGroupedSenderCollectionItemID)initWithBusinessID:(int64_t)a3;
- (EMGroupedSenderCollectionItemID)initWithCoder:(id)a3;
- (NSString)description;
- (id)cachedSelf;
- (int64_t)businessID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMGroupedSenderCollectionItemID

- (id)cachedSelf
{
  if (cachedSelf_onceToken_0 != -1) {
    dispatch_once(&cachedSelf_onceToken_0, &__block_literal_global_16);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_0);
  v3 = objc_msgSend((id)cachedSelf_sUniqueObjectIDs_0, "ef_uniquedObject:", self);
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_0);
  return v3;
}

void __58__EMGroupedSenderCollectionItemID_EFCacheable__cachedSelf__block_invoke()
{
  cachedSelf_sTableLock_0 = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
  v1 = (void *)cachedSelf_sUniqueObjectIDs_0;
  cachedSelf_sUniqueObjectIDs_0 = v0;
}

void ___ef_log_EMGroupedSenderCollectionItemID_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EMGroupedSenderCollectionItemID");
  v1 = (void *)_ef_log_EMGroupedSenderCollectionItemID_log;
  _ef_log_EMGroupedSenderCollectionItemID_log = (uint64_t)v0;
}

- (EMGroupedSenderCollectionItemID)init
{
}

- (EMGroupedSenderCollectionItemID)initWithBusinessID:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)EMGroupedSenderCollectionItemID;
  v4 = [(EMGroupedSenderCollectionItemID *)&v10 init];
  if (v4)
  {
    if (!a3)
    {
      _ef_log_EMGroupedSenderCollectionItemID();
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = (objc_class *)objc_opt_class();
        v7 = NSStringFromClass(v6);
        -[EMGroupedSenderCollectionItemID initWithBusinessID:](v7, (uint64_t)v4, buf, v5);
      }

      memset(__b, 170, sizeof(__b));
      __b[8] = 0;
      *(void *)v14 = 0xE00000001;
      int v15 = 1;
      pid_t v16 = getpid();
      size_t v11 = 648;
      if (!sysctl(v14, 4u, __b, &v11, 0, 0) && (__b[8] & 0x800) != 0) {
        __debugbreak();
      }
    }
    v4->_businessID = a3;
  }
  v8 = [(EMGroupedSenderCollectionItemID *)v4 cachedSelf];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EMGroupedSenderCollectionItemID *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else if ([(EMGroupedSenderCollectionItemID *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    int64_t v6 = [(EMGroupedSenderCollectionItemID *)self businessID];
    BOOL v7 = v6 == [(EMGroupedSenderCollectionItemID *)v5 businessID];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  int64_t v2 = [(EMGroupedSenderCollectionItemID *)self businessID];
  return MEMORY[0x1F4117AE8](v2);
}

- (NSString)description
{
  int64_t v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"businessID:%llu", -[EMGroupedSenderCollectionItemID businessID](self, "businessID"));
  return (NSString *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMGroupedSenderCollectionItemID)initWithCoder:(id)a3
{
  id v8 = a3;
  id v3 = v8;
  v4 = self;
  EFDecodeCacheableInstance();
  v5 = (EMGroupedSenderCollectionItemID *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __49__EMGroupedSenderCollectionItemID_initWithCoder___block_invoke(uint64_t a1)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)EMGroupedSenderCollectionItemID;
  id v2 = objc_msgSendSuper2(&v4, sel_init);
  if (v2) {
    *(void *)(*(void *)(a1 + 32) + 8) = [*(id *)(a1 + 40) decodeInt64ForKey:@"EFPropertyKey_businessID"];
  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  EFEncodeCacheableInstance();
}

uint64_t __51__EMGroupedSenderCollectionItemID_encodeWithCoder___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) businessID];
  return [v1 encodeInt64:v2 forKey:@"EFPropertyKey_businessID"];
}

- (int64_t)businessID
{
  return self->_businessID;
}

- (ECEmailAddressConvertible)emailAddress
{
  return self->_emailAddress;
}

- (void).cxx_destruct
{
}

- (void)initWithBusinessID:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412802;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a2;
  *((_WORD *)buf + 11) = 2048;
  *((void *)buf + 3) = 0;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "<%@: %p> Creating collection item id with invalid business id: %lld", buf, 0x20u);
}

@end