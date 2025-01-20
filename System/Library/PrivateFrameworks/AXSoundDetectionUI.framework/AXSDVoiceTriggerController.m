@interface AXSDVoiceTriggerController
+ (id)sharedInstance;
- (AXSDVoiceTriggerController)init;
- (BOOL)_hasMedinaSupport;
- (void)pauseListening;
- (void)postEventToSystemWithSoundActionEvent:(int64_t)a3;
- (void)resumeListening;
- (void)startListening;
- (void)startListeningInPracticeSession;
- (void)startListeningOnQueue:(id)a3;
- (void)stopListening;
@end

@implementation AXSDVoiceTriggerController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance___SharedController_1;
  return v2;
}

uint64_t __44__AXSDVoiceTriggerController_sharedInstance__block_invoke()
{
  sharedInstance___SharedController_1 = objc_alloc_init(AXSDVoiceTriggerController);
  return MEMORY[0x270F9A758]();
}

- (AXSDVoiceTriggerController)init
{
  v8.receiver = self;
  v8.super_class = (Class)AXSDVoiceTriggerController;
  v2 = [(AXSDVoiceTriggerController *)&v8 init];
  if (v2)
  {
    int v3 = AXIsSoundDetectionMedinaSupportEnabled();
    v4 = off_2647F46C8;
    if (!v3) {
      v4 = off_2647F46C0;
    }
    v5 = (_TtP18AXSoundDetectionUI26AXSDSoundActionsController_ *)objc_alloc_init(*v4);
    controller = v2->_controller;
    v2->_controller = v5;

    [(AXSDSoundActionsController *)v2->_controller setDelegate:v2];
  }
  return v2;
}

- (void)startListening
{
}

- (void)startListeningOnQueue:(id)a3
{
}

- (void)startListeningInPracticeSession
{
  if (AXIsSoundDetectionMedinaSupportEnabled())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(AXSDSoundActionsController *)self->_controller stopListening];
      controller = self->_controller;
      self->_controller = 0;

      v4 = objc_alloc_init(_TtC18AXSoundDetectionUI30AXSANSControllerImplementation);
      v5 = self->_controller;
      self->_controller = (_TtP18AXSoundDetectionUI26AXSDSoundActionsController_ *)v4;

      [(AXSDSoundActionsController *)self->_controller setDelegate:self];
    }
  }
  v6 = self->_controller;
  [(AXSDSoundActionsController *)v6 startListening];
}

- (void)resumeListening
{
}

- (void)pauseListening
{
}

- (void)stopListening
{
  [(AXSDSoundActionsController *)self->_controller stopListening];
  if (AXIsSoundDetectionMedinaSupportEnabled())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      controller = self->_controller;
      self->_controller = 0;

      v4 = objc_alloc_init(_TtC18AXSoundDetectionUI34AXSASecureControllerImplementation);
      v5 = self->_controller;
      self->_controller = (_TtP18AXSoundDetectionUI26AXSDSoundActionsController_ *)v4;

      v6 = self->_controller;
      [(AXSDSoundActionsController *)v6 setDelegate:self];
    }
  }
}

- (BOOL)_hasMedinaSupport
{
  return MEMORY[0x270F09510](self, a2);
}

- (void)postEventToSystemWithSoundActionEvent:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = AXLogSoundActions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    id v5 = *(id *)&buf[4];
    _os_log_impl(&dword_226F20000, v4, OS_LOG_TYPE_DEFAULT, "[%@]: posting voice trigger event to system: %ld", buf, 0x16u);
  }
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v6 = (void *)getAXEventRepresentationClass_softClass;
  uint64_t v15 = getAXEventRepresentationClass_softClass;
  if (!getAXEventRepresentationClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getAXEventRepresentationClass_block_invoke;
    v17 = &unk_2647F4778;
    v18 = &v12;
    __getAXEventRepresentationClass_block_invoke((uint64_t)buf);
    v6 = (void *)v13[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);
  objc_super v8 = objc_msgSend(v7, "accessibilityEventRepresentationWithSender:usagePage:usage:", 4, 3, a3, v12);
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v9 = (void *)getAXEventTapManagerClass_softClass;
  uint64_t v15 = getAXEventTapManagerClass_softClass;
  if (!getAXEventTapManagerClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getAXEventTapManagerClass_block_invoke;
    v17 = &unk_2647F4778;
    v18 = &v12;
    __getAXEventTapManagerClass_block_invoke((uint64_t)buf);
    v9 = (void *)v13[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v12, 8);
  v11 = objc_msgSend(v10, "sharedManager", v12);
  [v11 sendHIDSystemEvent:v8 senderID:0x8000000817319383];
}

- (void).cxx_destruct
{
}

@end