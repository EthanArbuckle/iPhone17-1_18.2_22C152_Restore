@interface NSDictionary(CoreCECInterfaceProperties)
- (uint64_t)getLinkState:()CoreCECInterfaceProperties physicalAddress:;
@end

@implementation NSDictionary(CoreCECInterfaceProperties)

- (uint64_t)getLinkState:()CoreCECInterfaceProperties physicalAddress:
{
  uint64_t result = [a1 objectForKey:@"kCECInterfacePropertyHasLink"];
  if (result)
  {
    *a3 = [(id)result BOOLValue];
    uint64_t result = [a1 objectForKey:@"kCECInterfacePropertyPhysicalAddress"];
    if (result)
    {
      if (CoreCECPhysicalAddressForPackedPhysicalAddress(a4, (unsigned __int16)[(id)result unsignedIntegerValue]))
      {
        return 1;
      }
      if (gLogCategory_CoreRCBus > 90) {
        return 0;
      }
      if (gLogCategory_CoreRCBus != -1 || (uint64_t result = _LogCategory_Initialize(), result))
      {
        LogPrintF();
        return 0;
      }
    }
  }
  return result;
}

@end