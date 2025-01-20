@interface EspressoPass_fuse_add_and_relu
- (BOOL)runOnNetwork:(void *)a3;
@end

@implementation EspressoPass_fuse_add_and_relu

- (BOOL)runOnNetwork:(void *)a3
{
  v5[16] = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  Espresso::zephyr::es_function_t::es_function_t((Espresso::zephyr::es_function_t *)v4, v5, (const Espresso::net *)a3);
}

@end