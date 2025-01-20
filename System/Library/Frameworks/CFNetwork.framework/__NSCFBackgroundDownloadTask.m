@interface __NSCFBackgroundDownloadTask
- (BOOL)isKindOfClass:(Class)a3;
- (void)_onqueue_didFinishWithError:(id)a3;
- (void)_onqueue_didReceiveResponse:(id)a3;
- (void)cancelByProducingResumeData:(id)a3;
@end

@implementation __NSCFBackgroundDownloadTask

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)__NSCFBackgroundDownloadTask;
  if (-[__NSCFBackgroundDownloadTask isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isEqual:objc_opt_class()];
  }
}

- (void)_onqueue_didFinishWithError:(id)a3
{
  objc_super v5 = (NSData *)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"NSURLSessionDownloadTaskResumeData");
  if (v5) {
    -[__NSURLBackgroundSession moveFileToTempForBackgroundResumeData:]((uint64_t)[(NSURLSessionTask *)self session], v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)__NSCFBackgroundDownloadTask;
  [(__NSCFBackgroundSessionTask *)&v6 _onqueue_didFinishWithError:a3];
}

- (void)cancelByProducingResumeData:(id)a3
{
  objc_super v5 = [(NSURLSessionTask *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60____NSCFBackgroundDownloadTask_cancelByProducingResumeData___block_invoke;
  v6[3] = &unk_1E5258028;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)v5, v6);
}

- (void)_onqueue_didReceiveResponse:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)__NSCFBackgroundDownloadTask;
  -[__NSCFBackgroundSessionTask _onqueue_didReceiveResponse:](&v6, sel__onqueue_didReceiveResponse_);
  if (self)
  {
    internalDelegateWrapper = self->super.super._internalDelegateWrapper;
    if (!internalDelegateWrapper) {
      internalDelegateWrapper = self->super.super._publicDelegateWrapper;
    }
  }
  else
  {
    internalDelegateWrapper = 0;
  }
  -[__NSCFURLSessionDelegateWrapper downloadTask:_didReceiveResponse:]((uint64_t)internalDelegateWrapper, self, a3);
}

@end