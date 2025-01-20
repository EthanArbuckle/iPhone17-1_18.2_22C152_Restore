void sub_1000035F4(id a1)
{
  void *v1;
  id v2;
  uint64_t vars8;

  v2 = +[SPUISearchViewControllerHolder sharedInstance];
  v1 = [v2 searchViewController];
  [v1 searchViewDidPresentFromSource:1];
}

uint64_t start(int a1, char **a2)
{
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = UIApplicationMain(a1, a2, v5, v7);

  return v8;
}

void sub_100003A54(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = spuiLogHandles[3];
    if (!v4)
    {
      SPUIInitLogging();
      v4 = spuiLogHandles[3];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_1000067C4(a1, v4);
    }
    v5 = spuiLogHandles[3];
    if (!v5)
    {
      SPUIInitLogging();
      v5 = spuiLogHandles[3];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100006708(a1, v5);
    }
    id v6 = v3;
    [v6 setDistanceToTopOfIcons:*(double *)(a1 + 64)];
    [v6 setSearchHeaderLayerRenderID:*(void *)(a1 + 40)];
    [v6 setSearchHeaderContextID:*(unsigned int *)(a1 + 120)];
    [v6 setSearchHeaderBackgroundLayerRenderID:*(void *)(a1 + 48)];
    [v6 setSearchHeaderBackgroundContextID:*(unsigned int *)(a1 + 124)];
    [v6 setKeyboardHeight:*(double *)(a1 + 56)];
    [*(id *)(a1 + 32) keyboardProtectorHeight];
    double v8 = v7;
    double v9 = *(double *)(a1 + 56);
    int v10 = *(unsigned __int8 *)(a1 + 132);
    if (*(unsigned char *)(a1 + 133))
    {
      [v6 setKeyboardPresented:*(unsigned __int8 *)(a1 + 134)];
      if (v10 && !*(unsigned char *)(a1 + 134)) {
        goto LABEL_14;
      }
    }
    else if (*(unsigned char *)(a1 + 132))
    {
      goto LABEL_14;
    }
    [v6 setKeyboardProtectorHeight:v8 + v9];
LABEL_14:
    [v6 setSearchBarSize:*(double *)(a1 + 72), *(double *)(a1 + 80)];
    [v6 setDockedSearchBarSize:*(double *)(a1 + 88), *(double *)(a1 + 96)];
    [v6 setSearchBarCornerRadius:*(double *)(a1 + 104)];
    [v6 setSearchHeaderBlurContextID:*(unsigned int *)(a1 + 128)];
    [v6 setSearchHeaderBlurLayerRenderID:*(void *)(a1 + 112)];
  }
}

uint64_t sub_100004A6C(uint64_t a1)
{
  qword_1000126A0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100004C44(id a1)
{
  v1 = spuiLogHandles[0];
  if (!spuiLogHandles[0])
  {
    SPUIInitLogging();
    v1 = spuiLogHandles[0];
  }
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_10000658C(v1);
  }
}

void sub_10000511C(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setHeaderHeight:*(double *)(a1 + 32)];
  }
}

FBSSceneTransitionContext *__cdecl sub_100005364(id a1, FBSMutableSceneClientSettings *a2)
{
  v2 = objc_opt_new();
  [v2 setSearchBarDidFocus:1];

  return (FBSSceneTransitionContext *)v2;
}

void sub_1000055BC(id a1)
{
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v2 = dispatch_queue_create("restorationQueue", v1);
  id v3 = (void *)qword_100012698;
  qword_100012698 = (uint64_t)v2;
}

void sub_100005744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000575C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000576C(uint64_t a1)
{
}

void sub_100005774(uint64_t a1)
{
  dispatch_queue_t v2 = [*(id *)(a1 + 40) restorationUrl];
  id v15 = 0;
  uint64_t v3 = +[NSData dataWithContentsOfURL:v2 options:0 error:&v15];
  id v4 = v15;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  double v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v14 = 0;
  uint64_t v8 = [v7 decompressedDataUsingAlgorithm:0 error:&v14];
  id v9 = v14;
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;

  if (!v4) {
    goto LABEL_5;
  }
  v12 = spuiLogHandles[5];
  if (!v12)
  {
    SPUIInitLogging();
    v12 = spuiLogHandles[5];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    sub_100006638();
    if (!v9) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_5:
    if (!v9) {
      goto LABEL_10;
    }
  }
  v13 = spuiLogHandles[5];
  if (!v13)
  {
    SPUIInitLogging();
    v13 = spuiLogHandles[5];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1000065D0();
  }
LABEL_10:
}

void sub_10000597C(uint64_t a1)
{
  dispatch_queue_t v2 = +[NSFileManager defaultManager];
  uint64_t v3 = [*(id *)(a1 + 40) restorationUrl];
  id v4 = [v3 path];
  unsigned __int8 v5 = [v2 fileExistsAtPath:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = +[NSFileManager defaultManager];
    double v7 = [*(id *)(a1 + 40) restorationUrl];
    uint64_t v8 = [v7 path];
    id v9 = objc_opt_new();
    [v6 createFileAtPath:v8 contents:v9 attributes:0];
  }
  id v10 = *(id *)(a1 + 32);
  if ([*(id *)(a1 + 32) length])
  {
    v11 = *(void **)(a1 + 32);
    id v17 = 0;
    v12 = [v11 compressedDataUsingAlgorithm:0 error:&v17];
    id v13 = v17;

    if (v13)
    {
      id v14 = spuiLogHandles[5];
      if (!v14)
      {
        SPUIInitLogging();
        id v14 = spuiLogHandles[5];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000066A0();
      }
      uint64_t v15 = objc_opt_new();

      v12 = (void *)v15;
    }

    id v10 = v12;
  }
  v16 = [*(id *)(a1 + 40) restorationUrl];
  [v10 writeToURL:v16 atomically:0];
}

id sub_100005B40(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) searchViewController];
  [v1 purgeMemory];

  return +[SPUIMediaUtilities purgeMemory];
}

FBSSceneTransitionContext *__cdecl sub_100005CF8(id a1, FBSMutableSceneClientSettings *a2)
{
  dispatch_queue_t v2 = objc_opt_new();
  [v2 setShouldBackground:1];

  return (FBSSceneTransitionContext *)v2;
}

FBSSceneTransitionContext *__cdecl sub_100005DA8(id a1, FBSMutableSceneClientSettings *a2)
{
  dispatch_queue_t v2 = objc_opt_new();
  [v2 setShouldDismiss:1];

  return (FBSSceneTransitionContext *)v2;
}

void sub_100005E88(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_100005F20()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100006344(v0, qword_100012740);
  sub_100005FA4(v0, (uint64_t)qword_100012740);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100005FA4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static SPUIMediaUtilities.purgeMemory()()
{
  return static SiriAudioAppPredictor.unsafeReleaseModel(completion:)();
}

id SPUIMediaUtilities.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id SPUIMediaUtilities.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SPUIMediaUtilities();
  return [super init];
}

id SPUIMediaUtilities.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SPUIMediaUtilities();
  return [super dealloc];
}

uint64_t sub_100006144(char a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  unsigned __int8 v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000126B0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_100005FA4(v2, (uint64_t)qword_100012740);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  double v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 67109120;
    v11[1] = a1 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "SiriAudioAppPredictor released: %{BOOL}d", v9, 8u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t type metadata accessor for SPUIMediaUtilities()
{
  return self;
}

uint64_t *sub_100006344(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000063A8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000063EC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100006434()
{
  sub_1000063A8(&qword_1000125D8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1000086C0;
  uint64_t v1 = type metadata accessor for SpotlightUISharedPackage();
  uint64_t v2 = sub_1000063EC(&qword_1000125E0, (void (*)(uint64_t))&type metadata accessor for SpotlightUISharedPackage);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v2;
  uint64_t v3 = type metadata accessor for SearchUIAppIntentsPackage();
  uint64_t v4 = sub_1000063EC(&qword_1000125E8, (void (*)(uint64_t))&type metadata accessor for SearchUIAppIntentsPackage);
  *(void *)(v0 + 48) = v3;
  *(void *)(v0 + 56) = v4;
  return v0;
}

ValueMetadata *type metadata accessor for SpotlightAppPackage()
{
  return &type metadata for SpotlightAppPackage;
}

uint64_t sub_100006514()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_100006548(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Spotlight is terminating", v1, 2u);
}

void sub_10000658C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Spotlight flushed feedback on terminate", v1, 2u);
}

void sub_1000065D0()
{
  sub_100005EA4();
  sub_100005E88((void *)&_mh_execute_header, v0, v1, "failed to decompress data with error %@", v2, v3, v4, v5, v6);
}

void sub_100006638()
{
  sub_100005EA4();
  sub_100005E88((void *)&_mh_execute_header, v0, v1, "failed to get restoration data with error %@", v2, v3, v4, v5, v6);
}

void sub_1000066A0()
{
  sub_100005EA4();
  sub_100005E88((void *)&_mh_execute_header, v0, v1, "failed to compress data with error %@", v2, v3, v4, v5, v6);
}

void sub_100006708(uint64_t a1, void *a2)
{
  float v2 = *(double *)(a1 + 64);
  uint64_t v3 = a2;
  *(float *)&double v4 = v2;
  uint64_t v5 = +[NSNumber numberWithFloat:v4];
  sub_100005EA4();
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "distanceToTop %@", v6, 0xCu);
}

void sub_1000067C4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  double v4 = a2;
  uint64_t v5 = +[NSNumber numberWithUnsignedLongLong:v3];
  uint8_t v6 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 120)];
  double v7 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
  os_log_type_t v8 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 124)];
  uint64_t v9 = +[NSNumber numberWithDouble:*(double *)(a1 + 56)];
  int v10 = 138413314;
  v11 = v5;
  __int16 v12 = 2112;
  id v13 = v6;
  __int16 v14 = 2112;
  uint64_t v15 = v7;
  __int16 v16 = 2112;
  id v17 = v8;
  __int16 v18 = 2112;
  v19 = v9;
  _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Header Setting renderID: %@, contextID: %@, backgroundRenderID:%@, backgroundContextId:%@ keyboardHeight:%@", (uint8_t *)&v10, 0x34u);
}

void sub_100006918()
{
  sub_100005EA4();
  sub_100005E88((void *)&_mh_execute_header, v0, v1, "Failed to archive restoration context with error %@", v2, v3, v4, v5, v6);
}

uint64_t static SiriAudioAppPredictor.unsafeReleaseModel(completion:)()
{
  return static SiriAudioAppPredictor.unsafeReleaseModel(completion:)();
}

uint64_t type metadata accessor for SiriAudioAppPredictor()
{
  return type metadata accessor for SiriAudioAppPredictor();
}

uint64_t type metadata accessor for SpotlightUISharedPackage()
{
  return type metadata accessor for SpotlightUISharedPackage();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t type metadata accessor for SearchUIAppIntentsPackage()
{
  return type metadata accessor for SearchUIAppIntentsPackage();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t CALayerGetContext()
{
  return _CALayerGetContext();
}

uint64_t CALayerGetRenderId()
{
  return _CALayerGetRenderId();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SPUIInitLogging()
{
  return _SPUIInitLogging();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

pid_t getpid(void)
{
  return _getpid();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return _proc_pid_rusage(pid, flavor, buffer);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

id objc_msgSend__FBSScene(void *a1, const char *a2, ...)
{
  return _[a1 _FBSScene];
}

id objc_msgSend__extendLaunchTest(void *a1, const char *a2, ...)
{
  return _[a1 _extendLaunchTest];
}

id objc_msgSend__registerSettingsDiffActionArray_forKey_(void *a1, const char *a2, ...)
{
  return [a1 _registerSettingsDiffActionArray:forKey:];
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return _[a1 _rootSheetPresentationController];
}

id objc_msgSend__scene(void *a1, const char *a2, ...)
{
  return _[a1 _scene];
}

id objc_msgSend__setKeepContextAssociationInBackground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setKeepContextAssociationInBackground:");
}

id objc_msgSend__setShouldScaleDownBehindDescendantSheets_(void *a1, const char *a2, ...)
{
  return [a1 _setShouldScaleDownBehindDescendantSheets:];
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 activeInterfaceOrientation];
}

id objc_msgSend_addMenusToBuilder_forFocusEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 addMenusToBuilder:forFocusEnvironment:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:selector:name:object:];
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return [a1 archivedDataWithRootObject:requiringSecureCoding:error:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_backgroundBlurView(void *a1, const char *a2, ...)
{
  return _[a1 backgroundBlurView];
}

id objc_msgSend_backgroundSearchScene(void *a1, const char *a2, ...)
{
  return _[a1 backgroundSearchScene];
}

id objc_msgSend_bottomSearchFieldEnabled(void *a1, const char *a2, ...)
{
  return _[a1 bottomSearchFieldEnabled];
}

id objc_msgSend_compressedDataUsingAlgorithm_error_(void *a1, const char *a2, ...)
{
  return [a1 compressedDataUsingAlgorithm:error:];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_contextId(void *a1, const char *a2, ...)
{
  return _[a1 contextId];
}

id objc_msgSend_createAdditionalHeaderView(void *a1, const char *a2, ...)
{
  return _[a1 createAdditionalHeaderView];
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return [a1 createFileAtPath:contents:attributes:];
}

id objc_msgSend_currentIntent(void *a1, const char *a2, ...)
{
  return _[a1 currentIntent];
}

id objc_msgSend_currentPresentationSource(void *a1, const char *a2, ...)
{
  return _[a1 currentPresentationSource];
}

id objc_msgSend_currentRevealProgress(void *a1, const char *a2, ...)
{
  return _[a1 currentRevealProgress];
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithContentsOfURL:options:error:];
}

id objc_msgSend_decompressedDataUsingAlgorithm_error_(void *a1, const char *a2, ...)
{
  return [a1 decompressedDataUsingAlgorithm:error:];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_didSizeWithHeight_(void *a1, const char *a2, ...)
{
  return [a1 didSizeWithHeight:];
}

id objc_msgSend_distanceToTopOfAppIcons(void *a1, const char *a2, ...)
{
  return _[a1 distanceToTopOfAppIcons];
}

id objc_msgSend_dockedUnifiedFieldSize(void *a1, const char *a2, ...)
{
  return _[a1 dockedUnifiedFieldSize];
}

id objc_msgSend_enableFloatingWindow(void *a1, const char *a2, ...)
{
  return _[a1 enableFloatingWindow];
}

id objc_msgSend_endEditing_(void *a1, const char *a2, ...)
{
  return [a1 endEditing:];
}

id objc_msgSend_feedbackListener(void *a1, const char *a2, ...)
{
  return _[a1 feedbackListener];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:];
}

id objc_msgSend_flushFeedbackWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 flushFeedbackWithCompletion:];
}

id objc_msgSend_focusSystemForEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 focusSystemForEnvironment:];
}

id objc_msgSend_focusedItem(void *a1, const char *a2, ...)
{
  return _[a1 focusedItem];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_headerHeight(void *a1, const char *a2, ...)
{
  return _[a1 headerHeight];
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return _[a1 headerView];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_initFileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 initFileURLWithPath:isDirectory:];
}

id objc_msgSend_initWithEvent_(void *a1, const char *a2, ...)
{
  return [a1 initWithEvent:];
}

id objc_msgSend_initWithNavigationController_(void *a1, const char *a2, ...)
{
  return [a1 initWithNavigationController:];
}

id objc_msgSend_initWithSearchViewController_(void *a1, const char *a2, ...)
{
  return [a1 initWithSearchViewController:];
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return [a1 initWithWindowScene:];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 interfaceOrientation];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isInHardwareKeyboardMode(void *a1, const char *a2, ...)
{
  return _[a1 isInHardwareKeyboardMode];
}

id objc_msgSend_isUnifiedFieldDocked(void *a1, const char *a2, ...)
{
  return _[a1 isUnifiedFieldDocked];
}

id objc_msgSend_keyboardProtectorHeight(void *a1, const char *a2, ...)
{
  return _[a1 keyboardProtectorHeight];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_legibilitySettings(void *a1, const char *a2, ...)
{
  return _[a1 legibilitySettings];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_makeKeyWindow(void *a1, const char *a2, ...)
{
  return _[a1 makeKeyWindow];
}

id objc_msgSend_navController(void *a1, const char *a2, ...)
{
  return _[a1 navController];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return [a1 numberWithFloat:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLongLong:];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_persistentIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 persistentIdentifier];
}

id objc_msgSend_platterViewController(void *a1, const char *a2, ...)
{
  return _[a1 platterViewController];
}

id objc_msgSend_popToRootViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return [a1 popToRootViewControllerAnimated:];
}

id objc_msgSend_postMemoryWarningAndPerformBlockIfOverInactiveLimit_(void *a1, const char *a2, ...)
{
  return [a1 postMemoryWarningAndPerformBlockIfOverInactiveLimit:];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:];
}

id objc_msgSend_presentationIntent(void *a1, const char *a2, ...)
{
  return _[a1 presentationIntent];
}

id objc_msgSend_presentationSource(void *a1, const char *a2, ...)
{
  return _[a1 presentationSource];
}

id objc_msgSend_purgeMemory(void *a1, const char *a2, ...)
{
  return _[a1 purgeMemory];
}

id objc_msgSend_releaseVisionCachedResources(void *a1, const char *a2, ...)
{
  return _[a1 releaseVisionCachedResources];
}

id objc_msgSend_restorationData(void *a1, const char *a2, ...)
{
  return _[a1 restorationData];
}

id objc_msgSend_restorationDataQueue(void *a1, const char *a2, ...)
{
  return _[a1 restorationDataQueue];
}

id objc_msgSend_restorationUrl(void *a1, const char *a2, ...)
{
  return _[a1 restorationUrl];
}

id objc_msgSend_revealProgress(void *a1, const char *a2, ...)
{
  return _[a1 revealProgress];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_runTest_options_(void *a1, const char *a2, ...)
{
  return [a1 runTest:options:];
}

id objc_msgSend_saveRestorationData_(void *a1, const char *a2, ...)
{
  return [a1 saveRestorationData:];
}

id objc_msgSend_searchBarWindow(void *a1, const char *a2, ...)
{
  return _[a1 searchBarWindow];
}

id objc_msgSend_searchField(void *a1, const char *a2, ...)
{
  return _[a1 searchField];
}

id objc_msgSend_searchProtectorLayer(void *a1, const char *a2, ...)
{
  return _[a1 searchProtectorLayer];
}

id objc_msgSend_searchViewController(void *a1, const char *a2, ...)
{
  return _[a1 searchViewController];
}

id objc_msgSend_searchViewDidDisappear_(void *a1, const char *a2, ...)
{
  return [a1 searchViewDidDisappear:];
}

id objc_msgSend_searchViewDidDismissWithReason_(void *a1, const char *a2, ...)
{
  return [a1 searchViewDidDismissWithReason:];
}

id objc_msgSend_searchViewDidPresentFromSource_(void *a1, const char *a2, ...)
{
  return [a1 searchViewDidPresentFromSource];
}

id objc_msgSend_searchViewDidUpdatePresentationProgress_(void *a1, const char *a2, ...)
{
  return [a1 searchViewDidUpdatePresentationProgress:];
}

id objc_msgSend_searchViewRestorationContext(void *a1, const char *a2, ...)
{
  return _[a1 searchViewRestorationContext];
}

id objc_msgSend_searchViewWillDismissWithReason_(void *a1, const char *a2, ...)
{
  return [a1 searchViewWillDismissWithReason:];
}

id objc_msgSend_searchViewWillPresentFromSource_(void *a1, const char *a2, ...)
{
  return [a1 searchViewWillPresentFromSource:];
}

id objc_msgSend_searchViewWindow(void *a1, const char *a2, ...)
{
  return _[a1 searchViewWindow];
}

id objc_msgSend_sendPresentationFeedback(void *a1, const char *a2, ...)
{
  return _[a1 sendPresentationFeedback];
}

id objc_msgSend_setActiveInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return [a1 setActiveInterfaceOrientation:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setCurrentIntent_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentIntent:];
}

id objc_msgSend_setCurrentPresentationSource_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentPresentationSource:];
}

id objc_msgSend_setCurrentRevealProgress_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentRevealProgress:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDelegateClass_(void *a1, const char *a2, ...)
{
  return [a1 setDelegateClass:];
}

id objc_msgSend_setDistanceToTopOfIcons_(void *a1, const char *a2, ...)
{
  return [a1 setDistanceToTopOfIcons:];
}

id objc_msgSend_setDockedSearchBarSize_(void *a1, const char *a2, ...)
{
  return [a1 setDockedSearchBarSize:];
}

id objc_msgSend_setHeaderHeight_(void *a1, const char *a2, ...)
{
  return [a1 setHeaderHeight:];
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return [a1 setHidden:];
}

id objc_msgSend_setInteractionDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setInteractionDelegate:];
}

id objc_msgSend_setKeyboardHeight_(void *a1, const char *a2, ...)
{
  return [a1 setKeyboardHeight:];
}

id objc_msgSend_setKeyboardPresented_(void *a1, const char *a2, ...)
{
  return [a1 setKeyboardPresented:];
}

id objc_msgSend_setKeyboardProtectorHeight_(void *a1, const char *a2, ...)
{
  return [a1 setKeyboardProtectorHeight:];
}

id objc_msgSend_setLegibilitySettings_(void *a1, const char *a2, ...)
{
  return [a1 setLegibilitySettings:];
}

id objc_msgSend_setNavController_(void *a1, const char *a2, ...)
{
  return [a1 setNavController:];
}

id objc_msgSend_setNavigationController_(void *a1, const char *a2, ...)
{
  return [a1 setNavigationController:];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setPlatterViewController_(void *a1, const char *a2, ...)
{
  return [a1 setPlatterViewController:];
}

id objc_msgSend_setRestorationData_(void *a1, const char *a2, ...)
{
  return [a1 setRestorationData:];
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 setRootViewController:];
}

id objc_msgSend_setSearchBarCornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 setSearchBarCornerRadius:];
}

id objc_msgSend_setSearchBarDidFocus_(void *a1, const char *a2, ...)
{
  return [a1 setSearchBarDidFocus:];
}

id objc_msgSend_setSearchBarSize_(void *a1, const char *a2, ...)
{
  return [a1 setSearchBarSize:];
}

id objc_msgSend_setSearchBarWindow_(void *a1, const char *a2, ...)
{
  return [a1 setSearchBarWindow:];
}

id objc_msgSend_setSearchHeaderBackgroundContextID_(void *a1, const char *a2, ...)
{
  return [a1 setSearchHeaderBackgroundContextID:];
}

id objc_msgSend_setSearchHeaderBackgroundLayerRenderID_(void *a1, const char *a2, ...)
{
  return [a1 setSearchHeaderBackgroundLayerRenderID:];
}

id objc_msgSend_setSearchHeaderBlurContextID_(void *a1, const char *a2, ...)
{
  return [a1 setSearchHeaderBlurContextID:];
}

id objc_msgSend_setSearchHeaderBlurLayerRenderID_(void *a1, const char *a2, ...)
{
  return [a1 setSearchHeaderBlurLayerRenderID:];
}

id objc_msgSend_setSearchHeaderContextID_(void *a1, const char *a2, ...)
{
  return [a1 setSearchHeaderContextID:];
}

id objc_msgSend_setSearchHeaderLayerRenderID_(void *a1, const char *a2, ...)
{
  return [a1 setSearchHeaderLayerRenderID:];
}

id objc_msgSend_setSearchViewController_(void *a1, const char *a2, ...)
{
  return [a1 setSearchViewController:];
}

id objc_msgSend_setSearchViewWindow_(void *a1, const char *a2, ...)
{
  return [a1 setSearchViewWindow:];
}

id objc_msgSend_setShouldBackground_(void *a1, const char *a2, ...)
{
  return [a1 setShouldBackground:];
}

id objc_msgSend_setShouldDismiss_(void *a1, const char *a2, ...)
{
  return [a1 setShouldDismiss];
}

id objc_msgSend_setUnifiedFieldController_(void *a1, const char *a2, ...)
{
  return [a1 setUnifiedFieldController:];
}

id objc_msgSend_setUnifiedFieldViewController_(void *a1, const char *a2, ...)
{
  return [a1 setUnifiedFieldViewController:];
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return [a1 setView:];
}

id objc_msgSend_setWindowScene_(void *a1, const char *a2, ...)
{
  return [a1 setWindowScene:];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _[a1 settings];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_showCancelButton_animated_(void *a1, const char *a2, ...)
{
  return [a1 showCancelButton:animated:];
}

id objc_msgSend_sizeBar(void *a1, const char *a2, ...)
{
  return _[a1 sizeBar];
}

id objc_msgSend_sizeForInterfaceOrientation_inputDelegate_(void *a1, const char *a2, ...)
{
  return [a1 sizeForInterfaceOrientation:inputDelegate:];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_systemLayoutSizeFittingSize_(void *a1, const char *a2, ...)
{
  return [a1 systemLayoutSizeFittingSize:];
}

id objc_msgSend_unifiedFieldController(void *a1, const char *a2, ...)
{
  return _[a1 unifiedFieldController];
}

id objc_msgSend_unifiedFieldCornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 unifiedFieldCornerRadius];
}

id objc_msgSend_unifiedFieldSize(void *a1, const char *a2, ...)
{
  return _[a1 unifiedFieldSize];
}

id objc_msgSend_unifiedFieldViewController(void *a1, const char *a2, ...)
{
  return _[a1 unifiedFieldViewController];
}

id objc_msgSend_updateClientSettingsWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 updateClientSettingsWithBlock:];
}

id objc_msgSend_updateClientSettingsWithTransitionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateClientSettingsWithTransitionBlock:");
}

id objc_msgSend_updateSearchViewClientSceneSettings(void *a1, const char *a2, ...)
{
  return _[a1 updateSearchViewClientSceneSettings];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:atomically:];
}