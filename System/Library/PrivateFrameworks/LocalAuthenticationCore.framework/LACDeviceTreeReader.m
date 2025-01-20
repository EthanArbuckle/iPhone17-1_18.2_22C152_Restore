@interface LACDeviceTreeReader
+ (id)getDataFromPath:(const char *)a3 propertyName:(__CFString *)a4;
@end

@implementation LACDeviceTreeReader

+ (id)getDataFromPath:(const char *)a3 propertyName:(__CFString *)a4
{
  io_registry_entry_t v5 = IORegistryEntryFromPath(*MEMORY[0x263F0EC88], a3);
  if (v5)
  {
    io_object_t v6 = v5;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v5, a4, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (CFProperty)
    {
      v8 = (void *)CFProperty;
      CFTypeID v9 = CFGetTypeID(CFProperty);
      if (v9 == CFDataGetTypeID()) {
        goto LABEL_7;
      }
      CFRelease(v8);
    }
    IOObjectRelease(v6);
  }
  v8 = 0;
LABEL_7:
  return v8;
}

@end