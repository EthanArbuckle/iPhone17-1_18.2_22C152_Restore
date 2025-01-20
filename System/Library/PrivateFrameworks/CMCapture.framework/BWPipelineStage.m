@interface BWPipelineStage
+ (BWPipelineStage)pipelineStageWithName:(id)a3 priority:(unsigned int)a4;
+ (BWPipelineStage)pipelineStageWithName:(id)a3 priority:(unsigned int)a4 discardsLateSampleData:(BOOL)a5;
+ (BWPipelineStage)pipelineStageWithName:(id)a3 priority:(unsigned int)a4 workgroup:(id)a5;
+ (BWPipelineStage)pipelineStageWithName:(id)a3 priority:(unsigned int)a4 workgroup:(id)a5 discardsLateSampleData:(BOOL)a6;
+ (uint64_t)_setCurrentPipelineStage:(uint64_t)a1;
+ (void)_currentPipelineStage;
+ (void)initialize;
- (BOOL)stillImagePipelineStage;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (id)_serviceQueuedMessages;
- (id)description;
- (unsigned)priority;
- (void)_initWithName:(int)a3 priority:(OS_os_workgroup *)a4 workgroup:(int)a5 discardsLateSampleData:;
- (void)dealloc;
- (void)sendMessage:(id)a3 toInput:(id)a4;
- (void)sendMessagesToInput:(id)a3 messageProvider:(id)a4;
@end

@implementation BWPipelineStage

- (BOOL)stillImagePipelineStage
{
  return self->_stillImagePipelineStage;
}

id *__39__BWPipelineStage_sendMessage_toInput___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 24) addObject:*(void *)(*(void *)(a1[5] + 8) + 40)];
  [*(id *)(a1[4] + 32) addObject:*(void *)(*(void *)(a1[6] + 8) + 40)];

  v2 = (id *)a1[4];
  return -[BWPipelineStage _serviceQueuedMessages](v2);
}

+ (BWPipelineStage)pipelineStageWithName:(id)a3 priority:(unsigned int)a4 workgroup:(id)a5 discardsLateSampleData:(BOOL)a6
{
  v6 = -[BWPipelineStage _initWithName:priority:workgroup:discardsLateSampleData:]([BWPipelineStage alloc], a3, a4, (OS_os_workgroup *)a5, a6);
  return (BWPipelineStage *)v6;
}

- (void)sendMessage:(id)a3 toInput:(id)a4
{
  if (!a4)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    v12 = @"input not provided";
    goto LABEL_18;
  }
  if (!a3)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    v12 = @"message is nil";
LABEL_18:
    objc_exception_throw((id)[v10 exceptionWithName:v11 reason:v12 userInfo:0]);
  }
  if (self && +[BWPipelineStage _currentPipelineStage]() == self)
  {
    [(NSMutableArray *)self->_queuedMessages addObject:a3];
    inputsForQueuedMessages = self->_inputsForQueuedMessages;
    [(NSMutableArray *)inputsForQueuedMessages addObject:a4];
  }
  else if (*((_DWORD *)a3 + 2) != 2 || (v7 = self->_executionGroup) == 0 || !dispatch_group_wait(v7, 0))
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3052000000;
    v16[3] = __Block_byref_object_copy__9;
    v16[4] = __Block_byref_object_dispose__9;
    id v17 = 0;
    id v17 = a3;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3052000000;
    v14[3] = __Block_byref_object_copy__9;
    v14[4] = __Block_byref_object_dispose__9;
    id v15 = 0;
    id v15 = a4;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__BWPipelineStage_sendMessage_toInput___block_invoke;
    block[3] = &unk_1E5C25668;
    block[4] = self;
    block[5] = v16;
    block[6] = v14;
    executionGroup = self->_executionGroup;
    if (executionGroup) {
      dispatch_group_async(executionGroup, (dispatch_queue_t)self->_executionQueue, block);
    }
    else {
      dispatch_async((dispatch_queue_t)self->_executionQueue, block);
    }
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v16, 8);
  }
}

+ (void)_currentPipelineStage
{
  self;
  if (_getCurrentPipelineStageKey_onceToken != -1) {
    dispatch_once(&_getCurrentPipelineStageKey_onceToken, &__block_literal_global_28);
  }
  pthread_key_t v0 = _getCurrentPipelineStageKey_key;
  return pthread_getspecific(v0);
}

- (id)_serviceQueuedMessages
{
  if (result)
  {
    v1 = result;
    +[BWPipelineStage _setCurrentPipelineStage:]((uint64_t)BWPipelineStage, result);
    while ([v1[3] count])
    {
      id v2 = (id)[v1[3] objectAtIndexedSubscript:0];
      [v1[3] removeObjectAtIndex:0];
      id v3 = (id)[v1[4] objectAtIndexedSubscript:0];
      [v1[4] removeObjectAtIndex:0];
      [v3 handleMessage:v2];
    }
    return (id *)+[BWPipelineStage _setCurrentPipelineStage:]((uint64_t)BWPipelineStage, 0);
  }
  return result;
}

+ (uint64_t)_setCurrentPipelineStage:(uint64_t)a1
{
  self;
  if (_getCurrentPipelineStageKey_onceToken != -1) {
    dispatch_once(&_getCurrentPipelineStageKey_onceToken, &__block_literal_global_28);
  }
  pthread_key_t v3 = _getCurrentPipelineStageKey_key;
  return pthread_setspecific(v3, a2);
}

- (OS_dispatch_queue)queue
{
  return self->_executionQueue;
}

id *__55__BWPipelineStage_sendMessagesToInput_messageProvider___block_invoke(void *a1)
{
  id v2 = (void *)MEMORY[0x1A6272C70]();
  uint64_t v3 = (*(uint64_t (**)(void))(a1[5] + 16))();
  if (v3)
  {
    v4 = (void *)v3;
    [*(id *)(a1[4] + 24) addObjectsFromArray:v3];
    if ([v4 count])
    {
      unint64_t v5 = 0;
      do
      {
        [*(id *)(a1[4] + 32) addObject:*(void *)(*(void *)(a1[6] + 8) + 40)];
        ++v5;
      }
      while ([v4 count] > v5);
    }
  }

  v6 = (id *)a1[4];
  return -[BWPipelineStage _serviceQueuedMessages](v6);
}

+ (BWPipelineStage)pipelineStageWithName:(id)a3 priority:(unsigned int)a4 discardsLateSampleData:(BOOL)a5
{
  unint64_t v5 = -[BWPipelineStage _initWithName:priority:workgroup:discardsLateSampleData:]([BWPipelineStage alloc], a3, a4, 0, a5);
  return (BWPipelineStage *)v5;
}

+ (BWPipelineStage)pipelineStageWithName:(id)a3 priority:(unsigned int)a4 workgroup:(id)a5
{
  unint64_t v5 = -[BWPipelineStage _initWithName:priority:workgroup:discardsLateSampleData:]([BWPipelineStage alloc], a3, a4, (OS_os_workgroup *)a5, 0);
  return (BWPipelineStage *)v5;
}

+ (BWPipelineStage)pipelineStageWithName:(id)a3 priority:(unsigned int)a4
{
  v4 = -[BWPipelineStage _initWithName:priority:workgroup:discardsLateSampleData:]([BWPipelineStage alloc], a3, a4, 0, 0);
  return (BWPipelineStage *)v4;
}

- (void)_initWithName:(int)a3 priority:(OS_os_workgroup *)a4 workgroup:(int)a5 discardsLateSampleData:
{
  if (!a1) {
    return 0;
  }
  if (!a2)
  {

    return 0;
  }
  v14.receiver = a1;
  v14.super_class = (Class)BWPipelineStage;
  v9 = objc_msgSendSuper2(&v14, sel_init);
  if (v9)
  {
    v9[5] = [a2 copy];
    *((_DWORD *)v9 + 12) = a3;
    v10 = (const char *)[a2 cStringUsingEncoding:4];
    uint64_t v11 = v10;
    if (a4)
    {
      inactive = dispatch_workloop_create_inactive(v10);
      FigThreadGetMachThreadPriorityValue();
      dispatch_workloop_set_scheduler_priority();
      dispatch_workloop_set_os_workgroup(inactive, a4);
      dispatch_activate(inactive);
      v9[1] = dispatch_queue_create_with_target_V2(v11, 0, inactive);
      dispatch_release(inactive);
    }
    else
    {
      v9[1] = FigDispatchQueueCreateWithPriority();
    }
    v9[3] = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v9[4] = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (a5) {
      v9[2] = dispatch_group_create();
    }
  }
  return v9;
}

- (unsigned)priority
{
  return self->_priority;
}

- (void)sendMessagesToInput:(id)a3 messageProvider:(id)a4
{
  if (!a3)
  {
    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    v10 = @"input not provided";
    goto LABEL_12;
  }
  if (!a4)
  {
    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    v10 = @"messageProvider is nil";
    goto LABEL_12;
  }
  if (self && +[BWPipelineStage _currentPipelineStage]() == self)
  {
    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    v10 = @"Already executing on pipeline stage";
LABEL_12:
    objc_exception_throw((id)[v8 exceptionWithName:v9 reason:v10 userInfo:0]);
  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3052000000;
  v12[3] = __Block_byref_object_copy__9;
  v12[4] = __Block_byref_object_dispose__9;
  id v13 = 0;
  id v13 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__BWPipelineStage_sendMessagesToInput_messageProvider___block_invoke;
  block[3] = &unk_1E5C25690;
  block[4] = self;
  block[5] = a4;
  block[6] = v12;
  executionGroup = self->_executionGroup;
  if (executionGroup) {
    dispatch_group_async(executionGroup, (dispatch_queue_t)self->_executionQueue, block);
  }
  else {
    dispatch_async((dispatch_queue_t)self->_executionQueue, block);
  }
  _Block_object_dispose(v12, 8);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWPipelineStage;
  [(BWPipelineStage *)&v3 dealloc];
}

+ (void)initialize
{
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p> %@", NSStringFromClass(v4), self, self->_name];
}

- (NSString)name
{
  return self->_name;
}

@end