@interface LSCheckMIAllowedSPIForXPCConnection
@end

@implementation LSCheckMIAllowedSPIForXPCConnection

uint64_t ___LSCheckMIAllowedSPIForXPCConnection_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (object_getClass(v4) == (Class)MEMORY[0x1E4F145F0])
  {
    v6 = *(const char **)(a1 + 40);
    string_ptr = xpc_string_get_string_ptr(v4);
    int v8 = strcmp(v6, string_ptr);
    uint64_t v5 = 1;
    if (!v8)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

@end