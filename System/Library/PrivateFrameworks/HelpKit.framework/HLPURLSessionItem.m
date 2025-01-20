@interface HLPURLSessionItem
- (BOOL)isCancelled;
- (HLPURLSessionItem)initWithSessionTask:(id)a3 completionHandler:(id)a4;
- (HLPURLSessionTask)sessionTask;
- (id)completionHanlder;
- (int64_t)state;
- (void)cancel;
- (void)dealloc;
- (void)notifyWithSessionTask:(id)a3 error:(id)a4;
- (void)resume;
- (void)setCancelled:(BOOL)a3;
- (void)setSessionTask:(id)a3;
@end

@implementation HLPURLSessionItem

- (void)dealloc
{
  [(HLPURLSessionItem *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)HLPURLSessionItem;
  [(HLPURLSessionItem *)&v3 dealloc];
}

- (HLPURLSessionItem)initWithSessionTask:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HLPURLSessionItem;
  v9 = [(HLPURLSessionItem *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sessionTask, a3);
    uint64_t v11 = [v8 copy];
    id completionHanlder = v10->_completionHanlder;
    v10->_id completionHanlder = (id)v11;

    [(HLPURLSessionTask *)v10->_sessionTask registerDelegate:v10];
  }

  return v10;
}

- (int64_t)state
{
  v2 = [(HLPURLSessionTask *)self->_sessionTask task];
  int64_t v3 = [v2 state];

  return v3;
}

- (void)resume
{
}

- (void)cancel
{
  v6[1] = *MEMORY[0x263EF8340];
  self->_cancelled = 1;
  [(HLPURLSessionTask *)self->_sessionTask unregisterDelegate:self];
  uint64_t v5 = *MEMORY[0x263F08320];
  v6[0] = @"Cancelled";
  int64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  v4 = [MEMORY[0x263F087E8] errorWithDomain:@"Request" code:-1 userInfo:v3];
  [(HLPURLSessionItem *)self notifyWithSessionTask:0 error:v4];
}

- (void)notifyWithSessionTask:(id)a3 error:(id)a4
{
  if (self->_completionHanlder)
  {
    id v6 = a4;
    id v7 = a3;
    id v13 = [v7 formattedData];
    id v8 = [v7 dataTaskData];
    v9 = [v7 lastModified];
    id completionHanlder = (void (**)(id, id, void *, uint64_t, void *, id))self->_completionHanlder;
    uint64_t v11 = [v7 isCacheData];

    completionHanlder[2](completionHanlder, v13, v8, v11, v9, v6);
    id v12 = self->_completionHanlder;
    self->_id completionHanlder = 0;
  }
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (HLPURLSessionTask)sessionTask
{
  return self->_sessionTask;
}

- (void)setSessionTask:(id)a3
{
}

- (id)completionHanlder
{
  return self->_completionHanlder;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHanlder, 0);
  objc_storeStrong((id *)&self->_sessionTask, 0);
}

@end