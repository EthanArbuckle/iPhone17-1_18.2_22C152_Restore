@interface EXSandboxExtension
@end

@implementation EXSandboxExtension

uint64_t __32___EXSandboxExtension_sandboxed__block_invoke()
{
  getpid();
  uint64_t result = sandbox_check();
  sandboxed__sandboxed = result != 0;
  return result;
}

@end