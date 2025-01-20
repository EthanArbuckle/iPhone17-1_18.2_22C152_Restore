@interface HIDEvent
+ (id)proximityEvent:(unint64_t)a3 mask:(unsigned int)a4 probability:(float)a5 options:(unsigned int)a6;
- (char)vendorDefinedData;
- (float)probability;
- (int64_t)builtIn;
- (unint64_t)senderID;
- (unsigned)proximityDetectionMask;
- (unsigned)vendorDefinedDataLength;
- (unsigned)vendorDefinedUsage;
- (unsigned)vendorDefinedUsagePage;
- (unsigned)vendorDefinedVersion;
- (void)setBuiltIn:(int64_t)a3;
- (void)setSenderID:(unint64_t)a3;
- (void)setVendorDefinedUsage:(unsigned __int16)a3;
- (void)setVendorDefinedUsagePage:(unsigned __int16)a3;
- (void)setVendorDefinedVersion:(unsigned int)a3;
@end

@implementation HIDEvent

- (unint64_t)senderID
{
  return _IOHIDEventGetSenderID(self, a2);
}

- (void)setSenderID:(unint64_t)a3
{
}

- (int64_t)builtIn
{
  return IOHIDEventGetIntegerValue();
}

- (void)setBuiltIn:(int64_t)a3
{
}

- (char)vendorDefinedData
{
  return (char *)_IOHIDEventGetDataValue(self, 65540);
}

- (unsigned)vendorDefinedDataLength
{
  return IOHIDEventGetIntegerValue();
}

- (unsigned)vendorDefinedUsage
{
  return IOHIDEventGetIntegerValue();
}

- (void)setVendorDefinedUsage:(unsigned __int16)a3
{
}

- (unsigned)vendorDefinedUsagePage
{
  return IOHIDEventGetIntegerValue();
}

- (void)setVendorDefinedUsagePage:(unsigned __int16)a3
{
}

- (unsigned)vendorDefinedVersion
{
  return IOHIDEventGetIntegerValue();
}

- (void)setVendorDefinedVersion:(unsigned int)a3
{
}

+ (id)proximityEvent:(unint64_t)a3 mask:(unsigned int)a4 probability:(float)a5 options:(unsigned int)a6
{
  ProximtyProbabilityEvent = (void *)IOHIDEventCreateProximtyProbabilityEvent();

  return ProximtyProbabilityEvent;
}

- (unsigned)proximityDetectionMask
{
  return IOHIDEventGetIntegerValue();
}

- (float)probability
{
  unsigned int IntegerValue = IOHIDEventGetIntegerValue();
  float result = (double)IntegerValue * 0.0000152587891;
  if (IntegerValue == 0x80000000) {
    return NAN;
  }
  return result;
}

@end