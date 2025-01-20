@interface AXSDSoundDetectionController
+ (BOOL)isEnrolledInDataCollection;
+ (BOOL)wasPromptedForDataCollection;
+ (id)sharedInstance;
+ (void)setPromptedForDataCollection;
- (AXSDDetectorManager)detectorManager;
- (AXSDSoundDetectionController)init;
- (BOOL)_hasMedinaSupport;
- (BOOL)containsListenType:(id)a3;
- (BOOL)isListening;
- (NSSet)currentDetectionTypes;
- (id)pipeInFile:(id)a3;
- (void)_pipedInFileUpdated;
- (void)addListenType:(id)a3;
- (void)assetsReadyAndDetectorsAdded;
- (void)enrollForDataCollection;
- (void)removeAllListenTypes;
- (void)removeListenType:(id)a3;
- (void)setDetectorManager:(id)a3;
- (void)startListening;
- (void)stopListening;
- (void)unenrollFromDataCollection;
@end

@implementation AXSDSoundDetectionController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance___SharedController_0;
  return v2;
}

uint64_t __46__AXSDSoundDetectionController_sharedInstance__block_invoke()
{
  sharedInstance___SharedController_0 = objc_alloc_init(AXSDSoundDetectionController);
  return MEMORY[0x270F9A758]();
}

- (AXSDSoundDetectionController)init
{
  v12.receiver = self;
  v12.super_class = (Class)AXSDSoundDetectionController;
  v2 = [(AXSDSoundDetectionController *)&v12 init];
  if (v2)
  {
    if (AXIsSoundDetectionMedinaSupportEnabled())
    {
      v3 = objc_alloc_init(_TtC18AXSoundDetectionUI34AXSDSecureControllerImplementation);
      controller = v2->_controller;
      v2->_controller = (_TtP18AXSoundDetectionUI28AXSDControllerImplementation_ *)v3;
    }
    else
    {
      v5 = objc_alloc_init(_TtC18AXSoundDetectionUI30AXSDNSControllerImplementation);
      v6 = v2->_controller;
      v2->_controller = (_TtP18AXSoundDetectionUI28AXSDControllerImplementation_ *)v5;

      objc_initWeak(&location, v2);
      v7 = [MEMORY[0x263F21DA0] sharedInstance];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __36__AXSDSoundDetectionController_init__block_invoke;
      v9[3] = &unk_2647F47F8;
      objc_copyWeak(&v10, &location);
      [v7 registerUpdateBlock:v9 forRetrieveSelector:sel_pipedInFile withListener:v2];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

void __36__AXSDSoundDetectionController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _pipedInFileUpdated];
}

- (void)enrollForDataCollection
{
  if ([MEMORY[0x263F472B0] isInternalInstall])
  {
    +[AXSDUltronInternalRecordingManager enroll];
  }
}

- (void)unenrollFromDataCollection
{
}

+ (BOOL)isEnrolledInDataCollection
{
  return +[AXSDUltronInternalRecordingManager isEnrolled];
}

+ (BOOL)wasPromptedForDataCollection
{
  return +[AXSDUltronInternalRecordingManager wasPrompted];
}

+ (void)setPromptedForDataCollection
{
}

- (void)assetsReadyAndDetectorsAdded
{
}

- (NSSet)currentDetectionTypes
{
  return (NSSet *)[(AXSDControllerImplementation *)self->_controller currentDetectionTypes];
}

- (void)addListenType:(id)a3
{
}

- (void)removeListenType:(id)a3
{
}

- (BOOL)containsListenType:(id)a3
{
  id v4 = a3;
  v5 = [(AXSDSoundDetectionController *)self currentDetectionTypes];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (void)removeAllListenTypes
{
}

- (void)startListening
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = AXLogUltron();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_opt_class();
    v5 = NSNumber;
    id v6 = v4;
    v7 = objc_msgSend(v5, "numberWithBool:", -[AXSDSoundDetectionController _hasMedinaSupport](self, "_hasMedinaSupport"));
    int v8 = 138412546;
    v9 = v4;
    __int16 v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_226F20000, v3, OS_LOG_TYPE_DEFAULT, "[%@]: Will start listening. Has Medina Support Enabled: %@", (uint8_t *)&v8, 0x16u);
  }
  [(AXSDControllerImplementation *)self->_controller startListening];
}

- (void)stopListening
{
}

- (BOOL)_hasMedinaSupport
{
  return MEMORY[0x270F09510](self, a2);
}

- (BOOL)isListening
{
  return [(AXSDControllerImplementation *)self->_controller isListening];
}

- (void)_pipedInFileUpdated
{
  id v5 = [MEMORY[0x263F21DA0] sharedInstance];
  v3 = [v5 pipedInFile];
  id v4 = [(AXSDSoundDetectionController *)self pipeInFile:v3];
}

- (id)pipeInFile:(id)a3
{
  id v4 = a3;
  if ([(AXSDControllerImplementation *)self->_controller conformsToProtocol:&unk_26DB2D3C0])
  {
    id v5 = self->_controller;
    id v11 = 0;
    id v6 = [(AXSDControllerImplementation *)v5 pipeInFilePath:v4 error:&v11];
    id v7 = v11;
    if (v7)
    {
      int v8 = AXLogUltron();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[AXSDSoundDetectionController pipeInFile:]((uint64_t)v7, v8);
      }

      id v9 = 0;
    }
    else
    {
      id v9 = v6;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (AXSDDetectorManager)detectorManager
{
  return self->_detectorManager;
}

- (void)setDetectorManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectorManager, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

- (void)pipeInFile:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226F20000, a2, OS_LOG_TYPE_ERROR, "Error while piping file. Error: %@", (uint8_t *)&v2, 0xCu);
}

@end