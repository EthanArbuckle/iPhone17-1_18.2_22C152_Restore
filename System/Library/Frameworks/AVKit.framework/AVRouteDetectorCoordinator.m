@interface AVRouteDetectorCoordinator
+ (BOOL)multipleRoutesDetected;
+ (id)routeDetectorCoordinatorQueue;
+ (id)sharedSystemRouteDetector;
+ (void)beginDetectingRoutes;
+ (void)endDetectingRoutes;
+ (void)setMultipleRoutesDetected:(BOOL)a3;
+ (void)updateMultipleRoutesDetected;
- (BOOL)isRouteDetectionEnabled;
- (BOOL)multipleRoutesDetected;
- (void)dealloc;
- (void)setRouteDetectionEnabled:(BOOL)a3;
@end

@implementation AVRouteDetectorCoordinator

- (BOOL)isRouteDetectionEnabled
{
  return self->_routeDetectionEnabled;
}

- (void)dealloc
{
  [(AVRouteDetectorCoordinator *)self setRouteDetectionEnabled:0];
  v3.receiver = self;
  v3.super_class = (Class)AVRouteDetectorCoordinator;
  [(AVRouteDetectorCoordinator *)&v3 dealloc];
}

- (BOOL)multipleRoutesDetected
{
  v2 = objc_opt_class();

  return [v2 multipleRoutesDetected];
}

- (void)setRouteDetectionEnabled:(BOOL)a3
{
  if (self->_routeDetectionEnabled != a3)
  {
    BOOL v3 = a3;
    self->_routeDetectionEnabled = a3;
    v4 = objc_opt_class();
    if (v3)
    {
      [v4 beginDetectingRoutes];
    }
    else
    {
      [v4 endDetectingRoutes];
    }
  }
}

+ (void)setMultipleRoutesDetected:(BOOL)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AVRouteDetectorCoordinator_setMultipleRoutesDetected___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __56__AVRouteDetectorCoordinator_setMultipleRoutesDetected___block_invoke(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) != AVRouteDetectorCoordinatorMultipleRoutesDetected)
  {
    AVRouteDetectorCoordinatorMultipleRoutesDetected = *(unsigned char *)(a1 + 32);
    id v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v1 postNotificationName:@"AVRouteDetectorCoordinatorMultipleRoutesDetectedDidChangeNotification" object:0];
  }
}

+ (BOOL)multipleRoutesDetected
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v2 = _AVLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_error_impl(&dword_1B05B7000, v2, OS_LOG_TYPE_ERROR, "Only access this property on the main queue!", v4, 2u);
    }
  }
  return AVRouteDetectorCoordinatorMultipleRoutesDetected;
}

+ (void)updateMultipleRoutesDetected
{
  BOOL v3 = [a1 routeDetectorCoordinatorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__AVRouteDetectorCoordinator_updateMultipleRoutesDetected__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  dispatch_async(v3, block);
}

void __58__AVRouteDetectorCoordinator_updateMultipleRoutesDetected__block_invoke(uint64_t a1)
{
  if (AVRouteDetectorCoordinatorBeginDetectingRoutesCount >= 1)
  {
    id v1 = *(void **)(a1 + 32);
    id v2 = [v1 sharedSystemRouteDetector];
    objc_msgSend(v1, "setMultipleRoutesDetected:", objc_msgSend(v2, "multipleRoutesDetected"));
  }
}

+ (void)endDetectingRoutes
{
  BOOL v3 = [a1 routeDetectorCoordinatorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AVRouteDetectorCoordinator_endDetectingRoutes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  dispatch_async(v3, block);
}

void __48__AVRouteDetectorCoordinator_endDetectingRoutes__block_invoke(uint64_t a1)
{
  if (!--AVRouteDetectorCoordinatorBeginDetectingRoutesCount)
  {
    id v1 = [*(id *)(a1 + 32) sharedSystemRouteDetector];
    [v1 setRouteDetectionEnabled:0];
  }
}

+ (void)beginDetectingRoutes
{
  BOOL v3 = [a1 routeDetectorCoordinatorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AVRouteDetectorCoordinator_beginDetectingRoutes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  dispatch_async(v3, block);
}

void __50__AVRouteDetectorCoordinator_beginDetectingRoutes__block_invoke(uint64_t a1)
{
  if (!AVRouteDetectorCoordinatorBeginDetectingRoutesCount++)
  {
    id v2 = [*(id *)(a1 + 32) sharedSystemRouteDetector];
    [v2 setRouteDetectionEnabled:1];
  }
}

+ (id)sharedSystemRouteDetector
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__AVRouteDetectorCoordinator_sharedSystemRouteDetector__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedSystemRouteDetector_onceToken != -1) {
    dispatch_once(&sharedSystemRouteDetector_onceToken, block);
  }
  id v2 = (void *)sharedSystemRouteDetector_sharedSystemRouteDetector;

  return v2;
}

void __55__AVRouteDetectorCoordinator_sharedSystemRouteDetector__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F16678]);
  BOOL v3 = (void *)sharedSystemRouteDetector_sharedSystemRouteDetector;
  sharedSystemRouteDetector_sharedSystemRouteDetector = (uint64_t)v2;

  BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v5 = *MEMORY[0x1E4F160A0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__AVRouteDetectorCoordinator_sharedSystemRouteDetector__block_invoke_2;
  v7[3] = &__block_descriptor_40_e24_v16__0__NSNotification_8l;
  v7[4] = *(void *)(a1 + 32);
  id v6 = (id)[v4 addObserverForName:v5 object:sharedSystemRouteDetector_sharedSystemRouteDetector queue:0 usingBlock:v7];
}

uint64_t __55__AVRouteDetectorCoordinator_sharedSystemRouteDetector__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateMultipleRoutesDetected];
}

+ (id)routeDetectorCoordinatorQueue
{
  if (routeDetectorCoordinatorQueue_onceToken != -1) {
    dispatch_once(&routeDetectorCoordinatorQueue_onceToken, &__block_literal_global_78);
  }
  id v2 = (void *)routeDetectorCoordinatorQueue_routeDetectorCoordinatorQueue;

  return v2;
}

void __59__AVRouteDetectorCoordinator_routeDetectorCoordinatorQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.avkit.routeDetectorCoordinatorQueue", v2);
  id v1 = (void *)routeDetectorCoordinatorQueue_routeDetectorCoordinatorQueue;
  routeDetectorCoordinatorQueue_routeDetectorCoordinatorQueue = (uint64_t)v0;
}

@end