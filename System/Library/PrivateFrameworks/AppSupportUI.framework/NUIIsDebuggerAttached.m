@interface NUIIsDebuggerAttached
@end

@implementation NUIIsDebuggerAttached

uint64_t ___NUIIsDebuggerAttached_block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 0;
  *(void *)v4 = 0xE00000001;
  int v5 = 1;
  pid_t v6 = getpid();
  size_t v1 = 648;
  uint64_t result = sysctl(v4, 4u, v2, &v1, 0, 0);
  if (!result) {
    _NUIIsDebuggerAttached::isDebugged = (v3 & 0x800) != 0;
  }
  return result;
}

@end