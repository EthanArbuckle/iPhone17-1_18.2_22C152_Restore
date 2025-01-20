@interface BKHIDGenericGestureEventProcessor
- (BKHIDEventDispatcher)eventDispatcher;
- (NSMutableDictionary)genericGestureTypePerSenderID;
- (NSMutableDictionary)pendingDestinationsPerSenderID;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (void)_postEvent:(__IOHIDEvent *)a3 toDestination:(id)a4 usingDispatcher:(id)a5;
- (void)serviceDidDisappear:(id)a3;
- (void)setEventDispatcher:(id)a3;
- (void)setGenericGestureTypePerSenderID:(id)a3;
- (void)setPendingDestinationsPerSenderID:(id)a3;
@end

@implementation BKHIDGenericGestureEventProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDispatcher, 0);
  objc_storeStrong((id *)&self->_genericGestureTypePerSenderID, 0);
  objc_storeStrong((id *)&self->_pendingDestinationsPerSenderID, 0);
}

- (void)setEventDispatcher:(id)a3
{
}

- (BKHIDEventDispatcher)eventDispatcher
{
  return self->_eventDispatcher;
}

- (void)setGenericGestureTypePerSenderID:(id)a3
{
}

- (NSMutableDictionary)genericGestureTypePerSenderID
{
  return self->_genericGestureTypePerSenderID;
}

- (void)setPendingDestinationsPerSenderID:(id)a3
{
}

- (NSMutableDictionary)pendingDestinationsPerSenderID
{
  return self->_pendingDestinationsPerSenderID;
}

- (void)_postEvent:(__IOHIDEvent *)a3 toDestination:(id)a4 usingDispatcher:(id)a5
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a5;
  v8 = BKLogGenericGesture();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v6;
    _os_log_impl(&dword_227A12000, v8, OS_LOG_TYPE_DEFAULT, "  send to %{public}@", (uint8_t *)&v11, 0xCu);
  }

  Copy = (const void *)IOHIDEventCreateCopy();
  v10 = [MEMORY[0x263F29818] baseAttributesFromProvider:v6];
  BKSHIDEventSetAttributes();
  [v7 postEvent:Copy toDestination:v6];

  CFRelease(Copy);
}

- (void)serviceDidDisappear:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = [v4 senderID];
  id v6 = [NSNumber numberWithUnsignedLongLong:v5];
  id v7 = [(NSMutableDictionary *)self->_pendingDestinationsPerSenderID objectForKey:v6];
  if ([v7 count])
  {
    v16 = [(NSMutableDictionary *)self->_genericGestureTypePerSenderID objectForKey:v6];
    [v16 unsignedIntValue];
    mach_absolute_time();
    GenericGestureEvent = (const void *)IOHIDEventCreateGenericGestureEvent();
    IOHIDEventSetSenderID();
    IOHIDEventSetPhase();
    v9 = BKLogGenericGesture();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = BKSHIDEventGetConciseDescription();
      *(_DWORD *)buf = 138543362;
      v23 = v10;
      _os_log_impl(&dword_227A12000, v9, OS_LOG_TYPE_DEFAULT, "generic cancel %{public}@", buf, 0xCu);
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          [(BKHIDGenericGestureEventProcessor *)self _postEvent:GenericGestureEvent toDestination:*(void *)(*((void *)&v17 + 1) + 8 * v15++) usingDispatcher:self->_eventDispatcher];
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }

    [(NSMutableDictionary *)self->_pendingDestinationsPerSenderID removeObjectForKey:v6];
    [(NSMutableDictionary *)self->_genericGestureTypePerSenderID removeObjectForKey:v6];
    CFRelease(GenericGestureEvent);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  v10 = *a3;
  objc_storeStrong((id *)&self->_eventDispatcher, a5);
  if (IOHIDEventGetType() == 39)
  {
    id v11 = BKLogGenericGesture();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = BKSHIDEventGetConciseDescription();
      *(_DWORD *)buf = 138543362;
      uint64_t v53 = (uint64_t)v12;
      _os_log_impl(&dword_227A12000, v11, OS_LOG_TYPE_DEFAULT, "generic %{public}@", buf, 0xCu);
    }
    int Phase = IOHIDEventGetPhase();
    if (!Phase)
    {
      long long v19 = BKLogGenericGesture();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v53 = (uint64_t)v10;
        _os_log_error_impl(&dword_227A12000, v19, OS_LOG_TYPE_ERROR, "filtering out generic event with zero phase (%{public}@)", buf, 0xCu);
      }
      goto LABEL_43;
    }
    char v14 = Phase;
    os_unfair_lock_lock(&self->_lock);
    uint64_t v45 = [v8 senderID];
    objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    v47 = int v46 = v14 & 0xC;
    uint64_t v15 = -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingDestinationsPerSenderID, "objectForKeyedSubscript:");
    if ([v15 count])
    {
      v16 = 0;
      long long v17 = v15;
    }
    else
    {
      long long v17 = v15;
      uint64_t v15 = [v9 destinationsForEvent:v10 fromSender:v8];
      v16 = v15;
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v20 = v15;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v49 != v23) {
            objc_enumerationMutation(v20);
          }
          [(BKHIDGenericGestureEventProcessor *)self _postEvent:v10 toDestination:*(void *)(*((void *)&v48 + 1) + 8 * i) usingDispatcher:v9];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v22);
    }

    if (v46)
    {
      v25 = v17;
      uint64_t v26 = [v17 count];
      long long v19 = v47;
      v27 = v16;
      if (v26)
      {
        v28 = BKLogGenericGesture();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v53 = v45;
          _os_log_impl(&dword_227A12000, v28, OS_LOG_TYPE_DEFAULT, "  sender:%llX remove all destinations", buf, 0xCu);
        }

        [(NSMutableDictionary *)self->_pendingDestinationsPerSenderID removeObjectForKey:v47];
        [(NSMutableDictionary *)self->_genericGestureTypePerSenderID removeObjectForKey:v47];
        uint64_t v29 = objc_opt_class();
        id v30 = v8;
        if (v29)
        {
          if (objc_opt_isKindOfClass()) {
            v31 = v30;
          }
          else {
            v31 = 0;
          }
        }
        else
        {
          v31 = 0;
        }
        id v43 = v31;

        if (v43) {
          [v43 removeDisappearanceObserver:self];
        }
LABEL_41:
      }
    }
    else
    {
      v27 = v16;
      v25 = v17;
      long long v19 = v47;
      if ([v16 count])
      {
        pendingDestinationsPerSenderID = self->_pendingDestinationsPerSenderID;
        if (!pendingDestinationsPerSenderID)
        {
          v33 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
          v34 = self->_pendingDestinationsPerSenderID;
          self->_pendingDestinationsPerSenderID = v33;

          v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
          genericGestureTypePerSenderID = self->_genericGestureTypePerSenderID;
          self->_genericGestureTypePerSenderID = v35;

          pendingDestinationsPerSenderID = self->_pendingDestinationsPerSenderID;
        }
        [(NSMutableDictionary *)pendingDestinationsPerSenderID setObject:v16 forKeyedSubscript:v47];
        v37 = [NSNumber numberWithLong:IOHIDEventGetIntegerValue()];
        [(NSMutableDictionary *)self->_genericGestureTypePerSenderID setObject:v37 forKeyedSubscript:v47];

        v38 = BKLogGenericGesture();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = objc_msgSend(v16, "bs_map:", &__block_literal_global);
          *(_DWORD *)buf = 134218242;
          uint64_t v53 = v45;
          __int16 v54 = 2114;
          v55 = v39;
          _os_log_impl(&dword_227A12000, v38, OS_LOG_TYPE_DEFAULT, "  sender:%llX acquire destinations:%{public}@", buf, 0x16u);
        }
        uint64_t v40 = objc_opt_class();
        id v41 = v8;
        if (v40)
        {
          if (objc_opt_isKindOfClass()) {
            v42 = v41;
          }
          else {
            v42 = 0;
          }
        }
        else
        {
          v42 = 0;
        }
        id v43 = v42;

        if (v43) {
          [v43 addDisappearanceObserver:self queue:MEMORY[0x263EF83A0]];
        }
        goto LABEL_41;
      }
    }
    os_unfair_lock_unlock(&self->_lock);

LABEL_43:
    int64_t v18 = 1;
    goto LABEL_44;
  }
  int64_t v18 = 0;
LABEL_44:

  return v18;
}

uint64_t __68__BKHIDGenericGestureEventProcessor_processEvent_sender_dispatcher___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 pid];
  return [v2 numberWithInt:v3];
}

@end