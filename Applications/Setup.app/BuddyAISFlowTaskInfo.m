@interface BuddyAISFlowTaskInfo
- (AISFlowTaskInfoProtocol)underlyingFlowTaskInfo;
- (BuddyAISFlowTaskInfo)initWithUnderlyingFlowTaskInfo:(id)a3;
- (void)setUnderlyingFlowTaskInfo:(id)a3;
- (void)waitUntilLoadedWithCompletion:(id)a3;
@end

@implementation BuddyAISFlowTaskInfo

- (BuddyAISFlowTaskInfo)initWithUnderlyingFlowTaskInfo:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v8;
  id v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)BuddyAISFlowTaskInfo;
  id v8 = [(BuddyAISFlowTaskInfo *)&v6 init];
  objc_storeStrong(&v8, v8);
  if (v8) {
    objc_storeStrong((id *)v8 + 1, location[0]);
  }
  v4 = (BuddyAISFlowTaskInfo *)v8;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return v4;
}

- (void)waitUntilLoadedWithCompletion:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  v4 = [(BuddyAISFlowTaskInfo *)v7 underlyingFlowTaskInfo];
  if (v4)
  {
    v5 = [(BuddyAISFlowTaskInfo *)v7 underlyingFlowTaskInfo];
    [(AISFlowTaskInfoProtocol *)v5 waitUntilLoadedWithCompletionHandler:location[0]];
  }
  else
  {
    (*((void (**)(void))location[0] + 2))();
  }
  objc_storeStrong(location, 0);
}

- (AISFlowTaskInfoProtocol)underlyingFlowTaskInfo
{
  return self->_underlyingFlowTaskInfo;
}

- (void)setUnderlyingFlowTaskInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end