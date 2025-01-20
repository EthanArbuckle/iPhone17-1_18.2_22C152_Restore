@interface NSProxy
@end

@implementation NSProxy

uint64_t __44__NSProxy_AXSideStorage___axDictionaryQueue__block_invoke()
{
  _axDictionaryQueue__sDictionaryQueue = (uint64_t)dispatch_queue_create("com.apple.accessibility.AXSideStorageQueue", 0);
  return MEMORY[0x1F41817F8]();
}

uint64_t __52__NSProxy_AXSideStorage___accessibilityValueForKey___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_getAssociatedObject(*(id *)(a1 + 32), &AXPropertiesKey);
  return MEMORY[0x1F41817F8]();
}

void __68__NSProxy_AXSideStorage___accessibilitySetValue_forKey_storageMode___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_getAssociatedObject(*(id *)(a1 + 32), &AXPropertiesKey);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) && *(void *)(a1 + 40))
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v8 = *(void **)(a1 + 32);
    v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    objc_setAssociatedObject(v8, &AXPropertiesKey, v9, (void *)1);
  }
}

@end