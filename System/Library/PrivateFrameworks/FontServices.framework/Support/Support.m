void sub_100004B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100004B78(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"com.apple.Preferences"];
}

id sub_100004C8C(void *a1)
{
  id v1 = a1;
  v2 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = v1;
  id v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        id v12 = [v7 UTF8String];
        if (!sandbox_check_by_audit_token()
          || (v8 = (const char *)sandbox_extension_issue_file_to_process()) == 0
          || (+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v8, strlen(v8) + 1, 1, v12), (uint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          uint64_t v9 = objc_opt_new();
        }
        v10 = (void *)v9;
        objc_msgSend(v2, "setObject:forKey:", v9, v7, v12);
      }
      id v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  return v2;
}

void sub_100004E90(void *a1, void *a2)
{
  id v5 = a1;
  id v3 = a2;
  if (v5)
  {
    [v5 bytes];
    uint64_t v4 = sandbox_extension_consume();
    v3[2](v3);
    if (v4) {
      sandbox_extension_release();
    }
  }
  else
  {
    v3[2](v3);
  }
}

void sub_100004FE4(id a1)
{
  qword_10001DE18 = objc_opt_new();
  _objc_release_x1();
}

void sub_10000502C(id a1)
{
  uint64_t v1 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___FontServicesDaemonProtocol];
  v2 = (void *)qword_10001DE28;
  qword_10001DE28 = v1;

  uint64_t v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___FontServicesClientProtocol];
  uint64_t v4 = (void *)qword_10001DE30;
  qword_10001DE30 = v3;

  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, v7, v8, v9, objc_opt_class(), 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(id)qword_10001DE28 setClasses:v10 forSelector:"checkin:reply:" argumentIndex:0 ofReply:1];
}

id sub_100005168(uint64_t a1)
{
  return [*(id *)(a1 + 32) setClientConnection:0];
}

void sub_100005174(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    id v7 = [v6 mutableCopy];
    id v8 = v5;
    if (realpath_DARWIN_EXTSN((const char *)[v8 UTF8String], __s1))
    {
      if (!memcmp(__s1, "/private/var/mobile/Library/UserFonts/", 0x26uLL))
      {
        [v7 removeObjectForKey:@"disabled"];
        BOOL v13 = sub_10000EFD4(v8, v9) != 0;
        if (*(unsigned char *)(a1 + 80) && !*(unsigned char *)(a1 + 81) && !v13)
        {
          id v12 = __s1;
          if (sandbox_check_by_audit_token())
          {
            id v10 = (const char *)sandbox_extension_issue_file_to_process();
            if (!v10)
            {
              FSLog_Error();
              objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v8, __s1);
              goto LABEL_11;
            }
            v11 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v10, strlen(v10) + 1, 1, __s1);
            [v7 setObject:v11 forKey:@"data"];
          }
          else if (*(unsigned char *)(a1 + 80) && !*(unsigned char *)(a1 + 81))
          {
            goto LABEL_11;
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v8, v12);
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      [v8 UTF8String];
    }
    FSLog_Error();
    goto LABEL_11;
  }
LABEL_12:
}

void sub_100005AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005AE0(uint64_t a1, void *a2, void *a3, unsigned char *a4, unsigned char *a5)
{
  id v9 = a2;
  id v10 = a3;
  v11 = *(void **)(a1 + 32);
  if (!v11 || [v11 containsObject:v9])
  {
    id v12 = [v10 objectForKey:@"disabled"];
    unsigned __int8 v13 = [v12 BOOLValue];

    if ((v13 & 1) == 0)
    {
      if (*(unsigned char *)(a1 + 56))
      {
        uint64_t v14 = 1;
        goto LABEL_7;
      }
      if (*(unsigned char *)(a1 + 57))
      {
        long long v16 = *(void **)(a1 + 40);
        long long v17 = [v9 stringByDeletingLastPathComponent];
        v18 = [v17 lastPathComponent];
        LODWORD(v16) = [v16 isEqualToString:v18];

        if (v16)
        {
          uint64_t v14 = 1;
          *a4 = 1;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          goto LABEL_7;
        }
      }
      if (*(unsigned char *)(a1 + 58) && sub_10000EF5C(v9))
      {
        uint64_t v14 = 1;
        *a5 = 1;
        goto LABEL_7;
      }
    }
  }
  uint64_t v14 = 0;
LABEL_7:

  return v14;
}

void sub_100005C0C(uint64_t a1)
{
  v2 = objc_opt_new();
  int v3 = *(unsigned __int8 *)(a1 + 88);
  int v4 = *(unsigned __int8 *)(a1 + 89);
  if (*(unsigned char *)(a1 + 88))
  {
LABEL_4:
    uint64_t v5 = *(unsigned __int8 *)(a1 + 90);
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v31 = 0;
    long long v8 = *(_OWORD *)(a1 + 72);
    long long v29 = *(_OWORD *)(a1 + 56);
    long long v30 = v8;
    id v9 = [v6 fontInfoForAuditToken:&v29 withFontAccess:v5 enumuration:v3 != 0 installation:v4 != 0 identifier:v7 andFileFilters:0 foundFontDirectoryName:&v31];
    id v10 = v31;
    [v2 addEntriesFromDictionary:v9];

    if (*(unsigned char *)(a1 + 88)) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  if (*(unsigned char *)(a1 + 89))
  {
    int v4 = 1;
    goto LABEL_4;
  }
  id v10 = 0;
LABEL_7:
  if (*(unsigned char *)(a1 + 90) && *(void *)(a1 + 40))
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "issuedFontFilePathsForIdentifier:");
    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(unsigned __int8 *)(a1 + 88);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100005EBC;
    v27[3] = &unk_1000186F8;
    id v28 = v11;
    long long v14 = *(_OWORD *)(a1 + 72);
    long long v29 = *(_OWORD *)(a1 + 56);
    long long v30 = v14;
    id v15 = v11;
    long long v16 = [v12 filterUserFontInfoForAuditToken:&v29 withEnumerationCapability:v13 withFilter:v27];
    [v2 addEntriesFromDictionary:v16];
  }
LABEL_10:
  long long v17 = objc_opt_new();
  [v17 setObject:v2 forKey:@"fontsInfo"];
  if (*(unsigned char *)(a1 + 88))
  {
    v18 = *(void **)(a1 + 32);
    long long v19 = *(_OWORD *)(a1 + 72);
    long long v29 = *(_OWORD *)(a1 + 56);
    long long v30 = v19;
    v20 = [v18 sandboxExtensionForEnumeration:&v29];
    if (v20) {
      [v17 setObject:v20 forKey:@"extension"];
    }
    v21 = *(void **)(a1 + 32);
    long long v22 = *(_OWORD *)(a1 + 72);
    long long v29 = *(_OWORD *)(a1 + 56);
    long long v30 = v22;
    v23 = [v21 sandboxExtensionForFontAssets:&v29];

    if (!v23)
    {
LABEL_19:
      if (*(unsigned char *)(a1 + 88)) {
        goto LABEL_24;
      }
      goto LABEL_22;
    }
    CFStringRef v24 = @"extension.fontasset";
LABEL_18:
    [v17 setObject:v23 forKey:v24];
    goto LABEL_19;
  }
  if (v10)
  {
    v25 = *(void **)(a1 + 32);
    long long v26 = *(_OWORD *)(a1 + 72);
    long long v29 = *(_OWORD *)(a1 + 56);
    long long v30 = v26;
    v23 = [v25 sandboxExtensionForProvider:&v29 withDirectoryName:v10];
    if (!v23) {
      goto LABEL_19;
    }
    CFStringRef v24 = @"extension.provider";
    goto LABEL_18;
  }
  v23 = 0;
LABEL_22:
  if (!*(unsigned char *)(a1 + 90)) {
    [v17 setObject:&__kCFBooleanTrue forKey:@"hide-profilefonts"];
  }
LABEL_24:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_100005EBC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  if ([*(id *)(a1 + 32) containsObject:v7])
  {
    uint64_t v8 = 1;
  }
  else if (sub_10000EF5C(v7))
  {
    uint64_t v8 = 1;
    *a5 = 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t sub_100005F2C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005F3C(uint64_t a1)
{
}

uint64_t sub_100005F44(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (sub_10000EF5C(v6))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [v7 objectForKeyedSubscript:@"familyFaces"];
    id v9 = [v8 allKeys];

    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          if ([*(id *)(*((void *)&v16 + 1) + 8 * (void)v13) hasPrefix:@"PingFang "])
          {
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
            FSLog_Debug();
            uint64_t v14 = 1;
            goto LABEL_13;
          }
          uint64_t v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    uint64_t v14 = 0;
LABEL_13:
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

void sub_100006258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000627C(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  id v6 = [v9 objectForKey:@"familyName"];
  id v7 = [v6 objectForKey:a1[4]];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v7);
    uint64_t v8 = [v9 objectForKey:@"disabled"];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v8 BOOLValue] ^ 1;

    *a4 = 1;
  }
}

void sub_100006468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10000648C(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v10 = a3;
  id v6 = [v10 objectForKey:@"familyName"];
  id v7 = [v6 allValues];
  unsigned int v8 = [v7 containsObject:a1[4]];

  if (v8)
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    uint64_t v9 = [v10 objectForKey:@"disabled"];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v9 BOOLValue] ^ 1;

    *a4 = 1;
  }
}

uint64_t sub_1000069A4(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  uint64_t v5 = [a3 objectForKey:@"familyName"];
  id v6 = [v5 allValues];
  unsigned int v7 = [v6 containsObject:*(void *)(a1 + 32)];

  if (v7)
  {
    unsigned int v8 = [*(id *)(a1 + 40) identifierFromFilePath:v10];
    if (v8) {
      [*(id *)(a1 + 48) addObject:v8];
    }
  }
  return _objc_release_x2();
}

void sub_100006BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006BE0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 objectForKey:@"familyName"];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100006CD8;
  v12[3] = &unk_1000187C0;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v13 = v7;
  uint64_t v14 = v8;
  id v15 = v5;
  long long v11 = *(_OWORD *)(a1 + 48);
  id v9 = (id)v11;
  long long v16 = v11;
  id v10 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];
}

uint64_t sub_100006CD8(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  a3;
  if ([*(id *)(a1 + 32) isEqualToString:a2])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
    uint64_t v8 = [*(id *)(a1 + 40) identifierFromFilePath:*(void *)(a1 + 48)];
    if (v8) {
      [*(id *)(a1 + 56) addObject:v8];
    }
    *a4 = 1;
  }
  return _objc_release_x1();
}

void sub_100007028(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  int v4 = [v6 objectForKeyedSubscript:@"providers"];
  id v5 = [v4 allObjects];
  [v6 setObject:v5 forKeyedSubscript:@"providers"];

  [*(id *)(a1 + 32) addObject:v6];
}

void sub_100008270(id a1)
{
  qword_10001DE48 = (uint64_t)dispatch_semaphore_create(1);
  _objc_release_x1();
}

void sub_1000082A8(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    v2 = *(void **)(a1 + 40);
    int v3 = [*(id *)(a1 + 32) allKeys];
    [v2 warnAboutSuspendedFontProviders:v3];
  }
  sleep(1u);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100018850);
}

void sub_10000831C(id a1)
{
}

void sub_100008338(uint64_t a1)
{
  id v43 = 0;
  v44[0] = 0;
  v2 = [*(id *)(a1 + 32) unknownFontNamesAndEnabledFamilyNames:v44 andDisabledFamilyNames:&v43 fromRequests:*(void *)(a1 + 40)];
  id v3 = v44[0];
  id v4 = v43;
  id v5 = +[NSSet setWithArray:v3];
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 124);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100008678;
  v41[3] = &unk_1000186F8;
  id v8 = v5;
  id v42 = v8;
  long long v9 = *(_OWORD *)(a1 + 104);
  v40[0] = *(_OWORD *)(a1 + 88);
  v40[1] = v9;
  id v10 = [v6 filterUserFontInfoForAuditToken:v40 withEnumerationCapability:v7 withFilter:v41];
  id v11 = [v2 count];
  id v12 = [v4 count];
  id v13 = [v8 count];
  [*(id *)(a1 + 32) analyticsEventRequestFonts:*(void *)(a1 + 48) misses:v11 suggestions:v12 resolved:v13];
  if ([v2 count] || objc_msgSend(v4, "count"))
  {
    id v28 = [*(id *)(a1 + 32) missingFontsDialogRequestsFromUnknownFontNames:v2];
    [*(id *)(a1 + 32) missingFontsDialogRequestsFromDisabledFamilyNames:v4];
    uint64_t v14 = v30 = v4;
    v27 = *(void **)(a1 + 32);
    id v15 = [v28 arrayByAddingObjectsFromArray:v14];
    unsigned int v26 = *(_DWORD *)(a1 + 120);
    id v29 = v13;
    long long v16 = v2;
    uint64_t v17 = *(void *)(a1 + 56);
    uint64_t v18 = *(void *)(a1 + 64);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100008740;
    v31[3] = &unk_1000188C8;
    id v19 = v10;
    uint64_t v20 = *(void *)(a1 + 32);
    id v32 = v19;
    uint64_t v33 = v20;
    long long v21 = *(_OWORD *)(a1 + 104);
    long long v37 = *(_OWORD *)(a1 + 88);
    long long v38 = v21;
    char v39 = *(unsigned char *)(a1 + 124);
    id v35 = *(id *)(a1 + 72);
    id v34 = *(id *)(a1 + 48);
    id v36 = *(id *)(a1 + 80);
    uint64_t v22 = v18;
    v2 = v16;
    id v13 = v29;
    [v27 showDialog:v15 forPID:v26 sceneID:v17 appID:v22 completionHandler:v31];

    id v4 = v30;
    uint64_t v23 = 1;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    CFStringRef v24 = *(void **)(a1 + 32);
    v25 = [v10 allKeys];
    [v24 recordIssuedFontPaths:v25 forIdentifier:*(void *)(a1 + 48)];

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    uint64_t v23 = 0;
  }
  [*(id *)(a1 + 32) recordRequestFontsResultWihtMissed:v23 andResolved:v13 != 0];
}

id sub_100008678(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"disabled"];
  if ([v5 BOOLValue])
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = [v4 objectForKey:@"familyName"];
    long long v9 = [v8 allValues];
    id v10 = +[NSSet setWithArray:v9];
    id v6 = [v7 intersectsSet:v10];
  }
  return v6;
}

void sub_100008740(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSMutableArray arrayWithCapacity:0];
  id v5 = [*(id *)(a1 + 32) mutableCopy];
  if ([v3 count])
  {
    CFStringRef v24 = v4;
    uint64_t v25 = a1;
    id v6 = +[NSMutableSet setWithCapacity:0];
    uint64_t v7 = +[NSMutableDictionary dictionaryWithCapacity:0];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v26 = v3;
    id v8 = v3;
    id v9 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v34;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v14 = [v13 objectForKey:@"uniqueID"];
          if (v14)
          {
            [v6 addObject:v14];
            id v15 = [v13 objectForKey:@"installProvider"];
            if (v15) {
              [v7 setObject:v15 forKey:v14];
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v10);
    }

    id v4 = v24;
    a1 = v25;
    long long v16 = *(void **)(v25 + 40);
    uint64_t v17 = *(unsigned __int8 *)(v25 + 104);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100008A60;
    v28[3] = &unk_1000188A0;
    id v29 = v6;
    id v30 = v16;
    id v31 = v7;
    id v32 = v24;
    long long v18 = *(_OWORD *)(v25 + 88);
    v27[0] = *(_OWORD *)(v25 + 72);
    v27[1] = v18;
    id v19 = v7;
    id v20 = v6;
    long long v21 = [v16 filterUserFontInfoForAuditToken:v27 withEnumerationCapability:v17 withFilter:v28];
    [v5 addEntriesFromDictionary:v21];

    id v3 = v26;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if ([v4 count])
  {
    +[FSUserFontManager enableOrDisablePersistentURLs:v4 enabled:1];
    [*(id *)(a1 + 40) invalidateUserFonts];
  }
  uint64_t v22 = *(void **)(a1 + 40);
  uint64_t v23 = [v5 allKeys];
  [v22 recordIssuedFontPaths:v23 forIdentifier:*(void *)(a1 + 48)];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

uint64_t sub_100008A60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 objectForKey:@"disabled"];
  unsigned int v8 = [v7 BOOLValue];

  if (v8)
  {
    id v9 = [v6 objectForKey:@"familyName"];
    id v10 = [v9 allValues];

    uint64_t v11 = *(void **)(a1 + 32);
    id v12 = +[NSSet setWithArray:v10];
    LODWORD(v11) = [v11 intersectsSet:v12];

    if (v11)
    {
      id v13 = [*(id *)(a1 + 40) identifierFromFilePath:v5];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v14 = v10;
      id v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v25 = v10;
        uint64_t v17 = *(void *)v27;
        while (2)
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v27 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = [*(id *)(a1 + 48) objectForKey:*(void *)(*((void *)&v26 + 1) + 8 * i)];
            unsigned int v20 = [v19 isEqualToString:v13];

            if (v20)
            {
              uint64_t v22 = *(void **)(a1 + 56);
              uint64_t v23 = +[NSURL fileURLWithPath:v5 isDirectory:0];
              [v22 addObject:v23];

              uint64_t v21 = 1;
              goto LABEL_15;
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v16) {
            continue;
          }
          break;
        }
        uint64_t v21 = 0;
LABEL_15:
        id v10 = v25;
      }
      else
      {
        uint64_t v21 = 0;
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

void sub_100008FA8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_100008FCC(id a1)
{
}

void sub_100008FEC(id a1, NSError *a2)
{
}

id sub_100009024(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 objectForKey:@"familyName"];
  id v5 = [v4 containsObject:*(void *)(a1 + 32)];

  return v5;
}

uint64_t sub_100009074(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

void sub_100009B94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  objc_destroyWeak(v39);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_100009C14(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = *(void **)(a1 + 32);
  id v13 = v6;
  unsigned int v8 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  if ([v7 isEqualToString:v8])
  {
    id v9 = [v13 objectForKeyedSubscript:*(void *)(a1 + 48)];
    unsigned int v10 = [v9 BOOLValue];
    int v11 = *(unsigned __int8 *)(a1 + 64);

    id v12 = v13;
    if (v11 == v10)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  else
  {

    id v12 = v13;
  }
}

void sub_100009CDC(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = [v4 elements];
    id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v21;
      uint64_t v10 = SBSDisplayLayoutElementHomeScreenIdentifier;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          id v12 = [*(id *)(*((void *)&v20 + 1) + 8 * i) identifier];
          unsigned int v13 = [v12 isEqualToString:v10];

          if (v13)
          {
            id v14 = [WeakRetained subscriptionSupportQueue];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100009EE4;
            block[3] = &unk_100018A30;
            block[4] = WeakRetained;
            id v16 = a1[4];
            id v17 = a1[5];
            id v18 = a1[6];
            id v19 = a1[7];
            dispatch_async(v14, block);

            goto LABEL_12;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

id sub_100009EE4(uint64_t a1)
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = (id)qword_10001DE58;
  id v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v6);
        id v8 = [*(id *)(a1 + 32) subscriptionSupportQueue];
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_10000A0B0;
        v11[3] = &unk_100018A08;
        uint64_t v9 = *(void **)(a1 + 40);
        v11[4] = *(void *)(a1 + 32);
        v11[5] = v7;
        id v12 = v9;
        id v13 = *(id *)(a1 + 48);
        id v14 = *(id *)(a1 + 56);
        id v15 = *(id *)(a1 + 64);
        dispatch_async(v8, v11);

        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  return [(id)qword_10001DE58 removeAllObjects];
}

void sub_10000A0B0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)];
  id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 56)];
  id v4 = [v3 BOOLValue];
  uint64_t v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 64)];
  id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 72)];
  [v2 warnAboutSuspendedFontProvider:v7 forExpiration:v4 date:v5 withURLSchem:v6 immediately:0];
}

void sub_10000A22C(uint64_t a1)
{
  id v4 = +[FSUserFontManager resumeSuspendedFontFiles];
  if ([v4 count])
  {
    id v2 = *(void **)(a1 + 32);
    id v3 = [v4 allKeys];
    [v2 warnAboutSuspendedFontProviders:v3];
  }
}

void sub_10000A36C(id a1)
{
  qword_10001DE60 = (uint64_t)dispatch_queue_create("com.apple.fontservices.UpdatingUserFonts", 0);
  _objc_release_x1();
}

uint64_t sub_10000A3AC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000A63C(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = dispatch_queue_create("com.apple.fontservicesd.subscriptionSupport", 0);
  return _objc_release_x1();
}

uint64_t sub_10000A730(uint64_t a1)
{
  id v2 = +[FSUserFontManager knownFontProviders];
  id v3 = [v2 count];

  uint64_t v24 = 0;
  uint64_t v25 = 0;
  [*(id *)(a1 + 32) extractRequestFontsMissed:&v25 andResolved:&v24];
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v21 = 0;
  if (v3)
  {
    id v4 = +[FSUserFontManager fontProvidersSubscriptionSupportInfoAndFontFamiliesInstalled:&v23 andRemovedCount:&v22 andProfileFontsCount:&v21];
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x3032000000;
    long long v18 = sub_100005F2C;
    long long v19 = sub_100005F3C;
    id v20 = 0;
    [v4 count];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000AAA8;
    v14[3] = &unk_100018AF0;
    v14[4] = *(void *)(a1 + 32);
    v14[5] = &v15;
    [v4 enumerateKeysAndObjectsUsingBlock:v14];
    if ([(id)v16[5] count])
    {
      v26[0] = FBSOpenApplicationOptionKeyActivateSuspended;
      v26[1] = FBSOpenApplicationOptionKeyLaunchIntent;
      v27[0] = &__kCFBooleanTrue;
      v27[1] = &off_10001A398;
      uint64_t v5 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
      id v6 = +[FBSOpenApplicationOptions optionsWithDictionary:v5];
      id v7 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
      char v8 = 1;
      do
      {
        char v9 = v8;
        if (![(id)v16[5] count]) {
          break;
        }
        uint32_t v10 = arc4random();
        uint64_t v11 = (int)(v10 % (unint64_t)[(id)v16[5] count]);
        id v12 = [(id)v16[5] objectAtIndex:v11];
        [(id)v16[5] removeObjectAtIndex:v11];
        [v7 openApplication:v12 withOptions:v6 completion:0];

        char v8 = 0;
      }
      while ((v9 & 1) != 0);
    }
    _Block_object_dispose(&v15, 8);
  }
  atomic_fetch_add_explicit(dword_10001DE78, 0xFFFFFFFF, memory_order_relaxed);
  [*(id *)(a1 + 32) countFontAssets];
  return AnalyticsSendEventLazy();
}

void sub_10000AA70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

void sub_10000AAA8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 objectForKey:@"url"];

  if (v7)
  {
    char v8 = [v6 objectForKey:@"elapsed"];
    [v8 doubleValue];
    double v10 = v9;

    uint64_t v11 = [v6 objectForKey:@"expire"];
    [v11 doubleValue];
    double v13 = v12;

    id v14 = [v6 objectForKey:@"warn"];
    [v14 doubleValue];
    double v16 = v15;

    if (v16 < 21.0)
    {
      NSLog(@"FontProvider subscription info \"%@\"(%d) should not be shorter than %d.  It's adjusted.", @"warn", (int)v16, 21);
      double v16 = 21.0;
    }
    double v17 = v10 / 1440.0;
    if (v16 + 2.0 > v13)
    {
      NSLog(@"FontProvider subscription info \"%@\"(%d) should not be shorter than %d.  It's adjusted.", @"expire", (int)v13, (int)(v16 + 2.0));
      double v13 = v16 + 2.0;
    }
    long long v18 = [v6 objectForKey:@"scheme"];
    long long v19 = [v6 objectForKey:@"lastAccessed"];
    id v20 = +[NSDate dateWithTimeInterval:v19 sinceDate:v13 * 60.0 * 1440.0];
    if (v17 >= v13)
    {
      NSLog(@"FontProvider %@ is expired.", v5);
      FSLog_Debug();
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10000AEA4;
      v31[3] = &unk_100018AC8;
      id v25 = v5;
      id v32 = v25;
      +[FSUserFontManager unregisterAndRemoveFontFilesForIdentifier:completionHandler:](FSUserFontManager, "unregisterAndRemoveFontFilesForIdentifier:completionHandler:", v25, v31, v5, *(void *)&v13, *(void *)&v17);
      [*(id *)(a1 + 32) warnAboutSuspendedFontProvider:v25 forExpiration:1 date:v20 withURLSchem:v18 immediately:0];
    }
    else if (v17 >= v16)
    {
      +[FSUserFontManager suspendFontProvider:v5];
      long long v26 = +[NSUserDefaults standardUserDefaults];
      long long v27 = [v26 dictionaryForKey:@"warned"];
      long long v28 = [v27 objectForKey:v5];
      unsigned __int8 v29 = [v28 BOOLValue];

      if ((v29 & 1) == 0)
      {
        if (v13 <= v16 || v17 <= v16 + (v13 - v16) * 0.5)
        {
          id v30 = [v6 objectForKey:@"url"];
          NSLog(@"FontProvider %@ hasn't run for %.1f %s (warn:%.1f)", v5, *(void *)&v17, "days", *(void *)&v16);
          [*(id *)(a1 + 32) recordSuspendedProvider:v5 url:v30 andScheme:v18 forDate:v20];
        }
        else
        {
          [*(id *)(a1 + 32) warnAboutSuspendedFontProvider:v5 forExpiration:0 date:v20 withURLSchem:v18 immediately:0];
        }
      }
    }
    else
    {
      [*(id *)(a1 + 32) resetWarnedForIdenntifier:v5];
    }
  }
  else
  {
    uint64_t v21 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v21)
    {
      uint64_t v22 = objc_opt_new();
      uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;

      uint64_t v21 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v21 addObject:v5];
  }
}

uint64_t sub_10000AEA4(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return FSLog_Error();
  }
  return result;
}

id sub_10000AEEC(void *a1)
{
  v15[0] = @"apps";
  id v14 = +[NSNumber numberWithUnsignedInteger:a1[4]];
  v16[0] = v14;
  v15[1] = @"apps_subscription";
  double v13 = +[NSNumber numberWithUnsignedInteger:a1[5]];
  v16[1] = v13;
  v15[2] = @"available";
  id v2 = +[NSNumber numberWithUnsignedInteger:a1[6]];
  v16[2] = v2;
  v15[3] = @"installed";
  id v3 = +[NSNumber numberWithUnsignedInteger:a1[7]];
  v16[3] = v3;
  v15[4] = @"uninstalled";
  id v4 = +[NSNumber numberWithUnsignedInteger:a1[8]];
  v16[4] = v4;
  v15[5] = @"misses";
  id v5 = +[NSNumber numberWithUnsignedInteger:a1[9]];
  v16[5] = v5;
  v15[6] = @"resolved";
  id v6 = +[NSNumber numberWithUnsignedInteger:a1[10]];
  v16[6] = v6;
  v15[7] = @"warn_subscription";
  id v7 = +[NSNumber numberWithUnsignedInteger:a1[11]];
  v16[7] = v7;
  v15[8] = @"delete_subscription";
  char v8 = +[NSNumber numberWithUnsignedInteger:a1[12]];
  v16[8] = v8;
  v15[9] = @"profiles";
  double v9 = +[NSNumber numberWithUnsignedInteger:a1[13]];
  v16[9] = v9;
  v15[10] = @"mobile";
  double v10 = +[NSNumber numberWithUnsignedInteger:a1[14]];
  v16[10] = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:11];

  return v11;
}

void sub_10000B2C0(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateUserFonts];
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"fontChanged" object:0 userInfo:*(void *)(a1 + 40)];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)FontProviderDidChangeDistributedNotification;
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v4, 0, 0, 0);
}

uint64_t sub_10000B588(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = dispatch_queue_create("com.apple.fontservicesd.scheduledFontDeletion", 0);
  return _objc_release_x1();
}

void sub_10000B6E4(uint64_t a1)
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 dictionaryForKey:@"delete"];
  id v4 = [v3 mutableCopy];

  if (!v4) {
    id v4 = (id)objc_opt_new();
  }
  LODWORD(v5) = *(_DWORD *)(a1 + 48);
  id v6 = +[NSDate dateWithTimeIntervalSinceNow:(double)v5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = *(id *)(a1 + 32);
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v7);
        }
        double v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((sub_10000EF50(v13, v9) & 1) != 0 || sub_10000EF5C(v13)) {
          objc_msgSend(v4, "setObject:forKey:", v6, v13, (void)v14);
        }
      }
      id v10 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [v2 setObject:v4 forKey:@"delete"];
  [v2 synchronize];
  CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
  [*(id *)(a1 + 40) setFontFilesDeletionTimer:*(unsigned int *)(a1 + 48)];
}

void sub_10000B948(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = v2[4];
  if (v3)
  {
    if (!*(_DWORD *)(a1 + 40))
    {
      dispatch_source_set_timer(v3, 0, 0xFFFFFFFFFFFFFFFFLL, 0xDF8475800uLL);
    }
  }
  else
  {
    id v4 = [v2 scheduledFontDeletionQueue];
    unint64_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);

    unint64_t v6 = *(unsigned int *)(a1 + 40);
    unint64_t v7 = v6 >> 2;
    dispatch_time_t v8 = dispatch_time(0, 1000000000 * (v6 + (v6 >> 2)));
    dispatch_source_set_timer(v5, v8, 0xFFFFFFFFFFFFFFFFLL, 1000000000 * v7);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000BAB4;
    v13[3] = &unk_100018878;
    v13[4] = *(void *)(a1 + 32);
    double v9 = v5;
    long long v14 = v9;
    dispatch_source_set_event_handler(v9, v13);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 32);
    *(void *)(v10 + 32) = v9;
    double v12 = v9;

    dispatch_resume(v12);
  }
}

id sub_10000BAB4(uint64_t a1)
{
  return [*(id *)(a1 + 32) executeScheduledFontFilesDeletion:*(void *)(a1 + 40)];
}

void sub_10000BB48(uint64_t a1)
{
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0;
  }
}

void sub_10000C69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

id sub_10000C6C8(uint64_t a1)
{
  id v2 = objc_opt_new();
  uint64_t v3 = [*(id *)(a1 + 32) mainHandlerQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000C7A8;
  v8[3] = &unk_100018878;
  id v9 = *(id *)(a1 + 40);
  id v4 = v2;
  id v10 = v4;
  dispatch_sync(v3, v8);

  unint64_t v5 = v10;
  id v6 = v4;

  return v6;
}

void sub_10000C7A8(uint64_t a1)
{
  id v2 = +[FSUserFontManager userFontsInfo];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000C860;
  v3[3] = &unk_100018B88;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void sub_10000C860(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (sub_10000EF5C(v8))
  {
    id v6 = [v8 stringByDeletingLastPathComponent];
    unint64_t v7 = [v6 lastPathComponent];

    if ([*(id *)(a1 + 32) containsObject:v7]) {
      [*(id *)(a1 + 40) setObject:v5 forKey:v8];
    }
  }
}

intptr_t sub_10000C90C(void *a1)
{
  uint64_t v2 = (*(void (**)(void))(a1[5] + 16))();
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = a1[4];
  return dispatch_semaphore_signal(v5);
}

void sub_10000CA1C(uint64_t a1)
{
  if (qword_10001DE88)
  {
    uint64_t v2 = [(id)qword_10001DE88 objectForKeyedSubscript:*(void *)(a1 + 32)];
    if (v2)
    {
      uint64_t v3 = (void *)v2;
      double v4 = os_variant_has_internal_content() ? 1200.0 : 86400.0;
      [v3 timeIntervalSinceNow];
      double v6 = -v5;

      if (v4 > v6) {
        return;
      }
    }
  }
  else
  {
    uint64_t v7 = objc_opt_new();
    id v8 = (void *)qword_10001DE88;
    qword_10001DE88 = v7;
  }
  if (!qword_10001DE90)
  {
    uint64_t v9 = objc_opt_new();
    id v10 = (void *)qword_10001DE90;
    qword_10001DE90 = v9;
  }
  uint64_t v18 = *(void *)(a1 + 32);
  FSLog_Debug();
  objc_msgSend((id)qword_10001DE90, "addObject:", *(void *)(a1 + 32), v18);
  uint64_t v11 = *(void **)(a1 + 40);
  if (!v11[5])
  {
    double v12 = [v11 assetHandlerQueue];
    double v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v12);

    dispatch_time_t v14 = dispatch_time(0, 600000000000);
    dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0x45D964B800uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000CC00;
    handler[3] = &unk_100018680;
    handler[4] = *(void *)(a1 + 40);
    dispatch_source_set_event_handler(v13, handler);
    uint64_t v15 = *(void *)(a1 + 40);
    long long v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v13;
    long long v17 = v13;

    dispatch_resume(v17);
  }
}

void sub_10000CC00(uint64_t a1)
{
  id v2 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.Font7"];
  [v2 returnTypes:1];
  if (![v2 queryMetaDataSync])
  {
    uint64_t v15 = a1;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v3 = [v2 results];
    id v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v17;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v9 = objc_msgSend(v8, "assetId", v14);
          if ([(id)qword_10001DE90 containsObject:v9])
          {
            id v10 = [v8 getLocalUrl];
            uint64_t v11 = +[NSDate now];
            [(id)qword_10001DE88 setObject:v11 forKeyedSubscript:v9];

            dispatch_time_t v14 = v9;
            FSLog_Debug();
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v5);
    }

    a1 = v15;
  }
  objc_msgSend((id)qword_10001DE90, "removeAllObjects", v14);
  uint64_t v12 = *(void *)(a1 + 32);
  double v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;
}

void sub_10000CF2C(uint64_t a1)
{
  +[FSUserFontManager knownFontProviders];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v1 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v1)
  {
    id v2 = v1;
    uint64_t v3 = *(void *)v38;
    do
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v38 != v3) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        id v6 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v5 allowPlaceholder:0 error:0];
        if (!v6)
        {
          FSLog_Debug();
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472;
          v36[2] = sub_10000D350;
          v36[3] = &unk_100018AC8;
          v36[4] = v5;
          +[FSUserFontManager unregisterAndRemoveFontFilesForIdentifier:completionHandler:](FSUserFontManager, "unregisterAndRemoveFontFilesForIdentifier:completionHandler:", v5, v36, v5);
        }
      }
      id v2 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v2);
  }
  uint64_t v7 = +[NSUserDefaults standardUserDefaults];
  id v8 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v42[0] = @"issues";
  v42[1] = @"suspended";
  v42[2] = @"warned";
  uint64_t v9 = +[NSArray arrayWithObjects:v42 count:3];
  id v10 = [v9 countByEnumeratingWithState:&v32 objects:v43 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        dispatch_time_t v14 = [v7 dictionaryForKey:*(void *)(*((void *)&v32 + 1) + 8 * (void)j)];
        uint64_t v15 = v14;
        if (v14)
        {
          long long v16 = [v14 allKeys];
          [v8 addObjectsFromArray:v16];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v32 objects:v43 count:16];
    }
    while (v11);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v17 = [v8 allObjects];
  id v18 = [v17 countByEnumeratingWithState:&v28 objects:v41 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (k = 0; k != v19; k = (char *)k + 1)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v28 + 1) + 8 * (void)k);
        id v23 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v22 allowPlaceholder:0 error:0];
        if (!v23)
        {
          FSLog_Debug();
          uint64_t v24 = objc_msgSend(*(id *)(a1 + 32), "mainHandlerQueue", v22);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10000D398;
          block[3] = &unk_100018878;
          block[4] = *(void *)(a1 + 32);
          void block[5] = v22;
          dispatch_async(v24, block);
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v28 objects:v41 count:16];
    }
    while (v19);
  }
}

uint64_t sub_10000D350(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return FSLog_Error();
  }
  return result;
}

id sub_10000D398(uint64_t a1)
{
  return [*(id *)(a1 + 32) forgetClientApplication:*(void *)(a1 + 40)];
}

void sub_10000D49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D4B4(uint64_t a1)
{
  id v2 = +[NSString stringWithFormat:@"/var/mobile/%@", @"Library/UserFonts/UserFonts.plist"];
  if (v2)
  {
    uint64_t v3 = +[NSFileManager defaultManager];
    unsigned int v4 = [v3 fileExistsAtPath:v2];

    if (v4)
    {
      uint64_t v5 = +[NSURL fileURLWithPath:v2 isDirectory:0];
      id v6 = +[NSInputStream inputStreamWithURL:v5];

      [v6 open];
      uint64_t v11 = 0;
      uint64_t v7 = +[NSPropertyListSerialization propertyListWithStream:v6 options:1 format:0 error:&v11];
      uint64_t v8 = v11;
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v7;

      [v6 close];
      if (v8) {
        FSLog_Error();
      }
    }
  }
}

id sub_10000D694(void *a1)
{
  uint64_t v2 = a1[5];
  v9[0] = a1[4];
  v8[0] = @"name";
  v8[1] = @"misses";
  uint64_t v3 = +[NSNumber numberWithUnsignedInteger:v2];
  v9[1] = v3;
  v8[2] = @"suggestions";
  unsigned int v4 = +[NSNumber numberWithUnsignedInteger:a1[6]];
  v9[2] = v4;
  v8[3] = @"resolved";
  uint64_t v5 = +[NSNumber numberWithUnsignedInteger:a1[7]];
  v9[3] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

OS_dispatch_queue *__cdecl sub_10000D7D8(FontServicesDaemon *self, SEL a2)
{
  return self->_assetHandlerQueue;
}

void sub_10000DD78(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = +[NSXPCConnection currentConnection];
  unsigned int v4 = v3;
  if (v3) {
    [v3 auditToken];
  }
  else {
    memset(v15, 0, sizeof(v15));
  }
  uint64_t v5 = [v2 filterUserFontInfoForAuditToken:v15 withEnumerationCapability:1 withFilter:&stru_100018C68];

  id v6 = objc_opt_new();
  [v6 setObject:v5 forKey:@"fontsInfo"];
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 24);
  long long v8 = *(_OWORD *)(a1 + 64);
  long long v13 = *(_OWORD *)(a1 + 48);
  long long v14 = v8;
  uint64_t v9 = [v7 sandboxExtensionForEnumeration:&v13];
  if (v9) {
    [v6 setObject:v9 forKey:@"extension"];
  }
  id v10 = *(void **)(*(void *)(a1 + 32) + 24);
  long long v11 = *(_OWORD *)(a1 + 64);
  long long v13 = *(_OWORD *)(a1 + 48);
  long long v14 = v11;
  uint64_t v12 = [v10 sandboxExtensionForFontAssets:&v13];

  if (v12) {
    [v6 setObject:v12 forKey:@"extension.fontasset"];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

BOOL sub_10000DED0(id a1, NSString *a2, NSDictionary *a3, BOOL *a4, BOOL *a5)
{
  uint64_t v5 = [(NSDictionary *)a3 objectForKey:@"disabled", a4, a5];
  char v6 = [v5 BOOLValue] ^ 1;

  return v6;
}

void sub_10000E5BC(id a1, NSError *a2)
{
}

void sub_10000E5F0(id a1, NSError *a2)
{
}

void sub_10000E624(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v6]) {
    [*(id *)(a1 + 40) setObject:v5 forKey:v6];
  }
}

void sub_10000E9EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 136));
  _Unwind_Resume(a1);
}

void sub_10000EA18(uint64_t a1)
{
  NSLog(@"FSWebKit checkinForWebKitProcess connection invalidationHandler.");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = [*(id *)(a1 + 32) webcontentProcessConnections];
    [v2 removeObject:WeakRetained];
  }
}

void sub_10000EA8C(id a1)
{
}

void sub_10000EAAC(id a1, NSError *a2)
{
}

void sub_10000EAE0(uint64_t a1)
{
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v2 = +[NSXPCConnection currentConnection];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 auditToken];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
  }

  unsigned int v4 = [*(id *)(a1 + 32) server];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 96);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 97);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 98);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000EC20;
  v12[3] = &unk_100018D60;
  uint64_t v8 = *(void *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  v11[0] = v15;
  v11[1] = v16;
  long long v9 = *(_OWORD *)(a1 + 80);
  v10[0] = *(_OWORD *)(a1 + 64);
  v10[1] = v9;
  [v4 setupUserInstalledFontsFor:v11 withCapabilitiesFor:v10 hasEnumeration:v5 hasFontAccess:v6 isFontProvider:v7 processIdentifier:v8 options:0 compat:0 reply:v12];
}

void sub_10000EC20(uint64_t a1, uint64_t a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000ECB0;
  v4[3] = &unk_100018AA0;
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v3 userInstalledFontsInfo:a2 reply:v4];
}

uint64_t sub_10000ECB0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

NSURL *sub_10000ED6C()
{
  return +[NSURL fileURLWithPath:@"/var/mobile/Library/UserFonts/FontFiles/"];
}

NSURL *sub_10000ED80()
{
  return +[NSURL fileURLWithPath:@"/var/mobile/Library/UserFonts/FontAssets/"];
}

id sub_10000ED94()
{
  if (qword_10001DEA0 != -1) {
    dispatch_once(&qword_10001DEA0, &stru_100018DD0);
  }
  v0 = (void *)qword_10001DE98;
  return v0;
}

void sub_10000EDE8(id a1)
{
  id v4 = +[NSURL fileURLWithPath:@"/var/mobile/Library/UserFonts/FontFiles/"];
  id v1 = [v4 path];
  uint64_t v2 = [v1 stringByAppendingString:@"/"];
  uint64_t v3 = (void *)qword_10001DE98;
  qword_10001DE98 = v2;
}

id sub_10000EE6C()
{
  if (qword_10001DEB0 != -1) {
    dispatch_once(&qword_10001DEB0, &stru_100018DF0);
  }
  v0 = (void *)qword_10001DEA8;
  return v0;
}

void sub_10000EEC0(id a1)
{
  id v4 = +[NSURL fileURLWithPath:@"/var/mobile/Library/UserFonts/FontAssets/"];
  id v1 = [v4 path];
  uint64_t v2 = [v1 stringByAppendingString:@"/"];
  uint64_t v3 = (void *)qword_10001DEA8;
  qword_10001DEA8 = v2;
}

CFStringRef sub_10000EF44()
{
  return @"/private/var/MobileAsset/AssetsV2/com_apple_MobileAsset_Font7/";
}

id sub_10000EF50(void *a1, const char *a2)
{
  return [a1 hasPrefix:@"/var/mobile/Library/UserFonts/FontFiles/"];
}

id sub_10000EF5C(void *a1)
{
  id v1 = a1;
  if ([v1 hasPrefix:@"/private/"])
  {
    uint64_t v2 = [v1 substringFromIndex:8];

    id v1 = (id)v2;
  }
  id v3 = [v1 hasPrefix:@"/var/mobile/Library/UserFonts/FontAssets/"];

  return v3;
}

id sub_10000EFC8(void *a1, const char *a2)
{
  return [a1 hasPrefix:@"/var/mobile/Library/Fonts/Managed/"];
}

id sub_10000EFD4(void *a1, const char *a2)
{
  return [a1 hasPrefix:@"/private/var/MobileAsset/AssetsV2/com_apple_MobileAsset_Font7/"];
}

void sub_10000EFE0()
{
  v0 = (objc_class *)sub_10000F098();
  if (v0 && (byte_10001DEB8 & 1) == 0)
  {
    id v2 = [[v0 alloc] initWithType:@"com.apple.MobileAsset.Font7"];
    [v2 setDoNotBlockBeforeFirstUnlock:1];
    [v2 setDoNotBlockOnNetworkStatus:1];
    [v2 returnTypes:1];
    [v2 queryMetaDataSync];
    id v1 = [v2 results];
    [v1 enumerateObjectsUsingBlock:&stru_100018E30];
  }
}

id sub_10000F098()
{
  if (qword_10001DEC0 != -1) {
    dispatch_once(&qword_10001DEC0, &stru_100018F00);
  }
  v0 = (void *)qword_10001DEC8;
  return v0;
}

void sub_10000F0EC(id a1, MAAsset *a2, unint64_t a3, BOOL *a4)
{
  uint64_t v6 = a2;
  if ([(MAAsset *)v6 state] == (id)2)
  {
    id v5 = [(MAAsset *)v6 getLocalFileUrl];

    if (v5)
    {
      byte_10001DEB8 = 1;
      *a4 = 1;
    }
  }
}

void sub_10000F164(void *a1)
{
  id v1 = a1;
  id v2 = (objc_class *)sub_10000F098();
  if (v2 && (byte_10001DEB9 & 1) == 0)
  {
    id v3 = [[v2 alloc] initWithType:@"com.apple.MobileAsset.Font7"];
    [v3 setDoNotBlockBeforeFirstUnlock:1];
    [v3 setDoNotBlockOnNetworkStatus:1];
    [v3 returnTypes:1];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000F264;
    v5[3] = &unk_100018E78;
    id v6 = v3;
    uint64_t v7 = v1;
    id v4 = v3;
    [v4 queryMetaDataWithError:v5];
  }
  else
  {
    v1[2](v1);
  }
}

uint64_t sub_10000F264(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) results];
  [v2 enumerateObjectsUsingBlock:&stru_100018E50];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void sub_10000F2C0(id a1, MAAsset *a2, unint64_t a3, BOOL *a4)
{
  id v6 = a2;
  if ([(MAAsset *)v6 state] == (id)2)
  {
    id v5 = [(MAAsset *)v6 getLocalFileUrl];

    if (v5)
    {
      byte_10001DEB9 = 1;
      *a4 = 1;
    }
  }
}

void sub_10000F338(void *a1)
{
  id v1 = a1;
  id v2 = (objc_class *)sub_10000F098();
  if (v2)
  {
    id v3 = [[v2 alloc] initWithType:@"com.apple.MobileAsset.Font7"];
    [v3 setDoNotBlockBeforeFirstUnlock:1];
    [v3 setDoNotBlockOnNetworkStatus:1];
    [v3 returnTypes:2];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000F418;
    v5[3] = &unk_100018E78;
    id v6 = v3;
    id v7 = v1;
    id v4 = v3;
    [v4 queryMetaDataWithError:v5];
  }
}

void sub_10000F418(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) results];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000F4B8;
  v3[3] = &unk_100018EE0;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v3];
}

void sub_10000F4B8(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 state] == (id)2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [v5 attributes];
    LODWORD(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    if (v3) {
      [v5 purge:&stru_100018EB8];
    }
  }
}

void sub_10000F550(id a1)
{
  if (dlopen("/System/Library/PrivateFrameworks/MobileAsset.framework/MobileAsset", 1)) {
    qword_10001DEC8 = (uint64_t)NSClassFromString(@"MAAssetQuery");
  }
}

void sub_10000F64C(uint64_t a1, void *a2)
{
  id v3 = a2;
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  if (string)
  {
    id v5 = string;
    if (!strcmp(string, "com.apple.LaunchServices.applicationUnregistered"))
    {
      id v6 = xpc_dictionary_get_value(v3, "UserInfo");
      id v7 = v6;
      if (v6 && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_dictionary)
      {
        long long v17 = (void *)_CFXPCCreateCFObjectFromXPCObject();
        uint64_t v8 = [v17 objectForKey:@"bundleIDs"];
        dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id obj = v8;
        id v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v23;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(obj);
              }
              uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
              v20[0] = _NSConcreteStackBlock;
              v20[1] = 3221225472;
              v20[2] = sub_10000F910;
              v20[3] = &unk_100018F28;
              v20[4] = v14;
              long long v15 = v9;
              uint64_t v21 = v15;
              +[FSUserFontManager unregisterAndRemoveFontFilesForIdentifier:v14 completionHandler:v20];
              dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
              long long v16 = [*(id *)(a1 + 32) mainHandlerQueue];
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_10000F970;
              block[3] = &unk_100018878;
              block[4] = *(void *)(a1 + 32);
              void block[5] = v14;
              dispatch_async(v16, block);
            }
            id v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v11);
        }

        [*(id *)(a1 + 32) synchronizeFontProviders];
      }
    }
    else if (!strcmp(v5, "FontServicesDaemonCheckSubscriptionNotification"))
    {
      [*(id *)(a1 + 32) subscriptionSupportTimerHandler];
    }
  }
}

intptr_t sub_10000F910(uint64_t a1, uint64_t a2)
{
  if (a2) {
    FSLog_Debug();
  }
  id v3 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v3);
}

id sub_10000F970(uint64_t a1)
{
  return [*(id *)(a1 + 32) forgetClientApplication:*(void *)(a1 + 40)];
}

void sub_10000F9D0(id a1)
{
  qword_10001DED8 = (uint64_t)dispatch_queue_create("com.apple.fontservicesd.assetHandler", 0);
  _objc_release_x1();
}

void sub_10000FB4C(uint64_t a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  if (string)
  {
    id v4 = string;
    if (!strcmp(string, "com.apple.MobileAsset.Font7.ma.cached-metadata-updated"))
    {
      id v6 = [*(id *)(a1 + 32) assetHandlerQueue];
      dispatch_async(v6, &stru_100018F90);
    }
    else if (!strcmp(v4, "com.apple.MobileAsset.CoreTextAssets.ma.new-asset-installed") {
           || !strcmp(v4, "com.apple.MobileAsset.CoreTextAssets.ma.cached-metadata-updated"))
    }
    {
      id v5 = [*(id *)(a1 + 32) assetHandlerQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000FF0C;
      block[3] = &unk_100018680;
      block[4] = *(void *)(a1 + 32);
      dispatch_async(v5, block);
    }
  }
}

void sub_10000FC74(id a1)
{
  id v1 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.Font7"];
  [v1 returnTypes:6];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000FD24;
  v3[3] = &unk_100018FE0;
  id v4 = v1;
  id v2 = v1;
  [v2 queryMetaData:v3];
}

void sub_10000FD24(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v2 = [*(id *)(a1 + 32) results];
    id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v13;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v13 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v7 state] == (id)3)
          {
            uint64_t v8 = [v7 assetId];
            v10[0] = _NSConcreteStackBlock;
            v10[1] = 3221225472;
            _OWORD v10[2] = sub_10000FEB0;
            v10[3] = &unk_100018FB8;
            id v11 = v8;
            id v9 = v8;
            [v7 purgeWithError:v10];
          }
        }
        id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v4);
    }
  }
}

uint64_t sub_10000FEB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return FSLog_Error();
  }
  else {
    return FSLog_Debug();
  }
}

void sub_10000FF0C(uint64_t a1)
{
  id v2 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.CoreTextAssets"];
  [v2 addKeyValuePair:@"_CompatibilityVersion" with:@"1"];
  [v2 addKeyValuePair:@"type" with:@"FontAccess"];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000FFE4;
  v5[3] = &unk_100019008;
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = v2;
  uint64_t v7 = v3;
  id v4 = v2;
  [v4 queryMetaData:v5];
}

void sub_10000FFE4(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v3 = +[NSMutableArray arrayWithCapacity:0];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = objc_msgSend(*(id *)(a1 + 32), "results", 0);
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) attributes];
          id v10 = [v9 objectForKey:@"FontAccess"];

          if (v10) {
            [v3 addObject:v10];
          }

          uint64_t v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    [*(id *)(a1 + 40) setFontEnumerationProhibitedInfo:v3];
  }
}

void sub_10001014C(uint64_t a1, xpc_activity_t activity)
{
  if (xpc_activity_get_state(activity))
  {
    uint64_t v3 = dispatch_get_global_queue(-2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000101EC;
    block[3] = &unk_100018680;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v3, block);
  }
}

void sub_1000101EC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isUserFontInstalled])
  {
    id v1 = objc_alloc_init((Class)MADownloadOptions);
    [v1 setDiscretionary:1];
    +[MAAsset startCatalogDownload:@"com.apple.MobileAsset.CoreTextAssets" options:v1 then:&stru_100019028];
  }
}

void sub_10001026C(id a1, int64_t a2)
{
}

id sub_1000102A4(uint64_t a1, xpc_activity_t activity)
{
  id result = (id)xpc_activity_get_state(activity);
  if (result)
  {
    id v4 = *(void **)(a1 + 32);
    return [v4 subscriptionSupportTimerHandler];
  }
  return result;
}

void sub_100010348(id a1)
{
}

void sub_10001035C(id a1, BOOL a2)
{
  id v2 = sub_10000EF44();
  id v4 = v2;
  uint64_t v3 = FSEventStreamCreate(kCFAllocatorDefault, (FSEventStreamCallback)sub_100010428, 0, (CFArrayRef)+[NSArray arrayWithObjects:&v4 count:1], 0xFFFFFFFFFFFFFFFFLL, 3.0, 0x11u);

  FSEventStreamSetDispatchQueue(v3, (dispatch_queue_t)qword_10001DEE0);
  FSEventStreamStart(v3);
}

id sub_100010428()
{
  FSLog_Debug();
  return +[FSUserFontManager synchronizeFontAssets:&stru_1000190C8];
}

void sub_100010544(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = [*(id *)(a1 + 32) results];
    id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        id v6 = 0;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v6);
          v8[0] = _NSConcreteStackBlock;
          v8[1] = 3221225472;
          v8[2] = sub_100010694;
          v8[3] = &unk_100018FE0;
          void v8[4] = v7;
          [v7 purge:v8];
          id v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v4);
    }
  }
}

void sub_100010694(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) assetId];
  FSLog_Debug();
}

uint64_t start()
{
  id v1 = +[FontServicesDaemon sharedDaemon];
  [v1 setupForXPCService];
  [v1 setupForScheduledFontDeletion];
  [v1 setupForDistributedNotifications];
  [v1 setupForAssetNotifications];
  [v1 setupForMonitoringFontAssets];
  [v1 setupForProfileFonts];
  [v1 setup];
  [v1 run];

  return 0;
}

void sub_100010850(id a1, BOOL a2)
{
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
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

void CFRelease(CFTypeRef cf)
{
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

FSEventStreamRef FSEventStreamCreate(CFAllocatorRef allocator, FSEventStreamCallback callback, FSEventStreamContext *context, CFArrayRef pathsToWatch, FSEventStreamEventId sinceWhen, CFTimeInterval latency, FSEventStreamCreateFlags flags)
{
  return _FSEventStreamCreate(allocator, callback, context, pathsToWatch, sinceWhen, latency, flags);
}

void FSEventStreamSetDispatchQueue(FSEventStreamRef streamRef, dispatch_queue_t q)
{
}

Boolean FSEventStreamStart(FSEventStreamRef streamRef)
{
  return _FSEventStreamStart(streamRef);
}

uint64_t FSLog()
{
  return _FSLog();
}

uint64_t FSLog_Debug()
{
  return _FSLog_Debug();
}

uint64_t FSLog_Error()
{
  return _FSLog_Error();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t SBSCopyFrontmostApplicationDisplayIdentifier()
{
  return _SBSCopyFrontmostApplicationDisplayIdentifier();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint32_t arc4random(void)
{
  return _arc4random();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

uint64_t sandbox_check_by_audit_token()
{
  return _sandbox_check_by_audit_token();
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return _sandbox_extension_issue_file_to_process();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__endpoint(void *a1, const char *a2, ...)
{
  return [a1 _endpoint];
}

id objc_msgSend__userFontsInfoFromDisk(void *a1, const char *a2, ...)
{
  return [a1 _userFontsInfoFromDisk];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return [a1 anonymousListener];
}

id objc_msgSend_assetHandlerQueue(void *a1, const char *a2, ...)
{
  return [a1 assetHandlerQueue];
}

id objc_msgSend_assetId(void *a1, const char *a2, ...)
{
  return [a1 assetId];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
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

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return [a1 configurationForDefaultMainDisplayMonitor];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countFontAssets(void *a1, const char *a2, ...)
{
  return [a1 countFontAssets];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return [a1 currentState];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return [a1 endowmentNamespaces];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_fontEnumerationProhibitedInfo(void *a1, const char *a2, ...)
{
  return [a1 fontEnumerationProhibitedInfo];
}

id objc_msgSend_getLocalFileUrl(void *a1, const char *a2, ...)
{
  return [a1 getLocalFileUrl];
}

id objc_msgSend_getLocalUrl(void *a1, const char *a2, ...)
{
  return [a1 getLocalUrl];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateUserFonts(void *a1, const char *a2, ...)
{
  return [a1 invalidateUserFonts];
}

id objc_msgSend_isCurrentConnectionFontPicker(void *a1, const char *a2, ...)
{
  return [a1 isCurrentConnectionFontPicker];
}

id objc_msgSend_isUserFontInstalled(void *a1, const char *a2, ...)
{
  return [a1 isUserFontInstalled];
}

id objc_msgSend_knownFontProviders(void *a1, const char *a2, ...)
{
  return [a1 knownFontProviders];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainHandlerQueue(void *a1, const char *a2, ...)
{
  return [a1 mainHandlerQueue];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_profileFontsInfo(void *a1, const char *a2, ...)
{
  return [a1 profileFontsInfo];
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return [a1 queryMetaDataSync];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeObsoleteFontAsset(void *a1, const char *a2, ...)
{
  return [a1 removeObsoleteFontAsset];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resumeSuspendedFontFiles(void *a1, const char *a2, ...)
{
  return [a1 resumeSuspendedFontFiles];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_scheduledFontDeletionQueue(void *a1, const char *a2, ...)
{
  return [a1 scheduledFontDeletionQueue];
}

id objc_msgSend_selector(void *a1, const char *a2, ...)
{
  return [a1 selector];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return [a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return [a1 setup];
}

id objc_msgSend_setupForAssetNotifications(void *a1, const char *a2, ...)
{
  return [a1 setupForAssetNotifications];
}

id objc_msgSend_setupForDistributedNotifications(void *a1, const char *a2, ...)
{
  return [a1 setupForDistributedNotifications];
}

id objc_msgSend_setupForMonitoringFontAssets(void *a1, const char *a2, ...)
{
  return [a1 setupForMonitoringFontAssets];
}

id objc_msgSend_setupForProfileFonts(void *a1, const char *a2, ...)
{
  return [a1 setupForProfileFonts];
}

id objc_msgSend_setupForScheduledFontDeletion(void *a1, const char *a2, ...)
{
  return [a1 setupForScheduledFontDeletion];
}

id objc_msgSend_setupForXPCService(void *a1, const char *a2, ...)
{
  return [a1 setupForXPCService];
}

id objc_msgSend_sharedDaemon(void *a1, const char *a2, ...)
{
  return [a1 sharedDaemon];
}

id objc_msgSend_shortVersionString(void *a1, const char *a2, ...)
{
  return [a1 shortVersionString];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stopFontFilesDeletionTimer(void *a1, const char *a2, ...)
{
  return [a1 stopFontFilesDeletionTimer];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_subscriptionSupportQueue(void *a1, const char *a2, ...)
{
  return [a1 subscriptionSupportQueue];
}

id objc_msgSend_subscriptionSupportTimerHandler(void *a1, const char *a2, ...)
{
  return [a1 subscriptionSupportTimerHandler];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_synchronizeFontProviders(void *a1, const char *a2, ...)
{
  return [a1 synchronizeFontProviders];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_userFontsInfo(void *a1, const char *a2, ...)
{
  return [a1 userFontsInfo];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_webcontentProcessConnections(void *a1, const char *a2, ...)
{
  return [a1 webcontentProcessConnections];
}