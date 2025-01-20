@interface LSParseLoadCommands
@end

@implementation LSParseLoadCommands

uint64_t ___LSParseLoadCommands_block_invoke(uint64_t result, int a2, int a3, int a4)
{
  uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
  if (*(_DWORD *)(v4 + 24) != *(_DWORD *)(result + 56))
  {
    *(_DWORD *)(v4 + 24) = a2;
    *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a3;
    *(_DWORD *)(*(void *)(*(void *)(result + 48) + 8) + 24) = a4;
  }
  return result;
}

@end