@interface IOHIDEventServerKillClientFunction
@end

@implementation IOHIDEventServerKillClientFunction

void ____IOHIDEventServerKillClientFunction_block_invoke(uint64_t a1)
{
  __IOHIDEventServerKillClient(*(void *)(a1 + 32), *(uint64_t **)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
  v2 = *(const void **)(*(void *)(a1 + 32) + 16);

  CFRelease(v2);
}

@end