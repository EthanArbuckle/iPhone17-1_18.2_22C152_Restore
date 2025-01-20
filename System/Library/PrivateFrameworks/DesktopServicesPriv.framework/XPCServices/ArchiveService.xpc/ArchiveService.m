void sub_100004DE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100004E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100004FE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000052A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

id sub_10000533C(void *a1)
{
  id v1 = a1;
  id v2 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.desktopservices.ArchiveService"];
  v3 = DSArchiveServiceXPCInterface();
  [v2 setRemoteObjectInterface:v3];

  v4 = DSArchiveServiceStreamingXPCInterface();
  [v2 setExportedInterface:v4];

  [v2 setExportedObject:v1];
  [v2 setInterruptionHandler:&stru_10002CE80];

  return v2;
}

void sub_1000053F0(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100005420(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

void sub_100005484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100005BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100005D68(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

void sub_100005DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100005DE0(id a1, RBSAssertion *a2, NSError *a3)
{
  id v3 = a3;
  v4 = LogObj(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Archive Service archive assertion invalidated with error: %@", (uint8_t *)&v5, 0xCu);
  }
}

void sub_100005E90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005EA8(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) invalidate];
  [*(id *)(a1 + 40) invalidate];
}

void sub_100005F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100006654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1000067E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

void sub_100006844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100006858(id a1, RBSAssertion *a2, NSError *a3)
{
  id v3 = a3;
  v4 = LogObj(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Archive Service unarchive assertion invalidated with error: %@", (uint8_t *)&v5, 0xCu);
  }
}

void sub_100006908(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006920(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [v6 domain];
  if ([v7 isEqualToString:@"com.apple.desktopservices.ArchiveService"])
  {
    id v8 = [v6 code];

    if (v8 == (id)-1000)
    {
      v9 = [v6 userInfo];
      v10 = +[NSMutableDictionary dictionaryWithDictionary:v9];

      TCFURLInfo::LocalizedStringWithFileName(@"ArchiveEnterPassword", *(__CFString **)(a1 + 32), &v13);
      [v10 setObject:v13 forKeyedSubscript:NSLocalizedRecoverySuggestionErrorKey];
      sub_100007E94(&v13);
      v11 = [v6 domain];
      uint64_t v12 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v11, [v6 code], v10);

      id v6 = (id)v12;
    }
  }
  else
  {
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 40) invalidate];
  [*(id *)(a1 + 48) invalidate];
}

void sub_100006A8C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100007E94((const void **)va);

  _Unwind_Resume(a1);
}

void sub_100006FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,void *a38)
{
  _Unwind_Resume(a1);
}

void sub_1000070BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

void sub_100007124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100007138(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 40);
  v10 = [v11 url];
  (*(void (**)(uint64_t, void *, id, id))(v9 + 16))(v9, v10, v7, v8);

  [*(id *)(a1 + 32) invalidate];
}

void sub_1000071E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100007320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,void *a30)
{
  _Unwind_Resume(a1);
}

void sub_100007A18(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

void sub_100007A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100007A90(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 domain];
  if ([v7 isEqualToString:@"com.apple.desktopservices.ArchiveService"])
  {
    id v8 = [v6 code];

    if (v8 == (id)-1000)
    {
      uint64_t v9 = [v6 userInfo];
      v10 = +[NSMutableDictionary dictionaryWithDictionary:v9];

      TCFURLInfo::LocalizedStringWithFileName(@"ArchiveEnterPassword", *(__CFString **)(a1 + 32), &v14);
      [v10 setObject:v14 forKeyedSubscript:NSLocalizedRecoverySuggestionErrorKey];
      sub_100007E94(&v14);
      id v11 = [v6 domain];
      uint64_t v12 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v11, [v6 code], v10);

      id v6 = (id)v12;
    }
  }
  else
  {
  }
  v13 = [v5 url];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) invalidate];
}

void sub_100007C08(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100007E94((const void **)va);

  _Unwind_Resume(a1);
}

void sub_100007D30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100007D98(id a1)
{
  id v1 = LogObj(0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Archive Service connection interrupted", v2, 2u);
  }
}

Class sub_100007E04()
{
  if (qword_100031AC8
    || (qword_100031AC8 = (uint64_t)dlopen("/System/Library/Frameworks/FileProvider.framework/FileProvider", 2)) != 0)
  {
    Class Class = objc_getClass("FPSandboxingURLWrapper");
    qword_100031AC0 = (uint64_t)Class;
    off_100031848 = (uint64_t (*)())sub_100007E88;
  }
  else
  {
    Class Class = (Class)qword_100031AC0;
  }
  return Class;
}

id sub_100007E88()
{
  return (id)qword_100031AC0;
}

const void **sub_100007E94(const void **a1)
{
  id v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_100007EC8(void *a1)
{
}

id DSArchiveServiceXPCInterface()
{
  v0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DSArchiveServiceProtocolInternal];
  v10[0] = objc_opt_class();
  v10[1] = off_100031970();
  id v1 = +[NSArray arrayWithObjects:v10 count:2];
  id v2 = +[NSSet setWithArray:v1];
  [v0 setClasses:v2 forSelector:"archiveItemsWithURLWrappers:toURLWrapper:options:compressionFormat:passphrase:completionHandler:" argumentIndex:0 ofReply:0];

  v9[0] = objc_opt_class();
  v9[1] = off_100031970();
  id v3 = +[NSArray arrayWithObjects:v9 count:2];
  v4 = +[NSSet setWithArray:v3];
  [v0 setClasses:v4 forSelector:"archiveItemsWithURLWrappers:passphrase:addToKeychain:compressionFormat:destinationFolderURLWrapper:usePlaceholder:completionHandler:" argumentIndex:0 ofReply:0];

  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  id v5 = +[NSArray arrayWithObjects:v8 count:2];
  id v6 = +[NSSet setWithArray:v5];
  [v0 setClasses:v6 forSelector:"itemDescriptorsForItemWithURLWrapper:passphrases:completionHandler:" argumentIndex:0 ofReply:1];

  return v0;
}

void sub_1000080C0(_Unwind_Exception *a1)
{
  v4 = v2;

  _Unwind_Resume(a1);
}

id DSArchiveServiceStreamingXPCInterface()
{
  v0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DSArchiveServiceStreamingInternal];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  id v1 = +[NSArray arrayWithObjects:v4 count:2];
  id v2 = +[NSSet setWithArray:v1];
  [v0 setClasses:v2 forSelector:"receiveArchivedItemsDescriptors:placeholderName:placeholderTypeIdentifier:" argumentIndex:0 ofReply:0];

  return v0;
}

void sub_10000822C(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

Class sub_100008260()
{
  if (qword_100031AD8
    || (qword_100031AD8 = (uint64_t)dlopen("/System/Library/Frameworks/FileProvider.framework/FileProvider", 2)) != 0)
  {
    Class Class = objc_getClass("FPSandboxingURLWrapper");
    qword_100031AD0 = (uint64_t)Class;
    off_100031970 = (uint64_t (*)())sub_1000082E4;
  }
  else
  {
    Class Class = (Class)qword_100031AD0;
  }
  return Class;
}

id sub_1000082E4()
{
  return (id)qword_100031AD0;
}

uint64_t IsEqual(const void *a1, const void *a2)
{
  if (a1 == a2 || a1 && a2 && CFEqual(a1, a2)) {
    return 1;
  }
  CFURLRef v5 = (const __CFURL *)sub_1000083FC(a1);
  CFURLRef v6 = (const __CFURL *)sub_1000083FC(a2);
  uint64_t v4 = 0;
  if (v5)
  {
    CFURLRef v7 = v6;
    if (v6)
    {
      CFTypeRef cf2 = 0;
      CFTypeRef cf1 = 0;
      if (CFURLCopyResourcePropertyForKey(v5, kCFURLFileResourceIdentifierKey, &cf1, 0)
        && CFURLCopyResourcePropertyForKey(v7, kCFURLFileResourceIdentifierKey, &cf2, 0)
        && cf1)
      {
        uint64_t v4 = IsEqual(cf1, cf2);
      }
      else
      {
        uint64_t v4 = 0;
      }
      sub_10000845C(&cf2);
      sub_10000845C(&cf1);
    }
  }
  return v4;
}

void sub_1000083E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
}

const void *sub_1000083FC(const void *result)
{
  if (result)
  {
    id v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFNullGetTypeID())
    {
      return 0;
    }
    else
    {
      CFTypeID v3 = CFGetTypeID(v1);
      if (v3 == CFURLGetTypeID()) {
        return v1;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

const void **sub_10000845C(const void **a1)
{
  CFTypeID v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_100008490(const void **a1)
{
  CFTypeID v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_1000084C4()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  id v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

CFTypeRef *sub_1000084F8(CFTypeRef *a1, __CFString **a2)
{
  *a1 = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  TString::SetStringRefAsImmutable(a1, *a2);
  return a1;
}

void sub_10000853C(_Unwind_Exception *a1)
{
  sub_100007E94(v1);
  _Unwind_Resume(a1);
}

const void *sub_100008550(const void **a1)
{
  result = *a1;
  if (result)
  {
    CFTypeRef v2 = CFRetain(result);
    return sub_100008588(v2);
  }
  return result;
}

const void *sub_100008588(const void *result)
{
  if (result)
  {
    id v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFNullGetTypeID()) {
      return 0;
    }
    else {
      return v1;
    }
  }
  return result;
}

void sub_1000085C4(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

const void **sub_100008638(const void **a1)
{
  CFTypeID v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *sub_10000866C@<X0>(void *a1@<X8>)
{
  CFTypeID v2 = operator new(0x68uLL);
  result = sub_1000086B8(v2);
  *a1 = v2 + 3;
  a1[1] = v2;
  return result;
}

void sub_1000086A4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_1000086B8(void *a1)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_10002CEE0;
  TCFURLInfo::TCFURLInfo((TCFURLInfo *)(a1 + 3));
  return a1;
}

void sub_100008700(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_100008714(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_10002CEE0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_100008734(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_10002CEE0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

const void **sub_100008788(uint64_t a1)
{
  return sub_100008794(a1 + 24);
}

const void **sub_100008794(uint64_t a1)
{
  CFTypeID v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
  TFileDescriptor::~TFileDescriptor((TFileDescriptor *)(a1 + 32));
  sub_100007E94((const void **)(a1 + 24));
  sub_100007E94((const void **)(a1 + 16));
  sub_100007E94((const void **)(a1 + 8));
  return sub_1000087F8((const void **)a1);
}

const void **sub_1000087F8(const void **a1)
{
  CFTypeID v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_10000882C(const void **a1, const void **a2)
{
  if (a1 != a2)
  {
    uint64_t v4 = *a1;
    if (*a1) {
      CFRelease(v4);
    }
    *a1 = *a2;
    *a2 = 0;
  }
  return a1;
}

CFTypeRef *sub_100008878(CFTypeRef *a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  if (*a1) {
    CFRelease(*a1);
  }
  *a1 = cf;
  return a1;
}

void TDSMutex::TDSMutex(TDSMutex *this, int a2)
{
  if (a2)
  {
    pthread_mutexattr_init(&v3);
    pthread_mutexattr_settype(&v3, 2);
    pthread_mutex_init(&this->fMutex, &v3);
    pthread_mutexattr_destroy(&v3);
  }
  else
  {
    pthread_mutex_init(&this->fMutex, 0);
  }
}

void TDSMutex::~TDSMutex(TDSMutex *this)
{
}

uint64_t TDSMutex::lock(TDSMutex *this)
{
  uint64_t result = pthread_mutex_lock(&this->fMutex);
  if (result) {
    abort();
  }
  return result;
}

uint64_t TDSMutex::unlock(TDSMutex *this)
{
  uint64_t result = pthread_mutex_unlock(&this->fMutex);
  if (result) {
    abort();
  }
  return result;
}

CFTypeRef *sub_1000089C0(CFTypeRef *a1, __CFString **a2)
{
  *a1 = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  TString::SetStringRefAsImmutable(a1, *a2);
  return a1;
}

void sub_100008A04(_Unwind_Exception *a1)
{
  sub_100007E94(v1);
  _Unwind_Resume(a1);
}

const void **FileSuffix@<X0>(id *a1@<X0>, CFStringRef *a2@<X8>)
{
  pthread_mutexattr_t v3 = [*a1 pathExtension];
  CFStringRef theString = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  TString::SetStringRefAsImmutable((CFTypeRef *)&theString, v3);

  if (CFStringGetLength(theString))
  {
    TString::TString((TString *)&v7, ".", 1uLL);
    CFStringRef v4 = v7;
    *a2 = &stru_10002D5A8;
    CFRetain(&stru_10002D5A8);
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, v4);
    CFRelease(&stru_10002D5A8);
    *a2 = MutableCopy;
    TString::Append(a2, &theString);
    sub_100007E94((const void **)&v7);
  }
  else
  {
    *a2 = theString;
    CFStringRef theString = 0;
    CFRetain(&stru_10002D5A8);
    if (theString) {
      CFRelease(theString);
    }
    CFStringRef theString = &stru_10002D5A8;
  }
  return sub_100007E94((const void **)&theString);
}

void sub_100008B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
  sub_100007E94(v10);
  sub_100007E94(&a9);
  sub_100007E94(&a10);
  _Unwind_Resume(a1);
}

const void **FileSuffixChain@<X0>(id *a1@<X0>, CFStringRef *a2@<X8>)
{
  *a2 = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  FileSuffix(a1, &v17);
  while (1)
  {
    CFStringRef theString = &stru_10002D5A8;
    CFRetain(&stru_10002D5A8);
    TString::SetStringRefAsImmutable((CFTypeRef *)&theString, (__CFString *)v17);
    TString::TString((TString *)&cf, ".");
    BOOL v4 = TString::BeginsWith(&theString, (CFStringRef *)&cf);
    sub_100007E94(&cf);
    if (v4)
    {
      TString::SubStringFrom(&v17, 1, &cf);
      sub_10000882C((const void **)&theString, &cf);
      CFRetain(&stru_10002D5A8);
      if (cf) {
        CFRelease(cf);
      }
      CFTypeRef cf = &stru_10002D5A8;
      sub_100007E94(&cf);
    }
    if (!CFStringGetLength(theString)) {
      break;
    }
    CFURLRef v5 = +[UTType typeWithFilenameExtension:theString conformingToType:UTTypeItem];
    CFURLRef v6 = v5;
    if (!v5) {
      break;
    }
    if ([v5 isDeclared])
    {

      sub_100007E94((const void **)&theString);
    }
    else
    {
      id v7 = objc_alloc((Class)LSClaimBinding);
      id v8 = [v6 identifier];
      id v9 = [v7 initWithTypeIdentifier:v8 error:0];

      v10 = [v9 bundleRecord];
      id v11 = [v10 executableURL];

      sub_100007E94((const void **)&theString);
      if (!v11) {
        return sub_100007E94((const void **)&v17);
      }
    }
    CFIndex Length = CFStringGetLength((CFStringRef)*a1);
    CFIndex v13 = CFStringGetLength(v17);
    TString::SetLength((CFStringRef *)a1, Length - v13);
    CFStringRef v14 = v17;
    CFStringRef theString = &stru_10002D5A8;
    CFRetain(&stru_10002D5A8);
    CFStringRef MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, v14);
    if (theString) {
      CFRelease(theString);
    }
    CFStringRef theString = MutableCopy;
    TString::Append(&theString, a2);
    if (&theString != a2)
    {
      sub_10000882C((const void **)a2, (const void **)&theString);
      CFRetain(&stru_10002D5A8);
      if (theString) {
        CFRelease(theString);
      }
      CFStringRef theString = &stru_10002D5A8;
    }
    sub_100007E94((const void **)&theString);
    FileSuffix(a1, &theString);
    sub_10000882C((const void **)&v17, (const void **)&theString);
    CFRetain(&stru_10002D5A8);
    if (theString) {
      CFRelease(theString);
    }
    CFStringRef theString = &stru_10002D5A8;
    sub_100007E94((const void **)&theString);
  }
  sub_100007E94((const void **)&theString);
  return sub_100007E94((const void **)&v17);
}

void sub_100008E3C(_Unwind_Exception *a1)
{
  sub_100007E94(v1);
  _Unwind_Resume(a1);
}

const void **RedactedStr@<X0>(CFStringRef *a1@<X0>, TString *a2@<X8>)
{
  if (CFStringGetLength(*a1))
  {
    CFIndex Length = CFStringGetLength(*a1);
    CFStringRef v45 = &stru_10002D5A8;
    CFRetain(&stru_10002D5A8);
    TString::SetStringRefAsImmutable((CFTypeRef *)&v45, (__CFString *)*a1);
    FileSuffixChain((id *)&v45, &v46);
    sub_100007E94((const void **)&v45);
    uint64_t v5 = Length - CFStringGetLength(v46);
    if (v5 <= 2 && CFStringGetLength(v46))
    {
      while (1)
      {
        CFIndex v6 = v5 + 1;
        if (v5 + 1 >= Length) {
          break;
        }
        int v7 = v5 < -1 || CFStringGetLength(*a1) <= v6 ? 0 : CFStringGetCharacterAtIndex(*a1, v5 + 1);
        uint64_t v8 = v5 + 1;
        if (v5++ >= 2)
        {
          uint64_t v5 = v8;
          if (v7 == 46) {
            break;
          }
        }
      }
      TString::SubStringFrom(a1, v6, (CFTypeRef *)&v47);
      sub_10000882C((const void **)&v46, (const void **)&v47);
      CFRetain(&stru_10002D5A8);
      if (v47) {
        CFRelease(v47);
      }
      v47 = &stru_10002D5A8;
      sub_100007E94((const void **)&v47);
      uint64_t v5 = v6;
    }
    LODWORD(v34.__r_.__value_.__l.__data_) = 0;
    v10 = (__CFString *)*a1;
    v47 = (__CFString *)_NSConcreteStackBlock;
    uint64_t v48 = 3321888768;
    v49 = sub_100009DCC;
    v50 = &unk_10002CF20;
    v51 = &v34;
    -[__CFString enumerateSubstringsInRange:options:usingBlock:](v10, "enumerateSubstringsInRange:options:usingBlock:", 0, Length, 2, &v47);
    uint64_t data_low = SLODWORD(v34.__r_.__value_.__l.__data_);
    if (data_low - CFStringGetLength(v46) < 3)
    {
      TString::TString(a2, "<private>", 9uLL);
    }
    else
    {
      v44.location = 0;
      v44.length = 0;
      v44.location = (NSUInteger)[(__CFString *)(id)*a1 rangeOfComposedCharacterSequenceAtIndex:0];
      v44.length = v12;
      v43.location = 0;
      v43.length = 0;
      v43.location = (NSUInteger)[(__CFString *)(id)*a1 rangeOfComposedCharacterSequenceAtIndex:v5 - 1];
      v43.length = v13;
      TString::SubString(a1, &v44, (CFTypeRef *)&v42);
      TString::SubString(a1, &v43, &v41);
      LODWORD(v34.__r_.__value_.__l.__data_) = 0;
      CFStringRef v14 = (__CFString *)*a1;
      v47 = (__CFString *)_NSConcreteStackBlock;
      uint64_t v48 = 3321888768;
      v49 = sub_100009DCC;
      v50 = &unk_10002CF20;
      v51 = &v34;
      -[__CFString enumerateSubstringsInRange:options:usingBlock:](v14, "enumerateSubstringsInRange:options:usingBlock:", v44.length + v44.location, v43.location - (v44.length + v44.location), 2, &v47);
      int data = (int)v34.__r_.__value_.__l.__data_;
      HIBYTE(v49) = 1;
      LOWORD(v47) = 123;
      CFStringRef v36 = &stru_10002D5A8;
      CFRetain(&stru_10002D5A8);
      if (SHIBYTE(v49) >= 0) {
        v16 = (const UInt8 *)&v47;
      }
      else {
        v16 = (const UInt8 *)v47;
      }
      if (SHIBYTE(v49) >= 0) {
        CFIndex v17 = HIBYTE(v49);
      }
      else {
        CFIndex v17 = v48;
      }
      TString::SetFromUTF8((CFTypeRef *)&v36, v16, v17);
      CFStringRef v18 = v42;
      CFTypeRef cf = &stru_10002D5A8;
      CFRetain(&stru_10002D5A8);
      CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, v18);
      if (cf) {
        CFRelease(cf);
      }
      CFTypeRef cf = MutableCopy;
      TString::Append((CFStringRef *)&cf, &v36);
      std::to_string(&v34, data);
      CFStringRef v35 = &stru_10002D5A8;
      CFRetain(&stru_10002D5A8);
      if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v20 = &v34;
      }
      else {
        v20 = (std::string *)v34.__r_.__value_.__r.__words[0];
      }
      if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(v34.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v34.__r_.__value_.__l.__size_;
      }
      TString::SetFromUTF8((CFTypeRef *)&v35, (const UInt8 *)v20, size);
      CFStringRef v22 = (const __CFString *)cf;
      CFTypeRef v38 = &stru_10002D5A8;
      CFRetain(&stru_10002D5A8);
      CFMutableStringRef v23 = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, v22);
      if (v38) {
        CFRelease(v38);
      }
      CFTypeRef v38 = v23;
      TString::Append((CFStringRef *)&v38, &v35);
      char v32 = 1;
      LOWORD(__p) = 125;
      CFStringRef v33 = &stru_10002D5A8;
      CFRetain(&stru_10002D5A8);
      TString::SetFromUTF8((CFTypeRef *)&v33, (const UInt8 *)&__p, 1);
      CFStringRef v24 = (const __CFString *)v38;
      CFTypeRef v39 = &stru_10002D5A8;
      CFRetain(&stru_10002D5A8);
      CFMutableStringRef v25 = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, v24);
      if (v39) {
        CFRelease(v39);
      }
      CFTypeRef v39 = v25;
      TString::Append((CFStringRef *)&v39, &v33);
      CFStringRef v26 = (const __CFString *)v39;
      CFTypeRef v40 = &stru_10002D5A8;
      CFRetain(&stru_10002D5A8);
      CFMutableStringRef v27 = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, v26);
      if (v40) {
        CFRelease(v40);
      }
      CFTypeRef v40 = v27;
      TString::Append((CFStringRef *)&v40, (CFStringRef *)&v41);
      CFStringRef v28 = (const __CFString *)v40;
      *(void *)a2 = &stru_10002D5A8;
      CFRetain(&stru_10002D5A8);
      CFMutableStringRef v29 = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, v28);
      if (*(void *)a2) {
        CFRelease(*(CFTypeRef *)a2);
      }
      *(void *)a2 = v29;
      TString::Append((CFStringRef *)a2, &v46);
      sub_100007E94(&v40);
      sub_100007E94(&v39);
      sub_100007E94((const void **)&v33);
      if (v32 < 0) {
        operator delete(__p);
      }
      sub_100007E94(&v38);
      sub_100007E94((const void **)&v35);
      if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v34.__r_.__value_.__l.__data_);
      }
      sub_100007E94(&cf);
      sub_100007E94((const void **)&v36);
      if (SHIBYTE(v49) < 0) {
        operator delete(v47);
      }
      sub_100007E94(&v41);
      sub_100007E94((const void **)&v42);
    }
    return sub_100007E94((const void **)&v46);
  }
  else
  {
    return (const void **)TString::TString(a2, "<empty>", 7uLL);
  }
}

void sub_100009440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,int a23,__int16 a24,char a25,char a26,int a27,__int16 a28,char a29,char a30,int a31,__int16 a32,char a33,char a34,int a35,__int16 a36,char a37,char a38,int a39,__int16 a40,char a41,char a42,int a43,__int16 a44,char a45,char a46,int a47,__int16 a48,char a49,char a50)
{
  sub_100007E94((const void **)(v50 - 128));
  _Unwind_Resume(a1);
}

__CFString *SanitizedStr(CFStringRef *a1)
{
  if (IsRedactionEnabled() && (sub_100009634(), !sub_10000A4D0(qword_100031AE0, (id *)a1)))
  {
    RedactedStr(a1, (TString *)&v4);
    CFTypeID v2 = (__CFString *)v4;
    sub_100007E94((const void **)&v4);
  }
  else
  {
    CFTypeID v2 = (id) (id) *a1;
  }
  return v2;
}

void sub_100009634()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100031B08, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100031B08))
  {
    TString::TString((TString *)&v3, "/", 1uLL);
    TString::TString((TString *)&v4, "Volumes", 7uLL);
    TString::TString((TString *)&v5, "Users", 5uLL);
    TString::TString((TString *)&v6, "Applications", 0xCuLL);
    TString::TString((TString *)&v7, "Utilities", 9uLL);
    TString::TString((TString *)&v8, "System", 6uLL);
    TString::TString((TString *)&v9, "Desktop", 7uLL);
    TString::TString((TString *)&v10, "Documents", 9uLL);
    TString::TString((TString *)&v11, "Downloads", 9uLL);
    TString::TString((TString *)&v12, "Library", 7uLL);
    TString::TString((TString *)&v13, "Movies", 6uLL);
    TString::TString((TString *)&v14, "Music", 5uLL);
    TString::TString((TString *)&v15, "Pictures", 8uLL);
    TString::TString((TString *)&v16, "Public", 6uLL);
    v0 = TString::TString((TString *)&v17, "Drop Box", 8uLL);
    PropertyStoreName = (__CFString **)TCFURLInfo::GetPropertyStoreName(v0);
    sub_1000089C0(&v18, PropertyStoreName);
    TString::TString((TString *)&v19, ".localized", 0xAuLL);
    TString::TString((TString *)&v20, ".Trash", 6uLL);
    TString::TString((TString *)&v21, ".Trashes", 8uLL);
    sub_100009DF0((uint64_t)&unk_100031AE0, &v3, 19);
    for (uint64_t i = 144; i != -8; i -= 8)
      sub_100007E94((const void **)((char *)&v3 + i));
    __cxa_guard_release(&qword_100031B08);
  }
}

void sub_1000098D4(_Unwind_Exception *a1)
{
  for (uint64_t i = 144; i != -8; i -= 8)
    sub_100007E94((const void **)(v1 + i));
  __cxa_guard_abort(&qword_100031B08);
  _Unwind_Resume(a1);
}

id SanitizedPath(id *a1)
{
  if (IsRedactionEnabled())
  {
    uint64_t v14 = (TString *)a1;
    id v3 = +[NSMutableArray array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v4 = [*(id *)v14 pathComponents];
    id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          sub_100009634();
          uint64_t v9 = v8;
          id v17 = &stru_10002D5A8;
          CFRetain(&stru_10002D5A8);
          TString::SetStringRefAsImmutable((CFTypeRef *)&v17, v9);

          uint64_t v10 = sub_10000A4D0(qword_100031AE0, &v17);
          if (!v10)
          {
            uint64_t v11 = v9;
            CFStringRef v15 = &stru_10002D5A8;
            CFRetain(&stru_10002D5A8);
            TString::SetStringRefAsImmutable((CFTypeRef *)&v15, v11);

            RedactedStr(&v15, (TString *)&v16);
            uint64_t v1 = (__CFString *)v16;
            uint64_t v9 = v1;
          }
          [v3 addObject:v9];
          if (!v10)
          {

            sub_100007E94((const void **)&v16);
            sub_100007E94((const void **)&v15);
          }
          sub_100007E94((const void **)&v17);
        }
        id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v5);
    }

    if ([v3 count])
    {
      id v12 = +[NSString pathWithComponents:v3];
    }
    else
    {
      RedactedStr((CFStringRef *)v14, (TString *)&v17);
      id v12 = v17;
      sub_100007E94((const void **)&v17);
    }
  }
  else
  {
    id v12 = *a1;
  }
  return v12;
}

void sub_100009BA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id SanitizedURL(NSURL *a1)
{
  uint64_t v1 = a1;
  CFTypeID v2 = [(NSURL *)v1 path];
  CFStringRef v7 = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  TString::SetStringRefAsImmutable((CFTypeRef *)&v7, v2);

  id v3 = SanitizedPath((id *)&v7);
  sub_100007E94((const void **)&v7);

  if (IsRedactionEnabled()
    && [(NSURL *)v1 isFileURL]
    && ![(NSURL *)v1 isFileReferenceURL])
  {
    uint64_t v6 = [(NSURL *)v1 scheme];
    uint64_t v4 = +[NSString stringWithFormat:@"%@://<private> (%@)", v6, v3];
  }
  else
  {
    uint64_t v4 = +[NSString stringWithFormat:@"%@ (%@)", v1, v3];
  }

  return v4;
}

void sub_100009D70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100009DCC(uint64_t result)
{
  return result;
}

uint64_t sub_100009DE0(uint64_t result, uint64_t a2)
{
  *(void *)(result + ++**(_DWORD **)(result + 32) = *(void *)(a2 + 32);
  return result;
}

uint64_t sub_100009DF0(uint64_t a1, id *a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + ++**(_DWORD **)(result + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 8 * a3;
    do
    {
      sub_100009E68(a1, a2, (__CFString **)a2);
      ++a2;
      v5 -= 8;
    }
    while (v5);
  }
  return a1;
}

void sub_100009E54(_Unwind_Exception *a1)
{
  sub_10000A450(v1);
  _Unwind_Resume(a1);
}

uint64_t **sub_100009E68(uint64_t a1, id *a2, __CFString **a3)
{
  unint64_t v7 = sub_10000A150(a2);
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7;
      if (v7 >= v9) {
        unint64_t v3 = v7 % v9;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v7;
    }
    id v12 = *(uint64_t ****)(*(void *)a1 + 8 * v3);
    if (v12)
    {
      for (uint64_t i = *v12; i; uint64_t i = (uint64_t **)*i)
      {
        unint64_t v14 = (unint64_t)i[1];
        if (v14 == v8)
        {
          if (CFEqual(i[2], *a2)) {
            return i;
          }
        }
        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9) {
              v14 %= v9;
            }
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v3) {
            break;
          }
        }
      }
    }
  }
  sub_10000A0D8(a1, v8, a3, (uint64_t)v24);
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_10000A1AC(a1, v20);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  long long v21 = *(void **)(*(void *)a1 + 8 * v3);
  if (v21)
  {
    *(void *)v24[0] = *v21;
    void *v21 = v24[0];
  }
  else
  {
    *(void *)v24[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v24[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v24[0])
    {
      unint64_t v22 = *(void *)(*(void *)v24[0] + 8);
      if ((v9 & (v9 - 1)) != 0)
      {
        if (v22 >= v9) {
          v22 %= v9;
        }
      }
      else
      {
        v22 &= v9 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v22) = v24[0];
    }
  }
  uint64_t i = (uint64_t **)v24[0];
  v24[0] = 0;
  ++*(void *)(a1 + 24);
  sub_10000A3F8((uint64_t)v24, 0);
  return i;
}

void sub_10000A0C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10000A3F8((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

CFTypeRef *sub_10000A0D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __CFString **a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = operator new(0x18uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)unint64_t v8 = 0;
  *((void *)v8 + 1) = a2;
  uint64_t result = sub_1000084F8((CFTypeRef *)v8 + 2, a3);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_10000A138(_Unwind_Exception *a1)
{
  sub_10000A3F8(v1, 0);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A150(id *a1)
{
  uint64_t v1 = 0xCBF29CE484222325;
  CFTypeID v2 = (const char *)TString::c_str(a1);
  for (size_t i = strlen(v2); i; --i)
  {
    uint64_t v4 = *v2++;
    uint64_t v1 = 0x100000001B3 * (v1 ^ v4);
  }
  return v1;
}

void sub_10000A1AC(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_10000A29C(a1, prime);
    }
  }
}

void sub_10000A29C(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_1000084C4();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      unint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            void *v7 = *v11;
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            unint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          unint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    uint8x8_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void sub_10000A3F8(uint64_t a1, uint64_t a2)
{
  CFTypeID v2 = *(const void ***)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      sub_100007E94(v2 + 2);
    }
    operator delete(v2);
  }
}

uint64_t sub_10000A450(uint64_t a1)
{
  sub_10000A48C(a1, *(const void ***)(a1 + 16));
  CFTypeID v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_10000A48C(uint64_t a1, const void **a2)
{
  if (a2)
  {
    CFTypeID v2 = a2;
    do
    {
      unint64_t v3 = (const void **)*v2;
      sub_100007E94(v2 + 2);
      operator delete(v2);
      CFTypeID v2 = v3;
    }
    while (v3);
  }
}

uint64_t **sub_10000A4D0(void *a1, id *a2)
{
  unint64_t v4 = sub_10000A150(a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  uint8x8_t v10 = *(uint64_t ****)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  for (size_t i = *v10; i; size_t i = (uint64_t **)*i)
  {
    unint64_t v12 = (unint64_t)i[1];
    if (v6 == v12)
    {
      if (CFEqual(i[2], *a2)) {
        return i;
      }
    }
    else
    {
      if (v8 > 1)
      {
        if (v12 >= *(void *)&v5) {
          v12 %= *(void *)&v5;
        }
      }
      else
      {
        v12 &= *(void *)&v5 - 1;
      }
      if (v12 != v9) {
        return 0;
      }
    }
  }
  return i;
}

void FIProviderDomainFetcher::FIProviderDomainFetcher(FIProviderDomainFetcher *this)
{
  *(void *)this = 850045863;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((void *)this + 7) = 0;
  CFTypeID v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  *((void *)this + 8) = dispatch_queue_create("DomainFetcher", v2);

  *((void *)this + 9) = objc_alloc_init((Class)NSMutableOrderedSet);
  *((unsigned char *)this + 80) = 0;
  *((void *)this + 11) = dispatch_semaphore_create(0);
}

void sub_10000A65C(_Unwind_Exception *a1)
{
  std::mutex::~mutex((std::mutex *)v1);
  _Unwind_Resume(a1);
}

void FIProviderDomainFetcher::Start(FIProviderDomainFetcher *this)
{
  dispatch_assert_queue_V2(*((dispatch_queue_t *)this + 8));
  std::mutex::lock((std::mutex *)this);
  CFTypeID v2 = [*((id *)this + 9) firstObject];
  std::mutex::unlock((std::mutex *)this);
  if (v2)
  {
    *(void *)&long long v3 = 138543618;
    long long v14 = v3;
    do
    {
      unint64_t v4 = LogObj(4);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int8x8_t v5 = [v2 domainID];
        *(_DWORD *)buf = 138412290;
        BOOL v17 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Looking up domain for id '%@'", buf, 0xCu);
      }
      Class v6 = FPProviderDomainClass();
      uint8x8_t v7 = [v2 domainID];
      id v8 = [v2 cachePolicy];
      id v15 = 0;
      unint64_t v9 = [(objc_class *)v6 providerDomainWithID:v7 cachePolicy:v8 error:&v15];
      id v10 = v15;

      if (!v9)
      {
        unint64_t v11 = LogObj(4);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          unint64_t v12 = [v2 domainID];
          *(_DWORD *)buf = v14;
          BOOL v17 = v12;
          __int16 v18 = 2114;
          id v19 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to find domain for %{public}@ with error: %{public}@", buf, 0x16u);
        }
      }
      std::mutex::lock((std::mutex *)this);
      [v2 setAsyncFetchedDomain:v9];
      [v2 setAsyncError:v10];
      [*((id *)this + 9) removeObject:v2];
      [v2 setAsyncResultAvailable:1];
      dispatch_semaphore_signal(*((dispatch_semaphore_t *)this + 11));
      if (v9) {
        *((unsigned char *)this + 80) = 1;
      }
      uint64_t v13 = objc_msgSend(*((id *)this + 9), "firstObject", v14);

      std::mutex::unlock((std::mutex *)this);
      CFTypeID v2 = (void *)v13;
    }
    while (v13);
  }
}

void sub_10000A8D8(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t FIProviderDomainFetcher::Queue(id *this, FIProviderDomain *a2)
{
  long long v3 = a2;
  id v4 = [this[9] count];
  [this[9] addObject:v3];
  if (!v4)
  {
    int8x8_t v5 = this[8];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3321888768;
    block[2] = sub_10000AA10;
    block[3] = &unk_10002CF50;
    block[4] = this;
    dispatch_async(v5, block);
  }

  return 0;
}

void sub_10000AA00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000AA10(uint64_t a1)
{
}

uint64_t sub_10000AA18(uint64_t result, uint64_t a2)
{
  *(void *)(result + ++**(_DWORD **)(result + 32) = *(void *)(a2 + 32);
  return result;
}

id FIProviderDomainFetcher::FindQueuedDomain(FIProviderDomainFetcher *this, NSString *a2)
{
  long long v3 = a2;
  id v4 = (void *)*((void *)this + 9);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3321888768;
  void v9[2] = sub_10000AB20;
  v9[3] = &unk_10002CF80;
  int8x8_t v5 = v3;
  id v10 = v5;
  id v6 = [v4 indexOfObjectPassingTest:v9];
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint8x8_t v7 = 0;
  }
  else
  {
    uint8x8_t v7 = [*((id *)this + 9) objectAtIndexedSubscript:v6];
  }

  return v7;
}

void sub_10000AB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10000AB20(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 domainID];
  id v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7) {
    *a4 = 1;
  }
  return v7;
}

void sub_10000AB7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000AB8C(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a2 + 32);
  *(void *)(a1 + ++**(_DWORD **)(result + 32) = result;
  return result;
}

void sub_10000ABB8(uint64_t a1)
{
}

FIProviderDomain *FIProviderDomainFetcher::FetchDomainForID(uint64_t a1, void *a2, uint64_t a3, void *a4, void **a5)
{
  id v9 = a2;
  id v10 = a4;
  if ((UseFileProviderFramework() & 1) == 0)
  {
    float v16 = 0;
    goto LABEL_16;
  }
  std::mutex::lock((std::mutex *)a1);
  if (*(unsigned char *)(a1 + 80))
  {
    std::mutex::unlock((std::mutex *)a1);
LABEL_4:
    unint64_t v11 = [(objc_class *)FPProviderDomainClass() providerDomainWithID:v9 cachePolicy:a3 error:a5];
    if (a5 && *a5)
    {
      unint64_t v12 = LogObj(4);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = (__CFString *)v9;
        CFStringRef v34 = &stru_10002D5A8;
        CFRetain(&stru_10002D5A8);
        TString::SetStringRefAsImmutable((CFTypeRef *)&v34, v13);

        long long v14 = SanitizedStr(&v34);
        id v15 = *a5;
        *(_DWORD *)buf = 138412546;
        id v36 = v14;
        __int16 v37 = 2114;
        CFTypeRef v38 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error fetching domainID '%@': %{public}@", buf, 0x16u);
        sub_100007E94((const void **)&v34);
      }
    }
    if (v11) {
      float v16 = [[FIProviderDomain alloc] initWithDomain:v11];
    }
    else {
      float v16 = 0;
    }

    goto LABEL_16;
  }
  FIProviderDomainFetcher::FindQueuedDomain((FIProviderDomainFetcher *)a1, (NSString *)v9);
  float v16 = (FIProviderDomain *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    std::mutex::unlock((std::mutex *)a1);
    goto LABEL_16;
  }
  __int16 v18 = [FIProviderDomain alloc];
  id v19 = [v10 URLByStandardizingPath];
  size_t v20 = [(FIProviderDomain *)v18 initWithDomainID:v9 cachePolicy:a3 rootURL:v19 domain:0];

  id v21 = (id)FIProviderDomainFetcher::Queue((id *)a1, v20);
  std::mutex::unlock((std::mutex *)a1);
  if (!v20) {
    goto LABEL_4;
  }
  unint64_t v22 = LogObj(4);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Waiting for first domain result", buf, 2u);
  }

  CFMutableStringRef v23 = *(NSObject **)(a1 + 88);
  dispatch_time_t v24 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v23, v24))
  {
    CFMutableStringRef v25 = LogObj(4);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v26 = (__CFString *)v9;
      CFStringRef v34 = &stru_10002D5A8;
      CFRetain(&stru_10002D5A8);
      TString::SetStringRefAsImmutable((CFTypeRef *)&v34, v26);

      CFMutableStringRef v27 = SanitizedStr(&v34);
      *(_DWORD *)buf = 138543362;
      id v36 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Domain fetch for providerDomainID timed out: %{public}@", buf, 0xCu);
      sub_100007E94((const void **)&v34);
    }
  }
  else
  {
    CFMutableStringRef v25 = LogObj(4);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v28 = (__CFString *)v9;
      CFStringRef v34 = &stru_10002D5A8;
      CFRetain(&stru_10002D5A8);
      TString::SetStringRefAsImmutable((CFTypeRef *)&v34, v28);

      CFMutableStringRef v29 = SanitizedStr(&v34);
      *(_DWORD *)buf = 138543362;
      id v36 = v29;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Domain fetch for providerDomainID finished before timeout: %{public}@", buf, 0xCu);
      sub_100007E94((const void **)&v34);
    }
  }

  if (![(FIProviderDomain *)v20 asyncResultAvailable])
  {
LABEL_35:
    float v16 = v20;
    goto LABEL_16;
  }
  v30 = [(FIProviderDomain *)v20 asyncFetchedDomain];
  if (!v30)
  {
    char v32 = LogObj(4);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v33 = [(FIProviderDomain *)v20 asyncError];
      *(_DWORD *)buf = 138543618;
      id v36 = v9;
      __int16 v37 = 2114;
      CFTypeRef v38 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Waited and received no domain for %{public}@ error: %{public}@", buf, 0x16u);
    }
    goto LABEL_35;
  }
  v31 = LogObj(4);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v36 = v30;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Waited and received result for domain: %{public}@", buf, 0xCu);
  }

  float v16 = [[FIProviderDomain alloc] initWithDomain:v30];
LABEL_16:

  return v16;
}

void sub_10000B0F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

FIProviderDomain *FIProviderDomainFetcher::FetchDomainForURL(std::mutex *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9 = a2;
  std::mutex::lock(a1);
  int v10 = a1[1].__m_.__opaque[8];
  std::mutex::unlock(a1);
  if (v10)
  {
    unint64_t v11 = [(objc_class *)FPProviderDomainClass() providerDomainForURL:v9 error:a5];
    if (v11)
    {
      unint64_t v12 = [[FIProviderDomain alloc] initWithDomain:v11];
LABEL_9:
      long long v14 = v12;
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v11 = objc_msgSend(v9, "fp_fpfsProviderDomainID:", a3);
    if (v11)
    {
      if (a3) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = v9;
      }
      FIProviderDomainFetcher::FetchDomainForID((uint64_t)a1, v11, a4, v13, 0);
      unint64_t v12 = (FIProviderDomain *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  long long v14 = 0;
LABEL_11:

  return v14;
}

void sub_10000B348(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t FIProviderDomainFetcher::Singleton(FIProviderDomainFetcher *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100031B18, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100031B18))
  {
    operator new();
  }
  return qword_100031B10;
}

void sub_10000B3E8()
{
}

void sub_10000B4CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B6FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000B724(void *a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = a1;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

void sub_10000B8D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
  sub_100007E94(&a9);
  sub_100007E94(&a10);

  _Unwind_Resume(a1);
}

void sub_10000B9F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100007E94((const void **)va);
  _Unwind_Resume(a1);
}

void sub_10000BAE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000BBA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000BC60(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100007E94((const void **)va);
  _Unwind_Resume(a1);
}

void sub_10000BD30(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100007E94((const void **)va);
  _Unwind_Resume(a1);
}

void sub_10000BDD4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100007E94((const void **)va);
  _Unwind_Resume(a1);
}

void sub_10000BE78(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100007E94((const void **)va);
  _Unwind_Resume(a1);
}

void sub_10000BFF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C2E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C354(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C3D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C44C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C4EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000C678(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    TDSMutex::unlock(*(TDSMutex **)a1);
  }
  return a1;
}

void sub_10000C6B0(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000C70C(exception, a1);
}

void sub_10000C6F8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_10000C70C(std::logic_error *a1, const char *a2)
{
  id result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_10000C740(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_10000C7F4();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    id v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    id v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_10000C7F4()
{
}

const void **sub_10000C80C(const void **a1)
{
  id v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_10000C840(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000C89C(exception, a1);
}

void sub_10000C888(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_10000C89C(std::logic_error *a1, const char *a2)
{
  id result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_10000C8D0(void *a1, size_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_10000C944(a1, a2);
    size_t v4 = (char *)a1[1];
    size_t v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_10000C928(_Unwind_Exception *exception_object)
{
  long long v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_10000C944(void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    sub_10000C988();
  }
  id result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void sub_10000C988()
{
}

void sub_10000C9A0(unint64_t *a1, size_t a2)
{
  size_t v5 = (char *)a1[1];
  size_t v4 = (char *)a1[2];
  if (v4 - v5 >= a2)
  {
    if (a2)
    {
      bzero((void *)a1[1], a2);
      v5 += a2;
    }
    a1[1] = (unint64_t)v5;
  }
  else
  {
    unint64_t v6 = *a1;
    uint64_t v7 = &v5[-*a1];
    unint64_t v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0) {
      sub_10000C988();
    }
    unint64_t v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v10 = v8;
    }
    if (v10) {
      unint64_t v11 = (unint64_t)operator new(v10);
    }
    else {
      unint64_t v11 = 0;
    }
    unint64_t v12 = &v7[v11];
    uint64_t v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      unint64_t v11 = (unint64_t)v12;
    }
    else
    {
      long long v14 = &v5[~v6];
      do
      {
        char v15 = *--v5;
        (v14--)[v11] = v15;
      }
      while (v5 != (char *)v6);
      size_t v5 = (char *)*a1;
    }
    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5)
    {
      operator delete(v5);
    }
  }
}

const void *TString::MutableRef(TString **this, const __CFString *a2)
{
  unsigned int IsMutable = (unsigned __int16)TString::IsMutable(*this, a2);
  if (IsMutable <= 0x100) {
    LOBYTE(IsMutable) = 0;
  }
  CFMutableStringRef MutableCopy = *this;
  if (!(_BYTE)IsMutable)
  {
    CFMutableStringRef MutableCopy = (TString *)CFStringCreateMutableCopy(kCFAllocatorDefault, 0, (CFStringRef)*this);
    if (*this) {
      CFRelease(*this);
    }
    *this = MutableCopy;
  }
  return sub_100008588(MutableCopy);
}

void TString::SetFromUniChars(CFTypeRef *this, const unsigned __int16 *a2, CFIndex a3)
{
  CFStringRef v4 = CFStringCreateWithCharacters(kCFAllocatorDefault, a2, a3);
  if (*this) {
    CFRelease(*this);
  }
  *this = v4;
}

void TString::SubString(CFStringRef *this@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, CFTypeRef *a4@<X8>)
{
  CFIndex v6 = a2 & ~(a2 >> 63);
  CFIndex v7 = a3 + v6 - 1;
  CFIndex Length = CFStringGetLength(*this);
  if (Length - 1 < v7) {
    CFIndex v7 = Length - 1;
  }
  if (v7 >= v6 && (CFStringGetCharacterAtIndex(*this, v6) & 0xFC00) == 0xDC00) {
    ++v6;
  }
  if (v7 >= v6) {
    v7 -= (CFStringGetCharacterAtIndex(*this, v7) & 0xFC00) == 55296;
  }
  if (v6 || v7 != CFStringGetLength(*this) - 1)
  {
    if (v7 >= v6)
    {
      v12.length = v7 - v6 + 1;
      v12.location = v6;
      size_t v10 = (__CFString *)CFStringCreateWithSubstring(kCFAllocatorDefault, *this, v12);
      unint64_t v11 = v10;
      *a4 = &stru_10002D5A8;
      CFRetain(&stru_10002D5A8);
      TString::SetStringRefAsImmutable(a4, v10);
      sub_10000D54C((const void **)&v11);
    }
    else
    {
      unint64_t v9 = sub_10000CE2C();
      *a4 = &stru_10002D5A8;
      CFRetain(&stru_10002D5A8);
      TString::SetStringRefAsImmutable(a4, (__CFString *)*v9);
    }
  }
  else
  {
    *a4 = &stru_10002D5A8;
    CFRetain(&stru_10002D5A8);
    TString::SetStringRefAsImmutable(a4, (__CFString *)*this);
  }
}

void sub_10000CCF4(_Unwind_Exception *a1)
{
  sub_100007E94(v1);
  _Unwind_Resume(a1);
}

void TString::SetLength(CFStringRef *this, CFIndex a2)
{
  if (a2)
  {
    CFIndex v3 = a2;
    CFIndex Length = CFStringGetLength(*this);
    if (Length <= v3) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = Length;
    }
    sub_10000D460(buffer, v5);
    CFStringRef v6 = *this;
    CFIndex v7 = CFStringGetLength(*this);
    if (v7 >= v3) {
      v8.length = v3;
    }
    else {
      v8.length = v7;
    }
    v8.location = 0;
    CFStringGetCharacters(v6, v8, buffer[0]);
    if (v3 >= 1 && (buffer[0][v3 - 1] & 0xFC00) == 0xD800) {
      --v3;
    }
    TString::SetFromUniChars((CFTypeRef *)this, buffer[0], v3);
    if (buffer[0])
    {
      buffer[1] = buffer[0];
      operator delete(buffer[0]);
    }
  }
  else
  {
    sub_100008878((CFTypeRef *)this, &stru_10002D5A8);
  }
}

void sub_10000CE0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_10000CE2C()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100031980, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100031980))
  {
    qword_100031978 = (uint64_t)&stru_10002D5A8;
    CFRetain(&stru_10002D5A8);
    __cxa_guard_release(&qword_100031980);
  }
  return &qword_100031978;
}

void sub_10000CE94(_Unwind_Exception *a1)
{
}

void TString::SubString(CFStringRef *this@<X0>, const _NSRange *a2@<X1>, CFTypeRef *a3@<X8>)
{
}

void TString::SubStringFrom(CFStringRef *this@<X0>, uint64_t a2@<X1>, CFTypeRef *a3@<X8>)
{
  if (a2 == -1) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = a2;
  }
  uint64_t v6 = CFStringGetLength(*this) - v5;
  TString::SubString(this, v5, v6, a3);
}

CFStringRef *TString::Append(CFStringRef *this, CFStringRef *a2)
{
  if (CFStringGetLength(*this)) {
    goto LABEL_5;
  }
  unsigned int IsMutable = (unsigned __int16)TString::IsMutable((TString *)*this, v4);
  if (IsMutable <= 0x100) {
    LOBYTE(IsMutable) = 0;
  }
  if ((_BYTE)IsMutable)
  {
LABEL_5:
    uint64_t v6 = (__CFString *)TString::MutableRef((TString **)this, v4);
    CFStringAppend(v6, *a2);
  }
  else
  {
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, *a2);
    if (*this) {
      CFRelease(*this);
    }
    *this = MutableCopy;
  }
  return this;
}

uint64_t TString::IsMutable(TString *this, const __CFString *a2)
{
  if (!this)
  {
    BOOL v3 = 0;
    int v4 = 1;
    return v3 | (v4 << 8);
  }
  ClassName = object_getClassName(this);
  if (!strcmp(ClassName, "__NSCFConstantString") || !strcmp(ClassName, "NSTaggedPointerString"))
  {
    BOOL v3 = 0;
LABEL_9:
    int v4 = 1;
    return v3 | (v4 << 8);
  }
  if (!strcmp(ClassName, "__NSCFString"))
  {
    BOOL v3 = __CFStringIsMutable() != 0;
    goto LABEL_9;
  }
  BOOL v3 = 0;
  int v4 = 0;
  return v3 | (v4 << 8);
}

BOOL TString::BeginsWith(CFStringRef *this, CFStringRef *a2)
{
  CFIndex Length = CFStringGetLength(*a2);
  if (CFStringGetLength(*this) < Length) {
    return 0;
  }
  if (Length) {
    return CFStringHasPrefix(*this, *a2) != 0;
  }
  return 1;
}

void TString::Str(id *this@<X0>, void *a2@<X8>)
{
  id v3 = objc_retainAutorelease(*this);
  sub_10000C740(a2, (char *)[v3 UTF8String]);
}

void sub_10000D11C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id TString::c_str(id *this)
{
  id v1 = objc_retainAutorelease(*this);
  return [v1 UTF8String];
}

void TString::TString(TString *this, const char *a2)
{
  *(void *)this = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  sub_100008878((CFTypeRef *)this, &stru_10002D5A8);
  if (a2)
  {
    size_t v4 = strlen(a2);
    TString::SetFromUTF8((CFTypeRef *)this, (const UInt8 *)a2, v4);
  }
}

void sub_10000D1CC(_Unwind_Exception *a1)
{
  sub_100007E94(v1);
  _Unwind_Resume(a1);
}

const void **TString::SetFromUTF8(CFTypeRef *this, const UInt8 *a2, CFIndex a3)
{
  if (a3)
  {
    CFStringRef v4 = CFStringCreateWithBytes(kCFAllocatorDefault, a2, a3, 0x8000100u, 0);
    CFStringRef v7 = v4;
    if (v4) {
      CFStringRef v5 = v4;
    }
    else {
      CFStringRef v5 = &stru_10002D5A8;
    }
    sub_100008878(this, v5);
    return sub_100007E94((const void **)&v7);
  }
  else
  {
    return sub_100008878(this, &stru_10002D5A8);
  }
}

void sub_10000D278(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100007E94((const void **)va);
  _Unwind_Resume(a1);
}

void TString::TString(TString *this, const UInt8 *a2, CFIndex a3)
{
  *(void *)this = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  sub_100008878((CFTypeRef *)this, &stru_10002D5A8);
  if (a2) {
    TString::SetFromUTF8((CFTypeRef *)this, a2, a3);
  }
}

void sub_10000D2F8(_Unwind_Exception *a1)
{
  sub_100007E94(v1);
  _Unwind_Resume(a1);
}

void TString::SetStringRefAsImmutable(CFTypeRef *this, __CFString *a2)
{
  id v2 = (TString *)this;
  if (!a2)
  {
    CFStringRef v5 = &stru_10002D5A8;
    goto LABEL_6;
  }
  unsigned __int16 IsMutable = TString::IsMutable((TString *)a2, a2);
  if (IsMutable >= 0x100u && !(_BYTE)IsMutable)
  {
    this = (CFTypeRef *)v2;
    CFStringRef v5 = a2;
LABEL_6:
    sub_100008878(this, v5);
    return;
  }
  CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, a2);
  if (*(void *)v2) {
    CFRelease(*(CFTypeRef *)v2);
  }
  *(void *)id v2 = Copy;
}

BOOL TString::EndsWith(CFStringRef *this, CFStringRef *a2)
{
  CFIndex Length = CFStringGetLength(*this);
  CFIndex v5 = CFStringGetLength(*a2);
  BOOL v6 = Length < v5;
  CFIndex v7 = Length - v5;
  if (v6) {
    return 0;
  }
  CFIndex v9 = v5;
  size_t v10 = sub_100008550((const void **)this);
  if (v10)
  {
    CFTypeRef v11 = CFAutorelease(v10);
    CFStringRef v12 = (const __CFString *)sub_100008588(v11);
  }
  else
  {
    CFStringRef v12 = 0;
  }
  uint64_t v13 = sub_100008550((const void **)a2);
  if (v13)
  {
    CFTypeRef v14 = CFAutorelease(v13);
    CFStringRef v15 = (const __CFString *)sub_100008588(v14);
  }
  else
  {
    CFStringRef v15 = 0;
  }
  v16.location = v7;
  v16.length = v9;
  return CFStringCompareWithOptions(v12, v15, v16, 0) == kCFCompareEqualTo;
}

void *sub_10000D460(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_10000D4D8(a1, a2);
    CFStringRef v4 = (char *)a1[1];
    bzero(v4, 2 * a2);
    a1[1] = &v4[2 * a2];
  }
  return a1;
}

void sub_10000D4BC(_Unwind_Exception *exception_object)
{
  id v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_10000D4D8(void *a1, uint64_t a2)
{
  if (a2 < 0) {
    sub_10000C988();
  }
  id result = (char *)sub_10000D518((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[2 * v4];
  return result;
}

void *sub_10000D518(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    sub_1000084C4();
  }
  return operator new(2 * a2);
}

const void **sub_10000D54C(const void **a1)
{
  id v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_10000D894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000D934(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000D944(uint64_t a1)
{
}

void sub_10000D94C(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count] > a3)
  {
    CFIndex v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectAtIndexedSubscript:a3];
    unsigned __int8 v8 = [v12 isEqualToString:v7];

    if (v8) {
      goto LABEL_5;
    }
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 0, a3);
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    CFTypeRef v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  *a4 = 1;
LABEL_5:
}

void sub_10000DA30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000DB68(_Unwind_Exception *a1)
{
  BOOL v6 = v4;

  _Unwind_Resume(a1);
}

void sub_10000DBC8()
{
}

Class BRContainerClass(void)
{
  return off_100031988();
}

uint64_t TCFURLInfo::GetuidToUse(TCFURLInfo *this)
{
  if (TCFURLInfo::gDSHelperRunning) {
    return TCFURLInfo::guidToUse;
  }
  else {
    return getuid();
  }
}

uint64_t TCFURLInfo::GetgidToUse(TCFURLInfo *this)
{
  if (TCFURLInfo::gDSHelperRunning) {
    return TCFURLInfo::ggidToUse;
  }
  else {
    return getgid();
  }
}

void TCFURLInfo::TCFURLInfo(TCFURLInfo *this)
{
  *(void *)this = 0;
  *((void *)this + 1) = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  *((void *)this + 2) = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  *((void *)this + 3) = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  *((void *)this + 4) = 0;
  *((_DWORD *)this + 10) = 0;
  *((unsigned char *)this + 44) = 0;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  *((void *)this + 6) = 0;
  *((_DWORD *)this + 18) = 0;
  int v2 = (*((unsigned __int16 *)this + 38) | (*((unsigned __int8 *)this + 78) << 16)) & 0xE00100;
  *((_WORD *)this + 38) &= 0x100u;
  *((unsigned char *)this + 78) = BYTE2(v2);
}

void sub_10000DCB4(_Unwind_Exception *a1)
{
  sub_100007E94(v3);
  sub_100007E94(v2);
  sub_1000087F8(v1);
  _Unwind_Resume(a1);
}

uint64_t TCFURLInfo::PathAsCStr(TCFURLInfo *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100031B48, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100031B48))
  {
    dword_100031B40 = 0;
    __cxa_guard_release(&qword_100031B48);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&dword_100031B40);
  uint64_t v2 = *((void *)this + 6);
  uint64_t v3 = *((void *)this + 7);
  if (v2 == v3)
  {
    uint64_t v3 = *((void *)this + 6);
    if (*(void *)this)
    {
      sub_10000C8D0(&__s, 0x400uLL);
      int FileSystemRepresentation = TCFURLInfo::GetFileSystemRepresentation(*(TCFURLInfo **)this, (const __CFURL *)1, (UInt8 *)__s, (unsigned __int8 *)(v13 - __s));
      CFIndex v5 = __s;
      if (FileSystemRepresentation)
      {
        size_t v6 = strlen(__s);
        if (v6 + 1 <= v13 - __s)
        {
          CFIndex v7 = &__s[v6 + 1];
          if (v6 + 1 >= v13 - __s) {
            CFIndex v7 = v13;
          }
        }
        else
        {
          sub_10000C9A0((unint64_t *)&__s, v6 + 1 - (v13 - __s));
          CFIndex v5 = __s;
          CFIndex v7 = v13;
        }
        unsigned __int8 v8 = (char *)*((void *)this + 6);
        *((void *)this + 6) = v5;
        *((void *)this + 7) = v7;
        uint64_t v9 = *((void *)this + 8);
        *((void *)this + 8) = v14;
        __s = v8;
        uint64_t v14 = v9;
        CFIndex v5 = v8;
      }
      if (v5)
      {
        uint64_t v13 = v5;
        operator delete(v5);
      }
      uint64_t v2 = *((void *)this + 6);
      uint64_t v3 = *((void *)this + 7);
    }
  }
  if (v2 == v3) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v2;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_100031B40);
  return v10;
}

void sub_10000DE1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
}

CFIndex TCFURLInfo::FetchProperties(const void **this, int a2)
{
  CFURLRef v2 = (const __CFURL *)*this;
  if (!*this) {
    return 4294959236;
  }
  CFErrorRef error = 0;
  if (a2)
  {
    CFArrayRef CopyItemRequestedPropertyKeys = (const __CFArray *)TCFURLInfo::GetCopyItemRequestedPropertyKeys((TCFURLInfo *)this);
    CFDictionaryRef v36 = CFURLCopyResourcePropertiesForKeys(v2, CopyItemRequestedPropertyKeys, &error);
    if (error)
    {
      CFRelease(error);
      CFErrorRef error = 0;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v7 = (id)TCFURLInfo::GetCopyItemRequestedPropertyKeys(v6);
      id v8 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v33;
        do
        {
          for (size_t i = 0; i != v8; size_t i = (char *)i + 1)
          {
            if (*(void *)v33 != v9) {
              objc_enumerationMutation(v7);
            }
            CFStringRef v11 = *(const __CFString **)(*((void *)&v32 + 1) + 8 * i);
            CFErrorRef v30 = 0;
            propertyValueTypeRefPtr = 0;
            CFURLCopyResourcePropertyForKey((CFURLRef)*this, v11, &propertyValueTypeRefPtr, &v30);
            sub_100008490((const void **)&v30);
            sub_10000845C(&propertyValueTypeRefPtr);
          }
          id v8 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
        }
        while (v8);
      }
    }
  }
  else
  {
    CFDictionaryRef v36 = 0;
  }
  propertyValueTypeRefPtr = 0;
  if (_CFURLGetResourcePropertyFlags())
  {
    unsigned int v15 = propertyValueTypeRefPtr;
    unsigned int v16 = (propertyValueTypeRefPtr >> 1) & 0x7FFFFF;
    unsigned int v17 = *((_WORD *)this + 38) & 0xFFFC | (*((unsigned __int8 *)this + 78) << 16) & 0xFFFEFFFC | ((propertyValueTypeRefPtr & 1) << 16) | ((propertyValueTypeRefPtr & 0xFFFFFE) >> 1) & 2 | ((propertyValueTypeRefPtr & 0xFFFFFE) >> 1) & 1;
    *((unsigned char *)this + 78) = (*((_WORD *)this + 38) & 0xFFFC | (*((unsigned __int8 *)this + 78) << 16) & 0xFFFEFFFF | ((propertyValueTypeRefPtr & 1) << 16)) >> 16;
    *((_WORD *)this + 38) = v17;
    if (v16)
    {
      if (TCFURLInfo::GetBooleanProperty((TCFURLInfo *)*this, kCFURLIsPackageKey, v14)) {
        int v18 = 4;
      }
      else {
        int v18 = 0;
      }
      unsigned int v17 = *((_WORD *)this + 38) & 0xFFFB | (*((unsigned __int8 *)this + 78) << 16) | v18;
      *((_WORD *)this + 38) = *((_WORD *)this + 38) & 0xFFFB | v18;
      unsigned int v15 = propertyValueTypeRefPtr;
    }
    unsigned int v19 = (v15 >> 2) & 0x10 | v17 & 0xFFFD7F4F | (((v15 >> 5) & 1) << 17);
    unsigned int v20 = HIWORD(v19);
    unsigned int v21 = (v19 & 0xFFFF7F7F | (((v15 >> 3) & 1) << 7) & 0xFFFF7FFF | (v15 >> 2) & 0x20 | (((v15 >> 10) & 1) << 15)) ^ 0x20;
    *((unsigned char *)this + 78) = v20;
    *((_WORD *)this + 38) = v21;
    *((_DWORD *)this + 18) = 1;
    if (a2)
    {
      *((unsigned char *)this + 78) = BYTE2(v21);
      *((_WORD *)this + 38) = (v15 >> 2) & 0x40 | v15 & 0x7000 | (v15 >> 6) & 8 | v21 & 0x8FB7;
      *((_DWORD *)this + 18) = 2;
    }
    CFErrorRef v30 = 0;
    if (CFURLCopyResourcePropertyForKey((CFURLRef)*this, kCFURLNameKey, &v30, &error))
    {
      unint64_t v22 = (__CFString *)v30;
      CFTypeRef cf = &stru_10002D5A8;
      CFRetain(&stru_10002D5A8);
      TString::SetStringRefAsImmutable(&cf, v22);
      if (this + 1 != &cf)
      {
        sub_10000882C(this + 1, &cf);
        CFRetain(&stru_10002D5A8);
        if (cf) {
          CFRelease(cf);
        }
        CFTypeRef cf = &stru_10002D5A8;
      }
      sub_100007E94(&cf);
    }
    sub_10000D54C((const void **)&v30);
  }
  unsigned __int8 v23 = atomic_load(byte_100031990);
  if (v23)
  {
    unsigned int NumericalProperty = TCFURLInfo::GetNumericalProperty((const __CFURL *)*this, _kCFURLFileFlagsKey, v14);
    int v26 = *((unsigned __int16 *)this + 38);
    CFMutableStringRef v25 = (char *)this + 76;
    unsigned int v27 = (v26 | (v25[2] << 16)) & 0xFFFBFFFF | (NumericalProperty >> 12) & 0x40000;
    *(_WORD *)CFMutableStringRef v25 = v26;
    v25[2] = BYTE2(v27);
  }
  CFIndex v12 = TCFURLInfo::TranslateCFError(error, v13);
  sub_100011E14((const void **)&v36);
  sub_100008490((const void **)&error);
  return v12;
}

void sub_10000E1E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va1, a14);
  va_start(va, a14);
  unsigned int v16 = va_arg(va1, const void *);

  sub_100011E14((const void **)va);
  sub_100008490((const void **)va1);
  _Unwind_Resume(a1);
}

uint64_t TCFURLInfo::GetCopyItemRequestedPropertyKeys(TCFURLInfo *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100031B28, memory_order_acquire) & 1) == 0)
  {
    CFURLRef v2 = (TCFURLInfo *)__cxa_guard_acquire(&qword_100031B28);
    if (v2)
    {
      qword_100031B20 = (uint64_t)sub_10000E900(v2);
      __cxa_guard_release(&qword_100031B28);
    }
  }
  return qword_100031B20;
}

void sub_10000E2D0(_Unwind_Exception *a1)
{
}

uint64_t UseFileProviderFramework(void)
{
  unsigned __int8 v0 = atomic_load(byte_100031990);
  return v0 & 1;
}

CFIndex TCFURLInfo::TranslateCFError(TCFURLInfo *this, __CFError *a2)
{
  if (this)
  {
    CFURLRef v2 = this;
    Domain = (__CFString *)CFErrorGetDomain(v2);
    CFStringRef v22 = &stru_10002D5A8;
    CFRetain(&stru_10002D5A8);
    TString::SetStringRefAsImmutable((CFTypeRef *)&v22, Domain);
    FileProviderErrorDomain((CFTypeRef *)buf);
    LODWORD(Domain) = CFEqual(v22, *(CFTypeRef *)buf);
    sub_100007E94((const void **)buf);
    if (Domain)
    {
      CFIndex v5 = TCFURLInfo::TranslateFileProviderError(v2, v4);
    }
    else
    {
      CFDictionaryRef v7 = CFErrorCopyUserInfo(v2);
      *(void *)buf = v7;
      if (v7)
      {
        Value = CFDictionaryGetValue(v7, kCFErrorUnderlyingErrorKey);
        uint64_t v9 = (TCFURLInfo *)sub_100008588(Value);
        if (v9)
        {
          CFIndex v6 = TCFURLInfo::OSStatusFromCFErrorShallow(v9, v10);
          sub_100011E14((const void **)buf);
LABEL_10:
          if (sub_10000FEBC((void **)&v22, NSCocoaErrorDomain)
            && [(TCFURLInfo *)v2 code] == (id)260)
          {
            CFIndex v12 = [(TCFURLInfo *)v2 userInfo];
            uint64_t v13 = [v12 objectForKeyedSubscript:NSURLErrorKey];

            if (v13)
            {
              CFStringRef v14 = [v13 lastPathComponent];
              TCFURLInfo::GetPropertyStoreName(v14);
              unsigned __int8 v15 = sub_10000FEBC(&qword_100031BA0, v14);
            }
            else
            {
              unsigned __int8 v15 = 1;
            }
            if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100031B68, memory_order_acquire) & 1) == 0
              && __cxa_guard_acquire(&qword_100031B68))
            {
              sub_10000FFA8();
              __cxa_guard_release(&qword_100031B68);
            }
            if (v15)
            {
              unsigned int v16 = v13;
LABEL_26:

              sub_100007E94((const void **)&v22);
              return v6;
            }
            unsigned int v17 = v13;
            int v18 = (NSObject **)qword_100031B50;
            unsigned int v19 = *(NSObject ***)algn_100031B58;
            unsigned int v16 = v17;
            while (1)
            {
              if (v18 == v19)
              {

                goto LABEL_26;
              }
              if (IsEqual(v16, *v18)) {
                break;
              }
              ++v18;
            }
          }
          unsigned int v16 = LogObj(2);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            unsigned int v20 = +[NSNumber numberWithInt:v6];
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v20;
            __int16 v24 = 2112;
            CFMutableStringRef v25 = v2;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "TCFURLInfo::TranslateCFError -- status: %{public}@, CFError = %@", buf, 0x16u);
          }
          goto LABEL_26;
        }
      }
      sub_100011E14((const void **)buf);
      CFIndex v5 = TCFURLInfo::OSStatusFromCFErrorShallow(v2, v11);
    }
    CFIndex v6 = v5;
    goto LABEL_10;
  }
  return 0;
}

void sub_10000E5B8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __cxa_guard_abort(&qword_100031B68);

  sub_100007E94((const void **)va);
  _Unwind_Resume(a1);
}

const void **TCFURLInfo::ForceNameFetch(const void **this)
{
  CFURLRef v2 = (const __CFURL *)*this;
  if (v2)
  {
    CFStringRef PathComponent = CFURLCopyLastPathComponent(v2);
    CFStringRef v7 = PathComponent;
    if (PathComponent)
    {
      uint64_t v4 = (__CFString *)PathComponent;
      CFTypeRef cf = &stru_10002D5A8;
      CFRetain(&stru_10002D5A8);
      TString::SetStringRefAsImmutable(&cf, v4);
      if (this + 1 != &cf)
      {
        sub_10000882C(this + 1, &cf);
        CFRetain(&stru_10002D5A8);
        if (cf) {
          CFRelease(cf);
        }
        CFTypeRef cf = &stru_10002D5A8;
      }
      sub_100007E94(&cf);
    }
  }
  else
  {
    CFStringRef v7 = 0;
  }
  return sub_10000D54C((const void **)&v7);
}

void sub_10000E72C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
}

CFIndex TCFURLInfo::Initialize(CFTypeRef *this, const __CFURL *a2, int a3, int a4)
{
  id v8 = this + 1;
  TString::SetStringRefAsImmutable(this + 1, 0);
  TString::SetFromUTF8(v8, (const UInt8 *)"", 0);
  TString::SetStringRefAsImmutable(this + 2, 0);
  TString::SetFromUTF8(this + 2, (const UInt8 *)"", 0);
  TString::SetStringRefAsImmutable(this + 3, 0);
  TString::SetFromUTF8(this + 3, (const UInt8 *)"", 0);
  int v9 = *((_WORD *)this + 38) & 0xFEFF | (*((unsigned __int8 *)this + 78) << 16);
  *((_WORD *)this + 38) &= ~0x100u;
  *((unsigned char *)this + 78) = BYTE2(v9);
  sub_100008878(this, a2);
  if (!*this || !a3) {
    return 0;
  }
  return TCFURLInfo::FetchProperties(this, a4);
}

CFIndex TCFURLInfo::Initialize(CFTypeRef *this, const char *__s)
{
  if (!__s) {
    return 4294959224;
  }
  size_t v4 = strlen(__s);
  CFURLRef v5 = CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)__s, v4, 0);
  CFURLRef v8 = v5;
  if (v5) {
    CFIndex v6 = TCFURLInfo::Initialize(this, v5, 1, 1);
  }
  else {
    CFIndex v6 = 4294959238;
  }
  sub_100008638((const void **)&v8);
  return v6;
}

void sub_10000E8E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100008638((const void **)va);
  _Unwind_Resume(a1);
}

id sub_10000E8F8(id *a1)
{
  return *a1;
}

__CFArray *sub_10000E900(TCFURLInfo *a1)
{
  CFArrayRef BasicInfoPropertyKeys = (const __CFArray *)TCFURLInfo::GetBasicInfoPropertyKeys(a1);
  CFMutableStringRef MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0, BasicInfoPropertyKeys);
  CFArrayAppendValue(MutableCopy, kCFURLFileSecurityKey);
  return MutableCopy;
}

uint64_t TCFURLInfo::GetBasicInfoPropertyKeys(TCFURLInfo *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100031B38, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100031B38))
  {
    long long v35 = sub_10000E8F8((id *)&kCFURLNameKey);
    v36[0] = v35;
    long long v34 = sub_10000E8F8((id *)&_kCFURLVolumeRefNumKey);
    v36[1] = v34;
    long long v33 = sub_10000E8F8(&_kCFURLFileIDKey);
    v36[2] = v33;
    long long v32 = sub_10000E8F8(&_kCFURLFileSizeOfResourceForkKey);
    v36[3] = v32;
    v31 = sub_10000E8F8(&_kCFURLFileAllocatedSizeOfResourceForkKey);
    v36[4] = v31;
    CFErrorRef v30 = sub_10000E8F8((id *)&_kCFURLFinderInfoKey);
    v36[5] = v30;
    CFMutableStringRef v29 = sub_10000E8F8(&_kCFURLIsCompressedKey);
    v36[6] = v29;
    CFStringRef v28 = sub_10000E8F8((id *)&kCFURLFileSizeKey);
    v36[7] = v28;
    unsigned int v27 = sub_10000E8F8((id *)&kCFURLFileAllocatedSizeKey);
    v36[8] = v27;
    int v26 = sub_10000E8F8((id *)&kCFURLCreationDateKey);
    v36[9] = v26;
    CFMutableStringRef v25 = sub_10000E8F8((id *)&kCFURLContentModificationDateKey);
    v36[10] = v25;
    __int16 v24 = sub_10000E8F8((id *)&kCFURLAddedToDirectoryDateKey);
    v36[11] = v24;
    unsigned __int8 v23 = sub_10000E8F8((id *)&kCFURLAttributeModificationDateKey);
    v36[12] = v23;
    CFStringRef v22 = sub_10000E8F8((id *)&kCFURLLabelNumberKey);
    v36[13] = v22;
    unsigned int v21 = sub_10000E8F8((id *)&kCFURLLinkCountKey);
    v36[14] = v21;
    unsigned int v20 = sub_10000E8F8((id *)&kCFURLHasHiddenExtensionKey);
    v36[15] = v20;
    unsigned int v19 = sub_10000E8F8((id *)&kCFURLIsVolumeKey);
    v36[16] = v19;
    int v18 = sub_10000E8F8((id *)&kCFURLIsHiddenKey);
    v36[17] = v18;
    unsigned int v17 = sub_10000E8F8((id *)&kCFURLIsUserImmutableKey);
    v36[18] = v17;
    unsigned int v16 = sub_10000E8F8((id *)&kCFURLIsSystemImmutableKey);
    v36[19] = v16;
    unsigned __int8 v15 = sub_10000E8F8(&_kCFURLIsUserAppendKey);
    v36[20] = v15;
    CFStringRef v14 = sub_10000E8F8(&_kCFURLIsSystemAppendKey);
    v36[21] = v14;
    uint64_t v13 = sub_10000E8F8(&_kCFURLIsRestrictedKey);
    v36[22] = v13;
    CFIndex v12 = sub_10000E8F8(&_kCFURLIsSystemNoUnlinkKey);
    v36[23] = v12;
    CFStringRef v11 = sub_10000E8F8((id *)&kCFURLIsSymbolicLinkKey);
    v36[24] = v11;
    CFURLRef v2 = sub_10000E8F8((id *)&kCFURLIsDirectoryKey);
    v36[25] = v2;
    uint64_t v3 = sub_10000E8F8((id *)&kCFURLIsRegularFileKey);
    v36[26] = v3;
    size_t v4 = sub_10000E8F8((id *)&kCFURLIsAliasFileKey);
    v36[27] = v4;
    CFURLRef v5 = sub_10000E8F8((id *)&kCFURLIsApplicationKey);
    v36[28] = v5;
    CFIndex v6 = sub_10000E8F8((id *)&kCFURLIsReadableKey);
    v36[29] = v6;
    CFStringRef v7 = sub_10000E8F8((id *)&kCFURLIsWritableKey);
    v36[30] = v7;
    CFURLRef v8 = sub_10000E8F8((id *)&kCFURLIsExecutableKey);
    v36[31] = v8;
    int v9 = sub_10000E8F8((id *)&_kCFURLFileFlagsKey);
    v36[32] = v9;
    uint64_t v10 = sub_10000E8F8(&_kCFURLVolumeIsQuarantinedKey);
    v36[33] = v10;
    v36[34] = NSURLFileProtectionKey;
    v36[35] = NSURLMayShareFileContentKey;
    v36[36] = NSURLFileContentIdentifierKey;
    v36[37] = NSURLIsSparseKey;
    v36[38] = NSURLMayHaveExtendedAttributesKey;
    qword_100031B30 = +[NSArray arrayWithObjects:v36 count:39];

    __cxa_guard_release(&qword_100031B38);
  }
  return qword_100031B30;
}

void sub_10000EEDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33)
{
  __cxa_guard_abort(&qword_100031B38);
  _Unwind_Resume(a1);
}

void TCFURLInfo::Name(TCFURLInfo *this@<X0>, CFTypeRef *a2@<X8>)
{
  if (!CFStringGetLength(*((CFStringRef *)this + 1)) && !*((_DWORD *)this + 18)) {
    TCFURLInfo::ForceNameFetch((const void **)this);
  }
  *a2 = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  TString::SetStringRefAsImmutable(a2, *((__CFString **)this + 1));
}

void sub_10000F154(_Unwind_Exception *a1)
{
  sub_100007E94(v1);
  _Unwind_Resume(a1);
}

const void **TCFURLInfo::StringProperty@<X0>(TCFURLInfo *this@<X0>, const __CFString *a2@<X1>, CFTypeRef *a3@<X8>)
{
  propertyValueTypeRefPtr = 0;
  if (this)
  {
    CFURLCopyResourcePropertyForKey(this, a2, &propertyValueTypeRefPtr, 0);
    CFURLRef v5 = propertyValueTypeRefPtr;
  }
  else
  {
    CFURLRef v5 = 0;
  }
  *a3 = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  TString::SetStringRefAsImmutable(a3, v5);
  return sub_10000D54C((const void **)&propertyValueTypeRefPtr);
}

void sub_10000F1D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100007E94(v2);
  sub_10000D54C((const void **)va);
  _Unwind_Resume(a1);
}

TCFURLInfo *TCFURLInfo::TranslatePOSIXError(TCFURLInfo *this, const char *a2, const char *a3)
{
  size_t v4 = this;
  if ((int)this > -2)
  {
    if (this == -1) {
      this = (TCFURLInfo *)*__error();
    }
    return TCFURLInfo::TranslateRawPOSIXError(this, a2, a3);
  }
  else
  {
    if (a2)
    {
      CFURLRef v5 = LogObj(5);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        TString::TString((TString *)&v8, a2);
        CFIndex v6 = SanitizedPath((id *)&v8);
        *(_DWORD *)buf = 67109378;
        int v10 = (int)v4;
        __int16 v11 = 2114;
        CFIndex v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "MacOS error %d for %{public}@", buf, 0x12u);
        sub_100007E94(&v8);
      }
    }
    return v4;
  }
}

void sub_10000F360(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100007E94((const void **)va);

  _Unwind_Resume(a1);
}

const __CFURL *TCFURLInfo::GetNumericalProperty(const __CFURL *this, const __CFString *a2, const __CFString *a3)
{
  uint64_t valuePtr = 0;
  if (this)
  {
    CFErrorRef error = 0;
    CFNumberRef propertyValueTypeRefPtr = 0;
    if (CFURLCopyResourcePropertyForKey(this, a2, &propertyValueTypeRefPtr, &error))
    {
      if (propertyValueTypeRefPtr) {
        CFNumberGetValue(propertyValueTypeRefPtr, kCFNumberSInt64Type, &valuePtr);
      }
      goto LABEL_14;
    }
    Domain = (__CFString *)CFErrorGetDomain(error);
    CFTypeRef cf1 = &stru_10002D5A8;
    CFRetain(&stru_10002D5A8);
    TString::SetStringRefAsImmutable(&cf1, Domain);
    if (kCFErrorDomainCocoa) {
      CFErrorDomain v5 = kCFErrorDomainCocoa;
    }
    else {
      CFErrorDomain v5 = &stru_10002D5A8;
    }
    if (CFEqual(cf1, v5))
    {
      CFIndex Code = CFErrorGetCode(error);
      sub_100007E94(&cf1);
      if (Code == 260)
      {
LABEL_14:
        sub_100008490((const void **)&error);
        sub_100011E48((const void **)&propertyValueTypeRefPtr);
        return (const __CFURL *)valuePtr;
      }
    }
    else
    {
      sub_100007E94(&cf1);
    }
    if (CFEqual(a2, _kCFURLVolumeRefNumKey)) {
      uint64_t valuePtr = 0;
    }
    goto LABEL_14;
  }
  return this;
}

void sub_10000F490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10, const void *a11)
{
}

uint64_t TCFURLInfo::GetBooleanProperty(TCFURLInfo *this, const __CFString *a2, const __CFString *a3)
{
  if (!this) {
    return 0;
  }
  CFNumberRef propertyValueTypeRefPtr = 0;
  if (CFURLCopyResourcePropertyForKey(this, a2, &propertyValueTypeRefPtr, 0) && propertyValueTypeRefPtr) {
    uint64_t v3 = IsEqual(propertyValueTypeRefPtr, kCFBooleanTrue);
  }
  else {
    uint64_t v3 = 0;
  }
  sub_100011EB0(&propertyValueTypeRefPtr);
  return v3;
}

void sub_10000F538(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100011EB0((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t TCFURLInfo::GetFileSystemRepresentation(TCFURLInfo *this, const __CFURL *a2, UInt8 *a3, unsigned __int8 *a4)
{
  Boolean v6 = a2;
  uint64_t result = _CFURLIsFileURL();
  if (result) {
    return CFURLGetFileSystemRepresentation(this, v6, a3, (CFIndex)a4) != 0;
  }
  return result;
}

TString *TCFURLInfo::FileSystemRepresentation@<X0>(TCFURLInfo *this@<X0>, const __CFURL *a2@<X1>, TString *a3@<X8>)
{
  if (TCFURLInfo::GetFileSystemRepresentation(this, a2, (UInt8 *)v5, (unsigned __int8 *)0x409)) {
    return TString::TString(a3, v5);
  }
  *(void *)a3 = &stru_10002D5A8;
  return (TString *)CFRetain(&stru_10002D5A8);
}

uint64_t TCFURLInfo::GetVolumeInfoRecord(CFURLRef *a1, void *a2)
{
  if (*a1) {
    CFURLRef v3 = CFURLCreateFilePathURL(0, *a1, 0);
  }
  else {
    CFURLRef v3 = 0;
  }
  CFURLRef v6 = v3;
  uint64_t VolumeInfoRecord = TCFURLInfo::GetVolumeInfoRecord(v3, a2);
  sub_100008638((const void **)&v6);
  return VolumeInfoRecord;
}

void sub_10000F688(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100008638((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t TCFURLInfo::SetResourceProperties(id *this, const __CFDictionary *a2)
{
  CFURLRef v3 = (const __CFURL *)*this;
  if (!v3) {
    return 4294959238;
  }
  CFErrorRef error = 0;
  if (CFURLSetResourcePropertiesForKeys(v3, a2, &error))
  {
    uint64_t v5 = 0;
  }
  else
  {
    CFURLRef v6 = LogObj(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v7 = (NSURL *)*this;
      CFURLRef v8 = SanitizedURL(v7);
      *(_DWORD *)buf = 138543874;
      CFStringRef v14 = v8;
      __int16 v15 = 2114;
      CFDictionaryRef v16 = a2;
      __int16 v17 = 2114;
      CFErrorRef v18 = error;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "CFURLSetResourcePropertiesForKeys failed %{public}@, %{public}@, error: %{public}@", buf, 0x20u);
    }
    unsigned int v10 = TCFURLInfo::TranslateCFError(error, v9);
    if (v10 == -5000) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = v10;
    }
  }
  sub_100008490((const void **)&error);
  return v5;
}

void sub_10000F7D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  sub_100008490((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t TCFURLInfo::GetVolumeInfoRecord(void *a1, void *a2)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (a1)
  {
    id v3 = a1;
    memset(&propertyValueTypeRefPtr, 0, 36);
    uint64_t v26 = 0;
    CFErrorRef error = (CFErrorRef)5;
    uint64_t v25 = 0x20000;
    if (getattrlist((const char *)[v3 fileSystemRepresentation], &error, &propertyValueTypeRefPtr, 0x24uLL, 0))
    {
      size_t v4 = __error();
      unsigned int v6 = TCFURLInfo::TranslatePOSIXError((TCFURLInfo *)*v4, 0, v5);

      if (v6)
      {
        unsigned int v7 = *(_DWORD *)a2 & 0xFFF9FFFF;
LABEL_15:
        *(_DWORD *)a2 = v7;
LABEL_16:
        *(_DWORD *)a2 = v7 & 0xFFFFF6FF;
        unint64_t v23 = 0;
        CFErrorRef error = 0;
        if (!_CFURLGetVolumePropertyFlags())
        {
          CFIndex v8 = TCFURLInfo::TranslateCFError(error, v16);
LABEL_28:
          sub_100008490((const void **)&error);
          return v8;
        }
        *(_DWORD *)a2 = ((v23 >> 29) & 0x80 | *(_DWORD *)a2 & 0xFFFF9905 | (v23 >> 37) & 0x4000 | (v23 >> 34) & 0x200 | (v23 >> 35) & 8 | (v23 >> 57) & 0x10 | (v23 >> 44) & 0x20 | (v23 >> 37) & 0x400 | (v23 >> 43) & 0x2000 | (2 * (v23 & 1)) | (v23 >> 52) & 0x40) ^ 0x2000;
        *(void *)&propertyValueTypeRefPtr.f_bstd::string::size_type size = 0;
        if (!CFURLCopyResourcePropertyForKey((CFURLRef)v3, kCFURLVolumeAvailableCapacityKey, &propertyValueTypeRefPtr, &error)|| (CFNumberRef v18 = *(const __CFNumber **)&propertyValueTypeRefPtr.f_bsize) == 0)
        {
          CFIndex v8 = TCFURLInfo::TranslateCFError(error, v17);
          goto LABEL_27;
        }
        a2[1] = 4096;
        unint64_t valuePtr = 0;
        CFNumberGetValue(v18, kCFNumberSInt64Type, &valuePtr);
        unint64_t v19 = valuePtr;
        unint64_t v20 = a2[1];
        if (!__CFADD__(valuePtr, v20))
        {
          if (!v20)
          {
LABEL_25:
            CFIndex v8 = 0;
            a2[2] = v20;
LABEL_27:
            sub_100011E48((const void **)&propertyValueTypeRefPtr);
            goto LABEL_28;
          }
          unint64_t v19 = valuePtr + v20 - 1;
        }
        v20 *= v19 / v20;
        goto LABEL_25;
      }
      unsigned int f_blocks = 0;
    }
    else
    {
      unsigned int f_blocks = propertyValueTypeRefPtr.f_blocks;
    }
    unsigned int v7 = *(_DWORD *)a2 & 0xFFFDFFFF | (((f_blocks >> 6) & 1) << 17);
    *(_DWORD *)a2 = v7;
    if ((f_blocks & 2) == 0) {
      goto LABEL_16;
    }
    id v10 = v3;
    __int16 v11 = (const char *)[v10 fileSystemRepresentation];
    memset(&propertyValueTypeRefPtr, 0, 44);
    uint64_t v26 = 0;
    CFErrorRef error = (CFErrorRef)5;
    uint64_t v25 = 0x40000000;
    if (getattrlist(v11, &error, &propertyValueTypeRefPtr, 0x2CuLL, 0x21u))
    {
      CFIndex v12 = __error();
      unsigned int v14 = TCFURLInfo::TranslatePOSIXError((TCFURLInfo *)*v12, 0, v13);

      if (v14)
      {
        unsigned int v7 = *(_DWORD *)a2 & 0xFFFBFFFF;
        goto LABEL_15;
      }
      unsigned int f_bavail = 0;
    }
    else
    {
      unsigned int f_bavail = propertyValueTypeRefPtr.f_bavail;
    }
    unsigned int v7 = *(_DWORD *)a2 & 0xFFFBFFFF | (((f_bavail >> 28) & 1) << 18);
    goto LABEL_15;
  }
  return 4294959238;
}

void sub_10000FB80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_100008490((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t TCFURLInfo::TranslateFileProviderError(TCFURLInfo *this, __CFError *a2)
{
  CFIndex Code = CFErrorGetCode(this);
  if ((unint64_t)(Code + 1004) > 4) {
    return 4294959279;
  }
  else {
    return *((unsigned int *)&unk_100022C48 + Code + 1004);
  }
}

CFIndex TCFURLInfo::OSStatusFromCFErrorShallow(TCFURLInfo *this, __CFError *a2)
{
  Domain = (__CFString *)CFErrorGetDomain(this);
  CFTypeRef cf1 = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  TString::SetStringRefAsImmutable(&cf1, Domain);
  CFStringRef v15 = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  TString::SetStringRefAsImmutable((CFTypeRef *)&v15, (__CFString *)kCFErrorDomainPOSIX);
  LODWORD(Domain) = CFEqual(cf1, v15);
  sub_100007E94((const void **)&v15);
  if (Domain)
  {
    CFIndex Code = (TCFURLInfo *)CFErrorGetCode(this);
    unsigned int v6 = TCFURLInfo::TranslatePOSIXError(Code, 0, v5);
  }
  else
  {
    CFStringRef v15 = &stru_10002D5A8;
    CFRetain(&stru_10002D5A8);
    TString::SetStringRefAsImmutable((CFTypeRef *)&v15, (__CFString *)kCFErrorDomainOSStatus);
    int v8 = CFEqual(cf1, v15);
    sub_100007E94((const void **)&v15);
    if (v8)
    {
      CFIndex v7 = CFErrorGetCode(this);
      goto LABEL_6;
    }
    FileProviderErrorDomain((CFTypeRef *)&v15);
    if (CFEqual(cf1, v15))
    {
      sub_100007E94((const void **)&v15);
    }
    else
    {
      CFTypeRef cf2 = &stru_10002D5A8;
      CFRetain(&stru_10002D5A8);
      TString::SetStringRefAsImmutable(&cf2, (__CFString *)NSURLErrorDomain);
      int v11 = CFEqual(cf1, cf2);
      sub_100007E94(&cf2);
      sub_100007E94((const void **)&v15);
      if (!v11)
      {
        CFStringRef v15 = &stru_10002D5A8;
        CFRetain(&stru_10002D5A8);
        TString::SetStringRefAsImmutable((CFTypeRef *)&v15, (__CFString *)kCFErrorDomainCocoa);
        int v12 = CFEqual(cf1, v15);
        sub_100007E94((const void **)&v15);
        if (v12)
        {
          int v13 = CFErrorGetCode(this);
          if (v13 > 639)
          {
            if (v13 > 4352)
            {
              if (v13 == 4353 || v13 == 4355)
              {
                CFIndex v7 = 4294959289;
                goto LABEL_6;
              }
            }
            else
            {
              if (v13 == 640)
              {
                CFIndex v7 = 4294967262;
                goto LABEL_6;
              }
              if (v13 == 3072)
              {
                CFIndex v7 = 4294967168;
                goto LABEL_6;
              }
            }
          }
          else
          {
            CFIndex v7 = 4294967253;
            if (v13 > 259)
            {
              if (v13 == 260) {
                goto LABEL_6;
              }
              if (v13 == 516)
              {
                CFIndex v7 = 4294967248;
                goto LABEL_6;
              }
            }
            else
            {
              if (v13 == 4) {
                goto LABEL_6;
              }
              if (v13 == 257)
              {
                CFIndex v7 = 4294967242;
                goto LABEL_6;
              }
            }
          }
        }
        CFIndex v7 = 4294967260;
        goto LABEL_6;
      }
    }
    unsigned int v6 = (TCFURLInfo *)TCFURLInfo::TranslateFileProviderError(this, v10);
  }
  CFIndex v7 = (CFIndex)v6;
LABEL_6:
  sub_100007E94(&cf1);
  return v7;
}

void sub_10000FE50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  size_t v4 = va_arg(va1, const void *);
  sub_100007E94((const void **)va);
  sub_100007E94((const void **)va1);
  _Unwind_Resume(a1);
}

id sub_10000FEBC(void **a1, void *a2)
{
  id v3 = a2;
  size_t v4 = *a1;
  if (v3) {
    id v5 = [v4 isEqualToString:v3];
  }
  else {
    id v5 = [v4 isEqualToString:&stru_10002D5A8];
  }
  id v6 = v5;

  return v6;
}

void sub_10000FF10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *TCFURLInfo::GetPropertyStoreName(TCFURLInfo *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100031BA8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100031BA8))
  {
    TString::TString((TString *)&unk_100031BA0, ".DS_Store", 9uLL);
    __cxa_guard_release(&qword_100031BA8);
  }
  return &unk_100031BA0;
}

void sub_10000FF90(_Unwind_Exception *a1)
{
}

void sub_10000FFA8()
{
  qword_100031B50 = 0;
  *(void *)algn_100031B58 = 0;
  qword_100031B60 = 0;
  unsigned __int8 v0 = NSHomeDirectory();
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"Applications"];
  id v4 = +[NSURL fileURLWithPath:v1 isDirectory:1];

  sub_100011AB0((char **)&qword_100031B50, &v4);
  id v3 = +[NSURL fileURLWithPath:@"/Developer" isDirectory:1];
  sub_100011AB0((char **)&qword_100031B50, &v3);
  id v2 = [v3 URLByAppendingPathComponent:@"Applications"];
  sub_100011AB0((char **)&qword_100031B50, &v2);
}

void sub_1000100B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void **a12)
{
  sub_100011C60(&a12);
  _Unwind_Resume(a1);
}

TCFURLInfo *TCFURLInfo::TranslateRawPOSIXError(TCFURLInfo *this, const char *a2, const char *a3)
{
  id v3 = this;
  if ((int)this < -1) {
    return v3;
  }
  if ((int)this > 62)
  {
    if ((int)this <= 68)
    {
      if (this == 63)
      {
        uint64_t v5 = 4294965886;
        goto LABEL_30;
      }
      if (this == 66)
      {
LABEL_12:
        uint64_t v5 = 4294967249;
        goto LABEL_30;
      }
    }
    else
    {
      switch(this)
      {
        case 'E':
          uint64_t v5 = 4294965871;
          goto LABEL_30;
        case 'P':
          uint64_t v5 = 4294962273;
          goto LABEL_30;
        case 'Y':
          uint64_t v5 = 4294967168;
LABEL_30:
          id v6 = LogObj(2);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          {
            CFIndex v7 = "'null'";
            v9[0] = 67109634;
            if (a2) {
              CFIndex v7 = a2;
            }
            v9[1] = v3;
            __int16 v10 = 1024;
            int v11 = v5;
            __int16 v12 = 2080;
            int v13 = v7;
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "TCFURLInfo::TranslateRawPOSIXError %d -> %d, path: %s", (uint8_t *)v9, 0x18u);
          }

          return (TCFURLInfo *)v5;
      }
    }
LABEL_29:
    uint64_t v5 = (this + 100000);
    goto LABEL_30;
  }
  uint64_t v5 = 4294967260;
  switch((int)this)
  {
    case -1:
    case 5:
      goto LABEL_30;
    case 0:
      return v3;
    case 1:
    case 13:
      uint64_t v5 = 4294962296;
      goto LABEL_30;
    case 2:
      uint64_t v5 = 4294967253;
      goto LABEL_30;
    case 9:
      uint64_t v5 = 4294967245;
      goto LABEL_30;
    case 11:
      uint64_t v5 = 4294959283;
      goto LABEL_30;
    case 12:
    case 23:
      uint64_t v5 = 4294967255;
      goto LABEL_30;
    case 16:
      goto LABEL_12;
    case 17:
      uint64_t v5 = 4294967248;
      goto LABEL_30;
    case 18:
      uint64_t v5 = 100018;
      goto LABEL_30;
    case 20:
    case 21:
      uint64_t v5 = 4294965889;
      goto LABEL_30;
    case 22:
      uint64_t v5 = 4294967246;
      goto LABEL_30;
    case 24:
      uint64_t v5 = 4294967254;
      goto LABEL_30;
    case 27:
      uint64_t v5 = 4294965987;
      goto LABEL_30;
    case 28:
      uint64_t v5 = 4294967262;
      goto LABEL_30;
    case 30:
      uint64_t v5 = 4294967235;
      goto LABEL_30;
    case 45:
      uint64_t v5 = 4294965870;
      goto LABEL_30;
    default:
      goto LABEL_29;
  }
  return v3;
}

uint64_t TCFURLInfo::DesktopServicesBundle(TCFURLInfo *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100031B78, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100031B78))
  {
    qword_100031B70 = (uint64_t)sub_100010448();
    __cxa_guard_release(&qword_100031B78);
  }
  return qword_100031B70;
}

void sub_100010430(_Unwind_Exception *a1)
{
}

CFBundleRef sub_100010448()
{
  CFBundleRef BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.desktopservices");
  CFBundleRef v5 = BundleWithIdentifier;
  if (BundleWithIdentifier)
  {
    CFBundleRef v1 = BundleWithIdentifier;
    CFRetain(BundleWithIdentifier);
  }
  else
  {
    CFURLRef v2 = +[NSURL fileURLWithPath:@"/System/Library/PrivateFrameworks/DesktopServicesPriv.framework" isDirectory:1];
    CFBundleRef v4 = CFBundleCreate(0, v2);
    sub_100011CE0((const void **)&v5, (const void **)&v4);
    sub_100011D2C((const void **)&v4);

    CFBundleRef v1 = v5;
  }
  CFBundleRef v5 = 0;
  sub_100011D2C((const void **)&v5);
  return v1;
}

void sub_1000104E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  sub_100011D2C((const void **)va);
  _Unwind_Resume(a1);
}

const void **TCFURLInfo::LocalizedCopyErrorMessage@<X0>(TCFURLInfo *this@<X0>, const void **a2@<X1>, CFTypeRef *a3@<X8>)
{
  if ((int)this <= -1310)
  {
    if ((int)this <= -5009)
    {
      if ((int)this <= -8088)
      {
        if (this == -8095)
        {
          int v8 = 0;
          int v7 = 0;
          CFStringRef v9 = @"ReservationError";
          goto LABEL_35;
        }
        if (this == -8089)
        {
          int v7 = 0;
          int v8 = 1;
          CFStringRef v9 = @"CaseSensitivity";
          goto LABEL_35;
        }
      }
      else
      {
        switch(this)
        {
          case 0xFFFFE069:
            goto LABEL_10;
          case 0xFFFFEC66:
            goto LABEL_20;
          case 0xFFFFEC6E:
LABEL_10:
            int v8 = 0;
            int v7 = 0;
            CFStringRef v9 = @"FileBusy";
            goto LABEL_35;
        }
      }
LABEL_31:
      int v8 = 0;
      int v7 = 1;
      CFStringRef v9 = @"UnknownError";
      goto LABEL_35;
    }
    if ((int)this <= -1430)
    {
      if (this != -5008)
      {
        if (this == -5000)
        {
          int v8 = 0;
          int v7 = 0;
          CFStringRef v9 = @"AccessDenied";
          goto LABEL_35;
        }
        goto LABEL_31;
      }
    }
    else if (this != -1429)
    {
      if (this == -1410)
      {
LABEL_28:
        int v7 = 0;
        int v8 = 1;
        CFStringRef v9 = @"BadName";
        goto LABEL_35;
      }
      if (this != -1401) {
        goto LABEL_31;
      }
      goto LABEL_20;
    }
LABEL_27:
    int v8 = 0;
    int v7 = 0;
    CFStringRef v9 = @"DiskFull";
    goto LABEL_35;
  }
  if ((int)this <= -49)
  {
    if (this == -1309)
    {
      int v8 = 0;
      int v7 = 0;
      CFStringRef v9 = @"FileTooBig";
      goto LABEL_35;
    }
    if (this != -120)
    {
      if (this == -61)
      {
        int v8 = 0;
        int v7 = 0;
        CFStringRef v9 = @"WritePermission";
        goto LABEL_35;
      }
      goto LABEL_31;
    }
LABEL_20:
    int v8 = 0;
    int v7 = 1;
    CFStringRef v9 = @"FileNotFound";
    goto LABEL_35;
  }
  switch((int)this)
  {
    case -48:
      int v7 = 0;
      int v8 = 1;
      CFStringRef v9 = @"DuplicateFileName";
      break;
    case -47:
      goto LABEL_10;
    case -46:
    case -45:
    case -44:
    case -42:
    case -41:
    case -40:
    case -39:
    case -38:
      goto LABEL_31;
    case -43:
    case -35:
      goto LABEL_20;
    case -37:
      goto LABEL_28;
    case -36:
      int v7 = 0;
      int v8 = 1;
      CFStringRef v9 = @"IOError";
      break;
    case -34:
      goto LABEL_27;
    default:
      if (this != 100006) {
        goto LABEL_31;
      }
      int v8 = 0;
      int v7 = 0;
      CFStringRef v9 = @"DeviceDisappeared";
      break;
  }
LABEL_35:
  __int16 v10 = (__CFBundle *)TCFURLInfo::DesktopServicesBundle(this);
  CFStringRef v11 = CFBundleCopyLocalizedString(v10, v9, v9, 0);
  CFNumberRef v18 = (__CFString *)v11;
  if (v8)
  {
    __int16 v12 = sub_100008550(a2);
    if (v12)
    {
      CFTypeRef v13 = CFAutorelease(v12);
      __int16 v12 = sub_100008588(v13);
    }
    CFStringRef v14 = CFStringCreateWithFormat(0, 0, v11, v12);
    goto LABEL_41;
  }
  if (v7)
  {
    CFStringRef v14 = CFStringCreateWithFormat(0, 0, v11, this);
LABEL_41:
    CFStringRef v17 = v14;
    sub_10000882C((const void **)&v18, (const void **)&v17);
    sub_100007E94((const void **)&v17);
  }
  CFStringRef v15 = v18;
  *a3 = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  TString::SetStringRefAsImmutable(a3, v15);
  return sub_100007E94((const void **)&v18);
}

void sub_1000107E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_100007E94((const void **)va);
  _Unwind_Resume(a1);
}

const void **TCFURLInfo::LocalizedStringWithFileName@<X0>(const __CFString *this@<X0>, __CFString *a2@<X1>, CFTypeRef *a3@<X8>)
{
  id v6 = TCFURLInfo::StringProperty((TCFURLInfo *)a2, kCFURLLocalizedNameKey, &cf);
  int v7 = (__CFBundle *)TCFURLInfo::DesktopServicesBundle((TCFURLInfo *)v6);
  CFStringRef v8 = CFBundleCopyLocalizedString(v7, this, this, 0);
  CFStringRef v15 = v8;
  CFTypeRef v9 = cf;
  if (cf)
  {
    CFTypeRef v10 = CFRetain(cf);
    CFTypeRef v9 = sub_100008588(v10);
    if (v9)
    {
      CFTypeRef v11 = CFAutorelease(v9);
      CFTypeRef v9 = sub_100008588(v11);
    }
  }
  __int16 v12 = (__CFString *)CFStringCreateWithFormat(0, 0, v8, v9);
  CFStringRef v14 = v12;
  *a3 = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  TString::SetStringRefAsImmutable(a3, v12);
  sub_100007E94((const void **)&v14);
  sub_100007E94((const void **)&v15);
  return sub_100007E94(&cf);
}

void sub_100010918(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  CFBundleRef v4 = va_arg(va1, const void *);
  va_copy(va2, va1);
  id v6 = va_arg(va2, const void *);
  sub_100007E94(v2);
  sub_100007E94((const void **)va);
  sub_100007E94((const void **)va1);
  sub_100007E94((const void **)va2);
  _Unwind_Resume(a1);
}

const void **TCFURLInfo::LocalizedStringWithKey@<X0>(TCFURLInfo *this@<X0>, CFTypeRef *a2@<X8>)
{
  CFBundleRef v5 = (__CFBundle *)TCFURLInfo::DesktopServicesBundle(this);
  id v6 = (__CFString *)CFBundleCopyLocalizedString(v5, (CFStringRef)this, (CFStringRef)this, 0);
  CFStringRef v8 = v6;
  *a2 = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  TString::SetStringRefAsImmutable(a2, v6);
  return sub_100007E94((const void **)&v8);
}

void sub_1000109C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100007E94(v2);
  sub_100007E94((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t TFileDescriptor::Close(TFileDescriptor *this)
{
  int v2 = *((_DWORD *)this + 2);
  if (v2 < 1) {
    return 4294967242;
  }
  uint64_t result = close(v2);
  if (result) {
    uint64_t result = (uint64_t)TCFURLInfo::TranslatePOSIXError((TCFURLInfo *)result, 0, v4);
  }
  if (result) {
    int v5 = -1;
  }
  else {
    int v5 = 0;
  }
  *((_DWORD *)this + 2) = v5;
  return result;
}

uint64_t TFileDescriptor::Open(uint64_t a1, char *a2, int a3, int a4, CFFileSecurityRef fileSec, int a6, int a7, int a8)
{
  if (a2 && *(int *)(a1 + 8) <= 0)
  {
    CFFileSecurityRef fileSeca = 0;
    mode_t mode = 0;
    switch(a3)
    {
      case 1:
        CFStringRef v15 = 0;
        int v16 = 0;
        break;
      case 3:
        CFStringRef v15 = 0;
        int v16 = 1;
        break;
      case 2:
        mode_t mode = 420;
        if (a8)
        {
          if (!fileSec)
          {
            CFStringRef v15 = 0;
            CFFileSecurityRef fileSeca = 0;
            goto LABEL_21;
          }
          CFStringRef Copy = CFFileSecurityCreateCopy(0, fileSec);
          CFFileSecurityRef fileSeca = Copy;
          if (Copy)
          {
            if (CFFileSecurityClearProperties(Copy, 2uLL))
            {
              CFFileSecurityGetMode(fileSeca, &mode);
              mode |= 0x80u;
              if (CFFileSecuritySetMode(fileSeca, mode)) {
                uint64_t v9 = 0;
              }
              else {
                uint64_t v9 = 4294967246;
              }
            }
            else
            {
              uint64_t v9 = 4294967246;
            }
            uint64_t v17 = _CFFileSecurityGetFilesec();
            if (v9) {
              goto LABEL_41;
            }
            CFStringRef v15 = (_filesec *)v17;
            goto LABEL_21;
          }
        }
        CFStringRef v15 = 0;
LABEL_21:
        int v16 = 2561;
        break;
      default:
        abort();
    }
    if (a7) {
      v16 |= 0x24u;
    }
    *(_DWORD *)(a1 + 8) = -1;
    int v18 = (a4 == 1) << 29;
    if (a4 == 2) {
      int v18 = 256;
    }
    int v19 = v16 | v18;
    if (v15 && (int v20 = openx_np(a2, v16 | v18, v15), *(_DWORD *)(a1 + 8) = v20, v20 != -1)
      || (int v20 = open(a2, v19, mode), *(_DWORD *)(a1 + 8) = v20, v20 != -1))
    {
      if (v20 <= 2)
      {
        int v21 = fcntl(v20, 0, 3);
        if (v21 != -1)
        {
          close(*(_DWORD *)(a1 + 8));
          *(_DWORD *)(a1 + 8) = v21;
        }
      }
      goto LABEL_32;
    }
    unint64_t v23 = (TCFURLInfo *)*__error();
    if (!v23
      || (uint64_t v9 = 4294967242, v23 != 1)
      && v23 != 35
      && (uint64_t v9 = (uint64_t)TCFURLInfo::TranslatePOSIXError(v23, 0, v24), !v9))
    {
LABEL_32:
      if (a6)
      {
        fcntl(*(_DWORD *)(a1 + 8), 48, 1);
        fcntl(*(_DWORD *)(a1 + 8), 76, 1);
      }
      uint64_t v9 = 0;
LABEL_35:
      sub_100011E7C((const void **)&fileSeca);
      return v9;
    }
LABEL_41:
    int v25 = *(_DWORD *)(a1 + 8);
    if (v25 >= 1) {
      close(v25);
    }
    *(_DWORD *)(a1 + 8) = 0;
    goto LABEL_35;
  }
  return 4294967242;
}

void sub_100010C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_100011E7C((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t TCFURLInfo::CreateFile(TCFURLInfo **a1, id *a2, uint64_t a3, __CFFileSecurity *a4, __CFFileSecurity *a5, uint64_t a6)
{
  TCFURLInfo::FileSystemRepresentation(*a1, (const __CFURL *)1, (TString *)&theString);
  if (CFStringGetLength(theString))
  {
    CFStringRef Copy = CFFileSecurityCreateCopy(0, a4);
    int v20 = Copy;
    if (Copy) {
      CFFileSecurityClearProperties(Copy, 2uLL);
    }
    CFStringRef v19 = &stru_10002D5A8;
    CFRetain(&stru_10002D5A8);
    uint64_t File = TCFURLInfo::CreateFile((id *)&theString, a2, v20, a5, (CFTypeRef *)&v19, v11);
    if (!File)
    {
      sub_10000866C(&v18);
      long long v13 = v18;
      long long v18 = 0uLL;
      CFStringRef v14 = *(std::__shared_weak_count **)(a6 + 8);
      *(_OWORD *)a6 = v13;
      if (v14)
      {
        sub_1000085C4(v14);
        if (*((void *)&v18 + 1)) {
          sub_1000085C4(*((std::__shared_weak_count **)&v18 + 1));
        }
      }
      CFStringRef v15 = *(CFTypeRef **)a6;
      int v16 = (const char *)TString::c_str((id *)&v19);
      uint64_t File = TCFURLInfo::Initialize(v15, v16);
    }
    sub_100007E94((const void **)&v19);
    sub_100011E7C((const void **)&v20);
  }
  else
  {
    uint64_t File = 4294959236;
  }
  sub_100007E94((const void **)&theString);
  return File;
}

void sub_100010DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  CFBundleRef v4 = va_arg(va1, const void *);
  va_copy(va2, va1);
  id v6 = va_arg(va2, const void *);
  sub_100007E94((const void **)va);
  sub_100011E7C((const void **)va1);
  sub_100007E94((const void **)va2);
  _Unwind_Resume(a1);
}

uint64_t TCFURLInfo::CreateFile(id *this, id *a2, const TString *a3, __CFFileSecurity *a4, CFTypeRef *a5, TString *a6)
{
  int v7 = (int)a4;
  TString::SetStringRefAsImmutable(a5, 0);
  if (!a3) {
    return 4294959224;
  }
  TString::Str(this, &v25);
  char v24 = 1;
  LOWORD(__p) = 47;
  std::string::size_type size = HIBYTE(v25.__r_.__value_.__r.__words[2]);
  if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    __int16 v12 = &v25;
  }
  else {
    __int16 v12 = (std::string *)v25.__r_.__value_.__r.__words[0];
  }
  if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v25.__r_.__value_.__l.__size_;
  }
  v26[0] = v12;
  v26[1] = size;
  BOOL v13 = sub_100011D60(v26, &__p, 1uLL);
  BOOL v14 = v13;
  if ((v24 & 0x80000000) == 0)
  {
    if (v13) {
      goto LABEL_14;
    }
LABEL_12:
    char v24 = 1;
    LOWORD(__p) = 47;
    std::string::append(&v25, (const std::string::value_type *)&__p, 1uLL);
    if (v24 < 0) {
      operator delete(__p);
    }
    goto LABEL_14;
  }
  operator delete(__p);
  if (!v14) {
    goto LABEL_12;
  }
LABEL_14:
  TString::Str(a2, &__p);
  if (v24 >= 0) {
    p_p = (const std::string::value_type *)&__p;
  }
  else {
    p_p = (const std::string::value_type *)__p;
  }
  if (v24 >= 0) {
    std::string::size_type v17 = v24;
  }
  else {
    std::string::size_type v17 = v23;
  }
  std::string::append(&v25, p_p, v17);
  if (v24 < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0 && v25.__r_.__value_.__l.__size_ > 0x400)
  {
    uint64_t v15 = 4294959236;
LABEL_37:
    operator delete(v25.__r_.__value_.__l.__data_);
    return v15;
  }
  TString::SetStringRefAsImmutable(a5, 0);
  if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    long long v18 = &v25;
  }
  else {
    long long v18 = (std::string *)v25.__r_.__value_.__r.__words[0];
  }
  if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v19 = HIBYTE(v25.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v19 = v25.__r_.__value_.__l.__size_;
  }
  TString::SetFromUTF8(a5, (const UInt8 *)v18, v19);
  __p = 0;
  LODWORD(v23) = 0;
  BYTE4(v23) = 0;
  if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v20 = &v25;
  }
  else {
    int v20 = (std::string *)v25.__r_.__value_.__r.__words[0];
  }
  uint64_t v15 = TFileDescriptor::Open((uint64_t)&__p, (char *)v20, 2, 2, a3, 0, 0, v7);
  if (!v15) {
    uint64_t v15 = TFileDescriptor::Close((TFileDescriptor *)&__p);
  }
  TFileDescriptor::~TFileDescriptor((TFileDescriptor *)&__p);
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_37;
  }
  return v15;
}

void sub_100010FF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

uint64_t TCFURLInfo::CreateDirectory(TCFURLInfo *a1, id *a2, uint64_t a3, __CFFileSecurity *a4, __CFFileSecurity *a5, uint64_t a6)
{
  uint64_t v10 = TCFURLInfo::PathAsCStr(a1);
  if (!v10) {
    return 4294959236;
  }
  CFTypeRef v11 = (const char *)v10;
  CFStringRef Copy = CFFileSecurityCreateCopy(0, a4);
  CFStringRef v22 = Copy;
  if (Copy) {
    CFFileSecurityClearProperties(Copy, 2uLL);
  }
  CFStringRef v21 = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  TString::TString((TString *)v20, v11);
  uint64_t Directory = TCFURLInfo::CreateDirectory(v20, a2, v22, a5, (CFTypeRef *)&v21, v13);
  sub_100007E94((const void **)v20);
  if (!Directory)
  {
    sub_10000866C(v20);
    long long v15 = *(_OWORD *)v20;
    *(_OWORD *)int v20 = 0uLL;
    int v16 = *(std::__shared_weak_count **)(a6 + 8);
    *(_OWORD *)a6 = v15;
    if (v16)
    {
      sub_1000085C4(v16);
      if (v20[1]) {
        sub_1000085C4((std::__shared_weak_count *)v20[1]);
      }
    }
    std::string::size_type v17 = *(CFTypeRef **)a6;
    long long v18 = (const char *)TString::c_str((id *)&v21);
    uint64_t Directory = TCFURLInfo::Initialize(v17, v18);
  }
  sub_100007E94((const void **)&v21);
  sub_100011E7C((const void **)&v22);
  return Directory;
}

void sub_100011154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va1, a4);
  va_start(va, a4);
  int v5 = va_arg(va1, const void *);
  sub_100007E94((const void **)va);
  sub_100011E7C((const void **)va1);
  _Unwind_Resume(a1);
}

uint64_t TCFURLInfo::CreateDirectory(id *this, id *a2, const TString *a3, __CFFileSecurity *a4, CFTypeRef *a5, TString *a6)
{
  int v7 = (int)a4;
  TString::SetStringRefAsImmutable(a5, 0);
  if (!a3) {
    return 4294959224;
  }
  TString::Str(this, &v26);
  char v24 = 1;
  LOWORD(__p[0]) = 47;
  CFStringRef v25 = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  TString::SetFromUTF8((CFTypeRef *)&v25, (const UInt8 *)__p, 1);
  BOOL v11 = TString::EndsWith((CFStringRef *)this, &v25);
  sub_100007E94((const void **)&v25);
  if ((v24 & 0x80000000) == 0)
  {
    if (v11) {
      goto LABEL_9;
    }
LABEL_7:
    char v24 = 1;
    LOWORD(__p[0]) = 47;
    std::string::append(&v26, (const std::string::value_type *)__p, 1uLL);
    if (v24 < 0) {
      operator delete(__p[0]);
    }
    goto LABEL_9;
  }
  operator delete(__p[0]);
  if (!v11) {
    goto LABEL_7;
  }
LABEL_9:
  TString::Str(a2, __p);
  if (v24 >= 0) {
    BOOL v13 = __p;
  }
  else {
    BOOL v13 = (void **)__p[0];
  }
  if (v24 >= 0) {
    std::string::size_type v14 = v24;
  }
  else {
    std::string::size_type v14 = (std::string::size_type)__p[1];
  }
  std::string::append(&v26, (const std::string::value_type *)v13, v14);
  if (v24 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0 && v26.__r_.__value_.__l.__size_ > 0x3FF)
  {
    uint64_t v12 = 4294959236;
LABEL_37:
    operator delete(v26.__r_.__value_.__l.__data_);
    return v12;
  }
  TString::SetStringRefAsImmutable(a5, 0);
  if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    long long v15 = &v26;
  }
  else {
    long long v15 = (std::string *)v26.__r_.__value_.__r.__words[0];
  }
  if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v26.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v26.__r_.__value_.__l.__size_;
  }
  TString::SetFromUTF8(a5, (const UInt8 *)v15, size);
  Filesec = (_filesec *)_CFFileSecurityGetFilesec();
  if (Filesec && v7)
  {
    if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      long long v18 = &v26;
    }
    else {
      long long v18 = (std::string *)v26.__r_.__value_.__r.__words[0];
    }
    std::string::size_type v19 = (TCFURLInfo *)mkdirx_np((const char *)v18, Filesec);
  }
  else
  {
    LOWORD(__p[0]) = 0;
    CFFileSecurityGetMode(a3, (mode_t *)__p);
    if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      CFStringRef v21 = &v26;
    }
    else {
      CFStringRef v21 = (std::string *)v26.__r_.__value_.__r.__words[0];
    }
    std::string::size_type v19 = (TCFURLInfo *)mkdir((const char *)v21, (mode_t)__p[0]);
  }
  uint64_t v12 = (uint64_t)TCFURLInfo::TranslatePOSIXError(v19, 0, v20);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_37;
  }
  return v12;
}

void sub_1000113B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100011410(id a1)
{
  qword_100031B80 = (uint64_t)CFDateCreate(0, -3061152000.0);
}

void sub_10001143C(id a1)
{
  qword_100031B90 = (uint64_t)CFDateCreate(0, -534528000.0);
}

uint64_t TCFURLInfo::CreateLockDirectory(TCFURLInfo *a1, TCFURLInfo **a2, __CFString **a3, __CFFileSecurity *a4, __CFFileSecurity *a5, id **a6)
{
  if (a3)
  {
    CFStringRef v23 = &stru_10002D5A8;
    CFRetain(&stru_10002D5A8);
    TString::SetStringRefAsImmutable((CFTypeRef *)&v23, *a3);
  }
  else
  {
    TCFURLInfo::Name(*a2, (CFTypeRef *)&v23);
  }
  sub_10000866C(&v21);
  uint64_t Directory = TCFURLInfo::CreateDirectory(a1, (id *)&v23, v12, a4, a5, (uint64_t)&v21);
  if (!Directory)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFMutableDictionaryRef theDict = Mutable;
    if (qword_100031B98 != -1) {
      dispatch_once(&qword_100031B98, &stru_10002CFF8);
    }
    CFDictionaryAddValue(Mutable, kCFURLCreationDateKey, (const void *)qword_100031B90);
    long long v15 = *a2;
    if (*((int *)v15 + 18) <= 1) {
      TCFURLInfo::FetchProperties((const void **)v15, 1);
    }
    if ((*((_WORD *)v15 + 38) & 0x40) != 0) {
      CFDictionaryAddValue(theDict, kCFURLHasHiddenExtensionKey, kCFBooleanTrue);
    }
    uint64_t Directory = TCFURLInfo::SetResourceProperties(v21, theDict);
    if (!Directory)
    {
      std::string::size_type v17 = v21;
      int v16 = v22;
      if (v22) {
        atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v18 = (std::__shared_weak_count *)a6[1];
      *a6 = v17;
      a6[1] = (id *)&v16->__vftable;
      if (v18) {
        sub_1000085C4(v18);
      }
    }
    sub_100011EE4((const void **)&theDict);
  }
  if (v22) {
    sub_1000085C4(v22);
  }
  sub_100007E94((const void **)&v23);
  return Directory;
}

void sub_10001161C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, std::__shared_weak_count *a4, ...)
{
  va_start(va, a4);
  if (a4) {
    sub_1000085C4(a4);
  }
  sub_100007E94((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t TCFURLInfo::CreateLockFile(TCFURLInfo **a1, TCFURLInfo **a2, __CFString **a3, __CFFileSecurity *a4, __CFFileSecurity *a5, id **a6)
{
  if (a3)
  {
    CFStringRef v29 = &stru_10002D5A8;
    CFRetain(&stru_10002D5A8);
    TString::SetStringRefAsImmutable((CFTypeRef *)&v29, *a3);
  }
  else
  {
    TCFURLInfo::Name(*a2, (CFTypeRef *)&v29);
  }
  sub_10000866C(&v27);
  uint64_t File = TCFURLInfo::CreateFile(a1, (id *)&v29, v12, a4, a5, (uint64_t)&v27);
  if (!File)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFMutableDictionaryRef theDict = Mutable;
    if (qword_100031B88 != -1) {
      dispatch_once(&qword_100031B88, &stru_10002CFD8);
    }
    CFDictionaryAddValue(Mutable, kCFURLCreationDateKey, (const void *)qword_100031B80);
    bytes[9] = 0;
    __int16 v22 = 0;
    int v23 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    strcpy((char *)bytes, "korbSCAM");
    value = CFDataCreateMutable(0, 32);
    CFDataAppendBytes((CFMutableDataRef)value, bytes, 32);
    CFDictionaryAddValue(theDict, _kCFURLFinderInfoKey, value);
    long long v15 = *a2;
    if (*((int *)v15 + 18) <= 1) {
      TCFURLInfo::FetchProperties((const void **)v15, 1);
    }
    if ((*((_WORD *)v15 + 38) & 0x40) != 0) {
      CFDictionaryAddValue(theDict, kCFURLHasHiddenExtensionKey, kCFBooleanTrue);
    }
    uint64_t File = TCFURLInfo::SetResourceProperties(v27, theDict);
    if (!File)
    {
      std::string::size_type v17 = v27;
      int v16 = v28;
      if (v28) {
        atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v18 = (std::__shared_weak_count *)a6[1];
      *a6 = v17;
      a6[1] = (id *)&v16->__vftable;
      if (v18) {
        sub_1000085C4(v18);
      }
    }
    sub_100011F50((const void **)&value);
    sub_100011EE4((const void **)&theDict);
  }
  if (v28) {
    sub_1000085C4(v28);
  }
  sub_100007E94((const void **)&v29);
  return File;
}

void sub_100011860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, const void *a15, uint64_t a16, std::__shared_weak_count *a17)
{
  sub_100011EE4(&a15);
  if (a17) {
    sub_1000085C4(a17);
  }
  sub_100007E94((const void **)(v17 - 56));
  _Unwind_Resume(a1);
}

void TFileDescriptor::~TFileDescriptor(TFileDescriptor *this)
{
  if (*((int *)this + 2) >= 1) {
    TFileDescriptor::Close(this);
  }
}

BOOL PrefsBool(const __CFString *a1, BOOL a2)
{
  CFStringRef v3 = (const __CFString *)CFPreferencesCopyAppValue(a1, @"com.apple.desktopservices");
  CFStringRef theString1 = v3;
  if (v3)
  {
    CFTypeID v4 = CFGetTypeID(v3);
    if (v4 == CFStringGetTypeID())
    {
      if (CFStringCompare(theString1, @"true", 1uLL) == kCFCompareEqualTo
        || CFStringCompare(theString1, @"1", 1uLL) == kCFCompareEqualTo)
      {
        a2 = 1;
        goto LABEL_14;
      }
      BOOL v5 = CFStringCompare(theString1, @"YES", 1uLL) == kCFCompareEqualTo;
    }
    else
    {
      CFTypeID v6 = CFGetTypeID(theString1);
      if (v6 == CFBooleanGetTypeID())
      {
        a2 = CFEqual(theString1, kCFBooleanTrue) != 0;
        goto LABEL_14;
      }
      CFTypeID v7 = CFGetTypeID(theString1);
      if (v7 != CFNumberGetTypeID()) {
        goto LABEL_14;
      }
      BOOL v5 = CFEqual(theString1, &off_10002DEB8) == 0;
    }
    a2 = v5;
  }
LABEL_14:
  sub_10000C80C((const void **)&theString1);
  return a2;
}

void sub_100011A08(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10000C80C((const void **)va);
  _Unwind_Resume(a1);
}

Class sub_100011A20()
{
  if (qword_100031BB0
    || (qword_100031BB0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CloudDocs.framework/CloudDocs", 2)) != 0)
  {
    Class Class = objc_getClass("BRContainer");
    qword_100031BB8 = (uint64_t)Class;
    off_100031988 = (uint64_t (*)())sub_100011AA4;
  }
  else
  {
    Class Class = (Class)qword_100031BB8;
  }
  return Class;
}

id sub_100011AA4()
{
  return (id)qword_100031BB8;
}

id sub_100011AB0(char **a1, id *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  CFTypeID v7 = *(char **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v10 = (v7 - *a1) >> 3;
    if ((unint64_t)(v10 + 1) >> 61) {
      sub_10000C988();
    }
    uint64_t v11 = v5 - (void)*a1;
    uint64_t v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1)) {
      uint64_t v12 = v10 + 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    uint64_t v25 = v4;
    if (v13) {
      std::string::size_type v14 = (char *)sub_100011BD4(v4, v13);
    }
    else {
      std::string::size_type v14 = 0;
    }
    long long v15 = &v14[8 * v10];
    int v16 = &v14[8 * v13];
    uint64_t v24 = v16;
    *(void *)long long v15 = *a2;
    uint64_t v9 = v15 + 8;
    v23.i64[1] = (uint64_t)(v15 + 8);
    long long v18 = *a1;
    uint64_t v17 = a1[1];
    if (v17 == *a1)
    {
      int64x2_t v20 = vdupq_n_s64((unint64_t)v17);
    }
    else
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *(void *)uint64_t v17 = 0;
        *((void *)v15 - 1) = v19;
        v15 -= 8;
      }
      while (v17 != v18);
      int64x2_t v20 = *(int64x2_t *)a1;
      uint64_t v9 = (char *)v23.i64[1];
      int v16 = v24;
    }
    *a1 = v15;
    a1[1] = v9;
    int64x2_t v23 = v20;
    CFStringRef v21 = a1[2];
    a1[2] = v16;
    uint64_t v24 = v21;
    uint64_t v22 = v20.i64[0];
    id result = (id)sub_100011C0C((uint64_t)&v22);
  }
  else
  {
    id result = *a2;
    *(void *)CFTypeID v7 = result;
    uint64_t v9 = v7 + 8;
  }
  a1[1] = v9;
  return result;
}

void *sub_100011BD4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_1000084C4();
  }
  return operator new(8 * a2);
}

uint64_t sub_100011C0C(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_100011C60(void ***a1)
{
  CFBundleRef v1 = *a1;
  int v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        unint64_t v6 = (void *)*((void *)v4 - 1);
        v4 -= 8;
      }
      while (v4 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

const void **sub_100011CE0(const void **a1, const void **a2)
{
  if (a1 != a2)
  {
    uint64_t v4 = *a1;
    if (*a1) {
      CFRelease(v4);
    }
    *a1 = *a2;
    *a2 = 0;
  }
  return a1;
}

const void **sub_100011D2C(const void **a1)
{
  int v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

BOOL sub_100011D60(void *a1, void *__s2, size_t a3)
{
  size_t v3 = a1[1];
  return v3 >= a3 && sub_100011DA4(a1, v3 - a3, 0xFFFFFFFFFFFFFFFFLL, __s2, a3) == 0;
}

uint64_t sub_100011DA4(void *a1, unint64_t a2, size_t a3, void *__s2, size_t a5)
{
  unint64_t v5 = a1[1];
  BOOL v6 = v5 >= a2;
  size_t v7 = v5 - a2;
  if (!v6) {
    sub_10000C840("string_view::substr");
  }
  uint64_t v9 = (const void *)(*a1 + a2);
  if (v7 >= a3) {
    size_t v10 = a3;
  }
  else {
    size_t v10 = v7;
  }
  if (a5 >= v10) {
    size_t v11 = v10;
  }
  else {
    size_t v11 = a5;
  }
  LODWORD(result) = memcmp(v9, __s2, v11);
  if (v10 < a5) {
    unsigned int v13 = -1;
  }
  else {
    unsigned int v13 = 1;
  }
  if (v10 == a5) {
    unsigned int v13 = 0;
  }
  if (result) {
    return result;
  }
  else {
    return v13;
  }
}

const void **sub_100011E14(const void **a1)
{
  int v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_100011E48(const void **a1)
{
  int v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_100011E7C(const void **a1)
{
  int v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_100011EB0(const void **a1)
{
  int v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_100011EE4(const void **a1)
{
  int v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void **sub_100011F18(void **a1)
{
  int v2 = *a1;
  if (v2)
  {
    acl_free(v2);
    *a1 = 0;
  }
  return a1;
}

const void **sub_100011F50(const void **a1)
{
  int v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

uint64_t ICloudDriveFPFSEnabled(void)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100031BC8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100031BC8))
  {
    byte_100031BC0 = UseFileProviderFramework();
    __cxa_guard_release(&qword_100031BC8);
  }
  return byte_100031BC0;
}

void sub_100011FE0(_Unwind_Exception *a1)
{
}

Class FPProviderDomainClass(void)
{
  return off_100031998();
}

BOOL IsLocalStorageDomainID(CFTypeRef *a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100031BD8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100031BD8))
  {
    TString::TString((TString *)&qword_100031BD0, "com.apple.FileProvider.LocalStorage");
    __cxa_guard_release(&qword_100031BD8);
  }
  return CFEqual(*a1, (CFTypeRef)qword_100031BD0) != 0;
}

void sub_100012080(_Unwind_Exception *a1)
{
}

BOOL IsExternalDeviceDomainID(CFStringRef *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100031BE8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100031BE8))
  {
    TString::TString((TString *)&qword_100031BE0, "com.apple.filesystems.UserFS.FileProvider", 0x29uLL);
    __cxa_guard_release(&qword_100031BE8);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100031BF8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100031BF8))
  {
    TString::TString((TString *)&qword_100031BF0, "com.apple.SMBClientProvider.FileProvider", 0x28uLL);
    __cxa_guard_release(&qword_100031BF8);
  }
  if (TString::BeginsWith(this, &qword_100031BE0)) {
    return 1;
  }
  return TString::BeginsWith(this, &qword_100031BF0);
}

void sub_100012188(_Unwind_Exception *a1)
{
}

BOOL IsDataSeparatedDomainID(CFStringRef *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100031C08, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100031C08))
  {
    TString::TString((TString *)&qword_100031C00, "com.apple.CloudDocs.iCloudDriveFileProviderManaged/", 0x33uLL);
    __cxa_guard_release(&qword_100031C08);
  }
  return TString::BeginsWith(this, &qword_100031C00);
}

void sub_100012234(_Unwind_Exception *a1)
{
}

BOOL IsMainICloudDriveDomainID(CFStringRef *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100031C18, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100031C18))
  {
    TString::TString((TString *)&qword_100031C10, "com.apple.CloudDocs.iCloudDriveFileProvider/", 0x2CuLL);
    __cxa_guard_release(&qword_100031C18);
  }
  return TString::BeginsWith(this, &qword_100031C10);
}

void sub_1000122D0(_Unwind_Exception *a1)
{
}

BOOL IsICloudDriveDomainID(CFStringRef *a1)
{
  if (!ICloudDriveFPFSEnabled()) {
    return 0;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100031C28, memory_order_acquire) & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_100031C28))
    {
      TString::TString((TString *)&qword_100031C20, "com.apple.CloudDocs.iCloudDriveFileProvider", 0x2BuLL);
      __cxa_guard_release(&qword_100031C28);
    }
  }
  return TString::BeginsWith(a1, &qword_100031C20);
}

void sub_100012378(_Unwind_Exception *a1)
{
}

void FileProviderErrorDomain(CFTypeRef *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100031C38, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100031C38))
  {
    int v2 = (void *)qword_100031C48;
    if (!qword_100031C48)
    {
      int v2 = dlopen("/System/Library/Frameworks/FileProvider.framework/FileProvider", 2);
      qword_100031C48 = (uint64_t)v2;
    }
    size_t v3 = (id *)dlsym(v2, "NSFileProviderErrorDomain");
    qword_100031C30 = sub_1000124D0(v3, @"com.apple.FileProvider");
    __cxa_guard_release(&qword_100031C38);
  }
  uint64_t v4 = (__CFString *)(id)qword_100031C30;
  *a1 = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  TString::SetStringRefAsImmutable(a1, v4);
}

void sub_100012488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

id sub_1000124D0(id *a1, id a2)
{
  if (a1) {
    a2 = *a1;
  }
  return a2;
}

Class sub_1000124E0()
{
  if (qword_100031C48
    || (qword_100031C48 = (uint64_t)dlopen("/System/Library/Frameworks/FileProvider.framework/FileProvider", 2)) != 0)
  {
    Class Class = objc_getClass("FPProviderDomain");
    qword_100031C40 = (uint64_t)Class;
    off_100031998 = (uint64_t (*)())sub_100012564;
  }
  else
  {
    Class Class = (Class)qword_100031C40;
  }
  return Class;
}

id sub_100012564()
{
  return (id)qword_100031C40;
}

os_log_t LogObj(int a1)
{
  if ((a1 - 1) > 7) {
    CFBundleRef v1 = "ArchiveService";
  }
  else {
    CFBundleRef v1 = off_10002D018[a1 - 1];
  }
  os_log_t v2 = os_log_create("com.apple.DesktopServices", v1);
  return v2;
}

void sub_100012778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  unsetenv("TMPDIR");
  _set_user_dir_suffix();
  size_t v3 = objc_opt_new();
  uint64_t v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_10001283C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012A64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012BE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100012EFC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3
    || (unint64_t v5 = *(void **)(a1 + 32),
        uint64_t v6 = *(void *)(a1 + 40),
        id v14 = 0,
        id v7 = [v5 openArchiveFile:v6 error:&v14],
        id v3 = v14,
        v7 == -1))
  {
    uint64_t v4 = 0;
  }
  else
  {
    CFStringRef v8 = *(void **)(a1 + 32);
    uint64_t v9 = [*(id *)(a1 + 48) URL];
    id v10 = [*(id *)(a1 + 56) mutableCopy];
    id v13 = v3;
    uint64_t v4 = [v8 archivedItemDescriptorsForFD:v7 url:v9 passphrases:v10 progress:0 formats:1 destinationFolderURL:0 error:&v13];
    id v11 = v13;

    id v3 = v11;
  }
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v12 = [*(id *)(a1 + 48) URL];
    [v12 stopAccessingSecurityScopedResource];
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_100013020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000134C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  if (*(unsigned char *)(v11 - 120)) {
    sub_100007E94((const void **)(v11 - 128));
  }

  _Unwind_Resume(a1);
}

void sub_1000138C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  sub_100007E94((const void **)va);
  _Unwind_Resume(a1);
}

void sub_100013E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_100014070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100014088(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a3;
  id v7 = a4;
  CFStringRef v8 = [a2 url];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 URLByAppendingPathComponent:v11];

    uint64_t v9 = (void *)v10;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100014134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000143B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id a35)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v38 - 152), 8);

  _Unwind_Resume(a1);
}

uint64_t sub_10001441C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001442C(uint64_t a1)
{
}

id sub_100014434(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v40 = a3;
  id v41 = a4;
  if (!*(unsigned char *)(a1 + 88))
  {
LABEL_4:
    uint64_t v17 = sub_100014984();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000149D8;
    block[3] = &unk_10002D0B0;
    id v18 = v41;
    uint64_t v19 = *(void *)(a1 + 64);
    id v43 = v18;
    uint64_t v45 = v19;
    id v20 = v40;
    id v44 = v20;
    dispatch_async(v17, block);

    id v21 = [v20 URLByAppendingPathComponent:@"archive-XXXXXX"];
    uint64_t v22 = strdup((const char *)[v21 fileSystemRepresentation]);
    if (!v22)
    {
      long long v35 = +[NSError ds_errorWithPOSIXCode:*__error() itemURL:v21 debugDescription:@"Couldn't create temporary folder name"];
      CFDictionaryRef v36 = v35;
      if (a5) {
        *a5 = v35;
      }
      __int16 v37 = LogObj(0);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v48 = v36;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Couldn't create temporary folder name: %@", buf, 0xCu);
      }

      id v30 = 0;
      goto LABEL_24;
    }
    int64x2_t v23 = v22;
    uint64_t v24 = mkstemp(v22);
    uint64_t v25 = +[NSFileManager defaultManager];
    std::string v26 = [v25 stringWithFileSystemRepresentation:v23 length:strlen(v23)];
    uint64_t v27 = +[NSURL fileURLWithPath:v26];
    uint64_t v28 = *(void *)(*(void *)(a1 + 72) + 8);
    CFStringRef v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;

    if ((v24 & 0x80000000) != 0)
    {
      uint64_t v38 = +[NSError ds_errorWithPOSIXCode:*__error() itemURL:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) debugDescription:@"Couldn't create temporary folder"];
      long long v32 = v38;
      if (a5) {
        *a5 = v38;
      }
      long long v33 = LogObj(0);
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v48 = v32;
      long long v34 = "Couldn't create temporary folder: %@";
    }
    else
    {
      fchmod(v24, 0x1A4u);
      id v30 = [*(id *)(a1 + 32) _archiveFromItemURLs:v9 passphrase:*(void *)(a1 + 48) addToKeychain:*(unsigned __int8 *)(a1 + 89) compressionFormat:*(void *)(a1 + 80) archiveURL:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) fd:v24 progress:v18 error:a5];
      if (close(v24) != -1)
      {
LABEL_23:
        free(v23);
LABEL_24:

        id v14 = v43;
        goto LABEL_25;
      }
      v31 = +[NSError ds_errorWithPOSIXCode:*__error() itemURL:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) debugDescription:@"Couldn't close temporary folder fd"];
      long long v32 = v31;
      if (a5) {
        *a5 = v31;
      }
      long long v33 = LogObj(0);
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
LABEL_22:

        id v30 = 0;
        goto LABEL_23;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v48 = v32;
      long long v34 = "Couldn't close temporary folder fd: %@";
    }
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, v34, buf, 0xCu);
    goto LABEL_22;
  }
  uint64_t v10 = *(void **)(a1 + 32);
  id v11 = [*(id *)(a1 + 40) url];
  uint64_t v12 = *(void *)(a1 + 80);
  id v46 = 0;
  uint64_t v13 = [v10 _createArchivePlaceholderForItems:v9 inFolder:v11 compressionFormat:v12 error:&v46];
  id v14 = v46;
  uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v13;

  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {

    goto LABEL_4;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v30 = 0;
LABEL_25:

  return v30;
}

void sub_1000148D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  free(v20);
  _Unwind_Resume(a1);
}

id sub_100014984()
{
  if (qword_100031C58 != -1) {
    dispatch_once(&qword_100031C58, &stru_10002D440);
  }
  unsigned __int8 v0 = (void *)qword_100031C50;
  return v0;
}

id sub_1000149D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(void *)(v2 + 40)) {
    uint64_t v2 = a1;
  }
  [*(id *)(a1 + 32) setFileURL:*(void *)(v2 + 40)];
  id v3 = *(void **)(a1 + 32);
  return [v3 publish];
}

void sub_100014A2C(void *a1, void *a2, void *a3)
{
  unint64_t v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (v6)
  {
    if (v7)
    {
      CFStringRef v8 = +[NSFileManager defaultManager];
      uint64_t v9 = *(void *)(*(void *)(a1[6] + 8) + 40);
      id v38 = 0;
      unsigned __int8 v10 = [v8 removeItemAtURL:v9 error:&v38];
      id v11 = v38;

      if ((v10 & 1) == 0)
      {
        uint64_t v12 = LogObj(0);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v13 = SanitizedURL(*(NSURL **)(*(void *)(a1[6] + 8) + 40));
          *(_DWORD *)buf = 138543618;
          id v40 = v13;
          __int16 v41 = 2112;
          id v42 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to remove archive temp destination folder %{public}@: %@", buf, 0x16u);
        }
      }
    }
    (*(void (**)(void))(a1[5] + 16))();
  }
  else if (v7)
  {
    id v14 = +[NSFileManager defaultManager];
    uint64_t v15 = *(void *)(*(void *)(a1[6] + 8) + 40);
    uint64_t v16 = *(void *)(*(void *)(a1[7] + 8) + 40);
    id v36 = 0;
    id v37 = 0;
    unsigned __int8 v17 = [v14 replaceItemAtURL:v15 withItemAtURL:v16 backupItemName:0 options:1 resultingItemURL:&v37 error:&v36];
    id v18 = v37;
    id v19 = v36;

    if ((v17 & 1) == 0)
    {
      id v20 = LogObj(0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v21 = SanitizedURL(*(NSURL **)(*(void *)(a1[7] + 8) + 40));
        uint64_t v22 = SanitizedURL(*(NSURL **)(*(void *)(a1[6] + 8) + 40));
        *(_DWORD *)buf = 138543874;
        id v40 = v21;
        __int16 v41 = 2114;
        id v42 = v22;
        __int16 v43 = 2112;
        id v44 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to move %{public}@ into place at %{public}@  %@", buf, 0x20u);
      }
    }
    int64x2_t v23 = +[NSFileManager defaultManager];
    id v35 = 0;
    unsigned __int8 v24 = [v23 removeItemAtURL:v5 error:&v35];
    id v25 = v35;

    if ((v24 & 1) == 0)
    {
      std::string v26 = LogObj(0);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = SanitizedURL(v5);
        *(_DWORD *)buf = 138543618;
        id v40 = v27;
        __int16 v41 = 2112;
        id v42 = v25;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to remove archive temp destination folder %{public}@: %@", buf, 0x16u);
      }
    }
    id v30 = a1 + 4;
    uint64_t v28 = a1[4];
    uint64_t v29 = v30[1];
    v31 = [v18 lastPathComponent];
    (*(void (**)(uint64_t, uint64_t, void *, void))(v29 + 16))(v29, v28, v31, 0);
  }
  else
  {
    id v32 = [objc_alloc((Class)NSSecurityScopedURLWrapper) initWithURL:v5 readonly:0];
    uint64_t v33 = a1[5];
    long long v34 = [*(id *)(*(void *)(a1[7] + 8) + 40) lastPathComponent];
    (*(void (**)(uint64_t, id, void *, void))(v33 + 16))(v33, v32, v34, 0);
  }
}

void sub_100014E10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100015014(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [a2 url];
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v6, v7);
}

void sub_10001508C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000154E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

unint64_t sub_1000155F0(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v72 = a3;
  id v10 = a4;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = [v9 firstObject];
  uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  uint64_t v15 = *(void **)(a1 + 40);
  uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  id v86 = 0;
  unsigned int v17 = [v15 openArchiveFile:v16 error:&v86];
  id v18 = v86;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v17;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) != -1)
  {
    id v70 = v18;
    id v19 = *(void **)(a1 + 48);
    if (v19) {
      id v71 = [v19 mutableCopy];
    }
    else {
      id v71 = (id)objc_opt_new();
    }
    if (!*(unsigned char *)(a1 + 128) && !v11) {
      goto LABEL_32;
    }
    uint64_t v22 = *(void **)(a1 + 40);
    uint64_t v23 = *(unsigned int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    uint64_t v25 = *(void *)(a1 + 120);
    id v85 = 0;
    std::string v26 = [v22 archivedItemDescriptorsForFD:v23 url:v24 passphrases:v71 progress:v10 formats:v25 destinationFolderURL:v72 error:&v85];
    id v27 = v85;
    v69 = v26;
    if ([v26 count])
    {
      char v84 = 0;
      if (*(unsigned char *)(a1 + 128))
      {
        uint64_t v28 = *(void **)(a1 + 40);
        uint64_t v29 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        id v30 = [*(id *)(a1 + 56) url];
        uint64_t v31 = *(void *)(*(void *)(a1 + 96) + 8) + 24;
        id v83 = v27;
        uint64_t v32 = [v28 _createUnarchivePlaceholderForDescriptors:v69 describingArchive:v29 inFolder:v30 hasMultipleTopLevelItems:v31 placeholderIsFolder:&v84 error:&v83];
        id v33 = v83;

        uint64_t v34 = *(void *)(*(void *)(a1 + 88) + 8);
        id v35 = *(void **)(v34 + 40);
        *(void *)(v34 + 40) = v32;

        BOOL v36 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) != 0;
        id v27 = v33;
        if (!v11) {
          goto LABEL_30;
        }
LABEL_16:
        if (v36)
        {
          if (*(unsigned char *)(a1 + 128))
          {
            uint64_t v37 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) lastPathComponent];
            v67 = [UTTypeFolder identifier];
            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
            {
              id v38 = (void *)v37;
            }
            else
            {
              CFTypeRef v39 = UTTypeItem;
              id v40 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
              id v82 = 0;
              id v81 = 0;
              id v38 = (void *)v37;
              unsigned __int8 v41 = [v40 getResourceValue:&v82 forKey:NSURLContentTypeKey error:&v81];
              v64 = v39;
              v65 = (UTType *)v82;

              id v42 = UTTypeFolder;
              id v66 = v81;
              if (v41)
              {
                __int16 v43 = v65;
              }
              else
              {
                id v44 = LogObj(0);
                if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v45 = SanitizedURL(*(NSURL **)(*(void *)(*(void *)(a1 + 88) + 8) + 40));
                  *(_DWORD *)buf = 138543618;
                  v88 = v45;
                  __int16 v89 = 2112;
                  id v90 = v66;
                  _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Failed to type for placeholder %{public}@: %@", buf, 0x16u);

                  id v42 = UTTypeFolder;
                }

                id v46 = v64;
                if (v84) {
                  id v46 = v42;
                }
                __int16 v43 = v46;
              }
              uint64_t v47 = [(UTType *)v43 identifier];

              v67 = (void *)v47;
            }
          }
          else
          {
            id v38 = 0;
            v67 = 0;
          }
          uint64_t v48 = *(void **)(a1 + 32);
          v78[0] = _NSConcreteStackBlock;
          v78[1] = 3221225472;
          v78[2] = sub_100015D9C;
          v78[3] = &unk_10002D150;
          id v49 = v69;
          uint64_t v50 = *(void *)(a1 + 72);
          id v79 = v49;
          uint64_t v80 = v50;
          v51 = [v48 remoteObjectProxyWithErrorHandler:v78];
          [v51 receiveArchivedItemsDescriptors:v49 placeholderName:v38 placeholderTypeIdentifier:v67];
        }
        goto LABEL_30;
      }
      BOOL v36 = 1;
      if (v11) {
        goto LABEL_16;
      }
    }
    else
    {
      BOOL v36 = 0;
    }
LABEL_30:

    if (!v36)
    {
      if (a5) {
        *a5 = v27;
      }
      unint64_t v21 = v27 == 0;
      goto LABEL_40;
    }

LABEL_32:
    v52 = sub_100014984();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100015EB0;
    block[3] = &unk_10002D0B0;
    id v53 = v10;
    uint64_t v54 = *(void *)(a1 + 88);
    id v75 = v53;
    uint64_t v77 = v54;
    id v55 = v72;
    id v76 = v55;
    dispatch_async(v52, block);

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), a4);
    v56 = *(void **)(a1 + 40);
    uint64_t v57 = *(unsigned int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    uint64_t v58 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    id v73 = 0;
    uint64_t v59 = [v56 _quarantineDataFromArchiveFD:v57 url:v58 error:&v73];
    id v60 = v73;
    uint64_t v61 = *(void *)(*(void *)(a1 + 112) + 8);
    v62 = *(void **)(v61 + 40);
    *(void *)(v61 + 40) = v59;

    if (*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40))
    {
      unint64_t v21 = (unint64_t)[*(id *)(a1 + 40) _unarchiveFromArchiveFD:*(unsigned int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) url:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) passphrases:v71 addToKeychain:*(unsigned __int8 *)(a1 + 129) destinationURL:v55 formats:*(void *)(a1 + 120) progress:v53 readItemGroup:*(void *)(a1 + 64) error:a5];
    }
    else
    {
      unint64_t v21 = 0;
      if (a5) {
        *a5 = v60;
      }
    }

    id v27 = v75;
LABEL_40:

    id v18 = v70;
    goto LABEL_41;
  }
  if (a5)
  {
    id v20 = v18;
    unint64_t v21 = 0;
    *a5 = v18;
    id v18 = v20;
  }
  else
  {
    unint64_t v21 = 0;
  }
LABEL_41:

  return v21;
}

void sub_100015C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_100015D9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = LogObj(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = SanitizedURL(*(NSURL **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to send archived items info %{public}@ for itemURL %{public}@: %@", (uint8_t *)&v7, 0x20u);
  }
}

void sub_100015E8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100015EB0(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(void *)(v2 + 40)) {
    uint64_t v2 = a1;
  }
  [*(id *)(a1 + 32) setFileURL:*(void *)(v2 + 40)];
  id v3 = *(void **)(a1 + 32);
  return [v3 publish];
}

void sub_100015F04(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  id v6 = a3;
  int v7 = [v6 domain];
  if ([v7 isEqualToString:@"com.apple.desktopservices.ArchiveService"])
  {
    id v8 = [v6 code];

    if (v8 == (id)-1000)
    {
      __int16 v9 = sub_100014984();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100016BB8;
      block[3] = &unk_10002D1A0;
      void block[4] = *(void *)(a1 + 56);
      dispatch_async(v9, block);
    }
  }
  else
  {
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    if (v5) {
      id v25 = [objc_alloc((Class)NSSecurityScopedURLWrapper) initWithURL:v5];
    }
    else {
      id v25 = 0;
    }
    goto LABEL_38;
  }
  if (!v6)
  {
    std::string v26 = +[NSFileManager defaultManager];
    id v82 = 0;
    id v27 = [v26 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:0 options:1 error:&v82];
    id v28 = v82;

    if (!v27 || ![v27 count])
    {
      id v35 = +[NSFileManager defaultManager];
      uint64_t v36 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      id v81 = 0;
      unsigned __int8 v37 = [v35 removeItemAtURL:v36 error:&v81];
      id v38 = v81;

      if ((v37 & 1) == 0)
      {
        CFTypeRef v39 = LogObj(0);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          id v40 = SanitizedURL(*(NSURL **)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
          buf.st_dev = 138543618;
          *(void *)&buf.st_mode_t mode = v40;
          WORD2(buf.st_ino) = 2112;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v38;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to remove placeholder %{public}@: %@", (uint8_t *)&buf, 0x16u);
        }
      }
      if (v27)
      {
        uint64_t v41 = *(void *)(a1 + 80);
        v98[0] = *(void *)(*(void *)(v41 + 8) + 40);
        v97[0] = NSURLErrorKey;
        v97[1] = NSLocalizedDescriptionKey;
        TCFURLInfo::LocalizedStringWithFileName(@"ArchiveIsEmpty", *(__CFString **)(*(void *)(v41 + 8) + 40), (CFTypeRef *)&buf);
        id v42 = *(id *)&buf.st_dev;
        v98[1] = v42;
        __int16 v43 = +[NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:2];

        sub_100007E94((const void **)&buf);
        uint64_t v44 = +[NSError errorWithDomain:@"com.apple.desktopservices.ArchiveService" code:-1001 userInfo:v43];

        id v28 = (id)v44;
      }
      uint64_t v45 = LogObj(0);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        id v46 = SanitizedURL(*(NSURL **)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
        buf.st_dev = 138543618;
        *(void *)&buf.st_mode_t mode = v46;
        WORD2(buf.st_ino) = 2112;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v28;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Nothing was unarchived from %{public}@: %@", (uint8_t *)&buf, 0x16u);
      }
      id v32 = 0;
      id v33 = v28;
      goto LABEL_28;
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
    {
      uint64_t v29 = +[NSFileManager defaultManager];
      uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      id v79 = v28;
      id v80 = 0;
      unsigned __int8 v31 = [v29 replaceItemAtURL:v30 withItemAtURL:v5 backupItemName:0 options:1 resultingItemURL:&v80 error:&v79];
      id v32 = v80;
      id v33 = v79;

      if (v31)
      {
        id v34 = 0;
        goto LABEL_32;
      }
      uint64_t v57 = LogObj(0);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        uint64_t v58 = SanitizedURL(v5);
        uint64_t v59 = SanitizedURL(*(NSURL **)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
        buf.st_dev = 138543874;
        *(void *)&buf.st_mode_t mode = v58;
        WORD2(buf.st_ino) = 2114;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v59;
        HIWORD(buf.st_gid) = 2112;
        *(void *)&buf.st_rdev = v33;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Failed to move %{public}@ into place at %{public}@  %@", (uint8_t *)&buf, 0x20u);
      }
LABEL_28:
      uint64_t v47 = +[NSFileManager defaultManager];
      id v75 = 0;
      unsigned __int8 v48 = [v47 removeItemAtURL:v5 error:&v75];
      id v34 = v75;

      if ((v48 & 1) == 0)
      {
        id v49 = LogObj(0);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          uint64_t v50 = SanitizedURL(v5);
          buf.st_dev = 138543618;
          *(void *)&buf.st_mode_t mode = v50;
          WORD2(buf.st_ino) = 2112;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v34;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Failed to remove unarchive temp destination folder %{public}@: %@", (uint8_t *)&buf, 0x16u);
        }
      }
LABEL_32:
      if (!v33)
      {
        id v25 = [objc_alloc((Class)NSSecurityScopedURLWrapper) initWithURL:v32];
        if (v25)
        {
          id v33 = 0;
          goto LABEL_37;
        }
        NSErrorUserInfoKey v89 = NSURLErrorKey;
        id v90 = v32;
        v56 = +[NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
        id v33 = +[NSError errorWithDomain:NSCocoaErrorDomain code:257 userInfo:v56];
      }
      id v25 = 0;
LABEL_37:
      id v6 = v33;

LABEL_38:
      close(*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
      id v51 = v6;
      unsigned int v17 = *(NSObject **)(a1 + 32);
      id v18 = *(NSObject **)(*(void *)(a1 + 40) + 24);
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472;
      v71[2] = sub_100016C20;
      v71[3] = &unk_10002D1C8;
      id v19 = &v74;
      id v52 = *(id *)(a1 + 48);
      id v73 = v51;
      id v74 = v52;
      unint64_t v21 = &v72;
      uint64_t v22 = &v73;
      id v72 = v25;
      id v13 = v25;
      id v23 = v51;
      uint64_t v24 = v71;
      goto LABEL_39;
    }
    id v53 = [v27 objectAtIndexedSubscript:0];
    uint64_t v54 = (const char *)[v53 fileSystemRepresentation];

    acl_t acl = 0;
    if (lstat(v54, &buf) || (buf.st_mode & 0xF000) != 0x4000)
    {
      BOOL v55 = 0;
    }
    else
    {
      BOOL v55 = (buf.st_mode & 0x80) == 0 && chmod(v54, buf.st_mode & 0xF7F | 0x80) == 0;
      acl_t acl = acl_get_file(v54, ACL_TYPE_EXTENDED);
      if (acl)
      {
        *(void *)v91 = acl_init(1);
        BOOL v70 = acl_set_file(v54, ACL_TYPE_EXTENDED, *(acl_t *)v91) == 0;
        sub_100011F18((void **)v91);
        goto LABEL_50;
      }
    }
    BOOL v70 = 0;
LABEL_50:
    id v60 = +[NSFileManager defaultManager];
    BOOL v69 = v55;
    uint64_t v61 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    v62 = [v27 objectAtIndexedSubscript:0];
    id v76 = v28;
    id v77 = 0;
    unsigned __int8 v63 = [v60 replaceItemAtURL:v61 withItemAtURL:v62 backupItemName:0 options:1 resultingItemURL:&v77 error:&v76];
    id v32 = v77;
    id v33 = v76;

    if (v63)
    {
      if (v69)
      {
        v64 = (const char *)[v32 fileSystemRepresentation];
        chmod(v64, buf.st_mode & 0xF7F);
      }
      if (v70)
      {
        v65 = (const char *)[v32 fileSystemRepresentation];
        acl_set_file(v65, ACL_TYPE_EXTENDED, acl);
      }
    }
    else
    {
      id v66 = LogObj(0);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        v67 = SanitizedURL(v5);
        v68 = SanitizedURL(*(NSURL **)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
        *(_DWORD *)v91 = 138543874;
        *(void *)&v91[4] = v67;
        __int16 v92 = 2114;
        v93 = v68;
        __int16 v94 = 2112;
        id v95 = v33;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "Failed to move %{public}@ into place at %{public}@  %@", v91, 0x20u);
      }
    }
    sub_100011F18((void **)&acl);
    goto LABEL_28;
  }
  id v10 = +[NSFileManager defaultManager];
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v87 = 0;
  unsigned __int8 v12 = [v10 removeItemAtURL:v11 error:&v87];
  id v13 = v87;

  if ((v12 & 1) == 0)
  {
    id v14 = LogObj(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = SanitizedURL(*(NSURL **)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
      buf.st_dev = 138543618;
      *(void *)&buf.st_mode_t mode = v15;
      WORD2(buf.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to remove placeholder %{public}@: %@", (uint8_t *)&buf, 0x16u);
    }
  }
  close(*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
  id v16 = v6;
  unsigned int v17 = *(NSObject **)(a1 + 32);
  id v18 = *(NSObject **)(*(void *)(a1 + 40) + 24);
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_100016C08;
  v83[3] = &unk_10002D1C8;
  id v19 = &v86;
  id v20 = *(id *)(a1 + 48);
  id v85 = v16;
  id v86 = v20;
  unint64_t v21 = (id *)&v84;
  uint64_t v22 = &v85;
  uint64_t v84 = 0;
  id v23 = v16;
  uint64_t v24 = v83;
LABEL_39:
  dispatch_group_notify(v17, v18, v24);
}

void sub_1000169D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41)
{
  sub_100011F18(&a41);
  sub_100011F18(&a21);

  _Unwind_Resume(a1);
}

id sub_100016BB8(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) totalUnitCount];
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return [v3 setCompletedUnitCount:v2];
}

uint64_t sub_100016C08(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t sub_100016C20(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_100016DBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016EB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001702C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000174AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40)
{
  _Unwind_Resume(a1);
}

void sub_100017CF4(uint64_t a1)
{
  [*(id *)(a1 + 32) setTotalUnitCount:-1];
  [*(id *)(a1 + 32) setKind:NSProgressKindFile];
  uint64_t v2 = *(void *)(a1 + 48);
  if (!v2)
  {
    id v3 = &NSProgressFileOperationKindArchiving;
    goto LABEL_5;
  }
  if (v2 == 1)
  {
    id v3 = &NSProgressFileOperationKindUnarchiving;
LABEL_5:
    [*(id *)(a1 + 32) setFileOperationKind:*v3];
  }
  [*(id *)(a1 + 32) setCancellable:1];
  objc_initWeak(&location, *(id *)(a1 + 40));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_100017E10;
  v4[3] = &unk_10002D218;
  objc_copyWeak(&v5, &location);
  [*(id *)(a1 + 32) setCancellationHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void sub_100017DF4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100017E10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancel];
}

void sub_100017E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100017E6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    int v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(unsigned __int8 *)(a1 + 88);
    id v32 = 0;
    id v10 = [v7 _temporaryURLAppropriateForURL:v8 calledFromLegacyAPI:v9 error:&v32];
    id v6 = v32;
    if (!v10)
    {
      uint64_t v11 = LogObj(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 138412290;
        id v35 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to create temporary dir: %@", buf, 0xCu);
      }
      unint64_t v21 = 0;
      goto LABEL_27;
    }
    uint64_t v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [*(id *)(a1 + 32) count]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v12 = *(id *)(a1 + 32);
    id v13 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v12);
          }
          id v16 = [*(id *)(*((void *)&v28 + 1) + 8 * i) URL];
          [v11 addObject:v16];
        }
        id v13 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v13);
    }

    uint64_t v17 = *(void *)(a1 + 80);
    v27[1] = v6;
    int v18 = (*(uint64_t (**)(void))(v17 + 16))();
    id v19 = v6;

    if ([*(id *)(a1 + 40) _isCancelled])
    {
      uint64_t v20 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3072 userInfo:0];
    }
    else
    {
      if (v18)
      {
        unint64_t v21 = v10;
LABEL_26:
        [*(id *)(a1 + 64) unpublish];
        id v6 = v19;
LABEL_27:

        [*(id *)(a1 + 40) _cleanupWithResult:v21 error:v6 securityScopedURLs:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 72)];
        goto LABEL_28;
      }
      uint64_t v20 = (uint64_t)v19;
    }
    uint64_t v22 = +[NSFileManager defaultManager];
    v27[0] = 0;
    unsigned __int8 v23 = [v22 removeItemAtURL:v10 error:v27];
    id v24 = v27[0];

    if ((v23 & 1) == 0)
    {
      id v25 = LogObj(0);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        std::string v26 = SanitizedURL(v10);
        *(_DWORD *)stat buf = 138543618;
        id v35 = v26;
        __int16 v36 = 2112;
        id v37 = v24;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to remove unarchive destination folder %{public}@: %@", buf, 0x16u);
      }
    }

    unint64_t v21 = 0;
    id v19 = (id)v20;
    goto LABEL_26;
  }
  uint64_t v4 = LogObj(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = *(void **)(a1 + 32);
    *(_DWORD *)stat buf = 138543618;
    id v35 = v5;
    __int16 v36 = 2112;
    id v37 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to perform coordinated read with intents %{public}@ with error: %@", buf, 0x16u);
  }

  [*(id *)(a1 + 40) _cleanupWithResult:0 error:v3 securityScopedURLs:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 72)];
  id v6 = v3;
LABEL_28:
}

void sub_100018248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000184CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000185A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001871C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000188E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_100019288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100019A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_10001A3A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10001A4B8(uint64_t a1, int a2, uint64_t a3, uint64_t *a4)
{
  id v9 = *(id *)a1;
  id v10 = *(id *)(a1 + 16);
  id v11 = *(id *)(a1 + 8);
  id v12 = +[NSString stringWithUTF8String:a3];
  id v13 = [v11 stringByAppendingPathComponent:v12];

  if (a2 == 11)
  {
    if (!lstat((const char *)[v13 fileSystemRepresentation], &v27))
    {
      int v15 = v27.st_mode & 0xF000;
      if (v15 != 0x4000 && v15 != 0x8000 && v15 != 40960)
      {
        uint64_t v14 = 1;
        goto LABEL_20;
      }
    }
LABEL_19:
    uint64_t v14 = 0;
    goto LABEL_20;
  }
  if (a2 != 31) {
    goto LABEL_19;
  }
  if (([v9 _isCancelled] & 1) == 0)
  {
    if (!lstat((const char *)[v13 fileSystemRepresentation], &v27)
      && (v27.st_mode & 0xF000) == 0x8000)
    {
      uint64_t v16 = (uint64_t)[v10 totalUnitCount];
      if (a4)
      {
        uint64_t v17 = v16;
        if ((v16 & 0x8000000000000000) == 0)
        {
          uint64_t v18 = a4[1];
          uint64_t v23 = *a4;
          uint64_t v19 = *(void *)(a1 + 24) + v18;
          uint64_t v20 = v19 - (void)[v10 completedUnitCount];
          if (v20 > 9999999 || (double)v17 * 0.1 <= (double)v20)
          {
            unint64_t v21 = sub_100014984();
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10001F2CC;
            block[3] = &unk_10002D468;
            id v25 = v10;
            uint64_t v26 = v19;
            dispatch_async(v21, block);
          }
          if (v18 == v23) {
            *(void *)(a1 + 24) += v23;
          }
        }
      }
    }
    goto LABEL_19;
  }
  uint64_t v14 = 0xFFFFFFFFLL;
LABEL_20:

  return v14;
}

void sub_10001A6F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id *sub_10001A738(id *a1)
{
  return a1;
}

id sub_10001A774(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) totalUnitCount];
  id v3 = *(void **)(a1 + 32);
  return [v3 setCompletedUnitCount:v2];
}

void sub_10001AC30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Block_object_dispose(&a37, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_10001ACE8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [v7 path];
  id v11 = [v8 _replacePathComponent:v9 withComponent:&stru_10002D5A8 inFilePath:v10];

  id v12 = v7;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = lstat((const char *)[v12 fileSystemRepresentation], &v26);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    id v13 = +[NSError ds_errorWithPOSIXCode:*__error() itemURL:*(void *)(a1 + 48) debugDescription:@"Couldn't get info from the file"];
    uint64_t v14 = v13;
    if (a4) {
      *a4 = v13;
    }
    int v15 = LogObj(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 138412290;
      long long v28 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Couldn't get info from the file: %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v18 = *(void *)(a1 + 88);
    if (v18 == 3
      && ([*(id *)(a1 + 32) _writeXattrEntryForURL:v12 compressionFormat:3 archive:*(void *)(a1 + 96) entry:*(void *)(a1 + 104) archiveURL:*(void *)(a1 + 56) commonParentPath:*(void *)(a1 + 40) stat:&v26 error:a4] & 1) == 0)
    {
      uint64_t v16 = 0;
      goto LABEL_8;
    }
    uint64_t v19 = *(void **)(a1 + 32);
    uint64_t v20 = *(void *)(a1 + 96);
    uint64_t v21 = *(void *)(a1 + 104);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10001AFEC;
    v23[3] = &unk_10002D2E0;
    uint64_t v25 = *(void *)(a1 + 80);
    id v24 = *(id *)(a1 + 64);
    unsigned int v22 = [v19 _archiveItemURL:v12 itemArchivePath:v11 isDirectory:a3 archive:v20 entry:v21 stat:&v26 writeProgressHandler:v23 error:a4];

    if (v22
      && (v18 == 3
       || [*(id *)(a1 + 32) _writeXattrEntryForURL:v12 compressionFormat:*(void *)(a1 + 88) archive:*(void *)(a1 + 96) entry:*(void *)(a1 + 104) archiveURL:*(void *)(a1 + 56) commonParentPath:*(void *)(a1 + 40) stat:&v26 error:a4]))
    {
      uint64_t v16 = 1;
      goto LABEL_8;
    }
  }
  uint64_t v16 = 0;
LABEL_8:

  return v16;
}

void sub_10001AF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10001AFEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100014984();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B0A4;
  block[3] = &unk_10002D2B8;
  uint64_t v9 = a2;
  long long v6 = *(_OWORD *)(a1 + 32);
  id v5 = (id)v6;
  long long v8 = v6;
  dispatch_async(v4, block);
}

id sub_10001B0A4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += *(void *)(a1 + 48);
  double v2 = (double)*(uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id result = [*(id *)(a1 + 32) totalUnitCount];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if ((double)(uint64_t)result * 0.1 <= v2 || *(uint64_t *)(v4 + 24) >= 10000000)
  {
    id result = objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", (char *)objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + *(void *)(v4 + 24));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

void sub_10001B58C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001B600(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  id v7 = a2;
  long long v8 = v7;
  if (a3)
  {
    a4 = 1;
  }
  else
  {
    id v13 = 0;
    unsigned int v9 = [v7 getResourceValue:&v13 forKey:NSURLFileSizeKey error:a4];
    id v10 = v13;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v10 longLongValue];
      a4 = 1;
    }
    else if (a4)
    {
      if (!*(void *)a4)
      {
        NSErrorUserInfoKey v14 = NSURLErrorKey;
        int v15 = v8;
        id v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
        *(void *)a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:v11];
      }
      a4 = 0;
    }
  }
  return a4;
}

void sub_10001B778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001B7A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTotalUnitCount:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

void sub_10001B844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001BC34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10001BC94(uint64_t result)
{
  if (result)
  {
    CFBundleRef v1 = (AAByteStream *)result;
    double v2 = *(AEAContext_impl **)(result + 24);
    id v3 = *(AAByteStream_impl **)(result + 8);
    if (v2) {
      int updated = AEAEncryptionOutputStreamCloseAndUpdateContext(v3, v2);
    }
    else {
      int updated = AAByteStreamClose(v3);
    }
    int v5 = updated;
    int v6 = AAByteStreamClose(v1[2]);
    int v7 = AAByteStreamClose(*v1) | v6;
    unsigned int v8 = v5 >> 31;
    free(v1);
    if (v7 < 0) {
      return 0xFFFFFFFFLL;
    }
    else {
      return v8;
    }
  }
  return result;
}

void sub_10001BD0C(AAByteStream_impl **a1)
{
  CFBundleRef v1 = *a1;
  if (v1) {
    AAByteStreamCancel(v1);
  }
}

ssize_t sub_10001BD1C(AAByteStream_impl **a1, const void *a2, size_t a3)
{
  uint64_t v4 = a1[2];
  if (v4) {
    return AAByteStreamWrite(v4, a2, a3);
  }
  uint64_t v4 = a1[1];
  if (v4) {
    return AAByteStreamWrite(v4, a2, a3);
  }
  uint64_t v4 = *a1;
  if (*a1) {
    return AAByteStreamWrite(v4, a2, a3);
  }
  else {
    return -1;
  }
}

void sub_10001C778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

ssize_t sub_10001C860(AAByteStream_impl **a1, void *a2, size_t a3)
{
  uint64_t v4 = a1[2];
  if (v4) {
    return AAByteStreamRead(v4, a2, a3);
  }
  uint64_t v4 = a1[1];
  if (v4) {
    return AAByteStreamRead(v4, a2, a3);
  }
  uint64_t v4 = *a1;
  if (*a1) {
    return AAByteStreamRead(v4, a2, a3);
  }
  else {
    return -1;
  }
}

void sub_10001CBC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10001D068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  objc_destroyWeak(v35);
  _Block_object_dispose(&a33, 8);
  objc_destroyWeak(location);

  _Block_object_dispose((const void *)(v37 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_10001D0F8(uint64_t a1, uint64_t a2)
{
}

void sub_10001D104(uint64_t a1)
{
}

void sub_10001D10C(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1[4] + 8) + 40));
  intptr_t v3 = dispatch_block_testcancel(WeakRetained);

  if (!v3)
  {
    while (1)
    {
      id v4 = objc_loadWeakRetained((id *)(*(void *)(a1[5] + 8) + 40));
      unsigned int v5 = [v4 _isCancelled];

      if (v5) {
        break;
      }
      +[NSThread sleepForTimeInterval:0.1];
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1[4] + 8) + 40));
      intptr_t v7 = dispatch_block_testcancel(v6);

      if (v7) {
        return;
      }
    }
    unsigned int v8 = *(AAByteStream_impl **)(*(void *)(a1[6] + 8) + 24);
    AAByteStreamCancel(v8);
  }
}

void sub_10001D1F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001D200(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) totalUnitCount];
  intptr_t v3 = *(void **)(a1 + 32);
  return [v3 setCompletedUnitCount:v2];
}

void sub_10001D360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001DAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34)
{
  _Unwind_Resume(a1);
}

void sub_10001DB88(uint64_t a1)
{
  id v1 = *(id *)(a1 + 8);
  uint64_t v2 = archive_filter_bytes();
  intptr_t v3 = sub_100014984();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001F4B0;
  v5[3] = &unk_10002D468;
  id v6 = v1;
  uint64_t v7 = v2;
  id v4 = v1;
  dispatch_async(v3, v5);
}

void sub_10001DC48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001DC58(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) totalUnitCount];
  intptr_t v3 = *(void **)(a1 + 32);
  return [v3 setCompletedUnitCount:v2];
}

void sub_10001DDB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001E228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v38 - 192), 8);

  _Unwind_Resume(a1);
}

void sub_10001E2F0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v16 = a2;
  if (([v16 hasPrefix:@"._"] & 1) != 0
    || ([v16 containsString:@"__MACOSX"] & 1) != 0)
  {
    goto LABEL_12;
  }
  uint64_t v7 = objc_opt_new();
  [v7 setFilePath:v16];
  if (a3 != 68)
  {
    if (a3 == 70)
    {
      unsigned int v8 = +[NSNumber numberWithUnsignedLong:a4];
      [v7 setFileSize:v8];
    }
    goto LABEL_8;
  }
  unsigned int v9 = [v16 pathExtension];
  unsigned int v10 = [v9 isEqualToString:&stru_10002D5A8];

  if (!v10)
  {
LABEL_8:
    id v12 = [v16 pathExtension];
    id v11 = +[UTType typeWithFilenameExtension:v12 conformingToType:UTTypeItem];

    id v13 = [v11 identifier];
    [v7 setTypeIdentifier:v13];

    goto LABEL_9;
  }
  id v11 = [UTTypeFolder identifier];
  [v7 setTypeIdentifier:v11];
LABEL_9:

  NSErrorUserInfoKey v14 = [v7 typeIdentifier];

  if (!v14)
  {
    int v15 = [UTTypeItem identifier];
    [v7 setTypeIdentifier:v15];
  }
  [*(id *)(a1 + 32) addObject:v7];

LABEL_12:
}

void sub_10001E4BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10001E518(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, void *a5)
{
  if (archive_entry_size_is_set()) {
    uint64_t v8 = archive_entry_size();
  }
  else {
    uint64_t v8 = 0;
  }
  unsigned int v9 = [*(id *)(a1 + 32) _sanitizedPathWithCString:a4 length:strlen(a4)];
  if (([v9 hasPrefix:@"._"] & 1) != 0
    || ([v9 containsString:@"__MACOSX"] & 1) != 0)
  {
    unsigned int v10 = 0;
  }
  else
  {
    id v11 = objc_opt_new();
    unsigned int v10 = +[NSNumber numberWithLong:v8];
    int v12 = archive_entry_filetype();
    if (archive_entry_size_is_set()) {
      [v11 setFileSize:v10];
    }
    [v11 setFilePath:v9];
    if (v12 == 0x4000
      && ([v9 pathExtension],
          id v13 = objc_claimAutoreleasedReturnValue(),
          unsigned int v14 = [v13 isEqualToString:&stru_10002D5A8],
          v13,
          v14))
    {
      int v15 = [UTTypeFolder identifier];
      [v11 setTypeIdentifier:v15];
    }
    else
    {
      id v16 = [v9 pathExtension];
      int v15 = +[UTType typeWithFilenameExtension:v16 conformingToType:UTTypeItem];

      uint64_t v17 = [v15 identifier];
      [v11 setTypeIdentifier:v17];
    }
    uint64_t v18 = [v11 typeIdentifier];

    if (!v18)
    {
      uint64_t v19 = [UTTypeItem identifier];
      [v11 setTypeIdentifier:v19];
    }
    [*(id *)(a1 + 40) addObject:v11];
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v20 = 1;
    goto LABEL_18;
  }
  int has_encrypted_entries = archive_read_has_encrypted_entries();
  uint64_t v20 = 1;
  switch(has_encrypted_entries)
  {
    case -2:
LABEL_23:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      break;
    case 0:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      break;
    case 1:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      if ([*(id *)(a1 + 48) count]) {
        goto LABEL_23;
      }
      if (a5)
      {
        [*(id *)(a1 + 32) _archiveDecryptionError];
        uint64_t v20 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v20 = 0;
      }
      break;
  }
LABEL_18:

  return v20;
}

void sub_10001E7E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10001E840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (archive_read_data_block() == 1) {
    return 1;
  }
  if (!a5) {
    return 0;
  }
  id v9 = [*(id *)(a1 + 32) _errorForArchive:a2 itemURL:*(void *)(a1 + 40)];
  uint64_t result = 0;
  *a5 = v9;
  return result;
}

void sub_10001EBD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001EEEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22,void *a23)
{
  _Unwind_Resume(a1);
}

id sub_10001EF64(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) integerValue];
  intptr_t v3 = *(void **)(a1 + 32);
  return [v3 setTotalUnitCount:v2];
}

id sub_10001EFA4(uint64_t a1, uint64_t a2, uint64_t a3, char *__s, void *a5)
{
  unsigned int v10 = [*(id *)(a1 + 32) _sanitizedPathWithCString:__s length:strlen(__s)];
  if ([v10 length])
  {
    id v11 = [*(id *)(a1 + 40) stringByAppendingPathComponent:v10];
    int v12 = *(void **)(a1 + 32);
    id v13 = v11;
    id v14 = objc_msgSend(v12, "_unarchiveEntryAtPath:entry:fromArchive:archiveURL:destinationURL:progress:error:", objc_msgSend(v13, "fileSystemRepresentation"), a3, a2, *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), a5);
  }
  else
  {
    int v15 = LogObj(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      TString::TString((TString *)&v18, __s);
      id v16 = SanitizedPath((id *)&v18);
      *(_DWORD *)stat buf = 138543362;
      uint64_t v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Could not create path from path name: %{public}@", buf, 0xCu);
      sub_100007E94(&v18);
    }
    if (a5)
    {
      +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      id v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v14 = 0;
    }
  }

  return v14;
}

void sub_10001F150(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100007E94((const void **)va);

  _Unwind_Resume(a1);
}

uint64_t sub_10001F1DC(uint64_t a1, id *a2)
{
  intptr_t v3 = (__CFString *)*a2;
  *(void *)a1 = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  TString::SetStringRefAsImmutable((CFTypeRef *)a1, v3);

  *(unsigned char *)(a1 + 8) = 1;
  return a1;
}

void sub_10001F244(_Unwind_Exception *a1)
{
  sub_100007E94(v2);

  _Unwind_Resume(a1);
}

void sub_10001F268(id a1)
{
  intptr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("archive-service-queue-progress-reporting-queue", v3);
  id v2 = (void *)qword_100031C50;
  qword_100031C50 = (uint64_t)v1;
}

id sub_10001F2CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCompletedUnitCount:*(void *)(a1 + 40)];
}

AAByteStream *sub_10001F2D4(AAByteStream *result)
{
  if (result)
  {
    dispatch_queue_t v1 = result;
    int v2 = AAByteStreamClose(*result);
    free(v1);
    return (AAByteStream *)(v2 >> 31);
  }
  return result;
}

void sub_10001F314(AAByteStream_impl **a1)
{
  dispatch_queue_t v1 = *a1;
  if (v1) {
    AAByteStreamCancel(v1);
  }
}

ssize_t sub_10001F324(AAByteStream_impl **a1, void *a2, size_t a3, off_t a4)
{
  id v4 = *a1;
  if (v4) {
    return AAByteStreamPRead(v4, a2, a3, a4);
  }
  else {
    return -1;
  }
}

uint64_t sub_10001F338(uint64_t a1, void *a2, size_t a3)
{
  id v4 = *(AAByteStream_impl **)a1;
  if (!v4) {
    return -1;
  }
  ssize_t v5 = AAByteStreamRead(v4, a2, a3);
  *(void *)(a1 + 8) += v5;
  if ((v5 & 0x8000000000000000) == 0)
  {
    id v6 = *(id *)(a1 + 16);
    uint64_t v7 = *(void *)(a1 + 8);
    uint64_t v8 = sub_100014984();
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001F41C;
    v11[3] = &unk_10002D468;
    id v12 = v6;
    uint64_t v13 = v7;
    id v9 = v6;
    dispatch_async(v8, v11);
  }
  return v5;
}

uint64_t sub_10001F41C(uint64_t a1)
{
  uint64_t result = (uint64_t)[*(id *)(a1 + 32) totalUnitCount];
  if ((result & 0x8000000000000000) == 0)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t result = (uint64_t)[*(id *)(a1 + 32) completedUnitCount];
    if (v4 - result > 9999999 || (double)v3 * 0.1 <= (double)(v4 - result))
    {
      ssize_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      return (uint64_t)[v5 setCompletedUnitCount:v6];
    }
  }
  return result;
}

uint64_t sub_10001F4B0(uint64_t a1)
{
  uint64_t result = (uint64_t)[*(id *)(a1 + 32) totalUnitCount];
  if ((result & 0x8000000000000000) == 0)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t result = (uint64_t)[*(id *)(a1 + 32) completedUnitCount];
    if (v4 - result > 9999999 || (double)v3 * 0.1 <= (double)(v4 - result))
    {
      ssize_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      return (uint64_t)[v5 setCompletedUnitCount:v6];
    }
  }
  return result;
}

const void **sub_10001F544(const void **a1)
{
  int v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

BOOL IsRedactionEnabled(void)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100031C68, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100031C68))
  {
    byte_100031C60 = os_variant_has_internal_ui();
    __cxa_guard_release(&qword_100031C68);
  }
  if (!byte_100031C60) {
    return 1;
  }
  if (TCFURLInfo::gDSHelperRunning) {
    return 0;
  }
  return PrefsBool(@"EnableRedactionOnInternal", 0);
}

void sub_10001F628(_Unwind_Exception *a1)
{
}

int AAArchiveStreamClose(AAArchiveStream s)
{
  return _AAArchiveStreamClose(s);
}

ssize_t AAArchiveStreamProcess(AAArchiveStream istream, AAArchiveStream ostream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return _AAArchiveStreamProcess(istream, ostream, msg_data, msg_proc, flags, n_threads);
}

int AAArchiveStreamReadHeader(AAArchiveStream s, AAHeader *header)
{
  return _AAArchiveStreamReadHeader(s, header);
}

int AAArchiveStreamWritePathList(AAArchiveStream s, AAPathList path_list, AAFieldKeySet key_set, const char *dir, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return _AAArchiveStreamWritePathList(s, path_list, key_set, dir, msg_data, msg_proc, flags, n_threads);
}

void AAByteStreamCancel(AAByteStream s)
{
}

int AAByteStreamClose(AAByteStream s)
{
  return _AAByteStreamClose(s);
}

ssize_t AAByteStreamPRead(AAByteStream s, void *buf, size_t nbyte, off_t offset)
{
  return _AAByteStreamPRead(s, buf, nbyte, offset);
}

ssize_t AAByteStreamRead(AAByteStream s, void *buf, size_t nbyte)
{
  return _AAByteStreamRead(s, buf, nbyte);
}

ssize_t AAByteStreamWrite(AAByteStream s, const void *buf, size_t nbyte)
{
  return _AAByteStreamWrite(s, buf, nbyte);
}

AAByteStream AACompressionOutputStreamOpen(AAByteStream compressed_stream, AACompressionAlgorithm compression_algorithm, size_t block_size, AAFlagSet flags, int n_threads)
{
  return _AACompressionOutputStreamOpen(compressed_stream, compression_algorithm, block_size, flags, n_threads);
}

AAByteStream AACustomByteStreamOpen(void)
{
  return _AACustomByteStreamOpen();
}

void AACustomByteStreamSetCancelProc(AAByteStream s, AAByteStreamCancelProc proc)
{
}

void AACustomByteStreamSetCloseProc(AAByteStream s, AAByteStreamCloseProc proc)
{
}

void AACustomByteStreamSetData(AAByteStream s, void *data)
{
}

void AACustomByteStreamSetPReadProc(AAByteStream s, AAByteStreamPReadProc proc)
{
}

void AACustomByteStreamSetReadProc(AAByteStream s, AAByteStreamReadProc proc)
{
}

void AACustomByteStreamSetWriteProc(AAByteStream s, AAByteStreamWriteProc proc)
{
}

AAArchiveStream AADecodeArchiveInputStreamOpen(AAByteStream stream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return _AADecodeArchiveInputStreamOpen(stream, msg_data, msg_proc, flags, n_threads);
}

AAByteStream AADecompressionInputStreamOpen(AAByteStream compressed_stream, AAFlagSet flags, int n_threads)
{
  return _AADecompressionInputStreamOpen(compressed_stream, flags, n_threads);
}

AAArchiveStream AAEncodeArchiveOutputStreamOpen(AAByteStream stream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return _AAEncodeArchiveOutputStreamOpen(stream, msg_data, msg_proc, flags, n_threads);
}

AAArchiveStream AAExtractArchiveOutputStreamOpen(const char *dir, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return _AAExtractArchiveOutputStreamOpen(dir, msg_data, msg_proc, flags, n_threads);
}

AAFieldKeySet AAFieldKeySetCreateWithString(const char *s)
{
  return _AAFieldKeySetCreateWithString(s);
}

void AAFieldKeySetDestroy(AAFieldKeySet key_set)
{
}

AAByteStream AAFileStreamOpenWithFD(int fd, int automatic_close)
{
  return _AAFileStreamOpenWithFD(fd, automatic_close);
}

AAByteStream AAFileStreamOpenWithPath(const char *path, int open_flags, mode_t open_mode)
{
  return _AAFileStreamOpenWithPath(path, open_flags, open_mode);
}

int AAHeaderGetFieldBlob(AAHeader header, uint32_t i, uint64_t *size, uint64_t *offset)
{
  return _AAHeaderGetFieldBlob(header, i, size, offset);
}

int AAHeaderGetFieldString(AAHeader header, uint32_t i, size_t capacity, char *value, size_t *length)
{
  return _AAHeaderGetFieldString(header, i, capacity, value, length);
}

int AAHeaderGetFieldUInt(AAHeader header, uint32_t i, uint64_t *value)
{
  return _AAHeaderGetFieldUInt(header, i, value);
}

int AAHeaderGetKeyIndex(AAHeader header, AAFieldKey key)
{
  return _AAHeaderGetKeyIndex(header, key);
}

uint64_t AAPathListCreate()
{
  return _AAPathListCreate();
}

AAPathList AAPathListCreateWithDirectoryContents(const char *dir, const char *path, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return _AAPathListCreateWithDirectoryContents(dir, path, msg_data, msg_proc, flags, n_threads);
}

AAPathList AAPathListCreateWithPath(const char *dir, const char *path)
{
  return _AAPathListCreateWithPath(dir, path);
}

void AAPathListDestroy(AAPathList path_list)
{
}

uint64_t AAPathListMerge()
{
  return _AAPathListMerge();
}

uint64_t AAThreadErrorContextEnter()
{
  return _AAThreadErrorContextEnter();
}

uint64_t AAThreadErrorContextLeave()
{
  return _AAThreadErrorContextLeave();
}

AEAContext AEAContextCreateWithEncryptedStream(AAByteStream encrypted_stream)
{
  return _AEAContextCreateWithEncryptedStream(encrypted_stream);
}

AEAContext AEAContextCreateWithProfile(AEAProfile profile)
{
  return _AEAContextCreateWithProfile(profile);
}

void AEAContextDestroy(AEAContext context)
{
}

int AEAContextGetFieldBlob(AEAContext context, AEAContextField field, AEAContextFieldRepresentation representation, size_t buf_capacity, uint8_t *buf, size_t *buf_size)
{
  return _AEAContextGetFieldBlob(context, field, representation, buf_capacity, buf, buf_size);
}

uint64_t AEAContextGetFieldUInt(AEAContext context, AEAContextField field)
{
  return _AEAContextGetFieldUInt(context, field);
}

int AEAContextSetFieldBlob(AEAContext context, AEAContextField field, AEAContextFieldRepresentation representation, const uint8_t *buf, size_t buf_size)
{
  return _AEAContextSetFieldBlob(context, field, representation, buf, buf_size);
}

int AEAContextSetFieldUInt(AEAContext context, AEAContextField field, uint64_t value)
{
  return _AEAContextSetFieldUInt(context, field, value);
}

AAByteStream AEADecryptionInputStreamOpen(AAByteStream encrypted_stream, AEAContext context, AAFlagSet flags, int n_threads)
{
  return _AEADecryptionInputStreamOpen(encrypted_stream, context, flags, n_threads);
}

int AEAEncryptionOutputStreamCloseAndUpdateContext(AAByteStream stream, AEAContext context)
{
  return _AEAEncryptionOutputStreamCloseAndUpdateContext(stream, context);
}

AAByteStream AEAEncryptionOutputStreamOpen(AAByteStream encrypted_stream, AEAContext context, AAFlagSet flags, int n_threads)
{
  return _AEAEncryptionOutputStreamOpen(encrypted_stream, context, flags, n_threads);
}

uint64_t AEAKeychainLoadItem()
{
  return _AEAKeychainLoadItem();
}

uint64_t AEAKeychainStoreItem()
{
  return _AEAKeychainStoreItem();
}

uint64_t APFSVolumeRole()
{
  return _APFSVolumeRole();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return _CFArrayCreateMutableCopy(allocator, capacity, theArray);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return _CFAutorelease(arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return _CFBundleCopyLocalizedString(bundle, key, value, tableName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return _CFBundleCreate(allocator, bundleURL);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return _CFBundleGetBundleWithIdentifier(bundleID);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return _CFDateCreate(allocator, at);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return _CFErrorCopyUserInfo(err);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return _CFErrorGetDomain(err);
}

Boolean CFFileSecurityClearProperties(CFFileSecurityRef fileSec, CFFileSecurityClearOptions clearPropertyMask)
{
  return _CFFileSecurityClearProperties(fileSec, clearPropertyMask);
}

CFFileSecurityRef CFFileSecurityCreate(CFAllocatorRef allocator)
{
  return _CFFileSecurityCreate(allocator);
}

CFFileSecurityRef CFFileSecurityCreateCopy(CFAllocatorRef allocator, CFFileSecurityRef fileSec)
{
  return _CFFileSecurityCreateCopy(allocator, fileSec);
}

Boolean CFFileSecurityGetMode(CFFileSecurityRef fileSec, mode_t *mode)
{
  return _CFFileSecurityGetMode(fileSec, mode);
}

Boolean CFFileSecuritySetGroup(CFFileSecurityRef fileSec, gid_t group)
{
  return _CFFileSecuritySetGroup(fileSec, group);
}

Boolean CFFileSecuritySetMode(CFFileSecurityRef fileSec, mode_t mode)
{
  return _CFFileSecuritySetMode(fileSec, mode);
}

Boolean CFFileSecuritySetOwner(CFFileSecurityRef fileSec, uid_t owner)
{
  return _CFFileSecuritySetOwner(fileSec, owner);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNullGetTypeID(void)
{
  return _CFNullGetTypeID();
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return _CFStringCompareWithOptions(theString1, theString2, rangeToCompare, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return _CFStringCreateWithCharacters(alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return _CFStringCreateWithSubstring(alloc, str, range);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return _CFStringGetCharacterAtIndex(theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return _CFStringHasPrefix(theString, prefix);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return _CFURLCopyLastPathComponent(url);
}

CFDictionaryRef CFURLCopyResourcePropertiesForKeys(CFURLRef url, CFArrayRef keys, CFErrorRef *error)
{
  return _CFURLCopyResourcePropertiesForKeys(url, keys, error);
}

Boolean CFURLCopyResourcePropertyForKey(CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return _CFURLCopyResourcePropertyForKey(url, key, propertyValueTypeRefPtr, error);
}

CFURLRef CFURLCreateFilePathURL(CFAllocatorRef allocator, CFURLRef url, CFErrorRef *error)
{
  return _CFURLCreateFilePathURL(allocator, url, error);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return _CFURLCreateFromFileSystemRepresentation(allocator, buffer, bufLen, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return _CFURLGetFileSystemRepresentation(url, resolveAgainstBase, buffer, maxBufLen);
}

CFTypeID CFURLGetTypeID(void)
{
  return _CFURLGetTypeID();
}

Boolean CFURLSetResourcePropertiesForKeys(CFURLRef url, CFDictionaryRef keyedPropertyValues, CFErrorRef *error)
{
  return _CFURLSetResourcePropertiesForKeys(url, keyedPropertyValues, error);
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFFileSecurityGetFilesec()
{
  return __CFFileSecurityGetFilesec();
}

uint64_t _CFURLGetResourcePropertyFlags()
{
  return __CFURLGetResourcePropertyFlags();
}

uint64_t _CFURLGetVolumePropertyFlags()
{
  return __CFURLGetVolumePropertyFlags();
}

uint64_t _CFURLIsFileURL()
{
  return __CFURLIsFileURL();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return std::to_string(retstr, __val);
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

uint64_t __CFStringIsMutable()
{
  return ___CFStringIsMutable();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void abort(void)
{
}

int acl_free(void *obj_p)
{
  return _acl_free(obj_p);
}

acl_t acl_get_file(const char *path_p, acl_type_t type)
{
  return _acl_get_file(path_p, type);
}

acl_t acl_init(int count)
{
  return _acl_init(count);
}

int acl_set_file(const char *path_p, acl_type_t type, acl_t acl)
{
  return _acl_set_file(path_p, type, acl);
}

uint64_t archive_entry_clear()
{
  return _archive_entry_clear();
}

uint64_t archive_entry_copy_stat()
{
  return _archive_entry_copy_stat();
}

uint64_t archive_entry_filetype()
{
  return _archive_entry_filetype();
}

uint64_t archive_entry_free()
{
  return _archive_entry_free();
}

uint64_t archive_entry_hardlink()
{
  return _archive_entry_hardlink();
}

uint64_t archive_entry_new()
{
  return _archive_entry_new();
}

uint64_t archive_entry_pathname()
{
  return _archive_entry_pathname();
}

uint64_t archive_entry_set_hardlink()
{
  return _archive_entry_set_hardlink();
}

uint64_t archive_entry_set_pathname()
{
  return _archive_entry_set_pathname();
}

uint64_t archive_entry_set_symlink()
{
  return _archive_entry_set_symlink();
}

uint64_t archive_entry_size()
{
  return _archive_entry_size();
}

uint64_t archive_entry_size_is_set()
{
  return _archive_entry_size_is_set();
}

uint64_t archive_errno()
{
  return _archive_errno();
}

uint64_t archive_error_string()
{
  return _archive_error_string();
}

uint64_t archive_filter_bytes()
{
  return _archive_filter_bytes();
}

uint64_t archive_format()
{
  return _archive_format();
}

uint64_t archive_read_add_passphrase()
{
  return _archive_read_add_passphrase();
}

uint64_t archive_read_close()
{
  return _archive_read_close();
}

uint64_t archive_read_data_block()
{
  return _archive_read_data_block();
}

uint64_t archive_read_extract()
{
  return _archive_read_extract();
}

uint64_t archive_read_extract_set_progress_callback()
{
  return _archive_read_extract_set_progress_callback();
}

uint64_t archive_read_free()
{
  return _archive_read_free();
}

uint64_t archive_read_has_encrypted_entries()
{
  return _archive_read_has_encrypted_entries();
}

uint64_t archive_read_new()
{
  return _archive_read_new();
}

uint64_t archive_read_next_header2()
{
  return _archive_read_next_header2();
}

uint64_t archive_read_open_fd()
{
  return _archive_read_open_fd();
}

uint64_t archive_read_support_filter_all()
{
  return _archive_read_support_filter_all();
}

uint64_t archive_read_support_format_all()
{
  return _archive_read_support_format_all();
}

uint64_t archive_read_support_format_tar()
{
  return _archive_read_support_format_tar();
}

uint64_t archive_read_support_format_zip()
{
  return _archive_read_support_format_zip();
}

uint64_t archive_write_add_filter_gzip()
{
  return _archive_write_add_filter_gzip();
}

uint64_t archive_write_close()
{
  return _archive_write_close();
}

uint64_t archive_write_data()
{
  return _archive_write_data();
}

uint64_t archive_write_free()
{
  return _archive_write_free();
}

uint64_t archive_write_header()
{
  return _archive_write_header();
}

uint64_t archive_write_new()
{
  return _archive_write_new();
}

uint64_t archive_write_open_fd()
{
  return _archive_write_open_fd();
}

uint64_t archive_write_set_format_cpio()
{
  return _archive_write_set_format_cpio();
}

uint64_t archive_write_set_format_gnutar()
{
  return _archive_write_set_format_gnutar();
}

uint64_t archive_write_set_format_zip()
{
  return _archive_write_set_format_zip();
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return _copyfile(from, to, state, flags);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

intptr_t dispatch_block_testcancel(dispatch_block_t block)
{
  return _dispatch_block_testcancel(block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fchmod(int a1, mode_t a2)
{
  return _fchmod(a1, a2);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

void free(void *a1)
{
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

gid_t getgid(void)
{
  return _getgid();
}

uid_t getuid(void)
{
  return _getuid();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

int mkdirx_np(const char *a1, filesec_t a2)
{
  return _mkdirx_np(a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return _mkdtemp(a1);
}

int mkstemp(char *a1)
{
  return _mkstemp(a1);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

void objc_moveWeak(id *to, id *from)
{
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return _object_getClassName(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

int openx_np(const char *a1, int a2, filesec_t a3)
{
  return _openx_np(a1, a2, a3);
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

uint64_t os_variant_has_internal_ui()
{
  return _os_variant_has_internal_ui();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return _pthread_mutexattr_destroy(a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return _pthread_mutexattr_init(a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return _pthread_mutexattr_settype(a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return _readlink(a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int unsetenv(const char *a1)
{
  return _unsetenv(a1);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLByStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 URLByStandardizingPath];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__archiveDecryptionError(void *a1, const char *a2, ...)
{
  return [a1 _archiveDecryptionError];
}

id objc_msgSend__cancel(void *a1, const char *a2, ...)
{
  return [a1 _cancel];
}

id objc_msgSend__isCancelled(void *a1, const char *a2, ...)
{
  return [a1 _isCancelled];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asyncError(void *a1, const char *a2, ...)
{
  return [a1 asyncError];
}

id objc_msgSend_asyncFetchedDomain(void *a1, const char *a2, ...)
{
  return [a1 asyncFetchedDomain];
}

id objc_msgSend_asyncResultAvailable(void *a1, const char *a2, ...)
{
  return [a1 asyncResultAvailable];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleRecord(void *a1, const char *a2, ...)
{
  return [a1 bundleRecord];
}

id objc_msgSend_cachePolicy(void *a1, const char *a2, ...)
{
  return [a1 cachePolicy];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completedUnitCount(void *a1, const char *a2, ...)
{
  return [a1 completedUnitCount];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentProcess(void *a1, const char *a2, ...)
{
  return [a1 currentProcess];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_defaultCStringEncoding(void *a1, const char *a2, ...)
{
  return [a1 defaultCStringEncoding];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disconnectionState(void *a1, const char *a2, ...)
{
  return [a1 disconnectionState];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainID(void *a1, const char *a2, ...)
{
  return [a1 domainID];
}

id objc_msgSend_executableURL(void *a1, const char *a2, ...)
{
  return [a1 executableURL];
}

id objc_msgSend_filePath(void *a1, const char *a2, ...)
{
  return [a1 filePath];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_hasDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 hasDirectoryPath];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isDeclared(void *a1, const char *a2, ...)
{
  return [a1 isDeclared];
}

id objc_msgSend_isFileReferenceURL(void *a1, const char *a2, ...)
{
  return [a1 isFileReferenceURL];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_isUsingFPFS(void *a1, const char *a2, ...)
{
  return [a1 isUsingFPFS];
}

id objc_msgSend_isiCloudDriveProvider(void *a1, const char *a2, ...)
{
  return [a1 isiCloudDriveProvider];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_preferredFilenameExtension(void *a1, const char *a2, ...)
{
  return [a1 preferredFilenameExtension];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rootURL(void *a1, const char *a2, ...)
{
  return [a1 rootURL];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 startAccessingSecurityScopedResource];
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 stopAccessingSecurityScopedResource];
}

id objc_msgSend_storageURLs(void *a1, const char *a2, ...)
{
  return [a1 storageURLs];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_totalUnitCount(void *a1, const char *a2, ...)
{
  return [a1 totalUnitCount];
}

id objc_msgSend_typeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 typeIdentifier];
}

id objc_msgSend_unarchivingDelegate(void *a1, const char *a2, ...)
{
  return [a1 unarchivingDelegate];
}

id objc_msgSend_unpublish(void *a1, const char *a2, ...)
{
  return [a1 unpublish];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_wrapperWithURL_readonly_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wrapperWithURL:readonly:error:");
}