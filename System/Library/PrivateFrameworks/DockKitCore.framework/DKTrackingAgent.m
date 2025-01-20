@interface DKTrackingAgent
- (BOOL)docked;
- (BOOL)tracking;
- (BOOL)trackingButtonEnabled;
- (DKTrackingAgent)init;
- (DKTrackingAgent)initWithClientApplicationID:(id)a3;
- (DKTrackingAgent)initWithConfiguration:(id)a3;
- (DKTrackingAgent)initWithTrackerConfiguration:(id)a3;
- (id)getSelectedBodyIds;
- (id)getSelectedFaceIds;
- (id)getTrackedObjects;
- (void)dealloc;
- (void)processImageWithImage:(id)a3 faces:(id)a4;
- (void)selectSubjectAt:(CGPoint)a3 completion:(id)a4;
- (void)setRectOfInterest:(CGRect)a3 completion:(id)a4;
- (void)stop;
- (void)trackWithFocusObservations:(id)a3 metaData:(id)a4 image:(id)a5 cameraPortType:(id)a6 cameraIntrinsics:(id)a7 referenceDimensions:(CGSize)a8 orientation:(int)a9 completionHandler:(id)a10;
- (void)trackWithMetadata:(id)a3 image:(id)a4 cameraPortType:(id)a5 cameraIntrinsics:(id)a6 referenceDimensions:(CGSize)a7 orientation:(int)a8 completionHandler:(id)a9;
@end

@implementation DKTrackingAgent

- (DKTrackingAgent)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DKTrackingAgent;
  v5 = [(DKTrackingAgent *)&v13 init];
  if (v5)
  {
    v6 = [[ObjectTrackingAgent alloc] initWithConfig:v4];
    agent = v5->_agent;
    v5->_agent = v6;

    dispatch_semaphore_t v8 = dispatch_semaphore_create(1);
    isTrackingSemaphore = v5->_isTrackingSemaphore;
    v5->_isTrackingSemaphore = (OS_dispatch_semaphore *)v8;

    dispatch_semaphore_t v10 = dispatch_semaphore_create(1);
    isButtonEnabledSemaphore = v5->_isButtonEnabledSemaphore;
    v5->_isButtonEnabledSemaphore = (OS_dispatch_semaphore *)v10;

    v5->_isTracking = 0;
    v5->_trackingButtonEnabled = 0;
  }

  return v5;
}

intptr_t __27__DKTrackingAgent_tracking__block_invoke(uint64_t a1, char a2)
{
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v4, v5);
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = a2;
  v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  return dispatch_semaphore_signal(v6);
}

- (BOOL)tracking
{
  agent = self->_agent;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __27__DKTrackingAgent_tracking__block_invoke;
  v7[3] = &unk_2652F8678;
  v7[4] = self;
  [(ObjectTrackingAgent *)agent isTrackingWithCompletionHandler:v7];
  isTrackingSemaphore = self->_isTrackingSemaphore;
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(isTrackingSemaphore, v5);
  LOBYTE(isTrackingSemaphore) = self->_isTracking;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_isTrackingSemaphore);
  return (char)isTrackingSemaphore;
}

- (DKTrackingAgent)init
{
  v10.receiver = self;
  v10.super_class = (Class)DKTrackingAgent;
  v2 = [(DKTrackingAgent *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(ObjectTrackingAgent);
    agent = v2->_agent;
    v2->_agent = v3;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(1);
    isTrackingSemaphore = v2->_isTrackingSemaphore;
    v2->_isTrackingSemaphore = (OS_dispatch_semaphore *)v5;

    dispatch_semaphore_t v7 = dispatch_semaphore_create(1);
    isButtonEnabledSemaphore = v2->_isButtonEnabledSemaphore;
    v2->_isButtonEnabledSemaphore = (OS_dispatch_semaphore *)v7;

    v2->_isTracking = 0;
    v2->_trackingButtonEnabled = 0;
  }
  return v2;
}

- (DKTrackingAgent)initWithClientApplicationID:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DKTrackingAgent;
  dispatch_semaphore_t v5 = [(DKTrackingAgent *)&v13 init];
  if (v5)
  {
    v6 = [[ObjectTrackingAgent alloc] initWithAppID:v4];
    agent = v5->_agent;
    v5->_agent = v6;

    dispatch_semaphore_t v8 = dispatch_semaphore_create(1);
    isTrackingSemaphore = v5->_isTrackingSemaphore;
    v5->_isTrackingSemaphore = (OS_dispatch_semaphore *)v8;

    dispatch_semaphore_t v10 = dispatch_semaphore_create(1);
    isButtonEnabledSemaphore = v5->_isButtonEnabledSemaphore;
    v5->_isButtonEnabledSemaphore = (OS_dispatch_semaphore *)v10;

    v5->_isTracking = 0;
    v5->_trackingButtonEnabled = 0;
  }

  return v5;
}

- (DKTrackingAgent)initWithTrackerConfiguration:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DKTrackingAgent;
  dispatch_semaphore_t v5 = [(DKTrackingAgent *)&v13 init];
  if (v5)
  {
    v6 = [[ObjectTrackingAgent alloc] initWithTrackerConfig:v4];
    agent = v5->_agent;
    v5->_agent = v6;

    dispatch_semaphore_t v8 = dispatch_semaphore_create(1);
    isTrackingSemaphore = v5->_isTrackingSemaphore;
    v5->_isTrackingSemaphore = (OS_dispatch_semaphore *)v8;

    dispatch_semaphore_t v10 = dispatch_semaphore_create(1);
    isButtonEnabledSemaphore = v5->_isButtonEnabledSemaphore;
    v5->_isButtonEnabledSemaphore = (OS_dispatch_semaphore *)v10;

    v5->_isTracking = 0;
    v5->_trackingButtonEnabled = 0;
  }

  return v5;
}

- (void)dealloc
{
  NSLog(&cfstr_Dktrackingagen.isa, a2);
  [(ObjectTrackingAgent *)self->_agent stop];
  agent = self->_agent;
  self->_agent = 0;

  v4.receiver = self;
  v4.super_class = (Class)DKTrackingAgent;
  [(DKTrackingAgent *)&v4 dealloc];
}

- (void)trackWithMetadata:(id)a3 image:(id)a4 cameraPortType:(id)a5 cameraIntrinsics:(id)a6 referenceDimensions:(CGSize)a7 orientation:(int)a8 completionHandler:(id)a9
{
  uint64_t v10 = *(void *)&a8;
  double height = a7.height;
  double width = a7.width;
  id v23 = a4;
  agent = self->_agent;
  id v18 = a9;
  id v19 = a6;
  id v20 = a5;
  id v21 = a3;
  if ([(ObjectTrackingAgent *)agent customInferenceEnabled]) {
    id v22 = v23;
  }
  else {
    id v22 = 0;
  }
  -[ObjectTrackingAgent trackWithMetadata:image:cameraPortType:cameraIntrinsics:referenceDimensions:orientation:completionHandler:](self->_agent, "trackWithMetadata:image:cameraPortType:cameraIntrinsics:referenceDimensions:orientation:completionHandler:", v21, v22, v20, v19, v10, v18, width, height);
}

- (void)trackWithFocusObservations:(id)a3 metaData:(id)a4 image:(id)a5 cameraPortType:(id)a6 cameraIntrinsics:(id)a7 referenceDimensions:(CGSize)a8 orientation:(int)a9 completionHandler:(id)a10
{
  uint64_t v10 = *(void *)&a9;
  double height = a8.height;
  double width = a8.width;
  id v27 = a5;
  agent = self->_agent;
  id v19 = a10;
  id v20 = a7;
  id v21 = a6;
  id v22 = a4;
  id v23 = a3;
  LODWORD(agent) = [(ObjectTrackingAgent *)agent customInferenceEnabled];
  v24 = self->_agent;
  v25 = [v23 firstObject];

  if (agent) {
    id v26 = v27;
  }
  else {
    id v26 = 0;
  }
  -[ObjectTrackingAgent trackWithFocusObservation:metadata:image:cameraPortType:cameraIntrinsics:referenceDimensions:orientation:completionHandler:](v24, "trackWithFocusObservation:metadata:image:cameraPortType:cameraIntrinsics:referenceDimensions:orientation:completionHandler:", v25, v22, v26, v21, v20, v10, width, height, v19);
}

- (void)stop
{
}

- (id)getTrackedObjects
{
  return [(ObjectTrackingAgent *)self->_agent getTrackedObjects];
}

- (id)getSelectedFaceIds
{
  return [(ObjectTrackingAgent *)self->_agent getSelectedFaceIds];
}

- (id)getSelectedBodyIds
{
  return [(ObjectTrackingAgent *)self->_agent getSelectedBodyIds];
}

- (void)processImageWithImage:(id)a3 faces:(id)a4
{
}

- (BOOL)docked
{
  return [(ObjectTrackingAgent *)self->_agent docked];
}

- (BOOL)trackingButtonEnabled
{
  agent = self->_agent;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__DKTrackingAgent_trackingButtonEnabled__block_invoke;
  v7[3] = &unk_2652F8678;
  v7[4] = self;
  [(ObjectTrackingAgent *)agent trackingButtonEnabledWithCompletionHandler:v7];
  isButtonEnabledSemaphore = self->_isButtonEnabledSemaphore;
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(isButtonEnabledSemaphore, v5);
  LOBYTE(isButtonEnabledSemaphore) = self->_trackingButtonEnabled;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_isButtonEnabledSemaphore);
  return (char)isButtonEnabledSemaphore;
}

intptr_t __40__DKTrackingAgent_trackingButtonEnabled__block_invoke(uint64_t a1, char a2)
{
  objc_super v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v4, v5);
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = a2;
  v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  return dispatch_semaphore_signal(v6);
}

- (void)setRectOfInterest:(CGRect)a3 completion:(id)a4
{
}

- (void)selectSubjectAt:(CGPoint)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isButtonEnabledSemaphore, 0);
  objc_storeStrong((id *)&self->_isTrackingSemaphore, 0);
  objc_storeStrong((id *)&self->_agent, 0);
}

@end