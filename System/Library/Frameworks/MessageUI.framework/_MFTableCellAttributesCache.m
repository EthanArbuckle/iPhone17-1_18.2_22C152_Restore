@interface _MFTableCellAttributesCache
+ (id)sharedInstance;
- (_MFTableCellAttributesCache)init;
- (id)cachedAttributesForIdentifier:(id)a3 constructionBlock:(id)a4;
- (void)_didReceiveFontSizeChangeNotification:(id)a3;
- (void)dealloc;
@end

@implementation _MFTableCellAttributesCache

+ (id)sharedInstance
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!sSharedInstance)
  {
    v3 = objc_alloc_init(_MFTableCellAttributesCache);
    v4 = (void *)sSharedInstance;
    sSharedInstance = (uint64_t)v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)sSharedInstance;

  return v5;
}

- (_MFTableCellAttributesCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)_MFTableCellAttributesCache;
  id v2 = [(_MFTableCellAttributesCache *)&v7 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    attributesCache = v2->_attributesCache;
    v2->_attributesCache = v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__didReceiveFontSizeChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_MFTableCellAttributesCache;
  [(_MFTableCellAttributesCache *)&v4 dealloc];
}

- (void)_didReceiveFontSizeChangeNotification:(id)a3
{
}

- (id)cachedAttributesForIdentifier:(id)a3 constructionBlock:(id)a4
{
  id v6 = a3;
  objc_super v7 = (void (**)(void))a4;
  v8 = [(NSCache *)self->_attributesCache objectForKey:v6];
  if (!v8)
  {
    v8 = v7[2](v7);
    [(NSCache *)self->_attributesCache setObject:v8 forKey:v6];
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end