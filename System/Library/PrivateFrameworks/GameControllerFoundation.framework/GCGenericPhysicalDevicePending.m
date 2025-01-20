@interface GCGenericPhysicalDevicePending
@end

@implementation GCGenericPhysicalDevicePending

void __62___GCGenericPhysicalDevicePending_initWithHIDService_manager___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __76___GCGenericPhysicalDevicePending_setDriverConnection_invalidatingPrevious___block_invoke(uint64_t a1)
{
  v5 = [*(id *)(*(void *)(a1 + 32) + 16) resultIfFinished];
  if (v5)
  {
    if (objc_opt_respondsToSelector()) {
      [v5 setDriverConnection:*(void *)(a1 + 40)];
    }
  }
  else
  {
    v2 = *(void **)(a1 + 48);
    if (v2 && *(unsigned char *)(a1 + 56)) {
      [v2 invalidate];
    }
    v3 = *(void **)(a1 + 40);
    if (v3) {
      -[_GCGenericPhysicalDevicePending _onqueue_prepareDeviceWithConnection:](*(void *)(a1 + 32), v3);
    }
  }

  return MEMORY[0x270F9A828]();
}

uint64_t __76___GCGenericPhysicalDevicePending_setFilterConnection_invalidatingPrevious___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) resultIfFinished];
  if (v2)
  {
    v5 = (void *)v2;
    if (objc_opt_respondsToSelector()) {
      [v5 setFilterConnection:*(void *)(a1 + 40)];
    }
  }
  else
  {
    v3 = *(void **)(a1 + 48);
    if (v3 && *(unsigned char *)(a1 + 56)) {
      [v3 invalidate];
    }
  }

  return MEMORY[0x270F9A828]();
}

@end