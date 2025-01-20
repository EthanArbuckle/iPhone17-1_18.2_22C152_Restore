@interface AAURLSessionRegisterProtocol
@end

@implementation AAURLSessionRegisterProtocol

uint64_t ___AAURLSessionRegisterProtocol_block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F18DA0];
  uint64_t v1 = objc_opt_class();

  return [v0 registerClass:v1];
}

@end