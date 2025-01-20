@interface LSCopyPluginsWithURL
@end

@implementation LSCopyPluginsWithURL

void ___LSCopyPluginsWithURL_block_invoke(uint64_t a1, uint64_t a2, int *a3)
{
  v6 = (void *)MEMORY[0x18530F680]();
  if (_LSAliasMatchesPath_NoIO(**(void ***)(a1 + 48), *a3, *(void **)(a1 + 32), 2 * (*(unsigned char *)(a1 + 56) != 0)))
  {
    v7 = *(__CFArray **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (!v7)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
      v7 = *(__CFArray **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    CFArrayAppendValue(v7, (const void *)[NSNumber numberWithUnsignedInt:a2]);
  }
}

@end