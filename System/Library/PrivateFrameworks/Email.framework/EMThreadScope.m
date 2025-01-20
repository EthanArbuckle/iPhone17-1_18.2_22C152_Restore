@interface EMThreadScope
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (EMMailboxScope)mailboxScope;
- (EMThreadScope)initWithCoder:(id)a3;
- (EMThreadScope)initWithMailboxScope:(id)a3 filterPredicate:(id)a4;
- (NSPredicate)filterPredicate;
- (NSString)debugDescription;
- (NSString)ef_publicDescription;
- (id)cachedSelf;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMThreadScope

- (unint64_t)hash
{
  v3 = [(EMThreadScope *)self mailboxScope];
  uint64_t v4 = [v3 hash];

  v5 = [(EMThreadScope *)self filterPredicate];
  unint64_t v6 = 33 * v4 + [v5 hash] + 1089;

  return v6;
}

- (EMMailboxScope)mailboxScope
{
  return self->_mailboxScope;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMThreadScope)initWithMailboxScope:(id)a3 filterPredicate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EMThreadScope;
  v9 = [(EMThreadScope *)&v14 init];
  v10 = v9;
  v11 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mailboxScope, a3);
    objc_storeStrong((id *)&v10->_filterPredicate, a4);
  }
  v12 = [(EMThreadScope *)v11 cachedSelf];

  return v12;
}

- (id)cachedSelf
{
  if (cachedSelf_onceToken_6 != -1) {
    dispatch_once(&cachedSelf_onceToken_6, &__block_literal_global_56);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_6);
  v3 = objc_msgSend((id)cachedSelf_sUniqueObjectIDs_6, "ef_uniquedObject:", self);
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_6);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_mailboxScope, 0);
}

- (NSString)ef_publicDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(EMThreadScope *)self mailboxScope];
  unint64_t v6 = objc_msgSend(v5, "ef_publicDescription");
  id v7 = [(EMThreadScope *)self filterPredicate];
  id v8 = objc_msgSend(v7, "ef_publicDescription");
  v9 = (void *)[v3 initWithFormat:@"%@: %@ filterPredicate: %@", v4, v6, v8];

  return (NSString *)v9;
}

void __33__EMThreadScope_encodeWithCoder___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) mailboxScope];
  objc_msgSend(v2, "encodeObject:forKey:");

  id v3 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) filterPredicate];
  objc_msgSend(v3, "encodeObject:forKey:");
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  EFEncodeCacheableInstance();
}

- (EMThreadScope)initWithCoder:(id)a3
{
  id v8 = a3;
  id v3 = v8;
  id v4 = self;
  EFDecodeCacheableInstance();
  id v5 = (EMThreadScope *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __40__EMThreadScope_EFCacheable__cachedSelf__block_invoke()
{
  cachedSelf_sTableLock_6 = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
  v1 = (void *)cachedSelf_sUniqueObjectIDs_6;
  cachedSelf_sUniqueObjectIDs_6 = v0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EMThreadScope *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else if ([(EMThreadScope *)v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unint64_t v6 = [(EMThreadScope *)self mailboxScope];
    id v7 = [(EMThreadScope *)v5 mailboxScope];
    if ([v6 isEqual:v7])
    {
      id v8 = [(EMThreadScope *)self filterPredicate];
      v9 = [(EMThreadScope *)v5 filterPredicate];
      char v10 = EFObjectsAreEqual();
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

id __31__EMThreadScope_initWithCoder___block_invoke(uint64_t a1)
{
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)EMThreadScope;
  id v2 = objc_msgSendSuper2(&v10, sel_init);
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 40) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_mailboxScope"];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    uint64_t v6 = [*(id *)(a1 + 40) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_filterPredicate"];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = v6;

    [*(id *)(*(void *)(a1 + 32) + 16) allowEvaluation];
  }
  return v2;
}

- (NSString)debugDescription
{
  uint64_t v3 = [(EMThreadScope *)self filterPredicate];

  if (v3)
  {
    id v4 = [NSString alloc];
    id v5 = [(EMThreadScope *)self filterPredicate];
    uint64_t v6 = [v5 debugDescription];
    uint64_t v7 = (__CFString *)[v4 initWithFormat:@"\nfilterPredicate: %@", v6];
  }
  else
  {
    uint64_t v7 = &stru_1F1A3DFB0;
  }
  id v8 = NSString;
  uint64_t v9 = objc_opt_class();
  objc_super v10 = [(EMThreadScope *)self mailboxScope];
  v11 = [v10 debugDescription];
  v12 = [v8 stringWithFormat:@"%@: %@%@", v9, v11, v7];

  return (NSString *)v12;
}

@end