@interface DCSMACreateDictionaryAssetsAsync
@end

@implementation DCSMACreateDictionaryAssetsAsync

Class __DCSMACreateDictionaryAssetsAsync_XPC_block_invoke(Class result, id a2)
{
  if (a2)
  {
    Class v3 = result;
    result = object_getClass(a2);
    if (result != (Class)MEMORY[0x1E4F145A8])
    {
      xpc_object_t value = xpc_dictionary_get_value(a2, "result");
      if (value)
      {
        v5 = value;
        int64_t length = xpc_data_get_length(value);
        if (length >= 1)
        {
          CFIndex v7 = length;
          bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(v5);
          CFDataRef v9 = CFDataCreate(0, bytes_ptr, v7);
          CFArrayRef v10 = (const __CFArray *)CFPropertyListCreateWithData(0, v9, 0, 0, 0);
          CFRelease(v9);
          if (v10)
          {
            CFIndex Count = CFArrayGetCount(v10);
            if (Count >= 1)
            {
              CFIndex v12 = Count;
              Mutable = 0;
              CFIndex v14 = 0;
              v15 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
              do
              {
                CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v10, v14);
                CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, ValueAtIndex);
                if (!Mutable) {
                  Mutable = CFArrayCreateMutable(0, 0, v15);
                }
                CFArrayAppendValue(Mutable, MutableCopy);
                CFRelease(MutableCopy);
                ++v14;
              }
              while (v12 != v14);
            }
          }
        }
      }
      result = (Class)*((void *)v3 + 4);
      if (result)
      {
        v18 = (uint64_t (*)(void))*((void *)result + 2);
        return (Class)v18();
      }
    }
  }
  return result;
}

@end