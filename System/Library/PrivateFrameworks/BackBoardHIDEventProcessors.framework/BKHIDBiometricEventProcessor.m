@interface BKHIDBiometricEventProcessor
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
@end

@implementation BKHIDBiometricEventProcessor

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a5;
  unsigned int IntegerValue = IOHIDEventGetIntegerValue();
  if (IntegerValue > 3)
  {
    v10 = BKLogHID();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v22 = IntegerValue;
      _os_log_error_impl(&dword_227A12000, v10, OS_LOG_TYPE_ERROR, "Dropping unknown biometric event type %d ", buf, 8u);
    }
  }
  else
  {
    Copy = (const void *)IOHIDEventCreateCopy();
    v10 = [v7 destinationsForEvent:Copy fromSender:v6];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * v14);
          [v6 eventSource];
          BKSHIDEventSetSimpleDeliveryInfo();
          [v7 postEvent:Copy toDestination:v15];
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v12);
    }
    CFRelease(Copy);
  }

  return 1;
}

@end