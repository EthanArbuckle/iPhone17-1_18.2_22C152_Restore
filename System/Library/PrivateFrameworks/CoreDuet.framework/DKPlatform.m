@interface DKPlatform
@end

@implementation DKPlatform

void __25___DKPlatform_deviceUUID__block_invoke()
{
  mach_port_t v0 = *MEMORY[0x1E4F2EF00];
  CFDictionaryRef v1 = IOServiceMatching("IOPlatformExpertDevice");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    io_object_t v3 = MatchingService;
    id CFProperty = (id)IORegistryEntryCreateCFProperty(MatchingService, @"IOPlatformUUID", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    IOObjectRelease(v3);
    if (CFProperty)
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:CFProperty];
      v5 = (void *)deviceUUID_deviceUUID_0;
      deviceUUID_deviceUUID_0 = v4;
    }
  }
}

@end