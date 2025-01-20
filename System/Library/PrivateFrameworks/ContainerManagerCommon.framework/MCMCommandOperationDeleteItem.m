@interface MCMCommandOperationDeleteItem
- (BOOL)isEqual:(id)a3;
- (MCMCommandOperationDeleteItem)initWithCacheEntry:(id)a3 codeSignIdentifiersToRemove:(id)a4 manifest:(id)a5;
- (MCMContainerCacheEntry)cacheEntry;
- (MCMDeleteManifest)manifest;
- (NSSet)codeSignIdentifiersToRemove;
- (id)description;
- (unint64_t)hash;
- (void)setManifest:(id)a3;
@end

@implementation MCMCommandOperationDeleteItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_codeSignIdentifiersToRemove, 0);

  objc_storeStrong((id *)&self->_cacheEntry, 0);
}

- (void)setManifest:(id)a3
{
  p_manifest = &self->_manifest;

  objc_storeStrong((id *)p_manifest, a3);
}

- (MCMDeleteManifest)manifest
{
  return self->_manifest;
}

- (NSSet)codeSignIdentifiersToRemove
{
  return self->_codeSignIdentifiersToRemove;
}

- (MCMContainerCacheEntry)cacheEntry
{
  return self->_cacheEntry;
}

- (id)description
{
  v3 = NSString;
  v4 = [(MCMCommandOperationDeleteItem *)self cacheEntry];
  v5 = [(MCMCommandOperationDeleteItem *)self codeSignIdentifiersToRemove];
  v6 = [v3 stringWithFormat:@"<%@, removeCS = %@>", v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [(MCMCommandOperationDeleteItem *)self cacheEntry];
  LOBYTE(self) = [v5 isEqual:v4];

  return (char)self;
}

- (unint64_t)hash
{
  v2 = [(MCMCommandOperationDeleteItem *)self cacheEntry];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (MCMCommandOperationDeleteItem)initWithCacheEntry:(id)a3 codeSignIdentifiersToRemove:(id)a4 manifest:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MCMCommandOperationDeleteItem;
  v12 = [(MCMCommandOperationDeleteItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_cacheEntry, a3);
    objc_storeStrong((id *)&v13->_codeSignIdentifiersToRemove, a4);
    objc_storeStrong((id *)&v13->_manifest, a5);
  }

  return v13;
}

@end