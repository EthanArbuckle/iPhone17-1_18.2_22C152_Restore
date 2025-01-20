@interface RegisterForDeviceIsChargingNotification
@end

@implementation RegisterForDeviceIsChargingNotification

void __cmsmdevicestate_RegisterForDeviceIsChargingNotification_block_invoke(uint64_t a1)
{
  mach_port_t v2 = *MEMORY[0x1E4F2EEF0];
  v3 = IONotificationPortCreate(*MEMORY[0x1E4F2EEF0]);
  qword_1E9358988 = (uint64_t)v3;
  if (v3)
  {
    IONotificationPortSetDispatchQueue(v3, *(dispatch_queue_t *)(a1 + 32));
    CFDictionaryRef v4 = IOServiceMatching("IOPMPowerSource");
    io_service_t MatchingService = IOServiceGetMatchingService(v2, v4);
    if (!IOServiceAddInterestNotification((IONotificationPortRef)qword_1E9358988, MatchingService, "IOGeneralInterest", (IOServiceInterestCallback)cmsmdeviceState_BatteryStateChanged, 0, &dword_1E9358984))
    {
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"ExternalConnected", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
      byte_1E9358980 = FigCFEqual();
      if (CFProperty)
      {
        CFRelease(CFProperty);
      }
    }
  }
}

@end