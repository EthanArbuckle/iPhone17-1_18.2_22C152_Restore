@interface BKHIDVendorDefinedEventProcessor
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
@end

@implementation BKHIDVendorDefinedEventProcessor

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  v9 = *a3;
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  uint64_t v11 = IOHIDEventGetIntegerValue();
  if (IntegerValue == 65292)
  {
    v12 = BKLogMotionEvents();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 134218240;
    uint64_t v26 = 65292;
    __int16 v27 = 2048;
    uint64_t v28 = v11;
    v13 = "Motion event usagePage:0x%lX usage:%ld ";
  }
  else
  {
    v12 = BKLogHID();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 134218240;
    uint64_t v26 = IntegerValue;
    __int16 v27 = 2048;
    uint64_t v28 = v11;
    v13 = "VendorDefinedEvent usagePage:0x%lX usage:%ld ";
  }
  _os_log_debug_impl(&dword_227A12000, v12, OS_LOG_TYPE_DEBUG, v13, buf, 0x16u);
LABEL_5:

  v14 = [v8 destinationsForEvent:v9 fromSender:v7];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        [v8 postEvent:v9 toDestination:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v16);
  }

  return 1;
}

@end