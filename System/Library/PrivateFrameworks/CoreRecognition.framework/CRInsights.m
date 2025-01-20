@interface CRInsights
+ (id)sharedInsights;
+ (void)dispatchAsyncOnQueue:(id)a3 block:(id)a4;
- (CRInsights)init;
- (CRInsightsDelegate)delegate;
- (NSMutableDictionary)threadsToContexts;
- (id)allowOverrideWithKey:(id)a3 forResultFromBlock:(id)a4;
- (id)allowOverrideWithKey:(id)a3 forValue:(id)a4;
- (id)cameraReaderForCurrentThread;
- (id)currentContext;
- (id)enterSection:(id)a3 withDescription:(id)a4;
- (id)takeContextSnapshot;
- (void)attachContextCopyToCurrentThread:(id)a3;
- (void)attachContextToCurrentThread:(id)a3;
- (void)attachNewContextToCurrentThreadWithCameraReader:(id)a3;
- (void)leaveSection:(id)a3;
- (void)notifySampleBufferProcessingEnd:(opaqueCMSampleBuffer *)a3;
- (void)notifySampleBufferProcessingStart:(opaqueCMSampleBuffer *)a3;
- (void)provideInsightValue:(id)a3 forKey:(id)a4;
- (void)resetContextForCurrentThread;
- (void)setContextValue:(id)a3 forKey:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setThreadsToContexts:(id)a3;
@end

@implementation CRInsights

+ (id)sharedInsights
{
  if (os_variant_has_internal_diagnostics())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __28__CRInsights_sharedInsights__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (qword_267B9C4F0 != -1) {
      dispatch_once(&qword_267B9C4F0, block);
    }
  }
  v3 = (void *)_MergedGlobals_5;
  return v3;
}

void __28__CRInsights_sharedInsights__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v3 = [v2 BOOLForKey:@"com.apple.CoreRecognition.enable_shared_insights"];

  if (v3)
  {
    id v4 = objc_alloc_init(*(Class *)(a1 + 32));
    v5 = (void *)_MergedGlobals_5;
    _MergedGlobals_5 = (uint64_t)v4;
  }
}

- (CRInsights)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRInsights;
  v2 = [(CRInsights *)&v5 init];
  if (v2)
  {
    int v3 = [MEMORY[0x263EFF9A0] dictionary];
    [(CRInsights *)v2 setThreadsToContexts:v3];
  }
  return v2;
}

- (id)currentContext
{
  int v3 = (void *)MEMORY[0x263F08D40];
  id v4 = [MEMORY[0x263F08B88] currentThread];
  objc_super v5 = [v3 valueWithNonretainedObject:v4];

  v6 = [(CRInsights *)self threadsToContexts];
  objc_sync_enter(v6);
  v7 = [(CRInsights *)self threadsToContexts];
  v8 = [v7 objectForKey:v5];

  objc_sync_exit(v6);
  return v8;
}

- (id)takeContextSnapshot
{
  v2 = [(CRInsights *)self currentContext];
  if (v2) {
    int v3 = [[CRInsightsContext alloc] initWithContext:v2];
  }
  else {
    int v3 = 0;
  }

  return v3;
}

- (void)attachNewContextToCurrentThreadWithCameraReader:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_alloc_init(CRInsightsContext);
  [(CRInsightsContext *)v5 setCameraReader:v4];

  [(CRInsights *)self attachContextToCurrentThread:v5];
}

- (void)attachContextToCurrentThread:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    objc_super v5 = (void *)MEMORY[0x263F08D40];
    v6 = [MEMORY[0x263F08B88] currentThread];
    v7 = [v5 valueWithNonretainedObject:v6];

    v8 = [(CRInsights *)self threadsToContexts];
    objc_sync_enter(v8);
    v9 = [(CRInsights *)self threadsToContexts];
    [v9 setObject:v10 forKey:v7];

    objc_sync_exit(v8);
    id v4 = v10;
  }
}

- (void)attachContextCopyToCurrentThread:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    objc_super v5 = [[CRInsightsContext alloc] initWithContext:v4];

    [(CRInsights *)self attachContextToCurrentThread:v5];
  }
}

- (void)resetContextForCurrentThread
{
  int v3 = (void *)MEMORY[0x263F08D40];
  id v4 = [MEMORY[0x263F08B88] currentThread];
  id v7 = [v3 valueWithNonretainedObject:v4];

  objc_super v5 = [(CRInsights *)self threadsToContexts];
  objc_sync_enter(v5);
  v6 = [(CRInsights *)self threadsToContexts];
  [v6 removeObjectForKey:v7];

  objc_sync_exit(v5);
}

- (void)setContextValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRInsights *)self currentContext];
  [v8 setValue:v7 forKey:v6];
}

- (id)cameraReaderForCurrentThread
{
  int v3 = (void *)MEMORY[0x263F08D40];
  id v4 = [MEMORY[0x263F08B88] currentThread];
  objc_super v5 = [v3 valueWithNonretainedObject:v4];

  id v6 = [(CRInsights *)self threadsToContexts];
  objc_sync_enter(v6);
  id v7 = [(CRInsights *)self threadsToContexts];
  id v8 = [v7 objectForKey:v5];
  v9 = [v8 cameraReader];

  objc_sync_exit(v6);
  return v9;
}

- (void)notifySampleBufferProcessingStart:(opaqueCMSampleBuffer *)a3
{
  objc_super v5 = [(CRInsights *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [(CRInsights *)self cameraReaderForCurrentThread];
    if (v8)
    {
      id v7 = [(CRInsights *)self delegate];
      [v7 cameraReader:v8 willProcessSampleBuffer:a3];
    }
  }
}

- (void)notifySampleBufferProcessingEnd:(opaqueCMSampleBuffer *)a3
{
  objc_super v5 = [(CRInsights *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CRInsights *)self cameraReaderForCurrentThread];
    if (v7)
    {
      id v8 = [(CRInsights *)self delegate];
      [v8 cameraReader:v7 didProcessSampleBuffer:a3];
    }
  }
  [(CRInsights *)self resetContextForCurrentThread];
}

- (void)provideInsightValue:(id)a3 forKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(CRInsights *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(CRInsights *)self cameraReaderForCurrentThread];
    if (v9)
    {
      id v10 = [(CRInsights *)self delegate];
      [v10 cameraReader:v9 didProvideInsightValue:v11 forKey:v6];
    }
  }
}

- (id)enterSection:(id)a3 withDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(CRInsights *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(CRInsights *)self cameraReaderForCurrentThread];
    if (v10)
    {
      id v11 = [[CRInsightsCodeSection alloc] initWithName:v6 andDescription:v7];
      v12 = [(CRInsights *)self delegate];
      [v12 cameraReader:v10 willRunSection:v11];
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)leaveSection:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v4 = [(CRInsights *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(CRInsights *)self cameraReaderForCurrentThread];
      if (v6)
      {
        id v7 = [(CRInsights *)self delegate];
        [v7 cameraReader:v6 didRunSection:v8];
      }
    }
  }
}

- (id)allowOverrideWithKey:(id)a3 forResultFromBlock:(id)a4
{
  id v6 = (void (*)(id))*((void *)a4 + 2);
  id v7 = a3;
  id v8 = v6(a4);
  char v9 = [(CRInsights *)self allowOverrideWithKey:v7 forValue:v8];

  return v9;
}

- (id)allowOverrideWithKey:(id)a3 forValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CRInsights *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(CRInsights *)self cameraReaderForCurrentThread];
    if (v10)
    {
      id v11 = [(CRInsights *)self delegate];
      id v15 = 0;
      char v12 = [v11 cameraReader:v10 willAcceptOverride:&v15 forKey:v6];
      id v13 = v15;

      if (v12)
      {

        goto LABEL_8;
      }
    }
  }
  id v13 = v7;
LABEL_8:

  return v13;
}

+ (void)dispatchAsyncOnQueue:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[CRInsights sharedInsights];
  id v8 = [v7 takeContextSnapshot];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __41__CRInsights_dispatchAsyncOnQueue_block___block_invoke;
  v11[3] = &unk_26429E350;
  id v12 = v8;
  id v13 = v5;
  id v9 = v5;
  id v10 = v8;
  dispatch_async(v6, v11);
}

uint64_t __41__CRInsights_dispatchAsyncOnQueue_block___block_invoke(uint64_t a1)
{
  v2 = +[CRInsights sharedInsights];
  [v2 attachContextCopyToCurrentThread:*(void *)(a1 + 32)];

  int v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (CRInsightsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CRInsightsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)threadsToContexts
{
  return self->_threadsToContexts;
}

- (void)setThreadsToContexts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadsToContexts, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end