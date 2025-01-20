@interface CLKUIBundle
@end

@implementation CLKUIBundle

uint64_t ___CLKUIBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v1 = _CLKUIBundle___bundle;
  _CLKUIBundle___bundle = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end