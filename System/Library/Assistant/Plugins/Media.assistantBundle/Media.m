id sub_1D422B58C()
{
  void *v0;
  id v1;
  void v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars8;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_1EBD857F0;
  v7 = qword_1EBD857F0;
  if (!qword_1EBD857F0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = sub_1D424BB54;
    v3[3] = &unk_1E69E35D8;
    v3[4] = &v4;
    sub_1D424BB54((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1D422B658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D422B9B0(uint64_t a1, unsigned int a2)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D422BA90;
  v9[3] = &unk_1E69E3EB8;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  v8 = *(void **)(a1 + 80);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v8;
  [v4 resolveWithHashedRouteIdentifiers:v5 audioRoutingInfo:a2 completion:v9];
}

void sub_1D422BA90(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D422BB60;
  v9[3] = &unk_1E69E3E90;
  id v10 = v4;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  v8 = *(void **)(a1 + 64);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v8;
  [v10 sendCommand:20 toDestination:a2 withOptions:v5 completion:v9];
}

void sub_1D422BB60(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = objc_alloc_init(MEMORY[0x1E4F965B8]);
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setObject:@"Rate Media Entity" forKeyedSubscript:@"pluginname"];
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"success"];
  uint64_t v7 = NSNumber;
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  v9 = [v7 numberWithDouble:fabs(v8)];
  [v6 setObject:v9 forKeyedSubscript:@"duration"];

  if (v3)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v11 = [v3 localizedDescription];
    uint64_t v12 = [v10 initWithReason:v11];

    [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"success"];
    id v13 = [v3 localizedDescription];
    [v6 setObject:v13 forKeyedSubscript:@"errorstring"];

    id v5 = (id)v12;
  }
  if (![*(id *)(*(void *)(a1 + 48) + 56) length])
  {
    id v14 = [*(id *)(a1 + 48) aceId];
    uint64_t v15 = sub_1D4244ECC(@"Rate Media Entity", v14);
    uint64_t v16 = *(void *)(a1 + 48);
    v17 = *(void **)(v16 + 56);
    *(void *)(v16 + 56) = v15;
  }
  v18 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 56);
    v20 = [v5 dictionary];
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v19;
    __int16 v27 = 2114;
    v28 = v20;
    _os_log_impl(&dword_1D422A000, v18, OS_LOG_TYPE_DEFAULT, "Rate Media Entity (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
  }
  uint64_t v21 = *(void *)(a1 + 56);
  v22 = [v5 dictionary];
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  v24 = v6;
  id v23 = v6;
  AnalyticsSendEventLazy();
}

id sub_1D422BE58(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1D422C184(uint64_t a1, unsigned int a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D422C264;
  v9[3] = &unk_1E69E3EB8;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  double v8 = *(void **)(a1 + 80);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v8;
  [v4 resolveWithHashedRouteIdentifiers:v5 audioRoutingInfo:a2 completion:v9];
}

void sub_1D422C264(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D422C334;
  v9[3] = &unk_1E69E3E90;
  id v10 = v4;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  double v8 = *(void **)(a1 + 64);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v8;
  [v10 sendCommand:0 toDestination:a2 withOptions:v5 completion:v9];
}

void sub_1D422C334(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = objc_alloc_init(MEMORY[0x1E4F965B8]);
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setObject:@"Start Playback" forKeyedSubscript:@"pluginname"];
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"success"];
  uint64_t v7 = NSNumber;
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  v9 = [v7 numberWithDouble:fabs(v8)];
  [v6 setObject:v9 forKeyedSubscript:@"duration"];

  if (v3)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v11 = [v3 localizedDescription];
    uint64_t v12 = [v10 initWithReason:v11];

    [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"success"];
    id v13 = [v3 localizedDescription];
    [v6 setObject:v13 forKeyedSubscript:@"errorstring"];

    id v5 = (id)v12;
  }
  if (![*(id *)(*(void *)(a1 + 48) + 56) length])
  {
    id v14 = [*(id *)(a1 + 48) aceId];
    uint64_t v15 = sub_1D4244ECC(@"Start Playback", v14);
    uint64_t v16 = *(void *)(a1 + 48);
    v17 = *(void **)(v16 + 56);
    *(void *)(v16 + 56) = v15;
  }
  v18 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 56);
    v20 = [v5 dictionary];
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v19;
    __int16 v27 = 2114;
    v28 = v20;
    _os_log_impl(&dword_1D422A000, v18, OS_LOG_TYPE_DEFAULT, "Start Playback (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
  }
  uint64_t v21 = *(void *)(a1 + 56);
  v22 = [v5 dictionary];
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  v24 = v6;
  id v23 = v6;
  AnalyticsSendEventLazy();
}

id sub_1D422C62C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1D422CD64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose((const void *)(v59 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D422CDC4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1D422CDD4(uint64_t a1)
{
}

void sub_1D422CDDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t ContentItemAtOffset = MRPlaybackQueueGetContentItemAtOffset();
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 104) length];
  if (a3)
  {
    if (!v6)
    {
      uint64_t v7 = [*(id *)(a1 + 32) aceId];
      uint64_t v8 = sub_1D4244ECC(@"Get State Response Remote", v7);
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 104);
      *(void *)(v9 + 104) = v8;
    }
    id v11 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 104);
      int v23 = 138543874;
      uint64_t v24 = v13;
      __int16 v25 = 2114;
      uint64_t v26 = a3;
      __int16 v27 = 2114;
      uint64_t v28 = v12;
      _os_log_impl(&dword_1D422A000, v11, OS_LOG_TYPE_ERROR, "Get State Response Remote (playinginfo) <%{public}@>: no queue %{public}@ endpoint %{public}@", (uint8_t *)&v23, 0x20u);
    }
  }
  else
  {
    if (!v6)
    {
      id v14 = [*(id *)(a1 + 32) aceId];
      uint64_t v15 = sub_1D4244ECC(@"Get State Response Remote", v14);
      uint64_t v16 = *(void *)(a1 + 32);
      v17 = *(void **)(v16 + 104);
      *(void *)(v16 + 104) = v15;
    }
    v18 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(a1 + 40);
      uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 104);
      int v23 = 138543874;
      uint64_t v24 = v20;
      __int16 v25 = 2114;
      uint64_t v26 = ContentItemAtOffset;
      __int16 v27 = 2114;
      uint64_t v28 = v19;
      _os_log_impl(&dword_1D422A000, v18, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (playinginfo) <%{public}@>: playing %{public}@ endpoint %{public}@", (uint8_t *)&v23, 0x20u);
    }

    uint64_t v21 = MRContentItemCopyNowPlayingInfo();
    uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
    id v11 = *(NSObject **)(v22 + 40);
    *(void *)(v22 + 40) = v21;
  }

  CFRelease(*(CFTypeRef *)(a1 + 64));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_1D422CFE0(uint64_t a1, unsigned int a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(*(void *)(a1 + 32) + 104) length])
  {
    id v4 = [*(id *)(a1 + 32) aceId];
    uint64_t v5 = sub_1D4244ECC(@"Get State Response Remote", v4);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 104);
    *(void *)(v6 + 104) = v5;
  }
  uint64_t v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 104);
    int v12 = 138543874;
    uint64_t v13 = v10;
    __int16 v14 = 2048;
    uint64_t v15 = a2;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (playinginfo) <%{public}@>: playback state %ld endpoint %{public}@", (uint8_t *)&v12, 0x20u);
  }

  if (a2 - 1 > 4) {
    int v11 = 0;
  }
  else {
    int v11 = dword_1D4260AA0[a2 - 1];
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v11;
  CFRelease(*(CFTypeRef *)(a1 + 64));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_1D422D140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (![*(id *)(*(void *)(a1 + 32) + 104) length])
    {
      uint64_t v5 = [*(id *)(a1 + 32) aceId];
      uint64_t v6 = sub_1D4244ECC(@"Get State Response Remote", v5);
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void **)(v7 + 104);
      *(void *)(v7 + 104) = v6;
    }
    uint64_t v9 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 104);
      int v23 = 138543874;
      uint64_t v24 = v11;
      __int16 v25 = 2114;
      *(void *)uint64_t v26 = a3;
      *(_WORD *)&v26[8] = 2114;
      *(void *)&v26[10] = v10;
      _os_log_impl(&dword_1D422A000, v9, OS_LOG_TYPE_ERROR, "Get State Response Remote (playinginfo) <%{public}@>: no device info %{public}@ endpoint %{public}@", (uint8_t *)&v23, 0x20u);
    }
  }
  else
  {
    BundleIdentifier = *(void **)(a1 + 64);
    if (BundleIdentifier) {
      BundleIdentifier = (void *)MRNowPlayingClientGetBundleIdentifier();
    }
    id v13 = BundleIdentifier;
    uint64_t v9 = MRPairedDeviceCopySystemMediaApplication();
    char v14 = [v9 isEqual:v13];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v14;
    if (![*(id *)(*(void *)(a1 + 32) + 104) length])
    {
      uint64_t v15 = [*(id *)(a1 + 32) aceId];
      uint64_t v16 = sub_1D4244ECC(@"Get State Response Remote", v15);
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = *(void **)(v17 + 104);
      *(void *)(v17 + 104) = v16;
    }
    uint64_t v19 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 104);
      int v22 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      int v23 = 138543874;
      uint64_t v24 = v21;
      __int16 v25 = 1024;
      *(_DWORD *)uint64_t v26 = v22;
      *(_WORD *)&v26[4] = 2114;
      *(void *)&v26[6] = v20;
      _os_log_impl(&dword_1D422A000, v19, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (playinginfo) <%{public}@>: is music app %{BOOL}u endpoint %{public}@", (uint8_t *)&v23, 0x1Cu);
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 72));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_1D422D380(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(*(void *)(a1 + 32) + 104) length])
  {
    id v4 = [*(id *)(a1 + 32) aceId];
    uint64_t v5 = sub_1D4244ECC(@"Get State Response Remote", v4);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 104);
    *(void *)(v6 + 104) = v5;
  }
  uint64_t v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 104);
    int v14 = 138543874;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    uint64_t v17 = a2;
    __int16 v18 = 2114;
    uint64_t v19 = v9;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (playinginfo) <%{public}@>: group identity %{public}@endpoint %{public}@", (uint8_t *)&v14, 0x20u);
  }

  uint64_t v11 = [a2 copy];
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_1D422D4C0(uint64_t a1)
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 72);
  id v3 = [v2 outputDevices];
  if (![*(id *)(*(void *)(a1 + 32) + 104) length])
  {
    id v4 = [*(id *)(a1 + 32) aceId];
    uint64_t v5 = sub_1D4244ECC(@"Get State Response Remote", v4);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 104);
    *(void *)(v6 + 104) = v5;
  }
  uint64_t v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 104);
    uint64_t v10 = [v3 count];
    uint64_t v11 = *(void *)(a1 + 72);
    *(_DWORD *)buf = 138543874;
    uint64_t v81 = v9;
    __int16 v82 = 2048;
    uint64_t v83 = v10;
    __int16 v84 = 2114;
    uint64_t v85 = v11;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (playinginfo) <%{public}@>: %ld output devices endpoint %{public}@", buf, 0x20u);
  }

  CFRelease(*(CFTypeRef *)(a1 + 72));
  uint64_t v12 = [v2 designatedGroupLeader];
  if (!v12)
  {
    id v13 = [v2 outputDevices];
    uint64_t v12 = [v13 firstObject];

    if (![*(id *)(*(void *)(a1 + 32) + 104) length])
    {
      int v14 = [*(id *)(a1 + 32) aceId];
      uint64_t v15 = sub_1D4244ECC(@"Get State Response Remote", v14);
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void **)(v16 + 104);
      *(void *)(v16 + 104) = v15;
    }
    __int16 v18 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 104);
      *(_DWORD *)buf = 138543618;
      uint64_t v81 = v19;
      __int16 v82 = 2114;
      uint64_t v83 = (uint64_t)v12;
      _os_log_impl(&dword_1D422A000, v18, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (playinginfo) <%{public}@>: using first output device %{public}@", buf, 0x16u);
    }
  }
  v57 = v12;
  v58 = v2;
  uint64_t v61 = [v12 groupID];
  uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v21 = v3;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v72 objects:v79 count:16];
  uint64_t v59 = v21;
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v73 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        uint64_t v27 = [v26 clusterComposition];
        if (v27)
        {
          uint64_t v28 = NSStringFromSelector(sel_uid);
          uint64_t v29 = [v27 valueForKeyPath:v28];
          [v20 addObjectsFromArray:v29];

          if (![*(id *)(*(void *)(a1 + 32) + 104) length])
          {
            v30 = [*(id *)(a1 + 32) aceId];
            uint64_t v31 = sub_1D4244ECC(@"Get State Response Remote", v30);
            uint64_t v32 = *(void *)(a1 + 32);
            v33 = *(void **)(v32 + 104);
            *(void *)(v32 + 104) = v31;
          }
          v34 = _MPLogCategoryAssistant();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v35 = *(void *)(*(void *)(a1 + 32) + 104);
            *(_DWORD *)buf = 138543618;
            uint64_t v81 = v35;
            __int16 v82 = 2114;
            uint64_t v83 = (uint64_t)v20;
            _os_log_impl(&dword_1D422A000, v34, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (playinginfo) <%{public}@>: using cluster device IDs %{public}@", buf, 0x16u);
          }
        }
        else
        {
          v36 = [v26 uid];
          [v20 addObject:v36];

          if (![*(id *)(*(void *)(a1 + 32) + 104) length])
          {
            v37 = [*(id *)(a1 + 32) aceId];
            uint64_t v38 = sub_1D4244ECC(@"Get State Response Remote", v37);
            uint64_t v39 = *(void *)(a1 + 32);
            v40 = *(void **)(v39 + 104);
            *(void *)(v39 + 104) = v38;
          }
          v34 = _MPLogCategoryAssistant();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v41 = *(void *)(*(void *)(a1 + 32) + 104);
            v42 = [v26 uid];
            *(_DWORD *)buf = 138543618;
            uint64_t v81 = v41;
            id v21 = v59;
            __int16 v82 = 2114;
            uint64_t v83 = (uint64_t)v42;
            _os_log_impl(&dword_1D422A000, v34, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (playinginfo) <%{public}@>: using output device ID %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v72 objects:v79 count:16];
    }
    while (v23);
  }

  v43 = dispatch_group_create();
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  aSelector = v20;
  uint64_t v44 = [aSelector countByEnumeratingWithState:&v68 objects:v78 count:16];
  v45 = (void *)v61;
  if (v44)
  {
    uint64_t v46 = v44;
    uint64_t v47 = *(void *)v69;
    do
    {
      uint64_t v48 = 0;
      do
      {
        if (*(void *)v69 != v47) {
          objc_enumerationMutation(aSelector);
        }
        uint64_t v49 = *(void *)(*((void *)&v68 + 1) + 8 * v48);
        dispatch_group_enter(v43);
        if ([v45 length])
        {
          v77 = v45;
          v50 = &v77;
LABEL_36:
          v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
          goto LABEL_37;
        }
        if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) length])
        {
          uint64_t v76 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          v50 = (void **)&v76;
          goto LABEL_36;
        }
        v51 = &unk_1F2BFEC18;
LABEL_37:
        uint64_t v52 = *(void *)(a1 + 32);
        v53 = *(void **)(v52 + 96);
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = sub_1D422DBE8;
        v64[3] = &unk_1E69E2A68;
        long long v66 = *(_OWORD *)(a1 + 48);
        uint64_t v67 = *(void *)(a1 + 64);
        v64[4] = v52;
        v64[5] = v49;
        v65 = v43;
        [v53 encodeHashedRouteUIDs:v51 completion:v64];

        ++v48;
        v45 = (void *)v61;
      }
      while (v46 != v48);
      uint64_t v54 = [aSelector countByEnumeratingWithState:&v68 objects:v78 count:16];
      uint64_t v46 = v54;
    }
    while (v54);
  }

  uint64_t v55 = *(void *)(a1 + 32);
  v56 = *(NSObject **)(v55 + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D422DDC4;
  block[3] = &unk_1E69E2A90;
  long long v63 = *(_OWORD *)(a1 + 80);
  block[4] = v55;
  dispatch_group_notify(v43, v56, block);
}

void sub_1D422DBE8(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F96800];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [v4 firstObject];

  [v5 setHashedGroupID:v6];
  uint64_t v7 = sub_1D4244A24(*(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectForKeyedSubscript:*MEMORY[0x1E4F77598]];
  uint64_t v9 = [v8 length];
  uint64_t v10 = (id *)MEMORY[0x1E4F97380];
  if (v9) {
    uint64_t v10 = (id *)MEMORY[0x1E4F97388];
  }
  id v11 = *v10;
  [v5 setListeningToItem:v7];
  [v5 setSource:v11];
  uint64_t v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v5 setListeningToMusicApplication:v12];

  [v5 setState:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  long long v13 = *(_OWORD *)(a1 + 32);
  int v14 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1D422DE14;
  v16[3] = &unk_1E69E3310;
  long long v17 = v13;
  id v18 = v5;
  id v19 = *(id *)(a1 + 48);
  id v15 = v5;
  dispatch_sync(v14, v16);
}

void sub_1D422DDC4(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 48));
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 88);

  dispatch_group_leave(v2);
}

void sub_1D422DE14(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    [*(id *)(v3 + 64) setObject:*(void *)(a1 + 48) forKey:v2];
    if (![*(id *)(*(void *)(a1 + 32) + 104) length])
    {
      id v4 = [*(id *)(a1 + 32) aceId];
      uint64_t v5 = sub_1D4244ECC(@"Get State Response Remote", v4);
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void **)(v6 + 104);
      *(void *)(v6 + 104) = v5;
    }
    uint64_t v8 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 104);
      uint64_t v10 = [*(id *)(a1 + 48) dictionary];
      int v17 = 138543874;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      uint64_t v20 = v2;
      __int16 v21 = 2114;
      uint64_t v22 = v10;
      _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (playinginfo) <%{public}@>: hashedUID %{public}@ response %{public}@.", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    if (![*(id *)(v3 + 104) length])
    {
      id v11 = [*(id *)(a1 + 32) aceId];
      uint64_t v12 = sub_1D4244ECC(@"Get State Response Remote", v11);
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = *(void **)(v13 + 104);
      *(void *)(v13 + 104) = v12;
    }
    uint64_t v8 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = *(void **)(a1 + 40);
      uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 104);
      int v17 = 138543618;
      uint64_t v18 = v16;
      __int16 v19 = 2114;
      uint64_t v20 = v15;
      _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (playinginfo) <%{public}@>: UID %{public}@ was not requested", (uint8_t *)&v17, 0x16u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_1D422E2A0(id *a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)a1[4] + 7, a2);
  uint64_t v5 = [*((id *)a1[4] + 7) allKeys];
  uint64_t v6 = (void *)[v5 mutableCopy];

  if (*((void *)a1[4] + 7))
  {
    dispatch_group_t v7 = dispatch_group_create();
    uint64_t v8 = a1[4];
    uint64_t v9 = (void *)v8[11];
    v8[11] = v7;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.MediaPlayer.assistant.responseCollection", 0);
    id v11 = a1[4];
    uint64_t v12 = (void *)v11[10];
    v11[10] = v10;

    if ([v6 count])
    {
      if (![*((id *)a1[4] + 13) length])
      {
        uint64_t v13 = [a1[4] aceId];
        uint64_t v14 = sub_1D4244ECC(@"Get State Response Remote", v13);
        id v15 = a1[4];
        uint64_t v16 = (void *)v15[13];
        v15[13] = v14;
      }
      int v17 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *((void *)a1[4] + 13);
        *(_DWORD *)buf = 138543618;
        uint64_t v35 = v18;
        __int16 v36 = 2114;
        v37 = v6;
        _os_log_impl(&dword_1D422A000, v17, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (discovery) <%{public}@>: To discover: %{public}@", buf, 0x16u);
      }

      id v19 = objc_alloc_init(MEMORY[0x1E4F76E38]);
      dispatch_group_enter(*((dispatch_group_t *)a1[4] + 11));
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = sub_1D422E5CC;
      v32[3] = &unk_1E69E29A0;
      v32[4] = a1[4];
      id v33 = v19;
      id v20 = v19;
      [v20 discoverRemoteControlEndpointsMatchingUIDs:v6 completion:v32];
    }
    __int16 v21 = *((void *)a1[4] + 11);
    uint64_t v22 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D422E850;
    block[3] = &unk_1E69E3DA0;
    id v23 = a1[5];
    id v24 = a1[4];
    id v29 = v23;
    id v30 = v24;
    id v31 = a1[6];
    dispatch_group_notify(v21, v22, block);
  }
  else
  {
    __int16 v25 = (void (**)(id, void *))a1[6];
    id v26 = objc_alloc_init(MEMORY[0x1E4F965A8]);
    uint64_t v27 = [v26 dictionary];
    v25[2](v25, v27);
  }
}

void sub_1D422E5CC(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v25;
    *(void *)&long long v4 = 138543618;
    long long v17 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if (!objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "length", v17))
        {
          uint64_t v9 = [*(id *)(a1 + 32) aceId];
          uint64_t v10 = sub_1D4244ECC(@"Get State Response Remote", v9);
          uint64_t v11 = *(void *)(a1 + 32);
          uint64_t v12 = *(void **)(v11 + 104);
          *(void *)(v11 + 104) = v10;
        }
        uint64_t v13 = _MPLogCategoryAssistant();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 104);
          *(_DWORD *)buf = v17;
          uint64_t v29 = v14;
          __int16 v30 = 2114;
          uint64_t v31 = v8;
          _os_log_impl(&dword_1D422A000, v13, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (discovery) <%{public}@>: Discovered: %{public}@", buf, 0x16u);
        }

        id v15 = objc_alloc_init(MEMORY[0x1E4F76E30]);
        dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 88));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = sub_1D422E9B0;
        v19[3] = &unk_1E69E2978;
        id v20 = *(id *)(a1 + 40);
        id v21 = v15;
        uint64_t v22 = *(void *)(a1 + 32);
        uint64_t v23 = v8;
        id v16 = v15;
        [v16 connectToEndpoint:v8 completion:v19];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 88));
}

void sub_1D422E850(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setRouteResponses:*(void *)(*(void *)(a1 + 40) + 64)];
  if (![*(id *)(*(void *)(a1 + 40) + 104) length])
  {
    id v2 = [*(id *)(a1 + 40) aceId];
    uint64_t v3 = sub_1D4244ECC(@"Get State Response Remote", v2);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void **)(v4 + 104);
    *(void *)(v4 + 104) = v3;
  }
  uint64_t v6 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 104);
    uint64_t v8 = [*(id *)(a1 + 32) dictionary];
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1D422A000, v6, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = [*(id *)(a1 + 32) dictionary];
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
}

void sub_1D422E9B0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(id **)(a1 + 48);
  if (v5)
  {
    if (![v8[13] length])
    {
      uint64_t v9 = [*(id *)(a1 + 48) aceId];
      uint64_t v10 = sub_1D4244ECC(@"Get State Response Remote", v9);
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(void **)(v11 + 104);
      *(void *)(v11 + 104) = v10;
    }
    __int16 v13 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 56);
      uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 104);
      int v16 = 138543874;
      uint64_t v17 = v15;
      __int16 v18 = 2114;
      uint64_t v19 = v14;
      __int16 v20 = 2114;
      id v21 = v5;
      _os_log_impl(&dword_1D422A000, v13, OS_LOG_TYPE_ERROR, "Get State Response Remote (connect) <%{public}@>: Failed connect: %{public}@ -- %{public}@", (uint8_t *)&v16, 0x20u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 48) + 88));
  }
  else
  {
    [v8 setPlayingInfoFromEndpoint:*(void *)(a1 + 56)];
  }
}

void sub_1D422F45C(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    id v7 = @"Add Media Items To Playlist";
    __int16 v8 = 2114;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1D422A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ (cloud items) <%{public}@>: rewrite finished", (uint8_t *)&v6, 0x16u);
  }

  +[MPAssistantAddMediaItemsToPlaylist _notifyAssistantWithError:v3 requestHash:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

void sub_1D422FD60(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    id v7 = @"Add Media Items To Playlist";
    __int16 v8 = 2114;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1D422A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ (cloud items) <%{public}@>: rewrite finished", (uint8_t *)&v6, 0x16u);
  }

  +[MPAssistantAddMediaItemsToPlaylist _notifyAssistantWithError:v3 requestHash:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

uint64_t sub_1D42304B8(uint64_t a1, uint64_t a2)
{
  return +[MPAssistantAddMediaItemsToPlaylist _notifyAssistantWithError:a2 requestHash:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

uint64_t sub_1D42304D0(uint64_t a1, uint64_t a2)
{
  return +[MPAssistantAddMediaItemsToPlaylist _notifyAssistantWithError:a2 requestHash:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

void sub_1D4230DA8(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (![*(id *)(*(void *)(a1 + 32) + 56) length])
    {
      id v3 = [*(id *)(a1 + 32) aceId];
      uint64_t v4 = sub_1D4244ECC(@"Add Media Items To Playlist", v3);
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = *(void **)(v5 + 56);
      *(void *)(v5 + 56) = v4;
    }
    id v7 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 56);
      int v14 = 138543362;
      uint64_t v15 = v8;
      _os_log_impl(&dword_1D422A000, v7, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (local) <%{public}@>: added items", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = objc_alloc_init(MEMORY[0x1E4F965B8]);
    uint64_t v11 = [v10 dictionary];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v11);
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 56);
    +[MPAssistantAddMediaItemsToPlaylist _notifyAssistantWithString:@"Unable to add item to playlist" requestHash:v13 completion:v12];
  }
}

void sub_1D4230F48(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (![*(id *)(*(void *)(a1 + 32) + 56) length])
    {
      id v3 = [*(id *)(a1 + 32) aceId];
      uint64_t v4 = sub_1D4244ECC(@"Add Media Items To Playlist", v3);
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = *(void **)(v5 + 56);
      *(void *)(v5 + 56) = v4;
    }
    id v7 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 56);
      int v14 = 138543362;
      uint64_t v15 = v8;
      _os_log_impl(&dword_1D422A000, v7, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (local) <%{public}@>: added items", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = objc_alloc_init(MEMORY[0x1E4F965B8]);
    uint64_t v11 = [v10 dictionary];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v11);
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 56);
    +[MPAssistantAddMediaItemsToPlaylist _notifyAssistantWithString:@"Unable to add item to playlist" requestHash:v13 completion:v12];
  }
}

void sub_1D4231670(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), a2);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1D4231878;
    v16[3] = &unk_1E69E3A10;
    uint64_t v5 = *(void **)(a1 + 32);
    id v17 = *(id *)(a1 + 40);
    [v5 _appendToPlaylistWithCompletion:v16];
    int v6 = v17;
  }
  else
  {
    int v6 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"no user identity"];
    if (![*(id *)(*(void *)(a1 + 32) + 56) length])
    {
      id v7 = [*(id *)(a1 + 32) aceId];
      uint64_t v8 = sub_1D4244ECC(@"Add Media Items To Playlist", v7);
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 56);
      *(void *)(v9 + 56) = v8;
    }
    uint64_t v11 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 56);
      uint64_t v13 = [v6 dictionary];
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      id v21 = v13;
      _os_log_impl(&dword_1D422A000, v11, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = [v6 dictionary];
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
  }
}

uint64_t sub_1D4231878(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1D4231FB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1D4232088;
  v6[3] = &unk_1E69E3740;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v4 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = v4;
  id v11 = *(id *)(a1 + 56);
  id v5 = v3;
  sub_1D4232088((uint64_t)v6, 0);
}

void sub_1D4232088(uint64_t a1, unsigned int a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = [*(id *)(a1 + 48) refId];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D4232180;
  v9[3] = &unk_1E69E2AE0;
  id v10 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = *(id *)(a1 + 64);
  [v4 pauseDevicesByUID:v5 withRefId:v6 audioRoutingInfo:a2 source:@"siri" completion:v9];
}

void sub_1D4232180(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  if (v3)
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:v3];
    if (![*(id *)(*(void *)(a1 + 48) + 56) length])
    {
      id v7 = [*(id *)(a1 + 48) aceId];
      uint64_t v8 = sub_1D4244ECC(@"Pause Playback", v7);
      uint64_t v9 = *(void *)(a1 + 48);
      id v10 = *(void **)(v9 + 56);
      *(void *)(v9 + 56) = v8;
    }
    id v11 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 56);
      id v17 = [v6 dictionary];
      int v20 = 138543618;
      uint64_t v21 = v16;
      __int16 v22 = 2114;
      uint64_t v23 = v17;
      _os_log_impl(&dword_1D422A000, v11, OS_LOG_TYPE_DEFAULT, "Pause Playback (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F965B8]);
    if (![*(id *)(*(void *)(a1 + 48) + 56) length])
    {
      uint64_t v12 = [*(id *)(a1 + 48) aceId];
      uint64_t v13 = sub_1D4244ECC(@"Pause Playback", v12);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = *(void **)(v14 + 56);
      *(void *)(v14 + 56) = v13;
    }
    id v11 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
  }

  uint64_t v18 = *(void *)(a1 + 56);
  uint64_t v19 = [v6 dictionary];
  (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
}

void sub_1D42326B8(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = sub_1D4244A24(v11);
  id v4 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F77550]];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F773A8]];
  id v6 = (id *)MEMORY[0x1E4F97380];
  if (v5) {
    id v6 = (id *)MEMORY[0x1E4F97388];
  }
  id v7 = *v6;
  [*(id *)(a1 + 32) setListeningToItem:v3];
  [*(id *)(a1 + 32) setSource:v7];
  uint64_t v8 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F77530]];
  uint64_t v9 = [v8 BOOLValue];

  id v10 = [NSNumber numberWithBool:v9];
  [*(id *)(a1 + 32) setListeningToMusicApplication:v10];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1D42327E4(uint64_t a1, int a2)
{
  if ((a2 - 1) > 4) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = dword_1D4260AA0[a2 - 1];
  }
  [*(id *)(a1 + 32) setState:v3];
  id v4 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v4);
}

void sub_1D4232840(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(*(void *)(a1 + 32) + 56) length])
  {
    id v2 = [*(id *)(a1 + 32) aceId];
    uint64_t v3 = sub_1D4244ECC(@"Get State", v2);
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;
  }
  id v6 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 56);
    uint64_t v8 = [*(id *)(a1 + 40) dictionary];
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1D422A000, v6, OS_LOG_TYPE_DEFAULT, "Get State (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = [*(id *)(a1 + 40) dictionary];
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
}

id sub_1D4232988(void *a1)
{
  uint64_t v1 = *MEMORY[0x1E4F312C8];
  id v2 = a1;
  uint64_t v3 = [v2 valueForProperty:v1];
  uint64_t v4 = [v3 longLongValue];

  id v5 = objc_alloc_init(MEMORY[0x1E4F29088]);
  id v6 = [v2 identifierURLScheme];

  [v5 setScheme:v6];
  [v5 setHost:@"device"];
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"/%lld", v4);
  [v5 setPath:v7];

  uint64_t v8 = [v5 URL];

  return v8;
}

uint64_t sub_1D4232A80(void *a1)
{
  uint64_t v1 = qword_1EA6C8EC8;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_1EA6C8EC8, &unk_1F2BFA160);
  }
  uint64_t v3 = (void *)qword_1EA6C8EC0;
  uint64_t v4 = [v2 host];

  id v5 = [v3 objectForKey:v4];
  uint64_t v6 = [v5 integerValue];

  return v6;
}

void sub_1D4232B18()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"device";
  v2[1] = @"multiverse";
  v3[0] = &unk_1F2BFEC30;
  v3[1] = &unk_1F2BFEC48;
  v2[2] = @"store";
  v2[3] = @"ulid";
  v3[2] = &unk_1F2BFEC60;
  v3[3] = &unk_1F2BFEC78;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  uint64_t v1 = (void *)qword_1EA6C8EC0;
  qword_1EA6C8EC0 = v0;
}

void sub_1D4232FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D4232FC4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1D4232FD4(uint64_t a1)
{
}

intptr_t sub_1D4232FDC(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

void sub_1D4233EB4(uint64_t a1, void *a2)
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  uint64_t v4 = objc_msgSend(v3, "mediaPlayerOrderingTerms", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v106 objects:v114 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v107;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v107 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v106 + 1) + 8 * i);
        if ([v10 mediaPlayerSearchProperty] == 7)
        {
          int v11 = *(void **)(a1 + 32);
          uint64_t v12 = *(void **)(a1 + 40);
          __int16 v13 = [v10 mediaPlayerOrderingDirection];
          uint64_t v14 = [v12 _playlistsByDateCreatedOrder:v13];
          [v11 addObject:v14];

          char v7 = 1;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v106 objects:v114 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
  }

  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = [v3 searchProperties];
  id v17 = [v15 setWithArray:v16];

  if (*(void *)(a1 + 56))
  {
    if ([v17 containsObject:*MEMORY[0x1E4F973E8]])
    {
      if (![*(id *)(*(void *)(a1 + 40) + 56) length])
      {
        uint64_t v18 = [*(id *)(a1 + 40) aceId];
        uint64_t v19 = sub_1D4244ECC(@"Search", v18);
        uint64_t v20 = *(void *)(a1 + 40);
        uint64_t v21 = *(void **)(v20 + 56);
        *(void *)(v20 + 56) = v19;
      }
      __int16 v22 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 56);
        uint64_t v24 = [v3 query];
        *(_DWORD *)buf = 138543619;
        uint64_t v111 = v23;
        __int16 v112 = 2113;
        v113 = v24;
        _os_log_impl(&dword_1D422A000, v22, OS_LOG_TYPE_DEFAULT, "Search (search) <%{public}@>: search for artist: %{private}@", buf, 0x16u);
      }
      long long v25 = *(void **)(a1 + 32);
      long long v26 = *(void **)(a1 + 40);
      long long v27 = [v3 query];
      uint64_t v28 = [v26 _songCollectionsWithGroupingType:2 searchString:v27 mediaTypes:*(void *)(a1 + 56)];
      [v25 addObject:v28];
    }
    if ([v17 containsObject:*MEMORY[0x1E4F973E0]])
    {
      if (![*(id *)(*(void *)(a1 + 40) + 56) length])
      {
        uint64_t v29 = [*(id *)(a1 + 40) aceId];
        uint64_t v30 = sub_1D4244ECC(@"Search", v29);
        uint64_t v31 = *(void *)(a1 + 40);
        uint64_t v32 = *(void **)(v31 + 56);
        *(void *)(v31 + 56) = v30;
      }
      uint64_t v33 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = *(void *)(*(void *)(a1 + 40) + 56);
        uint64_t v35 = [v3 query];
        *(_DWORD *)buf = 138543619;
        uint64_t v111 = v34;
        __int16 v112 = 2113;
        v113 = v35;
        _os_log_impl(&dword_1D422A000, v33, OS_LOG_TYPE_DEFAULT, "Search (search) <%{public}@>: search for album: %{private}@", buf, 0x16u);
      }
      __int16 v36 = *(void **)(a1 + 32);
      v37 = *(void **)(a1 + 40);
      uint64_t v38 = [v3 query];
      uint64_t v39 = [v37 _songCollectionsWithGroupingType:1 searchString:v38 mediaTypes:*(void *)(a1 + 56)];
      [v36 addObject:v39];
    }
    if ([v17 containsObject:*MEMORY[0x1E4F973F8]])
    {
      if (![*(id *)(*(void *)(a1 + 40) + 56) length])
      {
        v40 = [*(id *)(a1 + 40) aceId];
        uint64_t v41 = sub_1D4244ECC(@"Search", v40);
        uint64_t v42 = *(void *)(a1 + 40);
        v43 = *(void **)(v42 + 56);
        *(void *)(v42 + 56) = v41;
      }
      uint64_t v44 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = *(void *)(*(void *)(a1 + 40) + 56);
        uint64_t v46 = [v3 query];
        *(_DWORD *)buf = 138543619;
        uint64_t v111 = v45;
        __int16 v112 = 2113;
        v113 = v46;
        _os_log_impl(&dword_1D422A000, v44, OS_LOG_TYPE_DEFAULT, "Search (search) <%{public}@>: search for genre: %{private}@", buf, 0x16u);
      }
      uint64_t v47 = *(void **)(a1 + 32);
      uint64_t v48 = *(void **)(a1 + 40);
      uint64_t v49 = [v3 query];
      v50 = [v48 _songCollectionsWithGroupingType:5 searchString:v49 mediaTypes:*(void *)(a1 + 56)];
      [v47 addObject:v50];
    }
    if ([v17 containsObject:*MEMORY[0x1E4F973F0]])
    {
      if (![*(id *)(*(void *)(a1 + 40) + 56) length])
      {
        v51 = [*(id *)(a1 + 40) aceId];
        uint64_t v52 = sub_1D4244ECC(@"Search", v51);
        uint64_t v53 = *(void *)(a1 + 40);
        uint64_t v54 = *(void **)(v53 + 56);
        *(void *)(v53 + 56) = v52;
      }
      uint64_t v55 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v56 = *(void *)(*(void *)(a1 + 40) + 56);
        v57 = [v3 query];
        *(_DWORD *)buf = 138543619;
        uint64_t v111 = v56;
        __int16 v112 = 2113;
        v113 = v57;
        _os_log_impl(&dword_1D422A000, v55, OS_LOG_TYPE_DEFAULT, "Search (search) <%{public}@>: search for composer: %{private}@", buf, 0x16u);
      }
      v58 = *(void **)(a1 + 32);
      uint64_t v59 = *(void **)(a1 + 40);
      v60 = [v3 query];
      uint64_t v61 = [v59 _songCollectionsWithGroupingType:4 searchString:v60 mediaTypes:*(void *)(a1 + 56)];
      [v58 addObject:v61];
    }
    if ([v17 containsObject:*MEMORY[0x1E4F97400]])
    {
      if (![*(id *)(*(void *)(a1 + 40) + 56) length])
      {
        v62 = [*(id *)(a1 + 40) aceId];
        uint64_t v63 = sub_1D4244ECC(@"Search", v62);
        uint64_t v64 = *(void *)(a1 + 40);
        v65 = *(void **)(v64 + 56);
        *(void *)(v64 + 56) = v63;
      }
      long long v66 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v67 = *(void *)(*(void *)(a1 + 40) + 56);
        long long v68 = [v3 query];
        *(_DWORD *)buf = 138543619;
        uint64_t v111 = v67;
        __int16 v112 = 2113;
        v113 = v68;
        _os_log_impl(&dword_1D422A000, v66, OS_LOG_TYPE_DEFAULT, "Search (search) <%{public}@>: search for title: %{private}@", buf, 0x16u);
      }
      long long v69 = *(void **)(a1 + 32);
      long long v70 = *(void **)(a1 + 40);
      long long v71 = [v3 query];
      long long v72 = [v70 _itemsByTitle:v71 mediaTypes:*(void *)(a1 + 56)];
      [v69 addObject:v72];
    }
  }
  if (!(v7 & 1 | (([*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F97420]] & 1) == 0)))
  {
    if (![*(id *)(*(void *)(a1 + 40) + 56) length])
    {
      long long v73 = [*(id *)(a1 + 40) aceId];
      uint64_t v74 = sub_1D4244ECC(@"Search", v73);
      uint64_t v75 = *(void *)(a1 + 40);
      uint64_t v76 = *(void **)(v75 + 56);
      *(void *)(v75 + 56) = v74;
    }
    v77 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v78 = *(void *)(*(void *)(a1 + 40) + 56);
      v79 = [v3 query];
      *(_DWORD *)buf = 138543619;
      uint64_t v111 = v78;
      __int16 v112 = 2113;
      v113 = v79;
      _os_log_impl(&dword_1D422A000, v77, OS_LOG_TYPE_DEFAULT, "Search (search) <%{public}@>: search for playlist: %{private}@", buf, 0x16u);
    }
    v80 = *(void **)(a1 + 32);
    uint64_t v81 = *(void **)(a1 + 40);
    __int16 v82 = [v3 query];
    uint64_t v83 = [v81 _playlistsByName:v82 isGeniusMix:0];
    [v80 addObject:v83];
  }
  if ([*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F97418]])
  {
    if (![*(id *)(*(void *)(a1 + 40) + 56) length])
    {
      __int16 v84 = [*(id *)(a1 + 40) aceId];
      uint64_t v85 = sub_1D4244ECC(@"Search", v84);
      uint64_t v86 = *(void *)(a1 + 40);
      v87 = *(void **)(v86 + 56);
      *(void *)(v86 + 56) = v85;
    }
    v88 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v89 = *(void *)(*(void *)(a1 + 40) + 56);
      v90 = [v3 query];
      *(_DWORD *)buf = 138543619;
      uint64_t v111 = v89;
      __int16 v112 = 2113;
      v113 = v90;
      _os_log_impl(&dword_1D422A000, v88, OS_LOG_TYPE_DEFAULT, "Search (search) <%{public}@>: search for genius mix: %{private}@", buf, 0x16u);
    }
    v91 = *(void **)(a1 + 32);
    v92 = *(void **)(a1 + 40);
    v93 = [v3 query];
    v94 = [v92 _playlistsByName:v93 isGeniusMix:1];
    [v91 addObject:v94];
  }
  if ([*(id *)(a1 + 48) containsObject:*MEMORY[0x1E4F97410]])
  {
    if (![*(id *)(*(void *)(a1 + 40) + 56) length])
    {
      v95 = [*(id *)(a1 + 40) aceId];
      uint64_t v96 = sub_1D4244ECC(@"Search", v95);
      uint64_t v97 = *(void *)(a1 + 40);
      v98 = *(void **)(v97 + 56);
      *(void *)(v97 + 56) = v96;
    }
    v99 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v100 = *(void *)(*(void *)(a1 + 40) + 56);
      v101 = [v3 query];
      *(_DWORD *)buf = 138543619;
      uint64_t v111 = v100;
      __int16 v112 = 2113;
      v113 = v101;
      _os_log_impl(&dword_1D422A000, v99, OS_LOG_TYPE_DEFAULT, "Search (search) <%{public}@>: search for audiobook: %{private}@", buf, 0x16u);
    }
    v103 = *(void **)(a1 + 32);
    v102 = *(void **)(a1 + 40);
    v104 = [v3 query];
    v105 = [v102 _audiobooksByName:v104];
    [v103 addObject:v105];
  }
}

void sub_1D4234948(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D42349EC;
  v9[3] = &unk_1E69E2B80;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  uint64_t v11 = v8;
  uint64_t v12 = a4;
  [a2 enumerateObjectsUsingBlock:v9];
}

void sub_1D42349EC(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ((unint64_t)[*(id *)(a1 + 32) count] >= *(void *)(a1 + 40))
  {
    **(unsigned char **)(a1 + 48) = 1;
  }
  else
  {
    id v3 = [v4 SAMPMediaEntityRepresentationUsingIdentifierType:1];
    if (v3) {
      [*(id *)(a1 + 32) addObject:v3];
    }
  }
}

void sub_1D4234C04(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), a2);
    uint64_t v5 = [*(id *)(a1 + 32) _perform];
    if (![*(id *)(*(void *)(a1 + 32) + 56) length])
    {
      uint64_t v6 = [*(id *)(a1 + 32) aceId];
      uint64_t v7 = sub_1D4244ECC(@"Search", v6);
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void **)(v8 + 56);
      *(void *)(v8 + 56) = v7;
    }
    id v10 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 56);
      uint64_t v12 = [v5 dictionary];
      int v21 = 138543618;
      uint64_t v22 = v11;
      __int16 v23 = 2114;
      uint64_t v24 = v12;
      __int16 v13 = "Search (completion) <%{public}@>: notifying assistant: %{public}@";
LABEL_10:
      _os_log_impl(&dword_1D422A000, v10, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v21, 0x16u);
    }
  }
  else
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"no user identity"];
    if (![*(id *)(*(void *)(a1 + 32) + 56) length])
    {
      uint64_t v14 = [*(id *)(a1 + 32) aceId];
      uint64_t v15 = sub_1D4244ECC(@"Search", v14);
      uint64_t v16 = *(void *)(a1 + 32);
      id v17 = *(void **)(v16 + 56);
      *(void *)(v16 + 56) = v15;
    }
    id v10 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 56);
      uint64_t v12 = [v5 dictionary];
      int v21 = 138543618;
      uint64_t v22 = v18;
      __int16 v23 = 2114;
      uint64_t v24 = v12;
      __int16 v13 = "Search (completion) <%{public}@>: notifying assistant %{public}@";
      goto LABEL_10;
    }
  }

  uint64_t v19 = *(void *)(a1 + 40);
  uint64_t v20 = [v5 dictionary];
  (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);
}

void sub_1D4235258(uint64_t a1, unsigned int a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) hashedRouteUIDs];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D423534C;
  v8[3] = &unk_1E69E3EB8;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = *(id *)(a1 + 72);
  [v4 resolveWithHashedRouteIdentifiers:v5 audioRoutingInfo:a2 completion:v8];
}

void sub_1D423534C(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D423541C;
  v9[3] = &unk_1E69E3E90;
  id v10 = v4;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void **)(a1 + 64);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v8;
  [v10 sendCommand:26 toDestination:a2 withOptions:v5 completion:v9];
}

void sub_1D423541C(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = objc_alloc_init(MEMORY[0x1E4F965B8]);
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setObject:@"Set Shuffle Mode" forKeyedSubscript:@"pluginname"];
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"success"];
  uint64_t v7 = NSNumber;
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  id v9 = [v7 numberWithDouble:fabs(v8)];
  [v6 setObject:v9 forKeyedSubscript:@"duration"];

  if (v3)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v11 = [v3 localizedDescription];
    uint64_t v12 = [v10 initWithReason:v11];

    [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"success"];
    id v13 = [v3 localizedDescription];
    [v6 setObject:v13 forKeyedSubscript:@"errorstring"];

    id v5 = (id)v12;
  }
  if (![*(id *)(*(void *)(a1 + 48) + 56) length])
  {
    uint64_t v14 = [*(id *)(a1 + 48) aceId];
    uint64_t v15 = sub_1D4244ECC(@"Set Shuffle Mode", v14);
    uint64_t v16 = *(void *)(a1 + 48);
    id v17 = *(void **)(v16 + 56);
    *(void *)(v16 + 56) = v15;
  }
  uint64_t v18 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 56);
    uint64_t v20 = [v5 dictionary];
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v19;
    __int16 v27 = 2114;
    uint64_t v28 = v20;
    _os_log_impl(&dword_1D422A000, v18, OS_LOG_TYPE_DEFAULT, "Set Shuffle Mode (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
  }
  uint64_t v21 = *(void *)(a1 + 56);
  uint64_t v22 = [v5 dictionary];
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  uint64_t v24 = v6;
  id v23 = v6;
  AnalyticsSendEventLazy();
}

id sub_1D4235714(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

__CFString *sub_1D423571C()
{
  uint64_t v0 = @"x-sampmeditem";
  return @"x-sampmeditem";
}

id sub_1D4235750(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = [a1 valueForProperty:*MEMORY[0x1E4F31420]];
  __int16 v6 = [v5 integerValue];

  if ((v6 & 0x402) != 0)
  {
    uint64_t v7 = (objc_class *)MEMORY[0x1E4F96840];
  }
  else if ((v6 & 4) != 0)
  {
    uint64_t v7 = (objc_class *)MEMORY[0x1E4F967C8];
  }
  else if ((v6 & 0x200) != 0)
  {
    uint64_t v7 = (objc_class *)MEMORY[0x1E4F967D8];
  }
  else
  {
    if ((v6 & 0x100) == 0)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F96868]);
      id v9 = [a1 valueForProperty:*MEMORY[0x1E4F31368]];
      [v8 setGenre:v9];

      goto LABEL_11;
    }
    uint64_t v7 = (objc_class *)MEMORY[0x1E4F96810];
  }
  id v8 = objc_alloc_init(v7);
LABEL_11:
  id v10 = [a1 valueForProperty:*MEMORY[0x1E4F312F8]];
  [v8 setArtist:v10];

  id v11 = [a1 valueForProperty:*MEMORY[0x1E4F314B8]];
  [v8 setSortArtist:v11];

  uint64_t v12 = *MEMORY[0x1E4F312E8];
  id v13 = [a1 valueForProperty:*MEMORY[0x1E4F312E8]];
  [v8 setAlbum:v13];

  uint64_t v14 = [a1 valueForProperty:*MEMORY[0x1E4F314B0]];
  [v8 setSortAlbum:v14];

  uint64_t v15 = [a1 valueForProperty:*MEMORY[0x1E4F31538]];
  [v8 setTitle:v15];

  uint64_t v16 = [a1 valueForProperty:*MEMORY[0x1E4F314C0]];
  [v8 setSortTitle:v16];

  objc_msgSend(v8, "setIsExplicit:", objc_msgSend(a1, "isExplicitItem"));
  if (a3 == 1)
  {
    id v17 = sub_1D4232988(a1);
    [v8 setIdentifier:v17];
  }
  if ((v6 & 0x1F0F) != 0)
  {
    uint64_t v55 = v12;
    __int16 v56 = v6;
    uint64_t v18 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    uint64_t v19 = [v18 name];

    id v20 = objc_alloc_init(MEMORY[0x1E4F96588]);
    uint64_t v21 = [a1 valueForProperty:*MEMORY[0x1E4F31418]];
    [v20 setDate:v21];

    [v20 setTimeZoneId:v19];
    id v22 = objc_alloc_init(MEMORY[0x1E4F96830]);
    [v22 setLastPlayedDate:v20];
    id v23 = [a1 valueForProperty:*MEMORY[0x1E4F31318]];
    [v23 doubleValue];
    [v22 setPlaybackPositionMillis:(uint64_t)(v24 * 1000.0)];

    uint64_t v25 = [a1 valueForProperty:*MEMORY[0x1E4F31460]];
    objc_msgSend(v22, "setRememberPlaybackPosition:", objc_msgSend(v25, "BOOLValue"));

    uint64_t v26 = [a1 valueForProperty:*MEMORY[0x1E4F31438]];
    unint64_t v27 = [v26 unsignedIntegerValue];

    double v28 = 0.0;
    if (v27 >= 0x64)
    {
      unint64_t v29 = 0;
      do
      {
        unint64_t v30 = v27;
        v27 /= 0xAuLL;
        ++v29;
      }
      while (v30 > 0x3E7);
      double v28 = (double)v29;
    }
    [v22 setPlays:(unint64_t)(__exp10(v28) * (double)v27)];
    [v8 setPlaybackInfo:v22];
    uint64_t v31 = [a1 valueForProperty:*MEMORY[0x1E4F31340]];
    if (v31)
    {
      id v32 = objc_alloc_init(MEMORY[0x1E4F96588]);
      [v32 setDate:v31];
      [v32 setTimeZoneId:v19];
      [v8 setDateAdded:v32];
    }
    uint64_t v33 = [a1 valueForProperty:*MEMORY[0x1E4F314E8]];
    if (v33)
    {
      id v34 = objc_alloc_init(MEMORY[0x1E4F96588]);
      [v34 setDate:v33];
      [v34 setTimeZoneId:v19];
      [v8 setDatePurchased:v34];
    }
    uint64_t v35 = [a1 valueForProperty:*MEMORY[0x1E4F31458]];
    if (v35)
    {
      id v36 = objc_alloc_init(MEMORY[0x1E4F96588]);
      [v36 setDate:v35];
      [v36 setTimeZoneId:v19];
      id v37 = objc_alloc_init(MEMORY[0x1E4F96858]);
      [v37 setReleaseDate:v36];
      [a1 valueForProperty:*MEMORY[0x1E4F31548]];
      uint64_t v54 = v8;
      uint64_t v38 = v33;
      id v39 = v22;
      v40 = v31;
      id v41 = v20;
      v43 = uint64_t v42 = v19;
      objc_msgSend(v37, "setReleaseYear:", objc_msgSend(v43, "unsignedIntegerValue"));

      uint64_t v19 = v42;
      id v20 = v41;
      uint64_t v31 = v40;
      id v22 = v39;
      uint64_t v33 = v38;
      id v8 = v54;
      [v54 setReleaseInfo:v37];
    }
    uint64_t v12 = v55;
    __int16 v6 = v56;
  }
  uint64_t v44 = [a1 valueForProperty:*MEMORY[0x1E4F31500]];
  if (![v44 longLongValue])
  {
    uint64_t v45 = [a1 valueForProperty:*MEMORY[0x1E4F31528]];

    uint64_t v44 = (void *)v45;
  }
  if (v44)
  {
    uint64_t v46 = [v44 stringValue];
    [v8 setAdamIdentifier:v46];
  }
  if ((v6 & 0x200) != 0)
  {
    uint64_t v47 = *MEMORY[0x1E4F31358];
    id v48 = v8;
    uint64_t v49 = [a1 valueForProperty:v47];
    objc_msgSend(v48, "setEpisodeNumber:", objc_msgSend(v49, "unsignedIntegerValue"));

    v50 = [a1 valueForProperty:*MEMORY[0x1E4F314A0]];
    objc_msgSend(v48, "setSeasonNumber:", objc_msgSend(v50, "unsignedIntegerValue"));

    v51 = [a1 valueForProperty:*MEMORY[0x1E4F312F0]];
    objc_msgSend(v48, "setShowEpisodesCount:", objc_msgSend(v51, "unsignedIntegerValue"));

    uint64_t v52 = [a1 valueForProperty:v12];
    [v48 setShowName:v52];
  }

  return v8;
}

id sub_1D4235DF0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = qword_1EA6C8EE0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1EA6C8EE0, &unk_1F2BFA1A0);
  }
  id v5 = [(id)qword_1EA6C8EE8 objectForKey:v4];

  return v5;
}

uint64_t sub_1D4235E6C()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  qword_1EA6C8EE8 = objc_msgSend(v0, "initWithObjectsAndKeys:", *MEMORY[0x1E4F312E8], *MEMORY[0x1E4F973E0], *MEMORY[0x1E4F312F8], *MEMORY[0x1E4F973E8], *MEMORY[0x1E4F31368], *MEMORY[0x1E4F973F8], *MEMORY[0x1E4F31330], *MEMORY[0x1E4F973F0], *MEMORY[0x1E4F31538], *MEMORY[0x1E4F97400], 0);

  return MEMORY[0x1F41817F8]();
}

id sub_1D4235F40(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = qword_1EA6C8ED0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1EA6C8ED0, &unk_1F2BFA180);
  }
  id v5 = [(id)qword_1EA6C8ED8 objectForKey:v4];

  return v5;
}

uint64_t sub_1D4235FBC()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  qword_1EA6C8ED8 = objc_msgSend(v0, "initWithObjectsAndKeys:", *MEMORY[0x1E4F973E0], *MEMORY[0x1E4F312E8], *MEMORY[0x1E4F973E8], *MEMORY[0x1E4F312F8], *MEMORY[0x1E4F973F8], *MEMORY[0x1E4F31368], *MEMORY[0x1E4F973F0], *MEMORY[0x1E4F31330], *MEMORY[0x1E4F97400], *MEMORY[0x1E4F31538], 0);

  return MEMORY[0x1F41817F8]();
}

void sub_1D423634C(uint64_t a1, unsigned int a2)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) hashedRouteUIDs];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D4236440;
  v8[3] = &unk_1E69E3EB8;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = *(id *)(a1 + 72);
  [v4 resolveWithHashedRouteIdentifiers:v5 audioRoutingInfo:a2 completion:v8];
}

void sub_1D4236440(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D4236510;
  v9[3] = &unk_1E69E3E90;
  id v10 = v4;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v8 = *(void **)(a1 + 64);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v8;
  [v10 sendCommand:19 toDestination:a2 withOptions:v5 completion:v9];
}

void sub_1D4236510(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *(id *)(a1 + 32);
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setObject:@"Decrease Playback Speed" forKeyedSubscript:@"pluginname"];
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"success"];
  uint64_t v7 = NSNumber;
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  id v9 = [v7 numberWithDouble:fabs(v8)];
  [v6 setObject:v9 forKeyedSubscript:@"duration"];

  if (sub_1D4245204(v4))
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F965B8]);
LABEL_5:
    uint64_t v12 = v10;
    goto LABEL_7;
  }
  if ([v4 containsObject:&unk_1F2BFECD8])
  {
    id v11 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v10 = (id)[v11 initWithErrorCode:*MEMORY[0x1E4F97438]];
    goto LABEL_5;
  }
  id v13 = [NSString stringWithFormat:@"player statuses: %@", v4];
  [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"success"];
  [v6 setObject:v13 forKeyedSubscript:@"errorstring"];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:v13];

LABEL_7:
  if (![*(id *)(*(void *)(a1 + 48) + 56) length])
  {
    uint64_t v14 = [*(id *)(a1 + 48) aceId];
    uint64_t v15 = sub_1D4244ECC(@"Decrease Playback Speed", v14);
    uint64_t v16 = *(void *)(a1 + 48);
    id v17 = *(void **)(v16 + 56);
    *(void *)(v16 + 56) = v15;
  }
  uint64_t v18 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 56);
    id v20 = [v12 dictionary];
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v19;
    __int16 v27 = 2114;
    double v28 = v20;
    _os_log_impl(&dword_1D422A000, v18, OS_LOG_TYPE_DEFAULT, "Decrease Playback Speed (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
  }
  uint64_t v21 = *(void *)(a1 + 56);
  id v22 = [v12 dictionary];
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  double v24 = v6;
  id v23 = v6;
  AnalyticsSendEventLazy();
}

id sub_1D4236834(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1D4237FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

uint64_t sub_1D4238028(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1D4238038(uint64_t a1)
{
}

void sub_1D4238040(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1D42380F4;
  v5[3] = &unk_1E69E2BF8;
  v5[4] = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  sub_1D4247404(@"Subscription Status Sync Handler", @"*", 1, a2, v5);
}

void sub_1D42380F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  double v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t sub_1D4238228(void *a1)
{
  uint64_t v2 = 3;
  switch([a1 groupingType])
  {
    case 1:
      id v3 = [a1 representativeItem];
      long long v4 = v3;
      if (v3)
      {
        id v5 = [v3 valueForProperty:*MEMORY[0x1E4F31420]];
        uint64_t v6 = [v5 integerValue];

        if ((v6 & 0x402) != 0)
        {
          uint64_t v2 = 5;
        }
        else if ((v6 & 4) != 0)
        {
          uint64_t v2 = 4;
        }
        else
        {
          uint64_t v2 = (v6 << 54 >> 63) & 6;
        }
      }
      else
      {
        uint64_t v2 = 0;
      }

      break;
    case 2:
      uint64_t v2 = 1;
      break;
    case 5:
      uint64_t v2 = 2;
      break;
    case 7:
      uint64_t v2 = 5;
      break;
    case 10:
      uint64_t v2 = 4;
      break;
    default:
      return v2;
  }
  return v2;
}

__CFString *sub_1D4238340(void *a1)
{
  unint64_t v1 = [a1 _assistantCollectionType];
  if (v1 > 6) {
    uint64_t v2 = &off_1E69E2C50;
  }
  else {
    uint64_t v2 = off_1E69E2C90[v1];
  }
  id v3 = *v2;

  return v3;
}

id sub_1D4238390(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a1, "SAMPCollectionRepresentationUsingIdentifierType:");
  uint64_t v6 = [a1 items];
  if ([v6 count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v8 = objc_msgSend(a1, "items", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) SAMPMediaItemRepresentationUsingIdentifierType:a3];
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [v5 setItems:v7];
  }

  return v5;
}

id sub_1D4238528(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = [a1 itemsQuery];
    if (!v13)
    {
      id v12 = 0;
      uint64_t v9 = 0;
      id v8 = 0;
      goto LABEL_21;
    }
    uint64_t v14 = [a1 groupingType];
    unint64_t v15 = [a1 _assistantCollectionType];
    unint64_t v16 = v15;
    if (v15 <= 6 && ((0x5Fu >> v15) & 1) != 0) {
      id v8 = objc_alloc_init(**((Class **)&unk_1E69E2C58 + v15));
    }
    else {
      id v8 = 0;
    }
    long long v17 = [MEMORY[0x1E4F31938] titlePropertyForGroupingType:v14];
    if (v17)
    {
      uint64_t v9 = [a1 valueForProperty:v17];
    }
    else
    {
      long long v18 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 134217984;
        uint64_t v27 = v14;
        _os_log_impl(&dword_1D422A000, v18, OS_LOG_TYPE_DEFAULT, "No title property for grouping %ld", (uint8_t *)&v26, 0xCu);
      }

      uint64_t v9 = 0;
    }
    uint64_t v19 = [MEMORY[0x1E4F31938] sortTitlePropertyForGroupingType:v14];
    if (v19)
    {
      id v12 = [a1 valueForProperty:v19];
      if (v16)
      {
LABEL_20:

LABEL_21:
        uint64_t v11 = 0;
        if (!v8) {
          goto LABEL_26;
        }
        goto LABEL_22;
      }
    }
    else
    {
      id v12 = 0;
      if (v16) {
        goto LABEL_20;
      }
    }
    uint64_t v20 = *MEMORY[0x1E4F312A8];
    id v21 = v8;
    id v22 = [a1 valueForProperty:v20];
    [v21 setArtist:v22];

    goto LABEL_20;
  }
  id v5 = [a1 valueForProperty:*MEMORY[0x1E4F31588]];
  int v6 = [v5 BOOLValue];

  uint64_t v7 = (Class *)0x1E4F967E0;
  if (!v6) {
    uint64_t v7 = (Class *)0x1E4F96838;
  }
  id v8 = objc_alloc_init(*v7);
  uint64_t v9 = [a1 valueForProperty:*MEMORY[0x1E4F315A0]];
  uint64_t v10 = [a1 valueForProperty:*MEMORY[0x1E4F31598]];
  uint64_t v11 = [v10 BOOLValue];

  id v12 = 0;
  if (v8)
  {
LABEL_22:
    if (a3 == 1)
    {
      id v23 = sub_1D4232988(a1);
    }
    else
    {
      id v23 = 0;
    }
    [v8 setIdentifier:v23];
    [v8 setTitle:v9];
    [v8 setSortTitle:v12];
    [v8 setEditable:v11];
  }
LABEL_26:
  id v24 = v8;

  return v24;
}

uint64_t sub_1D423884C(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 6;
  }
  id v3 = [a1 itemsQuery];
  long long v4 = v3;
  if (v3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = objc_msgSend(v3, "filterPredicates", 0);
    uint64_t v2 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v2)
    {
      uint64_t v6 = *(void *)v14;
      while (2)
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v5);
          }
          id v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (qword_1EA6C8EF0 != -1) {
              dispatch_once(&qword_1EA6C8EF0, &unk_1F2BFA1C0);
            }
            uint64_t v9 = [v8 property];
            uint64_t v10 = [(id)qword_1EA6C8EF8 objectForKey:v9];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v2 = [v10 integerValue];

              goto LABEL_19;
            }
          }
          ++v7;
        }
        while (v2 != v7);
        uint64_t v2 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v2) {
          continue;
        }
        break;
      }
    }
LABEL_19:
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_1D4238A20()
{
  v4[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F31300];
  v3[0] = *MEMORY[0x1E4F312E0];
  v3[1] = v0;
  v4[0] = &unk_1F2BFECF0;
  v4[1] = &unk_1F2BFED08;
  v3[2] = *MEMORY[0x1E4F31370];
  v4[2] = &unk_1F2BFED20;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:3];
  uint64_t v2 = (void *)qword_1EA6C8EF8;
  qword_1EA6C8EF8 = v1;
}

void sub_1D4238D2C(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F76E28]);
  [*(id *)(a1 + 32) setUserIdentity:*(void *)(*(void *)(a1 + 40) + 72)];
  [*(id *)(a1 + 32) setFeatureName:@"siri"];
  uint64_t v17 = *MEMORY[0x1E4F77770];
  v18[0] = @"com.apple.MediaAssistant.siri";
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  uint64_t v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 80);
  if (v7) {
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F77750]];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1D4239288;
  v12[3] = &unk_1E69E2E88;
  id v13 = v4;
  char v16 = *(unsigned char *)(a1 + 56);
  id v9 = *(id *)(a1 + 48);
  id v14 = v3;
  id v15 = v9;
  id v10 = v3;
  id v11 = v4;
  [v11 sendPlaybackQueue:v8 toDestination:v10 withOptions:v6 completion:v12];
}

void sub_1D4238EE4(id *a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  MRAVEndpointGetLocalEndpoint();
  id v4 = (void *)MRAVEndpointCopyUniqueIdentifier();
  id v5 = a1[4];
  id v6 = a2;
  uint64_t v7 = [v5 outputDeviceUIDs];
  LODWORD(v5) = [v7 containsObject:v6];

  if (v5)
  {

LABEL_4:
    if (![*((id *)a1[5] + 11) length])
    {
      id v10 = [a1[5] aceId];
      uint64_t v11 = sub_1D4244ECC(@"Set Queue", v10);
      id v12 = a1[5];
      id v13 = (void *)v12[11];
      v12[11] = v11;
    }
    id v14 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *((void *)a1[5] + 11);
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = v15;
      _os_log_impl(&dword_1D422A000, v14, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: sending to local WHA destination", buf, 0xCu);
    }

    char v16 = (void *)*((void *)a1[5] + 7);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = sub_1D4239274;
    v32[3] = &unk_1E69E2ED8;
    id v34 = a1[8];
    id v33 = a1[6];
    [v16 prepareForAudioHandoffWithCompletion:v32];

    goto LABEL_21;
  }
  uint64_t v8 = [a1[4] outputDeviceUIDs];
  int v9 = [v8 containsObject:v4];

  if (v9) {
    goto LABEL_4;
  }
  uint64_t v17 = [a1[4] outputDeviceUIDs];
  uint64_t v18 = [v17 count];

  uint64_t v19 = [*((id *)a1[5] + 11) length];
  if (v18)
  {
    if (!v19)
    {
      uint64_t v20 = [a1[5] aceId];
      uint64_t v21 = sub_1D4244ECC(@"Set Queue", v20);
      id v22 = a1[5];
      id v23 = (void *)v22[11];
      v22[11] = v21;
    }
    id v24 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = *((void *)a1[5] + 11);
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = v25;
      _os_log_impl(&dword_1D422A000, v24, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: sending to WHA destination", buf, 0xCu);
    }

    [a1[7] setShouldImmediatelyStartPlayback:1];
  }
  else
  {
    if (!v19)
    {
      int v26 = [a1[5] aceId];
      uint64_t v27 = sub_1D4244ECC(@"Set Queue", v26);
      uint64_t v28 = a1[5];
      uint64_t v29 = (void *)v28[11];
      v28[11] = v27;
    }
    unint64_t v30 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = *((void *)a1[5] + 11);
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = v31;
      _os_log_impl(&dword_1D422A000, v30, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: sending to default destination", buf, 0xCu);
    }
  }
  (*((void (**)(void))a1[8] + 2))();
LABEL_21:
}

uint64_t sub_1D4239274(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_1D4239288(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  if (v5 && *(unsigned char *)(a1 + 56)) {
    notify_post("com.apple.media.entities.siri_data_changed");
  }
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v29 = v5;
  id v10 = v6;
  uint64_t v11 = [v29 domain];
  char v12 = [v11 isEqualToString:*MEMORY[0x1E4F76DE0]];

  if (v12)
  {
    uint64_t v13 = [v29 code];
    if (v13)
    {
      if (v13 == 7)
      {
        id v14 = objc_alloc(MEMORY[0x1E4F965A8]);
        uint64_t v15 = (void *)MEMORY[0x1E4F973D0];
      }
      else
      {
        if (v13 != 6)
        {
          uint64_t v21 = MPCAssistantCreateError();
          id v22 = objc_alloc(MEMORY[0x1E4F965A8]);
          id v23 = [v21 localizedDescription];
          id v24 = (void *)[v22 initWithReason:v23];

          goto LABEL_21;
        }
        id v14 = objc_alloc(MEMORY[0x1E4F965A8]);
        uint64_t v15 = (void *)MEMORY[0x1E4F973C8];
      }
      goto LABEL_19;
    }
LABEL_14:
    uint64_t v20 = sub_1D4245304(v10);
LABEL_20:
    id v24 = (void *)v20;
    goto LABEL_21;
  }
  char v16 = [v29 domain];
  int v17 = [v16 isEqualToString:*MEMORY[0x1E4F76DE8]];

  if (!v17) {
    goto LABEL_14;
  }
  int v18 = [v29 code];
  if (!v18) {
    goto LABEL_14;
  }
  if (v18 == 9)
  {
    uint64_t v19 = [v9 appBundleID];
    if (MRMediaRemoteApplicationIsSystemMediaApplication())
    {

LABEL_18:
      id v14 = objc_alloc(MEMORY[0x1E4F965A8]);
      uint64_t v15 = (void *)MEMORY[0x1E4F973B8];
LABEL_19:
      uint64_t v20 = [v14 initWithErrorCode:*v15];
      goto LABEL_20;
    }
    uint64_t v25 = [v9 appBundleID];
    int v26 = [v25 isEqualToString:*MEMORY[0x1E4F77858]];

    if (v26) {
      goto LABEL_18;
    }
  }
  id v27 = objc_alloc(MEMORY[0x1E4F965A8]);
  uint64_t v28 = (void *)MRMediaRemoteCopySendCommandErrorDescription();
  id v24 = (void *)[v27 initWithReason:v28];

LABEL_21:
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v24);
}

void sub_1D4239608(uint64_t a1, unsigned int a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [*(id *)(*(void *)(a1 + 32) + 64) assistantStreamingGetAvailability:a2] == 4;
  id v5 = [*(id *)(a1 + 40) collections];
  id v6 = [v5 firstObject];

  id v7 = [v6 representativeItem];
  uint64_t v8 = [v7 valueForProperty:*MEMORY[0x1E4F31420]];
  char v9 = [v8 unsignedIntegerValue];

  if (![*(id *)(*(void *)(a1 + 32) + 88) length])
  {
    id v10 = [*(id *)(a1 + 32) aceId];
    uint64_t v11 = sub_1D4244ECC(@"Set Queue", v10);
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(v12 + 88);
    *(void *)(v12 + 88) = v11;
  }
  id v14 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 88);
    char v16 = [v6 items];
    *(_DWORD *)buf = 138543874;
    uint64_t v46 = v15;
    __int16 v47 = 2048;
    uint64_t v48 = [v16 count];
    __int16 v49 = 2112;
    v50 = v6;
    _os_log_impl(&dword_1D422A000, v14, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: item collection [%ld items] %@", buf, 0x20u);
  }
  uint64_t v17 = [*(id *)(a1 + 32) shouldShuffle];
  [*(id *)(a1 + 40) setIgnoreSystemFilterPredicates:1];
  [*(id *)(a1 + 40) setShouldIncludeNonLibraryEntities:1];
  int v18 = [MEMORY[0x1E4F76E58] queryQueueWithContextID:*(void *)(a1 + 48) query:*(void *)(a1 + 40)];
  [v18 setShuffleType:v17];
  objc_msgSend(v18, "setShouldOverrideManuallyCuratedQueue:", objc_msgSend(*(id *)(a1 + 32), "shouldOverrideManuallyCuratedUpNext"));
  uint64_t v19 = [*(id *)(a1 + 32) startPlaying];
  objc_msgSend(v18, "setShouldImmediatelyStartPlayback:", objc_msgSend(v19, "BOOLValue"));

  uint64_t v20 = [*(id *)(a1 + 32) recommendationId];
  [v18 setSiriRecommendationID:v20];

  uint64_t v21 = [*(id *)(a1 + 32) assetInfo];
  [v18 setSiriAssetInfo:v21];

  id v22 = objc_msgSend(*(id *)(a1 + 32), "MP_WHAMetricsInfo");
  [v18 setSiriWHAMetricsInfo:v22];

  id v23 = [MEMORY[0x1E4F76E48] systemMediaApplicationDestination];
  id v24 = v23;
  if ((v9 & 4) != 0) {
    [v23 setAppBundleID:@"com.apple.iBooks"];
  }
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = sub_1D4239A7C;
  v37[3] = &unk_1E69E2E10;
  id v25 = v24;
  id v38 = v25;
  id v26 = v18;
  uint64_t v27 = *(void *)(a1 + 32);
  id v39 = v26;
  uint64_t v40 = v27;
  BOOL v42 = v4;
  unsigned int v43 = a2;
  id v41 = *(id *)(a1 + 56);
  char v44 = *(unsigned char *)(a1 + 64);
  uint64_t v28 = (void (**)(void))MEMORY[0x1D94452A0](v37);
  id v29 = [*(id *)(a1 + 40) items];
  unint64_t v30 = [v29 firstObject];
  uint64_t v31 = [v30 valueForProperty:*MEMORY[0x1E4F313C0]];
  int v32 = [v31 BOOLValue];

  if (v32)
  {
    id v33 = [MEMORY[0x1E4FB8598] defaultManager];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = sub_1D4239B68;
    v34[3] = &unk_1E69E2E38;
    v34[4] = *(void *)(a1 + 32);
    id v35 = *(id *)(a1 + 56);
    uint64_t v36 = v28;
    [v33 getAgeVerificationStateWithCompletion:v34];
  }
  else
  {
    v28[2](v28);
  }
}

void sub_1D4239A7C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  BOOL v4 = [*(id *)(a1 + 48) hashedRouteUIDs];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D4239CE8;
  v7[3] = &unk_1E69E2CF8;
  id v6 = *(void **)(a1 + 56);
  v7[4] = *(void *)(a1 + 48);
  char v10 = v5;
  id v9 = v6;
  char v11 = *(unsigned char *)(a1 + 69);
  id v8 = *(id *)(a1 + 40);
  [v2 resolveWithQueue:v3 hashedRouteIdentifiers:v4 localPlaybackPermitted:v5 audioRoutingInfo:*(unsigned int *)(a1 + 65) completion:v7];
}

void sub_1D4239B68(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![*(id *)(*(void *)(a1 + 32) + 88) length])
  {
    BOOL v4 = [*(id *)(a1 + 32) aceId];
    uint64_t v5 = sub_1D4244ECC(@"Set Queue", v4);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 88);
    *(void *)(v6 + 88) = v5;
  }
  id v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 88);
    int v13 = 138543618;
    uint64_t v14 = v9;
    __int16 v15 = 1024;
    int v16 = [v3 isExplicitContentAllowed];
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: explicit content allowed: %{BOOL}u", (uint8_t *)&v13, 0x12u);
  }

  if ([v3 isExplicitContentAllowed])
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = objc_alloc(MEMORY[0x1E4F965A8]);
    uint64_t v12 = (void *)[v11 initWithErrorCode:*MEMORY[0x1E4F97330]];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);
  }
}

void sub_1D4239CE8(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    if (![*(id *)(*(void *)(a1 + 32) + 88) length])
    {
      BOOL v4 = [*(id *)(a1 + 32) aceId];
      uint64_t v5 = sub_1D4244ECC(@"Set Queue", v4);
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(void **)(v6 + 88);
      *(void *)(v6 + 88) = v5;
    }
    id v8 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 88);
      int v10 = *(unsigned __int8 *)(a1 + 56);
      int v16 = 138543618;
      uint64_t v17 = v9;
      __int16 v18 = 1024;
      int v19 = v10;
      _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_ERROR, "Set Queue (local) <%{public}@>: destination not available, local allowed %{BOOL}u", (uint8_t *)&v16, 0x12u);
    }

    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = objc_alloc(MEMORY[0x1E4F965A8]);
    int v13 = (void *)[v12 initWithErrorCode:*MEMORY[0x1E4F97338]];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v13);
  }
  if (*(unsigned char *)(a1 + 57))
  {
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = objc_alloc_init(MEMORY[0x1E4F965B8]);
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v15);
  }
  else
  {
    [*(id *)(a1 + 32) sendQueue:*(void *)(a1 + 40) toDestination:v3 shouldResync:1 completion:*(void *)(a1 + 48)];
  }
}

void sub_1D423A064(uint64_t a1, unsigned int a2)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [*(id *)(*(void *)(a1 + 32) + 64) assistantStreamingGetAvailability:a2] == 4;
  uint64_t v5 = [*(id *)(a1 + 40) items];
  uint64_t v6 = [v5 objectAtIndex:0];

  id v7 = [v6 valueForProperty:*MEMORY[0x1E4F31420]];
  char v64 = [v7 unsignedIntegerValue];

  uint64_t v8 = *MEMORY[0x1E4F314D0];
  uint64_t v9 = [v6 valueForProperty:*MEMORY[0x1E4F314D0]];
  uint64_t v10 = *MEMORY[0x1E4F31508];
  uint64_t v11 = [v6 valueForProperty:*MEMORY[0x1E4F31508]];
  uint64_t v12 = *MEMORY[0x1E4F312E8];
  uint64_t v67 = [v6 valueForProperty:*MEMORY[0x1E4F312E8]];
  long long v66 = v11;
  if ([v9 length])
  {
    if (![*(id *)(*(void *)(a1 + 32) + 88) length])
    {
      int v13 = [*(id *)(a1 + 32) aceId];
      uint64_t v14 = sub_1D4244ECC(@"Set Queue", v13);
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = *(void **)(v15 + 88);
      *(void *)(v15 + 88) = v14;
    }
    uint64_t v17 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 88);
      *(_DWORD *)buf = 138543618;
      uint64_t v80 = v18;
      __int16 v81 = 2114;
      __int16 v82 = v9;
      _os_log_impl(&dword_1D422A000, v17, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: found cloud album %{public}@", buf, 0x16u);
    }

    id v19 = objc_alloc_init(MEMORY[0x1E4F31970]);
    uint64_t v20 = [v6 predicateForProperty:v8];
    [v19 addFilterPredicate:v20];
  }
  else if ([v11 longLongValue])
  {
    if (![*(id *)(*(void *)(a1 + 32) + 88) length])
    {
      uint64_t v21 = [*(id *)(a1 + 32) aceId];
      uint64_t v22 = sub_1D4244ECC(@"Set Queue", v21);
      uint64_t v23 = *(void *)(a1 + 32);
      id v24 = *(void **)(v23 + 88);
      *(void *)(v23 + 88) = v22;
    }
    id v25 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 88);
      *(_DWORD *)buf = 138543618;
      uint64_t v80 = v26;
      __int16 v81 = 2114;
      __int16 v82 = v11;
      _os_log_impl(&dword_1D422A000, v25, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: found store album %{public}@", buf, 0x16u);
    }

    id v19 = objc_alloc_init(MEMORY[0x1E4F31970]);
    uint64_t v20 = [v6 predicateForProperty:v10];
    [v19 addFilterPredicate:v20];
  }
  else
  {
    if (![v67 length]) {
      goto LABEL_34;
    }
    if (![*(id *)(*(void *)(a1 + 32) + 88) length])
    {
      uint64_t v27 = [*(id *)(a1 + 32) aceId];
      uint64_t v28 = sub_1D4244ECC(@"Set Queue", v27);
      uint64_t v29 = *(void *)(a1 + 32);
      unint64_t v30 = *(void **)(v29 + 88);
      *(void *)(v29 + 88) = v28;
    }
    uint64_t v31 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = *(void *)(*(void *)(a1 + 32) + 88);
      *(_DWORD *)buf = 138543618;
      uint64_t v80 = v32;
      __int16 v81 = 2114;
      __int16 v82 = v67;
      _os_log_impl(&dword_1D422A000, v31, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: found album title %{public}@", buf, 0x16u);
    }

    id v19 = objc_alloc_init(MEMORY[0x1E4F31970]);
    uint64_t v20 = [v6 predicateForProperty:v12];
    [v19 addFilterPredicate:v20];
  }

  if (v19)
  {
    if (*(void *)(*(void *)(a1 + 32) + 72))
    {
      id v33 = objc_msgSend(MEMORY[0x1E4F31940], "deviceMediaLibraryWithUserIdentity:");
      [v19 setMediaLibrary:v33];
    }
    [v19 setIgnoreSystemFilterPredicates:1];
    [v19 setShouldIncludeNonLibraryEntities:1];
    [v19 setGroupingType:1];
    if ([v19 _hasCollections]
      && ([v19 collections],
          id v34 = objc_claimAutoreleasedReturnValue(),
          uint64_t v35 = [v34 count],
          v34,
          v35 == 1))
    {
      uint64_t v36 = [*(id *)(a1 + 32) shouldShuffle];
      uint64_t v37 = [MEMORY[0x1E4F76E58] queryQueueWithContextID:*(void *)(a1 + 48) query:v19];
      [v37 setFirstItem:v6];
      [v37 setShuffleType:v36];
      objc_msgSend(v37, "setShouldOverrideManuallyCuratedQueue:", objc_msgSend(*(id *)(a1 + 32), "shouldOverrideManuallyCuratedUpNext"));
      id v38 = [*(id *)(a1 + 32) startPlaying];
      objc_msgSend(v37, "setShouldImmediatelyStartPlayback:", objc_msgSend(v38, "BOOLValue"));

      id v39 = [*(id *)(a1 + 32) recommendationId];
      [v37 setSiriRecommendationID:v39];

      uint64_t v40 = [*(id *)(a1 + 32) assetInfo];
      [v37 setSiriAssetInfo:v40];

      id v41 = objc_msgSend(*(id *)(a1 + 32), "MP_WHAMetricsInfo");
      [v37 setSiriWHAMetricsInfo:v41];

      BOOL v42 = [MEMORY[0x1E4F76E48] systemMediaApplicationDestination];
      unsigned int v43 = v42;
      if ((v64 & 4) != 0) {
        [v42 setAppBundleID:@"com.apple.iBooks"];
      }
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = sub_1D423A978;
      v71[3] = &unk_1E69E2E10;
      id v65 = v43;
      id v72 = v65;
      id v44 = v37;
      uint64_t v45 = *(void *)(a1 + 32);
      id v73 = v44;
      uint64_t v74 = v45;
      BOOL v76 = v4;
      unsigned int v77 = a2;
      id v75 = *(id *)(a1 + 56);
      char v78 = *(unsigned char *)(a1 + 64);
      uint64_t v46 = (void (**)(void))MEMORY[0x1D94452A0](v71);
      __int16 v47 = [v19 items];
      uint64_t v48 = [v47 firstObject];
      __int16 v49 = [v48 valueForProperty:*MEMORY[0x1E4F313C0]];
      int v50 = [v49 BOOLValue];

      if (v50)
      {
        uint64_t v51 = [MEMORY[0x1E4FB8598] defaultManager];
        v68[0] = MEMORY[0x1E4F143A8];
        v68[1] = 3221225472;
        v68[2] = sub_1D423AA64;
        v68[3] = &unk_1E69E2E38;
        v68[4] = *(void *)(a1 + 32);
        id v69 = *(id *)(a1 + 56);
        long long v70 = v46;
        [v51 getAgeVerificationStateWithCompletion:v68];
      }
      else
      {
        v46[2](v46);
      }
    }
    else
    {
      if (![*(id *)(*(void *)(a1 + 32) + 88) length])
      {
        uint64_t v52 = [*(id *)(a1 + 32) aceId];
        uint64_t v53 = sub_1D4244ECC(@"Set Queue", v52);
        uint64_t v54 = *(void *)(a1 + 32);
        uint64_t v55 = *(void **)(v54 + 88);
        *(void *)(v54 + 88) = v53;
      }
      __int16 v56 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v57 = *(void *)(*(void *)(a1 + 32) + 88);
        *(_DWORD *)buf = 138543362;
        uint64_t v80 = v57;
        _os_log_impl(&dword_1D422A000, v56, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: enqueueing reference item", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }

    uint64_t v11 = v66;
    goto LABEL_42;
  }
  uint64_t v11 = v66;
LABEL_34:
  if (![*(id *)(*(void *)(a1 + 32) + 88) length])
  {
    v58 = [*(id *)(a1 + 32) aceId];
    uint64_t v59 = sub_1D4244ECC(@"Set Queue", v58);
    uint64_t v60 = *(void *)(a1 + 32);
    uint64_t v61 = *(void **)(v60 + 88);
    *(void *)(v60 + 88) = v59;
  }
  v62 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v63 = *(void *)(*(void *)(a1 + 32) + 88);
    *(_DWORD *)buf = 138543362;
    uint64_t v80 = v63;
    _os_log_impl(&dword_1D422A000, v62, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: enqueueing reference item", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_42:
}

void sub_1D423A978(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  BOOL v4 = [*(id *)(a1 + 48) hashedRouteUIDs];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D423ABE4;
  v7[3] = &unk_1E69E2CF8;
  uint64_t v6 = *(void **)(a1 + 56);
  v7[4] = *(void *)(a1 + 48);
  char v10 = v5;
  id v9 = v6;
  char v11 = *(unsigned char *)(a1 + 69);
  id v8 = *(id *)(a1 + 40);
  [v2 resolveWithQueue:v3 hashedRouteIdentifiers:v4 localPlaybackPermitted:v5 audioRoutingInfo:*(unsigned int *)(a1 + 65) completion:v7];
}

void sub_1D423AA64(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![*(id *)(*(void *)(a1 + 32) + 88) length])
  {
    BOOL v4 = [*(id *)(a1 + 32) aceId];
    uint64_t v5 = sub_1D4244ECC(@"Set Queue", v4);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 88);
    *(void *)(v6 + 88) = v5;
  }
  id v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 88);
    int v13 = 138543618;
    uint64_t v14 = v9;
    __int16 v15 = 1024;
    int v16 = [v3 isExplicitContentAllowed];
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: explicit content allowed: %{BOOL}u", (uint8_t *)&v13, 0x12u);
  }

  if ([v3 isExplicitContentAllowed])
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = objc_alloc(MEMORY[0x1E4F965A8]);
    uint64_t v12 = (void *)[v11 initWithErrorCode:*MEMORY[0x1E4F97330]];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);
  }
}

void sub_1D423ABE4(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    if (![*(id *)(*(void *)(a1 + 32) + 88) length])
    {
      BOOL v4 = [*(id *)(a1 + 32) aceId];
      uint64_t v5 = sub_1D4244ECC(@"Set Queue", v4);
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(void **)(v6 + 88);
      *(void *)(v6 + 88) = v5;
    }
    id v8 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 88);
      int v10 = *(unsigned __int8 *)(a1 + 56);
      int v16 = 138543618;
      uint64_t v17 = v9;
      __int16 v18 = 1024;
      int v19 = v10;
      _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_ERROR, "Set Queue (local) <%{public}@>: destination not available, local allowed %{BOOL}u", (uint8_t *)&v16, 0x12u);
    }

    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = objc_alloc(MEMORY[0x1E4F965A8]);
    int v13 = (void *)[v12 initWithErrorCode:*MEMORY[0x1E4F97338]];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v13);
  }
  if (*(unsigned char *)(a1 + 57))
  {
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = objc_alloc_init(MEMORY[0x1E4F965B8]);
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v15);
  }
  else
  {
    [*(id *)(a1 + 32) sendQueue:*(void *)(a1 + 40) toDestination:v3 shouldResync:1 completion:*(void *)(a1 + 48)];
  }
}

void sub_1D423C028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D423C0E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1D423C0F4(uint64_t a1)
{
}

void sub_1D423C0FC(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) items];
  uint64_t v3 = [v2 count];

  BOOL v4 = *(id **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 64);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1D423C30C;
    v16[3] = &unk_1E69E3F30;
    uint64_t v7 = *(void *)(a1 + 40);
    id v17 = *(id *)(a1 + 48);
    [v4 _playMediaItems:v5 contextID:v7 dryRun:v6 completion:v16];
    id v8 = v17;
  }
  else
  {
    if (![v4[11] length])
    {
      uint64_t v9 = [*(id *)(a1 + 32) aceId];
      uint64_t v10 = sub_1D4244ECC(@"Set Queue", v9);
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(void **)(v11 + 88);
      *(void *)(v11 + 88) = v10;
    }
    int v13 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 88);
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v14;
      _os_log_impl(&dword_1D422A000, v13, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: no for you cache", buf, 0xCu);
    }

    uint64_t v15 = *(void *)(a1 + 48);
    id v8 = objc_alloc_init(MEMORY[0x1E4F965A8]);
    (*(void (**)(uint64_t, uint64_t, id))(v15 + 16))(v15, 1, v8);
  }
}

uint64_t sub_1D423C2E0(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t sub_1D423C30C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1D423C3F0(uint64_t a1, uint64_t a2)
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 64) assistantStreamingGetAvailability:a2];
  if (v4 != 1)
  {
    if (!*(void *)(a1 + 40))
    {
      if (![*(id *)(*(void *)(a1 + 32) + 88) length])
      {
        uint64_t v40 = [*(id *)(a1 + 32) aceId];
        uint64_t v41 = sub_1D4244ECC(@"Set Queue", v40);
        uint64_t v42 = *(void *)(a1 + 32);
        unsigned int v43 = *(void **)(v42 + 88);
        *(void *)(v42 + 88) = v41;
      }
      id v44 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        uint64_t v45 = *(void *)(*(void *)(a1 + 32) + 88);
        *(_DWORD *)buf = 138543362;
        uint64_t v116 = v45;
        _os_log_impl(&dword_1D422A000, v44, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: no media items requested", buf, 0xCu);
      }

      uint64_t v11 = *(void *)(a1 + 48);
      id v12 = objc_alloc(MEMORY[0x1E4F965A8]);
      int v13 = (void *)MEMORY[0x1E4F973B0];
      goto LABEL_31;
    }
    uint64_t v98 = a2;
    uint64_t v100 = v4;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    uint64_t v15 = [*(id *)(a1 + 40) items];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v111 objects:v119 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v112;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v112 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = objc_msgSend(*(id *)(*((void *)&v111 + 1) + 8 * i), "identifier", v98);
          uint64_t v21 = sub_1D4232A80(v20);
          if (v21 == 3)
          {
            uint64_t v22 = [v20 lastPathComponent];
            uint64_t v23 = [v22 longLongValue];

            if (!v23) {
              goto LABEL_21;
            }
            id v24 = [NSNumber numberWithLongLong:v23];
            [v14 addObject:v24];
          }
          else
          {
            uint64_t v25 = v21;
            if (![*(id *)(*(void *)(a1 + 32) + 88) length])
            {
              uint64_t v26 = [*(id *)(a1 + 32) aceId];
              uint64_t v27 = sub_1D4244ECC(@"Set Queue", v26);
              uint64_t v28 = *(void *)(a1 + 32);
              uint64_t v29 = *(void **)(v28 + 88);
              *(void *)(v28 + 88) = v27;
            }
            id v24 = _MPLogCategoryAssistant();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              uint64_t v30 = *(void *)(*(void *)(a1 + 32) + 88);
              *(_DWORD *)buf = 138543618;
              uint64_t v116 = v30;
              __int16 v117 = 2048;
              uint64_t v118 = v25;
              _os_log_impl(&dword_1D422A000, v24, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: content origin %ld", buf, 0x16u);
            }
          }

LABEL_21:
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v111 objects:v119 count:16];
      }
      while (v17);
    }

    uint64_t v31 = v14;
    if ([v14 count]
      || ([*(id *)(a1 + 40) identifier],
          uint64_t v51 = objc_claimAutoreleasedReturnValue(),
          v51,
          !v51))
    {
      uint64_t v32 = objc_msgSend(*(id *)(a1 + 40), "identifier", v98);
      id v33 = [v32 scheme];
      int v34 = [v33 isEqualToString:@"x-sampplaylist"];

      unint64_t v35 = 0x1EA6C8000;
      if (v34)
      {
        id v36 = objc_alloc(MEMORY[0x1E4F318D0]);
        uint64_t v37 = [MEMORY[0x1E4F31990] identityKind];
        v109[0] = MEMORY[0x1E4F143A8];
        v109[1] = 3221225472;
        v109[2] = sub_1D423CF14;
        v109[3] = &unk_1E69E3090;
        id v110 = *(id *)(a1 + 40);
        id v38 = (void *)[v36 initWithSource:@"MPCAssistant" modelKind:v37 block:v109];

        id v39 = v110;
      }
      else
      {
        uint64_t v46 = [*(id *)(a1 + 40) identifier];
        __int16 v47 = [v46 scheme];
        int v48 = [v47 isEqualToString:@"x-sampcollection-album"];

        if (!v48)
        {
          id v38 = 0;
LABEL_41:
          uint64_t v60 = objc_msgSend(v14, "count", v98);
          uint64_t v61 = *(int *)(v35 + 3276);
          uint64_t v62 = [*(id *)(*(void *)(a1 + 32) + v61) length];
          if (!v60)
          {
            if (!v62)
            {
              __int16 v81 = [*(id *)(a1 + 32) aceId];
              uint64_t v82 = sub_1D4244ECC(@"Set Queue", v81);
              uint64_t v83 = *(void *)(a1 + 32);
              __int16 v84 = *(void **)(v83 + v61);
              *(void *)(v83 + v61) = v82;
            }
            uint64_t v85 = _MPLogCategoryAssistant();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
            {
              uint64_t v86 = *(void *)(*(void *)(a1 + 32) + v61);
              v87 = [*(id *)(a1 + 40) items];
              *(_DWORD *)buf = 138543618;
              uint64_t v116 = v86;
              __int16 v117 = 2114;
              uint64_t v118 = (uint64_t)v87;
              _os_log_impl(&dword_1D422A000, v85, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: no playable items in %{public}@", buf, 0x16u);
            }
            uint64_t v88 = *(void *)(a1 + 48);
            id v89 = objc_alloc(MEMORY[0x1E4F965A8]);
            long long v70 = (void *)[v89 initWithErrorCode:*MEMORY[0x1E4F973B0]];
            (*(void (**)(uint64_t, void *))(v88 + 16))(v88, v70);
            goto LABEL_62;
          }
          if (!v62)
          {
            uint64_t v63 = [*(id *)(a1 + 32) aceId];
            uint64_t v64 = sub_1D4244ECC(@"Set Queue", v63);
            uint64_t v65 = *(void *)(a1 + 32);
            long long v66 = *(void **)(v65 + v61);
            *(void *)(v65 + v61) = v64;
          }
          uint64_t v67 = _MPLogCategoryAssistant();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v68 = *(void *)(*(void *)(a1 + 32) + v61);
            *(_DWORD *)buf = 138543618;
            uint64_t v116 = v68;
            __int16 v117 = 2114;
            uint64_t v118 = (uint64_t)v14;
            _os_log_impl(&dword_1D422A000, v67, OS_LOG_TYPE_DEFAULT, "Set Queue (store) <%{public}@>: queue from store identifers: %{public}@", buf, 0x16u);
          }

          uint64_t v69 = [*(id *)(a1 + 32) shouldShuffle];
          long long v70 = [*(id *)(a1 + 32) refId];
          long long v71 = [MEMORY[0x1E4F76E70] storeTracklistQueueWithContextID:v70 storeItemIDs:v14 collectionIdentifierSet:v38];
          [v71 setShuffleType:v69];
          objc_msgSend(v71, "setShouldOverrideManuallyCuratedQueue:", objc_msgSend(*(id *)(a1 + 32), "shouldOverrideManuallyCuratedUpNext"));
          id v72 = [*(id *)(a1 + 32) startPlaying];
          objc_msgSend(v71, "setShouldImmediatelyStartPlayback:", objc_msgSend(v72, "BOOLValue"));

          id v73 = [*(id *)(a1 + 32) recommendationId];
          [v71 setSiriRecommendationID:v73];

          uint64_t v74 = [*(id *)(a1 + 32) assetInfo];
          [v71 setSiriAssetInfo:v74];

          id v75 = objc_msgSend(*(id *)(a1 + 32), "MP_WHAMetricsInfo");
          [v71 setSiriWHAMetricsInfo:v75];

          v101[0] = MEMORY[0x1E4F143A8];
          v101[1] = 3221225472;
          v101[2] = sub_1D423D02C;
          v101[3] = &unk_1E69E2DC0;
          id v76 = v71;
          uint64_t v77 = *(void *)(a1 + 32);
          id v102 = v76;
          uint64_t v103 = v77;
          int v105 = v99;
          id v104 = *(id *)(a1 + 48);
          char v106 = *(unsigned char *)(a1 + 56);
          uint64_t v78 = MEMORY[0x1D94452A0](v101);
          v79 = (void *)v78;
          if (v100 == 3)
          {
            uint64_t v80 = *(void (**)(void))(v78 + 16);
          }
          else
          {
            if (v100 != 4)
            {
              if (![*(id *)(*(void *)(a1 + 32) + v61) length])
              {
                v90 = [*(id *)(a1 + 32) aceId];
                uint64_t v91 = sub_1D4244ECC(@"Set Queue", v90);
                uint64_t v92 = *(void *)(a1 + 32);
                v93 = *(void **)(v92 + v61);
                *(void *)(v92 + v61) = v91;
              }
              v94 = _MPLogCategoryAssistant();
              if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
              {
                uint64_t v95 = *(void *)(*(void *)(a1 + 32) + v61);
                *(_DWORD *)buf = 138543362;
                uint64_t v116 = v95;
                _os_log_impl(&dword_1D422A000, v94, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: remapping not supported", buf, 0xCu);
              }

              uint64_t v96 = *(void *)(a1 + 48);
              id v97 = objc_alloc_init(MEMORY[0x1E4F965A8]);
              (*(void (**)(uint64_t, id))(v96 + 16))(v96, v97);

              goto LABEL_61;
            }
            uint64_t v80 = *(void (**)(void))(v78 + 16);
          }
          v80();
LABEL_61:

LABEL_62:
          goto LABEL_63;
        }
        id v49 = objc_alloc(MEMORY[0x1E4F318D0]);
        int v50 = [MEMORY[0x1E4F31978] identityKind];
        v107[0] = MEMORY[0x1E4F143A8];
        v107[1] = 3221225472;
        v107[2] = sub_1D423CFA0;
        v107[3] = &unk_1E69E3090;
        id v108 = *(id *)(a1 + 40);
        id v38 = (void *)[v49 initWithSource:@"MPCAssistant" modelKind:v50 block:v107];

        id v39 = v108;
      }
    }
    else
    {
      unint64_t v35 = 0x1EA6C8000uLL;
      if (![*(id *)(*(void *)(a1 + 32) + 88) length])
      {
        uint64_t v52 = [*(id *)(a1 + 32) aceId];
        uint64_t v53 = sub_1D4244ECC(@"Set Queue", v52);
        uint64_t v54 = *(void *)(a1 + 32);
        uint64_t v55 = *(void **)(v54 + 88);
        *(void *)(v54 + 88) = v53;
      }
      __int16 v56 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v57 = *(void *)(*(void *)(a1 + 32) + 88);
        v58 = [*(id *)(a1 + 40) identifier];
        *(_DWORD *)buf = 138543618;
        uint64_t v116 = v57;
        __int16 v117 = 2114;
        uint64_t v118 = (uint64_t)v58;
        _os_log_impl(&dword_1D422A000, v56, OS_LOG_TYPE_DEFAULT, "Set Queue (store) <%{public}@>: using collection identifier %{public}@", buf, 0x16u);
      }
      id v39 = [*(id *)(a1 + 40) identifier];
      uint64_t v59 = [v39 lastPathComponent];
      [v14 addObject:v59];

      id v38 = 0;
    }

    goto LABEL_41;
  }
  if (![*(id *)(*(void *)(a1 + 32) + 88) length])
  {
    uint64_t v5 = [*(id *)(a1 + 32) aceId];
    uint64_t v6 = sub_1D4244ECC(@"Set Queue", v5);
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 88);
    *(void *)(v7 + 88) = v6;
  }
  uint64_t v9 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 88);
    *(_DWORD *)buf = 138543362;
    uint64_t v116 = v10;
    _os_log_impl(&dword_1D422A000, v9, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: network unavailable", buf, 0xCu);
  }

  uint64_t v11 = *(void *)(a1 + 48);
  id v12 = objc_alloc(MEMORY[0x1E4F965A8]);
  int v13 = (void *)MEMORY[0x1E4F97340];
LABEL_31:
  uint64_t v31 = (void *)[v12 initWithErrorCode:*v13];
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v31);
LABEL_63:
}

void sub_1D423CF14(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1D423D33C;
  void v3[3] = &unk_1E69E3068;
  id v4 = *(id *)(a1 + 32);
  [a2 setUniversalStoreIdentifiersWithBlock:v3];
}

void sub_1D423CFA0(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1D423D2C4;
  void v3[3] = &unk_1E69E3068;
  id v4 = *(id *)(a1 + 32);
  [a2 setUniversalStoreIdentifiersWithBlock:v3];
}

void sub_1D423D02C(uint64_t a1, uint64_t a2)
{
  id v4 = [MEMORY[0x1E4F76E68] systemMediaApplicationDestination];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) hashedRouteUIDs];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D423D128;
  v8[3] = &unk_1E69E2EB0;
  uint64_t v7 = *(void **)(a1 + 48);
  void v8[4] = *(void *)(a1 + 40);
  id v10 = v7;
  char v11 = *(unsigned char *)(a1 + 60);
  id v9 = *(id *)(a1 + 32);
  [v4 resolveWithQueue:v5 hashedRouteIdentifiers:v6 localPlaybackPermitted:a2 audioRoutingInfo:*(unsigned int *)(a1 + 56) completion:v8];
}

void sub_1D423D128(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    if (![*(id *)(*(void *)(a1 + 32) + 88) length])
    {
      id v4 = [*(id *)(a1 + 32) aceId];
      uint64_t v5 = sub_1D4244ECC(@"Set Queue", v4);
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void **)(v6 + 88);
      *(void *)(v6 + 88) = v5;
    }
    id v8 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 88);
      int v15 = 138543362;
      uint64_t v16 = v9;
      _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: destination not available, local allowed YES", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v12 = (void *)[v11 initWithErrorCode:*MEMORY[0x1E4F97338]];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);
  }
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = objc_alloc_init(MEMORY[0x1E4F965B8]);
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v14);
  }
  else
  {
    [*(id *)(a1 + 32) sendQueue:*(void *)(a1 + 40) toDestination:v3 shouldResync:0 completion:*(void *)(a1 + 48)];
  }
}

void sub_1D423D2C4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 identifier];
  id v4 = [v5 lastPathComponent];
  objc_msgSend(v3, "setSubscriptionAdamID:", objc_msgSend(v4, "longLongValue"));
}

void sub_1D423D33C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 identifier];
  id v4 = [v5 lastPathComponent];
  [v3 setGlobalPlaylistID:v4];
}

void sub_1D423D69C(uint64_t a1)
{
  id v9 = *(id *)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) scheme];
  int v3 = [v2 isEqualToString:@"x-sampplaylist"];

  id v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  if (v3)
  {
    [v4 MPMediaItemQueryOnlyPlayableItems:1 withUserIdentity:*(void *)(v5 + 72) plugin:@"Set Queue" hash:*(void *)(v5 + 88)];
    id v6 = v9;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = [v4 albumQueryByGroupingForSchemeWithUserIdentity:*(void *)(v5 + 72) plugin:@"Set Queue" hash:*(void *)(v5 + 88)];
    uint64_t v7 = [v6 collections];
    uint64_t v8 = [v7 count];

    if (v8 == 1)
    {
      id v6 = v6;

      [*(id *)(a1 + 56) setShouldShuffle:0];
      id v9 = v6;
    }
  }

  [*(id *)(a1 + 56) _playMediaItems:v9 contextID:*(void *)(a1 + 64) dryRun:*(unsigned __int8 *)(a1 + 80) completion:*(void *)(a1 + 72)];
}

uint64_t sub_1D423D7C8(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1D423D8C8(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 64);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1D423D998;
  v6[3] = &unk_1E69E2D20;
  void v6[4] = v4;
  id v8 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  unsigned int v9 = a2;
  char v10 = *(unsigned char *)(a1 + 56);
  [v5 assistantRadioGetAvailability:a2 completion:v6];
}

void sub_1D423D998(uint64_t a1, uint64_t a2)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  switch(a2)
  {
    case 0:
      if (![*(id *)(*(void *)(a1 + 32) + 88) length])
      {
        uint64_t v13 = [*(id *)(a1 + 32) aceId];
        uint64_t v14 = sub_1D4244ECC(@"Set Queue", v13);
        uint64_t v15 = *(void *)(a1 + 32);
        uint64_t v16 = *(void **)(v15 + 88);
        *(void *)(v15 + 88) = v14;
      }
      uint64_t v17 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 88);
        *(_DWORD *)buf = 138543362;
        uint64_t v60 = v18;
        _os_log_impl(&dword_1D422A000, v17, OS_LOG_TYPE_ERROR, "Set Queue (radio) <%{public}@>: radio unavailable", buf, 0xCu);
      }

      uint64_t v10 = *(void *)(a1 + 48);
      id v11 = objc_alloc(MEMORY[0x1E4F965A8]);
      id v12 = (void *)MEMORY[0x1E4F973C0];
      goto LABEL_14;
    case 2:
      if (![*(id *)(*(void *)(a1 + 32) + 88) length])
      {
        uint64_t v20 = [*(id *)(a1 + 32) aceId];
        uint64_t v21 = sub_1D4244ECC(@"Set Queue", v20);
        uint64_t v22 = *(void *)(a1 + 32);
        uint64_t v23 = *(void **)(v22 + 88);
        *(void *)(v22 + 88) = v21;
      }
      id v24 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 88);
        *(_DWORD *)buf = 138543362;
        uint64_t v60 = v25;
        _os_log_impl(&dword_1D422A000, v24, OS_LOG_TYPE_ERROR, "Set Queue (radio) <%{public}@>: companion unavailable", buf, 0xCu);
      }

      uint64_t v10 = *(void *)(a1 + 48);
      id v19 = objc_alloc_init(MEMORY[0x1E4F965A8]);
      goto LABEL_20;
    case 1:
      if (![*(id *)(*(void *)(a1 + 32) + 88) length])
      {
        uint64_t v4 = [*(id *)(a1 + 32) aceId];
        uint64_t v5 = sub_1D4244ECC(@"Set Queue", v4);
        uint64_t v6 = *(void *)(a1 + 32);
        id v7 = *(void **)(v6 + 88);
        *(void *)(v6 + 88) = v5;
      }
      id v8 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 88);
        *(_DWORD *)buf = 138543362;
        uint64_t v60 = v9;
        _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_ERROR, "Set Queue (radio) <%{public}@>: network unavailable", buf, 0xCu);
      }

      uint64_t v10 = *(void *)(a1 + 48);
      id v11 = objc_alloc(MEMORY[0x1E4F965A8]);
      id v12 = (void *)MEMORY[0x1E4F97340];
LABEL_14:
      id v19 = (id)[v11 initWithErrorCode:*v12];
LABEL_20:
      uint64_t v26 = v19;
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v19);
      goto LABEL_33;
  }
  uint64_t v26 = [*(id *)(a1 + 32) refId];
  uint64_t v27 = [*(id *)(a1 + 40) lastPathComponent];
  if (v27)
  {
    uint64_t v28 = [MEMORY[0x1E4F76E60] radioQueueWithContextID:v26 stationStringID:v27];
    uint64_t v29 = [*(id *)(a1 + 32) startPlaying];
    objc_msgSend(v28, "setShouldImmediatelyStartPlayback:", objc_msgSend(v29, "BOOLValue"));

    objc_msgSend(v28, "setShouldOverrideManuallyCuratedQueue:", objc_msgSend(*(id *)(a1 + 32), "shouldOverrideManuallyCuratedUpNext"));
    uint64_t v30 = [*(id *)(a1 + 32) recommendationId];
    [v28 setSiriRecommendationID:v30];

    uint64_t v31 = [*(id *)(a1 + 32) assetInfo];
    [v28 setSiriAssetInfo:v31];

    uint64_t v32 = objc_msgSend(*(id *)(a1 + 32), "MP_WHAMetricsInfo");
    [v28 setSiriWHAMetricsInfo:v32];

    BOOL v33 = a2 == 4;
    if (![*(id *)(*(void *)(a1 + 32) + 88) length])
    {
      int v34 = [*(id *)(a1 + 32) aceId];
      uint64_t v35 = sub_1D4244ECC(@"Set Queue", v34);
      uint64_t v36 = *(void *)(a1 + 32);
      uint64_t v37 = *(void **)(v36 + 88);
      *(void *)(v36 + 88) = v35;
    }
    id v38 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = *(void *)(*(void *)(a1 + 32) + 88);
      *(_DWORD *)buf = 138543618;
      uint64_t v60 = v39;
      __int16 v61 = 2114;
      uint64_t v62 = v27;
      _os_log_impl(&dword_1D422A000, v38, OS_LOG_TYPE_DEFAULT, "Set Queue (radio) <%{public}@>: station %{public}@", buf, 0x16u);
    }
    BOOL v40 = a2 == 4;

    id v41 = [MEMORY[0x1E4F76E68] systemMediaApplicationDestination];
    uint64_t v42 = [*(id *)(a1 + 32) hashedRouteUIDs];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = sub_1D423DFD8;
    v54[3] = &unk_1E69E2CF8;
    v54[4] = *(void *)(a1 + 32);
    BOOL v57 = v33;
    id v43 = *(id *)(a1 + 48);
    char v58 = *(unsigned char *)(a1 + 60);
    id v55 = v28;
    id v56 = v43;
    uint64_t v44 = *(unsigned int *)(a1 + 56);
    id v45 = v28;
    [v41 resolveWithQueue:v45 hashedRouteIdentifiers:v42 localPlaybackPermitted:v40 audioRoutingInfo:v44 completion:v54];
  }
  else
  {
    if (![*(id *)(*(void *)(a1 + 32) + 88) length])
    {
      uint64_t v46 = [*(id *)(a1 + 32) aceId];
      uint64_t v47 = sub_1D4244ECC(@"Set Queue", v46);
      uint64_t v48 = *(void *)(a1 + 32);
      id v49 = *(void **)(v48 + 88);
      *(void *)(v48 + 88) = v47;
    }
    int v50 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      uint64_t v51 = *(void **)(a1 + 40);
      uint64_t v52 = *(void *)(*(void *)(a1 + 32) + 88);
      *(_DWORD *)buf = 138543618;
      uint64_t v60 = v52;
      __int16 v61 = 2114;
      uint64_t v62 = v51;
      _os_log_impl(&dword_1D422A000, v50, OS_LOG_TYPE_ERROR, "Set Queue (radio) <%{public}@>: no radio identifier %{public}@", buf, 0x16u);
    }

    uint64_t v53 = *(void *)(a1 + 48);
    id v41 = objc_alloc_init(MEMORY[0x1E4F965A8]);
    (*(void (**)(uint64_t, id))(v53 + 16))(v53, v41);
  }

LABEL_33:
}

void sub_1D423DFD8(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    if (![*(id *)(*(void *)(a1 + 32) + 88) length])
    {
      uint64_t v4 = [*(id *)(a1 + 32) aceId];
      uint64_t v5 = sub_1D4244ECC(@"Set Queue", v4);
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(void **)(v6 + 88);
      *(void *)(v6 + 88) = v5;
    }
    id v8 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 88);
      int v10 = *(unsigned __int8 *)(a1 + 56);
      int v16 = 138543618;
      uint64_t v17 = v9;
      __int16 v18 = 1024;
      int v19 = v10;
      _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_ERROR, "Set Queue (radio) <%{public}@>: destination not available, local allowed %{BOOL}u", (uint8_t *)&v16, 0x12u);
    }

    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = objc_alloc(MEMORY[0x1E4F965A8]);
    uint64_t v13 = (void *)[v12 initWithErrorCode:*MEMORY[0x1E4F97338]];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v13);
  }
  if (*(unsigned char *)(a1 + 57))
  {
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = objc_alloc_init(MEMORY[0x1E4F965B8]);
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v15);
  }
  else
  {
    [*(id *)(a1 + 32) sendQueue:*(void *)(a1 + 40) toDestination:v3 shouldResync:0 completion:*(void *)(a1 + 48)];
  }
}

uint64_t sub_1D423E894(uint64_t a1, int a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (![*(id *)(*(void *)(a1 + 32) + 88) length])
    {
      id v3 = [*(id *)(a1 + 32) aceId];
      uint64_t v4 = sub_1D4244ECC(@"Set Queue", v3);
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(v5 + 88);
      *(void *)(v5 + 88) = v4;
    }
    id v7 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = v8[11];
      int v11 = [v8 dryRun];
      id v12 = &stru_1F2BFA380;
      int v15 = 138543874;
      uint64_t v16 = v10;
      __int16 v17 = 2114;
      if (v11) {
        id v12 = @" ⚠️ DRY RUN";
      }
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      uint64_t v20 = v12;
      _os_log_impl(&dword_1D422A000, v7, OS_LOG_TYPE_DEFAULT, "Set Queue (localstore) <%{public}@>: search failed, use identifier %{public}@%{public}@", (uint8_t *)&v15, 0x20u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_performStoreItemsSetQueueAsDryRun:completion:", objc_msgSend(*(id *)(a1 + 32), "dryRun"), *(void *)(a1 + 48));
  }
  else
  {
    uint64_t v14 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v14();
  }
}

void sub_1D423ED3C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[11];
  uint64_t v4 = [v2 requesterSharedUserId];
  uint64_t v5 = [*(id *)(a1 + 32) sharedUserIdFromPlayableMusicAccount];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D423EE18;
  v7[3] = &unk_1E69E3F08;
  uint64_t v6 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  sub_1D4246230(@"Set Queue", v3, v4, v5, v7);
}

void sub_1D423EE18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), a2);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), a3);
    id v8 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1D423F05C;
    v19[3] = &unk_1E69E4098;
    void v19[4] = v8;
    id v20 = *(id *)(a1 + 40);
    [v8 _performWithCompletion:v19];
  }
  else
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"no user identity"];
    if (![*(id *)(*(void *)(a1 + 32) + 88) length])
    {
      uint64_t v10 = [*(id *)(a1 + 32) aceId];
      uint64_t v11 = sub_1D4244ECC(@"Set Queue", v10);
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void **)(v12 + 88);
      *(void *)(v12 + 88) = v11;
    }
    uint64_t v14 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 88);
      uint64_t v16 = [v9 dictionary];
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v15;
      __int16 v23 = 2114;
      id v24 = v16;
      _os_log_impl(&dword_1D422A000, v14, OS_LOG_TYPE_DEFAULT, "Set Queue (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = [v9 dictionary];
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);
  }
}

void sub_1D423F05C(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![*(id *)(*(void *)(a1 + 32) + 88) length])
  {
    uint64_t v4 = [*(id *)(a1 + 32) aceId];
    uint64_t v5 = sub_1D4244ECC(@"Set Queue", v4);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 88);
    *(void *)(v6 + 88) = v5;
  }
  id v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 88);
    uint64_t v10 = [v3 dictionary];
    int v13 = 138543618;
    uint64_t v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Set Queue (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = [v3 dictionary];
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
}

__CFString *sub_1D423F250(void *a1)
{
  uint64_t v1 = [a1 valueForProperty:*MEMORY[0x1E4F31588]];
  int v2 = [v1 BOOLValue];

  if (v2) {
    id v3 = @"x-sampgeniusmix";
  }
  else {
    id v3 = @"x-sampplaylist";
  }

  return v3;
}

void sub_1D423F554(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = (void *)[a2 mutableCopy];
  uint64_t v6 = [*(id *)(a1 + 40) groupID];
  char v7 = [v6 isEqualToString:@"LOCAL_DEVICE"];

  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 40) groupID];
    uint64_t v10 = [v5 allKeysForObject:v9];
    id v8 = [v10 firstObject];

    if (!*(unsigned char *)(a1 + 56)) {
      [v5 removeObjectForKey:v8];
    }
  }
  uint64_t v11 = [v5 allKeys];
  uint64_t v12 = [v11 count];
  int v13 = [*(id *)(a1 + 40) hashedRouteUIDs];
  uint64_t v14 = [v13 count];

  if (v12 == v14)
  {
    id v25 = *(id *)(a1 + 48);
    MRAVEndpointMoveOutputGroupToDevicesFromSource();
  }
  else
  {
    __int16 v15 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"UID decoding error"];
    if (![*(id *)(*(void *)(a1 + 40) + 56) length])
    {
      uint64_t v16 = [*(id *)(a1 + 40) aceId];
      uint64_t v17 = sub_1D4244ECC(@"Move Output Group To Devices", v16);
      uint64_t v18 = *(void *)(a1 + 40);
      __int16 v19 = *(void **)(v18 + 56);
      *(void *)(v18 + 56) = v17;
    }
    id v20 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 56);
      uint64_t v22 = [v15 dictionary];
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v21;
      __int16 v28 = 2114;
      uint64_t v29 = v22;
      _os_log_impl(&dword_1D422A000, v20, OS_LOG_TYPE_ERROR, "Move Output Group To Devices (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    uint64_t v23 = *(void *)(a1 + 48);
    id v24 = [v15 dictionary];
    (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);
  }
}

void sub_1D423F840(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F965A8]);
    uint64_t v5 = [v3 localizedFailureReason];
    id v6 = (id)[v4 initWithReason:v5];

    if (![*(id *)(*(void *)(a1 + 32) + 56) length])
    {
      char v7 = [*(id *)(a1 + 32) aceId];
      uint64_t v8 = sub_1D4244ECC(@"Move Output Group To Devices", v7);
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void **)(v9 + 56);
      *(void *)(v9 + 56) = v8;
    }
    uint64_t v11 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 56);
      int v13 = [v6 dictionary];
      int v23 = 138543618;
      uint64_t v24 = v12;
      __int16 v25 = 2114;
      uint64_t v26 = v13;
      uint64_t v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_1D422A000, v14, v15, "Move Output Group To Devices (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v23, 0x16u);
    }
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F968A8]);
    [v6 setRouteResponse:*MEMORY[0x1E4F973D8]];
    if (![*(id *)(*(void *)(a1 + 32) + 56) length])
    {
      uint64_t v16 = [*(id *)(a1 + 32) aceId];
      uint64_t v17 = sub_1D4244ECC(@"Move Output Group To Devices", v16);
      uint64_t v18 = *(void *)(a1 + 32);
      __int16 v19 = *(void **)(v18 + 56);
      *(void *)(v18 + 56) = v17;
    }
    uint64_t v11 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 56);
      int v13 = [v6 dictionary];
      int v23 = 138543618;
      uint64_t v24 = v20;
      __int16 v25 = 2114;
      uint64_t v26 = v13;
      uint64_t v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }
  }

  uint64_t v21 = *(void *)(a1 + 40);
  uint64_t v22 = [v6 dictionary];
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);
}

void sub_1D423FDAC(uint64_t a1, unsigned int a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) hashedRouteUIDs];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D423FEA0;
  v8[3] = &unk_1E69E3EB8;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = *(id *)(a1 + 72);
  [v4 resolveWithHashedRouteIdentifiers:v5 audioRoutingInfo:a2 completion:v8];
}

void sub_1D423FEA0(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D423FF70;
  v9[3] = &unk_1E69E3E90;
  id v10 = v4;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void **)(a1 + 64);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v8;
  [v10 sendCommand:19 toDestination:a2 withOptions:v5 completion:v9];
}

void sub_1D423FF70(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = objc_alloc_init(MEMORY[0x1E4F965B8]);
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setObject:@"Seek To Playback Speed" forKeyedSubscript:@"pluginname"];
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"success"];
  uint64_t v7 = NSNumber;
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  id v9 = [v7 numberWithDouble:fabs(v8)];
  [v6 setObject:v9 forKeyedSubscript:@"duration"];

  if (v3)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v11 = [v3 localizedDescription];
    uint64_t v12 = [v10 initWithReason:v11];

    [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"success"];
    id v13 = [v3 localizedDescription];
    [v6 setObject:v13 forKeyedSubscript:@"errorstring"];

    id v5 = (id)v12;
  }
  if (![*(id *)(*(void *)(a1 + 48) + 56) length])
  {
    uint64_t v14 = [*(id *)(a1 + 48) aceId];
    uint64_t v15 = sub_1D4244ECC(@"Seek To Playback Speed", v14);
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = *(void **)(v16 + 56);
    *(void *)(v16 + 56) = v15;
  }
  uint64_t v18 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 56);
    uint64_t v20 = [v5 dictionary];
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v19;
    __int16 v27 = 2114;
    __int16 v28 = v20;
    _os_log_impl(&dword_1D422A000, v18, OS_LOG_TYPE_DEFAULT, "Seek To Playback Speed (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
  }
  uint64_t v21 = *(void *)(a1 + 56);
  uint64_t v22 = [v5 dictionary];
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  uint64_t v24 = v6;
  id v23 = v6;
  AnalyticsSendEventLazy();
}

id sub_1D4240268(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_1D4240590(void *a1, uint64_t a2, void *a3)
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 identifier];
  id v6 = [v5 scheme];
  if ([v6 isEqualToString:@"x-sampmeditem"])
  {
    uint64_t v7 = sub_1D4232A80(v5);
    uint64_t v8 = v7;
    if (v7 == 4 || v7 == 1)
    {
      id v9 = [v5 path];
      id v10 = [v9 lastPathComponent];
      uint64_t v11 = [v10 longLongValue];

      uint64_t v12 = (void *)MEMORY[0x1E4F318F8];
      id v13 = (void *)MEMORY[0x1E4F31968];
      uint64_t v14 = [NSNumber numberWithLongLong:v11];
      if (v8 == 4)
      {
        uint64_t v15 = [v13 predicateWithValue:v14 forProperty:*MEMORY[0x1E4F314D0]];
        v39[0] = v15;
        uint64_t v16 = (void *)MEMORY[0x1E4F31968];
        uint64_t v17 = [NSNumber numberWithLongLong:v11];
        uint64_t v18 = [v16 predicateWithValue:v17 forProperty:*MEMORY[0x1E4F314E0]];
        v39[1] = v18;
        uint64_t v19 = v39;
      }
      else
      {
        uint64_t v15 = [v13 predicateWithValue:v14 forProperty:*MEMORY[0x1E4F31430]];
        v38[0] = v15;
        uint64_t v24 = (void *)MEMORY[0x1E4F31968];
        uint64_t v17 = [NSNumber numberWithLongLong:v11];
        uint64_t v18 = [v24 predicateWithValue:v17 forProperty:*MEMORY[0x1E4F31530]];
        v38[1] = v18;
        uint64_t v19 = v38;
      }
      __int16 v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
      uint64_t v26 = [v12 predicateMatchingPredicates:v25];

      __int16 v27 = [MEMORY[0x1E4F31940] deviceMediaLibraryWithUserIdentity:v4];
      id v28 = objc_alloc(MEMORY[0x1E4F31970]);
      uint64_t v29 = [MEMORY[0x1E4F1CAD0] setWithObject:v26];
      uint64_t v30 = (void *)[v28 initWithFilterPredicates:v29 library:v27];

      [v30 setIgnoreSystemFilterPredicates:1];
      [v30 setShouldIncludeNonLibraryEntities:1];
      uint64_t v31 = [v30 items];
      uint64_t v32 = [v31 firstObject];

      if (v32) {
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v22 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = [v5 host];
        int v34 = 136315394;
        uint64_t v35 = "/Library/Caches/com.apple.xbs/Sources/MobileMusicPlayer/AssistantBundle/Categories/SAMPMediaItem_MPAdditions.m";
        __int16 v36 = 2112;
        uint64_t v37 = v23;
        _os_log_impl(&dword_1D422A000, v22, OS_LOG_TYPE_ERROR, "[%s] Unsupported identifier URL host: %@", (uint8_t *)&v34, 0x16u);
      }
    }
    uint64_t v20 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v34 = 138412290;
      uint64_t v35 = (const char *)v5;
      uint64_t v21 = "Could not find item with identifier %@";
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v20 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v34 = 138543362;
      uint64_t v35 = v6;
      uint64_t v21 = "Unknown identifier URL scheme: %{public}@";
LABEL_15:
      _os_log_impl(&dword_1D422A000, v20, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v34, 0xCu);
    }
  }

  uint64_t v32 = 0;
LABEL_17:

  return v32;
}

void sub_1D4240D78(uint64_t a1, unsigned int a2)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) hashedRouteUIDs];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D4240E6C;
  v8[3] = &unk_1E69E3EB8;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = *(id *)(a1 + 72);
  [v4 resolveWithHashedRouteIdentifiers:v5 audioRoutingInfo:a2 completion:v8];
}

void sub_1D4240E6C(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D4240F3C;
  v9[3] = &unk_1E69E3E90;
  id v10 = v4;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void **)(a1 + 64);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v8;
  [v10 sendCommand:25 toDestination:a2 withOptions:v5 completion:v9];
}

void sub_1D4240F3C(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = objc_alloc_init(MEMORY[0x1E4F965B8]);
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setObject:@"Set Repeat Mode" forKeyedSubscript:@"pluginname"];
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"success"];
  uint64_t v7 = NSNumber;
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  id v9 = [v7 numberWithDouble:fabs(v8)];
  [v6 setObject:v9 forKeyedSubscript:@"duration"];

  if (v3)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v11 = [v3 localizedDescription];
    uint64_t v12 = [v10 initWithReason:v11];

    [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"success"];
    id v13 = [v3 localizedDescription];
    [v6 setObject:v13 forKeyedSubscript:@"errorstring"];

    id v5 = (id)v12;
  }
  if (![*(id *)(*(void *)(a1 + 48) + 56) length])
  {
    uint64_t v14 = [*(id *)(a1 + 48) aceId];
    uint64_t v15 = sub_1D4244ECC(@"Set Repeat Mode", v14);
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = *(void **)(v16 + 56);
    *(void *)(v16 + 56) = v15;
  }
  uint64_t v18 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 56);
    uint64_t v20 = [v5 dictionary];
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v19;
    __int16 v27 = 2114;
    id v28 = v20;
    _os_log_impl(&dword_1D422A000, v18, OS_LOG_TYPE_DEFAULT, "Set Repeat Mode (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
  }
  uint64_t v21 = *(void *)(a1 + 56);
  uint64_t v22 = [v5 dictionary];
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  uint64_t v24 = v6;
  id v23 = v6;
  AnalyticsSendEventLazy();
}

id sub_1D4241234(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1D42416E8(uint64_t a1, unsigned int a2)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) hashedRouteUIDs];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D42417C8;
  v7[3] = &unk_1E69E2F28;
  id v6 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v6;
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  [v4 resolveWithHashedRouteIdentifiers:v5 audioRoutingInfo:a2 completion:v7];
}

void sub_1D42417C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(v4 + 56);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D4241894;
  v7[3] = &unk_1E69E3AB0;
  v7[4] = v4;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  [v6 sendCommand:5 toDestination:a2 withOptions:v5 completion:v7];
}

void sub_1D4241894(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(*(void *)(a1 + 32) + 56);
  id v5 = objc_alloc_init(MEMORY[0x1E4F965B8]);
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setObject:@"Seek To Previous Item" forKeyedSubscript:@"pluginname"];
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"success"];
  uint64_t v7 = NSNumber;
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  id v9 = [v7 numberWithDouble:fabs(v8)];
  [v6 setObject:v9 forKeyedSubscript:@"duration"];

  if (v3)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v11 = [v3 localizedDescription];
    uint64_t v12 = [v10 initWithReason:v11];

    [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"success"];
    id v13 = [v3 localizedDescription];
    [v6 setObject:v13 forKeyedSubscript:@"errorstring"];

    id v5 = (id)v12;
  }
  if (![*(id *)(*(void *)(a1 + 32) + 64) length])
  {
    uint64_t v14 = [*(id *)(a1 + 32) aceId];
    uint64_t v15 = sub_1D4244ECC(@"Seek To Previous Item", v14);
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void **)(v16 + 64);
    *(void *)(v16 + 64) = v15;
  }
  uint64_t v18 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 64);
    uint64_t v20 = [v5 dictionary];
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v19;
    __int16 v27 = 2114;
    id v28 = v20;
    _os_log_impl(&dword_1D422A000, v18, OS_LOG_TYPE_DEFAULT, "Seek To Previous Item (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
  }
  uint64_t v21 = *(void *)(a1 + 48);
  uint64_t v22 = [v5 dictionary];
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  uint64_t v24 = v6;
  id v23 = v6;
  AnalyticsSendEventLazy();
}

id sub_1D4241B98(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t sub_1D4241DF4(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v2 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  uint64_t v4 = [v2 containsObject:v3];

  if ((v4 & 1) == 0)
  {
    if (![*(id *)(*(void *)(a1 + 32) + 80) length])
    {
      id v5 = [*(id *)(a1 + 32) aceId];
      uint64_t v6 = sub_1D4244ECC(@"Add Media Items To Up Next Queue", v5);
      uint64_t v7 = *(void *)(a1 + 32);
      double v8 = *(void **)(v7 + 80);
      *(void *)(v7 + 80) = v6;
    }
    id v9 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 80);
      uint64_t v11 = *(int *)(a1 + 40);
      int v13 = 138543874;
      uint64_t v14 = v10;
      __int16 v15 = 2048;
      uint64_t v16 = v11;
      __int16 v17 = 2114;
      uint64_t v18 = v2;
      _os_log_impl(&dword_1D422A000, v9, OS_LOG_TYPE_ERROR, "Add Media Items To Up Next Queue (issupported) <%{public}@>: mode %ld not in %{public}@", (uint8_t *)&v13, 0x20u);
    }
  }
  return v4;
}

void sub_1D4242420(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1D42425B0;
  void v3[3] = &unk_1E69E3068;
  id v4 = *(id *)(a1 + 32);
  [a2 setUniversalStoreIdentifiersWithBlock:v3];
}

void sub_1D42424AC(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1D4242538;
  void v3[3] = &unk_1E69E3068;
  id v4 = *(id *)(a1 + 32);
  [a2 setUniversalStoreIdentifiersWithBlock:v3];
}

void sub_1D4242538(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 identifier];
  id v4 = [v5 lastPathComponent];
  objc_msgSend(v3, "setSubscriptionAdamID:", objc_msgSend(v4, "longLongValue"));
}

void sub_1D42425B0(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 identifier];
  id v4 = [v5 lastPathComponent];
  [v3 setGlobalPlaylistID:v4];
}

void sub_1D4242BA0(uint64_t a1, const void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(*(void *)(a1 + 32) + 80) length])
  {
    id v4 = [*(id *)(a1 + 32) aceId];
    uint64_t v5 = sub_1D4244ECC(@"Add Media Items To Up Next Queue", v4);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 80);
    *(void *)(v6 + 80) = v5;
  }
  double v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = v9[10];
    uint64_t v11 = [v9 insertLocation];
    *(_DWORD *)buf = 138543874;
    uint64_t v31 = v10;
    __int16 v32 = 2114;
    id v33 = v11;
    __int16 v34 = 2114;
    uint64_t v35 = a2;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Add Media Items To Up Next Queue (perform) <%{public}@>: mode %{public}@ to origin %{public}@", buf, 0x20u);
  }
  uint64_t v12 = [*(id *)(a1 + 32) mediaCollection];
  int v13 = *(void **)(a1 + 32);
  id v29 = 0;
  uint64_t v14 = [v13 _createPlaybackQueueWithCollection:v12 error:&v29];
  id v15 = v29;
  uint64_t v16 = *(id **)(a1 + 32);
  if (v14)
  {
    id v17 = [v16 insertLocation];
    if (([v17 isEqualToString:*MEMORY[0x1E4F97318]] & 1) == 0
      && ([v17 isEqualToString:*MEMORY[0x1E4F97328]] & 1) == 0)
    {
      [v17 isEqualToString:*MEMORY[0x1E4F97320]];
    }

    [v14 createRemotePlaybackQueue];
    MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
    if (a2) {
      CFRetain(a2);
    }
    id v28 = *(id *)(a1 + 40);
    MRMediaRemoteGetSupportedCommandsForOrigin();
  }
  else
  {
    if (![v16[10] length])
    {
      uint64_t v18 = [*(id *)(a1 + 32) aceId];
      uint64_t v19 = sub_1D4244ECC(@"Add Media Items To Up Next Queue", v18);
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v21 = *(void **)(v20 + 80);
      *(void *)(v20 + 80) = v19;
    }
    uint64_t v22 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 80);
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v23;
      __int16 v32 = 2114;
      id v33 = v15;
      _os_log_impl(&dword_1D422A000, v22, OS_LOG_TYPE_ERROR, "Add Media Items To Up Next Queue (perform) <%{public}@>: playback queue creation failed %{public}@", buf, 0x16u);
    }

    id v24 = objc_alloc(MEMORY[0x1E4F965A8]);
    __int16 v25 = (void *)[v24 initWithErrorCode:*MEMORY[0x1E4F973A0]];
    uint64_t v26 = *(void *)(a1 + 40);
    __int16 v27 = [v25 dictionary];
    (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v27);
  }
}

void sub_1D4242F30(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F76E30]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1D42436C4;
  v6[3] = &unk_1E69E2FA0;
  id v7 = v4;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v5 = v4;
  [v5 connectToEndpoint:a2 completion:v6];
}

void sub_1D4243004(id *a1, uint64_t a2)
{
  if (a2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MPAssistantAddMediaItemsToUpNextQueue", 0);
    id v4 = a1[7];
    MRMediaRemoteGetActiveOrigin();
  }
  else
  {
    id v5 = a1[5];
    id v6 = a1[6];
    MRAVEndpointGetMyGroupLeaderWithTimeout();
  }
}

void sub_1D4243134(uint64_t a1, void *a2)
{
  dispatch_queue_t v3 = *(void **)(a1 + 32);
  if (a2)
  {
    id v5 = v3;
    id v6 = [a2 allKeys];
    id v7 = objc_alloc_init(MEMORY[0x1E4F76E38]);
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = *(void **)(v8 + 56);
    *(void *)(v8 + 56) = v7;

    uint64_t v10 = *(void **)(*(void *)(a1 + 40) + 56);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1D4243284;
    v15[3] = &unk_1E69E3018;
    id v16 = *(id *)(a1 + 48);
    id v17 = *(id *)(a1 + 56);
    [v10 discoverRemoteControlEndpointsMatchingUIDs:v6 completion:v15];
  }
  else
  {
    uint64_t v11 = (objc_class *)MEMORY[0x1E4F965A8];
    id v12 = v3;
    id v6 = (void *)[[v11 alloc] initWithReason:@"UID decoding error"];
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = [v6 dictionary];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
  }
}

void sub_1D4243284(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ((unint64_t)[v9 count] < 2)
  {
    if ([v9 count])
    {
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = [v9 firstObject];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
      goto LABEL_7;
    }
    id v3 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v4 = @"No endpoints found";
  }
  else
  {
    id v3 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v4 = @"Too many endpoints requested";
  }
  id v6 = (void *)[v3 initWithReason:v4];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = [v6 dictionary];
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

LABEL_7:
}

void sub_1D4243374(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    if (![*(id *)(*(void *)(a1 + 32) + 80) length])
    {
      id v29 = [*(id *)(a1 + 32) aceId];
      uint64_t v30 = sub_1D4244ECC(@"Add Media Items To Up Next Queue", v29);
      uint64_t v31 = *(void *)(a1 + 32);
      __int16 v32 = *(void **)(v31 + 80);
      *(void *)(v31 + 80) = v30;
    }
    uint64_t v13 = _MPLogCategoryAssistant();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    uint64_t v33 = *(void *)(*(void *)(a1 + 32) + 80);
    int v36 = 138543618;
    uint64_t v37 = v33;
    __int16 v38 = 2114;
    uint64_t v39 = a2;
    id v15 = "Add Media Items To Up Next Queue (perform) <%{public}@>: group leader endpoint %{public}@";
    id v16 = v13;
    uint32_t v17 = 22;
    goto LABEL_17;
  }
  if ([v5 code] == 33)
  {
    uint64_t v7 = [v6 domain];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F77398]];

    if (v8)
    {
      if (![*(id *)(*(void *)(a1 + 32) + 80) length])
      {
        id v9 = [*(id *)(a1 + 32) aceId];
        uint64_t v10 = sub_1D4244ECC(@"Add Media Items To Up Next Queue", v9);
        uint64_t v11 = *(void *)(a1 + 32);
        id v12 = *(void **)(v11 + 80);
        *(void *)(v11 + 80) = v10;
      }
      uint64_t v13 = _MPLogCategoryAssistant();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 80);
      int v36 = 138543362;
      uint64_t v37 = v14;
      id v15 = "Add Media Items To Up Next Queue (perform) <%{public}@>: group leader legacy";
      id v16 = v13;
      uint32_t v17 = 12;
LABEL_17:
      _os_log_impl(&dword_1D422A000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v36, v17);
LABEL_18:

      (*(void (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, v34, v35);
      goto LABEL_19;
    }
  }
  if (![*(id *)(*(void *)(a1 + 32) + 80) length])
  {
    uint64_t v18 = [*(id *)(a1 + 32) aceId];
    uint64_t v19 = sub_1D4244ECC(@"Add Media Items To Up Next Queue", v18);
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v21 = *(void **)(v20 + 80);
    *(void *)(v20 + 80) = v19;
  }
  uint64_t v22 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 80);
    int v36 = 138543618;
    uint64_t v37 = v23;
    __int16 v38 = 2114;
    uint64_t v39 = v6;
    _os_log_impl(&dword_1D422A000, v22, OS_LOG_TYPE_ERROR, "Add Media Items To Up Next Queue (perform) <%{public}@>: group leader endpoint not found %{public}@", (uint8_t *)&v36, 0x16u);
  }

  id v24 = objc_alloc(MEMORY[0x1E4F965A8]);
  __int16 v25 = [v6 localizedFailureReason];
  uint64_t v26 = (void *)[v24 initWithReason:v25];

  uint64_t v27 = *(void *)(a1 + 48);
  id v28 = [v26 dictionary];
  (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v28);

LABEL_19:
}

uint64_t sub_1D42436B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1D42436C4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = (void *)a1[4];
  id v15 = v5;
  if (a4)
  {
    id v6 = (objc_class *)MEMORY[0x1E4F965A8];
    id v7 = v5;
    int v8 = (void *)[[v6 alloc] initWithReason:@"Failed to connect to endpoint"];
    uint64_t v9 = a1[6];
    uint64_t v10 = [v8 dictionary];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  else
  {
    uint64_t v12 = a1[5];
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v12 + 16);
    id v14 = v5;
    v13(v12, a3);
  }
}

void sub_1D4243788(uint64_t a1, uint64_t a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _isInsertionPositionSupported:*(unsigned int *)(a1 + 64) origin:*(void *)(a1 + 48) supportedCommands:a2])
  {
    if (![*(id *)(*(void *)(a1 + 32) + 80) length])
    {
      id v3 = [*(id *)(a1 + 32) aceId];
      uint64_t v4 = sub_1D4244ECC(@"Add Media Items To Up Next Queue", v3);
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 80);
      *(void *)(v5 + 80) = v4;
    }
    id v7 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 80);
      uint64_t v9 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v8;
      __int16 v35 = 2112;
      id v36 = v9;
      _os_log_impl(&dword_1D422A000, v7, OS_LOG_TYPE_DEFAULT, "Add Media Items To Up Next Queue (perform) <%{public}@>: sending add request to %@", buf, 0x16u);
    }

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 64);
    id v32 = 0;
    uint64_t v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v32];
    id v13 = v32;
    uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 80) length];
    if (v13)
    {
      if (!v14)
      {
        id v15 = [*(id *)(a1 + 32) aceId];
        uint64_t v16 = sub_1D4244ECC(@"Add Media Items To Up Next Queue", v15);
        uint64_t v17 = *(void *)(a1 + 32);
        uint64_t v18 = *(void **)(v17 + 80);
        *(void *)(v17 + 80) = v16;
      }
      uint64_t v19 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 80);
        *(_DWORD *)buf = 138543618;
        uint64_t v34 = v20;
        __int16 v35 = 2114;
        id v36 = v13;
        _os_log_impl(&dword_1D422A000, v19, OS_LOG_TYPE_DEFAULT, "Add Media Items To Up Next Queue (perform) <%{public}@>: could not encode user identity: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (!v14)
      {
        uint64_t v23 = [*(id *)(a1 + 32) aceId];
        uint64_t v24 = sub_1D4244ECC(@"Add Media Items To Up Next Queue", v23);
        uint64_t v25 = *(void *)(a1 + 32);
        uint64_t v26 = *(void **)(v25 + 80);
        *(void *)(v25 + 80) = v24;
      }
      uint64_t v27 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = *(void *)(*(void *)(a1 + 32) + 80);
        *(_DWORD *)buf = 138543619;
        uint64_t v34 = v28;
        __int16 v35 = 2113;
        id v36 = v12;
        _os_log_impl(&dword_1D422A000, v27, OS_LOG_TYPE_DEFAULT, "Add Media Items To Up Next Queue (perform) <%{public}@>: user identity set to: %{private}@", buf, 0x16u);
      }

      [v10 setObject:v12 forKey:*MEMORY[0x1E4F777E0]];
    }
    uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 72);
    if (v29) {
      [v10 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F77750]];
    }
    id v31 = *(id *)(a1 + 40);
    MRMediaRemoteInsertSystemAppPlaybackQueueWithOptions();
  }
  else
  {
    id v21 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v10 = (id)[v21 initWithErrorCode:*MEMORY[0x1E4F97430]];
    uint64_t v22 = *(void *)(a1 + 40);
    id v13 = [v10 dictionary];
    (*(void (**)(uint64_t, id))(v22 + 16))(v22, v13);
  }

  MRSystemAppPlaybackQueueDestroy();
  uint64_t v30 = *(const void **)(a1 + 48);
  if (v30) {
    CFRelease(v30);
  }
}

void sub_1D4243B8C(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F965A8]);
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"MediaRemote command failed. err = %ld", a2);
    id v8 = (id)[v4 initWithReason:v5];
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F965B8]);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [v8 dictionary];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

void sub_1D4243EBC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), a2);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), a3);
    id v8 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1D4244100;
    v19[3] = &unk_1E69E3E40;
    void v19[4] = v8;
    id v20 = *(id *)(a1 + 40);
    [v8 _perform:v19];
  }
  else
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"no user identity"];
    if (![*(id *)(*(void *)(a1 + 32) + 80) length])
    {
      id v10 = [*(id *)(a1 + 32) aceId];
      uint64_t v11 = sub_1D4244ECC(@"Add Media Items To Up Next Queue", v10);
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = *(void **)(v12 + 80);
      *(void *)(v12 + 80) = v11;
    }
    uint64_t v14 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 80);
      uint64_t v16 = [v9 dictionary];
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v15;
      __int16 v23 = 2114;
      uint64_t v24 = v16;
      _os_log_impl(&dword_1D422A000, v14, OS_LOG_TYPE_DEFAULT, "Add Media Items To Up Next Queue (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = [v9 dictionary];
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);
  }
}

void sub_1D4244100(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![*(id *)(*(void *)(a1 + 32) + 80) length])
  {
    id v4 = [*(id *)(a1 + 32) aceId];
    uint64_t v5 = sub_1D4244ECC(@"Add Media Items To Up Next Queue", v4);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 80);
    *(void *)(v6 + 80) = v5;
  }
  id v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 80);
    int v10 = 138543618;
    uint64_t v11 = v9;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Add Media Items To Up Next Queue (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v10, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1D4244560(uint64_t a1, unsigned int a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) hashedRouteUIDs];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D4244654;
  v8[3] = &unk_1E69E3EB8;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = *(id *)(a1 + 72);
  [v4 resolveWithHashedRouteIdentifiers:v5 audioRoutingInfo:a2 completion:v8];
}

void sub_1D4244654(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D4244724;
  v9[3] = &unk_1E69E3E90;
  id v10 = v4;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v8 = *(void **)(a1 + 64);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v8;
  [v10 sendCommand:24 toDestination:a2 withOptions:v5 completion:v9];
}

void sub_1D4244724(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = objc_alloc_init(MEMORY[0x1E4F965B8]);
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setObject:@"Seek To Playback Position" forKeyedSubscript:@"pluginname"];
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"success"];
  uint64_t v7 = NSNumber;
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  id v9 = [v7 numberWithDouble:fabs(v8)];
  [v6 setObject:v9 forKeyedSubscript:@"duration"];

  if (v3)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v11 = [v3 localizedDescription];
    uint64_t v12 = [v10 initWithReason:v11];

    [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"success"];
    id v13 = [v3 localizedDescription];
    [v6 setObject:v13 forKeyedSubscript:@"errorstring"];

    id v5 = (id)v12;
  }
  if (![*(id *)(*(void *)(a1 + 48) + 56) length])
  {
    uint64_t v14 = [*(id *)(a1 + 48) aceId];
    uint64_t v15 = sub_1D4244ECC(@"Seek To Playback Position", v14);
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = *(void **)(v16 + 56);
    *(void *)(v16 + 56) = v15;
  }
  uint64_t v18 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 56);
    id v20 = [v5 dictionary];
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v19;
    __int16 v27 = 2114;
    uint64_t v28 = v20;
    _os_log_impl(&dword_1D422A000, v18, OS_LOG_TYPE_DEFAULT, "Seek To Playback Position (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
  }
  uint64_t v21 = *(void *)(a1 + 56);
  uint64_t v22 = [v5 dictionary];
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  uint64_t v24 = v6;
  id v23 = v6;
  AnalyticsSendEventLazy();
}

id sub_1D4244A1C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_1D4244A24(void *a1)
{
  id v1 = a1;
  int v2 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F77550]];
  if ([v2 isEqualToString:*MEMORY[0x1E4F773C0]])
  {
    id v3 = (objc_class *)MEMORY[0x1E4F96840];
LABEL_5:
    id v4 = objc_alloc_init(v3);
    goto LABEL_7;
  }
  if ([v2 isEqualToString:*MEMORY[0x1E4F773A0]])
  {
    id v3 = (objc_class *)MEMORY[0x1E4F967C8];
    goto LABEL_5;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F96868]);
  id v5 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F774F0]];
  [v4 setGenre:v5];

LABEL_7:
  id v6 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F77430]];
  [v4 setArtist:v6];

  uint64_t v7 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F77418]];
  [v4 setAlbum:v7];

  double v8 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F775F0]];
  [v4 setTitle:v8];

  id v9 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F77630]];
  uint64_t v10 = [v9 longLongValue];

  if ([v2 isEqualToString:*MEMORY[0x1E4F773A8]])
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v11 setScheme:@"x-sampradiotrack"];
    [v11 setHost:@"device"];
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"/%lld", v10);
    [v11 setPath:v12];

    id v13 = [v11 URL];

    [v4 setIdentifier:v13];
  }
  else
  {
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F31928]) initWithPersistentID:v10];
    if (v14)
    {
      uint64_t v15 = (objc_class *)MEMORY[0x1E4F76E40];
      id v13 = v14;
      id v16 = objc_alloc_init(v15);
      uint64_t v17 = [v13 multiverseIdentifier];
      uint64_t v18 = [v17 data];
      uint64_t v19 = [v16 encodeURLData:v18];
      id v20 = objc_alloc_init(MEMORY[0x1E4F29088]);
      uint64_t v21 = [v13 identifierURLScheme];

      [v20 setScheme:v21];
      [v20 setHost:@"multiverse"];
      uint64_t v22 = [NSString stringWithFormat:@"/%@", v19];
      [v20 setPath:v22];

      id v23 = [v20 URL];

      [v4 setIdentifier:v23];
    }
    else
    {
      id v13 = 0;
    }
  }

  return v4;
}

id sub_1D4244D88(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x1E4F96588];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  [v3 setDate:v2];

  id v4 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  id v5 = [v4 name];
  [v3 setTimeZoneId:v5];

  return v3;
}

BOOL sub_1D4244E1C(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
  uint64_t v7 = 0;
  id v3 = [v2 getPropertiesForUserIdentity:v1 error:&v7];

  id v4 = [v3 DSID];
  BOOL v5 = [v4 unsignedLongLongValue]
    && [v3 isActiveLocker]
    && MPCloudControllerGetSagaOnDiskDatabaseRevisionForUserIdentity() == 0;

  return v5;
}

id sub_1D4244ECC(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = NSString;
  id v6 = [v4 substringToIndex:3];
  uint64_t v7 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v4, "length") - 3);
  double v8 = [v5 stringWithFormat:@"%@%@", v6, v7];

  id v9 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v12 = v3;
    __int16 v13 = 2114;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_1D422A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ (gethash) <%{public}@>: ace id: %{public}@", buf, 0x20u);
  }

  return v8;
}

void sub_1D4245018(void *a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  double v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = v5;
    __int16 v22 = 2114;
    id v23 = v6;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_INFO, "%{public}@ (hashedroute) <%{public}@>: encoded route UID table", buf, 0x16u);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        __int16 v15 = _MPLogCategoryAssistant();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543874;
          id v21 = v5;
          __int16 v22 = 2114;
          id v23 = v6;
          __int16 v24 = 2114;
          uint64_t v25 = v14;
          _os_log_impl(&dword_1D422A000, v15, OS_LOG_TYPE_INFO, "%{public}@ (hashedroute) <%{public}@>: id: %{public}@", buf, 0x20u);
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v11);
  }
}

uint64_t sub_1D4245204(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v7;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v1);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * i), "unsignedIntValue", (void)v6))
        {
          uint64_t v2 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

id sub_1D4245304(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ([v1 containsObject:&unk_1F2BFED38])
  {
LABEL_2:
    id v2 = objc_alloc_init(MEMORY[0x1E4F965B8]);
    goto LABEL_23;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v4)
  {
LABEL_20:

    id v15 = objc_alloc(MEMORY[0x1E4F965A8]);
    long long v16 = [NSString stringWithFormat:@"player statuses: %@", v3];
    long long v17 = (void *)[v15 initWithReason:v16];

    goto LABEL_24;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v20;
  long long v7 = (uint64_t *)MEMORY[0x1E4F973A8];
  long long v8 = (uint64_t *)MEMORY[0x1E4F97338];
  long long v9 = (uint64_t *)MEMORY[0x1E4F97368];
  uint64_t v10 = (uint64_t *)MEMORY[0x1E4F97408];
LABEL_5:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v20 != v6) {
      objc_enumerationMutation(v3);
    }
    int v12 = [*(id *)(*((void *)&v19 + 1) + 8 * v11) unsignedIntValue];
    if (v12 > 99) {
      break;
    }
    if (v12 == 1)
    {
      __int16 v13 = v7;
      goto LABEL_17;
    }
    if (v12 == 20)
    {
      __int16 v13 = v8;
      goto LABEL_17;
    }
LABEL_18:
    if (v5 == ++v11)
    {
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v5) {
        goto LABEL_5;
      }
      goto LABEL_20;
    }
  }
  if (v12 != 101)
  {
    if (v12 == 100)
    {
      __int16 v13 = v10;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  __int16 v13 = v9;
LABEL_17:
  uint64_t v14 = *v13;
  if (*v13 == -1) {
    goto LABEL_18;
  }

  if (!v14) {
    goto LABEL_2;
  }
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F965A8]) initWithErrorCode:v14];
LABEL_23:
  long long v17 = v2;
LABEL_24:

  return v17;
}

void sub_1D4245514(void *a1, void *a2, int a3, void *a4, void *a5)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a4;
  id v12 = a5;
  __int16 v13 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
  [v14 setObject:v9 forKeyedSubscript:@"pluginname"];
  id v15 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    long long v16 = (void *)MRMediaRemoteCopyCommandDescription();
    *(_DWORD *)buf = 138543874;
    id v32 = v9;
    __int16 v33 = 2114;
    id v34 = v10;
    __int16 v35 = 2114;
    id v36 = v16;
    _os_log_impl(&dword_1D422A000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ (feedback) <%{public}@>: feedback command %{public}@", buf, 0x20u);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1D4245738;
  v23[3] = &unk_1E69E3180;
  int v30 = a3;
  id v24 = v9;
  id v25 = v10;
  id v26 = v11;
  id v27 = v14;
  id v28 = v13;
  id v29 = v12;
  id v17 = v13;
  id v18 = v14;
  id v19 = v12;
  id v20 = v11;
  id v21 = v10;
  id v22 = v9;
  sub_1D4245738((uint64_t)v23, 0);
}

void sub_1D4245738(uint64_t a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  int v4 = *(_DWORD *)(a1 + 80);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D42458BC;
  v7[3] = &unk_1E69E3158;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  CFTypeRef v14 = cf;
  id v10 = *(id *)(a1 + 48);
  int v15 = *(_DWORD *)(a1 + 80);
  id v13 = *(id *)(a1 + 72);
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  uint64_t v5 = v7;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = sub_1D4245A68;
  id v19 = &unk_1E69E31A8;
  int v21 = v4;
  id v20 = v5;
  uint64_t v6 = v5;
  MRMediaRemoteGetSupportedCommandsForOrigin();
}

void sub_1D42458BC(id *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    id v4 = a1[5];
    *(_DWORD *)buf = 138543618;
    id v12 = v3;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_1D422A000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (feedback) <%{public}@>: getting now playing", buf, 0x16u);
  }

  id v5 = a1[6];
  id v6 = a1[4];
  id v7 = a1[5];
  id v10 = a1[9];
  id v8 = a1[7];
  id v9 = a1[8];
  MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork();
}

uint64_t sub_1D4245A68(uint64_t a1, CFArrayRef theArray)
{
  CFIndex Count = CFArrayGetCount(theArray);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    CFIndex v6 = 0;
    unsigned int v7 = 1;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, v6);
      BOOL v9 = MEMORY[0x1D9444CD0](ValueAtIndex) == *(_DWORD *)(a1 + 40);
      CFIndex v6 = v7++;
    }
    while (!v9 && v5 > v6);
  }
  id v11 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v11();
}

void sub_1D4245B00(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v40 = 0;
  id v4 = [v3 objectForKey:*MEMORY[0x1E4F77530]];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    v38[1] = (id)MEMORY[0x1E4F143A8];
    void v38[2] = (id)3221225472;
    v38[3] = sub_1D4245FB8;
    v38[4] = &unk_1E69E30E0;
    id v39 = v3;
    CFIndex v6 = MPMediaRemoteCommandOptionsForFeedbackOrPurchaseCommandEvent();
    unsigned int v7 = (void *)[v6 mutableCopy];
  }
  else
  {
    unsigned int v7 = 0;
  }
  uint64_t v8 = *MEMORY[0x1E4F97358];
  if (*(unsigned char *)(a1 + 92))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
      v38[0] = 0;
      id v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:v38];
      id v11 = v38[0];
      if (!v11) {
        [v7 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F777E0]];
      }
    }
    [v7 setObject:@"com.apple.MediaAssistant.siri" forKeyedSubscript:*MEMORY[0x1E4F77770]];
    id v12 = objc_alloc_init(MEMORY[0x1E4F76E48]);
    [v12 setOrigin:*(void *)(a1 + 80)];
    id v13 = objc_alloc_init(MEMORY[0x1E4F76E28]);
    id v14 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v42 = v15;
      __int16 v43 = 2114;
      uint64_t v44 = v16;
      __int16 v45 = 2114;
      uint64_t v46 = v7;
      _os_log_impl(&dword_1D422A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ (feedback) <%{public}@>: sending command with options: %{public}@", buf, 0x20u);
    }

    uint64_t v17 = *(unsigned int *)(a1 + 88);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = sub_1D4245FC4;
    v32[3] = &unk_1E69E3108;
    id v33 = v13;
    id v36 = *(id *)(a1 + 72);
    id v34 = *(id *)(a1 + 56);
    uint64_t v37 = v8;
    id v35 = *(id *)(a1 + 64);
    id v18 = v13;
    [v18 sendCommand:v17 toDestination:v12 withOptions:v7 completion:v32];
  }
  else
  {
    if (!*(void *)(a1 + 72)) {
      goto LABEL_17;
    }
    id v19 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      uint64_t v21 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v20;
      __int16 v43 = 2114;
      uint64_t v44 = v21;
      _os_log_impl(&dword_1D422A000, v19, OS_LOG_TYPE_ERROR, "%{public}@ (feedback) <%{public}@>: command not supported", buf, 0x16u);
    }

    [*(id *)(a1 + 56) setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"success"];
    id v22 = [NSNumber numberWithInteger:v8];
    id v23 = [v22 stringValue];
    [*(id *)(a1 + 56) setObject:v23 forKeyedSubscript:@"errorcode"];

    id v24 = NSNumber;
    [*(id *)(a1 + 64) timeIntervalSinceNow];
    id v26 = [v24 numberWithDouble:fabs(v25)];
    [*(id *)(a1 + 56) setObject:v26 forKeyedSubscript:@"duration"];

    uint64_t v27 = *(void *)(a1 + 72);
    id v28 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithErrorCode:v8];
    id v29 = [v28 dictionary];
    (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v29);

    id v31 = *(id *)(a1 + 56);
    AnalyticsSendEventLazy();
    id v12 = v31;
  }

LABEL_17:
  int v30 = *(const void **)(a1 + 80);
  if (v30) {
    CFRelease(v30);
  }
}

uint64_t sub_1D4245FB8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKey:a2];
}

void sub_1D4245FC4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(id *)(a1 + 32);
  if (*(void *)(a1 + 56))
  {
    if (sub_1D4245204(a3))
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F965B8]);
      unsigned int v7 = [v6 dictionary];

      [*(id *)(a1 + 40) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"success"];
    }
    else
    {
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithErrorCode:*(void *)(a1 + 64)];
      unsigned int v7 = [v8 dictionary];

      [*(id *)(a1 + 40) setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"success"];
      uint64_t v9 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
      id v10 = [v9 stringValue];
      [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:@"errorcode"];
    }
    id v11 = NSNumber;
    [*(id *)(a1 + 48) timeIntervalSinceNow];
    id v13 = [v11 numberWithDouble:fabs(v12)];
    [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:@"duration"];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    id v14 = *(id *)(a1 + 40);
    AnalyticsSendEventLazy();
  }
}

id sub_1D4246198(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_1D42461A0(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_1D42461A8()
{
  if (qword_1EA6C8F00 != -1) {
    dispatch_once(&qword_1EA6C8F00, &unk_1F2BFA1E0);
  }
  uint64_t v0 = (void *)qword_1EA6C8F08;

  return v0;
}

uint64_t sub_1D42461FC()
{
  qword_1EA6C8F08 = (uint64_t)dispatch_group_create();

  return MEMORY[0x1F41817F8]();
}

void sub_1D4246230(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (MSVDeviceIsAudioAccessory())
  {
    __int16 v43 = v12;
    id v14 = objc_alloc_init(MEMORY[0x1E4F4E4E8]);
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = sub_1D4246908;
    v50[3] = &unk_1E69E3220;
    id v15 = v14;
    id v51 = v15;
    id v16 = v9;
    id v52 = v16;
    id v42 = v10;
    id v17 = v10;
    id v53 = v17;
    id v40 = v13;
    id v54 = v40;
    id v41 = (void (**)(void, void, void, void))MEMORY[0x1D94452A0](v50);
    id v18 = v16;
    id v19 = v17;
    uint64_t v20 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
    int v21 = [v20 isInternalBuild];

    if (v21)
    {
      CFPreferencesAppSynchronize(@"com.apple.mobileipod");
      id v22 = (void *)CFPreferencesCopyAppValue(@"SiriLibrarySharedUserID", @"com.apple.mobileipod");
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = v22;
        if (v23)
        {
          id v24 = _MPLogCategoryAssistant();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v56 = v18;
            __int16 v57 = 2114;
            id v58 = v19;
            _os_log_impl(&dword_1D422A000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ (utility) <%{public}@>: override library Shared User ID in place", buf, 0x16u);
          }
        }
      }
      else
      {
        id v23 = 0;
      }
    }
    else
    {
      id v23 = 0;
    }

    id v26 = v18;
    id v27 = v19;
    id v28 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
    int v29 = [v28 isInternalBuild];

    if (v29)
    {
      CFPreferencesAppSynchronize(@"com.apple.mobileipod");
      int v30 = (void *)CFPreferencesCopyAppValue(@"SiriRequesterSharedUserID", @"com.apple.mobileipod");
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v31 = v30;
        if (v31)
        {
          id v32 = _MPLogCategoryAssistant();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v56 = v26;
            __int16 v57 = 2114;
            id v58 = v27;
            _os_log_impl(&dword_1D422A000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ (utility) <%{public}@>: override requester Shared User ID in place", buf, 0x16u);
          }
        }
      }
      else
      {
        id v31 = 0;
      }
    }
    else
    {
      id v31 = 0;
    }
    id v12 = v43;

    if (v23)
    {
      if (v31)
      {
LABEL_25:
        if ([v23 length])
        {
          id v33 = _MPLogCategoryAssistant();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543875;
            id v56 = v26;
            __int16 v57 = 2114;
            id v58 = v27;
            __int16 v59 = 2113;
            id v60 = v23;
            _os_log_impl(&dword_1D422A000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ (sharedid) <%{public}@>: library Shared User ID %{private}@", buf, 0x20u);
          }

          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = sub_1D4246A30;
          v44[3] = &unk_1E69E3270;
          id v45 = v26;
          id v46 = v27;
          id v47 = v31;
          id v34 = v41;
          uint64_t v48 = v41;
          id v49 = v40;
          ((void (**)(void, id, uint64_t, void *))v41)[2](v48, v23, 1, v44);

          id v35 = v45;
        }
        else
        {
          uint64_t v36 = [v31 length];
          uint64_t v37 = _MPLogCategoryAssistant();
          BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
          if (v36)
          {
            if (v38)
            {
              id v39 = [MEMORY[0x1E4FB87B8] activeAccount];
              *(_DWORD *)buf = 138543875;
              id v56 = v26;
              __int16 v57 = 2114;
              id v58 = v27;
              __int16 v59 = 2113;
              id v60 = v39;
              _os_log_impl(&dword_1D422A000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ (sharedid) <%{public}@>: using %{private}@ in forced guest mode with forced private listening: YES", buf, 0x20u);
            }
            id v35 = [MEMORY[0x1E4FB87B8] activeAccount];
            (*((void (**)(id, void *, void))v40 + 2))(v40, v35, MEMORY[0x1E4F1CC38]);
            id v12 = v43;
          }
          else
          {
            id v12 = v43;
            if (v38)
            {
              *(_DWORD *)buf = 138543618;
              id v56 = v26;
              __int16 v57 = 2114;
              id v58 = v27;
              _os_log_impl(&dword_1D422A000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ (sharedid) <%{public}@>: using active account with configured private listening", buf, 0x16u);
            }

            id v35 = [MEMORY[0x1E4FB87B8] activeAccount];
            (*((void (**)(id, void *, void))v40 + 2))(v40, v35, 0);
          }
          id v34 = v41;
        }

        id v10 = v42;
        goto LABEL_40;
      }
    }
    else
    {
      id v23 = v43;
      if (v31) {
        goto LABEL_25;
      }
    }
    id v31 = v11;
    goto LABEL_25;
  }
  double v25 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v56 = v9;
    __int16 v57 = 2114;
    id v58 = v10;
    _os_log_impl(&dword_1D422A000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ (sharedid) <%{public}@>: using active account with configured private listening for single user only device", buf, 0x16u);
  }

  id v15 = [MEMORY[0x1E4FB87B8] activeAccount];
  (*((void (**)(id, id, void))v13 + 2))(v13, v15, 0);
LABEL_40:
}

void sub_1D4246908(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1D4246EBC;
  v12[3] = &unk_1E69E31F8;
  id v13 = v9;
  char v19 = a3;
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v18 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  [v13 getHomeUserIdForSharedUserId:v10 completion:v12];
}

void sub_1D4246A30(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543875;
    uint64_t v23 = v5;
    __int16 v24 = 2114;
    uint64_t v25 = v6;
    __int16 v26 = 2113;
    id v27 = v3;
    _os_log_impl(&dword_1D422A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ (sharedid) <%{public}@>: library User Identity %{private}@", buf, 0x20u);
  }

  uint64_t v7 = [*(id *)(a1 + 48) length];
  id v8 = _MPLogCategoryAssistant();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543875;
      uint64_t v23 = v10;
      __int16 v24 = 2114;
      uint64_t v25 = v11;
      __int16 v26 = 2113;
      id v27 = v12;
      _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ (sharedid) <%{public}@>: requester Shared User ID %{private}@", buf, 0x20u);
    }

    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_1D4246CAC;
    v17[3] = &unk_1E69E3248;
    id v18 = *(id *)(a1 + 32);
    id v19 = *(id *)(a1 + 40);
    id v20 = v3;
    id v21 = *(id *)(a1 + 64);
    (*(void (**)(uint64_t, uint64_t, void, void *))(v13 + 16))(v13, v14, 0, v17);
  }
  else
  {
    if (v9)
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543875;
      uint64_t v23 = v15;
      __int16 v24 = 2114;
      uint64_t v25 = v16;
      __int16 v26 = 2113;
      id v27 = v3;
      _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ (sharedid) <%{public}@>: using %{private}@ in guest mode with forced private listening: YES", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void sub_1D4246CAC(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v18 = 138543875;
    uint64_t v19 = v5;
    __int16 v20 = 2114;
    uint64_t v21 = v6;
    __int16 v22 = 2113;
    id v23 = v3;
    _os_log_impl(&dword_1D422A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ (sharedid) <%{public}@>: requester User Identity %{private}@", (uint8_t *)&v18, 0x20u);
  }

  uint64_t v7 = [v3 DSID];
  id v8 = [*(id *)(a1 + 48) DSID];
  int v9 = [v7 isEqualToNumber:v8];

  uint64_t v10 = _MPLogCategoryAssistant();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void **)(a1 + 48);
      int v18 = 138543875;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      uint64_t v21 = v13;
      __int16 v22 = 2113;
      id v23 = v14;
      _os_log_impl(&dword_1D422A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ (sharedid) <%{public}@>: using %{private}@ and not enforcing private listening override because requester and library match", (uint8_t *)&v18, 0x20u);
    }
  }
  else if (v11)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    id v17 = *(void **)(a1 + 48);
    int v18 = 138543875;
    uint64_t v19 = v15;
    __int16 v20 = 2114;
    uint64_t v21 = v16;
    __int16 v22 = 2113;
    id v23 = v17;
    _os_log_impl(&dword_1D422A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ (sharedid) <%{public}@>: using %{private}@ in cross-user mode with forced private listening: YES", (uint8_t *)&v18, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_1D4246EBC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138544131;
      uint64_t v24 = v8;
      __int16 v25 = 2114;
      uint64_t v26 = v9;
      __int16 v27 = 2113;
      uint64_t v28 = v10;
      __int16 v29 = 2114;
      id v30 = v6;
      _os_log_impl(&dword_1D422A000, v7, OS_LOG_TYPE_ERROR, "%{public}@ (sharedid) <%{public}@>: shared ID %{private}@ not available: %{public}@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    BOOL v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F179C8], "ic_sharedAccountStore");
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1D42470EC;
    v14[3] = &unk_1E69E31D0;
    id v15 = *(id *)(a1 + 32);
    char v22 = *(unsigned char *)(a1 + 80);
    id v16 = *(id *)(a1 + 40);
    id v17 = *(id *)(a1 + 48);
    id v18 = v5;
    id v20 = *(id *)(a1 + 64);
    id v21 = *(id *)(a1 + 72);
    id v19 = v11;
    id v13 = v11;
    objc_msgSend(v12, "ic_storeAccountForHomeUserIdentifier:completion:", v13, v14);
  }
}

void sub_1D42470EC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  if (v6)
  {
    uint64_t v8 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = *(void *)(a1 + 56);
      int v35 = 138544131;
      uint64_t v36 = v9;
      __int16 v37 = 2114;
      uint64_t v38 = v10;
      __int16 v39 = 2113;
      uint64_t v40 = v11;
      __int16 v41 = 2114;
      id v42 = v6;
      uint64_t v12 = "%{public}@ (sharedid) <%{public}@>: home ID %{private}@ not found in database: %{public}@";
      id v13 = v8;
      uint32_t v14 = 42;
LABEL_4:
      _os_log_impl(&dword_1D422A000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v35, v14);
      goto LABEL_5;
    }
    goto LABEL_5;
  }
  id v16 = objc_msgSend(v5, "ic_DSID");
  uint64_t v17 = [v16 longLongValue];

  if (!v17)
  {
    int v27 = *(unsigned __int8 *)(a1 + 88);
    uint64_t v28 = _MPLogCategoryAssistant();
    uint64_t v8 = v28;
    if (!v27)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = *(void *)(a1 + 40);
        uint64_t v33 = *(void *)(a1 + 48);
        uint64_t v34 = *(void *)(a1 + 56);
        int v35 = 138543875;
        uint64_t v36 = v32;
        __int16 v37 = 2114;
        uint64_t v38 = v33;
        __int16 v39 = 2113;
        uint64_t v40 = v34;
        _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ (sharedid) <%{public}@>: no DSID for home ID: %{private}@, but it is NOT required", (uint8_t *)&v35, 0x20u);
      }

      id v15 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
      goto LABEL_6;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = *(void *)(a1 + 40);
      uint64_t v30 = *(void *)(a1 + 48);
      uint64_t v31 = *(void *)(a1 + 56);
      int v35 = 138543875;
      uint64_t v36 = v29;
      __int16 v37 = 2114;
      uint64_t v38 = v30;
      __int16 v39 = 2113;
      uint64_t v40 = v31;
      uint64_t v12 = "%{public}@ (sharedid) <%{public}@>: no DSID for home ID: %{private}@";
      id v13 = v8;
      uint32_t v14 = 32;
      goto LABEL_4;
    }
LABEL_5:

    id v15 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
LABEL_6:
    v15();
    goto LABEL_13;
  }
  id v18 = objc_msgSend(v5, "ic_privateListeningEnabledForHomeUsers");
  id v19 = [v18 objectForKey:*(void *)(a1 + 64)];

  if ([MEMORY[0x1E4F318B8] isCurrentDeviceValidHomeAccessory])
  {
    id v20 = [MEMORY[0x1E4F318C8] userMonitorWithHomeIdentifier:*(void *)(a1 + 64)];
    id v21 = v20;
    if (v20)
    {
      uint64_t v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v20, "isPrivateListeningEnabledForCurrentAccessory"));

      id v19 = (void *)v22;
    }
  }
  uint64_t v23 = *(void *)(a1 + 80);
  uint64_t v24 = (void *)MEMORY[0x1E4FB87B8];
  __int16 v25 = objc_msgSend(v5, "ic_DSID");
  uint64_t v26 = [v24 specificAccountWithDSID:v25];
  (*(void (**)(uint64_t, void *, void *))(v23 + 16))(v23, v26, v19);

LABEL_13:
}

void sub_1D4247404(void *a1, void *a2, int a3, void *a4, void *a5)
{
  uint64_t v267 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a2;
  id v132 = a1;
  v130 = v9;
  v131 = v8;
  v129 = v10;
  if (!_os_feature_enabled_impl())
  {
    id v86 = v132;
    id v87 = v10;
    uint64_t v88 = v8;
    id v89 = v87;
    id v90 = v9;
    id v154 = v88;
    uint64_t v91 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v92 = [MEMORY[0x1E4F1CA60] dictionary];
    [v92 setObject:v86 forKeyedSubscript:@"plugin_name"];
    uint64_t v207 = 0;
    uint64_t v208 = (uint64_t)&v207;
    uint64_t v209 = 0x3010000000;
    id v212 = 0;
    v210 = &unk_1D426947B;
    id v211 = 0;
    v93 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v86;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v89;
      _os_log_impl(&dword_1D422A000, v93, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: getting dynamite client state using ACAccount", buf, 0x16u);
    }

    dispatch_queue_t v156 = dispatch_queue_create("com.apple.Assistant.MPAssistantUtilitiesGetDynamiteClientState", 0);
    v94 = dispatch_group_create();
    id v95 = objc_alloc_init(MEMORY[0x1E4F96628]);
    uint64_t block = 0;
    p_uint64_t block = (uint64_t)&block;
    uint64_t v199 = 0x3032000000;
    v200 = sub_1D4248E7C;
    v201 = sub_1D4248E8C;
    v202 = 0;
    *(void *)&long long v218 = 0;
    *((void *)&v218 + 1) = &v218;
    *(void *)&long long v219 = 0x3032000000;
    *((void *)&v219 + 1) = sub_1D4248E7C;
    *(void *)&long long v220 = sub_1D4248E8C;
    *((void *)&v220 + 1) = [MEMORY[0x1E4F1CA60] dictionary];
    *(void *)&long long v175 = 0;
    *((void *)&v175 + 1) = &v175;
    *(void *)&long long v176 = 0x2810000000;
    *((void *)&v176 + 1) = &unk_1D426947B;
    LODWORD(v177) = 0;
    if (MSVDeviceIsAudioAccessory()) {
      goto LABEL_61;
    }
    uint64_t v96 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v86;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v89;
      _os_log_impl(&dword_1D422A000, v96, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: getting stored WLK configuration", buf, 0x16u);
    }

    uint64_t v236 = 0;
    uint64_t v237 = (uint64_t)&v236;
    uint64_t v238 = 0x2050000000;
    id v97 = (void *)qword_1EBD857F8;
    v239 = (void *)qword_1EBD857F8;
    if (!qword_1EBD857F8)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_1D4248E94;
      v253 = &unk_1E69E35D8;
      *(void *)&long long v254 = &v236;
      sub_1D4248E94((uint64_t)buf);
      id v97 = *(void **)(v237 + 24);
    }
    id v98 = v97;
    _Block_object_dispose(&v236, 8);
    int v99 = [v98 sharedInstance];
    uint64_t v100 = [v99 storedConfiguration];

    if (v100)
    {
      objc_msgSend(v95, "setActiveTvUser:", objc_msgSend(v100, "activeUser"));
      v101 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
      {
        int v102 = [v100 activeUser];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v86;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v89;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v253) = v102;
        _os_log_impl(&dword_1D422A000, v101, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: active TV user: %{BOOL}u", buf, 0x1Cu);
      }
    }
    else
    {
      uint64_t v236 = 0;
      uint64_t v237 = (uint64_t)&v236;
      uint64_t v238 = 0x2050000000;
      uint64_t v103 = (void *)qword_1EA6C8F10;
      v239 = (void *)qword_1EA6C8F10;
      if (!qword_1EA6C8F10)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_1D4248F5C;
        v253 = &unk_1E69E35D8;
        *(void *)&long long v254 = &v236;
        sub_1D4248F5C((uint64_t)buf);
        uint64_t v103 = *(void **)(v237 + 24);
      }
      id v104 = v103;
      _Block_object_dispose(&v236, 8);
      if (!v104) {
        goto LABEL_60;
      }
      dispatch_group_enter(v94);
      int v105 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v86;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v89;
        _os_log_impl(&dword_1D422A000, v105, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: getting WLK configuration", buf, 0x16u);
      }

      char v106 = [v104 sharedInstance];
      uint64_t v158 = MEMORY[0x1E4F143A8];
      uint64_t v159 = 3221225472;
      v160 = (void (*)(uint64_t *, void, uint64_t))sub_1D4249024;
      v161 = &unk_1E69E3338;
      v162 = v156;
      id v163 = v95;
      v164 = v86;
      id v165 = v89;
      v166 = v94;
      [v106 fetchConfigurationWithCompletionHandler:&v158];

      v101 = v162;
    }

LABEL_60:
LABEL_61:
    long long v107 = v90;
    id v108 = v92;
    uint64_t v222 = 0;
    v223 = &v222;
    uint64_t v224 = 0x2020000000;
    LODWORD(v225) = 0;
    uint64_t v191 = 0;
    v192 = &v191;
    uint64_t v193 = 0x2020000000;
    LODWORD(v194) = 0;
    long long v109 = [MEMORY[0x1E4F1CA48] array];
    dispatch_group_enter(v94);
    id v110 = objc_msgSend(MEMORY[0x1E4F179C8], "ic_sharedAccountStore");
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1D4249104;
    v253 = &unk_1E69E33D0;
    dispatch_queue_t queuea = v107;
    *(void *)&long long v254 = queuea;
    id v111 = v86;
    *((void *)&v254 + 1) = v111;
    id v112 = v89;
    id v255 = v112;
    long long v113 = v94;
    v256 = v113;
    char v266 = a3;
    long long v114 = v156;
    v257 = v114;
    v260 = &v175;
    v261 = &v218;
    id v115 = v95;
    id v258 = v115;
    v262 = &v191;
    id v116 = v109;
    id v259 = v116;
    v263 = &v222;
    v264 = &block;
    v265 = &v207;
    objc_msgSend(v110, "ic_allStoreAccountsWithCompletion:", buf);

    __int16 v117 = v108;
    uint64_t v236 = MEMORY[0x1E4F143A8];
    uint64_t v237 = 3221225472;
    uint64_t v238 = (uint64_t)sub_1D424A528;
    v239 = &unk_1E69E33F8;
    id v240 = v111;
    id v241 = v112;
    id v242 = v115;
    id v243 = v116;
    v247 = &block;
    id v246 = v154;
    id v244 = v108;
    id v245 = v91;
    v248 = &v218;
    v249 = &v207;
    v250 = &v222;
    v251 = &v191;
    id v118 = v91;
    id v119 = v117;
    id v157 = v154;
    id v120 = v116;
    id v121 = v115;
    id v122 = v112;
    id v123 = v111;
    dispatch_group_notify(v113, v114, &v236);

    _Block_object_dispose(&v191, 8);
    _Block_object_dispose(&v222, 8);
    _Block_object_dispose(&v175, 8);
    _Block_object_dispose(&v218, 8);

    _Block_object_dispose(&block, 8);
    _Block_object_dispose(&v207, 8);

    goto LABEL_62;
  }
  id v149 = v132;
  v148 = v10;
  id v11 = v9;
  id v126 = v8;
  v125 = [MEMORY[0x1E4F1C9C8] date];
  v128 = [MEMORY[0x1E4F1CA60] dictionary];
  [v128 setObject:v149 forKeyedSubscript:@"plugin_name"];
  uint64_t v191 = 0;
  v192 = &v191;
  uint64_t v193 = 0x3010000000;
  uint64_t v196 = 0;
  v194 = &unk_1D426947B;
  uint64_t v195 = 0;
  uint64_t v12 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v149;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v148;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v253) = a3;
    _os_log_impl(&dword_1D422A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: getting dynamite client state using media user state, syncing: %d", buf, 0x1Cu);
  }

  dispatch_queue_t v142 = dispatch_queue_create("com.apple.Assistant.MPAssistantUtilitiesGetDynamiteClientState", 0);
  group = dispatch_group_create();
  id v140 = objc_alloc_init(MEMORY[0x1E4F96628]);
  v189[0] = 0;
  v189[1] = v189;
  v189[2] = 0x3032000000;
  v189[3] = sub_1D4248E7C;
  v189[4] = sub_1D4248E8C;
  id v190 = 0;
  v187[0] = 0;
  v187[1] = v187;
  v187[2] = 0x3032000000;
  v187[3] = sub_1D4248E7C;
  v187[4] = sub_1D4248E8C;
  id v188 = [MEMORY[0x1E4F1CA60] dictionary];
  v185[0] = 0;
  v185[1] = v185;
  v185[2] = 0x2810000000;
  v185[3] = &unk_1D426947B;
  int v186 = 0;
  id v13 = [MEMORY[0x1E4FB8650] shared];
  v127 = [v13 allUserStates];

  v183[0] = MEMORY[0x1E4F143A8];
  v183[1] = 3221225472;
  v183[2] = sub_1D424CBF4;
  v183[3] = &unk_1E69E3298;
  id v124 = v11;
  id v184 = v124;
  v145 = objc_msgSend(v127, "msv_firstWhere:", v183);
  uint32_t v14 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v145 debugDescription];
    *(_DWORD *)buf = 138543875;
    *(void *)&uint8_t buf[4] = v149;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v148;
    *(_WORD *)&buf[22] = 2113;
    v253 = v15;
    _os_log_impl(&dword_1D422A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: found prefferedMediaUserStateCandidate=%{private}@", buf, 0x20u);
  }
  v181[0] = 0;
  v181[1] = v181;
  v181[2] = 0x2020000000;
  int v182 = 0;
  v179[0] = 0;
  v179[1] = v179;
  v179[2] = 0x2020000000;
  int v180 = 0;
  v139 = [MEMORY[0x1E4F1CA48] array];
  long long v177 = 0u;
  long long v178 = 0u;
  long long v175 = 0u;
  long long v176 = 0u;
  id v16 = [MEMORY[0x1E4FB8650] shared];
  id obj = [v16 allUserStates];

  uint64_t v144 = [obj countByEnumeratingWithState:&v175 objects:&v236 count:16];
  if (v144)
  {
    uint64_t v138 = *(void *)v176;
    uint64_t v137 = *MEMORY[0x1E4F96C98];
    uint64_t v136 = *MEMORY[0x1E4F96CA0];
    uint64_t v134 = *MEMORY[0x1E4F971E8];
    uint64_t v135 = *MEMORY[0x1E4F971E0];
    do
    {
      for (uint64_t i = 0; i != v144; ++i)
      {
        if (*(void *)v176 != v138) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v175 + 1) + 8 * i);
        char v18 = [v17 isEqual:v145];
        char v19 = v18;
        if (v145) {
          char v20 = 1;
        }
        else {
          char v20 = v18;
        }
        if ((v20 & 1) == 0) {
          char v19 = [v17 isActive];
        }
        dispatch_group_enter(group);
        uint64_t v158 = MEMORY[0x1E4F143A8];
        uint64_t v159 = 3221225472;
        v160 = (void (*)(uint64_t *, void, uint64_t))sub_1D424CC38;
        v161 = &unk_1E69E32E8;
        v162 = v142;
        char v173 = v19;
        id v21 = v149;
        id v163 = v21;
        uint64_t v22 = v148;
        v164 = v22;
        id v165 = v17;
        v169 = v185;
        v170 = v187;
        uint64_t v23 = v140;
        char v174 = a3;
        v166 = v23;
        v171 = v179;
        id v167 = v139;
        v172 = v181;
        v168 = group;
        id v155 = v21;
        v153 = v22;
        id v24 = v17;
        v146 = &v158;
        __int16 v25 = _MPLogCategoryAssistant();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = [v24 shortDebugName];
          *(_DWORD *)buf = 138543875;
          *(void *)&uint8_t buf[4] = v149;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v148;
          *(_WORD *)&buf[22] = 2113;
          v253 = v26;
          _os_log_impl(&dword_1D422A000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: getting user state for %{private}@", buf, 0x20u);
        }
        uint64_t v222 = 0;
        v223 = &v222;
        uint64_t v224 = 0x3032000000;
        v225 = sub_1D4248E7C;
        v226 = sub_1D4248E8C;
        int v27 = (objc_class *)MEMORY[0x1E4F96BB8];
        id v28 = v24;
        id v29 = objc_alloc_init(v27);
        objc_msgSend(v29, "setAgeVerificationRequired:", objc_msgSend(v28, "ageVerificationRequired"));
        uint64_t v30 = NSNumber;
        uint64_t v31 = [v28 music];
        uint64_t v32 = objc_msgSend(v30, "numberWithInt:", objc_msgSend(v31, "usesListeningHistory") ^ 1);
        [v29 setUserHistoryUnmodifiable:v32];

        uint64_t v33 = [v28 music];
        uint64_t v34 = [v33 subscriptionStatus];
        BOOL v35 = (~(unsigned __int16)[v34 capabilities] & 0x101) == 0;

        if (v35) {
          uint64_t v36 = v137;
        }
        else {
          uint64_t v36 = v136;
        }
        [v29 setStatus:v36];
        [v29 setIsPromotionRelatedStatus:0];
        __int16 v37 = [v28 music];
        uint64_t v38 = [v37 subscriptionStatus];
        __int16 v39 = [v38 eligibleOffers];
        [v29 setEligibleOffers:v39];

        uint64_t v40 = [v28 music];
        __int16 v41 = [v40 subscriptionStatus];
        if ([v41 isMatchEnabled]) {
          uint64_t v42 = v135;
        }
        else {
          uint64_t v42 = v134;
        }
        [v29 setITunesMatchSubscriptionStatus:v42];

        id v43 = objc_alloc_init(MEMORY[0x1E4F96BC0]);
        uint64_t v44 = NSNumber;
        id v45 = [v28 music];
        id v46 = [v45 libraryAuthTokenStatus];
        id v47 = [v46 lastError];
        uint64_t v48 = objc_msgSend(v44, "numberWithInteger:", objc_msgSend(v47, "code"));
        [v43 setErrorCode:v48];

        id v49 = NSNumber;
        int v50 = [v28 music];
        id v51 = [v50 libraryAuthTokenStatus];
        id v52 = [v51 lastUpdatedDate];
        [v52 timeIntervalSinceReferenceDate];
        id v53 = objc_msgSend(v49, "numberWithDouble:");
        [v43 setLastUpdateAttemptTime:v53];

        id v54 = NSNumber;
        id v55 = [v28 music];

        id v56 = [v55 libraryAuthTokenStatus];
        __int16 v57 = objc_msgSend(v54, "numberWithBool:", objc_msgSend(v56, "shouldExcludeFromBackgroundRefresh"));
        [v43 setShouldExcludeFromBackgroundRefresh:v57];

        [v29 setUserTokenStatus:v43];
        id v227 = v29;
        id v58 = [v28 homeUserIDs];
        LOBYTE(v43) = [v58 count] == 0;

        if (v43)
        {
          uint64_t v77 = _MPLogCategoryAssistant();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v78 = [v28 shortDebugName];
            *(_DWORD *)buf = 138543875;
            *(void *)&uint8_t buf[4] = v149;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v148;
            *(_WORD *)&buf[22] = 2113;
            v253 = v78;
            _os_log_impl(&dword_1D422A000, v77, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: user does not have any home IDs for %{private}@", buf, 0x20u);
          }
          v160(v146, 0, v223[5]);
        }
        else
        {
          __int16 v59 = _MPLogCategoryAssistant();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            id v60 = [v28 shortDebugName];
            uint64_t v61 = NSNumber;
            uint64_t v62 = [v28 homeUserIDs];
            uint64_t v63 = objc_msgSend(v61, "numberWithUnsignedInteger:", objc_msgSend(v62, "count"));
            *(_DWORD *)buf = 138544131;
            *(void *)&uint8_t buf[4] = v149;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v148;
            *(_WORD *)&buf[22] = 2113;
            v253 = v60;
            LOWORD(v254) = 2114;
            *(void *)((char *)&v254 + 2) = v63;
            _os_log_impl(&dword_1D422A000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: media user state %{private}@ has %{public}@ homeUserIDs", buf, 0x2Au);
          }
          queue = dispatch_queue_create("com.apple.Assistant.MPAssistantGetDynamiteClientState.userState", 0);
          uint64_t v64 = [MEMORY[0x1E4F1CA60] dictionary];
          id v65 = objc_alloc_init((Class)sub_1D422B58C());
          long long v66 = dispatch_group_create();
          long long v218 = 0u;
          long long v219 = 0u;
          long long v220 = 0u;
          long long v221 = 0u;
          uint64_t v67 = [v28 homeUserIDs];
          uint64_t v68 = [v67 countByEnumeratingWithState:&v218 objects:buf count:16];
          if (v68)
          {
            uint64_t v69 = *(void *)v219;
            id v150 = v67;
            do
            {
              for (uint64_t j = 0; j != v68; ++j)
              {
                if (*(void *)v219 != v69) {
                  objc_enumerationMutation(v150);
                }
                uint64_t v71 = *(void *)(*((void *)&v218 + 1) + 8 * j);
                dispatch_group_enter(v66);
                id v72 = _MPLogCategoryAssistant();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                {
                  id v73 = v28;
                  uint64_t v74 = [v28 shortDebugName];
                  *(_DWORD *)v228 = 138544131;
                  id v229 = v149;
                  __int16 v230 = 2114;
                  v231 = v148;
                  __int16 v232 = 2113;
                  uint64_t v233 = v71;
                  __int16 v234 = 2113;
                  v235 = v74;
                  _os_log_impl(&dword_1D422A000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: fetching shared user id for home user id %{private}@ for %{private}@", v228, 0x2Au);

                  id v28 = v73;
                }

                uint64_t v207 = MEMORY[0x1E4F143A8];
                uint64_t v208 = 3221225472;
                uint64_t v209 = (uint64_t)sub_1D424D0B0;
                v210 = &unk_1E69E3448;
                id v75 = v65;
                id v211 = v75;
                id v212 = v155;
                v213 = v153;
                id v214 = v28;
                v215 = v66;
                v216 = queue;
                id v217 = v64;
                [v75 getConformingSharedUserIdForHomeUserId:v71 completion:&v207];
              }
              uint64_t v67 = v150;
              uint64_t v68 = [v150 countByEnumeratingWithState:&v218 objects:buf count:16];
            }
            while (v68);
          }

          uint64_t block = MEMORY[0x1E4F143A8];
          p_uint64_t block = 3221225472;
          uint64_t v199 = (uint64_t)sub_1D424D308;
          v200 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E69E3470;
          v201 = (void (*)(uint64_t))v155;
          v202 = v153;
          id v203 = v28;
          v205 = v146;
          id v204 = v64;
          v206 = &v222;
          id v76 = v64;
          dispatch_group_notify(v66, queue, &block);
        }
        _Block_object_dispose(&v222, 8);
      }
      uint64_t v144 = [obj countByEnumeratingWithState:&v175 objects:&v236 count:16];
    }
    while (v144);
  }

  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = sub_1D424CD78;
  v253 = &unk_1E69E33F8;
  *(void *)&long long v254 = v140;
  *((void *)&v254 + 1) = v139;
  id v255 = v149;
  v256 = v148;
  v260 = (long long *)v189;
  id v259 = v126;
  v257 = v128;
  id v258 = v125;
  v261 = (long long *)v187;
  v262 = &v191;
  v263 = v181;
  v264 = v179;
  id v79 = v125;
  uint64_t v80 = v128;
  id v81 = v126;
  uint64_t v82 = v148;
  id v83 = v149;
  id v84 = v139;
  id v85 = v140;
  dispatch_group_notify(group, v142, buf);

  _Block_object_dispose(v179, 8);
  _Block_object_dispose(v181, 8);

  _Block_object_dispose(v185, 8);
  _Block_object_dispose(v187, 8);

  _Block_object_dispose(v189, 8);
  _Block_object_dispose(&v191, 8);

LABEL_62:
}

void sub_1D4248D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&STACK[0x480], 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&STACK[0x3E0], 8);
  _Block_object_dispose(&STACK[0x338], 8);
  _Block_object_dispose(&STACK[0x388], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D4248E7C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1D4248E8C(uint64_t a1)
{
}

void sub_1D4248E94(uint64_t a1)
{
  sub_1D424CA30();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("WLKStoredConfigurationManager");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1EBD857F8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getWLKStoredConfigurationManagerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MPAssistantUtilities.m", 49, @"Unable to find class %s", "WLKStoredConfigurationManager");

    __break(1u);
  }
}

void sub_1D4248F5C(uint64_t a1)
{
  sub_1D424CA30();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("WLKConfigurationManager");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1EA6C8F10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getWLKConfigurationManagerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MPAssistantUtilities.m", 47, @"Unable to find class %s", "WLKConfigurationManager");

    __break(1u);
  }
}

void sub_1D4249024(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1D424C94C;
  v6[3] = &unk_1E69E3310;
  id v4 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v5 = v3;
  dispatch_sync(v4, v6);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void sub_1D4249104(uint64_t a1, void *a2, void *a3)
{
  uint64_t v232 = *MEMORY[0x1E4F143B8];
  id v79 = a2;
  id v80 = a3;
  id v95 = objc_msgSend(v79, "msv_filter:", &unk_1F2BFA200);
  if (*(void *)(a1 + 32))
  {
    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    id obj = v95;
    uint64_t v103 = [obj countByEnumeratingWithState:&v132 objects:v217 count:16];
    if (v103)
    {
      id v99 = *(id *)v133;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(id *)v133 != v99)
          {
            uint64_t v5 = v4;
            objc_enumerationMutation(obj);
            uint64_t v4 = v5;
          }
          uint64_t v104 = v4;
          id v6 = *(void **)(*((void *)&v132 + 1) + 8 * v4);
          id v7 = objc_msgSend(v6, "ic_homeUserIdentifiers");
          if ((objc_msgSend(v6, "ams_isLocalAccount") & 1) != 0 || !objc_msgSend(v7, "count")) {
            goto LABEL_23;
          }
          long long v130 = 0u;
          long long v131 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          id v8 = v7;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v128 objects:v216 count:16];
          if (!v9)
          {

LABEL_23:
            goto LABEL_24;
          }
          id v97 = 0;
          uint64_t v10 = *(void *)v129;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v129 != v10) {
                objc_enumerationMutation(v8);
              }
              uint64_t v12 = [*(id *)(*((void *)&v128 + 1) + 8 * i) UUIDString];
              int v13 = [v12 isEqual:*(void *)(a1 + 32)];

              if (v13)
              {
                uint32_t v14 = _MPLogCategoryAssistant();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                {
                  id v16 = *(void **)(a1 + 40);
                  id v15 = *(void **)(a1 + 48);
                  uint64_t v17 = *(void **)(a1 + 32);
                  *(_DWORD *)buf = 138543875;
                  id v227 = v16;
                  __int16 v228 = 2114;
                  id v229 = v15;
                  __int16 v230 = 2113;
                  v231 = v17;
                  _os_log_impl(&dword_1D422A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ (preferredMediaUserHomeUserID) <%{public}@>: found preferredMediaUser's account with home ID: %{private}@", buf, 0x20u);
                }

                id v18 = v6;
                id v97 = v18;
              }
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v128 objects:v216 count:16];
          }
          while (v9);

          if (v97) {
            goto LABEL_27;
          }
LABEL_24:
          uint64_t v4 = v104 + 1;
        }
        while (v104 + 1 != v103);
        uint64_t v103 = [obj countByEnumeratingWithState:&v132 objects:v217 count:16];
      }
      while (v103);
    }
    id v97 = 0;
LABEL_27:
  }
  else
  {
    id v97 = 0;
  }
  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  id v82 = v95;
  uint64_t v88 = [v82 countByEnumeratingWithState:&v124 objects:v215 count:16];
  if (v88)
  {
    uint64_t v87 = *(void *)v125;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v125 != v87)
        {
          uint64_t v20 = v19;
          objc_enumerationMutation(v82);
          uint64_t v19 = v20;
        }
        uint64_t v94 = v19;
        id v21 = *(void **)(*((void *)&v124 + 1) + 8 * v19);
        if (objc_msgSend(v21, "ams_isLocalAccount"))
        {
          uint64_t v22 = _MPLogCategoryAssistant();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = *(void **)(a1 + 40);
            id v24 = *(void **)(a1 + 48);
            *(_DWORD *)buf = 138543618;
            id v227 = v23;
            __int16 v228 = 2114;
            id v229 = v24;
            _os_log_impl(&dword_1D422A000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: skipping local account", buf, 0x16u);
          }
        }
        else
        {
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
          uint64_t v26 = *(void **)(a1 + 40);
          __int16 v25 = *(void **)(a1 + 48);
          int v27 = *(unsigned __int8 *)(a1 + 136);
          v108[0] = MEMORY[0x1E4F143A8];
          v108[1] = 3221225472;
          long long v109 = sub_1D424A85C;
          id v110 = &unk_1E69E33A8;
          id v111 = *(id *)(a1 + 64);
          id v112 = v21;
          id v113 = v97;
          id v114 = *(id *)(a1 + 40);
          id v115 = *(id *)(a1 + 48);
          long long v119 = *(_OWORD *)(a1 + 88);
          id v28 = *(id *)(a1 + 72);
          char v123 = *(unsigned char *)(a1 + 136);
          uint64_t v29 = *(void *)(a1 + 104);
          id v116 = v28;
          uint64_t v120 = v29;
          id v117 = *(id *)(a1 + 80);
          long long v121 = *(_OWORD *)(a1 + 112);
          uint64_t v122 = *(void *)(a1 + 128);
          id v118 = *(id *)(a1 + 56);
          id v92 = v26;
          id v93 = v25;
          id v96 = v21;
          id v90 = v108;
          uint64_t v209 = 0;
          v210 = (float *)&v209;
          uint64_t v211 = 0x3010000000;
          id v212 = &unk_1D426947B;
          uint64_t v213 = 0;
          uint64_t v214 = 0;
          id v105 = objc_alloc_init((Class)sub_1D422B58C());
          uint64_t v30 = _MPLogCategoryAssistant();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v31 = [v96 shortDebugName];
            *(_DWORD *)buf = 138543875;
            id v227 = v92;
            __int16 v228 = 2114;
            id v229 = v93;
            __int16 v230 = 2113;
            v231 = v31;
            _os_log_impl(&dword_1D422A000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: getting user state for %{private}@", buf, 0x20u);
          }
          id v89 = objc_alloc_init(MEMORY[0x1E4F96BB8]);
          v207[0] = 0;
          v207[1] = v207;
          v207[2] = 0x2810000000;
          v207[3] = &unk_1D426947B;
          int v208 = 0;
          v205[0] = 0;
          v205[1] = v205;
          v205[2] = 0x3032000000;
          v205[3] = sub_1D4248E7C;
          v205[4] = sub_1D4248E8C;
          id v206 = 0;
          uint64_t v32 = objc_msgSend(v96, "ic_DSID");
          BOOL v33 = [v32 longLongValue] == 0;

          if (v33)
          {
            uint64_t v61 = _MPLogCategoryAssistant();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            {
              uint64_t v62 = [v96 shortDebugName];
              *(_DWORD *)buf = 138543875;
              id v227 = v92;
              __int16 v228 = 2114;
              id v229 = v93;
              __int16 v230 = 2113;
              v231 = v62;
              _os_log_impl(&dword_1D422A000, v61, OS_LOG_TYPE_ERROR, "%{public}@ (userstate) <%{public}@>: no DSID found in account for %{private}@", buf, 0x20u);
            }
            v109((uint64_t)v90, 0, 0, 0, 0, 0, v210[8], v210[9], v210[10], v210[11]);
          }
          else
          {
            uint64_t v34 = (void *)MEMORY[0x1E4FB87B8];
            BOOL v35 = objc_msgSend(v96, "ic_DSID");
            group = [v34 specificAccountWithDSID:v35];

            uint64_t v36 = dispatch_group_create();
            __int16 v37 = [MEMORY[0x1E4F1C9C8] date];
            dispatch_group_enter(v36);
            uint64_t v38 = [MEMORY[0x1E4FB8598] defaultManager];
            v196[0] = MEMORY[0x1E4F143A8];
            v196[1] = 3221225472;
            v196[2] = sub_1D424AA38;
            v196[3] = &unk_1E69E3498;
            id v39 = v92;
            id v197 = v39;
            id v40 = v93;
            id v198 = v40;
            id v41 = v96;
            id v199 = v41;
            id v203 = v207;
            id v42 = v89;
            id v200 = v42;
            id v204 = &v209;
            id v43 = v37;
            id v201 = v43;
            uint64_t v44 = v36;
            v202 = v44;
            [v38 getAgeVerificationStateWithCompletion:v196];

            dispatch_group_enter(v44);
            v194[0] = 0;
            v194[1] = v194;
            v194[2] = 0x3032000000;
            v194[3] = sub_1D4248E7C;
            v194[4] = sub_1D4248E8C;
            id v195 = 0;
            id v45 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
            v184[0] = MEMORY[0x1E4F143A8];
            v184[1] = 3221225472;
            v184[2] = sub_1D424ABA8;
            v184[3] = &unk_1E69E34C0;
            id v46 = v39;
            id v185 = v46;
            id v47 = v40;
            id v186 = v47;
            id v48 = v41;
            id v187 = v48;
            uint64_t v191 = v207;
            id v100 = v42;
            id v188 = v100;
            v192 = v194;
            uint64_t v193 = &v209;
            id v49 = v43;
            id v189 = v49;
            int v50 = v44;
            id v190 = v50;
            [v45 getPropertiesForUserIdentity:group completionHandler:v184];

            id v51 = _MPLogCategoryAssistant();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              id v52 = [v48 shortDebugName];
              *(_DWORD *)buf = 138543875;
              id v227 = v46;
              __int16 v228 = 2114;
              id v229 = v47;
              __int16 v230 = 2113;
              v231 = v52;
              _os_log_impl(&dword_1D422A000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: fetching subscription status for %{private}@", buf, 0x20u);
            }
            dispatch_group_enter(v50);
            id v53 = objc_alloc(MEMORY[0x1E4FB8758]);
            v182[0] = MEMORY[0x1E4F143A8];
            v182[1] = 3221225472;
            v182[2] = sub_1D424ADAC;
            v182[3] = &unk_1E69E34E8;
            id v85 = group;
            id v183 = v85;
            id v54 = (void *)[v53 initWithBlock:v182];
            uint64_t v91 = (void *)[objc_alloc(MEMORY[0x1E4FB86B0]) initWithStoreRequestContext:v54];
            [v91 setAllowsFallbackToExpiredStatus:1];
            [v91 setAllowsFallbackToStatusNeedingReload:1];
            id v55 = [MEMORY[0x1E4FB86A0] sharedStatusController];
            v171[0] = MEMORY[0x1E4F143A8];
            v171[1] = 3221225472;
            v171[2] = sub_1D424AE20;
            v171[3] = &unk_1E69E3538;
            id v56 = v46;
            id v172 = v56;
            id v57 = v47;
            id v173 = v57;
            id v58 = v48;
            id v174 = v58;
            id v83 = v54;
            id v175 = v83;
            v179 = v207;
            int v180 = v205;
            id v86 = v100;
            id v176 = v86;
            v181 = &v209;
            id v84 = v49;
            id v177 = v84;
            groupa = v50;
            long long v178 = groupa;
            [v55 performSubscriptionStatusRequest:v91 withCompletionHandler:v171];

            if (v27)
            {
              __int16 v59 = _MPLogCategoryAssistant();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
              {
                id v60 = [v58 shortDebugName];
                *(_DWORD *)buf = 138543875;
                id v227 = v56;
                __int16 v228 = 2114;
                id v229 = v57;
                __int16 v230 = 2113;
                v231 = v60;
                _os_log_impl(&dword_1D422A000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: not syncing token for %{private}@", buf, 0x20u);
              }
            }
            else
            {
              uint64_t v63 = _MPLogCategoryAssistant();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v64 = [v58 shortDebugName];
                *(_DWORD *)buf = 138543875;
                id v227 = v56;
                __int16 v228 = 2114;
                id v229 = v57;
                __int16 v230 = 2113;
                v231 = v64;
                _os_log_impl(&dword_1D422A000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: fetching store client token for %{private}@", buf, 0x20u);
              }
              dispatch_group_enter(groupa);
              uint64_t v159 = MEMORY[0x1E4F143A8];
              uint64_t v160 = 3221225472;
              v161 = sub_1D424B280;
              v162 = &unk_1E69E3560;
              v169 = v207;
              id v163 = v56;
              id v164 = v57;
              id v165 = v58;
              id v166 = v86;
              v170 = &v209;
              id v167 = v84;
              v168 = groupa;
              MPStoreGetClientTokenStatusForIdentity();

              __int16 v59 = v163;
            }

            id v65 = [MEMORY[0x1E4F1CA60] dictionary];
            if (MSVDeviceIsAudioAccessory())
            {
              long long v66 = objc_msgSend(v58, "ic_homeUserIdentifiers");
              BOOL v81 = [v66 count] != 0;

              if (v81)
              {
                long long v157 = 0u;
                long long v158 = 0u;
                long long v155 = 0u;
                long long v156 = 0u;
                uint64_t v67 = objc_msgSend(v58, "ic_homeUserIdentifiers");
                uint64_t v68 = [v67 countByEnumeratingWithState:&v155 objects:buf count:16];
                v101 = v67;
                if (v68)
                {
                  uint64_t v69 = *(void *)v156;
                  do
                  {
                    for (uint64_t j = 0; j != v68; ++j)
                    {
                      if (*(void *)v156 != v69) {
                        objc_enumerationMutation(v101);
                      }
                      uint64_t v71 = [*(id *)(*((void *)&v155 + 1) + 8 * j) UUIDString];
                      dispatch_group_enter(groupa);
                      id v72 = _MPLogCategoryAssistant();
                      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                      {
                        id v73 = [v58 shortDebugName];
                        *(_DWORD *)long long v218 = 138544131;
                        id v219 = v56;
                        __int16 v220 = 2114;
                        id v221 = v57;
                        __int16 v222 = 2113;
                        v223 = v71;
                        __int16 v224 = 2113;
                        v225 = v73;
                        _os_log_impl(&dword_1D422A000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: fetching shared user id for home user id %{private}@ for %{private}@", v218, 0x2Au);
                      }
                      v147[0] = MEMORY[0x1E4F143A8];
                      v147[1] = 3221225472;
                      v147[2] = sub_1D424B654;
                      v147[3] = &unk_1E69E3588;
                      id v74 = v105;
                      id v148 = v74;
                      id v149 = v56;
                      id v150 = v57;
                      id v151 = v58;
                      v152 = groupa;
                      id v154 = v207;
                      id v153 = v65;
                      [v74 getConformingSharedUserIdForHomeUserId:v71 completion:v147];
                    }
                    uint64_t v68 = [v101 countByEnumeratingWithState:&v155 objects:buf count:16];
                  }
                  while (v68);
                }
              }
              else
              {
                v101 = _MPLogCategoryAssistant();
                if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
                {
                  id v76 = [v58 shortDebugName];
                  *(_DWORD *)buf = 138543875;
                  id v227 = v56;
                  __int16 v228 = 2114;
                  id v229 = v57;
                  __int16 v230 = 2113;
                  v231 = v76;
                  _os_log_impl(&dword_1D422A000, v101, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: user does not have any home IDs for %{private}@", buf, 0x20u);
                }
              }

              BOOL v75 = v81;
            }
            else
            {
              BOOL v75 = 0;
            }
            uint64_t v77 = dispatch_get_global_queue(0, 0);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = sub_1D424B850;
            block[3] = &unk_1E69E35B0;
            id v137 = v56;
            id v138 = v57;
            id v139 = v58;
            dispatch_queue_t v142 = v90;
            id v140 = v86;
            id v141 = v65;
            v143 = v205;
            uint64_t v144 = v194;
            BOOL v146 = v75;
            v145 = &v209;
            id v78 = v65;
            dispatch_group_notify(groupa, v77, block);

            _Block_object_dispose(v194, 8);
          }
          _Block_object_dispose(v205, 8);

          _Block_object_dispose(v207, 8);
          _Block_object_dispose(&v209, 8);

          uint64_t v22 = v111;
        }

        uint64_t v19 = v94 + 1;
      }
      while (v94 + 1 != v88);
      uint64_t v88 = [v82 countByEnumeratingWithState:&v124 objects:v215 count:16];
    }
    while (v88);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_1D424A474(_Unwind_Exception *a1)
{
}

void sub_1D424A528(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    uint64_t v23 = v3;
    __int16 v24 = 2114;
    uint64_t v25 = v4;
    __int16 v26 = 2114;
    uint64_t v27 = v5;
    _os_log_impl(&dword_1D422A000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: finished getting dynamite client state: %{public}@", buf, 0x20u);
  }

  [*(id *)(a1 + 48) setInContextUsersStates:*(void *)(a1 + 56)];
  id v6 = sub_1D4244D88(*(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40));
  [*(id *)(a1 + 48) setExpirationDate:v6];

  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  id v7 = NSNumber;
  [*(id *)(a1 + 72) timeIntervalSinceNow];
  uint64_t v9 = [v7 numberWithDouble:fabs(v8)];
  [*(id *)(a1 + 64) setObject:v9 forKeyedSubscript:@"duration"];

  LODWORD(v10) = *(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8) + 32);
  id v11 = [NSNumber numberWithFloat:v10];
  [*(id *)(a1 + 64) setObject:v11 forKeyedSubscript:@"age_verification_duration"];

  LODWORD(v12) = *(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8) + 36);
  int v13 = [NSNumber numberWithFloat:v12];
  [*(id *)(a1 + 64) setObject:v13 forKeyedSubscript:@"subscription_status_duration"];

  LODWORD(v14) = *(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
  id v15 = [NSNumber numberWithFloat:v14];
  [*(id *)(a1 + 64) setObject:v15 forKeyedSubscript:@"token_duration"];

  LODWORD(v16) = *(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8) + 44);
  uint64_t v17 = [NSNumber numberWithFloat:v16];
  [*(id *)(a1 + 64) setObject:v17 forKeyedSubscript:@"use_history_duration"];

  id v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 56), "count"));
  [*(id *)(a1 + 64) setObject:v18 forKeyedSubscript:@"accounts_on_device"];

  uint64_t v19 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 112) + 8) + 24)];
  [*(id *)(a1 + 64) setObject:v19 forKeyedSubscript:@"accounts_without_state"];

  uint64_t v20 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 120) + 8) + 24)];
  [*(id *)(a1 + 64) setObject:v20 forKeyedSubscript:@"token_failure"];

  id v21 = *(id *)(a1 + 64);
  AnalyticsSendEventLazy();
}

id sub_1D424A854(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1D424A85C(uint64_t a1, void *a2, void *a3, void *a4, void *a5, char a6, float a7, float a8, float a9, float a10)
{
  id v19 = a2;
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D424BDB4;
  block[3] = &unk_1E69E3380;
  __int16 v24 = *(NSObject **)(a1 + 32);
  uint64_t v23 = *(void *)(a1 + 40);
  uint64_t v25 = *(void **)(a1 + 48);
  id v32 = v19;
  uint64_t v33 = v23;
  id v34 = v25;
  id v35 = *(id *)(a1 + 56);
  id v36 = *(id *)(a1 + 64);
  long long v42 = *(_OWORD *)(a1 + 96);
  id v37 = *(id *)(a1 + 72);
  id v38 = v22;
  char v50 = *(unsigned char *)(a1 + 144);
  uint64_t v43 = *(void *)(a1 + 112);
  id v39 = v21;
  id v26 = *(id *)(a1 + 80);
  char v51 = a6;
  id v40 = v26;
  id v41 = v20;
  long long v44 = *(_OWORD *)(a1 + 120);
  uint64_t v45 = *(void *)(a1 + 136);
  float v46 = a7;
  float v47 = a8;
  float v48 = a9;
  float v49 = a10;
  id v27 = v20;
  id v28 = v21;
  id v29 = v22;
  id v30 = v19;
  dispatch_sync(v24, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 88));
}

void sub_1D424AA38(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = [v3 status];
    double v8 = [*(id *)(a1 + 48) shortDebugName];
    int v10 = 138544131;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    __int16 v16 = 2113;
    uint64_t v17 = v8;
    _os_log_impl(&dword_1D422A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: age verification: %ld for %{private}@", (uint8_t *)&v10, 0x2Au);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 80) + 8) + 32));
  if ([v3 status] == 2) {
    [*(id *)(a1 + 56) setAgeVerificationRequired:1];
  }
  [*(id *)(a1 + 64) timeIntervalSinceNow];
  *(float *)&double v9 = v9;
  *(float *)(*(void *)(*(void *)(a1 + 88) + 8) + 32) = fabsf(*(float *)&v9);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 80) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void sub_1D424ABA8(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 privateListeningEnabled];
  if ([MEMORY[0x1E4F318B8] isCurrentDeviceValidHomeAccessory])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F318C8];
    uint64_t v6 = [v3 homeUserIdentifiers];
    uint64_t v7 = [v5 userMonitorWithHomeIdentifiers:v6];

    if (v7)
    {
      uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isPrivateListeningEnabledForCurrentAccessory"));

      uint64_t v4 = (void *)v8;
    }
  }
  double v9 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    __int16 v12 = [*(id *)(a1 + 48) shortDebugName];
    int v17 = 138544131;
    uint64_t v18 = v10;
    __int16 v19 = 2114;
    uint64_t v20 = v11;
    __int16 v21 = 2114;
    id v22 = v4;
    __int16 v23 = 2113;
    __int16 v24 = v12;
    _os_log_impl(&dword_1D422A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: user history unmodifiable: %{public}@ for %{private}@", (uint8_t *)&v17, 0x2Au);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 80) + 8) + 32));
  [*(id *)(a1 + 56) setUserHistoryUnmodifiable:v4];
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isActiveLocker"));
  uint64_t v14 = *(void *)(*(void *)(a1 + 88) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  [*(id *)(a1 + 64) timeIntervalSinceNow];
  *(float *)&double v16 = v16;
  *(float *)(*(void *)(*(void *)(a1 + 96) + 8) + 44) = fabsf(*(float *)&v16);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 80) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void sub_1D424ADAC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setIdentity:v2];
  id v4 = (id)[objc_alloc(MEMORY[0x1E4FB8768]) initWithUserInteractionLevel:1];
  [v3 setAuthenticationProvider:v4];
}

void sub_1D424AE20(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v42 = v8;
      __int16 v43 = 2114;
      uint64_t v44 = v9;
      __int16 v45 = 2114;
      *(void *)float v46 = v6;
      _os_log_impl(&dword_1D422A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: Failed to load subscription status. error=%{public}@", buf, 0x20u);
    }

    uint64_t v10 = [v6 domain];
    if ([v10 isEqualToString:*MEMORY[0x1E4FB8410]])
    {
      uint64_t v11 = [v6 code];

      if (v11 == -7007)
      {
        __int16 v12 = _MPLogCategoryAssistant();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = *(void *)(a1 + 32);
          uint64_t v14 = *(void *)(a1 + 40);
          uint64_t v15 = [*(id *)(a1 + 48) shortDebugName];
          *(_DWORD *)buf = 138543875;
          uint64_t v42 = v13;
          __int16 v43 = 2114;
          uint64_t v44 = v14;
          __int16 v45 = 2113;
          *(void *)float v46 = v15;
          _os_log_impl(&dword_1D422A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: Privacy acceptance required - falling back to lightweight status for %{private}@", buf, 0x20u);
        }
        double v16 = (void *)[objc_alloc(MEMORY[0x1E4FB8630]) initWithRequestContext:*(void *)(a1 + 56)];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = sub_1D424B96C;
        v32[3] = &unk_1E69E3510;
        long long v39 = *(_OWORD *)(a1 + 88);
        id v33 = *(id *)(a1 + 32);
        id v34 = *(id *)(a1 + 40);
        id v35 = *(id *)(a1 + 48);
        id v17 = *(id *)(a1 + 64);
        uint64_t v18 = *(void *)(a1 + 104);
        id v36 = v17;
        uint64_t v40 = v18;
        id v37 = *(id *)(a1 + 72);
        id v38 = *(id *)(a1 + 80);
        [v16 performRequestWithResponseHandler:v32];

        goto LABEL_17;
      }
    }
    else
    {
    }
  }
  double v16 = [v5 subscriptionStatus];
  uint64_t v19 = [v16 capabilities] & 0x101;
  int v20 = [v16 isMatchEnabled];
  __int16 v21 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v23 = *(void *)(a1 + 40);
    __int16 v24 = [*(id *)(a1 + 48) shortDebugName];
    *(_DWORD *)buf = 138544387;
    uint64_t v42 = v22;
    __int16 v43 = 2114;
    uint64_t v44 = v23;
    __int16 v45 = 1024;
    *(_DWORD *)float v46 = v19 == 257;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v20;
    __int16 v47 = 2113;
    float v48 = v24;
    _os_log_impl(&dword_1D422A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: store account is a subscriber: %{BOOL}u, match subscriber: %{BOOL}u for %{private}@", buf, 0x2Cu);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 88) + 8) + 32));
  uint64_t v25 = (void *)MEMORY[0x1E4F96C98];
  if (v19 != 257) {
    uint64_t v25 = (void *)MEMORY[0x1E4F96CA0];
  }
  [*(id *)(a1 + 64) setStatus:*v25];
  id v26 = (void *)MEMORY[0x1E4F971E0];
  if (!v20) {
    id v26 = (void *)MEMORY[0x1E4F971E8];
  }
  [*(id *)(a1 + 64) setITunesMatchSubscriptionStatus:*v26];
  [*(id *)(a1 + 64) setIsPromotionRelatedStatus:0];
  id v27 = [v16 eligibleOffers];
  [*(id *)(a1 + 64) setEligibleOffers:v27];

  [*(id *)(a1 + 72) timeIntervalSinceNow];
  *(float *)&double v28 = v28;
  *(float *)(*(void *)(*(void *)(a1 + 104) + 8) + 44) = fabsf(*(float *)&v28);
  uint64_t v29 = [v16 expirationDate];
  uint64_t v30 = *(void *)(*(void *)(a1 + 96) + 8);
  uint64_t v31 = *(void **)(v30 + 40);
  *(void *)(v30 + 40) = v29;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 88) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
LABEL_17:
}

void sub_1D424B280(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 80) + 8) + 32));
  id v7 = objc_alloc_init(MEMORY[0x1E4F96BC0]);
  if (v6)
  {
    uint64_t v8 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = [*(id *)(a1 + 48) shortDebugName];
      int v31 = 138544131;
      uint64_t v32 = v9;
      __int16 v33 = 2114;
      uint64_t v34 = v10;
      __int16 v35 = 2113;
      id v36 = v11;
      __int16 v37 = 2114;
      id v38 = v6;
      _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_ERROR, "%{public}@ (userstate) <%{public}@>: failed fetching store client token status for %{private}@: %{public}@", (uint8_t *)&v31, 0x2Au);
    }
    __int16 v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "code"));
    [v7 setErrorCode:v12];
  }
  else
  {
    uint64_t v13 = NSNumber;
    [v5 lastUpdateAttemptTime];
    uint64_t v14 = objc_msgSend(v13, "numberWithDouble:");
    [v7 setLastUpdateAttemptTime:v14];

    uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "shouldExcludeFromBackgroundRefresh"));
    [v7 setShouldExcludeFromBackgroundRefresh:v15];

    double v16 = [v5 lastError];

    id v17 = _MPLogCategoryAssistant();
    uint64_t v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        uint64_t v20 = *(void *)(a1 + 40);
        __int16 v21 = [*(id *)(a1 + 48) shortDebugName];
        uint64_t v22 = [v5 lastError];
        int v31 = 138544131;
        uint64_t v32 = v19;
        __int16 v33 = 2114;
        uint64_t v34 = v20;
        __int16 v35 = 2113;
        id v36 = v21;
        __int16 v37 = 2114;
        id v38 = v22;
        _os_log_impl(&dword_1D422A000, v18, OS_LOG_TYPE_ERROR, "%{public}@ (userstate) <%{public}@>: error fetching client token for %{private}@: %{public}@", (uint8_t *)&v31, 0x2Au);
      }
      uint64_t v23 = NSNumber;
      __int16 v12 = [v5 lastError];
      __int16 v24 = objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v12, "code"));
      [v7 setErrorCode:v24];
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = *(void *)(a1 + 32);
        uint64_t v26 = *(void *)(a1 + 40);
        id v27 = [v5 tokenResult];
        double v28 = [v27 token];
        uint64_t v29 = [*(id *)(a1 + 48) shortDebugName];
        int v31 = 138544131;
        uint64_t v32 = v25;
        __int16 v33 = 2114;
        uint64_t v34 = v26;
        __int16 v35 = 2113;
        id v36 = v28;
        __int16 v37 = 2113;
        id v38 = v29;
        _os_log_impl(&dword_1D422A000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: fetched store client token %{private}@ for %{private}@", (uint8_t *)&v31, 0x2Au);
      }
      __int16 v12 = [v5 tokenResult];
      __int16 v24 = [v12 token];
      [*(id *)(a1 + 56) setUserToken:v24];
    }
  }
  [*(id *)(a1 + 56) setUserTokenStatus:v7];
  [*(id *)(a1 + 64) timeIntervalSinceNow];
  *(float *)&double v30 = v30;
  *(float *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) = fabsf(*(float *)&v30);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 80) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void sub_1D424B654(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = _MPLogCategoryAssistant();
  __int16 v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = [*(id *)(a1 + 56) shortDebugName];
      int v19 = 138544131;
      uint64_t v20 = v13;
      __int16 v21 = 2114;
      uint64_t v22 = v14;
      __int16 v23 = 2113;
      id v24 = v15;
      __int16 v25 = 2114;
      id v26 = v9;
      _os_log_impl(&dword_1D422A000, v12, OS_LOG_TYPE_ERROR, "%{public}@ (userstate) <%{public}@>: failed fetching shared user id for %{private}@: %{public}@", (uint8_t *)&v19, 0x2Au);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v17 = *(void *)(a1 + 48);
      uint64_t v18 = [*(id *)(a1 + 56) shortDebugName];
      int v19 = 138544387;
      uint64_t v20 = v16;
      __int16 v21 = 2114;
      uint64_t v22 = v17;
      __int16 v23 = 2114;
      id v24 = v8;
      __int16 v25 = 2113;
      id v26 = v7;
      __int16 v27 = 2114;
      double v28 = v18;
      _os_log_impl(&dword_1D422A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: fetched shared user id: %{public}@:%{private}@ for %{public}@", (uint8_t *)&v19, 0x34u);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 80) + 8) + 32));
    [*(id *)(a1 + 72) setObject:v7 forKeyedSubscript:v8];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 80) + 8) + 32));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

uint64_t sub_1D424B850(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 48) shortDebugName];
    int v7 = 138543875;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    __int16 v11 = 2113;
    __int16 v12 = v5;
    _os_log_impl(&dword_1D422A000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: finished getting user state for %{private}@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(float, float, float, float))(*(void *)(a1 + 72) + 16))(*(float *)(*(void *)(*(void *)(a1 + 96) + 8) + 32), *(float *)(*(void *)(*(void *)(a1 + 96) + 8) + 36), *(float *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), *(float *)(*(void *)(*(void *)(a1 + 96) + 8) + 44));
}

void sub_1D424B96C(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 80) + 8) + 32);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  id v5 = [v4 lightweightSubscriptionStatus];

  uint64_t v6 = [v5 expirationDate];
  uint64_t v7 = *(void *)(*(void *)(a1 + 88) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [v5 capabilities] & 0x101;
  uint64_t v10 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = [*(id *)(a1 + 48) shortDebugName];
    int v17 = 138544131;
    uint64_t v18 = v11;
    __int16 v19 = 2114;
    uint64_t v20 = v12;
    __int16 v21 = 1024;
    BOOL v22 = v9 == 257;
    __int16 v23 = 2113;
    id v24 = v13;
    _os_log_impl(&dword_1D422A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: store account is a subscriber: %{BOOL}u for %{private}@", (uint8_t *)&v17, 0x26u);
  }
  uint64_t v14 = (void *)MEMORY[0x1E4F96C98];
  if (v9 != 257) {
    uint64_t v14 = (void *)MEMORY[0x1E4F96CA0];
  }
  [*(id *)(a1 + 56) setStatus:*v14];
  [*(id *)(a1 + 56) setIsPromotionRelatedStatus:0];
  uint64_t v15 = [v5 eligibleOffers];
  [*(id *)(a1 + 56) setEligibleOffers:v15];

  [*(id *)(a1 + 64) timeIntervalSinceNow];
  *(float *)&double v16 = v16;
  *(float *)(*(void *)(*(void *)(a1 + 96) + 8) + 44) = fabsf(*(float *)&v16);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 80) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

Class sub_1D424BB54(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!qword_1EBD857E0)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = sub_1D424BD40;
    void v6[4] = &unk_1E69E3610;
    void v6[5] = v6;
    long long v7 = xmmword_1E69E3630;
    uint64_t v8 = 0;
    qword_1EBD857E0 = _sl_dlopen();
  }
  if (!qword_1EBD857E0)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"void *AssistantServicesLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"MPAssistantUtilities.m", 59, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("AFMultiUserConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v5 = [NSString stringWithUTF8String:"Class getAFMultiUserConnectionClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"MPAssistantUtilities.m", 60, @"Unable to find class %s", "AFMultiUserConnection");

LABEL_10:
    __break(1u);
  }
  qword_1EBD857F0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1D424BD40()
{
  uint64_t result = _sl_dlopen();
  qword_1EBD857E0 = result;
  return result;
}

void sub_1D424BDB4(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    if (([*(id *)(a1 + 40) isEqual:*(void *)(a1 + 48)] & 1) != 0
      || !*(void *)(v1 + 48) && [*(id *)(v1 + 40) isActive])
    {
      uint64_t v2 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v3 = *(void *)(v1 + 56);
        uint64_t v4 = *(void *)(v1 + 64);
        id v5 = [*(id *)(v1 + 40) shortDebugName];
        *(_DWORD *)buf = 138543875;
        uint64_t v96 = v3;
        __int16 v97 = 2114;
        uint64_t v98 = v4;
        __int16 v99 = 2113;
        id v100 = v5;
        _os_log_impl(&dword_1D422A000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: account %{private}@ is default", buf, 0x20u);
      }
      uint64_t v6 = NSString;
      long long v7 = [*(id *)(v1 + 32) syncSharedUserId];
      uint64_t v8 = [*(id *)(v1 + 32) userHistoryUnmodifiable];
      uint64_t v9 = [v8 stringValue];
      uint64_t v10 = [*(id *)(v1 + 32) status];
      if ([*(id *)(v1 + 32) ageVerificationRequired]) {
        uint64_t v11 = @"YES";
      }
      else {
        uint64_t v11 = @"NO";
      }
      uint64_t v12 = [*(id *)(v1 + 32) defaultMediaPlaybackAppBundleIdentifier];
      if ([*(id *)(v1 + 32) isPromotionRelatedStatus]) {
        uint64_t v13 = @"YES";
      }
      else {
        uint64_t v13 = @"NO";
      }
      uint64_t v14 = [*(id *)(a1 + 32) eligibleOffers];
      id v85 = v13;
      uint64_t v1 = a1;
      uint64_t v15 = [v6 stringWithFormat:@"Default_UserState_v2_%@_%@_%@_%@_%@_%@_%@", v7, v9, v10, v11, v12, v85, v14];

      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 112) + 8) + 32));
      double v16 = *(void **)(*(void *)(*(void *)(a1 + 120) + 8) + 40);
      int v17 = objc_msgSend(*(id *)(a1 + 40), "ic_DSID");
      [v16 setObject:v15 forKeyedSubscript:v17];

      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 112) + 8) + 32));
      [*(id *)(v1 + 72) setDefaultUserState:*(void *)(v1 + 32)];
      uint64_t v18 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = *(void *)(a1 + 56);
        uint64_t v20 = *(void *)(a1 + 64);
        __int16 v21 = [*(id *)(a1 + 32) dictionary];
        *(_DWORD *)buf = 138543875;
        uint64_t v96 = v19;
        __int16 v97 = 2114;
        uint64_t v98 = v20;
        __int16 v99 = 2113;
        id v100 = v21;
        _os_log_impl(&dword_1D422A000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: default user state: %{private}@", buf, 0x20u);
      }
      [*(id *)(a1 + 72) setICloudMusicLibraryToggle:*(void *)(a1 + 80)];
      objc_msgSend(*(id *)(a1 + 72), "setAgeVerificationRequired:", objc_msgSend(*(id *)(a1 + 32), "ageVerificationRequired"));
      BOOL v22 = [*(id *)(a1 + 32) status];
      [*(id *)(a1 + 72) setStatus:v22];

      __int16 v23 = [*(id *)(a1 + 32) iTunesMatchSubscriptionStatus];
      [*(id *)(a1 + 72) setITunesMatchSubscriptionStatus:v23];

      id v24 = [*(id *)(a1 + 32) userHistoryUnmodifiable];
      [*(id *)(a1 + 72) setUserHistoryUnmodifiable:v24];

      uint64_t v25 = [*(id *)(a1 + 32) userToken];
      [*(id *)(a1 + 72) setUserToken:v25];

      id v26 = [*(id *)(a1 + 32) userTokenStatus];
      [*(id *)(a1 + 72) setUserTokenStatus:v26];

      __int16 v27 = [*(id *)(a1 + 32) eligibleOffers];
      [*(id *)(a1 + 72) setEligibleOffers:v27];

      objc_msgSend(*(id *)(a1 + 72), "setIsPromotionRelatedStatus:", objc_msgSend(*(id *)(a1 + 32), "isPromotionRelatedStatus"));
      double v28 = [*(id *)(a1 + 32) xpAbCookie];
      [*(id *)(a1 + 72) setXpAbCookie:v28];

      if (!*(unsigned char *)(a1 + 176))
      {
        uint64_t v29 = [*(id *)(a1 + 72) userToken];
        uint64_t v30 = [v29 length];

        if (!v30) {
          ++*(_DWORD *)(*(void *)(*(void *)(a1 + 128) + 8) + 24);
        }
      }
    }
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id obj = [*(id *)(v1 + 88) allKeys];
    uint64_t v89 = [obj countByEnumeratingWithState:&v91 objects:v105 count:16];
    if (v89)
    {
      uint64_t v87 = *(void *)v92;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v92 != v87) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void **)(*((void *)&v91 + 1) + 8 * v31);
          __int16 v33 = _MPLogCategoryAssistant();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v34 = *(void *)(v1 + 56);
            uint64_t v35 = *(void *)(v1 + 64);
            id v36 = [*(id *)(v1 + 40) shortDebugName];
            __int16 v37 = [*(id *)(v1 + 88) objectForKeyedSubscript:v32];
            *(_DWORD *)buf = 138544387;
            uint64_t v96 = v34;
            __int16 v97 = 2114;
            uint64_t v98 = v35;
            __int16 v99 = 2113;
            id v100 = v36;
            __int16 v101 = 2114;
            int v102 = v32;
            __int16 v103 = 2113;
            uint64_t v104 = v37;
            _os_log_impl(&dword_1D422A000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: account %{private}@ has shared user ID %{public}@:%{private}@", buf, 0x34u);
          }
          uint64_t v90 = v31;

          id v38 = (void *)[*(id *)(v1 + 32) copy];
          if (!*(unsigned char *)(v1 + 176))
          {
            uint64_t v39 = [*(id *)(v1 + 88) objectForKeyedSubscript:v32];
            [v38 setSharedUserId:v39];
          }
          [v38 setSyncSharedUserId:v32];
          uint64_t v40 = NSString;
          id v41 = [v38 syncSharedUserId];
          uint64_t v42 = [v38 userHistoryUnmodifiable];
          __int16 v43 = [v42 stringValue];
          uint64_t v44 = [v38 status];
          __int16 v45 = @"NO";
          if ([v38 ageVerificationRequired]) {
            float v46 = @"YES";
          }
          else {
            float v46 = @"NO";
          }
          __int16 v47 = [v38 defaultMediaPlaybackAppBundleIdentifier];
          if ([v38 isPromotionRelatedStatus]) {
            __int16 v45 = @"YES";
          }
          float v48 = [v38 eligibleOffers];
          uint64_t v49 = [v40 stringWithFormat:@"UserState_v2_%@_%@_%@_%@_%@_%@_%@", v41, v43, v44, v46, v47, v45, v48];

          uint64_t v1 = a1;
          char v50 = _MPLogCategoryAssistant();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v51 = *(void *)(a1 + 56);
            uint64_t v52 = *(void *)(a1 + 64);
            id v53 = [*(id *)(a1 + 40) shortDebugName];
            id v54 = [v38 dictionary];
            *(_DWORD *)buf = 138544131;
            uint64_t v96 = v51;
            __int16 v97 = 2114;
            uint64_t v98 = v52;
            __int16 v99 = 2113;
            id v100 = v53;
            __int16 v101 = 2113;
            int v102 = v54;
            _os_log_impl(&dword_1D422A000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: %{private}@ user state: %{private}@", buf, 0x2Au);
          }
          os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 112) + 8) + 32));
          [*(id *)(a1 + 96) addObject:v38];
          id v55 = *(void **)(*(void *)(*(void *)(a1 + 120) + 8) + 40);
          id v56 = objc_msgSend(*(id *)(a1 + 40), "ic_DSID");
          [v55 setObject:v49 forKeyedSubscript:v56];

          os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 112) + 8) + 32));
          uint64_t v31 = v90 + 1;
        }
        while (v89 != v90 + 1);
        uint64_t v89 = [obj countByEnumeratingWithState:&v91 objects:v105 count:16];
      }
      while (v89);
    }

    if (![*(id *)(v1 + 88) count] && *(unsigned char *)(v1 + 177))
    {
      id v57 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v58 = *(void *)(v1 + 56);
        uint64_t v59 = *(void *)(v1 + 64);
        id v60 = [*(id *)(v1 + 40) shortDebugName];
        *(_DWORD *)buf = 138543875;
        uint64_t v96 = v58;
        __int16 v97 = 2114;
        uint64_t v98 = v59;
        __int16 v99 = 2113;
        id v100 = v60;
        _os_log_impl(&dword_1D422A000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: account %{private}@ has no shared user IDs", buf, 0x20u);
      }
      uint64_t v61 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v62 = *(void *)(v1 + 56);
        uint64_t v63 = *(void *)(v1 + 64);
        uint64_t v64 = [*(id *)(v1 + 40) shortDebugName];
        id v65 = [*(id *)(v1 + 32) dictionary];
        *(_DWORD *)buf = 138544131;
        uint64_t v96 = v62;
        __int16 v97 = 2114;
        uint64_t v98 = v63;
        __int16 v99 = 2113;
        id v100 = v64;
        __int16 v101 = 2113;
        int v102 = v65;
        _os_log_impl(&dword_1D422A000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: %{private}@ user state: %{private}@", buf, 0x2Au);
      }
      long long v66 = NSString;
      uint64_t v67 = [*(id *)(v1 + 32) userHistoryUnmodifiable];
      uint64_t v68 = [v67 stringValue];
      uint64_t v69 = [*(id *)(v1 + 32) status];
      if ([*(id *)(v1 + 32) ageVerificationRequired]) {
        long long v70 = @"YES";
      }
      else {
        long long v70 = @"NO";
      }
      uint64_t v71 = [*(id *)(v1 + 32) defaultMediaPlaybackAppBundleIdentifier];
      id v72 = [v66 stringWithFormat:@"UserState_v2_%@_%@_%@_%@_%@", @"none", v68, v69, v70, v71];

      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(v1 + 112) + 8) + 32));
      id v73 = *(void **)(v1 + 96);
      id v74 = (void *)[*(id *)(v1 + 32) copy];
      [v73 addObject:v74];

      BOOL v75 = *(void **)(*(void *)(*(void *)(v1 + 120) + 8) + 40);
      id v76 = objc_msgSend(*(id *)(v1 + 40), "ic_DSID");
      [v75 setObject:v72 forKeyedSubscript:v76];

      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(v1 + 112) + 8) + 32));
    }
  }
  else
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 136) + 8) + 24);
  }
  uint64_t v77 = *(void **)(v1 + 104);
  if (v77)
  {
    if (!*(void *)(*(void *)(*(void *)(v1 + 144) + 8) + 40)
      || ([v77 timeIntervalSince1970],
          double v79 = v78,
          [*(id *)(*(void *)(*(void *)(v1 + 144) + 8) + 40) timeIntervalSince1970],
          v79 < v80))
    {
      BOOL v81 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v82 = *(void *)(v1 + 56);
        uint64_t v83 = *(void *)(v1 + 64);
        id v84 = [*(id *)(v1 + 40) shortDebugName];
        *(_DWORD *)buf = 138543875;
        uint64_t v96 = v82;
        __int16 v97 = 2114;
        uint64_t v98 = v83;
        __int16 v99 = 2113;
        id v100 = v84;
        _os_log_impl(&dword_1D422A000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: account %{private}@ has shortest expiration time", buf, 0x20u);
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 144) + 8) + 40), *(id *)(v1 + 104));
    }
  }
  *(float *)(*(void *)(*(void *)(v1 + 152) + 8) + 32) = *(float *)(v1 + 160)
                                                              + *(float *)(*(void *)(*(void *)(v1 + 152) + 8)
                                                                         + 32);
  *(float *)(*(void *)(*(void *)(v1 + 152) + 8) + 40) = *(float *)(v1 + 168)
                                                              + *(float *)(*(void *)(*(void *)(v1 + 152) + 8)
                                                                         + 40);
  *(float *)(*(void *)(*(void *)(v1 + 152) + 8) + 44) = *(float *)(v1 + 172)
                                                              + *(float *)(*(void *)(*(void *)(v1 + 152) + 8)
                                                                         + 44);
  *(float *)(*(void *)(*(void *)(v1 + 152) + 8) + 36) = *(float *)(v1 + 164)
                                                              + *(float *)(*(void *)(*(void *)(v1 + 152) + 8)
                                                                         + 36);
}

uint64_t sub_1D424C8E4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  if ([v3 supportsMultipleITunesAccounts]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [v2 isActive];
  }

  return v4;
}

void sub_1D424C94C(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "setActiveTvUser:", objc_msgSend(*(id *)(a1 + 40), "isActiveUser"));
  id v2 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 56);
    int v5 = [*(id *)(a1 + 40) isActiveUser];
    int v6 = 138543874;
    uint64_t v7 = v4;
    __int16 v8 = 2114;
    uint64_t v9 = v3;
    __int16 v10 = 1024;
    int v11 = v5;
    _os_log_impl(&dword_1D422A000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: active TV user: %{BOOL}u", (uint8_t *)&v6, 0x1Cu);
  }
}

void sub_1D424CA30()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!qword_1EBD857E8)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    void v3[3] = sub_1D424CB80;
    void v3[4] = &unk_1E69E3610;
    void v3[5] = v3;
    long long v4 = xmmword_1E69E35F8;
    uint64_t v5 = 0;
    qword_1EBD857E8 = _sl_dlopen();
  }
  if (!qword_1EBD857E8)
  {
    uint64_t v1 = [MEMORY[0x1E4F28B00] currentHandler];
    id v2 = [NSString stringWithUTF8String:"void *WatchListKitLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"MPAssistantUtilities.m", 46, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_1D424CB80()
{
  uint64_t result = _sl_dlopen();
  qword_1EBD857E8 = result;
  return result;
}

uint64_t sub_1D424CBF4(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 homeUserIDs];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

void sub_1D424CC38(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1D424D418;
  v16[3] = &unk_1E69E32C0;
  id v17 = v6;
  char v27 = *(unsigned char *)(a1 + 120);
  uint64_t v7 = *(NSObject **)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  __int16 v10 = *(void **)(a1 + 64);
  id v19 = v8;
  uint64_t v20 = v9;
  long long v24 = *(_OWORD *)(a1 + 88);
  id v11 = v10;
  char v28 = *(unsigned char *)(a1 + 121);
  uint64_t v25 = *(void *)(a1 + 104);
  id v21 = v11;
  id v22 = v5;
  id v12 = *(id *)(a1 + 72);
  uint64_t v13 = *(void *)(a1 + 112);
  id v23 = v12;
  uint64_t v26 = v13;
  id v14 = v5;
  id v15 = v6;
  dispatch_sync(v7, v16);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
}

void sub_1D424CD78(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setInContextUsersStates:*(void *)(a1 + 40)];
  id v2 = sub_1D4244D88(*(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40));
  [*(id *)(a1 + 32) setExpirationDate:v2];

  uint64_t v3 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543875;
    uint64_t v23 = v4;
    __int16 v24 = 2114;
    uint64_t v25 = v5;
    __int16 v26 = 2113;
    uint64_t v27 = v6;
    _os_log_impl(&dword_1D422A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: finished getting dynamite client state: %{private}@", buf, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  uint64_t v7 = NSNumber;
  [*(id *)(a1 + 72) timeIntervalSinceNow];
  uint64_t v9 = [v7 numberWithDouble:fabs(v8)];
  [*(id *)(a1 + 64) setObject:v9 forKeyedSubscript:@"duration"];

  LODWORD(v10) = *(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8) + 32);
  id v11 = [NSNumber numberWithFloat:v10];
  [*(id *)(a1 + 64) setObject:v11 forKeyedSubscript:@"age_verification_duration"];

  LODWORD(v12) = *(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8) + 36);
  uint64_t v13 = [NSNumber numberWithFloat:v12];
  [*(id *)(a1 + 64) setObject:v13 forKeyedSubscript:@"subscription_status_duration"];

  LODWORD(v14) = *(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
  id v15 = [NSNumber numberWithFloat:v14];
  [*(id *)(a1 + 64) setObject:v15 forKeyedSubscript:@"token_duration"];

  LODWORD(v16) = *(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8) + 44);
  id v17 = [NSNumber numberWithFloat:v16];
  [*(id *)(a1 + 64) setObject:v17 forKeyedSubscript:@"use_history_duration"];

  id v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
  [*(id *)(a1 + 64) setObject:v18 forKeyedSubscript:@"accounts_on_device"];

  id v19 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 112) + 8) + 24)];
  [*(id *)(a1 + 64) setObject:v19 forKeyedSubscript:@"accounts_without_state"];

  uint64_t v20 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 120) + 8) + 24)];
  [*(id *)(a1 + 64) setObject:v20 forKeyedSubscript:@"token_failure"];

  id v21 = *(id *)(a1 + 64);
  AnalyticsSendEventLazy();
}

id sub_1D424D0A8(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1D424D0B0(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(id *)(a1 + 32);
  id v11 = _MPLogCategoryAssistant();
  double v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      id v15 = [*(id *)(a1 + 56) shortDebugName];
      *(_DWORD *)buf = 138544131;
      uint64_t v25 = v13;
      __int16 v26 = 2114;
      uint64_t v27 = v14;
      __int16 v28 = 2113;
      id v29 = v15;
      __int16 v30 = 2114;
      id v31 = v9;
      _os_log_impl(&dword_1D422A000, v12, OS_LOG_TYPE_ERROR, "%{public}@ (userstate) <%{public}@>: failed fetching shared user id for %{private}@: %{public}@", buf, 0x2Au);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v17 = *(void *)(a1 + 48);
      id v18 = [*(id *)(a1 + 56) shortDebugName];
      *(_DWORD *)buf = 138544387;
      uint64_t v25 = v16;
      __int16 v26 = 2114;
      uint64_t v27 = v17;
      __int16 v28 = 2114;
      id v29 = v8;
      __int16 v30 = 2113;
      id v31 = v7;
      __int16 v32 = 2114;
      __int16 v33 = v18;
      _os_log_impl(&dword_1D422A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: fetched shared user id: %{public}@:%{private}@ for %{public}@", buf, 0x34u);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D424D408;
    block[3] = &unk_1E69E3420;
    id v19 = *(NSObject **)(a1 + 72);
    id v21 = *(id *)(a1 + 80);
    id v22 = v8;
    id v23 = v7;
    dispatch_sync(v19, block);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
  }
}

uint64_t sub_1D424D308(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 48) shortDebugName];
    int v7 = 138543875;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    __int16 v11 = 2113;
    double v12 = v5;
    _os_log_impl(&dword_1D422A000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: finished getting user state for %{private}@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

uint64_t sub_1D424D408(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
}

void sub_1D424D418(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    if (*(unsigned char *)(a1 + 120))
    {
      id v2 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v3 = *(void *)(v1 + 40);
        uint64_t v4 = *(void *)(v1 + 48);
        uint64_t v5 = [*(id *)(v1 + 56) shortDebugName];
        *(_DWORD *)buf = 138543875;
        uint64_t v95 = v3;
        __int16 v96 = 2114;
        uint64_t v97 = v4;
        __int16 v98 = 2113;
        __int16 v99 = v5;
        _os_log_impl(&dword_1D422A000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: account %{private}@ is default", buf, 0x20u);
      }
      uint64_t v6 = NSString;
      int v7 = [*(id *)(v1 + 32) syncSharedUserId];
      uint64_t v8 = [*(id *)(v1 + 32) userHistoryUnmodifiable];
      __int16 v9 = [v8 stringValue];
      uint64_t v10 = [*(id *)(v1 + 32) status];
      if ([*(id *)(v1 + 32) ageVerificationRequired]) {
        __int16 v11 = @"YES";
      }
      else {
        __int16 v11 = @"NO";
      }
      double v12 = [*(id *)(a1 + 32) defaultMediaPlaybackAppBundleIdentifier];
      if ([*(id *)(a1 + 32) isPromotionRelatedStatus]) {
        uint64_t v13 = @"YES";
      }
      else {
        uint64_t v13 = @"NO";
      }
      uint64_t v14 = [*(id *)(a1 + 32) eligibleOffers];
      id v84 = v11;
      uint64_t v1 = a1;
      id v15 = [v6 stringWithFormat:@"Default_UserState_v2_%@_%@_%@_%@_%@_%@_%@", v7, v9, v10, v84, v12, v13, v14];

      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 88) + 8) + 32));
      uint64_t v16 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
      uint64_t v17 = [*(id *)(a1 + 56) dsid];
      [v16 setObject:v15 forKeyedSubscript:v17];

      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 88) + 8) + 32));
      id v18 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(a1 + 40);
        uint64_t v19 = *(void *)(a1 + 48);
        id v21 = [*(id *)(a1 + 32) dictionary];
        *(_DWORD *)buf = 138543875;
        uint64_t v95 = v20;
        __int16 v96 = 2114;
        uint64_t v97 = v19;
        __int16 v98 = 2113;
        __int16 v99 = v21;
        _os_log_impl(&dword_1D422A000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: default user state: %{private}@", buf, 0x20u);
      }
      [*(id *)(a1 + 64) setDefaultUserState:*(void *)(a1 + 32)];
      id v22 = NSNumber;
      id v23 = [*(id *)(a1 + 56) music];
      __int16 v24 = objc_msgSend(v22, "numberWithInt:", objc_msgSend(v23, "cloudLibrarySyncStatus") == 1);
      [*(id *)(a1 + 64) setICloudMusicLibraryToggle:v24];

      objc_msgSend(*(id *)(a1 + 64), "setAgeVerificationRequired:", objc_msgSend(*(id *)(a1 + 32), "ageVerificationRequired"));
      uint64_t v25 = [*(id *)(a1 + 32) iTunesMatchSubscriptionStatus];
      [*(id *)(a1 + 64) setITunesMatchSubscriptionStatus:v25];

      __int16 v26 = [*(id *)(a1 + 32) userHistoryUnmodifiable];
      [*(id *)(a1 + 64) setUserHistoryUnmodifiable:v26];

      uint64_t v27 = [*(id *)(a1 + 32) userToken];
      [*(id *)(a1 + 64) setUserToken:v27];

      __int16 v28 = [*(id *)(a1 + 32) status];
      [*(id *)(a1 + 64) setStatus:v28];

      id v29 = [*(id *)(a1 + 32) userTokenStatus];
      [*(id *)(a1 + 64) setUserTokenStatus:v29];

      __int16 v30 = [*(id *)(a1 + 32) eligibleOffers];
      [*(id *)(a1 + 64) setEligibleOffers:v30];

      objc_msgSend(*(id *)(a1 + 64), "setIsPromotionRelatedStatus:", objc_msgSend(*(id *)(a1 + 32), "isPromotionRelatedStatus"));
      id v31 = [*(id *)(a1 + 56) music];
      __int16 v32 = [v31 cookies];
      __int16 v33 = [v32 xpab];
      [*(id *)(a1 + 64) setXpAbCookie:v33];

      if (!*(unsigned char *)(a1 + 121))
      {
        uint64_t v34 = [*(id *)(a1 + 64) userToken];
        uint64_t v35 = [v34 length];

        if (!v35) {
          ++*(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
        }
      }
    }
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id obj = [*(id *)(v1 + 72) allKeys];
    uint64_t v88 = [obj countByEnumeratingWithState:&v90 objects:v104 count:16];
    if (v88)
    {
      uint64_t v86 = *(void *)v91;
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v91 != v86) {
            objc_enumerationMutation(obj);
          }
          __int16 v37 = *(void **)(*((void *)&v90 + 1) + 8 * v36);
          id v38 = _MPLogCategoryAssistant();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v39 = *(void *)(v1 + 40);
            uint64_t v40 = *(void *)(v1 + 48);
            id v41 = [*(id *)(v1 + 56) shortDebugName];
            uint64_t v42 = [*(id *)(v1 + 72) objectForKeyedSubscript:v37];
            *(_DWORD *)buf = 138544387;
            uint64_t v95 = v39;
            __int16 v96 = 2114;
            uint64_t v97 = v40;
            __int16 v98 = 2113;
            __int16 v99 = v41;
            __int16 v100 = 2114;
            __int16 v101 = v37;
            __int16 v102 = 2113;
            __int16 v103 = v42;
            _os_log_impl(&dword_1D422A000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: account %{private}@ has shared user ID %{public}@:%{private}@", buf, 0x34u);
          }
          uint64_t v89 = v36;

          __int16 v43 = (void *)[*(id *)(v1 + 32) copy];
          if (!*(unsigned char *)(v1 + 121))
          {
            uint64_t v44 = [*(id *)(v1 + 72) objectForKeyedSubscript:v37];
            [v43 setSharedUserId:v44];
          }
          [v43 setSyncSharedUserId:v37];
          __int16 v45 = NSString;
          float v46 = [v43 syncSharedUserId];
          __int16 v47 = [v43 userHistoryUnmodifiable];
          float v48 = [v47 stringValue];
          uint64_t v49 = [v43 status];
          char v50 = @"NO";
          if ([v43 ageVerificationRequired]) {
            uint64_t v51 = @"YES";
          }
          else {
            uint64_t v51 = @"NO";
          }
          uint64_t v52 = [v43 defaultMediaPlaybackAppBundleIdentifier];
          if ([v43 isPromotionRelatedStatus]) {
            char v50 = @"YES";
          }
          id v53 = [v43 eligibleOffers];
          id v54 = [v45 stringWithFormat:@"UserState_v2_%@_%@_%@_%@_%@_%@_%@", v46, v48, v49, v51, v52, v50, v53];

          uint64_t v1 = a1;
          id v55 = _MPLogCategoryAssistant();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v56 = *(void *)(a1 + 40);
            uint64_t v57 = *(void *)(a1 + 48);
            uint64_t v58 = [*(id *)(a1 + 56) shortDebugName];
            uint64_t v59 = [v43 dictionary];
            *(_DWORD *)buf = 138544131;
            uint64_t v95 = v56;
            __int16 v96 = 2114;
            uint64_t v97 = v57;
            __int16 v98 = 2113;
            __int16 v99 = v58;
            __int16 v100 = 2113;
            __int16 v101 = v59;
            _os_log_impl(&dword_1D422A000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: %{private}@ user state: %{private}@", buf, 0x2Au);
          }
          os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 88) + 8) + 32));
          [*(id *)(a1 + 80) addObject:v43];
          id v60 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
          uint64_t v61 = [*(id *)(a1 + 56) dsid];
          [v60 setObject:v54 forKeyedSubscript:v61];

          os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 88) + 8) + 32));
          uint64_t v36 = v89 + 1;
        }
        while (v88 != v89 + 1);
        uint64_t v88 = [obj countByEnumeratingWithState:&v90 objects:v104 count:16];
      }
      while (v88);
    }

    if (![*(id *)(v1 + 72) count])
    {
      uint64_t v62 = [*(id *)(v1 + 56) homeUserIDs];
      uint64_t v63 = [v62 count];

      if (v63)
      {
        uint64_t v64 = _MPLogCategoryAssistant();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v65 = *(void *)(v1 + 40);
          uint64_t v66 = *(void *)(v1 + 48);
          uint64_t v67 = [*(id *)(v1 + 56) shortDebugName];
          *(_DWORD *)buf = 138543875;
          uint64_t v95 = v65;
          __int16 v96 = 2114;
          uint64_t v97 = v66;
          __int16 v98 = 2113;
          __int16 v99 = v67;
          _os_log_impl(&dword_1D422A000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: account %{private}@ has no shared user IDs", buf, 0x20u);
        }
        uint64_t v68 = _MPLogCategoryAssistant();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v69 = *(void *)(v1 + 40);
          uint64_t v70 = *(void *)(v1 + 48);
          uint64_t v71 = [*(id *)(v1 + 56) shortDebugName];
          id v72 = [*(id *)(v1 + 32) dictionary];
          *(_DWORD *)buf = 138544131;
          uint64_t v95 = v69;
          __int16 v96 = 2114;
          uint64_t v97 = v70;
          __int16 v98 = 2113;
          __int16 v99 = v71;
          __int16 v100 = 2113;
          __int16 v101 = v72;
          _os_log_impl(&dword_1D422A000, v68, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: %{private}@ user state: %{private}@", buf, 0x2Au);
        }
        id v73 = NSString;
        id v74 = [*(id *)(v1 + 32) userHistoryUnmodifiable];
        BOOL v75 = [v74 stringValue];
        id v76 = [*(id *)(v1 + 32) status];
        if ([*(id *)(v1 + 32) ageVerificationRequired]) {
          uint64_t v77 = @"YES";
        }
        else {
          uint64_t v77 = @"NO";
        }
        double v78 = [*(id *)(v1 + 32) defaultMediaPlaybackAppBundleIdentifier];
        double v79 = [v73 stringWithFormat:@"UserState_v2_%@_%@_%@_%@_%@", @"none", v75, v76, v77, v78];

        os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(v1 + 88) + 8) + 32));
        double v80 = *(void **)(v1 + 80);
        BOOL v81 = (void *)[*(id *)(v1 + 32) copy];
        [v80 addObject:v81];

        uint64_t v82 = *(void **)(*(void *)(*(void *)(v1 + 96) + 8) + 40);
        uint64_t v83 = [*(id *)(v1 + 56) dsid];
        [v82 setObject:v79 forKeyedSubscript:v83];

        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(v1 + 88) + 8) + 32));
      }
    }
  }
  else
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
  }
}

void sub_1D424E3DC(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F76E48]);
  [v4 setOrigin:a2];
  id v5 = objc_alloc_init(MEMORY[0x1E4F76E28]);
  uint64_t v6 = *(void *)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1D424EEB8;
  v11[3] = &unk_1E69E3E90;
  id v12 = v5;
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 40);
  __int16 v9 = *(void **)(a1 + 48);
  id v15 = v7;
  uint64_t v13 = v8;
  id v14 = v9;
  id v10 = v5;
  [v10 sendCommand:121 toDestination:v4 withOptions:v6 completion:v11];
}

void sub_1D424E4DC(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F76E30]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D424EC2C;
  v8[3] = &unk_1E69E3678;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v7 = v4;
  [v7 connectToEndpoint:a2 completion:v8];
}

void sub_1D424E5B0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
  else
  {
    id v4 = *(id *)(a1 + 40);
    id v5 = *(id *)(a1 + 48);
    MRAVEndpointGetMyGroupLeaderWithTimeout();
  }
}

void sub_1D424E68C(uint64_t a1, unsigned int a2)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) hashedRouteUIDs];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1D424E768;
  v6[3] = &unk_1E69E3C88;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  [v4 resolveWithHashedRouteIdentifiers:v5 audioRoutingInfo:a2 completion:v6];
}

void sub_1D424E768(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1D424E80C;
  v5[3] = &unk_1E69E3718;
  id v6 = *(id *)(a1 + 48);
  [v3 sendCommand:121 toDestination:a2 withOptions:v4 completion:v5];
}

void sub_1D424E80C(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4F965B8]);
  if (v9)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v5 = [v9 localizedFailureReason];
    uint64_t v6 = [v4 initWithReason:v5];

    id v3 = (id)v6;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [v3 dictionary];
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

void sub_1D424E8DC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    if (![*(id *)(*(void *)(a1 + 32) + 56) length])
    {
      __int16 v30 = [*(id *)(a1 + 32) aceId];
      uint64_t v31 = sub_1D4244ECC(@"Create Radio Station", v30);
      uint64_t v32 = *(void *)(a1 + 32);
      __int16 v33 = *(void **)(v32 + 56);
      *(void *)(v32 + 56) = v31;
    }
    uint64_t v13 = _MPLogCategoryAssistant();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    uint64_t v34 = *(void *)(*(void *)(a1 + 32) + 56);
    int v37 = 138543618;
    uint64_t v38 = v34;
    __int16 v39 = 2114;
    uint64_t v40 = a2;
    id v15 = "Create Radio Station (perform) <%{public}@>: group leader endpoint %{public}@";
    uint64_t v16 = v13;
    uint32_t v17 = 22;
    goto LABEL_17;
  }
  if ([v5 code] == 33)
  {
    uint64_t v7 = [v6 domain];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F77398]];

    if (v8)
    {
      if (![*(id *)(*(void *)(a1 + 32) + 56) length])
      {
        id v9 = [*(id *)(a1 + 32) aceId];
        uint64_t v10 = sub_1D4244ECC(@"Create Radio Station", v9);
        uint64_t v11 = *(void *)(a1 + 32);
        id v12 = *(void **)(v11 + 56);
        *(void *)(v11 + 56) = v10;
      }
      uint64_t v13 = _MPLogCategoryAssistant();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 56);
      int v37 = 138543362;
      uint64_t v38 = v14;
      id v15 = "Create Radio Station (perform) <%{public}@>: group leader legacy";
      uint64_t v16 = v13;
      uint32_t v17 = 12;
LABEL_17:
      _os_log_impl(&dword_1D422A000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v37, v17);
LABEL_18:

      (*(void (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, v35, v36);
      goto LABEL_19;
    }
  }
  id v18 = objc_alloc(MEMORY[0x1E4F965A8]);
  uint64_t v19 = [v6 localizedFailureReason];
  uint64_t v20 = (void *)[v18 initWithReason:v19];

  if (![*(id *)(*(void *)(a1 + 32) + 56) length])
  {
    id v21 = [*(id *)(a1 + 32) aceId];
    uint64_t v22 = sub_1D4244ECC(@"Create Radio Station", v21);
    uint64_t v23 = *(void *)(a1 + 32);
    __int16 v24 = *(void **)(v23 + 56);
    *(void *)(v23 + 56) = v22;
  }
  uint64_t v25 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 56);
    uint64_t v27 = [v20 dictionary];
    int v37 = 138543618;
    uint64_t v38 = v26;
    __int16 v39 = 2114;
    uint64_t v40 = v27;
    _os_log_impl(&dword_1D422A000, v25, OS_LOG_TYPE_ERROR, "Create Radio Station (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v37, 0x16u);
  }
  uint64_t v28 = *(void *)(a1 + 48);
  id v29 = [v20 dictionary];
  (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v29);

LABEL_19:
}

void sub_1D424EC2C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = *(id *)(a1 + 32);
  if (v6)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v9 = [v6 localizedFailureReason];
    uint64_t v10 = (void *)[v8 initWithReason:v9];

    if (![*(id *)(*(void *)(a1 + 40) + 56) length])
    {
      uint64_t v11 = [*(id *)(a1 + 40) aceId];
      uint64_t v12 = sub_1D4244ECC(@"Create Radio Station", v11);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void **)(v13 + 56);
      *(void *)(v13 + 56) = v12;
    }
    id v15 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 56);
      uint32_t v17 = [v10 dictionary];
      int v26 = 138543618;
      uint64_t v27 = v16;
      __int16 v28 = 2114;
      id v29 = v17;
      _os_log_impl(&dword_1D422A000, v15, OS_LOG_TYPE_ERROR, "Create Radio Station (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v26, 0x16u);
    }
    uint64_t v18 = *(void *)(a1 + 56);
    uint64_t v19 = [v10 dictionary];
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
  }
  else
  {
    if (![*(id *)(*(void *)(a1 + 40) + 56) length])
    {
      uint64_t v20 = [*(id *)(a1 + 40) aceId];
      uint64_t v21 = sub_1D4244ECC(@"Create Radio Station", v20);
      uint64_t v22 = *(void *)(a1 + 40);
      uint64_t v23 = *(void **)(v22 + 56);
      *(void *)(v22 + 56) = v21;
    }
    __int16 v24 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 56);
      int v26 = 138543618;
      uint64_t v27 = v25;
      __int16 v28 = 2114;
      id v29 = a2;
      _os_log_impl(&dword_1D422A000, v24, OS_LOG_TYPE_DEFAULT, "Create Radio Station (connection) <%{public}@>: connected to: %{public}@", (uint8_t *)&v26, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_1D424EEB8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = *(id *)(a1 + 32);
  if (*(void *)(a1 + 56))
  {
    if (sub_1D4245204(a3))
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F965B8]);
      if (![*(id *)(*(void *)(a1 + 40) + 56) length])
      {
        id v7 = [*(id *)(a1 + 40) aceId];
        uint64_t v8 = sub_1D4244ECC(@"Create Radio Station", v7);
        uint64_t v9 = *(void *)(a1 + 40);
        uint64_t v10 = *(void **)(v9 + 56);
        *(void *)(v9 + 56) = v8;
      }
      uint64_t v11 = _MPLogCategoryAssistant();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 56);
      uint64_t v13 = [v6 dictionary];
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v12;
      __int16 v24 = 2114;
      uint64_t v25 = v13;
      _os_log_impl(&dword_1D422A000, v11, OS_LOG_TYPE_DEFAULT, "Create Radio Station (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    else
    {
      uint64_t v11 = [NSString stringWithFormat:@"The system media app reported that creating the station was unsuccessful. (stationURL = %@)", *(void *)(a1 + 48)];
      id v6 = (id)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:v11];
      if (![*(id *)(*(void *)(a1 + 40) + 56) length])
      {
        uint64_t v14 = [*(id *)(a1 + 40) aceId];
        uint64_t v15 = sub_1D4244ECC(@"Create Radio Station", v14);
        uint64_t v16 = *(void *)(a1 + 40);
        uint32_t v17 = *(void **)(v16 + 56);
        *(void *)(v16 + 56) = v15;
      }
      uint64_t v13 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 56);
        uint64_t v19 = [v6 dictionary];
        *(_DWORD *)buf = 138543618;
        uint64_t v23 = v18;
        __int16 v24 = 2114;
        uint64_t v25 = v19;
        _os_log_impl(&dword_1D422A000, v13, OS_LOG_TYPE_ERROR, "Create Radio Station (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
      }
    }

LABEL_12:
    uint64_t v20 = *(void *)(a1 + 56);
    uint64_t v21 = [v6 dictionary];
    (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v21);
  }
}

void sub_1D424F3F4(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = *(id *)(a1 + 32);
  id v5 = (void *)[a2 mutableCopy];
  id v6 = [*(id *)(a1 + 40) groupID];
  char v7 = [v6 isEqualToString:@"LOCAL_DEVICE"];

  if (v7)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 40) groupID];
    uint64_t v10 = [v5 allKeysForObject:v9];
    uint64_t v8 = [v10 firstObject];

    if (!*(unsigned char *)(a1 + 56)) {
      [v5 removeObjectForKey:v8];
    }
  }
  uint64_t v11 = [v5 allKeys];
  uint64_t v12 = [v11 count];
  uint64_t v13 = [*(id *)(a1 + 40) hashedRouteUIDs];
  uint64_t v14 = [v13 count];

  if (v12 == v14)
  {
    id v25 = *(id *)(a1 + 48);
    MRAVEndpointRemoveOutputDevicesFromGroupFromSource();
  }
  else
  {
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"UID decoding error"];
    if (![*(id *)(*(void *)(a1 + 40) + 56) length])
    {
      uint64_t v16 = [*(id *)(a1 + 40) aceId];
      uint64_t v17 = sub_1D4244ECC(@"Remove Output Devices From Group", v16);
      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v19 = *(void **)(v18 + 56);
      *(void *)(v18 + 56) = v17;
    }
    uint64_t v20 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 56);
      uint64_t v22 = [v15 dictionary];
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v21;
      __int16 v28 = 2114;
      id v29 = v22;
      _os_log_impl(&dword_1D422A000, v20, OS_LOG_TYPE_ERROR, "Remove Output Devices From Group (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    uint64_t v23 = *(void *)(a1 + 48);
    __int16 v24 = [v15 dictionary];
    (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);
  }
}

void sub_1D424F6E0(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v5 = [v3 localizedFailureReason];
    id v6 = (id)[v4 initWithReason:v5];

    if (![*(id *)(*(void *)(a1 + 32) + 56) length])
    {
      char v7 = [*(id *)(a1 + 32) aceId];
      uint64_t v8 = sub_1D4244ECC(@"Remove Output Devices From Group", v7);
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void **)(v9 + 56);
      *(void *)(v9 + 56) = v8;
    }
    uint64_t v11 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 56);
      uint64_t v13 = [v6 dictionary];
      int v23 = 138543618;
      uint64_t v24 = v12;
      __int16 v25 = 2114;
      uint64_t v26 = v13;
      uint64_t v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_1D422A000, v14, v15, "Remove Output Devices From Group (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v23, 0x16u);
    }
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F968B0]);
    [v6 setRouteResponse:*MEMORY[0x1E4F973D8]];
    if (![*(id *)(*(void *)(a1 + 32) + 56) length])
    {
      uint64_t v16 = [*(id *)(a1 + 32) aceId];
      uint64_t v17 = sub_1D4244ECC(@"Remove Output Devices From Group", v16);
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = *(void **)(v18 + 56);
      *(void *)(v18 + 56) = v17;
    }
    uint64_t v11 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 56);
      uint64_t v13 = [v6 dictionary];
      int v23 = 138543618;
      uint64_t v24 = v20;
      __int16 v25 = 2114;
      uint64_t v26 = v13;
      uint64_t v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }
  }

  uint64_t v21 = *(void *)(a1 + 40);
  uint64_t v22 = [v6 dictionary];
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);
}

void sub_1D424FC28(uint64_t a1, unsigned int a2)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) hashedRouteUIDs];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D424FD1C;
  v8[3] = &unk_1E69E3EB8;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = *(id *)(a1 + 72);
  [v4 resolveWithHashedRouteIdentifiers:v5 audioRoutingInfo:a2 completion:v8];
}

void sub_1D424FD1C(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D424FDEC;
  v9[3] = &unk_1E69E3E90;
  id v10 = v4;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void **)(a1 + 64);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v8;
  [v10 sendCommand:4 toDestination:a2 withOptions:v5 completion:v9];
}

void sub_1D424FDEC(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = objc_alloc_init(MEMORY[0x1E4F965B8]);
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setObject:@"Skip To Next Item" forKeyedSubscript:@"pluginname"];
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"success"];
  uint64_t v7 = NSNumber;
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  id v9 = [v7 numberWithDouble:fabs(v8)];
  [v6 setObject:v9 forKeyedSubscript:@"duration"];

  if (v3)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v11 = [v3 localizedDescription];
    uint64_t v12 = [v10 initWithReason:v11];

    [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"success"];
    id v13 = [v3 localizedDescription];
    [v6 setObject:v13 forKeyedSubscript:@"errorstring"];

    id v5 = (id)v12;
  }
  if (![*(id *)(*(void *)(a1 + 48) + 56) length])
  {
    uint64_t v14 = [*(id *)(a1 + 48) aceId];
    uint64_t v15 = sub_1D4244ECC(@"Skip To Next Item", v14);
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = *(void **)(v16 + 56);
    *(void *)(v16 + 56) = v15;
  }
  uint64_t v18 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 56);
    uint64_t v20 = [v5 dictionary];
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v19;
    __int16 v27 = 2114;
    __int16 v28 = v20;
    _os_log_impl(&dword_1D422A000, v18, OS_LOG_TYPE_DEFAULT, "Skip To Next Item (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
  }
  uint64_t v21 = *(void *)(a1 + 56);
  uint64_t v22 = [v5 dictionary];
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  uint64_t v24 = v6;
  id v23 = v6;
  AnalyticsSendEventLazy();
}

id sub_1D42500E4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

__CFString *sub_1D42500EC()
{
  uint64_t v0 = @"x-sampmedentity";
  return @"x-sampmedentity";
}

id sub_1D425011C(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = [a1 valueForProperty:*MEMORY[0x1E4F31420]];
  char v6 = [v5 integerValue];

  if (v6)
  {
    double v8 = (Class *)0x1E4F96868;
  }
  else if ((v6 & 2) != 0)
  {
    double v8 = (Class *)0x1E4F96840;
  }
  else if ((v6 & 4) != 0)
  {
    double v8 = (Class *)0x1E4F967C8;
  }
  else
  {
    if ((v6 & 0x20) == 0)
    {
      id v7 = 0;
      goto LABEL_11;
    }
    double v8 = (Class *)0x1E4F96850;
  }
  id v7 = objc_alloc_init(*v8);
LABEL_11:
  if (a3 == 1)
  {
    id v9 = sub_1D4232988(a1);
  }
  else
  {
    id v9 = 0;
  }
  [v7 setIdentifier:v9];

  return v7;
}

id sub_1D4250200(void *a1)
{
  uint64_t v1 = [a1 metricsContext];
  id v2 = [v1 dataUsingEncoding:4];

  if (v2)
  {
    id v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v2 options:0 error:0];
    id v4 = 0;
    if (_NSIsNSDictionary())
    {
      id v5 = [v3 objectForKey:@"WHAMetrics"];
      if (_NSIsNSDictionary()) {
        id v4 = v5;
      }
      else {
        id v4 = 0;
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void sub_1D4250580(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v3 allKeys];
  if (!v3)
  {
    char v6 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"UID decoding error"];
    if (![*(id *)(*(void *)(a1 + 40) + 64) length])
    {
      id v7 = [*(id *)(a1 + 40) aceId];
      uint64_t v8 = sub_1D4244ECC(@"Set Volume Level", v7);
      id v9 = *(void **)(*(void *)(a1 + 40) + 64);
      *(void *)(*(void *)(a1 + 40) + 64) = v8;
    }
    id v10 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 64);
      uint64_t v12 = [v6 dictionary];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_1D422A000, v10, OS_LOG_TYPE_ERROR, "Set Volume Level (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = [v6 dictionary];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  float v46 = sub_1D42509FC;
  __int16 v47 = sub_1D4250A0C;
  id v48 = objc_alloc_init(MEMORY[0x1E4F965A8]);
  dispatch_group_t v15 = dispatch_group_create();
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = sub_1D4250A14;
  v41[3] = &unk_1E69E3790;
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v42 = v16;
  uint64_t v43 = v17;
  uint64_t v44 = buf;
  uint64_t v18 = (void *)MEMORY[0x1D94452A0](v41);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = sub_1D4250B00;
  v36[3] = &unk_1E69E37E0;
  v36[4] = *(void *)(a1 + 40);
  id v19 = v5;
  id v37 = v19;
  id v20 = v18;
  id v39 = v20;
  uint64_t v21 = v16;
  uint64_t v38 = v21;
  uint64_t v40 = buf;
  uint64_t v22 = (void *)MEMORY[0x1D94452A0](v36);
  id v23 = objc_alloc_init(MEMORY[0x1E4F76E38]);
  uint64_t v24 = *(void *)(a1 + 40);
  __int16 v25 = *(void **)(v24 + 56);
  *(void *)(v24 + 56) = v23;

  dispatch_group_enter(v21);
  uint64_t v26 = *(void **)(*(void *)(a1 + 40) + 56);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_1D42512AC;
  v33[3] = &unk_1E69E3830;
  __int16 v27 = v21;
  uint64_t v34 = v27;
  id v28 = v22;
  id v35 = v28;
  [v26 discoverRemoteControlEndpointsMatchingUIDs:v19 completion:v33];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D4251460;
  block[3] = &unk_1E69E3858;
  uint64_t v29 = *(void **)(a1 + 48);
  void block[4] = *(void *)(a1 + 40);
  uint64_t v32 = buf;
  id v31 = v29;
  dispatch_group_notify(v27, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(buf, 8);
}

void sub_1D42509DC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D42509FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1D4250A0C(uint64_t a1)
{
}

void sub_1D4250A14(uint64_t a1, const void *a2, void *a3)
{
  id v5 = a3;
  CFRetain(a2);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  int8x16_t v7 = *(int8x16_t *)(a1 + 32);
  id v6 = (id)v7.i64[0];
  MRAVEndpointSetOutputDeviceUIDVolume();
}

void sub_1D4250B00(uint64_t a1, void *a2)
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(*(void *)(a1 + 32) + 64) length])
  {
    id v3 = [*(id *)(a1 + 32) aceId];
    uint64_t v4 = sub_1D4244ECC(@"Set Volume Level", v3);
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v4;
  }
  int8x16_t v7 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = v8[8];
    id v10 = [v8 volumeValue];
    [v10 floatValue];
    *(_DWORD *)buf = 138543874;
    uint64_t v85 = v9;
    __int16 v86 = 2048;
    double v87 = v11;
    __int16 v88 = 2114;
    uint64_t v89 = a2;
    _os_log_impl(&dword_1D422A000, v7, OS_LOG_TYPE_DEFAULT, "Set Volume Level (setvolume) <%{public}@>: volume: %f endpoint %{public}@", buf, 0x20u);
  }
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id obj = (id)MRAVEndpointCopyOutputDevices();
  uint64_t v12 = [obj countByEnumeratingWithState:&v78 objects:v83 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v79;
    uint64_t v67 = *MEMORY[0x1E4F97510];
    uint64_t v64 = *MEMORY[0x1E4F97508];
    uint64_t v63 = *MEMORY[0x1E4F97500];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v79 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v78 + 1) + 8 * i);
        uint64_t v17 = [v16 uid];
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v18 = *(id *)(a1 + 40);
        uint64_t v19 = [v18 countByEnumeratingWithState:&v74 objects:v82 count:16];
        if (!v19) {
          goto LABEL_25;
        }
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v75;
        while (2)
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v75 != v21) {
              objc_enumerationMutation(v18);
            }
            if ([v16 containsUID:*(void *)(*((void *)&v74 + 1) + 8 * j)])
            {

              id v23 = [*(id *)(a1 + 32) actionType];
              int v24 = [v23 isEqualToString:v67];

              __int16 v25 = *(id **)(a1 + 32);
              if (v24)
              {
                if (![v25[8] length])
                {
                  uint64_t v26 = [*(id *)(a1 + 32) aceId];
                  uint64_t v27 = sub_1D4244ECC(@"Set Volume Level", v26);
                  uint64_t v28 = *(void *)(a1 + 32);
                  uint64_t v29 = *(void **)(v28 + 64);
                  *(void *)(v28 + 64) = v27;
                }
                uint64_t v30 = _MPLogCategoryAssistant();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  id v31 = *(void **)(a1 + 32);
                  uint64_t v32 = v31[8];
                  __int16 v33 = [v31 volumeValue];
                  [v33 floatValue];
                  *(_DWORD *)buf = 138543874;
                  uint64_t v85 = v32;
                  __int16 v86 = 2048;
                  double v87 = v34;
                  __int16 v88 = 2114;
                  uint64_t v89 = v17;
                  _os_log_impl(&dword_1D422A000, v30, OS_LOG_TYPE_DEFAULT, "Set Volume Level (setvolume) <%{public}@>: set volume: %f outputDeviceUID %{public}@", buf, 0x20u);
                }
                uint64_t v35 = *(void *)(a1 + 56);
                id v18 = [*(id *)(a1 + 32) volumeValue];
                [v18 floatValue];
                (*(void (**)(uint64_t, void *, void *))(v35 + 16))(v35, a2, v17);
                goto LABEL_25;
              }
              uint64_t v36 = [v25 actionType];
              int v37 = [v36 isEqualToString:v64];

              uint64_t v38 = *(id **)(a1 + 32);
              if (v37)
              {
                if (![v38[8] length])
                {
                  id v39 = [*(id *)(a1 + 32) aceId];
                  uint64_t v40 = sub_1D4244ECC(@"Set Volume Level", v39);
                  uint64_t v41 = *(void *)(a1 + 32);
                  uint64_t v42 = *(void **)(v41 + 64);
                  *(void *)(v41 + 64) = v40;
                }
                uint64_t v43 = _MPLogCategoryAssistant();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v44 = *(void **)(a1 + 32);
                  uint64_t v45 = v44[8];
                  float v46 = [v44 volumeValue];
                  [v46 floatValue];
                  *(_DWORD *)buf = 138543874;
                  uint64_t v85 = v45;
                  __int16 v86 = 2048;
                  double v87 = v47;
                  __int16 v88 = 2114;
                  uint64_t v89 = v17;
                  _os_log_impl(&dword_1D422A000, v43, OS_LOG_TYPE_DEFAULT, "Set Volume Level (setvolume) <%{public}@>: increase volume: %f outputDeviceUID %{public}@", buf, 0x20u);
                }
                dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
                CFRetain(a2);
                id v73 = *(id *)(a1 + 56);
                id v71 = v17;
                id v72 = *(id *)(a1 + 48);
                MRAVEndpointGetOutputDeviceUIDVolume();

                id v48 = v73;
              }
              else
              {
                uint64_t v49 = [v38 actionType];
                int v50 = [v49 isEqualToString:v63];

                if (!v50)
                {
                  id v60 = objc_alloc_init(MEMORY[0x1E4F965A8]);
                  uint64_t v61 = *(void *)(*(void *)(a1 + 64) + 8);
                  uint64_t v62 = *(void **)(v61 + 40);
                  *(void *)(v61 + 40) = v60;

                  goto LABEL_40;
                }
                if (![*(id *)(*(void *)(a1 + 32) + 64) length])
                {
                  uint64_t v51 = [*(id *)(a1 + 32) aceId];
                  uint64_t v52 = sub_1D4244ECC(@"Set Volume Level", v51);
                  uint64_t v53 = *(void *)(a1 + 32);
                  id v54 = *(void **)(v53 + 64);
                  *(void *)(v53 + 64) = v52;
                }
                id v55 = _MPLogCategoryAssistant();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v56 = *(void **)(a1 + 32);
                  uint64_t v57 = v56[8];
                  uint64_t v58 = [v56 volumeValue];
                  [v58 floatValue];
                  *(_DWORD *)buf = 138543874;
                  uint64_t v85 = v57;
                  __int16 v86 = 2048;
                  double v87 = v59;
                  __int16 v88 = 2114;
                  uint64_t v89 = v17;
                  _os_log_impl(&dword_1D422A000, v55, OS_LOG_TYPE_DEFAULT, "Set Volume Level (setvolume) <%{public}@>: decrease volume: %f outputDeviceUID %{public}@", buf, 0x20u);
                }
                dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
                CFRetain(a2);
                id v70 = *(id *)(a1 + 56);
                id v68 = v17;
                id v69 = *(id *)(a1 + 48);
                MRAVEndpointGetOutputDeviceUIDVolume();

                id v48 = v70;
              }

              goto LABEL_40;
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v74 objects:v82 count:16];
          if (v20) {
            continue;
          }
          break;
        }
LABEL_25:

LABEL_40:
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v78 objects:v83 count:16];
    }
    while (v13);
  }
}

void sub_1D42512AC(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * v6);
        id v8 = objc_alloc_init(MEMORY[0x1E4F76E30]);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = sub_1D42515BC;
        v11[3] = &unk_1E69E3808;
        id v12 = v8;
        id v14 = *(id *)(a1 + 40);
        uint64_t v15 = v7;
        id v13 = *(id *)(a1 + 32);
        id v9 = v8;
        [v9 connectToEndpoint:v7 completion:v11];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1D4251460(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(*(void *)(a1 + 32) + 64) length])
  {
    id v2 = [*(id *)(a1 + 32) aceId];
    uint64_t v3 = sub_1D4244ECC(@"Set Volume Level", v2);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 64);
    *(void *)(v4 + 64) = v3;
  }
  uint64_t v6 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 64);
    id v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) dictionary];
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl(&dword_1D422A000, v6, OS_LOG_TYPE_DEFAULT, "Set Volume Level (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) dictionary];
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
}

void sub_1D42515BC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
  id v5 = *(id *)(a1 + 32);
  v4(v2, v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1D4251634(uint64_t a1, void *a2, float a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = _MPLogCategoryAssistant();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_msgSend(v5, "msv_description");
      int v13 = 134218242;
      double v14 = a3;
      __int16 v15 = 2114;
      long long v16 = v8;
      _os_log_impl(&dword_1D422A000, v7, OS_LOG_TYPE_ERROR, "volume: %f error=%{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      double v14 = a3;
      _os_log_impl(&dword_1D422A000, v7, OS_LOG_TYPE_DEFAULT, "volume: %f", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v9 = [*(id *)(a1 + 32) volumeValue];
    [v9 floatValue];
    float v11 = v10 + a3;

    v12.n128_u32[0] = 1.0;
    if (v11 <= 1.0) {
      v12.n128_f32[0] = v11;
    }
    (*(void (**)(__n128))(*(void *)(a1 + 56) + 16))(v12);
  }
  CFRelease(*(CFTypeRef *)(a1 + 64));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_1D42517B8(uint64_t a1, void *a2, float a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = _MPLogCategoryAssistant();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_msgSend(v5, "msv_description");
      int v12 = 134218242;
      double v13 = a3;
      __int16 v14 = 2114;
      __int16 v15 = v8;
      _os_log_impl(&dword_1D422A000, v7, OS_LOG_TYPE_ERROR, "volume: %f error=%{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      double v13 = a3;
      _os_log_impl(&dword_1D422A000, v7, OS_LOG_TYPE_DEFAULT, "volume: %f", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v9 = [*(id *)(a1 + 32) volumeValue];
    [v9 floatValue];
    float v11 = a3 - v10;

    (*(void (**)(float))(*(void *)(a1 + 56) + 16))(fmaxf(v11, 0.0));
  }
  CFRelease(*(CFTypeRef *)(a1 + 64));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_1D4251938(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 64) length];
  if (a2)
  {
    if (!v4)
    {
      id v5 = [*(id *)(a1 + 32) aceId];
      uint64_t v6 = sub_1D4244ECC(@"Set Volume Level", v5);
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(void **)(v7 + 64);
      *(void *)(v7 + 64) = v6;
    }
    uint64_t v9 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 64);
      int v20 = 138543618;
      uint64_t v21 = v10;
      __int16 v22 = 2114;
      double v23 = *(double *)&a2;
      _os_log_impl(&dword_1D422A000, v9, OS_LOG_TYPE_ERROR, "Set Volume Level (setvolume) <%{public}@>: volume set failed with error: %{public}@", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    if (!v4)
    {
      float v11 = [*(id *)(a1 + 32) aceId];
      uint64_t v12 = sub_1D4244ECC(@"Set Volume Level", v11);
      uint64_t v13 = *(void *)(a1 + 32);
      __int16 v14 = *(void **)(v13 + 64);
      *(void *)(v13 + 64) = v12;
    }
    __int16 v15 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 64);
      double v17 = *(float *)(a1 + 64);
      int v20 = 138543618;
      uint64_t v21 = v16;
      __int16 v22 = 2048;
      double v23 = v17;
      _os_log_impl(&dword_1D422A000, v15, OS_LOG_TYPE_DEFAULT, "Set Volume Level (setvolume) <%{public}@>: new volume: %f", (uint8_t *)&v20, 0x16u);
    }

    id v18 = objc_alloc_init(MEMORY[0x1E4F965B8]);
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v9 = *(NSObject **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }

  CFRelease(*(CFTypeRef *)(a1 + 56));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1D4251C38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 48)];
  if (!a3 && MRPlaybackQueueGetContentItemsCount())
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = (id)MRPlaybackQueueCopyContentItems();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          float v11 = (void *)MRContentItemCopyNowPlayingInfo();
          uint64_t v12 = sub_1D4244A24(v11);
          objc_msgSend(v5, "addObject:", v12, v13);

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1D4252428(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1D4252468(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = *(id *)(a1 + 32);
  id v5 = [a2 allKeys];
  if (a2)
  {
    id v6 = (const void *)MRAVReconnaissanceSessionCreateWithEndpointFeatures();
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
    id v17 = *(id *)(a1 + 48);
    id v18 = *(id *)(a1 + 56);
    MRAVReconnaissanceSessionBeginSearch();
    CFRelease(v6);

    uint64_t v7 = v17;
  }
  else
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"UID decoding error"];
    if (![*(id *)(*(void *)(a1 + 40) + 56) length])
    {
      uint64_t v8 = [*(id *)(a1 + 40) aceId];
      uint64_t v9 = sub_1D4244ECC(@"Get Now Playing Queue Details", v8);
      uint64_t v10 = *(void *)(a1 + 40);
      float v11 = *(void **)(v10 + 56);
      *(void *)(v10 + 56) = v9;
    }
    uint64_t v12 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 56);
      long long v14 = [v7 dictionary];
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v13;
      __int16 v21 = 2114;
      __int16 v22 = v14;
      _os_log_impl(&dword_1D422A000, v12, OS_LOG_TYPE_ERROR, "Get Now Playing Queue Details (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    uint64_t v15 = *(void *)(a1 + 56);
    long long v16 = [v7 dictionary];
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
  }
}

void sub_1D42526BC(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (![*(id *)(*(void *)(a1 + 32) + 56) length])
    {
      id v4 = [*(id *)(a1 + 32) aceId];
      uint64_t v5 = sub_1D4244ECC(@"Get Now Playing Queue Details", v4);
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void **)(v6 + 56);
      *(void *)(v6 + 56) = v5;
    }
    uint64_t v8 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 56);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      uint64_t v13 = a2;
      _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_ERROR, "Get Now Playing Queue Details (default) <%{public}@>: leader %{public}@", (uint8_t *)&v10, 0x16u);
    }

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = MRAVEndpointCopyOrigin();
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = MRMediaRemoteGetLocalOrigin();
    CFRetain(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1D4252814(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setPreviousItems:a2];
  uint64_t v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void sub_1D4252854(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setNextItems:a2];
  uint64_t v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void sub_1D4252894(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  if (![*(id *)(*(void *)(a1 + 32) + 56) length])
  {
    uint64_t v2 = [*(id *)(a1 + 32) aceId];
    uint64_t v3 = sub_1D4244ECC(@"Get Now Playing Queue Details", v2);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;
  }
  uint64_t v6 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 56);
    uint64_t v8 = [*(id *)(a1 + 40) dictionary];
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1D422A000, v6, OS_LOG_TYPE_DEFAULT, "Get Now Playing Queue Details (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 48);
  int v10 = [*(id *)(a1 + 40) dictionary];
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
}

void sub_1D42529EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CFRelease(*(CFTypeRef *)(a1 + 64));
  if (a4)
  {
    uint64_t v7 = *(NSObject **)(a1 + 32);
    dispatch_group_leave(v7);
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F76E30]);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1D4252B00;
    v14[3] = &unk_1E69E3880;
    uint64_t v9 = *(void *)(a1 + 56);
    id v15 = v8;
    uint64_t v19 = v9;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void **)(a1 + 48);
    id v16 = v10;
    uint64_t v17 = v11;
    id v18 = v12;
    id v13 = v8;
    [v13 connectToEndpoint:a3 completion:v14];
  }
}

void sub_1D4252B00(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = *(id *)(a1 + 32);
  if (v6)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F965A8]);
    uint64_t v9 = [v6 localizedFailureReason];
    id v10 = (void *)[v8 initWithReason:v9];

    if (![*(id *)(*(void *)(a1 + 48) + 56) length])
    {
      uint64_t v11 = [*(id *)(a1 + 48) aceId];
      uint64_t v12 = sub_1D4244ECC(@"Get Now Playing Queue Details", v11);
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v14 = *(void **)(v13 + 56);
      *(void *)(v13 + 56) = v12;
    }
    id v15 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 56);
      uint64_t v17 = [v10 dictionary];
      int v20 = 138543618;
      uint64_t v21 = v16;
      __int16 v22 = 2114;
      uint64_t v23 = v17;
      _os_log_impl(&dword_1D422A000, v15, OS_LOG_TYPE_ERROR, "Get Now Playing Queue Details (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v20, 0x16u);
    }
    uint64_t v18 = *(void *)(a1 + 56);
    uint64_t v19 = [v10 dictionary];
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a3;
    CFRetain(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void sub_1D4252F80(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = (void *)[a2 mutableCopy];
  id v6 = [*(id *)(a1 + 40) groupID];
  char v7 = [v6 isEqualToString:@"LOCAL_DEVICE"];

  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 40) groupID];
    id v10 = [v5 allKeysForObject:v9];
    id v8 = [v10 firstObject];

    if (!*(unsigned char *)(a1 + 56)) {
      [v5 removeObjectForKey:v8];
    }
  }
  uint64_t v11 = [v5 allKeys];
  uint64_t v12 = [v11 count];
  uint64_t v13 = [*(id *)(a1 + 40) hashedRouteUIDs];
  uint64_t v14 = [v13 count];

  if (v12 == v14)
  {
    id v25 = *(id *)(a1 + 48);
    MRAVEndpointAddOutputDevicesToGroupFromSource();
  }
  else
  {
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"UID decoding error"];
    if (![*(id *)(*(void *)(a1 + 40) + 56) length])
    {
      uint64_t v16 = [*(id *)(a1 + 40) aceId];
      uint64_t v17 = sub_1D4244ECC(@"Add Output Devices To Group", v16);
      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v19 = *(void **)(v18 + 56);
      *(void *)(v18 + 56) = v17;
    }
    int v20 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 56);
      __int16 v22 = [v15 dictionary];
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v21;
      __int16 v28 = 2114;
      uint64_t v29 = v22;
      _os_log_impl(&dword_1D422A000, v20, OS_LOG_TYPE_ERROR, "Add Output Devices To Group (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    uint64_t v23 = *(void *)(a1 + 48);
    uint64_t v24 = [v15 dictionary];
    (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);
  }
}

void sub_1D425326C(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F965A8]);
    uint64_t v5 = [v3 localizedFailureReason];
    id v6 = (id)[v4 initWithReason:v5];

    if (![*(id *)(*(void *)(a1 + 32) + 56) length])
    {
      char v7 = [*(id *)(a1 + 32) aceId];
      uint64_t v8 = sub_1D4244ECC(@"Add Output Devices To Group", v7);
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 56);
      *(void *)(v9 + 56) = v8;
    }
    uint64_t v11 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 56);
      uint64_t v13 = [v6 dictionary];
      int v23 = 138543618;
      uint64_t v24 = v12;
      __int16 v25 = 2114;
      uint64_t v26 = v13;
      uint64_t v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_1D422A000, v14, v15, "Add Output Devices To Group (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v23, 0x16u);
    }
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F96890]);
    [v6 setRouteResponse:*MEMORY[0x1E4F973D8]];
    if (![*(id *)(*(void *)(a1 + 32) + 56) length])
    {
      uint64_t v16 = [*(id *)(a1 + 32) aceId];
      uint64_t v17 = sub_1D4244ECC(@"Add Output Devices To Group", v16);
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = *(void **)(v18 + 56);
      *(void *)(v18 + 56) = v17;
    }
    uint64_t v11 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 56);
      uint64_t v13 = [v6 dictionary];
      int v23 = 138543618;
      uint64_t v24 = v20;
      __int16 v25 = 2114;
      uint64_t v26 = v13;
      uint64_t v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }
  }

  uint64_t v21 = *(void *)(a1 + 40);
  __int16 v22 = [v6 dictionary];
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);
}

void sub_1D425387C(uint64_t a1, unsigned int a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) hashedRouteUIDs];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D4253978;
  v8[3] = &unk_1E69E39C0;
  id v9 = *(id *)(a1 + 48);
  int v14 = *(_DWORD *)(a1 + 80);
  id v10 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = *(id *)(a1 + 72);
  [v4 resolveWithHashedRouteIdentifiers:v5 audioRoutingInfo:a2 completion:v8];
}

void sub_1D4253978(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 72);
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1D4253A54;
  v10[3] = &unk_1E69E3E90;
  id v11 = v5;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  id v9 = *(void **)(a1 + 64);
  id v12 = v7;
  uint64_t v13 = v8;
  id v14 = v9;
  [v11 sendCommand:v4 toDestination:a2 withOptions:v6 completion:v10];
}

void sub_1D4253A54(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = objc_alloc_init(MEMORY[0x1E4F965B8]);
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setObject:@"Skip Time Interval" forKeyedSubscript:@"pluginname"];
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"success"];
  id v7 = NSNumber;
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  id v9 = [v7 numberWithDouble:fabs(v8)];
  [v6 setObject:v9 forKeyedSubscript:@"duration"];

  if (v3)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v11 = [v3 localizedDescription];
    uint64_t v12 = [v10 initWithReason:v11];

    [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"success"];
    uint64_t v13 = [v3 localizedDescription];
    [v6 setObject:v13 forKeyedSubscript:@"errorstring"];

    id v5 = (id)v12;
  }
  if (![*(id *)(*(void *)(a1 + 48) + 56) length])
  {
    id v14 = [*(id *)(a1 + 48) aceId];
    uint64_t v15 = sub_1D4244ECC(@"Skip Time Interval", v14);
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = *(void **)(v16 + 56);
    *(void *)(v16 + 56) = v15;
  }
  uint64_t v18 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 56);
    uint64_t v20 = [v5 dictionary];
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v19;
    __int16 v27 = 2114;
    __int16 v28 = v20;
    _os_log_impl(&dword_1D422A000, v18, OS_LOG_TYPE_DEFAULT, "Skip Time Interval (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
  }
  uint64_t v21 = *(void *)(a1 + 56);
  __int16 v22 = [v5 dictionary];
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  uint64_t v24 = v6;
  id v23 = v6;
  AnalyticsSendEventLazy();
}

id sub_1D4253D4C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t sub_1D4253E48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_1D4253E58(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [a1 MPMediaGroupingForScheme];
  if (v11 == 1)
  {
    uint64_t v12 = [a1 MPMediaItemQueryOnlyPlayableItems:1 withUserIdentity:v8 plugin:v9 hash:v10];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F31928] persistentIDPropertyForGroupingType:v11];
    id v14 = v13;
    if (v13 && ([v13 isEqualToString:*MEMORY[0x1E4F31430]] & 1) == 0)
    {
      uint64_t v15 = [a1 identifier];
      uint64_t v16 = v15;
      if (v15)
      {
        uint64_t v17 = [v15 path];
        uint64_t v18 = [v17 lastPathComponent];
        uint64_t v19 = [v18 longLongValue];

        uint64_t v20 = (void *)MEMORY[0x1E4F31968];
        uint64_t v21 = [NSNumber numberWithLongLong:v19];
        __int16 v22 = [v20 predicateWithValue:v21 forProperty:v14];

        id v23 = [MEMORY[0x1E4F31968] predicateWithValue:MEMORY[0x1E4F1CC38] forProperty:*MEMORY[0x1E4F313F8]];
        uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v22, v23, 0);
        uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F31970]) initWithFilterPredicates:v24];
        [v12 setGroupingType:1];
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
  }

  return v12;
}

id sub_1D4254044(void *a1)
{
  uint64_t v1 = [a1 identifier];
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = [v1 path];
    id v4 = [v3 lastPathComponent];
    uint64_t v5 = [v4 longLongValue];

    uint64_t v6 = [MEMORY[0x1E4F31928] persistentIDPropertyForGroupingType:2];
    id v7 = (void *)MEMORY[0x1E4F31968];
    id v8 = [NSNumber numberWithLongLong:v5];
    id v9 = [v7 predicateWithValue:v8 forProperty:v6];

    id v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v9, 0);
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F31970]) initWithFilterPredicates:v10];
    [v11 setGroupingType:1];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t sub_1D4254170(void *a1)
{
  uint64_t v1 = [a1 identifier];
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = [v1 scheme];
    uint64_t v4 = sub_1D42541D4(v3, 0);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t sub_1D42541D4(void *a1, int a2)
{
  v14[7] = *MEMORY[0x1E4F143B8];
  v13[0] = @"x-sampcollection-album";
  v13[1] = @"x-sampcollection-artist";
  v14[0] = &unk_1F2BFED50;
  v14[1] = &unk_1F2BFED68;
  v13[2] = @"x-sampcollection-genre";
  v13[3] = @"x-sampcollection-audiobook";
  v14[2] = &unk_1F2BFED80;
  v14[3] = &unk_1F2BFED98;
  v13[4] = @"x-sampcollection-podcast";
  v13[5] = @"x-sampplaylist";
  void v14[4] = &unk_1F2BFEDB0;
  v14[5] = &unk_1F2BFEDC8;
  v13[6] = @"x-sampgeniusmix";
  v14[6] = &unk_1F2BFEDC8;
  uint64_t v2 = (void *)MEMORY[0x1E4F1C9E8];
  id v3 = a1;
  uint64_t v4 = [v2 dictionaryWithObjects:v14 forKeys:v13 count:7];
  v11[0] = @"x-sampcollection-album";
  v11[1] = @"x-sampcollection-artist";
  v12[0] = &unk_1F2BFED50;
  v12[1] = &unk_1F2BFEDE0;
  v11[2] = @"x-sampcollection-genre";
  v11[3] = @"x-sampcollection-audiobook";
  v12[2] = &unk_1F2BFED80;
  v12[3] = &unk_1F2BFED98;
  void v11[4] = @"x-sampcollection-podcast";
  v11[5] = @"x-sampplaylist";
  void v12[4] = &unk_1F2BFEDB0;
  v12[5] = &unk_1F2BFEDC8;
  v11[6] = @"x-sampgeniusmix";
  v12[6] = &unk_1F2BFEDC8;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:7];
  uint64_t v6 = v5;
  if (!a2) {
    uint64_t v5 = v4;
  }
  id v7 = [v5 objectForKey:v3];

  if (v7) {
    uint64_t v8 = [v7 integerValue];
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

id sub_1D42543B0(void *a1, uint64_t a2, int a3, void *a4, void *a5, void *a6)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v60 = 0;
  uint64_t v61 = &v60;
  uint64_t v62 = 0x2020000000;
  uint64_t v63 = 0;
  uint64_t v13 = [a1 identifier];
  id v14 = [v13 scheme];
  uint64_t v15 = sub_1D4232A80(v13);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = sub_1D4254A18;
  v52[3] = &unk_1E69E3A38;
  char v59 = a3;
  id v16 = v14;
  id v53 = v16;
  id v17 = v11;
  id v54 = v17;
  id v18 = v12;
  id v55 = v18;
  uint64_t v57 = a1;
  uint64_t v58 = &v60;
  id v50 = v10;
  id v56 = v50;
  uint64_t v51 = (void (**)(void, void, void, void))MEMORY[0x1D94452A0](v52);
  if (v15 == 4)
  {
    id v48 = [v13 scheme];

    uint64_t v26 = sub_1D42541D4(v48, 1);
    uint64_t v20 = [MEMORY[0x1E4F31928] ULIDPropertyForGroupingType:v26];
    __int16 v27 = [v13 path];
    float v47 = [v27 lastPathComponent];

    uint64_t v49 = sub_1D4254DC8(v50, (uint64_t)v20, (uint64_t)v47, v26, a3);
    uint64_t v28 = [v49 _countOfCollections];
    v61[3] = v28;
    if (v28)
    {
      uint64_t v29 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = [v49 _countOfCollections];
        *(_DWORD *)buf = 138543874;
        id v65 = v17;
        __int16 v66 = 2114;
        id v67 = v18;
        __int16 v68 = 2048;
        uint64_t v69 = v30;
        _os_log_impl(&dword_1D422A000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ (ulid) <%{public}@>: collections: %lu", buf, 0x20u);
      }

      id v31 = [MEMORY[0x1E4F31928] persistentIDPropertyForGroupingType:v26];
      uint64_t v32 = [v49 collections];
      __int16 v33 = [v32 firstObject];

      float v34 = [v33 representativeItem];
      uint64_t v35 = [v34 valueForProperty:v31];
      uint64_t v36 = [v35 longLongValue];

      if (!v36)
      {
        int v37 = [v33 valueForProperty:v31];
        uint64_t v36 = [v37 longLongValue];
      }
      uint64_t v38 = objc_msgSend(NSNumber, "numberWithLongLong:", v36, v47);
      __int16 v25 = ((void (**)(void, uint64_t, void *, void *))v51)[2](v51, v26, v31, v38);
    }
    else
    {
      uint64_t v40 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v65 = v17;
        __int16 v66 = 2114;
        id v67 = v18;
        _os_log_impl(&dword_1D422A000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ (ulid) <%{public}@>: no collections", buf, 0x16u);
      }

      uint64_t v41 = [a1 items];
      __int16 v25 = sub_1D4254F08(v50, v41, a3);

      uint64_t v42 = [v25 _countOfCollections];
      v61[3] = v42;
    }

    id v16 = v48;
  }
  else if (v15 == 1)
  {
    uint64_t v19 = sub_1D42541D4(v16, 0);
    uint64_t v20 = [MEMORY[0x1E4F31928] persistentIDPropertyForGroupingType:v19];
    uint64_t v21 = [v13 path];
    __int16 v22 = [v21 lastPathComponent];
    uint64_t v23 = [v22 longLongValue];

    uint64_t v24 = [NSNumber numberWithLongLong:v23];
    __int16 v25 = ((void (**)(void, uint64_t, NSObject *, void *))v51)[2](v51, v19, v20, v24);
  }
  else
  {
    uint64_t v20 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v39 = [v13 host];
      *(_DWORD *)buf = 138543874;
      id v65 = v17;
      __int16 v66 = 2114;
      id v67 = v18;
      __int16 v68 = 2112;
      uint64_t v69 = (uint64_t)v39;
      _os_log_impl(&dword_1D422A000, v20, OS_LOG_TYPE_ERROR, "%{public}@ (query) <%{public}@>:  Unsupported identifier URL host: %@", buf, 0x20u);
    }
    __int16 v25 = 0;
  }

  uint64_t v43 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v44 = v61[3];
    uint64_t v45 = [v25 _countOfItems];
    *(_DWORD *)buf = 138544130;
    id v65 = v17;
    __int16 v66 = 2114;
    id v67 = v18;
    __int16 v68 = 2048;
    uint64_t v69 = v44;
    __int16 v70 = 2048;
    uint64_t v71 = v45;
    _os_log_impl(&dword_1D422A000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ (query) <%{public}@>: collections: %lu items: %lu", buf, 0x2Au);
  }

  _Block_object_dispose(&v60, 8);

  return v25;
}

void sub_1D42549A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1D4254A18(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!*(unsigned char *)(a1 + 80)
    && (([*(id *)(a1 + 32) isEqualToString:@"x-sampgeniusmix"] & 1) != 0
     || [*(id *)(a1 + 32) isEqualToString:@"x-sampplaylist"]))
  {
    id v14 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 48);
      int v36 = 138543618;
      uint64_t v37 = v15;
      __int16 v38 = 2114;
      uint64_t v39 = v16;
      _os_log_impl(&dword_1D422A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ (getquery) <%{public}@>: local playlist", (uint8_t *)&v36, 0x16u);
    }

    id v17 = (void *)MEMORY[0x1E4F1CAD0];
    id v18 = (void *)MEMORY[0x1E4F31968];
    id v19 = *(id *)(a1 + 56);
    uint64_t v20 = [v18 predicateWithValue:v8 forProperty:v7];
    uint64_t v21 = [v17 setWithObject:v20];

    __int16 v22 = [MEMORY[0x1E4F31940] deviceMediaLibraryWithUserIdentity:v19];

    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F31970]) initWithFilterPredicates:v21 library:v22];
    [v13 setGroupingType:6];

    id v12 = v13;
LABEL_12:
    uint64_t v23 = [v12 _countOfCollections];
    uint64_t v24 = a1 + 72;
LABEL_13:
    *(void *)(*(void *)(*(void *)v24 + 8) + 24) = v23;
    goto LABEL_14;
  }
  if (a2 == 7 || !a2)
  {
    id v9 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      int v36 = 138543618;
      uint64_t v37 = v10;
      __int16 v38 = 2114;
      uint64_t v39 = v11;
      _os_log_impl(&dword_1D422A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ (getquery) <%{public}@>: local title query", (uint8_t *)&v36, 0x16u);
    }

    id v12 = sub_1D4254DC8(*(void **)(a1 + 56), (uint64_t)v7, (uint64_t)v8, a2, *(unsigned __int8 *)(a1 + 80));
    uint64_t v13 = v12;
    goto LABEL_12;
  }
  __int16 v27 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = *(void *)(a1 + 40);
    uint64_t v29 = *(void *)(a1 + 48);
    int v36 = 138543618;
    uint64_t v37 = v28;
    __int16 v38 = 2114;
    uint64_t v39 = v29;
    _os_log_impl(&dword_1D422A000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ (getquery) <%{public}@>: local query", (uint8_t *)&v36, 0x16u);
  }

  uint64_t v13 = sub_1D4254DC8(*(void **)(a1 + 56), (uint64_t)v7, (uint64_t)v8, a2, *(unsigned __int8 *)(a1 + 80));
  uint64_t v24 = a1 + 72;
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v13 _countOfCollections];
  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    uint64_t v30 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = *(void *)(a1 + 40);
      uint64_t v32 = *(void *)(a1 + 48);
      int v36 = 138543618;
      uint64_t v37 = v31;
      __int16 v38 = 2114;
      uint64_t v39 = v32;
      _os_log_impl(&dword_1D422A000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ (getquery) <%{public}@>: no collections", (uint8_t *)&v36, 0x16u);
    }

    __int16 v33 = *(void **)(a1 + 56);
    float v34 = [*(id *)(a1 + 64) items];
    uint64_t v35 = sub_1D4254F08(v33, v34, *(unsigned __int8 *)(a1 + 80));

    uint64_t v23 = [v35 _countOfCollections];
    uint64_t v13 = v35;
    goto LABEL_13;
  }
LABEL_14:
  id v25 = v13;

  return v25;
}

id sub_1D4254DC8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  id v9 = (void *)MEMORY[0x1E4F31968];
  id v10 = a1;
  uint64_t v11 = [v9 predicateWithValue:a3 forProperty:a2];
  if (a5)
  {
    id v12 = [MEMORY[0x1E4F31968] predicateWithValue:MEMORY[0x1E4F1CC38] forProperty:*MEMORY[0x1E4F313F8]];
  }
  else
  {
    id v12 = 0;
  }
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v11, v12, 0);
  id v14 = [MEMORY[0x1E4F31940] deviceMediaLibraryWithUserIdentity:v10];

  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F31970]) initWithFilterPredicates:v13 library:v14];
  [v15 setGroupingType:a4];
  if (a5)
  {
    [v15 setShouldIncludeNonLibraryEntities:1];
    [v15 setIgnoreSystemFilterPredicates:1];
  }

  return v15;
}

id sub_1D4254F08(void *a1, void *a2, int a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    uint64_t v11 = *MEMORY[0x1E4F31490];
    uint64_t v25 = *MEMORY[0x1E4F313F8];
    int v12 = a3 ^ 1;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        id v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v15 = [v14 MPMediaItemRepresentationWithUserIdentity:v5];
        uint64_t v16 = v15;
        if (v15)
        {
          id v17 = [v15 valueForProperty:v11];
          char v18 = [v17 BOOLValue];

          if ((v18 & 1) == 0)
          {
            id v19 = [v16 valueForProperty:v25];
            int v20 = [v19 BOOLValue];

            if ((v12 | v20) == 1) {
              [v24 addObject:v16];
            }
          }
        }
        else
        {
          uint64_t v21 = _MPLogCategoryAssistant();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v31 = v14;
            _os_log_impl(&dword_1D422A000, v21, OS_LOG_TYPE_DEFAULT, "Warning, could not find local item for %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v9);
  }

  if ([v24 count]) {
    __int16 v22 = (void *)[objc_alloc(MEMORY[0x1E4F31970]) initWithEntities:v24 entityType:0];
  }
  else {
    __int16 v22 = 0;
  }

  return v22;
}

id sub_1D425517C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5 = [a1 MPMediaItemQueryOnlyPlayableItems:0 withUserIdentity:a3 plugin:a4 hash:a5];
  id v6 = [v5 collections];
  id v7 = [v6 firstObject];

  return v7;
}

void sub_1D4255AE4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = *(id *)(a1 + 32);
  int v6 = sub_1D4245204(a3);
  id v7 = (Class *)0x1E4F965B8;
  if (!v6) {
    id v7 = (Class *)0x1E4F965A8;
  }
  id v8 = objc_alloc_init(*v7);
  if (*(void *)(a1 + 48))
  {
    if (![*(id *)(*(void *)(a1 + 40) + 72) length])
    {
      uint64_t v9 = [*(id *)(a1 + 40) aceId];
      uint64_t v10 = sub_1D4244ECC(@"Music Playback Imminent", v9);
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = *(void **)(v11 + 72);
      *(void *)(v11 + 72) = v10;
    }
    uint64_t v13 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 72);
      uint64_t v15 = [v8 dictionary];
      int v18 = 138543618;
      uint64_t v19 = v14;
      __int16 v20 = 2114;
      uint64_t v21 = v15;
      _os_log_impl(&dword_1D422A000, v13, OS_LOG_TYPE_DEFAULT, "Music Playback Imminent (perform) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v18, 0x16u);
    }
    uint64_t v16 = *(void *)(a1 + 48);
    id v17 = [v8 dictionary];
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);
  }
}

void sub_1D4255E5C(id *a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)a1[4] + 7, a2);
    objc_storeStrong((id *)a1[4] + 8, a3);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_1D42560B4;
    v21[3] = &unk_1E69E4070;
    id v8 = a1[4];
    id v9 = a1[5];
    id v10 = a1[4];
    id v22 = v9;
    id v23 = v10;
    id v24 = a1[6];
    [v8 _perform:v21];

    uint64_t v11 = v22;
  }
  else
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"no user identity"];
    if (![*((id *)a1[4] + 9) length])
    {
      int v12 = [a1[4] aceId];
      uint64_t v13 = sub_1D4244ECC(@"Music Playback Imminent", v12);
      uint64_t v14 = a1[4];
      uint64_t v15 = (void *)v14[9];
      void v14[9] = v13;
    }
    uint64_t v16 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *((void *)a1[4] + 9);
      int v18 = [v11 dictionary];
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v17;
      __int16 v27 = 2114;
      long long v28 = v18;
      _os_log_impl(&dword_1D422A000, v16, OS_LOG_TYPE_DEFAULT, "Music Playback Imminent (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    uint64_t v19 = (void (**)(id, void *))a1[6];
    __int16 v20 = [v11 dictionary];
    v19[2](v19, v20);

    dispatch_group_leave((dispatch_group_t)a1[5]);
  }
}

void sub_1D42560B4(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_group_leave(v3);
  if (![*(id *)(*(void *)(a1 + 40) + 72) length])
  {
    id v5 = [*(id *)(a1 + 40) aceId];
    uint64_t v6 = sub_1D4244ECC(@"Music Playback Imminent", v5);
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(void **)(v7 + 72);
    *(void *)(v7 + 72) = v6;
  }
  id v9 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 72);
    int v11 = 138543362;
    uint64_t v12 = v10;
    _os_log_impl(&dword_1D422A000, v9, OS_LOG_TYPE_DEFAULT, "Music Playback Imminent (completion) <%{public}@>: done", (uint8_t *)&v11, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_1D425669C(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    id v2 = v1;
    id v3 = [v2 itemsQuery];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1D4256860;
    v13[3] = &unk_1E69E3B28;
    v13[4] = &v14;
    [v3 _enumerateItemsUsingBlock:v13];

    uint64_t v4 = *((unsigned char *)v15 + 24) != 0;
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    uint64_t v5 = *MEMORY[0x1E4F31420];
    uint64_t v6 = *MEMORY[0x1E4F313E8];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F31420], *MEMORY[0x1E4F313E8], 0);
    id v8 = [v1 valuesForProperties:v7];

    id v9 = [v8 objectForKey:v5];
    __int16 v10 = [v9 integerValue];

    if ((v10 & 0x300) != 0)
    {
      int v11 = [v8 objectForKey:v6];
      uint64_t v4 = [v11 BOOLValue];
    }
    else
    {
      uint64_t v4 = (v10 & 0x805) != 0;
    }
  }
  return v4;
}

void sub_1D4256848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4256860(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (v5)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
      || (id v6 = v5,
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sub_1D425669C(),
          id v5 = v6,
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)))
    {
      *a3 = 1;
    }
  }
}

void sub_1D4256D38(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(v3 + 8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1D4256E74;
  v13[3] = &unk_1E69E3AD8;
  v13[4] = v3;
  [v4 enumerateEntityChangesAfterSyncAnchor:v2 maximumRevisionType:0 inUsersLibrary:1 usingBlock:v13];
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 42))
  {
    id v6 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v12 = 0;
      uint64_t v7 = "Sync Handler (enumeration): aborted";
      id v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_1D422A000, v8, v9, v7, v12, 2u);
    }
  }
  else
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v5 + 16), 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void **)(v10 + 32);
    *(void *)(v10 + 32) = 0;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 24));
    id v6 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v12 = 0;
      uint64_t v7 = "Sync Handler (enumeration): finished";
      id v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
      goto LABEL_6;
    }
  }
}

void sub_1D4256E74(uint64_t a1, void *a2, unsigned char *a3)
{
  id v16 = a2;
  uint64_t v5 = (void *)MEMORY[0x1D9445100]();
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 16), 0xFFFFFFFFFFFFFFFFLL);
  if (*(unsigned char *)(*(void *)(a1 + 32) + 42))
  {
    *a3 = 1;
    goto LABEL_21;
  }
  id v6 = [v16 entity];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 41) && [v16 deletionType]) {
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v6 valueForProperty:*MEMORY[0x1E4F31588]];
    if ([v8 BOOLValue])
    {
LABEL_10:
      uint64_t v7 = 16;
LABEL_19:

      goto LABEL_20;
    }
    os_log_type_t v9 = [v6 valueForProperty:*MEMORY[0x1E4F31590]];
    if ([v9 BOOLValue])
    {

      goto LABEL_10;
    }
    uint64_t v12 = [v6 valueForProperty:*MEMORY[0x1E4F31580]];
    char v13 = [v12 BOOLValue];

    if ((v13 & 1) == 0) {
      goto LABEL_18;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v6 valueForProperty:*MEMORY[0x1E4F313F8]];
        char v11 = [v10 BOOLValue];

        if ((v11 & 1) == 0) {
          *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
        }
      }
      goto LABEL_18;
    }
    if ([v6 groupingType])
    {
LABEL_18:
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = v16;
      id v8 = *(void **)(v14 + 32);
      *(void *)(v14 + 32) = v15;
      uint64_t v7 = 24;
      goto LABEL_19;
    }
  }
LABEL_5:
  uint64_t v7 = 16;
LABEL_20:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + v7));

LABEL_21:
}

uint64_t sub_1D425715C()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  id v1 = (void *)qword_1EBD857D8;
  qword_1EBD857D8 = (uint64_t)v0;

  uint64_t v2 = (void *)qword_1EBD857D8;

  return [v2 setMaxConcurrentOperationCount:5];
}

void sub_1D42573A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D42573C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1D42573D0(uint64_t a1)
{
}

void sub_1D42573D8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a3)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          id v15 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "stations", (void)v16);
          [v14 addObjectsFromArray:v15];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1D42580D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (void *)[a3 mutableCopy];
  [v6 setSingleGroup:1];
  id v7 = objc_alloc_init(MEMORY[0x1E4F76E28]);
  [v5 setUserIdentity:*(void *)(*(void *)(a1 + 32) + 80)];
  [v5 setFeatureName:@"siri"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1D4259324;
  v10[3] = &unk_1E69E4160;
  id v11 = v7;
  uint64_t v8 = *(void *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v9 = v7;
  [v9 sendPlaybackQueue:v5 toDestination:v6 withOptions:v8 completion:v10];
}

void sub_1D42581F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.mediaPlayer.assistant.loadPredefinedQueue.sendCommand", 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1D4259020;
  v12[3] = &unk_1E69E3C38;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v8;
  id v15 = v5;
  id v16 = v9;
  id v10 = v5;
  id v11 = v6;
  MEMORY[0x1D9444D60](v7, v12);
}

void sub_1D42582E0(uint64_t a1, uint64_t a2)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  switch(a2)
  {
    case 0:
      if (![*(id *)(*(void *)(a1 + 32) + 72) length])
      {
        id v13 = [*(id *)(a1 + 32) aceId];
        uint64_t v14 = sub_1D4244ECC(@"Load Predefined Queue", v13);
        uint64_t v15 = *(void *)(a1 + 32);
        id v16 = *(void **)(v15 + 72);
        *(void *)(v15 + 72) = v14;
      }
      long long v17 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 72);
        *(_DWORD *)buf = 138543362;
        uint64_t v75 = v18;
        _os_log_impl(&dword_1D422A000, v17, OS_LOG_TYPE_ERROR, "Load Predefined Queue (radio) <%{public}@>: radio not available", buf, 0xCu);
      }

      uint64_t v10 = *(void *)(a1 + 56);
      id v11 = objc_alloc(MEMORY[0x1E4F965A8]);
      id v12 = (void *)MEMORY[0x1E4F973C0];
      goto LABEL_14;
    case 2:
      if (![*(id *)(*(void *)(a1 + 32) + 72) length])
      {
        __int16 v20 = [*(id *)(a1 + 32) aceId];
        uint64_t v21 = sub_1D4244ECC(@"Load Predefined Queue", v20);
        uint64_t v22 = *(void *)(a1 + 32);
        id v23 = *(void **)(v22 + 72);
        *(void *)(v22 + 72) = v21;
      }
      id v24 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 72);
        *(_DWORD *)buf = 138543362;
        uint64_t v75 = v25;
        _os_log_impl(&dword_1D422A000, v24, OS_LOG_TYPE_ERROR, "Load Predefined Queue (radio) <%{public}@>: companion not available", buf, 0xCu);
      }

      uint64_t v10 = *(void *)(a1 + 56);
      id v19 = objc_alloc_init(MEMORY[0x1E4F965A8]);
      goto LABEL_20;
    case 1:
      if (![*(id *)(*(void *)(a1 + 32) + 72) length])
      {
        uint64_t v4 = [*(id *)(a1 + 32) aceId];
        uint64_t v5 = sub_1D4244ECC(@"Load Predefined Queue", v4);
        uint64_t v6 = *(void *)(a1 + 32);
        dispatch_queue_t v7 = *(void **)(v6 + 72);
        *(void *)(v6 + 72) = v5;
      }
      uint64_t v8 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 72);
        *(_DWORD *)buf = 138543362;
        uint64_t v75 = v9;
        _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_ERROR, "Load Predefined Queue (radio) <%{public}@>: network conditions do not permit radio playback", buf, 0xCu);
      }

      uint64_t v10 = *(void *)(a1 + 56);
      id v11 = objc_alloc(MEMORY[0x1E4F965A8]);
      id v12 = (void *)MEMORY[0x1E4F97340];
LABEL_14:
      id v19 = (id)[v11 initWithErrorCode:*v12];
LABEL_20:
      uint64_t v26 = v19;
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v19);
      goto LABEL_44;
  }
  uint64_t v26 = [*(id *)(a1 + 40) objectForKey:*MEMORY[0x1E4F77588]];
  __int16 v27 = *(id **)(a1 + 32);
  if (v26)
  {
    if (![v27[9] length])
    {
      long long v28 = [*(id *)(a1 + 32) aceId];
      uint64_t v29 = sub_1D4244ECC(@"Load Predefined Queue", v28);
      uint64_t v30 = *(void *)(a1 + 32);
      uint64_t v31 = *(void **)(v30 + 72);
      *(void *)(v30 + 72) = v29;
    }
    uint64_t v32 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = *(void *)(*(void *)(a1 + 32) + 72);
      *(_DWORD *)buf = 138543362;
      uint64_t v75 = v33;
      _os_log_impl(&dword_1D422A000, v32, OS_LOG_TYPE_DEFAULT, "Load Predefined Queue (radio) <%{public}@>: resuming playback", buf, 0xCu);
    }

    float v34 = [MEMORY[0x1E4F76E48] systemMediaApplicationDestination];
    uint64_t v35 = [*(id *)(a1 + 32) hashedRouteUIDs];
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = sub_1D4258C4C;
    v71[3] = &unk_1E69E3C88;
    void v71[4] = *(void *)(a1 + 32);
    id v72 = *(id *)(a1 + 48);
    id v73 = *(id *)(a1 + 56);
    [v34 resolveWithHashedRouteIdentifiers:v35 audioRoutingInfo:*(unsigned int *)(a1 + 76) completion:v71];
  }
  else
  {
    float v34 = [v27 _radioStations];
    if ([v34 count]
      && ([v34 firstObject], (int v36 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v37 = v36;
      BOOL v38 = a2 == 4;
      uint64_t v39 = [v36 stationStringID];
      uint64_t v40 = (void *)MEMORY[0x1E4F76E60];
      uint64_t v41 = [*(id *)(a1 + 32) refId];
      uint64_t v42 = [v40 radioQueueWithContextID:v41 stationStringID:v39];

      uint64_t v43 = [*(id *)(a1 + 32) startPlaying];
      objc_msgSend(v42, "setShouldImmediatelyStartPlayback:", objc_msgSend(v43, "BOOLValue"));

      [v42 setShouldOverrideManuallyCuratedQueue:1];
      uint64_t v44 = [MEMORY[0x1E4F76E48] systemMediaApplicationDestination];
      uint64_t v45 = [*(id *)(a1 + 32) hashedRouteUIDs];
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = sub_1D4258D9C;
      v67[3] = &unk_1E69E3CB0;
      v67[4] = *(void *)(a1 + 32);
      id v69 = *(id *)(a1 + 56);
      id v70 = *(id *)(a1 + 64);
      id v68 = v42;
      uint64_t v46 = *(unsigned int *)(a1 + 76);
      id v47 = v42;
      [v44 resolveWithQueue:v47 hashedRouteIdentifiers:v45 localPlaybackPermitted:v38 audioRoutingInfo:v46 completion:v67];
    }
    else
    {
      BOOL v48 = sub_1D4244E1C(*(void **)(*(void *)(a1 + 32) + 80));
      uint64_t v49 = [*(id *)(*(void *)(a1 + 32) + 72) length];
      if (v48)
      {
        if (!v49)
        {
          id v50 = [*(id *)(a1 + 32) aceId];
          uint64_t v51 = sub_1D4244ECC(@"Load Predefined Queue", v50);
          uint64_t v52 = *(void *)(a1 + 32);
          id v53 = *(void **)(v52 + 72);
          *(void *)(v52 + 72) = v51;
        }
        id v54 = _MPLogCategoryAssistant();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          uint64_t v55 = *(void *)(*(void *)(a1 + 32) + 72);
          uint64_t v56 = *(unsigned int *)(a1 + 72);
          *(_DWORD *)buf = 138543618;
          uint64_t v75 = v55;
          __int16 v76 = 2048;
          uint64_t v77 = v56;
          _os_log_impl(&dword_1D422A000, v54, OS_LOG_TYPE_ERROR, "Load Predefined Queue (radio) <%{public}@>: still loading library (type %ld).", buf, 0x16u);
        }

        uint64_t v57 = *(void *)(a1 + 56);
        id v58 = objc_alloc(MEMORY[0x1E4F965A8]);
        char v59 = (void *)MEMORY[0x1E4F97398];
      }
      else
      {
        if (!v49)
        {
          uint64_t v60 = [*(id *)(a1 + 32) aceId];
          uint64_t v61 = sub_1D4244ECC(@"Load Predefined Queue", v60);
          uint64_t v62 = *(void *)(a1 + 32);
          uint64_t v63 = *(void **)(v62 + 72);
          *(void *)(v62 + 72) = v61;
        }
        uint64_t v64 = _MPLogCategoryAssistant();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          uint64_t v65 = *(void *)(*(void *)(a1 + 32) + 72);
          uint64_t v66 = *(unsigned int *)(a1 + 72);
          *(_DWORD *)buf = 138543618;
          uint64_t v75 = v65;
          __int16 v76 = 2048;
          uint64_t v77 = v66;
          _os_log_impl(&dword_1D422A000, v64, OS_LOG_TYPE_ERROR, "Load Predefined Queue (radio) <%{public}@>: empty library for (type %ld).", buf, 0x16u);
        }

        uint64_t v57 = *(void *)(a1 + 56);
        id v58 = objc_alloc(MEMORY[0x1E4F965A8]);
        char v59 = (void *)MEMORY[0x1E4F97378];
      }
      uint64_t v37 = (void *)[v58 initWithErrorCode:*v59];
      (*(void (**)(uint64_t, void *))(v57 + 16))(v57, v37);
    }
  }
LABEL_44:
}

void sub_1D4258AA8(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    if (![*(id *)(*(void *)(a1 + 32) + 72) length])
    {
      uint64_t v4 = [*(id *)(a1 + 32) aceId];
      uint64_t v5 = sub_1D4244ECC(@"Load Predefined Queue", v4);
      uint64_t v6 = *(void *)(a1 + 32);
      dispatch_queue_t v7 = *(void **)(v6 + 72);
      *(void *)(v6 + 72) = v5;
    }
    uint64_t v8 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 72);
      int v15 = 138543362;
      uint64_t v16 = v9;
      _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_ERROR, "Load Predefined Queue (query) <%{public}@>: no available destination", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v12 = (void *)[v11 initWithErrorCode:*MEMORY[0x1E4F97338]];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);
  }
  if ([*(id *)(a1 + 32) dryRun])
  {
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = objc_alloc_init(MEMORY[0x1E4F965B8]);
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v14);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_1D4258C4C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  if ([v3 dryRun])
  {
    uint64_t v5 = *(void *)(a1 + 48);
    id v10 = objc_alloc_init(MEMORY[0x1E4F965B8]);

    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v10);
  }
  else
  {
    uint64_t v6 = (void *)[v4 mutableCopy];

    [v6 setSingleGroup:1];
    id v7 = objc_alloc_init(MEMORY[0x1E4F76E28]);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1D4258F40;
    v11[3] = &unk_1E69E4160;
    id v12 = v7;
    uint64_t v8 = *(void *)(a1 + 40);
    id v13 = *(id *)(a1 + 48);
    id v9 = v7;
    [v9 sendCommand:0 toDestination:v6 withOptions:v8 completion:v11];
  }
}

void sub_1D4258D9C(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    if (![*(id *)(*(void *)(a1 + 32) + 72) length])
    {
      id v4 = [*(id *)(a1 + 32) aceId];
      uint64_t v5 = sub_1D4244ECC(@"Load Predefined Queue", v4);
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(void **)(v6 + 72);
      *(void *)(v6 + 72) = v5;
    }
    uint64_t v8 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 72);
      int v15 = 138543362;
      uint64_t v16 = v9;
      _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_ERROR, "Load Predefined Queue (radio) <%{public}@>: no available destination", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v12 = (void *)[v11 initWithErrorCode:*MEMORY[0x1E4F97338]];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);
  }
  if ([*(id *)(a1 + 32) dryRun])
  {
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = objc_alloc_init(MEMORY[0x1E4F965B8]);
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v14);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_1D4258F40(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v13 = v3;
  if (v3)
  {
    uint64_t v6 = (objc_class *)MEMORY[0x1E4F965A8];
    id v7 = v5;
    id v8 = [v6 alloc];
    id v9 = [v13 localizedFailureReason];
    uint64_t v10 = (void *)[v8 initWithReason:v9];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v10);
  }
  else
  {
    id v11 = (objc_class *)MEMORY[0x1E4F965B8];
    id v12 = v5;
    id v9 = objc_alloc_init(v11);
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v9);
  }
}

void sub_1D4259020(id *a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  MRAVEndpointGetLocalEndpoint();
  uint64_t v4 = (void *)MRAVEndpointCopyUniqueIdentifier();
  id v5 = a1[4];
  id v6 = a2;
  id v7 = [v5 outputDeviceUIDs];
  LODWORD(v5) = [v7 containsObject:v6];

  if (v5)
  {

LABEL_4:
    if (![*((id *)a1[5] + 9) length])
    {
      uint64_t v10 = [a1[5] aceId];
      uint64_t v11 = sub_1D4244ECC(@"Load Predefined Queue", v10);
      id v12 = a1[5];
      id v13 = (void *)v12[9];
      v12[9] = v11;
    }
    id v14 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *((void *)a1[5] + 9);
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v15;
      _os_log_impl(&dword_1D422A000, v14, OS_LOG_TYPE_DEFAULT, "Load Predefined Queue (send) <%{public}@>: sending to local WHA destination", buf, 0xCu);
    }

    uint64_t v16 = (void *)*((void *)a1[5] + 7);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1D425930C;
    v24[3] = &unk_1E69E3C10;
    id v27 = a1[7];
    id v25 = a1[6];
    id v26 = a1[4];
    [v16 prepareForAudioHandoffWithCompletion:v24];

    goto LABEL_14;
  }
  id v8 = [a1[4] outputDeviceUIDs];
  int v9 = [v8 containsObject:v4];

  if (v9) {
    goto LABEL_4;
  }
  if (![*((id *)a1[5] + 9) length])
  {
    uint64_t v17 = [a1[5] aceId];
    uint64_t v18 = sub_1D4244ECC(@"Load Predefined Queue", v17);
    id v19 = a1[5];
    __int16 v20 = (void *)v19[9];
    v19[9] = v18;
  }
  uint64_t v21 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = a1[4];
    uint64_t v23 = *((void *)a1[5] + 9);
    *(_DWORD *)buf = 138543618;
    uint64_t v29 = v23;
    __int16 v30 = 2114;
    id v31 = v22;
    _os_log_impl(&dword_1D422A000, v21, OS_LOG_TYPE_DEFAULT, "Load Predefined Queue (send) <%{public}@>: sending to destination %{public}@", buf, 0x16u);
  }

  (*((void (**)(void))a1[7] + 2))();
LABEL_14:
}

uint64_t sub_1D425930C(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_1D4259324(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  id v7 = v16;
  if (v16
    && ([v16 domain],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEqualToString:*MEMORY[0x1E4F76DE0]],
        v8,
        id v7 = v16,
        !v9))
  {
    int IsInformational = MRMediaRemoteErrorIsInformational();
    uint64_t v13 = *(void *)(a1 + 40);
    if (IsInformational)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F965B8]);
      (*(void (**)(uint64_t, id))(v13 + 16))(v13, v11);
    }
    else
    {
      id v14 = objc_alloc(MEMORY[0x1E4F965A8]);
      id v11 = [NSString stringWithFormat:@"Send playback failed: %@", v16];
      uint64_t v15 = (void *)[v14 initWithReason:v11];
      (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v15);
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    [v7 code];
    sub_1D4245304(v5);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
  }
}

void sub_1D425980C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[9];
  uint64_t v4 = [v2 requesterSharedUserId];
  id v5 = [*(id *)(a1 + 32) sharedUserIdFromPlayableMusicAccount];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D42598E8;
  v7[3] = &unk_1E69E3F08;
  id v6 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  sub_1D4246230(@"Load Predefined Queue", v3, v4, v5, v7);
}

void sub_1D42598E8(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), a2);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1D4259AF8;
    v16[3] = &unk_1E69E3B98;
    id v5 = *(void **)(a1 + 40);
    void v16[4] = *(void *)(a1 + 32);
    id v17 = v5;
    sub_1D4259AF8((uint64_t)v16);
  }
  else
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"no user identity"];
    if (![*(id *)(*(void *)(a1 + 32) + 72) length])
    {
      id v7 = [*(id *)(a1 + 32) aceId];
      uint64_t v8 = sub_1D4244ECC(@"Load Predefined Queue", v7);
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void **)(v9 + 72);
      *(void *)(v9 + 72) = v8;
    }
    id v11 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 72);
      uint64_t v13 = [v6 dictionary];
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      uint64_t v21 = v13;
      _os_log_impl(&dword_1D422A000, v11, OS_LOG_TYPE_DEFAULT, "Load Predefined Queue (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = [v6 dictionary];
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
  }
}

void sub_1D4259AF8(uint64_t a1)
{
  uint64_t v2 = dispatch_get_global_queue(0, 0);
  id v3 = *(id *)(a1 + 40);
  MRMediaRemoteGetNowPlayingInfo();
}

void sub_1D4259BB0(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1D4259C58;
  v5[3] = &unk_1E69E4098;
  void v5[4] = v4;
  id v6 = *(id *)(a1 + 40);
  [v4 _performWithNowPlayingItem:a2 audioRoutingInfo:*(unsigned int *)(a1 + 48) completion:v5];
}

void sub_1D4259C58(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![*(id *)(*(void *)(a1 + 32) + 72) length])
  {
    id v4 = [*(id *)(a1 + 32) aceId];
    uint64_t v5 = sub_1D4244ECC(@"Load Predefined Queue", v4);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 72);
    *(void *)(v6 + 72) = v5;
  }
  uint64_t v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 72);
    uint64_t v10 = [v3 dictionary];
    int v13 = 138543618;
    uint64_t v14 = v9;
    __int16 v15 = 2114;
    id v16 = v10;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Load Predefined Queue (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = [v3 dictionary];
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
}

void sub_1D4259DBC()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  id v1 = (void *)qword_1EA6C8F20;
  qword_1EA6C8F20 = (uint64_t)v0;

  [(id)qword_1EA6C8F20 setMaxConcurrentOperationCount:2];
  [(id)qword_1EA6C8F20 setName:@"com.apple.MediaPlayer.AssistantBundle.MPAssistantLoadPredefinedQueue"];
  uint64_t v2 = (void *)qword_1EA6C8F20;
  id v3 = [MEMORY[0x1E4F29060] currentThread];
  objc_msgSend(v2, "setQualityOfService:", objc_msgSend(v3, "qualityOfService"));
}

void sub_1D4259F6C(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![*(id *)(*(void *)(a1 + 32) + 56) length])
  {
    id v4 = [*(id *)(a1 + 32) aceId];
    uint64_t v5 = sub_1D4244ECC(@"Dislikes Media Entity", v4);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 56);
    *(void *)(v6 + 56) = v5;
  }
  uint64_t v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 56);
    int v10 = 138543618;
    uint64_t v11 = v9;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Dislikes Media Entity (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v10, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1D425A248(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), a2);
    uint64_t v5 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1D425A45C;
    v16[3] = &unk_1E69E3E40;
    void v16[4] = v5;
    id v17 = *(id *)(a1 + 40);
    [v5 _performWithCompletion:v16];
  }
  else
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"no user identity"];
    if (![*(id *)(*(void *)(a1 + 32) + 56) length])
    {
      id v7 = [*(id *)(a1 + 32) aceId];
      uint64_t v8 = sub_1D4244ECC(@"Dislikes Media Entity", v7);
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = *(void **)(v9 + 56);
      *(void *)(v9 + 56) = v8;
    }
    uint64_t v11 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 56);
      id v13 = [v6 dictionary];
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      uint64_t v21 = v13;
      _os_log_impl(&dword_1D422A000, v11, OS_LOG_TYPE_DEFAULT, "Dislikes Media Entity (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    uint64_t v14 = *(void *)(a1 + 40);
    __int16 v15 = [v6 dictionary];
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
  }
}

void sub_1D425A45C(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![*(id *)(*(void *)(a1 + 32) + 56) length])
  {
    id v4 = [*(id *)(a1 + 32) aceId];
    uint64_t v5 = sub_1D4244ECC(@"Dislikes Media Entity", v4);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 56);
    *(void *)(v6 + 56) = v5;
  }
  uint64_t v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 56);
    int v10 = 138543618;
    uint64_t v11 = v9;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Dislikes Media Entity (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v10, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1D425A738(uint64_t a1, void *a2)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 56);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D425A808;
  v7[3] = &unk_1E69E3D28;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  id v10 = *(id *)(a1 + 48);
  sub_1D4247404(@"Get Dynamite Client State", v4, 0, a2, v7);
}

uint64_t sub_1D425A808(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setClientState:a2];
  if (![*(id *)(*(void *)(a1 + 40) + 56) length])
  {
    id v3 = [*(id *)(a1 + 40) aceId];
    uint64_t v4 = sub_1D4244ECC(@"Get Dynamite Client State", v3);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v4;
  }
  id v7 = _MPLogCategoryAssistant_Oversize();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 56);
    uint64_t v9 = [*(id *)(a1 + 32) dictionary];
    int v13 = 138543619;
    uint64_t v14 = v8;
    __int16 v15 = 2113;
    id v16 = v9;
    _os_log_impl(&dword_1D422A000, v7, OS_LOG_TYPE_DEFAULT, "Get Dynamite Client State (completion) <%{public}@>: notifying assistant %{private}@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = [*(id *)(a1 + 32) dictionary];
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  return ICSiriPostDynamiteClientStateChangedNotification();
}

void sub_1D425ACFC(id *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a1[4];
  uint64_t v5 = [a2 allKeys];
  if (a2)
  {
    uint64_t v6 = (const void *)MRAVReconnaissanceSessionCreateWithEndpointFeatures();
    id v17 = a1[6];
    id v18 = a1[7];
    MRAVReconnaissanceSessionBeginSearch();
    CFRelease(v6);
  }
  else
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"UID decoding error"];
    if (![*((id *)a1[5] + 7) length])
    {
      uint64_t v8 = [a1[5] aceId];
      uint64_t v9 = sub_1D4244ECC(@"Get Now Playing Queue Details Remote", v8);
      uint64_t v10 = a1[5];
      uint64_t v11 = (void *)v10[7];
      v10[7] = v9;
    }
    __int16 v12 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *((void *)a1[5] + 7);
      uint64_t v14 = [v7 dictionary];
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v13;
      __int16 v21 = 2114;
      uint64_t v22 = v14;
      _os_log_impl(&dword_1D422A000, v12, OS_LOG_TYPE_ERROR, "Get Now Playing Queue Details Remote (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    __int16 v15 = (void (**)(id, void *))a1[7];
    id v16 = [v7 dictionary];
    v15[2](v15, v16);
  }
}

void sub_1D425AF44(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F965A8]);
    uint64_t v8 = [v6 localizedFailureReason];
    id v9 = (id)[v7 initWithReason:v8];

    if (![*(id *)(*(void *)(a1 + 32) + 56) length])
    {
      uint64_t v10 = [*(id *)(a1 + 32) aceId];
      uint64_t v11 = sub_1D4244ECC(@"Get Now Playing Queue Details Remote", v10);
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void **)(v12 + 56);
      *(void *)(v12 + 56) = v11;
    }
    uint64_t v14 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 56);
      id v16 = [v9 dictionary];
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v15;
      __int16 v29 = 2114;
      __int16 v30 = v16;
      _os_log_impl(&dword_1D422A000, v14, OS_LOG_TYPE_ERROR, "Get Now Playing Queue Details Remote (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    uint64_t v17 = *(void *)(a1 + 48);
    id v18 = [v9 dictionary];
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);
  }
  else
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F76E30]);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1D425B184;
    v22[3] = &unk_1E69E3DC8;
    uint64_t v20 = *(void *)(a1 + 32);
    __int16 v21 = *(void **)(a1 + 40);
    id v23 = v19;
    uint64_t v24 = v20;
    id v25 = v21;
    id v26 = *(id *)(a1 + 48);
    id v9 = v19;
    [v9 connectToEndpoint:a3 completion:v22];

    id v18 = v23;
  }
}

void sub_1D425B184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  id v7 = [v5 queueDetails];
  id v8 = objc_alloc_init(MEMORY[0x1E4F96898]);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
  uint64_t v9 = -[v7 previousItemCount];
  uint64_t v10 = [v7 previousItemCount];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1D425B3B8;
  v22[3] = &unk_1E69E3D78;
  id v11 = v8;
  id v23 = v11;
  id v24 = *(id *)(a1 + 48);
  objc_msgSend(v7, "getSAMPMediaItems:origin:completion:", v9, v10, a3, v22);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
  uint64_t v12 = [v7 nextItemCount];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1D425B3F8;
  v19[3] = &unk_1E69E3D78;
  id v13 = v11;
  id v20 = v13;
  id v21 = *(id *)(a1 + 48);
  objc_msgSend(v7, "getSAMPMediaItems:origin:completion:", 0, v12, a3, v19);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D425B438;
  block[3] = &unk_1E69E3DA0;
  uint64_t v14 = *(NSObject **)(a1 + 48);
  void block[4] = *(void *)(a1 + 40);
  id v17 = v13;
  id v18 = *(id *)(a1 + 56);
  id v15 = v13;
  dispatch_group_notify(v14, MEMORY[0x1E4F14428], block);
}

void sub_1D425B3B8(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setPreviousItems:a2];
  id v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void sub_1D425B3F8(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setNextItems:a2];
  id v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void sub_1D425B438(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(*(void *)(a1 + 32) + 56) length])
  {
    uint64_t v2 = [*(id *)(a1 + 32) aceId];
    uint64_t v3 = sub_1D4244ECC(@"Get Now Playing Queue Details Remote", v2);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;
  }
  id v6 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 56);
    id v8 = [*(id *)(a1 + 40) dictionary];
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1D422A000, v6, OS_LOG_TYPE_DEFAULT, "Get Now Playing Queue Details Remote (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = [*(id *)(a1 + 40) dictionary];
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
}

void sub_1D425B698(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![*(id *)(*(void *)(a1 + 32) + 56) length])
  {
    uint64_t v4 = [*(id *)(a1 + 32) aceId];
    uint64_t v5 = sub_1D4244ECC(@"Likes Media Entity", v4);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 56);
    *(void *)(v6 + 56) = v5;
  }
  id v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 56);
    int v10 = 138543618;
    uint64_t v11 = v9;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Likes Media Entity (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v10, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1D425B974(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), a2);
    uint64_t v5 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1D425BB88;
    v16[3] = &unk_1E69E3E40;
    void v16[4] = v5;
    id v17 = *(id *)(a1 + 40);
    [v5 _performWithCompletion:v16];
  }
  else
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"no user identity"];
    if (![*(id *)(*(void *)(a1 + 32) + 56) length])
    {
      uint64_t v7 = [*(id *)(a1 + 32) aceId];
      uint64_t v8 = sub_1D4244ECC(@"Likes Media Entity", v7);
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = *(void **)(v9 + 56);
      *(void *)(v9 + 56) = v8;
    }
    uint64_t v11 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 56);
      id v13 = [v6 dictionary];
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      id v21 = v13;
      _os_log_impl(&dword_1D422A000, v11, OS_LOG_TYPE_DEFAULT, "Likes Media Entity (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = [v6 dictionary];
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
  }
}

void sub_1D425BB88(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![*(id *)(*(void *)(a1 + 32) + 56) length])
  {
    id v4 = [*(id *)(a1 + 32) aceId];
    uint64_t v5 = sub_1D4244ECC(@"Likes Media Entity", v4);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 56);
    *(void *)(v6 + 56) = v5;
  }
  uint64_t v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 56);
    int v10 = 138543618;
    uint64_t v11 = v9;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Likes Media Entity (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v10, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1D425BF74(uint64_t a1, unsigned int a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) hashedRouteUIDs];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D425C068;
  v8[3] = &unk_1E69E3EB8;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = *(id *)(a1 + 72);
  [v4 resolveWithHashedRouteIdentifiers:v5 audioRoutingInfo:a2 completion:v8];
}

void sub_1D425C068(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D425C138;
  v9[3] = &unk_1E69E3E90;
  id v10 = v4;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void **)(a1 + 64);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v8;
  [v10 sendCommand:19 toDestination:a2 withOptions:v5 completion:v9];
}

void sub_1D425C138(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *(id *)(a1 + 32);
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setObject:@"Increase Playback Speed" forKeyedSubscript:@"pluginname"];
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"success"];
  uint64_t v7 = NSNumber;
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  id v9 = [v7 numberWithDouble:fabs(v8)];
  [v6 setObject:v9 forKeyedSubscript:@"duration"];

  if (sub_1D4245204(v4))
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F965B8]);
LABEL_5:
    uint64_t v12 = v10;
    goto LABEL_7;
  }
  if ([v4 containsObject:&unk_1F2BFEE10])
  {
    id v11 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v10 = (id)[v11 initWithErrorCode:*MEMORY[0x1E4F97438]];
    goto LABEL_5;
  }
  id v13 = [NSString stringWithFormat:@"player statuses: %@", v4];
  [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"success"];
  [v6 setObject:v13 forKeyedSubscript:@"errorstring"];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:v13];

LABEL_7:
  if (![*(id *)(*(void *)(a1 + 48) + 56) length])
  {
    uint64_t v14 = [*(id *)(a1 + 48) aceId];
    uint64_t v15 = sub_1D4244ECC(@"Increase Playback Speed", v14);
    uint64_t v16 = *(void *)(a1 + 48);
    id v17 = *(void **)(v16 + 56);
    *(void *)(v16 + 56) = v15;
  }
  id v18 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 56);
    __int16 v20 = [v12 dictionary];
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v19;
    __int16 v27 = 2114;
    uint64_t v28 = v20;
    _os_log_impl(&dword_1D422A000, v18, OS_LOG_TYPE_DEFAULT, "Increase Playback Speed (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
  }
  uint64_t v21 = *(void *)(a1 + 56);
  uint64_t v22 = [v12 dictionary];
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  id v24 = v6;
  id v23 = v6;
  AnalyticsSendEventLazy();
}

id sub_1D425C45C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1D425C7AC(void *a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _MPLogCategoryAssistant();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[4];
      uint64_t v8 = a1[7];
      *(_DWORD *)buf = 138544130;
      id v18 = @"Add Media Items To Library";
      __int16 v19 = 2114;
      uint64_t v20 = v7;
      __int16 v21 = 2048;
      uint64_t v22 = v8;
      __int16 v23 = 2114;
      id v24 = v4;
      _os_log_impl(&dword_1D422A000, v6, OS_LOG_TYPE_ERROR, "%{public}@ (cloud) <%{public}@>: Failed adding %lld. %{public}@", buf, 0x2Au);
    }

    id v9 = NSString;
    id v10 = [v4 localizedDescription];
    id v11 = [v9 stringWithFormat:@"Failed to add store item. %@", v10];

    id v12 = (id)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:v11];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = a1[4];
      uint64_t v14 = a1[7];
      *(_DWORD *)buf = 138543874;
      id v18 = @"Add Media Items To Library";
      __int16 v19 = 2114;
      uint64_t v20 = v13;
      __int16 v21 = 2048;
      uint64_t v22 = v14;
      _os_log_impl(&dword_1D422A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ (cloud) <%{public}@>: Added %lld.", buf, 0x20u);
    }

    id v12 = objc_alloc_init(MEMORY[0x1E4F965B8]);
  }
  (*(void (**)(void))(a1[6] + 16))();
  uint64_t v15 = a1[5];
  uint64_t v16 = *(void **)(v15 + 72);
  *(void *)(v15 + 72) = 0;
}

void sub_1D425CCB0(uint64_t a1, void *a2)
{
  if (sub_1D4245204(a2))
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F965B8]);
  }
  else
  {
    id v3 = [NSString stringWithFormat:@"The system media app reported that adding the track to library was unsuccessful. (trackID = %@)", *(void *)(a1 + 32)];
    id v4 = (id)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:v3];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1D425CD60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void (**)(uint64_t, uint64_t))(v4 + 16);
  id v6 = *(id *)(a1 + 32);
  v5(v4, a3);
}

uint64_t sub_1D425D24C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1D425D25C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1D425D358;
    v7[3] = &unk_1E69E3F30;
    uint64_t v4 = *(void **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v4 _requestCompanionToAddMediaItemsForOrigin:a2 withCompletion:v7];
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v6 = (id)[v5 initWithErrorCode:*MEMORY[0x1E4F97348]];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_1D425D358(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1D425D54C(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), a2);
    id v5 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1D425D760;
    v16[3] = &unk_1E69E4098;
    void v16[4] = v5;
    id v17 = *(id *)(a1 + 40);
    [v5 _performWithCompletion:v16];
  }
  else
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"no user identity"];
    if (![*(id *)(*(void *)(a1 + 32) + 56) length])
    {
      uint64_t v7 = [*(id *)(a1 + 32) aceId];
      uint64_t v8 = sub_1D4244ECC(@"Add Media Items To Library", v7);
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 56);
      *(void *)(v9 + 56) = v8;
    }
    id v11 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 56);
      uint64_t v13 = [v6 dictionary];
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      __int16 v21 = v13;
      _os_log_impl(&dword_1D422A000, v11, OS_LOG_TYPE_DEFAULT, "Add Media Items To Library (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = [v6 dictionary];
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
  }
}

void sub_1D425D760(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![*(id *)(*(void *)(a1 + 32) + 56) length])
  {
    id v4 = [*(id *)(a1 + 32) aceId];
    uint64_t v5 = sub_1D4244ECC(@"Add Media Items To Library", v4);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 56);
    *(void *)(v6 + 56) = v5;
  }
  uint64_t v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 56);
    id v10 = [v3 dictionary];
    int v13 = 138543618;
    uint64_t v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Add Media Items To Library (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = [v3 dictionary];
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
}

void sub_1D425DB14(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 40))
  {
    if (v3)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F965A8]);
      uint64_t v6 = [v4 localizedDescription];
      id v7 = (id)[v5 initWithReason:v6];
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F965B8]);
    }
    if (![*(id *)(*(void *)(a1 + 32) + 56) length])
    {
      uint64_t v8 = [*(id *)(a1 + 32) aceId];
      uint64_t v9 = sub_1D4244ECC(@"Add Media Entity To Acoustic ID History", v8);
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void **)(v10 + 56);
      *(void *)(v10 + 56) = v9;
    }
    uint64_t v12 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 56);
      uint64_t v14 = [v7 dictionary];
      int v17 = 138543618;
      uint64_t v18 = v13;
      __int16 v19 = 2114;
      __int16 v20 = v14;
      _os_log_impl(&dword_1D422A000, v12, OS_LOG_TYPE_DEFAULT, "Add Media Entity To Acoustic ID History (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = [v7 dictionary];
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
  }
}

void sub_1D425DEE0(id *a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a1[4];
  id v5 = [a2 allKeys];
  if (!a2)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"UID decoding error"];
    if (![*((id *)a1[5] + 7) length])
    {
      id v7 = [a1[5] aceId];
      uint64_t v8 = sub_1D4244ECC(@"Get Volume Level", v7);
      uint64_t v9 = a1[5];
      uint64_t v10 = (void *)v9[7];
      v9[7] = v8;
    }
    uint64_t v11 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *((void *)a1[5] + 7);
      uint64_t v13 = [v6 dictionary];
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v12;
      __int16 v30 = 2114;
      uint64_t v31 = v13;
      _os_log_impl(&dword_1D422A000, v11, OS_LOG_TYPE_ERROR, "Get Volume Level (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    uint64_t v14 = (void (**)(id, void *))a1[6];
    uint64_t v15 = [v6 dictionary];
    v14[2](v14, v15);
  }
  if ([v5 count] == 1)
  {
    uint64_t v16 = (const void *)MRAVReconnaissanceSessionCreateWithEndpointFeatures();
    id v27 = a1[6];
    MRAVReconnaissanceSessionBeginSearch();
    CFRelease(v16);
  }
  else
  {
    int v17 = (void *)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"Too many UIDs requested"];
    if (![*((id *)a1[5] + 7) length])
    {
      uint64_t v18 = [a1[5] aceId];
      uint64_t v19 = sub_1D4244ECC(@"Get Volume Level", v18);
      __int16 v20 = a1[5];
      uint64_t v21 = (void *)v20[7];
      v20[7] = v19;
    }
    uint64_t v22 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = *((void *)a1[5] + 7);
      id v24 = [v17 dictionary];
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v23;
      __int16 v30 = 2114;
      uint64_t v31 = v24;
      _os_log_impl(&dword_1D422A000, v22, OS_LOG_TYPE_ERROR, "Get Volume Level (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    uint64_t v25 = (void (**)(id, void *))a1[6];
    uint64_t v26 = [v17 dictionary];
    v25[2](v25, v26);
  }
}

void sub_1D425E23C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F965A8]);
    uint64_t v9 = [v7 localizedFailureReason];
    id v10 = (id)[v8 initWithReason:v9];

    if (![*(id *)(*(void *)(a1 + 32) + 56) length])
    {
      uint64_t v11 = [*(id *)(a1 + 32) aceId];
      uint64_t v12 = sub_1D4244ECC(@"Get Volume Level", v11);
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void **)(v13 + 56);
      *(void *)(v13 + 56) = v12;
    }
    uint64_t v15 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 56);
      int v17 = [v10 dictionary];
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v16;
      __int16 v35 = 2114;
      int v36 = v17;
      _os_log_impl(&dword_1D422A000, v15, OS_LOG_TYPE_ERROR, "Get Volume Level (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    uint64_t v18 = *(void *)(a1 + 40);
    uint64_t v19 = [v10 dictionary];
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
  }
  else
  {
    __int16 v20 = [a2 firstObject];

    id v21 = objc_alloc_init(MEMORY[0x1E4F76E30]);
    CFRetain(*(CFTypeRef *)(a1 + 48));
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1D425E494;
    v26[3] = &unk_1E69E4020;
    uint64_t v30 = a3;
    uint64_t v31 = v20;
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v23 = *(void **)(a1 + 40);
    id v27 = v21;
    uint64_t v28 = v22;
    id v24 = v23;
    uint64_t v25 = *(void *)(a1 + 48);
    id v29 = v24;
    uint64_t v32 = v25;
    id v10 = v21;
    [v10 connectToEndpoint:a3 completion:v26];

    uint64_t v19 = v27;
  }
}

void sub_1D425E494(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 48);
  MRAVEndpointGetOutputDeviceVolume();
}

void sub_1D425E550(uint64_t a1, void *a2, float a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = *(id *)(a1 + 32);
  id v7 = a2;
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F965A8]);
    uint64_t v9 = [v7 localizedFailureReason];
    id v10 = (id)[v8 initWithReason:v9];

    if (![*(id *)(*(void *)(a1 + 40) + 56) length])
    {
      uint64_t v11 = [*(id *)(a1 + 40) aceId];
      uint64_t v12 = sub_1D4244ECC(@"Get Volume Level", v11);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void **)(v13 + 56);
      *(void *)(v13 + 56) = v12;
    }
    uint64_t v15 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 56);
      int v17 = [v10 dictionary];
      int v29 = 138543618;
      uint64_t v30 = v16;
      __int16 v31 = 2114;
      uint64_t v32 = v17;
      uint64_t v18 = v15;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_1D422A000, v18, v19, "Get Volume Level (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v29, 0x16u);
    }
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F968A0]);
    *(float *)&double v20 = a3;
    id v21 = [NSNumber numberWithFloat:v20];
    [v10 setVolumeValue:v21];

    if (![*(id *)(*(void *)(a1 + 40) + 56) length])
    {
      uint64_t v22 = [*(id *)(a1 + 40) aceId];
      uint64_t v23 = sub_1D4244ECC(@"Get Volume Level", v22);
      uint64_t v24 = *(void *)(a1 + 40);
      uint64_t v25 = *(void **)(v24 + 56);
      *(void *)(v24 + 56) = v23;
    }
    uint64_t v15 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 56);
      int v17 = [v10 dictionary];
      int v29 = 138543618;
      uint64_t v30 = v26;
      __int16 v31 = 2114;
      uint64_t v32 = v17;
      uint64_t v18 = v15;
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }
  }

  uint64_t v27 = *(void *)(a1 + 48);
  uint64_t v28 = [v10 dictionary];
  (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v28);

  CFRelease(*(CFTypeRef *)(a1 + 56));
}

void sub_1D425E8D4(uint64_t a1, CFDictionaryRef theDict)
{
  CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E4F77588]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E4F77630]);
  [v4 longLongValue];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1D425EB70(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(id *)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    id v8 = v5;
    if (sub_1D4245204(a3)) {
      id v6 = objc_alloc_init(MEMORY[0x1E4F965B8]);
    }
    else {
      id v6 = (id)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"System media app reported failure adding track to wishlist."];
    }
    id v7 = v6;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    id v5 = v8;
  }
}

void sub_1D425ED58(uint64_t a1, uint64_t a2, void *a3)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a3;
  if (a2 | v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FB8750]);
    id v7 = objc_alloc(MEMORY[0x1E4FB8758]);
    id v8 = [MEMORY[0x1E4FB87B8] activeAccount];
    uint64_t v9 = (void *)[v7 initWithIdentity:v8];

    [v6 setRequestContext:v9];
    id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", *(void *)(a1 + 40));
    v18[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v6 setItemIdentifiers:v11];

    [v6 setPersonalizationStyle:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1D425EF44;
    v14[3] = &unk_1E69E4110;
    id v15 = (id)v5;
    id v12 = *(id *)(a1 + 32);
    uint64_t v16 = v9;
    id v17 = v12;
    id v13 = (id)[v6 performWithResponseHandler:v14];
  }
  else
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F965A8]) initWithReason:@"User is not signed into an iTunes account."];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1D425EF44(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!*(void *)(a1 + 32))
  {
    id v10 = [v5 allItems];
    uint64_t v9 = [v10 firstObject];

    if (v9)
    {
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB8590]) initWithRequestContext:*(void *)(a1 + 40) platformMetadataItem:v9];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = sub_1D425F0D8;
      v13[3] = &unk_1E69E40E8;
      id v14 = *(id *)(a1 + 48);
      [v11 performWithResponseHandler:v13];
    }
    else
    {
      id v12 = objc_alloc(MEMORY[0x1E4F965A8]);
      uint64_t v11 = (void *)[v12 initWithErrorCode:*MEMORY[0x1E4F97350]];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }

    goto LABEL_8;
  }
  if (*(void *)(a1 + 48))
  {
    id v7 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v8 = [v6 localizedDescription];
    uint64_t v9 = (void *)[v7 initWithReason:v8];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_8:
  }
}

void sub_1D425F0D8(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = v5;
  if (*(void *)(a1 + 32))
  {
    if (v5)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F965A8]);
      id v8 = [v6 localizedDescription];
      id v9 = (id)[v7 initWithReason:v8];
    }
    else
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F965B8]);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1D425F3DC(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    if (![*(id *)(*(void *)(a1 + 32) + 56) length])
    {
      id v4 = [*(id *)(a1 + 32) aceId];
      uint64_t v5 = sub_1D4244ECC(@"Add Media Entity To Wish List", v4);
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(void **)(v6 + 56);
      *(void *)(v6 + 56) = v5;
    }
    id v8 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 56);
      id v10 = [v3 dictionary];
      int v13 = 138543618;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Add Media Entity To Wish List (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = [v3 dictionary];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
}

void sub_1D425F548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 && a3)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    MEMORY[0x1F4181798](v3, sel__addRadioTrackToWishListWithStoreID_stationHash_completion_);
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = objc_alloc(MEMORY[0x1E4F965A8]);
    id v6 = (id)[v5 initWithErrorCode:*MEMORY[0x1E4F97350]];
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

uint64_t MPAssistantWatchIsConnectedToCompanion()
{
  return MEMORY[0x1F412DAD8]();
}

uint64_t MPAssistantWatchGetCompanionOriginUniqueIdentifier()
{
  return 1129140302;
}

uint64_t MPAssistantWatchGetCompanionOriginIfAvailable(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(a1 + 16))(a1, 0);
}

uint64_t MPAssistantWatchGetCurrentAudioRoutingInfo(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(a1 + 16))(a1, 0);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9718](md, c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9728](c, data, *(void *)&len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1F40C97B8](md, c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C97C8](c, data, *(void *)&len);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

uint64_t ICSiriPostDynamiteClientStateChangedNotification()
{
  return MEMORY[0x1F4177C48]();
}

uint64_t MPCAssistantCreateError()
{
  return MEMORY[0x1F412DAC8]();
}

uint64_t MPCloudControllerGetSagaOnDiskDatabaseRevisionForUserIdentity()
{
  return MEMORY[0x1F40ED070]();
}

uint64_t MPMediaRemoteCommandOptionsForFeedbackOrPurchaseCommandEvent()
{
  return MEMORY[0x1F40ED088]();
}

uint64_t MPStoreGetClientTokenStatusForIdentity()
{
  return MEMORY[0x1F40ED098]();
}

uint64_t MRAVEndpointAddOutputDevicesToGroupFromSource()
{
  return MEMORY[0x1F412DAF0]();
}

uint64_t MRAVEndpointCopyOrigin()
{
  return MEMORY[0x1F412DB00]();
}

uint64_t MRAVEndpointCopyOutputDevices()
{
  return MEMORY[0x1F412DB08]();
}

uint64_t MRAVEndpointCopyUniqueIdentifier()
{
  return MEMORY[0x1F412DB10]();
}

uint64_t MRAVEndpointGetExternalDevice()
{
  return MEMORY[0x1F412DB30]();
}

uint64_t MRAVEndpointGetLocalEndpoint()
{
  return MEMORY[0x1F412DB38]();
}

uint64_t MRAVEndpointGetMyGroupLeaderWithTimeout()
{
  return MEMORY[0x1F412DB40]();
}

uint64_t MRAVEndpointGetOutputDeviceUIDVolume()
{
  return MEMORY[0x1F412DB48]();
}

uint64_t MRAVEndpointGetOutputDeviceVolume()
{
  return MEMORY[0x1F412DB58]();
}

uint64_t MRAVEndpointIsLocalEndpoint()
{
  return MEMORY[0x1F412DB78]();
}

uint64_t MRAVEndpointMoveOutputGroupToDevicesFromSource()
{
  return MEMORY[0x1F412DB80]();
}

uint64_t MRAVEndpointRemoveOutputDevicesFromGroupFromSource()
{
  return MEMORY[0x1F412DBA8]();
}

uint64_t MRAVEndpointSetOutputDeviceUIDVolume()
{
  return MEMORY[0x1F412DBC8]();
}

uint64_t MRAVReconnaissanceSessionBeginSearch()
{
  return MEMORY[0x1F412DD40]();
}

uint64_t MRAVReconnaissanceSessionCreateWithEndpointFeatures()
{
  return MEMORY[0x1F412DD50]();
}

uint64_t MRContentItemCopyNowPlayingInfo()
{
  return MEMORY[0x1F412DE08]();
}

uint64_t MRExternalDeviceCopyCustomOrigin()
{
  return MEMORY[0x1F412E330]();
}

uint64_t MRMediaRemoteApplicationIsSystemMediaApplication()
{
  return MEMORY[0x1F412E4A8]();
}

uint64_t MRMediaRemoteCommandInfoCopyValueForKey()
{
  return MEMORY[0x1F412E4C0]();
}

uint64_t MRMediaRemoteCommandInfoGetCommand()
{
  return MEMORY[0x1F412E4D0]();
}

uint64_t MRMediaRemoteCommandInfoGetEnabled()
{
  return MEMORY[0x1F412E4D8]();
}

uint64_t MRMediaRemoteCopyCommandDescription()
{
  return MEMORY[0x1F412E508]();
}

uint64_t MRMediaRemoteCopySendCommandErrorDescription()
{
  return MEMORY[0x1F412E540]();
}

uint64_t MRMediaRemoteErrorIsInformational()
{
  return MEMORY[0x1F412E558]();
}

uint64_t MRMediaRemoteGetActiveOrigin()
{
  return MEMORY[0x1F412E570]();
}

uint64_t MRMediaRemoteGetDeviceInfo()
{
  return MEMORY[0x1F412E588]();
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return MEMORY[0x1F412E598]();
}

uint64_t MRMediaRemoteGetLocalReceiverGroupingIdentity()
{
  return MEMORY[0x1F412E5A0]();
}

uint64_t MRMediaRemoteGetLocalReceiverPairingIdentity()
{
  return MEMORY[0x1F412E5A8]();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackState()
{
  return MEMORY[0x1F412E5B8]();
}

uint64_t MRMediaRemoteGetNowPlayingInfo()
{
  return MEMORY[0x1F412E5D8]();
}

uint64_t MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork()
{
  return MEMORY[0x1F412E5E0]();
}

uint64_t MRMediaRemoteGetPlaybackStateForPlayer()
{
  return MEMORY[0x1F412E600]();
}

uint64_t MRMediaRemoteGetSupportedCommandsForOrigin()
{
  return MEMORY[0x1F412E620]();
}

uint64_t MRMediaRemoteInsertSystemAppPlaybackQueueWithOptions()
{
  return MEMORY[0x1F412E628]();
}

uint64_t MRMediaRemoteIsBooksAppInstalled()
{
  return MEMORY[0x1F412E638]();
}

uint64_t MRMediaRemoteNowPlayingCopyResolvedPlayerPath()
{
  return MEMORY[0x1F412E648]();
}

uint64_t MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync()
{
  return MEMORY[0x1F412E740]();
}

uint64_t MRNowPlayingClientGetBundleIdentifier()
{
  return MEMORY[0x1F412E878]();
}

uint64_t MRNowPlayingPlayerPathCreate()
{
  return MEMORY[0x1F412E890]();
}

uint64_t MRNowPlayingPlayerPathGetClient()
{
  return MEMORY[0x1F412E898]();
}

uint64_t MRPairedDeviceCopySystemMediaApplication()
{
  return MEMORY[0x1F412E8D8]();
}

uint64_t MRPlaybackQueueCopyContentItems()
{
  return MEMORY[0x1F412E8E8]();
}

uint64_t MRPlaybackQueueGetContentItemAtOffset()
{
  return MEMORY[0x1F412E8F0]();
}

uint64_t MRPlaybackQueueGetContentItemsCount()
{
  return MEMORY[0x1F412E8F8]();
}

uint64_t MRPlaybackQueueRequestCreate()
{
  return MEMORY[0x1F412E908]();
}

uint64_t MRPlaybackQueueRequestSetIncludeInfo()
{
  return MEMORY[0x1F412E948]();
}

uint64_t MRPlaybackQueueRequestSetIncludeMetadata()
{
  return MEMORY[0x1F412E960]();
}

uint64_t MRSystemAppPlaybackQueueDestroy()
{
  return MEMORY[0x1F412E9F0]();
}

uint64_t MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback()
{
  return MEMORY[0x1F412EAB0]();
}

uint64_t MSVDeviceIsAudioAccessory()
{
  return MEMORY[0x1F412EBB8]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MPLogCategoryAssistant()
{
  return MEMORY[0x1F40ED0B0]();
}

uint64_t _MPLogCategoryAssistant_Oversize()
{
  return MEMORY[0x1F40ED0B8]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1F40D94B8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
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
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void free(void *a1)
{
}

ldiv_t ldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x1F40CC810](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

lldiv_t lldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x1F40CC850](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t stringForSAMPType()
{
  return MEMORY[0x1F4149DD8]();
}