@interface BKHIDEventBuffer
- (BKHIDEventBuffer)initWithDispatchTarget:(id)a3;
- (BKSHIDEventDispatchingTarget)dispatchTarget;
- (BOOL)allBufferingClientsTerminated;
- (BOOL)hasEvents;
- (NSSet)bufferingPIDs;
- (NSString)description;
- (id)_test_peekAllEvents;
- (id)_test_peekAllIOHIDEvents;
- (id)drainAllEvents;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)appendEvent:(__IOHIDEvent *)a3 sender:(id)a4 sequence:(id)a5 additionalContext:(id)a6;
- (void)dealloc;
- (void)invalidate;
- (void)setAllBufferingClientsTerminated:(BOOL)a3;
- (void)setBufferingPIDs:(id)a3;
@end

@implementation BKHIDEventBuffer

- (NSSet)bufferingPIDs
{
  return self->_bufferingPIDs;
}

- (void)setBufferingPIDs:(id)a3
{
}

- (void)invalidate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v3 = self->_buffer;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7++), "invalidate", (void)v10);
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }

    buffer = self->_buffer;
    self->_buffer = 0;

    dispatchTarget = self->_dispatchTarget;
    self->_dispatchTarget = 0;
  }
}

- (BOOL)hasEvents
{
  return [(NSMutableArray *)self->_buffer count] != 0;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

id __49__BKHIDEventBuffer_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"dispatchTarget"];
  if ([*(id *)(*(void *)(a1 + 40) + 32) count]) {
    id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"bufferingPIDs"];
  }
  id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "count"), @"eventCount");
  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 17) withName:@"allBufferingClientsTerminated" ifEqualTo:1];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__BKHIDEventBuffer_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E68718D8;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 appendProem:self block:v6];
}

- (BKHIDEventBuffer)initWithDispatchTarget:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKHIDEventBuffer;
  uint64_t v6 = [(BKHIDEventBuffer *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchTarget, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:256];
    buffer = v7->_buffer;
    v7->_buffer = (NSMutableArray *)v8;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferingPIDs, 0);
  objc_storeStrong((id *)&self->_dispatchTarget, 0);

  objc_storeStrong((id *)&self->_buffer, 0);
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidated)
  {
    id v4 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_invalidated"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v5 = NSStringFromSelector(a2);
      uint64_t v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      long long v10 = v5;
      __int16 v11 = 2114;
      long long v12 = v7;
      __int16 v13 = 2048;
      v14 = self;
      __int16 v15 = 2114;
      v16 = @"BKHIDEventBuffer.m";
      __int16 v17 = 1024;
      int v18 = 76;
      __int16 v19 = 2114;
      v20 = v4;
      _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFDF02F0);
  }
  v8.receiver = self;
  v8.super_class = (Class)BKHIDEventBuffer;
  [(BKHIDEventBuffer *)&v8 dealloc];
}

- (void)setAllBufferingClientsTerminated:(BOOL)a3
{
  self->_allBufferingClientsTerminated = a3;
}

- (BOOL)allBufferingClientsTerminated
{
  return self->_allBufferingClientsTerminated;
}

- (BKSHIDEventDispatchingTarget)dispatchTarget
{
  return self->_dispatchTarget;
}

- (id)_test_peekAllIOHIDEvents
{
  return (id)[(NSMutableArray *)self->_buffer bs_map:&__block_literal_global_2859];
}

uint64_t __44__BKHIDEventBuffer__test_peekAllIOHIDEvents__block_invoke(uint64_t a1, void *a2)
{
  return [a2 event];
}

- (id)_test_peekAllEvents
{
  return self->_buffer;
}

- (id)drainAllEvents
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = BKLogEventDelivery();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [(NSMutableArray *)self->_buffer count];
    v10[0] = 67109120;
    v10[1] = v4;
    _os_log_impl(&dword_1CFDE2000, v3, OS_LOG_TYPE_DEFAULT, "Draining buffer with %d events", (uint8_t *)v10, 8u);
  }

  id v5 = self->_buffer;
  uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:256];
  buffer = self->_buffer;
  self->_buffer = v6;

  bufferingPIDs = self->_bufferingPIDs;
  self->_bufferingPIDs = 0;

  return v5;
}

- (void)appendEvent:(__IOHIDEvent *)a3 sender:(id)a4 sequence:(id)a5 additionalContext:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    __int16 v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"event != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v20 = NSStringFromSelector(a2);
      uint64_t v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138544642;
      v36 = v20;
      __int16 v37 = 2114;
      v38 = v22;
      __int16 v39 = 2048;
      v40 = self;
      __int16 v41 = 2114;
      v42 = @"BKHIDEventBuffer.m";
      __int16 v43 = 1024;
      int v44 = 82;
      __int16 v45 = 2114;
      v46 = v19;
      _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFE03000);
  }
  if (!v11)
  {
    v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"sender != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v24 = NSStringFromSelector(a2);
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      *(_DWORD *)buf = 138544642;
      v36 = v24;
      __int16 v37 = 2114;
      v38 = v26;
      __int16 v39 = 2048;
      v40 = self;
      __int16 v41 = 2114;
      v42 = @"BKHIDEventBuffer.m";
      __int16 v43 = 1024;
      int v44 = 83;
      __int16 v45 = 2114;
      v46 = v23;
      _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFE030F8);
  }
  if (!v12)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"sequence != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v28 = NSStringFromSelector(a2);
      v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      *(_DWORD *)buf = 138544642;
      v36 = v28;
      __int16 v37 = 2114;
      v38 = v30;
      __int16 v39 = 2048;
      v40 = self;
      __int16 v41 = 2114;
      v42 = @"BKHIDEventBuffer.m";
      __int16 v43 = 1024;
      int v44 = 84;
      __int16 v45 = 2114;
      v46 = v27;
      _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFE031F0);
  }
  v14 = v13;
  __int16 v15 = [v11 senderDescriptor];

  if (!v15)
  {
    v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[sender senderDescriptor] != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v32 = NSStringFromSelector(a2);
      v33 = (objc_class *)objc_opt_class();
      v34 = NSStringFromClass(v33);
      *(_DWORD *)buf = 138544642;
      v36 = v32;
      __int16 v37 = 2114;
      v38 = v34;
      __int16 v39 = 2048;
      v40 = self;
      __int16 v41 = 2114;
      v42 = @"BKHIDEventBuffer.m";
      __int16 v43 = 1024;
      int v44 = 85;
      __int16 v45 = 2114;
      v46 = v31;
      _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFE032E8);
  }
  if ((unint64_t)[(NSMutableArray *)self->_buffer count] > 0x100)
  {
    BKLogEventDelivery();
    v16 = (BKBufferedEventEntry *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    __int16 v17 = BKSHIDEventGetConciseDescription();
    *(_DWORD *)buf = 138543362;
    v36 = v17;
    _os_log_error_impl(&dword_1CFDE2000, &v16->super, OS_LOG_TYPE_ERROR, "BUFFER: is full -- dropping event (%{public}@)", buf, 0xCu);
  }
  else
  {
    v16 = objc_alloc_init(BKBufferedEventEntry);
    [(BKBufferedEventEntry *)v16 setEvent:a3];
    [(BKBufferedEventEntry *)v16 setSender:v11];
    [(BKBufferedEventEntry *)v16 setSequence:v12];
    if (v14) {
      [(BKBufferedEventEntry *)v16 setAdditionalContext:v14];
    }
    [(NSMutableArray *)self->_buffer addObject:v16];
    __int16 v17 = BKLogEventDelivery();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v18 = BKSHIDEventGetConciseDescription();
      *(_DWORD *)buf = 138543362;
      v36 = v18;
      _os_log_debug_impl(&dword_1CFDE2000, v17, OS_LOG_TYPE_DEBUG, "BUFFER: appending (%{public}@)", buf, 0xCu);
    }
  }

LABEL_12:
}

@end