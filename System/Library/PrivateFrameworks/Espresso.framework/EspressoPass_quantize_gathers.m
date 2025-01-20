@interface EspressoPass_quantize_gathers
- (BOOL)runOnNetwork:(void *)a3;
@end

@implementation EspressoPass_quantize_gathers

- (BOOL)runOnNetwork:(void *)a3
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  Espresso::zephyr::es_function_t::es_function_t((Espresso::zephyr::es_function_t *)v4, v5, (const Espresso::net *)a3);
}

@end