id getLSApplicationWorkspaceClass()
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
  v0 = (void *)_MergedGlobals_4;
  v7 = _MergedGlobals_4;
  if (!_MergedGlobals_4)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getLSApplicationWorkspaceClass_block_invoke;
    v3[3] = &unk_1E58B3000;
    v3[4] = &v4;
    __getLSApplicationWorkspaceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19BF6CD18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t static Logger.updates.getter()
{
  id v0 = ASD_LOG_UPDATES();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_UPDATES()
{
  id v0 = ASDLogHandleForCategory(40);
  return v0;
}

void sub_19BF6D578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BF6DBC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ASDLogHandleForCategory(uint64_t a1)
{
  if (ASDLogHandleForCategory_onceToken != -1) {
    dispatch_once(&ASDLogHandleForCategory_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)ASDLogHandleForCategory_logHandles[a1];
  return v2;
}

void __ASDErrorWithSafeUserInfo_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = safeUserInfoValue(v5);
  v7 = (void *)v6;
  if ((id)v6 != v5) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  if (v6)
  {
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v10];
  }
  else
  {
    v8 = [v10 stringByAppendingString:@"_desc"];
    v9 = [v5 description];
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v8];
  }
}

id safeUserInfoValue(void *a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    ASDErrorWithSafeUserInfo(v1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__15;
    v39 = __Block_byref_object_dispose__15;
    id v40 = 0;
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    uint64_t v34 = 0;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __safeUserInfoValue_block_invoke;
    v30[3] = &unk_1E58B5218;
    v30[4] = &buf;
    v30[5] = &v31;
    [v1 enumerateObjectsUsingBlock:v30];
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      unint64_t v5 = [v1 count];
      id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
      uint64_t v6 = objc_msgSend(v1, "subarrayWithRange:", 0, v32[3]);
      [v3 addObjectsFromArray:v6];

      [v3 addObject:*(void *)(*((void *)&buf + 1) + 40)];
      unint64_t v7 = v32[3] + 1;
      if (v7 < v5)
      {
        do
        {
          v8 = [v1 objectAtIndexedSubscript:v7];
          v9 = safeUserInfoValue(v8);
          id v10 = v9;
          if (v9)
          {
            id v11 = v9;
          }
          else
          {
            id v11 = [v8 description];
          }
          v12 = v11;

          [v3 addObject:v12];
          ++v7;
        }
        while (v5 != v7);
      }
    }
    else
    {
      id v3 = v1;
    }
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v1, "count"));
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __safeUserInfoValue_block_invoke_2;
      v28[3] = &unk_1E58B5240;
      id v14 = v13;
      id v29 = v14;
      [v1 enumerateKeysAndObjectsUsingBlock:v28];
      if ([v14 isEqualToDictionary:v1]) {
        id v15 = v1;
      }
      else {
        id v15 = (id)[v14 copy];
      }
      id v3 = v15;

      goto LABEL_5;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v1, "count"));
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v17 = v1;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v35 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v17);
            }
            v21 = safeUserInfoValue(*(void *)(*((void *)&v24 + 1) + 8 * i));
            objc_msgSend(v16, "addObject:", v21, (void)v24);
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v35 count:16];
        }
        while (v18);
      }

      if ([v16 isEqualToSet:v17]) {
        id v22 = v17;
      }
      else {
        id v22 = (id)[v16 copy];
      }
      id v3 = v22;
    }
    else
    {
      if ([v1 conformsToProtocol:&unk_1EEC57C20])
      {
LABEL_3:
        id v2 = v1;
LABEL_4:
        id v3 = v2;
        goto LABEL_5;
      }
      v23 = ASDLogHandleForCategory(14);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v1;
        _os_log_impl(&dword_19BF6A000, v23, OS_LOG_TYPE_INFO, "Dropping value from NSError.userInfo that could potentially cause problems: %{public}@", (uint8_t *)&buf, 0xCu);
      }

      id v3 = 0;
    }
  }
LABEL_5:

  return v3;
}

void sub_19BF6EF64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

id ASDErrorWithSafeUserInfo(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F1CA60]);
    id v3 = [v1 userInfo];
    v4 = objc_msgSend(v2, "initWithCapacity:", objc_msgSend(v3, "count"));

    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    unint64_t v5 = [v1 userInfo];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __ASDErrorWithSafeUserInfo_block_invoke;
    id v14 = &unk_1E58B51B8;
    v16 = &v17;
    id v6 = v4;
    id v15 = v6;
    [v5 enumerateKeysAndObjectsUsingBlock:&v11];

    if (*((unsigned char *)v18 + 24))
    {
      unint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      v8 = objc_msgSend(v1, "domain", v11, v12, v13, v14);
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, objc_msgSend(v1, "code"), v6);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = v1;
    }

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void sub_19BF6F12C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BF6FD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ASDWithLock(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  [v4 lock];
  v3[2](v3);

  [v4 unlock];
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  id v2 = *(void **)(a1 + 56);
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void sub_19BF717C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0;
  *(void *)(result + 48) = v2;
  uint64_t v3 = *(void *)(a2 + 56);
  *(void *)(a2 + 56) = 0;
  *(void *)(result + 56) = v3;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

id ASDErrorWithUnderlyingErrorAndDescription(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  ASDErrorWithSafeUserInfo(a1);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v7;
  id v11 = v8;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v13 = v12;
  if (v11) {
    [v12 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F28228]];
  }
  if (v9) {
    [v13 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:v10 code:a3 userInfo:v13];

  return v14;
}

void sub_19BF75300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BF75564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BF760C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19BF76224(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19BF762C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19BF775FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BF7941C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11, id *a12, id *a13, id *a14)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(v14);
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(a12);
  objc_destroyWeak(a13);
  objc_destroyWeak(a14);
  objc_destroyWeak((id *)(v19 - 112));
  _Unwind_Resume(a1);
}

void sub_19BF794A0()
{
}

void sub_19BF794A8()
{
}

void sub_19BF794B0()
{
}

void sub_19BF794B8()
{
}

void sub_19BF794C0()
{
}

void sub_19BF7A23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BF7AA8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BF7AE3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __ASDLogHandleForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.appstored", "Activity");
  id v1 = (void *)ASDLogHandleForCategory_logHandles[0];
  ASDLogHandleForCategory_logHandles[0] = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.appstored", "AppCapabilities");
  uint64_t v3 = (void *)qword_1EB4D6668;
  qword_1EB4D6668 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.appstored", "AppInstall");
  unint64_t v5 = (void *)qword_1EB4D6670;
  qword_1EB4D6670 = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.appstored", "AppUsage");
  id v7 = (void *)qword_1EB4D6678;
  qword_1EB4D6678 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.appstored", "Arcade");
  id v9 = (void *)qword_1EB4D6680;
  qword_1EB4D6680 = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.appstored", "Bag");
  id v11 = (void *)qword_1EB4D6688;
  qword_1EB4D6688 = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.appstored", "Cleanup");
  v13 = (void *)qword_1EB4D6690;
  qword_1EB4D6690 = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.appstored", "Clips");
  id v15 = (void *)qword_1EB4D6698;
  qword_1EB4D6698 = (uint64_t)v14;

  os_log_t v16 = os_log_create("com.apple.appstored", "DAAP");
  uint64_t v17 = (void *)qword_1EB4D66A0;
  qword_1EB4D66A0 = (uint64_t)v16;

  os_log_t v18 = os_log_create("com.apple.appstored", "Daemon");
  uint64_t v19 = (void *)qword_1EB4D66A8;
  qword_1EB4D66A8 = (uint64_t)v18;

  os_log_t v20 = os_log_create("com.apple.appstored", "Download");
  v21 = (void *)qword_1EB4D66B0;
  qword_1EB4D66B0 = (uint64_t)v20;

  os_log_t v22 = os_log_create("com.apple.appstored", "EventsExtension");
  v23 = (void *)qword_1EB4D66B8;
  qword_1EB4D66B8 = (uint64_t)v22;

  os_log_t v24 = os_log_create("com.apple.appstored", "Extension");
  long long v25 = (void *)qword_1EB4D66C0;
  qword_1EB4D66C0 = (uint64_t)v24;

  os_log_t v26 = os_log_create("com.apple.appstored", "Framework");
  long long v27 = (void *)qword_1EB4D66C8;
  qword_1EB4D66C8 = (uint64_t)v26;

  os_log_t v28 = os_log_create("com.apple.appstored", "General");
  uint64_t v29 = (void *)qword_1EB4D66D0;
  qword_1EB4D66D0 = (uint64_t)v28;

  os_log_t v30 = os_log_create("com.apple.appstored", "Library");
  uint64_t v31 = (void *)qword_1EB4D66D8;
  qword_1EB4D66D8 = (uint64_t)v30;

  os_log_t v32 = os_log_create("com.apple.appstored", "Metrics");
  uint64_t v33 = (void *)qword_1EB4D66E0;
  qword_1EB4D66E0 = (uint64_t)v32;

  os_log_t v34 = os_log_create("com.apple.appstored", "Migrate");
  v35 = (void *)qword_1EB4D66E8;
  qword_1EB4D66E8 = (uint64_t)v34;

  os_log_t v36 = os_log_create("com.apple.appstored", "StoreKitInXcode");
  uint64_t v37 = (void *)qword_1EB4D66F0;
  qword_1EB4D66F0 = (uint64_t)v36;

  os_log_t v38 = os_log_create("com.apple.appstored", "ODR");
  v39 = (void *)qword_1EB4D66F8;
  qword_1EB4D66F8 = (uint64_t)v38;

  os_log_t v40 = os_log_create("com.apple.appstored", "Offloading");
  uint64_t v41 = (void *)qword_1EB4D6700;
  qword_1EB4D6700 = (uint64_t)v40;

  os_log_t v42 = os_log_create("com.apple.appstored", "Daemon-Oversize");
  v43 = (void *)qword_1EB4D6708;
  qword_1EB4D6708 = (uint64_t)v42;

  os_log_t v44 = os_log_create("com.apple.appstored", "Performance");
  v45 = (void *)qword_1EB4D6710;
  qword_1EB4D6710 = (uint64_t)v44;

  os_log_t v46 = os_log_create("com.apple.appstored", "PrivilegedTask");
  v47 = (void *)qword_1EB4D6718;
  qword_1EB4D6718 = (uint64_t)v46;

  os_log_t v48 = os_log_create("com.apple.appstored", "Progress");
  v49 = (void *)qword_1EB4D6720;
  qword_1EB4D6720 = (uint64_t)v48;

  os_log_t v50 = os_log_create("com.apple.appstored", "Purchase");
  v51 = (void *)qword_1EB4D6728;
  qword_1EB4D6728 = (uint64_t)v50;

  os_log_t v52 = os_log_create("com.apple.appstored", "Push");
  v53 = (void *)qword_1EB4D6730;
  qword_1EB4D6730 = (uint64_t)v52;

  os_log_t v54 = os_log_create("com.apple.appstored", "QA");
  v55 = (void *)qword_1EB4D6738;
  qword_1EB4D6738 = (uint64_t)v54;

  os_log_t v56 = os_log_create("com.apple.appstored", "Repair");
  v57 = (void *)qword_1EB4D6740;
  qword_1EB4D6740 = (uint64_t)v56;

  os_log_t v58 = os_log_create("com.apple.appstored", "Restore");
  v59 = (void *)qword_1EB4D6748;
  qword_1EB4D6748 = (uint64_t)v58;

  os_log_t v60 = os_log_create("com.apple.appstored", "Scheduler");
  v61 = (void *)qword_1EB4D6750;
  qword_1EB4D6750 = (uint64_t)v60;

  os_log_t v62 = os_log_create("com.apple.appstored", "Signpost");
  v63 = (void *)qword_1EB4D6758;
  qword_1EB4D6758 = (uint64_t)v62;

  os_log_t v64 = os_log_create("com.apple.appstored", "SKAdNetwork");
  v65 = (void *)qword_1EB4D6760;
  qword_1EB4D6760 = (uint64_t)v64;

  os_log_t v66 = os_log_create("com.apple.appstored", "Skanner");
  v67 = (void *)qword_1EB4D6768;
  qword_1EB4D6768 = (uint64_t)v66;

  os_log_t v68 = os_log_create("com.apple.appstored", "SoftwareMap");
  v69 = (void *)qword_1EB4D6770;
  qword_1EB4D6770 = (uint64_t)v68;

  os_log_t v70 = os_log_create("com.apple.appstored", "SQL");
  v71 = (void *)qword_1EB4D6778;
  qword_1EB4D6778 = (uint64_t)v70;

  os_log_t v72 = os_log_create("com.apple.appstored", "StoreKit");
  v73 = (void *)qword_1EB4D6780;
  qword_1EB4D6780 = (uint64_t)v72;

  os_log_t v74 = os_log_create("com.apple.appstored", "Subscription");
  v75 = (void *)qword_1EB4D6788;
  qword_1EB4D6788 = (uint64_t)v74;

  os_log_t v76 = os_log_create("com.apple.appstored", "TestFlightFeedback");
  v77 = (void *)qword_1EB4D6790;
  qword_1EB4D6790 = (uint64_t)v76;

  os_log_t v78 = os_log_create("com.apple.appstored", "TestFlightExtension");
  v79 = (void *)qword_1EB4D6798;
  qword_1EB4D6798 = (uint64_t)v78;

  os_log_t v80 = os_log_create("com.apple.appstored", "Updates");
  v81 = (void *)qword_1EB4D67A0;
  qword_1EB4D67A0 = (uint64_t)v80;

  os_log_t v82 = os_log_create("com.apple.appstored", "VPP");
  v83 = (void *)qword_1EB4D67A8;
  qword_1EB4D67A8 = (uint64_t)v82;

  qword_1EB4D67B0 = (uint64_t)os_log_create("com.apple.appstored", "XDC");
  return MEMORY[0x1F41817F8]();
}

void String.init(appStoreDaemonLocalized:comment:)(uint64_t a1)
{
  uint64_t v30 = a1;
  sub_19BFEBF78();
  MEMORY[0x1F4188790]();
  os_log_t v2 = (char *)v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_19BFEBFA8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790]();
  os_log_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_19BFEBF48();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790]();
  os_log_t v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_t v28 = &off_19BFF5B90;
  sub_19BFEBF28();
  id v11 = objc_allocWithZone(MEMORY[0x1E4F28B50]);
  os_log_t v12 = (void *)sub_19BFEBF38();
  id v13 = objc_msgSend(v11, sel_initWithURL_, v12);

  os_log_t v14 = *(void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v29 = v8 + 8;
  v14(v10, v7);
  if (!v13) {
    goto LABEL_8;
  }
  os_log_t v26 = v14;
  uint64_t v27 = v7;
  v25[1] = v2;
  uint64_t v15 = v3;
  uint64_t v16 = v30;
  id v17 = objc_msgSend(v13, sel_localizations);

  if (!v17)
  {
    sub_19BFEBFE8();
    id v17 = (id)sub_19BFEBFD8();
    swift_bridgeObjectRelease();
  }
  os_log_t v18 = self;
  sub_19BFEBF58();
  uint64_t v19 = (void *)sub_19BFEBFD8();
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v18, sel_preferredLocalizationsFromArray_forPreferences_, v17, v19);

  uint64_t v21 = sub_19BFEBFE8();
  if (!*(void *)(v21 + 16))
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v16, v15);
  sub_19BFEBF28();
  id v22 = objc_allocWithZone(MEMORY[0x1E4F28B50]);
  v23 = (void *)sub_19BFEBF38();
  id v24 = objc_msgSend(v22, sel_initWithURL_, v23);

  v26(v10, v27);
  if (v24)
  {
    sub_19BFEBF68();
    sub_19BFEBFC8();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v16, v15);
    return;
  }
LABEL_9:
  __break(1u);
}

uint64_t String.init(appStoreDaemonLocalized:defaultValue:comment:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  int v18 = a3;
  v17[1] = a1;
  v17[2] = a2;
  sub_19BFEBF78();
  MEMORY[0x1F4188790]();
  uint64_t v5 = sub_19BFEBF48();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_19BFEBFA8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790]();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a4, v9);
  sub_19BFEBF28();
  id v12 = objc_allocWithZone(MEMORY[0x1E4F28B50]);
  id v13 = (void *)sub_19BFEBF38();
  id v14 = objc_msgSend(v12, sel_initWithURL_, v13);

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v14)
  {
    sub_19BFEBF68();
    uint64_t v16 = sub_19BFEBFB8();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a4, v9);
    return v16;
  }
  else
  {
    __break(1u);
  }
  return result;
}

const char *FeatureFlag.domain.getter()
{
  return "AppStoreDaemon";
}

const char *FeatureFlag.feature.getter()
{
  if (*v0) {
    return "EphemeralAccount";
  }
  else {
    return "ActiveRestoreSupport";
  }
}

BOOL static FeatureFlag.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t FeatureFlag.hash(into:)()
{
  return sub_19BFEC008();
}

uint64_t FeatureFlag.hashValue.getter()
{
  return sub_19BFEC018();
}

BOOL sub_19BF7BD54(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_19BF7BD6C()
{
  return sub_19BFEC018();
}

uint64_t sub_19BF7BDB4()
{
  return sub_19BFEC008();
}

uint64_t sub_19BF7BDE0()
{
  return sub_19BFEC018();
}

const char *sub_19BF7BE24()
{
  return "AppStoreDaemon";
}

const char *sub_19BF7BE38()
{
  if (*v0) {
    return "EphemeralAccount";
  }
  else {
    return "ActiveRestoreSupport";
  }
}

Swift::Bool __swiftcall asd_isFeatureEnabled(_:)(AppStoreDaemon::FeatureFlag a1)
{
  char v1 = *(unsigned char *)a1;
  v4[3] = &type metadata for FeatureFlag;
  v4[4] = sub_19BF7BEC0();
  LOBYTE(v4[0]) = v1;
  char v2 = sub_19BFEBF88();
  __swift_destroy_boxed_opaque_existential_1(v4);
  return v2 & 1;
}

unint64_t sub_19BF7BEC0()
{
  unint64_t result = qword_1E93ECA00;
  if (!qword_1E93ECA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E93ECA00);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return MEMORY[0x1F4186758](*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_19BF7BF68()
{
  unint64_t result = qword_1E93ECA08;
  if (!qword_1E93ECA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E93ECA08);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FeatureFlag(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FeatureFlag(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x19BF7C128);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_19BF7C150(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_19BF7C15C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FeatureFlag()
{
  return &type metadata for FeatureFlag;
}

uint64_t static Logger.activity.getter()
{
  id v0 = ASD_LOG_ACTIVITY();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_ACTIVITY()
{
  id v0 = ASDLogHandleForCategory(0);
  return v0;
}

uint64_t static Logger.appCapabilities.getter()
{
  id v0 = ASD_LOG_APP_CAPABILITIES();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_APP_CAPABILITIES()
{
  id v0 = ASDLogHandleForCategory(1);
  return v0;
}

uint64_t static Logger.appInstall.getter()
{
  id v0 = ASD_LOG_APPINSTALL();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_APPINSTALL()
{
  id v0 = ASDLogHandleForCategory(2);
  return v0;
}

uint64_t static Logger.appUsage.getter()
{
  id v0 = ASD_LOG_APPUSAGE();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_APPUSAGE()
{
  id v0 = ASDLogHandleForCategory(3);
  return v0;
}

uint64_t static Logger.arcade.getter()
{
  id v0 = ASD_LOG_ARCADE();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_ARCADE()
{
  id v0 = ASDLogHandleForCategory(4);
  return v0;
}

uint64_t static Logger.bag.getter()
{
  id v0 = ASD_LOG_BAG();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_BAG()
{
  id v0 = ASDLogHandleForCategory(5);
  return v0;
}

uint64_t static Logger.cleanup.getter()
{
  id v0 = ASD_LOG_CLEANUP();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_CLEANUP()
{
  id v0 = ASDLogHandleForCategory(6);
  return v0;
}

uint64_t static Logger.clips.getter()
{
  id v0 = ASD_LOG_CLIPS();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_CLIPS()
{
  id v0 = ASDLogHandleForCategory(7);
  return v0;
}

uint64_t static Logger.daap.getter()
{
  id v0 = ASD_LOG_DAAP();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_DAAP()
{
  id v0 = ASDLogHandleForCategory(8);
  return v0;
}

uint64_t static Logger.daemon.getter()
{
  id v0 = ASD_LOG_DAEMON();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_DAEMON()
{
  id v0 = ASDLogHandleForCategory(9);
  return v0;
}

uint64_t static Logger.daemonOversize.getter()
{
  id v0 = ASD_LOG_OVERSIZE();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_OVERSIZE()
{
  id v0 = ASDLogHandleForCategory(21);
  return v0;
}

uint64_t static Logger.download.getter()
{
  id v0 = ASD_LOG_DOWNLOAD();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_DOWNLOAD()
{
  id v0 = ASDLogHandleForCategory(10);
  return v0;
}

uint64_t static Logger.eventsExtension.getter()
{
  id v0 = ASD_LOG_EVENTS_EXT();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_EVENTS_EXT()
{
  id v0 = ASDLogHandleForCategory(11);
  return v0;
}

uint64_t static Logger.extension.getter()
{
  id v0 = ASD_LOG_EXTENSION();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_EXTENSION()
{
  id v0 = ASDLogHandleForCategory(12);
  return v0;
}

uint64_t static Logger.framework.getter()
{
  id v0 = ASD_LOG_FRAMEWORK();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_FRAMEWORK()
{
  id v0 = ASDLogHandleForCategory(13);
  return v0;
}

uint64_t static Logger.general.getter()
{
  id v0 = ASD_LOG_GENERAL();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_GENERAL()
{
  id v0 = ASDLogHandleForCategory(14);
  return v0;
}

uint64_t static Logger.library.getter()
{
  id v0 = ASD_LOG_LIBRARY();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_LIBRARY()
{
  id v0 = ASDLogHandleForCategory(15);
  return v0;
}

uint64_t static Logger.metrics.getter()
{
  id v0 = ASD_LOG_METRICS();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_METRICS()
{
  id v0 = ASDLogHandleForCategory(16);
  return v0;
}

uint64_t static Logger.migrate.getter()
{
  id v0 = ASD_LOG_MIGRATE();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_MIGRATE()
{
  id v0 = ASDLogHandleForCategory(17);
  return v0;
}

uint64_t static Logger.odr.getter()
{
  id v0 = ASD_LOG_ODR();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_ODR()
{
  id v0 = ASDLogHandleForCategory(19);
  return v0;
}

uint64_t static Logger.offloading.getter()
{
  id v0 = ASD_LOG_OFFLOADING();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_OFFLOADING()
{
  id v0 = ASDLogHandleForCategory(20);
  return v0;
}

uint64_t static Logger.performance.getter()
{
  id v0 = ASD_LOG_PERFORMANCE();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_PERFORMANCE()
{
  id v0 = ASDLogHandleForCategory(22);
  return v0;
}

uint64_t static Logger.privilegedTask.getter()
{
  id v0 = ASD_LOG_PRIVTASK();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_PRIVTASK()
{
  id v0 = ASDLogHandleForCategory(23);
  return v0;
}

uint64_t static Logger.progress.getter()
{
  id v0 = ASD_LOG_PROGRESS();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_PROGRESS()
{
  id v0 = ASDLogHandleForCategory(24);
  return v0;
}

uint64_t static Logger.purchase.getter()
{
  id v0 = ASD_LOG_PURCHASE();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_PURCHASE()
{
  id v0 = ASDLogHandleForCategory(25);
  return v0;
}

uint64_t static Logger.push.getter()
{
  id v0 = ASD_LOG_PUSH();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_PUSH()
{
  id v0 = ASDLogHandleForCategory(26);
  return v0;
}

uint64_t static Logger.qa.getter()
{
  id v0 = ASD_LOG_QA();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_QA()
{
  id v0 = ASDLogHandleForCategory(27);
  return v0;
}

uint64_t static Logger.repair.getter()
{
  id v0 = ASD_LOG_REPAIR();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_REPAIR()
{
  id v0 = ASDLogHandleForCategory(28);
  return v0;
}

uint64_t static Logger.restore.getter()
{
  id v0 = ASD_LOG_RESTORE();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_RESTORE()
{
  id v0 = ASDLogHandleForCategory(29);
  return v0;
}

uint64_t static Logger.scheduler.getter()
{
  id v0 = ASD_LOG_SCHEDULER();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_SCHEDULER()
{
  id v0 = ASDLogHandleForCategory(30);
  return v0;
}

uint64_t static Logger.signpost.getter()
{
  id v0 = ASD_LOG_SIGNPOST();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_SIGNPOST()
{
  id v0 = ASDLogHandleForCategory(31);
  return v0;
}

uint64_t static Logger.skAdNetwork.getter()
{
  id v0 = ASD_LOG_SKADNETWORK();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_SKADNETWORK()
{
  id v0 = ASDLogHandleForCategory(32);
  return v0;
}

uint64_t static Logger.skanner.getter()
{
  id v0 = ASD_LOG_SKANNER();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_SKANNER()
{
  id v0 = ASDLogHandleForCategory(33);
  return v0;
}

uint64_t static Logger.softwareMap.getter()
{
  id v0 = ASD_LOG_SOFTWAREMAP();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_SOFTWAREMAP()
{
  id v0 = ASDLogHandleForCategory(34);
  return v0;
}

uint64_t static Logger.sql.getter()
{
  id v0 = ASD_LOG_SQL();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_SQL()
{
  id v0 = ASDLogHandleForCategory(35);
  return v0;
}

uint64_t static Logger.storeKit.getter()
{
  id v0 = ASD_LOG_STOREKIT();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_STOREKIT()
{
  id v0 = ASDLogHandleForCategory(36);
  return v0;
}

uint64_t static Logger.storeKitInXcode.getter()
{
  id v0 = ASD_LOG_OCTANE();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_OCTANE()
{
  id v0 = ASDLogHandleForCategory(18);
  return v0;
}

uint64_t static Logger.subscription.getter()
{
  id v0 = ASD_LOG_SUB();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_SUB()
{
  id v0 = ASDLogHandleForCategory(37);
  return v0;
}

uint64_t static Logger.testFlightFeedback.getter()
{
  id v0 = ASD_LOG_TESTFLIGHT();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_TESTFLIGHT()
{
  id v0 = ASDLogHandleForCategory(38);
  return v0;
}

uint64_t static Logger.testFlightExtension.getter()
{
  id v0 = ASD_LOG_TESTFLIGHT_EXT();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_TESTFLIGHT_EXT()
{
  id v0 = ASDLogHandleForCategory(39);
  return v0;
}

uint64_t static Logger.vpp.getter()
{
  id v0 = ASD_LOG_VPP();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_VPP()
{
  id v0 = ASDLogHandleForCategory(41);
  return v0;
}

uint64_t static Logger.xdc.getter()
{
  id v0 = ASD_LOG_XDC();
  return MEMORY[0x1F41886B0](v0);
}

id ASD_LOG_XDC()
{
  id v0 = ASDLogHandleForCategory(42);
  return v0;
}

void sub_19BF83A3C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

Class __getNRPairedDeviceRegistryClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!qword_1EB4D6410)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __NanoRegistryLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E58B3020;
    uint64_t v6 = 0;
    qword_1EB4D6410 = _sl_dlopen();
    int v2 = (void *)v4[0];
    if (!qword_1EB4D6410)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("NRPairedDeviceRegistry");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    int v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_1EB4D6408 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __NanoRegistryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB4D6410 = result;
  return result;
}

void sub_19BF861D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19BF864F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19BF87348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19BF893CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19BF8C1E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BF8E19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19BF8E4CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19BF8E7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19BF8EB2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19BF8F73C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19BF8FADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19BF9075C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19BF90AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19BF90DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19BF910F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19BF913FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

id _ASA(void *a1)
{
  id v1 = a1;
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

void sub_19BFA117C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19BFA1570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19BFA17E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19BFA1B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19BFA1D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19BFA2018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19BFA234C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19BFA2800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19BFA2A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19BFA2F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19BFA31CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19BFA3698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19BFA39CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19BFA3C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19BFA3EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t ASDIsDaemon()
{
  return __IsDaemon;
}

uint64_t ASDSetIsDaemon(uint64_t result)
{
  __IsDaemon = result;
  return result;
}

void sub_19BFA6FD4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_19BFA7390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BFA78D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t ASDInstallAttributionVersionCreateFromString(void *a1)
{
  id v1 = a1;
  id v2 = objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:options:range:", @"[.,]", @".", 1024, 0, objc_msgSend(v1, "length"));

  if (qword_1EB4D6508 != -1) {
    dispatch_once(&qword_1EB4D6508, &__block_literal_global_11);
  }
  int v3 = [(id)_MergedGlobals_37 objectForKeyedSubscript:v2];
  unsigned int v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 integerValue];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

void __ASDInstallAttributionVersionCreateFromString_block_invoke()
{
  id v0 = (void *)_MergedGlobals_37;
  _MergedGlobals_37 = (uint64_t)&unk_1EEC56520;
}

id __ErrorWithUnderlyingErrorAndPredicate(void *a1, void *a2)
{
  id v3 = a1;
  unsigned int v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a2;
  uint64_t v6 = [v4 dictionary];
  uint64_t v7 = NSString;
  int v8 = [v5 predicateFormat];

  uint64_t v9 = [v7 stringWithFormat:@"Failed to execute query '%@'.", v8];
  [v6 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28228]];

  if (v3) {
    [v6 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ASDAppQueryErrorDomain" code:1 userInfo:v6];

  return v10;
}

uint64_t ASDAggregateClusterMappingDataReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  unsigned int v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          unint64_t v12 = *(void *)(a2 + v11);
          if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v12 + 1;
          v10 |= (unint64_t)(v13 & 0x7F) << v8;
          if ((v13 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          BOOL v14 = v9++ >= 9;
          if (v14)
          {
            unint64_t v10 = 0;
            int v15 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        if (*(unsigned char *)(a2 + *v5)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        int v16 = v10 & 7;
        if (!v15 && v16 != 4)
        {
          switch((v10 >> 3))
          {
            case 1u:
              char v18 = 0;
              unsigned int v19 = 0;
              uint64_t v20 = 0;
              while (1)
              {
                uint64_t v21 = *v3;
                unint64_t v22 = *(void *)(a2 + v21);
                if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
                  break;
                }
                char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
                *(void *)(a2 + v21) = v22 + 1;
                v20 |= (unint64_t)(v23 & 0x7F) << v18;
                if ((v23 & 0x80) == 0) {
                  goto LABEL_95;
                }
                v18 += 7;
                BOOL v14 = v19++ >= 9;
                if (v14)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_97;
                }
              }
              *(unsigned char *)(a2 + *v5) = 1;
LABEL_95:
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v20) = 0;
              }
LABEL_97:
              *(_DWORD *)(a1 + 128) = v20;
              goto LABEL_135;
            case 2u:
              if (v16 != 2)
              {
                char v61 = 0;
                unsigned int v62 = 0;
                uint64_t v63 = 0;
                while (1)
                {
                  uint64_t v64 = *v3;
                  unint64_t v65 = *(void *)(a2 + v64);
                  if (v65 == -1 || v65 >= *(void *)(a2 + *v4)) {
                    goto LABEL_133;
                  }
                  char v66 = *(unsigned char *)(*(void *)(a2 + *v7) + v65);
                  *(void *)(a2 + v64) = v65 + 1;
                  v63 |= (unint64_t)(v66 & 0x7F) << v61;
                  if (v66 < 0)
                  {
                    v61 += 7;
                    BOOL v14 = v62++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_134;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v31 = 0;
                unsigned int v32 = 0;
                uint64_t v33 = 0;
                while (1)
                {
                  uint64_t v34 = *v3;
                  unint64_t v35 = *(void *)(a2 + v34);
                  if (v35 == -1 || v35 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
                  *(void *)(a2 + v34) = v35 + 1;
                  v33 |= (unint64_t)(v36 & 0x7F) << v31;
                  if (v36 < 0)
                  {
                    v31 += 7;
                    BOOL v14 = v32++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_53;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
                PBRepeatedInt32Add();
              }
              goto LABEL_93;
            case 3u:
              if (v16 != 2)
              {
                char v67 = 0;
                unsigned int v68 = 0;
                uint64_t v69 = 0;
                while (1)
                {
                  uint64_t v70 = *v3;
                  unint64_t v71 = *(void *)(a2 + v70);
                  if (v71 == -1 || v71 >= *(void *)(a2 + *v4)) {
                    goto LABEL_133;
                  }
                  char v72 = *(unsigned char *)(*(void *)(a2 + *v7) + v71);
                  *(void *)(a2 + v70) = v71 + 1;
                  v69 |= (unint64_t)(v72 & 0x7F) << v67;
                  if (v72 < 0)
                  {
                    v67 += 7;
                    BOOL v14 = v68++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_134;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v37 = 0;
                unsigned int v38 = 0;
                uint64_t v39 = 0;
                while (1)
                {
                  uint64_t v40 = *v3;
                  unint64_t v41 = *(void *)(a2 + v40);
                  if (v41 == -1 || v41 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v42 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
                  *(void *)(a2 + v40) = v41 + 1;
                  v39 |= (unint64_t)(v42 & 0x7F) << v37;
                  if (v42 < 0)
                  {
                    v37 += 7;
                    BOOL v14 = v38++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_66;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_66:
                PBRepeatedInt32Add();
              }
              goto LABEL_93;
            case 4u:
              if (v16 != 2)
              {
                char v73 = 0;
                unsigned int v74 = 0;
                uint64_t v75 = 0;
                while (1)
                {
                  uint64_t v76 = *v3;
                  unint64_t v77 = *(void *)(a2 + v76);
                  if (v77 == -1 || v77 >= *(void *)(a2 + *v4)) {
                    goto LABEL_133;
                  }
                  char v78 = *(unsigned char *)(*(void *)(a2 + *v7) + v77);
                  *(void *)(a2 + v76) = v77 + 1;
                  v75 |= (unint64_t)(v78 & 0x7F) << v73;
                  if (v78 < 0)
                  {
                    v73 += 7;
                    BOOL v14 = v74++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_134;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v43 = 0;
                unsigned int v44 = 0;
                uint64_t v45 = 0;
                while (1)
                {
                  uint64_t v46 = *v3;
                  unint64_t v47 = *(void *)(a2 + v46);
                  if (v47 == -1 || v47 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v48 = *(unsigned char *)(*(void *)(a2 + *v7) + v47);
                  *(void *)(a2 + v46) = v47 + 1;
                  v45 |= (unint64_t)(v48 & 0x7F) << v43;
                  if (v48 < 0)
                  {
                    v43 += 7;
                    BOOL v14 = v44++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_79;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_79:
                PBRepeatedInt32Add();
              }
              goto LABEL_93;
            case 5u:
              if (v16 != 2)
              {
                char v55 = 0;
                unsigned int v56 = 0;
                uint64_t v57 = 0;
                while (1)
                {
                  uint64_t v58 = *v3;
                  unint64_t v59 = *(void *)(a2 + v58);
                  if (v59 == -1 || v59 >= *(void *)(a2 + *v4)) {
                    goto LABEL_133;
                  }
                  char v60 = *(unsigned char *)(*(void *)(a2 + *v7) + v59);
                  *(void *)(a2 + v58) = v59 + 1;
                  v57 |= (unint64_t)(v60 & 0x7F) << v55;
                  if (v60 < 0)
                  {
                    v55 += 7;
                    BOOL v14 = v56++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_134;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v25 = 0;
                unsigned int v26 = 0;
                uint64_t v27 = 0;
                while (1)
                {
                  uint64_t v28 = *v3;
                  unint64_t v29 = *(void *)(a2 + v28);
                  if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
                  *(void *)(a2 + v28) = v29 + 1;
                  v27 |= (unint64_t)(v30 & 0x7F) << v25;
                  if (v30 < 0)
                  {
                    v25 += 7;
                    BOOL v14 = v26++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_38;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_38:
                PBRepeatedInt32Add();
              }
              goto LABEL_93;
            case 6u:
              if (v16 == 2)
              {
                uint64_t result = PBReaderPlaceMark();
                if (!result) {
                  return result;
                }
                while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
                {
                  char v49 = 0;
                  unsigned int v50 = 0;
                  uint64_t v51 = 0;
                  while (1)
                  {
                    uint64_t v52 = *v3;
                    unint64_t v53 = *(void *)(a2 + v52);
                    if (v53 == -1 || v53 >= *(void *)(a2 + *v4)) {
                      break;
                    }
                    char v54 = *(unsigned char *)(*(void *)(a2 + *v7) + v53);
                    *(void *)(a2 + v52) = v53 + 1;
                    v51 |= (unint64_t)(v54 & 0x7F) << v49;
                    if (v54 < 0)
                    {
                      v49 += 7;
                      BOOL v14 = v50++ >= 9;
                      if (!v14) {
                        continue;
                      }
                    }
                    goto LABEL_92;
                  }
                  *(unsigned char *)(a2 + *v5) = 1;
LABEL_92:
                  PBRepeatedInt32Add();
                }
LABEL_93:
                PBReaderRecallMark();
              }
              else
              {
                char v79 = 0;
                unsigned int v80 = 0;
                uint64_t v81 = 0;
                while (1)
                {
                  uint64_t v82 = *v3;
                  unint64_t v83 = *(void *)(a2 + v82);
                  if (v83 == -1 || v83 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v84 = *(unsigned char *)(*(void *)(a2 + *v7) + v83);
                  *(void *)(a2 + v82) = v83 + 1;
                  v81 |= (unint64_t)(v84 & 0x7F) << v79;
                  if (v84 < 0)
                  {
                    v79 += 7;
                    BOOL v14 = v80++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_134;
                }
LABEL_133:
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_134:
                PBRepeatedInt32Add();
              }
LABEL_135:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
            default:
              if (PBReaderSkipValueWithTag()) {
                goto LABEL_135;
              }
              return 0;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19BFAB5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BFAB808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BFAB9C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BFABC98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BFABE58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BFAC1DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BFAC368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _autoUpdatesEnabled()
{
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"AutoUpdatesEnabled", @"com.apple.itunesstored", &keyExistsAndHasValidFormat))
  {
    BOOL v0 = 1;
  }
  else
  {
    BOOL v0 = keyExistsAndHasValidFormat == 0;
  }
  uint64_t v1 = v0;
  if (!v0)
  {
    id v2 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v4 = 0;
      _os_log_impl(&dword_19BF6A000, v2, OS_LOG_TYPE_INFO, "Auto updates disabled", v4, 2u);
    }
  }
  return v1;
}

void sub_19BFB03D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19BFB0594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19BFB2244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_19BFBA074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19BFBA3AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19BFBA5D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BFBA780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BFBCE60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19BFBD204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19BFC1B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v6 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19BFC1DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v6 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19BFC1FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v6 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19BFC233C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_19BFC876C(_Unwind_Exception *a1)
{
}

void sub_19BFC8914(_Unwind_Exception *a1)
{
}

uint64_t ASDDebugFileLevel()
{
  if (qword_1EB4D63E0 != -1) {
    dispatch_once(&qword_1EB4D63E0, &__block_literal_global_43_1);
  }
  return _MergedGlobals_21;
}

uint64_t ASDDebugLevel()
{
  if (qword_1EB4D63E0 != -1) {
    dispatch_once(&qword_1EB4D63E0, &__block_literal_global_43_1);
  }
  return qword_1EB4D6378;
}

void ASDDebugLogV(unint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (qword_1EB4D63E0 != -1)
  {
    id v17 = v5;
    dispatch_once(&qword_1EB4D63E0, &__block_literal_global_43_1);
    id v5 = v17;
  }
  if (_MergedGlobals_21 >= a1)
  {
    id v16 = v5;
    pthread_mutex_lock(&stru_1EB4D6380);
    uint64_t v6 = (ASDRollableLog *)(id)_MergedGlobals_1;
    if (v6) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = qword_1EB4D63C8 == 0;
    }
    if (!v7)
    {
      char v8 = [ASDRollableLog alloc];
      unsigned int v9 = [(ASDRollableLog *)v8 initWithLogOptions:qword_1EB4D63C8];
      unint64_t v10 = (void *)_MergedGlobals_1;
      _MergedGlobals_1 = (uint64_t)v9;

      uint64_t v6 = v9;
    }
    pthread_mutex_unlock(&stru_1EB4D6380);
    if (v6)
    {
      uint64_t v11 = (void *)[[NSString alloc] initWithFormat:v16 arguments:a3];
      if (qword_1EB4D63D8 != -1) {
        dispatch_once(&qword_1EB4D63D8, &__block_literal_global_23);
      }
      unint64_t v12 = (__CFDateFormatter *)qword_1EB4D63D0;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      CFStringRef StringWithAbsoluteTime = CFDateFormatterCreateStringWithAbsoluteTime(0, v12, Current);
      int v15 = (void *)[[NSString alloc] initWithFormat:@"%@ [%d]: %@\n", StringWithAbsoluteTime, getpid(), v11];
      [(ASDRollableLog *)v6 writeString:v15];
      CFRelease(StringWithAbsoluteTime);
    }
    id v5 = v16;
  }
}

void ASDDebugLog(unint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t ASDDebugSetFileLoggingOptions(void *a1)
{
  id v1 = a1;
  pthread_mutex_lock(&stru_1EB4D6380);
  id v2 = (void *)qword_1EB4D63C8;
  qword_1EB4D63C8 = (uint64_t)v1;

  return pthread_mutex_unlock(&stru_1EB4D6380);
}

void __FileLogDateFormatter_block_invoke()
{
  BOOL v0 = CFDateFormatterCreate(0, 0, kCFDateFormatterShortStyle, kCFDateFormatterFullStyle);
  qword_1EB4D63D0 = (uint64_t)v0;
  CFDateFormatterSetFormat(v0, @"yyyy-MM-dd HH:mm:ss.SSS");
}

uint64_t __ReloadDebugUserDefaults()
{
  int has_internal_content = os_variant_has_internal_content();
  Boolean keyExistsAndHasValidFormat = 0;
  _MergedGlobals_21 = CFPreferencesGetAppIntegerValue(@"DebugFileLevel", @"com.apple.appstored", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = 1;
  }
  else {
    BOOL v1 = has_internal_content == 0;
  }
  if (!v1)
  {
    _MergedGlobals_21 = 3;
    CFPreferencesSetAppValue(@"DebugFileLevel", (CFPropertyListRef)[NSNumber numberWithInteger:3], @"com.apple.appstored");
  }
  qword_1EB4D6378 = CFPreferencesGetAppIntegerValue(@"DebugLevel", @"com.apple.appstored", 0);
  CFPreferencesGetAppBooleanValue(@"LogIncomingHeaders", @"com.apple.appstored", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    int v2 = 0;
  }
  else {
    int v2 = has_internal_content;
  }
  if (v2 == 1) {
    CFPreferencesSetAppValue(@"LogIncomingHeaders", (CFPropertyListRef)[NSNumber numberWithBool:1], @"com.apple.appstored");
  }
  CFPreferencesGetAppBooleanValue(@"LogOutgoingHeaders", @"com.apple.appstored", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    int v3 = 0;
  }
  else {
    int v3 = has_internal_content;
  }
  if (v3 == 1) {
    CFPreferencesSetAppValue(@"LogOutgoingHeaders", (CFPropertyListRef)[NSNumber numberWithBool:1], @"com.apple.appstored");
  }
  return CFPreferencesGetAppBooleanValue(@"LogXML", @"com.apple.appstored", 0);
}

id ASDLocalizedString(void *a1)
{
  BOOL v1 = (void *)MEMORY[0x1E4F28B50];
  id v2 = a1;
  int v3 = [v1 bundleWithPath:@"/System/Library/PrivateFrameworks/AppStoreDaemon.framework"];
  unsigned int v4 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v5 = [v3 localizations];
  uint64_t v6 = [MEMORY[0x1E4F28B50] preferredLocalizationsFromArray:v5 forPreferences:v4];
  BOOL v7 = [v6 firstObject];
  char v8 = [v3 localizedStringForKey:v2 value:0 table:0 localization:v7];

  return v8;
}

void sub_19BFCA2D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BFCF568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BFD4C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BFDA2F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BFDA5E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_19BFDC0AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_19BFDC5D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

Class __getLSApplicationWorkspaceClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!qword_1E93EE3D8)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __MobileCoreServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E58B5010;
    uint64_t v6 = 0;
    qword_1E93EE3D8 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_1E93EE3D8)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("LSApplicationWorkspace");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  _MergedGlobals_4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MobileCoreServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1E93EE3D8 = result;
  return result;
}

void sub_19BFE14D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BFE1AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ASDErrorWithTitleAndMessage(void *a1, uint64_t a2, void *a3, void *a4)
{
  return ASDErrorWithUnderlyingErrorAndInfo(0, a1, a2, a3, a4, 0);
}

id ASDErrorWithUnderlyingError(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  return ASDErrorWithUnderlyingErrorAndInfo(a1, a2, a3, a4, a5, 0);
}

uint64_t ASDErrorIsEqual(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  if (v5 && [v5 code] == a3)
  {
    uint64_t v7 = [v5 domain];
    uint64_t v8 = [v7 isEqualToString:v6];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t ASDErrorSearch(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  if (ASDErrorIsEqual(v5, v6, a3))
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v8 = [v5 underlyingErrors];
    unsigned int v9 = (void *)[v8 mutableCopy];
    while (1)
    {

      if (![v9 count])
      {
        uint64_t v7 = 0;
        goto LABEL_12;
      }
      uint64_t v8 = -[NSMutableArray asd_pop](v9);
      if (ASDErrorIsEqual(v8, v6, a3)) {
        break;
      }
      unint64_t v10 = [v8 underlyingErrors];

      if (v10)
      {
        uint64_t v11 = [v8 underlyingErrors];
        if (v9) {
          [v9 addObjectsFromArray:v11];
        }
      }
    }

    uint64_t v7 = 1;
LABEL_12:
  }
  return v7;
}

id ASDErrorBySettingUserInfoValue(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = v5;
  if (v8)
  {
    unsigned int v9 = v8;
    if ([v6 length])
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v11 = [v8 userInfo];

      if (v11)
      {
        unint64_t v12 = [v8 userInfo];
        [v10 addEntriesFromDictionary:v12];
      }
      if (v7) {
        [v10 setObject:v7 forKey:v6];
      }
      else {
        [v10 removeObjectForKey:v6];
      }
      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = [v8 domain];
      unsigned int v9 = objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, objc_msgSend(v8, "code"), v10);
    }
  }
  else
  {
    unsigned int v9 = 0;
  }

  return v9;
}

id ASDErrorWithDescription(void *a1, uint64_t a2, void *a3)
{
  return ASDErrorWithUnderlyingErrorAndDescription(0, a1, a2, a3);
}

id ASDErrorWithUserInfoAndFormat(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = a3;
  unint64_t v12 = (void *)[a2 mutableCopy];
  uint64_t v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  int v15 = v14;

  id v16 = (void *)[[NSString alloc] initWithFormat:v11 arguments:&a9];
  [v15 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F28228]];

  id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ASDErrorDomain" code:a1 userInfo:v15];

  return v17;
}

id ASDErrorWithUnderlyingErrorAndInfo(void *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if ((unint64_t)v13 | (unint64_t)v14)
  {
    id v16 = (__CFString *)v13;
  }
  else
  {
    id v14 = @"An unknown error occurred";
    id v16 = @"Unhandled exception";
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v18 = v17;
  if (v15) {
    [v17 addEntriesFromDictionary:v15];
  }
  if (v11) {
    [v18 setObject:v11 forKey:*MEMORY[0x1E4F28A50]];
  }
  if (v16) {
    [v18 setObject:v16 forKey:*MEMORY[0x1E4F28568]];
  }
  if (v14) {
    [v18 setObject:v14 forKey:*MEMORY[0x1E4F28588]];
  }
  unsigned int v19 = [MEMORY[0x1E4F28C58] errorWithDomain:v12 code:a3 userInfo:v18];

  return v19;
}

id ASDLocalizedTextForUserPresentableError(uint64_t a1, void *a2)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unsigned int v4 = v3;
  if ((unint64_t)(a1 - 1) >= 2)
  {
    if (a1 != 10)
    {
      unsigned int v9 = 0;
      goto LABEL_10;
    }
    v12[0] = @"ASDLocalizedTitle";
    id v8 = ASDLocalizedString(@"DOWNLOAD_ERROR_TITLE");
    v12[1] = @"ASDLocalizedMessage";
    v13[0] = v8;
    id v5 = ASDLocalizedString(@"NO_NETWORK_MESSAGE");
    v13[1] = v5;
    unsigned int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  }
  else
  {
    id v5 = [v3 objectForKeyedSubscript:@"ASDAppName"];
    if ([v5 length])
    {
      id v6 = NSString;
      id v7 = ASDLocalizedString(@"SIGN_IN_FROM_WATCH_APP_WITH_NAME");
      id v8 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v5);
    }
    else
    {
      id v8 = ASDLocalizedString(@"SIGN_IN_FROM_WATCH_APP");
    }
    v14[0] = @"ASDLocalizedTitle";
    id v10 = ASDLocalizedString(@"SIGN_IN_REQUIRED");
    v14[1] = @"ASDLocalizedMessage";
    v15[0] = v10;
    v15[1] = v8;
    unsigned int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  }
LABEL_10:

  return v9;
}

void __safeUserInfoValue_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  safeUserInfoValue();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 != v9)
  {
    id v8 = v7;
    if (!v7)
    {
      id v8 = [v9 description];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v8);
    if (!v7) {

    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

void __safeUserInfoValue_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  safeUserInfoValue(a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = *(void **)(a1 + 32);
  id v7 = safeUserInfoValue(v5);

  [v6 setObject:v8 forKeyedSubscript:v7];
}

void sub_19BFEBAC8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_19BFEBF28()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_19BFEBF38()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_19BFEBF48()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_19BFEBF58()
{
  return MEMORY[0x1F40E5638]();
}

uint64_t sub_19BFEBF68()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_19BFEBF78()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_19BFEBF88()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_19BFEBFA8()
{
  return MEMORY[0x1F40E6158]();
}

uint64_t sub_19BFEBFB8()
{
  return MEMORY[0x1F40E62B0]();
}

uint64_t sub_19BFEBFC8()
{
  return MEMORY[0x1F40E62B8]();
}

uint64_t sub_19BFEBFD8()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_19BFEBFE8()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_19BFEBFF8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_19BFEC008()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_19BFEC018()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t AMSError()
{
  return MEMORY[0x1F410A918]();
}

uint64_t AMSHashIfNeeded()
{
  return MEMORY[0x1F410A938]();
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x1F410CFC8]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x1F410CFD8]();
}

uint64_t BOMCopierNew()
{
  return MEMORY[0x1F410CFE0]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9710](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1F40D78B0](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x1F40D78D8](allocator, formatter, at);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t NSUnimplemented_()
{
  return MEMORY[0x1F40E72D0]();
}

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x1F4147180]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x1F4147188]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x1F4147360]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x1F4147368]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x1F4147370]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x1F4147378]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x1F4147380]();
}

uint64_t PBRepeatedInt32NSArray()
{
  return MEMORY[0x1F4147388]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x1F40CA578](__key, __base, __nel, __width, __compar);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t container_system_path_for_identifier()
{
  return MEMORY[0x1F40CB800]();
}

uint64_t ct_green_tea_logging_enabled()
{
  return MEMORY[0x1F417A390]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
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
  return MEMORY[0x1F40CBD30](when, delta);
}

int dup(int a1)
{
  return MEMORY[0x1F40CBDF8](*(void *)&a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

void objc_exception_rethrow(void)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1F40CD5E8]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}