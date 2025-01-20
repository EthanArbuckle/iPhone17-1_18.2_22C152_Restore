@interface IOHIDServiceMatchObjcServicePlugin
@end

@implementation IOHIDServiceMatchObjcServicePlugin

CFTypeID ____IOHIDServiceMatchObjcServicePlugin_block_invoke(uint64_t a1, int a2, CFTypeRef cf)
{
  CFTypeID v5 = CFGetTypeID(cf);
  CFTypeID result = CFDictionaryGetTypeID();
  if (v5 == result)
  {
    io_service_t v7 = *(_DWORD *)(a1 + 40);
    v8 = (BOOLean_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    return IOServiceMatchPropertyTable(v7, (CFDictionaryRef)cf, v8);
  }
  return result;
}

@end