@interface NSXPCConnectionExportedObjectTable
@end

@implementation NSXPCConnectionExportedObjectTable

void __79___NSXPCConnectionExportedObjectTable_receivedReleaseForProxyNumber_userQueue___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = *(const void **)(a1 + 40);
    os_unfair_lock_lock_with_options();
    CFMutableDictionaryRef TablesIfNeeded_locked = _createTablesIfNeeded_locked((CFMutableDictionaryRef)v1);
    v4 = (void *)MEMORY[0x185308110](TablesIfNeeded_locked);
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v1 + 24), v2);
    if (Value)
    {
      v6 = Value;
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v1 + 24), v2);
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v1 + 32), v2);
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v1 + 40), v6);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
  }
}

@end