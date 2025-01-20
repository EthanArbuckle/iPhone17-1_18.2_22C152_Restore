void sub_5D7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;

  v4 = *(void *)(a1 + 40);
  v5 = AFSiriLogContextPlugin;
  v6 = os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      v7 = objc_opt_class();
      v8 = *(void *)(a1 + 32);
      v11 = 136315906;
      v12 = "-[AAPCommandLaunch performWithCompletion:serviceHelper:executionInfo:]_block_invoke";
      v13 = 2114;
      v14 = v7;
      v15 = 2048;
      v16 = v8;
      v17 = 2112;
      v18 = a2;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: <%{public}@:%p> sending response = %@", (uint8_t *)&v11, 0x2Au);
      v4 = *(void *)(a1 + 40);
    }
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  }
  else if (v6)
  {
    v9 = objc_opt_class();
    v10 = *(void *)(a1 + 32);
    v11 = 136315906;
    v12 = "-[AAPCommandLaunch performWithCompletion:serviceHelper:executionInfo:]_block_invoke";
    v13 = 2114;
    v14 = v9;
    v15 = 2048;
    v16 = v10;
    v17 = 2112;
    v18 = a2;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: <%{public}@:%p> no completion block - dropping response = %@", (uint8_t *)&v11, 0x2Au);
  }
}

void sub_5EF8(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a3
    || (id v5 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKey:", NSUnderlyingErrorKey)) != 0
    && (v6 = v5, [v5 code] == (char *)&dword_4 + 2)
    && (id v7 = objc_msgSend(objc_msgSend(v6, "userInfo"), "objectForKey:", NSUnderlyingErrorKey)) != 0
    && ((v8 = v7,
         id v9 = [v7 domain],
         v10 = (int *)[v8 code],
         [v9 isEqualToString:RBSRequestErrorDomain])
      ? (BOOL v11 = v10 == &dword_8)
      : (BOOL v11 = 0),
        v11))
  {
    v13 = AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      int v18 = 136315906;
      v19 = "-[AAPCommandLaunch performWithCompletion:serviceHelper:executionInfo:]_block_invoke";
      __int16 v20 = 2114;
      uint64_t v21 = v14;
      __int16 v22 = 2048;
      uint64_t v23 = v15;
      __int16 v24 = 2112;
      uint64_t v25 = v16;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: <%{public}@:%p> launched app (%@)", (uint8_t *)&v18, 0x2Au);
    }
    v12 = (Class *)SACommandSucceeded_ptr;
  }
  else
  {
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_13B78(a1, a3);
    }
    v12 = (Class *)SACommandFailed_ptr;
  }
  id v17 = objc_alloc_init(*v12);
  (*(void (**)(void, id))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), [v17 dictionary]);
}

void sub_6C00(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc_init((Class)SAAppsAppSearchResponse);
  [v4 setFoundApps:a2];
  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v4 dictionary]);
}

id sub_6C78(uint64_t a1, void *a2)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id result = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    id v5 = result;
    uint64_t v6 = *(void *)v13;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(a2);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v7);
        id v9 = objc_msgSend(objc_msgSend(v8, "attributeSet"), "uniqueIdentifier");
        id v10 = +[LSApplicationProxy applicationProxyForIdentifier:v9];
        if (objc_msgSend(objc_msgSend(v10, "appState"), "isValid"))
        {
          id v11 = objc_alloc_init((Class)SASyncNamedAppIdentifyingInfo);
          [v11 setBundleId:v9];
          objc_msgSend(v11, "setLocalizedBundleDisplayName:", objc_msgSend(objc_msgSend(v8, "attributeSet"), "displayName"));
          objc_msgSend(v11, "setVersion:", objc_msgSend(v10, "shortVersionString"));
          objc_msgSend(v11, "setBuildNumber:", objc_msgSend(v10, "bundleVersion"));
          [*(id *)(a1 + 32) addObject:v11];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id result = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      id v5 = result;
    }
    while (result);
  }
  return result;
}

void sub_6E04(uint64_t a1, uint64_t a2)
{
  v3 = AFSiriLogContextPlugin;
  if (a2)
  {
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_13D04(a1, a2, v3);
    }
    id v5 = objc_alloc_init((Class)SACommandFailed);
    (*(void (**)(void, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [v5 dictionary]);
  }
  else
  {
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
    {
      id v6 = [*(id *)(a1 + 32) foundItemCount];
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 136315906;
      id v10 = "-[AAPCommandSearch performWithCompletion:]_block_invoke";
      __int16 v11 = 2048;
      id v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%s Found %tu apps matching query %@: %@", (uint8_t *)&v9, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

id sub_735C(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 bundleIdentifier];

  return [v2 addObject:v3];
}

void sub_746C(uint64_t a1)
{
  id v3 = objc_alloc_init(AAPSyncStatePersistence);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = a1 + 32;
  *(void *)(v5 + 16) = v3;
  id v6 = [*(id *)(*(void *)v4 + 16) load];
  uint64_t v7 = AFSiriLogContextPlugin;
  if (v6)
  {
    uint64_t v8 = v6;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_13E2C(v8, v7);
    }
  }
  else if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG))
  {
    sub_13DA0(v4);
  }
}

void sub_7B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_7B34(uint64_t a1, uint64_t a2)
{
}

void sub_7B44(uint64_t a1)
{
}

id sub_7B50(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) state];
  id v3 = objc_opt_class();
  id v4 = objc_msgSend(objc_msgSend(v2, "startAnchor"), "stringRepresentation");
  id v5 = [v2 validity];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_7C30;
  v8[3] = &unk_20870;
  uint64_t v6 = *(void *)(a1 + 40);
  v8[4] = v2;
  v8[5] = v6;
  return [v3 _checkIfResetIsNeededForKey:@"com.apple.siri.applications" withStartAnchorString:v4 validity:v5 lastState:v2 completion:v8];
}

void *sub_7C30(void *result, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    id v5 = result;
    if (a2) {
      id v6 = +[AAPSyncMetaDataSource projectedStateForKeyAnchor:a4 withValidity:a5];
    }
    else {
      id v6 = (id)result[4];
    }
    *(void *)(*(void *)(v5[5] + 8) + 40) = objc_alloc_init((Class)AFSyncSnapshot);
    [*(id *)(*(void *)(v5[5] + 8) + 40) setKey:@"com.apple.siri.applications"];
    objc_msgSend(*(id *)(*(void *)(v5[5] + 8) + 40), "setAnchor:", objc_msgSend(objc_msgSend(v6, "stopAnchor"), "stringRepresentation"));
    objc_msgSend(*(id *)(*(void *)(v5[5] + 8) + 40), "setValidity:", objc_msgSend(v6, "validity"));
    uint64_t v7 = *(void **)(*(void *)(v5[5] + 8) + 40);
    id v8 = objc_msgSend(objc_msgSend(v6, "apps"), "count");
    return _[v7 setCount:v8];
  }
  return result;
}

id sub_7DA8(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) state];
  id v3 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_7E54;
  v8[3] = &unk_208C0;
  v8[4] = *(void *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 64);
  id v10 = v2;
  return [v3 _checkIfResetIsNeededForKey:v4 withStartAnchorString:v5 validity:v6 lastState:v2 completion:v8];
}

void sub_7E54(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  uint64_t v7 = a1 + 32;
  *(void *)(*(void *)(a1 + 32) + 24) = 0;
  if (!a4 || !a5)
  {
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_14394();
    }
    goto LABEL_18;
  }
  if (a2)
  {
    long long v9 = AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v27 = 136315650;
      *(void *)&v27[4] = "-[AAPSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:configuration:]_block_invoke_2";
      *(_WORD *)&v27[12] = 2114;
      *(void *)&v27[14] = a4;
      *(_WORD *)&v27[22] = 2114;
      id v28 = a5;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: resetting for new key = %{public}@ with validity = '%{public}@'", v27, 0x20u);
    }
    [*(id *)(a1 + 40) resetWithValidity:a5];
    id v10 = [AAPSyncMetaDataSource alloc];
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    goto LABEL_17;
  }
  if (!objc_msgSend(a4, "isEqualToAnchor:", objc_msgSend(*(id *)(a1 + 56), "keyAnchor")))
  {
    int v18 = AFSiriLogContextPlugin;
    if (!os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
    {
LABEL_16:
      id v10 = [AAPSyncMetaDataSource alloc];
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v14 = a3;
LABEL_17:
      *(void *)(*(void *)(a1 + 32) + 24) = -[AAPSyncMetaDataSource initWithLastState:startAnchor:keyAnchor:validity:configuration:observer:](v10, "initWithLastState:startAnchor:keyAnchor:validity:configuration:observer:", v13, v14, a4, a5, v11, v12, *(_OWORD *)v27, *(void *)&v27[16], v28, *(_OWORD *)v29, *(void *)&v29[16]);
LABEL_18:
      uint64_t v21 = *(void **)(*(void *)v7 + 32);
      if (v21)
      {
        __int16 v22 = AFSiriLogContextPlugin;
        if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v27 = 136315394;
          *(void *)&v27[4] = "-[AAPSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:configuration:]_block_invoke";
          *(_WORD *)&v27[12] = 2048;
          *(void *)&v27[14] = v21;
          _os_log_debug_impl(&dword_0, v22, OS_LOG_TYPE_DEBUG, "%s com.apple.siri.applications: releasing old processor -> %p", v27, 0x16u);
          uint64_t v21 = *(void **)(*(void *)v7 + 32);
        }
      }
      goto LABEL_22;
    }
    id v19 = [*(id *)(a1 + 56) keyAnchor];
    *(_DWORD *)v27 = 136316162;
    *(void *)&v27[4] = "-[AAPSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:configuration:]_block_invoke";
    *(_WORD *)&v27[12] = 2114;
    *(void *)&v27[14] = a5;
    *(_WORD *)&v27[22] = 2114;
    id v28 = a3;
    *(_WORD *)v29 = 2114;
    *(void *)&v29[2] = v19;
    *(_WORD *)&v29[10] = 2114;
    *(void *)&v29[12] = a4;
    __int16 v20 = "%s com.apple.siri.applications: reconciling changes with validity = '%{public}@' : start=%{public}@ lastKey=%{"
          "public}@ key=%{public}@";
LABEL_15:
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, v20, v27, 0x34u);
    goto LABEL_16;
  }
  if (!*(void *)(*(void *)v7 + 32))
  {
    unsigned int v23 = objc_msgSend(a3, "isEqualToAnchor:", objc_msgSend(*(id *)(a1 + 56), "stopAnchor"));
    int v18 = AFSiriLogContextPlugin;
    BOOL v24 = os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO);
    if (v23)
    {
      if (v24)
      {
        id v25 = [*(id *)(a1 + 56) stopAnchor];
        *(_DWORD *)v27 = 136315906;
        *(void *)&v27[4] = "-[AAPSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:configuration:]_block_invoke";
        *(_WORD *)&v27[12] = 2114;
        *(void *)&v27[14] = a4;
        *(_WORD *)&v27[22] = 2114;
        id v28 = v25;
        *(_WORD *)v29 = 2114;
        *(void *)&v29[2] = a5;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: up-to-date for key = %{public}@ (%{public}@) with validity = '%{public}@'", v27, 0x2Au);
      }
      goto LABEL_18;
    }
    if (!v24) {
      goto LABEL_16;
    }
    id v26 = [*(id *)(a1 + 56) keyAnchor];
    *(_DWORD *)v27 = 136316162;
    *(void *)&v27[4] = "-[AAPSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:configuration:]_block_invoke";
    *(_WORD *)&v27[12] = 2114;
    *(void *)&v27[14] = a5;
    *(_WORD *)&v27[22] = 2114;
    id v28 = a3;
    *(_WORD *)v29 = 2114;
    *(void *)&v29[2] = v26;
    *(_WORD *)&v29[10] = 2114;
    *(void *)&v29[12] = a4;
    __int16 v20 = "%s com.apple.siri.applications: looking up changes not in saved state with validity = '%{public}@' : start=%{p"
          "ublic}@ lastKey=%{public}@ key=%{public}@";
    goto LABEL_15;
  }
  uint64_t v16 = AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
  {
    id v17 = [*(id *)(a1 + 56) stopAnchor];
    *(_DWORD *)v27 = 136315906;
    *(void *)&v27[4] = "-[AAPSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:configuration:]_block_invoke";
    *(_WORD *)&v27[12] = 2114;
    *(void *)&v27[14] = a4;
    *(_WORD *)&v27[22] = 2114;
    id v28 = v17;
    *(_WORD *)v29 = 2114;
    *(void *)&v29[2] = a5;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: reusing previous processor for key = %{public}@ (%{public}@) with validity = '%{public}@'", v27, 0x2Au);
  }
LABEL_22:
  if (*(void *)(*(void *)v7 + 24))
  {
    *(void *)(*(void *)v7 + 32) = [[AAPSyncMetaDataProcessor alloc] initWithSource:*(void *)(*(void *)v7 + 24)];
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
      sub_142FC();
    }
  }
}

void sub_8514(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = *(void **)(a1 + 32);
  if (v3 == *(void **)(v1 + 24))
  {
    id v12 = [v3 state];
    if (v12
      && (id v13 = v12,
          (objc_msgSend(v12, "isEqual:", objc_msgSend(*(id *)(*(void *)v2 + 16), "state")) & 1) == 0))
    {
      id v22 = [*(id *)(*(void *)v2 + 16) save:v13];
      unsigned int v23 = AFSiriLogContextPlugin;
      if (v22)
      {
        uint64_t v24 = (uint64_t)v22;
        if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
          sub_14614(v24, v23, v25, v26, v27, v28, v29, v30);
        }
      }
      else if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG))
      {
        sub_14588(v2);
      }
    }
    else
    {
      uint64_t v14 = AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
        sub_14510(v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
  }
  else
  {
    uint64_t v4 = AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
      sub_14694(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

void sub_8640(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_865C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_8694(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_86A0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_8784(id *a1)
{
  uint64_t v1 = a1;
  [a1[4] waitUntilReady];
  id v2 = objc_msgSend(objc_msgSend(v1[4], "metaData"), "copy");
  id v3 = v1[5];
  v1 += 5;
  v3[2] = v2;
  *((void *)*v1 + 3) = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(*v1, "_queue_updateCache");
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
    sub_1470C();
  }
}

id sub_88DC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_processNextChange:afterAnchor:withInitialAnchor:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 48));
}

id sub_8E24(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSAutoreleasePool);
  id v3 = [*(id *)(a1 + 32) scrapeAppInfo];
  [*(id *)(*(void *)(a1 + 40) + 56) lock];
  uint64_t v4 = *(void *)(a1 + 40);
  unint64_t v5 = *(void *)(a1 + 56);
  if (*(void *)(v4 + 40) > v5 || v5 >= *(void *)(v4 + 48))
  {
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
      sub_14BF8();
    }
  }
  else
  {
    uint64_t v6 = AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      int v9 = 136315394;
      uint64_t v10 = "-[AAPSyncMetaDataProcessor _queue_updateCache]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_debug_impl(&dword_0, v6, OS_LOG_TYPE_DEBUG, "%s com.apple.siri.applications: finished cache update for appId='%@'", (uint8_t *)&v9, 0x16u);
      uint64_t v4 = *(void *)(a1 + 40);
    }
    [*(id *)(v4 + 32) setObject:v3 forKey:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 40) + 56) signal];
  }
  [*(id *)(*(void *)(a1 + 40) + 56) unlock];
  return [v2 drain];
}

void sub_8FA0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id sub_92C4(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSAutoreleasePool);
  *(void *)(*(void *)(a1 + 32) + 16) = [(id)objc_opt_class() _createSourceInfoForLastState:*(void *)(a1 + 40) startAnchor:*(void *)(a1 + 48) keyAnchor:*(void *)(a1 + 56) validity:*(void *)(a1 + 64) configuration:*(void *)(a1 + 72)];
  *(void *)(*(void *)(a1 + 32) + 8) = v3;
  [*(id *)(a1 + 80) sourceIsReady:*(void *)(a1 + 32)];
  uint64_t v4 = AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
    sub_14C70(v4);
  }
  return [v2 drain];
}

void sub_9C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_9C7C(uint64_t a1, uint64_t a2)
{
}

void sub_9C8C(uint64_t a1)
{
}

void sub_9C98(uint64_t a1, void *a2)
{
  id v4 = [a2 bundleIdentifier];
  id v5 = +[AAPSyncPrimitiveAnchor anchorFromIndex:](AAPSyncPrimitiveAnchor, "anchorFromIndex:", [a2 sequenceNumber]);
  [*(id *)(a1 + 32) removeObject:v4];
  [*(id *)(a1 + 40) addObject:v4];
  uint64_t v6 = [[AAPSyncMetaDataItemUpdate alloc] initWithAppId:v4 appProxy:a2 anchor:v5 configuration:*(void *)(a1 + 48)];
  [*(id *)(a1 + 56) addObject:v6];

  unsigned int v7 = [v5 isNewerThanAnchor:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  uint64_t v8 = AFSiriLogContextPlugin;
  if (v7)
  {
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      int v10 = 136315650;
      __int16 v11 = "+[AAPSyncMetaDataSource _createSourceInfoForLastState:startAnchor:keyAnchor:validity:configuration:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v6;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: gathered metaDataItem=%@ - adjusting for an anchor newer than the key (%{public}@)", (uint8_t *)&v10, 0x20u);
    }
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v5;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  else if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG))
  {
    sub_14E5C();
  }
}

int64_t sub_9E4C(id a1, id a2, id a3)
{
  id v4 = [a2 anchor];
  id v5 = [a3 anchor];

  return (int64_t)[v4 compare:v5];
}

id AAPSyncInfoIdentifierForAppId(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSURLComponents);
  [v2 setScheme:@"x-apple-siri-app"];
  [v2 setHost:a1];
  id v3 = [v2 URL];

  return v3;
}

id AAPSyncInfoIsValidForItem(void *a1, void *a2)
{
  id v4 = [a1 identifier];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  if (!objc_msgSend(objc_msgSend(v4, "scheme"), "isEqualToString:", @"x-apple-siri-app")
    || !objc_msgSend(objc_msgSend(v5, "host"), "length"))
  {
    return 0;
  }
  if ([a2 isMetaDataItemUpdate])
  {
    id v6 = objc_msgSend(objc_msgSend(a1, "appIdentifyingInfo"), "bundleId");
    if (v6)
    {
      unsigned int v7 = v6;
      if ([v6 length])
      {
        if (objc_msgSend(v7, "isEqualToString:", objc_msgSend(a2, "appId")))
        {
          return _AAPSyncInfoHasSomeName(a1);
        }
      }
    }
    return 0;
  }

  return [a2 isMetaDataItemDelete];
}

id _AAPSyncInfoHasSomeName(void *a1)
{
  if (objc_msgSend(objc_msgSend(a1, "displayAppName"), "length")) {
    return &dword_0 + 1;
  }
  if (objc_msgSend(objc_msgSend(a1, "appName"), "length")) {
    return &dword_0 + 1;
  }
  if (objc_msgSend(objc_msgSend(a1, "spotlightName"), "length")) {
    return &dword_0 + 1;
  }
  id v2 = [a1 displayAppNameMap];
  if (sub_A08C((uint64_t)v2, v2)) {
    return &dword_0 + 1;
  }
  id v3 = [a1 appNameMap];
  if (sub_A08C((uint64_t)v3, v3)) {
    return &dword_0 + 1;
  }
  id v5 = [a1 spotlightNameMap];

  return sub_A08C((uint64_t)v5, v5);
}

id sub_A08C(uint64_t a1, void *a2)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = objc_msgSend(a2, "allValues", 0);
  id result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    id v4 = result;
    uint64_t v5 = *(void *)v8;
    while (2)
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) length]) {
          return &dword_0 + 1;
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      id v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

void sub_AEB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

void sub_AEE0(uint64_t a1, uint64_t a2)
{
}

void sub_AEF0(uint64_t a1)
{
}

void sub_AEFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2)
  {
    id v10 = [objc_alloc((Class)NSString) initWithFormat:a2 arguments:&a9];
    __int16 v11 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v11)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
      __int16 v11 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v11 addObject:v10];
  }
}

uint64_t sub_B054(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 48);
  uint64_t result = v3[3];
  if (result)
  {
    long long v8 = (uint64_t (*)(id, uint64_t, uint64_t))v3[3];
    id v6 = [*(id *)(a1 + 32) objectForKey:*v3];
    uint64_t v7 = *(void *)(a1 + 40);
    return v8(v6, v7, a2);
  }
  return result;
}

NSString *sub_B0C8(uint64_t a1)
{
  return +[NSString stringWithFormat:@"key=%@", **(void **)(a1 + 32)];
}

void sub_C3AC(id a1, SAAppInfo *a2, SEL a3, id a4)
{
  if (a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[AAPSyncMetaDataItemUpdate scrapeAppInfo]_block_invoke"), @"AAPSyncMetaDataItemUpdate.m", 351, @"v is not an object");
    }
    objc_msgSend(a2, a3, a4);
  }
}

void sub_C464(id a1, SAAppInfo *a2, SEL a3, NSNumber *a4)
{
  if (a4)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[AAPSyncMetaDataItemUpdate scrapeAppInfo]_block_invoke"), @"AAPSyncMetaDataItemUpdate.m", 357, @"v does not respond to BOOLValue");
    }
    BOOL v7 = [(NSNumber *)a4 BOOLValue];
    objc_msgSend(a2, a3, v7);
  }
}

id sub_C51C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) lastPathComponent];

  return _[v1 stringByDeletingPathExtension];
}

void *sub_C548(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) isBetaApp]) {
    return &__kCFBooleanTrue;
  }
  else {
    return 0;
  }
}

id sub_C578(uint64_t a1)
{
  BOOL v1 = objc_msgSend(-[INAppInfo supportedIntents](+[INAppInfo appInfoWithAppProxy:](INAppInfo, "appInfoWithAppProxy:", *(void *)(*(void *)(a1 + 32) + 16)), "supportedIntents"), "count") != 0;

  return +[NSNumber numberWithInt:v1];
}

uint64_t sub_C5D8(void *a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void, void, void, void, uint64_t))(a1[8] + 16);
  if (v2) {
    return v2(a1[4], a1[5], a1[6], a1[7], a1[9], a2);
  }
  else {
    return 0;
  }
}

NSString *sub_C604(uint64_t a1)
{
  return +[NSString stringWithFormat:@"aggregateSetter=%s", sel_getName(**(SEL **)(a1 + 32))];
}

void sub_C6DC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void *AAPPlistBoolParser(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (!a1) {
      return 0;
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"NSNumber *AAPPlistBoolParser(id, NSDictionary *, AAPParserErrorLogger)"], @"AAPParser.m", 31, @"Invalid parameter not satisfying: %@", @"errorLogger" file lineNumber description];
    if (!a1) {
      return 0;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"input does not respond to BOOLValue -> %@");
    return 0;
  }
  if ([a1 BOOLValue]) {
    return &__kCFBooleanTrue;
  }
  else {
    return &__kCFBooleanFalse;
  }
}

uint64_t AAPPlistStringParser(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1;
  if (a3)
  {
    if (!a1) {
      return v4;
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"NSString *AAPPlistStringParser(id, NSDictionary *, AAPParserErrorLogger)"], @"AAPParser.m", 63, @"Invalid parameter not satisfying: %@", @"errorLogger" file lineNumber description];
    if (!v4) {
      return v4;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"input is not a NSString -> %@");
    return 0;
  }
  return v4;
}

id AAPPlistStringFromNumberParser(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (!a1) {
      goto LABEL_4;
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"NSString *AAPPlistStringFromNumberParser(id, NSDictionary *, AAPParserErrorLogger)"], @"AAPParser.m", 77, @"Invalid parameter not satisfying: %@", @"errorLogger" file lineNumber description];
    if (!a1) {
      goto LABEL_4;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"input is not a NSNumber -> %@");
    return 0;
  }
LABEL_4:

  return _[a1 stringValue];
}

id AAPAlternativeAppNamesParser(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"NSArray<SASpeakablePhrase *> *AAPAlternativeAppNamesParser(id, NSDictionary *, AAPParserErrorLogger)"], @"AAPParser.m", 94, @"Invalid parameter not satisfying: %@", @"errorLogger" file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a1) {
      (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"altNameInfos is not a NSArray -> %@");
    }
    goto LABEL_26;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [a1 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v5)
  {
LABEL_26:
    id v7 = 0;
    return v7;
  }
  id v6 = v5;
  id v7 = 0;
  uint64_t v8 = *(void *)v22;
  uint64_t v19 = _INAlternativeAppNameKey;
  uint64_t v18 = _INAlternativeAppNamePronunciationHintKey;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v22 != v8) {
        objc_enumerationMutation(a1);
      }
      id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = [v10 objectForKey:v19];
        id v13 = (void *)AAPPlistStringParser((uint64_t)v11, v12, a3);
        if ([v13 length])
        {
          id v20 = 0;
          id v20 = objc_alloc_init((Class)SASpeakablePhrase);
          [v20 setPhrase:v13];
          id v14 = [v10 objectForKey:v18];
          uint64_t v16 = (void *)AAPPlistStringParser((uint64_t)v14, v15, a3);
          if ([v16 length])
          {
            [v20 setPronunciation:v16];
          }
          else if (v16)
          {
            (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"pronunciation of altNameInfo in list was not a valid string -> %@");
          }
          if (v7) {
            [v7 addObject:v20];
          }
          else {
            id v7 = [objc_alloc((Class)NSMutableArray) initWithObjects:&v20 count:1];
          }
        }
        else
        {
          (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"phrase of altNameInfo in list was not a valid string -> %@");
        }
      }
      else
      {
        (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"altNameInfo in list is not a NSDictionary -> %@");
      }
    }
    id v6 = [a1 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v6);
  return v7;
}

id AAPPlistURLTypesSchemesParser(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"NSArray<NSString *> *AAPPlistURLTypesSchemesParser(id, NSDictionary *, AAPParserErrorLogger)"], @"AAPParser.m", 139, @"Invalid parameter not satisfying: %@", @"errorLogger" file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a1) {
      (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"urlTypes is not a NSArray -> %@");
    }
    goto LABEL_32;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v18 = [a1 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (!v18)
  {
LABEL_32:
    id v5 = 0;
    return v5;
  }
  id v5 = 0;
  uint64_t v17 = *(void *)v25;
  uint64_t v16 = _kCFBundleURLSchemesKey;
  do
  {
    uint64_t v6 = 0;
    do
    {
      if (*(void *)v25 != v17) {
        objc_enumerationMutation(a1);
      }
      id v7 = *(void **)(*((void *)&v24 + 1) + 8 * v6);
      objc_opt_class();
      uint64_t v19 = v6;
      if (objc_opt_isKindOfClass())
      {
        id v8 = [v7 objectForKey:v16];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          id v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v21;
            do
            {
              for (i = 0; i != v10; i = (char *)i + 1)
              {
                if (*(void *)v21 != v11) {
                  objc_enumerationMutation(v8);
                }
                id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  if (!v5) {
                    id v5 = objc_alloc_init((Class)NSMutableArray);
                  }
                  objc_msgSend(v5, "addObject:", v13, v15);
                }
                else
                {
                  id v15 = v13;
                  (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"scheme of urlType in list encountered a non-string entry during parsing -> %@");
                }
              }
              id v10 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v10);
          }
        }
        else if (v8)
        {
          id v15 = v8;
          (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"schemes of urlType in list is not a NSArray -> %@");
        }
      }
      else
      {
        id v15 = v7;
        (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"urlType in list is not a NSDictionary -> %@");
      }
      uint64_t v6 = v19 + 1;
    }
    while ((id)(v19 + 1) != v18);
    id v18 = [a1 countByEnumeratingWithState:&v24 objects:v29 count:16];
  }
  while (v18);
  return v5;
}

id AAPPlistSiriSupportParser(void *a1, void *a2, uint64_t a3)
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"SASiriSupport *AAPPlistSiriSupportParser(id, NSDictionary *, AAPParserErrorLogger)"], @"AAPParser.m", 187, @"Invalid parameter not satisfying: %@", @"errorLogger" file lineNumber description];
  }
  id v6 = [a2 objectForKey:@"com.apple.siri.synapse"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v6)
    {
      (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"entitlement (%@) is not a NSNumber -> %@");
    }
    else if (a1)
    {
      (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"intents declared without an entitlement");
    }
    goto LABEL_16;
  }
  if (![v6 BOOLValue])
  {
LABEL_16:
    id v8 = 0;
    return v8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a1) {
      (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"input is not a NSDictionary -> %@");
    }
    goto LABEL_16;
  }
  id v7 = [a1 objectForKey:@"Intents"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"intents is not a NSArray -> %@");
    goto LABEL_16;
  }
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  id v14 = sub_DDB8;
  id v15 = sub_DDC8;
  uint64_t v16 = 0;
  uint64_t v16 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_DDD4;
  v10[3] = &unk_20BA8;
  v10[4] = a3;
  v10[5] = &v11;
  [v7 enumerateObjectsUsingBlock:v10];
  if ([(id)v12[5] count])
  {
    id v8 = objc_alloc_init((Class)SASiriSupport);
    [v8 setUseCases:v12[5]];
  }
  else
  {
    id v8 = 0;
  }
  _Block_object_dispose(&v11, 8);
  return v8;
}

void sub_DDA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_DDB8(uint64_t a1, uint64_t a2)
{
}

void sub_DDC8(uint64_t a1)
{
}

id sub_DDD4(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
  }
  if ([a2 length])
  {
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    return [v4 addObject:a2];
  }
  else
  {
    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return (id)v6();
  }
}

id AAPPlistStarkSupportParser(void *a1, void *a2, uint64_t a3)
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"SAStarkSupport *AAPPlistStarkSupportParser(id, NSDictionary *, AAPParserErrorLogger)"], @"AAPParser.m", 254, @"Invalid parameter not satisfying: %@", @"errorLogger" file lineNumber description];
  }
  id v6 = [objc_alloc((Class)NSMutableSet) initWithCapacity:2];
  id v7 = [a2 objectForKey:@"com.apple.developer.carplay-protocols"];
  objc_opt_class();
  long long v23 = a2;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = SAStarkDisplayModeFullScreenValue;
    id v9 = v6;
LABEL_5:
    [v9 addObject:v8];
    goto LABEL_30;
  }
  if (v7)
  {
    id v22 = v7;
    (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"entitlement (%@) is not a NSArray -> %@");
  }
  if (sub_E3BC(a2, @"SBStarkCapable", a3))
  {
    if (!a1)
    {
      uint64_t v8 = SAStarkDisplayModeFullScreenValue;
      id v9 = v6;
      goto LABEL_5;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v10 = [a1 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v25;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(a1);
            }
            id v14 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              unsigned __int8 v15 = [v14 isEqualToString:@"Default"];
              uint64_t v16 = &SAStarkDisplayModeFullScreenValue;
              if ((v15 & 1) != 0
                || (unsigned __int8 v17 = [v14 isEqualToString:@"Siri"],
                    uint64_t v16 = &SAStarkDisplayModeSiriValue,
                    (v17 & 1) != 0)
                || (unsigned __int8 v18 = [v14 isEqualToString:@"GeoSupported"],
                    uint64_t v16 = &SAStarkDisplayModeFullScreenValue,
                    (v18 & 1) != 0))
              {
                if (*v16) {
                  objc_msgSend(v6, "addObject:");
                }
              }
              else
              {
                id v22 = v14;
                (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"launchMode is not a known value -> %@");
              }
            }
            else
            {
              id v22 = v14;
              (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"launchMode is not a NSString -> %@");
            }
            uint64_t v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id v19 = [a1 countByEnumeratingWithState:&v24 objects:v28 count:16];
          id v11 = v19;
        }
        while (v19);
      }
    }
    else
    {
      id v22 = a1;
      (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"launchModes is not a NSArray -> %@");
    }
  }
LABEL_30:
  if (sub_E3BC(v23, @"com.apple.developer.carplay-messaging", a3)) {
    [v6 addObject:SAStarkDisplayModeSiri_MessagingValue];
  }
  if (sub_E3BC(v23, @"com.apple.developer.carplay-calling", a3)) {
    [v6 addObject:SAStarkDisplayModeSiri_CallingValue];
  }
  if (sub_E3BC(v23, @"com.apple.developer.carplay-maps", a3))
  {
    [v6 addObject:SAStarkDisplayModeFullScreenValue];
    [v6 addObject:SAStarkDisplayModeSiri_GeoValue];
  }
  if (sub_E3BC(v23, @"com.apple.developer.carplay-communication", a3)) {
    [v6 addObject:SAStarkDisplayModeFullScreenValue];
  }
  if (sub_E3BC(v23, @"com.apple.developer.carplay-audio", a3)) {
    [v6 addObject:SAStarkDisplayModeFullScreenValue];
  }
  if (sub_E3BC(v23, @"com.apple.developer.carplay-charging", a3)) {
    [v6 addObject:SAStarkDisplayModeFullScreenValue];
  }
  if (sub_E3BC(v23, @"com.apple.developer.carplay-fueling", a3)) {
    [v6 addObject:SAStarkDisplayModeFullScreenValue];
  }
  if (sub_E3BC(v23, @"com.apple.developer.carplay-parking", a3)) {
    [v6 addObject:SAStarkDisplayModeFullScreenValue];
  }
  if (sub_E3BC(v23, @"com.apple.developer.carplay-quick-ordering", a3)) {
    [v6 addObject:SAStarkDisplayModeFullScreenValue];
  }
  if (sub_E3BC(v23, @"com.apple.developer.carplay-public-safety", a3)) {
    [v6 addObject:SAStarkDisplayModeFullScreenValue];
  }
  if (objc_msgSend(v6, "count", v22))
  {
    id v20 = objc_alloc_init((Class)SAStarkSupport);
    objc_msgSend(v20, "setSupportedModes:", objc_msgSend(v6, "allObjects"));
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

id sub_E3BC(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"BOOL AAPPlistBoolValueParserForKey(NSDictionary *, NSString *, AAPParserErrorLogger)"], @"AAPParser.m", 49, @"Invalid parameter not satisfying: %@", @"errorLogger" file lineNumber description];
  }
  id v6 = [a1 objectForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return [v6 BOOLValue];
  }
  else
  {
    if (v6) {
      (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"entitlement (%@) is not a NSNumber -> %@");
    }
    return 0;
  }
}

id AAPAggregateSyncIdentityParser(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a6) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"SASyncAppIdentifyingInfo *AAPAggregateSyncIdentityParser(NSDictionary *, NSDictionary *, NSDictionary *, NSDictionary *, CFBundleRef, AAPParserErrorLogger)"], @"AAPParser.m", 385, @"Invalid parameter not satisfying: %@", @"errorLogger" file lineNumber description];
  }
  id v8 = [a1 objectForKey:kCFBundleIdentifierKey];
  uint64_t v10 = AAPPlistStringParser((uint64_t)v8, v9, a6);
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = objc_alloc_init((Class)SASyncAppIdentifyingInfo);
    [v12 setBundleId:v11];
    id v13 = [a1 objectForKey:_kCFBundleShortVersionStringKey];
    objc_msgSend(v12, "setVersion:", AAPPlistStringParser((uint64_t)v13, v14, a6));
    id v15 = [a1 objectForKey:kCFBundleVersionKey];
    objc_msgSend(v12, "setBuildNumber:", AAPPlistStringParser((uint64_t)v15, v16, a6));
    [v12 setClientIdentifier:AFApplicationClientIdentifierForApp()];
  }
  else
  {
    (*(void (**)(uint64_t, const __CFString *))(a6 + 16))(a6, @"bundleIdentifier not found");
    id v12 = 0;
  }

  return v12;
}

void *AAPUniversalSearchParser(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v7 = [a4 valueForKey:@"com.apple.smoot.subscriptionservice"];

  return AAPPlistBoolParser(v7, v8, a6);
}

id AAPAlternativeAppNamesMapParser(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, __CFBundle *a5, uint64_t a6)
{
  if (!a6) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NSDictionary<NSString *,NSArray<SASpeakablePhrase *> *> *AAPAlternativeAppNamesMapParser(NSDictionary *, NSDictionary *, NSDictionary *, NSDictionary *, CFBundleRef, AAPParserErrorLogger)"), @"AAPParser.m", 460, @"Invalid parameter not satisfying: %@", @"errorLogger" file lineNumber description];
  }
  id v8 = [a1 objectForKey:_INAlternativeAppNamesKey];
  id result = [v8 count];
  id v47 = result;
  if (!result) {
    return result;
  }
  CanonicalLocaleIdentifierFromString = (__CFString *)CFLocaleCreateCanonicalLocaleIdentifierFromString(0, @"Base");
  if (!CanonicalLocaleIdentifierFromString) {
    CanonicalLocaleIdentifierFromString = @"Base";
  }
  uint64_t v11 = &_s15AppDistribution0A11DistributorO17requestSearchPage_12searchStringySS_SStYaKFZ_ptr;
  id v45 = objc_alloc_init((Class)NSMutableDictionary);
  CFArrayRef v12 = CFBundleCopyBundleLocalizations(a5);
  if (v12)
  {
    CFArrayRef v13 = v12;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v14 = [(__CFArray *)v12 countByEnumeratingWithState:&v58 objects:v64 count:16];
    if (v14)
    {
      id v15 = v14;
      v44 = 0;
      uint64_t v16 = *(void *)v59;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v59 != v16) {
            objc_enumerationMutation(v13);
          }
          unsigned __int8 v18 = *(__CFString **)(*((void *)&v58 + 1) + 8 * i);
          id v19 = (__CFString *)CFLocaleCreateCanonicalLocaleIdentifierFromString(0, v18);
          if (!v19) {
            id v19 = v18;
          }
          if ([(__CFString *)v19 isEqualToString:CanonicalLocaleIdentifierFromString])
          {
            if (v44) {
              (*(void (**)(uint64_t, const __CFString *))(a6 + 16))(a6, @"more than one localization matching %@ : first=%@ new=%@");
            }
            else {
              v44 = v18;
            }
          }
          else
          {
            [v45 setObject:v19 forKey:v18];
          }
        }
        id v15 = [(__CFArray *)v13 countByEnumeratingWithState:&v58 objects:v64 count:16];
      }
      while (v15);
      CFRelease(v13);
      uint64_t v11 = &_s15AppDistribution0A11DistributorO17requestSearchPage_12searchStringySS_SStYaKFZ_ptr;
      if (v44)
      {
        id v20 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v47];
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v21 = [v8 countByEnumeratingWithState:&v54 objects:v63 count:16];
        if (v21)
        {
          id v22 = v21;
          long long v23 = CanonicalLocaleIdentifierFromString;
          uint64_t v24 = *(void *)v55;
          do
          {
            for (j = 0; j != v22; j = (char *)j + 1)
            {
              if (*(void *)v55 != v24) {
                objc_enumerationMutation(v8);
              }
              long long v26 = *(void **)(*((void *)&v54 + 1) + 8 * (void)j);
              id v27 = sub_EBC0((uint64_t)a5, v26, 0, (uint64_t)v44);
              uint64_t v28 = v27;
              if (v27) {
                id v29 = v27;
              }
              else {
                id v29 = v26;
              }
              [v20 addObject:v29];
            }
            id v22 = [v8 countByEnumeratingWithState:&v54 objects:v63 count:16];
          }
          while (v22);
          CanonicalLocaleIdentifierFromString = v23;
          uint64_t v11 = &_s15AppDistribution0A11DistributorO17requestSearchPage_12searchStringySS_SStYaKFZ_ptr;
        }
        goto LABEL_35;
      }
    }
    else
    {
      CFRelease(v13);
    }
  }
  id v20 = [v8 copy];
  v44 = 0;
LABEL_35:
  if (v47 != [v20 count]) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NSDictionary<NSString *,NSArray<SASpeakablePhrase *> *> *AAPAlternativeAppNamesMapParser(NSDictionary *, NSDictionary *, NSDictionary *, NSDictionary *, CFBundleRef, AAPParserErrorLogger)"), @"AAPParser.m", 498, @"definitions and baseLocalizations must match : definitions=%@ baseLocalizations=%@", v8, v20 file lineNumber description];
  }
  v41 = CanonicalLocaleIdentifierFromString;
  id v42 = objc_msgSend(objc_alloc((Class)v11[153]), "initWithCapacity:", objc_msgSend(v45, "count"));
  [v42 setObject:v20 forKey:CanonicalLocaleIdentifierFromString];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = [v45 allKeys];
  id v48 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (v48)
  {
    if ((unint64_t)v47 <= 1) {
      uint64_t v30 = 1;
    }
    else {
      uint64_t v30 = (uint64_t)v47;
    }
    uint64_t v46 = *(void *)v51;
    do
    {
      for (k = 0; k != v48; k = (char *)k + 1)
      {
        if (*(void *)v51 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = *(void *)(*((void *)&v50 + 1) + 8 * (void)k);
        id v33 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v47];
        uint64_t v34 = 0;
        char v35 = 0;
        do
        {
          while (1)
          {
            id v36 = [v8 objectAtIndex:v34];
            id v37 = [v20 objectAtIndex:v34];
            id v38 = sub_EBC0((uint64_t)a5, v36, v37, v32);
            if (!v38) {
              break;
            }
            v39 = v38;
            [v33 addObject:v38];

            char v35 = 1;
            if (v30 - 1 == v34++) {
              goto LABEL_53;
            }
          }
          [v33 addObject:v37];
          ++v34;
        }
        while (v30 != v34);
        if ((v35 & 1) == 0) {
          goto LABEL_54;
        }
LABEL_53:
        objc_msgSend(v42, "setObject:forKey:", v33, objc_msgSend(v45, "objectForKey:", v32));
LABEL_54:
      }
      id v48 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
    }
    while (v48);
  }

  return v42;
}

id sub_EBC0(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  if (a1)
  {
    if (a2) {
      goto LABEL_3;
    }
LABEL_22:
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"SASpeakablePhrase *_createLocalizedAltName(CFBundleRef, SASpeakablePhrase *, SASpeakablePhrase *, NSString *, AAPParserErrorLogger)"], @"AAPParser.m", 420, @"Invalid parameter not satisfying: %@", @"definition" file lineNumber description];
    if (a4) {
      goto LABEL_4;
    }
    goto LABEL_23;
  }
  [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"SASpeakablePhrase *_createLocalizedAltName(CFBundleRef, SASpeakablePhrase *, SASpeakablePhrase *, NSString *, AAPParserErrorLogger)"], @"AAPParser.m", 419, @"Invalid parameter not satisfying: %@", @"bundle" file lineNumber description];
  if (!a2) {
    goto LABEL_22;
  }
LABEL_3:
  if (a4) {
    goto LABEL_4;
  }
LABEL_23:
  [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"SASpeakablePhrase *_createLocalizedAltName(CFBundleRef, SASpeakablePhrase *, SASpeakablePhrase *, NSString *, AAPParserErrorLogger)"], @"AAPParser.m", 421, @"Invalid parameter not satisfying: %@", @"localization" file lineNumber description];
LABEL_4:
  id v7 = [a2 phrase];
  id v8 = [a3 phrase];
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = v7;
  }
  if (v7) {
    id v10 = (id)CFBundleCopyLocalizedStringForLocalization();
  }
  else {
    id v10 = v9;
  }
  uint64_t v11 = v10;
  id v12 = [a2 pronunciation];
  id v13 = [a3 pronunciation];
  if (v13) {
    id v14 = v13;
  }
  else {
    id v14 = v12;
  }
  if (v12) {
    id v15 = (id)CFBundleCopyLocalizedStringForLocalization();
  }
  else {
    id v15 = v14;
  }
  uint64_t v16 = v15;
  if BSEqualStrings() && (BSEqualStrings())
  {
    id v17 = 0;
  }
  else
  {
    id v17 = objc_alloc_init((Class)SASpeakablePhrase);
    [v17 setPhrase:v11];
    [v17 setPronunciation:v16];
  }

  return v17;
}

void *AAPPlistBrowsableMediaParser(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  if (!a6) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"NSNumber *AAPPlistBrowsableMediaParser(NSDictionary *, NSDictionary *, NSDictionary *, NSDictionary *, CFBundleRef, AAPParserErrorLogger)"], @"AAPParser.m", 543, @"Invalid parameter not satisfying: %@", @"errorLogger" file lineNumber description];
  }
  id v8 = [a4 objectForKey:@"com.apple.developer.playable-content"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v8 BOOLValue]) {
      return &__kCFBooleanTrue;
    }
    else {
      return &__kCFBooleanFalse;
    }
  }
  else
  {
    if (v8) {
      (*(void (**)(uint64_t, const __CFString *))(a6 + 16))(a6, @"entitlement (%@) is not a NSNumber -> %@");
    }
    return 0;
  }
}

void sub_109D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = AFSiriLogContextPlugin;
  BOOL v6 = os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 136315906;
      id v12 = "-[AAPCommandCheckRestriction performWithCompletion:]_block_invoke";
      __int16 v13 = 2114;
      uint64_t v14 = v7;
      __int16 v15 = 2048;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = a2;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: <%{public}@:%p> sending response = %@", (uint8_t *)&v11, 0x2Au);
      uint64_t v4 = *(void *)(a1 + 40);
    }
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  }
  else if (v6)
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 136315906;
    id v12 = "-[AAPCommandCheckRestriction performWithCompletion:]_block_invoke";
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    __int16 v15 = 2048;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = a2;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: <%{public}@:%p> no completion block - dropping response = %@", (uint8_t *)&v11, 0x2Au);
  }
}

void sub_114DC()
{
}

uint64_t sub_11ADC()
{
  sub_11F60();
  uint64_t result = sub_158B0();
  qword_294C8 = result;
  return result;
}

uint64_t *sub_11B38()
{
  if (qword_294B8 != -1) {
    swift_once();
  }
  return &qword_294C8;
}

uint64_t sub_11B84()
{
  uint64_t v0 = sub_15800();
  sub_11EFC(v0, qword_294D0);
  sub_11C74(v0, (uint64_t)qword_294D0);
  if (qword_294B8 != -1) {
    swift_once();
  }
  id v1 = (id)qword_294C8;
  return sub_15810();
}

uint64_t sub_11C10()
{
  if (qword_294C0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_15800();

  return sub_11C74(v0, (uint64_t)qword_294D0);
}

uint64_t sub_11C74(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_11CAC@<X0>(uint64_t a1@<X8>)
{
  if (qword_294C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_15800();
  uint64_t v3 = sub_11C74(v2, (uint64_t)qword_294D0);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_11D6C(uint64_t a1)
{
  if (qword_294C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_15800();
  uint64_t v3 = sub_11C74(v2, (uint64_t)qword_294D0);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*sub_11E64())()
{
  if (qword_294C0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_15800();
  sub_11C74(v0, (uint64_t)qword_294D0);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t *sub_11EFC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_11F60()
{
  unint64_t result = qword_29440;
  if (!qword_29440)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_29440);
  }
  return result;
}

id AAPCommandSearchMarketplaceWrapper.__allocating_init(marketplace:keyword:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (char *)objc_allocWithZone(v4);
  uint64_t v10 = &v9[OBJC_IVAR____TtC12Applications34AAPCommandSearchMarketplaceWrapper_marketplace];
  *(void *)uint64_t v10 = a1;
  *((void *)v10 + 1) = a2;
  int v11 = &v9[OBJC_IVAR____TtC12Applications34AAPCommandSearchMarketplaceWrapper_keyword];
  *(void *)int v11 = a3;
  *((void *)v11 + 1) = a4;
  v13.receiver = v9;
  v13.super_class = v4;
  return objc_msgSendSuper2(&v13, "init");
}

id AAPCommandSearchMarketplaceWrapper.init(marketplace:keyword:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = &v4[OBJC_IVAR____TtC12Applications34AAPCommandSearchMarketplaceWrapper_marketplace];
  *(void *)id v5 = a1;
  *((void *)v5 + 1) = a2;
  BOOL v6 = &v4[OBJC_IVAR____TtC12Applications34AAPCommandSearchMarketplaceWrapper_keyword];
  *(void *)BOOL v6 = a3;
  *((void *)v6 + 1) = a4;
  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for AAPCommandSearchMarketplaceWrapper();
  return objc_msgSendSuper2(&v8, "init");
}

uint64_t type metadata accessor for AAPCommandSearchMarketplaceWrapper()
{
  return self;
}

uint64_t sub_12140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[12] = a8;
  v8[13] = v17;
  uint64_t v13 = sub_15800();
  v8[14] = v13;
  v8[15] = *(void *)(v13 - 8);
  v8[16] = swift_task_alloc();
  v8[17] = swift_task_alloc();
  uint64_t v14 = (void *)swift_task_alloc();
  v8[18] = v14;
  *uint64_t v14 = v8;
  v14[1] = sub_12278;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))static AppDistributor.requestSearchPage(_:searchString:))(a4, a5, a6, a7);
}

uint64_t sub_12278()
{
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_12568;
  }
  else {
    uint64_t v2 = sub_1238C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1238C()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[15];
  uint64_t v4 = sub_11C10();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  id v5 = sub_157F0();
  os_log_type_t v6 = sub_15890();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_0, v5, v6, "AAPCommandSearchMarketplace success", v7, 2u);
    swift_slowDealloc();
  }
  uint64_t v8 = v0[17];
  uint64_t v9 = v0[14];
  uint64_t v10 = v0[15];
  uint64_t v11 = v0[12];

  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  if (v11)
  {
    uint64_t v13 = (void (*)(id))v0[12];
    id v14 = [objc_allocWithZone((Class)SACommandSucceeded) init];
    id v15 = [v14 dictionary];

    if (v15)
    {
      sub_15830();

      id v15 = 0;
    }
    v13(v15);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v16 = (uint64_t (*)(void))v0[1];
    return v16();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_12568()
{
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  uint64_t v3 = v0[14];
  uint64_t v4 = sub_11C10();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_errorRetain();
  swift_errorRetain();
  id v5 = sub_157F0();
  os_log_type_t v6 = sub_158A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[11] = v9;
    sub_158C0();
    void *v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v5, v6, "AAPCommandSearchMarketplace error: %@", v7, 0xCu);
    sub_134F0(&qword_294B0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v11 = v0[15];
  uint64_t v10 = v0[16];
  uint64_t v12 = v0[14];
  uint64_t v13 = v0[12];

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  if (!v13)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v14 = v0[19];
  id v15 = (void (*)(void))v0[12];
  v0[8] = 0;
  v0[9] = 0xE000000000000000;
  v0[10] = v14;
  sub_134F0(&qword_294A8);
  sub_158D0();
  id v16 = objc_allocWithZone((Class)SACommandFailed);
  NSString v17 = sub_15840();
  swift_bridgeObjectRelease();
  id v18 = [v16 initWithReason:v17];

  if (!v18)
  {
LABEL_12:
    __break(1u);
    return;
  }
  id v19 = [v18 dictionary];

  if (v19)
  {
    sub_15830();
  }
  v15(0);
  swift_bridgeObjectRelease();
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  id v20 = (void (*)(void))v0[1];
  v20();
}

uint64_t sub_128A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_15880();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_15870();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_13754(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_15860();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_12B28(uint64_t a1, uint64_t a2)
{
  if (a1) {
    v3.super.Class isa = sub_15820().super.isa;
  }
  else {
    v3.super.Class isa = 0;
  }
  Class isa = v3.super.isa;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

id AAPCommandSearchMarketplaceWrapper.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

void AAPCommandSearchMarketplaceWrapper.init()()
{
}

id AAPCommandSearchMarketplaceWrapper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AAPCommandSearchMarketplaceWrapper();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_12CC4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_12DA0;
  return v6(a1);
}

uint64_t sub_12DA0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void _s12Applications34AAPCommandSearchMarketplaceWrapperC7perform10completion13serviceHelper13executionInfoyySDys11AnyHashableVypGSgcSg_So09AFServiceI0_pSgSo018AFCommandExecutionK0CSgtF_0(void (*a1)(id), uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v47 = a2;
  id v48 = a1;
  sub_134F0(&qword_29480);
  ((void (*)(void))__chkstk_darwin)();
  id v45 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_15800();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v44 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v44 - v13;
  uint64_t v15 = sub_11C10();
  swift_beginAccess();
  uint64_t v46 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v46(v14, v15, v5);
  id v16 = sub_157F0();
  os_log_type_t v17 = sub_15890();
  if (os_log_type_enabled(v16, v17))
  {
    id v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v44 = v6;
    *(_WORD *)id v18 = 0;
    _os_log_impl(&dword_0, v16, v17, "AAPCommandSearchMarketplace executing...", v18, 2u);
    uint64_t v6 = v44;
    swift_slowDealloc();
  }

  id v19 = *(void (**)(char *, uint64_t))(v6 + 8);
  v19(v14, v5);
  unint64_t v20 = *(void *)(v3 + OBJC_IVAR____TtC12Applications34AAPCommandSearchMarketplaceWrapper_marketplace + 8);
  if (!v20) {
    goto LABEL_12;
  }
  uint64_t v21 = *(void *)(v3 + OBJC_IVAR____TtC12Applications34AAPCommandSearchMarketplaceWrapper_marketplace);
  uint64_t v22 = HIBYTE(v20) & 0xF;
  if ((v20 & 0x2000000000000000) == 0) {
    uint64_t v22 = v21 & 0xFFFFFFFFFFFFLL;
  }
  if (!v22)
  {
LABEL_12:
    swift_beginAccess();
    v46(v9, v15, v5);
    v31 = sub_157F0();
    os_log_type_t v32 = sub_158A0();
    if (os_log_type_enabled(v31, v32))
    {
      id v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v33 = 0;
      _os_log_impl(&dword_0, v31, v32, "AAPCommandSearchMarketplace: failure - missing marketplace data", v33, 2u);
      swift_slowDealloc();
    }

    v19(v9, v5);
    uint64_t v34 = v48;
    if (v48)
    {
      id v35 = objc_allocWithZone((Class)SACommandFailed);
      NSString v36 = sub_15840();
      id v37 = [v35 initWithReason:v36];

      if (v37) {
        goto LABEL_21;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v3 + OBJC_IVAR____TtC12Applications34AAPCommandSearchMarketplaceWrapper_keyword + 8);
  if (v23)
  {
    uint64_t v24 = *(void *)(v3 + OBJC_IVAR____TtC12Applications34AAPCommandSearchMarketplaceWrapper_keyword);
    uint64_t v25 = HIBYTE(v23) & 0xF;
    if ((v23 & 0x2000000000000000) == 0) {
      uint64_t v25 = v24 & 0xFFFFFFFFFFFFLL;
    }
    if (v25)
    {
      uint64_t v26 = sub_15880();
      uint64_t v27 = (uint64_t)v45;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v45, 1, 1, v26);
      uint64_t v28 = (void *)swift_allocObject();
      v28[2] = 0;
      v28[3] = 0;
      v28[4] = v21;
      v28[5] = v20;
      v28[6] = v24;
      v28[7] = v23;
      uint64_t v30 = v47;
      uint64_t v29 = (uint64_t)v48;
      v28[8] = v48;
      v28[9] = v30;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_13744(v29, v30);
      sub_128A4(v27, (uint64_t)&unk_29490, (uint64_t)v28);
      swift_release();
      return;
    }
  }
  swift_beginAccess();
  v46(v12, v15, v5);
  id v38 = sub_157F0();
  os_log_type_t v39 = sub_158A0();
  if (os_log_type_enabled(v38, v39))
  {
    v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v40 = 0;
    _os_log_impl(&dword_0, v38, v39, "AAPCommandSearchMarketplace: failure - missing search string data", v40, 2u);
    swift_slowDealloc();
  }

  v19(v12, v5);
  uint64_t v34 = v48;
  if (!v48)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  id v41 = objc_allocWithZone((Class)SACommandFailed);
  NSString v42 = sub_15840();
  id v37 = [v41 initWithReason:v42];

  if (!v37)
  {
LABEL_27:
    __break(1u);
    return;
  }
LABEL_21:
  id v43 = [v37 dictionary];

  if (v43)
  {
    v49 = 0;
    sub_15830();

    id v43 = v49;
  }
  v34(v43);
  swift_bridgeObjectRelease();
}

uint64_t sub_134A0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_134B0()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_134E8(uint64_t a1)
{
  sub_12B28(a1, *(void *)(v1 + 16));
}

uint64_t sub_134F0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_13534()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 64)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_1358C()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[7];
  uint64_t v6 = v0[8];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_13650;
  return sub_12140((uint64_t)v7, v8, v9, v2, v3, v4, v5, v6);
}

uint64_t sub_13650()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_13744(uint64_t result, uint64_t a2)
{
  if (result) {
    return _swift_retain(a2);
  }
  return result;
}

uint64_t sub_13754(uint64_t a1)
{
  uint64_t v2 = sub_134F0(&qword_29480);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_137B4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_137EC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_13650;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_29498 + dword_29498);
  return v6(a1, v4);
}

void sub_138A4()
{
  objc_opt_class();
  sub_60D8();
  sub_60EC();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x20u);
}

void sub_13940()
{
  objc_opt_class();
  sub_60D8();
  sub_60EC();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x2Au);
}

void sub_139F0(os_log_t log)
{
  int v1 = 136315138;
  os_log_type_t v2 = "_EmitUufrReadyEvent";
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%s Missing turnId for UUFR event", (uint8_t *)&v1, 0xCu);
}

void sub_13A74()
{
  v1[0] = 136315394;
  sub_60D8();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "%s Logging UUFR ready for AppLaunch with turnId=%@", (uint8_t *)v1, 0x16u);
}

void sub_13AF4(os_log_t log)
{
  int v1 = 136315138;
  os_log_type_t v2 = "-[AAPCommandLaunch performWithCompletion:serviceHelper:executionInfo:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "%s com.apple.siri.applications: Setting doNotDismissSiri to YES since SAE is enabled", (uint8_t *)&v1, 0xCu);
}

void sub_13B78(uint64_t a1, void *a2)
{
  objc_opt_class();
  [a2 domain];
  [a2 code];
  sub_60EC();
  _os_log_error_impl(v3, v4, v5, v6, v7, 0x48u);
}

void sub_13C78(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[AAPCommandSearch performWithCompletion:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "%s Query: %@", (uint8_t *)&v2, 0x16u);
}

void sub_13D04(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 136315650;
  uint64_t v5 = "-[AAPCommandSearch performWithCompletion:]_block_invoke_2";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%s Error executing query %@: %@", (uint8_t *)&v4, 0x20u);
}

void sub_13DA0(uint64_t a1)
{
  [*(id *)(*(void *)a1 + 16) state];
  sub_60D8();
  sub_86A0(&dword_0, v1, v2, "%s com.apple.siri.applications: loaded saved state -> %@", v3, v4, v5, v6, 2u);
}

void sub_13E2C(void *a1, NSObject *a2)
{
  int v4 = 136315906;
  uint64_t v5 = "-[AAPSyncHandler init]_block_invoke";
  __int16 v6 = 2114;
  id v7 = [a1 domain];
  __int16 v8 = 2048;
  id v9 = [a1 code];
  __int16 v10 = 2112;
  uint64_t v11 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%s com.apple.siri.applications: Error: persistence load error {%{public}@:%li}(%@)", (uint8_t *)&v4, 0x2Au);
}

void sub_13EFC()
{
  v1[0] = 136315650;
  sub_8678();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "%s com.apple.siri.applications: keyAnchor check failed: lastKey=%{public}@ key=%{public}@", (uint8_t *)v1, 0x20u);
}

void sub_13F80(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_13FF8(void *a1, NSObject *a2)
{
  int v3 = 136315650;
  int v4 = "+[AAPSyncHandler _checkIfResetIsNeededForKey:withStartAnchorString:validity:lastState:completion:]";
  __int16 v5 = 2048;
  id v6 = [a1 version];
  __int16 v7 = 2048;
  uint64_t v8 = 4;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "%s com.apple.siri.applications: version check failed: last=%li current=%li", (uint8_t *)&v3, 0x20u);
}

void sub_140A4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1411C()
{
  sub_8694(__stack_chk_guard);
  sub_862C();
  sub_8640(&dword_0, v0, v1, "%s com.apple.siri.applications: Error: startAnchorString decode failed - resetting -> error=%{public}@", v2, v3, v4, v5, 2u);
}

void sub_14190(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "+[AAPSyncHandler _checkIfResetIsNeededForKey:withStartAnchorString:validity:lastState:completion:]";
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%s com.apple.siri.applications: Error: LS didn't return a workspace", (uint8_t *)&v1, 0xCu);
}

void sub_14214()
{
  sub_8694(__stack_chk_guard);
  sub_862C();
  sub_8640(&dword_0, v0, v1, "%s com.apple.siri.applications: Error: LS didn't return a sequenceNumber -> %{public}@", v2, v3, v4, v5, 2u);
}

void sub_14288()
{
  sub_8694(__stack_chk_guard);
  sub_862C();
  sub_8640(&dword_0, v0, v1, "%s com.apple.siri.applications: Error: LS didn't return a knowledge UUID -> %{public}@", v2, v3, v4, v5, 2u);
}

void sub_142FC()
{
  sub_8694(__stack_chk_guard);
  uint64_t v2 = v0 + 24;
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v1 = *(void *)(v2 + 8);
  int v5 = 136315650;
  id v6 = "-[AAPSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:configuration:]_block_invoke";
  __int16 v7 = 2048;
  uint64_t v8 = v1;
  __int16 v9 = 2048;
  uint64_t v10 = v3;
  _os_log_debug_impl(&dword_0, v4, OS_LOG_TYPE_DEBUG, "%s com.apple.siri.applications: created processor for source -> processor=%p source=%p", (uint8_t *)&v5, 0x20u);
}

void sub_14394()
{
  v1[0] = 136315650;
  sub_8678();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "%s com.apple.siri.applications: Error: MI state is bad -> validity = '%{public}@' , anchor = %{public}@", (uint8_t *)v1, 0x20u);
}

void sub_14418(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[AAPSyncHandler getChangeAfterAnchor:changeInfo:]";
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%s com.apple.siri.applications: Error: called without a processor - terminating sync", (uint8_t *)&v1, 0xCu);
}

void sub_1449C()
{
  sub_8694(__stack_chk_guard);
  sub_862C();
  sub_8640(&dword_0, v0, v1, "%s com.apple.siri.applications: Error: preAnchorString decode failed - terminating sync -> error=%{public}@", v2, v3, v4, v5, 2u);
}

void sub_14510(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_14588(uint64_t a1)
{
  [*(id *)(*(void *)a1 + 16) state];
  sub_60D8();
  sub_86A0(&dword_0, v1, v2, "%s com.apple.siri.applications: saved new state -> %@", v3, v4, v5, v6, 2u);
}

void sub_14614(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_14694(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1470C()
{
  sub_8FD0();
  sub_8FA0(&dword_0, v0, v1, "%s com.apple.siri.applications: processor is ready to begin -> metaData = %@", v2, v3, v4, v5, 2u);
}

void sub_14788(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_8FA0(&dword_0, a2, a3, "%s com.apple.siri.applications: no next item after anchor=%{public}@ - ending sync", a5, a6, a7, a8, 2u);
}

void sub_14808()
{
  int v1 = 136315650;
  uint64_t v2 = "-[AAPSyncMetaDataProcessor _queue_processNextChange:afterAnchor:withInitialAnchor:]";
  sub_8FBC();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "%s com.apple.siri.applications: no next item after anchor=%{public}@ - updating anchor=%{public}@", (uint8_t *)&v1, 0x20u);
}

void sub_14894(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_14914()
{
  int v1 = 136315650;
  uint64_t v2 = "-[AAPSyncMetaDataProcessor _queue_processNextChange:afterAnchor:withInitialAnchor:]";
  sub_8FBC();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "%s com.apple.siri.applications: skipping invalid item -> %@ : info -> %@", (uint8_t *)&v1, 0x20u);
}

void sub_149A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_14A18(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_14A90(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_14B08(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_14B80(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_14BF8()
{
  sub_8FD0();
  sub_8FA0(&dword_0, v0, v1, "%s com.apple.siri.applications: finished cache update for appId='%@' -> already invalidated so tossing", v2, v3, v4, v5, 2u);
}

void sub_14C70(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[AAPSyncMetaDataSource initWithLastState:startAnchor:keyAnchor:validity:configuration:observer:]_block_invoke";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "%s com.apple.siri.applications: source is ready", (uint8_t *)&v1, 0xCu);
}

void sub_14CF4()
{
  sub_60D8();
  sub_8FA0(&dword_0, v0, v1, "%s com.apple.siri.applications: retained old state because there was no need to reconcile -> %@", v2, v3, v4, v5, 2u);
}

void sub_14D68()
{
  sub_60D8();
  sub_8FA0(&dword_0, v0, v1, "%s com.apple.siri.applications: applied new state -> %@", v2, v3, v4, v5, 2u);
}

void sub_14DDC()
{
  v1[0] = 136315394;
  sub_60D8();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "%s com.apple.siri.applications: Error: failed constraint - if we don't think we need to reconcile then we shouldn't have any new deletes -> %@", (uint8_t *)v1, 0x16u);
}

void sub_14E5C()
{
  sub_60D8();
  sub_8FA0(&dword_0, v0, v1, "%s com.apple.siri.applications: gathered metaDataItem=%@", v2, v3, v4, v5, 2u);
}

void sub_14ED0(uint64_t a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(_DWORD *)buf = 136315650;
  *(void *)(buf + 4) = "-[AAPSyncMetaDataItemUpdate valueForGenericParser:withDefaultGenerator:withErrorKeyDescriptor:]";
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2112;
  *((void *)buf + 3) = v4;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "%s com.apple.siri.applications: tried falling back to defaultGenerator value for %{public}@ (%@) but the generator produced no value", buf, 0x20u);
}

void sub_14F40()
{
  sub_60D8();
  sub_8640(&dword_0, v0, v1, "%s com.apple.siri.applications: Error: could not load info file for metaDataItem=%@", v2, v3, v4, v5, 2u);
}

void sub_14FB4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315650;
  uint64_t v4 = "-[AAPSyncMetaDataItemUpdate valuesForInfoPlistEntries:inBundle:withEntitlements:forLocalization:ignoringDefaultValues:]";
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "%s com.apple.siri.applications: could not load %{public}@ info file for metaDataItem=%@", (uint8_t *)&v3, 0x20u);
}

void sub_15050(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = 136315394;
  uint64_t v4 = "-[AAPSyncMetaDataItemUpdate valuesForEntries:inPlistAtURL:]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "%s com.apple.siri.applications: can't read from an empty url (%@)", (uint8_t *)&v3, 0x16u);
}

void sub_150E0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 136315650;
  *(void *)&v3[4] = "-[AAPSyncMetaDataItemUpdate valuesForEntries:inPlistAtURL:]";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  sub_C6DC(&dword_0, a2, a3, "%s com.apple.siri.applications: Error: could not parse plist file at url='%@' (%@) -> unknown", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *(void *)(a2 + 8));
}

void sub_1516C()
{
  sub_60D8();
  sub_8640(&dword_0, v0, v1, "%s com.apple.siri.applications: Error: could not get the bundle for metaDataItem=%@", v2, v3, v4, v5, 2u);
}

void sub_151E0()
{
  sub_60D8();
  sub_8640(&dword_0, v0, v1, "%s com.apple.siri.applications: Error: no Info.plist identifier for metaDataItem=%@", v2, v3, v4, v5, 2u);
}

void sub_15254()
{
  int v2 = 136315650;
  sub_60D8();
  sub_C6DC(&dword_0, v0, v1, "%s com.apple.siri.applications: Error: the Info.plist identifier (%@) did not agree with metaDataItem=%@", v2);
}

void sub_152D0()
{
  v1[0] = 136315394;
  sub_60D8();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "%s com.apple.siri.applications: Error: no entitlements found for metaDataItem=%@", (uint8_t *)v1, 0x16u);
}

void sub_15350(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[AAPIntentsInfoSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:]";
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%s com.apple.siri.applications: ERROR: no app id?!", (uint8_t *)&v1, 0xCu);
}

void sub_153D4(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  int v4 = 136315650;
  uint64_t v5 = "-[AAPIntentsInfoSyncHandler getChangeAfterAnchor:changeInfo:]";
  __int16 v6 = 2112;
  uint64_t v7 = v2;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%s com.apple.siri.applications: The %@ app does not support any intents, available extensions: %@", (uint8_t *)&v4, 0x20u);
}

void sub_1546C()
{
  int v2 = 136315650;
  sub_1042C();
  sub_C6DC(&dword_0, v0, v1, "%s com.apple.siri.applications: Value for key %{public}@ is not a BOOL: %@", v2);
}

void sub_154E0()
{
  int v2 = 136315650;
  sub_1042C();
  sub_C6DC(&dword_0, v0, v1, "%s com.apple.siri.applications: Value for key %{public}@ is not a string: %@", v2);
}

void sub_15554()
{
  int v2 = 136315650;
  sub_1042C();
  sub_C6DC(&dword_0, v0, v1, "%s com.apple.siri.applications: Value for key %{public}@ is not an array: %@", v2);
}

void sub_155C8(uint64_t a1, NSObject *a2)
{
  objc_opt_class();
  v4[0] = 136315650;
  sub_10B50();
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%s com.apple.siri.applications: <%{public}@:%p> command contained no launchId", (uint8_t *)v4, 0x20u);
}

void sub_15664(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_opt_class();
  v6[0] = 136315906;
  sub_10B50();
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "%s com.apple.siri.applications: <%{public}@:%p> Error: failed to talk to systemService for app (%@)", (uint8_t *)v6, 0x2Au);
}

void sub_15718(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v6 = 136315906;
  uint64_t v7 = "-[AAPCommandFilterNonRestricted performWithCompletion:]";
  __int16 v8 = 2114;
  uint64_t v9 = objc_opt_class();
  __int16 v10 = 2048;
  uint64_t v11 = a1;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "%s com.apple.siri.applications: <%{public}@:%p> Error: failed to talk to systemService for apps (%@)", (uint8_t *)&v6, 0x2Au);
}

uint64_t sub_157F0()
{
  return Logger.logObject.getter();
}

uint64_t sub_15800()
{
  return type metadata accessor for Logger();
}

uint64_t sub_15810()
{
  return Logger.init(_:)();
}

NSDictionary sub_15820()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_15830()
{
  return static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
}

NSString sub_15840()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_15850()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_15860()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_15870()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_15880()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_15890()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_158A0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_158B0()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_158C0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_158D0()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t AFApplicationClientIdentifierForApp()
{
  return _AFApplicationClientIdentifierForApp();
}

uint64_t AFApplicationWorkspaceEnumerateInstalledUserVisibleApplications()
{
  return _AFApplicationWorkspaceEnumerateInstalledUserVisibleApplications();
}

uint64_t AFDeviceSupportsSystemAssistantExperience()
{
  return _AFDeviceSupportsSystemAssistantExperience();
}

uint64_t BSEqualStrings()
{
  return _BSEqualStrings();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA1(data, len, md);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return _CFBundleCopyBundleLocalizations(bundle);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return _CFBundleCopyLocalizedStringForLocalization();
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return _CFErrorGetDomain(err);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLocaleIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return _CFLocaleCreateCanonicalLocaleIdentifierFromString(allocator, localeIdentifier);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t FBSOpenApplicationErrorCodeToString()
{
  return _FBSOpenApplicationErrorCodeToString();
}

uint64_t INVocabulariesByLocaleByAddingInvocationPhrases()
{
  return _INVocabulariesByLocaleByAddingInvocationPhrases();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFBundleCreateFilteredInfoPlist()
{
  return __CFBundleCreateFilteredInfoPlist();
}

uint64_t _CFBundleCreateFilteredLocalizedInfoPlist()
{
  return __CFBundleCreateFilteredLocalizedInfoPlist();
}

uint64_t _CFBundleCreateUnique()
{
  return __CFBundleCreateUnique();
}

uint64_t _CFPropertyListCreateFiltered()
{
  return __CFPropertyListCreateFiltered();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

const char *__cdecl sel_getName(SEL sel)
{
  return _sel_getName(sel);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForDirectory:inDomain:appropriateForURL:create:error:");
}

id objc_msgSend_URLForResource_withExtension_subdirectory_localization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForResource:withExtension:subdirectory:localization:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__checkIfResetIsNeededForKey_withStartAnchorString_validity_lastState_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkIfResetIsNeededForKey:withStartAnchorString:validity:lastState:completion:");
}

id objc_msgSend__closeApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_closeApp:");
}

id objc_msgSend__createSourceInfoForLastState_startAnchor_keyAnchor_validity_configuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createSourceInfoForLastState:startAnchor:keyAnchor:validity:configuration:");
}

id objc_msgSend__errWithCode_desc_err_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_errWithCode:desc:err:");
}

id objc_msgSend__fileManager(void *a1, const char *a2, ...)
{
  return _[a1 _fileManager];
}

id objc_msgSend__generateURLIfNeededWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateURLIfNeededWithError:");
}

id objc_msgSend__initWithMainIndex_subIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithMainIndex:subIndex:");
}

id objc_msgSend__pbLocalizedProjectsForVocabularyInfoDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pbLocalizedProjectsForVocabularyInfoDictionary:");
}

id objc_msgSend__queue_processNextChange_afterAnchor_withInitialAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_processNextChange:afterAnchor:withInitialAnchor:");
}

id objc_msgSend__queue_updateCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_updateCache");
}

id objc_msgSend__selfReferencingCommandFailedWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selfReferencingCommandFailedWithReason:");
}

id objc_msgSend__validate(void *a1, const char *a2, ...)
{
  return _[a1 _validate];
}

id objc_msgSend_aap_BOOLValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aap_BOOLValueForKey:");
}

id objc_msgSend_aap_arrayValueForKey_expectedContainingObjectsType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aap_arrayValueForKey:expectedContainingObjectsType:");
}

id objc_msgSend_aap_stringValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aap_stringValueForKey:");
}

id objc_msgSend_aceId(void *a1, const char *a2, ...)
{
  return _[a1 aceId];
}

id objc_msgSend_actionsRestrictedWhileLocked(void *a1, const char *a2, ...)
{
  return _[a1 actionsRestrictedWhileLocked];
}

id objc_msgSend_addExamples_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addExamples:");
}

id objc_msgSend_addIntentSlotNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIntentSlotNames:");
}

id objc_msgSend_addIntentSlotVocabularyConcepts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIntentSlotVocabularyConcepts:");
}

id objc_msgSend_addIntentSlotVocabularyPolicies_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIntentSlotVocabularyPolicies:");
}

id objc_msgSend_addIntentSupport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIntentSupport:");
}

id objc_msgSend_addIntentTypePhrases_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIntentTypePhrases:");
}

id objc_msgSend_addIntentVocabularyExamples_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIntentVocabularyExamples:");
}

id objc_msgSend_addIntentsRestrictedWhileLocked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIntentsRestrictedWhileLocked:");
}

id objc_msgSend_addIntentsSupported_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIntentsSupported:");
}

id objc_msgSend_addLocalizedProjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLocalizedProjects:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSupportedMediaCategories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSupportedMediaCategories:");
}

id objc_msgSend_addSynonyms_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSynonyms:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_anchor(void *a1, const char *a2, ...)
{
  return _[a1 anchor];
}

id objc_msgSend_anchorByIncrementingSubIndex(void *a1, const char *a2, ...)
{
  return _[a1 anchorByIncrementingSubIndex];
}

id objc_msgSend_anchorFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anchorFromIndex:");
}

id objc_msgSend_anchorFromStringRepresentation_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anchorFromStringRepresentation:error:");
}

id objc_msgSend_appId(void *a1, const char *a2, ...)
{
  return _[a1 appId];
}

id objc_msgSend_appIdentifyingInfo(void *a1, const char *a2, ...)
{
  return _[a1 appIdentifyingInfo];
}

id objc_msgSend_appIds(void *a1, const char *a2, ...)
{
  return _[a1 appIds];
}

id objc_msgSend_appInfoWithAppProxy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appInfoWithAppProxy:");
}

id objc_msgSend_appMetadata(void *a1, const char *a2, ...)
{
  return _[a1 appMetadata];
}

id objc_msgSend_appName(void *a1, const char *a2, ...)
{
  return _[a1 appName];
}

id objc_msgSend_appNameMap(void *a1, const char *a2, ...)
{
  return _[a1 appNameMap];
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return _[a1 appState];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_applicationName(void *a1, const char *a2, ...)
{
  return _[a1 applicationName];
}

id objc_msgSend_applicationProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationProxyForIdentifier:");
}

id objc_msgSend_applicationType(void *a1, const char *a2, ...)
{
  return _[a1 applicationType];
}

id objc_msgSend_apps(void *a1, const char *a2, ...)
{
  return _[a1 apps];
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributeSet(void *a1, const char *a2, ...)
{
  return _[a1 attributeSet];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleContainerURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleContainerURL];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return _[a1 bundleId];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return _[a1 bundleVersion];
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_canOpenApplication_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canOpenApplication:reason:");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characterIsMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterIsMember:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_containingBundle(void *a1, const char *a2, ...)
{
  return _[a1 containingBundle];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return _[a1 currentState];
}

id objc_msgSend_dashboardService(void *a1, const char *a2, ...)
{
  return _[a1 dashboardService];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_dealloc(void *a1, const char *a2, ...)
{
  return _[a1 dealloc];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 decimalDigitCharacterSet];
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_deletes(void *a1, const char *a2, ...)
{
  return _[a1 deletes];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_displayAppName(void *a1, const char *a2, ...)
{
  return _[a1 displayAppName];
}

id objc_msgSend_displayAppNameMap(void *a1, const char *a2, ...)
{
  return _[a1 displayAppNameMap];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_doNotDismissSiri(void *a1, const char *a2, ...)
{
  return _[a1 doNotDismissSiri];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_drain(void *a1, const char *a2, ...)
{
  return _[a1 drain];
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return _[a1 entitlements];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_execute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "execute:");
}

id objc_msgSend_executionEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 executionEnvironment];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_foundItemCount(void *a1, const char *a2, ...)
{
  return _[a1 foundItemCount];
}

id objc_msgSend_getKnowledgeUUID_andSequenceNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getKnowledgeUUID:andSequenceNumber:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleForPredicate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleForPredicate:error:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_initWithAppId_anchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppId:anchor:");
}

id objc_msgSend_initWithAppId_appProxy_anchor_configuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppId:appProxy:anchor:configuration:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:options:error:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithExplanation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExplanation:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithLastState_startAnchor_keyAnchor_validity_configuration_observer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLastState:startAnchor:keyAnchor:validity:configuration:observer:");
}

id objc_msgSend_initWithMarketplace_keyword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMarketplace:keyword:");
}

id objc_msgSend_initWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:count:");
}

id objc_msgSend_initWithPredicate_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPredicate:context:");
}

id objc_msgSend_initWithQueryString_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueryString:attributes:");
}

id objc_msgSend_initWithSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSet:");
}

id objc_msgSend_initWithSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSource:");
}

id objc_msgSend_initWithValidity_version_keyAnchor_startAnchor_stopAnchor_apps_deletes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValidity:version:keyAnchor:startAnchor:stopAnchor:apps:deletes:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isBetaApp(void *a1, const char *a2, ...)
{
  return _[a1 isBetaApp];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToAnchor:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMetaDataItemDelete(void *a1, const char *a2, ...)
{
  return _[a1 isMetaDataItemDelete];
}

id objc_msgSend_isMetaDataItemUpdate(void *a1, const char *a2, ...)
{
  return _[a1 isMetaDataItemUpdate];
}

id objc_msgSend_isNewerThanAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNewerThanAnchor:");
}

id objc_msgSend_isOlderThanAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOlderThanAnchor:");
}

id objc_msgSend_isPrimitiveAnchor(void *a1, const char *a2, ...)
{
  return _[a1 isPrimitiveAnchor];
}

id objc_msgSend_isRestricted(void *a1, const char *a2, ...)
{
  return _[a1 isRestricted];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return _[a1 isRunning];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isValidStringRepresentation_withMainIndex_subIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidStringRepresentation:withMainIndex:subIndex:");
}

id objc_msgSend_keyAnchor(void *a1, const char *a2, ...)
{
  return _[a1 keyAnchor];
}

id objc_msgSend_keyword(void *a1, const char *a2, ...)
{
  return _[a1 keyword];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_launchId(void *a1, const char *a2, ...)
{
  return _[a1 launchId];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return _[a1 load];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return _[a1 localizations];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_logInstrumentation_machAbsoluteTime_turnIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logInstrumentation:machAbsoluteTime:turnIdentifier:");
}

id objc_msgSend_marketplace(void *a1, const char *a2, ...)
{
  return _[a1 marketplace];
}

id objc_msgSend_metaData(void *a1, const char *a2, ...)
{
  return _[a1 metaData];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openApplication:withOptions:completion:");
}

id objc_msgSend_optionsWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionsWithDictionary:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_performWithCompletion_serviceHelper_executionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWithCompletion:serviceHelper:executionInfo:");
}

id objc_msgSend_phrase(void *a1, const char *a2, ...)
{
  return _[a1 phrase];
}

id objc_msgSend_plugInKitPlugins(void *a1, const char *a2, ...)
{
  return _[a1 plugInKitPlugins];
}

id objc_msgSend_predicateMatchingBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingBundleIdentifier:");
}

id objc_msgSend_predicateMatchingBundleIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingBundleIdentifiers:");
}

id objc_msgSend_primitiveAnchor(void *a1, const char *a2, ...)
{
  return _[a1 primitiveAnchor];
}

id objc_msgSend_processNextChange_afterAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processNextChange:afterAnchor:");
}

id objc_msgSend_projectedStateForKeyAnchor_withValidity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "projectedStateForKeyAnchor:withValidity:");
}

id objc_msgSend_pronunciation(void *a1, const char *a2, ...)
{
  return _[a1 pronunciation];
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return _[a1 protocol];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_resetWithValidity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetWithValidity:");
}

id objc_msgSend_save_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "save:");
}

id objc_msgSend_sceneId(void *a1, const char *a2, ...)
{
  return _[a1 sceneId];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_scrapeAppInfo(void *a1, const char *a2, ...)
{
  return _[a1 scrapeAppInfo];
}

id objc_msgSend_sequenceNumber(void *a1, const char *a2, ...)
{
  return _[a1 sequenceNumber];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_setAceAppBundleInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAceAppBundleInfo:");
}

id objc_msgSend_setAceId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAceId:");
}

id objc_msgSend_setAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnchor:");
}

id objc_msgSend_setAppId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppId:");
}

id objc_msgSend_setAppToItsRestrictionsMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppToItsRestrictionsMap:");
}

id objc_msgSend_setBuildNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBuildNumber:");
}

id objc_msgSend_setBundleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleIDs:");
}

id objc_msgSend_setBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleId:");
}

id objc_msgSend_setClientIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientIdentifier:");
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionHandler:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDoNotDismissSiri_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDoNotDismissSiri:");
}

id objc_msgSend_setFoundApps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFoundApps:");
}

id objc_msgSend_setFoundItemsHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFoundItemsHandler:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIntentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntentType:");
}

id objc_msgSend_setIntentVocabulary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntentVocabulary:");
}

id objc_msgSend_setIsDelete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsDelete:");
}

id objc_msgSend_setKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKey:");
}

id objc_msgSend_setLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLanguage:");
}

id objc_msgSend_setLaunchId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLaunchId:");
}

id objc_msgSend_setLocalizedBundleDisplayName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedBundleDisplayName:");
}

id objc_msgSend_setObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setPhrase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhrase:");
}

id objc_msgSend_setPostAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPostAnchor:");
}

id objc_msgSend_setPronunciation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPronunciation:");
}

id objc_msgSend_setProtectionClasses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProtectionClasses:");
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReason:");
}

id objc_msgSend_setRefId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRefId:");
}

id objc_msgSend_setRequiresUserIdentification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresUserIdentification:");
}

id objc_msgSend_setRestrictedApps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRestrictedApps:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setSupportedModes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportedModes:");
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTag:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setTypeName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTypeName:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURL:");
}

id objc_msgSend_setUseCases_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseCases:");
}

id objc_msgSend_setValidity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValidity:");
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVersion:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 sharedAnalytics];
}

id objc_msgSend_shortVersionString(void *a1, const char *a2, ...)
{
  return _[a1 shortVersionString];
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return _[a1 signal];
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sourceIsReady_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceIsReady:");
}

id objc_msgSend_spotlightName(void *a1, const char *a2, ...)
{
  return _[a1 spotlightName];
}

id objc_msgSend_spotlightNameMap(void *a1, const char *a2, ...)
{
  return _[a1 spotlightNameMap];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startAnchor(void *a1, const char *a2, ...)
{
  return _[a1 startAnchor];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stopAnchor(void *a1, const char *a2, ...)
{
  return _[a1 stopAnchor];
}

id objc_msgSend_stringRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 stringRepresentation];
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_supportedIntents(void *a1, const char *a2, ...)
{
  return _[a1 supportedIntents];
}

id objc_msgSend_supportedMediaCategories(void *a1, const char *a2, ...)
{
  return _[a1 supportedMediaCategories];
}

id objc_msgSend_turnId(void *a1, const char *a2, ...)
{
  return _[a1 turnId];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_validity(void *a1, const char *a2, ...)
{
  return _[a1 validity];
}

id objc_msgSend_valueForGenericParser_withDefaultGenerator_withErrorKeyDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForGenericParser:withDefaultGenerator:withErrorKeyDescriptor:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForPlistEntry_inBundle_withInfo_entitlements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForPlistEntry:inBundle:withInfo:entitlements:");
}

id objc_msgSend_valuesForEntries_inPlistAtURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valuesForEntries:inPlistAtURL:");
}

id objc_msgSend_valuesForInfoPlistEntries_inBundle_withEntitlements_forLocalization_ignoringDefaultValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valuesForInfoPlistEntries:inBundle:withEntitlements:forLocalization:ignoringDefaultValues:");
}

id objc_msgSend_valuesForLocalInfoPlistEntries_inBundle_withEntitlements_ignoringDefaultValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valuesForLocalInfoPlistEntries:inBundle:withEntitlements:ignoringDefaultValues:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _[a1 version];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return _[a1 wait];
}

id objc_msgSend_waitUntilReady(void *a1, const char *a2, ...)
{
  return _[a1 waitUntilReady];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:options:error:");
}