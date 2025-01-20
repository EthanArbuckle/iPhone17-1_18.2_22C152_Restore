@interface EspressoPass_complete_fixpoint_optimization
- (BOOL)runOnNetwork:(void *)a3;
@end

@implementation EspressoPass_complete_fixpoint_optimization

- (BOOL)runOnNetwork:(void *)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  atomic_ullong v5 = 0;
  Espresso::zephyr::es_function_t::es_function_t((Espresso::zephyr::es_function_t *)v4, &v5, (const Espresso::net *)a3);
}

@end