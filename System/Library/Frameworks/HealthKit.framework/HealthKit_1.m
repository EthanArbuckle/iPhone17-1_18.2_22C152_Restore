uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGIsDeviceOfType()
{
  return MEMORY[0x1F417CE40]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1F40E7228]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1F40E7298](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1F41471D8]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1F41471F0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1F40F6AD0](certificate);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x1F40F6B10](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1F40F6B80](allocator, data);
}

CFDataRef SecKeyCreateEncryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef plaintext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6EB0](key, algorithm, plaintext, error);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1F40F70F0](rnd, count, bytes);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1F40F7128](task, error);
}

CFDictionaryRef SecTaskCopyValuesForEntitlements(SecTaskRef task, CFArrayRef entitlements, CFErrorRef *error)
{
  return (CFDictionaryRef)MEMORY[0x1F40F7150](task, entitlements, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return MEMORY[0x1F415CB90]();
}

uint64_t TCCAccessGetOverride()
{
  return MEMORY[0x1F415CBA8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CTServerConnectionCopyISOForMCC()
{
  return MEMORY[0x1F40DF058]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x1F40DF0C8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t PB::TextFormatter::beginObject(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x1F4147448](this, a2);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, double a3)
{
  return MEMORY[0x1F4147468](this, a2, a3);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, float a3)
{
  return MEMORY[0x1F4147470](this, a2, a3);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x1F4147478](this, a2);
}

{
  return MEMORY[0x1F4147480](this, a2);
}

void PB::Base::~Base(PB::Base *this)
{
}

uint64_t PB::Reader::recallMark()
{
  return MEMORY[0x1F41474C0]();
}

uint64_t PB::Reader::skip(PB::Reader *this)
{
  return MEMORY[0x1F41474E0](this);
}

uint64_t PB::Reader::placeMark()
{
  return MEMORY[0x1F41474E8]();
}

uint64_t PB::Reader::Reader(PB::Reader *this, const unsigned __int8 *a2)
{
  return MEMORY[0x1F41474F0](this, a2);
}

uint64_t PB::Writer::writeVarInt(PB::Writer *this)
{
  return MEMORY[0x1F4147510](this);
}

{
  return MEMORY[0x1F4147518](this);
}

uint64_t PB::Writer::writeSubmessage(PB::Writer *this, const PB::Base *a2)
{
  return MEMORY[0x1F4147530](this, a2);
}

uint64_t PB::Writer::write(PB::Writer *this, float a2)
{
  return MEMORY[0x1F4147560](this, a2);
}

uint64_t PB::Writer::Writer(PB::Writer *this)
{
  return MEMORY[0x1F4147578](this);
}

void PB::Writer::~Writer(PB::Writer *this)
{
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x1F417E400](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x1F417E550](this, *(void *)&__ecode);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x1F417E960](__s, __icase);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x1F417EAA8](retstr, __s);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x1F417ECE0](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x1F417ECE8](this);
}

void std::locale::~locale(std::locale *this)
{
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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
  return MEMORY[0x1F40CA130]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

uint64_t archive_entry_filetype()
{
  return MEMORY[0x1F417DFE8]();
}

uint64_t archive_entry_free()
{
  return MEMORY[0x1F417DFF0]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x1F417DFF8]();
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x1F417E000]();
}

uint64_t archive_entry_set_atime()
{
  return MEMORY[0x1F417E018]();
}

uint64_t archive_entry_set_birthtime()
{
  return MEMORY[0x1F417E020]();
}

uint64_t archive_entry_set_ctime()
{
  return MEMORY[0x1F417E028]();
}

uint64_t archive_entry_set_filetype()
{
  return MEMORY[0x1F417E030]();
}

uint64_t archive_entry_set_mtime()
{
  return MEMORY[0x1F417E038]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x1F417E040]();
}

uint64_t archive_entry_set_perm()
{
  return MEMORY[0x1F417E048]();
}

uint64_t archive_entry_set_size()
{
  return MEMORY[0x1F417E050]();
}

uint64_t archive_entry_size()
{
  return MEMORY[0x1F417E058]();
}

uint64_t archive_entry_size_is_set()
{
  return MEMORY[0x1F417E060]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x1F417E080]();
}

uint64_t archive_read_data()
{
  return MEMORY[0x1F417E0A0]();
}

uint64_t archive_read_data_skip()
{
  return MEMORY[0x1F417E0B8]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x1F417E110]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x1F417E118]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x1F417E120]();
}

uint64_t archive_read_open_fd()
{
  return MEMORY[0x1F417E138]();
}

uint64_t archive_read_open_filename()
{
  return MEMORY[0x1F417E140]();
}

uint64_t archive_read_open_memory()
{
  return MEMORY[0x1F417E148]();
}

uint64_t archive_read_support_filter_all()
{
  return MEMORY[0x1F417E158]();
}

uint64_t archive_read_support_format_zip()
{
  return MEMORY[0x1F417E1A0]();
}

uint64_t archive_write_close()
{
  return MEMORY[0x1F417E1D0]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x1F417E208]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x1F417E210]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x1F417E218]();
}

uint64_t archive_write_open_fd()
{
  return MEMORY[0x1F417E228]();
}

uint64_t archive_write_open_filename()
{
  return MEMORY[0x1F417E230]();
}

uint64_t archive_write_set_format_zip()
{
  return MEMORY[0x1F417E260]();
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x1F40CA4A8](a1);
}

void bzero(void *a1, size_t a2)
{
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1F40CB3D8](*(void *)&__clock_id);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1F417F0C0](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0D0](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1F417F0E0](stream, *(void *)&flags);
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x1F417A378]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x1F417A388]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

uint64_t dispatch_queue_attr_make_with_overcommit()
{
  return MEMORY[0x1F40CBBB0]();
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1F40CBDF8](*(void *)&a1);
}

uint64_t dyld_get_program_sdk_version_token()
{
  return MEMORY[0x1F40CBE30]();
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x1F40CC1A8](a1, a2);
  return result;
}

void free(void *a1)
{
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x1F417A398]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1F40CD048](*(void *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
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

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1F4188200]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1F4188208]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1F41864C8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1F41864E8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x1F4186588]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectUnownedCopyAssign()
{
  return MEMORY[0x1F4186808]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x1F4186818]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x1F4186820]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x1F4186828]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

uint64_t uameasfmt_getUnitsForUsage()
{
  return MEMORY[0x1F417F938]();
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1F40CE630](uu1, uu2);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1F40CE790](__str, __size, __format, a4);
}

void xmlDocDumpFormatMemory(xmlDocPtr cur, xmlChar **mem, int *size, int format)
{
}

void xmlFreeDoc(xmlDocPtr cur)
{
}

xmlDocPtr xmlReadMemory(const char *buffer, int size, const char *URL, const char *encoding, int options)
{
  return (xmlDocPtr)MEMORY[0x1F4182820](buffer, *(void *)&size, URL, encoding, *(void *)&options);
}

void xmlSchemaFree(xmlSchemaPtr schema)
{
}

void xmlSchemaFreeParserCtxt(xmlSchemaParserCtxtPtr ctxt)
{
}

void xmlSchemaFreeValidCtxt(xmlSchemaValidCtxtPtr ctxt)
{
}

xmlSchemaParserCtxtPtr xmlSchemaNewMemParserCtxt(const char *buffer, int size)
{
  return (xmlSchemaParserCtxtPtr)MEMORY[0x1F41828C0](buffer, *(void *)&size);
}

xmlSchemaParserCtxtPtr xmlSchemaNewParserCtxt(const char *URL)
{
  return (xmlSchemaParserCtxtPtr)MEMORY[0x1F41828C8](URL);
}

xmlSchemaValidCtxtPtr xmlSchemaNewValidCtxt(xmlSchemaPtr schema)
{
  return (xmlSchemaValidCtxtPtr)MEMORY[0x1F41828D0](schema);
}

xmlSchemaPtr xmlSchemaParse(xmlSchemaParserCtxtPtr ctxt)
{
  return (xmlSchemaPtr)MEMORY[0x1F41828D8](ctxt);
}

void xmlSchemaSetValidErrors(xmlSchemaValidCtxtPtr ctxt, xmlSchemaValidityErrorFunc err, xmlSchemaValidityWarningFunc warn, void *ctx)
{
}

int xmlSchemaValidateDoc(xmlSchemaValidCtxtPtr ctxt, xmlDocPtr instance)
{
  return MEMORY[0x1F41828F0](ctxt, instance);
}

void xmlSetGenericErrorFunc(void *ctx, xmlGenericErrorFunc handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1F40CEF20]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1F40CF250]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x1F40CF310](type);
}

xmlDocPtr xsltApplyStylesheet(xsltStylesheetPtr style, xmlDocPtr doc, const char **params)
{
  return (xmlDocPtr)MEMORY[0x1F4182AC0](style, doc, params);
}

void xsltFreeStylesheet(xsltStylesheetPtr style)
{
}

xsltStylesheetPtr xsltParseStylesheetDoc(xmlDocPtr doc)
{
  return (xsltStylesheetPtr)MEMORY[0x1F4182B40](doc);
}