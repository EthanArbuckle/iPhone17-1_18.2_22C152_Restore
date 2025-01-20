@interface __NSCFLocalDataTask
- (BOOL)isKindOfClass:(Class)a3;
- (void)_onqueue_didReceiveResponse:(id)a3 completion:(id)a4;
@end

@implementation __NSCFLocalDataTask

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)__NSCFLocalDataTask;
  if (-[__NSCFLocalDataTask isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isEqual:objc_opt_class()];
  }
}

- (void)_onqueue_didReceiveResponse:(id)a3 completion:(id)a4
{
  if (self)
  {
    [(NSURLSessionTask *)self setResponse:a3];
    -[NSURLSessionTask setCountOfBytesExpectedToReceive:](self, "setCountOfBytesExpectedToReceive:", [a3 expectedContentLength]);
    if ([(NSURLSessionTask *)self state] >= NSURLSessionTaskStateCanceling)
    {
LABEL_3:
      memset(v15, 0, sizeof(v15));
      (*((void (**)(id, void *))a4 + 2))(a4, v15);
      return;
    }
    if (objc_getProperty(self, v7, 784, 1)) {
      goto LABEL_10;
    }
    internalDelegateWrapper = self->super.super._internalDelegateWrapper;
    if (!internalDelegateWrapper) {
      internalDelegateWrapper = self->super.super._publicDelegateWrapper;
    }
  }
  else
  {
    uint64_t v11 = [0 state];
    internalDelegateWrapper = 0;
    if (v11 > 1) {
      goto LABEL_3;
    }
  }
  if ([(__NSCFURLSessionDelegateWrapper *)(uint64_t)internalDelegateWrapper didReceiveResponse])
  {
    [(__NSCFLocalSessionTask *)self cfConn];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(__NSCFLocalSessionTask *)self _onqueue_suspend];
      self->super._suspendedForDisposition = 1;
    }
    else if (!self)
    {
      publicDelegateWrapper = 0;
LABEL_15:
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __62____NSCFLocalDataTask__onqueue_didReceiveResponse_completion___block_invoke;
      v14[3] = &unk_1E5252B60;
      v14[4] = self;
      v14[5] = a4;
      -[__NSCFURLSessionDelegateWrapper dataTask:didReceiveResponse:completionHandler:]((uint64_t)publicDelegateWrapper, self, a3, v14);
      return;
    }
    self->super._pendingResponseDisposition = 1;
    publicDelegateWrapper = self->super.super._internalDelegateWrapper;
    if (!publicDelegateWrapper) {
      publicDelegateWrapper = self->super.super._publicDelegateWrapper;
    }
    goto LABEL_15;
  }
LABEL_10:
  uint64_t v13 = 0;
  long long v12 = xmmword_18430B9E0;
  (*((void (**)(id, long long *))a4 + 2))(a4, &v12);
}

@end