@interface IOHIDEventSystemConnectionSerializeActivity
@end

@implementation IOHIDEventSystemConnectionSerializeActivity

void ____IOHIDEventSystemConnectionSerializeActivity_block_invoke(uint64_t a1, uint64_t a2, void *cf)
{
  CFAllocatorRef v6 = CFGetAllocator(cf);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v6, 4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (Mutable)
  {
    v8 = Mutable;
    _IOHIDDictionaryAddSInt32(Mutable, @"ActivityState", *(_DWORD *)a2);
    CFAllocatorRef v9 = CFGetAllocator(*(CFTypeRef *)(a1 + 32));
    CFStringRef v10 = _IOHIDCreateTimeString(v9, (time_t *)(a2 + 8));
    if (v10)
    {
      CFStringRef v11 = v10;
      CFDictionaryAddValue(v8, @"ActivityTime", v10);
      CFRelease(v11);
    }
    uint64_t v12 = *(void *)(a2 + 24);
    if (v12) {
      _IOHIDDictionaryAddSInt64(v8, @"ServiceID", v12);
    }
    int v13 = *(_DWORD *)(a2 + 32);
    if (v13) {
      _IOHIDDictionaryAddSInt32(v8, @"EventType", v13);
    }
    CFArrayAppendValue((CFMutableArrayRef)cf, v8);
    CFRelease(v8);
  }
}

@end