@interface IOHIDEventSystemConnectionRemoveNotification
@end

@implementation IOHIDEventSystemConnectionRemoveNotification

void ___IOHIDEventSystemConnectionRemoveNotification_block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 268));
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(void *)(a1 + 32) + 16), *(const void **)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 268));
  CFRelease(*(CFTypeRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));
  v2 = *(const void **)(a1 + 48);

  CFRelease(v2);
}

@end