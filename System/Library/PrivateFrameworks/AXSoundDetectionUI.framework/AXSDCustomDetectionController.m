@interface AXSDCustomDetectionController
+ (id)sharedInstance;
- (AXSDCustomDetectionController)init;
- (AXSDKShotModelManager)modelManager;
- (BOOL)containsCustomDetector:(id)a3;
- (BOOL)isListening;
- (id)currentCustomDetectors;
- (void)addCustomDetector:(id)a3;
- (void)removeAllListenTypes;
- (void)removeCustomDetector:(id)a3;
- (void)setModelManager:(id)a3;
- (void)startListening;
- (void)stopListening;
@end

@implementation AXSDCustomDetectionController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance___SharedController_2;
  return v2;
}

uint64_t __47__AXSDCustomDetectionController_sharedInstance__block_invoke()
{
  sharedInstance___SharedController_2 = objc_alloc_init(AXSDCustomDetectionController);
  return MEMORY[0x270F9A758]();
}

- (AXSDCustomDetectionController)init
{
  v8.receiver = self;
  v8.super_class = (Class)AXSDCustomDetectionController;
  v2 = [(AXSDCustomDetectionController *)&v8 init];
  if (v2)
  {
    int v3 = AXIsSoundDetectionMedinaSupportEnabled();
    v4 = &off_2647F46D8;
    if (!v3) {
      v4 = off_2647F46D0;
    }
    v5 = (_TtP18AXSoundDetectionUI33AXSDKShotControllerImplementation_ *)objc_alloc_init(*v4);
    controller = v2->_controller;
    v2->_controller = v5;
  }
  return v2;
}

- (id)currentCustomDetectors
{
  return (id)[(AXSDKShotControllerImplementation *)self->_controller currentDetectionTypes];
}

- (void)addCustomDetector:(id)a3
{
}

- (void)removeCustomDetector:(id)a3
{
}

- (void)removeAllListenTypes
{
}

- (BOOL)containsCustomDetector:(id)a3
{
  controller = self->_controller;
  id v4 = a3;
  v5 = [(AXSDKShotControllerImplementation *)controller currentDetectionTypes];
  v6 = [v4 identifier];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (void)startListening
{
}

- (void)stopListening
{
}

- (BOOL)isListening
{
  return [(AXSDKShotControllerImplementation *)self->_controller isListening];
}

- (AXSDKShotModelManager)modelManager
{
  return self->_modelManager;
}

- (void)setModelManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelManager, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end