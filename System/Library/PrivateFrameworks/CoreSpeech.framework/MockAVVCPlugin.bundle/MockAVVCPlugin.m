id MockRemotePluginXPCGetInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void v16[2];
  uint64_t v17;
  void v18[2];
  void v19[2];
  void v20[2];
  void v21[2];
  void v22[2];
  uint64_t vars8;

  v0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MockRemotePluginXPCProtocol];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v1 = +[NSArray arrayWithObjects:v22 count:2];
  v2 = +[NSSet setWithArray:v1];
  [v0 setClasses:v2 forSelector:"createMockRemoteDeviceWithName:deviceID:completion:" argumentIndex:0 ofReply:0];

  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v3 = +[NSArray arrayWithObjects:v21 count:2];
  v4 = +[NSSet setWithArray:v3];
  [v0 setClasses:v4 forSelector:"createMockRemoteDeviceWithName:deviceID:completion:" argumentIndex:1 ofReply:0];

  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v5 = +[NSArray arrayWithObjects:v20 count:2];
  v6 = +[NSSet setWithArray:v5];
  [v0 setClasses:v6 forSelector:"createMockRemoteDeviceWithName:deviceID:completion:" argumentIndex:1 ofReply:1];

  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v7 = +[NSArray arrayWithObjects:v19 count:2];
  v8 = +[NSSet setWithArray:v7];
  [v0 setClasses:v8 forSelector:"injectAudio:toDeviceWithUUID:completion:" argumentIndex:0 ofReply:0];

  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  v9 = +[NSArray arrayWithObjects:v18 count:2];
  v10 = +[NSSet setWithArray:v9];
  [v0 setClasses:v10 forSelector:"injectAudio:toDeviceWithUUID:completion:" argumentIndex:1 ofReply:0];

  v17 = objc_opt_class();
  v11 = +[NSArray arrayWithObjects:&v17 count:1];
  v12 = +[NSSet setWithArray:v11];
  [v0 setClasses:v12 forSelector:"disconnectDeviceWithUUID:completion:" argumentIndex:0 ofReply:0];

  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  v13 = +[NSArray arrayWithObjects:v16 count:2];
  v14 = +[NSSet setWithArray:](NSSet, "setWithArray:", v13, v16[0]);
  [v0 setClasses:v14 forSelector:"listMockRemoteDeviecesWithCompletion:" argumentIndex:0 ofReply:1];

  return v0;
}

id sub_299C(uint64_t a1)
{
  [*(id *)(a1 + 32) setPlugin:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  return [v2 publishDevice:v3];
}

void sub_2A74(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) deviceDictionary];
  uint64_t v3 = *(void **)(a1 + 40);
  v4 = [v3 deviceUUID];
  [v2 setObject:v3 forKey:v4];

  id v5 = [*(id *)(a1 + 32) delegate];
  [v5 inputPlugin:*(void *)(a1 + 32) didPublishDevice:*(void *)(a1 + 40)];
}

void sub_2BC4(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "deviceDictionary", 0);
  v2 = [v1 allKeys];

  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) invalidate];
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void sub_2F7C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) deviceDictionary];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) deviceDictionary];
    id v4 = [v3 objectForKey:*(void *)(a1 + 40)];

    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 32) deviceDictionary];
      v6 = [v5 objectForKey:*(void *)(a1 + 40)];

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v16 = 0x2020000000;
      uint64_t v17 = 0;
      uint64_t v7 = *(void *)(a1 + 48);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_31F0;
      v14[3] = &unk_8308;
      v14[4] = &buf;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_3200;
      v11[3] = &unk_8330;
      v11[4] = *(void *)(a1 + 32);
      p_long long buf = &buf;
      id v12 = *(id *)(a1 + 56);
      [v6 speakAudio:v7 playbackStarted:v14 completion:v11];

      _Block_object_dispose(&buf, 8);
LABEL_8:

      return;
    }
  }
  long long v8 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_error_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Can't find device with uuid %@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9)
  {
    v6 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
    (*(void (**)(uint64_t, void, void *, void, void))(v9 + 16))(v9, 0, v6, 0, 0);
    goto LABEL_8;
  }
}

void sub_31D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_31F0(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t sub_3200(void *a1, uint64_t a2)
{
  id v4 = *(NSObject **)(a1[4] + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1[6] + 8) + 24);
    int v7 = 134218240;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = a2;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Device speak audio with startTime = %llu, stopTime = %llu", (uint8_t *)&v7, 0x16u);
  }
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void, void, uint64_t))(result + 16))(result, 1, 0, *(void *)(*(void *)(a1[6] + 8) + 24), a2);
  }
  return result;
}

void sub_34BC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) deviceDictionary];
  if (!v2) {
    goto LABEL_8;
  }
  id v3 = (void *)v2;
  id v4 = [*(id *)(a1 + 32) deviceDictionary];
  uint64_t v5 = [v4 objectForKey:*(void *)(a1 + 40)];

  if (v5)
  {
    v6 = [*(id *)(a1 + 32) deviceDictionary];
    id v14 = [v6 objectForKey:*(void *)(a1 + 40)];

    int v7 = [*(id *)(a1 + 32) delegate];
    [v7 inputPlugin:*(void *)(a1 + 32) didUnpublishDevice:v14];

    [v14 invalidate];
    uint64_t v8 = [*(id *)(a1 + 32) deviceDictionary];
    [v8 removeObjectForKey:*(void *)(a1 + 40)];

    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, uint64_t, void))(v9 + 16))(v9, 1, 0);
    }
  }
  else
  {
LABEL_8:
    uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v16 = v11;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "deviceUUID %@ not existing in deviceDictionary, already disconnected", buf, 0xCu);
    }
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12)
    {
      v13 = +[NSError errorWithDomain:CSErrorDomain code:1651 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
    }
  }
}

uint64_t sub_3848(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_3858(uint64_t a1)
{
}

void sub_3860(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) deviceDictionary];
  uint64_t v2 = [v5 allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t sub_3BF0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_3C08(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "CSMockRemotePluginServices Interrupted", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_3C80(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "CSMockRemotePluginServices Invalidated", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_3FE0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_3FF8(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "CSMockRemotePluginServices Interrupted", v5, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = +[NSError errorWithDomain:CSErrorDomain code:1653 userInfo:0];
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
}

void sub_40A4(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "CSMockRemotePluginServices Invalidated", v5, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = +[NSError errorWithDomain:CSErrorDomain code:1652 userInfo:0];
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
}

uint64_t sub_446C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_4484(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "CSMockRemotePluginServices Interrupted", v5, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = +[NSError errorWithDomain:CSErrorDomain code:1653 userInfo:0];
  (*(void (**)(uint64_t, void, void *, void, void))(v3 + 16))(v3, 0, v4, 0, 0);
}

void sub_4538(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "CSMockRemotePluginServices Invalidated", v5, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = +[NSError errorWithDomain:CSErrorDomain code:1652 userInfo:0];
  (*(void (**)(uint64_t, void, void *, void, void))(v3 + 16))(v3, 0, v4, 0, 0);
}

uint64_t sub_4910(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_4928(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "CSMockRemotePluginServices Interrupted", v5, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = +[NSError errorWithDomain:CSErrorDomain code:1653 userInfo:0];
  (*(void (**)(uint64_t, void, void *, void))(v3 + 16))(v3, 0, v4, 0);
}

void sub_49D8(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "CSMockRemotePluginServices Invalidated", v5, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = +[NSError errorWithDomain:CSErrorDomain code:1652 userInfo:0];
  (*(void (**)(uint64_t, void, void *, void))(v3 + 16))(v3, 0, v4, 0);
}

uint64_t sub_4FB0(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsRecording:0];
  uint64_t v2 = [*(id *)(a1 + 32) audioFeedTimer];
  dispatch_source_cancel(v2);

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void sub_511C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _readAudioBufferAndFeed];
}

uint64_t sub_51F4(uint64_t a1)
{
  [*(id *)(a1 + 32) _startAudioFeedingTimer];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

OSStatus AudioFileClose(AudioFileID inAudioFile)
{
  return _AudioFileClose(inAudioFile);
}

OSStatus AudioFileGetProperty(AudioFileID inAudioFile, AudioFilePropertyID inPropertyID, UInt32 *ioDataSize, void *outPropertyData)
{
  return _AudioFileGetProperty(inAudioFile, inPropertyID, ioDataSize, outPropertyData);
}

OSStatus AudioFileOpenURL(CFURLRef inFileRef, AudioFilePermissions inPermissions, AudioFileTypeID inFileTypeHint, AudioFileID *outAudioFile)
{
  return _AudioFileOpenURL(inFileRef, inPermissions, inFileTypeHint, outAudioFile);
}

OSStatus AudioFileReadPacketData(AudioFileID inAudioFile, Boolean inUseCache, UInt32 *ioNumBytes, AudioStreamPacketDescription *outPacketDescriptions, SInt64 inStartingPacket, UInt32 *ioNumPackets, void *outBuffer)
{
  return _AudioFileReadPacketData(inAudioFile, inUseCache, ioNumBytes, outPacketDescriptions, inStartingPacket, ioNumPackets, outBuffer);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__readAudioBufferAndFeed(void *a1, const char *a2, ...)
{
  return [a1 _readAudioBufferAndFeed];
}

id objc_msgSend__startAudioFeedingTimer(void *a1, const char *a2, ...)
{
  return [a1 _startAudioFeedingTimer];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_audioFeedTimer(void *a1, const char *a2, ...)
{
  return [a1 audioFeedTimer];
}

id objc_msgSend_audioInputBlock(void *a1, const char *a2, ...)
{
  return [a1 audioInputBlock];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceDictionary(void *a1, const char *a2, ...)
{
  return [a1 deviceDictionary];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return [a1 deviceName];
}

id objc_msgSend_deviceUUID(void *a1, const char *a2, ...)
{
  return [a1 deviceUUID];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_getMockRemotePluginXPCConnection(void *a1, const char *a2, ...)
{
  return [a1 getMockRemotePluginXPCConnection];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_listen(void *a1, const char *a2, ...)
{
  return [a1 listen];
}

id objc_msgSend_opusAudioFormat(void *a1, const char *a2, ...)
{
  return [a1 opusAudioFormat];
}

id objc_msgSend_packetDescriptions(void *a1, const char *a2, ...)
{
  return [a1 packetDescriptions];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}