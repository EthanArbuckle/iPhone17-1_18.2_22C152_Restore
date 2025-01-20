@interface CMMotionUtils
+ (BOOL)featureAvailability:(const char *)a3;
+ (BOOL)hasEntitlement:(id)a3;
+ (BOOL)isMotionActivityEntitled;
+ (id)fileHandleForWritingToURL:(id)a3;
+ (id)getExecutablePathFromPid:(int)a3;
+ (id)logDirectory;
+ (id)sendMessage:(shared_ptr<CLConnectionMessage>)a3 withReplyClassesSync:(id)a4;
+ (int64_t)authorizationStatus;
+ (int64_t)isAuthorizedForEntitlement:(id)a3;
+ (shared_ptr<CLConnectionMessage>)sendMessageSync:(shared_ptr<CLConnectionMessage>)a3;
+ (unint64_t)copyDataFrom:(id)a3 to:(id)a4;
+ (void)sendMessage:(shared_ptr<CLConnectionMessage>)a3 withReplyClasses:(id)a4 callback:(id)a5;
+ (void)tccServiceMotionAccessAllowingMac:(BOOL)a3 block:(id)a4;
+ (void)tccServiceMotionAccessAllowingMacWithBlock:(id)a3;
+ (void)tccServiceMotionAccessWithBlock:(id)a3;
+ (void)tccServiceMotionAccessWithLabel:(id)a3;
@end

@implementation CMMotionUtils

+ (id)logDirectory
{
  v3 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], a2, v2);
  v5 = objc_msgSend_URLsForDirectory_inDomains_(v3, v4, 13, 1);
  v7 = objc_msgSend_objectAtIndex_(v5, v6, 0);
  v10 = objc_msgSend_path(v7, v8, v9);
  v13 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v11, v12);
  uint64_t v16 = objc_msgSend_bundleIdentifier(v13, v14, v15);
  v18 = objc_msgSend_stringByAppendingPathComponent_(v10, v17, v16);

  return (id)objc_msgSend_stringByAppendingPathComponent_(v18, v19, @"CoreMotion");
}

+ (void)sendMessage:(shared_ptr<CLConnectionMessage>)a3 withReplyClasses:(id)a4 callback:(id)a5
{
  var0 = a3.var0;
  if (qword_1EB3BF6F0 != -1) {
    dispatch_once(&qword_1EB3BF6F0, &unk_1EDFD28C0);
  }
  v6 = (std::__shared_weak_count *)*((void *)var0 + 1);
  v7 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v7) {
    sub_1902D8B58(v7);
  }
}

+ (id)sendMessage:(shared_ptr<CLConnectionMessage>)a3 withReplyClassesSync:(id)a4
{
  var1 = (NSSet *)a3.var1;
  v5 = (std::__shared_weak_count *)*((void *)a3.var0 + 1);
  uint64_t v11 = *(void *)a3.var0;
  uint64_t v12 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  objc_msgSend_sendMessageSync_(CMMotionUtils, a2, (uint64_t)&v11, a3.var1, a4);
  v6 = v12;
  if (v12) {
    sub_1902D8B58(v12);
  }
  if (v13)
  {
    v7 = (void *)MEMORY[0x192FCD2F0](v6);
    id v8 = (id)CLConnectionMessage::getDictionaryOfClasses(v13, var1);
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }
  if (v14) {
    sub_1902D8B58(v14);
  }
  return v9;
}

+ (shared_ptr<CLConnectionMessage>)sendMessageSync:(shared_ptr<CLConnectionMessage>)a3
{
  var0 = a3.var0;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (qword_1EB3BF700 != -1) {
    dispatch_once(&qword_1EB3BF700, &unk_1EDFD3D80);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  v5 = (std::__shared_weak_count *)*((void *)var0 + 1);
  v10 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessageSync();
  if (v10) {
    sub_1902D8B58(v10);
  }
  if (vabdd_f64(CFAbsoluteTimeGetCurrent(), Current) > 5.0)
  {
    if (qword_1EB3BE898 != -1) {
      dispatch_once(&qword_1EB3BE898, &unk_1EDFC3808);
    }
    id v8 = off_1EB3BE890;
    if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v8, OS_LOG_TYPE_DEFAULT, "Warning: sendMessageSync failed to finish after 5 seconds", buf, 2u);
    }
    v6 = (CLConnectionMessage *)sub_1902D8400(115, 2);
    if (v6)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE898 != -1) {
        dispatch_once(&qword_1EB3BE898, &unk_1EDFC3808);
      }
      id v9 = (char *)_os_log_send_and_compose_impl();
      v6 = (CLConnectionMessage *)sub_1902D398C("Generic", 1, 0, 2, "+[CMMotionUtils sendMessageSync:]", "CoreLocation: %s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
  }
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

+ (BOOL)isMotionActivityEntitled
{
  return objc_msgSend_hasEntitlement_(CMMotionUtils, a2, @"com.apple.locationd.activity");
}

+ (BOOL)hasEntitlement:(id)a3
{
  v4 = SecTaskCreateFromSelf(0);
  if (!v4) {
    return 0;
  }
  v5 = v4;
  CFErrorRef error = 0;
  CFBooleanRef v6 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v4, (CFStringRef)a3, &error);
  if (v6)
  {
    CFBooleanRef v7 = v6;
    CFTypeID v8 = CFGetTypeID(v6);
    BOOL v9 = v8 == CFBooleanGetTypeID() && CFBooleanGetValue(v7) != 0;
    CFRelease(v7);
  }
  else
  {
    BOOL v9 = 0;
  }
  CFRelease(v5);
  return v9;
}

+ (void)tccServiceMotionAccessWithLabel:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (sub_1902BACB4())
  {
    if (qword_1EB3BE898 != -1) {
      dispatch_once(&qword_1EB3BE898, &unk_1EDFC3808);
    }
    CFBooleanRef v6 = off_1EB3BE890;
    if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_ERROR, "API not supported on current platform.", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE898 != -1) {
        dispatch_once(&qword_1EB3BE898, &unk_1EDFC3808);
      }
      CFBooleanRef v7 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "+[CMMotionUtils tccServiceMotionAccessWithLabel:]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
  else
  {
    if (objc_msgSend_isMainThread(MEMORY[0x1E4F29060], v4, v5))
    {
      if (qword_1EB3BE898 != -1) {
        dispatch_once(&qword_1EB3BE898, &unk_1EDFC3808);
      }
      CFTypeID v8 = off_1EB3BE890;
      if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = a3;
        _os_log_impl(&dword_1902AF000, v8, OS_LOG_TYPE_FAULT, "Warning - invoking %@ on main may lead to deadlock.", buf, 0xCu);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EB3BE898 != -1) {
          dispatch_once(&qword_1EB3BE898, &unk_1EDFC3808);
        }
        BOOL v9 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "+[CMMotionUtils tccServiceMotionAccessWithLabel:]", "CoreLocation: %s\n", v9);
        if (v9 != (char *)buf) {
          free(v9);
        }
      }
    }
    if (qword_1E929E940 != -1) {
      dispatch_once(&qword_1E929E940, &unk_1EDFD3360);
    }
  }
}

+ (void)tccServiceMotionAccessWithBlock:(id)a3
{
}

+ (void)tccServiceMotionAccessAllowingMacWithBlock:(id)a3
{
}

+ (void)tccServiceMotionAccessAllowingMac:(BOOL)a3 block:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB3BF728, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EB3BF728))
  {
    qword_1EB3BF720 = (uint64_t)dispatch_queue_create("com.apple.CoreMotion.tcc", 0);
    __cxa_guard_release(&qword_1EB3BF728);
  }
  if (objc_msgSend_isMotionActivityEntitled(CMMotionUtils, a2, a3))
  {
    CFBooleanRef v6 = (void (*)(id))*((void *)a4 + 2);
    v6(a4);
  }
  else if (!sub_1902BACB4() || a3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1905A0680;
    block[3] = &unk_1E568D2D0;
    block[4] = a4;
    dispatch_async((dispatch_queue_t)qword_1EB3BF720, block);
  }
  else
  {
    if (qword_1EB3BE898 != -1) {
      dispatch_once(&qword_1EB3BE898, &unk_1EDFC3808);
    }
    CFBooleanRef v7 = off_1EB3BE890;
    if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_ERROR, "API not supported on current platform.", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE898 != -1) {
        dispatch_once(&qword_1EB3BE898, &unk_1EDFC3808);
      }
      __int16 v10 = 0;
      CFTypeID v8 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "+[CMMotionUtils tccServiceMotionAccessAllowingMac:block:]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

+ (BOOL)featureAvailability:(const char *)a3
{
  if (sub_1902BACB4()) {
    return 0;
  }
  uint64_t v5 = (std::__shared_weak_count *)operator new(0x70uLL);
  v5->__shared_owners_ = 0;
  v5->__shared_weak_owners_ = 0;
  v5->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFD0DA0;
  sub_1902C3F54(__p, (char *)a3);
  MEMORY[0x192FCC410](&v5[1], __p);
  if (v21 < 0) {
    operator delete(__p[0]);
  }
  CFBooleanRef v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v10 = objc_msgSend_setWithObjects_(v6, v9, v7, v8, 0);
  v18 = v5 + 1;
  v19 = v5;
  atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  v13 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v11, (uint64_t)&v18, v10);
  if (v19) {
    sub_1902D8B58(v19);
  }
  v14 = objc_msgSend_objectForKeyedSubscript_(v13, v12, @"CMAvailable");
  char v4 = objc_msgSend_BOOLValue(v14, v15, v16);
  sub_1902D8B58(v5);
  return v4;
}

+ (int64_t)authorizationStatus
{
  return objc_msgSend_isAuthorizedForEntitlement_(CMMotionUtils, a2, @"com.apple.locationd.activity");
}

+ (int64_t)isAuthorizedForEntitlement:(id)a3
{
  if (objc_msgSend_hasEntitlement_(CMMotionUtils, a2, (uint64_t)a3)) {
    return 3;
  }
  if (TCCAccessRestricted()) {
    return 1;
  }
  int v4 = TCCAccessPreflight();
  if (v4) {
    return 2 * (v4 == 1);
  }
  else {
    return 3;
  }
}

+ (id)getExecutablePathFromPid:(int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (proc_pidpath(a3, buffer, 0x1000u) < 1) {
    return 0;
  }
  else {
    return (id)objc_msgSend_stringWithUTF8String_(NSString, v3, (uint64_t)buffer);
  }
}

+ (id)fileHandleForWritingToURL:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend_isFileURL(a3, a2, (uint64_t)a3) & 1) == 0)
  {
    if (qword_1EB3BE898 != -1) {
      dispatch_once(&qword_1EB3BE898, &unk_1EDFC3808);
    }
    v14 = off_1EB3BE890;
    if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v14, OS_LOG_TYPE_ERROR, "#Notice URL must specify a file.", buf, 2u);
    }
    if (!sub_1902D8400(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE898 != -1) {
      dispatch_once(&qword_1EB3BE898, &unk_1EDFC3808);
    }
    LOWORD(v55) = 0;
    goto LABEL_38;
  }
  uint64_t v6 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v4, v5);
  uint64_t v9 = objc_msgSend_path(a3, v7, v8);
  if (objc_msgSend_fileExistsAtPath_(v6, v10, v9))
  {
    if (qword_1EB3BE898 != -1) {
      dispatch_once(&qword_1EB3BE898, &unk_1EDFC3808);
    }
    v13 = off_1EB3BE890;
    if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_ERROR, "#Notice File already exists at URL.", buf, 2u);
    }
    if (!sub_1902D8400(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE898 != -1) {
      dispatch_once(&qword_1EB3BE898, &unk_1EDFC3808);
    }
    LOWORD(v55) = 0;
LABEL_38:
    v40 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "+[CMMotionUtils fileHandleForWritingToURL:]", "CoreLocation: %s\n", v40);
    if (v40 != (char *)buf) {
      free(v40);
    }
    return 0;
  }
  uint64_t v16 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v11, v12);
  uint64_t v19 = objc_msgSend_path(a3, v17, v18);
  if ((objc_msgSend_createFileAtPath_contents_attributes_(v16, v20, v19, 0, 0) & 1) == 0)
  {
    if (qword_1EB3BE898 != -1) {
      dispatch_once(&qword_1EB3BE898, &unk_1EDFC3808);
    }
    v39 = off_1EB3BE890;
    if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v39, OS_LOG_TYPE_ERROR, "#Notice URL must point to a file path which you have access to write to.", buf, 2u);
    }
    if (!sub_1902D8400(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE898 != -1) {
      dispatch_once(&qword_1EB3BE898, &unk_1EDFC3808);
    }
    LOWORD(v55) = 0;
    goto LABEL_38;
  }
  v54 = 0;
  id result = (id)objc_msgSend_fileHandleForWritingToURL_error_(MEMORY[0x1E4F28CB0], v21, (uint64_t)a3, &v54);
  if (!result || v54)
  {
    if (qword_1E929D8E8 != -1) {
      dispatch_once(&qword_1E929D8E8, &unk_1EDFC3828);
    }
    v22 = qword_1E929D8F0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8F0, OS_LOG_TYPE_ERROR))
    {
      v25 = objc_msgSend_absoluteString(a3, v23, v24);
      uint64_t v28 = objc_msgSend_UTF8String(v25, v26, v27);
      v31 = objc_msgSend_description(v54, v29, v30);
      uint64_t v34 = objc_msgSend_UTF8String(v31, v32, v33);
      *(_DWORD *)buf = 136446466;
      uint64_t v60 = v28;
      __int16 v61 = 2082;
      uint64_t v62 = v34;
      _os_log_impl(&dword_1902AF000, v22, OS_LOG_TYPE_ERROR, "#Notice Unable to get file handle for URL %{public}s: %{public}s", buf, 0x16u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8E8 != -1) {
        dispatch_once(&qword_1E929D8E8, &unk_1EDFC3828);
      }
      v43 = objc_msgSend_absoluteString(a3, v41, v42);
      uint64_t v46 = objc_msgSend_UTF8String(v43, v44, v45);
      v49 = objc_msgSend_description(v54, v47, v48);
      uint64_t v52 = objc_msgSend_UTF8String(v49, v50, v51);
      int v55 = 136446466;
      uint64_t v56 = v46;
      __int16 v57 = 2082;
      uint64_t v58 = v52;
      v53 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "+[CMMotionUtils fileHandleForWritingToURL:]", "CoreLocation: %s\n", v53);
      if (v53 != (char *)buf) {
        free(v53);
      }
    }
    v37 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v35, v36);
    objc_msgSend_removeItemAtURL_error_(v37, v38, (uint64_t)a3, 0);
    return 0;
  }
  return result;
}

+ (unint64_t)copyDataFrom:(id)a3 to:(id)a4
{
  objc_msgSend_seekToFileOffset_(a3, a2, 0);
  objc_msgSend_seekToFileOffset_(a4, v6, 0);
  uint64_t DataOfLength = objc_msgSend_readDataOfLength_(a3, v7, 0x2000);
  if (!DataOfLength) {
    return 0;
  }
  id v11 = (void *)DataOfLength;
  unint64_t v12 = 0;
  do
  {
    if (!objc_msgSend_length(v11, v9, v10)) {
      break;
    }
    objc_msgSend_writeData_(a4, v13, (uint64_t)v11);
    v12 += objc_msgSend_length(v11, v14, v15);
    id v11 = objc_msgSend_readDataOfLength_(a3, v16, 0x2000);
  }
  while (v11);
  return v12;
}

@end