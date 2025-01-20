@interface BKHIDGameControllerEventProcessor
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
@end

@implementation BKHIDGameControllerEventProcessor

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  _BKHIDNoteUserEventOccurredOnDisplay();
  v9 = BKLogIdleTimer();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_227A12000, v9, OS_LOG_TYPE_DEBUG, "game controller event occurred; notifying user event timer",
      buf,
      2u);
  }

  v10 = [v8 destinationsForEvent:*a3 fromSender:v7];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v14);
        Copy = (const void *)IOHIDEventCreateCopy();
        [v7 eventSource];
        BKSHIDEventSetSimpleDeliveryInfo();
        [v8 postEvent:Copy toDestination:v15];
        CFRelease(Copy);
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v12);
  }

  return 1;
}

@end