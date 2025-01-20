@interface CNURLSessionFactory
+ (CNURLSessionFactory)defaultFactory;
- (id)defaultSessionConfiguration;
- (id)sessionWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
@end

@implementation CNURLSessionFactory

+ (CNURLSessionFactory)defaultFactory
{
  if (defaultFactory_cn_once_token_0 != -1) {
    dispatch_once(&defaultFactory_cn_once_token_0, &__block_literal_global_84);
  }
  v2 = (void *)defaultFactory_cn_once_object_0;

  return (CNURLSessionFactory *)v2;
}

uint64_t __37__CNURLSessionFactory_defaultFactory__block_invoke()
{
  v0 = objc_alloc_init(CNURLSessionFactory);
  uint64_t v1 = defaultFactory_cn_once_object_0;
  defaultFactory_cn_once_object_0 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)defaultSessionConfiguration
{
  return (id)[MEMORY[0x1E4F290F0] defaultSessionConfiguration];
}

- (id)sessionWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  return (id)[MEMORY[0x1E4F290E0] sessionWithConfiguration:a3 delegate:a4 delegateQueue:a5];
}

@end