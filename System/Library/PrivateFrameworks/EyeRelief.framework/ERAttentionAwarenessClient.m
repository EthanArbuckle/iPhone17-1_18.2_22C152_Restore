@interface ERAttentionAwarenessClient
+ (int64_t)_categoryForDistance:(float)a3 withFaceState:(unint64_t)a4;
+ (int64_t)_categoryForDistance:(float)a3 withTooCloseDistanceThreshold:(int64_t)a4 withFaceState:(unint64_t)a5;
+ (void)reportAnalyticsFaceDetectAttentionEvent:(id)a3;
- (AWAttentionAwarenessClient)attentionAwarenessClient;
- (AWAttentionAwarenessConfiguration)attentionAwarenessConfiguration;
- (BOOL)cancelWithError:(id *)a3;
- (BOOL)invalidateWithError:(id *)a3;
- (ERAttentionAwarenessClient)init;
- (OS_dispatch_queue)queue;
- (id)interruptHandler;
- (int64_t)tooCloseDistanceThreshold;
- (void)_pollForDistanceWithCompletion:(id)a3;
- (void)_resumeStreamingWithCompletion:(id)a3;
- (void)setAttentionAwarenessClient:(id)a3;
- (void)setAttentionAwarenessConfiguration:(id)a3;
- (void)setInterruptHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTooCloseDistanceThreshold:(int64_t)a3;
@end

@implementation ERAttentionAwarenessClient

- (ERAttentionAwarenessClient)init
{
  v20.receiver = self;
  v20.super_class = (Class)ERAttentionAwarenessClient;
  id v2 = [(ERAttentionAwarenessClient *)&v20 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.EyeRelief"];
    int has_internal_content = os_variant_has_internal_content();
    uint64_t v5 = objc_opt_new();
    v6 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v5;

    [*((id *)v2 + 3) setIdentifier:@"com.apple.eyerelief"];
    if (has_internal_content && [v3 BOOLForKey:@"demoMode"])
    {
      v7 = [NSString stringWithFormat:@"Demo Mode is enabled"];
      +[ERLogging log:v7 withType:3];
    }
    else
    {
      [*((id *)v2 + 3) setUnityStream:1];
    }
    [*((id *)v2 + 3) setActivateEyeRelief:1];
    [*((id *)v2 + 3) setActivateAttentionDetection:0];
    [*((id *)v2 + 3) setContinuousFaceDetectMode:1];
    [*((id *)v2 + 3) setNotificationMask:31];
    uint64_t v8 = objc_opt_new();
    v9 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v8;

    [*((id *)v2 + 4) setConfiguration:*((void *)v2 + 3)];
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.eyerelief.AttentionAwarenessQueue", 0);
    v11 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v10;

    dispatch_activate(*((dispatch_object_t *)v2 + 5));
    objc_initWeak(&location, v2);
    v12 = (void *)*((void *)v2 + 4);
    uint64_t v13 = *((void *)v2 + 5);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __34__ERAttentionAwarenessClient_init__block_invoke;
    v17[3] = &unk_2653038A8;
    objc_copyWeak(&v18, &location);
    [v12 setNotificationHandlerWithQueue:v13 block:v17];
    if (!has_internal_content || (uint64_t v14 = [v3 integerForKey:@"distanceThreshold"]) == 0) {
      uint64_t v14 = 300;
    }
    *((void *)v2 + 2) = v14;
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"Too close distance threshold setting: %li mm", v14);
    +[ERLogging log:v15 withType:0];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return (ERAttentionAwarenessClient *)v2;
}

void __34__ERAttentionAwarenessClient_init__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 5) != 0)
  {
    v3 = [NSString stringWithFormat:@"Distance sampling interrupted!"];
    +[ERLogging log:v3 withType:1];

    v4 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained(v4);
    v6 = [WeakRetained interruptHandler];

    if (v6)
    {
      id v8 = objc_loadWeakRetained(v4);
      v7 = [v8 interruptHandler];
      v7[2]();
    }
  }
}

- (BOOL)cancelWithError:(id *)a3
{
  v4 = [(ERAttentionAwarenessClient *)self attentionAwarenessClient];
  id v9 = 0;
  char v5 = [v4 cancelFaceDetectStreamWithError:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    v7 = [NSString stringWithFormat:@"Failed to cancel AA stream: %@", v6];
    +[ERLogging log:v7 withType:1];
  }
  if (a3) {
    *a3 = v6;
  }

  return v6 == 0;
}

- (BOOL)invalidateWithError:(id *)a3
{
  v4 = [(ERAttentionAwarenessClient *)self attentionAwarenessClient];
  id v9 = 0;
  char v5 = [v4 invalidateWithError:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    v7 = [NSString stringWithFormat:@"Failed to invalidate AA client: %@", v6];
    +[ERLogging log:v7 withType:1];
  }
  if (a3) {
    *a3 = v6;
  }

  return v6 == 0;
}

- (void)_resumeStreamingWithCompletion:(id)a3
{
  id v4 = a3;
  char v5 = [(ERAttentionAwarenessClient *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__ERAttentionAwarenessClient__resumeStreamingWithCompletion___block_invoke;
  v7[3] = &unk_2653038D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __61__ERAttentionAwarenessClient__resumeStreamingWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) attentionAwarenessClient];
  id v10 = 0;
  char v3 = [v2 resumeWithError:&v10];
  id v4 = v10;

  if (v3)
  {
    char v5 = [NSString stringWithFormat:@"Resumed distance streaming"];
    +[ERLogging log:v5 withType:0];

    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      v7 = *(void (**)(void))(v6 + 16);
LABEL_6:
      v7();
    }
  }
  else
  {
    id v8 = [NSString stringWithFormat:@"Failed to resume distance streaming: %@", v4];
    +[ERLogging log:v8 withType:1];

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      v7 = *(void (**)(void))(v9 + 16);
      goto LABEL_6;
    }
  }
}

+ (int64_t)_categoryForDistance:(float)a3 withFaceState:(unint64_t)a4
{
  uint64_t v6 = objc_opt_class();
  *(float *)&double v7 = a3;

  return [v6 _categoryForDistance:300 withTooCloseDistanceThreshold:a4 withFaceState:v7];
}

+ (int64_t)_categoryForDistance:(float)a3 withTooCloseDistanceThreshold:(int64_t)a4 withFaceState:(unint64_t)a5
{
  if (a5 == 2) {
    return 0;
  }
  if (a5 == 1) {
    return (float)a4 <= a3;
  }
  return 2;
}

- (void)_pollForDistanceWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  char v5 = [(ERAttentionAwarenessClient *)self attentionAwarenessClient];
  uint64_t v6 = [(ERAttentionAwarenessClient *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__ERAttentionAwarenessClient__pollForDistanceWithCompletion___block_invoke;
  v11[3] = &unk_2653038F8;
  objc_copyWeak(&v13, &location);
  id v7 = v4;
  id v12 = v7;
  [v5 setEventStreamerWithQueue:v6 block:v11];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__ERAttentionAwarenessClient__pollForDistanceWithCompletion___block_invoke_2;
  v9[3] = &unk_265303920;
  id v8 = v7;
  id v10 = v8;
  [(ERAttentionAwarenessClient *)self _resumeStreamingWithCompletion:v9];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

uint64_t __61__ERAttentionAwarenessClient__pollForDistanceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 distance];
  double v5 = v4;
  uint64_t v6 = [v3 faceState];
  +[ERAttentionAwarenessClient reportAnalyticsFaceDetectAttentionEvent:v3];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v9 = [WeakRetained tooCloseDistanceThreshold];
  float v7 = v5;
  *(float *)&double v10 = v7;
  int64_t v11 = +[ERAttentionAwarenessClient _categoryForDistance:v9 withTooCloseDistanceThreshold:v6 withFaceState:v10];

  id v12 = [NSString stringWithFormat:@"ER Distance: %f, ER Face State: %llu", *(void *)&v5, v6];
  +[ERLogging log:v12 withType:0];

  unint64_t v13 = [v3 eventMask];
  uint64_t v14 = [ERDistanceEvent alloc];
  *(float *)&double v15 = v5;
  [(ERDistanceEvent *)v14 initWithDistance:v11 distanceCategory:(v13 >> 7) & 1 andAttention:v15];
  uint64_t v16 = *(void *)(a1 + 32);
  if (v16) {
    (*(void (**)(void))(v16 + 16))();
  }

  return MEMORY[0x270F9A758]();
}

uint64_t __61__ERAttentionAwarenessClient__pollForDistanceWithCompletion___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
    }
  }
  return result;
}

+ (void)reportAnalyticsFaceDetectAttentionEvent:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

id __70__ERAttentionAwarenessClient_reportAnalyticsFaceDetectAttentionEvent___block_invoke(uint64_t a1)
{
  v9[2] = *MEMORY[0x263EF8340];
  v8[0] = @"aw_distance";
  id v2 = NSNumber;
  [*(id *)(a1 + 32) distance];
  id v4 = [v2 numberWithDouble:v3 * 0.1];
  v8[1] = @"aw_face_state";
  v9[0] = v4;
  double v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "faceState"));
  v9[1] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (id)interruptHandler
{
  return self->_interruptHandler;
}

- (void)setInterruptHandler:(id)a3
{
}

- (int64_t)tooCloseDistanceThreshold
{
  return self->_tooCloseDistanceThreshold;
}

- (void)setTooCloseDistanceThreshold:(int64_t)a3
{
  self->_tooCloseDistanceThreshold = a3;
}

- (AWAttentionAwarenessConfiguration)attentionAwarenessConfiguration
{
  return self->_attentionAwarenessConfiguration;
}

- (void)setAttentionAwarenessConfiguration:(id)a3
{
}

- (AWAttentionAwarenessClient)attentionAwarenessClient
{
  return self->_attentionAwarenessClient;
}

- (void)setAttentionAwarenessClient:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessClient, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessConfiguration, 0);

  objc_storeStrong(&self->_interruptHandler, 0);
}

@end