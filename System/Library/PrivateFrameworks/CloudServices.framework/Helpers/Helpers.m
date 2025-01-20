void sub_100003ED0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_100003EDC(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x100003EE8);
}

void sub_100004234(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_100004254()
{
  if (qword_100080FF0 != -1) {
    dispatch_once(&qword_100080FF0, &stru_100070EC8);
  }
  return byte_100080FE8;
}

void sub_100004298(id a1)
{
  byte_100080FE8 = SecIsInternalRelease();
}

id sub_1000042B8()
{
  if (qword_100081000 != -1) {
    dispatch_once(&qword_100081000, &stru_100070EE8);
  }
  v0 = (void *)qword_100080FF8;

  return v0;
}

void sub_10000430C(id a1)
{
  memset(uu, 0, sizeof(uu));
  *(_OWORD *)in = 0u;
  memset(v10, 0, sizeof(v10));
  size_t v8 = 37;
  int v1 = sysctlbyname("kern.bootsessionuuid", in, &v8, 0, 0);
  if (v1)
  {
    int v2 = v1;
    v3 = CloudServicesLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100048688(v2, v3);
    }
LABEL_7:

    goto LABEL_8;
  }
  int v4 = uuid_parse(in, uu);
  if (v4)
  {
    int v5 = v4;
    v3 = CloudServicesLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000485DC((uint64_t)in, v5, v3);
    }
    goto LABEL_7;
  }
LABEL_8:
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:uu];
  v7 = (void *)qword_100080FF8;
  qword_100080FF8 = (uint64_t)v6;
}

id sub_100004428()
{
  v0 = +[NSUbiquitousKeyValueStore defaultStore];
  int v1 = [v0 stringForKey:@"BackupUUID"];

  return v1;
}

void sub_100004484(void *a1)
{
  id v1 = a1;
  id v2 = +[NSUbiquitousKeyValueStore defaultStore];
  [v2 setString:v1 forKey:@"BackupUUID"];
}

BOOL sub_1000044F0(void *a1, void *a2, void *a3)
{
  CFDictionaryRef v5 = a1;
  CFDictionaryRef v6 = a2;
  OSStatus v7 = SecItemUpdate(v5, v6);
  if (v7 == -25300)
  {
    id v8 = [(__CFDictionary *)v5 mutableCopy];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    CFDictionaryRef v9 = v6;
    id v10 = [(__CFDictionary *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v15 = -[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v14, (void)v17);
          [v8 setObject:v15 forKeyedSubscript:v14];
        }
        id v11 = [(__CFDictionary *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    OSStatus v7 = SecItemAdd((CFDictionaryRef)v8, 0);
  }
  if (a3 && v7)
  {
    *a3 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v7 userInfo:0];
  }

  return v7 == 0;
}

void sub_100004744(id a1)
{
  container_query_create();
  container_query_set_class();
  xpc_object_t v1 = xpc_string_create("com.apple.sbd");
  container_query_set_identifiers();

  container_query_operation_set_flags();
  container_query_set_persona_unique_string();
  if (container_query_get_single_result())
  {
    uint64_t v2 = +[NSURL fileURLWithFileSystemRepresentation:container_get_path() isDirectory:1 relativeToURL:0];
    v3 = (void *)qword_100081008;
    qword_100081008 = v2;

    uint64_t v4 = container_copy_sandbox_token();
    if (v4)
    {
      CFDictionaryRef v5 = (void *)v4;
      uint64_t v6 = sandbox_extension_consume();
      free(v5);
      if (v6 < 0)
      {
        OSStatus v7 = CloudServicesLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_10004878C(v7);
        }
      }
    }
  }
  else
  {
    container_query_get_last_error();
    id v8 = (void *)container_error_copy_unlocalized_description();
    CFDictionaryRef v9 = CloudServicesLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100048714((uint64_t)v8, v9);
    }

    free(v8);
  }
  container_query_free();
}

void sub_100004DD4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

BOOL sub_100004E00(uint64_t a1)
{
  return (unint64_t)(a1 - 2) < 6;
}

void sub_100005CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005CE4(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void sub_100005DF8(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained[6] addObject:*(void *)(a1 + 32)];
}

void sub_100005F24(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained[6] removeObject:*(void *)(a1 + 32)];
}

uint64_t sub_1000060DC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000060EC(uint64_t a1)
{
}

void sub_1000060F4(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[4];
    if (!v4)
    {
      if (*((unsigned char *)v3 + 24))
      {
        long long v18 = [v3[5] readStoredLog];
        id v4 = v18;
        if ((!v18 || [v18 allActivitiesComplete]) && !*(void *)(a1 + 32))
        {
          CloudServicesLog();
          CFDictionaryRef v5 = (SBEscrowOperationLoggerUpdate *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v29 = objc_opt_class();
            _os_log_impl((void *)&_mh_execute_header, &v5->super, OS_LOG_TYPE_DEFAULT, "%@: No previous logs to process and no event to handle", buf, 0xCu);
          }
          goto LABEL_11;
        }
      }
      else
      {
        id v4 = 0;
      }
    }
    uint64_t v19 = a1;
    CFDictionaryRef v5 = [[SBEscrowOperationLoggerUpdate alloc] initWithLog:v4 event:*(void *)(a1 + 32) context:*(void *)(a1 + 48)];
    uint64_t v6 = [(SBEscrowOperationLoggerUpdate *)v5 updatedLog];
    id v7 = v3[4];
    v3[4] = (id)v6;

    id v8 = v3[5];
    CFDictionaryRef v9 = [(SBEscrowOperationLoggerUpdate *)v5 updatedLog];
    [v8 storeLog:v9];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v3[6];
    id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          v16 = v3[2];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000063D8;
          block[3] = &unk_100070F80;
          block[4] = v15;
          block[5] = v3;
          v22 = v5;
          dispatch_async(v16, block);
        }
        id v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v12);
    }

    long long v17 = v3[2];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000063E8;
    v20[3] = &unk_100070FA8;
    v20[4] = *(void *)(v19 + 56);
    dispatch_async(v17, v20);
LABEL_11:
  }
}

id sub_1000063D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) operationLogger:*(void *)(a1 + 40) didUpdateWithResult:*(void *)(a1 + 48)];
}

void sub_1000063E8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void sub_1000065C4(uint64_t a1)
{
}

uint64_t sub_1000068BC(uint64_t result, unsigned __int8 *a2, unint64_t a3, uint64_t a4)
{
  if (a3 < a3 + a4)
  {
    uint64_t v4 = 2 * a3;
    do
    {
      unsigned int v5 = *a2++;
      *(unsigned char *)(*(void *)(result + 32) + v4) = a0123456789abcd[(unint64_t)v5 >> 4];
      *(unsigned char *)(*(void *)(result + 32) + v4 + 1) = a0123456789abcd[v5 & 0xF];
      v4 += 2;
      --a4;
    }
    while (a4);
  }
  return result;
}

void sub_100006B70(uint64_t a1)
{
  SOSPeerInfoGetPeerID();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    uint64_t v2 = (void *)SOSPeerInfoCopyBackupKey();
    v3 = *(void **)(a1 + 32);
    id v4 = objc_alloc((Class)NSString);
    unsigned int v5 = [v2 sha1Digest];
    uint64_t v6 = [v5 hexString];
    id v7 = [v4 initWithFormat:@"%@ (%@)", v8, v6];
    [v3 addObject:v7];
  }
}

void sub_100006D5C(uint64_t a1)
{
  uint64_t v2 = SOSPeerInfoGetPeerID();
  if (v2)
  {
    id v6 = v2;
    v3 = (void *)SOSPeerInfoCopyBackupKey();
    id v4 = v3;
    if (v3)
    {
      unsigned int v5 = [v3 sha1Digest];
      [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
    }
    uint64_t v2 = v6;
  }
}

void sub_100006E9C(uint64_t a1)
{
  uint64_t v2 = (void *)SOSPeerInfoCopyBackupKey();
  if (v2)
  {
    id v4 = v2;
    v3 = [v2 sha1Digest];
    if (v3) {
      [*(id *)(a1 + 32) addObject:v3];
    }

    uint64_t v2 = v4;
  }
}

void sub_100007084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000070AC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000070BC(uint64_t a1)
{
}

void sub_1000070C4(uint64_t a1)
{
  uint64_t v2 = (void *)SOSPeerInfoCopyBackupKey();
  v3 = [v2 sha1Digest];
  unsigned int v4 = [v3 isEqual:*(void *)(a1 + 32)];

  if (v4)
  {
    uint64_t v5 = SOSPeerInfoGetPeerID();
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    CFDictionaryRef v9 = CloudServicesLog();
    id v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        int v12 = 138412290;
        uint64_t v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "found peer %@", (uint8_t *)&v12, 0xCu);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      sub_100048AD0();
    }
  }
}

void sub_100008F38(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v10 = [v9 hexString];
  v12[0] = @"class";
  v12[1] = @"hash";
  v13[0] = v8;
  v13[1] = v9;
  v12[2] = @"data";
  v13[2] = v7;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v10];
}

void sub_10000916C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  if (!v7)
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
  [v7 addObject:v6];
}

const char *sub_10000A108()
{
  return sqlite3_errmsg(v0);
}

void sub_10000A120(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000A180(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10000A1D0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_10000A1F0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

id sub_10000A9D8(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 containsObject:*(void *)(a1 + 32)];
}

BOOL sub_10000BA24(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      switch((v6 >> 3))
      {
        case 1u:
          uint64_t v12 = PBReaderReadString();
          uint64_t v13 = 40;
          goto LABEL_23;
        case 2u:
          uint64_t v12 = PBReaderReadString();
          uint64_t v13 = 24;
          goto LABEL_23;
        case 3u:
          uint64_t v12 = PBReaderReadString();
          uint64_t v13 = 8;
          goto LABEL_23;
        case 4u:
          uint64_t v12 = PBReaderReadData();
          uint64_t v13 = 32;
          goto LABEL_23;
        case 5u:
          uint64_t v12 = PBReaderReadData();
          uint64_t v13 = 16;
LABEL_23:
          uint64_t v14 = *(void **)(a1 + v13);
          *(void *)(a1 + v13) = v12;

          goto LABEL_24;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_24:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10000CAA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000CB3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000CBD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000CC5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000CCF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000DDE0(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v5 = [[EscrowAccountInfoResponse alloc] initFromResponseFilterPCS:v6];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

id sub_10000EDEC(void *a1)
{
  memset(v7, 170, 20);
  CFDataRef v1 = a1;
  BytePtr = CFDataGetBytePtr(v1);
  CC_LONG v3 = [(__CFData *)v1 length];

  CC_SHA1(BytePtr, v3, v7);
  id v4 = [objc_alloc((Class)NSData) initWithBytesNoCopy:v7 length:20 freeWhenDone:0];
  id v5 = [v4 base64EncodedStringWithOptions:0];

  return v5;
}

void sub_10000FE3C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000FE64(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

id _CloudServicesSignpostLogSystem()
{
  if (qword_100081020 != -1) {
    dispatch_once(&qword_100081020, &stru_100071100);
  }
  v0 = (void *)qword_100081018;

  return v0;
}

void sub_10000FED8(id a1)
{
  qword_100081018 = (uint64_t)os_log_create("com.apple.sbd", "signpost");

  _objc_release_x1();
}

os_signpost_id_t _CloudServicesSignpostCreate(NSObject *a1)
{
  os_signpost_id_t v1 = os_signpost_id_generate(a1);
  mach_continuous_time();
  return v1;
}

double _CloudServicesSignpostGetNanoseconds(uint64_t a1, uint64_t a2)
{
  if (qword_100081030 != -1) {
    dispatch_once(&qword_100081030, &stru_100071120);
  }
  uint64_t v3 = mach_continuous_time();
  LODWORD(v4) = dword_100081028;
  LODWORD(v5) = *(_DWORD *)algn_10008102C;
  return (double)v4 / (double)v5 * (double)(v3 - a2);
}

void sub_10000FFBC(id a1)
{
}

BOOL sub_10000FFC8()
{
  if (sub_1000432B0())
  {
    os_signpost_id_t v1 = sub_10001001C();
    BOOL v2 = v1 != 0;
  }
  else
  {
    BOOL v2 = 0;
  }
  return v2;
}

id sub_10001001C()
{
  if (&kAAProtocoliCloudAccountKey)
  {
    v0 = +[ACAccountStore defaultStore];
    os_signpost_id_t v1 = objc_msgSend(v0, "aa_primaryAppleAccount");
  }
  else
  {
    BOOL v2 = CloudServicesLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "AppleAccount.framework is not available; client must specify all parameters",
        v4,
        2u);
    }

    v0 = 0;
    os_signpost_id_t v1 = 0;
  }

  return v1;
}

id sub_1000100D4()
{
  os_signpost_id_t v1 = CloudServicesLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "getting dsid", (uint8_t *)&v6, 2u);
  }

  BOOL v2 = sub_10001001C();
  if (objc_msgSend(v2, "aa_isPrimaryEmailVerified"))
  {
    uint64_t v3 = objc_msgSend(v2, "aa_personID");
    unint64_t v4 = CloudServicesLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      unint64_t v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "got dsid: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    unint64_t v4 = CloudServicesLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10004A030(v4);
    }
    uint64_t v3 = 0;
  }

  return v3;
}

id sub_100010238()
{
  os_signpost_id_t v1 = sub_10001001C();
  BOOL v2 = objc_msgSend(v1, "aa_altDSID");

  return v2;
}

id sub_10001029C()
{
  os_signpost_id_t v1 = CloudServicesLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "getting iCloud env", buf, 2u);
  }

  BOOL v2 = sub_10001001C();
  if (objc_msgSend(v2, "aa_isPrimaryEmailVerified"))
  {
    uint64_t v3 = [v2 dataclassProperties];
    unint64_t v4 = [v3 objectForKeyedSubscript:kAAProtocoliCloudAccountKey];
    unint64_t v5 = [v4 objectForKeyedSubscript:@"iCloudEnv"];

    int v6 = CloudServicesLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "got iCloud env", v8, 2u);
    }
  }
  else
  {
    int v6 = CloudServicesLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10004A030(v6);
    }
    unint64_t v5 = 0;
  }

  return v5;
}

void sub_100011208(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [v4 objectForKeyedSubscript:@"class"];
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (!v6)
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
  unint64_t v7 = [v4 objectForKeyedSubscript:@"data"];
  if (v7)
  {
    [v6 addObject:v7];
  }
  else
  {
    char v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10004A074();
    }
  }
}

void sub_100011A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100011AB0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100011AC0(uint64_t a1)
{
}

void sub_100011AC8(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) kvs];
  uint64_t v3 = *(void **)(a1 + 32);
  id v15 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100011C48;
  void v13[3] = &unk_1000711A0;
  v13[4] = v3;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v12;
  long long v14 = v12;
  unsigned __int8 v5 = [v3 backupWithRegisteredBackupsWithError:&v15 handler:v13];
  id v6 = v15;
  [v2 removeObjectForKey:@"com.apple.icdp.backup"];
  [*(id *)(a1 + 32) doSynchronize];
  if ((v5 & 1) == 0)
  {
    unint64_t v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10004A1B4();
    }

    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    [v8 setObject:v6 forKeyedSubscript:NSUnderlyingErrorKey];
    uint64_t v9 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

void sub_100011C48(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _pushCachedKeychainToKVSForView:v7 recordID:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_10001207C(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  [*(id *)(a1 + 32) allViews];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = *(void **)(a1 + 32);
        uint64_t v11 = objc_msgSend(v10, "kvs", (void)v15);
        long long v12 = [v10 _getICDPBackupFromKVS:v11 forView:v8];

        if (v12) {
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
        else {
          [v2 addObject:v8];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v5);
  }

  if ([v2 count])
  {
    uint64_t v13 = CloudServicesLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = [v2 componentsJoinedByString:@" "];
      *(_DWORD *)buf = 138412290;
      long long v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "views with no backup: %@", buf, 0xCu);
    }
  }
}

void sub_100013924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100013948(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) copyMyPeerID];
  id v3 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 56))
  {
    id v4 = [v3 _consumeFullBackupForRecordID:v2];
    if (v4) {
      goto LABEL_6;
    }
    uint64_t v5 = [*(id *)(a1 + 32) _pushCachedKeychainToKVS];
  }
  else
  {
    uint64_t v5 = [v3 _consumeBackupJournal];
  }
  id v4 = (void *)v5;
LABEL_6:
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v4);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  uint64_t v9 = CloudServicesLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "backup complete", v10, 2u);
  }
}

void sub_100013BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100013BD8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) copyMyPeerID];
  id v3 = *(void **)(a1 + 32);
  id v36 = 0;
  unsigned int v4 = [v3 backupWithRegisteredBackupViewWithError:@"iCloudIdentity-tomb" error:&v36];
  id v5 = v36;
  uint64_t v6 = CloudServicesLog();
  uint64_t v7 = v6;
  if (v4) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v38 = @"iCloudIdentity-tomb";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_backupCloudIdentityKeychainViewAndPushToKVS: registered view: %@", buf, 0xCu);
    }

    long long v17 = [*(id *)(a1 + 32) _consumeViewBackup:@"iCloudIdentity-tomb" recordID:v2];
    long long v18 = CloudServicesLog();
    uint64_t v19 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10004A2EC(v19, v20, v21, v22, v23, v24, v25, v26);
      }

      uint64_t v27 = *(void *)(*(void *)(a1 + 40) + 8);
      v28 = *(void **)(v27 + 40);
      *(void *)(v27 + 40) = 0;
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "_backupCloudIdentityKeychainViewAndPushToKVS: Pushing iCloudIdentity view to KVS!", buf, 2u);
      }

      v28 = [*(id *)(a1 + 32) _pushCachedKeychainToKVSForView:@"iCloudIdentity-tomb" recordID:v2];
      uint64_t v29 = CloudServicesLog();
      v30 = v29;
      if (v28)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_10004A284();
        }

        uint64_t v31 = *(void *)(*(void *)(a1 + 40) + 8);
        v32 = *(NSObject **)(v31 + 40);
        *(void *)(v31 + 40) = 0;
      }
      else
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "_backupCloudIdentityKeychainViewAndPushToKVS: successfully pushed iCloudIdentity to KVS", buf, 2u);
        }

        v33 = CloudServicesLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v38 = @"YES";
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "_backupCloudIdentityKeychainViewAndPushToKVS: backup succeeded? %@", buf, 0xCu);
        }

        uint64_t v34 = *(void *)(*(void *)(a1 + 40) + 8);
        v35 = *(void **)(v34 + 40);
        *(void *)(v34 + 40) = 0;

        v32 = CloudServicesLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v38 = @"iCloudIdentity-tomb";
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "_backupCloudIdentityKeychainViewAndPushToKVS: backup for %@ complete", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10004A364(v7, v9, v10, v11, v12, v13, v14, v15);
    }

    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0;
  }
}

void sub_1000148CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose((const void *)(v57 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_10001495C(void *a1, unsigned int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = CloudServicesLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (a2 > 3) {
      uint64_t v10 = "unknown";
    }
    else {
      uint64_t v10 = off_1000719D8[a2];
    }
    *(_DWORD *)buf = 136315138;
    v42 = (void *)v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_consumeViewBackup: got backup manifest event: %s", buf, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  switch(a2)
  {
    case 0u:
      ++*(_DWORD *)(*(void *)(a1[7] + 8) + 24);
      uint64_t v12 = *(void **)(*(void *)(a1[8] + 8) + 40);
      if (!v12)
      {
        uint64_t v13 = [[SecureBackupViewStore alloc] initWithViewName:a1[4] recordID:a1[5]];
        uint64_t v14 = *(void *)(a1[8] + 8);
        uint64_t v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v13;

        uint64_t v12 = *(void **)(*(void *)(a1[8] + 8) + 40);
      }
      uint64_t v16 = *(void *)(a1[9] + 8);
      long long v18 = *(void **)(v16 + 40);
      long long v17 = (id *)(v16 + 40);
      v40 = v18;
      unsigned __int8 v19 = [v12 resetWithKeybag:v7 error:&v40];
      id v20 = v40;
      goto LABEL_19;
    case 1u:
      ++*(_DWORD *)(*(void *)(a1[10] + 8) + 24);
      uint64_t v22 = *(void **)(*(void *)(a1[8] + 8) + 40);
      if (!v22)
      {
        uint64_t v23 = [[SecureBackupViewStore alloc] initWithViewName:a1[4] recordID:a1[5]];
        uint64_t v24 = *(void *)(a1[8] + 8);
        uint64_t v25 = *(void **)(v24 + 40);
        *(void *)(v24 + 40) = v23;

        uint64_t v22 = *(void **)(*(void *)(a1[8] + 8) + 40);
      }
      uint64_t v26 = *(void *)(a1[9] + 8);
      uint64_t v27 = *(void **)(v26 + 40);
      long long v17 = (id *)(v26 + 40);
      v39 = v27;
      unsigned __int8 v19 = [v22 addItem:v8 error:&v39];
      id v20 = v39;
      goto LABEL_19;
    case 2u:
      ++*(_DWORD *)(*(void *)(a1[11] + 8) + 24);
      v28 = *(void **)(*(void *)(a1[8] + 8) + 40);
      if (!v28)
      {
        uint64_t v29 = [[SecureBackupViewStore alloc] initWithViewName:a1[4] recordID:a1[5]];
        uint64_t v30 = *(void *)(a1[8] + 8);
        uint64_t v31 = *(void **)(v30 + 40);
        *(void *)(v30 + 40) = v29;

        v28 = *(void **)(*(void *)(a1[8] + 8) + 40);
      }
      uint64_t v32 = *(void *)(a1[9] + 8);
      v33 = *(void **)(v32 + 40);
      long long v17 = (id *)(v32 + 40);
      id obj = v33;
      unsigned __int8 v19 = [v28 removeItemWithKey:v7 error:&obj];
      id v20 = obj;
LABEL_19:
      objc_storeStrong(v17, v20);
      if (v19) {
        goto LABEL_23;
      }
      uint64_t v34 = CloudServicesLog();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      v35 = off_1000719D8[a2];
      *(_DWORD *)buf = 136315138;
      v42 = v35;
      id v36 = "_consumeViewBackup: event %s unsuccessful";
      break;
    case 3u:
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
      goto LABEL_23;
    default:
      uint64_t v21 = CloudServicesLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10004A3DC();
      }

LABEL_23:
      uint64_t v34 = CloudServicesLog();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      if (a2 > 3) {
        v37 = "unknown";
      }
      else {
        v37 = off_1000719D8[a2];
      }
      *(_DWORD *)buf = 136315138;
      v42 = (void *)v37;
      id v36 = "_consumeViewBackup: event %s successful!";
      break;
  }
  _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v36, buf, 0xCu);
LABEL_29:
}

void sub_100014FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015010(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v8 = v3;
    uint64_t v5 = [*(id *)(a1 + 32) _consumeViewBackup:v8 recordID:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v3 = v8;
  }
}

void sub_100015384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000153C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1 + 48;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v6 = CloudServicesLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "consuming backup for view %@", (uint8_t *)&buf, 0xCu);
    }

    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x2020000000;
    char v69 = 1;
    v66[0] = 0;
    v66[1] = v66;
    v66[2] = 0x2020000000;
    char v67 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v79 = 0x3032000000;
    v80 = sub_100011AB0;
    v81 = sub_100011AC0;
    id v82 = 0;
    uint64_t v62 = 0;
    v63 = &v62;
    uint64_t v64 = 0x2020000000;
    int v65 = 0;
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2020000000;
    int v61 = 0;
    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x2020000000;
    int v57 = 0;
    id v7 = *(void **)(a1 + 32);
    id v53 = 0;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100015B24;
    v43[3] = &unk_100071290;
    v46 = v68;
    v47 = v66;
    v48 = &v62;
    p_long long buf = &buf;
    id v8 = v3;
    id v44 = v8;
    id v45 = *(id *)(a1 + 40);
    long long v50 = *(_OWORD *)(a1 + 48);
    v51 = &v58;
    v52 = &v54;
    unsigned int v9 = [v7 backupWithChanges:v8 error:&v53 handler:v43];
    id v10 = v53;
    uint64_t v11 = CloudServicesLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = "false";
      if (v9) {
        uint64_t v12 = "true";
      }
      int v13 = *((_DWORD *)v63 + 6);
      int v14 = *((_DWORD *)v59 + 6);
      int v15 = *((_DWORD *)v55 + 6);
      *(_DWORD *)v70 = 136315906;
      v71 = v12;
      __int16 v72 = 1024;
      int v73 = v13;
      __int16 v74 = 1024;
      int v75 = v14;
      __int16 v76 = 1024;
      int v77 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SecItemBackupWithChanges() returned %s (%d reset, %d add, %d remove)", v70, 0x1Eu);
    }

    uint64_t v16 = *(void **)(*((void *)&buf + 1) + 40);
    if (v16)
    {
      long long v17 = [v16 manifestHash];
      long long v18 = [*(id *)(*((void *)&buf + 1) + 40) keybagDigest];
      [*(id *)(*((void *)&buf + 1) + 40) closeStore];
      unsigned __int8 v19 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = 0;

      if (v9) {
        goto LABEL_10;
      }
    }
    else
    {
      long long v17 = 0;
      long long v18 = 0;
      if (v9)
      {
LABEL_10:
        if (*(void *)(*(void *)(*(void *)v4 + 8) + 40))
        {
          id v20 = CloudServicesLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_10004A514();
          }

          uint64_t v21 = +[CloudServicesAnalytics logger];
          [v21 logUnrecoverableError:*(void *)(*(void *)(*(void *)v4 + 8) + 40) forEvent:CloudServicesAnalyticsBackupWithChangesIncremental withAttributes:0];

          uint64_t v22 = objc_alloc_init((Class)NSMutableDictionary);
          [v22 setObject:*(void *)(*(void *)(*(void *)v4 + 8) + 40) forKeyedSubscript:NSUnderlyingErrorKey];
          uint64_t v23 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v22];
          uint64_t v24 = *(void *)(*(void *)v4 + 8);
          uint64_t v25 = *(void **)(v24 + 40);
          *(void *)(v24 + 40) = v23;
        }
        else
        {
          v28 = +[CloudServicesAnalytics logger];
          [v28 logSuccessForEvent:CloudServicesAnalyticsBackupWithChangesIncremental];

          if (!v18 || !v17) {
            goto LABEL_29;
          }
          uint64_t v29 = *(void **)(a1 + 32);
          uint64_t v30 = *(void *)(*(void *)(a1 + 48) + 8);
          id obj = *(id *)(v30 + 40);
          unsigned __int8 v31 = [v29 backupSetConfirmedManifest:v8 digest:v18 manifest:v17 error:&obj];
          objc_storeStrong((id *)(v30 + 40), obj);
          if (v31)
          {
            uint64_t v22 = +[CloudServicesAnalytics logger];
            [v22 logSuccessForEvent:CloudServicesAnalyticsSetConfirmedManifest];
          }
          else
          {
            v37 = +[CloudServicesAnalytics logger];
            [v37 logUnrecoverableError:*(void *)(*(void *)(*(void *)v4 + 8) + 40) forEvent:CloudServicesAnalyticsSetConfirmedManifest withAttributes:0];

            CFStringRef v38 = CloudServicesLog();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
              sub_10004A4AC();
            }

            uint64_t v22 = objc_alloc_init((Class)NSMutableDictionary);
            [v22 setObject:*(void *)(*(void *)(*(void *)v4 + 8) + 40) forKeyedSubscript:NSUnderlyingErrorKey];
            uint64_t v39 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v22];
            uint64_t v40 = *(void *)(*(void *)v4 + 8);
            v41 = *(void **)(v40 + 40);
            *(void *)(v40 + 40) = v39;
          }
        }
LABEL_28:

LABEL_29:
        _Block_object_dispose(&v54, 8);
        _Block_object_dispose(&v58, 8);
        _Block_object_dispose(&v62, 8);
        _Block_object_dispose(&buf, 8);

        _Block_object_dispose(v66, 8);
        _Block_object_dispose(v68, 8);

        goto LABEL_30;
      }
    }
    if (v10)
    {
      uint64_t v26 = [v10 domain];
      if ([v26 isEqualToString:NSPOSIXErrorDomain])
      {
        BOOL v27 = [v10 code] == (id)2;

        if (v27)
        {
          uint64_t v22 = CloudServicesLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_10004A5F0();
          }
          goto LABEL_28;
        }
      }
      else
      {
      }
    }
    uint64_t v32 = +[CloudServicesAnalytics logger];
    [v32 logUnrecoverableError:v10 forEvent:CloudServicesAnalyticsBackupWithChangesIncremental withAttributes:0];

    v33 = CloudServicesLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_10004A57C();
    }

    uint64_t v22 = objc_alloc_init((Class)NSMutableDictionary);
    [v22 setObject:v10 forKeyedSubscript:NSUnderlyingErrorKey];
    uint64_t v34 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v22];
    uint64_t v35 = *(void *)(*(void *)v4 + 8);
    id v36 = *(void **)(v35 + 40);
    *(void *)(v35 + 40) = v34;

    goto LABEL_28;
  }
LABEL_30:
}

void sub_100015AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_100015B24(void *a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
    switch(a2)
    {
      case 0:
        ++*(_DWORD *)(*(void *)(a1[8] + 8) + 24);
        id v10 = *(void **)(*(void *)(a1[9] + 8) + 40);
        if (!v10)
        {
          uint64_t v11 = [[SecureBackupViewStore alloc] initWithViewName:a1[4] recordID:a1[5]];
          uint64_t v12 = *(void *)(a1[9] + 8);
          int v13 = *(void **)(v12 + 40);
          *(void *)(v12 + 40) = v11;

          id v10 = *(void **)(*(void *)(a1[9] + 8) + 40);
        }
        uint64_t v14 = *(void *)(a1[10] + 8);
        id obj = *(id *)(v14 + 40);
        unsigned __int8 v15 = [v10 resetWithKeybag:v7 error:&obj];
        objc_storeStrong((id *)(v14 + 40), obj);
        *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v15;
        uint64_t v16 = a1[11];
        goto LABEL_17;
      case 1:
        ++*(_DWORD *)(*(void *)(a1[12] + 8) + 24);
        long long v18 = *(void **)(*(void *)(a1[9] + 8) + 40);
        if (!v18)
        {
          unsigned __int8 v19 = [[SecureBackupViewStore alloc] initWithViewName:a1[4] recordID:a1[5]];
          uint64_t v20 = *(void *)(a1[9] + 8);
          uint64_t v21 = *(void **)(v20 + 40);
          *(void *)(v20 + 40) = v19;

          long long v18 = *(void **)(*(void *)(a1[9] + 8) + 40);
        }
        uint64_t v22 = *(void *)(a1[10] + 8);
        uint64_t v24 = *(void **)(v22 + 40);
        uint64_t v23 = (id *)(v22 + 40);
        uint64_t v34 = v24;
        unsigned __int8 v25 = [v18 addItem:v8 error:&v34];
        id v26 = v34;
        goto LABEL_15;
      case 2:
        ++*(_DWORD *)(*(void *)(a1[13] + 8) + 24);
        BOOL v27 = *(void **)(*(void *)(a1[9] + 8) + 40);
        if (!v27)
        {
          v28 = [[SecureBackupViewStore alloc] initWithViewName:a1[4] recordID:a1[5]];
          uint64_t v29 = *(void *)(a1[9] + 8);
          uint64_t v30 = *(void **)(v29 + 40);
          *(void *)(v29 + 40) = v28;

          BOOL v27 = *(void **)(*(void *)(a1[9] + 8) + 40);
        }
        uint64_t v31 = *(void *)(a1[10] + 8);
        uint64_t v32 = *(void **)(v31 + 40);
        uint64_t v23 = (id *)(v31 + 40);
        id v33 = v32;
        unsigned __int8 v25 = [v27 removeItemWithKey:v7 error:&v33];
        id v26 = v33;
LABEL_15:
        objc_storeStrong(v23, v26);
        *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v25;
        break;
      case 3:
        uint64_t v16 = a1[7];
LABEL_17:
        *(unsigned char *)(*(void *)(v16 + 8) + 24) = 1;
        break;
      default:
        long long v17 = CloudServicesLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10004A658();
        }

        break;
    }
  }
}

id sub_1000164CC(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 16) == 3) {
    return [*(id *)(a1 + 32) _stateCapture];
  }
  else {
    return 0;
  }
}

void sub_1000165F8(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (xpc_get_type(xdict) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
    if (string)
    {
      uint64_t v4 = string;
      uint64_t v6 = *(void **)(a1 + 32);
      id v7 = +[NSString stringWithUTF8String:v4];
      [v6 handleNotification:v7];
    }
  }
}

void sub_100016920(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = [v5 objectForKeyedSubscript:@"com.apple.securebackup.keychain"];
  id v8 = [v5 objectForKeyedSubscript:kSecureBackupTimestampKey];

  [v6 setObject:v8 forKeyedSubscript:@"timestamp"];
  unsigned int v9 = [v7 objectForKeyedSubscript:@"recordID"];
  [v6 setObject:v9 forKeyedSubscript:@"creator"];

  id v10 = [v7 objectForKeyedSubscript:@"keybag"];
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 peersAndBackupKeyDigests];
    [v6 setObject:v12 forKeyedSubscript:@"peerIDs"];

    int v13 = [v11 recoveryKey];
    uint64_t v14 = [v13 sha1Digest];
    [v6 setObject:v14 forKeyedSubscript:@"rk"];

    id v15 = v16;
  }
  else
  {
    id v15 = [objc_alloc((Class)NSString) initWithFormat:@"%@ (direct keybag)", v16];
    int v13 = v16;
  }

  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v15];
  if ([*(id *)(a1 + 32) count]) {
    [*(id *)(a1 + 40) setObject:*(void *)(a1 + 32) forKeyedSubscript:@"backups"];
  }
}

void sub_10001758C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000175AC(uint64_t a1)
{
  id v2 = CloudServicesLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "in dispatch_after()", v5, 2u);
  }

  [*(id *)(a1 + 32) notificationOccurred:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setPendingNotification:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void sub_1000178EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Backup returned %@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100018608(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "getAccountInfoWithRequest: in daemon came back", buf, 2u);
  }

  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  if (v6)
  {
    unsigned int v9 = CloudServicesLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v229 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "escrowService getAccountInfoWithRequest: returned %@", buf, 0xCu);
    }

    id v10 = CloudServicesLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v6 code];
      *(_DWORD *)long long buf = 134217984;
      id v229 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "getAccountInfoWithRequest: error: %ld", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_192;
  }
  uint64_t v12 = [v5 objectForKeyedSubscript:@"EscrowServiceAccountInfo"];
  int v13 = CloudServicesLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v12 count];
    *(_DWORD *)long long buf = 134217984;
    id v229 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "got %lu records", buf, 0xCu);
  }

  id v15 = objc_alloc_init((Class)NSMutableArray);
  id v186 = objc_alloc_init((Class)NSMutableDictionary);
  long long v222 = 0u;
  long long v223 = 0u;
  long long v224 = 0u;
  long long v225 = 0u;
  id v16 = v12;
  v170 = v8;
  id v181 = v16;
  uint64_t v182 = a1;
  id v195 = [v16 countByEnumeratingWithState:&v222 objects:v240 count:16];
  id v144 = v5;
  if (!v195)
  {
    id v6 = 0;
    __int16 v76 = 0;
    long long v17 = 0;
LABEL_100:

    goto LABEL_102;
  }
  v160 = v15;
  long long v17 = 0;
  v183 = 0;
  v148 = 0;
  uint64_t v193 = *(void *)v223;
  uint64_t v192 = kEscrowServiceRecordLabelKey;
  uint64_t v194 = kEscrowServiceRecordMetadataKey;
  uint64_t v198 = kSecureBackupKeybagSHA256Key;
  uint64_t v197 = kSecureBackupKeybagDigestKey;
  uint64_t v196 = kSecureBackupTimestampKey;
  uint64_t v191 = kEscrowServiceRecordStatusKey;
  v190 = (void *)kEscrowServiceStingrayLabel;
  v180 = (void *)kEscrowServiceGuitarfishLabel;
  uint64_t v159 = kEscrowServiceGuitarfishTokenLabel;
  uint64_t v178 = kSecureBackupFederationKey;
  uint64_t v177 = kSecureBackupExpectedFederationKey;
  uint64_t v176 = kSecureBackupRemainingAttemptsKey;
  uint64_t v145 = kSecureBackupGuitarfishRecoveryTokenMetadataKey;
  uint64_t v165 = kSecureBackupEscrowDateKey;
  uint64_t v158 = kSecureBackupRecordLabelKey;
  uint64_t v157 = kSecureBackupSerialNumberKey;
  uint64_t v156 = kSecureBackupBuildVersionKey;
  uint64_t v146 = kSecureBackupPeerInfoDataKey;
  uint64_t v155 = kSecureBackupBottleIDKey;
  uint64_t v154 = kSecureBackupPeerInfoSerialNumberKey;
  uint64_t v153 = kSecureBackupPeerInfoOSVersionKey;
  uint64_t v168 = kSecureBackupRecordStatusValid;
  uint64_t v167 = kSecureBackupRecordStatusKey;
  uint64_t v166 = kSecureBackupRecordStatusInvalid;
  uint64_t v164 = kSecureBackupEscrowTimestampKey;
  uint64_t v163 = kSecureBackupEscrowDigestKey;
  uint64_t v162 = kSecureBackupMetadataKey;
  uint64_t v179 = kEscrowServiceRecordStatusValid;
  uint64_t v169 = kSecureBackupContainsiCloudIdentityKey;
  uint64_t v174 = kSecureBackupTriggerUpdateKey;
  uint64_t v173 = kSecureBackupStingrayMetadataKey;
  uint64_t v172 = kSecureBackupBackOffDateKey;
  uint64_t v171 = kSecureBackupEncodedMetadataKey;
  uint64_t v175 = kSecureBackupStingrayMetadataHashKey;
  uint64_t v152 = kSecureBackupRecordIDKey;
  do
  {
    long long v18 = 0;
    do
    {
      if (*(void *)v223 != v193) {
        objc_enumerationMutation(v16);
      }
      unsigned __int8 v19 = *(void **)(*((void *)&v222 + 1) + 8 * (void)v18);
      uint64_t v20 = [v19 objectForKeyedSubscript:v192];
      uint64_t v21 = [v19 objectForKeyedSubscript:v194];

      v201 = [v21 objectForKeyedSubscript:v198];
      v207 = [v21 objectForKeyedSubscript:v197];
      v202 = [v21 objectForKeyedSubscript:v196];
      v205 = +[CSDateUtilities secureBackupDateFromString:](CSDateUtilities, "secureBackupDateFromString:");
      uint64_t v22 = [v19 objectForKeyedSubscript:v191];
      id v23 = v190;
      if ([*(id *)(a1 + 32) guitarfish])
      {
        id v24 = v180;
        unsigned __int8 v25 = v23;
        id v23 = v24;
      }
      v203 = v20;
      v200 = v22;
      v199 = v23;
      if ([v20 isEqualToString:v23])
      {
        if ([v22 isEqualToString:v179]) {
          [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:v169];
        }
        if (v21)
        {
          id v26 = [v21 mutableCopy];
          BOOL v27 = [v19 objectForKeyedSubscript:v174];
          [v26 setObject:v27 forKeyedSubscript:v174];

          v28 = [v19 objectForKeyedSubscript:@"federationID"];
          [v26 setObject:v28 forKeyedSubscript:v178];

          uint64_t v29 = [v19 objectForKeyedSubscript:@"expectedFederationID"];
          [v26 setObject:v29 forKeyedSubscript:v177];

          uint64_t v30 = [v19 objectForKeyedSubscript:v176];
          [v26 setObject:v30 forKeyedSubscript:v176];

          [v8 setObject:v26 forKeyedSubscript:v173];
          uint64_t v31 = [v21 objectForKeyedSubscript:v172];
          [v8 setObject:v31 forKeyedSubscript:v172];
          id v32 = objc_alloc_init((Class)NSMutableDictionary);
          id v33 = [v19 objectForKeyedSubscript:@"encodedMetadata"];
          [v32 setObject:v33 forKeyedSubscript:v171];

          [v32 setObject:v202 forKeyedSubscript:v196];
          [v32 setObject:v201 forKeyedSubscript:v198];
          [v32 setObject:v207 forKeyedSubscript:v197];
          [v32 setObject:v31 forKeyedSubscript:v172];
          [v8 setObject:v32 forKeyedSubscript:v175];

          goto LABEL_23;
        }
      }
      else
      {
        if ([v20 isEqualToString:@"com.apple.protectedcloudstorage.record.double"])
        {
          uint64_t v37 = [v19 objectForKeyedSubscript:@"encodedMetadata"];

          uint64_t v34 = 0;
          uint64_t v35 = 0;
          id v36 = 0;
          long long v17 = v21;
          v183 = (void *)v37;
          goto LABEL_66;
        }
        if ([v20 isEqualToString:@"com.apple.securebackup.record"])
        {
          if ([v22 isEqualToString:@"invalid"]) {
            uint64_t v38 = v166;
          }
          else {
            uint64_t v38 = v168;
          }
          [v8 setObject:v38 forKeyedSubscript:v167];
          if (v21)
          {
            if (v202) {
              CFStringRef v39 = v202;
            }
            else {
              CFStringRef v39 = @"UNKNOWN";
            }
            [v8 setObject:v39 forKeyedSubscript:v164];
            if (v207) {
              CFStringRef v40 = v207;
            }
            else {
              CFStringRef v40 = @"UNKNOWN";
            }
            [v8 setObject:v40 forKeyedSubscript:v163];
            long long v17 = [*(id *)(a1 + 40) massageIncomingMetadataFromInfo:v21];

            if (v17) {
              v41 = v17;
            }
            else {
              v41 = &__NSDictionary0__struct;
            }
            [v8 setObject:v41 forKeyedSubscript:v162];
            [v8 setObject:v205 forKeyedSubscript:v165];
            goto LABEL_65;
          }
        }
        else
        {
          if ([v20 hasPrefix:@"com.apple.icdp.record.double"])
          {
            v42 = CloudServicesLog();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              id v229 = v20;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "ignoring old double enrollment record: %@", buf, 0xCu);
            }
LABEL_89:

            goto LABEL_24;
          }
          if ([v20 hasPrefix:@"com.apple.icdp.record"]
            && [v20 hasSuffix:@".double"])
          {
            id v26 = [*(id *)(a1 + 40) _recordIDFromLabel:v20 withPrefix:@"com.apple.icdp.record" suffix:@".double"];
            uint64_t v43 = [v19 objectForKeyedSubscript:@"encodedMetadata"];
            id v44 = (void *)v43;
            if (v26 && v43) {
              [v186 setObject:v43 forKeyedSubscript:v26];
            }

LABEL_23:
LABEL_24:
            uint64_t v34 = 0;
            uint64_t v35 = 0;
            id v36 = 0;
LABEL_25:
            long long v17 = v21;
            goto LABEL_66;
          }
          if ([v20 hasPrefix:@"com.apple.icdp.record"])
          {
            id v45 = [v19 mutableCopy];
            [v45 setObject:v205 forKeyedSubscript:v165];
            v46 = [*(id *)(a1 + 40) _recordIDFromLabel:v20 withPrefix:@"com.apple.icdp.record" suffix:0];
            [v45 setObject:v46 forKeyedSubscript:v152];

            v187 = v45;
            [v45 setObject:@"com.apple.icdp.record" forKeyedSubscript:v158];
            uint64_t v34 = [v21 objectForKeyedSubscript:v157];
            uint64_t v47 = [v21 objectForKeyedSubscript:v156];
            uint64_t v35 = (__CFString *)v47;
            if (!v34 || !v47)
            {
              v48 = [v21 objectForKeyedSubscript:v146];
              if (v48)
              {
                v49 = *(void **)(a1 + 40);
                id v221 = v148;
                uint64_t v50 = [v49 createPeerInfoFromData:v48 error:&v221];
                id v147 = v221;

                v149 = (void *)v50;
                if (v50)
                {
                  if (!v34) {
                    uint64_t v34 = (__CFString *)[*(id *)(a1 + 40) copySerialNumber:v50];
                  }
                  id v51 = v147;
                  if (!v35) {
                    uint64_t v35 = (__CFString *)[*(id *)(a1 + 40) copyOSVersion:v149];
                  }
                }
                else
                {
                  int v73 = CloudServicesLog();
                  id v51 = v147;
                  if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)long long buf = 138412290;
                    id v229 = v147;
                    _os_log_error_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "could not create peer info from data: %@", buf, 0xCu);
                  }
                }
                v148 = v51;
              }
            }
            __int16 v74 = [v187 objectForKeyedSubscript:v194];
            id v36 = [v74 objectForKeyedSubscript:v155];

            [v187 setObject:v34 forKeyedSubscript:v154];
            [v187 setObject:v35 forKeyedSubscript:v153];
            [v160 addObject:v187];

            goto LABEL_25;
          }
          if (![v20 isEqualToString:v159])
          {
            v42 = CloudServicesLog();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              id v229 = v20;
              _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "unexpected label: %@", buf, 0xCu);
            }
            goto LABEL_89;
          }
          if (v21)
          {
            id v26 = [v21 mutableCopy];
            v52 = [v19 objectForKeyedSubscript:@"federationID"];
            [v26 setObject:v52 forKeyedSubscript:v178];

            id v53 = [v19 objectForKeyedSubscript:@"expectedFederationID"];
            [v26 setObject:v53 forKeyedSubscript:v177];

            uint64_t v54 = [v19 objectForKeyedSubscript:v176];
            [v26 setObject:v54 forKeyedSubscript:v176];

            [v8 setObject:v26 forKeyedSubscript:v145];
            goto LABEL_23;
          }
        }
      }
      long long v17 = 0;
LABEL_65:
      uint64_t v34 = 0;
      uint64_t v35 = 0;
      id v36 = 0;
LABEL_66:
      int v55 = sub_100004254();
      uint64_t v56 = CloudServicesLog();
      BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
      if (v55)
      {
        if (v57)
        {
          CFStringRef v58 = &stru_100072CF8;
          if (v34) {
            CFStringRef v59 = v34;
          }
          else {
            CFStringRef v59 = &stru_100072CF8;
          }
          uint64_t v60 = [(__CFString *)v207 hexString];
          if (v36) {
            CFStringRef v61 = v36;
          }
          else {
            CFStringRef v61 = @"(no bottle ID)";
          }
          if (v35) {
            CFStringRef v58 = v35;
          }
          +[CSDateUtilities localStringFromDate:v205];
          v188 = v18;
          uint64_t v62 = v35;
          v63 = v34;
          uint64_t v64 = v17;
          id v65 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)long long buf = 138413570;
          id v229 = v203;
          __int16 v230 = 2112;
          CFStringRef v231 = v59;
          id v8 = v170;
          __int16 v232 = 2112;
          CFStringRef v233 = v60;
          __int16 v234 = 2112;
          CFStringRef v235 = v61;
          __int16 v236 = 2112;
          CFStringRef v237 = v58;
          id v16 = v181;
          a1 = v182;
          __int16 v238 = 2112;
          id v239 = v65;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%@ %@ %@ %@ %@ %@", buf, 0x3Eu);

          long long v17 = v64;
          uint64_t v34 = v63;
          uint64_t v35 = v62;
          long long v18 = v188;
        }
      }
      else if (v57)
      {
        [(__CFString *)v207 hexString];
        v189 = v18;
        v66 = v34;
        id v67 = v8;
        v68 = v17;
        char v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v36) {
          CFStringRef v70 = v36;
        }
        else {
          CFStringRef v70 = @"(no bottle ID)";
        }
        if (v35) {
          CFStringRef v71 = v35;
        }
        else {
          CFStringRef v71 = &stru_100072CF8;
        }
        __int16 v72 = +[CSDateUtilities localStringFromDate:v205];
        *(_DWORD *)long long buf = 138413314;
        id v229 = v203;
        __int16 v230 = 2112;
        CFStringRef v231 = v69;
        __int16 v232 = 2112;
        CFStringRef v233 = v70;
        __int16 v234 = 2112;
        CFStringRef v235 = v71;
        id v16 = v181;
        a1 = v182;
        __int16 v236 = 2112;
        CFStringRef v237 = v72;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%@ %@ %@ %@ %@", buf, 0x34u);

        long long v17 = v68;
        id v8 = v67;
        uint64_t v34 = v66;
        long long v18 = v189;
      }
      long long v18 = (char *)v18 + 1;
    }
    while (v195 != v18);
    id v75 = [v16 countByEnumeratingWithState:&v222 objects:v240 count:16];
    id v195 = v75;
  }
  while (v75);

  __int16 v76 = v183;
  if (v183)
  {
    id v16 = [v8 objectForKeyedSubscript:v175];
    [v16 setObject:v183 forKeyedSubscript:@"duplicateEncodedMetadata"];
    id v5 = v144;
    id v6 = v148;
    id v15 = v160;
    goto LABEL_100;
  }
  id v5 = v144;
  id v6 = v148;
  id v15 = v160;
LABEL_102:
  v208 = v17;
  if ([v186 count])
  {
    v184 = v76;
    id v150 = v6;
    int v77 = [v186 allKeys];
    [v8 setObject:v77 forKeyedSubscript:kSecureBackupiCDPDoubleEnrollmentRecordIDsKey];

    long long v219 = 0u;
    long long v220 = 0u;
    long long v218 = 0u;
    long long v217 = 0u;
    id v78 = v15;
    id v79 = v15;
    id v80 = [v79 countByEnumeratingWithState:&v217 objects:v227 count:16];
    if (v80)
    {
      id v81 = v80;
      uint64_t v82 = *(void *)v218;
      uint64_t v83 = kSecureBackupRecordIDKey;
      do
      {
        for (i = 0; i != v81; i = (char *)i + 1)
        {
          if (*(void *)v218 != v82) {
            objc_enumerationMutation(v79);
          }
          v85 = *(void **)(*((void *)&v217 + 1) + 8 * i);
          v86 = [v85 objectForKeyedSubscript:v83];
          v87 = [v186 objectForKeyedSubscript:v86];
          [v85 setObject:v87 forKeyedSubscript:@"duplicateEncodedMetadata"];
        }
        id v81 = [v79 countByEnumeratingWithState:&v217 objects:v227 count:16];
      }
      while (v81);
    }

    id v5 = v144;
    id v8 = v170;
    a1 = v182;
    __int16 v76 = v184;
    id v6 = v150;
    id v15 = v78;
  }
  if ([v15 count] && (objc_msgSend(*(id *)(a1 + 32), "excludeiCDPRecords") & 1) == 0)
  {
    [v8 setObject:v15 forKeyedSubscript:kSecureBackupAlliCDPRecordsKey];
    if (_os_feature_enabled_impl()) {
      unsigned int v88 = [*(id *)(a1 + 32) sosCompatibleEscrowSorting];
    }
    else {
      unsigned int v88 = 0;
    }
    if (([*(id *)(a1 + 32) stingray] & 1) != 0
      || (([*(id *)(a1 + 32) suppressServerFiltering] | v88) & 1) != 0)
    {
      v89 = CloudServicesLog();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "Skipping cuttlefish bottle sorting", buf, 2u);
      }
    }
    else
    {
      v89 = [*(id *)(a1 + 40) sortRecordsByBottleID:v15];
      id v90 = [v89 mutableCopy];

      id v15 = v90;
    }

    uint64_t v91 = kSecureBackupiCDPRecordsKey;
    [v8 setObject:v15 forKeyedSubscript:kSecureBackupiCDPRecordsKey];
    if (OctagonPlatformSupportsSOS())
    {
      v92 = [*(id *)(a1 + 40) filteriCDPRecords:v15];
      if ([v92 count])
      {
        [v8 setObject:v92 forKeyedSubscript:v91];
      }
      else
      {
        v93 = CloudServicesLog();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "filteriCDPRecords returned 0 SOS viable records.", buf, 2u);
        }

        if (_os_feature_enabled_impl()
          && [*(id *)(a1 + 32) sosCompatibleEscrowSorting])
        {
          v206 = v92;
          v185 = v76;
          id v161 = v15;
          id v151 = v6;
          v94 = CloudServicesLog();
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "since this is an SOS driven escrow record fetch, remove Octagon only escrow records before returning the entire list", buf, 2u);
          }

          v95 = +[NSMutableArray array];
          uint64_t v204 = v91;
          [v8 objectForKeyedSubscript:v91];
          long long v213 = 0u;
          long long v214 = 0u;
          long long v215 = 0u;
          long long v216 = 0u;
          id v96 = (id)objc_claimAutoreleasedReturnValue();
          id v97 = [v96 countByEnumeratingWithState:&v213 objects:v226 count:16];
          if (v97)
          {
            id v98 = v97;
            uint64_t v99 = *(void *)v214;
            uint64_t v100 = kEscrowServiceRecordMetadataKey;
            uint64_t v101 = kSecureBackupPeerInfoDataKey;
            do
            {
              for (j = 0; j != v98; j = (char *)j + 1)
              {
                if (*(void *)v214 != v99) {
                  objc_enumerationMutation(v96);
                }
                v103 = *(void **)(*((void *)&v213 + 1) + 8 * (void)j);
                v104 = [v103 objectForKeyedSubscript:v100];
                v105 = [v104 objectForKeyedSubscript:v101];

                if (v105) {
                  [v95 addObject:v103];
                }
              }
              id v98 = [v96 countByEnumeratingWithState:&v213 objects:v226 count:16];
            }
            while (v98);
          }

          v106 = CloudServicesLog();
          if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            id v229 = v95;
            _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "filtered out Octagon only records. new set of SOS records: %@", buf, 0xCu);
          }

          id v8 = v170;
          [v170 setObject:v95 forKeyedSubscript:v204];

          id v5 = v144;
          a1 = v182;
          __int16 v76 = v185;
          id v6 = v151;
          id v15 = v161;
          v92 = v206;
        }
        else
        {
          v107 = CloudServicesLog();
          if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "returning the entire list of iCDP records", buf, 2u);
          }
        }
      }
    }
  }
  if ((OctagonPlatformSupportsSOS() & 1) == 0 && (_os_feature_enabled_impl() & 1) == 0)
  {
    if ([v15 count]) {
      v135 = &__kCFBooleanTrue;
    }
    else {
      v135 = &__kCFBooleanFalse;
    }
    [v8 setObject:v135 forKeyedSubscript:kSecureBackupIsEnabledKey];
    [v8 setObject:&__kCFBooleanFalse forKeyedSubscript:kSecureBackupUsesRecoveryKeyKey];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    v134 = v181;
    goto LABEL_191;
  }
  unsigned int v108 = [*(id *)(a1 + 40) _backupEnabled];
  v109 = CloudServicesLog();
  BOOL v110 = os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT);
  if (!v108)
  {
    v134 = v181;
    if (v110)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "backup not enabled", buf, 2u);
    }

    [v8 setObject:&__kCFBooleanFalse forKeyedSubscript:kSecureBackupIsEnabledKey];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_191;
  }
  if (v110)
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "backup enabled", buf, 2u);
  }

  uint64_t v111 = kSecureBackupIsEnabledKey;
  [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecureBackupIsEnabledKey];
  v112 = *(void **)(a1 + 40);
  v113 = [v112 kvs];
  v114 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v112 hasRecoveryKeyInKVS:v113 error:0]);
  [v8 setObject:v114 forKeyedSubscript:kSecureBackupUsesRecoveryKeyKey];

  uint64_t v115 = v182;
  v116 = [*(id *)(v182 + 40) _getLastBackupTimestamp];
  if (v116)
  {
    v117 = +[CSDateUtilities secureBackupDateFromString:v116];
    if (v117) {
      [v8 setObject:v117 forKeyedSubscript:kSecureBackupLastBackupDateKey];
    }
    [v8 setObject:v116 forKeyedSubscript:kSecureBackupLastBackupTimestampKey];
  }
  if (![*(id *)(v182 + 40) _usesEscrow])
  {
LABEL_158:
    v122 = CloudServicesLog();
    if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "account does not use escrow", buf, 2u);
    }

    v123 = CloudServicesLog();
    if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v124 = [*(id *)(v115 + 40) _usesEscrow];
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v229) = v124;
      _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "account useEscrow: %d", buf, 8u);
    }

    v125 = CloudServicesLog();
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
    {
      v126 = [v170 objectForKeyedSubscript:kSecureBackupRecordStatusKey];
      *(_DWORD *)long long buf = 138412290;
      id v229 = v126;
      _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "account SecureBackup status: %@", buf, 0xCu);

      uint64_t v115 = v182;
    }

    v127 = CloudServicesLog();
    if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v128 = [v15 count];
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v229) = v128;
      _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "account iCDP records: %d", buf, 8u);
    }

    if (v116)
    {
      id v8 = v170;
      [v170 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecureBackupUsesRandomPassphraseKey];
      v129 = [*(id *)(v115 + 40) _metadata];
      v130 = v129;
      if (v129
        && (uint64_t v131 = kSecureBackupClientMetadataKey,
            [v129 objectForKeyedSubscript:kSecureBackupClientMetadataKey],
            v132 = objc_claimAutoreleasedReturnValue(),
            v132,
            v132))
      {
        v133 = [v130 objectForKeyedSubscript:v131];
        [v170 setObject:v133 forKeyedSubscript:kSecureBackupMetadataKey];
      }
      else
      {
        [v170 setObject:&__NSDictionary0__struct forKeyedSubscript:kSecureBackupMetadataKey];
      }

      uint64_t v115 = v182;
    }
    else
    {
      v136 = CloudServicesLog();
      id v8 = v170;
      if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR)) {
        sub_10004AA88();
      }

      [v170 setObject:&__kCFBooleanFalse forKeyedSubscript:v111];
    }
LABEL_189:
    (*(void (**)(void))(*(void *)(v115 + 56) + 16))();
    goto LABEL_190;
  }
  uint64_t v118 = kSecureBackupRecordStatusKey;
  v119 = [v170 objectForKeyedSubscript:kSecureBackupRecordStatusKey];
  v120 = v119;
  if (v119 == (void *)kSecureBackupRecordStatusValid)
  {

    uint64_t v115 = v182;
  }
  else
  {
    id v121 = [v15 count];

    uint64_t v115 = v182;
    if (!v121) {
      goto LABEL_158;
    }
  }
  v137 = CloudServicesLog();
  if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_DEFAULT, "account uses escrow", buf, 2u);
  }

  id v8 = v170;
  [v170 setObject:&__kCFBooleanFalse forKeyedSubscript:kSecureBackupUsesRandomPassphraseKey];
  [v170 setObject:&__kCFBooleanFalse forKeyedSubscript:kSecureBackupRecoveryRequiresVerificationTokenKey];
  [v170 setObject:&__kCFBooleanFalse forKeyedSubscript:kSecureBackupAccountIsHighSecurityKey];
  v138 = [v170 objectForKeyedSubscript:v118];

  if (!v138) {
    goto LABEL_189;
  }
  v139 = CloudServicesLog();
  if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEFAULT, "calling listSMSTargets: in daemon", buf, 2u);
  }

  v140 = *(void **)(v115 + 48);
  uint64_t v141 = *(void *)(v115 + 32);
  v209[0] = _NSConcreteStackBlock;
  v209[1] = 3221225472;
  v209[2] = sub_10001A1AC;
  v209[3] = &unk_1000713A8;
  id v142 = v170;
  uint64_t v143 = *(void *)(v115 + 40);
  id v210 = v142;
  uint64_t v211 = v143;
  id v212 = *(id *)(v115 + 56);
  [v140 listSMSTargetsWithRequest:v141 completionBlock:v209];

LABEL_190:
  v134 = v181;

LABEL_191:
LABEL_192:
}

void sub_10001A1AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "listSMSTargets: came back", (uint8_t *)&v19, 2u);
  }

  if (v6)
  {
    id v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "escrowService listSMSTargetsWithRequest: returned %@", (uint8_t *)&v19, 0xCu);
    }
  }
  unsigned int v9 = [v5 objectForKeyedSubscript:@"EscrowServiceSMSTargetInfo"];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 objectForKeyedSubscript:@"challengeDevices"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 count])
    {
      uint64_t v12 = [v11 objectAtIndexedSubscript:0];
      [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:kSecureBackupSMSTargetInfoKey];
    }
    uint64_t v13 = [v10 objectForKeyedSubscript:@"isHSAEnabled"];
    id v14 = (void *)v13;
    if (v13) {
      id v15 = (void *)v13;
    }
    else {
      id v15 = &__kCFBooleanFalse;
    }
    [*(id *)(a1 + 32) setObject:v15 forKeyedSubscript:kSecureBackupAccountIsHighSecurityKey];
    if ([*(id *)(a1 + 40) forceICDP])
    {
      [*(id *)(a1 + 32) setObject:&__kCFBooleanFalse forKeyedSubscript:kSecureBackupRecoveryRequiresVerificationTokenKey];
    }
    else
    {
      uint64_t v16 = [v10 objectForKeyedSubscript:@"recoveryRequiresChallengeCode"];
      long long v17 = (void *)v16;
      if (v16) {
        long long v18 = (void *)v16;
      }
      else {
        long long v18 = &__kCFBooleanFalse;
      }
      [*(id *)(a1 + 32) setObject:v18 forKeyedSubscript:kSecureBackupRecoveryRequiresVerificationTokenKey];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10001A5E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "getAccountInfoWithRequest: in daemon came back", buf, 2u);
  }

  if (!v6)
  {
    uint64_t v35 = a1;
    id v11 = objc_alloc_init((Class)CSStingrayAccountStatus);
    id v36 = v5;
    uint64_t v12 = [v5 objectForKeyedSubscript:@"EscrowServiceAccountInfo"];
    uint64_t v13 = CloudServicesLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v12 count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v47 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "got %lu records", buf, 0xCu);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v15 = v12;
    id v16 = [v15 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (!v16)
    {
LABEL_48:

      (*(void (**)(void))(*(void *)(v35 + 32) + 16))();
      id v6 = 0;
      id v5 = v36;
      goto LABEL_49;
    }
    id v17 = v16;
    uint64_t v18 = *(void *)v42;
    uint64_t v19 = kEscrowServiceRecordLabelKey;
    uint64_t v20 = kEscrowServiceStingrayLabel;
    uint64_t v37 = kEscrowServiceGuitarfishTokenLabel;
    uint64_t v38 = kEscrowServiceGuitarfishLabel;
LABEL_13:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v42 != v18) {
        objc_enumerationMutation(v15);
      }
      uint64_t v22 = *(void **)(*((void *)&v41 + 1) + 8 * v21);
      id v23 = objc_msgSend(v22, "objectForKeyedSubscript:", v19, v35);
      if ([v23 isEqualToString:v20])
      {
        id v40 = 0;
        id v24 = +[CSStingrayRecord parseFromAccountInfoPlist:v22 error:&v40];
        unsigned __int8 v25 = v40;
        [v11 setStingrayRecord:v24];

        if (v25)
        {
          id v26 = CloudServicesLog();
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
LABEL_23:

            goto LABEL_24;
          }
          *(_DWORD *)long long buf = 138412290;
          uint64_t v47 = v25;
          BOOL v27 = v26;
          v28 = "error parsing record: %@";
LABEL_44:
          _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, v28, buf, 0xCu);
          goto LABEL_23;
        }
      }
      else if ([v23 isEqualToString:v38])
      {
        id v39 = 0;
        uint64_t v29 = +[CSStingrayRecord parseFromAccountInfoPlist:v22 error:&v39];
        unsigned __int8 v25 = v39;
        [v11 setGfRecord:v29];

        if (v25)
        {
          id v26 = CloudServicesLog();
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          *(_DWORD *)long long buf = 138412290;
          uint64_t v47 = v25;
          BOOL v27 = v26;
          v28 = "error parsing Guitarfish record: %@";
          goto LABEL_44;
        }
      }
      else
      {
        if (([v23 isEqualToString:v37] & 1) != 0
          || ([v23 isEqualToString:@"com.apple.protectedcloudstorage.record.double"] & 1) != 0)
        {
          goto LABEL_25;
        }
        if ([v23 isEqualToString:@"com.apple.securebackup.record"])
        {
          unsigned __int8 v25 = CloudServicesLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_41;
          }
        }
        else if ([v23 hasPrefix:@"com.apple.icdp.record.double"])
        {
          unsigned __int8 v25 = CloudServicesLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v47 = v23;
            uint64_t v30 = v25;
            uint64_t v31 = "ignoring old double enrollment record: %@";
LABEL_42:
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v31, buf, 0xCu);
          }
        }
        else if ([v23 hasPrefix:@"com.apple.icdp.record"] {
               && [v23 hasSuffix:@".double"])
        }
        {
          unsigned __int8 v25 = CloudServicesLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v47 = v23;
            uint64_t v30 = v25;
            uint64_t v31 = "ignoring icdp record: %@";
            goto LABEL_42;
          }
        }
        else
        {
          unsigned int v32 = [v23 hasPrefix:@"com.apple.icdp.record"];
          id v33 = CloudServicesLog();
          unsigned __int8 v25 = v33;
          if (!v32)
          {
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v47 = v23;
              _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "unexpected label: %@", buf, 0xCu);
            }
            goto LABEL_24;
          }
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
LABEL_41:
            *(_DWORD *)long long buf = 138412290;
            uint64_t v47 = v23;
            uint64_t v30 = v25;
            uint64_t v31 = "ignoring escrow service record: %@";
            goto LABEL_42;
          }
        }
      }
LABEL_24:

LABEL_25:
      if (v17 == (id)++v21)
      {
        id v34 = [v15 countByEnumeratingWithState:&v41 objects:v45 count:16];
        id v17 = v34;
        if (!v34) {
          goto LABEL_48;
        }
        goto LABEL_13;
      }
    }
  }
  id v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v47 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "escrowService getAccountInfoWithRequest: returned %@", buf, 0xCu);
  }

  unsigned int v9 = CloudServicesLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v6 code];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v47 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "getAccountInfoWithRequest: error: %ld", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_49:
}

void sub_10001B768(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = CloudServicesLog();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10004ABE4();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NSUbiquitousKeyValueStore synchronize succeeded", v5, 2u);
  }
}

void sub_10001BB24(id a1)
{
  qword_100081040 = (uint64_t)dispatch_group_create();

  _objc_release_x1();
}

void sub_10001BB58(uint64_t a1, void *a2)
{
  id v3 = a2;
  double Nanoseconds = _CloudServicesSignpostGetNanoseconds(*(void *)(a1 + 56), *(void *)(a1 + 64));
  id v5 = _CloudServicesSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 56);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_DWORD *)long long buf = 67240192;
    LODWORD(v25) = v3 == 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, v7, "KVSSynchronize", " CloudServicesSignpostNameKVSSynchronize=%{public,signpost.telemetry:number1,name=CloudServicesSignpostNameKVSSynchronize}d ", buf, 8u);
  }

  id v8 = _CloudServicesSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 56);
    *(_DWORD *)long long buf = 134218496;
    uint64_t v25 = v9;
    __int16 v26 = 2048;
    double v27 = Nanoseconds / 1000000000.0;
    __int16 v28 = 1026;
    BOOL v29 = v3 == 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: KVSSynchronize  CloudServicesSignpostNameKVSSynchronize=%{public,signpost.telemetry:number1,name=CloudServicesSignpostNameKVSSynchronize}d ", buf, 0x1Cu);
  }

  kdebug_trace();
  if (v3)
  {
    id v10 = CloudServicesLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10004AC80();
    }

    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    [v11 setObject:@"KVS synchronizeWithCompletionHandler failed" forKeyedSubscript:NSLocalizedDescriptionKey];
    [v11 setObject:v3 forKeyedSubscript:NSUnderlyingErrorKey];
    uint64_t v12 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:32 userInfo:v11];
    uint64_t v13 = [*(id *)(a1 + 32) connectionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001BF10;
    block[3] = &unk_100071480;
    id v14 = *(id *)(a1 + 48);
    id v22 = v12;
    id v23 = v14;
    id v15 = v12;
    dispatch_async(v13, block);
  }
  else
  {
    if (([*(id *)(a1 + 40) synchronize] & 1) == 0)
    {
      id v16 = CloudServicesLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10004AC4C();
      }
    }
    id v17 = CloudServicesLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "calling handler on connection queue", buf, 2u);
    }

    uint64_t v18 = [*(id *)(a1 + 32) connectionQueue];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10001BF24;
    v19[3] = &unk_1000714A8;
    id v20 = *(id *)(a1 + 48);
    dispatch_async(v18, v19);

    id v11 = v20;
  }

  dispatch_group_leave((dispatch_group_t)qword_100081040);
}

uint64_t sub_10001BF10(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_10001BF24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001C190(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_10001C1A0(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) _getAccountInfoWithRequest:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
  }
}

void sub_10001CE88(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001D6DC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_10001D740(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = [*(id *)(a1 + 40) kvs];
    if (v6)
    {
      os_signpost_id_t v7 = CloudServicesLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "calling synchronizeWithCompletionHandler", buf, 2u);
      }

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10001D958;
      v18[3] = &unk_100071570;
      int8x16_t v17 = *(int8x16_t *)(a1 + 32);
      id v8 = (id)v17.i64[0];
      int8x16_t v19 = vextq_s8(v17, v17, 8uLL);
      [v6 synchronizeWithCompletionHandler:v18];
    }
    else
    {
      id v13 = objc_alloc_init((Class)NSMutableDictionary);
      [v13 setObject:@"KVS not available" forKeyedSubscript:NSLocalizedDescriptionKey];
      uint64_t v14 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:20 userInfo:v13];
      uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
      id v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }
  }
  else
  {
    uint64_t v9 = CloudServicesLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10004B050();
    }

    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    [v6 setObject:v5 forKeyedSubscript:NSUnderlyingErrorKey];
    uint64_t v10 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:20 userInfo:v6];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void sub_10001D958(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10004B0B8();
  }

  [*(id *)(a1 + 32) doSynchronize];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10001F4F4(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    uint64_t v4 = CloudServicesLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [v3 callStackSymbols];
      objc_claimAutoreleasedReturnValue();
      sub_10004B120();
    }

    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    id v6 = [v3 name];
    [v5 setObject:v6 forKeyedSubscript:NSLocalizedDescriptionKey];

    os_signpost_id_t v7 = [v3 reason];
    [v5 setObject:v7 forKeyedSubscript:NSLocalizedFailureReasonErrorKey];

    id v8 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v5];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v8);

    objc_end_catch();
    JUMPOUT(0x10001F3B8);
  }
  _Unwind_Resume(exception_object);
}

void sub_10001F700(uint64_t a1, void *a2)
{
  id v3 = a2;
  double Nanoseconds = _CloudServicesSignpostGetNanoseconds(*(void *)(a1 + 56), *(void *)(a1 + 64));
  id v5 = _CloudServicesSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 56);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    uint64_t v8 = [v3 domain];
    uint64_t v9 = (void *)v8;
    if (v8) {
      CFStringRef v10 = (const __CFString *)v8;
    }
    else {
      CFStringRef v10 = &stru_100072CF8;
    }
    int v20 = 138543618;
    CFStringRef v21 = v10;
    __int16 v22 = 1026;
    LODWORD(v23) = [v3 code];
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, v7, "EnableWithRequest", " ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x12u);
  }
  uint64_t v11 = _CloudServicesSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v12 = *(const __CFString **)(a1 + 56);
    double v13 = Nanoseconds / 1000000000.0;
    uint64_t v14 = [v3 domain];
    uint64_t v15 = (void *)v14;
    if (v14) {
      CFStringRef v16 = (const __CFString *)v14;
    }
    else {
      CFStringRef v16 = &stru_100072CF8;
    }
    unsigned int v17 = [v3 code];
    int v20 = 134218754;
    CFStringRef v21 = v12;
    __int16 v22 = 2048;
    double v23 = v13;
    __int16 v24 = 2114;
    CFStringRef v25 = v16;
    __int16 v26 = 1026;
    unsigned int v27 = v17;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: EnableWithRequest  ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x26u);
  }
  uint64_t v18 = [*(id *)(a1 + 32) operationsLogger];
  int8x16_t v19 = [*(id *)(a1 + 40) endEventWithResults:&__NSDictionary0__struct error:v3];
  [v18 updateStoreWithEvent:v19];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

id sub_10001F92C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleEscrowStoreResults:a2 escrowError:a3 request:*(void *)(a1 + 40) peerID:0 newRecordMetadata:*(void *)(a1 + 48) backupKeybag:*(void *)(a1 + 56) reply:*(void *)(a1 + 64)];
}

id sub_1000203A0()
{
  v0 = sub_100033010();
  id v1 = [v0 mutableCopy];

  [v1 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnData];
  CFTypeRef result = 0;
  if (SecItemCopyMatching((CFDictionaryRef)v1, &result))
  {
    uint64_t v2 = CloudServicesLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10004B4EC();
    }
  }
  id v3 = (void *)result;

  return v3;
}

void sub_1000207E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100020814(id a1, id a2, id a3, BOOL *a4)
{
  id v5 = a2;
  id v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 count];
    uint64_t v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = "s";
      int v10 = 138412802;
      id v11 = v5;
      if (v7 == (id)1) {
        uint64_t v9 = "";
      }
      __int16 v12 = 2048;
      id v13 = v7;
      __int16 v14 = 2080;
      uint64_t v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: %ld item%s", (uint8_t *)&v10, 0x20u);
    }
  }
  else
  {
    uint64_t v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10004B58C();
    }
  }
}

void sub_100020950(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[CloudServicesAnalytics logger];
  uint64_t v5 = CloudServicesAnalyticsRestoreBackupName;
  uint64_t v6 = *(void *)(a1 + 32);
  CFStringRef v16 = @"view";
  uint64_t v17 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  [v4 logResultForEvent:v5 hardFailure:1 result:v3 withAttributes:v7];

  uint64_t v8 = CloudServicesLog();
  uint64_t v9 = v8;
  if (v3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10004B5F4();
    }

    uint64_t v9 = objc_alloc_init((Class)NSMutableDictionary);
    [v9 setObject:v3 forKeyedSubscript:NSUnderlyingErrorKey];
    uint64_t v10 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:19 userInfo:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    __int16 v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 138412290;
    uint64_t v15 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SecItemBackupRestore for view %@ succeeded", (uint8_t *)&v14, 0xCu);
  }
}

void sub_100020CAC(id a1)
{
  id v1 = (void *)qword_100081048;
  qword_100081048 = (uint64_t)&off_1000760F0;

  id v4 = [&off_1000760F0 allKeys];
  uint64_t v2 = [v4 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
  id v3 = (void *)qword_100081050;
  qword_100081050 = v2;
}

void sub_1000211C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000211D8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentViews];
  id v3 = CloudServicesLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v39 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "currentViews: %@", buf, 0xCu);
  }

  id v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 40) hexString];
    *(_DWORD *)long long buf = 138412290;
    id v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "restoring view-based backup for keybag digest %@", buf, 0xCu);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = v2;
  id v7 = [v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v32;
    *(void *)&long long v8 = 138412290;
    long long v30 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v6);
        }
        __int16 v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([*(id *)(a1 + 48) containsObject:v12])
        {
          int v14 = CloudServicesLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = v30;
            id v39 = v12;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "skipping %@", buf, 0xCu);
          }
        }
        else
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) |= [*(id *)(a1 + 32) _restoreView:v12 password:*(void *)(a1 + 56) keybagDigest:*(void *)(a1 + 40) restoredViews:*(void *)(a1 + 64) error:0];
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v9);
  }

  uint64_t v15 = CloudServicesLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v16 = *(void **)(a1 + 64);
    *(_DWORD *)long long buf = 138412290;
    id v39 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "restoredViews (async): %@", buf, 0xCu);
  }

  if (sub_100004254())
  {
    uint64_t v17 = +[NSMutableDictionary dictionary];
    uint64_t v18 = [*(id *)(a1 + 32) encodedStatsForViews:*(void *)(a1 + 64)];
    [v17 setObject:v18 forKeyedSubscript:@"views"];

    int8x16_t v19 = +[CloudServicesAnalytics logger];
    [v19 logSoftFailureForEventNamed:CloudServicesSOSRestoreMetrics withAttributes:v17];
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    [*(id *)(a1 + 32) setNeedInitialBackup:1];
    int v20 = *(void **)(a1 + 32);
    CFStringRef v21 = [v20 circleChangedNotification];
    [v20 registerForNotifyEvent:v21];
LABEL_41:

    goto LABEL_42;
  }
  __int16 v22 = CloudServicesLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_10004B730();
  }

  if (*(void *)(a1 + 72))
  {
    CFStringRef v21 = [*(id *)(a1 + 32) _getProtectedKeychainAndKeybagDigestFromKVS:0];
    if (!v21)
    {
      double v23 = CloudServicesLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_10004B6FC();
      }
    }
    __int16 v24 = objc_msgSend(*(id *)(a1 + 32), "derDataFromDict:", v21, v30, (void)v31);
    if (v24)
    {
      CFStringRef v25 = CloudServicesLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "restoring legacy backup", buf, 2u);
      }
    }
    else
    {
      NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
      CFStringRef v36 = @"could not create DER data from dict";
      CFStringRef v25 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      __int16 v28 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:19 userInfo:v25];
      BOOL v29 = CloudServicesLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10004B694();
      }
    }
    goto LABEL_41;
  }
  int v26 = *(unsigned __int8 *)(a1 + 88);
  unsigned int v27 = CloudServicesLog();
  CFStringRef v21 = v27;
  if (!v26)
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10004B660();
    }
    goto LABEL_41;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Having a bottled peer, so skipping SOS restore on this device", buf, 2u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
LABEL_42:
}

void sub_100021B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100021B98(void *a1)
{
  id v3 = a1 + 8;
  uint64_t v2 = a1[8];
  id v4 = (void *)a1[4];
  uint64_t v5 = *(v3 - 3);
  uint64_t v6 = *(v3 - 2);
  uint64_t v7 = *(void *)(*(void *)(*(v3 - 1) + 8) + 40);
  uint64_t v8 = *(void *)(v2 + 8);
  id obj = *(id *)(v8 + 40);
  unsigned __int8 v9 = [v4 _restoreView:@"iCloudIdentity" password:v5 keybagDigest:v6 restoredViews:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
    uint64_t v10 = (void *)a1[4];
    uint64_t v11 = a1[5];
    uint64_t v12 = a1[6];
    uint64_t v13 = *(void *)(*(void *)(a1[7] + 8) + 40);
    uint64_t v14 = *(void *)(a1[8] + 8);
    id v17 = *(id *)(v14 + 40);
    unsigned __int8 v15 = [v10 _restoreView:@"PCS-MasterKey" password:v11 keybagDigest:v12 restoredViews:v13 error:&v17];
    objc_storeStrong((id *)(v14 + 40), v17);
    if (v15) {
      return;
    }
    CFStringRef v16 = CloudServicesLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10004B7CC();
    }
  }
  else
  {
    CFStringRef v16 = CloudServicesLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10004B834();
    }
  }
}

void sub_100021CB8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentViews];
  id v3 = [v2 mutableCopy];

  [v3 removeObject:@"iCloudIdentity"];
  [v3 removeObject:@"PCS-MasterKey"];
  id v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v22 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "remaining views to restore: %@", buf, 0xCu);
  }

  uint64_t v5 = CloudServicesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [*(id *)(a1 + 40) hexString];
    *(_DWORD *)long long buf = 138412290;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "restoring view-based backup for keybag digest %@", buf, 0xCu);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v11);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= objc_msgSend(*(id *)(a1 + 32), "_restoreView:password:keybagDigest:restoredViews:error:", v12, *(void *)(a1 + 48), *(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), 0, (void)v16);
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  uint64_t v14 = CloudServicesLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v15 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    *(_DWORD *)long long buf = 138412290;
    id v22 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "restoredViews (async): %@", buf, 0xCu);
  }
}

void sub_100022000(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [a3 objectForKeyedSubscript:@"com.apple.securebackup.keychain"];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 objectForKeyedSubscript:@"keybag"];
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 backupKeyDigests];
      if (![v10 count])
      {
        uint64_t v11 = CloudServicesLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 138412290;
          id v13 = v5;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "backups (%@): keybag contains no backup key digests", (uint8_t *)&v12, 0xCu);
        }
      }
      [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v5];
    }
    else
    {
      uint64_t v10 = CloudServicesLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "backups (%@): missing keybag", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  else
  {
    id v9 = CloudServicesLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "backups (%@): missing keychain", (uint8_t *)&v12, 0xCu);
    }
  }
}

void sub_100022328(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10004B904();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v9 = [v5 objectForKeyedSubscript:kSecureBackupiCDPRecordsKey];
    if ([v9 count])
    {
      context = v8;
      id v31 = v5;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      BOOL v29 = v9;
      id v10 = v9;
      id v11 = [v10 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v33;
        uint64_t v14 = kSecureBackupRecordIDKey;
        while (2)
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v33 != v13) {
              objc_enumerationMutation(v10);
            }
            long long v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            long long v17 = objc_msgSend(v16, "objectForKeyedSubscript:", v14, v29);
            if (v17)
            {
              long long v18 = [*(id *)(a1 + 32) cachedRecordID];
              unsigned int v19 = [v18 isEqualToString:v17];

              if (v19)
              {
                double v23 = [v16 objectForKeyedSubscript:kSecureBackupEscrowDateKey];
                __int16 v24 = CloudServicesLog();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                {
                  CFStringRef v25 = +[CSDateUtilities localStringFromDate:v23];
                  *(_DWORD *)long long buf = 138412546;
                  uint64_t v37 = v17;
                  __int16 v38 = 2112;
                  id v39 = v25;
                  _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "found preferred record: %@ from %@", buf, 0x16u);
                }
                uint64_t v26 = *(void *)(a1 + 48);
                unsigned int v27 = [v16 objectForKeyedSubscript:kEscrowServiceRecordMetadataKey];
                (*(void (**)(uint64_t, void *, void *, void))(v26 + 16))(v26, v17, v27, *(void *)(a1 + 56));

                id v6 = 0;
                id v5 = v31;
                goto LABEL_31;
              }
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      int v20 = [*(id *)(a1 + 32) secureBackups];
      if ([v20 count])
      {
        id v9 = v29;
        id v8 = context;
        if (_os_feature_enabled_impl()) {
          id v21 = [*(id *)(a1 + 40) sosCompatibleEscrowSorting];
        }
        else {
          id v21 = 0;
        }
        id v6 = 0;
        objc_msgSend(v20, "recordIDAndClientMetadataForSilentAttemptFromRecords:passphraseLength:platform:sosCompatibilityModeEnabled:reply:", v10, *(void *)(a1 + 56), *(unsigned int *)(a1 + 64), v21, *(void *)(a1 + 48), v29);
        id v5 = v31;
      }
      else
      {
        __int16 v28 = CloudServicesLog();
        id v9 = v29;
        id v8 = context;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_10004B8D0();
        }

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        id v6 = 0;
        id v5 = v31;
      }
    }
    else
    {
      id v22 = CloudServicesLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10004B89C();
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
LABEL_31:
}

void sub_1000232BC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v8 = a2;
  double Nanoseconds = _CloudServicesSignpostGetNanoseconds(v6, v7);
  id v10 = _CloudServicesSignpostLogSystem();
  id v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 56);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    uint64_t v13 = [(__CFString *)v5 domain];
    uint64_t v14 = (void *)v13;
    if (v13) {
      CFStringRef v15 = (const __CFString *)v13;
    }
    else {
      CFStringRef v15 = &stru_100072CF8;
    }
    *(_DWORD *)long long buf = 138543618;
    CFStringRef v165 = v15;
    __int16 v166 = 1026;
    LODWORD(v167) = [(__CFString *)v5 code];
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, v12, "RecoverRecordWithRequest", " ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x12u);
  }
  long long v16 = _CloudServicesSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v17 = *(const __CFString **)(a1 + 56);
    double v18 = Nanoseconds / 1000000000.0;
    uint64_t v19 = [(__CFString *)v5 domain];
    int v20 = (void *)v19;
    if (v19) {
      CFStringRef v21 = (const __CFString *)v19;
    }
    else {
      CFStringRef v21 = &stru_100072CF8;
    }
    unsigned int v22 = [(__CFString *)v5 code];
    *(_DWORD *)long long buf = 134218754;
    CFStringRef v165 = v17;
    __int16 v166 = 2048;
    double v167 = v18;
    __int16 v168 = 2114;
    *(void *)uint64_t v169 = v21;
    *(_WORD *)&v169[8] = 1026;
    *(_DWORD *)&v169[10] = v22;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecoverRecordWithRequest  ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x26u);
  }
  id v23 = [v8 mutableCopy];

  __int16 v24 = +[CloudServicesAnalytics logger];
  [v24 logResultForEvent:CloudServicesRecoverEscrowWithRequest hardFailure:1 result:v5];

  [*(id *)(a1 + 32) uncacheRecordIDPassphrase];
  if (!v5)
  {
    unsigned int v32 = [*(id *)(a1 + 40) silent];
    long long v33 = CloudServicesLog();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
    if (v32)
    {
      if (!v34) {
        goto LABEL_24;
      }
      long long v35 = [*(id *)(a1 + 40) recordID];
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v165 = v35;
      CFStringRef v36 = "silent attempt succeeded for record ID %@";
    }
    else
    {
      if (!v34) {
        goto LABEL_24;
      }
      long long v35 = [*(id *)(a1 + 40) recordID];
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v165 = v35;
      CFStringRef v36 = "recovery attempt succeeded for record ID %@";
    }
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v36, buf, 0xCu);

LABEL_24:
    uint64_t v37 = [v23 objectForKeyedSubscript:kEscrowServiceRecordDataKey];
    __int16 v38 = [*(id *)(a1 + 40) recordID];
    if (v38)
    {
      id v39 = 0;
    }
    else
    {
      id v39 = [*(id *)(a1 + 32) _KVSKeybag];
    }

    long long v41 = [*(id *)(a1 + 40) recordID];
    if (v41)
    {
      long long v42 = 0;
    }
    else
    {
      long long v42 = [v39 sha1Digest];
    }

    long long v43 = [v37 objectForKeyedSubscript:kSecureBackupKeybagDigestKey];
    uint64_t v154 = [v37 objectForKeyedSubscript:kSecureBackupBagPasswordKey];
    uint64_t v158 = [v37 objectForKeyedSubscript:@"BackupVersion"];
    uint64_t v157 = [v37 objectForKeyedSubscript:kSecureBackupTimestampKey];
    if (_os_feature_enabled_impl()
      && ([*(id *)(a1 + 40) sosCompatibleEscrowSorting] & 1) != 0)
    {
      uint64_t v155 = 0;
      uint64_t v156 = 0;
      char v44 = 1;
    }
    else
    {
      id v45 = [*(id *)(a1 + 40) metadata];
      uint64_t v156 = [v45 objectForKeyedSubscript:kSecureBackupBottleIDKey];

      v46 = [*(id *)(a1 + 40) metadata];
      uint64_t v155 = [v46 objectForKeyedSubscript:kSecureBackupBottleValidityKey];

      char v44 = 0;
    }
    uint64_t v47 = CloudServicesLog();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = [*(id *)(a1 + 40) metadata];
      *(_DWORD *)long long buf = 138413058;
      CFStringRef v165 = v157;
      __int16 v166 = 2112;
      double v167 = *(double *)&v158;
      __int16 v168 = 2112;
      *(void *)uint64_t v169 = v43;
      *(_WORD *)&v169[8] = 2112;
      *(void *)&v169[10] = v48;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "=== Escrow record ===\nTime of escrow: %@\nEscrow version: %@\nKeybag digest: %@\nMetadata: %@", buf, 0x2Au);
    }
    v49 = [v37 objectForKeyedSubscript:@"BottledPeerEntropy"];
    if ([v158 isEqualToString:@"1"])
    {
      uint64_t v50 = [*(id *)(a1 + 40) recordID];
      if (v50)
      {

LABEL_59:
        if ((v44 & 1) == 0)
        {
          if (v49 && v156 && [v155 isEqualToString:kSecureBackupRecordStatusValid])
          {
            id v75 = CloudServicesLog();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            {
              id v76 = [v49 length];
              *(_DWORD *)long long buf = 138413058;
              CFStringRef v165 = v156;
              __int16 v166 = 2112;
              double v167 = *(double *)&v155;
              __int16 v168 = 1024;
              *(_DWORD *)uint64_t v169 = 1;
              *(_WORD *)&v169[4] = 2048;
              *(void *)&v169[6] = v76;
              _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "adding bottleID:%@ and validity:%@ to results; entropy present: %d (%llu bytes)",
                buf,
                0x26u);
            }

            [v23 setObject:v156 forKeyedSubscript:kSecureBackupBottleIDKey];
            [v23 setObject:v155 forKeyedSubscript:kSecureBackupBottleValidityKey];
          }
          else
          {
            int v77 = CloudServicesLog();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
            {
              id v78 = [v49 length];
              *(_DWORD *)long long buf = 138413058;
              CFStringRef v165 = v156;
              __int16 v166 = 2112;
              double v167 = *(double *)&v155;
              __int16 v168 = 1024;
              *(_DWORD *)uint64_t v169 = v49 != 0;
              *(_WORD *)&v169[4] = 2048;
              *(void *)&v169[6] = v78;
              _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "skipping setting bottle; bottleID:%@ validity:%@ entropy present: %d (%llu bytes)",
                buf,
                0x26u);
            }
          }
        }
        if (OctagonPlatformSupportsSOS())
        {
          id v151 = v23;
          id v79 = v49;
          id v80 = *(void **)(a1 + 32);
          id v159 = 0;
          unsigned __int8 v81 = [v80 _restoreKeychainWithBackupPassword:v154 keybagDigest:v43 error:&v159];
          id v82 = v159;
          if ((v81 & 1) == 0)
          {
            uint64_t v83 = CloudServicesLog();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
              sub_10004B96C();
            }
          }
          v84 = +[CloudServicesAnalytics logger];
          [v84 logResultForEvent:CloudServicesAnalyticsRestoreKeychainWithBackupBag hardFailure:1 result:v82];

          v49 = v79;
          id v23 = v151;
        }
        double v85 = _CloudServicesSignpostGetNanoseconds(*(void *)(a1 + 72), *(void *)(a1 + 80));
        v86 = _CloudServicesSignpostLogSystem();
        v87 = v86;
        os_signpost_id_t v88 = *(void *)(a1 + 72);
        if (v88 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v86))
        {
          uint64_t v89 = [0 domain];
          uint64_t v152 = v39;
          id v90 = v42;
          uint64_t v91 = v37;
          id v92 = v23;
          v93 = v49;
          v94 = (void *)v89;
          v95 = v43;
          if (v89) {
            CFStringRef v96 = (const __CFString *)v89;
          }
          else {
            CFStringRef v96 = &stru_100072CF8;
          }
          unsigned int v97 = [0 code];
          *(_DWORD *)long long buf = 138543618;
          CFStringRef v165 = v96;
          long long v43 = v95;
          __int16 v166 = 1026;
          LODWORD(v167) = v97;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v87, OS_SIGNPOST_INTERVAL_END, v88, "RecoverEscrowWithRequest", " ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x12u);

          v49 = v93;
          id v23 = v92;
          uint64_t v37 = v91;
          long long v42 = v90;
          id v39 = v152;
        }

        id v98 = _CloudServicesSignpostLogSystem();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v99 = v43;
          CFStringRef v100 = *(const __CFString **)(a1 + 72);
          double v101 = v85 / 1000000000.0;
          uint64_t v102 = [0 domain];
          uint64_t v153 = v39;
          v103 = v42;
          v104 = v37;
          id v105 = v23;
          v106 = v49;
          v107 = (void *)v102;
          if (v102) {
            CFStringRef v108 = (const __CFString *)v102;
          }
          else {
            CFStringRef v108 = &stru_100072CF8;
          }
          unsigned int v109 = [0 code];
          *(_DWORD *)long long buf = 134218754;
          CFStringRef v165 = v100;
          long long v43 = v99;
          __int16 v166 = 2048;
          double v167 = v101;
          __int16 v168 = 2114;
          *(void *)uint64_t v169 = v108;
          *(_WORD *)&v169[8] = 1026;
          *(_DWORD *)&v169[10] = v109;
          _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecoverEscrowWithRequest  ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x26u);

          v49 = v106;
          id v23 = v105;
          uint64_t v37 = v104;
          long long v42 = v103;
          id v39 = v153;
        }

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        id v5 = 0;
        goto LABEL_87;
      }
      if ([v43 isEqual:v42]) {
        goto LABEL_59;
      }
      v149 = v42;
      id v150 = v39;
      uint64_t v111 = CloudServicesLog();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR)) {
        sub_10004B9D4();
      }

      NSErrorUserInfoKey v160 = NSLocalizedDescriptionKey;
      CFStringRef v161 = @"backup keybag digest does not match version in escrow";
      v52 = +[NSDictionary dictionaryWithObjects:&v161 forKeys:&v160 count:1];
      id v5 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:21 userInfo:v52];
      double v112 = _CloudServicesSignpostGetNanoseconds(*(void *)(a1 + 72), *(void *)(a1 + 80));
      v113 = _CloudServicesSignpostLogSystem();
      v114 = v113;
      os_signpost_id_t v115 = *(void *)(a1 + 72);
      if (v115 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v113))
      {
        uint64_t v116 = [(__CFString *)v5 domain];
        v148 = v37;
        id v117 = v23;
        uint64_t v118 = v49;
        v119 = (void *)v116;
        v120 = v43;
        if (v116) {
          CFStringRef v121 = (const __CFString *)v116;
        }
        else {
          CFStringRef v121 = &stru_100072CF8;
        }
        unsigned int v122 = [(__CFString *)v5 code];
        *(_DWORD *)long long buf = 138543618;
        CFStringRef v165 = v121;
        long long v43 = v120;
        __int16 v166 = 1026;
        LODWORD(v167) = v122;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v114, OS_SIGNPOST_INTERVAL_END, v115, "RecoverEscrowWithRequest", " ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x12u);

        v49 = v118;
        id v23 = v117;
        uint64_t v37 = v148;
      }

      uint64_t v64 = _CloudServicesSignpostLogSystem();
      if (!os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
LABEL_55:

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        long long v42 = v149;
        id v39 = v150;
LABEL_87:

        goto LABEL_118;
      }
      v123 = v43;
      CFStringRef v124 = *(const __CFString **)(a1 + 72);
      double v125 = v112 / 1000000000.0;
      uint64_t v126 = [(__CFString *)v5 domain];
      id v147 = v37;
      id v69 = v23;
      CFStringRef v70 = v49;
      CFStringRef v71 = (void *)v126;
      if (v126) {
        CFStringRef v127 = (const __CFString *)v126;
      }
      else {
        CFStringRef v127 = &stru_100072CF8;
      }
      unsigned int v128 = [(__CFString *)v5 code];
      *(_DWORD *)long long buf = 134218754;
      CFStringRef v165 = v124;
      long long v43 = v123;
      __int16 v166 = 2048;
      double v167 = v125;
      __int16 v168 = 2114;
      *(void *)uint64_t v169 = v127;
      *(_WORD *)&v169[8] = 1026;
      *(_DWORD *)&v169[10] = v128;
    }
    else
    {
      v149 = v42;
      id v150 = v39;
      id v51 = CloudServicesLog();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "backup data version does not match version in escrow", buf, 2u);
      }

      NSErrorUserInfoKey v162 = NSLocalizedDescriptionKey;
      CFStringRef v163 = @"backup data version does not match version in escrow";
      v52 = +[NSDictionary dictionaryWithObjects:&v163 forKeys:&v162 count:1];
      id v5 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:3 userInfo:v52];
      double v53 = _CloudServicesSignpostGetNanoseconds(*(void *)(a1 + 72), *(void *)(a1 + 80));
      uint64_t v54 = _CloudServicesSignpostLogSystem();
      int v55 = v54;
      os_signpost_id_t v56 = *(void *)(a1 + 72);
      if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
      {
        uint64_t v57 = [(__CFString *)v5 domain];
        uint64_t v146 = v37;
        id v58 = v23;
        CFStringRef v59 = v49;
        uint64_t v60 = (void *)v57;
        CFStringRef v61 = v43;
        if (v57) {
          CFStringRef v62 = (const __CFString *)v57;
        }
        else {
          CFStringRef v62 = &stru_100072CF8;
        }
        unsigned int v63 = [(__CFString *)v5 code];
        *(_DWORD *)long long buf = 138543618;
        CFStringRef v165 = v62;
        long long v43 = v61;
        __int16 v166 = 1026;
        LODWORD(v167) = v63;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v55, OS_SIGNPOST_INTERVAL_END, v56, "RecoverEscrowWithRequest", " ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x12u);

        v49 = v59;
        id v23 = v58;
        uint64_t v37 = v146;
      }

      uint64_t v64 = _CloudServicesSignpostLogSystem();
      if (!os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_55;
      }
      id v65 = v43;
      CFStringRef v66 = *(const __CFString **)(a1 + 72);
      double v67 = v53 / 1000000000.0;
      uint64_t v68 = [(__CFString *)v5 domain];
      id v147 = v37;
      id v69 = v23;
      CFStringRef v70 = v49;
      CFStringRef v71 = (void *)v68;
      if (v68) {
        CFStringRef v72 = (const __CFString *)v68;
      }
      else {
        CFStringRef v72 = &stru_100072CF8;
      }
      unsigned int v73 = [(__CFString *)v5 code];
      *(_DWORD *)long long buf = 134218754;
      CFStringRef v165 = v66;
      long long v43 = v65;
      __int16 v166 = 2048;
      double v167 = v67;
      __int16 v168 = 2114;
      *(void *)uint64_t v169 = v72;
      *(_WORD *)&v169[8] = 1026;
      *(_DWORD *)&v169[10] = v73;
    }
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecoverEscrowWithRequest  ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x26u);

    v49 = v70;
    id v23 = v69;
    uint64_t v37 = v147;
    goto LABEL_55;
  }
  CFStringRef v25 = CloudServicesLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    CFStringRef v165 = v5;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "escrowService recoverRecordWithRequest: returned: %@", buf, 0xCu);
  }

  uint64_t v26 = [(__CFString *)v5 domain];
  unsigned int v27 = [v26 isEqualToString:kEscrowServiceErrorDomain];

  if (!v27) {
    goto LABEL_106;
  }
  if ([(__CFString *)v5 code] == (id)-4005)
  {
    uint64_t v28 = kSecureBackupErrorDomain;
    BOOL v29 = [(__CFString *)v5 userInfo];
    uint64_t v30 = v28;
    uint64_t v31 = 25;
  }
  else if ([(__CFString *)v5 code] == (id)-6015)
  {
    uint64_t v40 = kSecureBackupErrorDomain;
    BOOL v29 = [(__CFString *)v5 userInfo];
    uint64_t v30 = v40;
    uint64_t v31 = 26;
  }
  else if ([(__CFString *)v5 code] == (id)-6012)
  {
    uint64_t v74 = kSecureBackupErrorDomain;
    BOOL v29 = [(__CFString *)v5 userInfo];
    uint64_t v30 = v74;
    uint64_t v31 = 13;
  }
  else if ([(__CFString *)v5 code] == (id)-6014)
  {
    uint64_t v110 = kSecureBackupErrorDomain;
    BOOL v29 = [(__CFString *)v5 userInfo];
    uint64_t v30 = v110;
    uint64_t v31 = 14;
  }
  else
  {
    if ([(__CFString *)v5 code] != (id)-4010) {
      goto LABEL_106;
    }
    uint64_t v129 = kSecureBackupErrorDomain;
    BOOL v29 = [(__CFString *)v5 userInfo];
    uint64_t v30 = v129;
    uint64_t v31 = 33;
  }
  uint64_t v130 = +[NSError errorWithDomain:v30 code:v31 userInfo:v29];

  id v5 = (__CFString *)v130;
LABEL_106:
  double v131 = _CloudServicesSignpostGetNanoseconds(*(void *)(a1 + 72), *(void *)(a1 + 80));
  v132 = _CloudServicesSignpostLogSystem();
  v133 = v132;
  os_signpost_id_t v134 = *(void *)(a1 + 72);
  if (v134 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v132))
  {
    uint64_t v135 = [(__CFString *)v5 domain];
    v136 = (void *)v135;
    if (v135) {
      CFStringRef v137 = (const __CFString *)v135;
    }
    else {
      CFStringRef v137 = &stru_100072CF8;
    }
    unsigned int v138 = [(__CFString *)v5 code];
    *(_DWORD *)long long buf = 138543618;
    CFStringRef v165 = v137;
    __int16 v166 = 1026;
    LODWORD(v167) = v138;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v133, OS_SIGNPOST_INTERVAL_END, v134, "RecoverEscrowWithRequest", " ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x12u);
  }
  v139 = _CloudServicesSignpostLogSystem();
  if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v140 = *(const __CFString **)(a1 + 72);
    double v141 = v131 / 1000000000.0;
    uint64_t v142 = [(__CFString *)v5 domain];
    uint64_t v143 = (void *)v142;
    if (v142) {
      CFStringRef v144 = (const __CFString *)v142;
    }
    else {
      CFStringRef v144 = &stru_100072CF8;
    }
    unsigned int v145 = [(__CFString *)v5 code];
    *(_DWORD *)long long buf = 134218754;
    CFStringRef v165 = v140;
    __int16 v166 = 2048;
    double v167 = v141;
    __int16 v168 = 2114;
    *(void *)uint64_t v169 = v144;
    *(_WORD *)&v169[8] = 1026;
    *(_DWORD *)&v169[10] = v145;
    _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecoverEscrowWithRequest  ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x26u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_118:
}

id sub_1000244A8(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 containsObject:*(void *)(a1 + 32)];
}

void sub_100025E74(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  _Block_object_dispose((const void *)(v11 - 160), 8);
  if (a2 == 1)
  {
    id v14 = objc_begin_catch(a1);
    CFStringRef v15 = CloudServicesLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      [v14 callStackSymbols];
      objc_claimAutoreleasedReturnValue();
      sub_10004BB48();
    }

    id v16 = objc_alloc_init((Class)NSMutableDictionary);
    CFStringRef v17 = [v14 name];
    [v16 setObject:v17 forKeyedSubscript:NSLocalizedDescriptionKey];

    double v18 = [v14 reason];
    [v16 setObject:v18 forKeyedSubscript:NSLocalizedFailureReasonErrorKey];

    uint64_t v19 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v16];
    (*(void (**)(uint64_t, void, void *))(a11 + 16))(a11, 0, v19);

    objc_end_catch();
    JUMPOUT(0x100025D88);
  }
  _Unwind_Resume(a1);
}

void sub_100026018(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void sub_100026068(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = CloudServicesLog();
  id v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v28 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "found record ID to use! :%@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) setRecordID:v7];
    uint64_t v11 = +[OTEscrowTranslation metadataToDictionary:v8];
    [*(id *)(a1 + 32) setMetadata:v11];

    os_signpost_id_t v12 = CloudServicesLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [*(id *)(a1 + 32) metadata];
      *(_DWORD *)long long buf = 138412290;
      id v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "using metadata :%@", buf, 0xCu);
    }
    id v14 = [*(id *)(a1 + 40) cachedRecordID];
    unsigned int v15 = [v14 isEqualToString:v7];

    if (v15)
    {
      id v16 = [*(id *)(a1 + 40) cachedRecordIDPassphrase];
      [*(id *)(a1 + 32) setPassphrase:v16];
    }
    else
    {
      id v16 = [*(id *)(a1 + 32) passphrase];
      uint64_t v19 = [v16 substringToIndex:a4];
      [*(id *)(a1 + 32) setPassphrase:v19];
    }
    uint64_t v21 = *(void *)(a1 + 32);
    int v20 = *(void **)(a1 + 40);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100026360;
    v24[3] = &unk_100071788;
    id v22 = *(id *)(a1 + 48);
    uint64_t v23 = *(void *)(a1 + 56);
    id v25 = v22;
    uint64_t v26 = v23;
    [v20 recoverEscrowWithRequest:v21 reply:v24];
    CFStringRef v17 = v25;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10004BC00();
    }

    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    CFStringRef v30 = @"silent attempt failed: no valid record found";
    CFStringRef v17 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    double v18 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:43 userInfo:v17];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100026360(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

uint64_t sub_1000263B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002671C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(a1);
    os_signpost_id_t v12 = CloudServicesLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      [v11 callStackSymbols];
      objc_claimAutoreleasedReturnValue();
      sub_10004BC34();
    }

    id v13 = objc_alloc_init((Class)NSMutableDictionary);
    id v14 = [v11 name];
    [v13 setObject:v14 forKeyedSubscript:NSLocalizedDescriptionKey];

    unsigned int v15 = [v11 reason];
    [v13 setObject:v15 forKeyedSubscript:NSLocalizedFailureReasonErrorKey];

    id v16 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v13];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v16);

    objc_end_catch();
    JUMPOUT(0x1000266D0);
  }
  _Unwind_Resume(a1);
}

void sub_100026874(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void sub_100026A88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a2 == 1)
  {
    id v12 = objc_begin_catch(exception_object);
    id v13 = CloudServicesLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [v12 callStackSymbols];
      objc_claimAutoreleasedReturnValue();
      sub_10004BCB8();
    }

    id v14 = objc_alloc_init((Class)NSMutableDictionary);
    unsigned int v15 = [v12 name];
    [v14 setObject:v15 forKeyedSubscript:NSLocalizedDescriptionKey];

    id v16 = [v12 reason];
    [v14 setObject:v16 forKeyedSubscript:NSLocalizedFailureReasonErrorKey];

    CFStringRef v17 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v14];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v17);

    objc_end_catch();
    JUMPOUT(0x100026A38);
  }
  _Unwind_Resume(exception_object);
}

void sub_100027ED4(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    id v4 = CloudServicesLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [v3 callStackSymbols];
      objc_claimAutoreleasedReturnValue();
      sub_10004BD3C();
    }

    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v6 = [v3 name];
    [v5 setObject:v6 forKeyedSubscript:NSLocalizedDescriptionKey];

    id v7 = [v3 reason];
    [v5 setObject:v7 forKeyedSubscript:NSLocalizedFailureReasonErrorKey];

    uint64_t v8 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v5];
    (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v8);

    objc_end_catch();
    JUMPOUT(0x100026DCCLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000280FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 domain];
    if ([v5 isEqualToString:NSPOSIXErrorDomain])
    {
      id v6 = [v4 code];

      if (v6 == (id)22)
      {
        id v7 = CloudServicesLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ignoring EINVAL from synchronizeWithCompletionHandler", buf, 2u);
        }

        goto LABEL_7;
      }
    }
    else
    {
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    goto LABEL_29;
  }
LABEL_7:
  uint64_t v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [*(id *)(a1 + 32) hexString];
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      uint64_t v11 = +[CSDateUtilities localStringFromDate:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v11 = @"unknown timestamp";
    }
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "looking for EMCS backup for stashed keybag digest %@ from %@", buf, 0x16u);
    if (v10) {
  }
    }
  id v12 = [*(id *)(a1 + 48) _EMCSBackupDictForKeybagDigest:*(void *)(a1 + 32)];
  if (v12)
  {
    uint64_t v13 = [*(id *)(a1 + 48) restoreEMCSBackup:v12 withPassword:*(void *)(a1 + 56)];
  }
  else
  {
    id v14 = CloudServicesLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10004C038((id *)(a1 + 32), v14);
    }

    id v15 = objc_alloc_init((Class)NSMutableDictionary);
    id v16 = objc_alloc((Class)NSString);
    CFStringRef v17 = [*(id *)(a1 + 32) hexString];
    id v18 = [v16 initWithFormat:@"no backup found for stashed keybag digest %@", v17];
    [v15 setObject:v18 forKeyedSubscript:NSLocalizedDescriptionKey];

    uint64_t v13 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v15];

    id v4 = v15;
  }

  if (v13)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    [*(id *)(a1 + 48) setBackupAllowed:1];
    if (*(void *)(a1 + 32))
    {
      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      unsigned int v27 = sub_100011AB0;
      id v28 = sub_100011AC0;
      id v29 = (id)0xAAAAAAAAAAAAAAAALL;
      id v29 = (id)os_transaction_create();
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      if (*(unsigned char *)(a1 + 80))
      {
        uint64_t v19 = *(void **)(a1 + 48);
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_1000285B8;
        v23[3] = &unk_100071800;
        v23[4] = buf;
        [v19 backupWithInfo:0 garbageCollect:1 reply:v23];
      }
      _Block_object_dispose(buf, 8);
    }
    else
    {
      int v20 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"stashedEMCSDict"];
      uint64_t v21 = sub_1000203A0();
      id v22 = *(void **)(a1 + 48);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000285A0;
      v24[3] = &unk_1000717D8;
      id v25 = *(id *)(a1 + 72);
      [v22 setEMCSDict:v20 backupKeybag:v21 saveKeybag:0 reply:v24];
    }
  }

  id v4 = (void *)v13;
LABEL_29:
}

void sub_100028580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000285A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000285B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

uint64_t sub_1000285CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000285E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000285FC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    id v7 = a2;
    uint64_t v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v36 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "escrowService iDMS recoverRecordWithRequest: returned: %@", buf, 0xCu);
    }

    id v9 = [v6 userInfo];
    id v10 = [v9 mutableCopy];

    if (!v10) {
      id v10 = objc_alloc_init((Class)NSMutableDictionary);
    }
    uint64_t v11 = [v7 objectForKeyedSubscript:@"coolOffEnd"];
    id v12 = [v7 objectForKeyedSubscript:@"recoveryStatus"];

    if (v11) {
      [v10 setObject:v11 forKeyedSubscript:kSecureBackupCoolOffEndKey];
    }
    if (v12) {
      [v10 setObject:v12 forKeyedSubscript:kSecureBackupRecoveryStatusKey];
    }
    uint64_t v13 = [v6 domain];
    unsigned int v14 = [v13 isEqualToString:kEscrowServiceErrorDomain];

    if (!v14) {
      goto LABEL_42;
    }
    uint64_t v15 = (uint64_t)[v6 code];
    id v16 = kSecureBackupErrorDomain;
    uint64_t v17 = (uint64_t)[v6 code];
    if (v17 > -4018)
    {
      if (v17 > -4011)
      {
        if (v17 == -4010)
        {
          uint64_t v15 = 33;
          goto LABEL_41;
        }
        if (v17 == -4005)
        {
          uint64_t v15 = 25;
          goto LABEL_41;
        }
      }
      else
      {
        if (v17 == -4017)
        {
          uint64_t v15 = 35;
          goto LABEL_41;
        }
        if (v17 == -4015)
        {
          uint64_t v15 = 34;
          goto LABEL_41;
        }
      }
    }
    else if (v17 > -6013)
    {
      if (v17 == -6012)
      {
        uint64_t v15 = 13;
        goto LABEL_41;
      }
      if (v17 == -6005)
      {
        uint64_t v15 = 30;
        goto LABEL_41;
      }
    }
    else
    {
      if (v17 == -6015)
      {
        uint64_t v15 = 26;
        goto LABEL_41;
      }
      if (v17 == -6014)
      {
        uint64_t v15 = 14;
LABEL_41:
        id v32 = [objc_alloc((Class)NSError) initWithDomain:v16 code:v15 userInfo:v10];

        id v6 = v32;
LABEL_42:
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        goto LABEL_43;
      }
    }
    uint64_t v31 = [v6 domain];

    id v16 = (id)v31;
    goto LABEL_41;
  }
  uint64_t v18 = kEscrowServiceRecordDataKey;
  id v19 = a2;
  id v10 = [v19 objectForKeyedSubscript:v18];

  uint64_t v11 = [v10 objectForKeyedSubscript:@"BackupVersion"];
  uint64_t v20 = kSecureBackupTimestampKey;
  id v12 = [v10 objectForKeyedSubscript:kSecureBackupTimestampKey];
  uint64_t v21 = kSecureBackupIDMSDataKey;
  id v22 = [v10 objectForKeyedSubscript:kSecureBackupIDMSDataKey];
  uint64_t v23 = CloudServicesLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    CFStringRef v36 = v12;
    __int16 v37 = 2112;
    __int16 v38 = v11;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "=== Escrow record ===\nTime of escrow: %@\nEscrow version: %@", buf, 0x16u);
  }

  if ([v11 isEqualToString:@"1"])
  {
    id v24 = objc_alloc_init((Class)NSMutableDictionary);
    [v24 setObject:v22 forKeyedSubscript:v21];
    [v24 setObject:v12 forKeyedSubscript:v20];
    id v25 = CloudServicesLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = [*(id *)(a1 + 32) recordID];
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v36 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "caching recordID %@", buf, 0xCu);
    }
    unsigned int v27 = *(void **)(a1 + 40);
    id v28 = [*(id *)(a1 + 32) passphrase];
    [v27 setCachedRecordIDPassphrase:v28];

    id v29 = [*(id *)(a1 + 32) recordID];
    [*(id *)(a1 + 40) setCachedRecordID:v29];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v6 = 0;
  }
  else
  {
    CFStringRef v30 = CloudServicesLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "backup data version does not match version in escrow", buf, 2u);
    }

    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    CFStringRef v34 = @"backup data version does not match version in escrow";
    id v24 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    id v6 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:3 userInfo:v24];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }

LABEL_43:
}

void sub_100028B80(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = CloudServicesLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      int v21 = 138412290;
      id v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "escrowService iDMS recoverRecordWithRequest: returned: %@", (uint8_t *)&v21, 0xCu);
    }

    id v9 = [v5 userInfo];
    id v10 = [v9 mutableCopy];

    if (!v10) {
      id v10 = objc_alloc_init((Class)NSMutableDictionary);
    }
    uint64_t v11 = [v6 objectForKeyedSubscript:@"coolOffEnd"];
    id v12 = [v6 objectForKeyedSubscript:@"recoveryStatus"];

    if (v11) {
      [v10 setObject:v11 forKeyedSubscript:kSecureBackupCoolOffEndKey];
    }
    if (v12) {
      [v10 setObject:v12 forKeyedSubscript:kSecureBackupRecoveryStatusKey];
    }
    uint64_t v13 = [v5 domain];
    unsigned int v14 = [v13 isEqualToString:kEscrowServiceErrorDomain];

    if (!v14) {
      goto LABEL_35;
    }
    uint64_t v15 = (uint64_t)[v5 code];
    id v16 = kSecureBackupErrorDomain;
    uint64_t v17 = (uint64_t)[v5 code];
    if (v17 > -4018)
    {
      if (v17 > -4011)
      {
        if (v17 == -4010)
        {
          uint64_t v15 = 33;
          goto LABEL_34;
        }
        if (v17 == -4005)
        {
          uint64_t v15 = 25;
          goto LABEL_34;
        }
      }
      else
      {
        if (v17 == -4017)
        {
          uint64_t v15 = 35;
          goto LABEL_34;
        }
        if (v17 == -4015)
        {
          uint64_t v15 = 34;
          goto LABEL_34;
        }
      }
    }
    else if (v17 > -6013)
    {
      if (v17 == -6012)
      {
        uint64_t v15 = 13;
        goto LABEL_34;
      }
      if (v17 == -6005)
      {
        uint64_t v15 = 30;
        goto LABEL_34;
      }
    }
    else
    {
      if (v17 == -6015)
      {
        uint64_t v15 = 26;
        goto LABEL_34;
      }
      if (v17 == -6014)
      {
        uint64_t v15 = 14;
LABEL_34:
        id v20 = [objc_alloc((Class)NSError) initWithDomain:v16 code:v15 userInfo:v10];

        id v5 = v20;
LABEL_35:
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

        goto LABEL_36;
      }
    }
    uint64_t v19 = [v5 domain];

    id v16 = (id)v19;
    goto LABEL_34;
  }
  if (v8)
  {
    LOWORD(v21) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMiP recovery attempt successful", (uint8_t *)&v21, 2u);
  }

  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v18 = [v6 objectForKeyedSubscript:@"EscrowServiceFMiPData"];

  [v5 setObject:v18 forKeyedSubscript:kSecureBackupFMiPDataKey];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_36:
}

void sub_100028EF4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[CloudServicesAnalytics logger];
  [v7 logResultForEvent:CloudServicesAnalyticsRecoverRequest hardFailure:1 result:v6];

  if (v6)
  {
    BOOL v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v38 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "escrowService stingray recoverRecordWithRequest: returned: %@", buf, 0xCu);
    }

    id v9 = [v6 domain];
    unsigned int v10 = [v9 isEqualToString:kEscrowServiceErrorDomain];

    if (!v10) {
      goto LABEL_26;
    }
    if ([v6 code] == (id)-4005)
    {
      uint64_t v11 = kSecureBackupErrorDomain;
      id v12 = [v6 userInfo];
      uint64_t v13 = v11;
      uint64_t v14 = 25;
    }
    else if ([v6 code] == (id)-6015)
    {
      uint64_t v27 = kSecureBackupErrorDomain;
      id v12 = [v6 userInfo];
      uint64_t v13 = v27;
      uint64_t v14 = 26;
    }
    else if ([v6 code] == (id)-6005)
    {
      uint64_t v28 = kSecureBackupErrorDomain;
      id v12 = [v6 userInfo];
      uint64_t v13 = v28;
      uint64_t v14 = 30;
    }
    else if ([v6 code] == (id)-6012)
    {
      uint64_t v29 = kSecureBackupErrorDomain;
      id v12 = [v6 userInfo];
      uint64_t v13 = v29;
      uint64_t v14 = 13;
    }
    else if ([v6 code] == (id)-6014)
    {
      uint64_t v30 = kSecureBackupErrorDomain;
      id v12 = [v6 userInfo];
      uint64_t v13 = v30;
      uint64_t v14 = 14;
    }
    else
    {
      if ([v6 code] != (id)-4010)
      {
LABEL_26:
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        goto LABEL_27;
      }
      uint64_t v31 = kSecureBackupErrorDomain;
      id v12 = [v6 userInfo];
      uint64_t v13 = v31;
      uint64_t v14 = 33;
    }
    uint64_t v32 = +[NSError errorWithDomain:v13 code:v14 userInfo:v12];

    id v6 = (id)v32;
    goto LABEL_26;
  }
  uint64_t v34 = a1;
  uint64_t v15 = [v5 objectForKeyedSubscript:kEscrowServiceRecordDataKey];
  uint64_t v16 = kSecureBackupKeybagSHA256Key;
  uint64_t v17 = [v15 objectForKeyedSubscript:kSecureBackupKeybagSHA256Key];
  uint64_t v18 = kSecureBackupKeybagDigestKey;
  uint64_t v19 = [v15 objectForKeyedSubscript:kSecureBackupKeybagDigestKey];
  uint64_t v33 = [v15 objectForKeyedSubscript:kSecureBackupBagPasswordKey];
  id v20 = [v15 objectForKeyedSubscript:@"BackupVersion"];
  uint64_t v21 = kSecureBackupTimestampKey;
  id v22 = [v15 objectForKeyedSubscript:kSecureBackupTimestampKey];
  uint64_t v23 = CloudServicesLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138413058;
    id v38 = v22;
    __int16 v39 = 2112;
    uint64_t v40 = v20;
    __int16 v41 = 2112;
    long long v42 = v17;
    __int16 v43 = 2112;
    char v44 = v19;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "=== Escrow record ===\nTime of escrow: %@\nEscrow version: %@\nKeybag SHA256: %@\nKeybag digest: %@", buf, 0x2Au);
  }

  if ([v20 isEqualToString:@"1"])
  {
    id v24 = objc_alloc_init((Class)NSMutableDictionary);
    [v24 setObject:v17 forKeyedSubscript:v16];
    [v24 setObject:v19 forKeyedSubscript:v18];
    id v25 = (void *)v33;
    [v24 setObject:v33 forKeyedSubscript:kSecureBackupiCloudIdentityDataKey];
    [v24 setObject:v20 forKeyedSubscript:@"BackupVersion"];
    [v24 setObject:v22 forKeyedSubscript:v21];
    (*(void (**)(void))(*(void *)(v34 + 32) + 16))();
    id v6 = 0;
  }
  else
  {
    uint64_t v26 = CloudServicesLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "backup data version does not match version in escrow", buf, 2u);
    }

    NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
    CFStringRef v36 = @"backup data version does not match version in escrow";
    id v24 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    id v6 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:3 userInfo:v24];
    (*(void (**)(void))(*(void *)(v34 + 32) + 16))();
    id v25 = (void *)v33;
  }

LABEL_27:
}

void sub_1000294B4(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (v7)
  {
    [*(id *)(a1 + 32) setRecordID:v7];
    [*(id *)(a1 + 32) setMetadata:v8];
    id v9 = [*(id *)(a1 + 40) cachedRecordID];
    unsigned int v10 = [v9 isEqualToString:v7];

    if (v10)
    {
      uint64_t v11 = [*(id *)(a1 + 40) cachedRecordIDPassphrase];
      [*(id *)(a1 + 32) setPassphrase:v11];
    }
    else
    {
      uint64_t v11 = [*(id *)(a1 + 32) passphrase];
      uint64_t v15 = [v11 substringToIndex:a4];
      [*(id *)(a1 + 32) setPassphrase:v15];
    }
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v16 = *(void **)(a1 + 40);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000296E4;
    v20[3] = &unk_100071788;
    id v18 = *(id *)(a1 + 48);
    uint64_t v19 = *(void *)(a1 + 56);
    id v21 = v18;
    uint64_t v22 = v19;
    [v16 recoverEscrowWithRequest:v17 reply:v20];
    uint64_t v13 = v21;
  }
  else
  {
    id v12 = CloudServicesLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10004BC00();
    }

    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    CFStringRef v24 = @"silent attempt failed: no valid record found";
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    uint64_t v14 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:43 userInfo:v13];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_1000296E4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void sub_100029734(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void sub_100029874(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  kdebug_trace();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100029A10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  kdebug_trace();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100029BAC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  kdebug_trace();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100029F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100029FD4(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSDate);
  id v3 = *(void **)(a1 + 32);
  id v4 = [v3 kvs];
  id v5 = [v3 _getICDPBackupFromKVS:v4 forView:@"iCloudIdentity"];

  if (v5)
  {
    id v6 = [v5 objectForKeyedSubscript:@"com.apple.securebackup.keychain"];
    id v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v5 objectForKeyedSubscript:kSecureBackupTimestampKey];
      *(_DWORD *)long long buf = 138412546;
      CFStringRef v52 = @"iCloudIdentity";
      __int16 v53 = 2112;
      uint64_t v54 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Retrieving backup for view %@ from %@", buf, 0x16u);
    }
    if (v6)
    {
      id v9 = CloudServicesLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        CFStringRef v52 = @"iCloudIdentity";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "about to remove recovery key from backup view %@", buf, 0xCu);
      }

      unsigned int v10 = [v6 objectForKeyedSubscript:@"keybag"];
      uint64_t v11 = [v6 objectForKeyedSubscript:@"backup"];
      id v12 = (void *)v11;
      if (v10 && v11)
      {
        uint64_t v13 = *(void **)(a1 + 32);
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
        id obj = *(id *)(v14 + 40);
        uint64_t v15 = [v13 removeRKFromKeyBag:v10 error:&obj];
        objc_storeStrong((id *)(v14 + 40), obj);
        if (v15 && !*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
          goto LABEL_14;
        }
        uint64_t v16 = CloudServicesLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_10004C21C();
        }

        if (v15)
        {
LABEL_14:
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          id v46 = [v6 mutableCopy];
          [v46 setObject:v15 forKeyedSubscript:@"keybag"];
          id v17 = [v5 mutableCopy];
          [v17 setObject:v46 forKeyedSubscript:@"com.apple.securebackup.keychain"];
          [v17 setObject:v2 forKeyedSubscript:kSecureBackupTimestampKey];
          id v18 = [objc_alloc((Class)NSString) initWithFormat:@"%@.%@-tomb", @"com.apple.icdp.backup", @"iCloudIdentity"];
          [*(id *)(a1 + 32) kvs];
          uint64_t v19 = v15;
          v21 = id v20 = v2;
          [v21 setObject:v17 forKey:v18];

          id v2 = v20;
          uint64_t v15 = v19;
        }
      }
    }
  }
  uint64_t v22 = *(void **)(a1 + 32);
  NSErrorUserInfoKey v23 = [v22 kvs];
  CFStringRef v24 = [v22 _getICDPBackupFromKVS:v23 forView:@"PCS-MasterKey"];

  if (v24)
  {
    id v25 = [v24 objectForKeyedSubscript:@"com.apple.securebackup.keychain"];
    uint64_t v26 = CloudServicesLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = [v24 objectForKeyedSubscript:kSecureBackupTimestampKey];
      *(_DWORD *)long long buf = 138412546;
      CFStringRef v52 = @"PCS-MasterKey";
      __int16 v53 = 2112;
      uint64_t v54 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Retrieving backup for view %@ from %@", buf, 0x16u);
    }
    if (v25)
    {
      uint64_t v28 = CloudServicesLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        CFStringRef v52 = @"PCS-MasterKey";
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "about to remove recovery key from backup view %@", buf, 0xCu);
      }

      uint64_t v29 = [v25 objectForKeyedSubscript:@"keybag"];
      uint64_t v30 = [v25 objectForKeyedSubscript:@"backup"];
      uint64_t v31 = (void *)v30;
      if (v29 && v30)
      {
        uint64_t v32 = *(void **)(a1 + 32);
        id v49 = 0;
        uint64_t v33 = [v32 removeRKFromKeyBag:v29 error:&v49];
        id v34 = v49;
        NSErrorUserInfoKey v35 = v34;
        if (v33 && !v34) {
          goto LABEL_31;
        }
        id v47 = v34;
        CFStringRef v36 = CloudServicesLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_10004C1B4();
        }

        NSErrorUserInfoKey v35 = v47;
        if (v33)
        {
LABEL_31:
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
          id v44 = [v25 mutableCopy];
          [v44 setObject:v33 forKeyedSubscript:@"keybag"];
          id v48 = v2;
          id v37 = [v24 mutableCopy];
          [v37 setObject:v44 forKeyedSubscript:@"com.apple.securebackup.keychain"];
          [v37 setObject:v48 forKeyedSubscript:kSecureBackupTimestampKey];
          id v38 = [objc_alloc((Class)NSString) initWithFormat:@"%@.%@-tomb", @"com.apple.icdp.backup", @"PCS-MasterKey"];
          [*(id *)(a1 + 32) kvs];
          id v45 = v29;
          __int16 v39 = v35;
          uint64_t v40 = v5;
          __int16 v41 = v31;
          __int16 v43 = v42 = v33;
          [v43 setObject:v37 forKey:v38];

          uint64_t v33 = v42;
          uint64_t v31 = v41;
          id v5 = v40;
          NSErrorUserInfoKey v35 = v39;
          uint64_t v29 = v45;

          id v2 = v48;
        }
      }
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    [*(id *)(a1 + 32) doSynchronize];
  }
}

void sub_10002A93C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_10002A980(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataUsingEncoding:4];
  id v3 = *(void **)(a1 + 40);
  id v4 = [v3 kvs];
  id v5 = [v3 _getICDPBackupFromKVS:v4 forView:@"iCloudIdentity"];

  if (v5)
  {
    id v6 = [v5 objectForKeyedSubscript:@"com.apple.securebackup.keychain"];
    id v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v5 objectForKeyedSubscript:kSecureBackupTimestampKey];
      *(_DWORD *)long long buf = 138412546;
      CFStringRef v36 = @"iCloudIdentity";
      __int16 v37 = 2112;
      id v38 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Retrieving backup for view %@ from %@", buf, 0x16u);
    }
    if (v6)
    {
      id v9 = CloudServicesLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        CFStringRef v36 = @"iCloudIdentity";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "verifying rk against backup view %@", buf, 0xCu);
      }

      unsigned int v10 = [v6 objectForKeyedSubscript:@"keybag"];
      uint64_t v11 = [v6 objectForKeyedSubscript:@"backup"];
      id v12 = (void *)v11;
      if (v10 && v11)
      {
        uint64_t v13 = *(void **)(a1 + 40);
        id v34 = 0;
        unsigned __int8 v14 = [v13 verifyRKWithKeyBag:v10 password:v2 error:&v34];
        id v15 = v34;
        id v16 = v34;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v14;
        if (v16)
        {
          id v17 = CloudServicesLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_10004C2B8();
          }

          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v15);
        }
      }
    }
  }
  id v18 = *(void **)(a1 + 40);
  uint64_t v19 = [v18 kvs];
  id v20 = [v18 _getICDPBackupFromKVS:v19 forView:@"PCS-MasterKey"];

  if (v20)
  {
    id v21 = [v20 objectForKeyedSubscript:@"com.apple.securebackup.keychain"];
    uint64_t v22 = CloudServicesLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      NSErrorUserInfoKey v23 = [v20 objectForKeyedSubscript:kSecureBackupTimestampKey];
      *(_DWORD *)long long buf = 138412546;
      CFStringRef v36 = @"PCS-MasterKey";
      __int16 v37 = 2112;
      id v38 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Retrieving backup for view %@ from %@", buf, 0x16u);
    }
    if (v21)
    {
      CFStringRef v24 = CloudServicesLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        CFStringRef v36 = @"PCS-MasterKey";
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "restoring backup view %@", buf, 0xCu);
      }

      id v25 = [v21 objectForKeyedSubscript:@"keybag"];
      uint64_t v26 = [v21 objectForKeyedSubscript:@"backup"];
      uint64_t v27 = (void *)v26;
      if (v25 && v26)
      {
        uint64_t v28 = *(void **)(a1 + 40);
        id v33 = 0;
        unsigned __int8 v29 = [v28 verifyRKWithKeyBag:v25 password:v2 error:&v33];
        id v30 = v33;
        id v31 = v33;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v29;
        if (v31)
        {
          uint64_t v32 = CloudServicesLog();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            sub_10004C2B8();
          }

          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v30);
        }
      }
    }
  }
}

void sub_10002B02C(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10002B324(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Escrow recovery completed with possible error: %@", (uint8_t *)&v8, 0xCu);
  }

  kdebug_trace();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10002BAE0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = CloudServicesLog();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10004C320();
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "escrowService storeRecordWithRequest: succeeded", v8, 2u);
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
}

void sub_10002BD34(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = CloudServicesLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "escrowService deleteRecordWithRequest: returned: %@", (uint8_t *)&v6, 0xCu);
    }

    [*(id *)(a1 + 32) setDeleteError:v4];
  }
  [*(id *)(a1 + 40) _deleteAlliCDPRecordsWithContext:*(void *)(a1 + 32)];
}

void sub_10002C018(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
  else
  {
    id v5 = [a2 objectForKeyedSubscript:kSecureBackupAlliCDPRecordsKey];
    id v6 = objc_alloc_init((Class)NSMutableArray);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v20;
      uint64_t v11 = kSecureBackupRecordIDKey;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "objectForKeyedSubscript:", v11, (void)v19);
          if (v13) {
            [v6 addObject:v13];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    if ([v6 count])
    {
      unsigned __int8 v14 = objc_alloc_init(SecureBackupDeletionContext);
      [(SecureBackupDeletionContext *)v14 setRequest:*(void *)(a1 + 32)];
      id v15 = [(SecureBackupDeletionContext *)v14 request];
      [v15 setIcdp:1];

      [(SecureBackupDeletionContext *)v14 setCompletionBlock:*(void *)(a1 + 48)];
      id v16 = [EscrowService alloc];
      id v17 = [*(id *)(a1 + 40) operationsLogger];
      id v18 = [(EscrowService *)v16 initWithOperationsLogger:v17];
      [(SecureBackupDeletionContext *)v14 setEscrowService:v18];

      [(SecureBackupDeletionContext *)v14 setRecordIDs:v6];
      [(SecureBackupDeletionContext *)v14 setDeleteError:0];
      [*(id *)(a1 + 40) _deleteAlliCDPRecordsWithContext:v14];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void sub_10002C4A8(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v6 = kSecureBackupBackOffDateKey;
    id v7 = [v10 objectForKeyedSubscript:kSecureBackupBackOffDateKey];
    uint64_t v8 = kSecureBackupStingrayMetadataHashKey;
    id v9 = [v10 objectForKeyedSubscript:kSecureBackupStingrayMetadataHashKey];
    if (v7) {
      [v5 setObject:v7 forKeyedSubscript:v6];
    }
    if (v9) {
      [v5 setObject:v9 forKeyedSubscript:v8];
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10002D0E4(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    id v4 = CloudServicesLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [v3 callStackSymbols];
      objc_claimAutoreleasedReturnValue();
      sub_10004C570();
    }

    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v6 = [v3 name];
    [v5 setObject:v6 forKeyedSubscript:NSLocalizedDescriptionKey];

    id v7 = [v3 reason];
    [v5 setObject:v7 forKeyedSubscript:NSLocalizedFailureReasonErrorKey];

    uint64_t v8 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v5];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v8);

    objc_end_catch();
    JUMPOUT(0x10002D05CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_10002D21C(uint64_t a1, void *a2)
{
  id v3 = a2;
  double Nanoseconds = _CloudServicesSignpostGetNanoseconds(*(void *)(a1 + 56), *(void *)(a1 + 64));
  id v5 = _CloudServicesSignpostLogSystem();
  uint64_t v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 56);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    uint64_t v8 = [v3 domain];
    id v9 = (void *)v8;
    if (v8) {
      CFStringRef v10 = (const __CFString *)v8;
    }
    else {
      CFStringRef v10 = &stru_100072CF8;
    }
    int v20 = 138543618;
    CFStringRef v21 = v10;
    __int16 v22 = 1026;
    LODWORD(v23) = [v3 code];
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, v7, "DisableWithRequest", " ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x12u);
  }
  uint64_t v11 = _CloudServicesSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v12 = *(const __CFString **)(a1 + 56);
    double v13 = Nanoseconds / 1000000000.0;
    uint64_t v14 = [v3 domain];
    id v15 = (void *)v14;
    if (v14) {
      CFStringRef v16 = (const __CFString *)v14;
    }
    else {
      CFStringRef v16 = &stru_100072CF8;
    }
    unsigned int v17 = [v3 code];
    int v20 = 134218754;
    CFStringRef v21 = v12;
    __int16 v22 = 2048;
    double v23 = v13;
    __int16 v24 = 2114;
    CFStringRef v25 = v16;
    __int16 v26 = 1026;
    unsigned int v27 = v17;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: DisableWithRequest  ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x26u);
  }
  id v18 = [*(id *)(a1 + 32) operationsLogger];
  long long v19 = [*(id *)(a1 + 40) endEventWithResults:&__NSDictionary0__struct error:v3];
  [v18 updateStoreWithEvent:v19];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10002D448(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    [*(id *)(a1 + 32) disableiCDPBackup];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10002D4B0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    os_signpost_id_t v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "escrowService deleteRecordWithRequest: returned: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (([*(id *)(a1 + 32) stingray] & 1) == 0)
  {
    if (([*(id *)(a1 + 32) icdp] & 1) == 0)
    {
      if (([*(id *)(a1 + 40) _backupEnabled] & 1) == 0)
      {
        uint64_t v10 = *(void *)(a1 + 56);
        if (!v10) {
          goto LABEL_14;
        }
        id v9 = *(void (**)(void))(v10 + 16);
        goto LABEL_13;
      }
      [*(id *)(a1 + 40) _disableBackup];
      [*(id *)(a1 + 40) _removeUsesEscrow];
    }
    if (!*(void *)(a1 + 32)) {
      notify_post("com.apple.EscrowSecurityAlert.reset");
    }
  }
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8)
  {
    id v9 = *(void (**)(void))(v8 + 16);
LABEL_13:
    v9();
  }
LABEL_14:
}

void sub_10002DC3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  if (a2 == 1)
  {
    id v20 = objc_begin_catch(exception_object);
    CFStringRef v21 = CloudServicesLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      [v20 callStackSymbols];
      objc_claimAutoreleasedReturnValue();
      sub_10004C5C0();
    }

    id v22 = objc_alloc_init((Class)NSMutableDictionary);
    double v23 = [v20 name];
    [v22 setObject:v23 forKeyedSubscript:NSLocalizedDescriptionKey];

    __int16 v24 = [v20 reason];
    [v22 setObject:v24 forKeyedSubscript:NSLocalizedFailureReasonErrorKey];

    CFStringRef v25 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v22];
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v25);

    objc_end_catch();
    JUMPOUT(0x10002DAE0);
  }
  _Unwind_Resume(exception_object);
}

void sub_10002DDA8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = [v4 domain];
    unsigned int v7 = [v6 isEqualToString:kEscrowServiceErrorDomain];

    if (v7 && [v5 code] == (id)-5012)
    {
      uint64_t v8 = kSecureBackupErrorDomain;
      id v9 = [v5 userInfo];
      uint64_t v10 = +[NSError errorWithDomain:v8 code:29 userInfo:v9];

      id v5 = (void *)v10;
    }
    int v11 = CloudServicesLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      uint64_t v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "updateRecordMetadataWithRequest: returned: %@", (uint8_t *)&v13, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v12 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v12();
  }
}

void sub_10002F484(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v14 = [v5 objectForKeyedSubscript:@"recoveryChallengeCodeLength"];
    [v7 setObject:v14 forKeyedSubscript:kSecureBackupRecoveryVerificationTokenLengthKey];

    id v15 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_12;
  }
  id v7 = v6;
  uint64_t v8 = [v6 domain];
  unsigned int v9 = [v8 isEqualToString:kEscrowServiceErrorDomain];

  if (v9)
  {
    if ([v7 code] == (id)-4002)
    {
      uint64_t v10 = kSecureBackupErrorDomain;
      int v11 = [v7 userInfo];
      uint64_t v12 = v10;
      uint64_t v13 = 27;
LABEL_8:
      uint64_t v17 = +[NSError errorWithDomain:v12 code:v13 userInfo:v11];

      id v7 = (id)v17;
      goto LABEL_9;
    }
    if ([v7 code] == (id)-4007)
    {
      uint64_t v16 = kSecureBackupErrorDomain;
      int v11 = [v7 userInfo];
      uint64_t v12 = v16;
      uint64_t v13 = 28;
      goto LABEL_8;
    }
  }
LABEL_9:
  id v18 = CloudServicesLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "escrowService startSMSChallengeWithRequest: returned: %@", (uint8_t *)&v19, 0xCu);
  }

  id v15 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_12:
  v15();
}

void sub_10002FA1C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "escrowService getCountrySMSCodesWithRequest: returned: %@", (uint8_t *)&v16, 0xCu);
    }

    unsigned int v9 = [v7 domain];
    unsigned int v10 = [v9 isEqualToString:kEscrowServiceErrorDomain];

    if (v10)
    {
      uint64_t v11 = kSecureBackupErrorDomain;
      uint64_t v12 = [v7 userInfo];
      uint64_t v13 = +[NSError errorWithDomain:v11 code:24 userInfo:v12];

      id v7 = (id)v13;
    }
    uint64_t v14 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    id v15 = [v5 objectForKeyedSubscript:@"EscrowServiceCountrySMSCodes"];
    [v7 setObject:v15 forKeyedSubscript:kSecureBackupCountrySMSCodesKey];

    uint64_t v14 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v14();
}

void sub_100030230(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a2 == 1)
  {
    id v18 = objc_begin_catch(exception_object);
    int v19 = CloudServicesLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      [v18 callStackSymbols];
      objc_claimAutoreleasedReturnValue();
      sub_10004CCC0();
    }

    id v20 = objc_alloc_init((Class)NSMutableDictionary);
    CFStringRef v21 = [v18 name];
    [v20 setObject:v21 forKeyedSubscript:NSLocalizedDescriptionKey];

    id v22 = [v18 reason];
    [v20 setObject:v22 forKeyedSubscript:NSLocalizedFailureReasonErrorKey];

    double v23 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:24 userInfo:v20];
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v23);

    objc_end_catch();
    JUMPOUT(0x1000301D4);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000303A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "escrowService changeSMSTargetWithRequest: returned: %@", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v8 = [v6 domain];
    unsigned int v9 = [v8 isEqualToString:kEscrowServiceErrorDomain];

    if (v9 && [v6 code] == (id)-5012)
    {
      uint64_t v10 = kSecureBackupErrorDomain;
      uint64_t v11 = [v6 userInfo];
      uint64_t v12 = +[NSError errorWithDomain:v10 code:29 userInfo:v11];

      id v6 = (id)v12;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100030B0C(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v8)
  {
    uint64_t v11 = CloudServicesLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10004CDE0();
    }

    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    if (v9)
    {
      uint64_t v12 = CloudServicesLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10004CD78();
      }
    }
    int v13 = (void *)a1[4];
    id v19 = 0;
    unsigned int v14 = [v13 cacheStoredCertificate:v7 error:&v19];
    id v15 = v19;
    int v16 = v15;
    if (!v14 || v15)
    {
      id v18 = CloudServicesLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10004CD10();
      }

      (*(void (**)(void))(a1[7] + 16))();
    }
    else
    {
      id v17 = [objc_alloc((Class)SecureBackupBeginPasscodeRequestResults) initWithStoredCertificate:v7 uuid:a1[5]];
      (*(void (**)(void))(a1[7] + 16))();
    }
  }
}

void sub_100030D9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100030E24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100031E94(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v8 = [v6 escrowCertificate];
  id v7 = [v6 duplicateEscrowCertificate];

  (*(void (**)(uint64_t, void, id, void *, id))(v4 + 16))(v4, 0, v8, v7, v5);
}

uint64_t sub_100032240(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100032874(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = CloudServicesLog();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10004C320();
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "escrowService storeRecordWithRequest: succeeded", v8, 2u);
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v7();
}

void sub_100032BC8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    id v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Guitarfish token recovery returned: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v8 = [a2 objectForKeyedSubscript:kEscrowServiceRecordDataKey];
    uint64_t v9 = kSecureBackupKeybagSHA256Key;
    uint64_t v10 = [v8 objectForKeyedSubscript:kSecureBackupKeybagSHA256Key];
    uint64_t v11 = [v8 objectForKeyedSubscript:kSecureBackupBagPasswordKey];
    uint64_t v12 = [v8 objectForKeyedSubscript:@"BackupVersion"];
    uint64_t v13 = kSecureBackupTimestampKey;
    unsigned int v14 = [v8 objectForKeyedSubscript:kSecureBackupTimestampKey];
    if ([v12 isEqualToString:@"1"])
    {
      v17[0] = v9;
      v17[1] = kSecureBackupiCloudIdentityDataKey;
      v18[0] = v10;
      v18[1] = v11;
      v17[2] = @"BackupVersion";
      v17[3] = v13;
      v18[2] = v12;
      v18[3] = v14;
      id v15 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      id v6 = 0;
    }
    else
    {
      int v16 = CloudServicesLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "guitarfish token data version does not match version in escrow", buf, 2u);
      }

      NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
      CFStringRef v20 = @"guitarfish token data version does not match version in escrow";
      id v15 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      id v6 = +[NSError errorWithDomain:kSecureBackupErrorDomain code:3 userInfo:v15];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

id sub_100033010()
{
  v2[0] = kSecClass;
  v2[1] = kSecAttrAccessGroup;
  v3[0] = kSecClassGenericPassword;
  v3[1] = @"com.apple.sbd";
  v2[2] = kSecAttrAccessible;
  v2[3] = kSecAttrAccount;
  v3[2] = kSecAttrAccessibleWhenUnlocked;
  v3[3] = @"SecureBackupPublicKeybag";
  v2[4] = kSecAttrService;
  v2[5] = kSecAttrSynchronizable;
  v3[4] = @"SecureBackupService";
  v3[5] = kCFBooleanTrue;
  v0 = +[NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:6];

  return v0;
}

void sub_100033120(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t sub_100033138(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 4) = v3;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = result;
  *(_WORD *)(a3 + 22) = 2112;
  *(void *)(a3 + 24) = a2;
  return result;
}

void sub_100033154(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x20u);
}

void sub_100033180(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1000331C0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_1000331E0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_100033204(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_100033218(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

id sub_1000332D8(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:*(void *)(a1 + 32)];
}

void sub_1000336E4(uint64_t a1)
{
  uint64_t v2 = CloudServicesLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) currentRequest];
    uint64_t v4 = [v3 URL];
    uint64_t v5 = [*(id *)(a1 + 32) originalRequest];
    id v6 = [v5 URL];
    id v7 = [*(id *)(a1 + 40) URL];
    id v8 = [*(id *)(a1 + 48) allHeaderFields];
    int v12 = 138413058;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    NSErrorUserInfoKey v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "redirect: current URL = %@, original URL = %@, new URL = %@, response headers = %@", (uint8_t *)&v12, 0x2Au);
  }
  uint64_t v9 = [*(id *)(a1 + 32) currentRequest];
  id v10 = [v9 mutableCopy];

  uint64_t v11 = [*(id *)(a1 + 40) URL];
  [v10 setURL:v11];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_100033BB8(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033CBC;
  block[3] = &unk_100071A78;
  id v10 = a1[4];
  uint64_t v11 = (void *)a1[6];
  void block[4] = a1[5];
  id v16 = v9;
  id v17 = v8;
  id v18 = v7;
  id v19 = v11;
  id v12 = v7;
  id v13 = v8;
  id v14 = v9;
  os_activity_apply(v10, block);
}

void sub_100033CBC(uint64_t a1)
{
  uint64_t v2 = CloudServicesLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) loggingDescription];
    *(_DWORD *)long long buf = 138412290;
    __int16 v24 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@: escrow proxy request returned", buf, 0xCu);
  }
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    id v10 = objc_msgSend(objc_alloc((Class)objc_msgSend(v5, "responseClass")), "initWithURLResponse:data:", *(void *)(a1 + 48), *(void *)(a1 + 56));
    id v4 = [v10 error];

    if (!v4) {
      goto LABEL_23;
    }
    uint64_t v11 = [v10 error];
    id v12 = [v11 userInfo];
    id v4 = [v12 objectForKeyedSubscript:@"retryAfterDate"];

    if (v4)
    {
      id v13 = CloudServicesLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10004D428((uint64_t)v4, v13);
      }

      objc_storeStrong((id *)&qword_100081078, v4);
    }
    uint64_t v9 = [v10 error];
    goto LABEL_16;
  }
  if ([v5 pinningFailure])
  {
    id v6 = CloudServicesLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10004D4A0(v6);
    }

    int v7 = sub_100004254();
    CFStringRef v8 = &stru_100072CF8;
    if (v7) {
      CFStringRef v8 = @", please see rdar://problem/15631298";
    }
    uint64_t v9 = +[CloudServicesError errorWithCode:310, v4, @"Certificate pinning error%@", v8 error format];
    id v10 = 0;
LABEL_16:

    if (!v9)
    {
      id v4 = 0;
      goto LABEL_23;
    }
    id v4 = (id)v9;
    goto LABEL_19;
  }
  id v10 = 0;
LABEL_19:
  id v14 = CloudServicesLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_10004D39C((uint64_t)v4, v14);
  }

LABEL_23:
  id v15 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033FB4;
  block[3] = &unk_100071A50;
  id v16 = *(id *)(a1 + 64);
  id v21 = v4;
  id v22 = v16;
  id v20 = v10;
  id v17 = v4;
  id v18 = v10;
  dispatch_async(v15, block);
}

uint64_t sub_100033FB4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_1000344B8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  int v7 = [v6 operations];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100034580;
  v10[3] = &unk_100071BB8;
  id v8 = *(id *)(a1 + 32);
  id v11 = v6;
  id v12 = v8;
  uint64_t v13 = a4;
  id v9 = v6;
  [v7 enumerateObjectsUsingBlock:v10];
}

uint64_t sub_100034580(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  char v8 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  char v7 = v8;
  *a4 = v8;
  **(unsigned char **)(a1 + 48) = v7;
  return result;
}

void sub_100035414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

void sub_100035454(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (([a2 isEqual:v5] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
    [*(id *)(a1 + 40) insertObject:v5 atIndex:0];
  }
  unsigned __int8 v6 = [v5 isComplete];
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v7 + 9)) {
    unsigned __int8 v8 = v6;
  }
  else {
    unsigned __int8 v8 = 0;
  }
  *(unsigned char *)(v7 + 9) = v8;
  unsigned __int8 v9 = [v5 isStaleWithcontext:*(void *)(a1 + 48)];
  uint64_t v10 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v10 + 10)) {
    unsigned __int8 v11 = v9;
  }
  else {
    unsigned __int8 v11 = 0;
  }
  *(unsigned char *)(v10 + 10) = v11;
  unint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  id v13 = [*(id *)(a1 + 48) operationRecordRetentionMaxCount];
  unsigned int v14 = [v5 isComplete];
  if (v12 >= (unint64_t)v13)
  {
    id v15 = @"incomplete";
    if (v14) {
      id v15 = @"complete";
    }
    id v16 = v15;
    id v17 = [v5 startTimestamp];
    id v18 = +[NSTimeZone defaultTimeZone];
    id v19 = +[NSISO8601DateFormatter stringFromDate:v17 timeZone:v18 formatOptions:1907];

    id v20 = CloudServicesLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 48) operationRecordRetentionMaxCount]);
      id v22 = [v5 id];
      double v23 = [v22 UUIDString];
      int v24 = 138413058;
      CFStringRef v25 = v21;
      __int16 v26 = 2112;
      unsigned int v27 = v16;
      __int16 v28 = 2112;
      unsigned __int8 v29 = v23;
      __int16 v30 = 2112;
      id v31 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Total operation count is greater than %@, reaping %@ operation %@ from %@.", (uint8_t *)&v24, 0x2Au);
    }
    [*(id *)(a1 + 56) addObject:v5];
  }
  else
  {
    if ((v14 & 1) == 0) {
      [*(id *)(a1 + 64) addObject:v5];
    }
    [*(id *)(a1 + 72) insertObject:v5 atIndex:0];
    ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  }
}

void sub_100035D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_100035D94(void *a1, void *a2)
{
  id v21 = a2;
  if ([v21 shouldReap])
  {
    uint64_t v3 = (void *)a1[6];
    id v4 = [v21 activity];
    [v3 addObject:v4];

    id v5 = (void *)a1[4];
    unsigned __int8 v6 = [v21 activity];
    uint64_t v7 = [v6 operations];
    [v5 addObjectsFromArray:v7];
  }
  else
  {
    unsigned __int8 v8 = [v21 activity];
    unsigned __int8 v9 = [v8 operations];
    *(void *)(*(void *)(a1[11] + 8) + 24) += [v9 count];

    uint64_t v10 = (void *)a1[4];
    unsigned __int8 v11 = [v21 reapedOperations];
    [v10 addObjectsFromArray:v11];

    unint64_t v12 = (void *)a1[5];
    unsigned __int8 v6 = [v21 activity];
    [v12 insertObject:v6 atIndex:0];
  }

  if ([v21 didChange])
  {
    id v13 = (void *)a1[7];
    unsigned int v14 = [v21 activity];
    [v13 addObject:v14];

    id v15 = (void *)a1[8];
    id v16 = [v21 updatedOperations];
    [v15 addObjectsFromArray:v16];
  }
  if (([v21 isComplete] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[12] + 8) + 24) = 0;
    id v17 = (void *)a1[9];
    id v18 = [v21 activity];
    [v17 addObject:v18];

    id v19 = (void *)a1[10];
    id v20 = [v21 activeOperations];
    [v19 addObjectsFromArray:v20];
  }
}

uint64_t sub_100037138(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  id v4 = &selRef_setSpecifiedFederation_;
  id v5 = &selRef_setSpecifiedFederation_;
  unsigned __int8 v6 = &selRef_setSpecifiedFederation_;
  while (2)
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v7 = 0;
    unsigned int v8 = 0;
    unint64_t v9 = 0;
    while (1)
    {
      unint64_t v10 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v10 == -1 || v10 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v11 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v10);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v10 + 1;
      v9 |= (unint64_t)(v11 & 0x7F) << v7;
      if ((v11 & 0x80) == 0) {
        goto LABEL_12;
      }
      v7 += 7;
      BOOL v12 = v8++ >= 9;
      if (v12)
      {
        unint64_t v9 = 0;
        int v13 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_12:
    int v13 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v9 = 0;
    }
LABEL_14:
    if (v13 || (v9 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v9 >> 3))
    {
      case 1u:
        uint64_t v15 = PBReaderReadString();
        uint64_t v16 = *((int *)v4 + 563);
        goto LABEL_39;
      case 2u:
        uint64_t v15 = PBReaderReadString();
        uint64_t v16 = *((int *)v5 + 564);
        goto LABEL_39;
      case 3u:
        uint64_t v15 = PBReaderReadString();
        uint64_t v16 = *((int *)v6 + 565);
        goto LABEL_39;
      case 4u:
        uint64_t v15 = PBReaderReadData();
        uint64_t v16 = 40;
        goto LABEL_39;
      case 5u:
        uint64_t v15 = PBReaderReadString();
        uint64_t v16 = 96;
        goto LABEL_39;
      case 6u:
        uint64_t v15 = PBReaderReadData();
        uint64_t v16 = 88;
        goto LABEL_39;
      case 7u:
        uint64_t v15 = PBReaderReadData();
        uint64_t v16 = 80;
        goto LABEL_39;
      case 8u:
        uint64_t v15 = PBReaderReadString();
        uint64_t v16 = 104;
        goto LABEL_39;
      case 9u:
        uint64_t v15 = PBReaderReadString();
        uint64_t v16 = 8;
        goto LABEL_39;
      case 0xAu:
        uint64_t v15 = PBReaderReadData();
        uint64_t v16 = 48;
        goto LABEL_39;
      case 0xBu:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 112) |= 1u;
        while (2)
        {
          unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v21 == -1 || v21 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v22 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
            v20 |= (unint64_t)(v22 & 0x7F) << v18;
            if (v22 < 0)
            {
              v18 += 7;
              BOOL v12 = v19++ >= 9;
              if (v12)
              {
                LODWORD(v20) = 0;
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_48:
        *(_DWORD *)(a1 + 72) = v20;
        goto LABEL_40;
      case 0xCu:
        uint64_t v15 = PBReaderReadData();
        uint64_t v16 = 24;
LABEL_39:
        double v23 = *(void **)(a1 + v16);
        *(void *)(a1 + v16) = v15;

        goto LABEL_40;
      case 0xDu:
        int v24 = v6;
        CFStringRef v25 = v5;
        __int16 v26 = v4;
        unsigned int v27 = objc_alloc_init(EscrowPrerecordPasscodeGeneration);
        objc_storeStrong((id *)(a1 + 64), v27);
        if PBReaderPlaceMark() && (sub_100045984((uint64_t)v27, a2))
        {
          PBReaderRecallMark();

          id v4 = v26;
          id v5 = v25;
          unsigned __int8 v6 = v24;
LABEL_40:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_40;
    }
  }
}

void sub_1000388C8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    unsigned __int8 v6 = v5;
    char v7 = +[CloudServicesError errorWithCode:305 error:v5 format:@"Error getting account info"];
  }
  else
  {
    CFStringRef v9 = @"EscrowServiceAccountInfo";
    unsigned int v8 = [a2 accountInfo];
    unint64_t v10 = v8;
    char v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000390C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Fetched certificates with result: %@ %@)", (uint8_t *)&v17, 0x16u);
  }

  if (v6)
  {
    unsigned int v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10004D94C();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    CFStringRef v9 = [v5 error];

    if (v9)
    {
      unint64_t v10 = CloudServicesLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10004D8C0(v5, v10);
      }

      uint64_t v11 = *(void *)(a1 + 40);
      BOOL v12 = [v5 error];
      (*(void (**)(uint64_t, void, StoredCertificate *))(v11 + 16))(v11, 0, v12);
    }
    else
    {
      if (v5)
      {
        BOOL v12 = objc_alloc_init(StoredCertificate);
        int v13 = [*(id *)(a1 + 32) iCloudEnv];
        [(StoredCertificate *)v12 setICloudEnvironment:v13];

        unsigned int v14 = [*(id *)(a1 + 32) baseURL];
        [(StoredCertificate *)v12 setEscrowBaseURL:v14];

        uint64_t v15 = [*(id *)(a1 + 32) dsid];
        [(StoredCertificate *)v12 setDsid:v15];

        uint64_t v16 = [v5 cert];
        [(StoredCertificate *)v12 setEscrowCertificate:v16];
      }
      else
      {
        BOOL v12 = 0;
      }
      (*(void (**)(void, StoredCertificate *, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v12, 0);
    }
  }
}

uint64_t sub_1000393B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (!(a3 | a4)) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(v4 + 16))(v4, a2, 0);
  }
  if (!a3) {
    a3 = a4;
  }
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(v4 + 16))(v4, 0, a3);
}

void sub_100039744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 224), 8);
  _Block_object_dispose((const void *)(v37 - 176), 8);
  _Block_object_dispose((const void *)(v37 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003978C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10003979C(uint64_t a1)
{
}

void sub_1000397A4(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100039854;
  v4[3] = &unk_100071CC8;
  long long v6 = *(_OWORD *)(a1 + 56);
  id v5 = *(id *)(a1 + 32);
  [v2 _fetchCertificatesWithRequest:v3 duplicate:0 completionBlock:v4];
}

void sub_100039854(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  unsigned int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000398F0(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000399A0;
  v4[3] = &unk_100071CC8;
  long long v6 = *(_OWORD *)(a1 + 56);
  id v5 = *(id *)(a1 + 32);
  [v2 _fetchCertificatesWithRequest:v3 duplicate:1 completionBlock:v4];
}

void sub_1000399A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[CloudServicesAnalytics logger];
  [v7 logResultForEvent:CloudServicesAnalyticsDoubleGetClubCert hardFailure:1 result:v6];

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v13 = v5;

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
  id v12 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_100039A6C(void *a1)
{
  uint64_t v2 = CloudServicesLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1[5] + 8) + 40);
    uint64_t v4 = *(void *)(*(void *)(a1[6] + 8) + 40);
    uint64_t v5 = *(void *)(*(void *)(a1[7] + 8) + 40);
    uint64_t v6 = *(void *)(*(void *)(a1[8] + 8) + 40);
    int v10 = 138413058;
    uint64_t v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Returning fetch result of: %@ %@ %@ %@)", (uint8_t *)&v10, 0x2Au);
  }

  uint64_t v7 = *(void **)(*(void *)(a1[7] + 8) + 40);
  if (v7)
  {
    uint64_t v8 = [v7 escrowCertificate];
    [*(id *)(*(void *)(a1[5] + 8) + 40) setDuplicateEscrowCertificate:v8];
  }
  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

void sub_10003A8B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose((const void *)(v44 - 232), 8);
  _Block_object_dispose((const void *)(v44 - 184), 8);
  _Unwind_Resume(a1);
}

void sub_10003A8F8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v9 = a2;
  uint64_t v7 = [v5 operationsLogger];
  uint64_t v8 = [*(id *)(a1 + 40) endEventWithResults:v9 error:v6];
  [v7 updateStoreWithEvent:v8];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10003A9AC(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003AA5C;
  v4[3] = &unk_100071D40;
  long long v6 = *(_OWORD *)(a1 + 56);
  id v5 = *(id *)(a1 + 32);
  [v2 _storeRecordWithRequest:v3 duplicate:0 completionBlock:v4];
}

void sub_10003AA5C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10003AAF8(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003ABA8;
  v4[3] = &unk_100071D40;
  long long v6 = *(_OWORD *)(a1 + 56);
  id v5 = *(id *)(a1 + 32);
  [v2 _storeRecordWithRequest:v3 duplicate:1 completionBlock:v4];
}

void sub_10003ABA8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[CloudServicesAnalytics logger];
  [v7 logResultForEvent:CloudServicesAnalyticsDoubleEnrollment hardFailure:1 result:v6];

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v13 = v5;

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
  id v12 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_10003AC74(uint64_t a1)
{
  if ([*(id *)(a1 + 32) requiresDoubleEnrollment])
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
      && !*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      uint64_t v4 = CloudServicesLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = [*(id *)(a1 + 32) passphrase];
        if (v5) {
          id v6 = "YES";
        }
        else {
          id v6 = "NO";
        }
        if ([*(id *)(a1 + 32) stingray]) {
          uint64_t v7 = "YES";
        }
        else {
          uint64_t v7 = "NO";
        }
        int v11 = 136315394;
        id v12 = v6;
        __int16 v13 = 2080;
        __int16 v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Double enrollment succeeded (passphrase: %s) (PCS: %s)", (uint8_t *)&v11, 0x16u);
      }
      unsigned int v8 = [*(id *)(a1 + 32) icdp];
      uint64_t v9 = *(void **)(a1 + 32);
      if (v8)
      {
        uint64_t v10 = [v9 passphrase];
        if (v10)
        {
        }
        else if (([*(id *)(a1 + 32) stingray] & 1) == 0)
        {
          return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
        }
      }
      else if (![v9 stingray])
      {
        return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      [*(id *)(a1 + 40) _performPostEnrollSilentRecoveryWithRequest:*(void *)(a1 + 32)];
      return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    uint64_t v2 = CloudServicesLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10004DBCC();
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10003AFD8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    __int16 v16 = [v5 cert];
    [*(id *)(a1 + 32) setCertData:v16];

    uint64_t v17 = [*(id *)(a1 + 32) certData];

    if (v17)
    {
      id v18 = [*(id *)(a1 + 32) dsid];
      __int16 v19 = [v5 dsid];
      unsigned __int8 v20 = [v18 isEqualToString:v19];

      if (v20)
      {
        [*(id *)(a1 + 40) storeRecordWithCertDataRequest:*(void *)(a1 + 32) duplicate:*(unsigned __int8 *)(a1 + 56) completionBlock:*(void *)(a1 + 48)];
        goto LABEL_21;
      }
      double v23 = CloudServicesLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_10004DC40((id *)(a1 + 32), v5, v23);
      }

      unint64_t v21 = +[CloudServicesError errorWithDomain:kEscrowServiceErrorDomain code:99 format:@"Mismatched user credential"];
    }
    else
    {
      unint64_t v21 = +[CloudServicesError errorWithDomain:kEscrowServiceErrorDomain code:124 format:@"Unexpected error with encoded certificate"];
      char v22 = CloudServicesLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138412290;
        CFStringRef v25 = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Certificate encoding error: %@", (uint8_t *)&v24, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

    goto LABEL_21;
  }
  uint64_t v7 = v6;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  [v8 setObject:v7 forKeyedSubscript:NSUnderlyingErrorKey];
  uint64_t v9 = [v7 userInfo];
  uint64_t v10 = [v9 objectForKeyedSubscript:NSUnderlyingErrorKey];

  id v11 = [v10 code];
  if (v11 == (id)401) {
    CFStringRef v12 = @"Unauthorized";
  }
  else {
    CFStringRef v12 = @"Unexpected error getting club cert";
  }
  if (v11 == (id)401) {
    uint64_t v13 = 99;
  }
  else {
    uint64_t v13 = 96;
  }
  [v8 setObject:v12 forKeyedSubscript:NSLocalizedDescriptionKey];
  __int16 v14 = +[NSError errorWithDomain:kEscrowServiceErrorDomain code:v13 userInfo:v8];

  uint64_t v15 = CloudServicesLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10004DD08();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_21:
}

void sub_10003B9D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    [v8 setObject:v7 forKeyedSubscript:NSUnderlyingErrorKey];
    uint64_t v9 = [v7 userInfo];
    uint64_t v10 = [v9 objectForKeyedSubscript:NSUnderlyingErrorKey];

    if ([v10 code] == (id)401)
    {
      [v8 setObject:@"Unauthorized" forKeyedSubscript:NSLocalizedDescriptionKey];
      uint64_t v11 = +[NSError errorWithDomain:kEscrowServiceErrorDomain code:99 userInfo:v8];

      id v7 = (id)v11;
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    if (([*(id *)(a1 + 32) stingray] & 1) != 0
      || ([v5 bypassToken], CFStringRef v12 = objc_claimAutoreleasedReturnValue(), v12, !v12))
    {
      uint64_t v15 = CloudServicesLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Missing bypass token (might not be hooked up in iCloud yet)", buf, 2u);
      }
    }
    else
    {
      [*(id *)(a1 + 40) _removeBypassToken];
      uint64_t v13 = *(void **)(a1 + 40);
      __int16 v14 = [v5 bypassToken];
      [v13 _saveBypassToken:v14];
    }
    __int16 v16 = *(void **)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 48);
    id v20 = 0;
    unsigned __int8 v18 = [v16 _invalidateEscrowCache:v17 error:&v20];
    id v7 = v20;
    if ((v18 & 1) == 0)
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      goto LABEL_14;
    }
    uint64_t v19 = *(void *)(a1 + 56);
    CFStringRef v22 = @"EscrowServiceCertificate";
    uint64_t v23 = v19;
    id v8 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }

LABEL_14:
}

void sub_10003C9A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v30 = 0;
  unsigned __int8 v9 = [v7 _invalidateEscrowCache:v8 error:&v30];
  id v10 = v30;
  if ((v9 & 1) == 0)
  {
    uint64_t v11 = CloudServicesLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10004DF0C();
    }
  }
  if (v6)
  {
    if ([v6 code] != (id)-6015)
    {
      id v12 = objc_alloc_init((Class)NSMutableDictionary);
      uint64_t v13 = [v6 localizedDescription];
      [v12 setObject:v13 forKeyedSubscript:NSLocalizedDescriptionKey];

      [v12 setObject:v6 forKeyedSubscript:NSUnderlyingErrorKey];
      uint64_t v14 = +[NSError errorWithDomain:kEscrowServiceErrorDomain code:99 userInfo:v12];

      id v6 = (id)v14;
    }
    uint64_t v15 = +[NSDate dateWithTimeIntervalSinceNow:5.0];
    +[NSThread sleepUntilDate:v15];

    uint64_t v16 = *(void *)(a1 + 64);
    id v17 = [v5 responseDictionary];
    (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v17, v6);
  }
  else
  {
    unsigned __int8 v18 = *(void **)(a1 + 48);
    uint64_t v19 = [v5 recoveryData];
    id v20 = [*(id *)(a1 + 56) stingray];
    unint64_t v21 = [*(id *)(a1 + 56) iCloudEnv];
    uint64_t v22 = *(unsigned __int8 *)(a1 + 72);
    id v29 = 0;
    id v6 = [v18 decodedEscrowRecordFromData:v19 stingray:v20 env:v21 duplicate:v22 error:&v29];
    id v23 = v29;

    if (v6)
    {
      id v17 = objc_alloc_init((Class)NSMutableDictionary);
      [v17 setObject:v6 forKeyedSubscript:kEscrowServiceRecordDataKey];
      int v24 = [*(id *)(a1 + 48) decodedLabel];
      [v17 setObject:v24 forKeyedSubscript:kEscrowServiceRecordLabelKey];

      CFStringRef v25 = [*(id *)(a1 + 48) escrowDate];
      [v17 setObject:v25 forKeyedSubscript:@"date"];

      [v17 setObject:@"EscrowOperationSucceeded" forKeyedSubscript:@"EscrowOperationStatus"];
      __int16 v26 = [v5 metadata];
      [v17 setObject:v26 forKeyedSubscript:kEscrowServiceRecordMetadataKey];

      unsigned int v27 = [v5 fmipRecoveryData];
      [v17 setObject:v27 forKeyedSubscript:@"EscrowServiceFMiPData"];

      __int16 v28 = [v5 requestUUID];
      [v17 setObject:v28 forKeyedSubscript:@"kEscrowServiceRecoveryUUID"];
    }
    else
    {
      id v17 = +[CloudServicesError errorWithDomain:kCloudServicesErrorDomain code:98 underlyingError:v23 format:@"Error deserializing data"];
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void sub_10003CF6C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v13 = v4;
    id v5 = [v4 code];
    if (((unint64_t)v5 + 4017 > 0xC || ((1 << (v5 - 79)) & 0x1085) == 0)
      && v5 != (id)-6014
      && v5 != (id)-6012)
    {
      id v10 = objc_alloc_init((Class)NSMutableDictionary);
      uint64_t v11 = [v13 localizedDescription];
      [v10 setObject:v11 forKeyedSubscript:NSLocalizedDescriptionKey];

      [v10 setObject:v13 forKeyedSubscript:NSUnderlyingErrorKey];
      uint64_t v12 = +[NSError errorWithDomain:kEscrowServiceErrorDomain code:102 userInfo:v10];

      id v13 = (id)v12;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    unsigned __int8 v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v9();
  }
}

void sub_10003D420(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_17;
  }
  [*(id *)(a1 + 32) setPasswordMetadataWithRequest:*(void *)(a1 + 40) response:v7 ses:v8];
  id v9 = [v7 clubTypeID];
  if (!v9)
  {
    int v16 = _os_feature_enabled_impl();
    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    int v13 = *(unsigned __int8 *)(a1 + 56);
    if (v16)
    {
      BOOL v17 = v13 != 0;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10003DA78;
      v24[3] = &unk_100071E58;
      void v24[4] = v12;
      id v26 = *(id *)(a1 + 48);
      id v25 = *(id *)(a1 + 40);
      char v27 = *(unsigned char *)(a1 + 56);
      [v12 _recoverWithVersion:1 req:v11 duplicate:v17 sesWrapper:v8 srpInitResponse:v7 reply:v24];

      uint64_t v15 = v26;
      goto LABEL_9;
    }
    goto LABEL_14;
  }
  if (v9 == (id)1)
  {
    int v10 = _os_feature_enabled_impl();
    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    int v13 = *(unsigned __int8 *)(a1 + 56);
    if (v10)
    {
      BOOL v14 = v13 != 0;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10003D708;
      v28[3] = &unk_100071E58;
      v28[4] = v12;
      id v30 = *(id *)(a1 + 48);
      id v29 = *(id *)(a1 + 40);
      char v31 = *(unsigned char *)(a1 + 56);
      [v12 _recoverWithVersion:2 req:v11 duplicate:v14 sesWrapper:v8 srpInitResponse:v7 reply:v28];

      uint64_t v15 = v30;
LABEL_9:

      goto LABEL_17;
    }
LABEL_14:
    uint64_t v20 = v13 != 0;
    uint64_t v21 = *(void *)(a1 + 48);
    uint64_t v22 = v12;
    uint64_t v23 = v11;
LABEL_16:
    [v22 _recoverWithVersion:0 req:v23 duplicate:v20 sesWrapper:v8 srpInitResponse:v7 reply:v21];
    goto LABEL_17;
  }
  if (!_os_feature_enabled_impl())
  {
    uint64_t v22 = *(void **)(a1 + 32);
    uint64_t v23 = *(void *)(a1 + 40);
    uint64_t v20 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v21 = *(void *)(a1 + 48);
    goto LABEL_16;
  }
  unsigned __int8 v18 = +[CloudServicesError errorWithDomain:kEscrowServiceErrorDomain code:106 format:@"Unknown/bad ClubTypeID"];
  uint64_t v19 = CloudServicesLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_10004DFA8(v7, v19);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_17:
}

void sub_10003D708(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = _os_feature_enabled_impl();
  if (v6 && v7 && ![(id)objc_opt_class() isFatalError:v6])
  {
    id v9 = CloudServicesLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10004E028();
    }

    int v10 = +[CloudServicesAnalytics logger];
    [v10 logResultForEvent:CloudServicesAnalyticsRequestV2Fallback hardFailure:1 result:v6];

    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(unsigned __int8 *)(a1 + 56);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003D8C8;
    v17[3] = &unk_100071E30;
    id v14 = *(id *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 32);
    int v16 = *(void **)(a1 + 40);
    id v19 = v14;
    void v17[4] = v15;
    id v18 = v16;
    char v20 = *(unsigned char *)(a1 + 56);
    [v11 _srpInitHelper:v12 duplicate:v13 completionBlock:v17];
  }
  else
  {
    id v8 = +[CloudServicesAnalytics logger];
    [v8 logResultForEvent:CloudServicesAnalyticsRequestV2 hardFailure:1 result:v6];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10003D8C8(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) setPasswordMetadataWithRequest:*(void *)(a1 + 40) response:v7 ses:v8];
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 56);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003D9D0;
    void v12[3] = &unk_1000713F8;
    id v13 = *(id *)(a1 + 48);
    [v9 _recoverWithVersion:0 req:v10 duplicate:v11 sesWrapper:v8 srpInitResponse:v7 reply:v12];
  }
}

void sub_10003D9D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v7 = a2;
  id v6 = +[CloudServicesAnalytics logger];
  [v6 logResultForEvent:CloudServicesAnalyticsRequestV2ToV0Fallback hardFailure:1 result:v5];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10003DA78(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = _os_feature_enabled_impl();
  if (v6 && v7 && ![(id)objc_opt_class() isFatalError:v6])
  {
    id v9 = CloudServicesLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10004E090();
    }

    uint64_t v10 = +[CloudServicesAnalytics logger];
    [v10 logResultForEvent:CloudServicesAnalyticsRequestV1Fallback hardFailure:1 result:v6];

    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(unsigned __int8 *)(a1 + 56);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003DC38;
    v17[3] = &unk_100071E30;
    id v14 = *(id *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 32);
    int v16 = *(void **)(a1 + 40);
    id v19 = v14;
    void v17[4] = v15;
    id v18 = v16;
    char v20 = *(unsigned char *)(a1 + 56);
    [v11 _srpInitHelper:v12 duplicate:v13 completionBlock:v17];
  }
  else
  {
    id v8 = +[CloudServicesAnalytics logger];
    [v8 logResultForEvent:CloudServicesAnalyticsRequestV1 hardFailure:1 result:v6];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10003DC38(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) setPasswordMetadataWithRequest:*(void *)(a1 + 40) response:v7 ses:v8];
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 56);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003DD40;
    void v12[3] = &unk_1000713F8;
    id v13 = *(id *)(a1 + 48);
    [v9 _recoverWithVersion:0 req:v10 duplicate:v11 sesWrapper:v8 srpInitResponse:v7 reply:v12];
  }
}

void sub_10003DD40(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v7 = a2;
  id v6 = +[CloudServicesAnalytics logger];
  [v6 logResultForEvent:CloudServicesAnalyticsRequestV1ToV0Fallback hardFailure:1 result:v5];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10003DFD4(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v9 = a2;
  id v7 = [v5 operationsLogger];
  id v8 = [*(id *)(a1 + 40) endEventWithResults:v9 error:v6];
  [v7 updateStoreWithEvent:v8];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

id sub_10003E088()
{
  if (qword_100081090 != -1) {
    dispatch_once(&qword_100081090, &stru_1000720F0);
  }
  v0 = (void *)qword_100081098;

  return v0;
}

void sub_10003E0DC(uint64_t a1)
{
  uint64_t v2 = CloudServicesLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "waiting for recover group", buf, 2u);
  }

  uint64_t v3 = sub_10003E204();
  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  id v4 = sub_10003E204();
  dispatch_group_enter(v4);

  id v6 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003E258;
  v9[3] = &unk_1000713A8;
  id v7 = v5;
  uint64_t v8 = *(void *)(a1 + 32);
  id v10 = v7;
  uint64_t v11 = v8;
  id v12 = *(id *)(a1 + 48);
  [v6 _recoverActualRecordWithRequest:v7 duplicate:0 completionBlock:v9];
}

id sub_10003E204()
{
  if (qword_1000810A0 != -1) {
    dispatch_once(&qword_1000810A0, &stru_100072110);
  }
  v0 = (void *)qword_1000810A8;

  return v0;
}

void sub_10003E258(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) requiresDoubleEnrollment])
  {
    if (!v5 || v6)
    {
      id v7 = CloudServicesLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = 0;
        uint64_t v8 = "double recovery skipped because primary recovery failed";
        id v9 = (uint8_t *)&v11;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      }
    }
    else
    {
      if ([*(id *)(a1 + 32) icdp])
      {
        [*(id *)(a1 + 40) _performDoubleRecoveryICDPWithRequest:*(void *)(a1 + 32) primaryResponse:v5];
        goto LABEL_10;
      }
      if ([*(id *)(a1 + 32) stingray])
      {
        [*(id *)(a1 + 40) _performDoubleRecoveryStingrayWithRequest:*(void *)(a1 + 32) primaryResponse:v5];
        goto LABEL_10;
      }
      id v7 = CloudServicesLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = 0;
        uint64_t v8 = "double recovery requested for invalid request type";
        id v9 = (uint8_t *)&v12;
        goto LABEL_8;
      }
    }
  }
LABEL_10:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
  id v10 = sub_10003E204();
  dispatch_group_leave(v10);
}

id sub_10003E5BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) recoverRecordWithRequest:*(void *)(a1 + 40) completionBlock:&stru_100071EC0];
}

void sub_10003E5D0(id a1, NSDictionary *a2, NSError *a3)
{
  id v4 = a3;
  id v5 = CloudServicesLog();
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "silent recovery succeeded", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_10004E0F8();
  }
}

void sub_10003E850(uint64_t a1)
{
  uint64_t v2 = CloudServicesLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "waiting for recover group (double recovery)", buf, 2u);
  }

  uint64_t v3 = sub_10003E204();
  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  id v4 = sub_10003E204();
  dispatch_group_enter(v4);

  id v6 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003E978;
  v9[3] = &unk_100071F30;
  id v10 = v5;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v7;
  uint64_t v12 = v8;
  [v6 _recoverActualRecordWithRequest:v10 duplicate:1 completionBlock:v9];
}

void sub_10003E978(id *a1, void *a2, void *a3)
{
  unint64_t v5 = a2;
  uint64_t v6 = a3;
  if (!(v5 | v6))
  {
    uint64_t v6 = +[CloudServicesError errorWithCode:1 format:@"Recovery seemingly failed with no error"];
  }
  id v7 = +[CloudServicesAnalytics logger];
  [v7 logResultForEvent:CloudServicesAnalyticsDoubleRecovery hardFailure:1 result:v6];

  uint64_t v8 = [a1[5] objectForKeyedSubscript:@"kEscrowServiceRecoveryUUID"];
  [a1[4] setRecoveryUUID:v8];

  id v9 = [(id)v5 objectForKeyedSubscript:@"kEscrowServiceRecoveryUUID"];
  [a1[4] setDoubleRecoveryUUID:v9];

  id v10 = CloudServicesLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [a1[4] recoveryUUID];
    uint64_t v12 = [a1[4] doubleRecoveryUUID];
    int v28 = 138412546;
    id v29 = v11;
    __int16 v30 = 2112;
    char v31 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "double enrollment recovery: recoveryUUID: %@, doubleRecoveryUUID: %@", (uint8_t *)&v28, 0x16u);
  }
  id v13 = CloudServicesLog();
  id v14 = v13;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10004E160();
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "double enrollment recovery succeeded", (uint8_t *)&v28, 2u);
    }

    uint64_t v15 = kEscrowServiceRecordDataKey;
    int v16 = [(id)v5 objectForKeyedSubscript:kEscrowServiceRecordDataKey];
    if (v16)
    {
      BOOL v17 = [a1[5] objectForKeyedSubscript:v15];
      unsigned int v18 = [v16 isEqualToDictionary:v17];
      id v19 = CloudServicesLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        char v20 = "not ";
        if (v18) {
          char v20 = "";
        }
        int v28 = 136315138;
        id v29 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "double enrollment recovery: record is %sidentical", (uint8_t *)&v28, 0xCu);
      }

      id v21 = a1[4];
      if (v18)
      {
        [v21 setRecoveryResult:1];
        id v14 = 0;
      }
      else
      {
        [v21 setRecoveryResult:0];
        id v14 = +[CloudServicesError errorWithCode:24 format:@"Record data does not match"];
      }
      uint64_t v23 = [EscrowService alloc];
      int v24 = [a1[6] operationsLogger];
      id v25 = [(EscrowService *)v23 initWithOperationsLogger:v24];

      [(EscrowService *)v25 logRecoveryResults:a1[4] completionBlock:&stru_100071F08];
    }
    else
    {
      uint64_t v22 = CloudServicesLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v28) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "double enrollment recovery: record data is missing", (uint8_t *)&v28, 2u);
      }

      id v14 = +[CloudServicesError errorWithCode:23 format:@"Record data is missing"];
    }
    id v26 = +[CloudServicesAnalytics logger];
    [v26 logResultForEvent:CloudServicesAnalyticsDoubleRecoveryDataMatch3 hardFailure:1 result:v14];
  }
  char v27 = sub_10003E204();
  dispatch_group_leave(v27);
}

void sub_10003ED98(id a1, NSDictionary *a2, NSError *a3)
{
  id v4 = a2;
  unint64_t v5 = a3;
  if (v5)
  {
    uint64_t v6 = CloudServicesLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10004E1C8();
    }
  }
  else
  {
    uint64_t v6 = [(NSDictionary *)v4 objectForKeyedSubscript:@"status"];
    id v7 = [(NSDictionary *)v4 objectForKeyedSubscript:@"message"];
    uint64_t v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "double enrollment recovery: logged metrics with status: %@, message: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

void sub_10003EFEC(uint64_t a1)
{
  uint64_t v2 = CloudServicesLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "waiting for recover group (PCS double recovery)", buf, 2u);
  }

  uint64_t v3 = sub_10003E204();
  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  id v4 = sub_10003E204();
  dispatch_group_enter(v4);

  uint64_t v6 = *(void **)(a1 + 32);
  unint64_t v5 = *(void **)(a1 + 40);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003F114;
  v9[3] = &unk_100071F30;
  id v10 = v5;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v7;
  uint64_t v12 = v8;
  [v6 _recoverActualRecordWithRequest:v10 duplicate:1 completionBlock:v9];
}

void sub_10003F114(id *a1, void *a2, void *a3)
{
  unint64_t v5 = a2;
  uint64_t v6 = a3;
  if (!(v5 | v6))
  {
    uint64_t v6 = +[CloudServicesError errorWithCode:1 format:@"Recovery seemingly failed with no error"];
  }
  id v7 = +[CloudServicesAnalytics logger];
  [v7 logResultForEvent:CloudServicesAnalyticsDoubleRecoveryPCS hardFailure:1 result:v6];

  uint64_t v8 = [a1[5] objectForKeyedSubscript:@"kEscrowServiceRecoveryUUID"];
  [a1[4] setRecoveryUUID:v8];

  int v9 = [(id)v5 objectForKeyedSubscript:@"kEscrowServiceRecoveryUUID"];
  [a1[4] setDoubleRecoveryUUID:v9];

  id v10 = CloudServicesLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [a1[4] recoveryUUID];
    uint64_t v12 = [a1[4] doubleRecoveryUUID];
    int v28 = 138412546;
    id v29 = v11;
    __int16 v30 = 2112;
    char v31 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PCS double recovery: recoveryUUID: %@, doubleRecoveryUUID: %@", (uint8_t *)&v28, 0x16u);
  }
  id v13 = CloudServicesLog();
  id v14 = v13;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10004E230();
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "PCS double recovery succeeded", (uint8_t *)&v28, 2u);
    }

    uint64_t v15 = kEscrowServiceRecordDataKey;
    int v16 = [(id)v5 objectForKeyedSubscript:kEscrowServiceRecordDataKey];
    if (v16)
    {
      BOOL v17 = [a1[5] objectForKeyedSubscript:v15];
      unsigned int v18 = [v16 isEqualToDictionary:v17];
      id v19 = CloudServicesLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        char v20 = "not ";
        if (v18) {
          char v20 = "";
        }
        int v28 = 136315138;
        id v29 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "PCS double recovery: record is %sidentical", (uint8_t *)&v28, 0xCu);
      }

      id v21 = a1[4];
      if (v18)
      {
        [v21 setRecoveryResult:1];
        id v14 = 0;
      }
      else
      {
        [v21 setRecoveryResult:0];
        id v14 = +[CloudServicesError errorWithCode:24 format:@"Record data does not match"];
      }
      uint64_t v23 = [EscrowService alloc];
      int v24 = [a1[6] operationsLogger];
      id v25 = [(EscrowService *)v23 initWithOperationsLogger:v24];

      [(EscrowService *)v25 logRecoveryResults:a1[4] completionBlock:&stru_100071F50];
    }
    else
    {
      uint64_t v22 = CloudServicesLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v28) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "PCS double recovery: record data is missing", (uint8_t *)&v28, 2u);
      }

      id v14 = +[CloudServicesError errorWithCode:23 format:@"Record data is missing"];
    }
    [a1[6] ttrForPCSDataMatchFailure:v14];
    id v26 = +[CloudServicesAnalytics logger];
    [v26 logResultForEvent:CloudServicesAnalyticsDoubleRecoveryPCSDataMatch hardFailure:1 result:v14];
  }
  char v27 = sub_10003E204();
  dispatch_group_leave(v27);
}

void sub_10003F540(id a1, NSDictionary *a2, NSError *a3)
{
  id v4 = a2;
  unint64_t v5 = a3;
  if (v5)
  {
    uint64_t v6 = CloudServicesLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10004E298();
    }
  }
  else
  {
    uint64_t v6 = [(NSDictionary *)v4 objectForKeyedSubscript:@"status"];
    id v7 = [(NSDictionary *)v4 objectForKeyedSubscript:@"message"];
    uint64_t v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PCS double recovery: logged metrics with status: %@, message: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

void sub_10003F868(uint64_t a1)
{
  v19[0] = kCFUserNotificationDefaultButtonTitleKey;
  v19[1] = kCFUserNotificationAlternateButtonTitleKey;
  v20[0] = @"Tap-To-Radar";
  v20[1] = @"No";
  v19[2] = kCFUserNotificationAlertMessageKey;
  v19[3] = kCFUserNotificationAlertHeaderKey;
  v20[2] = @"This device found a test data consistency issue. No device behavior or account data is impacted. Please file a radar to help track down the test issue!";
  v20[3] = @"iCloud Account Data Mismatch";
  CFDictionaryRef v2 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
  SInt32 error = 0;
  uint64_t v3 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, v2);
  if (v3)
  {
    id v4 = v3;
    *(void *)responseFlags = 0;
    CFUserNotificationReceiveResponse(v3, 180.0, (CFOptionFlags *)responseFlags);
    uint64_t v5 = responseFlags[0] & 3;
    CFRelease(v4);
    if (!v5)
    {
      if (qword_100081080 != -1) {
        dispatch_once(&qword_100081080, &stru_100071F70);
      }
      uint64_t v6 = objc_alloc_init((Class)NSDateFormatter);
      [v6 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
      id v7 = [v6 stringFromDate:*(void *)(a1 + 32)];
      uint64_t v8 = +[NSString stringWithFormat:@"PCS Double Recovery data mismatch detected at %@: %@", v7, *(void *)(a1 + 40)];

      int v9 = [@"PCS Double Recovery Data Mismatch" stringByAddingPercentEncodingWithAllowedCharacters:qword_100081088];
      id v10 = [v8 stringByAddingPercentEncodingWithAllowedCharacters:qword_100081088];
      __int16 v11 = +[NSString stringWithFormat:@"tap-to-radar://new?Reproducibilty=Always&Title=%@&ComponentName=CloudServices&ComponentVersion=all&Reproducibility=Not%%20Applicable&ComponentID=507587&Classification=Crash/Hang/Data%%20Loss&Description=%@", v9, v10];

      uint64_t v12 = +[NSURL URLWithString:v11];
      id v13 = CloudServicesLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)responseFlags = 138412290;
        *(void *)&responseFlags[4] = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PCS double TTR: going to use URL string %@", responseFlags, 0xCu);
      }

      id v14 = +[LSApplicationWorkspace defaultWorkspace];
      [v14 openURL:v12 configuration:0 completionHandler:&stru_100071F90];

      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v15 = CloudServicesLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = +[NSNumber numberWithInt:error];
      *(_DWORD *)responseFlags = 138412290;
      *(void *)&responseFlags[4] = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "PCS double TTR: failed to ask user about TTR: %@", responseFlags, 0xCu);
    }
  }
  uint64_t v6 = CloudServicesLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)responseFlags = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PCS double TTR: user declined", responseFlags, 2u);
  }
LABEL_13:
}

void sub_10003FBCC(id a1)
{
  id v1 = objc_alloc_init((Class)NSMutableCharacterSet);
  CFDictionaryRef v2 = (void *)qword_100081088;
  qword_100081088 = (uint64_t)v1;

  uint64_t v3 = (void *)qword_100081088;
  id v4 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  [v3 formUnionWithCharacterSet:v4];

  uint64_t v5 = (void *)qword_100081088;

  [v5 removeCharactersInString:@"&"];
}

void sub_1000400C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose((const void *)(v44 - 216), 8);
  _Block_object_dispose((const void *)(v44 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_1000400FC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v9 = a2;
  id v7 = [v5 operationsLogger];
  uint64_t v8 = [*(id *)(a1 + 40) endEventWithResults:v9 error:v6];
  [v7 updateStoreWithEvent:v8];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1000401B0(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  CFDictionaryRef v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100040260;
  v4[3] = &unk_100071D40;
  long long v6 = *(_OWORD *)(a1 + 56);
  id v5 = *(id *)(a1 + 32);
  [v2 _deleteRecordWithRequest:v3 duplicate:0 completionBlock:v4];
}

void sub_100040260(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000402FC(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  CFDictionaryRef v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000403AC;
  v4[3] = &unk_100071D40;
  long long v6 = *(_OWORD *)(a1 + 56);
  id v5 = *(id *)(a1 + 32);
  [v2 _deleteRecordWithRequest:v3 duplicate:1 completionBlock:v4];
}

void sub_1000403AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to delete double-enrolled record: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
  id v13 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_1000404B8(uint64_t a1)
{
  [*(id *)(a1 + 32) deleteDoubleOnly];
  CFDictionaryRef v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void sub_1000406B4(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    [v6 setObject:v5 forKeyedSubscript:NSUnderlyingErrorKey];
    uint64_t v7 = [v5 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:NSUnderlyingErrorKey];

    if ([v8 code] == (id)401)
    {
      [v6 setObject:@"Unauthorized" forKeyedSubscript:NSLocalizedDescriptionKey];
      uint64_t v9 = +[NSError errorWithDomain:kEscrowServiceErrorDomain code:99 userInfo:v6];
    }
    else
    {
      if ([v5 code] == (id)-6011)
      {
LABEL_8:
        (*(void (**)(void))(a1[6] + 16))();

        goto LABEL_9;
      }
      uint64_t v9 = +[CloudServicesError errorWithCode:22 error:v5 format:@"Error deleting record"];
    }
    id v12 = (void *)v9;

    id v5 = v12;
    goto LABEL_8;
  }
  id v10 = (void *)a1[4];
  uint64_t v11 = a1[5];
  id v13 = 0;
  [v10 _invalidateEscrowCache:v11 error:&v13];
  id v5 = v13;
  (*(void (**)(void))(a1[6] + 16))();
LABEL_9:
}

void sub_100040A7C(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v9 = a2;
  uint64_t v7 = [v5 operationsLogger];
  uint64_t v8 = [*(id *)(a1 + 40) endEventWithResults:v9 error:v6];
  [v7 updateStoreWithEvent:v8];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100040B30(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    [v6 setObject:v5 forKeyedSubscript:NSUnderlyingErrorKey];
    uint64_t v7 = [v5 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:NSUnderlyingErrorKey];

    if ([v8 code] == (id)401)
    {
      [v6 setObject:@"Unauthorized" forKeyedSubscript:NSLocalizedDescriptionKey];
      +[NSError errorWithDomain:kEscrowServiceErrorDomain code:99 userInfo:v6];
    }
    else
    {
      +[CloudServicesError errorWithCode:22 error:v5 format:@"Error updating metadata"];
    }
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v9();
  }
}

void sub_100040D7C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    [v7 setObject:v6 forKeyedSubscript:NSUnderlyingErrorKey];
    uint64_t v8 = [v6 userInfo];
    id v9 = [v8 objectForKeyedSubscript:NSUnderlyingErrorKey];

    if ([v9 code] == (id)401)
    {
      [v7 setObject:@"Unauthorized" forKeyedSubscript:NSLocalizedDescriptionKey];
      uint64_t v10 = +[NSError errorWithDomain:kEscrowServiceErrorDomain code:99 userInfo:v7];
    }
    else
    {
      id v12 = [v6 code];
      if (v12 == (id)-4007 || v12 == (id)-4002) {
        goto LABEL_9;
      }
      uint64_t v10 = +[CloudServicesError errorWithCode:22 error:v6 format:@"SMS challenge error"];
    }
    id v13 = (void *)v10;

    id v6 = v13;
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    goto LABEL_10;
  }
  CFStringRef v14 = @"recoveryChallengeCodeLength";
  uint64_t v11 = [a2 smsVerificationCodeLength];
  id v15 = v11;
  id v6 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_10:
}

void sub_100041054(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v12 = v4;
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    [v5 setObject:v12 forKeyedSubscript:NSUnderlyingErrorKey];
    id v6 = [v12 userInfo];
    id v7 = [v6 objectForKeyedSubscript:NSUnderlyingErrorKey];

    if ([v7 code] == (id)401)
    {
      [v5 setObject:@"Unauthorized" forKeyedSubscript:NSLocalizedDescriptionKey];
      uint64_t v8 = +[NSError errorWithDomain:kEscrowServiceErrorDomain code:99 userInfo:v5];
    }
    else
    {
      if ([v12 code] == (id)-5012)
      {
        id v10 = v12;
LABEL_11:
        id v13 = v10;
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

        return;
      }
      uint64_t v8 = +[CloudServicesError errorWithCode:22 error:v12 format:@"Unable to change SMS Target"];
    }
    uint64_t v11 = v8;

    id v10 = (id)v11;
    goto LABEL_11;
  }
  id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);

  v9();
}

void sub_1000412BC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    id v7 = +[CloudServicesError errorWithCode:305 error:v5 format:@"Unable to get target list"];
  }
  else
  {
    CFStringRef v9 = @"EscrowServiceSMSTargetInfo";
    uint64_t v8 = [a2 smsTargetsInfo];
    id v10 = v8;
    id v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100041498(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    id v7 = +[CloudServicesError errorWithCode:305 error:v5 format:@"Unable to get country SMS code list"];
  }
  else
  {
    CFStringRef v9 = @"EscrowServiceCountrySMSCodes";
    uint64_t v8 = [a2 countrySMSCodes];
    id v10 = v8;
    id v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100041A38(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    id v10 = +[CloudServicesError errorWithCode:312 error:v5 format:@"Unable to log metrics"];

    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = [a2 responseDictionary];
    id v7 = *(void (**)(void))(v8 + 16);
    id v10 = (id)v9;
  }
  v7();
}

void sub_100041B0C(id a1)
{
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.sbd.recoverQueue", v3);
  CFDictionaryRef v2 = (void *)qword_100081098;
  qword_100081098 = (uint64_t)v1;
}

void sub_100041B70(id a1)
{
  qword_1000810A8 = (uint64_t)dispatch_group_create();

  _objc_release_x1();
}

void sub_100041BA4(id a1)
{
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.sbd.uiQueue", v3);
  CFDictionaryRef v2 = (void *)qword_1000810B8;
  qword_1000810B8 = (uint64_t)v1;
}

void sub_100041C20(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

NSObject *sub_100042CEC()
{
  v0 = +[ACAccountStore defaultStore];
  dispatch_queue_t v1 = [v0 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierAppleAccount];
  id v2 = objc_alloc_init((Class)AKAccountManager);
  [v0 accountsWithAccountType:v1];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:buf count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v2 isPrimaryiCloudAccount:v7])
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v19 objects:buf count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  uint64_t v8 = CloudServicesLog();
  uint64_t v9 = v8;
  if (v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v24 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Attempting to fetch the PRK from %@", buf, 0xCu);
    }

    uint64_t v9 = objc_alloc_init((Class)AKAccountManager);
    id v10 = [v9 altDSIDForAccount:v4];
    id v18 = 0;
    uint64_t v11 = [v9 authKitAccountWithAltDSID:v10 error:&v18];
    id v12 = v18;
    if (v11)
    {
      id v13 = [v9 passwordResetTokenBackupForAccount:v11];
      CFStringRef v14 = CloudServicesLog();
      id v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Escrowing an existing PRK", buf, 2u);
        }

        id v13 = v13;
        int v16 = v13;
      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_10004E48C(v15);
        }

        int v16 = 0;
      }
    }
    else
    {
      id v13 = CloudServicesLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10004E414((uint64_t)v12, v13);
      }
      int v16 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10004E3D0(v9);
    }
    int v16 = 0;
  }

  return v16;
}

void sub_100043000(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    id v3 = CloudServicesLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10004E4D0((uint64_t)v2, v3);
    }

    objc_end_catch();
    JUMPOUT(0x100042E10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t start()
{
  +[NSXPCListener enableTransactions];
  dispatch_queue_t v1 = (void *)os_transaction_create();
  os_log_t v2 = os_log_create("com.apple.sbd", "daemon");
  id v3 = (void *)qword_1000810E8;
  qword_1000810E8 = (uint64_t)v2;

  CloudServicesInitializeLogging();
  id v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v21[0] = 67109376;
    v21[1] = getuid();
    __int16 v22 = 1024;
    gid_t v23 = getgid();
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "running as uid %d, gid %d", (uint8_t *)v21, 0xEu);
  }

  if (_os_feature_enabled_impl())
  {
    uint64_t v5 = objc_alloc_init(SBEscrowOperationLogger);
    id v6 = (void *)qword_1000810D8;
    qword_1000810D8 = (uint64_t)v5;

    id v7 = [SecureBackupDaemonLoggerObservers alloc];
    uint64_t v8 = [(SecureBackupDaemonLoggerObservers *)v7 initWithLogger:qword_1000810D8];
    uint64_t v9 = (void *)qword_1000810E0;
    qword_1000810E0 = (uint64_t)v8;
  }
  id v10 = [SecureBackupDaemon alloc];
  uint64_t v11 = [(SecureBackupDaemon *)v10 initWithOperationsLogger:qword_1000810D8];
  id v12 = (void *)qword_1000810C0;
  qword_1000810C0 = (uint64_t)v11;

  id v13 = objc_alloc((Class)NSXPCListener);
  id v14 = [v13 initWithMachServiceName:SECURE_BACKUP_SERVICE_NAME];
  id v15 = (void *)qword_1000810C8;
  qword_1000810C8 = (uint64_t)v14;

  [(id)qword_1000810C8 setDelegate:qword_1000810C0];
  [(id)qword_1000810C8 resume];
  id v16 = objc_alloc((Class)NSXPCListener);
  id v17 = [v16 initWithMachServiceName:SECURE_BACKUP_CONCURRENT_SERVICE_NAME];
  id v18 = (void *)qword_1000810D0;
  qword_1000810D0 = (uint64_t)v17;

  [(id)qword_1000810D0 setDelegate:qword_1000810C0];
  [(id)qword_1000810D0 resume];

  long long v19 = +[NSRunLoop currentRunLoop];
  [v19 run];

  return 0;
}

uint64_t sub_1000432B0()
{
  v0 = +[UMUserManager sharedManager];
  dispatch_queue_t v1 = [v0 currentPersona];

  uint64_t v2 = [v1 isDataSeparatedPersona] ^ 1;
  return v2;
}

uint64_t sub_10004428C(void *a1, uint64_t a2)
{
  double Nanoseconds = _CloudServicesSignpostGetNanoseconds(a1[6], a1[7]);
  uint64_t v5 = _CloudServicesSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[6];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    uint64_t v8 = a1[4];
    int v12 = 138543618;
    uint64_t v13 = v8;
    __int16 v14 = 1026;
    LODWORD(v15) = a2 == 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, v7, "BackupRestore", " CloudServicesSignpostNameSecItemBackupRestore=%{public,signpost.telemetry:string1,name=CloudServicesSignpostNameSecItemBackupRestore}@  CloudServicesSignpostNameSecItemBackupRestore=%{public,signpost.telemetry:number1,name=CloudServicesSignpostNameSecItemBackupRestore}d ", (uint8_t *)&v12, 0x12u);
  }

  uint64_t v9 = _CloudServicesSignpostLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218754;
    uint64_t v10 = a1[4];
    uint64_t v13 = a1[6];
    __int16 v14 = 2048;
    double v15 = Nanoseconds / 1000000000.0;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    __int16 v18 = 1026;
    BOOL v19 = a2 == 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: BackupRestore  CloudServicesSignpostNameSecItemBackupRestore=%{public,signpost.telemetry:string1,name=CloudServicesSignpostNameSecItemBackupRestore}@  CloudServicesSignpostNameSecItemBackupRestore=%{public,signpost.telemetry:number1,name=CloudServicesSignpostNameSecItemBackupRestore}d ", (uint8_t *)&v12, 0x26u);
  }

  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

uint64_t sub_1000449A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100044F28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100045984(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 16) |= 1u;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_28;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          uint64_t v14 = 0;
          goto LABEL_30;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_28:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v14 = 0;
      }
LABEL_30:
      *(void *)(a1 + 8) = v14;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

id sub_10004733C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleEscrowStoreResults:a2 escrowError:a3 request:*(void *)(a1 + 40) peerID:*(void *)(a1 + 48) newRecordMetadata:*(void *)(a1 + 56) backupKeybag:0 reply:*(void *)(a1 + 64)];
}

void sub_100047D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100047DE0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100047DF0(uint64_t a1)
{
}

void sub_100047DF8(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unsigned int v13 = CloudServicesLog();
  uint64_t v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10004F01C(v12);
    }

    unint64_t v15 = (void **)(*(void *)(a1[4] + 8) + 40);
    char v16 = v12;
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received bottle entropy for id=%@, including in escrow record", (uint8_t *)&v19, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a4);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
    unint64_t v15 = (void **)(*(void *)(a1[7] + 8) + 40);
    char v16 = v9;
  }
  id v17 = v16;
  __int16 v18 = *v15;
  void *v15 = v17;
}

uint64_t sub_100047FDC()
{
  if (qword_1000810F8 != -1) {
    dispatch_once(&qword_1000810F8, &stru_1000722B0);
  }
  dispatch_sync((dispatch_queue_t)qword_100081100, &stru_100072270);
  uint64_t result = dword_1000810F0;
  if (!dword_1000810F0)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return dword_1000810F0;
  }
  return result;
}

void sub_100048068(id a1)
{
  if (!dword_1000810F0) {
    dword_1000810F0 = sub_1000480D4("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
  }
}

void sub_1000480A8(id a1)
{
  qword_100081100 = (uint64_t)dispatch_queue_create("aks-client-queue", 0);
}

uint64_t sub_1000480D4(char *path, const char *a2)
{
  kern_return_t v5;
  CFDictionaryRef v6;
  io_service_t MatchingService;
  io_object_t v8;
  uint64_t result;
  kern_return_t v10;
  io_connect_t connect;

  connect = 0;
  io_service_t v3 = IORegistryEntryFromPath(kIOMasterPortDefault, path);
  if (!v3 || (io_object_t v4 = v3, v5 = IOServiceOpen(v3, mach_task_self_, 0, &connect), IOObjectRelease(v4), v5))
  {
    unint64_t v6 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v6);
    if (MatchingService)
    {
      char v8 = MatchingService;
      IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
      IOObjectRelease(v8);
    }
  }
  uint64_t result = connect;
  if (connect)
  {
    id v10 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    uint64_t result = connect;
    if (v10)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000481CC(uint64_t a1, int a2, unsigned int a3, _DWORD *a4)
{
  return sub_1000481E4(a1, a2, 0, 0, a3, -1, a4);
}

uint64_t sub_1000481E4(uint64_t a1, int a2, uint64_t a3, int a4, unsigned int a5, int a6, _DWORD *a7)
{
  uint64_t v14 = 3758097084;
  mach_port_t v15 = sub_100047FDC();
  if (v15)
  {
    if (a7)
    {
      input[0] = a5;
      input[1] = a6;
      input[2] = a1;
      input[3] = a2;
      input[4] = a3;
      input[5] = a4;
      uint64_t output = 0;
      uint32_t outputCnt = 1;
      uint64_t v14 = IOConnectCallMethod(v15, 2u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
      if (!v14) {
        *a7 = output;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_create_bag", ":", 187, "", 0, "", "");
  }
  return v14;
}

uint64_t sub_10004833C()
{
  int v0 = __chkstk_darwin();
  uint64_t v2 = v1;
  io_object_t v4 = v3;
  int v5 = v0;
  mach_port_t v6 = sub_100047FDC();
  if (v6)
  {
    mach_port_t v7 = v6;
    uint64_t result = 3758097090;
    if (v4)
    {
      if (v2)
      {
        bzero(__src, 0x8000uLL);
        size_t __count = 0x8000;
        uint64_t input = v5;
        uint64_t result = IOConnectCallMethod(v7, 3u, &input, 1u, 0, 0, 0, 0, __src, &__count);
        if (!result)
        {
          id v9 = calloc(__count, 1uLL);
          *io_object_t v4 = v9;
          if (v9)
          {
            memcpy(v9, __src, __count);
            uint64_t result = 0;
            *uint64_t v2 = __count;
          }
          else
          {
            return 3758097085;
          }
        }
      }
    }
  }
  else
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_save_bag", ":", 646, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

void sub_1000484CC(void *a1)
{
  dispatch_queue_t v1 = [a1 httpResponse];
  sub_100004234((void *)&_mh_execute_header, v2, v3, "HTTP Error: %@", v4, v5, v6, v7, 2u);
}

void sub_100048554(void *a1)
{
  dispatch_queue_t v1 = [a1 responseDictionary];
  sub_100004234((void *)&_mh_execute_header, v2, v3, "Error returned from iCloud: %@", v4, v5, v6, v7, 2u);
}

void sub_1000485DC(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 136315906;
  uint64_t v4 = "currentBootUUID_block_invoke";
  __int16 v5 = 1024;
  int v6 = a2;
  __int16 v7 = 1040;
  int v8 = 36;
  __int16 v9 = 2080;
  uint64_t v10 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Error parsing boot uuid, UUID may be zeroes: { code: %d, str: %.36s }", (uint8_t *)&v3, 0x22u);
}

void sub_100048688(int a1, NSObject *a2)
{
  int v2 = 136315394;
  int v3 = "currentBootUUID_block_invoke";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Failed to retrieve kern.bootsessionuuid with error code %d", (uint8_t *)&v2, 0x12u);
}

void sub_100048714(uint64_t a1, NSObject *a2)
{
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error executing query for daemon container [com.apple.sbd]: %s", (uint8_t *)&v2, 0xCu);
}

void sub_10004878C(NSObject *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "Error consuming extension for daemon container [com.apple.sbd]: %{darwin.errno}d", (uint8_t *)v3, 8u);
}

void sub_10004881C()
{
  sub_100004DF4();
  objc_opt_class();
  sub_100004DBC();
  sub_100004DD4((void *)&_mh_execute_header, v0, v1, "%@: Error loading activity log data: %@", v2, v3, v4, v5, v6);
}

void sub_100048894()
{
  sub_100004DF4();
  objc_opt_class();
  sub_100004DBC();
  sub_100004DD4((void *)&_mh_execute_header, v0, v1, "%@: Error deserializing activity log data: %@", v2, v3, v4, v5, v6);
}

void sub_10004890C()
{
  sub_100004DF4();
  objc_opt_class();
  sub_100004DBC();
  sub_100004DD4((void *)&_mh_execute_header, v0, v1, "%@: Error serializing activity log data: %@", v2, v3, v4, v5, v6);
}

void sub_100048984()
{
  sub_100004DF4();
  objc_opt_class();
  sub_100004DBC();
  sub_100004DD4((void *)&_mh_execute_header, v0, v1, "%@: Error saving activity log data: %@", v2, v3, v4, v5, v6);
}

void sub_1000489FC(void **a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = *a1;
  sub_10000A120((void *)&_mh_execute_header, a2, a3, "SOSBackupSliceKeyBagCreateFromData() failed: %@", a5, a6, a7, a8, 2u);
}

void sub_100048A78(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No peer for digest %@ found", buf, 0xCu);
}

void sub_100048AD0()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "could not find peer id for peer %@", v2, v3, v4, v5, v6);
}

void sub_100048B38()
{
  sub_10000A148();
  sub_10000A180((void *)&_mh_execute_header, v0, v1, "table create for %@ failed: %s");
}

void sub_100048BA4(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "_sqlite3_maintain_load_factor for %@ failed: %d", (uint8_t *)&v3, 0x12u);
}

void sub_100048C2C(uint64_t a1, sqlite3 **a2)
{
  sqlite3_errmsg(*a2);
  sub_10000A1A0();
  sub_100004DD4((void *)&_mh_execute_header, v2, v3, "opening %@ failed: %s", v4, v5, v6, v7, v8);
}

void sub_100048CAC()
{
  sub_100004DF4();
  [v1 url];
  objc_claimAutoreleasedReturnValue();
  sub_10000A108();
  sub_10000A0F0();
  sub_100004DD4((void *)&_mh_execute_header, v2, v3, "sqlite3_finalize for %@ failed: %s", v4, v5, v6, v7, v8);
}

void sub_100048D38()
{
  sub_100004DF4();
  [v1 url];
  objc_claimAutoreleasedReturnValue();
  sub_10000A108();
  sub_10000A0F0();
  sub_100004DD4((void *)&_mh_execute_header, v2, v3, "sqlite3_step for %@ failed: %s", v4, v5, v6, v7, v8);
}

void sub_100048DC4()
{
  sub_100004DF4();
  [v1 url];
  objc_claimAutoreleasedReturnValue();
  sub_10000A108();
  sub_10000A0F0();
  sub_100004DD4((void *)&_mh_execute_header, v2, v3, "sqlite3_bind_blob64 for %@ failed: %s", v4, v5, v6, v7, v8);
}

void sub_100048E50()
{
  sub_100004DF4();
  [v1 url];
  objc_claimAutoreleasedReturnValue();
  sub_10000A108();
  sub_10000A0F0();
  sub_100004DD4((void *)&_mh_execute_header, v2, v3, "sqlite3_bind_text for %@ failed: %s", v4, v5, v6, v7, v8);
}

void sub_100048EDC()
{
  sub_100004DF4();
  [v1 url];
  objc_claimAutoreleasedReturnValue();
  sub_10000A108();
  sub_10000A0F0();
  sub_100004DD4((void *)&_mh_execute_header, v2, v3, "sqlite3_prepare(insert) for %@ failed: %s", v4, v5, v6, v7, v8);
}

void sub_100048F68(uint64_t a1, void *a2)
{
  uint8_t v8 = [a2 url];
  sub_100004DD4((void *)&_mh_execute_header, v2, v3, "sqlite3_changes for remove %@ in %@ != 1", v4, v5, v6, v7, 2u);
}

void sub_10004900C()
{
  sub_100004DF4();
  [v1 url];
  objc_claimAutoreleasedReturnValue();
  sub_10000A108();
  sub_10000A0F0();
  sub_100004DD4((void *)&_mh_execute_header, v2, v3, "sqlite3_prepare(delete) for %@ failed: %s", v4, v5, v6, v7, v8);
}

void sub_100049098()
{
  sub_100004DF4();
  [v1 url];
  objc_claimAutoreleasedReturnValue();
  sub_10000A108();
  sub_10000A160();
  sub_10000A1F0((void *)&_mh_execute_header, v2, v3, "sqlite3_prepare_v2(%s) for %@ failed: %s", v4, v5, v6, v7, 2u);
}

void sub_100049130()
{
  sub_100004DF4();
  [v1 url];
  objc_claimAutoreleasedReturnValue();
  sub_10000A108();
  sub_10000A160();
  sub_10000A1F0((void *)&_mh_execute_header, v2, v3, "sqlite3_prepare_v2(%s) for %@ failed: %s", v4, v5, v6, v7, 2u);
}

void sub_1000491C8(void *a1)
{
  id v1 = [a1 url];
  sub_10000A1B8();
  sub_10000A1D0((void *)&_mh_execute_header, v2, v3, "sqlite3_close for %@ failed: %d", v4, v5, v6, v7, v8);
}

void sub_100049258()
{
  sub_100004DF4();
  id v1 = [v0 url];
  sub_10000A148();
  sub_100004DD4((void *)&_mh_execute_header, v2, v3, "create table for %@ failed: %s", v4, v5, v6, v7, v8);
}

void sub_1000492E8()
{
  sub_100004DF4();
  id v1 = [v0 url];
  sub_10000A148();
  sub_100004DD4((void *)&_mh_execute_header, v2, v3, "table drop for %@ failed: %s", v4, v5, v6, v7, v8);
}

void sub_100049378()
{
  sub_10000A13C();
  sub_10000A180((void *)&_mh_execute_header, v0, v1, "could not create %@: %@");
}

void sub_1000493EC()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "unexpected item type for kSecBackupEventAdd: %@", v2, v3, v4, v5, v6);
}

void sub_100049454()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "unexpected item type for kSecBackupEventRemove: %@", v2, v3, v4, v5, v6);
}

void sub_1000494BC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004952C()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "unexpected item type for resetWithKeybag: %@", v2, v3, v4, v5, v6);
}

void sub_100049594()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "failed to add item %@", v2, v3, v4, v5, v6);
}

void sub_1000495FC()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "migrating %@ failed, resetting local backup db to empty", v2, v3, v4, v5, v6);
}

void sub_100049664()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "could not reset store with keybag: %@", v2, v3, v4, v5, v6);
}

void sub_1000496CC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "not a btree file ", v1, 2u);
}

void sub_100049710()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000A1A0();
  sub_100004DD4((void *)&_mh_execute_header, v1, v2, "could not open %@: %s ", v3, v4, v5, v6, v7);
}

void sub_100049794(NSObject *a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  sub_10000A13C();
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "seq failed: %s", v3, 0xCu);
}

void sub_100049824()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "duplicate key, corrupt btree at %@", v2, v3, v4, v5, v6);
}

void sub_10004988C(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_10000A180((void *)&_mh_execute_header, a2, a3, "unexpected key size: %zd, corrupt btree at %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_100049908()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "Error processing plist: %@", v2, v3, v4, v5, v6);
}

void sub_100049970()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "Escrow response not a dictionary: %@", v2, v3, v4, v5, v6);
}

void sub_1000499D8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint8_t v6 = [*(id *)(a1 + 24) URL];
  uint8_t v7 = [*(id *)(a1 + 24) allHeaderFields];
  int v8 = 138412802;
  __int16 v9 = v6;
  __int16 v10 = 2112;
  id v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "unexpected response from escrow proxy: URL: %@, headers: %@, data: %@", (uint8_t *)&v8, 0x20u);
}

void sub_100049AAC(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = +[CSDateUtilities localStringFromDate:a1];
  sub_10000A13C();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "will be available for retry after %@", v4, 0xCu);
}

void sub_100049B4C()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "Got retry-after header: %@", v2, v3, v4, v5, v6);
}

void sub_100049BB4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error from escrow proxy: %ld, %@", (uint8_t *)&v3, 0x16u);
}

void sub_100049C3C(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = [a1 objectForKeyedSubscript:a2];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Our idea of the best silent metadata is: %@", (uint8_t *)&v5, 0xCu);
}

void sub_100049CD8(uint64_t a1, uint64_t a2, os_log_t log)
{
  CFStringRef v3 = @"no";
  if (a2) {
    CFStringRef v3 = @"yes";
  }
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  CFStringRef v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "found silent attempt record with id %@ (metadata present %@)", (uint8_t *)&v4, 0x16u);
}

void sub_100049D78()
{
  sub_10000FE58();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "rawPassword not provided", v1, 2u);
}

void sub_100049DB8()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "double enrollment requested, but escrow record is missing password", v2, v3, v4, v5, v6);
}

void sub_100049DEC()
{
}

void sub_100049E08(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to encode body: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100049E80(void *a1)
{
  int v2 = [a1 command];
  uint64_t v3 = [a1 recordLabel];
  sub_10000FE24();
  sub_10000FE64((void *)&_mh_execute_header, v4, v5, "Disallowing %@ operation for label %@ (due to com.apple.cloudservices/PCS-UpdateDisabled)", v6, v7, v8, v9, v10);
}

void sub_100049F24(void *a1)
{
  int v2 = [a1 command];
  uint64_t v3 = [a1 recordLabel];
  sub_10000FE24();
  sub_10000FE64((void *)&_mh_execute_header, v4, v5, "Disallowing %@ operation for label %@ (due to com.apple.cloudservices/PCS-NoRecord)", v6, v7, v8, v9, v10);
}

void sub_100049FC8()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Missing DSID", v2, v3, v4, v5, v6);
}

void sub_100049FFC()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "EscrowUpdateMetadataRequest: duplicate update not supported", v2, v3, v4, v5, v6);
}

void sub_10004A030(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "account email not verified", v1, 2u);
}

void sub_10004A074()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "no data value in dict", v2, v3, v4, v5, v6);
}

void sub_10004A0A8()
{
  sub_10000A13C();
  __int16 v5 = 2080;
  uint64_t v6 = v2;
  if (v3) {
    uint64_t v1 = v2;
  }
  __int16 v7 = 2080;
  uint64_t v8 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Couldn't back up view %@: backup is%s nil, keybag is%s nil", v4, 0x20u);
}

void sub_10004A14C()
{
  sub_1000331E0(__stack_chk_guard);
  sub_10003319C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "SOSCCCopyMyPeerInfo() failed: %@", v2, v3, v4, v5, v6);
}

void sub_10004A1B4()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "getting registered backup names failed: %@", v2, v3, v4, v5, v6);
}

void sub_10004A21C()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Attempt to back up when backup not enabled", v2, v3, v4, v5, v6);
}

void sub_10004A250()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "_backupCloudIdentityKeychainViewAndPushToKVS: Attempt to back up when backup not enabled", v2, v3, v4, v5, v6);
}

void sub_10004A284()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "_backupCloudIdentityKeychainViewAndPushToKVS: failed to push to KVS: %@", v2, v3, v4, v5, v6);
}

void sub_10004A2EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004A364(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004A3DC()
{
  sub_1000331D4();
  sub_100033180((void *)&_mh_execute_header, v0, v1, "_consumeViewBackup: SecKeychainBackupWithChanges: unexpected event: %d", v2, v3, v4, v5, v6);
}

void sub_10004A444()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "SecItemBackupWithRegisteredBackups failed: %@", v2, v3, v4, v5, v6);
}

void sub_10004A4AC()
{
  sub_100033204(__stack_chk_guard);
  sub_1000331A8();
  sub_10000A180((void *)&_mh_execute_header, v0, v1, "SecItemBackupSetConfirmedManifest for view %@ failed: %@");
}

void sub_10004A514()
{
  sub_100033204(__stack_chk_guard);
  sub_1000331A8();
  sub_10000A180((void *)&_mh_execute_header, v0, v1, "Handling events for view %@ failed: %@");
}

void sub_10004A57C()
{
  sub_10000A13C();
  sub_10000A180((void *)&_mh_execute_header, v0, v1, "SecKeychainBackupWithChanges for view %@ failed: %@");
}

void sub_10004A5F0()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "SecKeychainBackupWithChanges: no journal file, skipping %@", v2, v3, v4, v5, v6);
}

void sub_10004A658()
{
  sub_1000331D4();
  sub_100033180((void *)&_mh_execute_header, v0, v1, "SecKeychainBackupWithChanges: unexpected event: %d", v2, v3, v4, v5, v6);
}

void sub_10004A6C0()
{
  sub_10000A13C();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "MGCopyAnswer(%@): %d", v2, 0x12u);
}

void sub_10004A748()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "attempt to enable backup with non-decimal digits in SMS target: %@", v2, v3, v4, v5, v6);
}

void sub_10004A7B0()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "could not get KVS dictionary representation", v2, v3, v4, v5, v6);
}

void sub_10004A7E4()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "Error serializing dictionary for State Capture: %@", v2, v3, v4, v5, v6);
}

void sub_10004A84C()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "calloc() failed?", v2, v3, v4, v5, v6);
}

void sub_10004A880(void *a1)
{
  [a1 processIdentifier];
  sub_1000331D4();
  sub_10000A1D0((void *)&_mh_execute_header, v1, v2, "connection attempt from pid %d missing entitlement: %@", v3, v4, v5, v6, v7);
}

void sub_10004A90C(void *a1, void *a2)
{
  [a1 processIdentifier];
  uint64_t v9 = [a2 serviceName];
  sub_10000A1D0((void *)&_mh_execute_header, v3, v4, "connection attempt from pid %d to unknown service name %@", v5, v6, v7, v8, 2u);
}

void sub_10004A9B8()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Could not retrieve the iCloud Identity Backup from KVS!", v2, v3, v4, v5, v6);
}

void sub_10004A9EC()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "no keybag found in iCloudIdentity backup: %@", v2, v3, v4, v5, v6);
}

void sub_10004AA54()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "could not get iCloudIdentity backup!", v2, v3, v4, v5, v6);
}

void sub_10004AA88()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "account does not use escrow, says backup is enabled, but has no backup timestamp", v2, v3, v4, v5, v6);
}

void sub_10004AABC()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "Unable to fetch bottled peer sorting suggestions: %@", v2, v3, v4, v5, v6);
}

void sub_10004AB24()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "No preferred or partial bottleIDs bottle IDs, returning whole list", v2, v3, v4, v5, v6);
}

void sub_10004AB58(void *a1, NSObject *a2)
{
  v3[0] = 67109120;
  v3[1] = [a1 count];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "After filtering, no records are viable for Octagon. Returning all %d records", (uint8_t *)v3, 8u);
}

void sub_10004ABE4()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "NSUbiquitousKeyValueStore synchronize failed: %@", v2, v3, v4, v5, v6);
}

void sub_10004AC4C()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "NSUbiquitousKeyValueStore synchronize failed", v2, v3, v4, v5, v6);
}

void sub_10004AC80()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "got error back from synchronizeWithCompletionHandler: %@", v2, v3, v4, v5, v6);
}

void sub_10004ACE8()
{
  sub_1000331D4();
  sub_100033180((void *)&_mh_execute_header, v0, v1, "Unknown passphrase type: %d", v2, v3, v4, v5, v6);
}

void sub_10004AD50()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "SecEMCSCreateDerivedKey() failed", v2, v3, v4, v5, v6);
}

void sub_10004AD84()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "could not create backup blob from stash dict: %@", v2, v3, v4, v5, v6);
}

void sub_10004ADEC()
{
  sub_100033218(__stack_chk_guard);
  sub_10003319C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "MKBUserSessionSetSecureBackupBlob() failed: %@", v2, v3, v4, v5, v6);
}

void sub_10004AE54()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "SecEMCSCreateNewiDMSKey() failed", v2, v3, v4, v5, v6);
}

void sub_10004AE88()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "SecEMCSCreateNewiDMSKey() returned nil EMCS key", v2, v3, v4, v5, v6);
}

void sub_10004AEBC()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "could not create backup keybag", v2, v3, v4, v5, v6);
}

void sub_10004AEF0(os_log_t log)
{
  int v1 = 136315394;
  uint64_t v2 = "";
  __int16 v3 = 2080;
  uint64_t v4 = "";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing parameter for SecEMCSCreateDerivedKey(): dict: %snil, user credential: %snil", (uint8_t *)&v1, 0x16u);
}

void sub_10004AF80()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "stashRecoveryDataWithRequest called without EMCS mode set?", v2, v3, v4, v5, v6);
}

void sub_10004AFB4()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "no alt DSID for setting IdMS info", v2, v3, v4, v5, v6);
}

void sub_10004AFE8()
{
  sub_1000331E0(__stack_chk_guard);
  sub_10003319C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "could not save keybag: %@", v2, v3, v4, v5, v6);
}

void sub_10004B050()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "AKAppleIDAuthenticationController setConfigurationInfo:] failed:%@", v2, v3, v4, v5, v6);
}

void sub_10004B0B8()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "NSUbiquitousKeyValueStore synchronizeWithCompletionHandler: returned %@", v2, v3, v4, v5, v6);
}

void sub_10004B120()
{
  sub_100033170();
  *uint64_t v1 = 136315650;
  sub_100033138(v2, v3, (uint64_t)v1);
  sub_100033154((void *)&_mh_execute_header, "%s caught exception: %@: %@", v4, v5);
}

void sub_10004B170()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Missing user credential for SecEMCSCreateDerivedKey()", v2, v3, v4, v5, v6);
}

void sub_10004B1A4()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "SecEMCSCreateDerivedEMCSKey() failed with old data", v2, v3, v4, v5, v6);
}

void sub_10004B1D8(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_100033120((void *)&_mh_execute_header, a3, (uint64_t)a3, "Could not change device passcode: %@", (uint8_t *)a2);
}

void sub_10004B228()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "enableWithInfo() reached unreachable path: escrow+!stingray+usesMultipleICSC: %@", v2, v3, v4, v5, v6);
}

void sub_10004B290()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "SOSCCRegisterSingleRecoverySecret() failed: %@", v2, v3, v4, v5, v6);
}

void sub_10004B2F8()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Missing cached passphrase", v2, v3, v4, v5, v6);
}

void sub_10004B32C()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "could not create backup bag password", v2, v3, v4, v5, v6);
}

void sub_10004B360()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "escrowService storeRecordWithRequest: returned: %@", v2, v3, v4, v5, v6);
}

void sub_10004B3C8(NSObject *a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  sub_10000A13C();
  sub_100033120((void *)&_mh_execute_header, a1, v3, "failed creating backup semaphore: %s", v4);
}

void sub_10004B450()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "attempting to back up with no keybag", v2, v3, v4, v5, v6);
}

void sub_10004B484()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "_SecKeychainCopyBackup() returned NULL", v2, v3, v4, v5, v6);
}

void sub_10004B4B8()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "digest mismatch!", v2, v3, v4, v5, v6);
}

void sub_10004B4EC()
{
  sub_10003319C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "SecItemCopyMatching returned %ld", v2, v3, v4, v5, v6);
}

void sub_10004B558()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "backup is not a dictionary!", v2, v3, v4, v5, v6);
}

void sub_10004B58C()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "obj for key %@ does not respond to count!", v2, v3, v4, v5, v6);
}

void sub_10004B5F4()
{
  sub_100033218(__stack_chk_guard);
  sub_1000331F0();
  sub_10000A180((void *)&_mh_execute_header, v0, v1, "SecItemBackupRestore for view %@ failed: %@");
}

void sub_10004B660()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Can't restore legacy backup with no keybag", v2, v3, v4, v5, v6);
}

void sub_10004B694()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "Could not create DER data from dict: %@", v2, v3, v4, v5, v6);
}

void sub_10004B6FC()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Can't find protected keychain; nothing to restore",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10004B730()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Failed to restore keychain backups", v2, v3, v4, v5, v6);
}

void sub_10004B764()
{
  sub_1000331E0(__stack_chk_guard);
  sub_10003319C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "recovery key recovery failed: %@", v2, v3, v4, v5, v6);
}

void sub_10004B7CC()
{
  sub_1000331C0(__stack_chk_guard);
  sub_10003319C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "Failed to restore PCS-MasterKey view: %@", v2, v3, v4, v5, v6);
}

void sub_10004B834()
{
  sub_1000331C0(__stack_chk_guard);
  sub_10003319C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "Failed to restore iCloud Identity: %@", v2, v3, v4, v5, v6);
}

void sub_10004B89C()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "no iCDP records found!", v2, v3, v4, v5, v6);
}

void sub_10004B8D0()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "no iCDP backups found!", v2, v3, v4, v5, v6);
}

void sub_10004B904()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "got error back from getAccountInfo: %@", v2, v3, v4, v5, v6);
}

void sub_10004B96C()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "restoreKeychainWithBackupPassword failed: %@ (ignored)", v2, v3, v4, v5, v6);
}

void sub_10004B9D4()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "backup keybag digest does not match version in escrow: %@", v2, v3, v4, v5, v6);
}

void sub_10004BA3C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 escrowInformationMetadata];
  sub_10000A13C();
  sub_100033120((void *)&_mh_execute_header, a2, v4, "Our idea of the best silent metadata is: %@", v5);
}

void sub_10004BAC8()
{
  sub_1000331A8();
  sub_10000A180((void *)&_mh_execute_header, v0, v1, "found silent attempt record with id %@ (metadata present %@)");
}

void sub_10004BB48()
{
  sub_100033170();
  *os_log_t v1 = 136315650;
  sub_100033138(v2, v3, (uint64_t)v1);
  sub_100033154((void *)&_mh_execute_header, "%s caught exception: %@: %@", v4, v5);
}

void sub_10004BB98()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "no iCDP backups found!, calling _recoverWithRequest just in case", v2, v3, v4, v5, v6);
}

void sub_10004BBCC()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Performing Silent ICDP recovery", v2, v3, v4, v5, v6);
}

void sub_10004BC00()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "silent attempt failed: no valid record found", v2, v3, v4, v5, v6);
}

void sub_10004BC34()
{
  sub_100033170();
  *uint64_t v1 = 136315650;
  sub_100033138(v2, v3, (uint64_t)v1);
  sub_100033154((void *)&_mh_execute_header, "%s caught exception: %@: %@", v4, v5);
}

void sub_10004BC84()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Performing ICDP recovery", v2, v3, v4, v5, v6);
}

void sub_10004BCB8()
{
  sub_100033170();
  *uint64_t v1 = 136315650;
  sub_100033138(v2, v3, (uint64_t)v1);
  sub_100033154((void *)&_mh_execute_header, "%s caught exception: %@: %@", v4, v5);
}

void sub_10004BD08()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Performing keychain item restoration", v2, v3, v4, v5, v6);
}

void sub_10004BD3C()
{
  sub_100033170();
  *uint64_t v1 = 136315650;
  sub_100033138(v2, v3, (uint64_t)v1);
  sub_100033154((void *)&_mh_execute_header, "%s caught exception: %@: %@", v4, v5);
}

void sub_10004BD8C()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "MKBUserSessionRetrieveSecureBackupBlob() returned NULL blob", v2, v3, v4, v5, v6);
}

void sub_10004BDC0()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "could not deserialize backup blob: %@", v2, v3, v4, v5, v6);
}

void sub_10004BE28()
{
  sub_1000331F0();
  sub_10000A180((void *)&_mh_execute_header, v0, v1, "can't set EMCS dict: %@, backup keybag: %@");
}

void sub_10004BEB4(void **a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *a1;
  sub_10000A120((void *)&_mh_execute_header, a2, a3, "MKBUserSessionDeleteSecureBackupBlob() failed: %@", a5, a6, a7, a8, 2u);
}

void sub_10004BF34()
{
  sub_100033218(__stack_chk_guard);
  sub_10003319C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "MKBUserSessionRetrieveSecureBackupBlob() failed: %@", v2, v3, v4, v5, v6);
}

void sub_10004BF9C()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "silent attempt with missing cached recovery key", v2, v3, v4, v5, v6);
}

void sub_10004BFD0()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Performing silent ICDP recovery", v2, v3, v4, v5, v6);
}

void sub_10004C004()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Platform does not support backup keybag recovery; returning spurious success",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10004C038(id *a1, NSObject *a2)
{
  uint64_t v3 = [*a1 hexString];
  sub_10000A13C();
  sub_100033120((void *)&_mh_execute_header, a2, v4, "no backup found for stashed keybag digest %@", v5);
}

void sub_10004C0CC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004C140(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004C1B4()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "failed to remove recovery from PCS MK bskb: %@", v2, v3, v4, v5, v6);
}

void sub_10004C21C()
{
  sub_1000331C0(__stack_chk_guard);
  sub_10003319C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "failed to remove recovery from iCloudIdentity bskb: %@", v2, v3, v4, v5, v6);
}

void sub_10004C284()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Recovery Key fails to verify against iCloudIdentity and PCSMasterKey keybags", v2, v3, v4, v5, v6);
}

void sub_10004C2B8()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "RK failed to verify against keybag: %@", v2, v3, v4, v5, v6);
}

void sub_10004C320()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "escrowService storeRecordWithRequest: returned: %@", v2, v3, v4, v5, v6);
}

void sub_10004C388(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 metadataHash];
  if (v4) {
    uint64_t v5 = "have";
  }
  else {
    uint64_t v5 = "missing";
  }
  uint8_t v6 = [a1 backOffDate];
  if (v6) {
    uint64_t v7 = "have";
  }
  else {
    uint64_t v7 = "missing";
  }
  uint64_t v8 = [a1 encodedMetadata];
  int v10 = 136315650;
  if (v8) {
    uint64_t v9 = "have";
  }
  else {
    uint64_t v9 = "missing";
  }
  id v11 = v5;
  __int16 v12 = 2080;
  uint64_t v13 = v7;
  __int16 v14 = 2080;
  mach_port_t v15 = v9;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "missing parameter: %s metadataHash, %s backOffDate, %s encodedMetadata", (uint8_t *)&v10, 0x20u);
}

void sub_10004C4A0()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "encodedMetadata not base64", v2, v3, v4, v5, v6);
}

void sub_10004C4D4()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "metadata could not be decoded: %@", v2, v3, v4, v5, v6);
}

void sub_10004C53C()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "missing kSecureBackupClientMetadataKey", v2, v3, v4, v5, v6);
}

void sub_10004C570()
{
  sub_100033170();
  *uint64_t v1 = 136315650;
  sub_100033138(v2, v3, (uint64_t)v1);
  sub_100033154((void *)&_mh_execute_header, "%s caught exception: %@: %@", v4, v5);
}

void sub_10004C5C0()
{
  sub_100033170();
  *uint64_t v1 = 136315650;
  sub_100033138(v2, v3, (uint64_t)v1);
  sub_100033154((void *)&_mh_execute_header, "%s caught exception: %@: %@", v4, v5);
}

void sub_10004C610()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "update metadata only supported for stingray records", v2, v3, v4, v5, v6);
}

void sub_10004C644()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "attempt to set empty passphrase", v2, v3, v4, v5, v6);
}

void sub_10004C678(NSObject *a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  sub_10000A13C();
  sub_100033120((void *)&_mh_execute_header, a1, v3, "error opening temp file: %s", v4);
}

void sub_10004C700(NSObject *a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  sub_10000A13C();
  sub_100033120((void *)&_mh_execute_header, a1, v3, "error closing temp file: %s", v4);
}

void sub_10004C788(NSObject *a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  sub_10000A13C();
  sub_100033120((void *)&_mh_execute_header, a1, v3, "error unlinking temp file: %s", v4);
}

void sub_10004C810()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "error serializing data: %@", v2, v3, v4, v5, v6);
}

void sub_10004C878(NSObject *a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  sub_10000A13C();
  sub_100033120((void *)&_mh_execute_header, a1, v3, "error truncating temp file: %s", v4);
}

void sub_10004C900(NSObject *a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  sub_10000A13C();
  sub_100033120((void *)&_mh_execute_header, a1, v3, "error writing temp file: %s", v4);
}

void sub_10004C988(void *a1, uint64_t a2, NSObject *a3)
{
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  id v7 = [a1 length];
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "writing temp file count = %ld, expected = %lu", (uint8_t *)&v4, 0x16u);
}

void sub_10004CA24()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000A1D0((void *)&_mh_execute_header, v1, v2, "fstat(%d) failed: %s", v3, v4, v5, v6, 2u);
}

void sub_10004CAB8(NSObject *a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  sub_10000A13C();
  sub_100033120((void *)&_mh_execute_header, a1, v3, "error reading temp file: %s", v4);
}

void sub_10004CB40()
{
  sub_100033218(__stack_chk_guard);
  LODWORD(v3) = 134218240;
  *(void *)((char *)&v3 + 4) = v0;
  WORD6(v3) = 2048;
  HIWORD(v3) = v1;
  sub_10000A180((void *)&_mh_execute_header, v0, v2, "reading temp file count = %zd, expected = %zu", (size_t)v3, *((size_t *)&v3 + 1));
}

void sub_10004CBB8()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "error deserializing temp file: %@", v2, v3, v4, v5, v6);
}

void sub_10004CC20()
{
  sub_100033170();
  *uint64_t v1 = 136315650;
  sub_100033138(v2, v3, (uint64_t)v1);
  sub_100033154((void *)&_mh_execute_header, "%s caught exception: %@: %@", v4, v5);
}

void sub_10004CC70()
{
  sub_100033170();
  *uint64_t v1 = 136315650;
  sub_100033138(v2, v3, (uint64_t)v1);
  sub_100033154((void *)&_mh_execute_header, "%s caught exception: %@: %@", v4, v5);
}

void sub_10004CCC0()
{
  sub_100033170();
  *uint64_t v1 = 136315650;
  sub_100033138(v2, v3, (uint64_t)v1);
  sub_100033154((void *)&_mh_execute_header, "%s caught exception: %@: %@", v4, v5);
}

void sub_10004CD10()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "Unable to cache certificate for later use: %@", v2, v3, v4, v5, v6);
}

void sub_10004CD78()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "Unable to fetch duplicate certificate; ignoring error: %@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10004CDE0()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "Unable to fetch certificate; failng: %@", v2, v3, v4, v5, v6);
}

void sub_10004CE48()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "prepareHSA2: Unable to make a SecEscrowRequest: %@", v2, v3, v4, v5, v6);
}

void sub_10004CEB0()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "prepareHSA2: Unable to find a pending request: %@", v2, v3, v4, v5, v6);
}

void sub_10004CF18()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "prepareHSA2: Could not generate escrow record contents: %@", v2, v3, v4, v5, v6);
}

void sub_10004CF80()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "prepareHSA2: No cached certificate: %@", v2, v3, v4, v5, v6);
}

void sub_10004CFE8()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "prepareHSA2: Unable to create prerecord: %@", v2, v3, v4, v5, v6);
}

void sub_10004D050()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "prepareHSA2: Could not successfully cache escrow blob: %@", v2, v3, v4, v5, v6);
}

void sub_10004D0B8()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "prepareHSA2: Could not fetch PRK: %@", v2, v3, v4, v5, v6);
}

void sub_10004D120()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "passcode request status set back to 'not needed'", v2, v3, v4, v5, v6);
}

void sub_10004D154()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "unable to set passcode request status back to 'not needed'", v2, v3, v4, v5, v6);
}

void sub_10004D188()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Failed to escrow account recovery data", v2, v3, v4, v5, v6);
}

void sub_10004D1BC()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "daemonPasscodeRequestOpinion: Unable to make a SecEscrowRequest: %@", v2, v3, v4, v5, v6);
}

void sub_10004D224()
{
  sub_1000331D4();
  sub_100033180((void *)&_mh_execute_header, v0, v1, "daemonPasscodeRequestOpinion: notify unable to fetch the context: %d", v2, v3, v4, v5, v6);
}

void sub_10004D28C()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "daemonPasscodeRequestOpinion: errored finding a potential request: %@", v2, v3, v4, v5, v6);
}

void sub_10004D2F4(NSObject *a1)
{
  uint64_t v2 = +[CSDateUtilities localStringFromDate:qword_100081078];
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "retry-after date has not passed, throttling calls to escrow proxy until %@", (uint8_t *)&v3, 0xCu);
}

void sub_10004D39C(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  int v3 = "-[LakituRequest performRequestWithHandler:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: returned error: %@", (uint8_t *)&v2, 0x16u);
}

void sub_10004D428(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "response retry after date = %@", (uint8_t *)&v2, 0xCu);
}

void sub_10004D4A0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Certificate pinning error", v1, 2u);
}

void sub_10004D4E4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Got nil event unexpectedly", v1, 2u);
}

void sub_10004D528(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a1 id];
  uint8_t v6 = [a2 operationId];
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  int v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Got non-matching event: Got %@, expected %@", (uint8_t *)&v7, 0x16u);
}

void sub_10004D5EC()
{
  sub_10003319C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "SecItemAdd() for bypass token returned %ld", v2, v3, v4, v5, v6);
}

void sub_10004D658()
{
  sub_10003319C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "SecItemDelete() for bypass token returned %ld", v2, v3, v4, v5, v6);
}

void sub_10004D6C4()
{
  sub_10003319C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "SecItemCopyMatching() for bypass token returned %ld", v2, v3, v4, v5, v6);
}

void sub_10004D730()
{
  sub_100041C08();
  sub_100041C20((void *)&_mh_execute_header, v0, v1, "empty base version array for root type %u in %@ environment");
}

void sub_10004D798()
{
  sub_100041C08();
  sub_100041C20((void *)&_mh_execute_header, v0, v1, "empty cert version array for root type %u in %@ environment");
}

void sub_10004D800(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 specifiedFederation];
  sub_10000A13C();
  sub_100033120((void *)&_mh_execute_header, a2, v4, "Certificate requested for federation %@; terms not accepted", v5);
}

void sub_10004D88C()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Can't get account info", v2, v3, v4, v5, v6);
}

void sub_10004D8C0(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 error];
  sub_10000A13C();
  sub_100033120((void *)&_mh_execute_header, a2, v4, "unable to fetch certificate (lakitu error): %@", v5);
}

void sub_10004D94C()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "unable to fetch certificate: %@", v2, v3, v4, v5, v6);
}

void sub_10004D9B8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004DA24(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004DA90()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Unable to deserialize escrow certificate", v2, v3, v4, v5, v6);
}

void sub_10004DAC4()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Cached certificate is for a different escrow URL than the request", v2, v3, v4, v5, v6);
}

void sub_10004DAF8()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Cached certificate is for a different iCloud Environment than the request", v2, v3, v4, v5, v6);
}

void sub_10004DB2C()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Cached certificate is for a different DSID than the request", v2, v3, v4, v5, v6);
}

void sub_10004DB60(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004DBCC()
{
  sub_10003319C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "Double enrollment failed: %@", v2, v3, v4, v5, v6);
}

void sub_10004DC40(id *a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [*a1 dsid];
  uint8_t v6 = [a2 dsid];
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  int v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "enrollRequest dsid != %@, certResponse.dsid = %@", (uint8_t *)&v7, 0x16u);
}

void sub_10004DD08()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "Error getting cert: %@", v2, v3, v4, v5, v6);
}

void sub_10004DD70()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "error in escrow prerecord: %@", v2, v3, v4, v5, v6);
}

void sub_10004DDD8()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Prerecord is for a different DSID than the request", v2, v3, v4, v5, v6);
}

void sub_10004DE0C(void *a1, NSObject *a2)
{
  [a1 duplicate];
  sub_10003319C();
  sub_100033120((void *)&_mh_execute_header, a2, v3, "Prerecord has no %@escrow blob", v4);
}

void sub_10004DEA4()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Prerecord is for a different escrow URL than the request", v2, v3, v4, v5, v6);
}

void sub_10004DED8()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "prerecord is for a different iCloud Environment than the request", v2, v3, v4, v5, v6);
}

void sub_10004DF0C()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "Failed to invalidate escrow cache: %@", v2, v3, v4, v5, v6);
}

void sub_10004DF74()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "No passphrase provided; skipping SRPInit before it fails later",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10004DFA8(void *a1, NSObject *a2)
{
  [a1 clubTypeID];
  sub_10000A13C();
  sub_100033120((void *)&_mh_execute_header, a2, v3, "Bad/unknown ClubTypeID: %ld", v4);
}

void sub_10004E028()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "falling back from recover_request v2 to v0 (%@)", v2, v3, v4, v5, v6);
}

void sub_10004E090()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "falling back from recover_request v1 to v0 (%@)", v2, v3, v4, v5, v6);
}

void sub_10004E0F8()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "silent recovery failed: %@", v2, v3, v4, v5, v6);
}

void sub_10004E160()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "double enrollment recovery failed: %@", v2, v3, v4, v5, v6);
}

void sub_10004E1C8()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "double enrollment recovery: failed to splunk metrics: %@", v2, v3, v4, v5, v6);
}

void sub_10004E230()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "PCS double recovery failed: %@", v2, v3, v4, v5, v6);
}

void sub_10004E298()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "PCS double recovery: failed to splunk metrics: %@", v2, v3, v4, v5, v6);
}

void sub_10004E300(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "createPrerecordFromCandidate: no password", v1, 2u);
}

void sub_10004E344(const __CFString **a1, NSObject *a2)
{
  if (a1) {
    CFStringRef v2 = *a1;
  }
  else {
    CFStringRef v2 = @"no error pointer";
  }
  int v3 = 138412290;
  CFStringRef v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "createPrerecordFromCandidate: Could not generate escrow record blob: %@", (uint8_t *)&v3, 0xCu);
}

void sub_10004E3D0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No primary iCloud account means no PRK", v1, 2u);
}

void sub_10004E414(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to look up authKitAccount: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10004E48C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No PRK found", v1, 2u);
}

void sub_10004E4D0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Exception caught fetching iCloud Accounts: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10004E548()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "account email not verified", v2, v3, v4, v5, v6);
}

void sub_10004E57C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No iCloud account yet", v1, 2u);
}

void sub_10004E5C0()
{
  sub_100033218(__stack_chk_guard);
  sub_10003319C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "failed to create backupslicekeybag: %@", v2, v3, v4, v5, v6);
}

void sub_10004E628()
{
  sub_100033218(__stack_chk_guard);
  sub_10003319C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "SOSBSKBLoadAndUnlockWithWrappingSecret failed: %@", v2, v3, v4, v5, v6);
}

void sub_10004E690()
{
  sub_100033218(__stack_chk_guard);
  sub_10003319C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "failed to encode backupslicekeybag: %@", v2, v3, v4, v5, v6);
}

void sub_10004E6F8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004E764()
{
  sub_10003319C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "SOSCCCopyMyPeerInfo() failed: %@", v2, v3, v4, v5, v6);
}

void sub_10004E7E0()
{
  sub_100033218(__stack_chk_guard);
  sub_10003319C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "SOSBackupSliceKeyBagCreateDirect() failed: %@", v2, v3, v4, v5, v6);
}

void sub_10004E848()
{
  sub_100033218(__stack_chk_guard);
  sub_10003319C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "SOSBSKBCopyEncoded() failed: %@", v2, v3, v4, v5, v6);
}

void sub_10004E8B0(void **a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *a1;
  sub_10000A120((void *)&_mh_execute_header, a2, a3, "CFPropertyListCreateDERData failed: %@", a5, a6, a7, a8, 2u);
}

void sub_10004E92C(void **a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *a1;
  sub_10000A120((void *)&_mh_execute_header, a2, a3, "CFPropertyListCreateWithDERData failed: %@", a5, a6, a7, a8, 2u);
}

void sub_10004E9A8()
{
  sub_100033218(__stack_chk_guard);
  sub_10003319C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "SecPasswordGenerate() failed: %@", v2, v3, v4, v5, v6);
}

void sub_10004EA10()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "Missing cached passphrase", v2, v3, v4, v5, v6);
}

void sub_10004EA44(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 passphrase];
  if (v4) {
    CFStringRef v5 = @"non-";
  }
  else {
    CFStringRef v5 = &stru_100072CF8;
  }
  uint8_t v6 = [a1 smsTarget];
  int v7 = [a1 appleID];
  uint64_t v8 = [a1 iCloudPassword];
  int v10 = 138413058;
  if (v8) {
    CFStringRef v9 = @"non-";
  }
  else {
    CFStringRef v9 = &stru_100072CF8;
  }
  CFStringRef v11 = v5;
  __int16 v12 = 2112;
  uint64_t v13 = v6;
  __int16 v14 = 2112;
  mach_port_t v15 = v7;
  __int16 v16 = 2112;
  CFStringRef v17 = v9;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "attempted to enable backup, with invalid parameters: %@nil recovery password, %@, %@, %@nil iCloud password", (uint8_t *)&v10, 0x2Au);
}

void sub_10004EB70()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "couldn't make record candidate: %@", v2, v3, v4, v5, v6);
}

void sub_10004EBD8()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "OTClique failed to fetch cliqueMemberIdentifier, error: %@", v2, v3, v4, v5, v6);
}

void sub_10004EC40(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_10000A13C();
  sub_100004234((void *)&_mh_execute_header, v2, v3, "SOSCCCopyMyPeerWithNewDeviceRecoverySecret() failed: %@", v4, v5, v6, v7, v8);
}

void sub_10004ECC4()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "SOSPeerInfoGetPeerID() failed", v2, v3, v4, v5, v6);
}

void sub_10004ECF8(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 sosPeerID];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  CFStringRef v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "New self peer ID (%@) does not match escrow contents (%@), abort", (uint8_t *)&v6, 0x16u);
}

void sub_10004EDAC()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "SOSPeerInfoCopyBackupKey() returned no backup public key for peer: %@", v2, v3, v4, v5, v6);
}

void sub_10004EE14()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "SOSPeerInfoCopyEncodedData failed: %@", v2, v3, v4, v5, v6);
}

void sub_10004EE7C()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "New backup key digest does not match escrow contents, abort and retry", v2, v3, v4, v5, v6);
}

void sub_10004EEB0()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "prepareHSA2: Unable to fetch a prerecord: %@", v2, v3, v4, v5, v6);
}

void sub_10004EF18()
{
  sub_10000FE58();
  sub_10000FE3C((void *)&_mh_execute_header, v0, v1, "prepareHSA2: can't deserialize prerecord", v2, v3, v4, v5, v6);
}

void sub_10004EF4C()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "could not create backup bag password: %@", v2, v3, v4, v5, v6);
}

void sub_10004EFB4()
{
  sub_10000A13C();
  sub_10000A120((void *)&_mh_execute_header, v0, v1, "SOSCopyPeerID() failed: %@", v2, v3, v4, v5, v6);
}

void sub_10004F01C(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_10000A13C();
  sub_100004234((void *)&_mh_execute_header, v2, v3, "Failed to get bottled peer, continuing without it: %@", v4, v5, v6, v7, v8);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA1(data, len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA256(data, len, md);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t CFPropertyListCreateDERData()
{
  return _CFPropertyListCreateDERData();
}

uint64_t CFPropertyListCreateWithDERData()
{
  return _CFPropertyListCreateWithDERData();
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t CloudServicesInitializeLogging()
{
  return _CloudServicesInitializeLogging();
}

uint64_t CloudServicesLog()
{
  return _CloudServicesLog();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MGCopyAnswerWithError()
{
  return _MGCopyAnswerWithError();
}

uint64_t MKBGetDeviceConfigurations()
{
  return _MKBGetDeviceConfigurations();
}

uint64_t MKBUserSessionDeleteSecureBackupBlob()
{
  return _MKBUserSessionDeleteSecureBackupBlob();
}

uint64_t MKBUserSessionRetrieveSecureBackupBlob()
{
  return _MKBUserSessionRetrieveSecureBackupBlob();
}

uint64_t MKBUserSessionSetSecureBackupBlob()
{
  return _MKBUserSessionSetSecureBackupBlob();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t OctagonPlatformSupportsSOS()
{
  return _OctagonPlatformSupportsSOS();
}

uint64_t PBDataWriterWriteDataField()
{
  return _PBDataWriterWriteDataField();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return _PBDataWriterWriteInt32Field();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBReaderPlaceMark()
{
  return _PBReaderPlaceMark();
}

uint64_t PBReaderReadData()
{
  return _PBReaderReadData();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderRecallMark()
{
  return _PBReaderRecallMark();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

uint64_t SOSBSKBCopyEncoded()
{
  return _SOSBSKBCopyEncoded();
}

uint64_t SOSBSKBCopyRecoveryKey()
{
  return _SOSBSKBCopyRecoveryKey();
}

uint64_t SOSBSKBGetPeers()
{
  return _SOSBSKBGetPeers();
}

uint64_t SOSBSKBHasRecoveryKey()
{
  return _SOSBSKBHasRecoveryKey();
}

uint64_t SOSBSKBLoadAndUnlockWithWrappingSecret()
{
  return _SOSBSKBLoadAndUnlockWithWrappingSecret();
}

uint64_t SOSBSKBRemoveRecoveryKey()
{
  return _SOSBSKBRemoveRecoveryKey();
}

uint64_t SOSBackupSliceKeyBagCreateDirect()
{
  return _SOSBackupSliceKeyBagCreateDirect();
}

uint64_t SOSBackupSliceKeyBagCreateFromData()
{
  return _SOSBackupSliceKeyBagCreateFromData();
}

uint64_t SOSCCCopyMyPeerInfo()
{
  return _SOSCCCopyMyPeerInfo();
}

uint64_t SOSCCCopyMyPeerWithNewDeviceRecoverySecret()
{
  return _SOSCCCopyMyPeerWithNewDeviceRecoverySecret();
}

uint64_t SOSCCRegisterSingleRecoverySecret()
{
  return _SOSCCRegisterSingleRecoverySecret();
}

uint64_t SOSCopyDeviceBackupPublicKey()
{
  return _SOSCopyDeviceBackupPublicKey();
}

uint64_t SOSPeerInfoCopyBackupKey()
{
  return _SOSPeerInfoCopyBackupKey();
}

uint64_t SOSPeerInfoCopyEncodedData()
{
  return _SOSPeerInfoCopyEncodedData();
}

uint64_t SOSPeerInfoCreateFromData()
{
  return _SOSPeerInfoCreateFromData();
}

uint64_t SOSPeerInfoGetPeerID()
{
  return _SOSPeerInfoGetPeerID();
}

uint64_t SOSPeerInfoLookupGestaltValue()
{
  return _SOSPeerInfoLookupGestaltValue();
}

uint64_t SOSViewCopyViewSet()
{
  return _SOSViewCopyViewSet();
}

uint64_t SOSViewsGetAllCurrent()
{
  return _SOSViewsGetAllCurrent();
}

uint64_t SecCertificateCopySHA256Digest()
{
  return _SecCertificateCopySHA256Digest();
}

CFDataRef SecCertificateCopySerialNumberData(SecCertificateRef certificate, CFErrorRef *error)
{
  return _SecCertificateCopySerialNumberData(certificate, error);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return _SecCertificateCreateWithData(allocator, data);
}

uint64_t SecEMCSCreateDerivedEMCSKey()
{
  return _SecEMCSCreateDerivedEMCSKey();
}

uint64_t SecEMCSCreateNewiDMSKey()
{
  return _SecEMCSCreateNewiDMSKey();
}

uint64_t SecIsInternalRelease()
{
  return _SecIsInternalRelease();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

uint64_t SecItemBackupRestore()
{
  return _SecItemBackupRestore();
}

uint64_t SecItemBackupSetConfirmedManifest()
{
  return _SecItemBackupSetConfirmedManifest();
}

uint64_t SecItemBackupWithChanges()
{
  return _SecItemBackupWithChanges();
}

uint64_t SecItemBackupWithRegisteredBackups()
{
  return _SecItemBackupWithRegisteredBackups();
}

uint64_t SecItemBackupWithRegisteredViewBackup()
{
  return _SecItemBackupWithRegisteredViewBackup();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return _SecItemUpdate(query, attributesToUpdate);
}

uint64_t SecPasswordGenerate()
{
  return _SecPasswordGenerate();
}

uint64_t SecureBackupIsGuitarfishEnabled()
{
  return _SecureBackupIsGuitarfishEnabled();
}

uint64_t SecureBackupSetupConcurrentProtocol()
{
  return _SecureBackupSetupConcurrentProtocol();
}

uint64_t SecureBackupSetupProtocol()
{
  return _SecureBackupSetupProtocol();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _SecKeychainCopyEMCSBackup()
{
  return __SecKeychainCopyEMCSBackup();
}

uint64_t _SecKeychainRestoreBackup()
{
  return __SecKeychainRestoreBackup();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

uint64_t _sqlite3_maintain_load_factor()
{
  return __sqlite3_maintain_load_factor();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return _calloc(__count, __size);
}

int close(int a1)
{
  return _close(a1);
}

uint64_t container_copy_sandbox_token()
{
  return _container_copy_sandbox_token();
}

uint64_t container_error_copy_unlocalized_description()
{
  return _container_error_copy_unlocalized_description();
}

uint64_t container_get_path()
{
  return _container_get_path();
}

uint64_t container_query_create()
{
  return _container_query_create();
}

uint64_t container_query_free()
{
  return _container_query_free();
}

uint64_t container_query_get_last_error()
{
  return _container_query_get_last_error();
}

uint64_t container_query_get_single_result()
{
  return _container_query_get_single_result();
}

uint64_t container_query_operation_set_flags()
{
  return _container_query_operation_set_flags();
}

uint64_t container_query_set_class()
{
  return _container_query_set_class();
}

uint64_t container_query_set_identifiers()
{
  return _container_query_set_identifiers();
}

uint64_t container_query_set_persona_unique_string()
{
  return _container_query_set_persona_unique_string();
}

DB *__cdecl dbopen(const char *a1, int a2, int a3, DBTYPE a4, const void *a5)
{
  return _dbopen(a1, a2, a3, a4, a5);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

gid_t getgid(void)
{
  return _getgid();
}

pid_t getpid(void)
{
  return _getpid();
}

uid_t getuid(void)
{
  return _getuid();
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
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

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
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

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

uint64_t os_state_add_handler()
{
  return _os_state_add_handler();
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return _pwrite(__fd, __buf, __nbyte, a4);
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

int sem_close(sem_t *a1)
{
  return _sem_close(a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return _sem_open(a1, a2);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob64(a1, a2, a3, a4, a5);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

int sqlite3_changes(sqlite3 *a1)
{
  return _sqlite3_changes(a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_blob(a1, iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_bytes(a1, iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_errcode(sqlite3 *db)
{
  return _sqlite3_errcode(db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

void sqlite3_free(void *a1)
{
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

int32_t u_charDigitValue(UChar32 c)
{
  return _u_charDigitValue(c);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return _uuid_parse(in, uu);
}

uint64_t xpc_copy_event()
{
  return _xpc_copy_event();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

uint64_t xpc_set_event()
{
  return _xpc_set_event();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLQueryAllowedCharacterSet];
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

id objc_msgSend__KVSKeybag(void *a1, const char *a2, ...)
{
  return [a1 _KVSKeybag];
}

id objc_msgSend__backupCloudIdentityKeychainViewAndPushToKVS(void *a1, const char *a2, ...)
{
  return [a1 _backupCloudIdentityKeychainViewAndPushToKVS];
}

id objc_msgSend__backupCloudIdentityKeychainViewAndPushToKVSForRecoveryKey(void *a1, const char *a2, ...)
{
  return [a1 _backupCloudIdentityKeychainViewAndPushToKVSForRecoveryKey];
}

id objc_msgSend__backupEnabled(void *a1, const char *a2, ...)
{
  return [a1 _backupEnabled];
}

id objc_msgSend__backupFullKeychain(void *a1, const char *a2, ...)
{
  return [a1 _backupFullKeychain];
}

id objc_msgSend__backupKeychain(void *a1, const char *a2, ...)
{
  return [a1 _backupKeychain];
}

id objc_msgSend__consumeBackupJournal(void *a1, const char *a2, ...)
{
  return [a1 _consumeBackupJournal];
}

id objc_msgSend__disableBackup(void *a1, const char *a2, ...)
{
  return [a1 _disableBackup];
}

id objc_msgSend__getBypassToken(void *a1, const char *a2, ...)
{
  return [a1 _getBypassToken];
}

id objc_msgSend__getLastBackupTimestamp(void *a1, const char *a2, ...)
{
  return [a1 _getLastBackupTimestamp];
}

id objc_msgSend__metadata(void *a1, const char *a2, ...)
{
  return [a1 _metadata];
}

id objc_msgSend__pushCachedKeychainToKVS(void *a1, const char *a2, ...)
{
  return [a1 _pushCachedKeychainToKVS];
}

id objc_msgSend__removeBypassToken(void *a1, const char *a2, ...)
{
  return [a1 _removeBypassToken];
}

id objc_msgSend__removeCachedKeychain(void *a1, const char *a2, ...)
{
  return [a1 _removeCachedKeychain];
}

id objc_msgSend__removeKVSKeybag(void *a1, const char *a2, ...)
{
  return [a1 _removeKVSKeybag];
}

id objc_msgSend__removeMetadata(void *a1, const char *a2, ...)
{
  return [a1 _removeMetadata];
}

id objc_msgSend__removeProtectedKeychain(void *a1, const char *a2, ...)
{
  return [a1 _removeProtectedKeychain];
}

id objc_msgSend__removeUsesEscrow(void *a1, const char *a2, ...)
{
  return [a1 _removeUsesEscrow];
}

id objc_msgSend__removeVeeTwoBackup(void *a1, const char *a2, ...)
{
  return [a1 _removeVeeTwoBackup];
}

id objc_msgSend__setAutobackupEnabled(void *a1, const char *a2, ...)
{
  return [a1 _setAutobackupEnabled];
}

id objc_msgSend__usesEscrow(void *a1, const char *a2, ...)
{
  return [a1 _usesEscrow];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountInfo(void *a1, const char *a2, ...)
{
  return [a1 accountInfo];
}

id objc_msgSend_activeOperations(void *a1, const char *a2, ...)
{
  return [a1 activeOperations];
}

id objc_msgSend_activities(void *a1, const char *a2, ...)
{
  return [a1 activities];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return [a1 activity];
}

id objc_msgSend_activityId(void *a1, const char *a2, ...)
{
  return [a1 activityId];
}

id objc_msgSend_activityLabel(void *a1, const char *a2, ...)
{
  return [a1 activityLabel];
}

id objc_msgSend_activityLogFile(void *a1, const char *a2, ...)
{
  return [a1 activityLogFile];
}

id objc_msgSend_activityRecordRetentionInterval(void *a1, const char *a2, ...)
{
  return [a1 activityRecordRetentionInterval];
}

id objc_msgSend_activityUUID(void *a1, const char *a2, ...)
{
  return [a1 activityUUID];
}

id objc_msgSend_additionalHeaders(void *a1, const char *a2, ...)
{
  return [a1 additionalHeaders];
}

id objc_msgSend_allActivitiesComplete(void *a1, const char *a2, ...)
{
  return [a1 allActivitiesComplete];
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return [a1 allHeaderFields];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allOperationsComplete(void *a1, const char *a2, ...)
{
  return [a1 allOperationsComplete];
}

id objc_msgSend_allViews(void *a1, const char *a2, ...)
{
  return [a1 allViews];
}

id objc_msgSend_altDSID(void *a1, const char *a2, ...)
{
  return [a1 altDSID];
}

id objc_msgSend_alternateDSID(void *a1, const char *a2, ...)
{
  return [a1 alternateDSID];
}

id objc_msgSend_appleID(void *a1, const char *a2, ...)
{
  return [a1 appleID];
}

id objc_msgSend_appleIDPasswordMetadata(void *a1, const char *a2, ...)
{
  return [a1 appleIDPasswordMetadata];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_authToken(void *a1, const char *a2, ...)
{
  return [a1 authToken];
}

id objc_msgSend_authorizationHeader(void *a1, const char *a2, ...)
{
  return [a1 authorizationHeader];
}

id objc_msgSend_backOffDate(void *a1, const char *a2, ...)
{
  return [a1 backOffDate];
}

id objc_msgSend_backupAllowed(void *a1, const char *a2, ...)
{
  return [a1 backupAllowed];
}

id objc_msgSend_backupData(void *a1, const char *a2, ...)
{
  return [a1 backupData];
}

id objc_msgSend_backupDict(void *a1, const char *a2, ...)
{
  return [a1 backupDict];
}

id objc_msgSend_backupKeyDigests(void *a1, const char *a2, ...)
{
  return [a1 backupKeyDigests];
}

id objc_msgSend_backupKeybagDigest(void *a1, const char *a2, ...)
{
  return [a1 backupKeybagDigest];
}

id objc_msgSend_backupQueue(void *a1, const char *a2, ...)
{
  return [a1 backupQueue];
}

id objc_msgSend_base64EncodedStringFromDict(void *a1, const char *a2, ...)
{
  return [a1 base64EncodedStringFromDict];
}

id objc_msgSend_baseRootCertVersions(void *a1, const char *a2, ...)
{
  return [a1 baseRootCertVersions];
}

id objc_msgSend_baseURL(void *a1, const char *a2, ...)
{
  return [a1 baseURL];
}

id objc_msgSend_blob(void *a1, const char *a2, ...)
{
  return [a1 blob];
}

id objc_msgSend_bodyDictionary(void *a1, const char *a2, ...)
{
  return [a1 bodyDictionary];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bootId(void *a1, const char *a2, ...)
{
  return [a1 bootId];
}

id objc_msgSend_bottleID(void *a1, const char *a2, ...)
{
  return [a1 bottleID];
}

id objc_msgSend_bskb(void *a1, const char *a2, ...)
{
  return [a1 bskb];
}

id objc_msgSend_bypassToken(void *a1, const char *a2, ...)
{
  return [a1 bypassToken];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cacheDirURL(void *a1, const char *a2, ...)
{
  return [a1 cacheDirURL];
}

id objc_msgSend_cachedCurrentAccount(void *a1, const char *a2, ...)
{
  return [a1 cachedCurrentAccount];
}

id objc_msgSend_cachedKeychainURL(void *a1, const char *a2, ...)
{
  return [a1 cachedKeychainURL];
}

id objc_msgSend_cachedPassphrase(void *a1, const char *a2, ...)
{
  return [a1 cachedPassphrase];
}

id objc_msgSend_cachedPassphraseFD(void *a1, const char *a2, ...)
{
  return [a1 cachedPassphraseFD];
}

id objc_msgSend_cachedRecordID(void *a1, const char *a2, ...)
{
  return [a1 cachedRecordID];
}

id objc_msgSend_cachedRecordIDPassphrase(void *a1, const char *a2, ...)
{
  return [a1 cachedRecordIDPassphrase];
}

id objc_msgSend_cachedRecordIDPassphraseFD(void *a1, const char *a2, ...)
{
  return [a1 cachedRecordIDPassphraseFD];
}

id objc_msgSend_cachedRecoveryKey(void *a1, const char *a2, ...)
{
  return [a1 cachedRecoveryKey];
}

id objc_msgSend_cachedRecoveryKeyFD(void *a1, const char *a2, ...)
{
  return [a1 cachedRecoveryKeyFD];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return [a1 callStackSymbols];
}

id objc_msgSend_cert(void *a1, const char *a2, ...)
{
  return [a1 cert];
}

id objc_msgSend_certData(void *a1, const char *a2, ...)
{
  return [a1 certData];
}

id objc_msgSend_challengeCode(void *a1, const char *a2, ...)
{
  return [a1 challengeCode];
}

id objc_msgSend_circleChangedNotification(void *a1, const char *a2, ...)
{
  return [a1 circleChangedNotification];
}

id objc_msgSend_clearNotifyToken(void *a1, const char *a2, ...)
{
  return [a1 clearNotifyToken];
}

id objc_msgSend_clientMetadata(void *a1, const char *a2, ...)
{
  return [a1 clientMetadata];
}

id objc_msgSend_closeDB(void *a1, const char *a2, ...)
{
  return [a1 closeDB];
}

id objc_msgSend_closeStore(void *a1, const char *a2, ...)
{
  return [a1 closeStore];
}

id objc_msgSend_clubTypeID(void *a1, const char *a2, ...)
{
  return [a1 clubTypeID];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_command(void *a1, const char *a2, ...)
{
  return [a1 command];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return [a1 completionBlock];
}

id objc_msgSend_connectionQueue(void *a1, const char *a2, ...)
{
  return [a1 connectionQueue];
}

id objc_msgSend_containerBaseURL(void *a1, const char *a2, ...)
{
  return [a1 containerBaseURL];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyKVSState(void *a1, const char *a2, ...)
{
  return [a1 copyKVSState];
}

id objc_msgSend_copyMyPeerID(void *a1, const char *a2, ...)
{
  return [a1 copyMyPeerID];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_countryDialCode(void *a1, const char *a2, ...)
{
  return [a1 countryDialCode];
}

id objc_msgSend_countrySMSCodes(void *a1, const char *a2, ...)
{
  return [a1 countrySMSCodes];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_currentAccount(void *a1, const char *a2, ...)
{
  return [a1 currentAccount];
}

id objc_msgSend_currentBootId(void *a1, const char *a2, ...)
{
  return [a1 currentBootId];
}

id objc_msgSend_currentPID(void *a1, const char *a2, ...)
{
  return [a1 currentPID];
}

id objc_msgSend_currentPersona(void *a1, const char *a2, ...)
{
  return [a1 currentPersona];
}

id objc_msgSend_currentRequest(void *a1, const char *a2, ...)
{
  return [a1 currentRequest];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentTime(void *a1, const char *a2, ...)
{
  return [a1 currentTime];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return [a1 currentUser];
}

id objc_msgSend_currentViews(void *a1, const char *a2, ...)
{
  return [a1 currentViews];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataclassProperties(void *a1, const char *a2, ...)
{
  return [a1 dataclassProperties];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_db(void *a1, const char *a2, ...)
{
  return [a1 db];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 decimalDigitCharacterSet];
}

id objc_msgSend_decodedLabel(void *a1, const char *a2, ...)
{
  return [a1 decodedLabel];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_defaultTimeZone(void *a1, const char *a2, ...)
{
  return [a1 defaultTimeZone];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_deleteAll(void *a1, const char *a2, ...)
{
  return [a1 deleteAll];
}

id objc_msgSend_deleteDoubleOnly(void *a1, const char *a2, ...)
{
  return [a1 deleteDoubleOnly];
}

id objc_msgSend_deleteError(void *a1, const char *a2, ...)
{
  return [a1 deleteError];
}

id objc_msgSend_devicePlatform(void *a1, const char *a2, ...)
{
  return [a1 devicePlatform];
}

id objc_msgSend_deviceSessionID(void *a1, const char *a2, ...)
{
  return [a1 deviceSessionID];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_didChange(void *a1, const char *a2, ...)
{
  return [a1 didChange];
}

id objc_msgSend_didFail(void *a1, const char *a2, ...)
{
  return [a1 didFail];
}

id objc_msgSend_disableiCDPBackup(void *a1, const char *a2, ...)
{
  return [a1 disableiCDPBackup];
}

id objc_msgSend_doSynchronize(void *a1, const char *a2, ...)
{
  return [a1 doSynchronize];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleRecoveryUUID(void *a1, const char *a2, ...)
{
  return [a1 doubleRecoveryUUID];
}

id objc_msgSend_dsid(void *a1, const char *a2, ...)
{
  return [a1 dsid];
}

id objc_msgSend_duplicate(void *a1, const char *a2, ...)
{
  return [a1 duplicate];
}

id objc_msgSend_duplicateEncodedMetadata(void *a1, const char *a2, ...)
{
  return [a1 duplicateEncodedMetadata];
}

id objc_msgSend_duplicateEscrowBlob(void *a1, const char *a2, ...)
{
  return [a1 duplicateEscrowBlob];
}

id objc_msgSend_duplicateEscrowCertificate(void *a1, const char *a2, ...)
{
  return [a1 duplicateEscrowCertificate];
}

id objc_msgSend_emcsCred(void *a1, const char *a2, ...)
{
  return [a1 emcsCred];
}

id objc_msgSend_emcsDict(void *a1, const char *a2, ...)
{
  return [a1 emcsDict];
}

id objc_msgSend_emcsMode(void *a1, const char *a2, ...)
{
  return [a1 emcsMode];
}

id objc_msgSend_enableTransactions(void *a1, const char *a2, ...)
{
  return [a1 enableTransactions];
}

id objc_msgSend_encodedMetadata(void *a1, const char *a2, ...)
{
  return [a1 encodedMetadata];
}

id objc_msgSend_endTimestamp(void *a1, const char *a2, ...)
{
  return [a1 endTimestamp];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_errorCode(void *a1, const char *a2, ...)
{
  return [a1 errorCode];
}

id objc_msgSend_errorMessage(void *a1, const char *a2, ...)
{
  return [a1 errorMessage];
}

id objc_msgSend_escrowBaseURL(void *a1, const char *a2, ...)
{
  return [a1 escrowBaseURL];
}

id objc_msgSend_escrowBlob(void *a1, const char *a2, ...)
{
  return [a1 escrowBlob];
}

id objc_msgSend_escrowCertificate(void *a1, const char *a2, ...)
{
  return [a1 escrowCertificate];
}

id objc_msgSend_escrowDate(void *a1, const char *a2, ...)
{
  return [a1 escrowDate];
}

id objc_msgSend_escrowInformationMetadata(void *a1, const char *a2, ...)
{
  return [a1 escrowInformationMetadata];
}

id objc_msgSend_escrowProxyURL(void *a1, const char *a2, ...)
{
  return [a1 escrowProxyURL];
}

id objc_msgSend_escrowRecord(void *a1, const char *a2, ...)
{
  return [a1 escrowRecord];
}

id objc_msgSend_escrowService(void *a1, const char *a2, ...)
{
  return [a1 escrowService];
}

id objc_msgSend_escrowURL(void *a1, const char *a2, ...)
{
  return [a1 escrowURL];
}

id objc_msgSend_escrowedSPKI(void *a1, const char *a2, ...)
{
  return [a1 escrowedSPKI];
}

id objc_msgSend_excludeiCDPRecords(void *a1, const char *a2, ...)
{
  return [a1 excludeiCDPRecords];
}

id objc_msgSend_expectedFederationID(void *a1, const char *a2, ...)
{
  return [a1 expectedFederationID];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_finalCheckTimestamp(void *a1, const char *a2, ...)
{
  return [a1 finalCheckTimestamp];
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return [a1 finishTasksAndInvalidate];
}

id objc_msgSend_flowID(void *a1, const char *a2, ...)
{
  return [a1 flowID];
}

id objc_msgSend_fmipRecovery(void *a1, const char *a2, ...)
{
  return [a1 fmipRecovery];
}

id objc_msgSend_fmipRecoveryData(void *a1, const char *a2, ...)
{
  return [a1 fmipRecoveryData];
}

id objc_msgSend_fmipUUID(void *a1, const char *a2, ...)
{
  return [a1 fmipUUID];
}

id objc_msgSend_forceICDP(void *a1, const char *a2, ...)
{
  return [a1 forceICDP];
}

id objc_msgSend_guitarfish(void *a1, const char *a2, ...)
{
  return [a1 guitarfish];
}

id objc_msgSend_guitarfishToken(void *a1, const char *a2, ...)
{
  return [a1 guitarfishToken];
}

id objc_msgSend_handledNotifications(void *a1, const char *a2, ...)
{
  return [a1 handledNotifications];
}

id objc_msgSend_hasValue(void *a1, const char *a2, ...)
{
  return [a1 hasValue];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hexString(void *a1, const char *a2, ...)
{
  return [a1 hexString];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_hsa2CachedPrerecordUUID(void *a1, const char *a2, ...)
{
  return [a1 hsa2CachedPrerecordUUID];
}

id objc_msgSend_httpResponse(void *a1, const char *a2, ...)
{
  return [a1 httpResponse];
}

id objc_msgSend_iCDP(void *a1, const char *a2, ...)
{
  return [a1 iCDP];
}

id objc_msgSend_iCloudEnv(void *a1, const char *a2, ...)
{
  return [a1 iCloudEnv];
}

id objc_msgSend_iCloudEnvironment(void *a1, const char *a2, ...)
{
  return [a1 iCloudEnvironment];
}

id objc_msgSend_iCloudIdentityData(void *a1, const char *a2, ...)
{
  return [a1 iCloudIdentityData];
}

id objc_msgSend_iCloudPassword(void *a1, const char *a2, ...)
{
  return [a1 iCloudPassword];
}

id objc_msgSend_icdp(void *a1, const char *a2, ...)
{
  return [a1 icdp];
}

id objc_msgSend_id(void *a1, const char *a2, ...)
{
  return [a1 id];
}

id objc_msgSend_idmsData(void *a1, const char *a2, ...)
{
  return [a1 idmsData];
}

id objc_msgSend_idmsRecovery(void *a1, const char *a2, ...)
{
  return [a1 idmsRecovery];
}

id objc_msgSend_ignoredNotifications(void *a1, const char *a2, ...)
{
  return [a1 ignoredNotifications];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_isComplete(void *a1, const char *a2, ...)
{
  return [a1 isComplete];
}

id objc_msgSend_isDataSeparatedPersona(void *a1, const char *a2, ...)
{
  return [a1 isDataSeparatedPersona];
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return [a1 isMultiUser];
}

id objc_msgSend_isPcsRecord(void *a1, const char *a2, ...)
{
  return [a1 isPcsRecord];
}

id objc_msgSend_iterations(void *a1, const char *a2, ...)
{
  return [a1 iterations];
}

id objc_msgSend_keybag(void *a1, const char *a2, ...)
{
  return [a1 keybag];
}

id objc_msgSend_keybagDigest(void *a1, const char *a2, ...)
{
  return [a1 keybagDigest];
}

id objc_msgSend_knownICDPFederations(void *a1, const char *a2, ...)
{
  return [a1 knownICDPFederations];
}

id objc_msgSend_kvs(void *a1, const char *a2, ...)
{
  return [a1 kvs];
}

id objc_msgSend_kvsQueue(void *a1, const char *a2, ...)
{
  return [a1 kvsQueue];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_logger(void *a1, const char *a2, ...)
{
  return [a1 logger];
}

id objc_msgSend_loggingDescription(void *a1, const char *a2, ...)
{
  return [a1 loggingDescription];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_manifestHash(void *a1, const char *a2, ...)
{
  return [a1 manifestHash];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_metadataHash(void *a1, const char *a2, ...)
{
  return [a1 metadataHash];
}

id objc_msgSend_migrateFromKVS(void *a1, const char *a2, ...)
{
  return [a1 migrateFromKVS];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_needInitialBackup(void *a1, const char *a2, ...)
{
  return [a1 needInitialBackup];
}

id objc_msgSend_nonViableRepair(void *a1, const char *a2, ...)
{
  return [a1 nonViableRepair];
}

id objc_msgSend_notifyToken(void *a1, const char *a2, ...)
{
  return [a1 notifyToken];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_oldEMCSCred(void *a1, const char *a2, ...)
{
  return [a1 oldEMCSCred];
}

id objc_msgSend_operationId(void *a1, const char *a2, ...)
{
  return [a1 operationId];
}

id objc_msgSend_operationRecordRetentionMaxCount(void *a1, const char *a2, ...)
{
  return [a1 operationRecordRetentionMaxCount];
}

id objc_msgSend_operationTimeoutInterval(void *a1, const char *a2, ...)
{
  return [a1 operationTimeoutInterval];
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return [a1 operations];
}

id objc_msgSend_operationsLogger(void *a1, const char *a2, ...)
{
  return [a1 operationsLogger];
}

id objc_msgSend_originalRequest(void *a1, const char *a2, ...)
{
  return [a1 originalRequest];
}

id objc_msgSend_partialRecoveryBottleIDs(void *a1, const char *a2, ...)
{
  return [a1 partialRecoveryBottleIDs];
}

id objc_msgSend_passcodeGeneration(void *a1, const char *a2, ...)
{
  return [a1 passcodeGeneration];
}

id objc_msgSend_passphrase(void *a1, const char *a2, ...)
{
  return [a1 passphrase];
}

id objc_msgSend_passphraseType(void *a1, const char *a2, ...)
{
  return [a1 passphraseType];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pcsNoRecord(void *a1, const char *a2, ...)
{
  return [a1 pcsNoRecord];
}

id objc_msgSend_pcsUpdateDisabled(void *a1, const char *a2, ...)
{
  return [a1 pcsUpdateDisabled];
}

id objc_msgSend_peerIDs(void *a1, const char *a2, ...)
{
  return [a1 peerIDs];
}

id objc_msgSend_peersAndBackupKeyDigests(void *a1, const char *a2, ...)
{
  return [a1 peersAndBackupKeyDigests];
}

id objc_msgSend_pendingNotification(void *a1, const char *a2, ...)
{
  return [a1 pendingNotification];
}

id objc_msgSend_personaIdentifier(void *a1, const char *a2, ...)
{
  return [a1 personaIdentifier];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return [a1 phoneNumber];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_pinningFailure(void *a1, const char *a2, ...)
{
  return [a1 pinningFailure];
}

id objc_msgSend_posixDateFormatter(void *a1, const char *a2, ...)
{
  return [a1 posixDateFormatter];
}

id objc_msgSend_preferredBottleIDs(void *a1, const char *a2, ...)
{
  return [a1 preferredBottleIDs];
}

id objc_msgSend_prerecord(void *a1, const char *a2, ...)
{
  return [a1 prerecord];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_proto(void *a1, const char *a2, ...)
{
  return [a1 proto];
}

id objc_msgSend_protocolVersion(void *a1, const char *a2, ...)
{
  return [a1 protocolVersion];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_rawPassword(void *a1, const char *a2, ...)
{
  return [a1 rawPassword];
}

id objc_msgSend_readStoredLog(void *a1, const char *a2, ...)
{
  return [a1 readStoredLog];
}

id objc_msgSend_reapedOperations(void *a1, const char *a2, ...)
{
  return [a1 reapedOperations];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_recordContents(void *a1, const char *a2, ...)
{
  return [a1 recordContents];
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return [a1 recordID];
}

id objc_msgSend_recordIDs(void *a1, const char *a2, ...)
{
  return [a1 recordIDs];
}

id objc_msgSend_recordId(void *a1, const char *a2, ...)
{
  return [a1 recordId];
}

id objc_msgSend_recordLabel(void *a1, const char *a2, ...)
{
  return [a1 recordLabel];
}

id objc_msgSend_recoveryData(void *a1, const char *a2, ...)
{
  return [a1 recoveryData];
}

id objc_msgSend_recoveryKey(void *a1, const char *a2, ...)
{
  return [a1 recoveryKey];
}

id objc_msgSend_recoveryPassphrase(void *a1, const char *a2, ...)
{
  return [a1 recoveryPassphrase];
}

id objc_msgSend_recoveryResult(void *a1, const char *a2, ...)
{
  return [a1 recoveryResult];
}

id objc_msgSend_recoveryUUID(void *a1, const char *a2, ...)
{
  return [a1 recoveryUUID];
}

id objc_msgSend_remainingAttempts(void *a1, const char *a2, ...)
{
  return [a1 remainingAttempts];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requestDSID(void *a1, const char *a2, ...)
{
  return [a1 requestDSID];
}

id objc_msgSend_requestDictionary(void *a1, const char *a2, ...)
{
  return [a1 requestDictionary];
}

id objc_msgSend_requestUUID(void *a1, const char *a2, ...)
{
  return [a1 requestUUID];
}

id objc_msgSend_requiresDoubleEnrollment(void *a1, const char *a2, ...)
{
  return [a1 requiresDoubleEnrollment];
}

id objc_msgSend_responseClass(void *a1, const char *a2, ...)
{
  return [a1 responseClass];
}

id objc_msgSend_responseDictionary(void *a1, const char *a2, ...)
{
  return [a1 responseDictionary];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_salt(void *a1, const char *a2, ...)
{
  return [a1 salt];
}

id objc_msgSend_secureBackupNumericPassphraseLength(void *a1, const char *a2, ...)
{
  return [a1 secureBackupNumericPassphraseLength];
}

id objc_msgSend_secureBackupUsesNumericPassphrase(void *a1, const char *a2, ...)
{
  return [a1 secureBackupUsesNumericPassphrase];
}

id objc_msgSend_secureBackups(void *a1, const char *a2, ...)
{
  return [a1 secureBackups];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_sessionConfig(void *a1, const char *a2, ...)
{
  return [a1 sessionConfig];
}

id objc_msgSend_setupNotifyEvents(void *a1, const char *a2, ...)
{
  return [a1 setupNotifyEvents];
}

id objc_msgSend_sha1Digest(void *a1, const char *a2, ...)
{
  return [a1 sha1Digest];
}

id objc_msgSend_sha256Digest(void *a1, const char *a2, ...)
{
  return [a1 sha256Digest];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_shouldReap(void *a1, const char *a2, ...)
{
  return [a1 shouldReap];
}

id objc_msgSend_silent(void *a1, const char *a2, ...)
{
  return [a1 silent];
}

id objc_msgSend_silentAttempt(void *a1, const char *a2, ...)
{
  return [a1 silentAttempt];
}

id objc_msgSend_silentAttemptAllowed(void *a1, const char *a2, ...)
{
  return [a1 silentAttemptAllowed];
}

id objc_msgSend_silentDoubleRecovery(void *a1, const char *a2, ...)
{
  return [a1 silentDoubleRecovery];
}

id objc_msgSend_smsTarget(void *a1, const char *a2, ...)
{
  return [a1 smsTarget];
}

id objc_msgSend_smsTargetsInfo(void *a1, const char *a2, ...)
{
  return [a1 smsTargetsInfo];
}

id objc_msgSend_smsVerificationCodeLength(void *a1, const char *a2, ...)
{
  return [a1 smsVerificationCodeLength];
}

id objc_msgSend_someOperationsReaped(void *a1, const char *a2, ...)
{
  return [a1 someOperationsReaped];
}

id objc_msgSend_sosBackupKeybagDigest(void *a1, const char *a2, ...)
{
  return [a1 sosBackupKeybagDigest];
}

id objc_msgSend_sosBackupKeybagPassword(void *a1, const char *a2, ...)
{
  return [a1 sosBackupKeybagPassword];
}

id objc_msgSend_sosCompatibleEscrowSorting(void *a1, const char *a2, ...)
{
  return [a1 sosCompatibleEscrowSorting];
}

id objc_msgSend_sosPeerID(void *a1, const char *a2, ...)
{
  return [a1 sosPeerID];
}

id objc_msgSend_specifiedFederation(void *a1, const char *a2, ...)
{
  return [a1 specifiedFederation];
}

id objc_msgSend_srpData(void *a1, const char *a2, ...)
{
  return [a1 srpData];
}

id objc_msgSend_srpInitBlob(void *a1, const char *a2, ...)
{
  return [a1 srpInitBlob];
}

id objc_msgSend_startTimestamp(void *a1, const char *a2, ...)
{
  return [a1 startTimestamp];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stingray(void *a1, const char *a2, ...)
{
  return [a1 stingray];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_suppressServerFiltering(void *a1, const char *a2, ...)
{
  return [a1 suppressServerFiltering];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_totalOperations(void *a1, const char *a2, ...)
{
  return [a1 totalOperations];
}

id objc_msgSend_trustedRootCertVersions(void *a1, const char *a2, ...)
{
  return [a1 trustedRootCertVersions];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uncacheRecordIDPassphrase(void *a1, const char *a2, ...)
{
  return [a1 uncacheRecordIDPassphrase];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateExistingOperations(void *a1, const char *a2, ...)
{
  return [a1 updateExistingOperations];
}

id objc_msgSend_updatedLog(void *a1, const char *a2, ...)
{
  return [a1 updatedLog];
}

id objc_msgSend_updatedOperations(void *a1, const char *a2, ...)
{
  return [a1 updatedOperations];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_urlRequest(void *a1, const char *a2, ...)
{
  return [a1 urlRequest];
}

id objc_msgSend_urlString(void *a1, const char *a2, ...)
{
  return [a1 urlString];
}

id objc_msgSend_useCachedPassphrase(void *a1, const char *a2, ...)
{
  return [a1 useCachedPassphrase];
}

id objc_msgSend_useRecoveryPET(void *a1, const char *a2, ...)
{
  return [a1 useRecoveryPET];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return [a1 userPersonaUniqueString];
}

id objc_msgSend_usesMultipleiCSC(void *a1, const char *a2, ...)
{
  return [a1 usesMultipleiCSC];
}

id objc_msgSend_usesRandomPassphrase(void *a1, const char *a2, ...)
{
  return [a1 usesRandomPassphrase];
}

id objc_msgSend_usesRecoveryKey(void *a1, const char *a2, ...)
{
  return [a1 usesRecoveryKey];
}

id objc_msgSend_validateInput(void *a1, const char *a2, ...)
{
  return [a1 validateInput];
}

id objc_msgSend_validatePassphrasePresentOrPending(void *a1, const char *a2, ...)
{
  return [a1 validatePassphrasePresentOrPending];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_verificationToken(void *a1, const char *a2, ...)
{
  return [a1 verificationToken];
}

id objc_msgSend_viewName(void *a1, const char *a2, ...)
{
  return [a1 viewName];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}