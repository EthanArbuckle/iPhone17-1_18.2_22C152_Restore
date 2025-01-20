@interface FILocalStorageNode
+ (NSString)containerNodePathPrefix;
+ (id)currentSharedInstance;
+ (id)makeWithCoder:(id)a3;
+ (id)sharedInstanceWithDisplayName:(id)a3 domain:(id)a4;
- (FILocalStorageNode)initWithStorageNode:(id)a3 domain:(id)a4;
- (FINode)storageNode;
- (id)fileURL;
- (id)fpItem;
- (id)propertyAsDate:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (void)encodeWithCoder:(id)a3;
- (void)fetchFPItemIfNeeded;
- (void)setFpItem:(id)a3;
- (void)synchronizeWithOptions:(unsigned int)a3 async:(BOOL)a4;
@end

@implementation FILocalStorageNode

+ (id)currentSharedInstance
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  id v3 = (id)sLocalStorageNode;
  objc_sync_exit(v2);

  return v3;
}

+ (id)sharedInstanceWithDisplayName:(id)a3 domain:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_class();
  objc_sync_enter(v8);
  v9 = (void *)sLocalStorageNode;
  if (sLocalStorageNode)
  {
LABEL_2:
    id v10 = v9;
    goto LABEL_15;
  }
  v11 = [v7 storageURLs];
  v12 = [v11 firstObject];

  if (v12)
  {
    v13 = +[FINode fiNodeFromURL:v12];
    if (v13)
    {
      uint64_t v14 = [objc_alloc((Class)a1) initWithStorageNode:v13 domain:v7];
      v15 = (void *)sLocalStorageNode;
      sLocalStorageNode = v14;

      v16 = LogObj(7);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int v20 = 138543362;
        id v21 = v6;
        _os_log_impl(&dword_1D343E000, v16, OS_LOG_TYPE_DEBUG, "Creating FILocalStorageNode - %{public}@", (uint8_t *)&v20, 0xCu);
      }

      if (([(id)sLocalStorageNode setProperty:1886282093 asString:v6 async:0 options:0x10000000 error:0] & 1) == 0)
      {
        v17 = LogObj(5);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_1D343E000, v17, OS_LOG_TYPE_ERROR, "LocalStorage node name not set", (uint8_t *)&v20, 2u);
        }
      }
      v9 = (void *)sLocalStorageNode;
      goto LABEL_2;
    }
  }
  v18 = LogObj(7);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    int v20 = 138543362;
    id v21 = v7;
    _os_log_impl(&dword_1D343E000, v18, OS_LOG_TYPE_ERROR, "Unable to load local storage root storageURL from domain %{public}@", (uint8_t *)&v20, 0xCu);
  }

  id v10 = 0;
LABEL_15:
  objc_sync_exit(v8);

  return v10;
}

+ (NSString)containerNodePathPrefix
{
  return (NSString *)@"/var/mobile/Containers/Data/Application/";
}

- (FILocalStorageNode)initWithStorageNode:(id)a3 domain:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v15[0] = v7;
  v9 = +[FILocalAppContainerCollection sharedInstance];
  v15[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v14.receiver = self;
  v14.super_class = (Class)FILocalStorageNode;
  v11 = [(FICompoundNode *)&v14 initWithFINodes:v10];

  objc_storeStrong((id *)&v11->_storageNode, a3);
  objc_storeStrong((id *)&v11->_providerDomain, a4);
  v12 = +[FIPresentationNodeMap shared];
  [v12 registerPresentationNode:v11 forNode:v7];

  [(FILocalStorageNode *)v11 fetchFPItemIfNeeded];
  return v11;
}

+ (id)makeWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"FI Display Name"];
  v5 = static_objc_cast<NSString,objc_object * {__strong}>(v4);

  id v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"FI Domain"];
  id v7 = static_objc_cast<NSString,objc_object * {__strong}>(v6);

  id v8 = +[FILocalStorageNode sharedInstanceWithDisplayName:v5 domain:v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)FILocalStorageNode;
  [(FIDSNode *)&v6 encodeWithCoder:v4];
  v5 = [(FINode *)self displayName];
  [v4 encodeObject:v5 forKey:@"FI Display Name"];

  [v4 encodeObject:self->_providerDomain forKey:@"FI Domain"];
}

- (void)fetchFPItemIfNeeded
{
  id v3 = [(FILocalStorageNode *)self fpItem];

  if (!v3)
  {
    id v4 = [(id)objc_opt_class() defaultManager];
    providerDomain = self->_providerDomain;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3321888768;
    v7[2] = __41__FILocalStorageNode_fetchFPItemIfNeeded__block_invoke;
    v7[3] = &__block_descriptor_40_ea8_32c54_ZTSKZ41__FILocalStorageNode_fetchFPItemIfNeeded_E3__0_e28_v24__0__FPItem_8__NSError_16l;
    objc_super v6 = self;
    id v8 = v6;
    [v4 fetchRootItemForProviderDomain:providerDomain completionHandler:v7];
  }
}

void __41__FILocalStorageNode_fetchFPItemIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v6;
  if (v7)
  {
    [*(id *)(a1 + 32) setFpItem:v7];
  }
  else
  {
    v9 = LogObj(7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      id v11 = v8;
      _os_log_impl(&dword_1D343E000, v9, OS_LOG_TYPE_ERROR, "Unable to get root item for local storage %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)setFpItem:(id)a3
{
  id v4 = (FPItem *)a3;
  obj = self;
  objc_sync_enter(obj);
  fpItem = obj->_fpItem;
  obj->_fpItem = v4;

  objc_sync_exit(obj);
}

- (id)fpItem
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_fpItem;
  objc_sync_exit(v2);

  return v3;
}

- (id)fileURL
{
  return [(FINode *)self->_storageNode fileURL];
}

- (void)synchronizeWithOptions:(unsigned int)a3 async:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  [(FILocalStorageNode *)self fetchFPItemIfNeeded];
  v7.receiver = self;
  v7.super_class = (Class)FILocalStorageNode;
  [(FIDSNode *)&v7 synchronizeWithOptions:v5 async:v4];
}

- (id)propertyAsDate:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  return [(FINode *)self->_storageNode propertyAsDate:*(void *)&a3 async:a4 options:*(void *)&a5 error:a6];
}

- (FINode)storageNode
{
  return self->_storageNode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageNode, 0);
  objc_storeStrong((id *)&self->_providerDomain, 0);
  objc_storeStrong((id *)&self->_fpItem, 0);
}

@end