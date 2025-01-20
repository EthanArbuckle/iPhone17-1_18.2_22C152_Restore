uint64_t start(int a1, char **a2)
{
  void *v4;
  uint64_t v5;

  setenv("MTL_TRACING_ENABLE_RESOURCE_RESOLUTION", "1", 1);
  v5 = UIApplicationMain(a1, a2, 0, @"MRAppDelegateiOS");
  return v5;
}

void sub_100001CE0(id a1)
{
  qword_10000D420 = objc_opt_new();

  _objc_release_x1();
}

void sub_100001E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1000020B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000021E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1000029CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id location,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  objc_destroyWeak(v45);
  objc_destroyWeak((id *)(v46 - 200));

  _Unwind_Resume(a1);
}

void sub_100002BB4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(void **)(a1 + 32);
  id v10 = WeakRetained;
  v4 = [WeakRetained shaderProfiler];
  v5 = [v3 startShaderProfiler:v4];

  [v5 waitUntilResolved];
  v6 = [*(id *)(a1 + 40) transport];
  id v7 = [*(id *)(a1 + 48) kind];
  v8 = [v5 result];
  v9 = +[DYTransportMessage messageWithKind:v7 plistPayload:v8];
  [v6 send:v9 inReplyTo:*(void *)(a1 + 48) error:0];
}

void sub_100002CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100002CFC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002D0C(uint64_t a1)
{
}

void sub_100002D14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(void **)(a1 + 32);
  v4 = [WeakRetained shaderProfiler];
  v5 = [v3 batchedCounterDataForShaderProfiler:v4];

  v6 = dispatch_get_global_queue(0, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100002E34;
  v8[3] = &unk_100008338;
  id v9 = v5;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v7 = v5;
  [v7 notifyOnQueue:v6 handler:v8];
}

void sub_100002E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100002E34(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) result];
  [v4 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKeyedSubscript:kDYBatchFilteredCounterProgress];
  v2 = [*(id *)(a1 + 40) transport];
  v3 = +[DYTransportMessage messageWithKind:4123 plistPayload:v4];
  [v2 send:v3 inReplyTo:0 error:0];
}

void sub_100002EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_100002F14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(void **)(a1 + 32);
  id v4 = [WeakRetained shaderProfiler];
  v5 = [*(id *)(a1 + 40) objectPayload];
  v6 = [v5 objectForKeyedSubscript:@"highPriorityBatches"];
  id v7 = [v3 batchedCounterDataForShaderProfiler:v4 forHighPriorityBatches:v6];

  v8 = dispatch_get_global_queue(0, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000030A4;
  v12[3] = &unk_100008388;
  int8x16_t v11 = *(int8x16_t *)(a1 + 40);
  id v9 = (id)v11.i64[0];
  int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
  id v14 = v7;
  id v10 = v7;
  [v10 notifyOnQueue:v8 handler:v12];
}

void sub_100003058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1000030A4(id *a1)
{
  id v5 = [a1[4] transport];
  id v2 = [a1[5] kind];
  v3 = [a1[6] result];
  id v4 = +[DYTransportMessage messageWithKind:v2 plistPayload:v3];
  [v5 send:v4 inReplyTo:a1[5] error:0];
}

void sub_100003150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000317C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(void **)(a1 + 32);
  id v10 = WeakRetained;
  id v4 = [WeakRetained shaderProfiler];
  id v5 = [v3 derivedCounterDataForFrameProfiler:v4];

  [v5 waitUntilResolved];
  v6 = [*(id *)(a1 + 40) transport];
  id v7 = [*(id *)(a1 + 48) kind];
  v8 = [v5 result];
  id v9 = +[DYTransportMessage messageWithKind:v7 plistPayload:v8];
  [v6 send:v9 inReplyTo:*(void *)(a1 + 48) error:0];
}

void sub_100003274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100003480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000034B8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) strongDelegate];
  [v2 setViewController:*(void *)(a1 + 40)];

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = 0;
}

void sub_100003518(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003528(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v2)
  {
    id v9 = [v2 view];
    [v9 setImage:*(void *)(a1 + 40)];
  }
  else
  {
    id v3 = objc_alloc_init((Class)UIViewController);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    id v9 = [objc_alloc((Class)UIImageView) initWithImage:*(void *)(a1 + 40)];
    v6 = +[UIColor blackColor];
    [v9 setBackgroundColor:v6];

    id v7 = +[UIScreen mainScreen];
    [v7 bounds];
    [v9 setFrame:];

    [v9 setContentMode:1];
    [*(id *)(*(void *)(a1 + 32) + 8) setView:v9];
    v8 = [*(id *)(a1 + 32) strongDelegate];
    [v8 setViewController:*(void *)(*(void *)(a1 + 32) + 8)];
  }
}

void sub_100003650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000391C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100003998(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 archiveStack];
  uint64_t v4 = [v2 _replayerControllerSupportForCaptureStore:v3];
  [*(id *)(a1 + 32) setReplayControllerSupport:v4];

  id v5 = [*(id *)(a1 + 32) replayControllerSupport];
  v6 = [*(id *)(a1 + 32) archiveStack];
  id v7 = [v5 createDebugPlaybackEngineWithCaptureStore:v6];
  [*(id *)(a1 + 32) setPlaybackEngine:v7];

  v8 = *(void **)(a1 + 32);

  return [v8 _displayPlaybackEngine];
}

void sub_100003A5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003DF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_10000404C((uint64_t)&a9);

  _Unwind_Resume(a1);
}

uint64_t sub_100003F80(uint64_t a1, int a2, char a3)
{
  *(void *)(a1 + 8) = +[CATransaction animationTimingFunction];
  +[CATransaction animationDuration];
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = +[CATransaction disableActions];
  *(unsigned char *)(a1 + 33) = a3;
  id v7 = +[CATransaction completionBlock];
  id v8 = [v7 copy];
  id v9 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v8;

  if (a2) {
    +[CATransaction setDisableActions:1];
  }
  return a1;
}

void sub_10000401C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000404C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 33)) {
    +[CATransaction flush];
  }
  id v2 = *(id *)(a1 + 8);
  +[CATransaction setAnimationTimingFunction:v2];

  +[CATransaction setAnimationDuration:*(double *)(a1 + 16)];
  +[CATransaction setCompletionBlock:*(void *)(a1 + 24)];
  +[CATransaction setDisableActions:*(unsigned __int8 *)(a1 + 32)];

  return a1;
}

void sub_1000040E4(void *a1)
{
}

void sub_100004140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MRAppDelegate;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1000043A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return _CGColorCreate(space, components);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

uint64_t DYGetGLInterposeDylibPath()
{
  return _DYGetGLInterposeDylibPath();
}

uint64_t DYGetMTLInterposeDylibPath()
{
  return _DYGetMTLInterposeDylibPath();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _DYOLog()
{
  return __DYOLog();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dlclose(void *__handle)
{
  return _dlclose(__handle);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

uint64_t dy_abort()
{
  return _dy_abort();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int pthread_main_np(void)
{
  return _pthread_main_np();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
}

id objc_msgSend__closeInterposeDylib(void *a1, const char *a2, ...)
{
  return [a1 _closeInterposeDylib];
}

id objc_msgSend_animationDuration(void *a1, const char *a2, ...)
{
  return [a1 animationDuration];
}

id objc_msgSend_animationTimingFunction(void *a1, const char *a2, ...)
{
  return [a1 animationTimingFunction];
}

id objc_msgSend_archiveStack(void *a1, const char *a2, ...)
{
  return [a1 archiveStack];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return [a1 clear];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return [a1 completionBlock];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_disableActions(void *a1, const char *a2, ...)
{
  return [a1 disableActions];
}

id objc_msgSend_empty(void *a1, const char *a2, ...)
{
  return [a1 empty];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return [a1 environment];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return [a1 flush];
}

id objc_msgSend_informReady(void *a1, const char *a2, ...)
{
  return [a1 informReady];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return [a1 kind];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_objectPayload(void *a1, const char *a2, ...)
{
  return [a1 objectPayload];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_playbackEngine(void *a1, const char *a2, ...)
{
  return [a1 playbackEngine];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_profileBlockBackgroundQueue(void *a1, const char *a2, ...)
{
  return [a1 profileBlockBackgroundQueue];
}

id objc_msgSend_profileBlockQueue(void *a1, const char *a2, ...)
{
  return [a1 profileBlockQueue];
}

id objc_msgSend_profileInfo(void *a1, const char *a2, ...)
{
  return [a1 profileInfo];
}

id objc_msgSend_replayControllerSupport(void *a1, const char *a2, ...)
{
  return [a1 replayControllerSupport];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_shaderProfiler(void *a1, const char *a2, ...)
{
  return [a1 shaderProfiler];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return [a1 sharedController];
}

id objc_msgSend_sharedExtensionRegistry(void *a1, const char *a2, ...)
{
  return [a1 sharedExtensionRegistry];
}

id objc_msgSend_shouldCreateViewController(void *a1, const char *a2, ...)
{
  return [a1 shouldCreateViewController];
}

id objc_msgSend_strongDelegate(void *a1, const char *a2, ...)
{
  return [a1 strongDelegate];
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return [a1 transport];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_waitUntilResolved(void *a1, const char *a2, ...)
{
  return [a1 waitUntilResolved];
}