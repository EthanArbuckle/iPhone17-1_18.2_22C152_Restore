@interface VKMapViewOutputManager
+ (id)sharedOutputManager;
- (NSMutableArray)outputQueue;
- (VKMapViewOutputManager)init;
- (unint64_t)outputQueueCount;
- (void)_handleAccessibilityAnnouncementDidFinish:(id)a3;
- (void)clearOutputQueue;
- (void)dealloc;
- (void)queueOutput:(id)a3;
- (void)setOutputQueue:(id)a3;
@end

@implementation VKMapViewOutputManager

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VKMapViewOutputManager;
  [(VKMapViewOutputManager *)&v4 dealloc];
}

- (VKMapViewOutputManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)VKMapViewOutputManager;
  v2 = [(VKMapViewOutputManager *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF980] array];
    [(VKMapViewOutputManager *)v2 setOutputQueue:v3];

    objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel__handleAccessibilityAnnouncementDidFinish_ name:*MEMORY[0x263F1CDB0] object:0];
  }
  return v2;
}

+ (id)sharedOutputManager
{
  if (+[VKMapViewOutputManager sharedOutputManager]::_OutputManagerOnceToken != -1) {
    dispatch_once(&+[VKMapViewOutputManager sharedOutputManager]::_OutputManagerOnceToken, &__block_literal_global_5);
  }
  v2 = (void *)+[VKMapViewOutputManager sharedOutputManager]::_OutputManager;

  return v2;
}

void __45__VKMapViewOutputManager_sharedOutputManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)+[VKMapViewOutputManager sharedOutputManager]::_OutputManager;
  +[VKMapViewOutputManager sharedOutputManager]::_OutputManager = v0;
}

- (void)_handleAccessibilityAnnouncementDidFinish:(id)a3
{
  id v4 = [(VKMapViewOutputManager *)self outputQueue];
  if ([v4 count])
  {
    v3 = [v4 lastObject];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v3);
    [v4 removeLastObject];
  }
}

- (void)clearOutputQueue
{
  id v2 = [(VKMapViewOutputManager *)self outputQueue];
  [v2 removeAllObjects];
}

- (unint64_t)outputQueueCount
{
  id v2 = [(VKMapViewOutputManager *)self outputQueue];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)queueOutput:(id)a3
{
  id argument = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(VKMapViewOutputManager *)self outputQueue];
    if ([v4 count]) {
      [v4 insertObject:argument atIndex:0];
    }
    else {
      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
    }
  }
}

- (NSMutableArray)outputQueue
{
  return self->_outputQueue;
}

- (void)setOutputQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end