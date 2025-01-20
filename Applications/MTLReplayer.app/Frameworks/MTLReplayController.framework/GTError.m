@interface GTError
@end

@implementation GTError

void __GTError_initialize_block_invoke(id a1)
{
  apr_pool_create_ex(&s_errorPool, 0, 0, v1);
}

@end