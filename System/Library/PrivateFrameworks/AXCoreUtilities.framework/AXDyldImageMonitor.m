@interface AXDyldImageMonitor
@end

@implementation AXDyldImageMonitor

uint64_t __37___AXDyldImageMonitor_sharedInstance__block_invoke()
{
  _Shared = objc_alloc_init(_AXDyldImageMonitor);
  return MEMORY[0x1F41817F8]();
}

uint64_t __39___AXDyldImageMonitor_loadedImagePaths__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __47___AXDyldImageMonitor_addImageMonitorObserver___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v2)
  {
    [v2 addObject:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    [v3 iterateInitialImageListForImageMonitor:v4];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 8);
    *(void *)(v6 + 8) = v5;

    [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
    _dyld_register_func_for_add_image((void (__cdecl *)(const mach_header *, intptr_t))AXImageMonitor_dyld_image_callback);
  }
}

uint64_t __50___AXDyldImageMonitor_removeImageMonitorObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

@end