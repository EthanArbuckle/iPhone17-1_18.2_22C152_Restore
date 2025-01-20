@interface MLUpdateTask
+ (BOOL)updateModelAtURL:(id)a3 trainingData:(id)a4 configuration:(id)a5 writeToURL:(id)a6 error:(id *)a7;
+ (MLUpdateTask)updateTaskForModelAtURL:(NSURL *)modelURL trainingData:(id)trainingData completionHandler:(void *)completionHandler error:(NSError *)error;
+ (MLUpdateTask)updateTaskForModelAtURL:(NSURL *)modelURL trainingData:(id)trainingData configuration:(MLModelConfiguration *)configuration completionHandler:(void *)completionHandler error:(NSError *)error;
+ (MLUpdateTask)updateTaskForModelAtURL:(NSURL *)modelURL trainingData:(id)trainingData configuration:(MLModelConfiguration *)configuration progressHandlers:(MLUpdateProgressHandlers *)progressHandlers error:(NSError *)error;
+ (MLUpdateTask)updateTaskForModelAtURL:(NSURL *)modelURL trainingData:(id)trainingData progressHandlers:(MLUpdateProgressHandlers *)progressHandlers error:(NSError *)error;
- (BOOL)updateHasStarted;
- (MLBatchProvider)trainingData;
- (MLUpdatable)updatableModel;
- (MLUpdateProgressHandlers)progressHandlers;
- (MLUpdateTask)initWithModelAtURL:(id)a3 trainingData:(id)a4 configuration:(id)a5 progressHandlers:(id)a6 error:(id *)a7;
- (NSString)description;
- (NSURL)updatableModelURL;
- (OS_dispatch_queue)updateQueue;
- (id)_completionHandlerBlock;
- (id)_progressHandlerBlock;
- (void)_invokeProgressHandlerForContext:(id)a3;
- (void)onCancellation;
- (void)onResumptionWithTaskContext:(id)a3;
- (void)resumeWithParameters:(NSDictionary *)updateParameters;
- (void)setUpdateHasStarted:(BOOL)a3;
@end

@implementation MLUpdateTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatableModelURL, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_progressHandlers, 0);
  objc_storeStrong((id *)&self->_trainingData, 0);

  objc_storeStrong((id *)&self->_updatableModel, 0);
}

- (NSURL)updatableModelURL
{
  return self->_updatableModelURL;
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateHasStarted:(BOOL)a3
{
  self->_updateHasStarted = a3;
}

- (BOOL)updateHasStarted
{
  return self->_updateHasStarted;
}

- (MLUpdateProgressHandlers)progressHandlers
{
  return self->_progressHandlers;
}

- (MLBatchProvider)trainingData
{
  return self->_trainingData;
}

- (MLUpdatable)updatableModel
{
  return self->_updatableModel;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = NSString;
  v5 = [(MLUpdateTask *)self updatableModelURL];
  v6 = [v4 stringWithFormat:@"updatableModelURL: %@", v5];
  [v3 appendString:v6];

  v7 = NSString;
  v8 = [(MLUpdateTask *)self trainingData];
  v9 = [(MLUpdateTask *)self trainingData];
  v10 = [v7 stringWithFormat:@"\ntrainingData: %@  count: %zd", v8, objc_msgSend(v9, "count")];
  [v3 appendString:v10];

  v11 = NSString;
  v12 = [(MLUpdateTask *)self progressHandlers];
  v13 = [v11 stringWithFormat:@"\nprogressHandlers: %@", v12];
  [v3 appendString:v13];

  v14 = NSString;
  v15 = [(MLTask *)self taskStatesToString:[(MLTask *)self state]];
  v16 = [v14 stringWithFormat:@"\nstate: %@", v15];
  [v3 appendString:v16];

  return (NSString *)v3;
}

- (id)_completionHandlerBlock
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__MLUpdateTask__completionHandlerBlock__block_invoke;
  v4[3] = &unk_1E59A4F90;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

void __39__MLUpdateTask__completionHandlerBlock__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [v6 error];

  if (v4)
  {
    id v5 = [v6 error];
    [WeakRetained failWithError:v5 taskContext:v6];
  }
  else
  {
    [WeakRetained completeWithTaskContext:v6];
  }
}

- (id)_progressHandlerBlock
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__MLUpdateTask__progressHandlerBlock__block_invoke;
  v4[3] = &unk_1E59A4F90;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

void __37__MLUpdateTask__progressHandlerBlock__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained suspendWithTaskContext:v3];
}

- (void)onResumptionWithTaskContext:(id)a3
{
  id v4 = a3;
  if ([(MLUpdateTask *)self updateHasStarted])
  {
    if (v4
      && ([v4 objectForKeyedSubscript:@"kUpdateParametersKey"],
          id v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      id v6 = [(MLUpdateTask *)self updatableModel];
      v7 = [v4 objectForKeyedSubscript:@"kUpdateParametersKey"];
      [v6 resumeUpdateWithParameters:v7];
    }
    else
    {
      id v6 = [(MLUpdateTask *)self updatableModel];
      [v6 resumeUpdate];
    }
  }
  else
  {
    [(MLUpdateTask *)self setUpdateHasStarted:1];
    v8 = [(MLUpdateTask *)self updateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__MLUpdateTask_onResumptionWithTaskContext___block_invoke;
    block[3] = &unk_1E59A5328;
    block[4] = self;
    dispatch_async(v8, block);
  }
}

void __44__MLUpdateTask_onResumptionWithTaskContext___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) updatableModel];
  v2 = [*(id *)(a1 + 32) trainingData];
  [v3 updateModelWithData:v2];
}

- (void)onCancellation
{
  id v2 = [(MLUpdateTask *)self updatableModel];
  [v2 cancelUpdate];
}

- (void)_invokeProgressHandlerForContext:(id)a3
{
  id v22 = a3;
  id v4 = [v22 error];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [(MLUpdateTask *)self updatableModel];
    id v5 = +[MLWritableWrappedModel wrapperAroundWritableModel:v6];
  }
  uint64_t v7 = [v22 event];
  v8 = [v22 metrics];
  v9 = [v22 parameters];
  v10 = +[MLUpdateContext updateContextWithTask:self model:v5 event:v7 metrics:v8 parameters:v9];

  uint64_t v11 = [v22 event];
  v12 = [(MLUpdateTask *)self progressHandlers];
  v13 = v12;
  if (!v11)
  {
    v21 = [v12 completionHandler];
    ((void (**)(void, void *))v21)[2](v21, v10);

    goto LABEL_9;
  }
  uint64_t v14 = [v12 progressHandler];
  if (!v14)
  {
LABEL_9:

    goto LABEL_10;
  }
  v15 = (void *)v14;
  v16 = [(MLUpdateTask *)self progressHandlers];
  uint64_t v17 = [v16 interestedEvents];
  uint64_t v18 = [v22 event] & v17;

  if (v18)
  {
    v19 = [(MLUpdateTask *)self progressHandlers];
    v20 = [v19 progressHandler];
    ((void (**)(void, void *))v20)[2](v20, v10);

    [v5 clearInnerModelWithReason:@"Model is no longer valid outside update callback"];
    [(MLTask *)self resume];
  }
LABEL_10:
}

- (void)resumeWithParameters:(NSDictionary *)updateParameters
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = @"kUpdateParametersKey";
  id v4 = (void *)[(NSDictionary *)updateParameters copy];
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v6.receiver = self;
  v6.super_class = (Class)MLUpdateTask;
  [(MLTask *)&v6 resumeWithTaskContext:v5];
}

- (MLUpdateTask)initWithModelAtURL:(id)a3 trainingData:(id)a4 configuration:(id)a5 progressHandlers:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  v15 = (MLModelConfiguration *)a5;
  id v16 = a6;
  v36.receiver = self;
  v36.super_class = (Class)MLUpdateTask;
  uint64_t v17 = [(MLTask *)&v36 initWithState:1];
  if (!v17) {
    goto LABEL_10;
  }
  id v34 = v14;
  if (v15)
  {
    id v18 = v13;
    uint64_t v19 = [(MLModelConfiguration *)v15 copy];

    v15 = (MLModelConfiguration *)v19;
    id v13 = v18;
  }
  else
  {
    v15 = objc_alloc_init(MLModelConfiguration);
  }
  id v35 = 0;
  id v33 = v13;
  uint64_t v20 = +[MLLoader loadUpdatableModelFromAssetAtURL:v13 configuration:v15 error:&v35];
  id v21 = v35;
  updatableModel = v17->_updatableModel;
  v17->_updatableModel = (MLUpdatable *)v20;

  objc_storeStrong((id *)&v17->_updatableModelURL, a3);
  if (!v21)
  {
    v24 = [MLUpdateProgressHandlers alloc];
    uint64_t v25 = [v16 interestedEvents];
    v26 = [(MLUpdateTask *)v17 _progressHandlerBlock];
    v27 = [(MLUpdateTask *)v17 _completionHandlerBlock];
    v28 = [(MLUpdateProgressHandlers *)v24 initForEvents:v25 progressHandler:v26 completionHandler:v27];

    [(MLUpdatable *)v17->_updatableModel setUpdateProgressHandlers:v28 dispatchQueue:0];
    v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v30 = dispatch_queue_create("com.apple.coreml.mlupdatetask_update_queue", v29);
    updateQueue = v17->_updateQueue;
    v17->_updateQueue = (OS_dispatch_queue *)v30;

    objc_storeStrong((id *)&v17->_trainingData, a4);
    objc_storeStrong((id *)&v17->_progressHandlers, a6);
    v17->_updateHasStarted = 0;

    id v13 = v33;
    id v14 = v34;
LABEL_10:
    v23 = v17;
    goto LABEL_11;
  }
  if (a7) {
    *a7 = v21;
  }

  v23 = 0;
  id v13 = v33;
  id v14 = v34;
LABEL_11:

  return v23;
}

+ (MLUpdateTask)updateTaskForModelAtURL:(NSURL *)modelURL trainingData:(id)trainingData progressHandlers:(MLUpdateProgressHandlers *)progressHandlers error:(NSError *)error
{
  v9 = progressHandlers;
  id v10 = trainingData;
  uint64_t v11 = modelURL;
  v12 = objc_alloc_init(MLModelConfiguration);
  id v13 = +[MLUpdateTask updateTaskForModelAtURL:v11 trainingData:v10 configuration:v12 progressHandlers:v9 error:error];

  return (MLUpdateTask *)v13;
}

+ (MLUpdateTask)updateTaskForModelAtURL:(NSURL *)modelURL trainingData:(id)trainingData configuration:(MLModelConfiguration *)configuration progressHandlers:(MLUpdateProgressHandlers *)progressHandlers error:(NSError *)error
{
  uint64_t v11 = progressHandlers;
  v12 = configuration;
  id v13 = trainingData;
  id v14 = modelURL;
  v15 = [[MLUpdateTask alloc] initWithModelAtURL:v14 trainingData:v13 configuration:v12 progressHandlers:v11 error:error];

  return v15;
}

+ (MLUpdateTask)updateTaskForModelAtURL:(NSURL *)modelURL trainingData:(id)trainingData completionHandler:(void *)completionHandler error:(NSError *)error
{
  v9 = completionHandler;
  id v10 = trainingData;
  uint64_t v11 = modelURL;
  v12 = objc_alloc_init(MLModelConfiguration);
  id v13 = +[MLUpdateTask updateTaskForModelAtURL:v11 trainingData:v10 configuration:v12 completionHandler:v9 error:error];

  return (MLUpdateTask *)v13;
}

+ (MLUpdateTask)updateTaskForModelAtURL:(NSURL *)modelURL trainingData:(id)trainingData configuration:(MLModelConfiguration *)configuration completionHandler:(void *)completionHandler error:(NSError *)error
{
  uint64_t v11 = completionHandler;
  v12 = configuration;
  id v13 = trainingData;
  id v14 = modelURL;
  v15 = [[MLUpdateProgressHandlers alloc] initForEvents:0 progressHandler:0 completionHandler:v11];

  id v16 = +[MLUpdateTask updateTaskForModelAtURL:v14 trainingData:v13 configuration:v12 progressHandlers:v15 error:error];

  return (MLUpdateTask *)v16;
}

+ (BOOL)updateModelAtURL:(id)a3 trainingData:(id)a4 configuration:(id)a5 writeToURL:(id)a6 error:(id *)a7
{
  return 1;
}

@end