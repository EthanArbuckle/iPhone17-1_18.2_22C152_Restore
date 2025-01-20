@interface CSFPItem
+ (id)itemWithFileURL:(id)a3;
+ (id)itemWithFileURL:(id)a3 forEUID:(unsigned int)a4;
- (CSFPItem)initWithFPItem:(id)a3;
- (CSSearchableItem)searchableItem;
- (NSString)itemIdentifier;
- (NSString)providerIdentifier;
@end

@implementation CSFPItem

+ (id)itemWithFileURL:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__10;
  v17 = __Block_byref_object_dispose__10;
  id v18 = 0;
  v4 = [MEMORY[0x1E4F25D38] defaultManager];
  if (v4)
  {
    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __28__CSFPItem_itemWithFileURL___block_invoke;
    v9[3] = &unk_1E554CDB8;
    v12 = &v13;
    id v10 = v3;
    v6 = v5;
    v11 = v6;
    [v4 fetchItemForURL:v10 completionHandler:v9];
    dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

void __28__CSFPItem_itemWithFileURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    v8 = [[CSFPItem alloc] initWithFPItem:v5];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else if (v6)
  {
    v11 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138412546;
      v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      _os_log_impl(&dword_18D0E3000, v11, OS_LOG_TYPE_INFO, "%@ fetching %@", (uint8_t *)&v13, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (id)itemWithFileURL:(id)a3 forEUID:(unsigned int)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (FPURLMightBeInFileProviderForEUID())
  {
    id v5 = FPCopyItemForURLWithEUID();
    id v6 = 0;
    id v7 = v6;
    if (!v5 || v6)
    {
      if (v6)
      {
        uint64_t v9 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v12 = v7;
          __int16 v13 = 2112;
          id v14 = v4;
          _os_log_impl(&dword_18D0E3000, v9, OS_LOG_TYPE_INFO, "%@ fetching %@", buf, 0x16u);
        }
      }
      v8 = 0;
    }
    else
    {
      v8 = [[CSFPItem alloc] initWithFPItem:v5];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CSFPItem)initWithFPItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSFPItem;
  id v6 = [(CSFPItem *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_internal, a3);
  }

  return v7;
}

- (NSString)providerIdentifier
{
  return (NSString *)[(FPItem *)self->_internal providerIdentifier];
}

- (NSString)itemIdentifier
{
  return (NSString *)[(FPItem *)self->_internal itemIdentifier];
}

- (CSSearchableItem)searchableItem
{
  return (CSSearchableItem *)[(FPItem *)self->_internal toSearchableItem];
}

- (void).cxx_destruct
{
}

@end