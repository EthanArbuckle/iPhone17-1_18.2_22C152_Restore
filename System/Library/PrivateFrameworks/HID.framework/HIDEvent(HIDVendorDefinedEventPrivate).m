@interface HIDEvent(HIDVendorDefinedEventPrivate)
- (uint64_t)setVendorDefinedUsage:()HIDVendorDefinedEventPrivate;
- (uint64_t)setVendorDefinedUsagePage:()HIDVendorDefinedEventPrivate;
- (uint64_t)setVendorDefinedVersion:()HIDVendorDefinedEventPrivate;
- (uint64_t)vendorDefinedData;
- (uint64_t)vendorDefinedDataLength;
- (uint64_t)vendorDefinedUsage;
- (uint64_t)vendorDefinedUsagePage;
- (uint64_t)vendorDefinedVersion;
@end

@implementation HIDEvent(HIDVendorDefinedEventPrivate)

- (uint64_t)vendorDefinedData
{
  return MEMORY[0x1F40E89D0](a1, 65540);
}

- (uint64_t)vendorDefinedDataLength
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)vendorDefinedUsage
{
  return (unsigned __int16)IOHIDEventGetIntegerValue();
}

- (uint64_t)setVendorDefinedUsage:()HIDVendorDefinedEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 65537);
}

- (uint64_t)vendorDefinedUsagePage
{
  return (unsigned __int16)IOHIDEventGetIntegerValue();
}

- (uint64_t)setVendorDefinedUsagePage:()HIDVendorDefinedEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 0x10000);
}

- (uint64_t)vendorDefinedVersion
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setVendorDefinedVersion:()HIDVendorDefinedEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 65538);
}

@end