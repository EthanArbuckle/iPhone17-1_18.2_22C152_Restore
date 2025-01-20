@interface C3DEnginePipelineGetNodesForKey
@end

@implementation C3DEnginePipelineGetNodesForKey

void ____C3DEnginePipelineGetNodesForKey_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t DeformerStack = C3DNodeGetDeformerStack(a2);
  if (!DeformerStack)
  {
    v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      ____C3DEnginePipelineGetNodesForKey_block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = ____C3DEnginePipelineGetNodesForKey_block_invoke_28;
  v12[3] = &unk_264007140;
  long long v13 = *(_OWORD *)(a1 + 32);
  C3DDeformerStackEnumerateDependencyStacks(DeformerStack, (uint64_t)v12);
}

void ____C3DEnginePipelineGetNodesForKey_block_invoke_28(uint64_t a1, int a2, void *value)
{
  uint64_t v5 = *(__CFSet **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (!v5)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFSetCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, *(CFSetRef *)(a1 + 40));
    CFAutorelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
    uint64_t v5 = *(__CFSet **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }

  CFSetAddValue(v5, value);
}

void ____C3DEnginePipelineGetNodesForKey_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end