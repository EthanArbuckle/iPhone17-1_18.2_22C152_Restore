@interface IOHIDServiceSetMiscDebugDebugInfo
@end

@implementation IOHIDServiceSetMiscDebugDebugInfo

void ___IOHIDServiceSetMiscDebugDebugInfo_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t UUID = IOHIDEventSystemConnectionGetUUID(a2);
  if (UUID) {
    v4 = (__CFString *)UUID;
  }
  else {
    v4 = @"unknown";
  }
  v5 = *(__CFArray **)(a1 + 32);

  CFArrayAppendValue(v5, v4);
}

void ___IOHIDServiceSetMiscDebugDebugInfo_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t UUID = IOHIDEventSystemConnectionGetUUID(a2);
  if (UUID) {
    v4 = (__CFString *)UUID;
  }
  else {
    v4 = @"unknown";
  }
  v5 = *(__CFArray **)(a1 + 32);

  CFArrayAppendValue(v5, v4);
}

@end