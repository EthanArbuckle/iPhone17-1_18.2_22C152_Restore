@interface IOHIDEventSystemServiceRemoved
@end

@implementation IOHIDEventSystemServiceRemoved

void ____IOHIDEventSystemServiceRemoved_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = _IOHIDLog();
  if (os_signpost_enabled(v2))
  {
    uint64_t RegistryID = IOHIDServiceGetRegistryID(*(void *)(a1 + 32));
    int v14 = 138412290;
    uint64_t v15 = RegistryID;
    _os_signpost_emit_with_name_impl(&dword_18B46C000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOHIDEventSystemServiceRemove", "%@", (uint8_t *)&v14, 0xCu);
  }
  uint64_t Owner = _IOHIDServiceGetOwner(*(void *)(a1 + 32));
  if (Owner) {
    IOHIDSessionRemoveService(Owner, *(const void **)(a1 + 32));
  }
  else {
    _IOHIDServiceUnscheduleAsync(*(void *)(a1 + 32));
  }
  CFMutableDictionaryRef v5 = _IOHIDServiceCopyEventCounts(*(void **)(a1 + 32));
  v6 = _IOHIDLogCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v14 = 138543618;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    CFMutableDictionaryRef v17 = v5;
    _os_log_impl(&dword_18B46C000, v6, OS_LOG_TYPE_DEFAULT, "Service removed: %{public}@ %@", (uint8_t *)&v14, 0x16u);
  }
  os_unfair_recursive_lock_lock_with_options();
  CFAllocatorRef v8 = CFGetAllocator(*(CFTypeRef *)(a1 + 40));
  CFSetRef Copy = CFSetCreateCopy(v8, *(CFSetRef *)(*(void *)(a1 + 40) + 48));
  os_unfair_recursive_lock_unlock();
  if (Copy)
  {
    CFSetApplyFunction(Copy, (CFSetApplierFunction)__RemoveConnectionServiceFunction, *(void **)(a1 + 32));
    CFRelease(Copy);
  }
  v10 = (const void *)IOHIDServiceGetRegistryID(*(void *)(a1 + 32));
  os_unfair_recursive_lock_lock_with_options();
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(void *)(a1 + 40) + 24), v10);
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(void *)(a1 + 40) + 16), v10);
  CFAllocatorRef v11 = CFGetAllocator(*(CFTypeRef *)(a1 + 40));
  CFSetRef v12 = CFSetCreateCopy(v11, *(CFSetRef *)(*(void *)(a1 + 40) + 432));
  os_unfair_recursive_lock_unlock();
  if (v12)
  {
    CFSetApplyFunction(v12, (CFSetApplierFunction)_IOHIDEventSystemConnectionRecordServiceChanged, 0);
    CFRelease(v12);
  }
  v13 = _IOHIDLog();
  if (os_signpost_enabled(v13))
  {
    int v14 = 138412290;
    uint64_t v15 = (uint64_t)v10;
    _os_signpost_emit_with_name_impl(&dword_18B46C000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOHIDEventSystemServiceRemove", "%@", (uint8_t *)&v14, 0xCu);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));
  if (v5) {
    CFRelease(v5);
  }
}

@end