@interface VCPDeviceInformation
+ (BOOL)canRenderVariation;
+ (BOOL)isHomePod;
+ (id)marketingName;
+ (int64_t)batteryLevel;
@end

@implementation VCPDeviceInformation

+ (BOOL)canRenderVariation
{
  if (+[VCPDeviceInformation canRenderVariation]::onceToken != -1) {
    dispatch_once(&+[VCPDeviceInformation canRenderVariation]::onceToken, &__block_literal_global_97);
  }
  return +[VCPDeviceInformation canRenderVariation]::canRenderVariations;
}

void __42__VCPDeviceInformation_canRenderVariation__block_invoke()
{
  CFStringRef v0 = (const __CFString *)MGGetStringAnswer();
  if (v0)
  {
    CFStringRef v1 = v0;
    CFComparisonResult v2 = CFStringCompare(v0, @"iPad", 0);
    CFRelease(v1);
    if (v2)
    {
      +[VCPDeviceInformation canRenderVariation]::canRenderVariations = MGGetBoolAnswer();
    }
    else
    {
      id v3 = MTLCreateSystemDefaultDevice();
      +[VCPDeviceInformation canRenderVariation]::canRenderVariations = [v3 supportsFeatureSet:6];
    }
  }
}

+ (BOOL)isHomePod
{
  return 0;
}

+ (id)marketingName
{
  if (+[VCPDeviceInformation marketingName]::onceToken != -1) {
    dispatch_once(&+[VCPDeviceInformation marketingName]::onceToken, &__block_literal_global_9);
  }
  CFComparisonResult v2 = (void *)+[VCPDeviceInformation marketingName]::marketingName;
  return v2;
}

void __37__VCPDeviceInformation_marketingName__block_invoke()
{
  uint64_t v0 = MGGetStringAnswer();
  CFStringRef v1 = (void *)+[VCPDeviceInformation marketingName]::marketingName;
  +[VCPDeviceInformation marketingName]::marketingName = v0;
}

+ (int64_t)batteryLevel
{
  mach_port_t v2 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v3 = IOServiceMatching("IOPMPowerSource");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"CurrentCapacity", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (!CFProperty) {
    return -1;
  }
  id v6 = CFProperty;
  LODWORD(v7) = [v6 intValue];
  CFRelease(v6);
  int64_t v7 = (int)v7;

  return v7;
}

@end