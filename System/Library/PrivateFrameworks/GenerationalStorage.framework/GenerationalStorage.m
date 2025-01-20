id sub_100002D4C()
{
  void *v0;
  uint64_t vars8;

  if (qword_10004CE48 != -1) {
    dispatch_once(&qword_10004CE48, &stru_100040B48);
  }
  v0 = (void *)qword_10004CE50;
  return v0;
}

void sub_100002DA0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v7 = [*(id *)(a1 + 32) library];
  uint64_t v8 = *(void *)(a1 + 40) + 24;
  id v22 = 0;
  id v23 = 0;
  [v7 extensionsForStorageID:a3 credentials:v8 pubExt:&v23 privExt:&v22];
  id v9 = v23;
  id v10 = v22;

  if (v6)
  {
    v11 = sub_100002D4C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      v25 = "-[GSClient permanentStorageOpenForHandle:withRemoteID:andDocumentID:reply:]_block_invoke";
      __int16 v26 = 2112;
      v27 = 0;
      __int16 v28 = 2112;
      id v29 = v9;
      __int16 v30 = 2112;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %s reply(%@, %@, %@, %@)", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (![*(id *)(*(void *)(a1 + 40) + 8) count])
    {
      uint64_t v12 = os_transaction_create();
      uint64_t v13 = *(void *)(a1 + 40);
      v14 = *(void **)(v13 + 72);
      *(void *)(v13 + 72) = v12;
    }
    uint64_t v15 = *(void *)(a1 + 32);
    v16 = *(void **)(*(void *)(a1 + 40) + 8);
    v17 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
    [v16 setObject:v15 forKeyedSubscript:v17];

    v18 = sub_100002D4C();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v21 = +[NSNumber numberWithLongLong:a3];
      *(_DWORD *)buf = 136316162;
      v25 = "-[GSClient permanentStorageOpenForHandle:withRemoteID:andDocumentID:reply:]_block_invoke";
      __int16 v26 = 2112;
      v27 = v21;
      __int16 v28 = 2112;
      id v29 = v9;
      __int16 v30 = 2112;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] %s reply(%@, %@, %@, %@)", buf, 0x34u);
    }
    uint64_t v19 = *(void *)(a1 + 48);
    v20 = +[NSNumber numberWithLongLong:a3];
    (*(void (**)(uint64_t, void *, id, id, void))(v19 + 16))(v19, v20, v9, v10, 0);
  }
}

void sub_100003050(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    id v9 = v8;
    id v10 = 0;
  }
  else
  {
    v11 = [*(id *)(a1 + 32) library];
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 56) + 24;
    id v22 = 0;
    id v10 = [v11 _getAddition:a3 inNameSpace:v12 named:v13 credentials:v14 error:&v22];
    id v9 = v22;
  }
  uint64_t v15 = [*(id *)(a1 + 32) library];
  uint64_t v16 = *(void *)(a1 + 56) + 24;
  id v20 = 0;
  id v21 = 0;
  [v15 extensionsForStorageID:a3 credentials:v16 pubExt:&v21 privExt:&v20];
  id v17 = v21;
  id v18 = v20;

  uint64_t v19 = sub_100002D4C();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    v24 = "-[GSClient getAdditionInStorage:andNameSpace:named:completionHandler:]_block_invoke";
    __int16 v25 = 2112;
    __int16 v26 = v10;
    __int16 v27 = 2112;
    id v28 = v17;
    __int16 v29 = 2112;
    id v30 = v18;
    __int16 v31 = 2112;
    id v32 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] %s reply(%@, %@, %@, %@)", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_100003220(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v6 = +[NSString stringWithFormat:@"library is invalid"];
    uint64_t v15 = sub_100002D4C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_100029284((uint64_t)v6, v15, v16, v17, v18, v19, v20, v21);
    }

    int v22 = 101;
    goto LABEL_18;
  }
  uint64_t v4 = a1 + 32;
  if (!*(void *)(*(void *)(a1 + 32) + 64))
  {
    id v6 = +[NSString stringWithFormat:@"path has no storage"];
    id v23 = sub_100002D4C();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_1000290A0();
    }

    int v22 = 102;
LABEL_18:
    sub_100003600(v22, v6, 0);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  uint64_t v5 = +[GSFileRow fileRow:byDocumentID:](GSFileRow, "fileRow:byDocumentID:", v3);
  id v6 = (void *)v5;
  if (v5)
  {
    id v7 = *(void **)v4;
    uint64_t v8 = *(void *)(*(void *)v4 + 32);
    if (!v8
      || *(void *)(v5 + 16) == v8
      || ((uint64_t v9 = v7[2],
           uint64_t v10 = *(void *)(v5 + 24),
           BOOL v11 = __OFSUB__(v9, v10),
           uint64_t v12 = v9 - v10,
           !((v12 < 0) ^ v11 | (v12 == 0)))
        ? (BOOL v13 = v12 < 3)
        : (BOOL v13 = 1),
          v13))
    {
      id v14 = 0;
LABEL_27:
      v7[1] = v7[8];
      goto LABEL_28;
    }
    v34 = sub_100002D4C();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = *(void *)(*(void *)v4 + 64);
      uint64_t v37 = v6[2];
      uint64_t v38 = *(void *)(*(void *)v4 + 32);
      *(_DWORD *)buf = 134218496;
      uint64_t v41 = v36;
      __int16 v42 = 2048;
      uint64_t v43 = v37;
      __int16 v44 = 2048;
      uint64_t v45 = v38;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[WARNING] fixing up inode for %lld from %lld to %lld", buf, 0x20u);
    }

    v6[2] = *(void *)(*(void *)v4 + 32);
    [v6 saveToDB:v3];
    id v14 = 0;
LABEL_26:
    id v7 = *(void **)v4;
    goto LABEL_27;
  }
  uint64_t v24 = *(void *)(*(void *)v4 + 64);
  uint64_t v25 = *(void *)(*(void *)v4 + 32);
  id v39 = 0;
  unsigned int v26 = +[GSFileRow createEntry:v3 withDocumentID:v24 fileID:v25 error:&v39];
  id v14 = v39;
  if (v26)
  {
    __int16 v27 = sub_100002D4C();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      sub_1000292F0(a1 + 32, v27, v28, v29, v30, v31, v32, v33);
    }

    goto LABEL_26;
  }
LABEL_28:

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100003508(void *a1)
{
  uint64_t v2 = a1[4];
  if (!*(unsigned char *)(v2 + 136))
  {
    id v3 = sub_100002D4C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10002C284();
    }
    goto LABEL_7;
  }
  if (*(_DWORD *)(v2 + 80))
  {
    id v3 = sub_100002D4C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10002C2EC();
    }
LABEL_7:

    goto LABEL_8;
  }
  id v6 = [(id)v2 libraryRoot];

  if (!v6)
  {
    id v3 = sub_100002D4C();
    if (os_log_type_enabled(v3, (os_log_type_t)0x90u)) {
      sub_10002C2B8();
    }
    goto LABEL_7;
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
LABEL_8:
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    uint64_t v4 = *(void *)(a1[4] + 16);
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(void, uint64_t))(a1[5] + 16))(a1[5], v4);
}

id sub_100003600(int a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = @"GSLibraryErrorDomain";
  uint64_t v8 = 1;
  switch(a1)
  {
    case 'e':
      goto LABEL_16;
    case 'f':
      uint64_t v8 = 7;
      goto LABEL_16;
    case 'g':
      goto LABEL_4;
    case 'h':
      uint64_t v8 = 2;
      goto LABEL_16;
    case 'i':
    case 'p':
      uint64_t v8 = 3;
      goto LABEL_16;
    case 'j':
      id v7 = NSCocoaErrorDomain;
      uint64_t v8 = 516;
      goto LABEL_16;
    case 'k':
      uint64_t v8 = 5;
      goto LABEL_16;
    case 'l':
      uint64_t v8 = 6;
      goto LABEL_16;
    case 'm':
      id v7 = NSCocoaErrorDomain;
      uint64_t v8 = 640;
      goto LABEL_16;
    case 'n':
      uint64_t v8 = 9;
      goto LABEL_16;
    case 'o':
      id v7 = NSCocoaErrorDomain;
      uint64_t v8 = 642;
      goto LABEL_16;
    case 'q':
      uint64_t v8 = 10;
      goto LABEL_16;
    default:
      if (a1)
      {
LABEL_4:
        uint64_t v9 = sub_100002D4C();
        if (os_log_type_enabled(v9, (os_log_type_t)0x90u)) {
          sub_100028D10(a1, v9);
        }

        uint64_t v10 = v7;
        BOOL v11 = 0;
      }
      else
      {
LABEL_16:
        uint64_t v10 = v7;
        if (v6)
        {
          v19[0] = kCFErrorDescriptionKey;
          v19[1] = kCFErrorUnderlyingErrorKey;
          v20[0] = v5;
          v20[1] = v6;
          uint64_t v12 = (id *)v20;
          BOOL v13 = (CFStringRef *)v19;
          uint64_t v14 = 2;
        }
        else
        {
          CFStringRef v17 = kCFErrorDescriptionKey;
          id v18 = v5;
          uint64_t v12 = &v18;
          BOOL v13 = &v17;
          uint64_t v14 = 1;
        }
        uint64_t v15 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v13 count:v14];
        BOOL v11 = +[NSError errorWithDomain:v10 code:v8 userInfo:v15];
      }
      return v11;
  }
}

void sub_100004BDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004BF8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (v8)
  {
    uint64_t v11 = a1 + 32;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a2);
    uint64_t v12 = [v8 pathComponents];
    BOOL v13 = *(void **)(*(void *)(a1 + 32) + 40);
    *(void *)(*(void *)v11 + 40) = v12;

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), a3);
    [*(id *)(*(void *)(a1 + 32) + 48) bytes];
    *(void *)(*(void *)v11 + 56) = sandbox_extension_consume();
    if ((*(void *)(*(void *)(a1 + 32) + 56) & 0x8000000000000000) != 0)
    {
      uint64_t v14 = sub_100002D4C();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u)) {
        sub_100026C60();
      }
    }
  }
  [*(id *)(a1 + 40) handleBoolResult:v8 != 0 error:v10];
}

void sub_100004E34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004E48(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.genstore.invalidation-queue", v3);
  uint64_t v2 = (void *)qword_10004CE38;
  qword_10004CE38 = (uint64_t)v1;
}

void sub_100004EAC(uint64_t a1)
{
  sub_10000A1B8(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 stagingPrefixRelinquish:*(void *)(a1 + 32)];
}

id sub_1000051DC(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = [a3 pathComponents];
  id v8 = [v6 count];
  if (v8 < [v7 count])
  {
    if (![v6 count])
    {
LABEL_6:
      BOOL v13 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v6, "count"));
      uint64_t v14 = [v5 stringByAppendingPathComponent:v13];

      goto LABEL_8;
    }
    uint64_t v9 = 0;
    while (1)
    {
      id v10 = [v6 objectAtIndex:v9];
      uint64_t v11 = [v7 objectAtIndex:v9];
      unsigned __int8 v12 = [v10 isEqualToString:v11];

      if ((v12 & 1) == 0) {
        break;
      }
      if (++v9 >= (unint64_t)[v6 count]) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v14 = 0;
LABEL_8:

  return v14;
}

id sub_1000053C4(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [a1 objectForKey:@"kGSAdditionPOSIXName"];
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v9 validateGSNameAllowingDot:1 error:0] & 1) != 0)
    {
      id v10 = v9;
    }
    else
    {
      uint64_t v11 = +[NSString stringWithFormat:@"invalid POSIX Name value"];
      unsigned __int8 v12 = sub_100002D4C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_100026CF8();
      }

      if (a4)
      {
        sub_100003600(105, v11, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      id v10 = 0;
    }
  }
  else
  {
    BOOL v13 = [v7 lastPathComponent];
    objc_msgSend(v13, "gs_stringByUpdatingPathExtensionWithPathOrURL:", v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

id sub_100005518(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v10 = [v7 objectForKey:@"kGSAdditionDisplayName"];
  if (!v10)
  {
    id v28 = 0;
    unsigned int v13 = [v8 getResourceValue:&v28 forKey:NSURLHasHiddenExtensionKey error:0];
    id v14 = v28;
    uint64_t v15 = v14;
    if (v13) {
      BOOL v16 = v14 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (v16) {
      unsigned int v19 = 1;
    }
    else {
      unsigned int v19 = [v14 BOOLValue] ^ 1;
    }
    id v27 = 0;
    unsigned int v20 = [v8 getResourceValue:&v27 forKey:NSURLLocalizedNameKey error:0];
    id v21 = v27;
    int v22 = v21;
    if (v20) {
      BOOL v23 = v21 == 0;
    }
    else {
      BOOL v23 = 1;
    }
    if (v23)
    {
      unsigned __int8 v12 = sub_1000053C4(v7, v8, v9, a4);

      if (!v12)
      {
        id v11 = 0;
        goto LABEL_29;
      }
      if (!v19)
      {
        uint64_t v24 = [v12 stringByDeletingPathExtension];
LABEL_26:
        id v11 = (id)v24;

        id v25 = [v11 stringByReplacingOccurrencesOfString:@":" withString:@"/"];
LABEL_28:
        unsigned __int8 v12 = v25;
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      if ((v19 & 1) == 0)
      {
        id v25 = v21;
        id v11 = v25;
        goto LABEL_28;
      }
      unsigned __int8 v12 = v21;
    }
    uint64_t v24 = objc_msgSend(v12, "gs_stringByUpdatingPathExtensionWithPathOrURL:", v9);
    goto LABEL_26;
  }
  id v11 = (id)v10;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v11;
    unsigned __int8 v12 = v11;
  }
  else
  {
    CFStringRef v17 = +[NSString stringWithFormat:@"invalid DisplayName value"];
    id v18 = sub_100002D4C();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_100026CF8();
    }

    if (a4)
    {
      sub_100003600(105, v17, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    unsigned __int8 v12 = 0;
  }
LABEL_30:

  return v12;
}

id sub_100005770(void *a1, void *a2)
{
  id v3 = [a1 objectForKey:@"kGSAdditionUserInfo"];
  if (!v3)
  {
    uint64_t v4 = +[NSData dataWithBytesNoCopy:&v9 length:0 freeWhenDone:0];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = +[NSPropertyListSerialization dataWithPropertyList:v3 format:200 options:0 error:a2];
LABEL_5:
    id v5 = (void *)v4;
    goto LABEL_11;
  }
  id v6 = +[NSString stringWithFormat:@"invalid UserInfo"];
  id v7 = sub_100002D4C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100026D60();
  }

  if (a2)
  {
    sub_100003600(110, v6, 0);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v5 = 0;
LABEL_11:

  return v5;
}

id sub_1000058A4(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = [v5 pathExtension];
  id v8 = (void *)v7;
  if (v7) {
    char v9 = (__CFString *)v7;
  }
  else {
    char v9 = &stru_100041DE0;
  }
  uint64_t v10 = v9;

  uint64_t v11 = [v6 pathExtension];
  unsigned __int8 v12 = (void *)v11;
  if (v11) {
    unsigned int v13 = (__CFString *)v11;
  }
  else {
    unsigned int v13 = &stru_100041DE0;
  }
  id v14 = v13;

  if (![(__CFString *)v14 caseInsensitiveCompare:v10])
  {
    id v5 = v5;
    goto LABEL_15;
  }
  uint64_t v15 = [v5 URLByDeletingPathExtension];
  if ([(__CFString *)v14 length])
  {
    uint64_t v16 = [v15 URLByAppendingPathExtension:v14];

    uint64_t v15 = (void *)v16;
  }
  if (([v5 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    id v19 = v15;

    id v5 = v19;
LABEL_15:
    uint64_t v15 = v5;
    if (_CFURLReplaceObject()) {
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  CFStringRef v17 = [v15 lastPathComponent];
  int v18 = _CFURLReplaceObject();

  if (v18)
  {
    +[NSFileCoordinator __itemAtURL:v5 didMoveToURL:v15 purposeID:0];
    goto LABEL_19;
  }
LABEL_16:

  if (a3)
  {
    uint64_t v15 = 0;
    *a3 = 0;
  }
  else
  {
    CFRelease(0);
    uint64_t v15 = 0;
  }
LABEL_19:

  return v15;
}

id sub_100005AA8(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = [v6 storage];
  id v8 = [v7 URLforReplacingItemWithError:a3];

  if (v8)
  {
    char v9 = [v6 name];
    uint64_t v10 = [v8 URLByAppendingPathComponent:v9];

    if ([v6 copyAdditionContentToURL:v10 error:a3])
    {
      uint64_t v11 = sub_1000058A4(v5, v10, a3);

      id v5 = (id)v11;
    }
    sub_10000C530((char *)[v8 fileSystemRepresentation], 0, 0);
    id v5 = v5;

    unsigned __int8 v12 = v5;
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

id sub_100005BBC(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a4;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_100005DDC;
  uint64_t v30 = sub_100005DEC;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  BOOL v23 = sub_100005DDC;
  uint64_t v24 = sub_100005DEC;
  id v25 = 0;
  unsigned __int8 v12 = [v9 prepareAdditionCreationWithItemAtURL:v10 byMoving:a3 creationInfo:v11 error:a5];
  if (v12)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100005DF4;
    v16[3] = &unk_100040B28;
    int v18 = &v26;
    id v19 = &v20;
    unsigned int v13 = dispatch_semaphore_create(0);
    CFStringRef v17 = v13;
    [v9 createAdditionStagedAtURL:v12 creationInfo:v11 completionHandler:v16];
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    if (a5) {
      *a5 = (id) v21[5];
    }
    id v14 = (id)v27[5];
  }
  else
  {
    unsigned int v13 = 0;
    id v14 = 0;
  }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v14;
}

void sub_100005DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005DDC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005DEC(uint64_t a1)
{
}

void sub_100005DF4(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v7 = v10;
  }
  else
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v7 = v5;
  }
  id v8 = v7;
  uint64_t v9 = *v6;
  *id v6 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100005E94(const char *a1, stat *a2)
{
  uint64_t v4 = lstat(a1, a2);
  if (!v4)
  {
    int v5 = *__error();
    mode_t st_mode = a2->st_mode;
    unsigned int v7 = a2->st_flags & 0xFFFFFFDD;
    unsigned __int8 value = 0;
    *__error() = 0;
    if (getxattr(a1, "com.apple.genstore.orig_perms_v1", &value, 1uLL, 0, 0) == 1)
    {
      v7 |= (2 * value) & 6;
      int v8 = (2 * value) & 0x10 | (32 * value) & 0x92 | (value >> 3) & 2;
    }
    else
    {
      if (*__error() != 93)
      {
        uint64_t v9 = sub_100002D4C();
        if (os_log_type_enabled(v9, (os_log_type_t)0x90u)) {
          sub_100026DD0();
        }

        uint64_t v4 = 0xFFFFFFFFLL;
        int v5 = 5;
        goto LABEL_10;
      }
      LOWORD(v8) = 128;
    }
    uint64_t v4 = 0;
    a2->st_flags = v7;
    a2->mode_t st_mode = st_mode | v8;
LABEL_10:
    *__error() = v5;
  }
  return v4;
}

void sub_100005FE4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void sub_100006028(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sub_100006070(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, (os_log_type_t)0x90u, a4, &a9, 0x1Cu);
}

char *sub_1000060A4(int a1, int __errnum, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return strerror(__errnum);
}

void sub_1000060BC(id a1)
{
  qword_10004CE50 = (uint64_t)os_log_create("com.apple.revisiond", "default");
  _objc_release_x1();
}

void sub_100006100(void *a1)
{
  id v1 = a1;
  if (qword_10004CE60 != -1) {
    dispatch_once(&qword_10004CE60, &stru_100040B68);
  }
  if ((unint64_t)[v1 length] >= 0x65)
  {
    id v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @":0x%lx", [v1 hash]);
    id v3 = objc_msgSend(v1, "substringToIndex:", 100 - (void)objc_msgSend(v2, "length"));
    uint64_t v4 = [v3 stringByAppendingString:v2];

    id v1 = (id)v4;
  }
  int v5 = [(id)qword_10004CE58 signatureWithDomain:@"Application" type:@"Functional" subType:@"AssertionFailed" detectedProcess:@"revisiond" triggerThresholdValues:0];
  [v5 setObject:v1 forKeyedSubscript:kSymptomDiagnosticSignatureSubTypeContext];
  unsigned __int8 v6 = [(id)qword_10004CE58 snapshotWithSignature:v5 duration:0 event:0 payload:&stru_100040BA8 reply:15.0];
  unsigned int v7 = sub_100002D4C();
  int v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100026E64((uint64_t)v1, v8);
    }
  }
  else if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
  {
    sub_100026EDC((uint64_t)v1, v8);
  }
}

void sub_100006298(id a1)
{
  qword_10004CE58 = (uint64_t)objc_alloc_init((Class)SDRDiagnosticReporter);
  _objc_release_x1();
}

void sub_1000062D4(id a1, NSDictionary *a2)
{
  id v2 = a2;
  id v3 = sub_100002D4C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100026F54((uint64_t)v2, v3);
  }
}

void sub_10000673C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_10000677C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000678C(uint64_t a1)
{
}

void sub_100006794(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    int v8 = +[NSString stringWithFormat:@"library is invalid"];
    uint64_t v9 = sub_100002D4C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100027034();
    }

    uint64_t v10 = sub_100003600(101, v8, 0);
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    unsigned __int8 v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate:0];
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    unsigned int v7 = *(NSObject **)(v13 + 40);
    *(void *)(v13 + 40) = 0;
    goto LABEL_8;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = a1 + 40;
  [*(id *)(*(void *)(v5 + 8) + 40) validateLibrary];
  [*(id *)(*(void *)(*(void *)v4 + 8) + 40) start];
  unsigned int v6 = [*(id *)(*(void *)(*(void *)v4 + 8) + 40) device];
  if (v6 != dword_10004CB90)
  {
    unsigned int v7 = sub_100002D4C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1000270A4(v4, v7);
    }
LABEL_8:
  }
}

void sub_1000068D0(uint64_t a1)
{
  if (([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) checkForDBUpgrade] & 1) == 0)
  {
    pthread_rwlock_wrlock(&stru_10004CAC8);
    id v2 = (void *)qword_10004CE78;
    id v3 = +[NSNumber numberWithInt:**(unsigned int **)(a1 + 40)];
    [v2 setObject:0 forKeyedSubscript:v3];

    pthread_rwlock_unlock(&stru_10004CAC8);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
  }
}

void sub_100006ABC(uint64_t a1)
{
  pthread_rwlock_wrlock(&stru_10004CAC8);
  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(a1 + 32) device]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = objc_msgSend((id)qword_10004CE78, "objectForKeyedSubscript:");
  id v3 = *(void **)(a1 + 32);

  if (v2 == v3) {
    [(id)qword_10004CE78 removeObjectForKey:v4];
  }
  pthread_rwlock_unlock(&stru_10004CAC8);
}

void sub_100007094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v4 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000070F4(void *a1)
{
  id v2 = a1 + 7;
  id v3 = (void *)a1[6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v3 _libraryForDisk:v2 createIfNone:1 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[4] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

id sub_1000077AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate:1];
}

uint64_t sub_1000077B8(int a1, uint64_t a2, int a3, int a4)
{
  if (a1)
  {
    uint64_t v7 = open("/dev/fsevents", 0);
    uint64_t v8 = v7;
    if ((v7 & 0x80000000) != 0) {
      return v8;
    }
    int v15 = a3;
    int v16 = a4;
    CFStringRef v17 = &dword_10004CB94;
    uint64_t v14 = a2;
    uint64_t v9 = ioctl(v7, 0x80187301uLL, &v14);
    if ((v9 & 0x80000000) != 0)
    {
      uint64_t v12 = v9;
      uint64_t v13 = sub_100002D4C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        sub_100027378(v13);
      }

      close(v8);
      return v12;
    }
    close(v8);
    return 0;
  }
  int v10 = dword_10004CB94;
  if (dword_10004CB94 < 0) {
    return 0;
  }
  dword_10004CB94 = -1;
  return close(v10);
}

uint64_t sub_100007A44()
{
  thread_act_t v0 = mach_thread_self();
  integer_t policy_info = 19;
  thread_policy_set(v0, 3u, &policy_info, 1u);
  mach_port_deallocate(mach_task_self_, v0);
  id v1 = &selRef_unarchivedObjectOfClass_atIndex_;
  id v2 = &selRef_unarchivedObjectOfClass_atIndex_;
  if (byte_10004CE70) {
    goto LABEL_46;
  }
  int v3 = 0;
  while (1)
  {
    unint64_t v4 = read(*((_DWORD *)v2 + 741), v35, 0x800uLL);
    unint64_t v5 = v4;
    if ((v4 & 0x8000000000000000) != 0) {
      break;
    }
    if (v4)
    {
      int v32 = v3;
      if (v4 < 0x801)
      {
        uint64_t v11 = v35;
        uint64_t v12 = &v35[v4];
        do
        {
          int v14 = *(_DWORD *)v11;
          v11 += 8;
          __int16 v13 = v14;
          if (v11 < v12)
          {
            int v33 = v13 & 0xF000;
            int v15 = v13 & 0xFFF;
            while (1)
            {
              int v16 = *(unsigned __int16 *)v11;
              if (v16 == 45887) {
                break;
              }
              uint64_t v17 = *((unsigned __int16 *)v11 + 1);
              int v18 = (int *)(v11 + 4);
              if (v16 == 9 && v15 == 13 && v17 == 4)
              {
                int v23 = *v18;
                uint64_t v24 = sub_100002D4C();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)uint64_t v36 = 67109120;
                  int v37 = v23;
                  _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] received unmount pending on device %d", v36, 8u);
                }

                *(void *)buf = _NSConcreteStackBlock;
                *(void *)&buf[8] = 3221225472;
                *(void *)&buf[16] = sub_100007EC4;
                uint64_t v43 = &unk_100040C58;
                int v44 = v23;
                dispatch_async((dispatch_queue_t)qword_10004CE98, buf);
              }
              else if (v16 != 5 || v15 != 13)
              {
                uint64_t v22 = sub_100002D4C();
                if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
                {
                  *(_DWORD *)uint64_t v36 = 67109632;
                  int v37 = v15;
                  __int16 v38 = 1024;
                  int v39 = v33;
                  __int16 v40 = 1024;
                  int v41 = v16;
                  _os_log_error_impl((void *)&_mh_execute_header, v22, (os_log_type_t)0x90u, "[ERROR] unknown arg. type %d flags %d arg_type %d", v36, 0x14u);
                }
              }
              uint64_t v11 = (uint8_t *)v18 + v17;
              if ((char *)v18 + v17 >= (char *)v12) {
                goto LABEL_42;
              }
            }
            v11 += 2;
          }
LABEL_42:
          ;
        }
        while (v11 < v12);
        id v2 = &selRef_unarchivedObjectOfClass_atIndex_;
        id v1 = &selRef_unarchivedObjectOfClass_atIndex_;
      }
      else
      {
        uint64_t v8 = sub_100002D4C();
        if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&uint8_t buf[4] = v5;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 2048;
          _os_log_error_impl((void *)&_mh_execute_header, v8, (os_log_type_t)0x90u, "[ERROR] read %zd bytes but buffer is only %u", buf, 0x12u);
        }
      }
      int v3 = v32;
    }
    else
    {
      if ((_BYTE)v1[462]) {
        goto LABEL_45;
      }
      int v10 = sub_100002D4C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        id v25 = v1;
        int v26 = *__error();
        id v27 = __error();
        uint64_t v28 = strerror(*v27);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v26;
        id v1 = v25;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = v28;
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] fsevent_producer: strange zero byte read w/errno == %d (%s).", buf, 0x12u);
      }
    }
LABEL_7:
    if ((_BYTE)v1[462]) {
      goto LABEL_45;
    }
  }
  int v6 = *__error();
  uint64_t v7 = sub_100002D4C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = strerror(v6);
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] fmod_watch returned: %zd (err %s)", buf, 0x16u);
  }

  int v3 = v6;
  if (v6 != 9) {
    goto LABEL_7;
  }
LABEL_45:
  if (v3 != 9)
  {
LABEL_46:
    int v29 = *((_DWORD *)v2 + 741);
    if ((v29 & 0x80000000) == 0)
    {
      *((_DWORD *)v2 + 741) = -1;
      if (close(v29))
      {
        uint64_t v30 = sub_100002D4C();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          sub_1000274C4(v30);
        }
      }
    }
  }
  return 0;
}

void sub_100007EC4(uint64_t a1)
{
  unsigned int v5 = *(_DWORD *)(a1 + 32);
  pthread_rwlock_rdlock(&stru_10004CAC8);
  id v1 = (void *)qword_10004CE78;
  id v2 = +[NSNumber numberWithInt:v5];
  int v3 = [v1 objectForKeyedSubscript:v2];

  pthread_rwlock_unlock(&stru_10004CAC8);
  [v3 invalidate:1];

  if (ioctl(dword_10004CB94, 0x80047368uLL, &v5) < 0)
  {
    unint64_t v4 = sub_100002D4C();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
      sub_100027554((int *)&v5, v4);
    }
  }
}

uint64_t sub_100007FA4()
{
  qword_10004CF30 = (uint64_t)CFRunLoopGetCurrent();
  setiopolicy_np(0, 1, 2);
  CFFileDescriptorNativeDescriptor v0 = sub_100008108();
  if (v0 < 0)
  {
    id v1 = sub_100002D4C();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
      sub_100027704();
    }
  }
  id v2 = CFFileDescriptorCreate(0, v0, 1u, (CFFileDescriptorCallBack)sub_100008180, 0);
  if (!v2)
  {
    int v6 = sub_100002D4C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_100027614(v6, v7, v8, v9, v10, v11, v12, v13);
    }

    goto LABEL_14;
  }
  int v3 = v2;
  RunLoopSource = CFFileDescriptorCreateRunLoopSource(0, v2, 0);
  if (!RunLoopSource)
  {
    int v14 = sub_100002D4C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_10002768C(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    CFFileDescriptorInvalidate(v3);
    CFRelease(v3);
LABEL_14:
    int v3 = 0;
    goto LABEL_15;
  }
  unsigned int v5 = RunLoopSource;
  CFRunLoopAddSource((CFRunLoopRef)qword_10004CF30, RunLoopSource, kCFRunLoopDefaultMode);
  CFRelease(v5);
  CFFileDescriptorEnableCallBacks(v3, 1uLL);
LABEL_15:
  qword_10004CE80 = (uint64_t)v3;
  sub_10000837C();
  CFRunLoopRun();
  return 0;
}

uint64_t sub_100008108()
{
  uint64_t v0 = kqueue();
  if ((v0 & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v1 = v0;
  v3.ident = 0;
  *(_DWORD *)&v3.filter = 131063;
  memset(&v3.fflags, 0, 20);
  if (kevent(v0, &v3, 1, 0, 0, 0))
  {
    close(v1);
    return 0xFFFFFFFFLL;
  }
  return v1;
}

void sub_100008180(__CFFileDescriptor *a1)
{
  CFFileDescriptorNativeDescriptor NativeDescriptor = CFFileDescriptorGetNativeDescriptor(a1);
  memset(&eventlist, 0, sizeof(eventlist));
  v25.tv_sec = 0;
  v25.tv_nsec = 0;
  do
  {
    if ((byte_10004CE70 & 1) != 0 || kevent(NativeDescriptor, 0, 0, &eventlist, 1, &v25) != -1) {
      goto LABEL_13;
    }
  }
  while (*__error() == 4);
  int v3 = *__error();
  if (v3)
  {
    unint64_t v4 = sub_100002D4C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100027834(v3, v4);
    }

    if (v3 != 9)
    {
      CFFileDescriptorInvalidate(a1);
      CFRelease(a1);
    }
    qword_10004CE80 = 0;
    CFFileDescriptorNativeDescriptor v5 = sub_100008108();
    if (v5 < 0)
    {
      uint64_t v9 = sub_100002D4C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_100027744(v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    else
    {
      int v6 = CFFileDescriptorCreate(0, v5, 1u, (CFFileDescriptorCallBack)sub_100008180, 0);
      RunLoopSource = CFFileDescriptorCreateRunLoopSource(0, v6, 0);
      if (RunLoopSource)
      {
        uint64_t v8 = RunLoopSource;
        CFRunLoopAddSource((CFRunLoopRef)qword_10004CF30, RunLoopSource, kCFRunLoopDefaultMode);
        CFRelease(v8);
        CFFileDescriptorEnableCallBacks(v6, 1uLL);
        qword_10004CE80 = (uint64_t)v6;
        return;
      }
      uint64_t v17 = sub_100002D4C();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        sub_1000277BC(v17, v18, v19, v20, v21, v22, v23, v24);
      }

      CFFileDescriptorInvalidate(v6);
      CFRelease(v6);
    }
    +[GSStorageManager shutdownLibraries];
    __dmb(0xBu);
    sub_1000077B8(0, 0, 0, 0);
    exit(-1);
  }
LABEL_13:
  if ((byte_10004CE70 & 1) == 0) {
    sub_10000837C();
  }
  CFFileDescriptorEnableCallBacks(a1, 1uLL);
}

void sub_10000837C()
{
  int v0 = 1000;
  while (1)
  {
    int v1 = getfsstat(0, 0, 2);
    if (v1 < 0)
    {
      unint64_t v4 = 0;
LABEL_8:
      int v6 = 0;
      goto LABEL_10;
    }
    int v2 = 2168 * v1 + 2168;
    int v3 = (statfs *)malloc_type_malloc(v2, 0xE8A1D5A2uLL);
    unint64_t v4 = v3;
    if (!v3) {
      goto LABEL_8;
    }
    int v5 = getfsstat(v3, v2, 2);
    if ((v5 & 0x80000000) == 0) {
      break;
    }
    free(v4);
    if (!--v0)
    {
      unint64_t v4 = 0;
      int v6 = -1;
      goto LABEL_10;
    }
  }
  int v6 = v5;
LABEL_10:
  pthread_rwlock_rdlock(&stru_10004CAC8);
  uint64_t v43 = [(id)qword_10004CE78 count];
  pthread_rwlock_unlock(&stru_10004CAC8);
  int v44 = v6;
  if (v6 >= 1)
  {
    name = (char *)kMobileKeyBagLockStatusNotifyToken;
    uint64_t v8 = v6;
    *(void *)&long long v7 = 67109120;
    long long v41 = v7;
    _X20 = v4;
    while (1)
    {
      __asm { PRFM            #0, [X20,#0x8A8] }
      uint64_t v15 = _X20->f_fsid.val[0];
      memset(&v55, 0, sizeof(v55));
      uint64_t v16 = 0;
      if (stat(_X20->f_mntonname, &v55)) {
        goto LABEL_29;
      }
      uid_t st_uid = v55.st_uid;
      if (!v55.st_uid) {
        goto LABEL_29;
      }
      if (MKBDeviceFormattedForContentProtection())
      {
        uint64_t v60 = 0;
        v61 = &v60;
        uint64_t v62 = 0x2020000000;
        int v63 = 0;
        dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
        uint64_t v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        uint64_t v20 = dispatch_queue_create("com.apple.genstore.wait-unlock", v19);

        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = sub_100008A84;
        v57[3] = &unk_100040CA8;
        uid_t v59 = st_uid;
        uint64_t v21 = v18;
        v58 = v21;
        uint64_t v22 = objc_retainBlock(v57);
        *(void *)&long long handler = _NSConcreteStackBlock;
        uint64_t v23 = (int *)(v61 + 3);
        *((void *)&handler + 1) = 3221225472;
        v68 = sub_100008BCC;
        v69 = &unk_100040CD0;
        v71 = &v60;
        uint64_t v24 = v22;
        id v70 = v24;
        if (notify_register_dispatch(name, v23, v20, &handler)) {
          abort();
        }
        dispatch_async(v20, v24);
        dispatch_time_t v25 = dispatch_time(0, 10000000000);
        if (dispatch_semaphore_wait(v21, v25))
        {
          int v26 = sub_100002D4C();
          if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = v41;
            uid_t v66 = st_uid;
            _os_log_error_impl((void *)&_mh_execute_header, v26, (os_log_type_t)0x90u, "[ERROR] timed out waiting for first unlock for user %d", buf, 8u);
          }
        }
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100008BF4;
        block[3] = &unk_100040CF8;
        block[4] = &v60;
        dispatch_sync(v20, block);

        _Block_object_dispose(&v60, 8);
      }
      id v54 = 0;
      id v27 = +[GSStorageManager createLibraryForDevice:error:](GSStorageManager, "createLibraryForDevice:error:", v15, &v54, v41);
      id v28 = v54;
      uint64_t v16 = v28;
      if (!v28) {
        goto LABEL_29;
      }
      int v29 = [v28 domain];
      if (([v29 isEqualToString:@"GSLibraryErrorDomain"] & 1) == 0) {
        break;
      }
      BOOL v30 = [v16 code] == (id)5;

      if (!v30) {
        goto LABEL_26;
      }
LABEL_29:

      ++_X20;
      if (!--v8) {
        goto LABEL_30;
      }
    }

LABEL_26:
    id v31 = sub_100002D4C();
    if (os_log_type_enabled(v31, (os_log_type_t)0x90u))
    {
      LODWORD(handler) = 138412290;
      *(void *)((char *)&handler + 4) = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v31, (os_log_type_t)0x90u, "[ERROR] failed to create library - %@", (uint8_t *)&handler, 0xCu);
    }

    goto LABEL_29;
  }
LABEL_30:
  pthread_rwlock_rdlock(&stru_10004CAC8);
  int v32 = [(id)qword_10004CE78 count];
  int v33 = objc_opt_new();
  v34 = (void *)qword_10004CE78;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_1000089FC;
  v50[3] = &unk_100040C80;
  int v53 = v44;
  v52 = v4;
  id v35 = v33;
  id v51 = v35;
  [v34 enumerateKeysAndObjectsUsingBlock:v50];
  pthread_rwlock_unlock(&stru_10004CAC8);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v36 = v35;
  id v37 = [v36 countByEnumeratingWithState:&v46 objects:v64 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v47;
    do
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(void *)v47 != v38) {
          objc_enumerationMutation(v36);
        }
        objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * i), "invalidate:", 1, v41);
      }
      id v37 = [v36 countByEnumeratingWithState:&v46 objects:v64 count:16];
    }
    while (v37);
  }

  free(v4);
  if (v32 != v43 || [v36 count])
  {
    __int16 v40 = sub_100002D4C();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      sub_1000278C0(v36, v32 - v43, v40);
    }
  }
}

void sub_1000089D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

void sub_1000089FC(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  unsigned int v5 = [a2 longValue];
  uint64_t v6 = *(unsigned int *)(a1 + 48);
  if ((int)v6 < 1)
  {
LABEL_5:
    [*(id *)(a1 + 32) addObject:v8];
  }
  else
  {
    long long v7 = (_DWORD *)(*(void *)(a1 + 40) + 48);
    while (*v7 != v5)
    {
      v7 += 542;
      if (!--v6) {
        goto LABEL_5;
      }
    }
  }
}

void sub_100008A84(uint64_t a1)
{
  int v2 = (int *)(a1 + 40);
  if (MKBUserUnlockedSinceBoot())
  {
    int v3 = sub_100002D4C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100027960(v2, v3);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else if (byte_10004CE70 == 1)
  {
    unint64_t v4 = *(NSObject **)(a1 + 32);
    dispatch_semaphore_signal(v4);
  }
  else
  {
    unsigned int v5 = sub_100002D4C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *v2;
      v7[0] = 67109120;
      v7[1] = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Device is locked for user %u - waiting\n", (uint8_t *)v7, 8u);
    }
  }
}

uint64_t sub_100008BCC(uint64_t result, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) == a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t sub_100008BF4(uint64_t a1)
{
  uint64_t result = notify_cancel(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

void sub_100008C30(id a1, OS_xpc_object *a2)
{
  int v2 = a2;
  if (xpc_activity_should_defer(v2))
  {
    if (xpc_activity_set_state(v2, 3)) {
      goto LABEL_23;
    }
    int v3 = sub_100002D4C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to defer the purgable state", buf, 2u);
    }
  }
  if (xpc_activity_get_state(v2) == 2)
  {
    unint64_t v4 = sub_100002D4C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_1000279DC();
    }

    pthread_rwlock_rdlock(&stru_10004CAC8);
    unsigned int v5 = [(id)qword_10004CE78 allValues];
    pthread_rwlock_unlock(&stru_10004CAC8);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = v5;
    id v6 = [obj countByEnumeratingWithState:&v18 objects:v28 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v11 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v10 estimatePurgeableSpace]);
          v26[0] = &off_1000441C0;
          v26[1] = &off_1000441D8;
          v27[0] = v11;
          v27[1] = v11;
          v26[2] = &off_1000441F0;
          v27[2] = v11;
          uint64_t v12 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
          v25[0] = @"com.apple.revisiond.cache-delete";
          v24[0] = @"CACHE_DELETE_ID";
          v24[1] = @"CACHE_DELETE_VOLUME";
          uint64_t v13 = [v10 libraryRoot];
          v24[2] = @"CACHE_DELETE_AMOUNT";
          v25[1] = v13;
          v25[2] = v12;
          uint64_t v14 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];

          uint64_t v15 = sub_100002D4C();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v23 = v14;
            _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] Updating purgeable info %@", buf, 0xCu);
          }

          CacheDeleteUpdatePurgeable();
        }
        id v7 = [obj countByEnumeratingWithState:&v18 objects:v28 count:16];
      }
      while (v7);
    }

    if (!xpc_activity_set_state(v2, 5))
    {
      uint64_t v16 = sub_100002D4C();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to set the purgeable xpc state to done", buf, 2u);
      }
    }
  }
LABEL_23:
}

void sub_100008FB4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_100008FE8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, (os_log_type_t)0x90u, a4, &a9, 0x12u);
}

void sub_100009008(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, (os_log_type_t)0x90u, a4, &a9, 0xCu);
}

id sub_100009DFC()
{
  if (qword_10004CEA0 != -1) {
    dispatch_once(&qword_10004CEA0, &stru_100040D58);
  }
  int v0 = (void *)qword_10004CEA8;
  return v0;
}

void sub_100009E50(id a1)
{
  int v1 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GSProtocol];
  uint64_t v2 = objc_opt_class();
  int v3 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v2, objc_opt_class(), 0);
  [v1 setClasses:v3 forSelector:"listAdditionsOfStorage:nameSpace:withOptions:withoutOptions:andEnumerationState:completionHandler:" argumentIndex:4 ofReply:0];
  [v1 setClasses:v3 forSelector:"listAdditionsOfStorage:nameSpace:withOptions:withoutOptions:andEnumerationState:completionHandler:" argumentIndex:3 ofReply:1];
  [v1 setClasses:v3 forSelector:"listAdditionsUnderPath:withNameSpace:withOptions:withoutOptions:andEnumerationState:completionHandler:" argumentIndex:4 ofReply:0];
  [v1 setClasses:v3 forSelector:"listAdditionsUnderPath:withNameSpace:withOptions:withoutOptions:andEnumerationState:completionHandler:" argumentIndex:1 ofReply:1];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, objc_opt_class(), 0);

  [v1 setClasses:v6 forSelector:"removeAdditionsInStorage:removalSpec:completionHandler:" argumentIndex:1 ofReply:0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, objc_opt_class(), 0);

  [v1 setClasses:v9 forSelector:"removeAdditionsInStorage:removalSpec:completionHandler:" argumentIndex:0 ofReply:1];
  [v1 setClasses:v9 forSelector:"removeAdditionsUnderPath:additionsList:completionHandler:" argumentIndex:0 ofReply:1];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(), 0);

  [v1 setClasses:v15 forSelector:"removeAdditionsUnderPath:additionsList:completionHandler:" argumentIndex:1 ofReply:0];
  [v1 setClasses:v15 forSelector:"getAdditionInStorage:andNameSpace:named:completionHandler:" argumentIndex:0 ofReply:1];
  [v1 setClasses:v15 forSelector:"getAdditionsInStorage:andNameSpace:named:completionHandler:" argumentIndex:0 ofReply:1];
  [v1 setClasses:v15 forSelector:"listAdditionsOfStorage:nameSpace:withOptions:withoutOptions:andEnumerationState:completionHandler:" argumentIndex:0 ofReply:1];
  [v1 setClasses:v15 forSelector:"listAdditionsUnderPath:withNameSpace:withOptions:withoutOptions:andEnumerationState:completionHandler:" argumentIndex:0 ofReply:1];
  [v1 setClasses:v15 forSelector:"setAdditionNameSpaceInStorage:nameSpace:additionName:value:completionHandler:" argumentIndex:0 ofReply:1];
  [v1 setClasses:v15 forSelector:"createAdditionInStorage:stagedFileDescriptor:creationInfo:completionHandler:" argumentIndex:0 ofReply:1];
  uint64_t v16 = (void *)qword_10004CEA8;
  qword_10004CEA8 = (uint64_t)v1;
}

id sub_10000A1B8(void *a1)
{
  id v1 = a1;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_10000A2F4;
  uint64_t v13 = sub_10000A304;
  id v14 = 0;
  if (qword_10004CEC8 != -1) {
    dispatch_once(&qword_10004CEC8, &stru_100040DE8);
  }
  uint64_t v2 = qword_10004CEB0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000A30C;
  v6[3] = &unk_100040D80;
  id v7 = v1;
  uint64_t v8 = &v9;
  id v3 = v1;
  dispatch_sync(v2, v6);
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t sub_10000A2F4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000A304(uint64_t a1)
{
}

uint64_t sub_10000A30C(uint64_t a1)
{
  if (!qword_10004CEB8) {
    sub_10000A390();
  }
  if (*(void *)(a1 + 32))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend((id)qword_10004CEB8, "remoteObjectProxyWithErrorHandler:");
  }
  else
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v2 + 40) = (id)qword_10004CEC0;
  }
  return _objc_release_x1();
}

void sub_10000A390()
{
  id v1 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.revisiond" options:4096];
  uint64_t v2 = sub_100009DFC();
  [v1 setRemoteObjectInterface:v2];

  objc_initWeak(&location, v1);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000ABF8;
  v6[3] = &unk_100040E10;
  objc_copyWeak(&v7, &location);
  [v1 setInterruptionHandler:v6];
  id v3 = [v1 remoteObjectProxy];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000AC38;
  v4[3] = &unk_100040E10;
  objc_copyWeak(&v5, &location);
  [v1 setInvalidationHandler:v4];
  objc_storeStrong((id *)&qword_10004CEB8, v1);
  objc_storeStrong((id *)&qword_10004CEC0, v3);
  [v1 resume];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void sub_10000A52C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_10000A560()
{
  if (qword_10004CEC8 != -1) {
    dispatch_once(&qword_10004CEC8, &stru_100040DE8);
  }
  int v0 = qword_10004CEB0;
  dispatch_sync(v0, &stru_100040DA0);
}

void sub_10000A5BC(id a1)
{
  [(id)qword_10004CEB8 invalidate];
  id v1 = (void *)qword_10004CEB8;
  qword_10004CEB8 = 0;

  uint64_t v2 = (void *)qword_10004CEC0;
  qword_10004CEC0 = 0;

  id v3 = +[GSStorageManager manager];
  [v3 _connectionWithDaemonWasLost];
}

void sub_10000A760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000A77C(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleObjResult:0 error:v3];
}

void sub_10000AB94(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.genstore.daemontracker", v3);
  uint64_t v2 = (void *)qword_10004CEB0;
  qword_10004CEB0 = (uint64_t)v1;
}

void sub_10000ABF8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void sub_10000AC38(uint64_t a1)
{
  uint64_t v2 = sub_100002D4C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100027C10(v2);
  }

  id v3 = qword_10004CEB0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AD00;
  block[3] = &unk_100040E10;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(v3, block);
  objc_destroyWeak(&v5);
}

void sub_10000AD00(uint64_t a1)
{
  uint64_t v1 = qword_10004CEB8;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if ((id)v1 == WeakRetained)
  {
    id v3 = (void *)qword_10004CEB8;
    qword_10004CEB8 = 0;

    id v4 = (void *)qword_10004CEC0;
    qword_10004CEC0 = 0;

    id v5 = +[GSStorageManager manager];
    [v5 _connectionWithDaemonWasLost];
  }
}

void sub_10000ADA8(uint64_t a1)
{
  uint64_t v2 = (void *)qword_10004CEB8;
  if (!qword_10004CEB8)
  {
    sub_10000A390();
    uint64_t v2 = (void *)qword_10004CEB8;
  }
  id v3 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  objc_storeStrong(v3, v2);
}

void sub_10000B378(id a1)
{
  qword_10004CED8 = objc_alloc_init(GSUserDefaults);
  _objc_release_x1();
}

void sub_10000B638(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10000B750(_DWORD *a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    && (signed int v4 = [v3 intValue], v4 >= a1[10]))
  {
    signed int v7 = a1[11];
    BOOL v5 = v4 <= v7;
    if (v4 > v7) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = v4;
    }
    if (!v3) {
      goto LABEL_14;
    }
  }
  else
  {
    BOOL v5 = 0;
    uint64_t v6 = 0;
    if (!v3) {
      goto LABEL_14;
    }
  }
  if (!v5)
  {
    uint64_t v8 = sub_100002D4C();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      sub_100027CD8();
    }
  }
LABEL_14:
  if (!v5) {
    uint64_t v6 = a1[12];
  }
  uint64_t v9 = +[NSNumber numberWithInt:v6];

  return v9;
}

id sub_10000B94C(void *a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    && (id v4 = [v3 longLongValue], (uint64_t)v4 >= a1[5]))
  {
    uint64_t v7 = a1[6];
    BOOL v5 = (uint64_t)v4 <= v7;
    if ((uint64_t)v4 > v7) {
      id v6 = 0;
    }
    else {
      id v6 = v4;
    }
    if (!v3) {
      goto LABEL_14;
    }
  }
  else
  {
    BOOL v5 = 0;
    id v6 = 0;
    if (!v3) {
      goto LABEL_14;
    }
  }
  if (!v5)
  {
    uint64_t v8 = sub_100002D4C();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      sub_100027E00();
    }
  }
LABEL_14:
  if (!v5) {
    id v6 = (id)a1[7];
  }
  uint64_t v9 = +[NSNumber numberWithLongLong:v6];

  return v9;
}

id sub_10000BB54(double *a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ([v3 doubleValue], v4 < a1[5])
    || v4 > a1[6])
  {
    if (v3)
    {
      BOOL v5 = sub_100002D4C();
      if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
        sub_100027EF4();
      }
    }
    double v4 = a1[7];
  }
  id v6 = +[NSNumber numberWithDouble:v4];

  return v6;
}

id sub_10000BD04(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v4 = [v3 BOOLValue];
  }
  else
  {
    if (v3)
    {
      BOOL v5 = sub_100002D4C();
      if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
        sub_100027F64();
      }
    }
    id v4 = (id)*(unsigned __int8 *)(a1 + 40);
  }
  id v6 = +[NSNumber numberWithBool:v4];

  return v6;
}

void sub_10000BE20(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, (os_log_type_t)0x90u, a4, (uint8_t *)va, 0x34u);
}

BOOL sub_10000BE54(const char *a1, _OWORD *a2)
{
  memset(v7, 0, sizeof(v7));
  long long v5 = xmmword_100032218;
  uint64_t v6 = 0;
  int v3 = getattrlist(a1, &v5, v7, 0x14uLL, 0);
  if (!v3) {
    *a2 = *(_OWORD *)&v7[4];
  }
  return v3 == 0;
}

id sub_10000BEEC(const char *a1, void *a2)
{
  memset(&v6, 0, 512);
  if (statfs(a1, &v6))
  {
    if (a2)
    {
      id v3 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
      uint64_t v4 = 0;
      *a2 = v3;
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = +[NSURL fileURLWithFileSystemRepresentation:v6.f_mntonname isDirectory:1 relativeToURL:0];
  }
  return v4;
}

id sub_10000C018(const char *a1, void *a2)
{
  memset(v7, 0, 512);
  v6[1] = 0;
  v6[2] = 0;
  v6[0] = 0x800000800000005;
  if (getattrlist(a1, v6, v7, 0x410uLL, 0))
  {
    if (a2)
    {
      id v3 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
      uint64_t v4 = 0;
      *a2 = v3;
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = +[NSURL fileURLWithFileSystemRepresentation:(char *)v7 + SDWORD2(v7[0]) + 8 isDirectory:DWORD1(v7[0]) == 2 relativeToURL:0];
  }
  return v4;
}

uint64_t sub_10000C184(int a1, _DWORD *a2)
{
  uint64_t v8 = 0;
  long long v7 = xmmword_100032230;
  unsigned int v6 = 0;
  uint64_t v5 = 0;
  if (fgetattrlist(a1, &v7, &v5, 0xCuLL, 0x20u) < 0)
  {
    uint64_t v4 = sub_100002D4C();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
      sub_10002800C();
    }

    uint64_t result = 0;
    if (a2) {
      *a2 = 0;
    }
  }
  else
  {
    if (a2) {
      *a2 = HIDWORD(v5);
    }
    return v6;
  }
  return result;
}

uint64_t sub_10000C238(int a1)
{
  if ((sub_10000C2D0(a1, 0, 0x40u) & 0x80000000) != 0)
  {
    id v3 = sub_100002D4C();
    if (os_log_type_enabled(v3, (os_log_type_t)0x90u)) {
      sub_1000280C4();
    }

    return 0;
  }
  else
  {
    return sub_10000C184(a1, 0);
  }
}

uint64_t sub_10000C2D0(int a1, int a2, gid_t a3)
{
  if ((a3 & a2) != 0)
  {
    *__error() = 22;
    uint64_t v5 = sub_100002D4C();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
      sub_1000282B0();
    }
LABEL_7:

    return 0xFFFFFFFFLL;
  }
  unsigned int v6 = (a3 | a2) & 0xFFFF0000;
  if (v6)
  {
    *__error() = 1;
    uint64_t v5 = sub_100002D4C();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      int v15 = *__error();
      uint64_t v16 = __error();
      uint64_t v17 = strerror(*v16);
      v20.st_dev = 136316418;
      *(void *)&v20.mode_t st_mode = "GSFchflags";
      WORD2(v20.st_ino) = 1024;
      *(_DWORD *)((char *)&v20.st_ino + 6) = a2;
      HIWORD(v20.st_uid) = 1024;
      v20.st_gid = a3;
      LOWORD(v20.st_rdev) = 1024;
      *(dev_t *)((char *)&v20.st_rdev + 2) = v6;
      *((_WORD *)&v20.st_rdev + 3) = 1024;
      LODWORD(v20.st_atimespec.tv_sec) = v15;
      WORD2(v20.st_atimespec.tv_sec) = 2080;
      *(__darwin_time_t *)((char *)&v20.st_atimespec.tv_sec + 6) = (__darwin_time_t)v17;
      _os_log_error_impl((void *)&_mh_execute_header, v5, (os_log_type_t)0x90u, "[ERROR] %s: non-modifyable flags -%x/+%x (%x); error %d (%s)",
        (uint8_t *)&v20,
        0x2Eu);
    }
    goto LABEL_7;
  }
  memset(&v20, 0, sizeof(v20));
  if (fstat(a1, &v20) < 0)
  {
    id v14 = sub_100002D4C();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u)) {
      sub_100028180();
    }

    return 0xFFFFFFFFLL;
  }
  int v9 = (a2 << 25) & 0x40000000 | a2;
  __uint32_t st_flags = v20.st_flags;
  __uint32_t v11 = v20.st_flags & ~v9 | a3;
  if (v11 != v20.st_flags)
  {
    char v12 = 1;
    while (1)
    {
      char v13 = v12;
      v18[0] = st_flags;
      v18[1] = v11;
      __uint32_t v19 = 0;
      if (ffsctl(a1, 0xC00C4114uLL, v18, 0) < 0) {
        break;
      }
      __uint32_t st_flags = v19;
      if (v19 != v18[0])
      {
        char v12 = 0;
        __uint32_t v11 = v19 & ~v9 | a3;
        if (v13) {
          continue;
        }
      }
      return 0;
    }
    uint64_t v5 = sub_100002D4C();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
      sub_100028218();
    }
    goto LABEL_7;
  }
  return 0;
}

uint64_t sub_10000C530(char *a1, uint64_t a2, void *a3)
{
  return sub_10000C53C(a1, a2, 0, a3);
}

uint64_t sub_10000C53C(char *a1, uint64_t a2, char a3, void *a4)
{
  v29[0] = a1;
  v29[1] = 0;
  long long v7 = fts_open(v29, 84, 0);
  if (!v7)
  {
    uint64_t v17 = +[NSString stringWithFormat:@"fts_open(\"%s\") failed", a1];
    int v18 = *__error();
    __uint32_t v19 = sub_100002D4C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_100026B74();
    }

    if (a4)
    {
      sub_100011F0C(v18, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0;
  }
  uint64_t v8 = v7;
  int v9 = fts_read(v7);
  if (!v9)
  {
LABEL_21:
    uint64_t v16 = 1;
    goto LABEL_40;
  }
  uint64_t v10 = v9;
  while (2)
  {
    switch(v10->fts_info)
    {
      case 1u:
        fts_path = v10->fts_path;
        fts_statp = v10->fts_statp;
        if (sub_10000F4BC(fts_path, 6, 0)) {
          goto LABEL_31;
        }
        memset(&v28, 0, sizeof(v28));
        if (fts_statp)
        {
          p_mode_t st_mode = &fts_statp->st_mode;
        }
        else
        {
          int v15 = lstat(fts_path, &v28);
          p_mode_t st_mode = &v28.st_mode;
          if (v15) {
            goto LABEL_31;
          }
        }
        if (!lchmod(fts_path, *p_st_mode | 0x90)) {
          goto LABEL_20;
        }
LABEL_31:
        stat v20 = +[NSString stringWithFormat:@"Failed to make \"%s\" deletable", v10->fts_path];
        int v21 = *__error();
        uint64_t v22 = sub_100002D4C();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_37;
        }
        goto LABEL_36;
      case 3u:
      case 8u:
      case 0xCu:
      case 0xDu:
        if (sub_10000F4BC(v10->fts_path, 6, 0))
        {
          stat v20 = +[NSString stringWithFormat:@"Failed to make \"%s\" deletable", v10->fts_path];
          int v21 = *__error();
          uint64_t v22 = sub_100002D4C();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_36;
          }
          goto LABEL_37;
        }
        __uint32_t v11 = (std::error_code *)v10->fts_statp;
        if (!v11) {
          sub_100028348();
        }
        if (sub_10000F6FC((std::__fs::filesystem::path *)v10->fts_path, v11))
        {
LABEL_20:
          uint64_t v10 = fts_read(v8);
          if (!v10) {
            goto LABEL_21;
          }
          continue;
        }
        stat v20 = +[NSString stringWithFormat:@"Failed to remove \"%s\"", v10->fts_path];
        int v21 = *__error();
        uint64_t v22 = sub_100002D4C();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
LABEL_36:
        }
          sub_100026B74();
LABEL_37:

        if (a4)
        {
          sub_100011F0C(v21, v20);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

        uint64_t v16 = 0;
LABEL_40:
        fts_close(v8);
        return v16;
      case 4u:
      case 6u:
        if (!v10->fts_level && (a3 & 1) != 0
          || sub_10000F6FC((std::__fs::filesystem::path *)v10->fts_path, (std::error_code *)v10->fts_statp))
        {
          goto LABEL_20;
        }
        stat v20 = +[NSString stringWithFormat:@"Failed to remove \"%s\"", v10->fts_path];
        int v21 = *__error();
        uint64_t v22 = sub_100002D4C();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_36;
        }
        goto LABEL_37;
      case 7u:
      case 0xAu:
        if (*__error() == 2) {
          goto LABEL_20;
        }
        int fts_errno = v10->fts_errno;
        *__error() = fts_errno;
        stat v20 = +[NSString stringWithFormat:@"fts_read() failed for path '%s'\n", v10->fts_path];
        int v21 = *__error();
        uint64_t v22 = sub_100002D4C();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_36;
        }
        goto LABEL_37;
      default:
        goto LABEL_20;
    }
  }
}

uint64_t sub_10000C9B8(char *a1, uint64_t a2, void *a3)
{
  return sub_10000C53C(a1, a2, 1, a3);
}

BOOL sub_10000C9C4(int a1, uint64_t a2, uint64_t a3)
{
  v6[0] = a2;
  v6[1] = a3;
  long long v4 = xmmword_100032260;
  uint64_t v5 = 0;
  return fsetattrlist(a1, &v4, v6, 0x10uLL, 0) >= 0;
}

uint64_t sub_10000CA14()
{
  return openbyid_np();
}

id sub_10000CA44(int32_t a1, uint64_t a2, void *a3)
{
  unsigned int v6 = (char *)malloc_type_malloc(0x2000uLL, 0x5048A9D1uLL);
  if (v6)
  {
    long long v7 = v6;
    if (sub_10000CB94(v6, 0x2000uLL, a1, a2) < 0)
    {
      if (a3)
      {
        +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
        uint64_t v8 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = +[NSString gs_stringWithFileSystemRepresentation:v7];
    }
    free(v7);
  }
  else
  {
    int v9 = sub_100002D4C();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u)) {
      sub_100028374();
    }

    if (a3)
    {
      +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
      uint64_t v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  return v8;
}

ssize_t sub_10000CB94(char *a1, size_t a2, int32_t a3, uint64_t a4)
{
  v11.val[0] = a3;
  v11.val[1] = 0;
  int v7 = 5;
  while (1)
  {
    ssize_t v8 = fsgetpath(a1, a2, &v11, a4);
    if ((v8 & 0x8000000000000000) == 0) {
      return v8 - 1;
    }
    if (*__error() != 35) {
      break;
    }
    if (!--v7) {
      return -1;
    }
  }
  uint64_t v10 = sub_100002D4C();
  if (os_log_type_enabled(v10, (os_log_type_t)0x90u)) {
    sub_10002840C();
  }

  return -1;
}

uint64_t sub_10000CC40(std::__fs::filesystem::path *a1, std::__fs::filesystem::path *a2, void *a3)
{
  memset(&v16, 0, sizeof(v16));
  if (lstat((const char *)a1, &v16) < 0)
  {
    int v9 = +[NSString stringWithFormat:@"Unable to lstat \"%s\"", a1];
    int v10 = *__error();
    fsid_t v11 = sub_100002D4C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100026B74();
    }

    if (a3)
    {
      sub_100011F0C(v10, v9);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0;
  }
  uint64_t v15 = 0;
  uint64_t result = sub_10000CE88((char *)a1, (uint64_t)&v16, (uint64_t)&v15, a3);
  if (!result) {
    return result;
  }
  rename(a1, a2, v7);
  if (!v8) {
    goto LABEL_7;
  }
  if (*__error() == 18)
  {
    if ((copyfile((const char *)a1, (const char *)a2, 0, 0x10E000Fu) & 0x80000000) == 0)
    {
      sub_10000D17C((const char *)a1, (const char *)a2);
      sub_10000C53C((char *)a1, 0, 0, 0);
LABEL_7:
      sub_10000D048((char *)a2, (unsigned __int16 *)&v15);
      return 1;
    }
    char v12 = +[NSString stringWithFormat:@"copyfile(%s, %s) failed", a1, a2];
    int v13 = *__error();
    id v14 = sub_100002D4C();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  char v12 = +[NSString stringWithFormat:@"rename(%s, %s) failed", a1, a2];
  int v13 = *__error();
  id v14 = sub_100002D4C();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
LABEL_16:
  }
    sub_100026B74();
LABEL_17:

  if (a3)
  {
    sub_100011F0C(v13, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  sub_10000D048((char *)a1, (unsigned __int16 *)&v15);
  return 0;
}

uint64_t sub_10000CE88(char *a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v8 = *(unsigned __int16 *)(a2 + 4);
  int v9 = *(_DWORD *)(a2 + 116);
  if (v8 == (v8 | 0x92))
  {
    __int16 v10 = 0;
    int v11 = *(_DWORD *)(a2 + 116);
  }
  else
  {
    if (chmod(a1, v8 | 0x92))
    {
      char v12 = +[NSString stringWithFormat:@"failed make \"%s\" writable", a1];
      int v13 = *__error();
      id v14 = sub_100002D4C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_100026B74();
      }

      if (a4)
      {
        sub_100011F0C(v13, v12);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      return 0;
    }
    __int16 v10 = *(_WORD *)(a2 + 4);
    int v11 = *(_DWORD *)(a2 + 116);
  }
  *(_WORD *)a3 = v10;
  if (v11 == (v9 & 0xFFFFFFF9))
  {
    *(_DWORD *)(a3 + 4) = 0;
    return 1;
  }
  if ((sub_10000F41C(a1, 6, 0) & 0x80000000) == 0)
  {
    *(_DWORD *)(a3 + 4) = *(_DWORD *)(a2 + 116);
    return 1;
  }
  stat v16 = +[NSString stringWithFormat:@"failed to make \"%s\" writable", a1];
  int v17 = *__error();
  int v18 = sub_100002D4C();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_100026B74();
  }

  if (a4)
  {
    sub_100011F0C(v17, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (*(_WORD *)a3) {
    chmod(a1, *(_WORD *)a3);
  }
  return 0;
}

void sub_10000D048(char *a1, unsigned __int16 *a2)
{
  int v4 = *a2;
  if (v4 && chmod(a1, v4))
  {
    uint64_t v5 = +[NSString stringWithFormat:@"failed restore \"%s\" permissions", a1];
    __error();
    unsigned int v6 = sub_100002D4C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100026B74();
    }
  }
  if (*((_DWORD *)a2 + 1)
    && sub_10000F41C(a1, 0, (unsigned __int16)*((_DWORD *)a2 + 1))
    && *__error() != 45)
  {
    int v7 = +[NSString stringWithFormat:@"failed restore \"%s\" flags", a1];
    __error();
    int v8 = sub_100002D4C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100026B74();
    }
  }
}

void sub_10000D17C(const char *a1, const char *a2)
{
  uint64_t v7 = 0;
  long long v6 = xmmword_100032260;
  v4[0] = 0;
  v4[1] = 0;
  int v5 = 0;
  if (getattrlist(a1, &v6, v4, 0x14uLL, 1u))
  {
    id v3 = sub_100002D4C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100028550();
    }
  }
  else
  {
    if (!setattrlist(a2, &v6, (char *)v4 + 4, 0x10uLL, 1u)) {
      return;
    }
    id v3 = sub_100002D4C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1000284D4();
    }
  }
}

id sub_10000D258(const char *a1, void *a2)
{
  ssize_t v4 = getxattr(a1, "com.apple.genstore.info", 0, 0, 0, 0);
  if (v4 == -1)
  {
    if (*__error() == 93)
    {
      id v12 = +[NSMutableDictionary dictionary];
      goto LABEL_28;
    }
    int v13 = +[NSString stringWithFormat:@"getxattr failed"];
    int v14 = *__error();
    uint64_t v15 = sub_100002D4C();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_21;
    }
LABEL_20:
    sub_100026B74();
LABEL_21:

    if (a2)
    {
      sub_100011F0C(v14, v13);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_26;
  }
  size_t v5 = v4;
  long long v6 = malloc_type_malloc(v4, 0x72217624uLL);
  if (!v6)
  {
    int v13 = +[NSString stringWithFormat:@"malloc failed"];
    int v14 = *__error();
    uint64_t v15 = sub_100002D4C();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  uint64_t v7 = v6;
  ssize_t v8 = getxattr(a1, "com.apple.genstore.info", v6, v5, 0, 0);
  if (v8 == -1 || v8 != v5)
  {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Attribute %s at path \"%s\" should have size: %ld; actual %ld\n",
      "com.apple.genstore.info",
      a1,
      v5,
    __int16 v10 = v8);
    int v11 = sub_100002D4C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100028658();
    }

    if (a2)
    {
      sub_100003600(101, v10, 0);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }

    free(v7);
    goto LABEL_27;
  }
  int v13 = +[NSData dataWithBytesNoCopy:v7 length:v5 freeWhenDone:1];
  uint64_t v16 = +[NSPropertyListSerialization propertyListWithData:v13 options:1 format:0 error:a2];
  if (!v16)
  {
    int v18 = sub_100002D4C();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u)) {
      sub_1000285CC((uint64_t)a1, v18);
    }

LABEL_26:
    goto LABEL_27;
  }
  int v17 = (void *)v16;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v17;

    goto LABEL_28;
  }
  stat v20 = +[NSString stringWithFormat:@"result isn't a CFDictionary"];
  int v21 = sub_100002D4C();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_100028658();
  }

  if (a2)
  {
    sub_100003600(101, v20, 0);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_27:
  id v12 = 0;
LABEL_28:
  return v12;
}

uint64_t sub_10000D5A8(char *a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = [v5 bytes];
  id v7 = [v5 length];

  return sub_10000D630(a1, "com.apple.genstore.info", v6, (size_t)v7, a3);
}

uint64_t sub_10000D630(char *a1, const char *a2, const void *a3, size_t a4, void *a5)
{
  uid_t v10 = geteuid();
  uint64_t v20 = 0;
  if (v10)
  {
    memset(&v19, 0, sizeof(v19));
    if (lstat(a1, &v19))
    {
      int v11 = +[NSString stringWithFormat:@"lstat(%s) failed", a1];
      int v12 = *__error();
      int v13 = sub_100002D4C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_100026B74();
      }

      if (a5)
      {
        sub_100011F0C(v12, v11);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      return 0;
    }
    if (!sub_10000CE88(a1, (uint64_t)&v19, (uint64_t)&v20, a5)) {
      return 0;
    }
  }
  if (a3 && a4)
  {
    uint64_t v14 = 1;
    if (setxattr(a1, a2, a3, a4, 0, 1))
    {
      uint64_t v15 = +[NSString stringWithFormat:@"setxattr(%s) failed", a1];
      int v16 = *__error();
      int v17 = sub_100002D4C();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_18;
      }
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v14 = 1;
    if (removexattr(a1, a2, 1) && *__error() != 93)
    {
      uint64_t v15 = +[NSString stringWithFormat:@"removexattr(%s) failed", a1];
      int v16 = *__error();
      int v17 = sub_100002D4C();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
LABEL_18:
      }
        sub_100026B74();
LABEL_19:

      if (a5)
      {
        sub_100011F0C(v16, v15);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      uint64_t v14 = 0;
    }
  }
  if (v10) {
    sub_10000D048(a1, (unsigned __int16 *)&v20);
  }
  return v14;
}

uint64_t sub_10000D88C(char *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = sub_10000D258(a1, a3);
  id v7 = v6;
  if (v6)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000D9B8;
    v12[3] = &unk_100040F50;
    id v8 = v6;
    id v13 = v8;
    [v5 enumerateKeysAndObjectsUsingBlock:v12];
    if ([v8 count])
    {
      int v9 = +[NSPropertyListSerialization dataWithPropertyList:v8 format:200 options:0 error:a3];
      if (!v9)
      {
        uint64_t v10 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      int v9 = 0;
    }
    uint64_t v10 = sub_10000D5A8(a1, v9, a3);

    goto LABEL_8;
  }
  uint64_t v10 = 0;
LABEL_9:

  return v10;
}

void sub_10000D9B8(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  id v5 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass) {
    [v7 removeObjectForKey:v5];
  }
  else {
    [v7 setObject:v8 forKey:v5];
  }
}

id sub_10000DA54(char *path, void *a2)
{
  return sub_10000DA68("com.apple.genstore.origposixname", path, a2);
}

id sub_10000DA68(char *name, char *path, void *a3)
{
  ssize_t v6 = getxattr(path, name, value, 0x2FEuLL, 0, 0);
  if (v6 == -1)
  {
    id v8 = +[NSString stringWithFormat:@"Failed to get %s xattr", name];
    int v11 = *__error();
    int v12 = sub_100002D4C();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  ssize_t v7 = v6;
  if (v6 >= 766)
  {
    id v8 = +[NSString stringWithFormat:@"%s xattr too large (%ld) at path \"%s\"", name, v6, path];
    int v9 = sub_100002D4C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100028658();
    }

    if (a3)
    {
      uint64_t v10 = sub_100003600(101, v8, 0);
LABEL_15:
      id v13 = 0;
      *a3 = v10;
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (v6)
  {
    value[v6] = 0;
    id v8 = +[NSFileManager defaultManager];
    id v13 = [v8 stringWithFileSystemRepresentation:value length:v7];
    goto LABEL_17;
  }
  id v8 = +[NSString stringWithFormat:@"%s xattr too short (0) at path \"%s\"", name, path];
  int v11 = *__error();
  int v12 = sub_100002D4C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
LABEL_12:
  }
    sub_100026B74();
LABEL_13:

  if (a3)
  {
    uint64_t v10 = sub_100011F0C(v11, v8);
    goto LABEL_15;
  }
LABEL_16:
  id v13 = 0;
LABEL_17:

  return v13;
}

id sub_10000DC94(char *path, void *a2)
{
  return sub_10000DA68("com.apple.genstore.origdisplayname", path, a2);
}

uint64_t sub_10000DCA8(char *a1, id a2, void *a3)
{
  id v5 = (const char *)[a2 fileSystemRepresentation];
  ssize_t v6 = v5;
  if (v5) {
    size_t v7 = strlen(v5);
  }
  else {
    size_t v7 = 0;
  }
  return sub_10000D630(a1, "com.apple.genstore.origposixname", v6, v7, a3);
}

uint64_t sub_10000DD20(char *a1, id a2, void *a3)
{
  id v5 = (const char *)[a2 fileSystemRepresentation];
  ssize_t v6 = v5;
  if (v5) {
    size_t v7 = strlen(v5);
  }
  else {
    size_t v7 = 0;
  }
  return sub_10000D630(a1, "com.apple.genstore.origdisplayname", v6, v7, a3);
}

uint64_t sub_10000DD98(char *a1, char a2, void *a3)
{
  if ((a2 & 0xC) != 0)
  {
    v6[1] = v3;
    void v6[2] = v4;
    v6[0] = a2 & 0xC | 1;
    return sub_10000D630(a1, "com.apple.genstore.gen_options", v6, 8uLL, a3);
  }
  else
  {
    return sub_10000D630(a1, "com.apple.genstore.gen_options", 0, 0, a3);
  }
}

BOOL sub_10000DDFC(const char *a1)
{
  uint64_t value = 0;
  ssize_t v1 = getxattr(a1, "com.apple.genstore.gen_options", &value, 8uLL, 0, 1);
  if (v1 == -1) {
    return *__error() == 93;
  }
  ssize_t v2 = v1;
  BOOL result = 0;
  if (v2 == 8) {
    return value;
  }
  return result;
}

uint64_t sub_10000DE68(char *a1, char a2, void *a3)
{
  char v4 = a2;
  return sub_10000D630(a1, "com.apple.genstore.conflictResolved", &v4, 1uLL, a3);
}

BOOL sub_10000DEA0(const char *a1)
{
  return getxattr(a1, "com.apple.genstore.conflictResolved", &value, 1uLL, 0, 1) == 1 && value == 1;
}

uint64_t sub_10000DEE8(const char *a1, uint64_t a2)
{
  memset(&v15, 0, sizeof(v15));
  if (stat(a1, &v15)) {
    return 0;
  }
  uint64_t v4 = 0;
  if (getxattr(a1, "com.apple.decmpfs", 0, 0, 0, 32) <= 0)
  {
    id v5 = +[NSString gs_stringWithFileSystemRepresentation:a2];
    ssize_t v6 = [v5 stringByDeletingLastPathComponent];

    dev_t st_dev = v15.st_dev;
    id v8 = v6;
    if (stat((const char *)[v8 fileSystemRepresentation], &v15)) {
      BOOL v9 = 0;
    }
    else {
      BOOL v9 = st_dev == v15.st_dev;
    }
    if (!v9 || (memset(&v16, 0, 512), statfs(a1, &v16) < 0))
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v14 = 0;
      long long v13 = xmmword_100032248;
      int v12 = 0;
      memset(v11, 0, sizeof(v11));
      if (getattrlist(v16.f_mntonname, &v13, v11, 0x24uLL, 0x21u) >= 0) {
        uint64_t v4 = HIWORD(DWORD2(v11[0])) & 1;
      }
      else {
        uint64_t v4 = 0;
      }
    }
  }
  return v4;
}

uint64_t sub_10000E0AC(char *a1, void *a2)
{
  v20[0] = a1;
  v20[1] = 0;
  uint64_t v4 = fts_open(v20, 84, 0);
  if (!v4)
  {
    int v11 = +[NSString stringWithFormat:@"fts_open(%s) failed", a1];
    int v12 = *__error();
    long long v13 = sub_100002D4C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_100026B74();
    }

    if (a2)
    {
      sub_100011F0C(v12, v11);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0;
  }
  id v5 = v4;
  ssize_t v6 = fts_read(v4);
  if (!v6)
  {
    uint64_t v8 = 0;
    goto LABEL_26;
  }
  size_t v7 = v6;
  uint64_t v8 = 0;
  while (1)
  {
    int fts_info = v7->fts_info;
    if (fts_info == 8)
    {
      if (strncmp(v7->fts_name, "._", 2uLL)) {
        v8 += v7->fts_statp->st_size;
      }
      goto LABEL_13;
    }
    if (fts_info == 7 || fts_info == 10) {
      break;
    }
LABEL_13:
    size_t v7 = fts_read(v5);
    if (!v7) {
      goto LABEL_26;
    }
  }
  int fts_errno = v7->fts_errno;
  *__error() = fts_errno;
  stat v15 = +[NSString stringWithFormat:@"fts_read(%s) failed", v7->fts_path];
  int v16 = *__error();
  int v17 = sub_100002D4C();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_100026B74();
  }

  if (a2)
  {
    sub_100011F0C(v16, v15);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v8 = -1;
LABEL_26:
  fts_close(v5);
  return v8;
}

uint64_t sub_10000E2B8(std::__fs::filesystem::path *a1, std::__fs::filesystem::path *a2, int a3, uint64_t a4, void *a5)
{
  if (a3)
  {
    memset(&v21, 0, sizeof(v21));
    uint64_t v20 = 0;
    if (lstat((const char *)a1, &v21))
    {
      uint64_t v8 = +[NSString stringWithFormat:@"lstat(%s) failed", a1];
      int v9 = *__error();
      uint64_t v10 = sub_100002D4C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_100026B74();
      }

      if (a5)
      {
        sub_100011F0C(v9, v8);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (sub_10000CE88((char *)a1, (uint64_t)&v21, (uint64_t)&v20, a5))
    {
      rename(a1, a2, v14);
      if (!v15)
      {
        sub_10000D048((char *)a2, (unsigned __int16 *)&v20);
        return sub_10000E4DC((char *)a2, 0, 0, a5);
      }
      int v16 = +[NSString stringWithFormat:@"rename(%s, %s) failed", a1, a2];
      int v17 = *__error();
      int v18 = sub_100002D4C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_100026B74();
      }

      if (a5)
      {
        sub_100011F0C(v17, v16);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      sub_10000D048((char *)a1, (unsigned __int16 *)&v20);
    }
    return 0;
  }
  else
  {
    int v11 = [[_CopyfileCallbackCtx alloc] initWithPath:a1 error:a5];
    int v12 = v11;
    if (v11)
    {
      [(_CopyfileCallbackCtx *)v11 setDoArchive:1];
      uint64_t v13 = sub_10000EACC((const char *)a1, (const char *)a2, 17563663, v12, a5);
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  return v13;
}

uint64_t sub_10000E4DC(char *a1, int a2, void *a3, void *a4)
{
  v53[0] = a1;
  v53[1] = 0;
  uint64_t v8 = fts_open(v53, 84, 0);
  if (!v8)
  {
    uint64_t v10 = +[NSString stringWithFormat:@"fts_open(\"%s\") failed", a1];
    int v26 = *__error();
    id v27 = sub_100002D4C();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      sub_100026B74();
    }

    if (a4)
    {
      sub_100011F0C(v26, v10);
      uint64_t v28 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    }
LABEL_40:
    uint64_t v28 = 0;
    goto LABEL_63;
  }
  int v9 = v8;
  uint64_t v10 = [[_CopyfileCallbackCtx alloc] initWithPath:a1 error:a4];
  if (!v10) {
    goto LABEL_40;
  }
  int v11 = fts_read(v9);
  if (v11)
  {
    int v12 = v11;
    do
    {
      unsigned int fts_info = v12->fts_info;
      if (fts_info > 0xD) {
        goto LABEL_13;
      }
      uint64_t fts_statp = (uint64_t)v12->fts_statp;
      if (((1 << fts_info) & 0x3048) == 0)
      {
        if (fts_info != 8)
        {
          if (((1 << fts_info) & 0x490) != 0) {
            goto LABEL_41;
          }
          goto LABEL_13;
        }
        if (!strncmp(v12->fts_name, "._", 2uLL)) {
          goto LABEL_13;
        }
        v50 = a3;
        if ((*(_WORD *)(fts_statp + 4) & 0xF000) == 0x8000 && *(unsigned __int16 *)(fts_statp + 6) >= 2u)
        {
          long long v49 = v10;
          fts_parent = v12->fts_parent;
          uint64_t v52 = 0;
          memset(&v51, 0, sizeof(v51));
          int v17 = fts_parent->fts_statp;
          uint64_t fts_pathlen = fts_parent->fts_pathlen;
          if (snprintf((char *)&__str, 0x400uLL, "%s_XXXXXX", v12->fts_path) >= 0x400)
          {
            int v33 = +[NSString stringWithFormat:@"temporary path \"%s_XXXXXX\" too long", v12->fts_path];
            v34 = sub_100002D4C();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
              sub_1000286C0((uint64_t)v33, v34, v35, v36, v37, v38, v39, v40);
            }

            long long v41 = v49;
            if (a4)
            {
              __int16 v42 = sub_100003600(104, v33, 0);
              goto LABEL_50;
            }
LABEL_51:

            stat v21 = v41;
            goto LABEL_58;
          }
          if (!v12->fts_level)
          {
            uint64_t v19 = v12->fts_pathlen;
            while (v19 >= 2)
            {
              if (v12->fts_path[--v19] == 47) {
                goto LABEL_29;
              }
            }
            LOWORD(v19) = 0;
LABEL_29:
            uint64_t fts_pathlen = (unsigned __int16)v19;
            __str.__pn_.__r_.__value_.__s.__data_[(unsigned __int16)v19] = 0;
            if (stat((const char *)&__str, &v51))
            {
              stat v21 = v49;
              if (!a4 || *a4) {
                goto LABEL_58;
              }
              long long v41 = v49;
              int v33 = +[NSString stringWithFormat:@"stat(%s) failed", &__str];
              int v47 = *__error();
              long long v48 = sub_100002D4C();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
                sub_100026B74();
              }

              __int16 v42 = sub_100011F0C(v47, v33);
LABEL_50:
              *a4 = v42;
              goto LABEL_51;
            }
            __str.__pn_.__r_.__value_.__s.__data_[fts_pathlen] = 47;
            int v17 = &v51;
          }
          __str.__pn_.__r_.__value_.__s.__data_[fts_pathlen] = 0;
          int v20 = sub_10000CE88((char *)&__str, (uint64_t)v17, (uint64_t)&v52, a4);
          stat v21 = v49;
          if (!v20) {
            goto LABEL_58;
          }
          __str.__pn_.__r_.__value_.__s.__data_[fts_pathlen] = 47;
          if (!sub_10000EACC(v12->fts_path, (const char *)&__str, 16777231, v49, a4)) {
            goto LABEL_57;
          }
          rename(&__str, (const std::__fs::filesystem::path *)v12->fts_path, v22);
          if (v23)
          {
            uint64_t v43 = +[NSString stringWithFormat:@"rename(%s, %s) failed", &__str, v12->fts_path];
            int v44 = *__error();
            uint64_t v45 = sub_100002D4C();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
              sub_100026B74();
            }

            if (a4)
            {
              sub_100011F0C(v44, v43);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }

LABEL_57:
            unlink((const char *)&__str);
            __str.__pn_.__r_.__value_.__s.__data_[fts_pathlen] = 0;
            sub_10000D048((char *)&__str, (unsigned __int16 *)&v52);
            stat v21 = v49;
LABEL_58:

            a3 = v50;
            break;
          }
          __str.__pn_.__r_.__value_.__s.__data_[fts_pathlen] = 0;
          sub_10000D048((char *)&__str, (unsigned __int16 *)&v52);
        }
        [(_CopyfileCallbackCtx *)v10 setGenerationSize:(char *)[(_CopyfileCallbackCtx *)v10 generationSize] + *(void *)(fts_statp + 96)];
        id v24 = [(_CopyfileCallbackCtx *)v10 generationSize];
        dispatch_time_t v25 = [(_CopyfileCallbackCtx *)v10 progress];
        [v25 setCompletedUnitCount:v24];

        a3 = v50;
      }
      if (!sub_10000EFF4(v12->fts_path, fts_statp, a2, a4)) {
        break;
      }
      if (fts_info <= 0xA && ((1 << fts_info) & 0x490) != 0)
      {
LABEL_41:
        int fts_errno = v12->fts_errno;
        *__error() = fts_errno;
        BOOL v30 = +[NSString stringWithFormat:@"fts_read() failed for path '%s'\n", v12->fts_path];
        int v31 = *__error();
        int v32 = sub_100002D4C();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          sub_100026B74();
        }

        if (a4)
        {
          sub_100011F0C(v31, v30);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

        uint64_t v28 = 0;
        goto LABEL_62;
      }
LABEL_13:
      int v12 = fts_read(v9);
    }
    while (v12);
  }
  if (a3) {
    *a3 = [(_CopyfileCallbackCtx *)v10 generationSize];
  }
  uint64_t v28 = 1;
LABEL_62:
  fts_close(v9);
LABEL_63:

  return v28;
}

uint64_t sub_10000EACC(const char *a1, const char *a2, int a3, void *a4, void *a5)
{
  int v9 = a4;
  [v9 doUnarchive];
  int v10 = sub_10000DEE8(a1, (uint64_t)a2);
  if (!v10)
  {
    int v12 = a3 & 0x100000 | 0x8000;
    if (v12 == 1081344) {
      copyfile_flags_t v13 = a3 & 0xFEEF7FFF | 0x8000;
    }
    else {
      copyfile_flags_t v13 = a3 & 0xFEFF7FFF | 0x8000;
    }
    uint64_t v14 = copyfile_state_alloc();
    copyfile_state_set(v14, 6u, sub_10000F754);
    copyfile_state_set(v14, 7u, v9);
    int v15 = copyfile(a1, a2, v14, v13);
    uint64_t v11 = v15 == 0;
    copyfile_state_free(v14);
    if (v12 == 1081344 && !v15)
    {
      uint64_t v11 = 1;
      removefile(a1, 0, 1u);
      goto LABEL_22;
    }
    goto LABEL_15;
  }
  if (clonefile(a1, a2, 1u)) {
    goto LABEL_3;
  }
  if ((a3 & 0x100000) != 0) {
    removefile(a1, 0, 1u);
  }
  if ([v9 doArchive])
  {
    uint64_t v11 = sub_10000E4DC(a2, 0, v9 + 24, a5);
LABEL_15:
    if (!a5) {
      goto LABEL_22;
    }
    goto LABEL_16;
  }
  if (![v9 doUnarchive])
  {
    uint64_t v11 = 1;
    goto LABEL_22;
  }
  v35[0] = (char *)a2;
  v35[1] = 0;
  uint64_t v22 = fts_open(v35, 84, 0);
  if (!v22)
  {
    int v32 = +[NSString stringWithFormat:@"fts_open(\"%s\") failed", a2];
    int v33 = *__error();
    v34 = sub_100002D4C();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      sub_100026B74();
    }

    if (a5)
    {
      sub_100011F0C(v33, v32);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_3:
    uint64_t v11 = 0;
    if (!a5) {
      goto LABEL_22;
    }
    goto LABEL_16;
  }
  int v23 = v22;
  id v24 = fts_read(v22);
  uint64_t v11 = 1;
  if (!v24) {
    goto LABEL_50;
  }
  dispatch_time_t v25 = v24;
  while (1)
  {
    unsigned int fts_info = v25->fts_info;
    if (fts_info > 0xD) {
      goto LABEL_35;
    }
    if (((1 << fts_info) & 0x3148) != 0) {
      break;
    }
    if (((1 << fts_info) & 0x490) != 0) {
      goto LABEL_38;
    }
LABEL_35:
    dispatch_time_t v25 = fts_read(v23);
    if (!v25)
    {
LABEL_49:
      uint64_t v11 = 1;
      goto LABEL_50;
    }
  }
  if (!sub_10000F980(v25->fts_path, v25->fts_statp, a5)) {
    goto LABEL_49;
  }
  if (fts_info > 0xA || ((1 << fts_info) & 0x490) == 0) {
    goto LABEL_35;
  }
LABEL_38:
  int fts_errno = v25->fts_errno;
  *__error() = fts_errno;
  int v29 = +[NSString stringWithFormat:@"fts_read() failed for path '%s'\n", v25->fts_path];
  int v30 = *__error();
  int v31 = sub_100002D4C();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    sub_100026B74();
  }

  if (a5)
  {
    sub_100011F0C(v30, v29);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v11 = 0;
LABEL_50:
  fts_close(v23);
  if (a5)
  {
LABEL_16:
    if ((v11 & 1) == 0)
    {
      int v16 = "copyfile";
      if (v10) {
        int v16 = "clonefile";
      }
      int v17 = +[NSString stringWithFormat:@"%s(%s, %s) failed", v16, a1, a2];
      int v18 = *__error();
      uint64_t v19 = sub_100002D4C();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_100026B74();
      }

      int v20 = sub_100011F0C(v18, v17);

      uint64_t v11 = 0;
      *a5 = v20;
    }
  }
LABEL_22:

  return v11;
}

uint64_t sub_10000EED8(const char *a1, char *a2, void *a3)
{
  ssize_t v6 = [[_CopyfileCallbackCtx alloc] initWithPath:a1 error:a3];
  size_t v7 = v6;
  if (v6)
  {
    [(_CopyfileCallbackCtx *)v6 setDoUnarchive:1];
    id v14 = 0;
    uint64_t v8 = sub_10000EACC(a1, a2, 17694735, v7, &v14);
    id v9 = v14;
    int v10 = v9;
    if ((v8 & 1) == 0 && [v9 code] == (id)17)
    {
      uint64_t v11 = [v10 domain];
      unsigned int v12 = [v11 isEqualToString:NSPOSIXErrorDomain];

      if (v12) {
        sub_10000C53C(a2, 0, 0, 0);
      }
    }
    if (a3) {
      *a3 = v10;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t sub_10000EFF4(char *a1, uint64_t a2, int a3, void *a4)
{
  __int16 v4 = *(_WORD *)(a2 + 4);
  if ((v4 & 0xF000) == 0xA000) {
    return 1;
  }
  int v10 = *(_DWORD *)(a2 + 116);
  if ((v10 & 0x46) != 0)
  {
    if (chflags(a1, v10 & 0xFFFFFFB9))
    {
      uint64_t v11 = +[NSString stringWithFormat:@"failed to make path \"%s\" writable", a1];
      int v12 = *__error();
      copyfile_flags_t v13 = sub_100002D4C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    __int16 v4 = *(_WORD *)(a2 + 4);
  }
  if ((v4 & 0x80) == 0)
  {
    if (chmod(a1, v4 | 0x80))
    {
      uint64_t v11 = +[NSString stringWithFormat:@"failed to make path \"%s\" writable", a1];
      int v12 = *__error();
      copyfile_flags_t v13 = sub_100002D4C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
LABEL_11:
      }
        sub_100026B74();
LABEL_12:

      if (a4)
      {
        sub_100011F0C(v12, v11);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      return 0;
    }
    __int16 v4 = *(_WORD *)(a2 + 4);
  }
  if ((v4 & 0xF000) == 0x4000) {
    int v14 = open(a1, 256);
  }
  else {
    int v14 = open(a1, 258);
  }
  int v15 = v14;
  if ((v14 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)(a2 + 116) & 0x20) != 0 && (sub_10000C2D0(v14, 102, 0) & 0x80000000) != 0)
    {
      int v18 = +[NSString stringWithFormat:@"failed make path \"%s\" uncompressed", a1];
      int v19 = *__error();
      int v20 = sub_100002D4C();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_100026B74();
      }
      goto LABEL_45;
    }
    if ((fgetxattr(v15, "com.apple.genstore.orig_perms_v1", 0, 0, 0, 32) & 0x8000000000000000) == 0) {
      goto LABEL_23;
    }
    int v24 = (*(unsigned __int8 *)(a2 + 4) >> 1) & 8 | (*(unsigned __int8 *)(a2 + 4) >> 5) & 4 | (16
                                                                                             * ((*(unsigned __int8 *)(a2 + 4) >> 1) & 1));
    char value = (*(unsigned char *)(a2 + 4) >> 1) & 8 | (*(unsigned char *)(a2 + 4) >> 5) & 4 | (16 * ((*(unsigned char *)(a2 + 4) & 2) != 0));
    unsigned int v25 = *(_DWORD *)(a2 + 116);
    if ((v25 & 6) != 0) {
      char value = (v25 >> 1) & 3 | v24;
    }
    if (fsetxattr(v15, "com.apple.genstore.orig_perms_v1", &value, 1uLL, 0, 0))
    {
      int v18 = +[NSString stringWithFormat:@"failed to save original permissions for \"%s\"", a1];
      int v19 = *__error();
      int v20 = sub_100002D4C();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_45;
      }
    }
    else
    {
LABEL_23:
      __int16 v16 = *(_WORD *)(a2 + 4);
      if ((v16 & 0xF000) == 0x4000) {
        __int16 v17 = 365;
      }
      else {
        __int16 v17 = 292;
      }
      if (!a3) {
        __int16 v17 = 0;
      }
      if (!fchmod(v15, (v16 | v17) & 0xFF6D))
      {
        uint64_t v5 = 1;
LABEL_48:
        close(v15);
        return v5;
      }
      int v18 = +[NSString stringWithFormat:@"failed to set archived permissions for \"%s\"", a1];
      int v19 = *__error();
      int v20 = sub_100002D4C();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
LABEL_45:

        if (a4)
        {
          sub_100011F0C(v19, v18);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

        uint64_t v5 = 0;
        goto LABEL_48;
      }
    }
    sub_100026B74();
    goto LABEL_45;
  }
  stat v21 = +[NSString stringWithFormat:@"failed to open generation item \"%s\"", a1];
  int v22 = *__error();
  int v23 = sub_100002D4C();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_100026B74();
  }

  if (a4)
  {
    sub_100011F0C(v22, v21);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v5 = 0;
  if (v15 != -1) {
    goto LABEL_48;
  }
  return v5;
}

uint64_t sub_10000F41C(const char *a1, int a2, gid_t a3)
{
  int v5 = open(a1, 32772);
  if (v5 < 0)
  {
    int v10 = sub_100002D4C();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u)) {
      sub_10002873C();
    }

    return 0xFFFFFFFFLL;
  }
  else
  {
    int v6 = v5;
    uint64_t v7 = sub_10000C2D0(v5, a2, a3);
    int v8 = *__error();
    close(v6);
    *__error() = v8;
    return v7;
  }
}

uint64_t sub_10000F4BC(const char *a1, int a2, gid_t a3)
{
  int v5 = open(a1, 2129924);
  if (v5 < 0)
  {
    int v10 = sub_100002D4C();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u)) {
      sub_10002873C();
    }

    return 0xFFFFFFFFLL;
  }
  else
  {
    int v6 = v5;
    uint64_t v7 = sub_10000C2D0(v5, a2, a3);
    int v8 = *__error();
    close(v6);
    *__error() = v8;
    return v7;
  }
}

BOOL sub_10000F6FC(std::__fs::filesystem::path *__p, std::error_code *a2)
{
  if (off_10004CF38) {
    off_10004CF38(__p);
  }
  return !remove(__p, a2) || *__error() == 2;
}

uint64_t sub_10000F754(int a1, int a2, _copyfile_state *a3, char *a4, char *a5, void *a6)
{
  id v11 = a6;
  uint64_t dst = 0;
  int v12 = [v11 progress];

  if (v12)
  {
    copyfile_flags_t v13 = [v11 progress];
    unsigned int v14 = [v13 isCancelled];

    if (v14)
    {
      *__error() = 89;
      uint64_t v15 = 2;
      goto LABEL_26;
    }
    if (a1 == 4 && a2 == 4 && !copyfile_state_get(a3, 8u, &dst))
    {
      __int16 v16 = (char *)[v11 generationSize];
      __int16 v17 = &v16[dst];
      int v18 = [v11 progress];
      [v18 setCompletedUnitCount:v17];
    }
  }
  uint64_t v15 = 2;
  if (a1 && a2 != 3)
  {
    if (a1 == 1 && a2 == 1)
    {
      int v19 = strrchr(a4, 47);
      if (v19) {
        int v20 = v19 + 1;
      }
      else {
        int v20 = a4;
      }
      uint64_t v15 = strncmp(v20, "._", 2uLL) == 0;
      goto LABEL_26;
    }
    if (a2 != 2 || (a1 | 2) != 3)
    {
LABEL_25:
      uint64_t v15 = 0;
      goto LABEL_26;
    }
    memset(&v25, 0, sizeof(v25));
    if (!lstat(a5, &v25)
      && (![v11 doArchive] || sub_10000EFF4(a5, (uint64_t)&v25, 0, 0))
      && (![v11 doUnarchive] || sub_10000F980(a5, &v25, 0)))
    {
      sub_10000D17C(a4, a5);
      if ((v25.st_mode & 0xF000) != 0x4000)
      {
        stat v21 = (char *)[v11 generationSize];
        [v11 setGenerationSize:&v21[v25.st_size]];
        id v22 = [v11 generationSize];
        int v23 = [v11 progress];
        [v23 setCompletedUnitCount:v22];
      }
      goto LABEL_25;
    }
  }
LABEL_26:

  return v15;
}

uint64_t sub_10000F980(char *a1, stat *a2, void *a3)
{
  __int16 v4 = a2;
  memset(&v16, 0, sizeof(v16));
  if (a2 || (__int16 v4 = &v16, !lstat(a1, &v16)))
  {
    mode_t st_mode = v4->st_mode;
    if ((st_mode & 0xF000) == 0xA000) {
      return 1;
    }
    unsigned __int8 value = 0;
    ssize_t v8 = getxattr(a1, "com.apple.genstore.orig_perms_v1", &value, 1uLL, 0, 0);
    if (v8 == 1)
    {
      gid_t v9 = (2 * value) & 6;
      int v10 = (2 * value) & 0x10 | (32 * value) & 0x92 | (value >> 3) & 2;
    }
    else
    {
      if (*__error() != 93)
      {
        id v11 = +[NSString stringWithFormat:@"Failed to retrieve original perms from xattr on item \"%s\"", a1];
        int v12 = *__error();
        copyfile_flags_t v13 = sub_100002D4C();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_27;
        }
        goto LABEL_28;
      }
      gid_t v9 = 0;
      int v10 = 128;
    }
    if ((v4->st_flags & 2) != 0 && sub_10000F41C(a1, 2, 0))
    {
      id v11 = +[NSString stringWithFormat:@"Failed to temporarily unset UF_IMMUTABLE for \"%s\"", a1];
      int v12 = *__error();
      copyfile_flags_t v13 = sub_100002D4C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_27;
      }
    }
    else
    {
      mode_t v14 = v4->st_mode;
      if ((v14 & 0x80) == 0)
      {
        if (chmod(a1, v14 | 0x80))
        {
          id v11 = +[NSString stringWithFormat:@"Failed to temporarily make \"%s\" writable", a1];
          int v12 = *__error();
          copyfile_flags_t v13 = sub_100002D4C();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_27;
          }
          goto LABEL_28;
        }
        mode_t v14 = v4->st_mode;
      }
      if ((v14 & 0xF000) == 0x4000) {
        removexattr(a1, "com.apple.genstore.orig_mtime", 0);
      }
      removexattr(a1, "com.apple.genstore.origdisplayname", 0);
      removexattr(a1, "com.apple.genstore.info", 0);
      removexattr(a1, "com.apple.genstore.gen_options", 0);
      if (v8 == 1) {
        removexattr(a1, "com.apple.genstore.orig_perms_v1", 0);
      }
      if (!chmod(a1, st_mode & 0xFFF | v10))
      {
        if (!sub_10000F41C(a1, 2, v9) || *__error() == 45) {
          return 1;
        }
        id v11 = +[NSString stringWithFormat:@"chflags(%s) failed", a1];
        int v12 = *__error();
        copyfile_flags_t v13 = sub_100002D4C();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
      id v11 = +[NSString stringWithFormat:@"chmod(%s, %04o) failed", a1, st_mode & 0xFFF | v10];
      int v12 = *__error();
      copyfile_flags_t v13 = sub_100002D4C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
LABEL_27:
      }
        sub_100026B74();
    }
LABEL_28:

    if (a3)
    {
      sub_100011F0C(v12, v11);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return 0;
}

void sub_10000FDE0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sub_10000FE00(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, (os_log_type_t)0x90u, a4, &a9, 0x28u);
}

void sub_100010138(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = sub_100002D4C();
  BOOL v11 = os_log_type_enabled(v10, (os_log_type_t)0x90u);
  if (v8)
  {
    if (v11)
    {
      int v14 = 138412802;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v10, (os_log_type_t)0x90u, "[ERROR] Sqlite request %@ failed on %@ with error [%@]", (uint8_t *)&v14, 0x20u);
    }
  }
  else if (v11)
  {
    sub_1000287CC();
  }

  id v12 = sub_100010294(v9);
  unsigned int v13 = [v9 code];
  if (v13 <= 0x1A && ((1 << v13) & 0x5000800) != 0) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

id sub_100010294(void *a1)
{
  id v1 = a1;
  ssize_t v2 = [v1 userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:NSUnderlyingErrorKey];

  int v4 = [v1 code];
  if (v4 <= 10)
  {
    if (!v4)
    {
      unsigned int v13 = 0;
      goto LABEL_22;
    }
    if (v4 == 10)
    {
      uint64_t v10 = [v3 domain];
      unsigned int v11 = [v10 isEqualToString:NSPOSIXErrorDomain];

      if (v11) {
        int v12 = [v3 code];
      }
      else {
        int v12 = 10;
      }
      id v17 = [v1 sqliteStatement];
      int v5 = +[NSString stringWithFormat:@"Database operation failed: %@", v17];

      __int16 v18 = sub_100002D4C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_1000288AC((int)v5, v12);
      }

      uint64_t v16 = sub_100011F0C(v12, v5);
      goto LABEL_21;
    }
    goto LABEL_13;
  }
  if (v4 != 11 && v4 != 24 && v4 != 26)
  {
LABEL_13:
    int v14 = [v1 sqliteStatement];
    int v5 = +[NSString stringWithFormat:@"Database operation failed: %@", v14];

    id v15 = sub_100002D4C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_100028834((uint64_t)v5, v15);
    }

    int v7 = 101;
    id v8 = v5;
    id v9 = v3;
    goto LABEL_16;
  }
  int v5 = +[NSString stringWithFormat:@"Database is corrupted"];
  int v6 = sub_100002D4C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100028938();
  }

  int v7 = 113;
  id v8 = v5;
  id v9 = 0;
LABEL_16:
  uint64_t v16 = sub_100003600(v7, v8, v9);
LABEL_21:
  unsigned int v13 = (void *)v16;

LABEL_22:
  return v13;
}

id sub_1000105A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setUserVersion:5];
  if ([v3 execute:@"CREATE TABLE IF NOT EXISTS files (file_row_id INTEGER PRIMARY KEY ASC,file_inode INTEGER,file_last_seen INTEGER NOT NULL DEFAULT 0,file_status INTEGER NOT NULL DEFAULT 1,file_document_id INTEGER,UNIQUE(file_document_id))"]&& objc_msgSend(v3, "execute:", @"CREATE INDEX IF NOT EXISTS files_status_idx ON files (file_status)")&& objc_msgSend(v3, "execute:", @"CREATE INDEX IF NOT EXISTS files_inode_idx ON files (file_inode)")&& objc_msgSend(v3, "execute:", @"CREATE TABLE IF NOT EXISTS generations (generation_id INTEGER PRIMARY KEY ASC,generation_storage_id INTEGER NOT NULL,generation_name TEXT NOT NULL,generation_client_id TEXT NOT NULL,generation_path TEXT UNIQUE,generation_options INTEGER NOT NULL DEFAULT 1,generation_status INTEGER NOT NULL DEFAULT 1,generation_add_time INTEGER NOT NULL DEFAULT 0,generation_size INTEGER NOT NULL DEFAULT 0,generation_prunable INTEGER NOT NULL DEFAULT 0,generation_conflict_resolved BOOL NOT NULL DEFAULT 0)")&& objc_msgSend(v3, "execute:", @"CREATE INDEX IF NOT EXISTS generations_options_idx ON generations (generation_options)")
    && [v3 execute:@"CREATE INDEX IF NOT EXISTS generations_status_idx ON generations (generation_status)"]&& objc_msgSend(v3, "execute:", @"CREATE INDEX IF NOT EXISTS generations_addtime_idx ON generations (generation_add_time desc)")&& objc_msgSend(v3, "execute:", @"CREATE UNIQUE INDEX IF NOT EXISTS generations_storage_id_name_client_id  ON generations (generation_storage_id, generation_name, generation_client_id)")&& objc_msgSend(v3, "execute:", @"CREATE TABLE IF NOT EXISTS state (v)"))
  {
    id v4 = [v3 execute:@"INSERT INTO state values (NULL)"];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

BOOL sub_1000106BC(id a1, PQLConnection *a2)
{
  ssize_t v2 = a2;
  if ([(PQLConnection *)v2 execute:@"DROP INDEX IF EXISTS storage_status_idx"]
    && [(PQLConnection *)v2 execute:@"DROP INDEX IF EXISTS generations_storage_id_idx"]
    && [(PQLConnection *)v2 execute:@"DROP TABLE IF EXISTS files_new"]
    && -[PQLConnection execute:](v2, "execute:", @"CREATE TABLE IF NOT EXISTS files_new (file_row_id INTEGER PRIMARY KEY ASC,file_name TEXT,file_parent_id INTEGER,file_path TEXT,file_inode INTEGER,file_last_seen INTEGER NOT NULL DEFAULT 0,file_status INTEGER NOT NULL DEFAULT 1,file_storage_id INTEGER NOT NULL)")&& -[PQLConnection execute:](v2, "execute:", @"INSERT INTO files_new (file_name, file_parent_id, file_path,   file_inode, file_last_seen, file_status, file_storage_id) SELECT file_name, file_parent_id, file_path, file_inode,   file_last_seen, file_status, file_storage_id FROM files ORDER BY file_row_id")&& -[PQLConnection execute:](v2, "execute:", @"DROP TABLE files")&& -[PQLConnection execute:](v2, "execute:", @"ALTER TABLE files_new RENAME TO files")&& -[PQLConnection execute:](v2, "execute:", @"CREATE INDEX IF NOT EXISTS files_name_parent_id_idx ON files (file_name, file_parent_id)")&& -[PQLConnection execute:](v2, "execute:", @"CREATE INDEX IF NOT EXISTS file_path_idx ON files (file_path)")&& -[PQLConnection execute:](v2,
                       "execute:",
                       @"CREATE INDEX IF NOT EXISTS files_status_storage_id_idx ON files (file_status, file_storage_id)"))
  {
    unsigned __int8 v3 = [(PQLConnection *)v2 execute:@"PRAGMA user_version = 2"];
  }
  else
  {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

BOOL sub_1000107D8(id a1, PQLConnection *a2)
{
  ssize_t v2 = a2;
  if ([(PQLConnection *)v2 execute:@"DROP TABLE IF EXISTS generations_new"]
    && -[PQLConnection execute:](v2, "execute:", @"CREATE TABLE IF NOT EXISTS generations_new (generation_id INTEGER PRIMARY KEY ASC,generation_storage_id INTEGER NOT NULL,generation_name TEXT NOT NULL,generation_client_id TEXT NOT NULL,generation_path TEXT UNIQUE,generation_options INTEGER NOT NULL DEFAULT 1,generation_status INTEGER NOT NULL DEFAULT 1,generation_add_time INTEGER NOT NULL DEFAULT 0,generation_size INTEGER NOT NULL DEFAULT 0)")&& -[PQLConnection execute:](v2, "execute:", @"INSERT INTO generations_new (generation_id, generation_storage_id,   generation_name, generation_client_id, generation_path,   generation_options, generation_status, generation_add_time) SELECT generation_id, generation_storage_id, generation_name,   generation_client_id, generation_path, generation_options,   generation_status, generation_add_time FROM generations ORDER BY generation_id")&& -[PQLConnection execute:](v2, "execute:", @"DROP TABLE generations")&& -[PQLConnection execute:](v2, "execute:", @"ALTER TABLE generations_new RENAME TO generations")&& -[PQLConnection execute:](v2, "execute:", @"CREATE INDEX IF NOT EXISTS generations_options_idx ON generations (generation_options)")&& -[PQLConnection execute:](v2, "execute:",
                       @"CREATE INDEX IF NOT EXISTS generations_status_idx ON generations (generation_status)")
    && [(PQLConnection *)v2 execute:@"CREATE UNIQUE INDEX IF NOT EXISTS generations_storage_id_name_client_id ON generations (generation_storage_id, generation_name, generation_client_id)"])
  {
    unsigned __int8 v3 = [(PQLConnection *)v2 execute:@"PRAGMA user_version = 3"];
  }
  else
  {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

id sub_10001092C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (sqlite3_exec((sqlite3 *)[*(id *)(a1 + 32) dbHandle], "SELECT generation_prunable FROM generations LIMIT 0", 0, 0, 0))
  {
    id v4 = sub_100002D4C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] upgrade generations to have the generation_prunable column", buf, 2u);
    }

    if (![v3 execute:@"DROP TABLE IF EXISTS generations_new"]
      || ![v3 execute:@"CREATE TABLE generations_new (generation_id INTEGER PRIMARY KEY ASC,generation_storage_id INTEGER NOT NULL,generation_name TEXT NOT NULL,generation_client_id TEXT NOT NULL,generation_path TEXT UNIQUE,generation_options INTEGER NOT NULL DEFAULT 1,generation_status INTEGER NOT NULL DEFAULT 1,generation_add_time INTEGER NOT NULL DEFAULT 0,generation_size INTEGER NOT NULL DEFAULT 0,generation_prunable INTEGER NOT NULL DEFAULT 0)"]|| !objc_msgSend(v3, "execute:", @"INSERT OR REPLACE INTO generations_new (generation_id, generation_storage_id, generation_name, generation_client_id, generation_path, generation_options, generation_status, generation_add_time, generation_size,) SELECT generation_id, generation_storage_id, generation_name, generation_client_id, generation_path, generation_options, generation_status, generation_add_time, generation_size,  FROM generations ORDER BY generation_id")|| !objc_msgSend(v3, "execute:", @"DROP TABLE generations")|| !objc_msgSend(v3, "execute:", @"ALTER TABLE generations_new RENAME TO generations"))
    {
      goto LABEL_21;
    }
  }
  if (!sqlite3_exec((sqlite3 *)[*(id *)(a1 + 32) dbHandle], "CREATE TABLE state (v)", 0, 0, 0))
  {
    int v5 = sub_100002D4C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] create the state table", v8, 2u);
    }

    if (![v3 execute:@"INSERT INTO state values (NULL)"]) {
      goto LABEL_21;
    }
  }
  if ([v3 execute:@"CREATE INDEX IF NOT EXISTS files_inode_idx ON files (file_inode)"]&& objc_msgSend(v3, "execute:", @"CREATE INDEX IF NOT EXISTS generations_options_idx ON generations (generation_options)")&& objc_msgSend(v3, "execute:", @"CREATE INDEX IF NOT EXISTS generations_status_idx ON generations (generation_status)")&& objc_msgSend(v3, "execute:", @"CREATE INDEX IF NOT EXISTS generations_addtime_idx ON generations (generation_add_time desc)")&& objc_msgSend(v3, "execute:", @"CREATE UNIQUE INDEX IF NOT EXISTS generations_storage_id_name_client_id ON generations (generation_storage_id, generation_name, generation_client_id)")
    && [v3 execute:@"DROP INDEX IF EXISTS files_status_storage_id_idx"]
    && [v3 execute:@"CREATE INDEX IF NOT EXISTS files_status_idx ON files (file_status)"])
  {
    id v6 = [v3 execute:@"PRAGMA user_version = 4"];
  }
  else
  {
LABEL_21:
    id v6 = 0;
  }

  return v6;
}

BOOL sub_100010B6C(id a1, PQLConnection *a2)
{
  ssize_t v2 = a2;
  id v3 = sub_100002D4C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] upgrade generations table to have the generation_conflict_resolved column", v6, 2u);
  }

  if ([(PQLConnection *)v2 execute:@"DROP TABLE IF EXISTS generations_new"]
    && [(PQLConnection *)v2 execute:@"CREATE TABLE generations_new (generation_id INTEGER PRIMARY KEY ASC,generation_storage_id INTEGER NOT NULL,generation_name TEXT NOT NULL,generation_client_id TEXT NOT NULL,generation_path TEXT UNIQUE,generation_options INTEGER NOT NULL DEFAULT 1,generation_status INTEGER NOT NULL DEFAULT 1,generation_add_time INTEGER NOT NULL DEFAULT 0,generation_size INTEGER NOT NULL DEFAULT 0,generation_prunable INTEGER NOT NULL DEFAULT 0,generation_conflict_resolved BOOL NOT NULL DEFAULT 0)"]&& [(PQLConnection *)v2 execute:@"INSERT OR REPLACE INTO generations_new (generation_id, generation_storage_id, generation_name, generation_client_id, generation_path, generation_options, generation_status, generation_add_time, generation_size, generation_prunable) SELECT generation_id, generation_storage_id, generation_name, generation_client_id, generation_path, generation_options, generation_status, generation_add_time, generation_size, generation_prunable FROM generations ORDER BY generation_id"]&& [(PQLConnection *)v2 execute:@"DROP TABLE generations"]&& [(PQLConnection *)v2 execute:@"ALTER TABLE generations_new RENAME TO generations"])
  {
    unsigned __int8 v4 = [(PQLConnection *)v2 execute:@"PRAGMA user_version = 5"];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

uint64_t sub_100010E44(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  if (![*(id *)(a1 + 32) execute:@"PRAGMA auto_vacuum = incremental"]
    || ![*v1 execute:@"PRAGMA page_size = 4096"])
  {
    id v2 = 0;
    id v6 = 0;
LABEL_10:
    uint64_t v7 = 0;
    goto LABEL_11;
  }
  id v2 = [*v1 fetchObjectOfClass:objc_opt_class() sql:@"PRAGMA journal_mode = WAL"];
  id v3 = [v2 lowercaseString];
  unsigned __int8 v4 = [v3 isEqualToString:@"wal"];

  if ((v4 & 1) == 0)
  {
    int v5 = sub_100002D4C();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
      sub_1000289B4((uint64_t *)v1, v5);
    }
  }
  id v6 = [*v1 fetchObjectOfClass:objc_opt_class() sql:@"PRAGMA wal_autocheckpoint = 4000"];
  if (([v6 isEqualToNumber:&off_100044208] & 1) == 0)
  {
    id v9 = +[NSError errorWithSqliteCode:2 andMessage:@"cannot set wal_autocheckpoint to 4000"];
    [*v1 setLastError:v9];

    goto LABEL_10;
  }
  uint64_t v7 = 1;
LABEL_11:

  return v7;
}

void sub_100011274(id a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  if (a3 != 1) {
    sub_100028AC8();
  }
  int v5 = sqlite3_value_text(*a4);
  BOOL v6 = access((const char *)v5, 0) == 0;
  sqlite3_result_int(a2, v6);
}

void sub_1000112CC(id a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  if (a3 != 1) {
    sub_100028AF4();
  }
  int v5 = sqlite3_value_text(*a4);
  if (access((const char *)v5, 0)) {
    BOOL v6 = *__error() == 2;
  }
  else {
    BOOL v6 = 0;
  }
  sqlite3_result_int(a2, v6);
}

void sub_100011338(id a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  int v5 = (const void *)sqlite3_value_int64(*a4);
  pql_sqlite3_value_object();
  uint64_t v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = NSHashGet(v7, v5) == 0;
  sqlite3_result_int(a2, v6);
}

void sub_1000117B8(id a1, PQLConnection *a2, PQLStatement *a3, NSError *a4)
{
  int v5 = a3;
  BOOL v6 = a4;
  uint64_t v7 = sub_100002D4C();
  if (os_log_type_enabled(v7, (os_log_type_t)0x90u)) {
    sub_100028C7C();
  }
}

void sub_1000118F0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, (os_log_type_t)0x90u, a4, (uint8_t *)va, 0x16u);
}

id sub_100011DA8(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    v18[0] = kCFErrorDescriptionKey;
    v18[1] = kCFErrorUnderlyingErrorKey;
    v19[0] = a2;
    v19[1] = a3;
    id v6 = a3;
    id v7 = a2;
    id v8 = (void **)v19;
    id v9 = (CFStringRef *)v18;
    uint64_t v10 = 2;
  }
  else
  {
    CFStringRef v16 = kCFErrorDescriptionKey;
    id v17 = a2;
    id v11 = 0;
    id v12 = a2;
    id v8 = &v17;
    id v9 = &v16;
    uint64_t v10 = 1;
  }
  unsigned int v13 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v9 count:v10];
  int v14 = +[NSError errorWithDomain:@"GSLibraryErrorDomain" code:a1 userInfo:v13];

  return v14;
}

id sub_100011F0C(int a1, void *a2)
{
  CFStringRef v10 = kCFErrorDescriptionKey;
  id v3 = a2;
  uint64_t v4 = +[NSString gs_stringWithFileSystemRepresentation:strerror(a1)];
  id v11 = v4;
  int v5 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];

  id v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:a1 userInfo:v5];
  if (a1 <= 44)
  {
    int v7 = 106;
    switch(a1)
    {
      case 13:
      case 26:
        goto LABEL_17;
      case 14:
      case 15:
      case 16:
      case 19:
      case 22:
      case 23:
      case 24:
      case 25:
      case 27:
      case 29:
      case 31:
      case 32:
      case 33:
        goto LABEL_19;
      case 17:
        goto LABEL_20;
      case 18:
      case 20:
      case 21:
        goto LABEL_16;
      case 28:
      case 34:
        goto LABEL_13;
      case 30:
        int v7 = 111;
        goto LABEL_20;
      default:
        if (a1 == 1)
        {
LABEL_17:
          int v7 = 108;
          goto LABEL_20;
        }
        if (a1 != 2) {
          goto LABEL_19;
        }
        break;
    }
    goto LABEL_16;
  }
  if (a1 > 68)
  {
    if (a1 == 69)
    {
LABEL_13:
      int v7 = 109;
      goto LABEL_20;
    }
    if (a1 != 102)
    {
      if (a1 == 93)
      {
        int v7 = 112;
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if ((a1 - 62) < 2)
  {
LABEL_16:
    int v7 = 104;
    goto LABEL_20;
  }
  if (a1 == 45)
  {
LABEL_18:
    int v7 = 107;
    goto LABEL_20;
  }
  if (a1 == 66) {
    goto LABEL_16;
  }
LABEL_19:
  int v7 = 101;
LABEL_20:
  id v8 = sub_100003600(v7, v3, v6);

  return v8;
}

void sub_100012190(id a1)
{
  qword_10004CEE0 = objc_alloc_init(GSDaemon);
  _objc_release_x1();
}

id sub_1000123C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void sub_1000125C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1000125E0(uint64_t a1)
{
  if (MKBDeviceUnlockedSinceBoot())
  {
    id v2 = *(NSObject **)(a1 + 32);
    dispatch_semaphore_signal(v2);
  }
  else
  {
    id v3 = sub_100002D4C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] Device is locked - waiting\n", v4, 2u);
    }
  }
}

uint64_t sub_100012678(uint64_t result, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) == a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t sub_1000126A0(uint64_t a1)
{
  uint64_t result = notify_cancel(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

__CFDictionary *__cdecl sub_100012804(id a1, int a2, __CFDictionary *a3)
{
  return 0;
}

__CFDictionary *__cdecl sub_10001280C(id a1, int a2, __CFDictionary *a3)
{
  uint64_t v4 = a3;
  int v5 = sub_100002D4C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(__CFDictionary *)v4 description];
    int v9 = 136315394;
    id v10 = [v6 UTF8String];
    __int16 v11 = 1024;
    int v12 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] Cache delete asked us to purge %s with urgency %d", (uint8_t *)&v9, 0x12u);
  }
  int v7 = (__CFDictionary *)sub_100012904(a2, v4, 0);

  return v7;
}

id sub_100012904(int a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  int v7 = v6;
  if (!v6)
  {
    int v12 = sub_100002D4C();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u)) {
      sub_100028D88((uint64_t)v5, v12);
    }
    goto LABEL_49;
  }
  memset(&v62, 0, sizeof(v62));
  id v8 = v6;
  if (lstat((const char *)[v8 fileSystemRepresentation], &v62) < 0)
  {
    int v12 = sub_100002D4C();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u)) {
      sub_100028E00((uint64_t)v8, v12);
    }
    goto LABEL_49;
  }
  int v9 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  id v10 = (char *)[v9 longLongValue];

  __int16 v11 = +[GSStorageManager existingLibraryForDevice:v62.st_dev];
  if (!v11)
  {
    int v12 = sub_100002D4C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v68) = v62.st_dev;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed locating library for device %d", buf, 8u);
    }
    goto LABEL_49;
  }
  int v12 = v11;
  unsigned int v13 = [v11 libraryRoot];
  uint64_t v14 = [v13 stringByAppendingString:@"-bad-1"];

  uint64_t value = 0;
  id v15 = +[NSFileManager defaultManager];
  id v58 = (id)v14;
  LODWORD(v14) = [v15 fileExistsAtPath:v14];

  if (v14)
  {
    CFStringRef v16 = removefile_state_alloc();
    removefile_state_set(v16, 1u, sub_100013590);
    removefile_state_set(v16, 2u, &value);
    removefile((const char *)[v58 fileSystemRepresentation], v16, 1u);
    removefile_state_free(v16);
    v10 -= value;
    id v17 = sub_100002D4C();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_100028E78(&value, v17);
    }
  }
  if (a3)
  {
    id v57 = [v12 computePurgeableSpace];
    id v52 = [v12 computeNumberOfPruneableStorages];
    id v51 = [v12 computePruneableNumberOfGenerations];
    __int16 v18 = +[NSURL fileURLWithPath:v8];
    id v60 = 0;
    [v18 getResourceValue:&v60 forKey:NSURLVolumeTotalCapacityKey error:0];
    id v19 = v60;
    id v20 = [v19 unsignedLongLongValue];
    if (v20) {
      uint64_t v21 = (uint64_t)v20;
    }
    else {
      uint64_t v21 = -1;
    }
    unint64_t v54 = v21;
    id v59 = 0;
    v56 = v18;
    [v18 getResourceValue:&v59 forKey:NSURLVolumeAvailableCapacityKey error:0];
    id v22 = v59;

    id v49 = [v22 unsignedLongLongValue];
    int v23 = +[GSUserDefaults defaults];
    id v55 = [v23 longLongForKey:@"cachedeletethreshold.mindiskconsumed" min:1 max:0x7FFFFFFFFFFFFFFFLL byDefault:314572800];
    [v23 doubleForKey:@"cachedeletethreshold.diskpercentage.high" min:0.0001 max:1.0 byDefault:0.1];
    double v25 = v24;
    id v53 = [v23 longLongForKey:@"cachedeletethreshold.diskconsumed.high" min:1 max:0x7FFFFFFFFFFFFFFFLL byDefault:0xC80000000];
    [v23 doubleForKey:@"cachedeletereduction.diskpercentage.high" min:0.0 max:1.0 byDefault:0.1];
    double v27 = v26;
    v50 = (char *)[v23 longLongForKey:@"cachedeletereduction.diskconsumed.high" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:0x40000000];
    [v23 doubleForKey:@"cachedeletethreshold.diskpercentage.med" min:0.0001 max:1.0 byDefault:0.05];
    double v29 = v28;
    id v30 = [v23 longLongForKey:@"cachedeletethreshold.diskconsumed.med" min:1 max:0x7FFFFFFFFFFFFFFFLL byDefault:0xC80000000];
    int v31 = [v23 intForKey:@"cachedeletereduction.gensperfile.med" min:0 max:0x7FFFFFFFLL byDefault:10];
    [v23 doubleForKey:@"cachedeletereduction.diskpercentage.med" min:0.0 max:1.0 byDefault:0.1];
    double v33 = v32;
    v34 = (char *)[v23 longLongForKey:@"cachedeletereduction.diskconsumed.med" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:0x40000000];
    if (v57 > v55)
    {
      double v35 = (double)(unint64_t)v57;
      double v36 = (double)(unint64_t)v57 / (double)v54;
      if (v36 > v25 || v57 > v53)
      {
        double v38 = v27 * v35;
        if ((uint64_t)v50 >= (uint64_t)v38) {
          id v10 = (char *)(uint64_t)v38;
        }
        else {
          id v10 = v50;
        }
        a1 = 3;
      }
      else if ((double)(unint64_t)v51 / (double)(unint64_t)v52 > (double)v31 || v36 > v29 || v57 > v30)
      {
        double v41 = v33 * v35;
        if ((uint64_t)v34 >= (uint64_t)v41) {
          id v10 = (char *)(uint64_t)v41;
        }
        else {
          id v10 = v34;
        }
        a1 = 2;
      }
    }
    __int16 v42 = sub_100002D4C();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134219520;
      id v68 = v57;
      __int16 v69 = 2048;
      id v70 = v52;
      __int16 v71 = 2048;
      id v72 = v51;
      __int16 v73 = 2048;
      unint64_t v74 = v54;
      __int16 v75 = 2048;
      id v76 = v49;
      __int16 v77 = 1024;
      int v78 = a1;
      __int16 v79 = 2048;
      v80 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "[DEBUG] period reclaim computed purgeable:%lld files:%lld generationCount:%lld diskCapacity:%lld availible:%lld computedUrgency:%d computedSpaceToReclaim:%lld", buf, 0x44u);
    }
  }
  if ((uint64_t)v10 <= 0)
  {
    v65[1] = @"CACHE_DELETE_AMOUNT";
    v66[0] = v8;
    v65[0] = @"CACHE_DELETE_VOLUME";
    int v44 = +[NSNumber numberWithLongLong:value];
    v66[1] = v44;
    uint64_t v45 = v66;
    long long v46 = v65;
    goto LABEL_47;
  }
  if (a1 < 2)
  {

LABEL_49:
    id v47 = 0;
    goto LABEL_50;
  }
  v64[0] = v8;
  v63[0] = @"CACHE_DELETE_VOLUME";
  v63[1] = @"CACHE_DELETE_AMOUNT";
  uint64_t v43 = (char *)[v12 purgeTryingToReclaimSpace:v10 highUrgency:a1 != 2];
  int v44 = +[NSNumber numberWithLongLong:&v43[value]];
  v64[1] = v44;
  uint64_t v45 = v64;
  long long v46 = v63;
LABEL_47:
  id v47 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v46 count:2];

LABEL_50:
  return v47;
}

__CFDictionary *__cdecl sub_100013014(id a1, int a2, __CFDictionary *a3)
{
  uint64_t v4 = a3;
  id v5 = sub_100002D4C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(__CFDictionary *)v4 description];
    int v9 = 136315394;
    id v10 = [v6 UTF8String];
    __int16 v11 = 1024;
    int v12 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] Cache delete asked us to reclaim %s with urgency %d", (uint8_t *)&v9, 0x12u);
  }
  int v7 = (__CFDictionary *)sub_100012904(a2, v4, 1);

  return v7;
}

id sub_100013360(uint64_t a1)
{
  id v2 = sub_100002D4C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 40);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[NOTICE] Client %d connection was interrupted", (uint8_t *)v5, 8u);
  }

  return [*(id *)(a1 + 32) invalidate];
}

id sub_100013410(uint64_t a1)
{
  id v2 = sub_100002D4C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100028EF4(a1, v2);
  }

  int v3 = [*(id *)(a1 + 32) exportedObject];
  [v3 invalidate];

  return [*(id *)(a1 + 32) setExportedObject:0];
}

uint64_t start(uint64_t a1, char **a2)
{
  if (getuid())
  {
    uint64_t v4 = __stderrp;
    id v5 = basename(*a2);
    fprintf(v4, "%s must be run as root!\n", v5);
    return 1;
  }
  else
  {
    int v7 = +[GSDaemon daemon];
    id v8 = [v7 resume];

    return (uint64_t)v8;
  }
}

uint64_t sub_100013590(int a1, char *a2, void *a3)
{
  memset(&v5, 0, sizeof(v5));
  if (!lstat(a2, &v5)) {
    *a3 += v5.st_size;
  }
  return 0;
}

BOOL sub_1000135F4(uint64_t a1, const char *a2, int a3)
{
  if (!*(_DWORD *)(a1 + 4)) {
    return 1;
  }
  if (a3)
  {
    long long v5 = *(_OWORD *)(a1 + 28);
    v10[0] = *(_OWORD *)(a1 + 12);
    v10[1] = v5;
    if ((int)sandbox_check_by_audit_token() > 0) {
      return 0;
    }
  }
  memset((char *)v10 + 8, 0, 504);
  int v9 = 0;
  *(void *)&v10[0] = 0x20000000010;
  __strlcpy_chk();
  size_t v7 = strlen(a2);
  int v8 = accessx_np((const accessx_descriptor *)v10, v7 + 17, &v9, *(_DWORD *)(a1 + 4));
  return (v8 | v9) == 0;
}

void sub_1000140BC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1000140D8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, (os_log_type_t)0x90u, a4, &a9, 0x22u);
}

id sub_1000140F8(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = [a2 mutableCopy];
  size_t v7 = [v6 objectForKey:@"kGSAdditionNameSpace"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ([v7 validateGSName:0] & 1) == 0)
  {
    __int16 v11 = +[NSString stringWithFormat:@"invalid NameSpace value"];
    int v12 = sub_100002D4C();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
LABEL_10:

      if (a3)
      {
        sub_100003600(105, v11, 0);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

      id v13 = 0;
      goto LABEL_13;
    }
LABEL_9:
    sub_100026CF8();
    goto LABEL_10;
  }
  int v8 = [v6 objectForKey:@"kGSAdditionOnDuplicate"];

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v9 = +[NSString stringWithFormat:@"invalid OnDuplicate value"];
      uint64_t v10 = sub_100002D4C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_28;
      }
      goto LABEL_29;
    }
    if ((unint64_t)[v8 unsignedLongLongValue] >= 3)
    {
      uint64_t v9 = +[NSString stringWithFormat:@"invalid OnDuplicate value"];
      uint64_t v10 = sub_100002D4C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_28;
      }
      goto LABEL_29;
    }
  }
  else
  {
    [v6 setObject:&off_100044220 forKey:@"kGSAdditionOnDuplicate"];
  }
  size_t v7 = [v6 objectForKey:@"kGSAdditionName"];

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ([v7 validateGSName:0] & 1) == 0)
    {
      __int16 v11 = +[NSString stringWithFormat:@"invalid Name value"];
      int v12 = sub_100002D4C();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else
  {
    id v15 = +[NSUUID UUID];
    CFStringRef v16 = [v15 UUIDString];
    id v17 = objc_msgSend(v16, "gs_stringByUpdatingPathExtensionWithPathOrURL:", v5);

    [v6 setObject:v17 forKey:@"kGSAdditionName"];
  }
  int v8 = [v6 objectForKey:@"kGSAdditionOptions"];

  if (v8)
  {
    if (((unint64_t)[v8 unsignedLongLongValue] & 0xFFFFFFFFFFFFFFE1) != 1)
    {
      uint64_t v9 = +[NSString stringWithFormat:@"invalid options"];
      uint64_t v10 = sub_100002D4C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
LABEL_28:
      }
        sub_100029360();
LABEL_29:

      if (a3)
      {
        sub_100003600(110, v9, 0);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

      id v13 = 0;
      size_t v7 = v8;
      goto LABEL_13;
    }
  }
  else
  {
    [v6 setObject:&off_100044238 forKey:@"kGSAdditionOptions"];
  }
  size_t v7 = [v6 objectForKey:@"kGSAdditionConflictResolved"];

  if (!v7) {
    [v6 setObject:&__kCFBooleanFalse forKey:@"kGSAdditionConflictResolved"];
  }
  id v13 = v6;
LABEL_13:

  return v13;
}

BOOL sub_1000158FC(uint64_t a1)
{
  memset(&v4, 0, 512);
  if (!fstatfs((int)[*(id *)(a1 + 32) volDirFd], &v4)) {
    return v4.f_bavail * v4.f_bsize < *(void *)(a1 + 40);
  }
  id v2 = sub_100002D4C();
  if (os_log_type_enabled(v2, (os_log_type_t)0x90u)) {
    sub_1000294CC(v2);
  }

  return 0;
}

uint64_t sub_1000159F0(uint64_t a1)
{
  id v2 = sub_100002D4C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100029574();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000167D4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  size_t v7 = [*(id *)(a1 + 32) library];
  int v8 = v7;
  if (v6)
  {
    uint64_t v9 = 0;
  }
  else
  {
    unsigned int v10 = [v7 isIgnoringOwners];
    uint64_t v11 = [v8 libraryRoot];
    int v12 = (void *)v11;
    if (v10) {
      +[NSString stringWithFormat:@"%@/%@/%llx/", v11, @"AllUIDs", a3, v14];
    }
    else {
    uint64_t v9 = +[NSString stringWithFormat:@"%@/%@/%d/%llx/", v11, @"PerUID", *(unsigned int *)(*(void *)(a1 + 40) + 28), a3];
    }
  }
  id v13 = sub_100002D4C();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100029D00();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100016AA0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  size_t v7 = sub_100002D4C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100029E78((uint64_t)v6, a3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100016E18(void *a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = a1;
  id v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v6, "validateGSName:", 0, (void)v9))
        {
          uint64_t v7 = 0;
          goto LABEL_13;
        }
      }
      id v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v7 = 1;
      if (v3) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }
LABEL_13:

  return v7;
}

void sub_100016F50(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    id v9 = 0;
  }
  else
  {
    id v23 = v7;
    id v9 = objc_alloc_init((Class)NSMutableArray);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v10 = *(id *)(a1 + 32);
    id v11 = [v10 countByEnumeratingWithState:&v26 objects:v40 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          CFStringRef v16 = [*(id *)(a1 + 40) library];
          id v17 = [v16 _getAddition:a3 inNameSpace:*(void *)(a1 + 48) named:v15 credentials:*(void *)(a1 + 56) + 24 error:0];

          if (v17) {
            [v9 addObject:v17];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v26 objects:v40 count:16];
      }
      while (v12);
    }

    id v7 = v23;
  }
  __int16 v18 = [*(id *)(a1 + 40) library];
  uint64_t v19 = *(void *)(a1 + 56) + 24;
  id v24 = 0;
  id v25 = 0;
  [v18 extensionsForStorageID:a3 credentials:v19 pubExt:&v25 privExt:&v24];
  id v20 = v25;
  id v21 = v24;

  id v22 = sub_100002D4C();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    int v31 = "-[GSClient getAdditionsInStorage:andNameSpace:named:completionHandler:]_block_invoke";
    __int16 v32 = 2112;
    id v33 = v9;
    __int16 v34 = 2112;
    id v35 = v20;
    __int16 v36 = 2112;
    id v37 = v21;
    __int16 v38 = 2112;
    id v39 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] %s reply(%@, %@, %@, %@)", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_1000177C0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = *(id *)(a1 + 32);
  if (v8)
  {
    id v10 = 0;
  }
  else
  {
    id v11 = [*(id *)(a1 + 40) library];
    id v10 = [v11 _listAdditions:a3 nameSpace:*(void *)(a1 + 48) withOptions:*(void *)(a1 + 72) withoutOptions:*(void *)(a1 + 80) andEnumerationState:*(void *)(a1 + 32) credentials:*(void *)(a1 + 56) + 24];
  }
  id v12 = [v10 count];
  uint64_t v13 = [*(id *)(a1 + 32) objectAtIndexedSubscript:1];
  id v14 = [v13 unsignedIntegerValue];

  if (v12 < v14)
  {

    id v9 = 0;
  }
  uint64_t v15 = [*(id *)(a1 + 40) library];
  uint64_t v16 = *(void *)(a1 + 56) + 24;
  id v20 = 0;
  id v21 = 0;
  [v15 extensionsForStorageID:a3 credentials:v16 pubExt:&v21 privExt:&v20];
  id v17 = v21;
  id v18 = v20;

  uint64_t v19 = sub_100002D4C();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    id v23 = "-[GSClient listAdditionsOfStorage:nameSpace:withOptions:withoutOptions:andEnumerationState:completionHandler:]_block_invoke";
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v17;
    __int16 v28 = 2112;
    id v29 = v18;
    __int16 v30 = 2112;
    id v31 = v9;
    __int16 v32 = 2112;
    id v33 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] %s reply(%@, %@, %@, %@, %@)", buf, 0x3Eu);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_100017EF0(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v9 = a1[4];
    uint64_t v10 = a1[5];
    id v21 = 0;
    id v11 = +[GSGenerationRow generationRow:v7 storageID:a3 name:v9 clientID:v10 error:&v21];
    id v12 = v21;
    uint64_t v13 = *(unsigned int *)(a1[6] + 28);
    id v20 = v12;
    unsigned int v14 = [v11 isAccessibleByUID:v13 error:&v20];
    id v8 = v20;

    if (v14)
    {
      uint64_t v15 = v11[1];
      uint64_t v16 = a1[8];
      id v19 = v8;
      +[GSGenerationRow setGenerationOptions:v7 rowID:v15 options:v16 error:&v19];
      id v17 = v19;

      id v8 = v17;
    }
  }
  id v18 = sub_100002D4C();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_10002A3C4();
  }

  (*(void (**)(void, BOOL, id))(a1[7] + 16))(a1[7], v8 == 0, v8);
}

void sub_100018508(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v23 = 0;
    id v11 = +[GSGenerationRow generationRow:v7 storageID:a3 name:v9 clientID:v10 error:&v23];
    id v12 = v23;
    uint64_t v13 = *(unsigned int *)(*(void *)(a1 + 48) + 28);
    id v22 = v12;
    unsigned int v14 = [v11 isAccessibleByUID:v13 error:&v22];
    id v8 = v22;

    if (v14)
    {
      uint64_t v15 = [*(id *)(a1 + 56) library];
      id v16 = [v11 fullPath:v15];
      id v17 = (char *)[v16 fileSystemRepresentation];

      id v18 = *(void **)(a1 + 64);
      id v21 = v8;
      sub_10000D88C(v17, v18, &v21);
      id v19 = v21;

      id v8 = v19;
    }
  }
  id v20 = sub_100002D4C();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_10002A4C0();
  }

  (*(void (**)(void, BOOL, id))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v8 == 0, v8);
}

void sub_100018A5C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v23 = 0;
    id v11 = +[GSGenerationRow generationRow:v7 storageID:a3 name:v9 clientID:v10 error:&v23];
    id v12 = v23;
    uint64_t v13 = *(unsigned int *)(*(void *)(a1 + 48) + 28);
    id v22 = v12;
    unsigned int v14 = [v11 isAccessibleByUID:v13 error:&v22];
    id v8 = v22;

    if (v14)
    {
      uint64_t v15 = [*(id *)(a1 + 56) library];
      id v16 = [v11 fullPath:v15];
      id v17 = (char *)[v16 fileSystemRepresentation];

      id v18 = *(void **)(a1 + 64);
      id v21 = v8;
      sub_10000DD20(v17, v18, &v21);
      id v19 = v21;

      id v8 = v19;
    }
  }
  id v20 = sub_100002D4C();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_10002A5BC();
  }

  (*(void (**)(void, BOOL, id))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v8 == 0, v8);
}

void sub_100018FB0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = 0;
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) library];
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 64) + 24;
    id v17 = 0;
    uint64_t v10 = [v11 _setAdditionNameSpace:a3 inNameSpace:v12 named:v13 newNameSpace:v14 credentials:v15 error:&v17];
    id v9 = v17;
  }
  id v16 = sub_100002D4C();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_10002A6B8();
  }

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void sub_1000195D4(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) library];
  uint64_t v4 = [v3 _listAdditions:0 nameSpace:*(void *)(a1 + 48) withOptions:*(void *)(a1 + 72) withoutOptions:*(void *)(a1 + 80) andEnumerationState:*(void *)(a1 + 32) credentials:*(void *)(a1 + 56) + 24];

  id v5 = [v4 count];
  id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:1];
  id v7 = [v6 unsignedIntegerValue];

  if (v5 < v7)
  {

    id v2 = 0;
  }
  id v8 = sub_100002D4C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10002A7A8();
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_100019C64(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = 0;
  }
  else
  {
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    BOOL v13 = (*(_WORD *)(a1 + 84) & 0xF000) == 0x4000;
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 56) + 24;
    id v23 = 0;
    uint64_t v10 = [v11 _createAddition:a3 creationInfo:v12 isDir:v13 stagedPath:v14 credentials:v15 error:&v23];
    id v9 = v23;
  }
  id v16 = [*(id *)(a1 + 64) library];
  uint64_t v17 = *(void *)(a1 + 56) + 24;
  id v21 = 0;
  id v22 = 0;
  [v16 extensionsForStorageID:a3 credentials:v17 pubExt:&v22 privExt:&v21];
  id v18 = v22;
  id v19 = v21;

  id v20 = sub_100002D4C();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    id v25 = "-[GSClient createAdditionInStorage:stagedFileDescriptor:creationInfo:completionHandler:]_block_invoke";
    __int16 v26 = 2112;
    id v27 = v10;
    __int16 v28 = 2112;
    id v29 = v18;
    __int16 v30 = 2112;
    id v31 = v19;
    __int16 v32 = 2112;
    id v33 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] %s reply(%@, %@, %@, %@)", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void sub_10001A1B4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = sub_10001A3F8;
  __int16 v32 = sub_10001A408;
  id v33 = 0;
  if (v8)
  {
    id v9 = sub_100002D4C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10002AAA0();
    }
LABEL_11:

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_12;
  }
  uint64_t v10 = *(void **)(a1 + 32);
  if (!v10)
  {
    uint64_t v15 = [*(id *)(a1 + 40) library];
    [v15 _removeAllAdditions:a3 inNameSpace:0 credentials:*(void *)(a1 + 48) + 24];

    id v9 = sub_100002D4C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10002A998(v9, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_11;
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10001A410;
  v23[3] = &unk_100041468;
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  id v24 = v11;
  uint64_t v25 = v12;
  __int16 v26 = &v28;
  uint64_t v27 = a3;
  [v10 enumerateKeysAndObjectsUsingBlock:v23];
  BOOL v13 = sub_100002D4C();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_10002AA24();
  }

  (*(void (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v29[5], 0, v14);
LABEL_12:
  _Block_object_dispose(&v28, 8);
}

void sub_10001A3D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001A3F8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001A408(uint64_t a1)
{
}

void sub_10001A410(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v6;
    id v7 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v7)
    {
      id v8 = v7;
      id v25 = v6;
      id v9 = 0;
      uint64_t v10 = *(void *)v29;
      do
      {
        id v11 = 0;
        uint64_t v12 = v9;
        do
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * (void)v11);
          uint64_t v14 = [*(id *)(a1 + 32) library];
          uint64_t v15 = *(void *)(a1 + 56);
          uint64_t v16 = *(void *)(a1 + 40) + 24;
          id v27 = v12;
          unsigned __int8 v17 = [v14 _removeAddition:v15 inNameSpace:v5 named:v13 credentials:v16 error:&v27];
          id v9 = v27;

          if ((v17 & 1) == 0)
          {
            uint64_t v18 = sub_100002D4C();
            if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v33 = v13;
              __int16 v34 = 2112;
              id v35 = v5;
              __int16 v36 = 2112;
              id v37 = v9;
              _os_log_error_impl((void *)&_mh_execute_header, v18, (os_log_type_t)0x90u, "[ERROR] remove of %@ in %@ ended with %@\n", buf, 0x20u);
            }

            uint64_t v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            if (!v19)
            {
              id v20 = objc_alloc_init((Class)NSMutableDictionary);
              uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
              uint64_t v22 = *(void **)(v21 + 40);
              *(void *)(v21 + 40) = v20;

              uint64_t v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            }
            id v23 = [v19 objectForKeyedSubscript:v5];
            if (!v23)
            {
              id v23 = objc_alloc_init((Class)NSMutableDictionary);
              [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v23 forKeyedSubscript:v5];
            }
            [v23 setObject:v9 forKeyedSubscript:v13];
          }
          id v11 = (char *)v11 + 1;
          uint64_t v12 = v9;
        }
        while (v8 != v11);
        id v8 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v8);

      id v6 = v25;
    }
  }
  else
  {
    id v24 = [*(id *)(a1 + 32) library];
    [v24 _removeAllAdditions:*(void *)(a1 + 56) inNameSpace:v5 credentials:*(void *)(a1 + 40) + 24];
  }
}

void sub_10001AB2C(uint64_t a1, void *a2)
{
  id v27 = a2;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = *(id *)(a1 + 32);
  id v30 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  id v3 = 0;
  if (v30)
  {
    uint64_t v29 = *(void *)v33;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v33 != v29) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v4);
        id v6 = sub_100002D4C();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v37 = v5;
          _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] about to remove %@\n", buf, 0xCu);
        }

        id v7 = [v5 storageID];
        id v8 = [*(id *)(a1 + 40) library];
        id v9 = [v7 longLongValue];
        uint64_t v10 = [v5 nameSpace];
        id v11 = [v5 name];
        uint64_t v12 = *(void *)(a1 + 48) + 24;
        id v31 = 0;
        unsigned __int8 v13 = [v8 _removeAddition:v9 inNameSpace:v10 named:v11 credentials:v12 error:&v31];
        id v14 = v31;

        if ((v13 & 1) == 0)
        {
          uint64_t v15 = sub_100002D4C();
          if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412546;
            id v37 = v5;
            __int16 v38 = 2112;
            id v39 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v15, (os_log_type_t)0x90u, "[ERROR] remove of %@ ended with %@\n", buf, 0x16u);
          }

          if (!v3) {
            id v3 = objc_alloc_init((Class)NSMutableDictionary);
          }
          uint64_t v16 = [v5 nameSpace];
          id v17 = [v3 objectForKeyedSubscript:v16];

          if (!v17)
          {
            id v17 = objc_alloc_init((Class)NSMutableDictionary);
            uint64_t v18 = [v5 nameSpace];
            [v3 setObject:v17 forKeyedSubscript:v18];
          }
          uint64_t v19 = [v5 name];
          [v17 setObject:v14 forKeyedSubscript:v19];
        }
        uint64_t v4 = (char *)v4 + 1;
      }
      while (v30 != v4);
      id v30 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v30);
  }

  id v20 = sub_100002D4C();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_10002AD08((uint64_t)v3, v20, v21, v22, v23, v24, v25, v26);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t sub_10001B7CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
LABEL_14:
    uint64_t v10 = 0;
    goto LABEL_15;
  }
  int v4 = sandbox_check_by_audit_token();
  int v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(unsigned __int8 *)(v6 + 80);
  if (*(unsigned char *)(v6 + 80)) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v4 == 0;
  }
  if (v8)
  {
    BOOL v9 = 0;
  }
  else
  {
    objc_msgSend(v3, "fileSystemRepresentation", 0);
    BOOL v9 = sandbox_check_by_audit_token() == 0;
    int v7 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 80);
  }
  uint64_t v10 = 1;
  if (!v7 && !v9 && v5)
  {
    id v11 = sub_100002D4C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10002B1D0();
    }

    goto LABEL_14;
  }
LABEL_15:

  return v10;
}

void sub_10001BE80(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10001BEC8(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  int v4 = (id *)(*(void *)(a1[7] + 8) + 40);
  id obj = 0;
  unsigned int v5 = [v2 writeData:v3 error:&obj];
  objc_storeStrong(v4, obj);
  if (v5)
  {
    uint64_t v6 = (void *)a1[4];
    id v7 = [v6 offsetInFile];
    BOOL v8 = (id *)(*(void *)(a1[7] + 8) + 40);
    id v10 = 0;
    unsigned __int8 v9 = [v6 truncateAtOffset:v7 error:&v10];
    objc_storeStrong(v8, v10);
  }
  else
  {
    unsigned __int8 v9 = 0;
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v9;
}

void sub_10001BF7C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 offsetInFile];
  int v4 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id obj = 0;
  [v2 truncateAtOffset:v3 error:&obj];
  objc_storeStrong(v4, obj);
}

void sub_10001C478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10001C4B4(uint64_t a1)
{
  id v2 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:*(unsigned int *)(a1 + 48) closeOnDealloc:1];
  id v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id obj = 0;
  uint64_t v4 = [v2 readDataToEndOfFileAndReturnError:&obj];
  objc_storeStrong(v3, obj);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (![*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) length])
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    BOOL v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
}

void sub_10001C990(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v21 = 0;
    uint64_t v11 = +[GSGenerationRow generationRow:v7 storageID:a3 name:v9 clientID:v10 error:&v21];
    id v12 = v21;
    uint64_t v13 = *(unsigned int *)(*(void *)(a1 + 48) + 28);
    id v20 = v12;
    unsigned int v14 = [v11 isAccessibleByUID:v13 error:&v20];
    id v8 = v20;

    if (v14)
    {
      uint64_t v15 = v11[1];
      uint64_t v16 = *(unsigned __int8 *)(a1 + 64);
      id v19 = v8;
      +[GSGenerationRow setGenerationConflictResolved:v7 rowID:v15 conflictResolved:v16 error:&v19];
      id v17 = v19;

      id v8 = v17;
    }
  }
  uint64_t v18 = sub_100002D4C();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_10002BA40();
  }

  (*(void (**)(void, BOOL, id))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v8 == 0, v8);
}

id sub_10001CB30()
{
  if (qword_10004CEF8 != -1) {
    dispatch_once(&qword_10004CEF8, &stru_1000415A0);
  }
  int v0 = (void *)qword_10004CEF0;
  return v0;
}

void sub_10001CB84(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("import-cookie-queue", v3);
  id v2 = (void *)qword_10004CEF0;
  qword_10004CEF0 = (uint64_t)v1;
}

void sub_10001CC74(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void sub_10001CCBC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x1Cu);
}

void sub_10001CCD4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_10001CD24(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

void sub_10001CD3C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x34u);
}

void sub_10001CD58(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

void sub_10001CD74(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_10001CDF0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_10001CE0C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, (os_log_type_t)0x90u, a4, &a9, 0xCu);
}

void sub_10001CE34(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_10001CEA0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x3Eu);
}

void sub_10001CEBC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, (os_log_type_t)0x90u, a4, &a9, 2u);
}

void sub_10001CF04(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, (os_log_type_t)0x90u, a4, &a9, 0x16u);
}

void sub_10001CF24(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x2Au);
}

void sub_10001CF44(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, (os_log_type_t)0x90u, a4, (uint8_t *)va, 0x12u);
}

void sub_10001CFC4(id a1)
{
  qword_10004CF00 = objc_alloc_init(GSSystemResourcesManager);
  _objc_release_x1();
}

void sub_10001D1A4(uint64_t a1)
{
  id v2 = *(unsigned char **)(a1 + 32);
  if (!v2[16])
  {
    [v2 _invalidatePowerManager];
    [*(id *)(a1 + 32) _invalidateLowDiskManager];
    [*(id *)(a1 + 32) _invalidateLowMemory];
    *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
    id v3 = sub_100002D4C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = (id)objc_opt_class();
      id v4 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] [%@] has been invalidated", (uint8_t *)&v5, 0xCu);
    }
  }
}

id sub_10001D454(uint64_t a1, int a2)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = sub_10001D494(a2);
  return [v2 _setPowerLevelWithCoalescing:v3];
}

BOOL sub_10001D494(int a1)
{
  uint64_t state64 = 1;
  notify_get_state(a1, &state64);
  uint64_t v1 = sub_100002D4C();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_10002BAC8(&state64, v1);
  }

  return state64 != 1;
}

id sub_10001D5B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(NSObject **)(v2 + 40);
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  BOOL v6 = sub_10001D494(*(_DWORD *)(v2 + 32));
  return [(id)v2 _setPowerLevel:v6];
}

uint64_t sub_10001D6C8(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 36);
  return result;
}

id sub_10001D894(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPowerLevel:1];
}

id sub_10001DAB4(uint64_t a1)
{
  uint64_t v2 = sub_100002D4C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(unsigned char *)(*(void *)(a1 + 40) + 36)) {
      uint64_t v4 = "good";
    }
    else {
      uint64_t v4 = "bad";
    }
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2080;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "[INFO] Adding Power Observer: %@; power level: %s",
      (uint8_t *)&v6,
      0x16u);
  }

  [*(id *)(*(void *)(a1 + 40) + 24) addObject:*(void *)(a1 + 32)];
  return [*(id *)(a1 + 32) powerLevelChanged:*(unsigned __int8 *)(*(void *)(a1 + 40) + 36)];
}

id sub_10001DC34(uint64_t a1)
{
  uint64_t v2 = sub_100002D4C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "[INFO] Removing Power Observer: %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(*(void *)(a1 + 40) + 24) removeObject:*(void *)(a1 + 32)];
}

void sub_10001DDC0(uint64_t a1)
{
  uint64_t v2 = +[GSUserDefaults defaults];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(void *)(v3 + 72))
  {
    dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)(v3 + 8));
    [v2 doubleForKey:@"system.lowdisk" min:0.001 max:172800.0 byDefault:10.0];
    int64_t v6 = (unint64_t)(v5 * 1000000000.0);
    uint64_t v7 = v4;
    dispatch_time_t v8 = dispatch_time(0, v6);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, v6 / 10);

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001DF2C;
    v14[3] = &unk_100041638;
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v15 = v9;
    uint64_t v16 = v10;
    dispatch_source_set_event_handler(v9, v14);
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 72);
    *(void *)(v11 + 72) = v9;
    uint64_t v13 = v9;

    dispatch_resume(v13);
  }
}

id sub_10001DF2C(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(v2 + 72);
  *(void *)(v2 + 72) = 0;

  dispatch_source_t v4 = *(void **)(a1 + 40);
  return [v4 _processLowDiskNotification:0];
}

id sub_10001E064(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processLowDiskNotification:1];
}

void sub_10001E0FC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = sub_10001E2F4((int32_t)[v5 intValue]);
  unsigned int v8 = [*(id *)(*(void *)(a1 + 32) + 48) containsObject:v5];
  if (*(unsigned char *)(a1 + 40) || (v7 == 0) != v8)
  {
    uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 48);
    if (v7) {
      [v9 removeObject:v5];
    }
    else {
      [v9 addObject:v5];
    }
    id v10 = [v5 intValue];
    uint64_t v11 = sub_100002D4C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = "bad";
      if (!v7) {
        id v12 = "good";
      }
      *(_DWORD *)buf = 67109378;
      int v24 = (int)v10;
      __int16 v25 = 2080;
      uint64_t v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] Disk Space Level on %d becomes %s", buf, 0x12u);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v13 = v6;
    id v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "lowDiskStatusChangedForDevice:hasEnoughSpace:", v10, v7 == 0, (void)v18);
        }
        id v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v15);
    }
  }
}

uint64_t sub_10001E2F4(int32_t a1)
{
  int v3 = 0;
  if (sub_10000CB94(v4, 0x80uLL, a1, 2uLL) < 0)
  {
    uint64_t v2 = sub_100002D4C();
    if (os_log_type_enabled(v2, (os_log_type_t)0x90u)) {
      sub_10002BB68();
    }
  }
  else
  {
    if ((fsctl(v4, 0x40046818uLL, &v3, 0) & 0x80000000) == 0) {
      return v3 & 0x204;
    }
    uint64_t v2 = sub_100002D4C();
    if (os_log_type_enabled(v2, (os_log_type_t)0x90u)) {
      sub_10002BBFC();
    }
  }

  return 0;
}

void sub_10001E498(uint64_t a1)
{
  uint64_t v2 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  int v3 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:v2];
  unsigned int v4 = [*(id *)(*(void *)(a1 + 32) + 48) containsObject:v2];
  if (v3)
  {
    uint64_t v5 = v4 ^ 1;
  }
  else
  {
    id v6 = *(void **)(*(void *)(a1 + 32) + 56);
    int v3 = +[NSHashTable weakObjectsHashTable];
    [v6 setObject:v3 forKeyedSubscript:v2];
    if (sub_10001E2F4(*(_DWORD *)(a1 + 48)))
    {
      [*(id *)(*(void *)(a1 + 32) + 48) addObject:v2];
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = 1;
    }
  }
  int v7 = sub_100002D4C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = *(_DWORD *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = "bad";
    if (v5) {
      id v10 = "good";
    }
    v11[0] = 67109634;
    v11[1] = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    __int16 v14 = 2080;
    id v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[INFO] Adding Disk Space Observer on device %x: %@; disk level: %s",
      (uint8_t *)v11,
      0x1Cu);
  }

  [v3 addObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) lowDiskStatusChangedForDevice:*(unsigned int *)(a1 + 48) hasEnoughSpace:v5];
}

void sub_10001E6F0(uint64_t a1)
{
  uint64_t v2 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  int v3 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:v2];
  if (v3)
  {
    unsigned int v4 = sub_100002D4C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = *(_DWORD *)(a1 + 48);
      uint64_t v6 = *(void *)(a1 + 40);
      v7[0] = 67109378;
      v7[1] = v5;
      __int16 v8 = 2112;
      uint64_t v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[INFO] Removing Disk Space Observer on device %x: %@", (uint8_t *)v7, 0x12u);
    }

    [v3 removeObject:*(void *)(a1 + 40)];
    if (![v3 count])
    {
      [*(id *)(*(void *)(a1 + 32) + 56) removeObjectForKey:v2];
      [*(id *)(*(void *)(a1 + 32) + 48) removeObject:v2];
    }
  }
}

id sub_10001E8F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didReceiveMemoryWarning];
}

void sub_10001E984(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 88));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(v2 + 88);
  *(void *)(v2 + 88) = 0;
}

id sub_10001EB5C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) addObject:*(void *)(a1 + 40)];
}

id sub_10001EC00(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) removeObject:*(void *)(a1 + 40)];
}

void sub_10001ECC8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, (os_log_type_t)0x90u, a4, &a9, 0x18u);
}

void sub_10001EE9C(_Unwind_Exception *exception_object)
{
}

unsigned __int8 *sub_10001EF30(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 **)(a1 + 32);
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (result[89] == (v3 ^ 1))
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    void v4[2] = sub_10001EFBC;
    v4[3] = &unk_1000416C8;
    void v4[4] = result;
    char v5 = v3;
    return (unsigned __int8 *)[result _updateThrottlingProperty:v4];
  }
  return result;
}

uint64_t sub_10001EFBC(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 89) = *(unsigned char *)(result + 40) ^ 1;
  return result;
}

unsigned __int8 *sub_10001F048(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 **)(a1 + 32);
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (result[88] != v3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    void v4[2] = sub_10001F0D0;
    v4[3] = &unk_1000416C8;
    void v4[4] = result;
    char v5 = v3;
    return (unsigned __int8 *)[result _updateThrottlingProperty:v4];
  }
  return result;
}

uint64_t sub_10001F0D0(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 88) = *(unsigned char *)(result + 40);
  return result;
}

void sub_10001F154(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001F1E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001F278(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001F328(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    unsigned int v4 = *(void **)(a1 + 32);
    char v5 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
    uint64_t v6 = [v4 pendingDeleteDocumentTimerForDocID:v5];

    if (v6)
    {
      int v7 = 0;
      uint64_t v8 = 0;
LABEL_4:
      int v9 = 16;
      goto LABEL_6;
    }
    uint64_t v11 = +[GSFileRow fileRow:v3 byDocumentID:*(void *)(a1 + 48)];
    int v7 = (void *)v11;
    if (v11)
    {
      uint64_t v8 = *(void *)(v11 + 16);
      if (!v8)
      {
        [*(id *)(a1 + 32) _actOnDocidDeletion:*(void *)(a1 + 48) row:v11];
        goto LABEL_4;
      }
      int v9 = 0;
    }
    else
    {
      uint64_t v8 = 0;
      int v9 = 2;
    }
  }
  else
  {
    int v7 = 0;
    uint64_t v8 = 0;
    int v9 = 4;
  }
LABEL_6:
  uint64_t v10 = sub_100002D4C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 138413058;
    uint64_t v14 = v12;
    __int16 v15 = 2080;
    uint64_t v16 = "-[GSManager resolveDocId:reply:]_block_invoke";
    __int16 v17 = 2048;
    uint64_t v18 = v8;
    __int16 v19 = 1024;
    int v20 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@:%s:reply(%lld, %d)", (uint8_t *)&v13, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001F7A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001F7BC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001F7CC(uint64_t a1)
{
}

void sub_10001F7D4(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v3 = +[NSNumber numberWithUnsignedLongLong:a1[6]];
  [v2 removePendingDeleteDocumentTimerForDocID:v3];

  uint64_t v4 = *(void *)(a1[5] + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

void sub_10001F848(uint64_t a1)
{
  uint64_t v2 = sub_100002D4C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10002BD24();
  }

  [*(id *)(a1 + 40) _nukeStorageID:*(void *)(a1 + 56)];
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 64)];
  LODWORD(v3) = [v3 removePendingDeleteDocumentTimerForDocID:v4];

  if (v3) {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));
  }
}

void sub_10001FB30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001FBD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(void *)(a1 + 40))
  {
    uint64_t v25 = -1;
    goto LABEL_32;
  }
  unint64_t v4 = 0;
  do
  {
    char v5 = (const char *)(*(void *)(*(void *)(a1 + 48) + 8 * v4) + 6);
    do
      int v6 = *((unsigned __int8 *)v5++ - 6);
    while (v6 == 47);
    if (strncmp(v5 - 7, ".docid/", 7uLL)) {
      goto LABEL_6;
    }
    *(void *)__endptr = v5;
    if ((*v5 - 48) <= 9)
    {
      *__error() = 0;
      strtoll(v5, (char **)__endptr, 10);
      if (*__error()) {
        goto LABEL_6;
      }
      char v5 = (const char *)(*(void *)__endptr + 1);
      if (**(unsigned char **)__endptr != 47) {
        goto LABEL_6;
      }
    }
    if (strncmp(v5, "changed/", 8uLL)) {
      goto LABEL_6;
    }
    *(void *)__endptr = v5 + 8;
    *__error() = 0;
    uint64_t v9 = strtoll(v5 + 8, (char **)__endptr, 10);
    if (*__error()) {
      goto LABEL_6;
    }
    uint64_t v10 = *(void *)__endptr;
    if (strncmp(*(const char **)__endptr, "/src=", 5uLL)) {
      goto LABEL_6;
    }
    uint64_t v11 = (const char *)(v10 + 5);
    *(void *)__endptr = v11;
    *__error() = 0;
    uint64_t v12 = strtoll(v11, (char **)__endptr, 10);
    if (*__error()
      || (uint64_t v13 = *(void *)__endptr, strncmp(*(const char **)__endptr, ",dst=", 5uLL))
      || (uint64_t v14 = (const char *)(v13 + 5),
          *(void *)__endptr = v14,
          *__error() = 0,
          uint64_t v15 = strtoll(v14, (char **)__endptr, 10),
          *__error())
      || **(unsigned char **)__endptr)
    {
LABEL_6:
      if (!strcmp(*(const char **)(*(void *)(a1 + 48) + 8 * v4), ".docid")) {
        goto LABEL_10;
      }
      int v7 = sub_100002D4C();
      if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
      {
        uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8 * v4);
        int v17 = *(_DWORD *)(*(void *)(a1 + 56) + 4 * v4);
        int v18 = *(_DWORD *)(*(void *)(a1 + 32) + 144);
        uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8 * v4);
        *(_DWORD *)__endptr = 67109890;
        *(_DWORD *)&__endptr[4] = v18;
        *(_WORD *)&__endptr[8] = 2080;
        *(void *)&__endptr[10] = v16;
        __int16 v28 = 1024;
        int v29 = v17;
        __int16 v30 = 2048;
        uint64_t v31 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v7, (os_log_type_t)0x90u, "[ERROR] Received bogus event on device %x: %s (flags:%x id:%lld)", __endptr, 0x22u);
      }
      goto LABEL_9;
    }
    log = sub_100002D4C();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8 * v4);
      int v22 = *(_DWORD *)(*(void *)(a1 + 56) + 4 * v4);
      int v23 = *(_DWORD *)(*(void *)(a1 + 32) + 144);
      uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8 * v4);
      *(_DWORD *)__endptr = 67109890;
      *(_DWORD *)&__endptr[4] = v23;
      *(_WORD *)&__endptr[8] = 2080;
      *(void *)&__endptr[10] = v21;
      __int16 v28 = 1024;
      int v29 = v22;
      __int16 v30 = 2048;
      uint64_t v31 = v24;
      _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Received event on device %x: %s (flags:%x id:%lld)", __endptr, 0x22u);
    }

    if (!v15)
    {
      int v7 = +[GSFileRow fileRow:v3 byDocumentID:v9];
      if (v7)
      {
        [*(id *)(a1 + 32) _actOnDocidDeletion:v9 row:v7];
      }
      else
      {
        int v20 = sub_100002D4C();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)__endptr = 134217984;
          *(void *)&__endptr[4] = v9;
          _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] unable to find row for docid:%lld", __endptr, 0xCu);
        }
      }
LABEL_9:

      goto LABEL_10;
    }
    [*(id *)(a1 + 32) _actOnDocidChange:v9 src:v12 dst:v15];
LABEL_10:
    ++v4;
    unint64_t v8 = *(void *)(a1 + 40);
  }
  while (v4 < v8);
  uint64_t v25 = v8 - 1;
LABEL_32:
  *(void *)(*(void *)(*(void *)(a1 + 32) + 152) + 16) = *(void *)(*(void *)(a1 + 64) + 8 * v25);
}

uint64_t sub_100020C4C(void *a1, int a2)
{
  id v3 = a1;
  unint64_t v4 = +[NSFileManager defaultManager];
  char v5 = [v3 stringByAppendingString:@"-bad-1"];
  if ([v4 fileExistsAtPath:v5])
  {
    sub_10000C530((char *)[v5 fileSystemRepresentation], 0, 0);
  }
  else
  {
    if ((a2 - 1) > 4) {
      int v6 = "Unknown reason";
    }
    else {
      int v6 = (&off_100041A18)[a2 - 1];
    }
    int v7 = +[NSString stringWithFormat:@"Dataloss reason - %s", v6];
    sub_100006100(v7);
  }
  id v14 = 0;
  unsigned __int8 v8 = [v4 moveItemAtPath:v3 toPath:v5 error:&v14];
  id v9 = v14;
  uint64_t v10 = sub_100002D4C();
  BOOL v11 = os_log_type_enabled(v10, (os_log_type_t)0x90u);
  if (v8)
  {
    if (v11) {
      sub_10002C00C();
    }
    uint64_t v12 = 1;
  }
  else
  {
    if (v11) {
      sub_10002C074();
    }
    uint64_t v12 = 0;
  }

  return v12;
}

void sub_100020DC0(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("exclude-from-backup-queue", v3);
  uint64_t v2 = (void *)qword_10004CF10;
  qword_10004CF10 = (uint64_t)v1;
}

void sub_100020E24(uint64_t a1)
{
  dispatch_queue_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = +[NSURL fileURLWithPath:*(void *)(a1 + 40)];
  NSURLResourceKey v39 = NSURLIsExcludedFromBackupKey;
  id v3 = +[NSArray arrayWithObjects:&v39 count:1];
  unint64_t v4 = [v1 enumeratorAtURL:v2 includingPropertiesForKeys:v3 options:1 errorHandler:0];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (!v6)
  {
    id v9 = 0;
    goto LABEL_28;
  }
  id v8 = v6;
  id v9 = 0;
  uint64_t v10 = *(void *)v31;
  *(void *)&long long v7 = 138412290;
  long long v28 = v7;
  do
  {
    BOOL v11 = 0;
    do
    {
      uint64_t v12 = v9;
      if (*(void *)v31 != v10) {
        objc_enumerationMutation(v5);
      }
      uint64_t v13 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v11);
      id v14 = objc_msgSend(v13, "lastPathComponent", v28);
      unsigned __int8 v15 = [v14 isEqualToString:@"PerUID"];

      if ((v15 & 1) != 0
        || ([v13 lastPathComponent],
            uint64_t v16 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v17 = [v16 isEqualToString:@"AllUIDs"],
            v16,
            (v17 & 1) != 0))
      {
        id v9 = v12;
        goto LABEL_15;
      }
      id v29 = 0;
      unsigned __int8 v18 = [v13 getResourceValue:&v29 forKey:NSURLIsExcludedFromBackupKey error:0];
      id v9 = v29;

      if ((v18 & 1) == 0)
      {
        uint64_t v19 = sub_100002D4C();
        if (!os_log_type_enabled(v19, (os_log_type_t)0x90u)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 138412546;
        NSURLResourceKey v35 = NSURLIsExcludedFromBackupKey;
        __int16 v36 = 2112;
        id v37 = v13;
        uint64_t v24 = v19;
        uint64_t v25 = "[ERROR] Failed to get value of %@ for %@";
        uint32_t v26 = 22;
LABEL_24:
        _os_log_error_impl((void *)&_mh_execute_header, v24, (os_log_type_t)0x90u, v25, buf, v26);
        goto LABEL_14;
      }
      if ([v9 BOOLValue])
      {
        uint64_t v19 = sub_100002D4C();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v28;
          NSURLResourceKey v35 = (NSURLResourceKey)v13;
          int v20 = v19;
          uint64_t v21 = "[DEBUG] %@ is already ignored from backups";
LABEL_20:
          _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, v21, buf, 0xCu);
        }
      }
      else
      {
        unsigned int v22 = [v13 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:0];
        int v23 = sub_100002D4C();
        uint64_t v19 = v23;
        if (!v22)
        {
          if (!os_log_type_enabled(v23, (os_log_type_t)0x90u)) {
            goto LABEL_14;
          }
          *(_DWORD *)buf = v28;
          NSURLResourceKey v35 = (NSURLResourceKey)v13;
          uint64_t v24 = v19;
          uint64_t v25 = "[ERROR] Failed to exclude %@ from backups";
          uint32_t v26 = 12;
          goto LABEL_24;
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v28;
          NSURLResourceKey v35 = (NSURLResourceKey)v13;
          int v20 = v19;
          uint64_t v21 = "[DEBUG] %@ is now excluded from backups";
          goto LABEL_20;
        }
      }
LABEL_14:

LABEL_15:
      BOOL v11 = (char *)v11 + 1;
    }
    while (v8 != v11);
    id v27 = [v5 countByEnumeratingWithState:&v30 objects:v38 count:16];
    id v8 = v27;
  }
  while (v27);
LABEL_28:
}

id sub_100021B84(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [a2 _fseventAtPaths:a4 flags:a5 eventIds:a6 count:a3];
}

id sub_100021E98(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

id sub_100021EA0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

void sub_100022168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1000221A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    size_t v42 = +[GSFileRow tableRowCount:v3];
    uint64_t v40 = (char *)malloc_type_calloc(0x10uLL, v42, 0x52E58968uLL);
    if (v40)
    {
      unint64_t v4 = +[NSMapTable mapTableWithKeyOptions:1282 valueOptions:258];
      table = +[NSHashTable hashTableWithOptions:1282];
      long long v48 = 0u;
      long long v49 = 0u;
      memset(v47, 0, sizeof(v47));
      DWORD2(v48) = -1;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      NSURLResourceKey v39 = v3;
      id v5 = +[GSGenerationRow enumerate:v3 withOptions:v47];
      id v6 = [v5 countByEnumeratingWithState:&v43 objects:v50 count:16];
      if (!v6) {
        goto LABEL_36;
      }
      id v7 = v6;
      uint64_t v8 = *(void *)v44;
      while (1)
      {
        id v9 = 0;
        do
        {
          if (*(void *)v44 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v43 + 1) + 8 * (void)v9);
          uint64_t v11 = *(const void **)(v10 + 16);
          uint64_t v12 = (char *)NSMapGet(v4, v11);
          if (v12)
          {
            uint64_t v13 = v12;
            if ((*(unsigned char *)(v10 + 48) & 8) == 0) {
              goto LABEL_15;
            }
            if (*(void *)(v10 + 64) > *((void *)v12 + 1)) {
              goto LABEL_29;
            }
          }
          else
          {
            NSUInteger v14 = NSCountMapTable(v4);
            if (v14 >= v42)
            {
              [*(id *)(a1 + 32) setIsInconsistent:1];
              goto LABEL_29;
            }
            uint64_t v13 = &v40[16 * v14];
            NSMapInsertKnownAbsent(v4, v11, v13);
            *(void *)uint64_t v13 = *(void *)(v10 + 64);
          }
          NSHashInsertKnownAbsent(table, *(const void **)(v10 + 8));
LABEL_15:
          int v15 = *(_DWORD *)(a1 + 64);
          uint64_t v16 = *(void *)(v10 + 64);
          uint64_t v17 = *(void *)(a1 + 56) - *(void *)v13;
          uint64_t v18 = *(void *)v13 - v16;
          if ((v15 & 0x200) != 0 || (v17 <= 86399 ? (BOOL v19 = v18 < 43200) : (BOOL v19 = 0), !v19))
          {
            uint64_t v20 = v15 != 0;
            uint64_t v21 = -v20;
            unsigned int v22 = 2 - v20;
            int v23 = (char *)&qword_100032318[3 * v20];
            uint64_t v24 = (uint64_t *)(v23 + 16);
            uint64_t v25 = (uint64_t *)(v23 + 8);
            while (1)
            {
              uint64_t v26 = *v24;
              v24 += 3;
              if (v17 <= v26) {
                break;
              }
              --v21;
              --v22;
              v25 += 3;
              if (v21 == -3) {
                goto LABEL_26;
              }
            }
            if (v21 == -3)
            {
LABEL_26:
              uint64_t v27 = 3;
              goto LABEL_27;
            }
            uint64_t v27 = -v21;
            uint64_t v28 = v22 - v21 + 1;
            while (1)
            {
              uint64_t v29 = *v25;
              v25 += 3;
              if (v18 <= v29) {
                break;
              }
              if (++v27 == 3)
              {
                uint64_t v27 = v28;
                break;
              }
            }
LABEL_27:
            v16 -= qword_100032318[3 * v27];
          }
          *((void *)v13 + 1) = v16;
LABEL_29:
          id v9 = (char *)v9 + 1;
        }
        while (v9 != v7);
        id v30 = [v5 countByEnumeratingWithState:&v43 objects:v50 count:16];
        id v7 = v30;
        if (!v30)
        {
LABEL_36:

          id v3 = v39;
          long long v31 = [v39 lastError];

          if (v31)
          {
            uint64_t v32 = [v39 translatedError];
            uint64_t v33 = *(void *)(*(void *)(a1 + 40) + 8);
            long long v34 = *(void **)(v33 + 40);
            *(void *)(v33 + 40) = v32;

            NSURLResourceKey v35 = table;
          }
          else
          {
            NSURLResourceKey v35 = table;
            if (+[GSGenerationRow thinningPrecompute:v39 kept:table])
            {
              *(void *)(*(void *)(a1 + 32) + 96) = *(void *)(a1 + 56);
              *(_DWORD *)(*(void *)(a1 + 32) + 104) = *(_DWORD *)(a1 + 64);
              *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
            }
          }
          free(v40);
          goto LABEL_44;
        }
      }
    }
    unint64_t v4 = +[NSString stringWithFormat:@"Allocation failure"];
    __int16 v36 = sub_100002D4C();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      sub_100028658();
    }

    uint64_t v37 = sub_100003600(101, v4, 0);
    uint64_t v38 = *(void *)(*(void *)(a1 + 40) + 8);
    NSURLResourceKey v35 = *(NSHashTable **)(v38 + 40);
    *(void *)(v38 + 40) = v37;
LABEL_44:
  }
}

void sub_1000226A0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1000226BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSMutableIndexSet);
    uint64_t v5 = +[GSFileRow tableRowCount:v3];
    uint64_t v6 = +[GSGenerationRow tableRowCount:v3];
    long long v30 = 0u;
    long long v31 = 0u;
    v28[0] = 0;
    long long v29 = 0u;
    v28[1] = 8;
    DWORD2(v30) = -1;
    BYTE12(v30) = 1;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v20 = v3;
    id v7 = +[GSGenerationRow enumerate:v3 withOptions:v28];
    id v8 = [v7 countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v8)
    {
      id v9 = v8;
      double v10 = (double)v6 / (double)v5;
      uint64_t v11 = *(void *)v25;
      double v12 = 0.0;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v7);
          }
          if (v12 < 0.0)
          {
            uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            if ([*(id *)(a1 + 32) _generationForsakeRow:v14 withCredential:*(void *)(a1 + 48) error:0])
            {
              int v15 = sub_100002D4C();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v16 = *(void *)(v14 + 8);
                id v17 = [*(id *)(v14 + 40) UTF8String];
                *(_DWORD *)buf = 134218242;
                uint64_t v33 = v16;
                __int16 v34 = 2080;
                id v35 = v17;
                _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] Deleted generation with id %lld at path \"%s\".\n", buf, 0x16u);
              }
              double v12 = v10 + v12;

              [v4 addIndex:*(void *)(v14 + 8)];
            }
          }
          double v12 = v12 + -1.0;
        }
        id v9 = [v7 countByEnumeratingWithState:&v24 objects:v36 count:16];
      }
      while (v9);
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000229A0;
    v21[3] = &unk_100041800;
    id v3 = v20;
    id v18 = v20;
    uint64_t v19 = *(void *)(a1 + 32);
    id v22 = v18;
    uint64_t v23 = v19;
    [v4 enumerateIndexesUsingBlock:v21];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 count];
  }
}

id sub_1000229A0(uint64_t a1, uint64_t a2)
{
  id v4 = sub_100002D4C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002C3BC();
  }

  id result = +[GSGenerationRow deleteRow:*(void *)(a1 + 32) rowID:a2];
  if ((uint64_t)result <= 0)
  {
    uint64_t v6 = sub_100002D4C();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u)) {
      sub_10002C354();
    }

    return [*(id *)(a1 + 40) setIsInconsistent:1];
  }
  return result;
}

void sub_100022B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100022B78(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v21 = 0u;
  long long v22 = 0u;
  v19[0] = 0;
  long long v20 = 0u;
  v19[1] = 8;
  DWORD2(v21) = -1;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = +[GSGenerationRow enumerate:withOptions:](GSGenerationRow, "enumerate:withOptions:", v3, v19, 0);
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
      if ([*(id *)(a1 + 32) _generationForsakeRow:v9 withCredential:*(void *)(a1 + 48) error:0])break; {
      if (v6 == (id)++v8)
      }
      {
        id v6 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    double v10 = sub_100002D4C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10002C458(v9, v10);
    }

    uint64_t v11 = *(void *)(v9 + 8);
    ++**(void **)(a1 + 56);

    if (v11)
    {
      double v12 = sub_100002D4C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_10002C3BC();
      }

      if (+[GSGenerationRow deleteRow:v3 rowID:v11] <= 0)
      {
        uint64_t v13 = sub_100002D4C();
        if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
          sub_10002C354();
        }

        [*(id *)(a1 + 32) setIsInconsistent:1];
      }
      goto LABEL_22;
    }
  }
  else
  {
LABEL_9:
  }
  uint64_t v14 = sub_100002D4C();
  if (os_log_type_enabled(v14, (os_log_type_t)0x90u)) {
    sub_10002C424();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
LABEL_22:
}

uint64_t sub_100022F08(uint64_t a1)
{
  uint64_t v27 = 0;
  uint64_t v2 = sub_100002D4C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 144);
    *(_DWORD *)buf = 67109120;
    int v29 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[NOTICE] [dev:%d] Start purging", buf, 8u);
  }

  [*(id *)(a1 + 32) _thinningPrecompute:0 error:0];
  uint64_t v4 = 0;
  int v5 = 0;
  *(void *)&long long v6 = 67109120;
  long long v23 = v6;
  while (1)
  {
    while (1)
    {
      if (!v5)
      {
        uint64_t v7 = sub_100002D4C();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = *(_DWORD *)(*(void *)(a1 + 32) + 144);
          *(_DWORD *)buf = v23;
          int v29 = v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[NOTICE] [dev:%d] Start purging generations", buf, 8u);
        }

        int v5 = 1;
      }
      uint64_t v9 = (uint64_t)objc_msgSend(*(id *)(a1 + 32), "_purgeGenerationsWithCredentials:", a1 + 56, v23);
      if (v9 < 1) {
        break;
      }
      v4 += v9;
      uint64_t v27 = v4;
    }
    if (v9 < 0) {
      break;
    }
    if (v5 != 1)
    {
      if (!*(_DWORD *)(a1 + 60)
        && *(unsigned char *)(a1 + 100)
        && (+[GSSystemResourcesManager manager],
            long long v17 = objc_claimAutoreleasedReturnValue(),
            unsigned __int16 v18 = (unsigned __int16)[v17 deviceLowSpaceFlags:*(unsigned int *)(*(void *)(a1 + 32) + 144)], v17, (v18 & 0x200) != 0))
      {
        uint64_t v19 = sub_100002D4C();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = *(_DWORD *)(*(void *)(a1 + 32) + 144);
          *(_DWORD *)buf = v23;
          int v29 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[NOTICE] [dev:%d] Still very low on disk, purge harder", buf, 8u);
        }

        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10002330C;
        void v24[3] = &unk_100041878;
        long long v21 = *(void **)(a1 + 32);
        id v25 = *(id *)(a1 + 40);
        uint64_t v26 = 0;
        id v12 = [v21 _purgeAggressively:&v27 credentials:a1 + 56 whilePredicateIsTrue:v24];
        LODWORD(v21) = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();

        if (!v21)
        {
          uint64_t v13 = sub_100002D4C();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            int v22 = *(_DWORD *)(*(void *)(a1 + 32) + 144);
            *(_DWORD *)buf = 67109632;
            int v29 = v22;
            __int16 v30 = 2048;
            id v31 = v12;
            __int16 v32 = 2048;
            uint64_t v33 = v27;
            long long v15 = "[NOTICE] [dev:%d] Finished purging: freed %lld bytes, removed %lld generations";
LABEL_20:
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 0x1Cu);
          }
          goto LABEL_21;
        }
      }
      else
      {
LABEL_17:
        id v12 = 0;
      }
      uint64_t v13 = sub_100002D4C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = *(_DWORD *)(*(void *)(a1 + 32) + 144);
        *(_DWORD *)buf = 67109632;
        int v29 = v14;
        __int16 v30 = 2048;
        id v31 = v12;
        __int16 v32 = 2048;
        uint64_t v33 = v27;
        long long v15 = "[NOTICE] [dev:%d] Nothing left to purge: freed %lld bytes, removed %lld generations";
        goto LABEL_20;
      }
LABEL_21:

      break;
    }
    double v10 = sub_100002D4C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = *(_DWORD *)(*(void *)(a1 + 32) + 144);
      *(_DWORD *)buf = v23;
      int v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[NOTICE] [dev:%d] Recompute thinning", buf, 8u);
    }

    int v5 = 2;
    if (([*(id *)(a1 + 32) _thinningPrecompute:1 error:0] & 1) == 0) {
      goto LABEL_17;
    }
  }
  *(void *)(*(void *)(a1 + 32) + 120) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_10002330C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40) + a2);
}

void sub_100023468(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

BOOL sub_100023480(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) > a2;
}

intptr_t sub_100023490(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100023590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double sub_1000235A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = +[GSFileRow tableRowCount:v3];
  if (v4 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = +[GSGenerationRow tableRowCount:v3];
  if ((double)v6 / (double)v5 >= 1.0) {
    double v7 = (double)v6 / (double)v5;
  }
  else {
    double v7 = 1.0;
  }
  uint64_t v8 = +[GSGenerationRow computePrunableSpace:v3];

  double result = (double)v8 / v7;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (uint64_t)result;
  return result;
}

void sub_100023708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t sub_100023720(uint64_t a1, uint64_t a2)
{
  unint64_t result = +[GSGenerationRow computePrunableSpace:a2];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_100023800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t sub_100023818(uint64_t a1, uint64_t a2)
{
  unint64_t result = +[GSGenerationRow computeNumberOfPruneableStorages:a2];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_1000238F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t sub_100023910(uint64_t a1, uint64_t a2)
{
  unint64_t result = +[GSGenerationRow computePruneableNumberOfGenerations:a2];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_100023A5C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100023A6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void *sub_100023AF4(void *result)
{
  uint64_t v1 = result[4];
  if (!*(_DWORD *)(v1 + 80))
  {
    unint64_t result = *(void **)(v1 + 32);
    if (result)
    {
      uint64_t v2 = (char *)[result fileSystemRepresentation];
      return (void *)sub_10000C9B8(v2, 0, 0);
    }
  }
  return result;
}

int64_t sub_10002445C(uint64_t a1, uint64_t a2)
{
  int64_t result = +[GSGenerationRow deleteRow:*(void *)(*(void *)(a1 + 32) + 16) rowID:a2];
  if (result < 0)
  {
    unint64_t v4 = sub_100002D4C();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
      sub_10002C7C4();
    }

    return (int64_t)[*(id *)(a1 + 32) setIsInconsistent:1];
  }
  return result;
}

void sub_1000260C4(void *a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    for (uint64_t i = a1[5]; i; uint64_t i = *(void *)(i + 16))
    {
      uint64_t v4 = a1[6];
      uint64_t v5 = +[NSString gs_stringWithFileSystemRepresentation:i + 104];
      unsigned int v6 = +[GSGenerationRow rowExists:v7 withStorageID:v4 andName:v5 andClientID:a1[4]];

      *(void *)(i + 32) = v6;
    }
  }
}

_DWORD *sub_100026528(uint64_t a1)
{
  [*(id *)(a1 + 32) _validateGenerationsStorageTree:"PerUID" atDepth:2];
  [*(id *)(a1 + 32) _validateGenerationsStorageTree:"AllUIDs" atDepth:1];
  int64_t result = *(_DWORD **)(a1 + 32);
  if (result[20])
  {
    return [result setIsInconsistent:1];
  }
  return result;
}

id sub_100026834(uint64_t a1, void *a2)
{
  return [a2 saveLibraryState:*(void *)(a1 + 32)];
}

void sub_10002694C(uint64_t a1)
{
  uint64_t v2 = sub_100002D4C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10002CDB4();
  }

  int v3 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(a1 + 32) + 84), (unsigned int *)&v3, 1u);
  if (!v3)
  {
    if (qword_10004CF28 != -1) {
      dispatch_once(&qword_10004CF28, &stru_1000419F8);
    }
    uint64_t v4 = qword_10004CF20;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100026AB0;
    block[3] = &unk_100040B00;
    id v6 = *(id *)(a1 + 32);
    dispatch_async(v4, block);
  }
}

void sub_100026A4C(id a1)
{
  int v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.genstore.corruption-queue", v3);
  uint64_t v2 = (void *)qword_10004CF20;
  qword_10004CF20 = (uint64_t)v1;
}

void sub_100026AB0(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 168);
  int v3 = sub_100002D4C();
  if (os_log_type_enabled(v3, (os_log_type_t)0x90u)) {
    sub_10002CDE8();
  }

  [*(id *)(a1 + 32) invalidate:1];
  sub_100020C4C(v2, 5);
}

void sub_100026B54(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_100026B74()
{
  sub_100006044();
  sub_1000060A4(v0, v1, v2, v3, v4, v5, v6, v7, v14, v16, v17, v18, v19, v20);
  sub_100005FC0();
  sub_100005FE4((void *)&_mh_execute_header, v8, v9, "[DEBUG] %@; error %d (%s)", v10, v11, v12, v13, v15);
}

void sub_100026BF0()
{
  sub_100006090();
  sub_100006028((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
}

void sub_100026C60()
{
  __error();
  int v0 = __error();
  strerror(*v0);
  sub_100006004();
  sub_100006070((void *)&_mh_execute_header, v1, v2, "[ERROR] Failed consuming extension - %@; error %d (%s)",
    v3,
    v4,
    v5,
    v6,
    v7);
}

void sub_100026CF8()
{
  sub_100006054();
  sub_100006028((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
}

void sub_100026D60()
{
  sub_100006090();
  sub_100006028((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
}

void sub_100026DD0()
{
  __error();
  int v0 = __error();
  strerror(*v0);
  sub_100006004();
  sub_100006070((void *)&_mh_execute_header, v1, v2, "[ERROR] failed to retrieve original perms from xattr on item \"%s\"; error %d (%s)\n",
    v3,
    v4,
    v5,
    v6,
    v7);
}

void sub_100026E64(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Sent snapshot for signature %@", (uint8_t *)&v2, 0xCu);
}

void sub_100026EDC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, (os_log_type_t)0x90u, "[ERROR] Failed to send snapshot for signature %@", (uint8_t *)&v2, 0xCu);
}

void sub_100026F54(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] got response from diagnosticReporter - %@", (uint8_t *)&v2, 0xCu);
}

void sub_100026FCC()
{
  sub_100008F98();
  sub_100006028((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
}

void sub_100027034()
{
  sub_100006090();
  sub_100006028((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
}

void sub_1000270A4(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Library was mounted %@", (uint8_t *)&v3, 0xCu);
}

void sub_100027128()
{
  __error();
  int v0 = __error();
  strerror(*v0);
  sub_100008FD0();
  sub_100008FE8((void *)&_mh_execute_header, v1, v2, "[ERROR] Failed to start volume monitoring; error %d (%s)",
    v3,
    v4,
    v5,
    v6,
    v7);
}

void sub_1000271B0()
{
  __error();
  int v0 = __error();
  strerror(*v0);
  sub_100008FD0();
  sub_100008FE8((void *)&_mh_execute_header, v1, v2, "[ERROR] Failed to enable compact events; error %d (%s)",
    v3,
    v4,
    v5,
    v6,
    v7);
}

void sub_100027238()
{
  sub_100009028();
  _os_log_error_impl((void *)&_mh_execute_header, v0, (os_log_type_t)0x90u, "[ERROR] Can't get sDevice", v1, 2u);
}

void sub_100027278()
{
  os_log_t v0 = __error();
  strerror(*v0);
  sub_100009034();
  sub_100009008((void *)&_mh_execute_header, v1, v2, "[ERROR] setrlimit error: %s", v3, v4, v5, v6, v7);
}

void sub_1000272F8()
{
  os_log_t v0 = __error();
  strerror(*v0);
  sub_100009034();
  sub_100009008((void *)&_mh_execute_header, v1, v2, "[ERROR] getrlimit error: %s", v3, v4, v5, v6, v7);
}

void sub_100027378(NSObject *a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  sub_100009034();
  _os_log_fault_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_FAULT, "[CRIT] /dev/fsevents clone failed! (%s)", v3, 0xCu);
}

void sub_100027408(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, (os_log_type_t)0x90u, "[ERROR] Disabling storage on system volume 0x%x", (uint8_t *)v3, 8u);
}

void sub_100027484()
{
  sub_100009028();
  _os_log_error_impl((void *)&_mh_execute_header, v0, (os_log_type_t)0x90u, "[ERROR] Failed to check if storage is disabled; disabling storage",
    v1,
    2u);
}

void sub_1000274C4(NSObject *a1)
{
  int v2 = __error();
  strerror(*v2);
  sub_100009034();
  _os_log_debug_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "[DEBUG] failed to disable fmod watching (%s)", v3, 0xCu);
}

void sub_100027554(int *a1, NSObject *a2)
{
  int v3 = *a1;
  int v4 = *__error();
  uint64_t v5 = __error();
  uint64_t v6 = strerror(*v5);
  v7[0] = 67109634;
  v7[1] = v3;
  __int16 v8 = 1024;
  int v9 = v4;
  __int16 v10 = 2080;
  uint64_t v11 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a2, (os_log_type_t)0x90u, "[ERROR] Failed acking fsevents unmount for %d; error %d (%s)",
    (uint8_t *)v7,
    0x18u);
}

void sub_100027614(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002768C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100027704()
{
  sub_100009028();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "[CRIT] volume_mounted_run_loop: failed to init the vfs event kqueue!", v1, 2u);
}

void sub_100027744(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000277BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100027834(int a1, NSObject *a2)
{
  int v2 = 136315394;
  int v3 = "cffd_callback";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "[CRIT] %s: Error: %d, restarting vfs events", (uint8_t *)&v2, 0x12u);
}

void sub_1000278C0(void *a1, uint64_t a2, NSObject *a3)
{
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  id v7 = [a1 count];
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Added %lld libraries and removed %lu", (uint8_t *)&v4, 0x16u);
}

void sub_100027960(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Device unlocked for user %u", (uint8_t *)v3, 8u);
}

void sub_1000279DC()
{
  sub_100009028();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Computing cache delete urgency on all volumes", v1, 2u);
}

void sub_100027A1C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Saving %@", (uint8_t *)&v2, 0xCu);
}

void sub_100027A94()
{
  sub_100006090();
  int v2 = 101;
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] %@; status %d", v1, 0x12u);
}

void sub_100027B10()
{
  sub_100006090();
  int v2 = 105;
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] %@; status %d", v1, 0x12u);
}

void sub_100027B8C()
{
}

void sub_100027BB8()
{
}

void sub_100027BE4()
{
}

void sub_100027C10(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[DEBUG] revisiond died or is absent; retry connecting\n",
    v1,
    2u);
}

void sub_100027C54()
{
  __assert_rtn("-[GSUserDefaults intForKey:min:max:byDefault:]", "GSUserDefaults.m", 102, "min <= def");
}

void sub_100027C80()
{
  __assert_rtn("-[GSUserDefaults intForKey:min:max:byDefault:]", "GSUserDefaults.m", 103, "def <= max");
}

void sub_100027CAC()
{
}

void sub_100027CD8()
{
  v4[0] = 138413314;
  sub_10000BE40();
  __int16 v5 = 1024;
  int v6 = v0;
  __int16 v7 = 1024;
  int v8 = v1;
  __int16 v9 = 1024;
  int v10 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, v3, (os_log_type_t)0x90u, "[ERROR] invalid user default for %@: %@ range:[%d,%d]; using default:%d",
    (uint8_t *)v4,
    0x28u);
}

void sub_100027D7C()
{
  __assert_rtn("-[GSUserDefaults longLongForKey:min:max:byDefault:]", "GSUserDefaults.m", 135, "min <= def");
}

void sub_100027DA8()
{
  __assert_rtn("-[GSUserDefaults longLongForKey:min:max:byDefault:]", "GSUserDefaults.m", 136, "def <= max");
}

void sub_100027DD4()
{
}

void sub_100027E00()
{
  sub_10000BDEC();
  sub_10000BE20((void *)&_mh_execute_header, v0, v1, "[ERROR] invalid user default for %@: %@ range:[%lld,%lld]; using default:%lld");
}

void sub_100027E70()
{
}

void sub_100027E9C()
{
  __assert_rtn("-[GSUserDefaults doubleForKey:min:max:byDefault:]", "GSUserDefaults.m", 168, "min <= def");
}

void sub_100027EC8()
{
  __assert_rtn("-[GSUserDefaults doubleForKey:min:max:byDefault:]", "GSUserDefaults.m", 169, "def <= max");
}

void sub_100027EF4()
{
  sub_10000BDEC();
  sub_10000BE20((void *)&_mh_execute_header, v0, v1, "[ERROR] invalid user default for %@: %@ range:[%f,%f]; using default:%f");
}

void sub_100027F64()
{
  v2[0] = 138412802;
  sub_10000BE40();
  __int16 v3 = 2080;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, (os_log_type_t)0x90u, "[ERROR] invalid user default for %@: %@ using default:%s", (uint8_t *)v2, 0x20u);
}

void sub_10002800C()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000FDAC();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x18u);
}

void sub_1000280C4()
{
  sub_100006044();
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000FDAC();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x1Eu);
}

void sub_100028180()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000FD40();
  sub_100006070((void *)&_mh_execute_header, v1, v2, "[ERROR] %s: stat() failed; error %d (%s)", v3, v4, v5, v6, 2u);
}

void sub_100028218()
{
  sub_100006044();
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000FD5C();
  sub_10000FE00((void *)&_mh_execute_header, v1, v2, "[ERROR] %s: FSIOC_CAS_BSDFLAGS failed for -%x/+%x\n; error %d (%s)",
    v3,
    v4,
    v5,
    v6,
    v7);
}

void sub_1000282B0()
{
  sub_100006044();
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000FD5C();
  sub_10000FE00((void *)&_mh_execute_header, v1, v2, "[ERROR] %s: inconsistent flags -%x/+%x; error %d (%s)",
    v3,
    v4,
    v5,
    v6,
    v7);
}

void sub_100028348()
{
}

void sub_100028374()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000FD40();
  sub_100006070((void *)&_mh_execute_header, v1, v2, "[ERROR] %s: failed to allocate buffer; error %d (%s)",
    v3,
    v4,
    v5,
    v6,
    2u);
}

void sub_10002840C()
{
  sub_10000FDD4();
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000FDAC();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x26u);
}

void sub_1000284D4()
{
  sub_10000FDD4();
  __error();
  sub_10000FDBC();
  sub_10000FDE0((void *)&_mh_execute_header, v0, v1, "[DEBUG] setattrlist failed (errno %d) for %s\n", v2, v3, v4, v5, v6);
}

void sub_100028550()
{
  sub_10000FDD4();
  __error();
  sub_10000FDBC();
  sub_10000FDE0((void *)&_mh_execute_header, v0, v1, "[DEBUG] gettattrlist failed (errno %d) for %s\n", v2, v3, v4, v5, v6);
}

void sub_1000285CC(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "com.apple.genstore.info";
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, (os_log_type_t)0x90u, "[ERROR] Invalid property list found in attribute %s at path \"%s\"", (uint8_t *)&v2, 0x16u);
}

void sub_100028658()
{
  sub_10000FD90();
  sub_100006028((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
}

void sub_1000286C0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002873C()
{
  sub_10000FDD4();
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100006004();
  sub_100006070((void *)&_mh_execute_header, v1, v2, "[ERROR] open() failed for path '%s'\n; error %d (%s)",
    v3,
    v4,
    v5,
    v6,
    v7);
}

void sub_1000287CC()
{
  sub_1000118D8();
  sub_1000118F0((void *)&_mh_execute_header, v0, v1, "[ERROR] Sqlite failed on %@ with error [%@]");
}

void sub_100028834(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000288AC(int a1, int __errnum)
{
  strerror(__errnum);
  sub_100005FC0();
  sub_100005FE4((void *)&_mh_execute_header, v2, v3, "[DEBUG] %@; error %d (%s)", v4, v5, v6, v7, v8);
}

void sub_100028938()
{
  sub_100006090();
  int v2 = 113;
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] %@; status %d", v1, 0x12u);
}

void sub_1000289B4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, (os_log_type_t)0x90u, "[ERROR] Unable to set journal mode to WAL for %@", (uint8_t *)&v3, 0xCu);
}

void sub_100028A30(void *a1, NSObject *a2)
{
  int v3 = [a1 url];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, (os_log_type_t)0x90u, "[ERROR] Database %@ wasn't converted to incremental vacuum mode", (uint8_t *)&v4, 0xCu);
}

void sub_100028AC8()
{
  __assert_rtn("gs_path_exists", "GSDatabase.m", 78, "argc == 1");
}

void sub_100028AF4()
{
  __assert_rtn("gs_path_not_exists", "GSDatabase.m", 84, "argc == 1");
}

void sub_100028B20()
{
  sub_1000118D8();
  sub_1000118F0((void *)&_mh_execute_header, v0, v1, "[ERROR] Failed to open sqlite DB at path \"%@\": %@");
}

void sub_100028B88()
{
  sub_100006090();
  int v2 = 111;
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] %@; status %d", v1, 0x12u);
}

void sub_100028C04(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, (os_log_type_t)0x90u, "[ERROR] Unlinked hardlink db at path \"%@\"", (uint8_t *)&v2, 0xCu);
}

void sub_100028C7C()
{
  sub_1000118D8();
  sub_1000118F0((void *)&_mh_execute_header, v0, v1, "[ERROR] Sqlite rollbacked transaction [%@] because of unrecoverable error [%@]");
}

void sub_100028CE4()
{
}

void sub_100028D10(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, (os_log_type_t)0x90u, "[ERROR] Unknown status code encountered: %d\n", (uint8_t *)v2, 8u);
}

void sub_100028D88(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, (os_log_type_t)0x90u, "[ERROR] No volume path in info dict %@", (uint8_t *)&v2, 0xCu);
}

void sub_100028E00(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, (os_log_type_t)0x90u, "[ERROR] Couldn't lstat '%@'", (uint8_t *)&v2, 0xCu);
}

void sub_100028E78(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] freed %lld bytes from the bad root", (uint8_t *)&v3, 0xCu);
}

void sub_100028EF4(uint64_t a1, NSObject *a2)
{
  int v2 = *(_DWORD *)(a1 + 40);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Client %d connection was invalidated", (uint8_t *)v3, 8u);
}

void sub_100028F70()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100014074();
  sub_1000140D8((void *)&_mh_execute_header, v1, v2, "[ERROR] unable to open %@ on device %x; error %d (%s)",
    v3,
    v4,
    v5,
    v6,
    v7);
}

void sub_100029008()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100014074();
  sub_1000140D8((void *)&_mh_execute_header, v1, v2, "[ERROR] unable to allocate Document ID to %@ on device %x; error %d (%s)",
    v3,
    v4,
    v5,
    v6,
    v7);
}

void sub_1000290A0()
{
  sub_1000140A0();
  sub_100006028((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
}

void sub_100029108()
{
  sub_100014058();
  sub_100006028((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
}

void sub_100029170(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000291DC()
{
  __assert_rtn("+[GSVolPath _volPathOnVolume:withFD:withPath:error:]", "GSVolPath.m", 196, "fullPath[0] == '/'");
}

void sub_100029208(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100029284(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000292F0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100029360()
{
  sub_100015298();
  sub_100006028((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
}

void sub_1000293C8()
{
  sub_10001CBE8();
  sub_10001CC74((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%d, %@)", v2, v3, v4, v5, 2u);
}

void sub_10002943C(uint64_t a1, uint64_t a2)
{
  int v3 = 136315650;
  uint64_t v4 = "-[GSClient requestFreeSpace:forVolume:reply:]";
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  sub_10001CD90();
  sub_10001CD24((void *)&_mh_execute_header, v2, (uint64_t)v2, "[DEBUG] %s query(%lld, %@)", (uint8_t *)&v3);
}

void sub_1000294CC(NSObject *a1)
{
  int v2 = *__error();
  int v3 = __error();
  uint64_t v4 = strerror(*v3);
  v5[0] = 67109378;
  v5[1] = v2;
  __int16 v6 = 2080;
  uint8_t v7 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a1, (os_log_type_t)0x90u, "[ERROR] statfs failed; error %d (%s)",
    (uint8_t *)v5,
    0x12u);
}

void sub_100029574()
{
  sub_10001CDB0();
  sub_10001CC74((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%d, %@)", v2, v3, v4, v5, 2u);
}

void sub_1000295EC(os_log_t log)
{
  int v1 = 136315906;
  uint64_t v2 = "-[GSClient getFileIdForDocumentId:onDevice:reply:]";
  __int16 v3 = 1024;
  int v4 = 0;
  __int16 v5 = 1024;
  int v6 = 0;
  __int16 v7 = 1024;
  int v8 = 4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[DEBUG] %s reply(%u, %d, %d)", (uint8_t *)&v1, 0x1Eu);
}

void sub_100029690()
{
  int v2 = 136315650;
  __int16 v3 = "-[GSClient getFileIdForDocumentId:onDevice:reply:]";
  sub_10001CE28();
  __int16 v4 = 1024;
  int v5 = v0;
  sub_10001CCBC((void *)&_mh_execute_header, v1, (uint64_t)v1, "[DEBUG] %s query(%lld, %d)", (uint8_t *)&v2);
}

void sub_100029720(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 2112;
  *(void *)((char *)&v4 + 2) = a1;
  sub_10001CF44((void *)&_mh_execute_header, a2, a3, "[ERROR] Failed creating library for %d: %@", v3, (void)v4, WORD4(v4));
}

void sub_100029798()
{
  sub_100009028();
  sub_10001CDF0((void *)&_mh_execute_header, v0, v1, "[DEBUG] Can't hint because no valid credentials", v2, v3, v4, v5, v6);
}

void sub_1000297CC()
{
  sub_10001CD9C();
  sub_10001CD74((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s query(%@)", v2, v3, v4, v5, 2u);
}

void sub_100029840()
{
  sub_10001CBE8();
  sub_10001CC74((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%d, %@)", v2, v3, v4, v5, 2u);
}

void sub_1000298B4()
{
  sub_10001CDB0();
  sub_10001CC74((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%d, %@)", v2, v3, v4, v5, 2u);
}

void sub_10002992C()
{
  sub_10001CD9C();
  sub_10001CD74((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s query(%@)", v2, v3, v4, v5, 2u);
}

void sub_1000299A0()
{
  sub_10001CC50();
  sub_10001CD58((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%@, %@, %@)", v2, v3, v4, v5, 2u);
}

void sub_100029A14()
{
  sub_10001CCA0();
  sub_100006028((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
}

void sub_100029A7C()
{
  int v2 = 136315906;
  sub_10001CE68();
  sub_10001CF24((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%@, %@, %@)", v2);
}

void sub_100029AF0(void *a1, int a2, NSObject *a3)
{
  uint64_t v5 = [a1 UUIDString];
  int v7 = 136315650;
  int v8 = "-[GSClient stagingPrefixForDevice:volumeUUID:reply:]";
  __int16 v9 = 1024;
  int v10 = a2;
  sub_10001CC90();
  sub_10001CCBC((void *)&_mh_execute_header, a3, v6, "[DEBUG] %s query(%x, %@)", (uint8_t *)&v7);
}

void sub_100029BA4()
{
  sub_10001CD9C();
  sub_10001CD74((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s query(%@)", v2, v3, v4, v5, 2u);
}

void sub_100029C18()
{
  sub_10001CC34();
  sub_10001CCD4((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%@, %@)", v2, v3, v4, v5, 2u);
}

void sub_100029C8C()
{
  sub_10001CD9C();
  sub_10001CD74((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s query(%@)", v2, v3, v4, v5, 2u);
}

void sub_100029D00()
{
  v1[0] = 136315650;
  sub_10001CDD4();
  sub_10001CD24((void *)&_mh_execute_header, v0, (uint64_t)v0, "[DEBUG] %s reply(%@, %@)", (uint8_t *)v1);
}

void sub_100029D7C()
{
  sub_10001CD90();
  sub_10001CCD4((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%lld, %@)", v2, v3, v4, v5, 2u);
}

void sub_100029E04()
{
  sub_10001CD9C();
  sub_10001CD74((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s query(%@)", v2, v3, v4, v5, 2u);
}

void sub_100029E78(uint64_t a1, uint64_t a2)
{
  int v3 = 136315650;
  uint64_t v4 = "-[GSClient permanentStorageIDForHandle:reply:]_block_invoke";
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  sub_10001CD90();
  sub_10001CD24((void *)&_mh_execute_header, v2, (uint64_t)v2, "[DEBUG] %s reply(%lld, %@)", (uint8_t *)&v3);
}

void sub_100029F08()
{
  sub_10001CC08();
  sub_10001CD3C((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%@, %@, %@, %@)", v2, v3, v4, v5, 2u);
}

void sub_100029F7C()
{
  sub_100009034();
  sub_1000140BC((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@", v2, v3, v4, v5, v6);
}

void sub_100029FE4()
{
  sub_10001CE28();
  sub_10001CD74((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s query(%lld)", v2, v3, v4, v5, 2u);
}

void sub_10002A060()
{
  sub_10001CC08();
  sub_10001CD3C((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%@, %@, %@, %@)", v2, v3, v4, v5, 2u);
}

void sub_10002A0D4()
{
  sub_100006090();
  sub_100006028((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
}

void sub_10002A144()
{
  sub_10001CC08();
  sub_10001CD3C((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%@, %@, %@, %@)", v2, v3, v4, v5, 2u);
}

void sub_10002A1B8()
{
  sub_10001CCF0();
  sub_10001CEA0((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%@, %@, %@, %@, %@)", v2, v3, v4, v5, 2u);
}

void sub_10002A22C()
{
  sub_10001CDB0();
  sub_10001CC74((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%d, %@)", v2, v3, v4, v5, 2u);
}

void sub_10002A2A4(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = +[NSError errorWithDomain:a1 code:-1002 userInfo:0];
  v5[0] = 136315650;
  sub_10001CBE8();
  sub_10001CCBC((void *)&_mh_execute_header, a2, v4, "[DEBUG] %s reply(%d, %@)", (uint8_t *)v5);
}

void sub_10002A350()
{
  sub_10001CBE8();
  sub_10001CC74((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%d, %@)", v2, v3, v4, v5, 2u);
}

void sub_10002A3C4()
{
  sub_10001CF64();
  sub_10001CC90();
  sub_10001CC74((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%d, %@)", v2, v3, v4, v5, v6);
}

void sub_10002A44C()
{
  sub_10001CBE8();
  sub_10001CC74((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%d, %@)", v2, v3, v4, v5, 2u);
}

void sub_10002A4C0()
{
  sub_10001CF64();
  sub_10001CC90();
  sub_10001CC74((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%d, %@)", v2, v3, v4, v5, v6);
}

void sub_10002A548()
{
  sub_10001CBE8();
  sub_10001CC74((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%d, %@)", v2, v3, v4, v5, 2u);
}

void sub_10002A5BC()
{
  sub_10001CF64();
  sub_10001CC90();
  sub_10001CC74((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%d, %@)", v2, v3, v4, v5, v6);
}

void sub_10002A644()
{
  sub_10001CC34();
  sub_10001CCD4((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%@, %@)", v2, v3, v4, v5, 2u);
}

void sub_10002A6B8()
{
  v1[0] = 136315650;
  sub_10001CDD4();
  sub_10001CD24((void *)&_mh_execute_header, v0, (uint64_t)v0, "[DEBUG] %s reply(%@, %@)", (uint8_t *)v1);
}

void sub_10002A734()
{
  sub_10001CC50();
  sub_10001CD58((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%@, %@, %@)", v2, v3, v4, v5, 2u);
}

void sub_10002A7A8()
{
  int v2 = 136315906;
  sub_10001CE68();
  sub_10001CF24((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%@, %@, %@)", v2);
}

void sub_10002A81C()
{
  sub_10001CC08();
  sub_10001CD3C((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%@, %@, %@, %@)", v2, v3, v4, v5, 2u);
}

void sub_10002A890(int a1, int __errnum, NSObject *a3)
{
  strerror(__errnum);
  sub_100005FC0();
  sub_10001CCBC((void *)&_mh_execute_header, a3, v4, "[DEBUG] %@; error %d (%s)", v5);
}

void sub_10002A924()
{
  sub_10001CC34();
  sub_10001CCD4((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%@, %@)", v2, v3, v4, v5, 2u);
}

void sub_10002A998(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002AA24()
{
  sub_10001CE34(__stack_chk_guard);
  sub_10001CE8C();
  sub_10001CCD4((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%@, %@)", v2, v3, v4, v5, 2u);
}

void sub_10002AAA0()
{
  sub_10001CC34();
  sub_10001CCD4((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%@, %@)", v2, v3, v4, v5, 2u);
}

void sub_10002AB14()
{
  sub_10001CC34();
  sub_10001CCD4((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%@, %@)", v2, v3, v4, v5, 2u);
}

void sub_10002AB88(uint64_t a1, uint64_t a2)
{
  int v3 = 136315650;
  uint64_t v4 = "-[GSClient removeAdditionsInStorage:removalSpec:completionHandler:]";
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  sub_10001CD90();
  sub_10001CD24((void *)&_mh_execute_header, v2, (uint64_t)v2, "[DEBUG] %s query(%lld, %@)", (uint8_t *)&v3);
}

void sub_10002AC18()
{
  sub_10001CC34();
  sub_10001CCD4((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%@, %@)", v2, v3, v4, v5, 2u);
}

void sub_10002AC8C()
{
  v1[0] = 136315650;
  sub_10001CDD4();
  sub_10001CD24((void *)&_mh_execute_header, v0, (uint64_t)v0, "[DEBUG] %s query(%@, %@)", (uint8_t *)v1);
}

void sub_10002AD08(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002AD90()
{
  sub_100009028();
  sub_10001CEBC((void *)&_mh_execute_header, v0, v1, "[ERROR] [ImportCookie] unable to get volume real path.", v2, v3, v4, v5, v6);
}

void sub_10002ADC4()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10001CE28();
  sub_10001CF04((void *)&_mh_execute_header, v1, v2, "[ERROR] [ImportCookie] Couldn't lstat volume  %@, error: %s", v3, v4, v5, v6, 2u);
}

void sub_10002AE54()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100009034();
  sub_100009008((void *)&_mh_execute_header, v1, v2, "[ERROR] [ImportCookie] Unable to open cookie path, error %s", v3, v4, v5, v6, v7);
}

void sub_10002AED4()
{
  sub_100009034();
  sub_10001CE0C((void *)&_mh_execute_header, v0, v1, "[ERROR] [ImportCookie] Unable to get NSURLVolumeURLKey. Error: %@", v2, v3, v4, v5, v6);
}

void sub_10002AF3C()
{
  sub_10001CED8();
  sub_10001CF44((void *)&_mh_execute_header, v0, v1, "[ERROR] [ImportCookie] No library on volume: %d, URL: %@");
}

void sub_10002AFA8()
{
  sub_100009028();
  sub_10001CEBC((void *)&_mh_execute_header, v0, v1, "[ERROR] [ImportCookie] Can't create a valid URL for cookie.", v2, v3, v4, v5, v6);
}

void sub_10002AFDC()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10001CE28();
  sub_10001CF04((void *)&_mh_execute_header, v1, v2, "[ERROR] [ImportCookie] Unable to open cookie path inside library: %@, errno %s", v3, v4, v5, v6, 2u);
}

void sub_10002B06C()
{
  sub_100009034();
  sub_10001CE0C((void *)&_mh_execute_header, v0, v1, "[ERROR] [ImportCookie] Unable to create library. Error: %@", v2, v3, v4, v5, v6);
}

void sub_10002B0D4()
{
  sub_10001CED8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] [ImportCookie] No library on volume. Will attempt to create one. Volume: %d, URL: %@", v1, 0x12u);
}

void sub_10002B150()
{
  os_log_t v0 = __error();
  strerror(*v0);
  sub_100009034();
  sub_100009008((void *)&_mh_execute_header, v1, v2, "[ERROR] [ImportCookie] Cant open cookie path, errno %s", v3, v4, v5, v6, v7);
}

void sub_10002B1D0()
{
  sub_100009028();
  sub_10001CDF0((void *)&_mh_execute_header, v0, v1, "[DEBUG] [ImportCookie] No permission.", v2, v3, v4, v5, v6);
}

void sub_10002B204()
{
  sub_10001CEF0();
  sub_10001CD74((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%@)", v2, v3, v4, v5, 2u);
}

void sub_10002B27C()
{
  sub_100009028();
  sub_10001CDF0((void *)&_mh_execute_header, v0, v1, "[DEBUG] [ImportCookie] nil volumeURL.", v2, v3, v4, v5, v6);
}

void sub_10002B2B0()
{
  sub_10001CD9C();
  sub_10001CD74((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%@)", v2, v3, v4, v5, 2u);
}

void sub_10002B324()
{
  sub_100009034();
  sub_10001CE0C((void *)&_mh_execute_header, v0, v1, "[ERROR] [ImportCookie] Found error while opening cookie, error: %@.", v2, v3, v4, v5, v6);
}

void sub_10002B38C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B404()
{
  sub_10001CE34(__stack_chk_guard);
  sub_10001CE8C();
  sub_10001CD74((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%@)", v2, v3, v4, v5, 2u);
}

void sub_10002B478()
{
  sub_10001CE34(__stack_chk_guard);
  sub_10001CE0C((void *)&_mh_execute_header, v0, v1, "[ERROR] [ImportCookie] Found error while clearing cookie, error: %@.", v2, v3, v4, v5, 2u);
}

void sub_10002B4E4()
{
  sub_100009028();
  sub_10001CDF0((void *)&_mh_execute_header, v0, v1, "[DEBUG] [ImportCookie] Clearing cookie.", v2, v3, v4, v5, v6);
}

void sub_10002B518()
{
  sub_10001CE34(__stack_chk_guard);
  sub_10001CE0C((void *)&_mh_execute_header, v0, v1, "[ERROR] [ImportCookie] Found error while writing cookie, error: %@.", v2, v3, v4, v5, 2u);
}

void sub_10002B584()
{
  sub_100009028();
  sub_10001CDF0((void *)&_mh_execute_header, v0, v1, "[DEBUG] [ImportCookie] Cookie updated", v2, v3, v4, v5, v6);
}

void sub_10002B5B8(uint64_t a1, id a2, NSObject *a3)
{
  if (a1) {
    CFStringRef v4 = @"<data>";
  }
  else {
    CFStringRef v4 = @"nil";
  }
  [a2 fileSystemRepresentation];
  int v6 = 136315650;
  uint8_t v7 = "-[GSClient storeImportCookieData:forVolumeURL:reply:]";
  __int16 v8 = 2112;
  CFStringRef v9 = v4;
  sub_10001CD90();
  sub_10001CD24((void *)&_mh_execute_header, a3, v5, "[DEBUG] %s query(%@, %s)", (uint8_t *)&v6);
}

void sub_10002B678()
{
  sub_10001CE44();
  sub_10001CD58((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%@, %@, %@)", v2, v3, v4, v5, 2u);
}

void sub_10002B6F0()
{
  sub_10001CC50();
  sub_10001CD58((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%@, %@, %@)", v2, v3, v4, v5, 2u);
}

void sub_10002B764()
{
  sub_10001CE34(__stack_chk_guard);
  sub_10001CD58((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%@, %@, %@)", v2, v3, v4, v5, 2u);
}

void sub_10002B7F4()
{
  sub_100009028();
  sub_10001CEBC((void *)&_mh_execute_header, v0, v1, "[ERROR] [ImportCookie] Unable to read cookie data", v2, v3, v4, v5, v6);
}

void sub_10002B828(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315906;
  *(void *)(buf + 4) = "-[GSClient readImportCookieDataForVolumeAtURL:reply:]";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2112;
  *((void *)buf + 3) = a2;
  *((_WORD *)buf + 16) = 2112;
  *(void *)(buf + 34) = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[DEBUG] %s reply(%@, %@, %@)", buf, 0x2Au);
}

void sub_10002B8A8(void *a1, NSObject *a2)
{
  [a1 fileSystemRepresentation];
  int v3 = 136315394;
  uint64_t v4 = "-[GSClient readImportCookieDataForVolumeAtURL:reply:]";
  sub_10001CE28();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] %s query(%s)", (uint8_t *)&v3, 0x16u);
}

void sub_10002B948(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B9CC()
{
  sub_10001CBE8();
  sub_10001CC74((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%d, %@)", v2, v3, v4, v5, 2u);
}

void sub_10002BA40()
{
  sub_10001CF64();
  sub_10001CC90();
  sub_10001CC74((void *)&_mh_execute_header, v0, v1, "[DEBUG] %s reply(%d, %@)", v2, v3, v4, v5, v6);
}

void sub_10002BAC8(void *a1, NSObject *a2)
{
  unint64_t v2 = *a1 - 1;
  if (v2 > 2) {
    uint64_t v3 = "<unknown>";
  }
  else {
    uint64_t v3 = off_1000416A8[v2];
  }
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Power level is now %s", (uint8_t *)&v4, 0xCu);
}

void sub_10002BB68()
{
  __error();
  os_log_t v0 = __error();
  strerror(*v0);
  sub_10001ECA4();
  sub_10001ECC8((void *)&_mh_execute_header, v1, v2, "[ERROR] fsgetpath(dev=%d) failed; error %d (%s)",
    v3,
    v4,
    v5,
    v6,
    v7);
}

void sub_10002BBFC()
{
  __error();
  os_log_t v0 = __error();
  strerror(*v0);
  sub_10001ECA4();
  sub_10001ECC8((void *)&_mh_execute_header, v1, v2, "[ERROR] fsctl(dev=%d) failed; error %d (%s)", v3, v4, v5, v6, v7);
}

void sub_10002BC90()
{
  __assert_rtn("-[GSSystemResourcesManager _initLowMemory]", "GSSystemResourcesManager.m", 365, "_memoryNotificationEventSource == NULL");
}

void sub_10002BCBC()
{
  sub_100009034();
  sub_1000140BC((void *)&_mh_execute_header, v0, v1, "[DEBUG] Marking %@ pending delete", v2, v3, v4, v5, v6);
}

void sub_10002BD24()
{
  sub_100026B30();
  sub_1000140BC((void *)&_mh_execute_header, v0, v1, "[DEBUG] deleting %@", v2, v3, v4, v5, v6);
}

void sub_10002BD90()
{
  sub_100026B3C();
  sub_100026B54((void *)&_mh_execute_header, v0, v1, "[DEBUG] Creating entry for docid:%lld ino:%lld", v2, v3);
}

void sub_10002BDF8()
{
  sub_100026B3C();
  sub_100026B54((void *)&_mh_execute_header, v0, v1, "[DEBUG] Updating %@ with ino:%lld");
}

void sub_10002BE60()
{
}

void sub_10002BE8C(NSObject *a1)
{
  int v2 = *__error();
  uint64_t v3 = __error();
  uint64_t v4 = strerror(*v3);
  v5[0] = 67109378;
  v5[1] = v2;
  __int16 v6 = 2080;
  uint8_t v7 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a1, (os_log_type_t)0x90u, "[ERROR] Failed to clear ACL on storage directory: error %d (%s)\n", (uint8_t *)v5, 0x12u);
}

void sub_10002BF34()
{
  sub_100026B30();
  sub_10001CE0C((void *)&_mh_execute_header, v0, v1, "[ERROR] Found incorrect permissions/ownership on Document Revisions storage at \"%@\"; moving out of the way and cre"
    "ating a new storage directory.\n",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10002BFA0()
{
  sub_100026B30();
  sub_10001CE0C((void *)&_mh_execute_header, v0, v1, "[ERROR] Found non-directory at \"%@\" but expecting directory; moving out of the way and creating a new storage directory.\n",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10002C00C()
{
  sub_100009034();
  sub_10001CE0C((void *)&_mh_execute_header, v0, v1, "[ERROR] Renamed bad storage directory to \"%@\".\n", v2, v3, v4, v5, v6);
}

void sub_10002C074()
{
  sub_1000118D8();
  sub_1000118F0((void *)&_mh_execute_header, v0, v1, "[ERROR] Failed to rename bad storage directory at \"%@\"; %@");
}

void sub_10002C0DC(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, (os_log_type_t)0x90u, "[ERROR] An unrecoverable error occurred while attempting to open the generation storage database. Generation data has been lost.\n", buf, 2u);
}

void sub_10002C11C()
{
  sub_100026B30();
  sub_10001CE0C((void *)&_mh_execute_header, v0, v1, "[ERROR] Failed to open database in path \"%@\"\n", v2, v3, v4, v5, v6);
}

void sub_10002C188()
{
  __assert_rtn("-[GSManager dealloc]", "GSManager.m", 1021, "_db == nil");
}

void sub_10002C1B4()
{
  sub_100009034();
  sub_1000140BC((void *)&_mh_execute_header, v0, v1, "[DEBUG] Deallocing %@\n", v2, v3, v4, v5, v6);
}

void sub_10002C21C()
{
  sub_100009034();
  sub_1000140BC((void *)&_mh_execute_header, v0, v1, "[DEBUG] Invalidating %@\n", v2, v3, v4, v5, v6);
}

void sub_10002C284()
{
  sub_100009028();
  sub_10001CDF0((void *)&_mh_execute_header, v0, v1, "[DEBUG] Not dispatch syncing because not enabled", v2, v3, v4, v5, v6);
}

void sub_10002C2B8()
{
  sub_100009028();
  sub_10001CEBC((void *)&_mh_execute_header, v0, v1, "[ERROR] Not dispatch syncing because no library root", v2, v3, v4, v5, v6);
}

void sub_10002C2EC()
{
  sub_100009028();
  sub_10001CDF0((void *)&_mh_execute_header, v0, v1, "[DEBUG] Not dispatch syncing because invalidated", v2, v3, v4, v5, v6);
}

void sub_10002C320()
{
  sub_100009028();
  sub_10001CDF0((void *)&_mh_execute_header, v0, v1, "[DEBUG] Recomputing thinning", v2, v3, v4, v5, v6);
}

void sub_10002C354()
{
  sub_100009034();
  sub_10001CE0C((void *)&_mh_execute_header, v0, v1, "[ERROR] Failed to delete generations row id %lld\n", v2, v3, v4, v5, v6);
}

void sub_10002C3BC()
{
  sub_100009034();
  sub_1000140BC((void *)&_mh_execute_header, v0, v1, "[DEBUG] Removing generation id %lld from database.\n", v2, v3, v4, v5, v6);
}

void sub_10002C424()
{
  sub_100009028();
  sub_10001CEBC((void *)&_mh_execute_header, v0, v1, "[ERROR] no purgeable generation row found", v2, v3, v4, v5, v6);
}

void sub_10002C458(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  id v4 = [*(id *)(a1 + 40) UTF8String];
  int v5 = 134218242;
  uint64_t v6 = v3;
  __int16 v7 = 2080;
  id v8 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Deleted generation with id %lld at path \"%s\".\n", (uint8_t *)&v5, 0x16u);
}

void sub_10002C510()
{
  sub_100009028();
  sub_10001CDF0((void *)&_mh_execute_header, v0, v1, "[DEBUG] not purging readonly library", v2, v3, v4, v5, v6);
}

void sub_10002C544()
{
  sub_100009034();
  sub_10001CE0C((void *)&_mh_execute_header, v0, v1, "[ERROR] Failed to delete storage ID %lld\n", v2, v3, v4, v5, v6);
}

void sub_10002C5AC()
{
  sub_100009034();
  sub_10001CE0C((void *)&_mh_execute_header, v0, v1, "[ERROR] Failed to delete generations rows for storage ID %lld\n", v2, v3, v4, v5, v6);
}

void sub_10002C614()
{
  sub_100009034();
  sub_10001CE0C((void *)&_mh_execute_header, v0, v1, "[ERROR] Failed to forsake %@", v2, v3, v4, v5, v6);
}

void sub_10002C67C()
{
  sub_100009034();
  sub_1000140BC((void *)&_mh_execute_header, v0, v1, "[DEBUG] Deleting all generations stored for sid:%lld\n", v2, v3, v4, v5, v6);
}

void sub_10002C6E4()
{
  sub_100026B30();
  sub_10001CE0C((void *)&_mh_execute_header, v0, v1, "[ERROR] Failed to remove generation row ID %lld\n", v2, v3, v4, v5, v6);
}

void sub_10002C75C()
{
  sub_1000118D8();
  sub_1000118F0((void *)&_mh_execute_header, v0, v1, "[ERROR] found no row for %@ in %@\n");
}

void sub_10002C7C4()
{
  sub_100009034();
  sub_10001CE0C((void *)&_mh_execute_header, v0, v1, "[ERROR] Failed to remove generation row ID %lld\n", v2, v3, v4, v5, v6);
}

void sub_10002C82C()
{
  sub_100009034();
  sub_10001CE0C((void *)&_mh_execute_header, v0, v1, "[ERROR] Failed to remove staging path %@", v2, v3, v4, v5, v6);
}

void sub_10002C894()
{
  sub_100009034();
  sub_10001CE0C((void *)&_mh_execute_header, v0, v1, "[ERROR] Ignoring deletion request for staging path at %@; not owned by the caller",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10002C8FC()
{
  sub_100009034();
  sub_1000140BC((void *)&_mh_execute_header, v0, v1, "[DEBUG] not removing staging path \"%@\"; was not staged.\n",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10002C964()
{
  sub_100009034();
  sub_10001CE0C((void *)&_mh_execute_header, v0, v1, "[ERROR] Generation already exists at the path \"%@\". Failing.\n", v2, v3, v4, v5, v6);
}

void sub_10002C9CC()
{
  sub_1000118D8();
  sub_1000118F0((void *)&_mh_execute_header, v0, v1, "[ERROR] Failed to create destination path \"%@\": %@");
}

void sub_10002CA34()
{
  sub_1000118D8();
  sub_1000118F0((void *)&_mh_execute_header, v0, v1, "[ERROR] Failed to make storage directory at \"%@\": %@");
}

void sub_10002CA9C()
{
  sub_100006090();
  sub_100006028((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
}

void sub_10002CB0C()
{
  sub_100006090();
  sub_100006028((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
}

void sub_10002CB7C()
{
  sub_100006090();
  sub_100006028((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
}

void sub_10002CBEC()
{
  sub_100009034();
  sub_10001CE0C((void *)&_mh_execute_header, v0, v1, "[ERROR] unable to fts %s generations hierarchy", v2, v3, v4, v5, v6);
}

void sub_10002CC54(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = *__error();
  uint64_t v5 = __error();
  uint8_t v6 = strerror(*v5);
  int v7 = 136315650;
  uint64_t v8 = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  __int16 v11 = 2080;
  uint64_t v12 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a2, (os_log_type_t)0x90u, "[ERROR] fts_read() failed for path %s; error %d (%s)",
    (uint8_t *)&v7,
    0x1Cu);
}

void sub_10002CD14()
{
  sub_100009028();
  sub_10001CEBC((void *)&_mh_execute_header, v0, v1, "[ERROR] unable to delete generations rows without data", v2, v3, v4, v5, v6);
}

void sub_10002CD48()
{
  sub_100026B30();
  sub_1000140BC((void *)&_mh_execute_header, v0, v1, "[DEBUG] Validating generations database for library at %@\n", v2, v3, v4, v5, v6);
}

void sub_10002CDB4()
{
  sub_100009028();
  sub_10001CDF0((void *)&_mh_execute_header, v0, v1, "[DEBUG] Corruption handler executed.\n", v2, v3, v4, v5, v6);
}

void sub_10002CDE8()
{
  sub_100009034();
  sub_10001CE0C((void *)&_mh_execute_header, v0, v1, "[ERROR] Runtime database corruption detected for library at \"%@\"; Generation data was lost.\n",
    v2,
    v3,
    v4,
    v5,
    v6);
}

uint64_t APFSVolumeRole()
{
  return _APFSVolumeRole();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFFileDescriptorRef CFFileDescriptorCreate(CFAllocatorRef allocator, CFFileDescriptorNativeDescriptor fd, Boolean closeOnInvalidate, CFFileDescriptorCallBack callout, const CFFileDescriptorContext *context)
{
  return _CFFileDescriptorCreate(allocator, fd, closeOnInvalidate, callout, context);
}

CFRunLoopSourceRef CFFileDescriptorCreateRunLoopSource(CFAllocatorRef allocator, CFFileDescriptorRef f, CFIndex order)
{
  return _CFFileDescriptorCreateRunLoopSource(allocator, f, order);
}

void CFFileDescriptorEnableCallBacks(CFFileDescriptorRef f, CFOptionFlags callBackTypes)
{
}

CFFileDescriptorNativeDescriptor CFFileDescriptorGetNativeDescriptor(CFFileDescriptorRef f)
{
  return _CFFileDescriptorGetNativeDescriptor(f);
}

void CFFileDescriptorInvalidate(CFFileDescriptorRef f)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

uint64_t CacheDeleteRegisterInfoCallbacks()
{
  return _CacheDeleteRegisterInfoCallbacks();
}

uint64_t CacheDeleteUpdatePurgeable()
{
  return _CacheDeleteUpdatePurgeable();
}

FSEventStreamRef FSEventStreamCreateRelativeToDevice(CFAllocatorRef allocator, FSEventStreamCallback callback, FSEventStreamContext *context, dev_t deviceToWatch, CFArrayRef pathsToWatchRelativeToDevice, FSEventStreamEventId sinceWhen, CFTimeInterval latency, FSEventStreamCreateFlags flags)
{
  return _FSEventStreamCreateRelativeToDevice(allocator, callback, context, deviceToWatch, pathsToWatchRelativeToDevice, sinceWhen, latency, flags);
}

void FSEventStreamInvalidate(FSEventStreamRef streamRef)
{
}

void FSEventStreamRelease(FSEventStreamRef streamRef)
{
}

void FSEventStreamSetDispatchQueue(FSEventStreamRef streamRef, dispatch_queue_t q)
{
}

Boolean FSEventStreamStart(FSEventStreamRef streamRef)
{
  return _FSEventStreamStart(streamRef);
}

void FSEventStreamStop(FSEventStreamRef streamRef)
{
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return _MKBDeviceFormattedForContentProtection();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBUserUnlockedSinceBoot()
{
  return _MKBUserUnlockedSinceBoot();
}

NSUInteger NSCountMapTable(NSMapTable *table)
{
  return _NSCountMapTable(table);
}

void *__cdecl NSHashGet(NSHashTable *table, const void *pointer)
{
  return _NSHashGet(table, pointer);
}

void NSHashInsertKnownAbsent(NSHashTable *table, const void *pointer)
{
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return _NSMapGet(table, key);
}

void NSMapInsertKnownAbsent(NSMapTable *table, const void *key, const void *value)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFURLReplaceObject()
{
  return __CFURLReplaceObject();
}

uint64_t _NSMethodExceptionProem()
{
  return __NSMethodExceptionProem();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

int accessx_np(const accessx_descriptor *a1, size_t a2, int *a3, uid_t a4)
{
  return _accessx_np(a1, a2, a3, a4);
}

int acl_free(void *obj_p)
{
  return _acl_free(obj_p);
}

acl_t acl_init(int count)
{
  return _acl_init(count);
}

int acl_set_fd_np(int fd, acl_t acl, acl_type_t acl_type)
{
  return _acl_set_fd_np(fd, acl, acl_type);
}

char *__cdecl basename(char *a1)
{
  return _basename(a1);
}

int chflags(const char *a1, __uint32_t a2)
{
  return _chflags(a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return _clonefile(a1, a2, a3);
}

int close(int a1)
{
  return _close(a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return _copyfile(from, to, state, flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return _copyfile_state_alloc();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return _copyfile_state_free(a1);
}

int copyfile_state_get(copyfile_state_t s, uint32_t flag, void *dst)
{
  return _copyfile_state_get(s, flag, dst);
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  return _copyfile_state_set(s, flag, src);
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
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
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

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
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
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

int faccessat(int a1, const char *a2, int a3, int a4)
{
  return _faccessat(a1, a2, a3, a4);
}

int fchmod(int a1, mode_t a2)
{
  return _fchmod(a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return _fchown(a1, a2, a3);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _ffsctl(a1, a2, a3, a4);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _fgetattrlist(a1, a2, a3, a4, a5);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _fgetxattr(fd, name, value, size, position, options);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
}

int fsetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _fsetattrlist(a1, a2, a3, a4, a5);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _fsetxattr(fd, name, value, size, position, options);
}

ssize_t fsgetpath(char *a1, size_t a2, fsid_t *a3, uint64_t a4)
{
  return _fsgetpath(a1, a2, a3, a4);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return _fstatat(a1, a2, a3, a4);
}

int fstatfs(int a1, statfs *a2)
{
  return _fstatfs(a1, a2);
}

FTSENT *__cdecl fts_children(FTS *a1, int a2)
{
  return _fts_children(a1, a2);
}

int fts_close(FTS *a1)
{
  return _fts_close(a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return _fts_open(a1, a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return _fts_read(a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return _fts_set(a1, a2, a3);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

uid_t geteuid(void)
{
  return _geteuid();
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return _getfsstat(a1, a2, a3);
}

const char *getprogname(void)
{
  return _getprogname();
}

int getrlimit(int a1, rlimit *a2)
{
  return _getrlimit(a1, a2);
}

uid_t getuid(void)
{
  return _getuid();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return _kevent(kq, changelist, nchanges, eventlist, nevents, timeout);
}

int kqueue(void)
{
  return _kqueue();
}

int lchmod(const char *a1, mode_t a2)
{
  return _lchmod(a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

mach_port_t mach_thread_self(void)
{
  return _mach_thread_self();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return _mkdirat(a1, a2, a3);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return _openat(a1, a2, a3);
}

uint64_t openbyid_np()
{
  return _openbyid_np();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t pql_sqlite3_value_object()
{
  return _pql_sqlite3_value_object();
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

uint64_t pthread_fchdir_np()
{
  return _pthread_fchdir_np();
}

int pthread_join(pthread_t a1, void **a2)
{
  return _pthread_join(a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_rdlock(a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_unlock(a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_wrlock(a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return _remove(__p, __ec);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return _removefile(path, state, flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return _removefile_state_alloc();
}

int removefile_state_free(removefile_state_t a1)
{
  return _removefile_state_free(a1);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return _removefile_state_set(state, key, value);
}

int removexattr(const char *path, const char *name, int options)
{
  return _removexattr(path, name, options);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int renameat(int a1, const char *a2, int a3, const char *a4)
{
  return _renameat(a1, a2, a3, a4);
}

int rmdir(const char *a1)
{
  return _rmdir(a1);
}

uint64_t sandbox_check_by_audit_token()
{
  return _sandbox_check_by_audit_token();
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _setattrlist(a1, a2, a3, a4, a5);
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return _setiopolicy_np(a1, a2, a3);
}

int setrlimit(int a1, const rlimit *a2)
{
  return _setrlimit(a1, a2);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _setxattr(path, name, value, size, position, options);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob(a1, a2, a3, n, a5);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return _sqlite3_value_int64(a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return _sqlite3_value_text(a1);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
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

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return _strtoll(__str, __endptr, __base);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return _thread_policy_set(thread, flavor, policy_info, policy_infoCnt);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_URLByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingPathExtension];
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

id objc_msgSend__connectionWithDaemonWasLost(void *a1, const char *a2, ...)
{
  return [a1 _connectionWithDaemonWasLost];
}

id objc_msgSend__gotoV2(void *a1, const char *a2, ...)
{
  return [a1 _gotoV2];
}

id objc_msgSend__gotoV3(void *a1, const char *a2, ...)
{
  return [a1 _gotoV3];
}

id objc_msgSend__gotoV4(void *a1, const char *a2, ...)
{
  return [a1 _gotoV4];
}

id objc_msgSend__gotoV5(void *a1, const char *a2, ...)
{
  return [a1 _gotoV5];
}

id objc_msgSend__initLowDiskManager(void *a1, const char *a2, ...)
{
  return [a1 _initLowDiskManager];
}

id objc_msgSend__initLowMemory(void *a1, const char *a2, ...)
{
  return [a1 _initLowMemory];
}

id objc_msgSend__initPowerManager(void *a1, const char *a2, ...)
{
  return [a1 _initPowerManager];
}

id objc_msgSend__installFunctions(void *a1, const char *a2, ...)
{
  return [a1 _installFunctions];
}

id objc_msgSend__invalidateLowDiskManager(void *a1, const char *a2, ...)
{
  return [a1 _invalidateLowDiskManager];
}

id objc_msgSend__invalidateLowMemory(void *a1, const char *a2, ...)
{
  return [a1 _invalidateLowMemory];
}

id objc_msgSend__invalidatePowerManager(void *a1, const char *a2, ...)
{
  return [a1 _invalidatePowerManager];
}

id objc_msgSend__purgePurgatory(void *a1, const char *a2, ...)
{
  return [a1 _purgePurgatory];
}

id objc_msgSend__resetLowDiskManager(void *a1, const char *a2, ...)
{
  return [a1 _resetLowDiskManager];
}

id objc_msgSend__resetPowerManager(void *a1, const char *a2, ...)
{
  return [a1 _resetPowerManager];
}

id objc_msgSend__resume(void *a1, const char *a2, ...)
{
  return [a1 _resume];
}

id objc_msgSend__setupDBIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _setupDBIfNeeded];
}

id objc_msgSend__setupPragmas(void *a1, const char *a2, ...)
{
  return [a1 _setupPragmas];
}

id objc_msgSend__vacuumMode(void *a1, const char *a2, ...)
{
  return [a1 _vacuumMode];
}

id objc_msgSend__validateGenerationsTable(void *a1, const char *a2, ...)
{
  return [a1 _validateGenerationsTable];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_changes(void *a1, const char *a2, ...)
{
  return [a1 changes];
}

id objc_msgSend_checkForDBUpgrade(void *a1, const char *a2, ...)
{
  return [a1 checkForDBUpgrade];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_computeNumberOfPruneableStorages(void *a1, const char *a2, ...)
{
  return [a1 computeNumberOfPruneableStorages];
}

id objc_msgSend_computePruneableNumberOfGenerations(void *a1, const char *a2, ...)
{
  return [a1 computePruneableNumberOfGenerations];
}

id objc_msgSend_computePurgeableSpace(void *a1, const char *a2, ...)
{
  return [a1 computePurgeableSpace];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentProgress(void *a1, const char *a2, ...)
{
  return [a1 currentProgress];
}

id objc_msgSend_daemon(void *a1, const char *a2, ...)
{
  return [a1 daemon];
}

id objc_msgSend_dbHandle(void *a1, const char *a2, ...)
{
  return [a1 dbHandle];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaults(void *a1, const char *a2, ...)
{
  return [a1 defaults];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didReceiveMemoryWarning(void *a1, const char *a2, ...)
{
  return [a1 didReceiveMemoryWarning];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_doArchive(void *a1, const char *a2, ...)
{
  return [a1 doArchive];
}

id objc_msgSend_doUnarchive(void *a1, const char *a2, ...)
{
  return [a1 doUnarchive];
}

id objc_msgSend_documentURL(void *a1, const char *a2, ...)
{
  return [a1 documentURL];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_effectiveGroupIdentifier(void *a1, const char *a2, ...)
{
  return [a1 effectiveGroupIdentifier];
}

id objc_msgSend_effectiveUserIdentifier(void *a1, const char *a2, ...)
{
  return [a1 effectiveUserIdentifier];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_estimatePurgeableSpace(void *a1, const char *a2, ...)
{
  return [a1 estimatePurgeableSpace];
}

id objc_msgSend_exportedObject(void *a1, const char *a2, ...)
{
  return [a1 exportedObject];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_fileOwnerAccountID(void *a1, const char *a2, ...)
{
  return [a1 fileOwnerAccountID];
}

id objc_msgSend_fileSystemFileNumber(void *a1, const char *a2, ...)
{
  return [a1 fileSystemFileNumber];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_generationSize(void *a1, const char *a2, ...)
{
  return [a1 generationSize];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isClean(void *a1, const char *a2, ...)
{
  return [a1 isClean];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_isIgnoringOwners(void *a1, const char *a2, ...)
{
  return [a1 isIgnoringOwners];
}

id objc_msgSend_isInIgnoredLocation(void *a1, const char *a2, ...)
{
  return [a1 isInIgnoredLocation];
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return [a1 isMultiUser];
}

id objc_msgSend_isReadOnly(void *a1, const char *a2, ...)
{
  return [a1 isReadOnly];
}

id objc_msgSend_isThrottlingIo(void *a1, const char *a2, ...)
{
  return [a1 isThrottlingIo];
}

id objc_msgSend_lastError(void *a1, const char *a2, ...)
{
  return [a1 lastError];
}

id objc_msgSend_lastInsertedRowID(void *a1, const char *a2, ...)
{
  return [a1 lastInsertedRowID];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return [a1 library];
}

id objc_msgSend_libraryRoot(void *a1, const char *a2, ...)
{
  return [a1 libraryRoot];
}

id objc_msgSend_loadLibraryState(void *a1, const char *a2, ...)
{
  return [a1 loadLibraryState];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nameSpace(void *a1, const char *a2, ...)
{
  return [a1 nameSpace];
}

id objc_msgSend_next(void *a1, const char *a2, ...)
{
  return [a1 next];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_offsetInFile(void *a1, const char *a2, ...)
{
  return [a1 offsetInFile];
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

id objc_msgSend_persistentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 persistentIdentifier];
}

id objc_msgSend_privExtension(void *a1, const char *a2, ...)
{
  return [a1 privExtension];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_proxy(void *a1, const char *a2, ...)
{
  return [a1 proxy];
}

id objc_msgSend_pubExtension(void *a1, const char *a2, ...)
{
  return [a1 pubExtension];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return [a1 serialQueue];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_shutdownLibraries(void *a1, const char *a2, ...)
{
  return [a1 shutdownLibraries];
}

id objc_msgSend_sqliteErrorHandler(void *a1, const char *a2, ...)
{
  return [a1 sqliteErrorHandler];
}

id objc_msgSend_sqliteStatement(void *a1, const char *a2, ...)
{
  return [a1 sqliteStatement];
}

id objc_msgSend_stagingPath(void *a1, const char *a2, ...)
{
  return [a1 stagingPath];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startLibraries(void *a1, const char *a2, ...)
{
  return [a1 startLibraries];
}

id objc_msgSend_storage(void *a1, const char *a2, ...)
{
  return [a1 storage];
}

id objc_msgSend_storageID(void *a1, const char *a2, ...)
{
  return [a1 storageID];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_translatedError(void *a1, const char *a2, ...)
{
  return [a1 translatedError];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userVersion(void *a1, const char *a2, ...)
{
  return [a1 userVersion];
}

id objc_msgSend_validateLibrary(void *a1, const char *a2, ...)
{
  return [a1 validateLibrary];
}

id objc_msgSend_volDirFd(void *a1, const char *a2, ...)
{
  return [a1 volDirFd];
}

id objc_msgSend_volumeUUID(void *a1, const char *a2, ...)
{
  return [a1 volumeUUID];
}

id objc_msgSend_waitUntilDeviceIsUnlocked(void *a1, const char *a2, ...)
{
  return [a1 waitUntilDeviceIsUnlocked];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:");
}