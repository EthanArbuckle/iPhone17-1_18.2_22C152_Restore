id GSSDefaultLog()
{
  void *v0;
  uint64_t vars8;

  if (GSSDefaultLog_onceToken != -1) {
    dispatch_once(&GSSDefaultLog_onceToken, &__block_literal_global);
  }
  v0 = (void *)GSSDefaultLog_sLog;

  return v0;
}

id _setUpTemporaryDirectory()
{
  bzero(v4, 0x400uLL);
  [@"com.apple.SharePlay.GroupSessionService" UTF8String];
  if (!_set_user_dir_suffix() || !confstr(65537, v4, 0x400uLL) || mkdir(v4, 0x1C0u) && *__error() != 17)
  {
    v2 = GSSDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      _setUpTemporaryDirectory_cold_1();
    }
LABEL_13:

    exit(1);
  }
  bzero(v3, 0x400uLL);
  if (!realpath_DARWIN_EXTSN(v4, v3))
  {
    v2 = GSSDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      _setUpTemporaryDirectory_cold_2();
    }
    goto LABEL_13;
  }
  v0 = +[NSString stringWithUTF8String:v3];

  return v0;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

int main(int argc, const char **argv, const char **envp)
{
  _setUpSandbox(*(void *)&argc, argv, envp);
  flags = (uint64_t)[objc_allocWithZone((Class)CPFeatureFlags) init];
  v3 = (objc_class *)[self serviceListener];
  listener.super.isa = v3;
  type metadata accessor for BackgroundSessionManagerHost();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100003E70;
  *(void *)(v4 + 32) = v3;
  specialized Array._endMutation()();
  v5 = (void *)flags;
  v6 = v3;
  id v7 = v5;
  host = BackgroundSessionManagerHost.__allocating_init(listeners:featureFlags:)();
  BackgroundSessionManagerHost.resume()();
  exit(1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void _setUpTemporaryDirectory_cold_1()
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v1, v2, "failed to initialize temporary directory (%d): %s", v3, v4, v5, v6, v7);
}

void _setUpTemporaryDirectory_cold_2()
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v1, v2, "failed to resolve temporary directory (%d): %s", v3, v4, v5, v6, v7);
}

Swift::Void __swiftcall BackgroundSessionManagerHost.resume()()
{
}

uint64_t BackgroundSessionManagerHost.__allocating_init(listeners:featureFlags:)()
{
  return BackgroundSessionManagerHost.__allocating_init(listeners:featureFlags:)();
}

uint64_t type metadata accessor for BackgroundSessionManagerHost()
{
  return type metadata accessor for BackgroundSessionManagerHost();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void exit(int a1)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}