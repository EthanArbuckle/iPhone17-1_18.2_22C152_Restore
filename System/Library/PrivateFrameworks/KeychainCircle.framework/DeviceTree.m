@interface DeviceTree
@end

@implementation DeviceTree

void __DeviceTree_SupportsEnhancedApfs_block_invoke()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  io_registry_entry_t v0 = IORegistryEntryFromPath(*MEMORY[0x263F0EC88], "IODeviceTree:/filesystems");
  if (v0)
  {
    io_object_t v1 = v0;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v0, @"e-apfs", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (CFProperty)
    {
      CFRelease(CFProperty);
      DeviceTree_SupportsEnhancedApfs_supported = 1;
    }
    IOObjectRelease(v1);
  }
  v3 = secLogObjForScope("eapfs");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = DeviceTree_SupportsEnhancedApfs_supported;
    _os_log_impl(&dword_218274000, v3, OS_LOG_TYPE_DEFAULT, "eapfs IODT set to %{BOOL}d", (uint8_t *)v4, 8u);
  }
}

@end