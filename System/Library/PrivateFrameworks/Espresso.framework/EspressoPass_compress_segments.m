@interface EspressoPass_compress_segments
- (BOOL)runOnNetwork:(void *)a3;
@end

@implementation EspressoPass_compress_segments

- (BOOL)runOnNetwork:(void *)a3
{
  return Espresso::run_pass_on_network<Espresso::pass_compress_segments>((uint64_t)a3);
}

@end