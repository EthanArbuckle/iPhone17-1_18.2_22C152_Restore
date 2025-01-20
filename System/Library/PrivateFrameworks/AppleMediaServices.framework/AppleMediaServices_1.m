uint64_t AMSCustomError()
{
  return _AMSCustomError();
}

uint64_t AMSError()
{
  return _AMSError();
}

uint64_t AMSErrorIsEqual()
{
  return _AMSErrorIsEqual();
}

uint64_t AMSErrorWithFormat()
{
  return _AMSErrorWithFormat();
}

uint64_t AMSErrorWithMultipleUnderlyingErrors()
{
  return _AMSErrorWithMultipleUnderlyingErrors();
}

uint64_t AMSFraudReportAddDeviceIdentityCertificateAndSignatureToRequest()
{
  return _AMSFraudReportAddDeviceIdentityCertificateAndSignatureToRequest();
}

uint64_t AMSHashIfNeeded()
{
  return _AMSHashIfNeeded();
}

uint64_t AMSLogKey()
{
  return _AMSLogKey();
}

uint64_t AMSLogableError()
{
  return _AMSLogableError();
}

uint64_t AMSLogableErrors()
{
  return _AMSLogableErrors();
}

uint64_t AMSLogableURL()
{
  return _AMSLogableURL();
}

uint64_t AMSSetLogKey()
{
  return _AMSSetLogKey();
}

uint64_t AMSSetLogKeyIfNeeded()
{
  return _AMSSetLogKeyIfNeeded();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

uint64_t DeviceIdentityIsSupported()
{
  return _DeviceIdentityIsSupported();
}

uint64_t DeviceIdentityIssueClientCertificateWithCompletion()
{
  return _DeviceIdentityIssueClientCertificateWithCompletion();
}

uint64_t IDSCopyIDForDevice()
{
  return _IDSCopyIDForDevice();
}

uint64_t MGCancelNotifications()
{
  return _MGCancelNotifications();
}

uint64_t MGRegisterForUpdates()
{
  return _MGRegisterForUpdates();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t PBDataWriterWriteDataField()
{
  return _PBDataWriterWriteDataField();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBReaderReadData()
{
  return _PBReaderReadData();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return _SecCertificateCopyData(certificate);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return _SecKeyCopyExternalRepresentation(key, error);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
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

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

long double exp2(long double __x)
{
  return _exp2(__x);
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return _os_unfair_lock_lock_with_options();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

void xpc_activity_unregister(const char *identifier)
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

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_ACLVersionForAccessControl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ACLVersionForAccessControl:");
}

id objc_msgSend_BFzukpKGO3cStNGp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BFzukpKGO3cStNGp:");
}

id objc_msgSend_JI0A3nkqsab9cUj8_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JI0A3nkqsab9cUj8:completion:");
}

id objc_msgSend_JSONDictionary(void *a1, const char *a2, ...)
{
  return _[a1 JSONDictionary];
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_OSLogObject(void *a1, const char *a2, ...)
{
  return _[a1 OSLogObject];
}

id objc_msgSend_QeMnG23X94qgz7jT_hostChallenge_challengeResponse_seid_nonce_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "QeMnG23X94qgz7jT:hostChallenge:challengeResponse:seid:nonce:completion:");
}

id objc_msgSend_SOUWv5VjPwXYslMm_noUfOiGjp1iQmKZX_pPGyXmlDbN3mzzHm_iSOZt67ioKsVcqQZ_hjCrdFOLMJN0Cc5Q_lE40aye8U2u533Ka_JRuZv6Feh9qwrGmN_Wn0aIR2B54NCtGQc_B3l3lS18BITy5E4L_UywAszL6AB8Y6LTJ_uNao9X8A82jVmQkK_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "SOUWv5VjPwXYslMm:noUfOiGjp1iQmKZX:pPGyXmlDbN3mzzHm:iSOZt67ioKsVcqQZ:hjCrdFOLMJN0Cc5Q:lE40aye8U2u533Ka:JRuZv6Feh9qwrGmN:Wn0aIR2B54NCtGQc:B3l3lS18BITy5E4L:UywAszL6AB8Y6LTJ:uNao9X8A82jVmQkK:completion:");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForDirectory:inDomain:appropriateForURL:create:error:");
}

id objc_msgSend_URLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForKey:");
}

id objc_msgSend_URLForKey_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForKey:account:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend_VE7BAlWGDSKrO5xc_hostChallenge_challengeResponse_seid_nonce_HY6FXG20397zwmVg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "VE7BAlWGDSKrO5xc:hostChallenge:challengeResponse:seid:nonce:HY6FXG20397zwmVg:");
}

id objc_msgSend_VkBISyFszEu5z9lr_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "VkBISyFszEu5z9lr:error:");
}

id objc_msgSend__absintheHeadersForRequest_bag_buyParams_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_absintheHeadersForRequest:bag:buyParams:completion:");
}

id objc_msgSend__accountIsSecondaryHomeUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accountIsSecondaryHomeUser:");
}

id objc_msgSend__addCampaignToken_andGroup_toURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addCampaignToken:andGroup:toURL:");
}

id objc_msgSend__allHomeKitHomes(void *a1, const char *a2, ...)
{
  return _[a1 _allHomeKitHomes];
}

id objc_msgSend__alliTunesAccountIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 _alliTunesAccountIdentifiers];
}

id objc_msgSend__attemptAutomaticHandleForMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_attemptAutomaticHandleForMessage:");
}

id objc_msgSend__baaOptionsWithOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_baaOptionsWithOptions:error:");
}

id objc_msgSend__bag(void *a1, const char *a2, ...)
{
  return _[a1 _bag];
}

id objc_msgSend__bagForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bagForAccount:");
}

id objc_msgSend__blindedTransactionWithTransactionID_pks_keyID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_blindedTransactionWithTransactionID:pks:keyID:error:");
}

id objc_msgSend__buildRequestBodyWithStyle_primaryCerts_extendedCerts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildRequestBodyWithStyle:primaryCerts:extendedCerts:");
}

id objc_msgSend__buildRequestWithBody_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildRequestWithBody:bag:");
}

id objc_msgSend__cacheCookieDatabase_withPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cacheCookieDatabase:withPath:");
}

id objc_msgSend__cacheCookieProperties_forIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cacheCookieProperties:forIdentifier:");
}

id objc_msgSend__cachedCookieDatabaseForPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cachedCookieDatabaseForPath:");
}

id objc_msgSend__cachedCookiePropertiesForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cachedCookiePropertiesForIdentifier:");
}

id objc_msgSend__canAttemptTokenUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canAttemptTokenUpdate:");
}

id objc_msgSend__changeTokenKeyForDatabaseScope_recordZoneName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_changeTokenKeyForDatabaseScope:recordZoneName:");
}

id objc_msgSend__clampTimeStampValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clampTimeStampValue:");
}

id objc_msgSend__clearAllCachedCookieProperties(void *a1, const char *a2, ...)
{
  return _[a1 _clearAllCachedCookieProperties];
}

id objc_msgSend__clearDanglingCookieDatabasesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearDanglingCookieDatabasesWithCompletion:");
}

id objc_msgSend__clearMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearMessage:");
}

id objc_msgSend__completeEvaluationForPurchaseIdentifier_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_completeEvaluationForPurchaseIdentifier:logKey:");
}

id objc_msgSend__configurePreferredMediaUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configurePreferredMediaUser:");
}

id objc_msgSend__connectionForEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_connectionForEnvironment:");
}

id objc_msgSend__cookieDatabaseForAccount_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cookieDatabaseForAccount:error:");
}

id objc_msgSend__createCriteriaWithToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createCriteriaWithToken:");
}

id objc_msgSend__createGenerateMultiUserTokenTaskForAccount_withController_home_multiUserTokenExists_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createGenerateMultiUserTokenTaskForAccount:withController:home:multiUserTokenExists:");
}

id objc_msgSend__createMultiUserTokenForHome_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createMultiUserTokenForHome:error:");
}

id objc_msgSend__createMultiUserTokensWithErrors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createMultiUserTokensWithErrors:");
}

id objc_msgSend__createODISessionWithSessionIdentifier_cacheIdentifier_accountType_bundleIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createODISessionWithSessionIdentifier:cacheIdentifier:accountType:bundleIdentifier:completion:");
}

id objc_msgSend__createRecordZoneWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createRecordZoneWithError:");
}

id objc_msgSend__createScorerWithAction_account_bundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createScorerWithAction:account:bundleIdentifier:error:");
}

id objc_msgSend__dataCacheService(void *a1, const char *a2, ...)
{
  return _[a1 _dataCacheService];
}

id objc_msgSend__determineDestinationsForMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_determineDestinationsForMessage:");
}

id objc_msgSend__determineDeviceTypeFromDeviceID_devices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_determineDeviceTypeFromDeviceID:devices:");
}

id objc_msgSend__deviceNameChanged(void *a1, const char *a2, ...)
{
  return _[a1 _deviceNameChanged];
}

id objc_msgSend__dsidTypeForAccountType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dsidTypeForAccountType:");
}

id objc_msgSend__durationSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_durationSinceDate:");
}

id objc_msgSend__enqueueEventWithTopic_properties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enqueueEventWithTopic:properties:");
}

id objc_msgSend__enqueueEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enqueueEvents:");
}

id objc_msgSend__enqueueProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enqueueProperties:");
}

id objc_msgSend__enqueueProperties_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enqueueProperties:account:");
}

id objc_msgSend__enumerateDelegatesWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enumerateDelegatesWithBlock:");
}

id objc_msgSend__establishConnectionsAndPostPushTokens(void *a1, const char *a2, ...)
{
  return _[a1 _establishConnectionsAndPostPushTokens];
}

id objc_msgSend__establishConnectionsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _establishConnectionsIfNeeded];
}

id objc_msgSend__eventTime(void *a1, const char *a2, ...)
{
  return _[a1 _eventTime];
}

id objc_msgSend__eventWithTopic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_eventWithTopic:");
}

id objc_msgSend__fdsConsumedCache(void *a1, const char *a2, ...)
{
  return _[a1 _fdsConsumedCache];
}

id objc_msgSend__fdsConsumedCacheAccessQueue(void *a1, const char *a2, ...)
{
  return _[a1 _fdsConsumedCacheAccessQueue];
}

id objc_msgSend__fdsEvaluatorCache(void *a1, const char *a2, ...)
{
  return _[a1 _fdsEvaluatorCache];
}

id objc_msgSend__fdsEvaluatorCacheAccessQueue(void *a1, const char *a2, ...)
{
  return _[a1 _fdsEvaluatorCacheAccessQueue];
}

id objc_msgSend__fdsResultCache(void *a1, const char *a2, ...)
{
  return _[a1 _fdsResultCache];
}

id objc_msgSend__fdsResultCacheAccessQueue(void *a1, const char *a2, ...)
{
  return _[a1 _fdsResultCacheAccessQueue];
}

id objc_msgSend__fetchChangeTokenWithDatabaseScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchChangeTokenWithDatabaseScope:");
}

id objc_msgSend__fetchChangeTokenWithDatabaseScope_recordZoneName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchChangeTokenWithDatabaseScope:recordZoneName:");
}

id objc_msgSend__fetchChangedRecordZonesWithServerChangeToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchChangedRecordZonesWithServerChangeToken:");
}

id objc_msgSend__fetchChangedRecordsInRecordZonesWithWithRecordZoneIDs_changeTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchChangedRecordsInRecordZonesWithWithRecordZoneIDs:changeTokens:");
}

id objc_msgSend__fetchRecordZoneWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchRecordZoneWithError:");
}

id objc_msgSend__fetchShareMetadataForURL_withToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchShareMetadataForURL:withToken:");
}

id objc_msgSend__generateAppProvidedData(void *a1, const char *a2, ...)
{
  return _[a1 _generateAppProvidedData];
}

id objc_msgSend__generateAppProvidedDataWithAction_inviteToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateAppProvidedDataWithAction:inviteToken:");
}

id objc_msgSend__generateInviteCode(void *a1, const char *a2, ...)
{
  return _[a1 _generateInviteCode];
}

id objc_msgSend__generateLegacyFDSWithRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateLegacyFDSWithRequest:completion:");
}

id objc_msgSend__generateMultiUserTokenWithAction_iCloudAccount_inviteToken_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateMultiUserTokenWithAction:iCloudAccount:inviteToken:error:");
}

id objc_msgSend__generateODIFDSWithRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateODIFDSWithRequest:completion:");
}

id objc_msgSend__getSavedMessages(void *a1, const char *a2, ...)
{
  return _[a1 _getSavedMessages];
}

id objc_msgSend__handleBiometricsProvisioningNotification(void *a1, const char *a2, ...)
{
  return _[a1 _handleBiometricsProvisioningNotification];
}

id objc_msgSend__handleCachedDataUpdate(void *a1, const char *a2, ...)
{
  return _[a1 _handleCachedDataUpdate];
}

id objc_msgSend__handleDeviceLanguageChangeNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleDeviceLanguageChangeNotification:");
}

id objc_msgSend__handleDialogRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleDialogRequest:");
}

id objc_msgSend__handleErrorForIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleErrorForIdentifier:error:");
}

id objc_msgSend__handleIncomingMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleIncomingMessage:");
}

id objc_msgSend__handleIncomingReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleIncomingReply:");
}

id objc_msgSend__hasArcadeSubscription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasArcadeSubscription:");
}

id objc_msgSend__hasFitnessPlusSubscription(void *a1, const char *a2, ...)
{
  return _[a1 _hasFitnessPlusSubscription];
}

id objc_msgSend__hasMusicSubscription(void *a1, const char *a2, ...)
{
  return _[a1 _hasMusicSubscription];
}

id objc_msgSend__hasTVSubscription(void *a1, const char *a2, ...)
{
  return _[a1 _hasTVSubscription];
}

id objc_msgSend__isCloudDataAvailable(void *a1, const char *a2, ...)
{
  return _[a1 _isCloudDataAvailable];
}

id objc_msgSend__isRefreshThrottlingDisabledWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isRefreshThrottlingDisabledWithOptions:");
}

id objc_msgSend__isSupported_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSupported:");
}

id objc_msgSend__isSupportedMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSupportedMediaType:");
}

id objc_msgSend__isTopicDefined_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isTopicDefined:");
}

id objc_msgSend__keychainOptionWithPurpose_style_regenerate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_keychainOptionWithPurpose:style:regenerate:");
}

id objc_msgSend__logFaultIfExcessiveChangeTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logFaultIfExcessiveChangeTokens:");
}

id objc_msgSend__lookupAttestationForOption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lookupAttestationForOption:");
}

id objc_msgSend__messageWithProtobuf_fromID_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_messageWithProtobuf:fromID:context:");
}

id objc_msgSend__metricsInstanceWithBag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_metricsInstanceWithBag:");
}

id objc_msgSend__odiAssessmentForSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_odiAssessmentForSession:");
}

id objc_msgSend__odiSessionCache(void *a1, const char *a2, ...)
{
  return _[a1 _odiSessionCache];
}

id objc_msgSend__odiSessionCacheAccessQueue(void *a1, const char *a2, ...)
{
  return _[a1 _odiSessionCacheAccessQueue];
}

id objc_msgSend__outcomeTypeForOutcome_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_outcomeTypeForOutcome:");
}

id objc_msgSend__overwriteSavedMessages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_overwriteSavedMessages:");
}

id objc_msgSend__passcodeStringPromise(void *a1, const char *a2, ...)
{
  return _[a1 _passcodeStringPromise];
}

id objc_msgSend__performAuthKitUpdateTaskWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performAuthKitUpdateTaskWithOptions:");
}

id objc_msgSend__performPasscodeDialogOperationWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performPasscodeDialogOperationWithError:");
}

id objc_msgSend__performStartup(void *a1, const char *a2, ...)
{
  return _[a1 _performStartup];
}

id objc_msgSend__postPushTokensIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _postPushTokensIfNeeded];
}

id objc_msgSend__postPushTokensWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_postPushTokensWithOptions:");
}

id objc_msgSend__presentConfirmation_currentBiometricsState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentConfirmation:currentBiometricsState:");
}

id objc_msgSend__previousBuildVersion(void *a1, const char *a2, ...)
{
  return _[a1 _previousBuildVersion];
}

id objc_msgSend__productionPushAccounts(void *a1, const char *a2, ...)
{
  return _[a1 _productionPushAccounts];
}

id objc_msgSend__provideService_delegate_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_provideService:delegate:withReply:");
}

id objc_msgSend__pushEnvironmentForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pushEnvironmentForAccount:");
}

id objc_msgSend__pushEnvironmentFromBag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pushEnvironmentFromBag:");
}

id objc_msgSend__pushTokenForEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pushTokenForEnvironment:");
}

id objc_msgSend__reconcileRecordZonesWithErrors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reconcileRecordZonesWithErrors:");
}

id objc_msgSend__reconcileiTunesAccountsWithErrors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reconcileiTunesAccountsWithErrors:");
}

id objc_msgSend__refreshCloudDatabasesWithErrors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_refreshCloudDatabasesWithErrors:");
}

id objc_msgSend__refreshShouldUseCloudDataWithHomes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_refreshShouldUseCloudDataWithHomes:");
}

id objc_msgSend__refreshThrottlingDate(void *a1, const char *a2, ...)
{
  return _[a1 _refreshThrottlingDate];
}

id objc_msgSend__registerAccounts_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerAccounts:withOptions:");
}

id objc_msgSend__registerForNextAttemptWithScheduler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerForNextAttemptWithScheduler:");
}

id objc_msgSend__removeRenewCredentialsFollowUp(void *a1, const char *a2, ...)
{
  return _[a1 _removeRenewCredentialsFollowUp];
}

id objc_msgSend__replyForIncomingMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_replyForIncomingMessage:");
}

id objc_msgSend__reportedScoreFromFSRDataString_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportedScoreFromFSRDataString:error:");
}

id objc_msgSend__retrievePollingTime(void *a1, const char *a2, ...)
{
  return _[a1 _retrievePollingTime];
}

id objc_msgSend__runConfirmationDialogWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runConfirmationDialogWithError:");
}

id objc_msgSend__runUpdateRequestWithStyle_primaryCerts_extendedCerts_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runUpdateRequestWithStyle:primaryCerts:extendedCerts:error:");
}

id objc_msgSend__safeCallbackWithMessage_uuid_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_safeCallbackWithMessage:uuid:error:");
}

id objc_msgSend__sandboxPushAccounts(void *a1, const char *a2, ...)
{
  return _[a1 _sandboxPushAccounts];
}

id objc_msgSend__sanitizeError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sanitizeError:");
}

id objc_msgSend__saveLocation(void *a1, const char *a2, ...)
{
  return _[a1 _saveLocation];
}

id objc_msgSend__saveMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveMessage:");
}

id objc_msgSend__saveMultiUserToken_forHomeParticipant_iCloudAccount_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveMultiUserToken:forHomeParticipant:iCloudAccount:error:");
}

id objc_msgSend__saveRecord_database_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveRecord:database:");
}

id objc_msgSend__scheduleRefreshWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleRefreshWithOptions:");
}

id objc_msgSend__scheduledRefreshActivityBlock(void *a1, const char *a2, ...)
{
  return _[a1 _scheduledRefreshActivityBlock];
}

id objc_msgSend__sendMessage_withReplyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendMessage:withReplyHandler:");
}

id objc_msgSend__sendMetricsForDialog(void *a1, const char *a2, ...)
{
  return _[a1 _sendMetricsForDialog];
}

id objc_msgSend__sendMetricsForUpdate(void *a1, const char *a2, ...)
{
  return _[a1 _sendMetricsForUpdate];
}

id objc_msgSend__serverEndpointIdentifierForFDSAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverEndpointIdentifierForFDSAction:");
}

id objc_msgSend__serviceProviderTypeForServiceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serviceProviderTypeForServiceIdentifier:");
}

id objc_msgSend__setAdditionalXPCActivityProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAdditionalXPCActivityProperties:");
}

id objc_msgSend__setEnabledTopics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setEnabledTopics:");
}

id objc_msgSend__setFinalizedElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setFinalizedElement:");
}

id objc_msgSend__setLastSuccessfulRefreshDateWithHomes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setLastSuccessfulRefreshDateWithHomes:");
}

id objc_msgSend__setRefreshThrottlingDateWithTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRefreshThrottlingDateWithTimeInterval:");
}

id objc_msgSend__setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setValue:forKey:");
}

id objc_msgSend__settingForKeyPath_user_home_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_settingForKeyPath:user:home:");
}

id objc_msgSend__settingForKeyPath_withSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_settingForKeyPath:withSettings:");
}

id objc_msgSend__setupAccountDataSync(void *a1, const char *a2, ...)
{
  return _[a1 _setupAccountDataSync];
}

id objc_msgSend__setupNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _setupNotifications];
}

id objc_msgSend__setupPollJobs(void *a1, const char *a2, ...)
{
  return _[a1 _setupPollJobs];
}

id objc_msgSend__setupSignalHandlers(void *a1, const char *a2, ...)
{
  return _[a1 _setupSignalHandlers];
}

id objc_msgSend__shareRecord_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shareRecord:withError:");
}

id objc_msgSend__sharedTokenLock(void *a1, const char *a2, ...)
{
  return _[a1 _sharedTokenLock];
}

id objc_msgSend__shouldCreateCertsWithOption_forCerts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldCreateCertsWithOption:forCerts:");
}

id objc_msgSend__shouldGenerateInviteToken(void *a1, const char *a2, ...)
{
  return _[a1 _shouldGenerateInviteToken];
}

id objc_msgSend__shouldThrottleForAccount_environment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldThrottleForAccount:environment:");
}

id objc_msgSend__shouldThrottleForAccount_environment_currentTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldThrottleForAccount:environment:currentTimestamp:");
}

id objc_msgSend__shutDownConnection_forEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shutDownConnection:forEnvironment:");
}

id objc_msgSend__startConnectionWithEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startConnectionWithEnvironment:");
}

id objc_msgSend__startXPC(void *a1, const char *a2, ...)
{
  return _[a1 _startXPC];
}

id objc_msgSend__stringForDatabaseScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stringForDatabaseScope:");
}

id objc_msgSend__stringForQualityOfService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stringForQualityOfService:");
}

id objc_msgSend__stringForRefreshType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stringForRefreshType:");
}

id objc_msgSend__subscribeWithIdentifier_attempt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_subscribeWithIdentifier:attempt:");
}

id objc_msgSend__task(void *a1, const char *a2, ...)
{
  return _[a1 _task];
}

id objc_msgSend__tearDownMultiUser(void *a1, const char *a2, ...)
{
  return _[a1 _tearDownMultiUser];
}

id objc_msgSend__topicFromBag(void *a1, const char *a2, ...)
{
  return _[a1 _topicFromBag];
}

id objc_msgSend__transferHomeSettingsToAccountsWithErrors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transferHomeSettingsToAccountsWithErrors:");
}

id objc_msgSend__uniqueIdentifiersForAccount_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_uniqueIdentifiersForAccount:error:");
}

id objc_msgSend__updateCachedCriteriaWithToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCachedCriteriaWithToken:");
}

id objc_msgSend__updateDeviceAccountPrivacyIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _updateDeviceAccountPrivacyIfNeeded];
}

id objc_msgSend__updateLanguageForAccount_mediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLanguageForAccount:mediaType:");
}

id objc_msgSend__updateRegulatoryEligibility(void *a1, const char *a2, ...)
{
  return _[a1 _updateRegulatoryEligibility];
}

id objc_msgSend__updateThrottleForAccount_environment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateThrottleForAccount:environment:");
}

id objc_msgSend__updateThrottleForAccount_environment_throttleTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateThrottleForAccount:environment:throttleTime:");
}

id objc_msgSend__updateTokens_currentBiometricsState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateTokens:currentBiometricsState:");
}

id objc_msgSend__userIdForBagNamespace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_userIdForBagNamespace:");
}

id objc_msgSend__valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_valueForKey:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_acceptShareURL_withToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptShareURL:withToken:");
}

id objc_msgSend_acceptanceStatus(void *a1, const char *a2, ...)
{
  return _[a1 acceptanceStatus];
}

id objc_msgSend_accessories(void *a1, const char *a2, ...)
{
  return _[a1 accessories];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_accountAuthSyncFor_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountAuthSyncFor:completionHandler:");
}

id objc_msgSend_accountAuthToken(void *a1, const char *a2, ...)
{
  return _[a1 accountAuthToken];
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 accountIdentifier];
}

id objc_msgSend_accountIsEligibleForPushNotifications_accountStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountIsEligibleForPushNotifications:accountStore:");
}

id objc_msgSend_accountMediaType(void *a1, const char *a2, ...)
{
  return _[a1 accountMediaType];
}

id objc_msgSend_accountPropertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountPropertyForKey:");
}

id objc_msgSend_accountStatusWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountStatusWithCompletionHandler:");
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return _[a1 accountStore];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return _[a1 accountType];
}

id objc_msgSend_accountTypeWithAccountTypeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _[a1 action];
}

id objc_msgSend_actionWithTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:");
}

id objc_msgSend_activateWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateWithContext:");
}

id objc_msgSend_activityBlock(void *a1, const char *a2, ...)
{
  return _[a1 activityBlock];
}

id objc_msgSend_activityIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 activityIdentifier];
}

id objc_msgSend_addDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelegate:");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addErrorBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addErrorBlock:");
}

id objc_msgSend_addFinishBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFinishBlock:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserver_selector_name_object_suspensionBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:suspensionBehavior:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addPropertiesWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPropertiesWithDictionary:");
}

id objc_msgSend_addSuccessBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSuccessBlock:");
}

id objc_msgSend_allHomes(void *a1, const char *a2, ...)
{
  return _[a1 allHomes];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allUsersInHome_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allUsersInHome:");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowBattery(void *a1, const char *a2, ...)
{
  return _[a1 allowBattery];
}

id objc_msgSend_altDSIDHashCache(void *a1, const char *a2, ...)
{
  return _[a1 altDSIDHashCache];
}

id objc_msgSend_ams_DSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_DSID");
}

id objc_msgSend_ams_accountFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_accountFlags");
}

id objc_msgSend_ams_activeiCloudAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_activeiCloudAccount");
}

id objc_msgSend_ams_activeiTunesAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_activeiTunesAccount");
}

id objc_msgSend_ams_activeiTunesAccountForMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_activeiTunesAccountForMediaType:");
}

id objc_msgSend_ams_addNullableObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_addNullableObject:");
}

id objc_msgSend_ams_addObjectsFromNullableArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_addObjectsFromNullableArray:");
}

id objc_msgSend_ams_altDSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_altDSID");
}

id objc_msgSend_ams_anyWithTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_anyWithTest:");
}

id objc_msgSend_ams_cachesDirectory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_cachesDirectory");
}

id objc_msgSend_ams_configurationWithProcessInfo_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_configurationWithProcessInfo:bag:");
}

id objc_msgSend_ams_cookies(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_cookies");
}

id objc_msgSend_ams_cookiesByMergingProperties_intoProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_cookiesByMergingProperties:intoProperties:");
}

id objc_msgSend_ams_dictionaryByAddingEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_dictionaryByAddingEntriesFromDictionary:");
}

id objc_msgSend_ams_fetchGrandSlamTokenForAccount_withIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_fetchGrandSlamTokenForAccount:withIdentifier:");
}

id objc_msgSend_ams_fetchGrandSlamTokenForAccount_withIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_fetchGrandSlamTokenForAccount:withIdentifier:error:");
}

id objc_msgSend_ams_fetchLocaliTunesAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_fetchLocaliTunesAccount");
}

id objc_msgSend_ams_fetchiTunesAccounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_fetchiTunesAccounts");
}

id objc_msgSend_ams_fetchiTunesSandboxAccounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_fetchiTunesSandboxAccounts");
}

id objc_msgSend_ams_filterUsingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_filterUsingTest:");
}

id objc_msgSend_ams_firstName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_firstName");
}

id objc_msgSend_ams_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_firstObjectPassingTest:");
}

id objc_msgSend_ams_hasDomain_code_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_hasDomain:code:");
}

id objc_msgSend_ams_iTunesAccountForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_iTunesAccountForAccount:");
}

id objc_msgSend_ams_iTunesAccountForAccount_forMediaType_createIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_iTunesAccountForAccount:forMediaType:createIfNeeded:");
}

id objc_msgSend_ams_iTunesAccountWithAltDSID_DSID_username_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_iTunesAccountWithAltDSID:DSID:username:");
}

id objc_msgSend_ams_iTunesAccountsForMediaTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_iTunesAccountsForMediaTypes:");
}

id objc_msgSend_ams_invertedDictionaryUsingTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_invertedDictionaryUsingTransform:");
}

id objc_msgSend_ams_invertedDictionaryUsingTransformIgnoresNil_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_invertedDictionaryUsingTransformIgnoresNil:");
}

id objc_msgSend_ams_isLocalAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_isLocalAccount");
}

id objc_msgSend_ams_isSandboxAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_isSandboxAccount");
}

id objc_msgSend_ams_lastName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_lastName");
}

id objc_msgSend_ams_mapWithTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_mapWithTransform:");
}

id objc_msgSend_ams_mapWithTransformIgnoresNil_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_mapWithTransformIgnoresNil:");
}

id objc_msgSend_ams_mergePrivacyAcknowledgement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_mergePrivacyAcknowledgement:");
}

id objc_msgSend_ams_message(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_message");
}

id objc_msgSend_ams_privacyAcknowledgement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_privacyAcknowledgement");
}

id objc_msgSend_ams_propertiesForCookies_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_propertiesForCookies:");
}

id objc_msgSend_ams_pushRegistrationThrottleMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_pushRegistrationThrottleMap");
}

id objc_msgSend_ams_registerSuccessCriteria(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_registerSuccessCriteria");
}

id objc_msgSend_ams_sanitizedForSecureCoding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sanitizedForSecureCoding");
}

id objc_msgSend_ams_saveAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_saveAccount:");
}

id objc_msgSend_ams_setAccountFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setAccountFlags:");
}

id objc_msgSend_ams_setAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setAltDSID:");
}

id objc_msgSend_ams_setDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setDSID:");
}

id objc_msgSend_ams_setDisableAccountFlagsSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setDisableAccountFlagsSync:");
}

id objc_msgSend_ams_setDisablePrivacyAcknowledgementSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setDisablePrivacyAcknowledgementSync:");
}

id objc_msgSend_ams_setInUse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setInUse:");
}

id objc_msgSend_ams_setNullableObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setNullableObject:forKey:");
}

id objc_msgSend_ams_setPushRegistrationThrottleMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setPushRegistrationThrottleMap:");
}

id objc_msgSend_ams_setRegisterSuccessCriteria_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setRegisterSuccessCriteria:");
}

id objc_msgSend_ams_sha512HashStringUsingEncoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sha512HashStringUsingEncoding:error:");
}

id objc_msgSend_ams_sharedAccountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sharedAccountStore");
}

id objc_msgSend_ams_sharedAccountStoreForMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sharedAccountStoreForMediaType:");
}

id objc_msgSend_ams_storefrontForMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_storefrontForMediaType:");
}

id objc_msgSend_ams_title(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_title");
}

id objc_msgSend_ams_underlyingError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_underlyingError");
}

id objc_msgSend_ams_underlyingErrorWithDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_underlyingErrorWithDomain:");
}

id objc_msgSend_amsa_allDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "amsa_allDevices");
}

id objc_msgSend_amsd_createAppProvidedDataWithMultiUserAction_home_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "amsd_createAppProvidedDataWithMultiUserAction:home:");
}

id objc_msgSend_amsd_createAppProvidedDataWithMultiUserAction_homeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "amsd_createAppProvidedDataWithMultiUserAction:homeIdentifier:");
}

id objc_msgSend_amsd_iTunesAccountForHomeParticipant_createEphemeral_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "amsd_iTunesAccountForHomeParticipant:createEphemeral:");
}

id objc_msgSend_amsd_isCKChangeTokenExpiredError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "amsd_isCKChangeTokenExpiredError");
}

id objc_msgSend_amsd_isCKManateeUnavailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "amsd_isCKManateeUnavailable");
}

id objc_msgSend_amsd_isCKMissingManateeIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "amsd_isCKMissingManateeIdentity");
}

id objc_msgSend_amsd_isCKPartialFailureError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "amsd_isCKPartialFailureError");
}

id objc_msgSend_amsd_isCKServerRecordChangedError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "amsd_isCKServerRecordChangedError");
}

id objc_msgSend_amsd_isCKThrottledError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "amsd_isCKThrottledError");
}

id objc_msgSend_amsd_isCKUnknownItemError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "amsd_isCKUnknownItemError");
}

id objc_msgSend_amsd_multiUserAuthenticateOptionsWithAppProvidedData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "amsd_multiUserAuthenticateOptionsWithAppProvidedData:");
}

id objc_msgSend_amsd_processName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "amsd_processName");
}

id objc_msgSend_amsd_setPushRegistrationThrottleMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "amsd_setPushRegistrationThrottleMap:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_aps(void *a1, const char *a2, ...)
{
  return _[a1 aps];
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assessmentWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assessmentWithCompletion:");
}

id objc_msgSend_attestationWithOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attestationWithOptions:error:");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return _[a1 attributes];
}

id objc_msgSend_authenticationResults(void *a1, const char *a2, ...)
{
  return _[a1 authenticationResults];
}

id objc_msgSend_authenticationTokenType(void *a1, const char *a2, ...)
{
  return _[a1 authenticationTokenType];
}

id objc_msgSend_availablePartialAssessment(void *a1, const char *a2, ...)
{
  return _[a1 availablePartialAssessment];
}

id objc_msgSend_bag(void *a1, const char *a2, ...)
{
  return _[a1 bag];
}

id objc_msgSend_bagForMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bagForMediaType:");
}

id objc_msgSend_bagForProfile_profileVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bagForProfile:profileVersion:");
}

id objc_msgSend_bagForProfile_profileVersion_processInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bagForProfile:profileVersion:processInfo:");
}

id objc_msgSend_bagSubProfile(void *a1, const char *a2, ...)
{
  return _[a1 bagSubProfile];
}

id objc_msgSend_bagSubProfileVersion(void *a1, const char *a2, ...)
{
  return _[a1 bagSubProfileVersion];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_batchSize(void *a1, const char *a2, ...)
{
  return _[a1 batchSize];
}

id objc_msgSend_binaryPromiseAdapter(void *a1, const char *a2, ...)
{
  return _[a1 binaryPromiseAdapter];
}

id objc_msgSend_blindedElement(void *a1, const char *a2, ...)
{
  return _[a1 blindedElement];
}

id objc_msgSend_blindedMessage(void *a1, const char *a2, ...)
{
  return _[a1 blindedMessage];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return _[a1 buildVersion];
}

id objc_msgSend_buildXPCObject(void *a1, const char *a2, ...)
{
  return _[a1 buildXPCObject];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_buttonActions(void *a1, const char *a2, ...)
{
  return _[a1 buttonActions];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cachedMessages(void *a1, const char *a2, ...)
{
  return _[a1 cachedMessages];
}

id objc_msgSend_callerID(void *a1, const char *a2, ...)
{
  return _[a1 callerID];
}

id objc_msgSend_canMakeLocalPayments(void *a1, const char *a2, ...)
{
  return _[a1 canMakeLocalPayments];
}

id objc_msgSend_canPerformPSD2StyleBuyForAccessControlRef_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canPerformPSD2StyleBuyForAccessControlRef:");
}

id objc_msgSend_canRunOnBattery(void *a1, const char *a2, ...)
{
  return _[a1 canRunOnBattery];
}

id objc_msgSend_catchWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "catchWithBlock:");
}

id objc_msgSend_certificateChainStringsForOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "certificateChainStringsForOptions:error:");
}

id objc_msgSend_challengeResponse(void *a1, const char *a2, ...)
{
  return _[a1 challengeResponse];
}

id objc_msgSend_changeAutoPlayFor_to_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeAutoPlayFor:to:completionHandler:");
}

id objc_msgSend_changePersonalizationFor_to_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changePersonalizationFor:to:completionHandler:");
}

id objc_msgSend_changeToken(void *a1, const char *a2, ...)
{
  return _[a1 changeToken];
}

id objc_msgSend_changeTokens(void *a1, const char *a2, ...)
{
  return _[a1 changeTokens];
}

id objc_msgSend_changedRecordZones(void *a1, const char *a2, ...)
{
  return _[a1 changedRecordZones];
}

id objc_msgSend_changedRecords(void *a1, const char *a2, ...)
{
  return _[a1 changedRecords];
}

id objc_msgSend_checkIn(void *a1, const char *a2, ...)
{
  return _[a1 checkIn];
}

id objc_msgSend_classConsumers(void *a1, const char *a2, ...)
{
  return _[a1 classConsumers];
}

id objc_msgSend_cleanUpCookieDatabasesWithValidIdentifiers_fileManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanUpCookieDatabasesWithValidIdentifiers:fileManager:");
}

id objc_msgSend_clearDanglingCookieDatabases(void *a1, const char *a2, ...)
{
  return _[a1 clearDanglingCookieDatabases];
}

id objc_msgSend_clearDanglingCookieDatabasesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearDanglingCookieDatabasesWithCompletion:");
}

id objc_msgSend_clientIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 clientIdentifier];
}

id objc_msgSend_clientInfo(void *a1, const char *a2, ...)
{
  return _[a1 clientInfo];
}

id objc_msgSend_clientInfoHeader(void *a1, const char *a2, ...)
{
  return _[a1 clientInfoHeader];
}

id objc_msgSend_cloudContainer(void *a1, const char *a2, ...)
{
  return _[a1 cloudContainer];
}

id objc_msgSend_cloudDataManager(void *a1, const char *a2, ...)
{
  return _[a1 cloudDataManager];
}

id objc_msgSend_cloudDataManagerDataSource_didChangeWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cloudDataManagerDataSource:didChangeWithType:");
}

id objc_msgSend_cloudKitFetchBeginDate(void *a1, const char *a2, ...)
{
  return _[a1 cloudKitFetchBeginDate];
}

id objc_msgSend_cloudKitSaveBeginDate(void *a1, const char *a2, ...)
{
  return _[a1 cloudKitSaveBeginDate];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_completionHandlerAdapter(void *a1, const char *a2, ...)
{
  return _[a1 completionHandlerAdapter];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_confirmationDialogRequestForBiometricsType_clientInfo_acceptActionIdentifier_declineActionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "confirmationDialogRequestForBiometricsType:clientInfo:acceptActionIdentifier:declineActionIdentifier:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connectionQueue(void *a1, const char *a2, ...)
{
  return _[a1 connectionQueue];
}

id objc_msgSend_connections(void *a1, const char *a2, ...)
{
  return _[a1 connections];
}

id objc_msgSend_consumed(void *a1, const char *a2, ...)
{
  return _[a1 consumed];
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return _[a1 containerID];
}

id objc_msgSend_containerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 containerIdentifier];
}

id objc_msgSend_containerWithContainerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerWithContainerIdentifier:");
}

id objc_msgSend_containerWithContainerIdentifier_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerWithContainerIdentifier:options:");
}

id objc_msgSend_containers(void *a1, const char *a2, ...)
{
  return _[a1 containers];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_continueWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continueWithBlock:");
}

id objc_msgSend_controller(void *a1, const char *a2, ...)
{
  return _[a1 controller];
}

id objc_msgSend_cookieDatabaseCache(void *a1, const char *a2, ...)
{
  return _[a1 cookieDatabaseCache];
}

id objc_msgSend_cookieDatabaseForIdentifiers_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cookieDatabaseForIdentifiers:error:");
}

id objc_msgSend_cookiePropertiesWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cookiePropertiesWithError:");
}

id objc_msgSend_cookiePropertyCache(void *a1, const char *a2, ...)
{
  return _[a1 cookiePropertyCache];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyAccessControlRefWithAccount_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyAccessControlRefWithAccount:options:error:");
}

id objc_msgSend_copyPublicKeyForAccount_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyPublicKeyForAccount:options:error:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countForObject:");
}

id objc_msgSend_createAccessControlRefWithOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAccessControlRefWithOptions:error:");
}

id objc_msgSend_createBagForSubProfile(void *a1, const char *a2, ...)
{
  return _[a1 createBagForSubProfile];
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createIfMissing(void *a1, const char *a2, ...)
{
  return _[a1 createIfMissing];
}

id objc_msgSend_createProtoMessage(void *a1, const char *a2, ...)
{
  return _[a1 createProtoMessage];
}

id objc_msgSend_createRecordWithRecordName_recordType_recordZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createRecordWithRecordName:recordType:recordZone:");
}

id objc_msgSend_createRecordZoneWithRecordZoneName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createRecordZoneWithRecordZoneName:");
}

id objc_msgSend_criteria(void *a1, const char *a2, ...)
{
  return _[a1 criteria];
}

id objc_msgSend_currentAccessory(void *a1, const char *a2, ...)
{
  return _[a1 currentAccessory];
}

id objc_msgSend_currentDeviceIsAccessoryForHome_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDeviceIsAccessoryForHome:");
}

id objc_msgSend_currentInfo(void *a1, const char *a2, ...)
{
  return _[a1 currentInfo];
}

id objc_msgSend_currentProcess(void *a1, const char *a2, ...)
{
  return _[a1 currentProcess];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return _[a1 currentUser];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _[a1 dataSource];
}

id objc_msgSend_dataTaskPromiseWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskPromiseWithRequest:");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithAccounts_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithAccounts:completionHandler:");
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_database(void *a1, const char *a2, ...)
{
  return _[a1 database];
}

id objc_msgSend_databaseForHome_user_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "databaseForHome:user:");
}

id objc_msgSend_databasePathForIdentifiers_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "databasePathForIdentifiers:error:");
}

id objc_msgSend_databaseScope(void *a1, const char *a2, ...)
{
  return _[a1 databaseScope];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_dbPath(void *a1, const char *a2, ...)
{
  return _[a1 dbPath];
}

id objc_msgSend_defaultAction(void *a1, const char *a2, ...)
{
  return _[a1 defaultAction];
}

id objc_msgSend_defaultBag(void *a1, const char *a2, ...)
{
  return _[a1 defaultBag];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultRecordZone(void *a1, const char *a2, ...)
{
  return _[a1 defaultRecordZone];
}

id objc_msgSend_defaultSession(void *a1, const char *a2, ...)
{
  return _[a1 defaultSession];
}

id objc_msgSend_defaultURL(void *a1, const char *a2, ...)
{
  return _[a1 defaultURL];
}

id objc_msgSend_delay(void *a1, const char *a2, ...)
{
  return _[a1 delay];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_delegates(void *a1, const char *a2, ...)
{
  return _[a1 delegates];
}

id objc_msgSend_deleteAllKeysWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllKeysWithError:");
}

id objc_msgSend_deleteRecordWithRecordIdentifier_missingEncryptionIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteRecordWithRecordIdentifier:missingEncryptionIdentity:");
}

id objc_msgSend_deleteRecordZonesWithRecordZoneIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteRecordZonesWithRecordZoneIdentifiers:");
}

id objc_msgSend_deletedRecordZones(void *a1, const char *a2, ...)
{
  return _[a1 deletedRecordZones];
}

id objc_msgSend_deletedRecords(void *a1, const char *a2, ...)
{
  return _[a1 deletedRecords];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return _[a1 destination];
}

id objc_msgSend_determineAccountForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "determineAccountForAccount:");
}

id objc_msgSend_deviceCanManageMultiUser(void *a1, const char *a2, ...)
{
  return _[a1 deviceCanManageMultiUser];
}

id objc_msgSend_deviceFromIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceFromIdentifier:");
}

id objc_msgSend_deviceIsAppleTV(void *a1, const char *a2, ...)
{
  return _[a1 deviceIsAppleTV];
}

id objc_msgSend_deviceIsAppleWatch(void *a1, const char *a2, ...)
{
  return _[a1 deviceIsAppleWatch];
}

id objc_msgSend_deviceIsAudioAccessory(void *a1, const char *a2, ...)
{
  return _[a1 deviceIsAudioAccessory];
}

id objc_msgSend_deviceIsBundle(void *a1, const char *a2, ...)
{
  return _[a1 deviceIsBundle];
}

id objc_msgSend_deviceIsiPad(void *a1, const char *a2, ...)
{
  return _[a1 deviceIsiPad];
}

id objc_msgSend_deviceIsiPhone(void *a1, const char *a2, ...)
{
  return _[a1 deviceIsiPhone];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return _[a1 deviceName];
}

id objc_msgSend_deviceNameChangedToken(void *a1, const char *a2, ...)
{
  return _[a1 deviceNameChangedToken];
}

id objc_msgSend_deviceSupportsMultipleUsers(void *a1, const char *a2, ...)
{
  return _[a1 deviceSupportsMultipleUsers];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryForKey:");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dismissalCompletionQueue(void *a1, const char *a2, ...)
{
  return _[a1 dismissalCompletionQueue];
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return _[a1 dispatchQueue];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_dsidHashCache(void *a1, const char *a2, ...)
{
  return _[a1 dsidHashCache];
}

id objc_msgSend_eVZ8hjC0Tuzwvnqc_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eVZ8hjC0Tuzwvnqc:");
}

id objc_msgSend_email(void *a1, const char *a2, ...)
{
  return _[a1 email];
}

id objc_msgSend_emailAddress(void *a1, const char *a2, ...)
{
  return _[a1 emailAddress];
}

id objc_msgSend_enabledActionTypes(void *a1, const char *a2, ...)
{
  return _[a1 enabledActionTypes];
}

id objc_msgSend_enabledThrottling(void *a1, const char *a2, ...)
{
  return _[a1 enabledThrottling];
}

id objc_msgSend_encryptedValues(void *a1, const char *a2, ...)
{
  return _[a1 encryptedValues];
}

id objc_msgSend_endpointID(void *a1, const char *a2, ...)
{
  return _[a1 endpointID];
}

id objc_msgSend_endpointIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 endpointIdentifier];
}

id objc_msgSend_enqueBeginMetrics(void *a1, const char *a2, ...)
{
  return _[a1 enqueBeginMetrics];
}

id objc_msgSend_enqueFailedMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueFailedMetrics:");
}

id objc_msgSend_enqueueCloudKitFetchBeganEvent(void *a1, const char *a2, ...)
{
  return _[a1 enqueueCloudKitFetchBeganEvent];
}

id objc_msgSend_enqueueCloudKitFetchFailedEventWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueCloudKitFetchFailedEventWithError:");
}

id objc_msgSend_enqueueCloudKitFetchSuccessEvent(void *a1, const char *a2, ...)
{
  return _[a1 enqueueCloudKitFetchSuccessEvent];
}

id objc_msgSend_enqueueCloudKitSaveReceivedEvent(void *a1, const char *a2, ...)
{
  return _[a1 enqueueCloudKitSaveReceivedEvent];
}

id objc_msgSend_enqueueCloudKitSaveRecordEvent(void *a1, const char *a2, ...)
{
  return _[a1 enqueueCloudKitSaveRecordEvent];
}

id objc_msgSend_enqueueCloudKitSaveRecordFailedEventWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueCloudKitSaveRecordFailedEventWithError:");
}

id objc_msgSend_enqueueCloudKitSaveRecordFinishEventWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueCloudKitSaveRecordFinishEventWithError:");
}

id objc_msgSend_enqueueCloudKitSaveRecordSucceededEvent(void *a1, const char *a2, ...)
{
  return _[a1 enqueueCloudKitSaveRecordSucceededEvent];
}

id objc_msgSend_enqueueGenerateMultiUserTokenBeginEvent(void *a1, const char *a2, ...)
{
  return _[a1 enqueueGenerateMultiUserTokenBeginEvent];
}

id objc_msgSend_enqueueGenerateMultiUserTokenFailedEventWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueGenerateMultiUserTokenFailedEventWithError:");
}

id objc_msgSend_enqueueGenerateMultiUserTokenSuccessEvent(void *a1, const char *a2, ...)
{
  return _[a1 enqueueGenerateMultiUserTokenSuccessEvent];
}

id objc_msgSend_enqueueHomeKitChangedReceivedEvent(void *a1, const char *a2, ...)
{
  return _[a1 enqueueHomeKitChangedReceivedEvent];
}

id objc_msgSend_enqueueHomeKitRepairRequestCompletedFailedEventWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueHomeKitRepairRequestCompletedFailedEventWithError:");
}

id objc_msgSend_enqueueHomeKitRepairRequestCompletedSuccessEvent(void *a1, const char *a2, ...)
{
  return _[a1 enqueueHomeKitRepairRequestCompletedSuccessEvent];
}

id objc_msgSend_enqueueHomeKitRepairRequestReceivedEvent(void *a1, const char *a2, ...)
{
  return _[a1 enqueueHomeKitRepairRequestReceivedEvent];
}

id objc_msgSend_enqueueMultiUserRefreshBeginEventWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueMultiUserRefreshBeginEventWithOptions:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_errors(void *a1, const char *a2, ...)
{
  return _[a1 errors];
}

id objc_msgSend_establishShareWithHomeOwner_container_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "establishShareWithHomeOwner:container:completionHandler:");
}

id objc_msgSend_evaluatedElementData(void *a1, const char *a2, ...)
{
  return _[a1 evaluatedElementData];
}

id objc_msgSend_eventFrequency(void *a1, const char *a2, ...)
{
  return _[a1 eventFrequency];
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_expiryDate(void *a1, const char *a2, ...)
{
  return _[a1 expiryDate];
}

id objc_msgSend_f9MGfLOgnHPuKTrU_HY6FXG20397zwmVg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "f9MGfLOgnHPuKTrU:HY6FXG20397zwmVg:");
}

id objc_msgSend_failures(void *a1, const char *a2, ...)
{
  return _[a1 failures];
}

id objc_msgSend_familyID(void *a1, const char *a2, ...)
{
  return _[a1 familyID];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return _[a1 familyName];
}

id objc_msgSend_fetchAllRecordZonesOperation(void *a1, const char *a2, ...)
{
  return _[a1 fetchAllRecordZonesOperation];
}

id objc_msgSend_fetchChangedRecordsInRecordZonesWithRecordZoneIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchChangedRecordsInRecordZonesWithRecordZoneIdentifiers:");
}

id objc_msgSend_fetchConfigWithCompletionXPC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchConfigWithCompletionXPC:");
}

id objc_msgSend_fetchRecordWithName_zoneIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRecordWithName:zoneIdentifier:");
}

id objc_msgSend_fetchRecordWithName_zoneIdentifier_qualityOfService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRecordWithName:zoneIdentifier:qualityOfService:");
}

id objc_msgSend_fetchRecordWithRecordIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRecordWithRecordIdentifier:");
}

id objc_msgSend_fetchRecordWithRecordIdentifier_qualityOfService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRecordWithRecordIdentifier:qualityOfService:");
}

id objc_msgSend_fetchRecordZones(void *a1, const char *a2, ...)
{
  return _[a1 fetchRecordZones];
}

id objc_msgSend_fetchRecordZonesWithQualityOfService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRecordZonesWithQualityOfService:");
}

id objc_msgSend_fetchSubscriptionData_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchSubscriptionData:completion:");
}

id objc_msgSend_fetchTokenForAccount_tokenIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchTokenForAccount:tokenIdentifier:");
}

id objc_msgSend_fieldForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fieldForKey:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_finalizeWithEvaluatedElement_proof_publicKey_fsr_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finalizeWithEvaluatedElement:proof:publicKey:fsr:error:");
}

id objc_msgSend_finishWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithError:");
}

id objc_msgSend_finishWithPromise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithPromise:");
}

id objc_msgSend_finishWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithResult:");
}

id objc_msgSend_finishWithResult_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithResult:error:");
}

id objc_msgSend_finishWithSuccess(void *a1, const char *a2, ...)
{
  return _[a1 finishWithSuccess];
}

id objc_msgSend_first(void *a1, const char *a2, ...)
{
  return _[a1 first];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return _[a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return _[a1 flush];
}

id objc_msgSend_flushAllKeepAliveTransactions(void *a1, const char *a2, ...)
{
  return _[a1 flushAllKeepAliveTransactions];
}

id objc_msgSend_fsrData(void *a1, const char *a2, ...)
{
  return _[a1 fsrData];
}

id objc_msgSend_fullName(void *a1, const char *a2, ...)
{
  return _[a1 fullName];
}

id objc_msgSend_getAssessment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAssessment:");
}

id objc_msgSend_getCookiePropertiesForAccount_cookieDatabaseOnly_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCookiePropertiesForAccount:cookieDatabaseOnly:error:");
}

id objc_msgSend_getODIAssessmentForSessionIdentifier_clearCache_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getODIAssessmentForSessionIdentifier:clearCache:completion:");
}

id objc_msgSend_getSubscriptionEntitlementsForSegment_ignoreCaches_withResultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSubscriptionEntitlementsForSegment:ignoreCaches:withResultHandler:");
}

id objc_msgSend_getSubscriptionStatusWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSubscriptionStatusWithCompletionHandler:");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return _[a1 givenName];
}

id objc_msgSend_gracePeriod(void *a1, const char *a2, ...)
{
  return _[a1 gracePeriod];
}

id objc_msgSend_grandSlamTokenIdentifierForAuthenticationTokenType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "grandSlamTokenIdentifierForAuthenticationTokenType:");
}

id objc_msgSend_groups(void *a1, const char *a2, ...)
{
  return _[a1 groups];
}

id objc_msgSend_handleAuthenticateRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAuthenticateRequest:completion:");
}

id objc_msgSend_handleCachedDataUpdate(void *a1, const char *a2, ...)
{
  return _[a1 handleCachedDataUpdate];
}

id objc_msgSend_handleDialogRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDialogRequest:completion:");
}

id objc_msgSend_handleExpiredAuthenticationTokenErrorWithResult_error_forRequest_account_tokenIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleExpiredAuthenticationTokenErrorWithResult:error:forRequest:account:tokenIdentifier:");
}

id objc_msgSend_handleInboundURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInboundURL:");
}

id objc_msgSend_handleNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleNotification:");
}

id objc_msgSend_handlePushNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePushNotification:");
}

id objc_msgSend_handleResponse_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleResponse:bag:");
}

id objc_msgSend_hasInAppPaymentPassesForNetworks_capabilities_issuerCountryCodes_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasInAppPaymentPassesForNetworks:capabilities:issuerCountryCodes:withHandler:");
}

id objc_msgSend_hasKeysForAccount_forSignaturePurpose_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasKeysForAccount:forSignaturePurpose:withError:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_hashedDescription(void *a1, const char *a2, ...)
{
  return _[a1 hashedDescription];
}

id objc_msgSend_headersForRequest_buyParams_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headersForRequest:buyParams:bag:");
}

id objc_msgSend_home(void *a1, const char *a2, ...)
{
  return _[a1 home];
}

id objc_msgSend_homeAccessControlForUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeAccessControlForUser:");
}

id objc_msgSend_homeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 homeIdentifier];
}

id objc_msgSend_homeIdentifierForRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeIdentifierForRecord:");
}

id objc_msgSend_homeIdentifierForRecordZone_inDatabase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeIdentifierForRecordZone:inDatabase:");
}

id objc_msgSend_homeKitRepairRequestBeginDate(void *a1, const char *a2, ...)
{
  return _[a1 homeKitRepairRequestBeginDate];
}

id objc_msgSend_homeKitRepairRequestUpdateTokenBegin(void *a1, const char *a2, ...)
{
  return _[a1 homeKitRepairRequestUpdateTokenBegin];
}

id objc_msgSend_homeManager(void *a1, const char *a2, ...)
{
  return _[a1 homeManager];
}

id objc_msgSend_homeManagerDataSource_didChangeWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeManagerDataSource:didChangeWithType:");
}

id objc_msgSend_homeManagerDataSource_didReceiveCloudDataRepairRequestForHome_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeManagerDataSource:didReceiveCloudDataRepairRequestForHome:");
}

id objc_msgSend_homeManagerDataSource_didReceiveCloudShare_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeManagerDataSource:didReceiveCloudShare:completion:");
}

id objc_msgSend_homeUserIdentifierForRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeUserIdentifierForRecord:");
}

id objc_msgSend_homeWithHomeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeWithHomeIdentifier:");
}

id objc_msgSend_homeWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeWithIdentifier:");
}

id objc_msgSend_homes(void *a1, const char *a2, ...)
{
  return _[a1 homes];
}

id objc_msgSend_homesUpdatedPromise(void *a1, const char *a2, ...)
{
  return _[a1 homesUpdatedPromise];
}

id objc_msgSend_hostChallenge(void *a1, const char *a2, ...)
{
  return _[a1 hostChallenge];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identifierForAccount_bag_bagNamespace_keyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierForAccount:bag:bagNamespace:keyName:");
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return _[a1 identifiers];
}

id objc_msgSend_identifiersForRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifiersForRecord:");
}

id objc_msgSend_identifiersForRecordZone_inDatabase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifiersForRecordZone:inDatabase:");
}

id objc_msgSend_identifiersForRecordZone_inDatabase_qualityOfService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifiersForRecordZone:inDatabase:qualityOfService:");
}

id objc_msgSend_identities(void *a1, const char *a2, ...)
{
  return _[a1 identities];
}

id objc_msgSend_ignoreThrottling(void *a1, const char *a2, ...)
{
  return _[a1 ignoreThrottling];
}

id objc_msgSend_incomingResponseIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 incomingResponseIdentifier];
}

id objc_msgSend_inexpensiveNetworkConnection(void *a1, const char *a2, ...)
{
  return _[a1 inexpensiveNetworkConnection];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return _[a1 info];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:");
}

id objc_msgSend_initWithAccount_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:bag:");
}

id objc_msgSend_initWithAccount_bag_initialAuthTokenProvider_authTokenRefreshProvider_odiAssessmentProvider_deviceIdentitySigningProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:bag:initialAuthTokenProvider:authTokenRefreshProvider:odiAssessmentProvider:deviceIdentitySigningProvider:");
}

id objc_msgSend_initWithAccount_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:options:");
}

id objc_msgSend_initWithAccount_token_environment_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:token:environment:bag:");
}

id objc_msgSend_initWithAccountAuthToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountAuthToken:");
}

id objc_msgSend_initWithAccountType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountType:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAttributes:");
}

id objc_msgSend_initWithBag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBag:");
}

id objc_msgSend_initWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBlock:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithCanRunOnBattery_delay_gracePeriod_inexpensiveNetworkConnection_priority_repeating_requiresNetwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCanRunOnBattery:delay:gracePeriod:inexpensiveNetworkConnection:priority:repeating:requiresNetwork:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithChangedRecordZones_deletedRecordZones_changeToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithChangedRecordZones:deletedRecordZones:changeToken:");
}

id objc_msgSend_initWithChangedRecords_deletedRecords_errors_changeTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithChangedRecords:deletedRecords:errors:changeTokens:");
}

id objc_msgSend_initWithCloudDataManager_homeManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCloudDataManager:homeManager:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithConfiguration_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:bag:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithContainerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainerID:");
}

id objc_msgSend_initWithContainerID_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainerID:bag:");
}

id objc_msgSend_initWithContainerID_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainerID:options:");
}

id objc_msgSend_initWithContainerIdentifier_environment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainerIdentifier:environment:");
}

id objc_msgSend_initWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:");
}

id objc_msgSend_initWithController_account_home_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithController:account:home:");
}

id objc_msgSend_initWithController_cloudShare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithController:cloudShare:");
}

id objc_msgSend_initWithController_home_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithController:home:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:");
}

id objc_msgSend_initWithDeallocGuardBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDeallocGuardBlock:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithEmailAddress_source_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEmailAddress:source:");
}

id objc_msgSend_initWithEnabledActionTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEnabledActionTypes:");
}

id objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEnvironmentName:namedDelegatePort:queue:");
}

id objc_msgSend_initWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithError:");
}

id objc_msgSend_initWithFirst_second_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFirst:second:");
}

id objc_msgSend_initWithFirstName_lastName_source_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFirstName:lastName:source:");
}

id objc_msgSend_initWithHome_dataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHome:dataSource:");
}

id objc_msgSend_initWithHome_homeUser_database_metrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHome:homeUser:database:metrics:");
}

id objc_msgSend_initWithHomeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHomeIdentifier:");
}

id objc_msgSend_initWithHomes_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHomes:options:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentifier_destination_purpose_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:destination:purpose:object:");
}

id objc_msgSend_initWithInfo_responder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInfo:responder:");
}

id objc_msgSend_initWithJSONDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithJSONDictionary:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithMaxSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMaxSize:");
}

id objc_msgSend_initWithMultiUserController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMultiUserController:");
}

id objc_msgSend_initWithMultiUserController_homes_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMultiUserController:homes:options:");
}

id objc_msgSend_initWithNameSpace_reportedScore_blindedMessage_keyID_authenticationTokenType_shouldIncludeODIAssessment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNameSpace:reportedScore:blindedMessage:keyID:authenticationTokenType:shouldIncludeODIAssessment:");
}

id objc_msgSend_initWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObject:");
}

id objc_msgSend_initWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOptions:");
}

id objc_msgSend_initWithPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPayload:");
}

id objc_msgSend_initWithPayload_andConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPayload:andConfig:");
}

id objc_msgSend_initWithPreviousServerChangeToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPreviousServerChangeToken:");
}

id objc_msgSend_initWithProtobufData_type_isResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProtobufData:type:isResponse:");
}

id objc_msgSend_initWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithReason:");
}

id objc_msgSend_initWithRecordIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordIDs:");
}

id objc_msgSend_initWithRecordName_zoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordName:zoneID:");
}

id objc_msgSend_initWithRecordType_recordID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordType:recordID:");
}

id objc_msgSend_initWithRecordZoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordZoneID:");
}

id objc_msgSend_initWithRecordZoneIDs_configurationsByRecordZoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordZoneIDs:configurationsByRecordZoneID:");
}

id objc_msgSend_initWithRecordZonesToSave_recordZoneIDsToDelete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordZonesToSave:recordZoneIDsToDelete:");
}

id objc_msgSend_initWithRecordsToSave_recordIDsToDelete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordsToSave:recordIDsToDelete:");
}

id objc_msgSend_initWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequest:");
}

id objc_msgSend_initWithResponseDictionary_expectedNamespace_expectedReportedScore_keyID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithResponseDictionary:expectedNamespace:expectedReportedScore:keyID:error:");
}

id objc_msgSend_initWithResults_failures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithResults:failures:");
}

id objc_msgSend_initWithServerEndpointIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServerEndpointIdentifier:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_initWithServiceIdentifier_forDSIDType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceIdentifier:forDSIDType:");
}

id objc_msgSend_initWithServiceIdentifier_forDSIDType_andLocationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceIdentifier:forDSIDType:andLocationBundleIdentifier:");
}

id objc_msgSend_initWithServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceName:");
}

id objc_msgSend_initWithServiceName_viewControllerClassName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceName:viewControllerClassName:");
}

id objc_msgSend_initWithSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSetting:");
}

id objc_msgSend_initWithShareInvitation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithShareInvitation:");
}

id objc_msgSend_initWithShareMetadatas_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithShareMetadatas:");
}

id objc_msgSend_initWithShareURLs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithShareURLs:");
}

id objc_msgSend_initWithShareURLs_invitationTokensByShareURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithShareURLs:invitationTokensByShareURL:");
}

id objc_msgSend_initWithSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSource:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithStringValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStringValue:");
}

id objc_msgSend_initWithSubscriptionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSubscriptionID:");
}

id objc_msgSend_initWithSubscriptionsToSave_subscriptionIDsToDelete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSubscriptionsToSave:subscriptionIDsToDelete:");
}

id objc_msgSend_initWithTDMToken_pks_keyID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTDMToken:pks:keyID:");
}

id objc_msgSend_initWithTID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTID:");
}

id objc_msgSend_initWithTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimeout:");
}

id objc_msgSend_initWithTitle_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:message:");
}

id objc_msgSend_initWithTopic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTopic:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUser:");
}

id objc_msgSend_initWithValue_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValue:action:");
}

id objc_msgSend_initWithZoneName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithZoneName:");
}

id objc_msgSend_instanceConsumers(void *a1, const char *a2, ...)
{
  return _[a1 instanceConsumers];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return _[a1 interface];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_interval(void *a1, const char *a2, ...)
{
  return _[a1 interval];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return _[a1 invalidateAndCancel];
}

id objc_msgSend_isActionSupported_withAccessControl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isActionSupported:withAccessControl:");
}

id objc_msgSend_isActionSupportedForType_account_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isActionSupportedForType:account:options:error:");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return _[a1 isAtEnd];
}

id objc_msgSend_isAvailableForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAvailableForAccount:");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _[a1 isCancelled];
}

id objc_msgSend_isConnectionEntitled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isConnectionEntitled:");
}

id objc_msgSend_isCurrentDeviceAccessory(void *a1, const char *a2, ...)
{
  return _[a1 isCurrentDeviceAccessory];
}

id objc_msgSend_isCurrentUserOwner(void *a1, const char *a2, ...)
{
  return _[a1 isCurrentUserOwner];
}

id objc_msgSend_isCurrentUserRestrictedGuest(void *a1, const char *a2, ...)
{
  return _[a1 isCurrentUserRestrictedGuest];
}

id objc_msgSend_isDefaultRecordZone(void *a1, const char *a2, ...)
{
  return _[a1 isDefaultRecordZone];
}

id objc_msgSend_isDeviceInBiometricLockout(void *a1, const char *a2, ...)
{
  return _[a1 isDeviceInBiometricLockout];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExpired(void *a1, const char *a2, ...)
{
  return _[a1 isExpired];
}

id objc_msgSend_isIdentityMapValid(void *a1, const char *a2, ...)
{
  return _[a1 isIdentityMapValid];
}

id objc_msgSend_isLocallyPaired(void *a1, const char *a2, ...)
{
  return _[a1 isLocallyPaired];
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isMultiUserEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isMultiUserEnabled];
}

id objc_msgSend_isPaidBuyV2(void *a1, const char *a2, ...)
{
  return _[a1 isPaidBuyV2];
}

id objc_msgSend_isPrimary(void *a1, const char *a2, ...)
{
  return _[a1 isPrimary];
}

id objc_msgSend_isPrivateDatabase(void *a1, const char *a2, ...)
{
  return _[a1 isPrivateDatabase];
}

id objc_msgSend_isReply(void *a1, const char *a2, ...)
{
  return _[a1 isReply];
}

id objc_msgSend_isRestrictedGuest(void *a1, const char *a2, ...)
{
  return _[a1 isRestrictedGuest];
}

id objc_msgSend_isRestrictedGuestUserIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRestrictedGuestUserIdentifier:");
}

id objc_msgSend_isRunningUnitTests(void *a1, const char *a2, ...)
{
  return _[a1 isRunningUnitTests];
}

id objc_msgSend_isScheduled(void *a1, const char *a2, ...)
{
  return _[a1 isScheduled];
}

id objc_msgSend_isSharedDatabase(void *a1, const char *a2, ...)
{
  return _[a1 isSharedDatabase];
}

id objc_msgSend_isTVPlusSubscriber(void *a1, const char *a2, ...)
{
  return _[a1 isTVPlusSubscriber];
}

id objc_msgSend_isUserInitiated(void *a1, const char *a2, ...)
{
  return _[a1 isUserInitiated];
}

id objc_msgSend_isValidEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidEnvironment:");
}

id objc_msgSend_isValidJSONObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidJSONObject:");
}

id objc_msgSend_k0p7Rchr49btq6wB_HY6FXG20397zwmVg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "k0p7Rchr49btq6wB:HY6FXG20397zwmVg:");
}

id objc_msgSend_k4eQYhyzyebbQqys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "k4eQYhyzyebbQqys:");
}

id objc_msgSend_keyID(void *a1, const char *a2, ...)
{
  return _[a1 keyID];
}

id objc_msgSend_keyIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 keyIdentifier];
}

id objc_msgSend_keyPath(void *a1, const char *a2, ...)
{
  return _[a1 keyPath];
}

id objc_msgSend_l7UrdRfCzeduYqtA_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "l7UrdRfCzeduYqtA:");
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return _[a1 lastName];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_linkedDevicesWithRelationship_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linkedDevicesWithRelationship:");
}

id objc_msgSend_listeningHistoryUpdateEnabledForUser_home_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listeningHistoryUpdateEnabledForUser:home:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_lockUptimeDictionary(void *a1, const char *a2, ...)
{
  return _[a1 lockUptimeDictionary];
}

id objc_msgSend_logKey(void *a1, const char *a2, ...)
{
  return _[a1 logKey];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_machServiceName(void *a1, const char *a2, ...)
{
  return _[a1 machServiceName];
}

id objc_msgSend_manualSyncFor_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "manualSyncFor:completionHandler:");
}

id objc_msgSend_mediaContentProfileAccessControlForHome_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaContentProfileAccessControlForHome:");
}

id objc_msgSend_mediaProfileEnabledForUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaProfileEnabledForUser:");
}

id objc_msgSend_mediaProfileEnabledForUser_home_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaProfileEnabledForUser:home:");
}

id objc_msgSend_messageFromProtoMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageFromProtoMessage:");
}

id objc_msgSend_messageID(void *a1, const char *a2, ...)
{
  return _[a1 messageID];
}

id objc_msgSend_methodForSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "methodForSelector:");
}

id objc_msgSend_metrics(void *a1, const char *a2, ...)
{
  return _[a1 metrics];
}

id objc_msgSend_metricsEvent(void *a1, const char *a2, ...)
{
  return _[a1 metricsEvent];
}

id objc_msgSend_metricsIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 metricsIdentifier];
}

id objc_msgSend_multiUserAuthBeginDate(void *a1, const char *a2, ...)
{
  return _[a1 multiUserAuthBeginDate];
}

id objc_msgSend_multiUserContainerID(void *a1, const char *a2, ...)
{
  return _[a1 multiUserContainerID];
}

id objc_msgSend_multiUserController(void *a1, const char *a2, ...)
{
  return _[a1 multiUserController];
}

id objc_msgSend_multiUserGenerateTokenBeginDate(void *a1, const char *a2, ...)
{
  return _[a1 multiUserGenerateTokenBeginDate];
}

id objc_msgSend_multiUserStatus(void *a1, const char *a2, ...)
{
  return _[a1 multiUserStatus];
}

id objc_msgSend_multiUserStatusForHomeUser_inHome_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "multiUserStatusForHomeUser:inHome:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nameComponents(void *a1, const char *a2, ...)
{
  return _[a1 nameComponents];
}

id objc_msgSend_nameSpace(void *a1, const char *a2, ...)
{
  return _[a1 nameSpace];
}

id objc_msgSend_needsiTunesMultiUserRepair(void *a1, const char *a2, ...)
{
  return _[a1 needsiTunesMultiUserRepair];
}

id objc_msgSend_newHandleWithDefinition_configurationContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newHandleWithDefinition:configurationContext:");
}

id objc_msgSend_newScore(void *a1, const char *a2, ...)
{
  return _[a1 newScore];
}

id objc_msgSend_nonce(void *a1, const char *a2, ...)
{
  return _[a1 nonce];
}

id objc_msgSend_notificationFromRemoteNotificationDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationFromRemoteNotificationDictionary:");
}

id objc_msgSend_notifyDismissDialogWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDismissDialogWithIdentifier:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectForSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForSetting:");
}

id objc_msgSend_odiSession(void *a1, const char *a2, ...)
{
  return _[a1 odiSession];
}

id objc_msgSend_optionalWithNil(void *a1, const char *a2, ...)
{
  return _[a1 optionalWithNil];
}

id objc_msgSend_optionalWithValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionalWithValue:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_origin(void *a1, const char *a2, ...)
{
  return _[a1 origin];
}

id objc_msgSend_outgoingMessageReplyHandlers(void *a1, const char *a2, ...)
{
  return _[a1 outgoingMessageReplyHandlers];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 outgoingResponseIdentifier];
}

id objc_msgSend_owner(void *a1, const char *a2, ...)
{
  return _[a1 owner];
}

id objc_msgSend_ownerName(void *a1, const char *a2, ...)
{
  return _[a1 ownerName];
}

id objc_msgSend_pEmail(void *a1, const char *a2, ...)
{
  return _[a1 pEmail];
}

id objc_msgSend_pPhone(void *a1, const char *a2, ...)
{
  return _[a1 pPhone];
}

id objc_msgSend_participantRole(void *a1, const char *a2, ...)
{
  return _[a1 participantRole];
}

id objc_msgSend_participantStatus(void *a1, const char *a2, ...)
{
  return _[a1 participantStatus];
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return _[a1 participants];
}

id objc_msgSend_passcodeStringPromise(void *a1, const char *a2, ...)
{
  return _[a1 passcodeStringPromise];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_paymentHardwareStatusWithType_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "paymentHardwareStatusWithType:completion:");
}

id objc_msgSend_paymentHardwareType(void *a1, const char *a2, ...)
{
  return _[a1 paymentHardwareType];
}

id objc_msgSend_paymentServicesMerchantURLForAPIType_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "paymentServicesMerchantURLForAPIType:completion:");
}

id objc_msgSend_perform(void *a1, const char *a2, ...)
{
  return _[a1 perform];
}

id objc_msgSend_performAuthKitUpdate(void *a1, const char *a2, ...)
{
  return _[a1 performAuthKitUpdate];
}

id objc_msgSend_performAuthentication(void *a1, const char *a2, ...)
{
  return _[a1 performAuthentication];
}

id objc_msgSend_performBinaryTaskWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBinaryTaskWithBlock:");
}

id objc_msgSend_performBiometricTokenUpdateWithAccount_clientInfo_additionalDialogMetrics_shouldGenerateKeysOnly_shouldRequestConfirmation_userInitiated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBiometricTokenUpdateWithAccount:clientInfo:additionalDialogMetrics:shouldGenerateKeysOnly:shouldRequestConfirmation:userInitiated:completion:");
}

id objc_msgSend_performBlindingWithTransactionID_keyID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlindingWithTransactionID:keyID:");
}

id objc_msgSend_performClientCertChainRequest(void *a1, const char *a2, ...)
{
  return _[a1 performClientCertChainRequest];
}

id objc_msgSend_performMigrationWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performMigrationWithOptions:");
}

id objc_msgSend_performOnStartup(void *a1, const char *a2, ...)
{
  return _[a1 performOnStartup];
}

id objc_msgSend_performReceiveFraudReportForServiceRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performReceiveFraudReportForServiceRequest:");
}

id objc_msgSend_performSignatureFromService(void *a1, const char *a2, ...)
{
  return _[a1 performSignatureFromService];
}

id objc_msgSend_performTask(void *a1, const char *a2, ...)
{
  return _[a1 performTask];
}

id objc_msgSend_performTaskWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTaskWithBlock:");
}

id objc_msgSend_performTaskWithPromiseBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTaskWithPromiseBlock:");
}

id objc_msgSend_performUnBlindingFraudReportForResponse_tdmToken_pks_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performUnBlindingFraudReportForResponse:tdmToken:pks:error:");
}

id objc_msgSend_performUpdate(void *a1, const char *a2, ...)
{
  return _[a1 performUpdate];
}

id objc_msgSend_persistChangedRecordZonesChangeToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistChangedRecordZonesChangeToken:");
}

id objc_msgSend_phone(void *a1, const char *a2, ...)
{
  return _[a1 phone];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 phoneNumber];
}

id objc_msgSend_pks(void *a1, const char *a2, ...)
{
  return _[a1 pks];
}

id objc_msgSend_pollingIntervalFromBag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pollingIntervalFromBag:");
}

id objc_msgSend_postNotification_bag_centerBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotification:bag:centerBundleId:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_preferredAttestationStyle(void *a1, const char *a2, ...)
{
  return _[a1 preferredAttestationStyle];
}

id objc_msgSend_prepareBindingsFromContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareBindingsFromContext:");
}

id objc_msgSend_prepareScoreMessage(void *a1, const char *a2, ...)
{
  return _[a1 prepareScoreMessage];
}

id objc_msgSend_previousCloudContainerStatus(void *a1, const char *a2, ...)
{
  return _[a1 previousCloudContainerStatus];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return _[a1 priority];
}

id objc_msgSend_privateDatabase(void *a1, const char *a2, ...)
{
  return _[a1 privateDatabase];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_promiseAdapter(void *a1, const char *a2, ...)
{
  return _[a1 promiseAdapter];
}

id objc_msgSend_promiseForEnqueueingEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promiseForEnqueueingEvents:");
}

id objc_msgSend_promiseWithAll_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promiseWithAll:");
}

id objc_msgSend_promiseWithAll_timeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promiseWithAll:timeout:");
}

id objc_msgSend_promiseWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promiseWithError:");
}

id objc_msgSend_promiseWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promiseWithResult:");
}

id objc_msgSend_promiseWithSuccess(void *a1, const char *a2, ...)
{
  return _[a1 promiseWithSuccess];
}

id objc_msgSend_promiseWithTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promiseWithTimeout:");
}

id objc_msgSend_proofData(void *a1, const char *a2, ...)
{
  return _[a1 proofData];
}

id objc_msgSend_provideFeedbackOnPayloadOutcome_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provideFeedbackOnPayloadOutcome:");
}

id objc_msgSend_provideFeedbackOnPayloadOutcome_sessionIdentifier_clearCache_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provideFeedbackOnPayloadOutcome:sessionIdentifier:clearCache:completion:");
}

id objc_msgSend_provideFeedbackWithOutcome_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provideFeedbackWithOutcome:");
}

id objc_msgSend_purchaseIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 purchaseIdentifier];
}

id objc_msgSend_purpose(void *a1, const char *a2, ...)
{
  return _[a1 purpose];
}

id objc_msgSend_pushEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 pushEnvironment];
}

id objc_msgSend_pushHandler(void *a1, const char *a2, ...)
{
  return _[a1 pushHandler];
}

id objc_msgSend_pushNotificationTopic(void *a1, const char *a2, ...)
{
  return _[a1 pushNotificationTopic];
}

id objc_msgSend_pushTopic(void *a1, const char *a2, ...)
{
  return _[a1 pushTopic];
}

id objc_msgSend_qualityOfService(void *a1, const char *a2, ...)
{
  return _[a1 qualityOfService];
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryItemWithName:value:");
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return _[a1 queryItems];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_queueMetricsEventFor_appID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queueMetricsEventFor:appID:completionHandler:");
}

id objc_msgSend_readWrite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readWrite:");
}

id objc_msgSend_reasonDescription(void *a1, const char *a2, ...)
{
  return _[a1 reasonDescription];
}

id objc_msgSend_reasonType(void *a1, const char *a2, ...)
{
  return _[a1 reasonType];
}

id objc_msgSend_recordZoneEncryption(void *a1, const char *a2, ...)
{
  return _[a1 recordZoneEncryption];
}

id objc_msgSend_refreshWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshWithOptions:");
}

id objc_msgSend_refreshWithOptions_metrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshWithOptions:metrics:");
}

id objc_msgSend_regenerateKeys(void *a1, const char *a2, ...)
{
  return _[a1 regenerateKeys];
}

id objc_msgSend_registerForContainerIDs_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForContainerIDs:completion:");
}

id objc_msgSend_registerObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerObserver:");
}

id objc_msgSend_registerTaskQueue(void *a1, const char *a2, ...)
{
  return _[a1 registerTaskQueue];
}

id objc_msgSend_registerToAcceptCloudSharesForContainers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerToAcceptCloudSharesForContainers:");
}

id objc_msgSend_releaseKeepAliveTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseKeepAliveTransaction:");
}

id objc_msgSend_remoteConnection(void *a1, const char *a2, ...)
{
  return _[a1 remoteConnection];
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeActivity:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeDataFor_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDataFor:completionHandler:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeParticipant:");
}

id objc_msgSend_repeating(void *a1, const char *a2, ...)
{
  return _[a1 repeating];
}

id objc_msgSend_repeats(void *a1, const char *a2, ...)
{
  return _[a1 repeats];
}

id objc_msgSend_reportedScore(void *a1, const char *a2, ...)
{
  return _[a1 reportedScore];
}

id objc_msgSend_requestBodyParametersForRequest_odiAssessmentProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestBodyParametersForRequest:odiAssessmentProvider:");
}

id objc_msgSend_requestEncoderWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestEncoderWithAccount:");
}

id objc_msgSend_requestWithMethod_URL_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithMethod:URL:parameters:");
}

id objc_msgSend_requestWithMethod_bagURL_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithMethod:bagURL:parameters:");
}

id objc_msgSend_requireInexpensiveNetworkConnection(void *a1, const char *a2, ...)
{
  return _[a1 requireInexpensiveNetworkConnection];
}

id objc_msgSend_requireNetworkConnection(void *a1, const char *a2, ...)
{
  return _[a1 requireNetworkConnection];
}

id objc_msgSend_requiresNetwork(void *a1, const char *a2, ...)
{
  return _[a1 requiresNetwork];
}

id objc_msgSend_responderWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responderWithHandler:");
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _[a1 response];
}

id objc_msgSend_resultWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultWithCompletion:");
}

id objc_msgSend_resultWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultWithError:");
}

id objc_msgSend_resultWithTimeout_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultWithTimeout:error:");
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return _[a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_retainer(void *a1, const char *a2, ...)
{
  return _[a1 retainer];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _[a1 role];
}

id objc_msgSend_rootGroup(void *a1, const char *a2, ...)
{
  return _[a1 rootGroup];
}

id objc_msgSend_runActivityQueuedByScheduler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runActivityQueuedByScheduler:");
}

id objc_msgSend_runUntilIdleExit(void *a1, const char *a2, ...)
{
  return _[a1 runUntilIdleExit];
}

id objc_msgSend_saveIdentityMap(void *a1, const char *a2, ...)
{
  return _[a1 saveIdentityMap];
}

id objc_msgSend_saveRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveRecord:");
}

id objc_msgSend_saveRecordZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveRecordZone:");
}

id objc_msgSend_scanLocation(void *a1, const char *a2, ...)
{
  return _[a1 scanLocation];
}

id objc_msgSend_scanUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanUnsignedLongLong:");
}

id objc_msgSend_scanUpToString_intoString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanUpToString:intoString:");
}

id objc_msgSend_schedule(void *a1, const char *a2, ...)
{
  return _[a1 schedule];
}

id objc_msgSend_scheduleIfNeededActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleIfNeededActivity:");
}

id objc_msgSend_scheduleSyncFromPushWithDsid_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleSyncFromPushWithDsid:completionHandler:");
}

id objc_msgSend_scheduleWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleWithBlock:");
}

id objc_msgSend_schedulingInterval(void *a1, const char *a2, ...)
{
  return _[a1 schedulingInterval];
}

id objc_msgSend_scope(void *a1, const char *a2, ...)
{
  return _[a1 scope];
}

id objc_msgSend_scoreWithScoreRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scoreWithScoreRequest:completionHandler:");
}

id objc_msgSend_scorerWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scorerWithContext:");
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return _[a1 second];
}

id objc_msgSend_seid(void *a1, const char *a2, ...)
{
  return _[a1 seid];
}

id objc_msgSend_selectedActionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 selectedActionIdentifier];
}

id objc_msgSend_sendCloudShare_inContainer_toOwnerOfHome_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCloudShare:inContainer:toOwnerOfHome:");
}

id objc_msgSend_sendProtobuf_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendProtobuf:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return _[a1 serialNumber];
}

id objc_msgSend_serverEndpointIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 serverEndpointIdentifier];
}

id objc_msgSend_serverTimeFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverTimeFromDate:");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _[a1 service];
}

id objc_msgSend_serviceInterface(void *a1, const char *a2, ...)
{
  return _[a1 serviceInterface];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _[a1 serviceName];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_setAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccount:");
}

id objc_msgSend_setAccountMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountMediaType:");
}

id objc_msgSend_setActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActions:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setActivityBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityBlock:");
}

id objc_msgSend_setAdditionalDialogMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdditionalDialogMetrics:");
}

id objc_msgSend_setAllowBattery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowBattery:");
}

id objc_msgSend_setAppProvidedContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppProvidedContext:");
}

id objc_msgSend_setAppProvidedData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppProvidedData:");
}

id objc_msgSend_setAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:");
}

id objc_msgSend_setAuthenticationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticationType:");
}

id objc_msgSend_setButtonActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonActions:");
}

id objc_msgSend_setCachedMessages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedMessages:");
}

id objc_msgSend_setCallerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallerID:");
}

id objc_msgSend_setCanMakeAccountActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanMakeAccountActive:");
}

id objc_msgSend_setCanaryIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanaryIdentifier:");
}

id objc_msgSend_setCategoryIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategoryIdentifier:");
}

id objc_msgSend_setCheckDiagnosticsAndUsageSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCheckDiagnosticsAndUsageSetting:");
}

id objc_msgSend_setClientInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientInfo:");
}

id objc_msgSend_setCloudKitFetchBeginDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudKitFetchBeginDate:");
}

id objc_msgSend_setCloudKitSaveBeginDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudKitSaveBeginDate:");
}

id objc_msgSend_setConsumed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConsumed:");
}

id objc_msgSend_setCreateIfMissing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCreateIfMissing:");
}

id objc_msgSend_setCurrentBuildVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentBuildVersion:");
}

id objc_msgSend_setCurrentUserNeedsTokenRepair_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentUserNeedsTokenRepair:");
}

id objc_msgSend_setDebugReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDebugReason:");
}

id objc_msgSend_setDefaultURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultURL:");
}

id objc_msgSend_setDefaultValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultValue:forKey:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestination:");
}

id objc_msgSend_setDeviceBiometricsState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceBiometricsState:");
}

id objc_msgSend_setDialogOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDialogOptions:");
}

id objc_msgSend_setEmail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEmail:");
}

id objc_msgSend_setEnabledThrottling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabledThrottling:");
}

id objc_msgSend_setEndpointID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndpointID:");
}

id objc_msgSend_setEndpointIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndpointIdentifier:");
}

id objc_msgSend_setErrors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrors:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFetchDatabaseChangesCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchDatabaseChangesCompletionBlock:");
}

id objc_msgSend_setFetchRecordZoneChangesCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchRecordZoneChangesCompletionBlock:");
}

id objc_msgSend_setFetchRecordZonesCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchRecordZonesCompletionBlock:");
}

id objc_msgSend_setFetchRecordsCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchRecordsCompletionBlock:");
}

id objc_msgSend_setField_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setField:forKey:");
}

id objc_msgSend_setFirstName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstName:");
}

id objc_msgSend_setFullName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFullName:");
}

id objc_msgSend_setHomeKitRepairRequestBeginDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHomeKitRepairRequestBeginDate:");
}

id objc_msgSend_setHomeManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHomeManager:");
}

id objc_msgSend_setIdentities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentities:");
}

id objc_msgSend_setIgnoreThrottling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIgnoreThrottling:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterval:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsReply:");
}

id objc_msgSend_setLastCarrierOfferRegistrationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastCarrierOfferRegistrationDate:");
}

id objc_msgSend_setLastName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastName:");
}

id objc_msgSend_setLogKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLogKey:");
}

id objc_msgSend_setLogUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLogUUID:");
}

id objc_msgSend_setMarkAsParticipantNeedsNewInvitationToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMarkAsParticipantNeedsNewInvitationToken:");
}

id objc_msgSend_setMessageData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessageData:");
}

id objc_msgSend_setMessageID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessageID:");
}

id objc_msgSend_setMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetrics:");
}

id objc_msgSend_setMetricsEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetricsEvent:");
}

id objc_msgSend_setModifyRecordZonesCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifyRecordZonesCompletionBlock:");
}

id objc_msgSend_setModifyRecordsCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifyRecordsCompletionBlock:");
}

id objc_msgSend_setModifySubscriptionsCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifySubscriptionsCompletionBlock:");
}

id objc_msgSend_setMultiUserAuthBeginDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMultiUserAuthBeginDate:");
}

id objc_msgSend_setMultiUserGenerateTokenBeginDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMultiUserGenerateTokenBeginDate:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNeedsiTunesMultiUserRepair_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsiTunesMultiUserRepair:completion:");
}

id objc_msgSend_setNonce_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNonce:");
}

id objc_msgSend_setNotificationInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationInfo:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOrigin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrigin:");
}

id objc_msgSend_setOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverride:");
}

id objc_msgSend_setPEmail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPEmail:");
}

id objc_msgSend_setPPhone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPPhone:");
}

id objc_msgSend_setPasscodeStringPromise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPasscodeStringPromise:");
}

id objc_msgSend_setPerShareCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPerShareCompletionBlock:");
}

id objc_msgSend_setPerShareMetadataBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPerShareMetadataBlock:");
}

id objc_msgSend_setPhone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhone:");
}

id objc_msgSend_setPhoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhoneNumber:");
}

id objc_msgSend_setPreregistered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreregistered:");
}

id objc_msgSend_setPreviousBuildVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousBuildVersion:");
}

id objc_msgSend_setPreviousServerChangeToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousServerChangeToken:");
}

id objc_msgSend_setPurpose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurpose:");
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQualityOfService:");
}

id objc_msgSend_setQuery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQuery:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setReasonDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReasonDescription:");
}

id objc_msgSend_setReasonType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReasonType:");
}

id objc_msgSend_setReceiptDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReceiptDate:");
}

id objc_msgSend_setRecordWasChangedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordWasChangedBlock:");
}

id objc_msgSend_setRecordWithIDWasDeletedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordWithIDWasDeletedBlock:");
}

id objc_msgSend_setRecordZoneEncryption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordZoneEncryption:");
}

id objc_msgSend_setRecordZoneFetchCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordZoneFetchCompletionBlock:");
}

id objc_msgSend_setRecordZoneWithIDChangedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordZoneWithIDChangedBlock:");
}

id objc_msgSend_setRecordZoneWithIDWasDeletedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordZoneWithIDWasDeletedBlock:");
}

id objc_msgSend_setRegenerateKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegenerateKeys:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRepeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRepeats:");
}

id objc_msgSend_setRequestEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestEncoding:");
}

id objc_msgSend_setRequireNetworkConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequireNetworkConnection:");
}

id objc_msgSend_setRunMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRunMode:");
}

id objc_msgSend_setScanLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScanLocation:");
}

id objc_msgSend_setScenario_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScenario:");
}

id objc_msgSend_setScheduled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScheduled:");
}

id objc_msgSend_setSchedulingInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSchedulingInterval:");
}

id objc_msgSend_setServiceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceIdentifier:");
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSession:");
}

id objc_msgSend_setSettingsType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSettingsType:");
}

id objc_msgSend_setShouldGenerateKeysOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldGenerateKeysOnly:");
}

id objc_msgSend_setShouldRequestConfirmation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldRequestConfirmation:");
}

id objc_msgSend_setShouldSendContentAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldSendContentAvailable:");
}

id objc_msgSend_setShouldUseCloudData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldUseCloudData:");
}

id objc_msgSend_setState_forAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:forAccount:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setThrottlingInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThrottlingInterval:");
}

id objc_msgSend_setTokenNeedsRegeneration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTokenNeedsRegeneration:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUrlKnownToBeTrusted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUrlKnownToBeTrusted:");
}

id objc_msgSend_setUseZoneWidePCS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseZoneWidePCS:");
}

id objc_msgSend_setUserInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInitiated:");
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsername:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setting(void *a1, const char *a2, ...)
{
  return _[a1 setting];
}

id objc_msgSend_settingForKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingForKeyPath:");
}

id objc_msgSend_settingForKeyPath_user_home_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingForKeyPath:user:home:");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _[a1 settings];
}

id objc_msgSend_settingsFromContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsFromContext:");
}

id objc_msgSend_settingsType(void *a1, const char *a2, ...)
{
  return _[a1 settingsType];
}

id objc_msgSend_share(void *a1, const char *a2, ...)
{
  return _[a1 share];
}

id objc_msgSend_shareForRecordZoneIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareForRecordZoneIdentifier:");
}

id objc_msgSend_shareInvitation(void *a1, const char *a2, ...)
{
  return _[a1 shareInvitation];
}

id objc_msgSend_shareToken(void *a1, const char *a2, ...)
{
  return _[a1 shareToken];
}

id objc_msgSend_shareURL(void *a1, const char *a2, ...)
{
  return _[a1 shareURL];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedAccountsConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccountsConfig];
}

id objc_msgSend_sharedAccountsCookiesConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccountsCookiesConfig];
}

id objc_msgSend_sharedAccountsDaemonConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccountsDaemonConfig];
}

id objc_msgSend_sharedAccountsMultiUserConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccountsMultiUserConfig];
}

id objc_msgSend_sharedAttestationConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedAttestationConfig];
}

id objc_msgSend_sharedBiometricsConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedBiometricsConfig];
}

id objc_msgSend_sharedConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedConfig];
}

id objc_msgSend_sharedConfigOversize(void *a1, const char *a2, ...)
{
  return _[a1 sharedConfigOversize];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return _[a1 sharedController];
}

id objc_msgSend_sharedDatabase(void *a1, const char *a2, ...)
{
  return _[a1 sharedDatabase];
}

id objc_msgSend_sharedFraudReportConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedFraudReportConfig];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedPerformQueue(void *a1, const char *a2, ...)
{
  return _[a1 sharedPerformQueue];
}

id objc_msgSend_sharedPurchaseConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedPurchaseConfig];
}

id objc_msgSend_sharedPushNotificationConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedPushNotificationConfig];
}

id objc_msgSend_sharedQueue(void *a1, const char *a2, ...)
{
  return _[a1 sharedQueue];
}

id objc_msgSend_sharedRegulatoryEligibilityConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedRegulatoryEligibilityConfig];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return _[a1 sharedService];
}

id objc_msgSend_shouldAttemptApplePayWithCountryCode_paymentNetworks_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAttemptApplePayWithCountryCode:paymentNetworks:completion:");
}

id objc_msgSend_shouldEnablePushTopic(void *a1, const char *a2, ...)
{
  return _[a1 shouldEnablePushTopic];
}

id objc_msgSend_shouldGenerateKeysOnly(void *a1, const char *a2, ...)
{
  return _[a1 shouldGenerateKeysOnly];
}

id objc_msgSend_shouldHandleNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldHandleNotification:");
}

id objc_msgSend_shouldIncludeODIAssessment(void *a1, const char *a2, ...)
{
  return _[a1 shouldIncludeODIAssessment];
}

id objc_msgSend_shouldPerformForAccount_environment_token_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldPerformForAccount:environment:token:");
}

id objc_msgSend_shouldRequestConfirmation(void *a1, const char *a2, ...)
{
  return _[a1 shouldRequestConfirmation];
}

id objc_msgSend_shouldUseCloudData(void *a1, const char *a2, ...)
{
  return _[a1 shouldUseCloudData];
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return _[a1 shutdown];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _[a1 source];
}

id objc_msgSend_stateForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateForAccount:");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _[a1 statusCode];
}

id objc_msgSend_statusType(void *a1, const char *a2, ...)
{
  return _[a1 statusType];
}

id objc_msgSend_storePrimaryCert_intermediateCert_privateKey_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storePrimaryCert:intermediateCert:privateKey:options:error:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_subscribeWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeWithIdentifier:");
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return _[a1 systemUptime];
}

id objc_msgSend_takeKeepAliveTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "takeKeepAliveTransaction:");
}

id objc_msgSend_takeKeepAliveTransaction_whilePerformingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "takeKeepAliveTransaction:whilePerformingBlock:");
}

id objc_msgSend_takeKeepAliveTransaction_withQueue_postActionQueue_whilePerformingBlockOnQueue_postAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "takeKeepAliveTransaction:withQueue:postActionQueue:whilePerformingBlockOnQueue:postAction:");
}

id objc_msgSend_takeKeepAliveTransaction_withQueue_whilePerformingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "takeKeepAliveTransaction:withQueue:whilePerformingBlock:");
}

id objc_msgSend_takeKeepAliveTransaction_withQueue_whilePerformingSyncBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "takeKeepAliveTransaction:withQueue:whilePerformingSyncBlock:");
}

id objc_msgSend_taskQueue(void *a1, const char *a2, ...)
{
  return _[a1 taskQueue];
}

id objc_msgSend_tdmToken(void *a1, const char *a2, ...)
{
  return _[a1 tdmToken];
}

id objc_msgSend_teardownMultiUser(void *a1, const char *a2, ...)
{
  return _[a1 teardownMultiUser];
}

id objc_msgSend_thenWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thenWithBlock:");
}

id objc_msgSend_throttlingInterval(void *a1, const char *a2, ...)
{
  return _[a1 throttlingInterval];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_toDictionary(void *a1, const char *a2, ...)
{
  return _[a1 toDictionary];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return _[a1 token];
}

id objc_msgSend_tokenNeedsRegeneration(void *a1, const char *a2, ...)
{
  return _[a1 tokenNeedsRegeneration];
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return _[a1 topic];
}

id objc_msgSend_transactionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 transactionIdentifier];
}

id objc_msgSend_transactions(void *a1, const char *a2, ...)
{
  return _[a1 transactions];
}

id objc_msgSend_transactionsAccessQueue(void *a1, const char *a2, ...)
{
  return _[a1 transactionsAccessQueue];
}

id objc_msgSend_transactionsCount(void *a1, const char *a2, ...)
{
  return _[a1 transactionsCount];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_uTtwJoGUgL3N0GVz(void *a1, const char *a2, ...)
{
  return _[a1 uTtwJoGUgL3N0GVz];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongValue];
}

id objc_msgSend_update(void *a1, const char *a2, ...)
{
  return _[a1 update];
}

id objc_msgSend_updateCacheForAccountDSID_withCacheTypeIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCacheForAccountDSID:withCacheTypeIDs:");
}

id objc_msgSend_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCookiesWithCookiePropertiesToAdd:cookiePropertiesToRemove:error:");
}

id objc_msgSend_updateIfNeededWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIfNeededWithCompletionHandler:");
}

id objc_msgSend_updateMultiUserTokenForAccount_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMultiUserTokenForAccount:completion:");
}

id objc_msgSend_updateODIWithAttributes_forSessionIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateODIWithAttributes:forSessionIdentifier:completion:");
}

id objc_msgSend_updateWithAdditionalAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithAdditionalAttributes:");
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return _[a1 user];
}

id objc_msgSend_userCloudShareManager(void *a1, const char *a2, ...)
{
  return _[a1 userCloudShareManager];
}

id objc_msgSend_userIdentity(void *a1, const char *a2, ...)
{
  return _[a1 userIdentity];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userSettingsForHome_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userSettingsForHome:");
}

id objc_msgSend_userWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userWithIdentifier:");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_users(void *a1, const char *a2, ...)
{
  return _[a1 users];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valuePromise(void *a1, const char *a2, ...)
{
  return _[a1 valuePromise];
}

id objc_msgSend_valueWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithError:");
}

id objc_msgSend_valueWithWeakObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithWeakObject:");
}

id objc_msgSend_verifyPasscode(void *a1, const char *a2, ...)
{
  return _[a1 verifyPasscode];
}

id objc_msgSend_waitUntilFinished(void *a1, const char *a2, ...)
{
  return _[a1 waitUntilFinished];
}

id objc_msgSend_weakObjectValue(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectValue];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return _[a1 workQueue];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:options:error:");
}

id objc_msgSend_xs00laTiKIpDUzDP_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xs00laTiKIpDUzDP:");
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return _[a1 zoneID];
}

id objc_msgSend_zoneIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 zoneIdentifier];
}

id objc_msgSend_zoneName(void *a1, const char *a2, ...)
{
  return _[a1 zoneName];
}