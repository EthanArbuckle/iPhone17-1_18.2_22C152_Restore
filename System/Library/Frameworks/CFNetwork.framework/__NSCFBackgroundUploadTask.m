@interface __NSCFBackgroundUploadTask
- (BOOL)isKindOfClass:(Class)a3;
- (void)_onqueue_didFinishWithError:(id)a3;
- (void)cancelByProducingResumeData:(id)a3;
- (void)dealloc;
@end

@implementation __NSCFBackgroundUploadTask

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)__NSCFBackgroundUploadTask;
  if (-[__NSCFBackgroundDataTask isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isEqual:objc_opt_class()];
  }
}

- (void)_onqueue_didFinishWithError:(id)a3
{
  id v3 = a3;
  objc_super v5 = (void *)[a3 userInfo];
  v6 = (void *)[v5 objectForKeyedSubscript:@"NSURLSessionUploadTaskResumeData"];
  if (v6)
  {
    v7 = +[__NSCFResumableUploadState rusWithResumeData:]((uint64_t)__NSCFResumableUploadState, v6);
    if (v7)
    {
      [(NSURLSessionTask *)self setResumableUploadState:v7];
      if (self) {
        id Property = objc_getProperty(self, v8, 848, 1);
      }
      else {
        id Property = 0;
      }
      [(__NSCFResumableUploadState *)[(NSURLSessionTask *)self resumableUploadState] setUploadFile:Property];
      id v10 = (id)[v5 mutableCopy];
      objc_msgSend(v10, "setObject:forKeyedSubscript:", -[__NSCFResumableUploadState createResumeData:](-[NSURLSessionTask resumableUploadState](self, "resumableUploadState"), 0), @"NSURLSessionUploadTaskResumeData");
      id v3 = (id)objc_msgSend(MEMORY[0x1E4F290A8], "errorWithDomain:code:userInfo:", objc_msgSend(v3, "domain"), objc_msgSend(v3, "code"), v10);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)__NSCFBackgroundUploadTask;
  [(__NSCFBackgroundDataTask *)&v11 _onqueue_didFinishWithError:v3];
}

- (void)cancelByProducingResumeData:(id)a3
{
  objc_super v5 = [(NSURLSessionTask *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58____NSCFBackgroundUploadTask_cancelByProducingResumeData___block_invoke;
  v6[3] = &unk_1E5258028;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)v5, v6);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)__NSCFBackgroundUploadTask;
  [(__NSCFBackgroundDataTask *)&v3 dealloc];
}

@end