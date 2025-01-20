@interface EspressoPass_strength_reduction_batch_matmul_to_inner_product
- (BOOL)runOnNetwork:(void *)a3;
@end

@implementation EspressoPass_strength_reduction_batch_matmul_to_inner_product

- (BOOL)runOnNetwork:(void *)a3
{
  atomic_ullong v5 = 0;
  Espresso::zephyr::es_function_t::es_function_t((Espresso::zephyr::es_function_t *)&v4, &v5, (const Espresso::net *)a3);
}

@end