@interface IOHIDManagerSerializeState
@end

@implementation IOHIDManagerSerializeState

void ____IOHIDManagerSerializeState_block_invoke(uint64_t a1, IOHIDDeviceRef device)
{
  uint64_t entryID = 0;
  io_registry_entry_t Service = IOHIDDeviceGetService(device);
  if (Service)
  {
    IORegistryEntryGetRegistryEntryID(Service, &entryID);
    _IOHIDArrayAppendSInt64(*(void **)(a1 + 32), entryID);
  }
}

@end