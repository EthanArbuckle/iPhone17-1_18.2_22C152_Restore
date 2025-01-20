@interface IOHIDEventSystemConnectionCreateVirtualService
@end

@implementation IOHIDEventSystemConnectionCreateVirtualService

void ___IOHIDEventSystemConnectionCreateVirtualService_block_invoke(uint64_t a1)
{
  if (_IOHIDServiceInitVirtual(*(void *)(a1 + 32)))
  {
    _IOHIDEventSystemAddService(*(const void **)(*(void *)(a1 + 40) + 8), *(void **)(a1 + 32));
  }
  else
  {
    CFRetain(*(CFTypeRef *)(a1 + 32));
    uint64_t v2 = *(void *)(a1 + 40);
    v3 = *(NSObject **)(v2 + 96);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 0x40000000;
    block[2] = ___IOHIDEventSystemConnectionCreateVirtualService_block_invoke_2;
    block[3] = &__block_descriptor_tmp_133;
    uint64_t v4 = *(void *)(a1 + 48);
    block[4] = v2;
    block[5] = v4;
    block[6] = *(void *)(a1 + 32);
    dispatch_async(v3, block);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void ___IOHIDEventSystemConnectionCreateVirtualService_block_invoke_2(uint64_t a1)
{
  _IOHIDEventSystemConnectionRemoveVirtualService(*(void *)(a1 + 32), *(const void **)(a1 + 40));
  uint64_t v2 = *(const void **)(a1 + 48);

  CFRelease(v2);
}

@end