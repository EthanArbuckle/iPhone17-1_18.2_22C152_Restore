id SandboxExtensionsForPathsAndAuditToken(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v12;
  id obj;
  long long v14;
  long long v15;
  long long v16;
  long long v17;
  unsigned char v18[128];
  uint64_t vars8;

  v1 = a1;
  v2 = objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = v1;
  v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    v4 = v3;
    v5 = *(void *)v15;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        v12 = [v7 UTF8String];
        if (!sandbox_check_by_audit_token()
          || (v8 = (const char *)sandbox_extension_issue_file_to_process()) == 0
          || (+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v8, strlen(v8) + 1, 1, v12), (v9 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          v9 = objc_opt_new();
        }
        v10 = (void *)v9;
        objc_msgSend(v2, "setObject:forKey:", v9, v7, v12);
      }
      v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  return v2;
}

id IsApplicationIdentifierGrantedFontEnumeration(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"com.apple.Preferences"];
}

void RunBlockWithSandboxExtension(void *a1, void *a2)
{
  id v5 = a1;
  v3 = a2;
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

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_opt_new();
  uint64_t v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

id sub_100003538(void *a1)
{
  id v1 = a1;
  v2 = (void *)GSFontCopyUserFontsDirectoryURL();
  v3 = v2;
  if (v1)
  {
    id v4 = v1;
    id v5 = +[NSUserDefaults standardUserDefaults];
    v6 = [v5 dictionaryForKey:@"hash"];
    v7 = [v6 objectForKey:v4];
    if (!v7)
    {
      if (v6)
      {
        id v8 = [v6 mutableCopy];
      }
      else
      {
        id v8 = +[NSMutableDictionary dictionaryWithCapacity:1];
      }
      v10 = v8;
      v11 = +[NSUUID UUID];
      v7 = [v11 UUIDString];

      [v10 setObject:v7 forKey:v4];
      [v5 setObject:v10 forKey:@"hash"];
      [v5 synchronize];
      CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
    }
    v12 = [v3 URLByAppendingPathComponent:@"FontFiles"];
    id v9 = [v12 URLByAppendingPathComponent:v7];
  }
  else
  {
    id v9 = v2;
  }

  return v9;
}

uint64_t sub_100003B8C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100003C30(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) gsFontUserFontsCacheInfo];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_100003D20(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) gsFontProfileFontsCacheInfo];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

id sub_100003DF0(void *a1)
{
  id v1 = a1;
  id v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 dictionaryForKey:@"hash"];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_100006350;
  v14 = sub_100006360;
  id v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B0B8;
  v7[3] = &unk_100010680;
  id v4 = v1;
  id v8 = v4;
  id v9 = &v10;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_100003F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004150(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) gsFontUserFontsCacheInfo];
  if (v1)
  {
    id v2 = (void *)GSFontCopyUserFontsDirectoryURL();
    v3 = [v2 URLByAppendingPathComponent:@"FontFiles"];
    id v4 = [v3 path];

    id v5 = [v1 allKeys];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v10 hasPrefix:v4]) {
            [v1 removeObjectForKey:v10];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
    v11 = (void *)GSFontCopyUserFontsCacheInfoFileURL();
    uint64_t v12 = +[NSOutputStream outputStreamWithURL:v11 append:0];
    [v12 open];
    id v14 = 0;
    +[NSPropertyListSerialization writePropertyList:v1 toStream:v12 format:200 options:0 error:&v14];
    id v13 = v14;
    [v12 close];
    if (v13) {
      FSLog();
    }
  }
}

void sub_100004418(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) recordLastAccessTime:*(void *)(a1 + 40)];
  }
  id v2 = sub_100003538(*(void **)(a1 + 40));
  v3 = [v2 path];
  id v4 = objc_opt_new();
  id v5 = [[FontRegistrationInfo alloc] initWithTargetDirectoryURL:v2];
  id v6 = [*(id *)(a1 + 32) gsFontUserFontsCacheInfo];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000456C;
  v12[3] = &unk_100010400;
  char v16 = *(unsigned char *)(a1 + 57);
  id v13 = v3;
  id v14 = v5;
  id v15 = v4;
  id v7 = v4;
  uint64_t v8 = v5;
  id v9 = v3;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v7, v10, v11);
}

void sub_10000456C(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  id v5 = a3;
  if ([v20 hasPrefix:*(void *)(a1 + 32)])
  {
    id v6 = [v5 objectForKey:@"disabled"];
    unsigned int v7 = [v6 BOOLValue];
    int v8 = *(unsigned __int8 *)(a1 + 56);

    if (v8 != v7)
    {
      id v9 = [v5 mutableCopy];
      [v9 setObject:v20 forKey:@"actualPath"];
      uint64_t v10 = [v20 lastPathComponent];
      uint64_t v11 = [v20 stringByDeletingLastPathComponent];
      uint64_t v12 = [v11 lastPathComponent];

      id v13 = sub_100003DF0(v12);
      if (v13) {
        [v9 setObject:v13 forKey:@"identifier"];
      }
      id v14 = [*(id *)(a1 + 40) fontInfoForUUID:v10];
      if (v14)
      {
        id v15 = v14;
        char v16 = [v14 objectForKey:@"NSCTFontFileURLAttribute"];

        if (!v16)
        {
          id v17 = [v15 mutableCopy];
          long long v18 = +[NSURL fileURLWithPath:v20 isDirectory:0];
          if (v18)
          {
            [v17 setObject:v18 forKey:@"NSCTFontFileURLAttribute"];
            id v19 = v17;

            id v15 = v19;
          }
        }
        [v9 setObject:v15 forKey:@"providedInfo"];
      }
      [*(id *)(a1 + 48) addObject:v9];
    }
  }
}

void sub_10000489C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "fontNamesFromFontInfoDict:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v9), (void)v14);
        [v4 unionSet:v10];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = [v4 allObjects];
  id v13 = [v12 sortedArrayUsingSelector:"compare:"];
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v13);
}

void sub_100004AC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "familyNamesFromFontInfoDict:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v9), (void)v14);
        [v4 unionSet:v10];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = [v4 allObjects];
  id v13 = [v12 sortedArrayUsingSelector:"compare:"];
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v13);
}

void sub_100005104(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (!v6 || [v6 containsObject:v10])
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = [v5 objectForKey:@"familyName"];
    id v9 = [v8 allValues];
    [v7 addObjectsFromArray:v9];
  }
}

void sub_1000052F0(uint64_t a1)
{
  id v1 = (void **)(a1 + 40);
  [*(id *)(a1 + 32) recordLastAccessTime:*(void *)(a1 + 40)];
  v106 = objc_opt_new();
  v93 = objc_opt_new();
  v92 = objc_opt_new();
  v105 = +[NSMutableDictionary dictionaryWithCapacity:0];
  v94 = sub_100003538(*v1);
  v104 = [[FontRegistrationInfo alloc] initWithTargetDirectoryURL:v94];
  v95 = +[NSFileManager defaultManager];
  id v149 = 0;
  LODWORD(v1) = [v95 createDirectoryAtURL:v94 withIntermediateDirectories:1 attributes:0 error:&v149];
  id v91 = v149;
  if (!v1)
  {
    v32 = [v94 path];
    uint64_t v33 = *(void *)(a1 + 40);
    v34 = [v91 domain];
    id v90 = [v91 code];
    v83 = v32;
    FSLog_Error();

    id v2 = (id)objc_opt_new();
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id v35 = *(id *)(a1 + 48);
    id v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v123, v155, 16, v83, v33, v34, v90);
    if (v36)
    {
      uint64_t v37 = *(void *)v124;
      do
      {
        for (i = 0; i != v36; i = (char *)i + 1)
        {
          if (*(void *)v124 != v37) {
            objc_enumerationMutation(v35);
          }
          v39 = [*(id *)(*((void *)&v123 + 1) + 8 * i) objectForKeyedSubscript:@"parameterIndexes"];
          [v2 addObjectsFromArray:v39];
        }
        id v36 = [v35 countByEnumeratingWithState:&v123 objects:v155 count:16];
      }
      while (v36);
    }

    CFStringRef v153 = @"FontProviderErrorUserInfoFontInfoParameterIndexesKey";
    id v154 = v2;
    v40 = +[NSDictionary dictionaryWithObjects:&v154 forKeys:&v153 count:1];
    v41 = +[NSError errorWithDomain:@"FontProviderErrorDomain" code:2 userInfo:v40];

    [v106 addObject:v41];
    goto LABEL_36;
  }
  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  id v2 = *(id *)(a1 + 48);
  id v100 = [v2 countByEnumeratingWithState:&v145 objects:v162 count:16];
  if (!v100)
  {
LABEL_36:
    v96 = 0;
    goto LABEL_37;
  }
  v96 = 0;
  uint64_t v98 = *(void *)v146;
  do
  {
    for (j = 0; j != v100; j = (char *)j + 1)
    {
      if (*(void *)v146 != v98) {
        objc_enumerationMutation(v2);
      }
      id v4 = *(void **)(*((void *)&v145 + 1) + 8 * (void)j);
      id v5 = objc_msgSend(v4, "objectForKey:", @"NSCTFontFileURLAttribute", v81);
      if (v5)
      {
        id v6 = [v4 objectForKey:@"CTFontIgnoreURLLocationAttribute"];
        unsigned int v7 = [v6 BOOLValue];

        if (v7)
        {
          id v8 = [v4 objectForKey:@"CTFontRegistrationUserInfoAttribute"];
          if ([(FontRegistrationInfo *)v104 isKnownUserSpecifiedInfo:v8])
          {
            FSLog_Error();
            CFStringRef v160 = @"FontProviderErrorUserInfoFontInfoParameterIndexesKey";
            id v9 = objc_msgSend(v4, "objectForKeyedSubscript:", @"parameterIndexes", v8);
            v161 = v9;
            id v10 = +[NSDictionary dictionaryWithObjects:&v161 forKeys:&v160 count:1];
            uint64_t v11 = +[NSError errorWithDomain:@"FontProviderErrorDomain" code:4 userInfo:v10];

            [v106 addObject:v11];
LABEL_24:

            goto LABEL_25;
          }
        }
        id v144 = 0;
        unsigned __int8 v12 = [(FontRegistrationInfo *)v104 isKnownSourceFileURL:v5 uuid:&v144];
        id v8 = v144;
        if (v12)
        {
          uint64_t v11 = [v94 URLByAppendingPathComponent:v8];
          if (!v96)
          {
            v96 = [*(id *)(a1 + 32) gsFontUserFontsCacheInfo];
            if (!v96)
            {
              FSLog_Error();
              v96 = 0;
            }
          }
          id v13 = [v11 path];
          long long v14 = [v96 objectForKey:v13];

          long long v15 = [v14 objectForKey:@"disabled"];
          BOOL v16 = *(unsigned __int8 *)(a1 + 64) == [v15 BOOLValue];

          if (v16)
          {
            [v92 addObject:v11];
            long long v17 = [v5 lastPathComponent];
            v81 = v17;
            FSLog();
          }
          else
          {
            v82 = [v5 lastPathComponent];
            FSLog_Error();

            CFStringRef v156 = @"FontProviderErrorUserInfoFontInfoParameterIndexesKey";
            v26 = objc_msgSend(v4, "objectForKeyedSubscript:", @"parameterIndexes", v82);
            v157 = v26;
            v27 = +[NSDictionary dictionaryWithObjects:&v157 forKeys:&v156 count:1];
            long long v17 = +[NSError errorWithDomain:@"FontProviderErrorDomain" code:4 userInfo:v27];

            [v106 addObject:v17];
          }
        }
        else
        {
          uint64_t v11 = [(FontRegistrationInfo *)v104 uuidNameForFontInfo:v4];
          long long v18 = [v94 URLByAppendingPathComponent:v11];
          id v19 = [v4 objectForKeyedSubscript:@"parameterIndexes"];
          [v105 setObject:v19 forKey:v18];

          CFTypeRef cf = 0;
          p_CFTypeRef cf = &cf;
          uint64_t v140 = 0x3032000000;
          v141 = sub_100006350;
          v142 = sub_100006360;
          id v143 = 0;
          uint64_t v134 = 0;
          v135 = &v134;
          uint64_t v136 = 0x2020000000;
          char v137 = 0;
          id v20 = [v4 objectForKey:@"CTFontAssetDataAttribute"];
          v21 = [v4 objectForKey:@"sandbox"];
          v127[0] = _NSConcreteStackBlock;
          v127[1] = 3221225472;
          v127[2] = sub_100006368;
          v127[3] = &unk_1000104A0;
          id v22 = v20;
          id v128 = v22;
          v132 = &v134;
          id v129 = v95;
          id v23 = v5;
          id v130 = v23;
          id v24 = v18;
          id v131 = v24;
          v133 = &cf;
          RunBlockWithSandboxExtension(v21, v127);

          if (*((unsigned char *)v135 + 24))
          {
            [v93 addObject:v24];
            v25 = [v23 lastPathComponent];
            v81 = v25;
            FSLog();
          }
          else
          {
            v28 = [(id)p_cf[5] domain];
            id v86 = [(id)p_cf[5] code];
            FSLog_Error();

            v158[0] = @"FontProviderErrorUserInfoFontInfoParameterIndexesKey";
            v29 = objc_msgSend(v4, "objectForKeyedSubscript:", @"parameterIndexes", v28, v86);
            v158[1] = NSUnderlyingErrorKey;
            CFTypeRef v30 = p_cf[5];
            v159[0] = v29;
            v159[1] = v30;
            v31 = +[NSDictionary dictionaryWithObjects:v159 forKeys:v158 count:2];
            v25 = +[NSError errorWithDomain:@"FontProviderErrorDomain" code:3 userInfo:v31];

            [v106 addObject:v25];
          }

          _Block_object_dispose(&v134, 8);
          _Block_object_dispose(&cf, 8);
        }
        goto LABEL_24;
      }
LABEL_25:
    }
    id v100 = [v2 countByEnumeratingWithState:&v145 objects:v162 count:16];
  }
  while (v100);
LABEL_37:

  if ([v93 count])
  {
    CFTypeRef cf = 0;
    uint64_t v101 = GSFontRegisterPersistentURLsWithEnableStatus2();
    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    v42 = (id)cf;
    id v43 = [v42 countByEnumeratingWithState:&v119 objects:v152 count:16];
    if (v43)
    {
      uint64_t v44 = *(void *)v120;
      do
      {
        for (k = 0; k != v43; k = (char *)k + 1)
        {
          if (*(void *)v120 != v44) {
            objc_enumerationMutation(v42);
          }
          v46 = *(void **)(*((void *)&v119 + 1) + 8 * (void)k);
          v47 = objc_msgSend(v46, "objectForKey:", @"result", v81);
          BOOL v48 = [v47 intValue] == 0;

          if (!v48)
          {
            v49 = [v46 objectForKey:@"url"];
            v50 = *(void **)(a1 + 32);
            v51 = [v105 objectForKeyedSubscript:v49];
            v52 = [v50 errorForGSError:v46 withParamIndexes:v51];

            [v106 addObject:v52];
            v53 = [v46 objectForKey:@"faces"];
            BOOL v54 = [v53 count] == 0;

            if (v54)
            {
              v55 = [v49 lastPathComponent];
              [v95 removeItemAtURL:v49 error:0];
              [(FontRegistrationInfo *)v104 removeUUIDName:v55];
              v56 = [v49 path];
              if (v49) {
                [v93 removeObject:v56];
              }
            }
          }
        }
        id v43 = [v42 countByEnumeratingWithState:&v119 objects:v152 count:16];
      }
      while (v43);
    }

    v81 = (void *)v101;
    CFTypeRef v85 = cf;
    FSLog();
    if (cf) {
      CFRelease(cf);
    }
  }
  if (objc_msgSend(v92, "count", v81, v85))
  {
    CFTypeRef cf = 0;
    GSFontEnableOrDisablePersistentURLs2();
    if (cf)
    {
      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      id v57 = v92;
      id v58 = [v57 countByEnumeratingWithState:&v115 objects:v151 count:16];
      if (v58)
      {
        uint64_t v59 = *(void *)v116;
        do
        {
          for (m = 0; m != v58; m = (char *)m + 1)
          {
            if (*(void *)v116 != v59) {
              objc_enumerationMutation(v57);
            }
            uint64_t v61 = *(void *)(*((void *)&v115 + 1) + 8 * (void)m);
            v62 = +[NSMutableDictionary dictionaryWithCapacity:0];
            v63 = [v105 objectForKeyedSubscript:v61];
            if (v63) {
              [v62 setObject:v63 forKey:@"FontProviderErrorUserInfoFontInfoParameterIndexesKey"];
            }
            v64 = +[NSError errorWithDomain:@"FontProviderErrorDomain" code:6 userInfo:v62];
            [v106 addObject:v64];
          }
          id v58 = [v57 countByEnumeratingWithState:&v115 objects:v151 count:16];
        }
        while (v58);
      }

      CFRelease(cf);
    }
  }
  [(FontRegistrationInfo *)v104 update];
  if (![(FontRegistrationInfo *)v104 count])
  {
    id v114 = 0;
    unsigned int v65 = [v95 removeItemAtURL:v94 error:&v114];
    id v66 = v114;
    if (v65)
    {
      [*(id *)(a1 + 32) forgetFontProvider:*(void *)(a1 + 40)];
    }
    else
    {
      v67 = [v94 path];
      uint64_t v68 = *(void *)(a1 + 40);
      v88 = [v66 domain];
      id v89 = [v66 code];
      v84 = v67;
      uint64_t v87 = v68;
      FSLog_Error();
    }
  }
  v102 = objc_opt_new();
  v97 = [*(id *)(a1 + 32) filePathsFromFileURLs:v93];
  id v99 = [v97 mutableCopy];
  v69 = [*(id *)(a1 + 32) filePathsFromFileURLs:v92];
  [v99 unionSet:v69];

  v70 = [*(id *)(a1 + 32) gsFontUserFontsCacheInfo];

  if (*(unsigned char *)(a1 + 64))
  {
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v71 = v99;
    id v72 = [v71 countByEnumeratingWithState:&v110 objects:v150 count:16];
    if (v72)
    {
      uint64_t v73 = *(void *)v111;
      do
      {
        for (n = 0; n != v72; n = (char *)n + 1)
        {
          if (*(void *)v111 != v73) {
            objc_enumerationMutation(v71);
          }
          uint64_t v75 = *(void *)(*((void *)&v110 + 1) + 8 * (void)n);
          v76 = objc_msgSend(v70, "objectForKey:", v75, v84, v87, v88, v89);
          v77 = v76;
          if (v76)
          {
            v78 = [v76 objectForKey:@"disabled"];
            unsigned __int8 v79 = [v78 BOOLValue];

            if ((v79 & 1) == 0) {
              [v102 setObject:v77 forKey:v75];
            }
          }
        }
        id v72 = [v71 countByEnumeratingWithState:&v110 objects:v150 count:16];
      }
      while (v72);
    }
  }
  else
  {
    v107[0] = _NSConcreteStackBlock;
    v107[1] = 3221225472;
    v107[2] = sub_100006410;
    v107[3] = &unk_100010478;
    id v108 = v99;
    id v109 = v102;
    [v70 enumerateKeysAndObjectsUsingBlock:v107];

    id v71 = v108;
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  v80 = [*(id *)(a1 + 32) familyNamesForFilePaths:v97 inFontInfo:v70];
  objc_msgSend(*(id *)(a1 + 32), "recordInstalledFontFamiliesCount:", objc_msgSend(v80, "count"));
}

void sub_100006320(_Unwind_Exception *a1)
{
}

uint64_t sub_100006350(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006360(uint64_t a1)
{
}

void sub_100006368(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2)
  {
    uint64_t v3 = a1[7];
    uint64_t v4 = *(void *)(a1[9] + 8);
    id v6 = *(void **)(v4 + 40);
    id v5 = (void **)(v4 + 40);
    BOOL v16 = v6;
    unsigned __int8 v7 = [v2 writeToURL:v3 options:2 error:&v16];
    id v8 = v16;
  }
  else
  {
    id v9 = (void *)a1[5];
    uint64_t v10 = a1[6];
    uint64_t v11 = a1[7];
    uint64_t v12 = *(void *)(a1[9] + 8);
    id v13 = *(void **)(v12 + 40);
    id v5 = (void **)(v12 + 40);
    long long v17 = v13;
    unsigned __int8 v7 = [v9 copyItemAtURL:v10 toURL:v11 error:&v17];
    id v8 = v17;
  }
  id v14 = v8;
  long long v15 = *v5;
  *id v5 = v14;

  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v7;
}

void sub_100006410(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (![*(id *)(a1 + 32) containsObject:v8]
    || ([v5 objectForKey:@"disabled"],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 BOOLValue],
        v6,
        v7))
  {
    [*(id *)(a1 + 40) setObject:&__NSDictionary0__struct forKey:v8];
  }
}

uint64_t sub_100006544(uint64_t a1, void *a2)
{
  [a2 objectForKey:@"FontInfo4"];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v24 = [v3 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v24)
  {
    uint64_t v4 = *(void *)v32;
    id v25 = v3;
    uint64_t v21 = *(void *)v32;
    uint64_t v22 = a1;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v32 != v4) {
          objc_enumerationMutation(v3);
        }
        id v6 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id obj = *(id *)(a1 + 32);
        id v7 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v28;
          id v23 = i;
          while (2)
          {
            for (j = 0; j != v8; j = (char *)j + 1)
            {
              if (*(void *)v28 != v9) {
                objc_enumerationMutation(obj);
              }
              uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * (void)j);
              uint64_t v12 = [v11 objectForKey:@"NSFontNameAttribute"];
              if (v12)
              {
                id v13 = [v6 objectForKey:@"PostScriptFontName"];
                unsigned __int8 v14 = [v13 isEqualToString:v12];

                if (v14) {
                  goto LABEL_24;
                }
              }
              long long v15 = [v11 objectForKey:@"NSFontFamilyAttribute"];
              if (v15)
              {
                BOOL v16 = [v6 objectForKey:@"FontFamilyName"];
                if ([v16 isEqualToString:v15])
                {

LABEL_23:
LABEL_24:

                  uint64_t v19 = 1;
                  id v3 = v25;
                  goto LABEL_25;
                }
                long long v17 = [v6 objectForKey:@"PreferredFamilyName"];
                unsigned int v18 = [v17 isEqualToString:v15];

                if (v18) {
                  goto LABEL_23;
                }
              }
            }
            id v8 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
            id v3 = v25;
            uint64_t v4 = v21;
            a1 = v22;
            i = v23;
            if (v8) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v19 = 0;
      id v24 = [v3 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v24);
  }
  else
  {
    uint64_t v19 = 0;
  }
LABEL_25:

  return v19;
}

void sub_100006970(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) recordLastAccessTime:*(void *)(a1 + 40)];
  id v66 = objc_opt_new();
  v80 = objc_opt_new();
  id v2 = +[NSMutableDictionary dictionaryWithCapacity:0];
  v81 = sub_100003538(v1[1]);
  uint64_t v68 = [[FontRegistrationInfo alloc] initWithTargetDirectoryURL:v81];
  v63 = [*v1 gsFontUserFontsCacheInfo];
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id obj = *(id *)(a1 + 48);
  id v70 = [obj countByEnumeratingWithState:&v111 objects:v124 count:16];
  if (v70)
  {
    uint64_t v69 = *(void *)v112;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v112 != v69)
        {
          uint64_t v4 = v3;
          objc_enumerationMutation(obj);
          uint64_t v3 = v4;
        }
        uint64_t v73 = v3;
        id v5 = *(void **)(*((void *)&v111 + 1) + 8 * v3);
        uint64_t v75 = objc_msgSend(v5, "objectForKey:", @"actualPath", v61);
        if (!v75)
        {
          uint64_t v77 = [v5 objectForKey:@"NSFontNameAttribute"];
          uint64_t v72 = [v5 objectForKey:@"NSFontFamilyAttribute"];
          id v71 = [v5 objectForKey:@"CTFontRegistrationUserInfoAttribute"];
          if (v77 | v72)
          {
            id v8 = [v81 path];
            CFTypeRef cf = 0;
            p_CFTypeRef cf = &cf;
            uint64_t v109 = 0x2020000000;
            char v110 = 0;
            v96[0] = _NSConcreteStackBlock;
            v96[1] = 3221225472;
            v96[2] = sub_1000075A0;
            v96[3] = &unk_100010518;
            id v9 = v8;
            id v97 = v9;
            id v10 = (id)v77;
            uint64_t v11 = *(void *)(a1 + 32);
            id v98 = v10;
            uint64_t v99 = v11;
            id v100 = (id)v72;
            uint64_t v101 = v68;
            id v102 = v71;
            id v103 = v2;
            id v104 = v80;
            v105 = v5;
            v106 = &cf;
            [v63 enumerateKeysAndObjectsUsingBlock:v96];
            if (!*((unsigned char *)p_cf + 24))
            {
              CFStringRef v122 = @"FontProviderErrorUserInfoFontInfoParameterIndexesKey";
              uint64_t v12 = [v5 objectForKeyedSubscript:@"parameterIndexes"];
              long long v123 = v12;
              id v13 = +[NSDictionary dictionaryWithObjects:&v123 forKeys:&v122 count:1];
              unsigned __int8 v14 = +[NSError errorWithDomain:@"FontProviderErrorDomain" code:5 userInfo:v13];

              [v66 addObject:v14];
            }

            _Block_object_dispose(&cf, 8);
LABEL_15:
            long long v15 = v9;
            goto LABEL_34;
          }
          if (v71)
          {
            v64 = -[FontRegistrationInfo uuidsForUserInfo:](v68, "uuidsForUserInfo:");
            if ([v64 count])
            {
              long long v94 = 0u;
              long long v95 = 0u;
              long long v92 = 0u;
              long long v93 = 0u;
              id v16 = v64;
              id v17 = [v16 countByEnumeratingWithState:&v92 objects:v121 count:16];
              if (v17)
              {
                uint64_t v18 = *(void *)v93;
                do
                {
                  for (i = 0; i != v17; i = (char *)i + 1)
                  {
                    if (*(void *)v93 != v18) {
                      objc_enumerationMutation(v16);
                    }
                    id v20 = [v81 URLByAppendingPathComponent:*(void *)(*((void *)&v92 + 1) + 8 * i)];
                    uint64_t v21 = [v2 objectForKey:v20];
                    if (!v21)
                    {
                      [v80 addObject:v20];
                      uint64_t v21 = objc_opt_new();
                      [v2 setObject:v21 forKey:v20];
                    }
                    uint64_t v22 = [v5 objectForKeyedSubscript:@"parameterIndexes"];
                    [v21 addObjectsFromArray:v22];
                  }
                  id v17 = [v16 countByEnumeratingWithState:&v92 objects:v121 count:16];
                }
                while (v17);
              }
            }
            else
            {
              CFStringRef v119 = @"FontProviderErrorUserInfoFontInfoParameterIndexesKey";
              long long v27 = [v5 objectForKeyedSubscript:@"parameterIndexes"];
              long long v120 = v27;
              long long v28 = +[NSDictionary dictionaryWithObjects:&v120 forKeys:&v119 count:1];
              id v16 = +[NSError errorWithDomain:@"FontProviderErrorDomain" code:5 userInfo:v28];

              [v66 addObject:v16];
            }

            long long v15 = v64;
            goto LABEL_34;
          }
          id v9 = [v5 objectForKey:@"NSCTFontFileURLAttribute"];
          long long v15 = v9;
          if (!v9)
          {
LABEL_34:

            goto LABEL_35;
          }
          id v91 = 0;
          unsigned __int8 v23 = [(FontRegistrationInfo *)v68 isKnownSourceFileURL:v9 uuid:&v91];
          id v24 = v91;
          id v25 = v24;
          if (v23)
          {
            id v26 = v24;
            goto LABEL_38;
          }
          id v90 = v24;
          unsigned int v29 = [(FontRegistrationInfo *)v68 isKnownDestinationFileURL:v9 uuid:&v90];
          id v26 = v90;

          if (v29)
          {
LABEL_38:
            long long v30 = [v81 URLByAppendingPathComponent:v26];
            long long v31 = [v2 objectForKey:v30];
            if (!v31)
            {
              [v80 addObject:v30];
              long long v31 = objc_opt_new();
              [v2 setObject:v31 forKey:v30];
            }
            long long v32 = [v5 objectForKeyedSubscript:@"parameterIndexes"];
            [v31 addObjectsFromArray:v32];
          }
          else
          {
            CFStringRef v117 = @"FontProviderErrorUserInfoFontInfoParameterIndexesKey";
            long long v33 = [v5 objectForKeyedSubscript:@"parameterIndexes"];
            long long v118 = v33;
            long long v34 = +[NSDictionary dictionaryWithObjects:&v118 forKeys:&v117 count:1];
            long long v30 = +[NSError errorWithDomain:@"FontProviderErrorDomain" code:5 userInfo:v34];

            [v66 addObject:v30];
          }

          goto LABEL_15;
        }
        uint64_t v77 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:");
        if (v77)
        {
          id v6 = objc_msgSend(v2, "objectForKey:");
          if (!v6)
          {
            [v80 addObject:v77];
            id v6 = objc_opt_new();
            [v2 setObject:v6 forKey:v77];
          }
          id v7 = [v5 objectForKeyedSubscript:@"parameterIndexes"];
          [v6 addObjectsFromArray:v7];
        }
        else
        {
          uint64_t v61 = v75;
          FSLog_Error();
        }
LABEL_35:

        uint64_t v3 = v73 + 1;
      }
      while ((id)(v73 + 1) != v70);
      id v35 = [obj countByEnumeratingWithState:&v111 objects:v124 count:16];
      id v70 = v35;
    }
    while (v35);
  }

  if ([v80 count])
  {
    id v36 = *(void **)(a1 + 32);
    uint64_t v37 = [v36 filePathsFromFileURLs:v80];
    v76 = [v36 familyNamesForFilePaths:v37 inFontInfo:v63];

    CFTypeRef cf = 0;
    uint64_t v74 = GSFontUnregisterUserFontsURLs();
    v78 = objc_opt_new();
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    v38 = (id)cf;
    id v39 = [v38 countByEnumeratingWithState:&v86 objects:v116 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v87;
      do
      {
        for (j = 0; j != v39; j = (char *)j + 1)
        {
          if (*(void *)v87 != v40) {
            objc_enumerationMutation(v38);
          }
          v42 = *(void **)(*((void *)&v86 + 1) + 8 * (void)j);
          id v43 = objc_msgSend(v42, "objectForKey:", @"url", v61);
          uint64_t v44 = [v42 objectForKey:@"result"];
          BOOL v45 = [v44 intValue] == 0;

          if (v45)
          {
            BOOL v48 = [v43 lastPathComponent];
            v49 = [v43 path];
            [v78 addObject:v49];

            [(FontRegistrationInfo *)v68 removeUUIDName:v48];
          }
          else
          {
            v46 = *(void **)(a1 + 32);
            v47 = [v2 objectForKeyedSubscript:v43];
            BOOL v48 = [v46 errorForGSError:v42 withParamIndexes:v47];

            [v66 addObject:v48];
          }
        }
        id v39 = [v38 countByEnumeratingWithState:&v86 objects:v116 count:16];
      }
      while (v39);
    }

    if ([v78 count])
    {
      v50 = +[FontServicesDaemonManager sharedManager];
      [v50 scheduleFontFilesDeletion:v78];
    }
    uint64_t v61 = (void *)v74;
    CFTypeRef v62 = cf;
    FSLog();
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    v76 = 0;
  }
  [(FontRegistrationInfo *)v68 update];
  if (![(FontRegistrationInfo *)v68 count]) {
    [*(id *)(a1 + 32) forgetFontProvider:*(void *)(a1 + 40)];
  }
  v51 = [*(id *)(a1 + 32) gsFontUserFontsCacheInfo];

  unsigned __int8 v79 = objc_opt_new();
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v52 = v80;
  id v53 = [v52 countByEnumeratingWithState:&v82 objects:v115 count:16];
  if (v53)
  {
    uint64_t v54 = *(void *)v83;
    do
    {
      for (k = 0; k != v53; k = (char *)k + 1)
      {
        if (*(void *)v83 != v54) {
          objc_enumerationMutation(v52);
        }
        v56 = [*(id *)(*((void *)&v82 + 1) + 8 * (void)k) path];
        if (v56)
        {
          id v57 = [v51 objectForKey:v56];
          id v58 = v57;
          if (!v57
            || ([v57 objectForKey:@"disabled"],
                uint64_t v59 = objc_claimAutoreleasedReturnValue(),
                unsigned int v60 = [v59 BOOLValue],
                v59,
                v60))
          {
            [v79 setObject:&__NSDictionary0__struct forKey:v56];
          }
        }
      }
      id v53 = [v52 countByEnumeratingWithState:&v82 objects:v115 count:16];
    }
    while (v53);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "recordUninstalledFontFamiliesCount:", objc_msgSend(v76, "count"));
}

void sub_10000757C(_Unwind_Exception *a1)
{
}

void sub_1000075A0(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v6 = a3;
  if ([v17 hasPrefix:*(void *)(a1 + 32)])
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      uint64_t v3 = [*(id *)(a1 + 48) fontNamesFromFontInfoDict:v6];
      if ([v3 containsObject:*(void *)(a1 + 40)])
      {

        goto LABEL_12;
      }
      if (!*(void *)(a1 + 56))
      {
LABEL_18:

        goto LABEL_19;
      }
    }
    else if (!*(void *)(a1 + 56))
    {
      goto LABEL_19;
    }
    id v8 = [*(id *)(a1 + 48) familyNamesFromFontInfoDict:v6];
    unsigned int v9 = [v8 containsObject:*(void *)(a1 + 56)];

    if (!v7)
    {
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_12;
    }

    if (v9)
    {
LABEL_12:
      uint64_t v3 = +[NSURL fileURLWithPath:v17];
      id v10 = *(void **)(a1 + 64);
      uint64_t v11 = [v3 lastPathComponent];
      uint64_t v12 = [v10 fontInfoForUUID:v11];
      id v13 = [v12 objectForKey:@"CTFontRegistrationUserInfoAttribute"];

      unsigned __int8 v14 = *(void **)(a1 + 72);
      if (!v14 || [v14 isEqualToString:v13])
      {
        long long v15 = [*(id *)(a1 + 80) objectForKey:v3];
        if (!v15)
        {
          [*(id *)(a1 + 88) addObject:v3];
          long long v15 = objc_opt_new();
          [*(id *)(a1 + 80) setObject:v15 forKey:v3];
        }
        id v16 = [*(id *)(a1 + 96) objectForKeyedSubscript:@"parameterIndexes"];
        [v15 addObjectsFromArray:v16];

        *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 1;
      }

      goto LABEL_18;
    }
  }
LABEL_19:
}

void sub_1000078FC(uint64_t a1)
{
  id v2 = objc_opt_new();
  [*(id *)(a1 + 32) gsFontUserFontsCacheInfo];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v33 = v45 = 0u;
  uint64_t v3 = [v33 allKeys];
  id v4 = [v3 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v43;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v43 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if ([v8 hasPrefix:*(void *)(a1 + 40)])
        {
          unsigned int v9 = +[NSURL fileURLWithPath:v8];
          if (v9) {
            [v2 addObject:v9];
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v5);
  }

  unsigned int v29 = [*(id *)(a1 + 48) lastPathComponent];
  id v31 = [v2 count];
  FSLog_Debug();

  CFTypeRef cf = 0;
  uint64_t v10 = GSFontUnregisterUserFontsURLs();
  long long v32 = (char *)objc_msgSend(v2, "count", v29, v31) - v10;
  FSLog_Debug();
  objc_msgSend(*(id *)(a1 + 32), "forgetFontProvider:", *(void *)(a1 + 56), v10, v32);
  long long v34 = v2;
  uint64_t v11 = (char *)[v2 count];
  id v35 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v12 = 0;
  id v13 = [v12 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v13)
  {
    id v14 = v13;
    long long v15 = 0;
    uint64_t v16 = *(void *)v38;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
        uint64_t v19 = [v18 objectForKey:@"result"];
        unsigned int v20 = [v19 intValue];

        if (v20)
        {
          if (!v15)
          {
            long long v15 = [v18 objectForKey:@"error"];
          }
        }
        else
        {
          uint64_t v21 = [v18 objectForKey:@"url"];
          uint64_t v22 = [v21 path];
          [v35 addObject:v22];

          --v11;
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v14);
  }
  else
  {
    long long v15 = 0;
  }

  if (v11)
  {
    unsigned __int8 v23 = [*(id *)(a1 + 48) lastPathComponent];
    id v24 = [v15 domain];
    [v15 code];
    FSLog_Error();
  }
  else
  {
    uint64_t v30 = *(void *)(a1 + 56);
    FSLog_Debug();
    unsigned __int8 v23 = +[FontRegistrationInfo dictionaryFileURLForTargetDirectoryURL:](FontRegistrationInfo, "dictionaryFileURLForTargetDirectoryURL:", *(void *)(a1 + 48), v30);
    id v24 = +[NSFileManager defaultManager];
    id v36 = v15;
    [v24 removeItemAtURL:v23 error:&v36];
    id v25 = v36;

    long long v15 = v25;
  }

  if ([v35 count])
  {
    long long v28 = +[FontServicesDaemonManager sharedManager];
    [v28 scheduleFontFilesDeletion:v35];
  }
  if (cf) {
    CFRelease(cf);
  }
  (*(void (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v15, v26, v27);
}

void sub_100008400(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v9 hasPrefix:*(void *)(a1 + 32)])
  {
    uint64_t v6 = [v5 objectForKey:@"disabled"];
    unsigned int v7 = [v6 BOOLValue];

    if (((v7 ^ (*(unsigned char *)(a1 + 48) != 0)) & 1) == 0)
    {
      id v8 = +[NSURL fileURLWithPath:v9];
      if (v8) {
        [*(id *)(a1 + 40) addObject:v8];
      }
    }
  }
}

void sub_1000085C8(uint64_t a1)
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  uint64_t v3 = [v2 dictionaryForKey:@"suspended"];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKey:*(void *)(a1 + 32)];

    if (v5) {
      goto LABEL_7;
    }
    id v6 = [v4 mutableCopy];
  }
  else
  {
    id v6 = (id)objc_opt_new();
  }
  unsigned int v7 = v6;
  if (v6)
  {
    id v8 = +[NSDate now];
    [v7 setObject:v8 forKey:*(void *)(a1 + 32)];

    [v2 setObject:v7 forKey:@"suspended"];
    [v2 synchronize];
    CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
  }
LABEL_7:
  id v9 = [*(id *)(a1 + 40) fontFilesForFontProvider:*(void *)(a1 + 32) suspended:0];
  if ([v9 count])
  {
    FSLog();
    GSFontEnableOrDisablePersistentURLs2();
  }
}

uint64_t sub_100009020(uint64_t a1)
{
  FSLog_Debug();
  id v2 = *(void **)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000090C8;
  v4[3] = &unk_1000103D8;
  v4[4] = v2;
  [v2 updateUserInstalledFonts:v4];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000090C8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) gsFontUserFontsCacheInfo];
  id v2 = objc_opt_new();
  long long v92 = objc_opt_new();
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  uint64_t v75 = v1;
  uint64_t v3 = [v1 allKeys];
  id v4 = [v3 countByEnumeratingWithState:&v123 objects:v133 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v124;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v124 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v123 + 1) + 8 * i);
        if (IsPathRegisteredFontAssetFontFile(v8))
        {
          id v9 = [v8 stringByDeletingLastPathComponent];
          uint64_t v10 = [v9 lastPathComponent];

          [v2 addObject:v10];
          [v92 setObject:v8 forKey:v10];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v123 objects:v133 count:16];
    }
    while (v5);
  }

  uint64_t v11 = +[NSFileManager defaultManager];
  id v12 = FontAssetDirectoryPath();
  id v13 = +[NSURL fileURLWithPath:v12 isDirectory:1];
  NSURLResourceKey v132 = NSURLIsDirectoryKey;
  id v14 = +[NSArray arrayWithObjects:&v132 count:1];
  id v122 = 0;
  long long v86 = v11;
  long long v15 = [v11 contentsOfDirectoryAtURL:v13 includingPropertiesForKeys:v14 options:20 error:&v122];
  id v16 = v122;

  if (v16)
  {
    id v70 = [v16 domain];
    id v72 = [v16 code];
    FSLog_Error();
  }
  uint64_t v74 = v16;
  id v17 = objc_opt_new();
  v81 = objc_opt_new();
  uint64_t v18 = objc_opt_new();
  v76 = objc_opt_new();
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v19 = v15;
  long long v82 = v17;
  v80 = v19;
  NSURLResourceKey v20 = NSURLIsDirectoryKey;
  id v93 = [v19 countByEnumeratingWithState:&v118 objects:v131 count:16];
  if (v93)
  {
    uint64_t v21 = *(void *)v119;
    v78 = v2;
    uint64_t v83 = *(void *)v119;
    do
    {
      for (j = 0; j != v93; j = (char *)j + 1)
      {
        if (*(void *)v119 != v21) {
          objc_enumerationMutation(v19);
        }
        unsigned __int8 v23 = *(void **)(*((void *)&v118 + 1) + 8 * (void)j);
        id v117 = 0;
        unsigned int v24 = objc_msgSend(v23, "getResourceValue:forKey:error:", &v117, v20, 0, v70, v72);
        id v25 = v117;
        uint64_t v26 = v25;
        if (v24 && [v25 BOOLValue])
        {
          uint64_t v27 = [v23 URLByAppendingPathComponent:@"AssetData" isDirectory:1];
          id v116 = 0;
          id v90 = (void *)v27;
          long long v28 = objc_msgSend(v86, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
          id v29 = v116;
          uint64_t v30 = v29;
          if (v29)
          {
            id v70 = [v29 domain];
            id v72 = [v30 code];
            FSLog_Error();
          }
          if (objc_msgSend(v28, "count", v70, v72))
          {
            uint64_t v31 = [v23 lastPathComponent];
            [v17 addObject:v31];
            if (([v2 containsObject:v31] & 1) == 0) {
              [v76 setObject:v28 forKey:v31];
            }
            id obj = (id)v31;
            [v81 addObjectsFromArray:v28];
            long long v114 = 0u;
            long long v115 = 0u;
            long long v112 = 0u;
            long long v113 = 0u;
            id v32 = v28;
            id v33 = [v32 countByEnumeratingWithState:&v112 objects:v130 count:16];
            if (v33)
            {
              id v34 = v33;
              uint64_t v35 = *(void *)v113;
              do
              {
                for (k = 0; k != v34; k = (char *)k + 1)
                {
                  if (*(void *)v113 != v35) {
                    objc_enumerationMutation(v32);
                  }
                  long long v37 = [*(id *)(*((void *)&v112 + 1) + 8 * (void)k) path];
                  [v18 addObject:v37];
                }
                id v34 = [v32 countByEnumeratingWithState:&v112 objects:v130 count:16];
              }
              while (v34);
            }

            id v17 = v82;
            id v2 = v78;
            id v19 = v80;
          }

          uint64_t v21 = v83;
          NSURLResourceKey v20 = NSURLIsDirectoryKey;
        }
      }
      id v93 = [v19 countByEnumeratingWithState:&v118 objects:v131 count:16];
    }
    while (v93);
  }

  id v91 = objc_opt_new();
  long long v94 = objc_opt_new();
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v38 = v2;
  id v39 = [v38 countByEnumeratingWithState:&v108 objects:v129 count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v109;
    do
    {
      for (m = 0; m != v40; m = (char *)m + 1)
      {
        if (*(void *)v109 != v41) {
          objc_enumerationMutation(v38);
        }
        uint64_t v43 = *(void *)(*((void *)&v108 + 1) + 8 * (void)m);
        if ((objc_msgSend(v17, "containsObject:", v43, v70, v72) & 1) == 0)
        {
          long long v44 = [v92 objectForKey:v43];
          [v91 addObject:v43];
          long long v45 = +[NSURL fileURLWithPath:v44];
          [v94 addObject:v45];
        }
      }
      id v40 = [v38 countByEnumeratingWithState:&v108 objects:v129 count:16];
    }
    while (v40);
  }

  v46 = RegisteredFontAssetFileDirectoryURL();
  v47 = objc_opt_new();
  v104[0] = _NSConcreteStackBlock;
  v104[1] = 3221225472;
  v104[2] = sub_100009ACC;
  v104[3] = &unk_1000105E0;
  id v77 = v46;
  id v105 = v77;
  id v79 = v86;
  id v106 = v79;
  id v48 = v47;
  id v107 = v48;
  [v76 enumerateKeysAndObjectsUsingBlock:v104];
  id v84 = v48;
  id v85 = v38;
  if ([v48 count])
  {
    CFTypeRef cf = 0;
    GSFontRegisterPersistentURLsWithEnableStatus2();
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v49 = 0;
    id v50 = [v49 countByEnumeratingWithState:&v99 objects:v128 count:16];
    if (v50)
    {
      id v51 = v50;
      uint64_t v52 = *(void *)v100;
      do
      {
        for (n = 0; n != v51; n = (char *)n + 1)
        {
          if (*(void *)v100 != v52) {
            objc_enumerationMutation(v49);
          }
          uint64_t v54 = *(void **)(*((void *)&v99 + 1) + 8 * (void)n);
          v55 = objc_msgSend(v54, "objectForKey:", @"result", v70, v72);
          id v56 = [v55 intValue];

          if (v56)
          {
            id v57 = [v54 objectForKey:@"url"];
            [v57 lastPathComponent];
            id v70 = v56;
            id v72 = (id)objc_claimAutoreleasedReturnValue();
            FSLog_Debug();
          }
        }
        id v51 = [v49 countByEnumeratingWithState:&v99 objects:v128 count:16];
      }
      while (v51);
    }

    if (cf) {
      CFRelease(cf);
    }
    id v17 = v82;
    id v48 = v84;
    id v38 = v85;
  }
  id v58 = v94;
  if (objc_msgSend(v94, "count", v70, v72))
  {
    CFTypeRef cf = 0;
    GSFontUnregisterUserFontsURLs();
    long long v87 = objc_opt_new();
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id obja = (id)cf;
    id v59 = [obja countByEnumeratingWithState:&v95 objects:v127 count:16];
    if (v59)
    {
      id v60 = v59;
      uint64_t v61 = *(void *)v96;
      do
      {
        for (ii = 0; ii != v60; ii = (char *)ii + 1)
        {
          if (*(void *)v96 != v61) {
            objc_enumerationMutation(obja);
          }
          v63 = *(void **)(*((void *)&v95 + 1) + 8 * (void)ii);
          v64 = objc_msgSend(v63, "objectForKey:", @"result", v71, v73);
          id v65 = [v64 intValue];

          id v66 = [v63 objectForKey:@"url"];
          v67 = v66;
          if (v65)
          {
            uint64_t v68 = [v66 lastPathComponent];
            id v71 = v65;
            uint64_t v73 = v68;
            FSLog_Debug();
          }
          else
          {
            uint64_t v68 = [v66 path];
            [v87 addObject:v68];
          }
        }
        id v60 = [obja countByEnumeratingWithState:&v95 objects:v127 count:16];
      }
      while (v60);
    }

    if ([v87 count])
    {
      uint64_t v69 = +[FontServicesDaemonManager sharedManager];
      [v69 scheduleFontFilesDeletion:v87];
    }
    id v17 = v82;
    id v48 = v84;
    id v38 = v85;
    if (cf) {
      CFRelease(cf);
    }

    id v58 = v94;
  }
}

void sub_100009ACC(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = [a1[4] URLByAppendingPathComponent:v5];
  id v8 = a1[5];
  id v34 = 0;
  LODWORD(a3) = [v8 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v34];
  id v9 = v34;
  uint64_t v10 = v9;
  if (a3)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v6;
    id v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v26 = v10;
      id v27 = v6;
      id v28 = v5;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v17 = objc_msgSend(v16, "lastPathComponent", v23, v24, v25);
          uint64_t v18 = [v7 URLByAppendingPathComponent:v17];

          [a1[5] removeItemAtURL:v18 error:0];
          id v19 = a1[5];
          id v29 = 0;
          unsigned int v20 = [v19 copyItemAtURL:v16 toURL:v18 error:&v29];
          id v21 = v29;
          if (v20)
          {
            [a1[6] addObject:v18];
          }
          else
          {
            uint64_t v22 = [v16 lastPathComponent];
            unsigned int v24 = [v21 domain];
            id v25 = [v21 code];
            unsigned __int8 v23 = v22;
            FSLog_Error();
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v13);
      id v6 = v27;
      id v5 = v28;
      uint64_t v10 = v26;
    }
  }
  else
  {
    id v11 = [v9 domain];
    [v10 code];
    FSLog_Error();
  }
}

uint64_t sub_100009E00(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = GSFontSynchronizeProfileFonts();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

void sub_10000A65C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = [a3 objectForKey:@"CTFontRegistrationUserInfoAttribute"];
  if ([*(id *)(a1 + 32) isEqualToString:v5]) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

void sub_10000A8C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10000A8E4(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v8 = [a3 objectForKey:@"NSCTFontFileURLAttribute"];
  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 32) subpathForAppBundlePath:v8];
    if ([v9 isEqualToString:*(void *)(a1 + 40)])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

void sub_10000ABD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000ABE8(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = [a3 objectForKey:@"CTFontRegistrationUserInfoAttribute"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 isEqualToString:*(void *)(a1 + 32)];

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void sub_10000AF58(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v8])
  {
    id v6 = [v5 objectForKey:@"parameterIndexes"];

    if (v6)
    {
      id v7 = [v5 mutableCopy];
      [v7 removeObjectForKey:@"parameterIndexes"];

      id v5 = v7;
    }
    [*(id *)(a1 + 40) setObject:v5 forKey:v8];
  }
}

void sub_10000B0B8(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) isEqualToString:a3])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

NSURL *UserInstalledFontFileDirectoryURL()
{
  return +[NSURL fileURLWithPath:@"/var/mobile/Library/UserFonts/FontFiles/"];
}

NSURL *RegisteredFontAssetFileDirectoryURL()
{
  return +[NSURL fileURLWithPath:@"/var/mobile/Library/UserFonts/FontAssets/"];
}

id UserInstalledFontFileDirectoryPath()
{
  if (qword_1000150E8 != -1) {
    dispatch_once(&qword_1000150E8, &stru_1000106E8);
  }
  v0 = (void *)qword_1000150E0;
  return v0;
}

void sub_10000B1B8(id a1)
{
  id v4 = +[NSURL fileURLWithPath:@"/var/mobile/Library/UserFonts/FontFiles/"];
  uint64_t v1 = [v4 path];
  uint64_t v2 = [v1 stringByAppendingString:@"/"];
  uint64_t v3 = (void *)qword_1000150E0;
  qword_1000150E0 = v2;
}

id RegisteredFontAssetFileDirectoryPath()
{
  if (qword_1000150F8 != -1) {
    dispatch_once(&qword_1000150F8, &stru_100010708);
  }
  v0 = (void *)qword_1000150F0;
  return v0;
}

void sub_10000B290(id a1)
{
  id v4 = +[NSURL fileURLWithPath:@"/var/mobile/Library/UserFonts/FontAssets/"];
  uint64_t v1 = [v4 path];
  uint64_t v2 = [v1 stringByAppendingString:@"/"];
  uint64_t v3 = (void *)qword_1000150F0;
  qword_1000150F0 = v2;
}

CFStringRef FontAssetDirectoryPath()
{
  return @"/private/var/MobileAsset/AssetsV2/com_apple_MobileAsset_Font7/";
}

id IsPathUserInstalledFontFile(void *a1, const char *a2)
{
  return [a1 hasPrefix:@"/var/mobile/Library/UserFonts/FontFiles/"];
}

id IsPathRegisteredFontAssetFontFile(void *a1)
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

id IsPathConfigurationProfileFontFile(void *a1, const char *a2)
{
  return [a1 hasPrefix:@"/var/mobile/Library/Fonts/Managed/"];
}

id IsPathFontAssetFontFile(void *a1, const char *a2)
{
  return [a1 hasPrefix:@"/private/var/MobileAsset/AssetsV2/com_apple_MobileAsset_Font7/"];
}

void StartAccessingFontAssets()
{
  v0 = (objc_class *)sub_10000B468();
  if (v0 && (byte_100015100 & 1) == 0)
  {
    id v2 = [[v0 alloc] initWithType:@"com.apple.MobileAsset.Font7"];
    [v2 setDoNotBlockBeforeFirstUnlock:1];
    [v2 setDoNotBlockOnNetworkStatus:1];
    [v2 returnTypes:1];
    [v2 queryMetaDataSync];
    id v1 = [v2 results];
    [v1 enumerateObjectsUsingBlock:&stru_100010748];
  }
}

id sub_10000B468()
{
  if (qword_100015108 != -1) {
    dispatch_once(&qword_100015108, &stru_100010818);
  }
  v0 = (void *)qword_100015110;
  return v0;
}

void sub_10000B4BC(id a1, MAAsset *a2, unint64_t a3, BOOL *a4)
{
  id v6 = a2;
  if ([(MAAsset *)v6 state] == (id)2)
  {
    id v5 = [(MAAsset *)v6 getLocalFileUrl];

    if (v5)
    {
      byte_100015100 = 1;
      *a4 = 1;
    }
  }
}

void StartAccessingFontAssetsWithHandler(void *a1)
{
  id v1 = a1;
  id v2 = (objc_class *)sub_10000B468();
  if (v2 && (byte_100015101 & 1) == 0)
  {
    id v3 = [[v2 alloc] initWithType:@"com.apple.MobileAsset.Font7"];
    [v3 setDoNotBlockBeforeFirstUnlock:1];
    [v3 setDoNotBlockOnNetworkStatus:1];
    [v3 returnTypes:1];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000B634;
    v5[3] = &unk_100010790;
    id v6 = v3;
    id v7 = v1;
    id v4 = v3;
    [v4 queryMetaDataWithError:v5];
  }
  else
  {
    v1[2](v1);
  }
}

uint64_t sub_10000B634(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) results];
  [v2 enumerateObjectsUsingBlock:&stru_100010768];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void sub_10000B690(id a1, MAAsset *a2, unint64_t a3, BOOL *a4)
{
  id v6 = a2;
  if ([(MAAsset *)v6 state] == (id)2)
  {
    id v5 = [(MAAsset *)v6 getLocalFileUrl];

    if (v5)
    {
      byte_100015101 = 1;
      *a4 = 1;
    }
  }
}

void PurgeFontAssetsWithHandler(void *a1)
{
  id v1 = a1;
  id v2 = (objc_class *)sub_10000B468();
  if (v2)
  {
    id v3 = [[v2 alloc] initWithType:@"com.apple.MobileAsset.Font7"];
    [v3 setDoNotBlockBeforeFirstUnlock:1];
    [v3 setDoNotBlockOnNetworkStatus:1];
    [v3 returnTypes:2];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000B7E8;
    v5[3] = &unk_100010790;
    id v6 = v3;
    id v7 = v1;
    id v4 = v3;
    [v4 queryMetaDataWithError:v5];
  }
}

void sub_10000B7E8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) results];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000B888;
  v3[3] = &unk_1000107F8;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v3];
}

void sub_10000B888(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 state] == (id)2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [v5 attributes];
    LODWORD(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    if (v3) {
      [v5 purge:&stru_1000107D0];
    }
  }
}

void sub_10000B920(id a1)
{
  if (dlopen("/System/Library/PrivateFrameworks/MobileAsset.framework/MobileAsset", 1)) {
    qword_100015110 = (uint64_t)NSClassFromString(@"MAAssetQuery");
  }
}

void FSFontProviderRegisterFonts(uint64_t a1, uint64_t a2, void *a3)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000BA0C;
  v6[3] = &unk_100010880;
  id v7 = a3;
  id v5 = v7;
  +[FontProviderManager registerFonts:a1 enabled:a2 completionHandler:v6];
}

void sub_10000BA0C(uint64_t a1, void *a2)
{
  id v4 = a2;
  GSFontProcessRegistrationInfoForFontProvider();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void FSFontProviderUnregisterFonts(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000BB1C;
  v4[3] = &unk_100010880;
  id v5 = a2;
  id v3 = v5;
  +[FontProviderManager unregisterFonts:a1 completionHandler:v4];
}

void sub_10000BB1C(uint64_t a1, void *a2)
{
  id v4 = a2;
  GSFontProcessRegistrationInfoForFontProvider();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

id FSFontProviderRegisteredFontsInfo(uint64_t a1)
{
  return +[FontProviderManager registeredFontsInfo:a1];
}

void FSFontProviderRequestFonts(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 count])
  {
    id v5 = v4;
    GSFontRequestUserFonts();
  }
  else
  {
    (*((void (**)(id, void *))v4 + 2))(v4, &__NSArray0__struct);
  }
}

uint64_t sub_10000BC5C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void *))(result + 16))(result, &__NSArray0__struct);
  }
  return result;
}

BOOL FSFontProviderSynchronizeFontAsset(void *a1)
{
  id v1 = a1;
  if (GSFontUserFontsAvailable())
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    id v2 = [v1 path];
    if (v2)
    {
      id v3 = +[FontServicesDaemonManager sharedManager];
      id v12 = v2;
      id v4 = +[NSArray arrayWithObjects:&v12 count:1];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10000BDF8;
      v7[3] = &unk_1000108D0;
      void v7[4] = &v8;
      [v3 synchronizeFontAssets:v4 reply:v7];
    }
    BOOL v5 = *((unsigned char *)v9 + 24) != 0;

    _Block_object_dispose(&v8, 8);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void sub_10000BDD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000BDF8(uint64_t result, char a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  if (a3) {
    return _GSFontSetupForUserInstalledFonts(a3);
  }
  return result;
}

id FSFontProviderUpdateApplicationInfo()
{
  return +[FontProviderManager updateAppInfo];
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

void CFRelease(CFTypeRef cf)
{
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

uint64_t GSFontCopyProfileFontsCacheInfoFileURL()
{
  return _GSFontCopyProfileFontsCacheInfoFileURL();
}

uint64_t GSFontCopyUserFontsCacheInfoFileURL()
{
  return _GSFontCopyUserFontsCacheInfoFileURL();
}

uint64_t GSFontCopyUserFontsDirectoryURL()
{
  return _GSFontCopyUserFontsDirectoryURL();
}

uint64_t GSFontEnableOrDisablePersistentURLs2()
{
  return _GSFontEnableOrDisablePersistentURLs2();
}

uint64_t GSFontProcessRegistrationInfoForFontProvider()
{
  return _GSFontProcessRegistrationInfoForFontProvider();
}

uint64_t GSFontRegisterPersistentURLsWithEnableStatus2()
{
  return _GSFontRegisterPersistentURLsWithEnableStatus2();
}

uint64_t GSFontRequestUserFonts()
{
  return _GSFontRequestUserFonts();
}

uint64_t GSFontSynchronizeProfileFonts()
{
  return _GSFontSynchronizeProfileFonts();
}

uint64_t GSFontUnregisterUserFontsURLs()
{
  return _GSFontUnregisterUserFontsURLs();
}

uint64_t GSFontUserFontsAvailable()
{
  return _GSFontUserFontsAvailable();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
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

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
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

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
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

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countProfileFonts(void *a1, const char *a2, ...)
{
  return [a1 countProfileFonts];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_getLocalFileUrl(void *a1, const char *a2, ...)
{
  return [a1 getLocalFileUrl];
}

id objc_msgSend_gsFontProfileFontsCacheInfo(void *a1, const char *a2, ...)
{
  return [a1 gsFontProfileFontsCacheInfo];
}

id objc_msgSend_gsFontUserFontsCacheInfo(void *a1, const char *a2, ...)
{
  return [a1 gsFontUserFontsCacheInfo];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_knownFontProviderIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 knownFontProviderIdentifiers];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
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

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return [a1 queryMetaDataSync];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_suspendedFontProviders(void *a1, const char *a2, ...)
{
  return [a1 suspendedFontProviders];
}

id objc_msgSend_suspendedFontProvidersInfo(void *a1, const char *a2, ...)
{
  return [a1 suspendedFontProvidersInfo];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_update(void *a1, const char *a2, ...)
{
  return [a1 update];
}

id objc_msgSend_xpcInterface(void *a1, const char *a2, ...)
{
  return [a1 xpcInterface];
}