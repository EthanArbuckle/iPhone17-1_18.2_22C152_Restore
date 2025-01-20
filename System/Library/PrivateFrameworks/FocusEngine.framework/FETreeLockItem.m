@interface FETreeLockItem
@end

@implementation FETreeLockItem

uint64_t __58___FETreeLockItem_initWithEnvironment_finalUnlockHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2[8])
  {
    v3 = logger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 56);
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      uint64_t v7 = *(void *)(a1 + 32);
      double v8 = Current - *(double *)(v7 + 72);
      int v9 = 138412802;
      uint64_t v10 = v5;
      __int16 v11 = 2048;
      double v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_fault_impl(&dword_24F3F0000, v3, OS_LOG_TYPE_FAULT, "Locked environment %@ was deallocated after being locked for %.2f seconds. This should never happen. Additional info:\n%@", (uint8_t *)&v9, 0x20u);
    }

    v2 = *(void **)(a1 + 32);
  }
  return [v2 _cleanup:1];
}

@end