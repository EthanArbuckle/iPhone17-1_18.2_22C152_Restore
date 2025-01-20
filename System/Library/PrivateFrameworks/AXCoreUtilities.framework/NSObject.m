@interface NSObject
@end

@implementation NSObject

uint64_t __53__NSObject_AXSideStorage___accessibilityValueForKey___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_getAssociatedObject(*(id *)(a1 + 32), &AXPropertiesKey_0);
  return MEMORY[0x1F41817F8]();
}

uint64_t __45__NSObject_AXSideStorage___axDictionaryQueue__block_invoke()
{
  _axDictionaryQueue__sDictionaryQueue_0 = (uint64_t)dispatch_queue_create("com.apple.accessibility.AXSideStorageQueue", 0);
  return MEMORY[0x1F41817F8]();
}

uint64_t __57__NSObject_UIAccessibilitySafeCategory__safeValueForKey___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "__axValueForKey:", *(void *)(a1 + 40));
  return MEMORY[0x1F41817F8]();
}

uint64_t __61__NSObject_UIAccessibilitySafeCategory__safeValueForKeyPath___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) valueForKeyPath:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

void __69__NSObject_AXSideStorage___accessibilitySetValue_forKey_storageMode___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_getAssociatedObject(*(id *)(a1 + 32), &AXPropertiesKey_0);
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
    objc_setAssociatedObject(v8, &AXPropertiesKey_0, v9, (void *)1);
  }
}

void __110__NSObject_AXCollectionsExtensions___ax_appendPrettyDescriptionToString_indentationString_visitedCollections___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  if (!*(unsigned char *)(v6 + 24))
  {
    *(unsigned char *)(v6 + 24) = 1;
    [*(id *)(a1 + 32) appendString:@"\n"];
  }
  [*(id *)(a1 + 32) appendString:*(void *)(a1 + 40)];
  objc_msgSend(v7, "_ax_appendPrettyDescriptionToString:indentationString:visitedCollections:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
  [*(id *)(a1 + 32) appendString:@": "];
  objc_msgSend(v5, "_ax_appendPrettyDescriptionToString:indentationString:visitedCollections:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
  [*(id *)(a1 + 32) appendString:@",\n"];
}

void __71__NSObject_UIAccessibilitySafeCategory__safeIntegerForIvarKey_onClass___block_invoke(uint64_t a1)
{
  InstanceVariable = class_getInstanceVariable(*(Class *)(a1 + 56), (const char *)[*(id *)(a1 + 32) UTF8String]);
  uint64_t v3 = object_getIvar(*(id *)(a1 + 40), InstanceVariable);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
}

@end