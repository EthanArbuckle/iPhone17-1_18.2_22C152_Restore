uint64_t sub_100005254(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

uint64_t sub_10000556C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_100005770()
{
  if (qword_100011958 != -1) {
    dispatch_once(&qword_100011958, &stru_10000CCF0);
  }
  v0 = (void *)qword_100011960;

  return v0;
}

void sub_1000057C4(id a1)
{
  qword_100011960 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "_");

  _objc_release_x1();
}

id sub_100005808()
{
  if (qword_100011968 != -1) {
    dispatch_once(&qword_100011968, &stru_10000CD10);
  }
  v0 = (void *)qword_100011970;

  return v0;
}

void sub_10000585C(id a1)
{
  qword_100011970 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "locations");

  _objc_release_x1();
}

id sub_1000058A0()
{
  if (qword_100011978 != -1) {
    dispatch_once(&qword_100011978, &stru_10000CD30);
  }
  v0 = (void *)qword_100011980;

  return v0;
}

void sub_1000058F4(id a1)
{
  qword_100011980 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "accessory");

  _objc_release_x1();
}

id sub_100005938()
{
  if (qword_100011988 != -1) {
    dispatch_once(&qword_100011988, &stru_10000CD50);
  }
  v0 = (void *)qword_100011990;

  return v0;
}

void sub_10000598C(id a1)
{
  qword_100011990 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "traffic");

  _objc_release_x1();
}

id sub_1000059D0()
{
  if (qword_100011998 != -1) {
    dispatch_once(&qword_100011998, &stru_10000CD70);
  }
  v0 = (void *)qword_1000119A0;

  return v0;
}

void sub_100005A24(id a1)
{
  qword_1000119A0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "encoder");

  _objc_release_x1();
}

id sub_100005A68()
{
  if (qword_1000119A8 != -1) {
    dispatch_once(&qword_1000119A8, &stru_10000CD90);
  }
  v0 = (void *)qword_1000119B0;

  return v0;
}

void sub_100005ABC(id a1)
{
  qword_1000119B0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "bluetoothsession");

  _objc_release_x1();
}

id sub_100005B00()
{
  if (qword_1000119B8 != -1) {
    dispatch_once(&qword_1000119B8, &stru_10000CDB0);
  }
  v0 = (void *)qword_1000119C0;

  return v0;
}

void sub_100005B54(id a1)
{
  qword_1000119C0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "extensions");

  _objc_release_x1();
}

id sub_100005B98()
{
  if (qword_1000119C8 != -1) {
    dispatch_once(&qword_1000119C8, &stru_10000CDD0);
  }
  v0 = (void *)qword_1000119D0;

  return v0;
}

void sub_100005BEC(id a1)
{
  qword_1000119D0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "extensions_playSound");

  _objc_release_x1();
}

id sub_100005C30()
{
  if (qword_1000119D8 != -1) {
    dispatch_once(&qword_1000119D8, &stru_10000CDF0);
  }
  v0 = (void *)qword_1000119E0;

  return v0;
}

void sub_100005C84(id a1)
{
  qword_1000119E0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "secureLocations");

  _objc_release_x1();
}

id sub_100005CC8()
{
  if (qword_1000119E8 != -1) {
    dispatch_once(&qword_1000119E8, &stru_10000CE10);
  }
  v0 = (void *)qword_1000119F0;

  return v0;
}

void sub_100005D1C(id a1)
{
  qword_1000119F0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "healUCRT");

  _objc_release_x1();
}

id sub_100005D60()
{
  if (qword_1000119F8 != -1) {
    dispatch_once(&qword_1000119F8, &stru_10000CE30);
  }
  v0 = (void *)qword_100011A00;

  return v0;
}

void sub_100005DB4(id a1)
{
  qword_100011A00 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "repairDevice");

  _objc_release_x1();
}

id sub_100005DF8()
{
  if (qword_100011A08 != -1) {
    dispatch_once(&qword_100011A08, &stru_10000CE50);
  }
  v0 = (void *)qword_100011A10;

  return v0;
}

void sub_100005E4C(id a1)
{
  qword_100011A10 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "ALFailureAnalytics");

  _objc_release_x1();
}

id sub_100005E90()
{
  if (qword_100011A18 != -1) {
    dispatch_once(&qword_100011A18, &stru_10000CE70);
  }
  v0 = (void *)qword_100011A20;

  return v0;
}

void sub_100005EE4(id a1)
{
  qword_100011A20 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "disableLocationDisplay");

  _objc_release_x1();
}

id sub_100005F28()
{
  if (qword_100011A28 != -1) {
    dispatch_once(&qword_100011A28, &stru_10000CE90);
  }
  v0 = (void *)qword_100011A30;

  return v0;
}

void sub_100005F7C(id a1)
{
  qword_100011A30 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "accountRatchet");

  _objc_release_x1();
}

id sub_100005FC0()
{
  if (qword_100011A38 != -1) {
    dispatch_once(&qword_100011A38, &stru_10000CEB0);
  }
  v0 = (void *)qword_100011A40;

  return v0;
}

void sub_100006014(id a1)
{
  qword_100011A40 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "ownerAuthentication");

  _objc_release_x1();
}

id sub_100006058()
{
  if (qword_100011A48 != -1) {
    dispatch_once(&qword_100011A48, &stru_10000CED0);
  }
  v0 = (void *)qword_100011A50;

  return v0;
}

void sub_1000060AC(id a1)
{
  if (+[FMPreferencesUtil BOOLForKey:@"ShowAutomationLogs" inDomain:@"com.apple.icloud.findmydeviced.notbackedup"])
  {
    qword_100011A50 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "automation");
    _objc_release_x1();
  }
}

void sub_1000062D0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  v9 = sub_100005770();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v36 = (uint64_t)v7;
    __int16 v37 = 2112;
    uint64_t v38 = a3;
    __int16 v39 = 2112;
    id v40 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMDActivationLockIdentityEncoder got certs %@, keyRef %@, error %@", buf, 0x20u);
  }

  if (v8)
  {
    id v10 = v8;
    v11 = 0;
    goto LABEL_28;
  }
  v12 = sub_100005770();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMDActivationLockIdentityEncoder computing signature.", buf, 2u);
  }

  v13 = [*(id *)(a1 + 32) signatureDataSource];
  v14 = [*(id *)(a1 + 40) dataToSign];
  id v32 = 0;
  v15 = [v13 passcodeActivationUnlockSignatureForPayload:v14 usingKey:a3 error:&v32];
  id v16 = v32;

  v17 = sub_100005770();
  v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100007DF4((uint64_t)v16, v18);
    }

    id v10 = v16;
    v11 = 0;
    goto LABEL_27;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "FMDActivationLockIdentityEncoder computing certificates", buf, 2u);
  }

  +[NSMutableArray array];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100006740;
  v30[3] = &unk_10000CF08;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v31 = v19;
  [v7 enumerateObjectsUsingBlock:v30];
  CFStringRef v33 = @"certs";
  id v34 = v19;
  uint64_t v20 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  id v29 = 0;
  uint64_t v21 = +[NSJSONSerialization dataWithJSONObject:v20 options:0 error:&v29];
  id v22 = v29;
  v23 = v22;
  v27 = (void *)v21;
  v28 = (void *)v20;
  if (v22)
  {
    id v10 = v22;
    v24 = sub_100005770();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100007D7C((uint64_t)v10, v24);
    }
  }
  else
  {
    if (v21)
    {
      v25 = sub_100005770();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = v20;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "FMDActivationLockIdentityEncoder final attestation %@", buf, 0xCu);
      }

      v24 = [*(id *)(a1 + 32) _compressData:v21];
      if (v24)
      {
        id v10 = 0;
      }
      else
      {
        id v10 = +[NSError errorWithDomain:@"com.apple.icloud.findmydevice.FMDActivationLockIdentityEncoder" code:2 userInfo:0];
      }
      v11 = [[FMDBAAAttestation alloc] initWithAttestation:v24 signature:v15];
      goto LABEL_26;
    }
    id v10 = +[NSError errorWithDomain:@"com.apple.icloud.findmydevice.FMDActivationLockIdentityEncoder" code:1 userInfo:0];
    v24 = sub_100005770();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100007D38(v24);
    }
  }
  v11 = 0;
LABEL_26:

LABEL_27:
LABEL_28:
  uint64_t v26 = *(void *)(a1 + 48);
  if (v26) {
    (*(void (**)(uint64_t, FMDBAAAttestation *, id))(v26 + 16))(v26, v11, v10);
  }
}

void sub_100006740(uint64_t a1, SecCertificateRef certificate)
{
  CFDataRef v4 = SecCertificateCopyData(certificate);
  v3 = [(__CFData *)v4 base64EncodedStringWithOptions:0];
  objc_msgSend(*(id *)(a1 + 32), "fm_safeAddObject:", v3);
}

uint64_t sub_100006D74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a2);
  }
  return result;
}

void sub_100007AEC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t start()
{
  v0 = sub_100005770();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "FindMyDeviceIdentityXPCService started", v5, 2u);
  }

  v2 = objc_alloc_init(FindMyDeviceIdentityXPCServer);
  v3 = +[NSXPCListener serviceListener];
  [v3 setDelegate:v2];
  [v3 resume];

  return 0;
}

void sub_100007BCC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

void sub_100007C44(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "FMDSecuritySignatureDataSource passcodeActivationUnlockSignatureForPayload: missing required argument: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100007CBC(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "FMDSecuritySignatureDataSource signature error : %@", (uint8_t *)&v3, 0xCu);
}

void sub_100007D38(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "FMDActivationLockIdentityEncoder could not serialize certs, nil jsonData", v1, 2u);
}

void sub_100007D7C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "FMDActivationLockIdentityEncoder could not serialize certs %@", (uint8_t *)&v2, 0xCu);
}

void sub_100007DF4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "FMDActivationLockIdentityEncoder signing error %@", (uint8_t *)&v2, 0xCu);
}

void sub_100007E6C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to compress", v1, 2u);
}

void sub_100007EB0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error creating baa request : %@", (uint8_t *)&v2, 0xCu);
}

void sub_100007F28()
{
  sub_100007AD4();
  sub_100007AEC((void *)&_mh_execute_header, v0, v1, "Error serializing json from dict %@ : %@");
}

uint64_t DeviceIdentityCreateClientCertificateRequest()
{
  return _DeviceIdentityCreateClientCertificateRequest();
}

uint64_t DeviceIdentityIssueClientCertificateWithCompletion()
{
  return _DeviceIdentityIssueClientCertificateWithCompletion();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return _SecCertificateCopyData(certificate);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return _SecKeyCreateSignature(key, algorithm, dataToSign, error);
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

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return _compression_encode_buffer(dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, algorithm);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
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

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_HTTPBody(void *a1, const char *a2, ...)
{
  return [a1 HTTPBody];
}

id objc_msgSend_allHTTPHeaderFields(void *a1, const char *a2, ...)
{
  return [a1 allHTTPHeaderFields];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attestation(void *a1, const char *a2, ...)
{
  return [a1 attestation];
}

id objc_msgSend_btMacAddress(void *a1, const char *a2, ...)
{
  return [a1 btMacAddress];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_certRequest(void *a1, const char *a2, ...)
{
  return [a1 certRequest];
}

id objc_msgSend_certificateDataSource(void *a1, const char *a2, ...)
{
  return [a1 certificateDataSource];
}

id objc_msgSend_chipId(void *a1, const char *a2, ...)
{
  return [a1 chipId];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_dataToSign(void *a1, const char *a2, ...)
{
  return [a1 dataToSign];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceUDID(void *a1, const char *a2, ...)
{
  return [a1 deviceUDID];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_ecid(void *a1, const char *a2, ...)
{
  return [a1 ecid];
}

id objc_msgSend_imei(void *a1, const char *a2, ...)
{
  return [a1 imei];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_meid(void *a1, const char *a2, ...)
{
  return [a1 meid];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_refKey(void *a1, const char *a2, ...)
{
  return [a1 refKey];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_signature(void *a1, const char *a2, ...)
{
  return [a1 signature];
}

id objc_msgSend_signatureDataSource(void *a1, const char *a2, ...)
{
  return [a1 signatureDataSource];
}

id objc_msgSend_useSCRT(void *a1, const char *a2, ...)
{
  return [a1 useSCRT];
}

id objc_msgSend_validityInMinutes(void *a1, const char *a2, ...)
{
  return [a1 validityInMinutes];
}

id objc_msgSend_wifiMacAddress(void *a1, const char *a2, ...)
{
  return [a1 wifiMacAddress];
}