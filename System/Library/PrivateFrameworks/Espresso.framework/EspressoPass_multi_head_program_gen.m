@interface EspressoPass_multi_head_program_gen
- (BOOL)runOnNetwork:(void *)a3;
@end

@implementation EspressoPass_multi_head_program_gen

- (BOOL)runOnNetwork:(void *)a3
{
  return Espresso::run_pass_on_network<Espresso::pass_multi_head_program_gen>((uint64_t)a3);
}

@end