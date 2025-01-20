@interface _NBRegularExpressionCache
+ (id)sharedInstance;
- (NSCache)cache;
- (_NBRegularExpressionCache)init;
- (id)regularExpressionForPattern:(id)a3 error:(id *)a4;
- (void)setCache:(id)a3;
@end

@implementation _NBRegularExpressionCache

+ (id)sharedInstance
{
  if (qword_26ACEFC90 != -1) {
    dispatch_once(&qword_26ACEFC90, &__block_literal_global_0);
  }
  v2 = (void *)_MergedGlobals_33;

  return v2;
}

- (_NBRegularExpressionCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)_NBRegularExpressionCache;
  v2 = [(_NBRegularExpressionCache *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    cache = v2->_cache;
    v2->_cache = v3;
  }
  return v2;
}

- (id)regularExpressionForPattern:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  v8 = [(_NBRegularExpressionCache *)v7 cache];
  v9 = [v8 objectForKey:v6];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    id v16 = 0;
    v11 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:v6 options:0 error:&v16];
    id v12 = v16;
    v13 = v12;
    if (!a4 || v11)
    {
      v14 = [(_NBRegularExpressionCache *)v7 cache];
      [v14 setObject:v11 forKey:v6];

      id v10 = v11;
    }
    else
    {
      id v10 = 0;
      *a4 = v12;
    }
  }
  objc_sync_exit(v7);

  return v10;
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end