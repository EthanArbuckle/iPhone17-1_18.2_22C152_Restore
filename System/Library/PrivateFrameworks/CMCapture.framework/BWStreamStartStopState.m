@interface BWStreamStartStopState
- (BOOL)dependentWillStart;
- (float)initWithStream:(void *)a3 masterState:(float)a4 timeoutInSeconds:;
- (id)description;
- (uint64_t)streamDidStop;
- (uint64_t)streamWillStart;
- (uint64_t)streamWillStop;
- (void)dealloc;
@end

@implementation BWStreamStartStopState

- (float)initWithStream:(void *)a3 masterState:(float)a4 timeoutInSeconds:
{
  if (!a1) {
    return 0;
  }
  v10.receiver = a1;
  v10.super_class = (Class)BWStreamStartStopState;
  v7 = (float *)objc_msgSendSuper2(&v10, sel_init);
  if (v7)
  {
    if ((a3 == 0) == [a2 isSynchronizationMaster])
    {
      *((void *)v7 + 2) = a2;
      *((void *)v7 + 6) = a3;
      v7[16] = a4;
      v8 = dispatch_group_create();
      *((void *)v7 + 3) = v8;
      dispatch_group_enter(v8);
      *((unsigned char *)v7 + 32) = 1;
      *((void *)v7 + 5) = dispatch_group_create();
      return v7;
    }
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  return v7;
}

- (uint64_t)streamWillStart
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  if (*(_DWORD *)(result + 8)) {
    return 0;
  }
  *(_DWORD *)(result + 8) = 1;
  uint64_t v2 = *(void *)(result + 48);
  if (!v2) {
    goto LABEL_7;
  }
  BOOL started = -[BWStreamStartStopState dependentWillStart](v2);
  if (!*(unsigned char *)(v1 + 68) || [*(id *)(v1 + 56) count])
  {
    if (started) {
      goto LABEL_7;
    }
    return 0;
  }
  usleep(0x186A0u);
  if (!started) {
    return 0;
  }
LABEL_7:
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v4 = *(void **)(v1 + 56);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v5) {
    return 1;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v10;
LABEL_9:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v10 != v7) {
      objc_enumerationMutation(v4);
    }
    result = -[BWStreamStartStopState dependentWillStart](*(void *)(*((void *)&v9 + 1) + 8 * v8));
    if (!result) {
      return result;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      result = 1;
      if (v6) {
        goto LABEL_9;
      }
      return result;
    }
  }
}

- (BOOL)dependentWillStart
{
  if (result)
  {
    uint64_t v1 = result;
    float v2 = *(float *)(result + 64);
    if (v2 == 0.0) {
      dispatch_time_t v3 = -1;
    }
    else {
      dispatch_time_t v3 = dispatch_time(0, (uint64_t)(float)(v2 * 1000000000.0));
    }
    intptr_t v4 = dispatch_group_wait(*(dispatch_group_t *)(v1 + 24), v3);
    dispatch_group_enter(*(dispatch_group_t *)(v1 + 40));
    return v4 == 0;
  }
  return result;
}

- (void)dealloc
{
  if (self->_hasEnteredStartedGroup) {
    dispatch_group_leave((dispatch_group_t)self->_hasStartedGroup);
  }

  v3.receiver = self;
  v3.super_class = (Class)BWStreamStartStopState;
  [(BWStreamStartStopState *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Start/Stop state for %@", -[BWFigVideoCaptureStream portType](self->_stream, "portType")];
}

- (uint64_t)streamWillStop
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(_DWORD *)(result + 8) == 2)
    {
      *(_DWORD *)(result + 8) = 3;
      float v2 = *(float *)(result + 64);
      if (v2 == 0.0) {
        dispatch_time_t v3 = -1;
      }
      else {
        dispatch_time_t v3 = dispatch_time(0, (uint64_t)(float)(v2 * 1000000000.0));
      }
      return dispatch_group_wait(*(dispatch_group_t *)(v1 + 40), v3) == 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)streamDidStop
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if (*(_DWORD *)(result + 8) == 3)
    {
      *(_DWORD *)(result + 8) = 0;
      dispatch_group_enter(*(dispatch_group_t *)(result + 24));
      *(unsigned char *)(v1 + 32) = 1;
      uint64_t v2 = *(void *)(v1 + 48);
      if (v2) {
        dispatch_group_leave(*(dispatch_group_t *)(v2 + 40));
      }
      long long v10 = 0u;
      long long v11 = 0u;
      long long v8 = 0u;
      long long v9 = 0u;
      dispatch_time_t v3 = *(void **)(v1 + 56);
      result = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (result)
      {
        uint64_t v4 = result;
        uint64_t v5 = *(void *)v9;
        do
        {
          uint64_t v6 = 0;
          do
          {
            if (*(void *)v9 != v5) {
              objc_enumerationMutation(v3);
            }
            uint64_t v7 = *(void *)(*((void *)&v8 + 1) + 8 * v6);
            if (v7) {
              dispatch_group_leave(*(dispatch_group_t *)(v7 + 40));
            }
            ++v6;
          }
          while (v4 != v6);
          result = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
          uint64_t v4 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

@end