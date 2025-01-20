int main(int argc, const char **argv, const char **envp)
{
  id v3;

  _CFPrefsSetDirectModeEnabled();
  _CFPrefsSetReadOnly();
  v3 = [[CGPDFServiceListener alloc] initForXPCService];
  [v3 run];

  return 0;
}

void sub_100000FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100001048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)CGPDFPageImpl;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_10000117C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100001244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100001348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1000014B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_100001624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  applesauce::CF::ObjectRef<CGColorSpace *>::~ObjectRef((const void **)va);
  _Unwind_Resume(a1);
}

const void **applesauce::CF::ObjectRef<CGColorSpace *>::~ObjectRef(const void **a1)
{
  v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **applesauce::CF::ObjectRef<CGContext *>::~ObjectRef(const void **a1)
{
  v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_100001774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000017E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100001BAC(_Unwind_Exception *a1, void *a2, ...)
{
  va_start(va, a2);

  applesauce::CF::ObjectRef<CGDataProvider *>::~ObjectRef((const void **)va);
  _Unwind_Resume(a1);
}

void std::vector<CGPDFPageImpl * {__strong}>::resize(uint64_t a1, unint64_t a2, id *a3)
{
  uint64_t v4 = *(void *)(a1 + 8);
  unint64_t v5 = (v4 - *(void *)a1) >> 3;
  if (a2 <= v5)
  {
    if (a2 < v5)
    {
      uint64_t v7 = *(void *)a1 + 8 * a2;
      while (v4 != v7)
      {
        v8 = *(void **)(v4 - 8);
        v4 -= 8;
      }
      *(void *)(a1 + 8) = v7;
    }
  }
  else
  {
    unint64_t v6 = a2 - v5;
    std::vector<CGPDFPageImpl * {__strong}>::__append((char **)a1, v6, a3);
  }
}

const void **applesauce::CF::ObjectRef<CGDataProvider *>::~ObjectRef(const void **a1)
{
  v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_100001E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100001F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100002038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100002130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100002228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100002330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1000023AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *std::vector<CGPDFPageImpl * {__strong}>::__append(char **a1, unint64_t a2, id *a3)
{
  v8 = a1[2];
  result = a1 + 2;
  uint64_t v7 = v8;
  v9 = (char *)*(result - 1);
  if (a2 <= (v8 - v9) >> 3)
  {
    if (a2)
    {
      uint64_t v16 = 8 * a2;
      v17 = &v9[8 * a2];
      do
      {
        result = *a3;
        *(void *)v9 = result;
        v9 += 8;
        v16 -= 8;
      }
      while (v16);
      v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    uint64_t v10 = v9 - *a1;
    unint64_t v11 = a2 + (v10 >> 3);
    if (v11 >> 61) {
      std::vector<CGPDFPageImpl * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v10 >> 3;
    uint64_t v13 = v7 - *a1;
    if (v13 >> 2 > v11) {
      unint64_t v11 = v13 >> 2;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v11;
    }
    v31 = result;
    if (v14) {
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPDFPageImpl * {__strong}>>((uint64_t)result, v14);
    }
    else {
      v15 = 0;
    }
    v18 = &v15[8 * v12];
    v19 = &v15[8 * v14];
    v30 = v19;
    uint64_t v20 = 8 * a2;
    v21 = v18;
    v22 = &v18[8 * a2];
    do
    {
      *(void *)v21 = *a3;
      v21 += 8;
      v20 -= 8;
    }
    while (v20);
    v29.i64[1] = (uint64_t)v22;
    v24 = *a1;
    v23 = a1[1];
    if (v23 == *a1)
    {
      int64x2_t v26 = vdupq_n_s64((unint64_t)v23);
    }
    else
    {
      do
      {
        uint64_t v25 = *((void *)v23 - 1);
        v23 -= 8;
        *(void *)v23 = 0;
        *((void *)v18 - 1) = v25;
        v18 -= 8;
      }
      while (v23 != v24);
      int64x2_t v26 = *(int64x2_t *)a1;
      v22 = (char *)v29.i64[1];
      v19 = v30;
    }
    *a1 = v18;
    a1[1] = v22;
    int64x2_t v29 = v26;
    v27 = a1[2];
    a1[2] = v19;
    v30 = v27;
    uint64_t v28 = v26.i64[0];
    return (void *)std::__split_buffer<CGPDFPageImpl * {__strong}>::~__split_buffer((uint64_t)&v28);
  }
  return result;
}

void std::vector<CGPDFPageImpl * {__strong}>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_1000025EC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CGPDFPageImpl * {__strong}>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t std::__split_buffer<CGPDFPageImpl * {__strong}>::~__split_buffer(uint64_t a1)
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

void std::vector<CGPDFPageImpl * {__strong}>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  v1 = *a1;
  v2 = (char *)**a1;
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

void CFRelease(CFTypeRef cf)
{
}

uint64_t CGBitmapContextCreateWithShareableMappedData()
{
  return _CGBitmapContextCreateWithShareableMappedData();
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return _CGBitmapContextGetData(context);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return _CGColorSpaceCreateWithPropertyList(plist);
}

uint64_t CGContextClear()
{
  return _CGContextClear();
}

uint64_t CGContextDrawPDFPageWithOptions()
{
  return _CGContextDrawPDFPageWithOptions();
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return _CGDataProviderCreateWithCFData(data);
}

uint64_t CGPDFDocumentCopyInfoDictionary()
{
  return _CGPDFDocumentCopyInfoDictionary();
}

CGPDFDocumentRef CGPDFDocumentCreateWithProvider(CGDataProviderRef provider)
{
  return _CGPDFDocumentCreateWithProvider(provider);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return _CGPDFDocumentGetNumberOfPages(document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return _CGPDFDocumentGetPage(document, pageNumber);
}

void CGPDFDocumentGetVersion(CGPDFDocumentRef document, int *majorVersion, int *minorVersion)
{
}

BOOL CGPDFDocumentIsEncrypted(CGPDFDocumentRef document)
{
  return _CGPDFDocumentIsEncrypted(document);
}

BOOL CGPDFDocumentIsUnlocked(CGPDFDocumentRef document)
{
  return _CGPDFDocumentIsUnlocked(document);
}

uint64_t CGPDFPageCopyString()
{
  return _CGPDFPageCopyString();
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  return _CGPDFPageGetBoxRect(page, box);
}

int CGPDFPageGetRotationAngle(CGPDFPageRef page)
{
  return _CGPDFPageGetRotationAngle(page);
}

void CGPDFPageRelease(CGPDFPageRef page)
{
}

CGPDFPageRef CGPDFPageRetain(CGPDFPageRef page)
{
  return _CGPDFPageRetain(page);
}

void NSLog(NSString *format, ...)
{
}

uint64_t _CFPrefsSetDirectModeEnabled()
{
  return __CFPrefsSetDirectModeEnabled();
}

uint64_t _CFPrefsSetReadOnly()
{
  return __CFPrefsSetReadOnly();
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

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return _dispatch_data_create(buffer, size, queue, destructor);
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

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return [a1 anonymousListener];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_initForXPCService(void *a1, const char *a2, ...)
{
  return [a1 initForXPCService];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return [a1 interface];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rotation(void *a1, const char *a2, ...)
{
  return [a1 rotation];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}