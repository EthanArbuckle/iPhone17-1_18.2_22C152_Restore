@interface CFPrefsMessageSenderIsSandboxed
@end

@implementation CFPrefsMessageSenderIsSandboxed

uint64_t ___CFPrefsMessageSenderIsSandboxed_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  int v3 = *(unsigned __int8 *)(a2 + 52);
  if (v3 == 255)
  {
    result = _CFPrefsSandboxCheckForMessage(*(void **)(result + 32));
    BOOL v5 = result != 0;
    *(unsigned char *)(a2 + 52) = result != 0;
  }
  else
  {
    BOOL v5 = v3 == 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(v2 + 40) + 8) + 24) = v5;
  return result;
}

uint64_t ___CFPrefsMessageSenderIsSandboxed_block_invoke_0(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  int v3 = *(unsigned __int8 *)(a2 + 52);
  if (v3 == 255)
  {
    result = _CFPrefsSandboxCheckForMessage_0(*(void **)(result + 32));
    BOOL v5 = result != 0;
    *(unsigned char *)(a2 + 52) = result != 0;
  }
  else
  {
    BOOL v5 = v3 == 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(v2 + 40) + 8) + 24) = v5;
  return result;
}

@end