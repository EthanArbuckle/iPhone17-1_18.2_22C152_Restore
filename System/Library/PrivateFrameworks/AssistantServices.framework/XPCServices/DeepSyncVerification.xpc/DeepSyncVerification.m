int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;

  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_1000053A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

uint64_t sub_100005414(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005424(uint64_t a1)
{
}

void sub_10000542C(void *a1)
{
  id v11 = objc_alloc_init((Class)SASyncDeepSyncVerificationResult);
  [v11 setKey:*(void *)(a1[4] + 24)];
  uint64_t v2 = *(void *)(a1[6] + 8);
  if (*(void *)(v2 + 40))
  {
    v3 = [*(id *)(a1[4] + 16) componentsJoinedByString:@"\n"];
    [v11 setText:v3];
  }
  else
  {
    id v4 = SASyncDeepVerificationResultTypeSUCCESSValue;
    v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = v4;
  }

  [v11 setResult:*(void *)(*(void *)(a1[6] + 8) + 40)];
  (*(void (**)(void))(a1[5] + 16))();
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v6 = a1[4];
  v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v5;

  id v8 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v9 = a1[4];
  v10 = *(void **)(v9 + 16);
  *(void *)(v9 + 16) = v8;
}

void sub_100005544(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 bundleIdentifier];
  [*(id *)(a1 + 32) setObject:v3 forKey:v5];

  id v4 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKey:v5];

  if (v4) {
    [*(id *)(a1 + 48) addObject:v5];
  }
}

void sub_100006BF0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_100006C44(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    id v2 = objc_alloc_init((Class)SASyncDeepSyncVerificationResult);
    [v2 setKey:*(void *)(*(void *)(a1 + 32) + 32)];
    [v2 setResult:*(void *)(*(void *)(a1 + 32) + 16)];
    id v3 = [*(id *)(*(void *)(a1 + 32) + 24) componentsJoinedByString:@"\n"];
    [v2 setText:v3];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v4 = AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      v14 = "-[DSVServiceProviderContacts verifySyncDataWithCompletion:]_block_invoke";
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s No verification result defined due to error encountered during verification", (uint8_t *)&v13, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v5;

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 16);
  *(void *)(v8 + 16) = 0;

  id v10 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v11 = *(void *)(a1 + 32);
  v12 = *(void **)(v11 + 24);
  *(void *)(v11 + 24) = v10;
}

void sub_100006DD8(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (*(void *)(a1 + 32))
  {
    *a3 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  }
  else
  {
    v7 = [v5 identifier];
    if ([v7 length])
    {
      uint64_t v8 = [*(id *)(*(void *)(a1 + 48) + 8) objectForKey:v7];

      if (v8)
      {
        [*(id *)(a1 + 56) addObject:v7];
        [*(id *)(a1 + 64) setObject:v6 forKey:v7];
      }
      else
      {
        id v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%d", objc_msgSend(v6, "iOSLegacyIdentifier"));
        if (v10
          && ([*(id *)(*(void *)(a1 + 48) + 8) objectForKey:v10],
              uint64_t v11 = objc_claimAutoreleasedReturnValue(),
              v11,
              v11))
        {
          [*(id *)(a1 + 56) addObject:v10];
          v12 = *(void **)(a1 + 64);
          int v13 = v6;
          id v14 = v10;
        }
        else
        {
          v12 = *(void **)(a1 + 64);
          int v13 = v6;
          id v14 = v7;
        }
        [v12 setObject:v13 forKey:v14];
      }
    }
    else
    {
      uint64_t v9 = AFSiriLogContextSync;
      if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        v17 = "-[DSVServiceProviderContacts verifySyncDataWithCompletion:]_block_invoke";
        __int16 v18 = 2112;
        uint64_t v19 = v15;
        __int16 v20 = 2112;
        v21 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Fetch request %@ failed to get contact identifier for contact %@", buf, 0x20u);
      }
      *a3 = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    }
  }
}

void sub_100006FD8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v8 = [*(id *)(a1 + 32) objectForKey:v5];
  uint64_t v9 = [v6 dsvDiffAgainstCNContact:v8];
  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), SASyncDeepVerificationResultTypeFIELD_MISMATCHValue);
    id v10 = [v6 identifier];
    uint64_t v11 = +[NSString stringWithValidatedFormat:@"Field level mismatch for %@: %@", @"%@%@", 0, v10, v9 validFormatSpecifiers error];

    v12 = AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "-[DSVServiceProviderContacts verifySyncDataWithCompletion:]_block_invoke";
      __int16 v15 = 2112;
      v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }
    [*(id *)(*(void *)(a1 + 40) + 24) addObject:v11];
  }
}

void sub_100008100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100008118(void *a1)
{
  id v1 = a1;
  id v2 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v1, "count"));
  id v3 = [v1 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v5 = v1;
    id v6 = [v5 countByEnumeratingWithState:&v60 objects:v67 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v61;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v61 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v60 + 1) + 8 * i) label];
          uint64_t v11 = (void *)v10;
          if (v10) {
            v12 = (__CFString *)v10;
          }
          else {
            v12 = @"<NULL>";
          }
          int v13 = v12;

          [v2 addObject:v13];
        }
        id v7 = [v5 countByEnumeratingWithState:&v60 objects:v67 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v14 = [v1 firstObject];
    objc_opt_class();
    char v15 = objc_opt_isKindOfClass();

    if (v15)
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v16 = v1;
      id v17 = [v16 countByEnumeratingWithState:&v56 objects:v66 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v57;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v57 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = [*(id *)(*((void *)&v56 + 1) + 8 * (void)j) label];
            v22 = (void *)v21;
            if (v21) {
              v23 = (__CFString *)v21;
            }
            else {
              v23 = @"<NULL>";
            }
            v24 = v23;

            [v2 addObject:v24];
          }
          id v18 = [v16 countByEnumeratingWithState:&v56 objects:v66 count:16];
        }
        while (v18);
      }
    }
    else
    {
      v25 = [v1 firstObject];
      objc_opt_class();
      char v26 = objc_opt_isKindOfClass();

      if (v26)
      {
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v27 = v1;
        id v28 = [v27 countByEnumeratingWithState:&v52 objects:v65 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v53;
          do
          {
            for (k = 0; k != v29; k = (char *)k + 1)
            {
              if (*(void *)v53 != v30) {
                objc_enumerationMutation(v27);
              }
              uint64_t v32 = [*(id *)(*((void *)&v52 + 1) + 8 * (void)k) label];
              v33 = (void *)v32;
              if (v32) {
                v34 = (__CFString *)v32;
              }
              else {
                v34 = @"<NULL>";
              }
              v35 = v34;

              [v2 addObject:v35];
            }
            id v29 = [v27 countByEnumeratingWithState:&v52 objects:v65 count:16];
          }
          while (v29);
        }
      }
      else
      {
        v36 = [v1 firstObject];
        objc_opt_class();
        char v37 = objc_opt_isKindOfClass();

        if ((v37 & 1) == 0) {
          goto LABEL_49;
        }
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v38 = v1;
        id v39 = [v38 countByEnumeratingWithState:&v48 objects:v64 count:16];
        if (v39)
        {
          id v40 = v39;
          uint64_t v41 = *(void *)v49;
          do
          {
            for (m = 0; m != v40; m = (char *)m + 1)
            {
              if (*(void *)v49 != v41) {
                objc_enumerationMutation(v38);
              }
              uint64_t v43 = objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * (void)m), "label", (void)v48);
              v44 = (void *)v43;
              if (v43) {
                v45 = (__CFString *)v43;
              }
              else {
                v45 = @"<NULL>";
              }
              v46 = v45;

              [v2 addObject:v46];
            }
            id v40 = [v38 countByEnumeratingWithState:&v48 objects:v64 count:16];
          }
          while (v40);
        }
      }
    }
  }

LABEL_49:
  return v2;
}

void sub_100008590(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v32 = a2;
  id v7 = [*(id *)(a1 + 32) objectAtIndex:a3];
  uint64_t v8 = [v32 label];
  if (!v8) {
    goto LABEL_8;
  }
  uint64_t v9 = (void *)v8;
  uint64_t v10 = [v32 name];
  if (!v10)
  {
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v11 = (void *)v10;
  v12 = [v32 label];
  int v13 = [v7 label];
  if (![v12 isEqualToString:v13])
  {

    goto LABEL_7;
  }
  [v32 name];
  v15 = id v14 = a4;
  id v16 = [v7 value];
  id v17 = [v16 name];
  unsigned __int8 v31 = [v15 isEqualToString:v17];

  a4 = v14;
  if (v31) {
    goto LABEL_20;
  }
LABEL_8:
  id v18 = [v32 label];
  if (v18 || ([v7 label], (id v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    v22 = [v32 name];
    v23 = [v7 value];
    v24 = [v23 name];
    unsigned __int8 v25 = [v22 isEqualToString:v24];

    if (v25) {
      goto LABEL_20;
    }
  }
  uint64_t v19 = [v32 name];
  if (!v19)
  {
    uint64_t v19 = [v7 value];
    __int16 v20 = [v19 name];
    if (!v20)
    {
      char v26 = [v32 label];
      id v27 = [v7 label];
      unsigned __int8 v28 = [v26 isEqualToString:v27];

      if (v28) {
        goto LABEL_20;
      }
      goto LABEL_15;
    }
  }
LABEL_15:
  uint64_t v21 = [v32 label];
  if (v21
    || ([v7 label], (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v32 name], (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_19:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_20;
  }
  id v29 = [v7 value];
  uint64_t v30 = [v29 name];

  if (v30) {
    goto LABEL_19;
  }
LABEL_20:
}

int64_t sub_10000884C(id a1, CNLabeledValue *a2, CNLabeledValue *a3)
{
  id v4 = a3;
  id v5 = [(CNLabeledValue *)a2 label];
  id v6 = [(CNLabeledValue *)v4 label];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

int64_t sub_1000088BC(id a1, SARelatedName *a2, SARelatedName *a3)
{
  id v4 = a3;
  id v5 = [(SARelatedName *)a2 label];
  id v6 = [(SARelatedName *)v4 label];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_100008B24(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) count]
    && [*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    id v2 = objc_alloc_init((Class)NSMutableArray);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v3 = *(id *)(*(void *)(a1 + 32) + 16);
    id v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v19;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 8);
          uint64_t v10 = [v8 currentVerificationKey];
          LODWORD(v9) = [v9 containsObject:v10];

          if (v9)
          {
            v14[0] = _NSConcreteStackBlock;
            v14[1] = 3221225472;
            v14[2] = sub_100008DA4;
            v14[3] = &unk_10000C490;
            v14[4] = *(void *)(a1 + 32);
            id v15 = v2;
            id v16 = v8;
            id v17 = *(id *)(a1 + 40);
            [v8 verifySyncDataWithCompletion:v14];
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v5);
    }
  }
  else
  {
    uint64_t v11 = AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)buf = 136315650;
      v24 = "-[DeepSyncVerificationService getVerificationResultsWithHandler:]_block_invoke";
      __int16 v25 = 2112;
      uint64_t v26 = v13;
      __int16 v27 = 2112;
      uint64_t v28 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s No verification providers or keys in verification: %@ %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100008DA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008E74;
  block[3] = &unk_10000C468;
  id v11 = v3;
  uint64_t v12 = v4;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void **)(a1 + 56);
  id v13 = v6;
  uint64_t v14 = v7;
  id v15 = v8;
  id v9 = v3;
  dispatch_async(v5, block);
}

id sub_100008E74(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = *(void **)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = [v2 key];
    [v3 removeObject:v4];

    id v5 = *(void **)(a1 + 48);
    id v6 = [*(id *)(a1 + 32) dictionary];
    [v5 addObject:v6];
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 56) currentVerificationKey];
    uint64_t v8 = AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 56);
      int v13 = 136315650;
      uint64_t v14 = "-[DeepSyncVerificationService getVerificationResultsWithHandler:]_block_invoke_2";
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      long long v18 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Failed to get any result from provider %@ for key %@", (uint8_t *)&v13, 0x20u);
    }
    [*(id *)(*(void *)(a1 + 40) + 8) removeObject:v7];
  }
  id result = [*(id *)(*(void *)(a1 + 40) + 8) count];
  if (!result)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = *(void **)(v10 + 8);
    *(void *)(v10 + 8) = 0;

    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  return result;
}

void sub_100009088(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) key];
  if ([*(id *)(*(void *)(a1 + 40) + 8) containsObject:v2])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v3 = *(id *)(*(void *)(a1 + 40) + 16);
    id v4 = [v3 countByEnumeratingWithState:&v16 objects:v26 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v8, "canHandleSyncChunk:", *(void *)(a1 + 32), (void)v16))
          {
            [v8 handleSyncChunk:*(void *)(a1 + 32)];

            goto LABEL_16;
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v16 objects:v26 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    id v9 = AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      long long v21 = "-[DeepSyncVerificationService handleSyncChunk:]_block_invoke";
      __int16 v22 = 2112;
      v23 = v10;
      id v11 = "%s No verification provider can handle sync data: %@";
      uint64_t v12 = v9;
      uint32_t v13 = 22;
LABEL_14:
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    }
  }
  else
  {
    uint64_t v14 = AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      *(_DWORD *)buf = 136315650;
      long long v21 = "-[DeepSyncVerificationService handleSyncChunk:]_block_invoke";
      __int16 v22 = 2112;
      v23 = v2;
      __int16 v24 = 2112;
      uint64_t v25 = v15;
      id v11 = "%s Received sync chunk with key %@ that's not in our current verification keys %@";
      uint64_t v12 = v14;
      uint32_t v13 = 32;
      goto LABEL_14;
    }
  }
LABEL_16:
}

id sub_100009340(uint64_t a1)
{
  id v2 = [objc_alloc((Class)NSMutableSet) initWithArray:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  id v5 = *(void **)(a1 + 32);
  return [v5 _prepareVerificationServiceProviders];
}

uint64_t AFApplicationWorkspaceEnumerateInstalledUserVisibleApplications()
{
  return _AFApplicationWorkspaceEnumerateInstalledUserVisibleApplications();
}

uint64_t AFLogInitIfNeeded()
{
  return _AFLogInitIfNeeded();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_adamId(void *a1, const char *a2, ...)
{
  return [a1 adamId];
}

id objc_msgSend_addresses(void *a1, const char *a2, ...)
{
  return [a1 addresses];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_appIdentifyingInfo(void *a1, const char *a2, ...)
{
  return [a1 appIdentifyingInfo];
}

id objc_msgSend_appName(void *a1, const char *a2, ...)
{
  return [a1 appName];
}

id objc_msgSend_betaApp(void *a1, const char *a2, ...)
{
  return [a1 betaApp];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buildNumber(void *a1, const char *a2, ...)
{
  return [a1 buildNumber];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return [a1 bundleId];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return [a1 bundleVersion];
}

id objc_msgSend_carPlayAlternativeDisplayName(void *a1, const char *a2, ...)
{
  return [a1 carPlayAlternativeDisplayName];
}

id objc_msgSend_company(void *a1, const char *a2, ...)
{
  return [a1 company];
}

id objc_msgSend_contactRelations(void *a1, const char *a2, ...)
{
  return [a1 contactRelations];
}

id objc_msgSend_contactType(void *a1, const char *a2, ...)
{
  return [a1 contactType];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentVerificationKey(void *a1, const char *a2, ...)
{
  return [a1 currentVerificationKey];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_displayAppName(void *a1, const char *a2, ...)
{
  return [a1 displayAppName];
}

id objc_msgSend_dsvDescription(void *a1, const char *a2, ...)
{
  return [a1 dsvDescription];
}

id objc_msgSend_dsvIdentifier(void *a1, const char *a2, ...)
{
  return [a1 dsvIdentifier];
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return [a1 emailAddresses];
}

id objc_msgSend_emails(void *a1, const char *a2, ...)
{
  return [a1 emails];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return [a1 familyName];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return [a1 firstName];
}

id objc_msgSend_firstNamePhonetic(void *a1, const char *a2, ...)
{
  return [a1 firstNamePhonetic];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return [a1 givenName];
}

id objc_msgSend_hasSiriIntegration(void *a1, const char *a2, ...)
{
  return [a1 hasSiriIntegration];
}

id objc_msgSend_iOSLegacyIdentifier(void *a1, const char *a2, ...)
{
  return [a1 iOSLegacyIdentifier];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_internalGUID(void *a1, const char *a2, ...)
{
  return [a1 internalGUID];
}

id objc_msgSend_isBetaApp(void *a1, const char *a2, ...)
{
  return [a1 isBetaApp];
}

id objc_msgSend_itemID(void *a1, const char *a2, ...)
{
  return [a1 itemID];
}

id objc_msgSend_itemName(void *a1, const char *a2, ...)
{
  return [a1 itemName];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return [a1 lastName];
}

id objc_msgSend_lastNamePhonetic(void *a1, const char *a2, ...)
{
  return [a1 lastNamePhonetic];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_middleName(void *a1, const char *a2, ...)
{
  return [a1 middleName];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_namePrefix(void *a1, const char *a2, ...)
{
  return [a1 namePrefix];
}

id objc_msgSend_nameSuffix(void *a1, const char *a2, ...)
{
  return [a1 nameSuffix];
}

id objc_msgSend_nickName(void *a1, const char *a2, ...)
{
  return [a1 nickName];
}

id objc_msgSend_nickname(void *a1, const char *a2, ...)
{
  return [a1 nickname];
}

id objc_msgSend_organizationName(void *a1, const char *a2, ...)
{
  return [a1 organizationName];
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return [a1 phoneNumbers];
}

id objc_msgSend_phones(void *a1, const char *a2, ...)
{
  return [a1 phones];
}

id objc_msgSend_phoneticFamilyName(void *a1, const char *a2, ...)
{
  return [a1 phoneticFamilyName];
}

id objc_msgSend_phoneticGivenName(void *a1, const char *a2, ...)
{
  return [a1 phoneticGivenName];
}

id objc_msgSend_postalAddresses(void *a1, const char *a2, ...)
{
  return [a1 postalAddresses];
}

id objc_msgSend_prefix(void *a1, const char *a2, ...)
{
  return [a1 prefix];
}

id objc_msgSend_providerName(void *a1, const char *a2, ...)
{
  return [a1 providerName];
}

id objc_msgSend_relatedNames(void *a1, const char *a2, ...)
{
  return [a1 relatedNames];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_shortVersionString(void *a1, const char *a2, ...)
{
  return [a1 shortVersionString];
}

id objc_msgSend_spokenName(void *a1, const char *a2, ...)
{
  return [a1 spokenName];
}

id objc_msgSend_spotlightName(void *a1, const char *a2, ...)
{
  return [a1 spotlightName];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_suffix(void *a1, const char *a2, ...)
{
  return [a1 suffix];
}

id objc_msgSend_supportedIntents(void *a1, const char *a2, ...)
{
  return [a1 supportedIntents];
}

id objc_msgSend_supportsUniversalSearchSubscription(void *a1, const char *a2, ...)
{
  return [a1 supportsUniversalSearchSubscription];
}

id objc_msgSend_toAdd(void *a1, const char *a2, ...)
{
  return [a1 toAdd];
}

id objc_msgSend_toRemove(void *a1, const char *a2, ...)
{
  return [a1 toRemove];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_vendorName(void *a1, const char *a2, ...)
{
  return [a1 vendorName];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}