@interface BKHIDPrimaryEventProcessor
- (BKHIDPrimaryEventProcessor)initWithSubProcessors:(id)a3[43] defaultProcessor:(id)a4;
- (id)_eventProcessorsForEventType:(unsigned int)a3;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (int64_t)processEvent:(__IOHIDEvent *)a3 withContext:(id)a4 buffer:(id)a5 sequence:(id)a6 sender:(id)a7 dispatcher:(id)a8 resolution:(id)a9;
- (void)bufferDidEndDraining:(id)a3;
- (void)bufferWillBeginDraining:(id)a3;
- (void)bufferingDidAddNewBuffers:(id)a3;
- (void)postEvent:(__IOHIDEvent *)a3 withContext:(id)a4 toResolution:(id)a5 fromSequence:(id)a6;
@end

@implementation BKHIDPrimaryEventProcessor

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = self->_subProcessors[IOHIDEventGetType()];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v11 = v10;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v12)
  {

LABEL_13:
    defaultProcessor = self->_defaultProcessor;
    if (defaultProcessor) {
      int64_t v16 = [(BKHIDEventProcessor *)defaultProcessor processEvent:a3 sender:v8 dispatcher:v9];
    }
    else {
      int64_t v16 = 0;
    }
    goto LABEL_16;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v20;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v20 != v14) {
        objc_enumerationMutation(v11);
      }
      int64_t v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "processEvent:sender:dispatcher:", a3, v8, v9, (void)v19);
      if (v16 == 1)
      {

        goto LABEL_16;
      }
    }
    uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13) {
      continue;
    }
    break;
  }

  if (!v16) {
    goto LABEL_13;
  }
LABEL_16:

  return v16;
}

- (void)bufferingDidAddNewBuffers:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_allBufferedEventProcessors;
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "bufferingDidAddNewBuffers:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)bufferWillBeginDraining:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_allBufferedEventProcessors;
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "bufferWillBeginDraining:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)bufferDidEndDraining:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_allBufferedEventProcessors;
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "bufferDidEndDraining:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultBufferedEventProcessor, 0);
  objc_storeStrong((id *)&self->_allBufferedEventProcessors, 0);
  for (uint64_t i = 696; i != 352; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_defaultProcessor, 0);
  uint64_t v4 = 344;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v4), 0);
    v4 -= 8;
  }
  while (v4);
}

- (id)_eventProcessorsForEventType:(unsigned int)a3
{
  v3 = (void *)[(NSArray *)self->_subProcessors[a3] copy];

  return v3;
}

- (void)postEvent:(__IOHIDEvent *)a3 withContext:(id)a4 toResolution:(id)a5 fromSequence:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v13 = [NSString stringWithFormat:@"Something is misconfigured --BKHIDPrimaryEventProcessor should never be messaged directly by a sequence"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = NSStringFromSelector(a2);
    uint64_t v15 = (objc_class *)objc_opt_class();
    int64_t v16 = NSStringFromClass(v15);
    int v17 = 138544642;
    v18 = v14;
    __int16 v19 = 2114;
    long long v20 = v16;
    __int16 v21 = 2048;
    long long v22 = self;
    __int16 v23 = 2114;
    uint64_t v24 = @"BKHIDPrimaryEventProcessor.m";
    __int16 v25 = 1024;
    int v26 = 96;
    __int16 v27 = 2114;
    v28 = v13;
    _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v17, 0x3Au);
  }
  [v13 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 withContext:(id)a4 buffer:(id)a5 sequence:(id)a6 sender:(id)a7 dispatcher:(id)a8 resolution:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  __int16 v21 = [NSString stringWithFormat:@"Something is misconfigured --BKHIDPrimaryEventProcessor should never be messaged directly by a sequence"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v22 = NSStringFromSelector(a2);
    __int16 v23 = (objc_class *)objc_opt_class();
    uint64_t v24 = NSStringFromClass(v23);
    int v26 = 138544642;
    __int16 v27 = v22;
    __int16 v28 = 2114;
    v29 = v24;
    __int16 v30 = 2048;
    v31 = self;
    __int16 v32 = 2114;
    v33 = @"BKHIDPrimaryEventProcessor.m";
    __int16 v34 = 1024;
    int v35 = 91;
    __int16 v36 = 2114;
    v37 = v21;
    _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v26, 0x3Au);
  }
  [v21 UTF8String];
  int64_t result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BKHIDPrimaryEventProcessor)initWithSubProcessors:(id)a3[43] defaultProcessor:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v30.receiver = self;
  v30.super_class = (Class)BKHIDPrimaryEventProcessor;
  uint64_t v7 = [(BKHIDPrimaryEventProcessor *)&v30 init];
  if (v7)
  {
    id obj = a4;
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v9 = 0;
    p_isa = (id *)&v7->super.isa;
    bufferedSubProcessors = v7->_bufferedSubProcessors;
    subProcessors = v7->_subProcessors;
    do
    {
      id v10 = a3[v9];
      id v11 = v10;
      objc_storeStrong((id *)&subProcessors[v9], v10);
      id v12 = [MEMORY[0x1E4F1CA48] array];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v27 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              [v8 addObject:v18];
              [(NSArray *)v12 addObject:v18];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v15);
      }

      id v19 = bufferedSubProcessors[v9];
      bufferedSubProcessors[v9] = v12;

      ++v9;
    }
    while (v9 != 43);
    uint64_t v7 = (BKHIDPrimaryEventProcessor *)p_isa;
    objc_storeStrong(p_isa + 88, v8);
    objc_storeStrong(p_isa + 44, obj);
    if (objc_opt_respondsToSelector()) {
      objc_storeStrong(p_isa + 89, obj);
    }
  }
  return v7;
}

@end