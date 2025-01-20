@interface LSDocumentProxyBindingQuery
@end

@implementation LSDocumentProxyBindingQuery

uint64_t __91___LSDocumentProxyBindingQuery_filterOpenRestrictedBindings_connection_context_earlyYield___block_invoke(uint64_t a1)
{
  v2 = (void *)_CSStringCopyCFString();
  if (v2) {
    uint64_t v3 = [*(id *)(a1 + 32) containsObject:v2] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

BOOL __66___LSDocumentProxyBindingQuery__enumerateWithXPCConnection_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 24);
  if (!v3) {
    return 1;
  }
  int v4 = *(unsigned __int16 *)(v3 + 12);
  return *(unsigned char *)(a1 + 34) && *(unsigned __int16 *)(a1 + 32) == v4;
}

@end