@interface BSUIBrandManager
- (BSUIBrandManager)initWithBrandType:(int64_t)a3 cachingEnabled:(BOOL)a4;
- (BSUIBrandManager)initWithCachingEnabled:(BOOL)a3;
- (BSUIBrandManager)initWithCachingEnabled:(BOOL)a3 cacheURL:(id)a4;
- (BSUIBrandManager)initWithCachingEnabled:(BOOL)a3 cacheURL:(id)a4 brandDataSourceOpaqueWrapper:(id)a5;
@end

@implementation BSUIBrandManager

- (BSUIBrandManager)initWithBrandType:(int64_t)a3 cachingEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 1)
  {
    v7 = objc_alloc_init(BSUIMapKitBrandDataSourceObjcShim);
    v8 = [(BSUIMapKitBrandDataSourceObjcShim *)v7 opaqueWrapper];
  }
  else
  {
    v8 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)BSUIBrandManager;
  v9 = [(BSBrandManager *)&v11 initWithBrandType:a3 cachingEnabled:v4 brandDataSourceOpaqueWrapper:v8];

  return v9;
}

- (BSUIBrandManager)initWithCachingEnabled:(BOOL)a3
{
  return [(BSUIBrandManager *)self initWithCachingEnabled:a3 cacheURL:0];
}

- (BSUIBrandManager)initWithCachingEnabled:(BOOL)a3 cacheURL:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(BSUIMapKitBrandDataSourceObjcShim);
  v8 = [(BSUIMapKitBrandDataSourceObjcShim *)v7 opaqueWrapper];
  v9 = [(BSUIBrandManager *)self initWithCachingEnabled:v4 cacheURL:v6 brandDataSourceOpaqueWrapper:v8];

  return v9;
}

- (BSUIBrandManager)initWithCachingEnabled:(BOOL)a3 cacheURL:(id)a4 brandDataSourceOpaqueWrapper:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)BSUIBrandManager;
  return [(BSBrandManager *)&v6 initWithCachingEnabled:a3 cacheURL:a4 brandDataSourceOpaqueWrapper:a5];
}

@end