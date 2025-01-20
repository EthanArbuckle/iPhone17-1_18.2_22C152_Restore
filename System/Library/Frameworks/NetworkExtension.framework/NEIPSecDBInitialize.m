@interface NEIPSecDBInitialize
@end

@implementation NEIPSecDBInitialize

uint64_t ____NEIPSecDBInitialize_block_invoke()
{
  g_IPSecDBSessions = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  uint64_t result = _CFRuntimeRegisterClass();
  __kNEIPSecDBTypeID = result;
  return result;
}

@end