@interface AVTAssetResourceCache
- (AVTAssetResourceCache)init;
- (id)resourceForAsset:(id)a3;
- (unint64_t)policy;
- (void)releaseAsset:(id)a3;
- (void)retainAsset:(id)a3;
- (void)setPolicy:(unint64_t)a3;
@end

@implementation AVTAssetResourceCache

- (AVTAssetResourceCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)AVTAssetResourceCache;
  v2 = [(AVTAssetResourceCache *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_policy = 0;
    uint64_t v4 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:512 valueOptions:0 capacity:0];
    resources = v3->_resources;
    v3->_resources = (NSMapTable *)v4;
  }
  return v3;
}

- (void)retainAsset:(id)a3
{
}

- (void)releaseAsset:(id)a3
{
  resources = self->_resources;
  id v4 = a3;
  [(NSMapTable *)resources removeObjectForKey:v4];
  [v4 decrUseCount];
}

- (id)resourceForAsset:(id)a3
{
  id v4 = a3;
  v5 = [(NSMapTable *)self->_resources objectForKey:v4];
  if (!v5)
  {
    v5 = [v4 resourceByCachingIfNeeded:self->_policy != 1];
    [(NSMapTable *)self->_resources setObject:v5 forKey:v4];
  }

  return v5;
}

- (unint64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(unint64_t)a3
{
  self->_policy = a3;
}

- (void).cxx_destruct
{
}

@end