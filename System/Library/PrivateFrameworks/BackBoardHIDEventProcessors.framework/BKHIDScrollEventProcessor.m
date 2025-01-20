@interface BKHIDScrollEventProcessor
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (void)_dispatchEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5 destinations:(id)a6;
@end

@implementation BKHIDScrollEventProcessor

- (void)_dispatchEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5 destinations:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
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
        Copy = (const void *)IOHIDEventCreateCopy();
        [v8 eventSource];
        BKSHIDEventSetSimpleDeliveryInfo();
        [v9 postEvent:Copy toDestination:v15];
        CFRelease(Copy);
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = *a3;
  if (IOHIDEventGetType() == 6)
  {
    uint64_t v11 = [v9 destinationsForEvent:v10 fromSender:v8];
    [(BKHIDScrollEventProcessor *)self _dispatchEvent:v10 sender:v8 dispatcher:v9 destinations:v11];

    uint64_t v12 = [v8 displayUUID];
    _BKHIDNoteUserEventOccurredOnDisplay();

    int64_t v13 = 1;
  }
  else
  {
    int64_t v13 = 0;
  }

  return v13;
}

@end