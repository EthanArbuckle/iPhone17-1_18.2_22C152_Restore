@interface IOHIDServiceNotification
@end

@implementation IOHIDServiceNotification

void ____IOHIDServiceNotification_block_invoke_2(uint64_t a1)
{
  CFSetApplyFunction(*(CFSetRef *)(a1 + 32), (CFSetApplierFunction)__IOHIDServiceNotificationSetApplier, *(void **)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
  v2 = *(const void **)(a1 + 40);

  CFRelease(v2);
}

void ____IOHIDServiceNotification_block_invoke(uint64_t a1)
{
  CFSetApplyFunction(*(CFSetRef *)(a1 + 32), (CFSetApplierFunction)__IOHIDServiceNotificationSetApplier, *(void **)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
  v2 = *(const void **)(a1 + 40);

  CFRelease(v2);
}

@end