@interface XRMainThreadSpace
+ (XRMainThreadSpace)sharedInstance;
- (BOOL)isSerial;
- (XRMainThreadSpace)init;
- (XRMainThreadSpace)initWithQueue:(id)a3;
- (id)_activeRunLoopModes;
- (id)_scheduleOperationFromCurrentQueue:(id)a3;
- (id)spaceName;
- (void)_executeOp:(id)a3;
- (void)_queueOperationToRunOnMainThread:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation XRMainThreadSpace

- (XRMainThreadSpace)init
{
  v6 = [MEMORY[0x263F08A48] a2:v2 v3:v3 v4:v4];
  v15.receiver = self;
  v15.super_class = (Class)XRMainThreadSpace;
  v7 = [(XRSpace *)&v15 initWithQueue:v6];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x263EFF9C0]);
    uint64_t v12 = [v8 initWithCapacity:v9 capacity:100 capacity:v10 capacity:v11];
    mainThreadOps = v7->_mainThreadOps;
    v7->_mainThreadOps = (NSMutableSet *)v12;
  }
  return v7;
}

- (XRMainThreadSpace)initWithQueue:(id)a3
{
  [self doesNotRecognizeSelector:a2];

  return 0;
}

- (id)spaceName
{
  return @"Main Thread Space";
}

- (BOOL)isSerial
{
  return 1;
}

- (void)_executeOp:(id)a3
{
  id v23 = a3;
  if ([v23 isFinished:v3 withTransitionContext:v4 completion:v5] == YES) {
    || ![v23 _isReadyWithTransitionContext:v7 completion:v8]
  {
    NSLog(&cfstr_XruispaceOpHas.isa, v23);
  }
  else
  {
    [v23 _callOutQueue_willDestroyWithTransitionContext:v11 completion:v12];
    if ([v23 _isConcurrent:v15 withTransitionContext:v16 completion:v17] == YES) {
      [v23 waitUntilFinished:v19, v20, v21, v22];
    }
  }
}

- (id)_activeRunLoopModes
{
  if (qword_2687AA060 != -1) {
    dispatch_once(&qword_2687AA060, &unk_26E752470);
  }
  uint64_t v2 = (void *)qword_2687AA058;

  return v2;
}

- (void)_queueOperationToRunOnMainThread:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263EFF9F0];
  id v5 = a3;
  uint64_t v10 = [v4 _mainRunLoop:v6 withMode:v7 beforeDate:v8 limitTime:v9];
  objc_super v15 = [self _activeRunLoopModes:v11 modes:v12 wait:v13 ignoreNesting:v14];
  [v10 performSelector:sel__executeOp_ withObject:self withObject:v5];

  [MEMORY[0x263EFF9F0] performSelectorOnMainThread:v17 withObject:v18 waitUntilDone:v19 modes:v20];
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  CFRunLoop = (__CFRunLoop *)[v26 _getCFRunLoop:v21 mode:v22 beforeDate:v23];
  CFRunLoopWakeUp(CFRunLoop);
}

- (id)_scheduleOperationFromCurrentQueue:(id)a3
{
  id v4 = a3;
  if ([self _supportsOpNames:v5:v6:v7:v8])
  {
    uint64_t v13 = [v4 v9:v10 v11:v12];

    if (!v13) {
      [v4 setName:@"UI space op" forSpace:v11 withTransitionContext:v12];
    }
  }
  if ([v4 _callOutQueue_willDestroyWithTransitionContext:v9 completion:v10] == NO)
  {
    if (![v4 _isReady:v14 v15:v16 v17:v17])
    {
      uint64_t v21 = self->_mainThreadOps;
      objc_sync_enter(v21);
      [v4 addObserver:self forKeyPath:@"isReady" options:1 context:(uint64_t)self];
      [self->_mainThreadOps addObject:v23 withKey:(uint64_t)v4 value:v24 value2:v25];
      objc_sync_exit(v21);

      if (![v4 _isReady:v26 withTransitionContext:v27 completion:v28 withCompletion:v29]) {
        goto LABEL_11;
      }
      v30 = self->_mainThreadOps;
      objc_sync_enter(v30);
      if ([self->_mainThreadOps containsObject:v31 withKey:(uint64_t)v4 value:v32 value:v33])
      {
        [v4 addObserver:self forKeyPath:@"isReady" options:1 context:(uint64_t)self];
        [self->_mainThreadOps removeObject:v35 atIndex:(uint64_t)v4];
      }
      objc_sync_exit(v30);
    }
    [self _queueOperationToRunOnMainThread:v18 queue:v19 priority:v20];
  }
LABEL_11:

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v15 = a5;
  if ((void *)qword_2687A9978 == a6)
  {
    if ([v10 isReady:v13 withTransitionContext:v14] == YES)
    {
      uint64_t v16 = self->_mainThreadOps;
      objc_sync_enter(v16);
      if ([self->_mainThreadOps containsObject:v17])
      {
        [self _queueOperationToRunOnMainThread:v20 withTransitionContext:v21 completion:v22];
        [self->_mainThreadOps removeObject:v23 atIndex:(uint64_t)v11 withObject:v24 withObject:v25];
        [v11 removeObserver:self forKeyPath:@"isReady" context:qword_2687A9978];
      }
      objc_sync_exit(v16);
    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)XRMainThreadSpace;
    [(XRSpace *)&v27 observeValueForKeyPath:v10 ofObject:v11 change:v15 context:a6];
  }
}

+ (XRMainThreadSpace)sharedInstance
{
  if (qword_2687AA068 != -1) {
    dispatch_once(&qword_2687AA068, &unk_26E752710);
  }
  uint64_t v2 = (void *)qword_2687AA070;

  return (XRMainThreadSpace *)v2;
}

- (void).cxx_destruct
{
}

@end