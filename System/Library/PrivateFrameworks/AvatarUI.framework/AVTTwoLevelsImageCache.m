@interface AVTTwoLevelsImageCache
- (AVTImageCache)firstLevelCache;
- (AVTImageCache)secondLevelCache;
- (AVTTwoLevelsImageCache)initWithFirstLevelCache:(id)a3 secondLevelCache:(id)a4 environment:(id)a5;
- (BOOL)resourceExistsInCacheForItem:(id)a3 scope:(id)a4;
- (id)imageForItem:(id)a3 scope:(id)a4;
- (id)imageForItem:(id)a3 scope:(id)a4 cacheMissHandler:(id)a5;
@end

@implementation AVTTwoLevelsImageCache

- (AVTImageCache)firstLevelCache
{
  return self->_firstLevelCache;
}

- (id)imageForItem:(id)a3 scope:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(AVTTwoLevelsImageCache *)self firstLevelCache];
  v9 = [v8 imageForItem:v7 scope:v6];

  return v9;
}

- (AVTImageCache)secondLevelCache
{
  return self->_secondLevelCache;
}

- (AVTTwoLevelsImageCache)initWithFirstLevelCache:(id)a3 secondLevelCache:(id)a4 environment:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AVTTwoLevelsImageCache;
  v10 = [(AVTTwoLevelsImageCache *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_firstLevelCache, a3);
    objc_storeStrong((id *)&v11->_secondLevelCache, a4);
  }

  return v11;
}

- (id)imageForItem:(id)a3 scope:(id)a4 cacheMissHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [(AVTTwoLevelsImageCache *)self firstLevelCache];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__AVTTwoLevelsImageCache_imageForItem_scope_cacheMissHandler___block_invoke;
  v16[3] = &unk_263FF2130;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  v14 = [v11 imageForItem:v13 scope:v10 cacheMissHandler:v16];

  return v14;
}

id __62__AVTTwoLevelsImageCache_imageForItem_scope_cacheMissHandler___block_invoke(void *a1, uint64_t a2, void *a3)
{
  v4 = (void *)a1[4];
  id v5 = a3;
  id v6 = [v4 secondLevelCache];
  id v7 = [v6 imageForItem:a1[5] scope:v5 cacheMissHandler:a1[6]];

  return v7;
}

- (BOOL)resourceExistsInCacheForItem:(id)a3 scope:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AVTTwoLevelsImageCache *)self firstLevelCache];
  if ([v8 resourceExistsInCacheForItem:v6 scope:v7])
  {
    char v9 = 1;
  }
  else
  {
    id v10 = [(AVTTwoLevelsImageCache *)self secondLevelCache];
    char v9 = [v10 resourceExistsInCacheForItem:v6 scope:v7];
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondLevelCache, 0);
  objc_storeStrong((id *)&self->_firstLevelCache, 0);
}

@end