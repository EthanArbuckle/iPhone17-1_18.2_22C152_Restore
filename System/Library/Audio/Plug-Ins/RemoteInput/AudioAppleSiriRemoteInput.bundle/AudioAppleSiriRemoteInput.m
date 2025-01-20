uint64_t sub_1B94(char *category)
{
  uint64_t vars8;

  qword_D420 = (uint64_t)os_log_create("com.apple.bluetooth", category);

  return _objc_release_x1();
}

void sub_1DFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2578(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_26F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_2BA8(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _handleEvent:a2];
}

void sub_2F6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_311C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_31F8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_4BAC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_4BCC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t sub_4BF4()
{
  return v0;
}

void sub_4C0C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "sendMsg - Invalid xpc connection", v1, 2u);
}

void sub_4C50(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "sendSyncMsg - Invalid xpc connection", v1, 2u);
}

void sub_4C94()
{
  sub_31E0();
  sub_31F8(&dword_0, v0, v1, "CheckIn received error %@: %p");
}

void sub_4D00(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unexpected XPC event: %@", (uint8_t *)&v2, 0xCu);
}

void sub_4D78(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unexpected XPC error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_4DF0()
{
  sub_31E0();
  sub_31F8(&dword_0, v0, v1, "Received error %@: %p");
}

void sub_4E5C(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_4BF4() description];
  sub_4BE8();
  sub_4BAC(&dword_0, v4, v5, "Unknown device info %@", v6, v7, v8, v9, v10);
}

void sub_4EEC()
{
  sub_4C00();
  sub_4BCC(&dword_0, v0, v1, "Unknown HidAppleSiriInputDevice ID 0x%04X", v2, v3, v4, v5, v6);
}

void sub_4F58()
{
  sub_4C00();
  sub_4BCC(&dword_0, v0, v1, "Unknown codec type 0x%02X", v2, v3, v4, v5, v6);
}

void sub_4FC4()
{
  sub_4BE8();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "Unknown Remote type %ld", v1, 0xCu);
}

void sub_5038(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_4BF4() identifier];
  sub_4BE8();
  sub_4BAC(&dword_0, v4, v5, "Could not find service for identifier %@", v6, v7, v8, v9, v10);
}

void sub_50C8(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_4BF4() identifier];
  sub_4BE8();
  sub_4BAC(&dword_0, v4, v5, "Identifier %@ audio format was not initialized properly", v6, v7, v8, v9, v10);
}

void sub_5158(unsigned __int16 a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218240;
  uint64_t v4 = a2;
  __int16 v5 = 1024;
  int v6 = a1;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Received BufferLength %ld is shorter than FrameLength %d", (uint8_t *)&v3, 0x12u);
}

void sub_51E4()
{
  sub_4C00();
  __int16 v2 = 2048;
  uint64_t v3 = 94;
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "Opus buffer length(%d) is bigger than max size(%lu)", v1, 0x12u);
}

void sub_526C(void *a1)
{
  id v2 = a1;
  [(id)sub_4BF4() deviceType];
  sub_4BE8();
  sub_4BAC(&dword_0, v3, v4, "No gain for unknown device type %lu, assuming DoAP device", v5, v6, v7, v8, v9);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

id objc_retainAutorelease(id a1)
{
  return _a1;
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

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__RequestSiriAudioConnection(void *a1, const char *a2, ...)
{
  return _[a1 _RequestSiriAudioConnection];
}

id objc_msgSend__audioBufferForFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_audioBufferForFrame:");
}

id objc_msgSend__audioTimeForFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_audioTimeForFrame:");
}

id objc_msgSend__checkIn(void *a1, const char *a2, ...)
{
  return _[a1 _checkIn];
}

id objc_msgSend__gainForDoapFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_gainForDoapFrame:");
}

id objc_msgSend__gainForFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_gainForFrame:");
}

id objc_msgSend__gainForTVRemoteFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_gainForTVRemoteFrame:");
}

id objc_msgSend__handleError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleError:");
}

id objc_msgSend__handleMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleMsg:");
}

id objc_msgSend__handlePublishMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handlePublishMsg:");
}

id objc_msgSend__inputDeviceForArgs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_inputDeviceForArgs:");
}

id objc_msgSend__processAudioFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processAudioFrame:");
}

id objc_msgSend__qualityForSpeexFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_qualityForSpeexFrame:");
}

id objc_msgSend__supportedFormats(void *a1, const char *a2, ...)
{
  return _[a1 _supportedFormats];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_audioInputBlock(void *a1, const char *a2, ...)
{
  return _[a1 audioInputBlock];
}

id objc_msgSend_codec(void *a1, const char *a2, ...)
{
  return _[a1 codec];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _[a1 deviceType];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return _[a1 format];
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getBytes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:range:");
}

id objc_msgSend_getMatchingDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getMatchingDict:");
}

id objc_msgSend_handleAudioFrameMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAudioFrameMsg:");
}

id objc_msgSend_handleStreamDidCancelMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleStreamDidCancelMsg:");
}

id objc_msgSend_handleTransportDidStartMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleTransportDidStartMsg:");
}

id objc_msgSend_handleTransportDidStopMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleTransportDidStopMsg:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initWithFormat_packetCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:packetCapacity:");
}

id objc_msgSend_initWithFormat_packetCapacity_maximumPacketSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:packetCapacity:maximumPacketSize:");
}

id objc_msgSend_initWithInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInfo:");
}

id objc_msgSend_initWithSampleTime_atRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSampleTime:atRate:");
}

id objc_msgSend_initWithStreamDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStreamDescription:");
}

id objc_msgSend_inputDevices(void *a1, const char *a2, ...)
{
  return _[a1 inputDevices];
}

id objc_msgSend_inputPlugin_didPublishDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputPlugin:didPublishDevice:");
}

id objc_msgSend_inputPlugin_didUnpublishDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputPlugin:didUnpublishDevice:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_packetDescriptions(void *a1, const char *a2, ...)
{
  return _[a1 packetDescriptions];
}

id objc_msgSend_pidNum(void *a1, const char *a2, ...)
{
  return _[a1 pidNum];
}

id objc_msgSend_plugin(void *a1, const char *a2, ...)
{
  return _[a1 plugin];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_resolvedDeviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 resolvedDeviceIdentifier];
}

id objc_msgSend_sendMsg_args_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMsg:args:");
}

id objc_msgSend_sendSyncMsg_args_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSyncMsg:args:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setPacketCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPacketCount:");
}

id objc_msgSend_setPlugin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlugin:");
}

id objc_msgSend_setResolvedDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResolvedDeviceIdentifier:");
}

id objc_msgSend_setStartCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartCompletionBlock:");
}

id objc_msgSend_setStatusChangeBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusChangeBlock:");
}

id objc_msgSend_setStopCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStopCompletionBlock:");
}

id objc_msgSend_startCompletionBlock(void *a1, const char *a2, ...)
{
  return _[a1 startCompletionBlock];
}

id objc_msgSend_statusChangeBlock(void *a1, const char *a2, ...)
{
  return _[a1 statusChangeBlock];
}

id objc_msgSend_stopCompletionBlock(void *a1, const char *a2, ...)
{
  return _[a1 stopCompletionBlock];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_supportedFormats(void *a1, const char *a2, ...)
{
  return _[a1 supportedFormats];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedShortValue];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return _[a1 xpcConnection];
}