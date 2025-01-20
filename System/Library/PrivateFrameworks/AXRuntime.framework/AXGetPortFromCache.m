@interface AXGetPortFromCache
@end

@implementation AXGetPortFromCache

void ___AXGetPortFromCache_block_invoke(uint64_t a1)
{
  CFDictionaryRef Mutable = (const __CFDictionary *)gPortCache;
  if (gPortCache
    || (CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]), (gPortCache = (uint64_t)Mutable) != 0))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFDictionaryGetValue(Mutable, (const void *)*(int *)(a1 + 48));
    v3 = *(__CFMachPort **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (v3)
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFMachPortGetPort(v3);
      mach_port_name_t v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      if (v4)
      {
        v5 = (ipc_space_t *)MEMORY[0x1E4F14960];
        if (mach_port_mod_refs(*MEMORY[0x1E4F14960], v4, 0, 1) == 17)
        {
          mach_port_mod_refs(*v5, *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 4u, 1);
          CFDictionaryRemoveValue((CFMutableDictionaryRef)gPortCache, (const void *)*(int *)(a1 + 48));
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
        }
      }
    }
  }
}

void ___AXGetPortFromCache_block_invoke_51(uint64_t a1)
{
  kern_return_t v3;
  __CFMachPort *v4;
  uint64_t vars8;

  if (gPortCache) {
    CFDictionarySetValue((CFMutableDictionaryRef)gPortCache, (const void *)*(int *)(a1 + 48), *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  }
  v2 = (ipc_space_t *)MEMORY[0x1E4F14960];
  v3 = mach_port_mod_refs(*MEMORY[0x1E4F14960], *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 0, 1);
  if (v3)
  {
    if (v3 == 17)
    {
      mach_port_mod_refs(*v2, *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 4u, 1);
      CFDictionaryRemoveValue((CFMutableDictionaryRef)gPortCache, (const void *)*(int *)(a1 + 48));
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  else
  {
    mach_port_name_t v4 = *(__CFMachPort **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    CFMachPortSetInvalidationCallBack(v4, (CFMachPortInvalidationCallBack)portInvalidationCallback);
  }
}

@end