@interface BKHIDPointerEventProcessor
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (void)_dispatchEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5 destinations:(id)a6;
@end

@implementation BKHIDPointerEventProcessor

- (void).cxx_destruct
{
}

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
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = *a3;
  if (IOHIDEventGetType() == 17)
  {
    uint64_t SenderID = IOHIDEventGetSenderID();
    uint64_t Event = IOHIDEventGetEvent();
    if (Event)
    {
      IOHIDEventGetFloatValue();
      double v14 = v13;
      IOHIDEventGetFloatValue();
      BOOL v16 = v15 != 0.0 || v14 != 0.0;
    }
    else
    {
      BOOL v16 = 0;
    }
    uint64_t v18 = IOHIDEventGetEvent();
    if (v18) {
      BOOL v19 = IOHIDEventGetIntegerValue() != 0;
    }
    else {
      BOOL v19 = 0;
    }
    v42 = self;
    eventRecords = self->_eventRecords;
    uint64_t v21 = SenderID;
    uint64_t v22 = [NSNumber numberWithUnsignedLongLong:SenderID];
    v23 = [(NSMutableDictionary *)eventRecords objectForKey:v22];

    if (v23)
    {
      v24 = [(BKHIDPointerEventRecord *)v23 destinations];
      if (Event) {
        [(BKHIDPointerEventRecord *)v23 setTrackingPointerMovement:v16];
      }
      if (v18) {
        [(BKHIDPointerEventRecord *)v23 setTrackingButtonDown:v19];
      }
      if (![(BKHIDPointerEventRecord *)v23 trackingPointerMovement]
        && ![(BKHIDPointerEventRecord *)v23 trackingButtonDown])
      {
        v25 = v42->_eventRecords;
        v26 = [NSNumber numberWithUnsignedLongLong:v21];
        [(NSMutableDictionary *)v25 removeObjectForKey:v26];

        v27 = BKLogHID();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
LABEL_26:
          v35 = v42;

          goto LABEL_29;
        }
        v28 = [v8 displayUUID];
        v29 = [(BKHIDPointerEventRecord *)v23 succinctDescription];
        *(_DWORD *)buf = 134218498;
        uint64_t v44 = v21;
        __int16 v45 = 2114;
        v46 = v28;
        __int16 v47 = 2114;
        v48 = v29;
        v30 = " %llX <displayID:%{public}@> pointer processing finished: %{public}@";
LABEL_25:
        _os_log_impl(&dword_227A12000, v27, OS_LOG_TYPE_DEFAULT, v30, buf, 0x20u);

        goto LABEL_26;
      }
    }
    else
    {
      v24 = [v9 destinationsForEvent:v10 fromSender:v8];
      if (v19 || v16)
      {
        v23 = objc_alloc_init(BKHIDPointerEventRecord);
        [(BKHIDPointerEventRecord *)v23 setSenderInfo:v8];
        [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
        -[BKHIDPointerEventRecord setDestinationCaptureTime:](v23, "setDestinationCaptureTime:");
        [(BKHIDPointerEventRecord *)v23 setDestinations:v24];
        [(BKHIDPointerEventRecord *)v23 setTrackingButtonDown:v19];
        [(BKHIDPointerEventRecord *)v23 setTrackingPointerMovement:v16];
        v31 = v42->_eventRecords;
        if (!v31)
        {
          v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
          v33 = v42->_eventRecords;
          v42->_eventRecords = v32;

          v31 = v42->_eventRecords;
        }
        v34 = [NSNumber numberWithUnsignedLongLong:v21];
        [(NSMutableDictionary *)v31 setObject:v23 forKey:v34];

        v27 = BKLogHID();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_26;
        }
        v28 = [v8 displayUUID];
        v29 = [(BKHIDPointerEventRecord *)v23 succinctDescription];
        *(_DWORD *)buf = 134218498;
        uint64_t v44 = v21;
        __int16 v45 = 2114;
        v46 = v28;
        __int16 v47 = 2114;
        v48 = v29;
        v30 = " %llX <displayID:%{public}@> pointer processing began: %{public}@";
        goto LABEL_25;
      }
      v23 = 0;
    }
    v35 = v42;
LABEL_29:
    uint64_t v36 = [v24 count];
    v37 = BKLogHID();
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_INFO);
    if (v36)
    {
      if (v38)
      {
        v39 = [v8 displayUUID];
        *(_DWORD *)buf = 138543618;
        uint64_t v44 = (uint64_t)v39;
        __int16 v45 = 2114;
        v46 = v10;
        _os_log_impl(&dword_227A12000, v37, OS_LOG_TYPE_INFO, "Got an external interaction event meant for display: %{public}@, %{public}@", buf, 0x16u);
      }
      if ([v8 eventSource]) {
        goto LABEL_37;
      }
      v37 = [v8 displayUUID];
      _BKHIDNoteUserEventOccurredOnDisplay();
    }
    else if (v38)
    {
      int Type = IOHIDEventGetType();
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = Type;
      _os_log_impl(&dword_227A12000, v37, OS_LOG_TYPE_INFO, "Got an external interaction event of type %d, but there is no destination set for it", buf, 8u);
    }

LABEL_37:
    [(BKHIDPointerEventProcessor *)v35 _dispatchEvent:v10 sender:v8 dispatcher:v9 destinations:v24];

    int64_t v17 = 1;
    goto LABEL_38;
  }
  int64_t v17 = 0;
LABEL_38:

  return v17;
}

@end