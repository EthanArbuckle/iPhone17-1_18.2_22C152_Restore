@interface GTMTLShaderDebugger
@end

@implementation GTMTLShaderDebugger

void __GTMTLShaderDebugger_executeCommandEncoder_block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 status] == (char *)&dword_4 + 1)
  {
    v3 = [v7 error];
    id v4 = [v3 copy];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

@end