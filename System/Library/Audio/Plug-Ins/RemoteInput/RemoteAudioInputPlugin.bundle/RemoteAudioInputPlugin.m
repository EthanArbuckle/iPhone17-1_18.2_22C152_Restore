void sub_3E60(id a1)
{
  uint64_t vars8;

  qword_D298 = objc_alloc_init(MRAPRecordingEndpoint);

  _objc_release_x1();
}

uint64_t sub_4068(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_4078(uint64_t a1)
{
}

void sub_4080(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 16);
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (*(void *)(*((void *)&v10 + 1) + 8 * (void)v7)) {
          [v2 addObject:(void)v10];
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v2;
}

id sub_4240(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addPointer:*(void *)(a1 + 40)];
}

void sub_42E4(uint64_t a1)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        if (*(void *)(*((void *)&v9 + 1) + 8 * i) == *(void *)(a1 + 40)) {
          uint64_t v7 = (uint64_t)i + v5;
        }
      }
      v5 += (uint64_t)v4;
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);

    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "removePointerAtIndex:", v7, (void)v9);
      [*(id *)(*(void *)(a1 + 32) + 16) compact];
    }
  }
  else
  {
  }
}

uint64_t sub_449C(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = [objc_alloc((Class)NSPointerArray) initWithOptions:5];

  return _objc_release_x1();
}

id sub_4500(uint64_t a1, void *a2)
{
  return [a2 _inputDeviceConnectedWithDeviceID:a1];
}

id sub_450C(uint64_t a1, void *a2)
{
  return [a2 _inputDeviceDisconnectedWithDeviceID:a1];
}

id sub_4518(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_voiceDataReceivedForDeviceWithID:withBuffer:time:gain:", a1, a2);
}

uint64_t sub_500C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_52E8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_52F8(uint64_t a1)
{
}

uint64_t sub_5300(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) copy];

  return _objc_release_x1();
}

void sub_5430(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

void sub_5728(uint64_t a1, void *a2)
{
  id v23 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v4 = [objc_alloc((Class)NSMutableOrderedSet) initWithArray:*(void *)(*(void *)(a1 + 32) + 8)];
  id v22 = [objc_alloc((Class)NSMutableOrderedSet) initWithArray:*(void *)(*(void *)(a1 + 32) + 8)];
  id v5 = a2;
  uint64_t v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v35 = [v5 count];
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[AudioPlugin] Loaded %lu devices", buf, 0xCu);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_5A60;
        v28[3] = &unk_8340;
        v28[4] = v12;
        id v13 = [v4 indexOfObjectPassingTest:v28];
        if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v14 = [[MRAPInputDevice alloc] initWithInputDevice:v12];
          [v23 addObject:v14];
        }
        else
        {
          [v4 removeObjectAtIndex:v13];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v9);
  }

  [v22 minusOrderedSet:v4];
  [v22 unionOrderedSet:v23];
  uint64_t v15 = [v22 array];
  uint64_t v16 = *(void *)(a1 + 32);
  v17 = *(void **)(v16 + 8);
  *(void *)(v16 + 8) = v15;

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  if (WeakRetained)
  {
    v19 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5A9C;
    block[3] = &unk_8368;
    id v20 = v4;
    uint64_t v21 = *(void *)(a1 + 32);
    id v25 = v20;
    uint64_t v26 = v21;
    id v27 = v23;
    dispatch_async(v19, block);
  }
}

BOOL sub_5A60(uint64_t a1, void *a2)
{
  unsigned int v2 = [a2 mediaRemoteDeviceID];
  return v2 == MRVirtualVoiceInputDeviceGetUniqueIdentifier();
}

void sub_5A9C(uint64_t a1)
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v6);
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
        [WeakRetained inputPlugin:*(void *)(a1 + 40) didUnpublishDevice:v7];

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v4);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = *(id *)(a1 + 48);
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v13);
        id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
        objc_msgSend(v15, "inputPlugin:didPublishDevice:", *(void *)(a1 + 40), v14, (void)v16);

        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v11);
  }
}

void sub_5D4C(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "mediaRemoteDeviceID", (void)v8) == *(_DWORD *)(a1 + 48))
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void sub_6034(int a1, NSObject *a2)
{
  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "[RecordingEndpoint] Device with ID %{public}u connected", (uint8_t *)v2, 8u);
}

void sub_60AC(int a1, NSObject *a2)
{
  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "[RecordingEndpoint] Device with ID %{public}u disconnected", (uint8_t *)v2, 8u);
}

void sub_6124(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "[AudioPluginDevice] Device started recording: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_619C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "[AudioPluginDevice] Device stopped recording: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_6214(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "[AudioPluginDevice] Warning: no audio input block set. dropping voice data buffer.", v1, 2u);
}

void sub_6258(int a1, NSObject *a2)
{
  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "[AudioPlugin] Unknown audio device with ID %{public}d", (uint8_t *)v2, 8u);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

uint64_t MRVirtualVoiceInputDeviceDescriptorCopyDefaultFormat()
{
  return _MRVirtualVoiceInputDeviceDescriptorCopyDefaultFormat();
}

uint64_t MRVirtualVoiceInputDeviceDescriptorCopySupportedFormats()
{
  return _MRVirtualVoiceInputDeviceDescriptorCopySupportedFormats();
}

uint64_t MRVirtualVoiceInputDeviceGetDescriptor()
{
  return _MRVirtualVoiceInputDeviceGetDescriptor();
}

uint64_t MRVirtualVoiceInputDeviceGetUniqueIdentifier()
{
  return _MRVirtualVoiceInputDeviceGetUniqueIdentifier();
}

uint64_t MRVirtualVoiceInputGetDevices()
{
  return _MRVirtualVoiceInputGetDevices();
}

uint64_t MRVirtualVoiceInputSetRecordingState()
{
  return _MRVirtualVoiceInputSetRecordingState();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MRLogForCategory()
{
  return __MRLogForCategory();
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

const char *__cdecl class_getName(Class cls)
{
  return _class_getName(cls);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__reloadInputDevices(void *a1, const char *a2, ...)
{
  return [a1 _reloadInputDevices];
}

id objc_msgSend__setupVoiceRecordingEndpoint(void *a1, const char *a2, ...)
{
  return [a1 _setupVoiceRecordingEndpoint];
}

id objc_msgSend__tearDownVoiceRecordingEndpoint(void *a1, const char *a2, ...)
{
  return [a1 _tearDownVoiceRecordingEndpoint];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_buffer(void *a1, const char *a2, ...)
{
  return [a1 buffer];
}

id objc_msgSend_compact(void *a1, const char *a2, ...)
{
  return [a1 compact];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_delegates(void *a1, const char *a2, ...)
{
  return [a1 delegates];
}

id objc_msgSend_mediaRemoteDeviceID(void *a1, const char *a2, ...)
{
  return [a1 mediaRemoteDeviceID];
}

id objc_msgSend_sharedEndpoint(void *a1, const char *a2, ...)
{
  return [a1 sharedEndpoint];
}

id objc_msgSend_unionOrderedSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unionOrderedSet:");
}