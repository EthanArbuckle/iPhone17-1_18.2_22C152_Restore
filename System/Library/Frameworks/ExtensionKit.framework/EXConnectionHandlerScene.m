@interface EXConnectionHandlerScene
@end

@implementation EXConnectionHandlerScene

uint64_t __52___EXConnectionHandlerScene_shouldAcceptConnection___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 8) conformsToProtocol:&unk_26C666C90];
  if (result)
  {
    uint64_t result = [*(id *)(a1[4] + 8) shouldAcceptXPCConnection:a1[5]];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  }
  return result;
}

@end