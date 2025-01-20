@interface EspressoPass_remove_reshape_around_rank2_softmax
- (BOOL)runOnNetwork:(void *)a3;
@end

@implementation EspressoPass_remove_reshape_around_rank2_softmax

- (BOOL)runOnNetwork:(void *)a3
{
  atomic_ullong v5 = 0;
  Espresso::zephyr::es_function_t::es_function_t((Espresso::zephyr::es_function_t *)&v4, &v5, (const Espresso::net *)a3);
}

@end