void sub_10000267C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000269C(void *a1)
{
  uint64_t v1 = qword_10000CED8;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_10000CED8, &stru_1000083C0);
  }
  id v3 = [v2 isEqualToData:qword_10000CEE0];

  return v3;
}

void *sub_100002704(void *a1, void *a2)
{
  id v3 = a1;
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!a2) {
      goto LABEL_9;
    }
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    id v8 = +[NSString stringWithFormat:@"secelemtoken: keyObjectID is of wrong type"];
    id v15 = v8;
    v9 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    *a2 = +[NSError errorWithDomain:TKErrorDomain code:-8 userInfo:v9];
LABEL_7:

    a2 = 0;
    goto LABEL_8;
  }
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, v6, objc_opt_class(), 0);
  id v8 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v7 fromData:v3 error:0];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a2) {
      goto LABEL_8;
    }
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    v9 = +[NSString stringWithFormat:@"secelemtoken: keyObjectID is of wrong type"];
    v13 = v9;
    v11 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    *a2 = +[NSError errorWithDomain:TKErrorDomain code:-8 userInfo:v11];

    goto LABEL_7;
  }
  id v8 = v8;
  a2 = v8;
LABEL_8:

LABEL_9:

  return a2;
}

void sub_1000036B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a54, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003734(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003744(uint64_t a1)
{
}

id sub_10000374C(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = [v4 isEqual:kSecAttrKeyTypeECSECPrimeRandom];
  if (v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }

  return v5;
}

BOOL sub_1000037B4(id a1, id a2)
{
  return [a2 integerValue] == (id)256;
}

BOOL sub_1000037D8(id a1, id a2)
{
  return [a2 integerValue] == (id)256;
}

uint64_t sub_1000037FC(uint64_t a1, void *a2)
{
  return 1;
}

void sub_100003E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100004164(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v13 = (void (*)(id, id, id, id, uint64_t))off_10000CF10;
  v20 = off_10000CF10;
  if (!off_10000CF10)
  {
    NSErrorUserInfoKey v14 = (void *)sub_100004E3C();
    v18[3] = (uint64_t)dlsym(v14, "SESKeyExchange");
    off_10000CF10 = (_UNKNOWN *)v18[3];
    v13 = (void (*)(id, id, id, id, uint64_t))v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v13) {
    sub_100005278();
  }
  id v15 = v13(v9, v10, v11, v12, a5);

  return v15;
}

void sub_1000042CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000477C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_100004DA0(id a1)
{
  qword_10000CEE0 = +[NSData dataWithBytes:"com.apple.secelemtoken.casd" length:27];

  _objc_release_x1();
}

void *sub_100004DEC(uint64_t a1)
{
  id v2 = (void *)sub_100004E3C();
  result = dlsym(v2, "SESKeyDelete");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10000CEE8 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100004E3C()
{
  v2[0] = 0;
  if (!qword_10000CEF0)
  {
    v2[1] = _NSConcreteStackBlock;
    v2[2] = (void *)3221225472;
    v2[3] = sub_100004F34;
    v2[4] = &unk_100008420;
    v2[5] = v2;
    long long v3 = off_100008408;
    uint64_t v4 = 0;
    qword_10000CEF0 = _sl_dlopen();
  }
  uint64_t v0 = qword_10000CEF0;
  if (!qword_10000CEF0) {
    sub_1000053E0(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t sub_100004F34()
{
  uint64_t result = _sl_dlopen();
  qword_10000CEF0 = result;
  return result;
}

void *sub_100004FA8(uint64_t a1)
{
  id v2 = (void *)sub_100004E3C();
  uint64_t result = dlsym(v2, "SESKeyCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10000CEF8 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100004FF8(uint64_t a1)
{
  id v2 = (void *)sub_100004E3C();
  uint64_t result = dlsym(v2, "SESKeyPublicKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10000CF00 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100005048(uint64_t a1)
{
  id v2 = (void *)sub_100004E3C();
  uint64_t result = dlsym(v2, "SESKeySignData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10000CF08 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100005098(uint64_t a1)
{
  id v2 = (void *)sub_100004E3C();
  uint64_t result = dlsym(v2, "SESKeyExchange");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10000CF10 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_1000050E8(uint64_t a1)
{
  id v2 = (void *)sub_100004E3C();
  uint64_t result = dlsym(v2, "SESKeyDecryptData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10000CF18 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100005138(uint64_t a1)
{
  id v2 = (void *)sub_100004E3C();
  uint64_t result = dlsym(v2, "SESKeyCreateSEBAASCertificate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10000CF20 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100005188()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"void soft_SESKeyDelete(NSData * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TKSecElemTokenSoftLinking.h", 34, @"%s", dlerror());

  __break(1u);
}

void sub_100005200()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"NSData * _Nullable soft_SESKeySignData(NSData * _Nonnull __strong, NSData * _Nonnull __strong, NSString * _Nonnull __strong, NSData * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TKSecElemTokenSoftLinking.h", 56, @"%s", dlerror());

  __break(1u);
}

void sub_100005278()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"NSData * _Nullable soft_SESKeyExchange(NSData * _Nonnull __strong, NSData * _Nonnull __strong, NSString * _Nonnull __strong, NSData * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TKSecElemTokenSoftLinking.h", 69, @"%s", dlerror());

  __break(1u);
}

void sub_1000052F0()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"NSData * _Nullable soft_SESKeyDecryptData(NSData * _Nonnull __strong, NSData * _Nonnull __strong, NSData * _Nonnull __strong, NSString * _Nonnull __strong, NSData * _Nonnull __strong, NSData * _Nullable __strong, NSData * _Nullable __strong, NSData * _Nullable __strong, NSError * _Nullable __autoreleasing * _Nullable)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TKSecElemTokenSoftLinking.h", 102, @"%s", dlerror());

  __break(1u);
}

void sub_100005368()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"NSData * _Nullable soft_SESKeyCreateSEBAASCertificate(NSData * _Nonnull __strong, NSString * _Nonnull __strong, NSData * _Nullable __strong, NSArray<NSString *> * _Nullable __strong, NSError * _Nullable __autoreleasing * _Nullable)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TKSecElemTokenSoftLinking.h", 115, @"%s", dlerror());

  __break(1u);
}

void sub_1000053E0(void *a1)
{
  id v2 = +[NSAssertionHandler currentHandler];
  long long v3 = +[NSString stringWithUTF8String:"void * _Nonnull SEServiceLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"TKSecElemTokenSoftLinking.h", 18, @"%s", *a1);

  __break(1u);
  CFRelease(v4);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t SecAccessControlCopyData()
{
  return _SecAccessControlCopyData();
}

uint64_t SecAccessControlCreateFromData()
{
  return _SecAccessControlCreateFromData();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return _SecAccessControlCreateWithFlags(allocator, protection, flags, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

id objc_msgSend_LAContext(void *a1, const char *a2, ...)
{
  return [a1 LAContext];
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationIdentifier];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_caller(void *a1, const char *a2, ...)
{
  return [a1 caller];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_externalizedContext(void *a1, const char *a2, ...)
{
  return [a1 externalizedContext];
}

id objc_msgSend_instanceID(void *a1, const char *a2, ...)
{
  return [a1 instanceID];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return [a1 parameters];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}