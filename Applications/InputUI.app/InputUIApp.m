@interface InputUIApp
- (AFUSServiceListener)autofillUIServiceListener;
- (BOOL)isServicePaused;
- (ITTInputTeletypeServer)inputTeletypeServer;
- (IUIDummyITTInputTeletypeServer)dummyInputTeletypeServer;
- (IUIRTISystemDelegateMultiplexer)systemDelegateMultiplexer;
- (IUISessionCoordinator)sessionCoordinator;
- (InputUIApp)init;
- (NSLock)servicePausedLock;
- (OS_dispatch_queue)autofillUIServiceQueue;
- (OS_dispatch_queue)sessionCoordinatorQueue;
- (RTIInputSystemDelegate)autofillUIServiceDelegate;
- (RTIInputSystemService)textInputService;
- (RTIInputSystemUIService)autofillUILaunchAngelService;
- (RTIInputSystemUIService)inputLaunchAngelService;
- (UIKeyboardUIService)keyboardUIService;
- (void)inputSystemService:(id)a3 prepareForInputSession:(id)a4 options:(id)a5;
- (void)pauseTextInputService;
- (void)resumeTextInputService;
- (void)setAutofillUILaunchAngelService:(id)a3;
- (void)setAutofillUIServiceDelegate:(id)a3;
- (void)setAutofillUIServiceQueue:(id)a3;
- (void)setDummyInputTeletypeServer:(id)a3;
- (void)setInputLaunchAngelService:(id)a3;
- (void)setInputTeletypeServer:(id)a3;
- (void)setKeyboardUIService:(id)a3;
- (void)setServicePaused:(BOOL)a3;
- (void)setSystemDelegateMultiplexer:(id)a3;
- (void)waitForSpringBoardToForegroundInputUIScene;
@end

@implementation InputUIApp

- (void)waitForSpringBoardToForegroundInputUIScene
{
  v3 = sub_1000029D8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "RTI service will pause and wait for scene to be foreground", buf, 2u);
  }

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sceneCreationSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v4 = sub_1000029D8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "RTI service is resumed", v5, 2u);
  }
}

- (void)resumeTextInputService
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = [(InputUIApp *)self servicePausedLock];
  [v3 lock];

  if ([(InputUIApp *)self isServicePaused])
  {
    v4 = sub_1000029D8();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);

    v6 = sub_1000029D8();
    v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)v10 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, v5, "resumeTextInputService", (const char *)&unk_10001A716, v10, 2u);
    }

    sceneCreationSemaphore = self->_sceneCreationSemaphore;
    if (sceneCreationSemaphore) {
      dispatch_semaphore_signal(sceneCreationSemaphore);
    }
    [(InputUIApp *)self setServicePaused:0];
  }
  v9 = [(InputUIApp *)self servicePausedLock];
  [v9 unlock];
}

- (NSLock)servicePausedLock
{
  return self->_servicePausedLock;
}

- (void)setServicePaused:(BOOL)a3
{
  self->_servicePaused = a3;
}

- (BOOL)isServicePaused
{
  return self->_servicePaused;
}

- (InputUIApp)init
{
  v46.receiver = self;
  v46.super_class = (Class)InputUIApp;
  v2 = [(InputUIApp *)&v46 init];
  if (v2)
  {
    v3 = sub_1000029D8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "InputUI is launching", buf, 2u);
    }

    v4 = (NSLock *)objc_alloc_init((Class)NSLock);
    servicePausedLock = v2->_servicePausedLock;
    v2->_servicePausedLock = v4;

    v6 = objc_alloc_init(IUIRTISystemDelegateMultiplexer);
    systemDelegateMultiplexer = v2->_systemDelegateMultiplexer;
    v2->_systemDelegateMultiplexer = v6;

    [(IUIRTISystemDelegateMultiplexer *)v2->_systemDelegateMultiplexer setContextDelegate:v2];
    uint64_t v8 = RTIInputUIServiceMachNameiOS;
    uint64_t v9 = +[RTIInputSystemUIService sharedServiceWithDomainName:RTIInputUIServiceMachNameiOS serviceName:RTIInputUIServiceName];
    inputLaunchAngelService = v2->_inputLaunchAngelService;
    v2->_inputLaunchAngelService = (RTIInputSystemUIService *)v9;

    uint64_t v11 = [(RTIInputSystemUIService *)v2->_inputLaunchAngelService rtiService];
    textInputService = v2->_textInputService;
    v2->_textInputService = (RTIInputSystemService *)v11;

    [(RTIInputSystemService *)v2->_textInputService setDelegate:v2->_systemDelegateMultiplexer];
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.InputUI.sessionCoordinator", v14);
    sessionCoordinatorQueue = v2->_sessionCoordinatorQueue;
    v2->_sessionCoordinatorQueue = (OS_dispatch_queue *)v15;

    v17 = [[IUISessionCoordinator alloc] initWithQueue:v2->_sessionCoordinatorQueue];
    sessionCoordinator = v2->_sessionCoordinator;
    v2->_sessionCoordinator = v17;

    [(IUIRTISystemDelegateMultiplexer *)v2->_systemDelegateMultiplexer setPrimaryDelegate:v2->_sessionCoordinator];
    [(InputUIApp *)v2 pauseTextInputService];
    [(RTIInputSystemService *)v2->_textInputService setEnabled:1];
    Class v19 = NSClassFromString(@"UIKeyboardUIService");
    if (v19)
    {
      uint64_t v20 = [(objc_class *)v19 sharedService];
      keyboardUIService = v2->_keyboardUIService;
      v2->_keyboardUIService = (UIKeyboardUIService *)v20;
    }
    if (objc_opt_class())
    {
      uint64_t v22 = +[ITTInputTeletypeServer sharedServer];
      inputTeletypeServer = v2->_inputTeletypeServer;
      v2->_inputTeletypeServer = (ITTInputTeletypeServer *)v22;
    }
    if (!v2->_inputTeletypeServer)
    {
      uint64_t v24 = +[IUIDummyITTInputTeletypeServer sharedServer];
      dummyInputTeletypeServer = v2->_dummyInputTeletypeServer;
      v2->_dummyInputTeletypeServer = (IUIDummyITTInputTeletypeServer *)v24;
    }
    if ((+[UIKeyboard inputUIOOP] & 1) == 0
      && +[UIKeyboard supportsAutoFillPanel])
    {
      uint64_t v26 = +[RTIInputSystemUIService sharedServiceWithDomainName:v8 serviceName:RTIServiceAutoFillName];
      autofillUILaunchAngelService = v2->_autofillUILaunchAngelService;
      v2->_autofillUILaunchAngelService = (RTIInputSystemUIService *)v26;

      uint64_t v52 = 0;
      v53 = &v52;
      uint64_t v54 = 0x2050000000;
      v28 = (void *)qword_1000293A0;
      uint64_t v55 = qword_1000293A0;
      if (!qword_1000293A0)
      {
        *(void *)buf = _NSConcreteStackBlock;
        uint64_t v48 = 3221225472;
        v49 = sub_100004460;
        v50 = &unk_10001C518;
        v51 = &v52;
        sub_1000044B0();
        Class Class = objc_getClass("AFUIServiceDelegate");
        *(void *)(v51[1] + 24) = Class;
        qword_1000293A0 = *(void *)(v51[1] + 24);
        v28 = (void *)v53[3];
      }
      v30 = v28;
      _Block_object_dispose(&v52, 8);
      v31 = (RTIInputSystemDelegate *)objc_alloc_init(v30);
      autofillUIServiceDelegate = v2->_autofillUIServiceDelegate;
      v2->_autofillUIServiceDelegate = v31;

      v33 = v2->_autofillUIServiceDelegate;
      v34 = [(RTIInputSystemUIService *)v2->_autofillUILaunchAngelService rtiService];
      [v34 setDelegate:v33];

      v35 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      dispatch_queue_t v36 = dispatch_queue_create("com.apple.inputservice.AutoFillUIService", v35);
      [(InputUIApp *)v2 setAutofillUIServiceQueue:v36];

      uint64_t v52 = 0;
      v53 = &v52;
      uint64_t v54 = 0x2050000000;
      v37 = (void *)qword_1000293B0;
      uint64_t v55 = qword_1000293B0;
      if (!qword_1000293B0)
      {
        *(void *)buf = _NSConcreteStackBlock;
        uint64_t v48 = 3221225472;
        v49 = sub_1000045F4;
        v50 = &unk_10001C518;
        v51 = &v52;
        sub_1000044B0();
        Class v38 = objc_getClass("AFUIServiceListener");
        *(void *)(v51[1] + 24) = v38;
        qword_1000293B0 = *(void *)(v51[1] + 24);
        v37 = (void *)v53[3];
      }
      v39 = v37;
      _Block_object_dispose(&v52, 8);
      id v40 = [v39 alloc];
      v41 = [(InputUIApp *)v2 autofillUIServiceQueue];
      v42 = (AFUSServiceListener *)[v40 initDefaultServiceWithServiceQueue:v41];
      autofillUIServiceListener = v2->_autofillUIServiceListener;
      v2->_autofillUIServiceListener = v42;

      v44 = [(RTIInputSystemUIService *)v2->_autofillUILaunchAngelService rtiService];
      [v44 setEnabled:1];
    }
  }
  return v2;
}

- (void)pauseTextInputService
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = [(InputUIApp *)self servicePausedLock];
  [v3 lock];

  if (![(InputUIApp *)self isServicePaused])
  {
    v4 = sub_1000029D8();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);

    v6 = sub_1000029D8();
    v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, v5, "pauseTextInputService", (const char *)&unk_10001A716, buf, 2u);
    }

    [(InputUIApp *)self setServicePaused:1];
    if (!self->_sceneCreationSemaphore)
    {
      uint64_t v8 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
      sceneCreationSemaphore = self->_sceneCreationSemaphore;
      self->_sceneCreationSemaphore = v8;
    }
    v10 = [(InputUIApp *)self sessionCoordinatorQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000408C;
    block[3] = &unk_10001C4F0;
    block[4] = self;
    dispatch_async(v10, block);
  }
  uint64_t v11 = [(InputUIApp *)self servicePausedLock];
  [v11 unlock];
}

- (void)inputSystemService:(id)a3 prepareForInputSession:(id)a4 options:(id)a5
{
  id v9 = a5;
  if (objc_opt_respondsToSelector()) {
    id v5 = [v9 enhancedWindowingModeEnabled];
  }
  else {
    id v5 = 0;
  }
  v6 = [NSClassFromString(@"_UIKeyboardArbiterClientInputUIHost") performSelector:"automaticSharedArbiterClient"];
  if (objc_opt_respondsToSelector())
  {
    v7 = [v6 performSelector:"presentationModeManager"];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = +[NSNumber numberWithBool:v5];
      [v7 performSelector:"_enhancedWindowingModeEnabledDidChange:" withObject:v8];
    }
  }
}

- (IUIRTISystemDelegateMultiplexer)systemDelegateMultiplexer
{
  return self->_systemDelegateMultiplexer;
}

- (void)setSystemDelegateMultiplexer:(id)a3
{
}

- (RTIInputSystemService)textInputService
{
  return self->_textInputService;
}

- (IUISessionCoordinator)sessionCoordinator
{
  return self->_sessionCoordinator;
}

- (OS_dispatch_queue)sessionCoordinatorQueue
{
  return self->_sessionCoordinatorQueue;
}

- (AFUSServiceListener)autofillUIServiceListener
{
  return self->_autofillUIServiceListener;
}

- (OS_dispatch_queue)autofillUIServiceQueue
{
  return self->_autofillUIServiceQueue;
}

- (void)setAutofillUIServiceQueue:(id)a3
{
}

- (RTIInputSystemUIService)inputLaunchAngelService
{
  return self->_inputLaunchAngelService;
}

- (void)setInputLaunchAngelService:(id)a3
{
}

- (RTIInputSystemUIService)autofillUILaunchAngelService
{
  return self->_autofillUILaunchAngelService;
}

- (void)setAutofillUILaunchAngelService:(id)a3
{
}

- (RTIInputSystemDelegate)autofillUIServiceDelegate
{
  return self->_autofillUIServiceDelegate;
}

- (void)setAutofillUIServiceDelegate:(id)a3
{
}

- (UIKeyboardUIService)keyboardUIService
{
  return self->_keyboardUIService;
}

- (void)setKeyboardUIService:(id)a3
{
}

- (ITTInputTeletypeServer)inputTeletypeServer
{
  return self->_inputTeletypeServer;
}

- (void)setInputTeletypeServer:(id)a3
{
}

- (IUIDummyITTInputTeletypeServer)dummyInputTeletypeServer
{
  return self->_dummyInputTeletypeServer;
}

- (void)setDummyInputTeletypeServer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dummyInputTeletypeServer, 0);
  objc_storeStrong((id *)&self->_inputTeletypeServer, 0);
  objc_storeStrong((id *)&self->_keyboardUIService, 0);
  objc_storeStrong((id *)&self->_autofillUIServiceDelegate, 0);
  objc_storeStrong((id *)&self->_autofillUILaunchAngelService, 0);
  objc_storeStrong((id *)&self->_inputLaunchAngelService, 0);
  objc_storeStrong((id *)&self->_autofillUIServiceQueue, 0);
  objc_storeStrong((id *)&self->_autofillUIServiceListener, 0);
  objc_storeStrong((id *)&self->_servicePausedLock, 0);
  objc_storeStrong((id *)&self->_sessionCoordinatorQueue, 0);
  objc_storeStrong((id *)&self->_sessionCoordinator, 0);
  objc_storeStrong((id *)&self->_textInputService, 0);
  objc_storeStrong((id *)&self->_systemDelegateMultiplexer, 0);
  objc_storeStrong((id *)&self->_sceneCreationSemaphoreForAutofillUIService, 0);
  objc_storeStrong((id *)&self->_sceneCreationSemaphoreForAutofillAngel, 0);

  objc_storeStrong((id *)&self->_sceneCreationSemaphore, 0);
}

@end