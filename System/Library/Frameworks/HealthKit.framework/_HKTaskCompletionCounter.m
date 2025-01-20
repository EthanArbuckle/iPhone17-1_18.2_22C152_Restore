@interface _HKTaskCompletionCounter
+ (id)counterWithTargetCount:(int64_t)a3 queue:(id)a4 completion:(id)a5;
- (void)_invalidate;
- (void)allTasksEnqueued;
- (void)decrementCounter;
- (void)incrementCounter;
@end

@implementation _HKTaskCompletionCounter

+ (id)counterWithTargetCount:(int64_t)a3 queue:(id)a4 completion:(id)a5
{
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"HKUtilities.m", 205, @"Invalid parameter not satisfying: %@", @"queue != NULL" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, a1, @"HKUtilities.m", 206, @"Invalid parameter not satisfying: %@", @"completion != NULL" object file lineNumber description];

LABEL_3:
  v13 = objc_alloc_init(_HKTaskCompletionCounter);
  if (v13)
  {
    v14 = _Block_copy(v12);
    id completion = v13->_completion;
    v13->_id completion = v14;

    objc_storeStrong((id *)&v13->_queue, a4);
    v13->_target = a3;
  }

  return v13;
}

- (void)decrementCounter
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44___HKTaskCompletionCounter_decrementCounter__block_invoke;
  block[3] = &unk_1E58BBA00;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)incrementCounter
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44___HKTaskCompletionCounter_incrementCounter__block_invoke;
  block[3] = &unk_1E58BBA00;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)allTasksEnqueued
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44___HKTaskCompletionCounter_allTasksEnqueued__block_invoke;
  block[3] = &unk_1E58BBA00;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_invalidate
{
  self->_id completion = 0;
  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end