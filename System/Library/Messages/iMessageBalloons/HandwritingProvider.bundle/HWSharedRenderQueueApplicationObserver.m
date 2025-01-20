@interface HWSharedRenderQueueApplicationObserver
- (HWSharedRenderQueueApplicationObserver)init;
- (NSOperationQueue)operationQueue;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)dealloc;
- (void)setOperationQueue:(id)a3;
@end

@implementation HWSharedRenderQueueApplicationObserver

- (HWSharedRenderQueueApplicationObserver)init
{
  v7.receiver = self;
  v7.super_class = (Class)HWSharedRenderQueueApplicationObserver;
  v2 = [(HWSharedRenderQueueApplicationObserver *)&v7 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_applicationDidEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"_applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_applicationDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HWSharedRenderQueueApplicationObserver;
  [(HWSharedRenderQueueApplicationObserver *)&v4 dealloc];
}

- (void)_applicationDidEnterBackground:(id)a3
{
  id v3 = [(HWSharedRenderQueueApplicationObserver *)self operationQueue];
  [v3 setSuspended:1];
}

- (void)_applicationWillEnterForeground:(id)a3
{
  id v3 = [(HWSharedRenderQueueApplicationObserver *)self operationQueue];
  [v3 setSuspended:0];
}

- (void)_applicationDidBecomeActive:(id)a3
{
  id v3 = [(HWSharedRenderQueueApplicationObserver *)self operationQueue];
  [v3 setSuspended:0];
}

- (NSOperationQueue)operationQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operationQueue);

  return (NSOperationQueue *)WeakRetained;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end