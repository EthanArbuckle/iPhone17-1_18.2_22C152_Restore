@interface _LABKOperation
+ (id)_wrapperForBKOperation:(id)a3 device:(id)a4;
- (BKOperation)_BKOperation;
- (BKOperationDelegate)delegate;
- (BOOL)isUserPresent;
- (BOOL)startWithError:(id *)a3;
- (OS_dispatch_queue)queue;
- (_LABKDevice)device;
- (id)_initWithBKOperation:(id)a3 device:(id)a4;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)shim;
- (int64_t)state;
- (void)dealloc;
- (void)dispatchDelegateSelector:(SEL)a3 block:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)operation:(id)a3 finishedWithReason:(int64_t)a4;
- (void)operation:(id)a3 presenceStateChanged:(BOOL)a4;
- (void)operation:(id)a3 stateChanged:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setIsUserPresent:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setState:(int64_t)a3;
- (void)startWithReply:(id)a3;
@end

@implementation _LABKOperation

+ (id)_wrapperForBKOperation:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2050000000;
  v8 = (void *)getBKMatchPearlOperationClass_softClass;
  uint64_t v30 = getBKMatchPearlOperationClass_softClass;
  if (!getBKMatchPearlOperationClass_softClass)
  {
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __getBKMatchPearlOperationClass_block_invoke;
    v25 = &unk_1E63C3EB0;
    v26 = &v27;
    __getBKMatchPearlOperationClass_block_invoke((uint64_t)&v22);
    v8 = (void *)v28[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v27, 8);
  if (objc_opt_isKindOfClass())
  {
    v10 = off_1E63C3C40;
  }
  else
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2050000000;
    v11 = (void *)getBKMatchOperationClass_softClass;
    uint64_t v30 = getBKMatchOperationClass_softClass;
    if (!getBKMatchOperationClass_softClass)
    {
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      v24 = __getBKMatchOperationClass_block_invoke;
      v25 = &unk_1E63C3EB0;
      v26 = &v27;
      __getBKMatchOperationClass_block_invoke((uint64_t)&v22);
      v11 = (void *)v28[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v27, 8);
    if (objc_opt_isKindOfClass())
    {
      v10 = off_1E63C3C38;
    }
    else
    {
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x2050000000;
      v13 = (void *)getBKFaceDetectOperationClass_softClass;
      uint64_t v30 = getBKFaceDetectOperationClass_softClass;
      if (!getBKFaceDetectOperationClass_softClass)
      {
        uint64_t v22 = MEMORY[0x1E4F143A8];
        uint64_t v23 = 3221225472;
        v24 = __getBKFaceDetectOperationClass_block_invoke;
        v25 = &unk_1E63C3EB0;
        v26 = &v27;
        __getBKFaceDetectOperationClass_block_invoke((uint64_t)&v22);
        v13 = (void *)v28[3];
      }
      id v14 = v13;
      _Block_object_dispose(&v27, 8);
      if (objc_opt_isKindOfClass())
      {
        v10 = off_1E63C3C28;
      }
      else
      {
        uint64_t v27 = 0;
        v28 = &v27;
        uint64_t v29 = 0x2050000000;
        v15 = (void *)getBKFingerDetectOperationClass_softClass;
        uint64_t v30 = getBKFingerDetectOperationClass_softClass;
        if (!getBKFingerDetectOperationClass_softClass)
        {
          uint64_t v22 = MEMORY[0x1E4F143A8];
          uint64_t v23 = 3221225472;
          v24 = __getBKFingerDetectOperationClass_block_invoke;
          v25 = &unk_1E63C3EB0;
          v26 = &v27;
          __getBKFingerDetectOperationClass_block_invoke((uint64_t)&v22);
          v15 = (void *)v28[3];
        }
        id v16 = v15;
        _Block_object_dispose(&v27, 8);
        if (objc_opt_isKindOfClass())
        {
          v10 = off_1E63C3C30;
        }
        else
        {
          uint64_t v27 = 0;
          v28 = &v27;
          uint64_t v29 = 0x2050000000;
          v17 = (void *)getBKPresenceDetectOperationClass_softClass;
          uint64_t v30 = getBKPresenceDetectOperationClass_softClass;
          if (!getBKPresenceDetectOperationClass_softClass)
          {
            uint64_t v22 = MEMORY[0x1E4F143A8];
            uint64_t v23 = 3221225472;
            v24 = __getBKPresenceDetectOperationClass_block_invoke;
            v25 = &unk_1E63C3EB0;
            v26 = &v27;
            __getBKPresenceDetectOperationClass_block_invoke((uint64_t)&v22);
            v17 = (void *)v28[3];
          }
          id v18 = v17;
          _Block_object_dispose(&v27, 8);
          char isKindOfClass = objc_opt_isKindOfClass();
          v10 = off_1E63C3C48;
          if (isKindOfClass) {
            v10 = &off_1E63C3C50;
          }
        }
      }
    }
  }
  v20 = (void *)[objc_alloc(*v10) _initWithBKOperation:v6 device:v7];
  +[_LABKLog logClass:objc_opt_class(), a2, @"wrapping %@ with %@", v6, v20 selector message];

  return v20;
}

- (id)_initWithBKOperation:(id)a3 device:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_LABKOperation;
  id v9 = [(_LABKOperation *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->__BKOperation, a3);
    [v10->__BKOperation setDelegate:v10];
    objc_storeStrong((id *)&v10->_device, a4);
    v10->_state = 1;
    v11 = [(_LABKOperation *)v10 shim];
    id v12 = [v11 biometricMethodState];
    -[_LABKOperation setIsUserPresent:](v10, "setIsUserPresent:", [v12 isUserPresent]);

    v13 = [(_LABKOperation *)v10 shim];
    id v14 = NSStringFromSelector(sel_biometricMethodState);
    [v13 addObserver:v10 forKeyPath:v14 options:1 context:0];

    v15 = [(_LABKOperation *)v10 shim];
    id v16 = NSStringFromSelector(sel_biometricMethodResult);
    [v15 addObserver:v10 forKeyPath:v16 options:1 context:0];
  }
  return v10;
}

- (id)shim
{
  v2 = [(_LABKOperation *)self device];
  v3 = [v2 shim];

  return v3;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
  id v5 = a3;
  id v6 = [(_LABKOperation *)self _BKOperation];
  [v6 setQueue:v5];
}

- (void)dispatchDelegateSelector:(SEL)a3 block:(id)a4
{
  id v5 = (void (**)(void))a4;
  id v6 = [(_LABKOperation *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(_LABKOperation *)self queue];

    if (v8)
    {
      id v9 = [(_LABKOperation *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49___LABKOperation_dispatchDelegateSelector_block___block_invoke;
      block[3] = &unk_1E63C55F0;
      v11 = v5;
      dispatch_async(v9, block);
    }
    else
    {
      v5[2](v5);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  id v8 = NSStringFromSelector(sel_biometricMethodState);
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    v10 = [(_LABKOperation *)self shim];
    v11 = [v10 biometricMethodState];
    int v12 = [v11 isUserPresent];
    int v13 = [(_LABKOperation *)self isUserPresent];

    if (v12 != v13)
    {
      id v14 = [(_LABKOperation *)self shim];
      v15 = [v14 biometricMethodState];
      -[_LABKOperation setIsUserPresent:](self, "setIsUserPresent:", [v15 isUserPresent]);

      id v16 = sel_operation_presenceStateChanged_;
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      uint64_t v27 = __65___LABKOperation_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v28 = &unk_1E63C5618;
      uint64_t v29 = self;
      v17 = &v25;
LABEL_6:
      -[_LABKOperation dispatchDelegateSelector:block:](self, "dispatchDelegateSelector:block:", v16, v17, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }
  else
  {
    objc_super v18 = NSStringFromSelector(sel_biometricMethodResult);
    int v19 = [v7 isEqualToString:v18];

    if (v19)
    {
      [(_LABKOperation *)self setState:4];
      id v16 = sel_operation_stateChanged_;
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      uint64_t v22 = __65___LABKOperation_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
      uint64_t v23 = &unk_1E63C5618;
      v24 = self;
      v17 = &v20;
      goto LABEL_6;
    }
  }
}

- (BOOL)startWithError:(id *)a3
{
  uint64_t v6 = objc_opt_class();
  id v7 = [(_LABKOperation *)self _BKOperation];
  +[_LABKLog logClass:v6, a2, @"sync-starting operation %@", v7 selector message];

  id v8 = [(_LABKOperation *)self _BKOperation];
  char v9 = [v8 startWithError:a3];

  uint64_t v10 = objc_opt_class();
  if (v9)
  {
    v11 = @"YES";
  }
  else if (a3)
  {
    v11 = (__CFString *)*a3;
  }
  else
  {
    v11 = @"error";
  }
  +[_LABKLog logClass:v10, a2, @"started: %@", v11 selector message];
  return v9;
}

- (void)startWithReply:(id)a3
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = [(_LABKOperation *)self _BKOperation];
  +[_LABKLog logClass:v6, a2, @"async-starting operation %@", v7 selector message];

  id v8 = [(_LABKOperation *)self _BKOperation];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __33___LABKOperation_startWithReply___block_invoke;
  v10[3] = &unk_1E63C5640;
  id v11 = v5;
  SEL v12 = a2;
  v10[4] = self;
  id v9 = v5;
  [v8 startWithReply:v10];
}

- (void)operation:(id)a3 finishedWithReason:(int64_t)a4
{
  id v7 = a3;
  +[_LABKLog logClass:objc_opt_class(), a2, @"%@,%d", v7, a4 selector message];

  id v8 = [(_LABKOperation *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(_LABKOperation *)self delegate];
    [v10 operation:self finishedWithReason:a4];
  }
}

- (void)operation:(id)a3 stateChanged:(int64_t)a4
{
  id v7 = a3;
  +[_LABKLog logClass:objc_opt_class(), a2, @"%@,%d", v7, a4 selector message];

  id v8 = [(_LABKOperation *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(_LABKOperation *)self delegate];
    [v10 operation:self stateChanged:a4];
  }
}

- (void)operation:(id)a3 presenceStateChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  char v9 = "NO";
  if (v4) {
    char v9 = "YES";
  }
  +[_LABKLog logClass:v8, a2, @"%@,%s", v7, v9 selector message];

  id v10 = [(_LABKOperation *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(_LABKOperation *)self delegate];
    [v12 operation:self presenceStateChanged:v4];
  }
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  +[_LABKLog logClass:objc_opt_class() selector:a3 message:@"forwarding to BK"];

  return [(_LABKOperation *)self _BKOperation];
}

- (void)dealloc
{
  v3 = [(_LABKOperation *)self shim];
  BOOL v4 = NSStringFromSelector(sel_biometricMethodState);
  [v3 removeObserver:self forKeyPath:v4];

  id v5 = [(_LABKOperation *)self shim];
  uint64_t v6 = NSStringFromSelector(sel_biometricMethodResult);
  [v5 removeObserver:self forKeyPath:v6];

  v7.receiver = self;
  v7.super_class = (Class)_LABKOperation;
  [(_LABKOperation *)&v7 dealloc];
}

- (BKOperation)_BKOperation
{
  return self->__BKOperation;
}

- (_LABKDevice)device
{
  return self->_device;
}

- (BKOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)isUserPresent
{
  return self->_isUserPresent;
}

- (void)setIsUserPresent:(BOOL)a3
{
  self->_isUserPresent = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->__BKOperation, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end