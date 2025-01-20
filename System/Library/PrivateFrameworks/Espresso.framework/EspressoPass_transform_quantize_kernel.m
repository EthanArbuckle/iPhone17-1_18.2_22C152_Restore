@interface EspressoPass_transform_quantize_kernel
- (BOOL)runOnNetwork:(void *)a3;
@end

@implementation EspressoPass_transform_quantize_kernel

- (BOOL)runOnNetwork:(void *)a3
{
  return Espresso::run_pass_on_network<Espresso::pass_transform_quantize_kernel>((uint64_t)a3);
}

@end