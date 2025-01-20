void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  uint64_t v5;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_213B821F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213B82618(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213B82838(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213B82B9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213B82C48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213B82F60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213B8300C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213B830B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213B83150(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213B831D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_213B832E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213B833A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __CATPerformBlock_block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x2166930C0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_213B876F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_213B878FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id _CATLogGeneral()
{
  if (_CATLogGeneral_onceToken_0 != -1) {
    dispatch_once(&_CATLogGeneral_onceToken_0, &__block_literal_global_0);
  }
  v0 = (void *)_CATLogGeneral_logObj_0;

  return v0;
}

id CATGetCatalystQueue()
{
  if (onceToken != -1) {
    dispatch_once(&onceToken, &__block_literal_global_1);
  }
  v0 = (void *)mainQueue;

  return v0;
}

void __CATGetCatalystQueue_block_invoke()
{
}

void CATSetCatalystQueue(void *a1)
{
  id v1 = a1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATSetCatalystQueue_block_invoke;
  block[3] = &unk_2641DBE60;
  id v5 = v1;
  uint64_t v2 = onceToken;
  id v3 = v1;
  if (v2 != -1) {
    dispatch_once(&onceToken, block);
  }
}

void __CATSetCatalystQueue_block_invoke(uint64_t a1)
{
}

id CATErrorWithDomainCodeAndUserInfo(void *a1, uint64_t a2, void (*a3)(uint64_t, id), void *a4)
{
  id v7 = a1;
  id v8 = a4;
  if (!a3)
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    v20 = objc_msgSend(NSString, "stringWithUTF8String:", "NSError *CATErrorWithDomainCodeAndUserInfo(NSString *__strong, NSInteger, CATErrorDescriptionsGenerator, NSDictionary *__strong)");
    [v19 handleFailureInFunction:v20, @"CATError.m", 12, @"Invalid parameter not satisfying: %@", @"errorDescriptionsWithCodeAndUserInfo" file lineNumber description];
  }
  uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F08320]];
  if (v9
    && (uint64_t v10 = (void *)v9,
        [v8 objectForKeyedSubscript:@"NSDescription"],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    id v12 = v8;
  }
  else
  {
    v13 = a3(a2, v8);
    id v12 = v8;
    if (v13)
    {
      v14 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v12];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __CATErrorWithDomainCodeAndUserInfo_block_invoke;
      v21[3] = &unk_2641DBF00;
      id v22 = v14;
      id v15 = v14;
      [v13 enumerateKeysAndObjectsUsingBlock:v21];
      uint64_t v16 = [v15 copy];

      id v12 = (id)v16;
    }
  }
  v17 = [MEMORY[0x263F087E8] errorWithDomain:v7 code:a2 userInfo:v12];

  return v17;
}

void __CATErrorWithDomainCodeAndUserInfo_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

  if (!v6) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

void sub_213B8A1CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __CATPerformBlock_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x2166930C0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id CATFormattedStringForKey(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v9 = a1;
  uint64_t v10 = objc_opt_new();
  v26 = &a9;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v17 = objc_msgSend(v11, "objectForKeyedSubscript:", v16, (void)v22);
        id v18 = [NSString alloc];
        v19 = (void *)[v18 initWithFormat:v17 arguments:v26];
        [v10 setObject:v19 forKeyedSubscript:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v13);
  }

  v20 = (void *)[v10 copy];

  return v20;
}

void sub_213B8C4C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213B8C638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213B8C994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213B8CCB0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

id _CATLogGeneral_0()
{
  if (_CATLogGeneral_onceToken_2 != -1) {
    dispatch_once(&_CATLogGeneral_onceToken_2, &__block_literal_global_118);
  }
  v0 = (void *)_CATLogGeneral_logObj_2;

  return v0;
}

void sub_213B8D40C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __CATPerformBlock_block_invoke_1(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x2166930C0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __REACHABILITY_CALLBACK__(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 reachabilityDidChangeWithFlags:a2];
}

void __CATPerformBlock_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x2166930C0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_213B91C70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213B91DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CATLogGeneral_1()
{
  if (_CATLogGeneral_onceToken_4 != -1) {
    dispatch_once(&_CATLogGeneral_onceToken_4, &__block_literal_global_7);
  }
  v0 = (void *)_CATLogGeneral_logObj_4;

  return v0;
}

void sub_213B924BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_213B92C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __CATPerformBlock_block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x2166930C0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_213B93910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213B93A48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __CATPerformBlock_block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x2166930C0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __CATPerformBlock_block_invoke_5(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x2166930C0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_213B99730(_Unwind_Exception *exception_object)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(exception_object);
}

void sub_213B99750(void *a1)
{
  objc_begin_catch(a1);
  if (!v1) {
    JUMPOUT(0x213B996CCLL);
  }
  JUMPOUT(0x213B99708);
}

void __CATPerformBlock_block_invoke_6(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x2166930C0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_213B9BA40(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

id _CATLogGeneral_2()
{
  if (_CATLogGeneral_onceToken_7 != -1) {
    dispatch_once(&_CATLogGeneral_onceToken_7, &__block_literal_global_11);
  }
  v0 = (void *)_CATLogGeneral_logObj_7;

  return v0;
}

void sub_213B9CF70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213B9D64C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __CATPerformBlock_block_invoke_7(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x2166930C0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_213B9E62C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_213B9F9E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213B9FBB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213B9FD4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213B9FEC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213BA0168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213BA029C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id _CATLogGeneral_3()
{
  if (_CATLogGeneral_onceToken_8 != -1) {
    dispatch_once(&_CATLogGeneral_onceToken_8, &__block_literal_global_12);
  }
  v0 = (void *)_CATLogGeneral_logObj_8;

  return v0;
}

void sub_213BA07BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 72));
  _Unwind_Resume(a1);
}

void sub_213BA0924(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213BA0AA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213BA0C00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213BA0D6C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __CATPerformBlock_block_invoke_8(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x2166930C0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __CATPerformBlock_block_invoke_9(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x2166930C0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_213BA25DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_213BA29D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_213BA3DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213BA3F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213BA427C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CATLogGeneral_4()
{
  if (_CATLogGeneral_onceToken_10 != -1) {
    dispatch_once(&_CATLogGeneral_onceToken_10, &__block_literal_global_14);
  }
  v0 = (void *)_CATLogGeneral_logObj_10;

  return v0;
}

void sub_213BA4618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213BA4810(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 56));
  _Unwind_Resume(a1);
}

void sub_213BA4968(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213BA4AE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213BA4C68(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213BA4EA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void __CATPerformBlock_block_invoke_10(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x2166930C0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id _CATLogFSM()
{
  if (_CATLogFSM_onceToken != -1) {
    dispatch_once(&_CATLogFSM_onceToken, &__block_literal_global_16);
  }
  v0 = (void *)_CATLogFSM_logObj;

  return v0;
}

void sub_213BA6584(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    uint64_t v3 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = 0;

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_213BA9C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __CATPerformBlock_block_invoke_11(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x2166930C0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_213BABEC8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id _CATLogGeneral_5()
{
  if (_CATLogGeneral_onceToken_11 != -1) {
    dispatch_once(&_CATLogGeneral_onceToken_11, &__block_literal_global_17);
  }
  v0 = (void *)_CATLogGeneral_logObj_11;

  return v0;
}

void __CATPerformBlock_block_invoke_12(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x2166930C0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __CATPerformBlock_block_invoke_13(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x2166930C0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_213BAF228(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, long long buf)
{
  if (a2 == 1)
  {
    id v14 = objc_begin_catch(a1);
    id v15 = _CATLogGeneral_6();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412546;
      *(void *)((char *)&buf + 4) = v13;
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = v14;
      _os_log_error_impl(&dword_213B7F000, v15, OS_LOG_TYPE_ERROR, "%@: %@", (uint8_t *)&buf, 0x16u);
    }

    [v13 setRequest:0];
    objc_end_catch();
    JUMPOUT(0x213BAF1F0);
  }
  _Unwind_Resume(a1);
}

id _CATLogGeneral_6()
{
  if (_CATLogGeneral_onceToken_12 != -1) {
    dispatch_once(&_CATLogGeneral_onceToken_12, &__block_literal_global_18);
  }
  v0 = (void *)_CATLogGeneral_logObj_12;

  return v0;
}

void sub_213BAFF00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __CATPerformBlock_block_invoke_14(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x2166930C0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id _CATLogGeneral_7()
{
  if (_CATLogGeneral_onceToken_14 != -1) {
    dispatch_once(&_CATLogGeneral_onceToken_14, &__block_literal_global_43);
  }
  v0 = (void *)_CATLogGeneral_logObj_14;

  return v0;
}

void __CATPerformBlock_block_invoke_15(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x2166930C0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_213BB92A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __CATPerformBlock_block_invoke_16(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x2166930C0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_213BB9E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213BBA2E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213BBC1A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213BBC3C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213BBC6D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213BBC9D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_213BBCE00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_213BBD310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213BBD51C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_213BBD800(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_213BBDEA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213BBDFE0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __CATPerformBlock_block_invoke_17(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x2166930C0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_213BBEAD8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_213BBF1C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213BBF32C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213BBF4C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213BBF5FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213BBF90C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_213BBFC48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 72));
  _Unwind_Resume(a1);
}

void sub_213BBFDB0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213BBFF38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213BC0174(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213BC0358(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_213BC0570(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void __CATPerformBlock_block_invoke_18(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x2166930C0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id CATErrorWithCodeAndUserInfo(uint64_t a1, void *a2)
{
  return CATErrorWithDomainCodeAndUserInfo(@"Catalyst.error", a1, (void (*)(uint64_t, id))_CATErrorDescriptionsWithCodeAndUserInfo, a2);
}

id _CATErrorDescriptionsWithCodeAndUserInfo(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v29 = a2;
  if (_CATErrorDescriptionsWithCodeAndUserInfo_onceToken != -1) {
    dispatch_once(&_CATErrorDescriptionsWithCodeAndUserInfo_onceToken, &__block_literal_global_26);
  }
  id v3 = 0;
  if (a1 <= 500)
  {
    if (a1 > 199)
    {
      if (a1 > 300)
      {
        switch(a1)
        {
          case 400:
            id v30 = (id)objc_opt_new();
            objc_msgSend((id)_CATErrorDescriptionsWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", @"An unknown service request (%@).", &stru_26C4A6940, @"CATErrors");
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            id v3 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v6 = [v3 countByEnumeratingWithState:&v35 objects:v40 count:16];
            if (v6)
            {
              uint64_t v7 = v6;
              uint64_t v8 = *(void *)v36;
              do
              {
                for (uint64_t i = 0; i != v7; ++i)
                {
                  if (*(void *)v36 != v8) {
                    objc_enumerationMutation(v3);
                  }
                  uint64_t v10 = *(void *)(*((void *)&v35 + 1) + 8 * i);
                  uint64_t v11 = [v3 objectForKeyedSubscript:v10];
                  uint64_t v12 = NSString;
                  uint64_t v13 = [v29 objectForKeyedSubscript:@"kCATErrorRequestNameKey"];
                  uint64_t v14 = [v12 stringWithValidatedFormat:v11, @"%@", 0, v13 validFormatSpecifiers error];
                  id v15 = (void *)v14;
                  if (v14) {
                    uint64_t v16 = (__CFString *)v14;
                  }
                  else {
                    uint64_t v16 = @"FORMAT SPECIFIER ERROR";
                  }
                  [v30 setObject:v16 forKeyedSubscript:v10];
                }
                uint64_t v7 = [v3 countByEnumeratingWithState:&v35 objects:v40 count:16];
              }
              while (v7);
            }
            goto LABEL_61;
          case 401:
            uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v5 = @"The operation is no longer available.";
            break;
          case 402:
            uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v5 = @"There was a problem serializing the request.";
            break;
          case 403:
            id v30 = (id)objc_opt_new();
            objc_msgSend((id)_CATErrorDescriptionsWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", @"Failed to create operation for request (%@).", &stru_26C4A6940, @"CATErrors");
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            id v3 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v17 = [v3 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v32;
              do
              {
                for (uint64_t j = 0; j != v18; ++j)
                {
                  if (*(void *)v32 != v19) {
                    objc_enumerationMutation(v3);
                  }
                  uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 8 * j);
                  long long v22 = [v3 objectForKeyedSubscript:v21];
                  long long v23 = NSString;
                  long long v24 = [v29 objectForKeyedSubscript:@"kCATErrorRequestNameKey"];
                  uint64_t v25 = [v23 stringWithValidatedFormat:v22, @"%@", 0, v24 validFormatSpecifiers error];
                  v26 = (void *)v25;
                  if (v25) {
                    v27 = (__CFString *)v25;
                  }
                  else {
                    v27 = @"FORMAT SPECIFIER ERROR";
                  }
                  [v30 setObject:v27 forKeyedSubscript:v21];
                }
                uint64_t v18 = [v3 countByEnumeratingWithState:&v31 objects:v39 count:16];
              }
              while (v18);
            }
LABEL_61:

            goto LABEL_65;
          case 404:
            uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v5 = @"The operation was canceled.";
            break;
          default:
            if (a1 == 301)
            {
              uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v5 = @"Malformed message.";
            }
            else
            {
              id v30 = 0;
              if (a1 != 302) {
                goto LABEL_65;
              }
              uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v5 = @"Unexpected message.";
            }
            break;
        }
      }
      else if (a1 == 200)
      {
        uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
        uint64_t v5 = @"Transport has been invalidated.";
      }
      else if (a1 == 202)
      {
        uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
        uint64_t v5 = @"Transport could not connect.";
      }
      else
      {
        id v30 = 0;
        if (a1 != 300) {
          goto LABEL_65;
        }
        uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
        uint64_t v5 = @"Unable to parse message.";
      }
    }
    else
    {
      if (a1 > 99)
      {
        id v30 = 0;
        switch(a1)
        {
          case 'd':
            uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v5 = @"The remote connection has been closed.";
            goto LABEL_64;
          case 'e':
            uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v5 = @"Receiving data failed.";
            goto LABEL_64;
          case 'f':
            uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v5 = @"Sending data failed.";
            goto LABEL_64;
          case 'g':
            uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v5 = @"The remote connection has been closed by the peer.";
            goto LABEL_64;
          case 'h':
            uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v5 = @"The remote connection could not create streams.";
            goto LABEL_64;
          case 'i':
            uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v5 = @"The connection timed out.";
            goto LABEL_64;
          case 'j':
            uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v5 = @"Unable to establish secure connection.";
            goto LABEL_64;
          case 'k':
            uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v5 = @"Failed to configure secure settings on connection.";
            goto LABEL_64;
          default:
            goto LABEL_65;
        }
        goto LABEL_65;
      }
      if (a1 == 1)
      {
        uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
        uint64_t v5 = @"An unknown error occurred.";
      }
      else if (a1 == 2)
      {
        uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
        uint64_t v5 = @"A parameter was invalid.";
      }
      else
      {
        id v30 = 0;
        if (a1 != 4) {
          goto LABEL_65;
        }
        uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
        uint64_t v5 = @"The operation timed out.";
      }
    }
LABEL_64:
    objc_msgSend(v4, "cat_localizedStringsForKey:value:table:", v5, &stru_26C4A6940, @"CATErrors");
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = 0;
    goto LABEL_65;
  }
  id v30 = 0;
  switch(a1)
  {
    case 600:
      uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
      uint64_t v5 = @"The connection timed out waiting to hear from the remote.";
      goto LABEL_64;
    case 601:
      uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
      uint64_t v5 = @"The connection timed out waiting to receive the next segment in a full data send.";
      goto LABEL_64;
    case 602:
      uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
      uint64_t v5 = @"The connection recieved an out of order data segment.";
      goto LABEL_64;
    case 603:
      uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
      uint64_t v5 = @"The connection was closed by the other side of the connection.";
      goto LABEL_64;
    case 604:
      uint64_t v4 = (void *)_CATErrorDescriptionsWithCodeAndUserInfo_bundle;
      uint64_t v5 = @"The connection is no longer able to communicate with the remote.";
      goto LABEL_64;
    default:
      break;
  }
LABEL_65:

  return v30;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t CATAsyncPromise.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  CATAsyncPromise.init()();
  return v0;
}

char *CATAsyncPromise.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(*(void *)v0 + 80);
  type metadata accessor for CATAsyncStreamMulticaster();
  sub_213BC9E04((uint64_t)&v8);
  uint64_t v6 = v8;
  char v7 = v9;
  *((void *)v0 + 2) = CATAsyncStreamMulticaster.__allocating_init(bufferingPolicy:)((uint64_t)&v6);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(&v1[*(void *)(*(void *)v1 + 96)], 1, 1, v2);
  uint64_t v3 = *(void *)(*(void *)v0 + 104);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC248);
  uint64_t v4 = swift_allocObject();
  *(_DWORD *)(v4 + 16) = 0;
  *(void *)&v1[v3] = v4;
  return v1;
}

uint64_t CATAsyncPromise.isFulfilled.getter()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + *(void *)(*(void *)v0 + 104)) + 16);
  os_unfair_lock_lock(v1);
  sub_213BC57F4(&v3);
  os_unfair_lock_unlock(v1);
  return v3;
}

uint64_t sub_213BC3A08@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)(*a1 + 80);
  uint64_t v6 = sub_213BD6700();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v9 = (char *)&v12 - v8;
  uint64_t v10 = (uint64_t)a1 + *(void *)(v4 + 96);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  LOBYTE(v10) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v9, 1, v5) != 1;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  *a2 = v10;
  return result;
}

uint64_t sub_213BC3B80@<X0>(unsigned char *a1@<X8>)
{
  return sub_213BC3A08(v1, a1);
}

void sub_213BC3BAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v3 = (os_unfair_lock_s *)(a3 + ((*(unsigned int *)(*(void *)a3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v3);
  sub_213BC6164();
  os_unfair_lock_unlock(v3);
}

void CATAsyncPromise.fulfill(_:)()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + *(void *)(*(void *)v0 + 104)) + 16);
  os_unfair_lock_lock(v1);
  sub_213BC5864();
  os_unfair_lock_unlock(v1);
}

uint64_t sub_213BC3CE8(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)(*a1 + 80);
  uint64_t v6 = sub_213BD6700();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v21 - v12;
  uint64_t v14 = *(void *)(v5 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v11);
  long long v22 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v21 - v17;
  uint64_t v19 = (uint64_t)a1 + *(void *)(v4 + 96);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v13, v19, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, v5) == 1)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    CATAsyncStreamMulticaster.yield(_:)((char *)&v23);
    CATAsyncStreamMulticaster.finish()();
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v10, a2, v5);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v10, 0, 1, v5);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 40))(v19, v10, v6);
    return swift_endAccess();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v18, v13, v5);
    unint64_t v23 = 0;
    unint64_t v24 = 0xE000000000000000;
    sub_213BD6710();
    swift_bridgeObjectRelease();
    unint64_t v23 = 0xD000000000000023;
    unint64_t v24 = 0x8000000213BDF930;
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v22, v18, v5);
    sub_213BD63B0();
    sub_213BD63C0();
    swift_bridgeObjectRelease();
    uint64_t result = sub_213BD6740();
    __break(1u);
  }
  return result;
}

uint64_t CATAsyncPromise.value.getter(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC258);
  v2[4] = swift_task_alloc();
  v2[5] = *(void *)(v3 + 80);
  uint64_t v4 = sub_213BD6700();
  v2[6] = v4;
  v2[7] = *(void *)(v4 - 8);
  v2[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_213BC4178, 0, 0);
}

uint64_t sub_213BC4178()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[5];
  sub_213BC44FC();
  uint64_t v3 = *(void *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    uint64_t v5 = v0[4];
    uint64_t v4 = v0[5];
    uint64_t v6 = v0[3];
    (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
    uint64_t v7 = sub_213BD6480();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
    uint64_t v8 = (void *)swift_allocObject();
    v8[2] = 0;
    v8[3] = 0;
    v8[4] = v6;
    swift_retain();
    uint64_t v9 = sub_213BC4BB8(v5, (uint64_t)&unk_2677FC268, (uint64_t)v8, v4);
    v0[9] = v9;
    sub_213BC596C(v5);
    uint64_t v10 = (void *)swift_task_alloc();
    v0[10] = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_213BC43AC;
    uint64_t v11 = v0[5];
    uint64_t v12 = v0[2];
    return MEMORY[0x270FA1FD0](v12, v9, v11);
  }
  else
  {
    (*(void (**)(void, void, void))(v3 + 32))(v0[2], v0[8], v0[5]);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
}

uint64_t sub_213BC43AC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_213BC44FC()
{
  uint64_t v1 = *(void *)(v0 + *(void *)(*(void *)v0 + 104));
  sub_213BD6700();
  sub_213BC3BAC((uint64_t)sub_213BC60AC, v0, v1);
}

uint64_t sub_213BC4590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = *(void *)(*(void *)a4 + 80);
  sub_213BD6700();
  uint64_t v5 = swift_task_alloc();
  v4[4] = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  v4[5] = v6;
  void *v6 = v4;
  v6[1] = sub_213BC4674;
  return sub_213BC4864(v5);
}

uint64_t sub_213BC4674()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_213BC4770, 0, 0);
}

uint64_t sub_213BC4770()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v2, 1, v1);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(v0[2], v2, v1);
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
  return result;
}

uint64_t sub_213BC4864(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *(void *)(*(void *)v1 + 80);
  uint64_t v3 = sub_213BD6530();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_213BC493C, 0, 0);
}

uint64_t sub_213BC493C()
{
  uint64_t v1 = v0[4];
  CATAsyncStreamMulticaster.makeStream()(v0[7]);
  uint64_t v2 = swift_task_alloc();
  v0[8] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[9] = v3;
  uint64_t WitnessTable = swift_getWitnessTable();
  *uint64_t v3 = v0;
  v3[1] = sub_213BC4A44;
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[2];
  return MEMORY[0x270FA20A0](v6, &unk_2677FC2B8, v2, v5, WitnessTable);
}

uint64_t sub_213BC4A44()
{
  uint64_t v1 = *(void *)(*v0 + 56);
  uint64_t v2 = *(void *)(*v0 + 48);
  uint64_t v3 = *(void *)(*v0 + 40);
  uint64_t v6 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_213BC4BB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC258);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213BC5F44(a1, (uint64_t)v9);
  uint64_t v10 = sub_213BD6480();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_213BC596C((uint64_t)v9);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v12 = sub_213BD6420();
      uint64_t v14 = v13;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_213BD6470();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
  uint64_t v14 = 0;
LABEL_6:
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a4;
  v15[3] = a2;
  v15[4] = a3;
  if (v14 | v12)
  {
    v17[0] = 0;
    v17[1] = 0;
    v17[2] = v12;
    v17[3] = v14;
  }
  return swift_task_create();
}

uint64_t CATAsyncPromise.throwingValue.getter(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *(void *)(*(void *)v1 + 80);
  uint64_t v3 = sub_213BD6700();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  v2[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_213BC4E84, 0, 0);
}

uint64_t sub_213BC4E84()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[4];
  sub_213BC44FC();
  uint64_t v3 = *(void *)(v2 - 8);
  v0[9] = v3;
  uint64_t v4 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  v0[10] = v4;
  v0[11] = (v3 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  if (v4(v1, 1, v2) == 1)
  {
    uint64_t v5 = v0[8];
    uint64_t v6 = v0[5];
    uint64_t v7 = v0[6];
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v0[12] = v8;
    v0[13] = (v7 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v8(v5, v6);
    uint64_t v9 = (void *)swift_task_alloc();
    v0[14] = v9;
    void *v9 = v0;
    v9[1] = sub_213BC5024;
    uint64_t v10 = v0[7];
    return sub_213BC4864(v10);
  }
  else
  {
    (*(void (**)(void, void, void))(v3 + 32))(v0[2], v0[8], v0[4]);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
}

uint64_t sub_213BC5024()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_213BC5120, 0, 0);
}

uint64_t sub_213BC5120()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 32);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 80))(v1, 1, v2) == 1)
  {
    (*(void (**)(uint64_t, void))(v0 + 96))(v1, *(void *)(v0 + 40));
    sub_213BD6430();
    sub_213BC59CC();
    swift_allocError();
    sub_213BD6330();
    swift_willThrow();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(*(void *)(v0 + 72) + 32))(*(void *)(v0 + 16), v1, v2);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_213BC524C()
{
  return sub_213BC5F30(*(uint64_t (**)(uint64_t))(v0 + 8), v0, 1);
}

uint64_t CATAsyncPromise.deinit()
{
  swift_release();
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 96);
  uint64_t v2 = sub_213BD6700();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return v0;
}

uint64_t CATAsyncPromise.__deallocating_deinit()
{
  CATAsyncPromise.deinit();

  return swift_deallocClassInstance();
}

uint64_t sub_213BC538C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_213BC61BC;
  return CATAsyncPromise.value.getter(a1);
}

uint64_t sub_213BC5428(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_213BC54C4;
  return CATAsyncPromise.throwingValue.getter(a1);
}

uint64_t sub_213BC54C4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_213BC55B8()
{
  return CATAsyncPromise.isFulfilled.getter() & 1;
}

void sub_213BC55E0()
{
}

uint64_t CATAsyncPromiseWriting<>.fulfill()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 24))(a1, a1, a2);
}

uint64_t sub_213BC5620(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_213BC56FC;
  return v6(a1);
}

uint64_t sub_213BC56FC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *sub_213BC57F4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_213BC5838()
{
  return sub_213BC3CE8(*(uint64_t **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_213BC5864()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_213BC588C()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_213BC58CC(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_213BC54C4;
  return sub_213BC4590(a1, v5, v6, v4);
}

uint64_t sub_213BC596C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC258);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_213BC59CC()
{
  unint64_t result = qword_2677FC280;
  if (!qword_2677FC280)
  {
    sub_213BD6430();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677FC280);
  }
  return result;
}

uint64_t sub_213BC5A28()
{
  uint64_t result = sub_213BD6700();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for CATAsyncPromise()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for CATAsyncPromise(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CATAsyncPromise);
}

uint64_t dispatch thunk of CATAsyncPromise.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of CATAsyncPromiseReading.value.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 16) + **(int **)(a3 + 16));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_213BC61BC;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of CATAsyncPromiseReading.throwingValue.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 24) + **(int **)(a3 + 24));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_213BC54C4;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of CATAsyncPromiseWriting.isFulfilled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of CATAsyncPromiseWriting.fulfill(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_2677FC2A8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, &qword_2677FC2A8);
    }
  }
}

uint64_t sub_213BC5DA0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_213BC5E34;
  return sub_213BC5E34(1);
}

uint64_t sub_213BC5E34(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_213BC5F30(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_213BC5F44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC258);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_213BC5FAC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_213BC5FE4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 24);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_213BC61BC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2677FC2C0 + dword_2677FC2C0);
  return v6(a1, v4);
}

uint64_t sub_213BC60AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 96);
  swift_beginAccess();
  uint64_t v4 = sub_213BD6700();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_213BC6164()
{
  return (*(uint64_t (**)(void))(v0 + 24))();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t static CATAsyncStreamVendors.from<A>(_:)(uint64_t a1, uint64_t a2)
{
  return sub_213BC71BC(a1, a2);
}

ValueMetadata *type metadata accessor for CATAsyncStreamVendors()
{
  return &type metadata for CATAsyncStreamVendors;
}

uint64_t sub_213BC6224()
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();

  return swift_unknownObjectRelease();
}

uint64_t sub_213BC626C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t sub_213BC6274()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_213BC6304(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7
    && *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    uint64_t v8 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_213BC63BC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_213BC63E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_213BC6438(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_213BC6488(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_213BC64D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_213BC6528(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void sub_213BC6684(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x213BC689CLL);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t type metadata accessor for CATSendableBox()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t initializeBufferWithCopyOfBuffer for CATAnyTask(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_213BC6924(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_213BC6944(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 8) = v3;
  return result;
}

uint64_t type metadata accessor for CATWeakSendableBox()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_213BC6984(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_213BC69AC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_213BC54C4;
  return v6();
}

uint64_t (*sub_213BC6A78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  size_t v8 = (void *)swift_allocObject();
  v8[2] = a2;
  v8[3] = a3;
  v8[4] = a4;
  v8[5] = a1;
  BOOL v9 = (void *)swift_allocObject();
  v9[2] = a2;
  v9[3] = a3;
  v9[4] = a4;
  v9[5] = a1;
  swift_retain_n();
  return sub_213BC6B70;
}

uint64_t sub_213BC6B38()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_213BC6B70()
{
  return sub_213BD6550();
}

uint64_t sub_213BC6B7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a2;
  uint64_t v9 = sub_213BD6700();
  v4[3] = v9;
  v4[4] = *(void *)(v9 - 8);
  uint64_t v10 = swift_task_alloc();
  v4[5] = v10;
  int v11 = (void *)swift_task_alloc();
  v4[6] = v11;
  void *v11 = v4;
  v11[1] = sub_213BC6CA8;
  return MEMORY[0x270FA1FA8](v10, a1, a2, a3, a4);
}

uint64_t sub_213BC6CA8()
{
  swift_task_dealloc();
  if (v0)
  {

    unint64_t v1 = sub_213BC6E7C;
  }
  else
  {
    unint64_t v1 = sub_213BC6DC0;
  }
  return MEMORY[0x270FA2498](v1, 0, 0);
}

uint64_t sub_213BC6DC0()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v0[2] - 8) + 56))(v1, 0, 1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_213BC6E7C()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0[2] - 8) + 56))(v1, 1, 1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_213BC6F38()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_213BC61BC;
  return sub_213BC6B7C(v4, v2, v3, v5);
}

uint64_t destroy for CATAnyTask()
{
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for CATAnyTask(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for CATAnyTask(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for CATAnyTask(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CATAnyTask(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CATAnyTask(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CATAnyTask()
{
  return &type metadata for CATAnyTask;
}

uint64_t sub_213BC71BC(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t CATAsyncGeneratorBackedVendor.makeStream()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v2 = *v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC258);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v25 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(v2 + 80);
  uint64_t v6 = sub_213BD64C0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v24 - v8;
  uint64_t v10 = sub_213BD64F0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  unsigned int v14 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v24 - v15;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F8F580], v6);
  sub_213BD6490();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v17 = sub_213BD6480();
  uint64_t v18 = (uint64_t)v25;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v25, 1, 1, v17);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  unint64_t v19 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v20 = (char *)swift_allocObject();
  *((void *)v20 + 2) = 0;
  *((void *)v20 + 3) = 0;
  *((void *)v20 + 4) = v5;
  *((void *)v20 + 5) = v1;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v20[v19], v14, v10);
  swift_retain();
  uint64_t v21 = sub_213BC7FD4(v18, (uint64_t)&unk_2677FC2F0, (uint64_t)v20);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v5;
  *(void *)(v22 + 24) = v21;
  sub_213BD64B0();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

uint64_t sub_213BC7544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  uint64_t v6 = *(void *)(*(void *)a4 + 80);
  v5[4] = v6;
  v5[5] = *(void *)(v6 - 8);
  v5[6] = swift_task_alloc();
  uint64_t v7 = sub_213BD64A0();
  v5[7] = v7;
  v5[8] = *(void *)(v7 - 8);
  v5[9] = swift_task_alloc();
  sub_213BD6700();
  v5[10] = swift_task_alloc();
  uint64_t v8 = sub_213BD6520();
  v5[11] = v8;
  v5[12] = *(void *)(v8 - 8);
  v5[13] = swift_task_alloc();
  uint64_t v9 = sub_213BD6530();
  v5[14] = v9;
  v5[15] = *(void *)(v9 - 8);
  v5[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_213BC7764, 0, 0);
}

uint64_t sub_213BC7764()
{
  sub_213BD6570();
  v0[17] = 0;
  uint64_t v4 = (uint64_t (*)(uint64_t))(*(void *)(v0[2] + 16) + **(int **)(v0[2] + 16));
  uint64_t v1 = (void *)swift_task_alloc();
  v0[18] = v1;
  void *v1 = v0;
  v1[1] = sub_213BC78C8;
  uint64_t v2 = v0[16];
  return v4(v2);
}

uint64_t sub_213BC78C8()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_213BC79C4, 0, 0);
}

uint64_t sub_213BC79C4()
{
  uint64_t v1 = v0[17];
  sub_213BD6570();
  if (v1)
  {
    (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[14]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
  else
  {
    sub_213BD6500();
    uint64_t v4 = (void *)swift_task_alloc();
    v0[19] = v4;
    void *v4 = v0;
    v4[1] = sub_213BC7B18;
    uint64_t v5 = v0[10];
    uint64_t v6 = v0[11];
    return MEMORY[0x270FA1F68](v5, 0, 0, v6);
  }
}

uint64_t sub_213BC7B18()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_213BC7C14, 0, 0);
}

uint64_t sub_213BC7C14()
{
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[4];
  uint64_t v2 = v0[5];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3) == 1)
  {
    uint64_t v5 = v0[15];
    uint64_t v4 = v0[16];
    uint64_t v6 = v0[14];
    (*(void (**)(void, void))(v0[12] + 8))(v0[13], v0[11]);
    sub_213BD64F0();
    sub_213BD64E0();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
  else
  {
    uint64_t v10 = v0[8];
    uint64_t v9 = v0[9];
    uint64_t v11 = v0[7];
    (*(void (**)(void, uint64_t, uint64_t))(v2 + 32))(v0[6], v1, v3);
    sub_213BD64F0();
    sub_213BD64D0();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    uint64_t v12 = (void *)swift_task_alloc();
    v0[19] = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_213BC7B18;
    uint64_t v13 = v0[10];
    uint64_t v14 = v0[11];
    return MEMORY[0x270FA1F68](v13, 0, 0, v14);
  }
}

uint64_t sub_213BC7E24()
{
  uint64_t v1 = sub_213BD64F0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_213BC7EFC()
{
  uint64_t v2 = *(void *)(sub_213BD64F0() - 8);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_213BC54C4;
  return sub_213BC7544((uint64_t)v5, v6, v7, v3, v4);
}

uint64_t sub_213BC7FD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_213BD6480();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_213BD6470();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_213BC596C(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_213BD6420();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_213BC8154()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_213BC818C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC2F8);

  return sub_213BD6550();
}

uint64_t CATAsyncGeneratorBackedVendor.deinit()
{
  swift_release();
  return v0;
}

uint64_t CATAsyncGeneratorBackedVendor.__deallocating_deinit()
{
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_213BC823C@<X0>(uint64_t a1@<X8>)
{
  return CATAsyncGeneratorBackedVendor.makeStream()(a1);
}

uint64_t sub_213BC8260()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for CATAsyncGeneratorBackedVendor()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for CATAsyncGeneratorBackedVendor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CATAsyncGeneratorBackedVendor);
}

uint64_t sub_213BC82D8()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC8Catalyst12CATAsyncGate_continuation;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC300);
  sub_213BD64E0();
  uint64_t v4 = v1 + OBJC_IVAR____TtC8Catalyst12CATAsyncGate_stream;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC308);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  return swift_deallocClassInstance();
}

uint64_t sub_213BC83D8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC310);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC300);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC308);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = swift_allocObject();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F580], v0);
  sub_213BD6490();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v12 + OBJC_IVAR____TtC8Catalyst12CATAsyncGate_stream, v11, v8);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v12 + OBJC_IVAR____TtC8Catalyst12CATAsyncGate_continuation, v7, v4);
  return v12;
}

uint64_t sub_213BC8650()
{
  return sub_213BD64E0();
}

uint64_t sub_213BC8688()
{
  v1[2] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC308);
  v1[3] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[4] = v3;
  v1[5] = *(void *)(v3 + 64);
  v1[6] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC258);
  v1[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_213BC8784, 0, 0);
}

uint64_t sub_213BC8784()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[3];
  uint64_t v5 = v0[2] + OBJC_IVAR____TtC8Catalyst12CATAsyncGate_stream;
  uint64_t v6 = sub_213BD6480();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v1, 1, 1, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  *(void *)(v8 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v8 + v7, v2, v4);
  uint64_t v9 = sub_213BC9094(v1, (uint64_t)&unk_2677FC328, v8);
  v0[8] = v9;
  sub_213BC596C(v1);
  uint64_t v10 = (void *)swift_task_alloc();
  v0[9] = v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC330);
  *uint64_t v10 = v0;
  v10[1] = sub_213BC8938;
  return MEMORY[0x270FA1FD0](v0 + 10, v9, v11);
}

uint64_t sub_213BC8938()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_213BC8A50, 0, 0);
}

uint64_t sub_213BC8A50()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_213BC8AB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC308);
  v4[4] = v5;
  v4[5] = *(void *)(v5 - 8);
  v4[6] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC358);
  v4[7] = v6;
  v4[8] = *(void *)(v6 - 8);
  v4[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_213BC8BDC, 0, 0);
}

uint64_t sub_213BC8BDC()
{
  (*(void (**)(void, void, void))(v0[5] + 16))(v0[6], v0[3], v0[4]);
  sub_213BC9758(&qword_2677FC360, &qword_2677FC308);
  sub_213BD6580();
  uint64_t v1 = sub_213BC9758(&qword_2677FC368, &qword_2677FC358);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[10] = v2;
  void *v2 = v0;
  v2[1] = sub_213BC8D1C;
  uint64_t v3 = v0[7];
  return MEMORY[0x270FA1E80](v0 + 11, v3, v1);
}

uint64_t sub_213BC8D1C()
{
  uint64_t v2 = (void *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[9];
    uint64_t v4 = v2[7];
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v2[8] + 8);
    return v5(v3, v4);
  }
  else
  {
    return MEMORY[0x270FA2498](sub_213BC8E50, 0, 0);
  }
}

uint64_t sub_213BC8E50()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 88);
  (*(void (**)(void, void))(*(void *)(v0 + 64) + 8))(*(void *)(v0 + 72), *(void *)(v0 + 56));
  unsigned char *v1 = v2;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_213BC8EE8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC308);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_213BC8FB8(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2677FC308) - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_213BC54C4;
  return sub_213BC8AB8(a1, v6, v7, v5);
}

uint64_t sub_213BC9094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC258);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213BC5F44(a1, (uint64_t)v8);
  uint64_t v9 = sub_213BD6480();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_213BC596C((uint64_t)v8);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v11 = sub_213BD6420();
      uint64_t v13 = v12;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_213BD6470();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
  uint64_t v13 = 0;
LABEL_6:
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC330);
  if (v13 | v11)
  {
    v16[0] = 0;
    v16[1] = 0;
    v16[2] = v11;
    v16[3] = v13;
  }
  return swift_task_create();
}

uint64_t sub_213BC9280()
{
  return type metadata accessor for CATAsyncGate();
}

uint64_t type metadata accessor for CATAsyncGate()
{
  uint64_t result = qword_2677FCA30;
  if (!qword_2677FCA30) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_213BC92D4()
{
  sub_213BC93D8(319, &qword_2677FC338, MEMORY[0x263F8F5B8]);
  if (v0 <= 0x3F)
  {
    sub_213BC93D8(319, &qword_2677FC340, MEMORY[0x263F8F590]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_213BC93D8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, MEMORY[0x263F8EE60] + 8);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_213BC942C(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_213BC950C;
  return v5(v2 + 32);
}

uint64_t sub_213BC950C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  unsigned char *v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_213BC9620()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_213BC9658(uint64_t a1)
{
  unint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_213BC54C4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2677FC348 + dword_2677FC348);
  return v6(a1, v4);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_213BC9758(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

BOOL static CATAsyncStreamMulticaster.YieldResult.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CATAsyncStreamMulticaster.YieldResult.hash(into:)()
{
  return sub_213BD67D0();
}

uint64_t CATAsyncStreamMulticaster.YieldResult.hashValue.getter()
{
  return sub_213BD67E0();
}

uint64_t sub_213BC9830()
{
  return sub_213BD67E0();
}

unint64_t sub_213BC986C()
{
  unint64_t result = qword_2677FC370;
  if (!qword_2677FC370)
  {
    sub_213BD6300();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677FC370);
  }
  return result;
}

uint64_t CATAsyncStreamMulticaster.deinit()
{
  sub_213BC9908();
  swift_bridgeObjectRelease();
  swift_release();

  sub_213BC9DC0(*(void *)(v0 + 72));
  sub_213BC9DC0(*(void *)(v0 + 88));
  return v0;
}

uint64_t sub_213BC9908()
{
  uint64_t v1 = sub_213BD64F0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  unint64_t v4 = (char *)&v28 - v3;
  uint64_t v5 = sub_213BD6300();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v39 = sub_213BD6700();
  uint64_t v7 = *(void *)(v39 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v39);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v28 - v11;
  swift_beginAccess();
  uint64_t v13 = *(void *)(v0 + 32);
  uint64_t v14 = *(void *)(v13 + 64);
  uint64_t v30 = v13 + 64;
  uint64_t v15 = 1 << *(unsigned char *)(v13 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & v14;
  uint64_t v40 = v5 - 8;
  uint64_t v32 = v2 + 16;
  uint64_t v33 = v2;
  long long v37 = (void (**)(char *, char *, uint64_t))(v7 + 32);
  uint64_t v38 = TupleTypeMetadata2 - 8;
  long long v35 = (void (**)(char *, uint64_t))(v2 + 8);
  long long v36 = (void (**)(char *, char *, uint64_t))(v2 + 32);
  int64_t v31 = (unint64_t)(v15 + 63) >> 6;
  int64_t v29 = v31 - 1;
  uint64_t v34 = v13;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v19 = 0;
  if (!v17) {
    goto LABEL_9;
  }
LABEL_4:
  unint64_t v20 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  int64_t v21 = v19;
  unint64_t v22 = v20 | (v19 << 6);
LABEL_5:
  uint64_t v23 = v34;
  (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(v10, *(void *)(v34 + 48) + *(void *)(*(void *)(v5 - 8) + 72) * v22, v5);
  (*(void (**)(char *, unint64_t, uint64_t))(v33 + 16))(&v10[*(int *)(TupleTypeMetadata2 + 48)], *(void *)(v23 + 56) + *(void *)(v33 + 72) * v22, v1);
  uint64_t v24 = 0;
LABEL_6:
  int64_t v19 = v21;
  while (1)
  {
LABEL_7:
    uint64_t v25 = *(void *)(TupleTypeMetadata2 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56))(v10, v24, 1, TupleTypeMetadata2);
    (*v37)(v12, v10, v39);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v12, 1, TupleTypeMetadata2) == 1) {
      return swift_release();
    }
    (*v36)(v4, &v12[*(int *)(TupleTypeMetadata2 + 48)], v1);
    sub_213BD64E0();
    (*v35)(v4, v1);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v12, v5);
    if (v17) {
      goto LABEL_4;
    }
LABEL_9:
    int64_t v21 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 < v31)
    {
      unint64_t v26 = *(void *)(v30 + 8 * v21);
      if (v26) {
        goto LABEL_12;
      }
      v19 += 2;
      if (v21 + 1 >= v31)
      {
        unint64_t v17 = 0;
        uint64_t v24 = 1;
        goto LABEL_6;
      }
      unint64_t v26 = *(void *)(v30 + 8 * v19);
      if (v26)
      {
        ++v21;
LABEL_12:
        unint64_t v17 = (v26 - 1) & v26;
        unint64_t v22 = __clz(__rbit64(v26)) + (v21 << 6);
        goto LABEL_5;
      }
      int64_t v27 = v21 + 2;
      if (v21 + 2 < v31) {
        break;
      }
    }
    unint64_t v17 = 0;
    uint64_t v24 = 1;
  }
  unint64_t v26 = *(void *)(v30 + 8 * v27);
  if (v26)
  {
    v21 += 2;
    goto LABEL_12;
  }
  while (1)
  {
    int64_t v21 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v21 >= v31)
    {
      unint64_t v17 = 0;
      uint64_t v24 = 1;
      int64_t v19 = v29;
      goto LABEL_7;
    }
    unint64_t v26 = *(void *)(v30 + 8 * v21);
    ++v27;
    if (v26) {
      goto LABEL_12;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_213BC9DC0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t CATAsyncStreamMulticaster.__deallocating_deinit()
{
  CATAsyncStreamMulticaster.deinit();

  return swift_deallocClassInstance();
}

void sub_213BC9E04(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t CATAsyncStreamMulticaster.__allocating_init(bufferingPolicy:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  CATAsyncStreamMulticaster.init(bufferingPolicy:)(a1);
  return v2;
}

uint64_t CATAsyncStreamMulticaster.init(bufferingPolicy:)(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  int v3 = *(unsigned __int8 *)(a1 + 8);
  sub_213BD6300();
  sub_213BD64F0();
  sub_213BC986C();
  *(void *)(v1 + 32) = sub_213BD6310();
  *(unsigned char *)(v1 + 48) = 0;
  *(void *)(v1 + 56) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08AE0]), sel_init);
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 80) = 0u;
  *(void *)(v1 + 96) = 0;
  *(void *)(v1 + 16) = v2;
  *(unsigned char *)(v1 + 24) = v3;
  type metadata accessor for CATQueue();
  if (v3) {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v4 = v2;
  }
  *(void *)(v1 + 40) = sub_213BCFA4C(v4);
  return v1;
}

uint64_t type metadata accessor for CATAsyncStreamMulticaster.BufferingPolicy()
{
  return __swift_instantiateGenericMetadata();
}

id CATAsyncStreamMulticaster.makeStream()@<X0>(uint64_t a1@<X8>)
{
  int v3 = *(void **)(v1 + 56);
  sub_213BCAB74();
  sub_213BD6530();
  objc_msgSend(v3, sel_lock);
  sub_213BCA5E4(a1);

  return objc_msgSend(v3, sel_unlock);
}

uint64_t sub_213BC9FE0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v45 = a2;
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(*a1 + 80);
  uint64_t v5 = sub_213BD64F0();
  uint64_t v6 = sub_213BD6700();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v40 = (char *)v36 - v7;
  uint64_t v8 = sub_213BD6300();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v41 = v11;
  v42 = (char *)v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v46 = (char *)v36 - v12;
  uint64_t v13 = sub_213BD64C0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  unint64_t v17 = (void *)((char *)v36 - v16);
  uint64_t v44 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v15);
  int64_t v19 = (char *)v36 - v18;
  LOBYTE(v18) = *((unsigned char *)a1 + 24);
  uint64_t v43 = v3;
  uint64_t v20 = v5;
  if (v18)
  {
    int64_t v21 = (unsigned int *)MEMORY[0x263F8F580];
  }
  else
  {
    void *v17 = a1[2];
    int64_t v21 = (unsigned int *)MEMORY[0x263F8F570];
  }
  (*(void (**)(void *, void, uint64_t))(v14 + 104))(v17, *v21, v13);
  uint64_t v39 = v4;
  sub_213BD6490();
  (*(void (**)(void *, uint64_t))(v14 + 8))(v17, v13);
  unint64_t v22 = v46;
  sub_213BD62F0();
  uint64_t v45 = v9;
  long long v37 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  uint64_t v23 = v42;
  v37(v42, v22, v8);
  uint64_t v24 = v44;
  uint64_t v25 = v40;
  uint64_t v26 = v20;
  (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v40, v19, v20);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v25, 0, 1, v20);
  v36[1] = a1 + 4;
  swift_beginAccess();
  unint64_t v38 = sub_213BC986C();
  sub_213BD6370();
  sub_213BD6390();
  swift_endAccess();
  sub_213BCA610((uint64_t)v19);
  swift_retain();
  sub_213BC6224();
  uint64_t v27 = type metadata accessor for CATWeakSendableBox();
  uint64_t v28 = *(void *)(v27 - 8);
  (*(void (**)(unsigned char *, char *, uint64_t))(v28 + 16))(v49, v47, v27);
  v37(v23, v22, v8);
  uint64_t v29 = v45;
  unint64_t v30 = (*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v39;
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v28 + 32))(v31 + 24, v49, v27);
  (*(void (**)(unint64_t, char *, uint64_t))(v29 + 32))(v31 + v30, v23, v8);
  sub_213BD64B0();
  swift_beginAccess();
  sub_213BD64F0();
  swift_bridgeObjectRetain();
  uint64_t v32 = sub_213BD6340();
  swift_bridgeObjectRelease();
  if (v32 == 1)
  {
    uint64_t v33 = (void (*)(void *))a1[9];
    if (v33)
    {
      uint64_t v34 = a1[8];
      v48[0] = a1;
      v48[1] = v34;
      swift_retain();
      sub_213BCBA24((uint64_t)v33);
      v33(v48);
      sub_213BC9DC0((uint64_t)v33);
      swift_release();
    }
  }
  if (*((unsigned char *)a1 + 48) == 1) {
    sub_213BD64E0();
  }
  (*(void (**)(char *, uint64_t))(v28 + 8))(v47, v27);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v46, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v19, v26);
}

uint64_t sub_213BCA5E4@<X0>(uint64_t a1@<X8>)
{
  return sub_213BC9FE0(v1, a1);
}

uint64_t sub_213BCA610(uint64_t a1)
{
  uint64_t v3 = *(void *)(*v1 + 80);
  uint64_t v4 = sub_213BD64A0();
  uint64_t v25 = *(void *)(v4 - 8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)&v25 - v6;
  uint64_t v8 = *(void *)(v3 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v5);
  uint64_t v28 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v27 = (char *)&v25 - v11;
  v29[0] = v1[5];
  uint64_t v12 = v29[0];
  type metadata accessor for CATQueue();
  swift_retain();
  swift_getWitnessTable();
  sub_213BD6640();
  uint64_t v13 = v31;
  uint64_t v30 = v31;
  uint64_t v31 = v12;
  sub_213BD6650();
  if (v13 != v29[0])
  {
    uint64_t v26 = (void (**)(char *))(v8 + 16);
    uint64_t v14 = (void (**)(char *, char *, uint64_t))(v8 + 32);
    uint64_t v15 = (void (**)(char *, uint64_t))(v25 + 8);
    do
    {
      uint64_t v16 = (void (*)(uint64_t *, void))sub_213BD66E0();
      unint64_t v17 = v27;
      (*v26)(v27);
      v16(v29, 0);
      v29[0] = v31;
      sub_213BD6660();
      (*v14)(v28, v17, v3);
      sub_213BD64F0();
      sub_213BD64D0();
      (*v15)(v7, v4);
      uint64_t v18 = v3;
      int64_t v19 = v7;
      uint64_t v20 = v4;
      uint64_t v21 = a1;
      uint64_t v22 = v30;
      sub_213BD6650();
      BOOL v23 = v22 == v29[0];
      a1 = v21;
      uint64_t v4 = v20;
      uint64_t v7 = v19;
      uint64_t v3 = v18;
    }
    while (!v23);
  }
  return swift_release();
}

uint64_t sub_213BCA918(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_213BD64F0();
  uint64_t v5 = sub_213BD6700();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v17 - v6;
  uint64_t v8 = sub_213BD6300();
  MEMORY[0x270FA5388](v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v7, 1, 1, v4);
  swift_beginAccess();
  unint64_t v11 = sub_213BC986C();
  sub_213BD6370();
  sub_213BD6390();
  swift_endAccess();
  swift_beginAccess();
  uint64_t v12 = sub_213BD64F0();
  uint64_t v13 = swift_bridgeObjectRetain();
  LOBYTE(v12) = MEMORY[0x2166926B0](v13, v8, v12, v11);
  uint64_t result = swift_bridgeObjectRelease();
  if (v12)
  {
    ++*(void *)(a1 + 64);
    uint64_t v15 = *(void (**)(uint64_t))(a1 + 88);
    if (v15)
    {
      uint64_t v16 = swift_retain();
      v15(v16);
      return sub_213BC9DC0((uint64_t)v15);
    }
  }
  return result;
}

unint64_t sub_213BCAB74()
{
  unint64_t result = qword_2677FC378;
  if (!qword_2677FC378)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2677FC378);
  }
  return result;
}

id CATAsyncStreamMulticaster.yield(_:)@<X0>(char *a1@<X8>)
{
  return sub_213BCABC0(a1);
}

id sub_213BCABC0@<X0>(char *a1@<X8>)
{
  uint64_t v3 = *(void **)(v1 + 56);
  sub_213BCAB74();
  objc_msgSend(v3, sel_lock);
  sub_213BCC044(a1);
  return objc_msgSend(v3, sel_unlock);
}

Swift::Void __swiftcall CATAsyncStreamMulticaster.clearBuffer()()
{
  uint64_t v1 = *(void **)(v0 + 56);
  (*(void (**)(id))(**(void **)(v0 + 40) + 232))(objc_msgSend(v1, sel_lock));

  objc_msgSend(v1, sel_unlock);
}

Swift::Void __swiftcall CATAsyncStreamMulticaster.finish()()
{
  uint64_t v1 = *(void **)(v0 + 56);
  objc_msgSend(v1, sel_lock);
  if ((*(unsigned char *)(v0 + 48) & 1) == 0)
  {
    *(unsigned char *)(v0 + 48) = 1;
    uint64_t v2 = *(void *)(v0 + 88);
    *(void *)(v0 + 88) = 0;
    *(void *)(v0 + 96) = 0;
    sub_213BC9DC0(v2);
    uint64_t v3 = *(void *)(v0 + 72);
    *(void *)(v0 + 72) = 0;
    *(void *)(v0 + 80) = 0;
    sub_213BC9DC0(v3);
    sub_213BC9908();
  }

  objc_msgSend(v1, sel_unlock);
}

uint64_t (*CATAsyncStreamMulticaster.subscriberSessionDidBegin.getter())()
{
  uint64_t v1 = *v0;
  uint64_t v2 = (void *)v0[7];
  sub_213BCAB74();
  uint64_t v3 = *(void *)(v1 + 80);
  type metadata accessor for CATAsyncStreamMulticaster.SubscriberSessionContinuation();
  swift_getFunctionTypeMetadata1();
  sub_213BD6700();
  objc_msgSend(v2, sel_lock);
  sub_213BCAF9C(v8);
  objc_msgSend(v2, sel_unlock);
  uint64_t v4 = v8[0];
  if (!v8[0]) {
    return 0;
  }
  uint64_t v5 = v8[1];
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = v3;
  v6[3] = v4;
  v6[4] = v5;
  return sub_213BCB0A0;
}

void *sub_213BCAE24@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t (**a3)()@<X8>)
{
  uint64_t v4 = *(void *)(a2 + a1 - 8);
  unint64_t result = CATAsyncStreamMulticaster.subscriberSessionDidBegin.getter();
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = v6;
    unint64_t result = (void *)swift_allocObject();
    result[2] = v4;
    result[3] = v7;
    result[4] = v8;
    uint64_t v9 = sub_213BCC01C;
  }
  else
  {
    uint64_t v9 = 0;
  }
  *a3 = v9;
  a3[1] = (uint64_t (*)())result;
  return result;
}

uint64_t sub_213BCAEA0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  if (*a1)
  {
    uint64_t v6 = *(void *)(a4 + a3 - 8);
    uint64_t v7 = (void *)swift_allocObject();
    v7[2] = v6;
    v7[3] = v4;
    v7[4] = v5;
    uint64_t v8 = sub_213BCC250;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
  }
  sub_213BCBA24(v4);
  sub_213BCB998((uint64_t)v8, (uint64_t)v7);

  return sub_213BC9DC0((uint64_t)v8);
}

uint64_t CATAsyncStreamMulticaster.subscriberSessionDidBegin.setter(uint64_t a1, uint64_t a2)
{
  sub_213BCB998(a1, a2);

  return sub_213BC9DC0(a1);
}

uint64_t sub_213BCAF9C@<X0>(uint64_t (**a1)()@<X8>)
{
  uint64_t v3 = v1[9];
  uint64_t v4 = v1[10];
  if (v3)
  {
    uint64_t v5 = *v1;
    uint64_t v6 = (uint64_t (*)())swift_allocObject();
    *((void *)v6 + 2) = *(void *)(v5 + 80);
    *((void *)v6 + 3) = v3;
    *((void *)v6 + 4) = v4;
    uint64_t v7 = sub_213BCC248;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a1 = v7;
  a1[1] = v6;
  return sub_213BCBA24(v3);
}

uint64_t type metadata accessor for CATAsyncStreamMulticaster.SubscriberSessionContinuation()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_213BCB068()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_213BCB0A0()
{
  return (*(uint64_t (**)(void))(v0 + 24))();
}

uint64_t (*CATAsyncStreamMulticaster.subscriberSessionDidBegin.modify(uint64_t (**a1)()))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  *a1 = CATAsyncStreamMulticaster.subscriberSessionDidBegin.getter();
  a1[1] = v3;
  return sub_213BCB110;
}

uint64_t sub_213BCB110(uint64_t *a1, char a2)
{
  return sub_213BCB418(a1, a2, (void (*)(uint64_t, uint64_t))sub_213BCB998, (void (*)(uint64_t, uint64_t))sub_213BCBA24, (void (*)(uint64_t, uint64_t))sub_213BC9DC0);
}

uint64_t (*CATAsyncStreamMulticaster.subscriberSessionDidEnd.getter())()
{
  uint64_t v1 = (void *)v0[7];
  objc_msgSend(v1, sel_lock);
  uint64_t v3 = v0[11];
  uint64_t v2 = v0[12];
  if (v3)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v3;
    *(void *)(v4 + 24) = v2;
    uint64_t v5 = sub_213BCC254;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v4 = 0;
  }
  sub_213BCBA24(v3);
  objc_msgSend(v1, sel_unlock);
  if (!v3) {
    return 0;
  }
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = v4;
  return sub_213BCBA34;
}

uint64_t sub_213BCB230@<X0>(uint64_t (**a1)()@<X8>)
{
  uint64_t result = (uint64_t)CATAsyncStreamMulticaster.subscriberSessionDidEnd.getter();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = v3;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v4;
    *(void *)(result + 24) = v5;
    uint64_t v6 = sub_213BCBFF4;
  }
  else
  {
    uint64_t v6 = 0;
  }
  *a1 = v6;
  a1[1] = (uint64_t (*)())result;
  return result;
}

uint64_t sub_213BCB2A0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    uint64_t v4 = sub_213BCC220;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  sub_213BCBA24(v1);
  sub_213BCBA5C((uint64_t)v4, v3);

  return sub_213BC9DC0((uint64_t)v4);
}

uint64_t CATAsyncStreamMulticaster.subscriberSessionDidEnd.setter(uint64_t a1, uint64_t a2)
{
  sub_213BCBA5C(a1, a2);

  return sub_213BC9DC0(a1);
}

uint64_t (*CATAsyncStreamMulticaster.subscriberSessionDidEnd.modify(uint64_t (**a1)()))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  *a1 = CATAsyncStreamMulticaster.subscriberSessionDidEnd.getter();
  a1[1] = v3;
  return sub_213BCB3D8;
}

uint64_t sub_213BCB3D8(uint64_t *a1, char a2)
{
  return sub_213BCB418(a1, a2, (void (*)(uint64_t, uint64_t))sub_213BCBA5C, (void (*)(uint64_t, uint64_t))sub_213BCC228, (void (*)(uint64_t, uint64_t))sub_213BCC224);
}

uint64_t sub_213BCB418(uint64_t *a1, char a2, void (*a3)(uint64_t, uint64_t), void (*a4)(uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t))
{
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  uint64_t v8 = *a1;
  if (a2)
  {
    a4(v8, v7);
    a3(v6, v7);
    a5(v6, v7);
  }
  else
  {
    a3(v8, v7);
  }

  return ((uint64_t (*)(uint64_t, uint64_t))a5)(v6, v7);
}

uint64_t sub_213BCB4BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v48 = a4;
  LODWORD(v46) = a3;
  uint64_t v44 = a2;
  uint64_t v7 = *(void *)(*(void *)a1 + 80);
  uint64_t v41 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v36 - v8;
  uint64_t v10 = sub_213BD64A0();
  uint64_t v38 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v36 - v11;
  uint64_t v13 = sub_213BD64F0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v36 - v19;
  if (*(unsigned char *)(a1 + 48))
  {
    char v21 = 2;
LABEL_27:
    *a5 = v21;
    return result;
  }
  uint64_t result = v48;
  uint64_t v45 = v10;
  v47 = v9;
  if ((v46 & 1) == 0 && *(void *)(a1 + 64) != v44)
  {
    char v21 = 1;
    goto LABEL_27;
  }
  uint64_t v44 = v7;
  long long v37 = a5;
  (*(void (**)(uint64_t))(**(void **)(a1 + 40) + 200))(v48);
  swift_beginAccess();
  uint64_t v22 = *(void *)(a1 + 32);
  sub_213BD6300();
  sub_213BC986C();
  uint64_t v23 = *(void *)(v22 + 64);
  uint64_t v39 = v22 + 64;
  uint64_t v24 = 1 << *(unsigned char *)(v22 + 32);
  uint64_t v25 = -1;
  if (v24 < 64) {
    uint64_t v25 = ~(-1 << v24);
  }
  unint64_t v26 = v25 & v23;
  uint64_t v42 = v14 + 32;
  uint64_t v43 = v14 + 16;
  uint64_t v27 = (void (**)(char *, uint64_t, uint64_t))(v41 + 16);
  uint64_t v28 = (void (**)(char *, uint64_t))(v38 + 8);
  int64_t v40 = (unint64_t)(v24 + 63) >> 6;
  uint64_t v41 = v14 + 8;
  uint64_t v46 = v22;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v29 = 0;
  while (1)
  {
    if (v26)
    {
      unint64_t v30 = __clz(__rbit64(v26));
      v26 &= v26 - 1;
      unint64_t v31 = v30 | (v29 << 6);
      uint64_t v32 = v47;
      goto LABEL_9;
    }
    int64_t v33 = v29 + 1;
    uint64_t v32 = v47;
    if (__OFADD__(v29, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v33 >= v40) {
      goto LABEL_25;
    }
    unint64_t v34 = *(void *)(v39 + 8 * v33);
    ++v29;
    if (!v34)
    {
      int64_t v29 = v33 + 1;
      if (v33 + 1 >= v40) {
        goto LABEL_25;
      }
      unint64_t v34 = *(void *)(v39 + 8 * v29);
      if (!v34)
      {
        int64_t v29 = v33 + 2;
        if (v33 + 2 >= v40) {
          goto LABEL_25;
        }
        unint64_t v34 = *(void *)(v39 + 8 * v29);
        if (!v34) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v26 = (v34 - 1) & v34;
    unint64_t v31 = __clz(__rbit64(v34)) + (v29 << 6);
LABEL_9:
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v20, *(void *)(v46 + 56) + *(void *)(v14 + 72) * v31, v13);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v17, v20, v13);
    (*v27)(v32, v48, v44);
    sub_213BD64D0();
    (*v28)(v12, v45);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  }
  int64_t v35 = v33 + 3;
  if (v35 >= v40)
  {
LABEL_25:
    uint64_t result = swift_release();
    char v21 = 0;
    a5 = v37;
    goto LABEL_27;
  }
  unint64_t v34 = *(void *)(v39 + 8 * v35);
  if (v34)
  {
    int64_t v29 = v35;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v29 = v35 + 1;
    if (__OFADD__(v35, 1)) {
      break;
    }
    if (v29 >= v40) {
      goto LABEL_25;
    }
    unint64_t v34 = *(void *)(v39 + 8 * v29);
    ++v35;
    if (v34) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

id CATAsyncStreamMulticaster.SubscriberSessionContinuation.yield(_:)@<X0>(char *a1@<X8>)
{
  return sub_213BCABC0(a1);
}

id sub_213BCB974@<X0>(uint64_t a1@<X8>)
{
  return CATAsyncStreamMulticaster.makeStream()(a1);
}

id sub_213BCB998(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void **)(v2 + 56);
  objc_msgSend(v5, sel_lock);
  if ((*(unsigned char *)(v2 + 48) & 1) == 0)
  {
    uint64_t v6 = *(void *)(v2 + 72);
    *(void *)(v2 + 72) = a1;
    *(void *)(v2 + 80) = a2;
    sub_213BCBA24(a1);
    sub_213BC9DC0(v6);
  }

  return objc_msgSend(v5, sel_unlock);
}

uint64_t sub_213BCBA24(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_213BCBA34()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

id sub_213BCBA5C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void **)(v2 + 56);
  objc_msgSend(v5, sel_lock);
  if ((*(unsigned char *)(v2 + 48) & 1) == 0)
  {
    uint64_t v6 = *(void *)(v2 + 88);
    *(void *)(v2 + 88) = a1;
    *(void *)(v2 + 96) = a2;
    sub_213BCBA24(a1);
    sub_213BC9DC0(v6);
  }

  return objc_msgSend(v5, sel_unlock);
}

uint64_t sub_213BCBAE8()
{
  return swift_getWitnessTable();
}

uint64_t sub_213BCBB04()
{
  return 8;
}

void *sub_213BCBB10(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_213BCBB1C()
{
  return 8;
}

uint64_t sub_213BCBB28()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for CATAsyncStreamMulticaster()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for CATAsyncStreamMulticaster(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CATAsyncStreamMulticaster);
}

uint64_t dispatch thunk of CATAsyncStreamMulticaster.__allocating_init(bufferingPolicy:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t sub_213BCBBFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 8);
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t sub_213BCBC1C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_213BCBC3C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_213BCBC6C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_213BCBC8C(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_213BCBCB8(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *sub_213BCBD48(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x213BCBE14);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_213BCBE3C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_213BCBE44(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

uint64_t type metadata accessor for CATAsyncStreamMulticaster.YieldResult()
{
  return __swift_instantiateGenericMetadata();
}

void *sub_213BCBE64(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_213BCBE94()
{
  return swift_release();
}

void *sub_213BCBE9C(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *sub_213BCBEF8(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  return a1;
}

uint64_t sub_213BCBF38(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_213BCBF80(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_213BCBFBC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_213BCBFF4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_213BCC01C()
{
  return (*(uint64_t (**)(void))(v0 + 24))();
}

uint64_t sub_213BCC044@<X0>(char *a1@<X8>)
{
  return sub_213BCB4BC(*(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(void *)(v1 + 40), a1);
}

uint64_t sub_213BCC078()
{
  uint64_t v1 = sub_213BD6300();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_weakDestroy();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_213BCC144()
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(sub_213BD6300() - 8) + 80);
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = Strong;
    id v4 = *(id *)(Strong + 56);
    objc_msgSend(v4, sel_lock);
    sub_213BCA918(v3, v0 + ((v1 + 32) & ~v1));
    objc_msgSend(v4, sel_unlock);
    swift_release();
  }
}

uint64_t static Task<>.cat_withTimeout<A, B>(duration:clock:body:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[9] = a7;
  v8[10] = a8;
  v8[7] = a5;
  v8[8] = a6;
  v8[5] = a3;
  v8[6] = a4;
  v8[3] = a1;
  v8[4] = a2;
  sub_213BD6700();
  v8[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2677FC2F8);
  uint64_t v9 = sub_213BD6610();
  v8[12] = v9;
  v8[13] = *(void *)(v9 - 8);
  v8[14] = swift_task_alloc();
  sub_213BD65B0();
  v8[15] = swift_task_alloc();
  uint64_t v10 = sub_213BD6620();
  v8[16] = v10;
  v8[17] = *(void *)(v10 - 8);
  v8[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_213BCC424, 0, 0);
}

uint64_t sub_213BCC424()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 48);
  long long v5 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 64);
  *(void *)(v3 + 32) = v2;
  *(_OWORD *)(v3 + 40) = v4;
  *(_OWORD *)(v3 + 56) = v5;
  sub_213BCE4C0(v1);
  sub_213BD6630();
  swift_task_dealloc();
  sub_213BD6500();
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v6;
  void *v6 = v0;
  v6[1] = sub_213BCC56C;
  uint64_t v7 = *(void *)(v0 + 88);
  uint64_t v8 = *(void *)(v0 + 96);
  return MEMORY[0x270FA20F8](v7, 0, 0, v8, v0 + 16);
}

uint64_t sub_213BCC56C()
{
  swift_task_dealloc();
  if (v0) {
    uint64_t v1 = sub_213BCC82C;
  }
  else {
    uint64_t v1 = sub_213BCC67C;
  }
  return MEMORY[0x270FA2498](v1, 0, 0);
}

uint64_t sub_213BCC67C()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[8];
  (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
  uint64_t v3 = *(void *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1) {
    return sub_213BD6740();
  }
  uint64_t v5 = v0[11];
  uint64_t v6 = v0[8];
  uint64_t v7 = v0[3];
  (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v7, v5, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_213BCC82C()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[16];
  (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_213BCC8F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v43 = a8;
  uint64_t v44 = a2;
  uint64_t v38 = a6;
  uint64_t v39 = a1;
  uint64_t v40 = a4;
  uint64_t v41 = a5;
  uint64_t v45 = a3;
  uint64_t v37 = a7;
  uint64_t v8 = *(void *)(a7 - 8);
  uint64_t v42 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v46 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v34 = AssociatedTypeWitness;
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v14 = (char *)&v33 - v13;
  int64_t v35 = (char *)&v33 - v13;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2677FC2F8);
  uint64_t v15 = sub_213BD65E0();
  uint64_t v33 = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v33 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC258);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = v22;
  uint64_t v23 = sub_213BD6480();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 1, 1, v23);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v19, v39, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v40, AssociatedTypeWitness);
  uint64_t v24 = v8;
  uint64_t v25 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v46, v41, v37);
  unint64_t v26 = (*(unsigned __int8 *)(v16 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v27 = (v17 + *(unsigned __int8 *)(v11 + 80) + v26) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v28 = (v12 + *(unsigned __int8 *)(v8 + 80) + v27) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  int64_t v29 = (char *)swift_allocObject();
  *((void *)v29 + 2) = 0;
  *((void *)v29 + 3) = 0;
  *((void *)v29 + 4) = v38;
  *((void *)v29 + 5) = v25;
  uint64_t v30 = v44;
  uint64_t v31 = v45;
  *((void *)v29 + 6) = v43;
  *((void *)v29 + 7) = v30;
  *((void *)v29 + 8) = v31;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(&v29[v26], v19, v33);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v29[v27], v35, v34);
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(&v29[v28], v46, v25);
  swift_retain();
  sub_213BCE31C((uint64_t)v36, (uint64_t)&unk_2677FC398, (uint64_t)v29);
  return swift_release();
}

uint64_t sub_213BCCCD0(uint64_t a1)
{
  return sub_213BCC8F4(a1, v1[5], v1[6], v1[7], v1[8], v1[2], v1[3], v1[4]);
}

uint64_t sub_213BCCCE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 80) = v11;
  *(_OWORD *)(v8 + 64) = v10;
  *(void *)(v8 + 48) = a7;
  *(void *)(v8 + 56) = a8;
  *(void *)(v8 + 32) = a5;
  *(void *)(v8 + 40) = a6;
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a4;
  return MEMORY[0x270FA2498](sub_213BCCD20, 0, 0);
}

uint64_t sub_213BCCD20()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  long long v4 = *(_OWORD *)(v0 + 24);
  long long v5 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 64);
  *(void *)(v3 + 32) = v1;
  *(_OWORD *)(v3 + 40) = v4;
  *(_OWORD *)(v3 + 56) = v5;
  *(void *)(v3 + 72) = v2;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v6;
  void *v6 = v0;
  v6[1] = sub_213BCCE34;
  uint64_t v7 = *(void *)(v0 + 16);
  uint64_t v8 = MEMORY[0x263F8EE60] + 8;
  uint64_t v9 = MEMORY[0x263F8EE60] + 8;
  uint64_t v10 = MEMORY[0x263F8EE60] + 8;
  return MEMORY[0x270FA2158](v7, v8, v9, 0, 0, &unk_2677FC3B8, v3, v10);
}

uint64_t sub_213BCCE34()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_213BCCF44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[9] = v16;
  v8[10] = v17;
  v8[7] = a7;
  v8[8] = a8;
  v8[5] = a5;
  v8[6] = a6;
  v8[3] = a3;
  v8[4] = a4;
  v8[2] = a2;
  uint64_t v9 = *(void *)(v16 - 8);
  v8[11] = v9;
  v8[12] = *(void *)(v9 + 64);
  v8[13] = swift_task_alloc();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8[14] = AssociatedTypeWitness;
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  v8[15] = v11;
  v8[16] = *(void *)(v11 + 64);
  v8[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2677FC2F8);
  uint64_t v12 = sub_213BD65E0();
  v8[18] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v8[19] = v13;
  v8[20] = *(void *)(v13 + 64);
  v8[21] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC258);
  v8[22] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_213BCD150, 0, 0);
}

uint64_t sub_213BCD150()
{
  uint64_t v2 = v0[21];
  uint64_t v1 = v0[22];
  uint64_t v32 = v1;
  uint64_t v3 = v0[19];
  uint64_t v4 = v0[18];
  uint64_t v31 = v4;
  uint64_t v26 = v0[17];
  uint64_t v30 = v0[16];
  uint64_t v23 = v0[15];
  uint64_t v24 = v0[14];
  uint64_t v35 = v0[13];
  uint64_t v29 = v0[12];
  uint64_t v36 = v0[10];
  uint64_t v5 = v0[8];
  uint64_t v33 = v0[11];
  uint64_t v34 = v0[9];
  uint64_t v25 = v0[7];
  uint64_t v6 = v0[5];
  uint64_t v22 = v0[6];
  uint64_t v21 = v6;
  uint64_t v19 = v0[4];
  uint64_t v27 = v0[3];
  uint64_t v7 = sub_213BD6480();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  v8(v1, 1, 1, v7);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v20(v2, v6, v4);
  uint64_t v9 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v10 = v3;
  uint64_t v11 = (char *)swift_allocObject();
  *((void *)v11 + 2) = 0;
  *((void *)v11 + 3) = 0;
  *((void *)v11 + 4) = v5;
  *((void *)v11 + 5) = v34;
  *((void *)v11 + 6) = v36;
  *((void *)v11 + 7) = v27;
  *((void *)v11 + 8) = v19;
  unint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 32);
  v28(&v11[(v9 + 72) & ~v9], v2, v31);
  swift_retain();
  sub_213BCDB98(v1, (uint64_t)&unk_2677FC3C8, (uint64_t)v11);
  sub_213BC596C(v1);
  v8(v1, 1, 1, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v26, v22, v24);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16))(v35, v25, v34);
  v20(v2, v21, v31);
  unint64_t v12 = (*(unsigned __int8 *)(v23 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  unint64_t v13 = (v30 + *(unsigned __int8 *)(v33 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  unint64_t v14 = (v29 + v9 + v13) & ~v9;
  uint64_t v15 = (char *)swift_allocObject();
  *((void *)v15 + 2) = 0;
  *((void *)v15 + 3) = 0;
  *((void *)v15 + 4) = v5;
  *((void *)v15 + 5) = v34;
  *((void *)v15 + 6) = v36;
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 32))(&v15[v12], v26, v24);
  (*(void (**)(char *, uint64_t, uint64_t))(v33 + 32))(&v15[v13], v35, v34);
  v28(&v15[v14], v2, v31);
  sub_213BCDB98(v32, (uint64_t)&unk_2677FC3D8, (uint64_t)v15);
  sub_213BC596C(v32);
  uint64_t v16 = (void *)swift_task_alloc();
  v0[23] = v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC3E0);
  *uint64_t v16 = v0;
  v16[1] = sub_213BCD540;
  return MEMORY[0x270FA1E58](v0 + 24, 0, 0, v17);
}

uint64_t sub_213BCD540()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_213BCD63C, 0, 0);
}

uint64_t sub_213BCD63C()
{
  sub_213BD6450();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_213BCD6E0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[4] = a6;
  v7[5] = a7;
  v7[6] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2677FC2F8);
  uint64_t v10 = sub_213BD65A0();
  v7[7] = v10;
  v7[8] = *(void *)(v10 - 8);
  v7[9] = swift_task_alloc();
  v7[10] = *(void *)(a7 - 8);
  v7[11] = swift_task_alloc();
  uint64_t v11 = swift_task_alloc();
  v7[12] = v11;
  unint64_t v14 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  unint64_t v12 = (void *)swift_task_alloc();
  v7[13] = v12;
  *unint64_t v12 = v7;
  v12[1] = sub_213BCD8AC;
  return v14(v11);
}

uint64_t sub_213BCD8AC()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_213BCDAF4;
  }
  else {
    uint64_t v2 = sub_213BCD9C0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_213BCD9C0()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[10];
  uint64_t v4 = v0[7];
  uint64_t v5 = v0[8];
  uint64_t v6 = v0[5];
  (*(void (**)(void, uint64_t, uint64_t))(v3 + 16))(v0[11], v1, v6);
  sub_213BD65E0();
  sub_213BD65C0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  v0[3] = 0;
  sub_213BD65D0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_213BCDAF4()
{
  v0[2] = v0[14];
  sub_213BD65E0();
  sub_213BD65D0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_213BCDB98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC258);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213BC5F44(a1, (uint64_t)v10);
  uint64_t v11 = sub_213BD6480();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_213BC596C((uint64_t)v10);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v13 = sub_213BD6420();
      uint64_t v15 = v14;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_213BD6470();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
  uint64_t v15 = 0;
LABEL_6:
  uint64_t v16 = *v4;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  uint64_t v18 = (void *)(v15 | v13);
  if (v15 | v13)
  {
    v21[0] = 0;
    v21[1] = 0;
    uint64_t v18 = v21;
    v21[2] = v13;
    v21[3] = v15;
  }
  v20[1] = 1;
  v20[2] = v18;
  v20[3] = v16;
  swift_task_create();
  return swift_release();
}

uint64_t sub_213BCDD90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[8] = a8;
  v8[9] = v12;
  v8[6] = a6;
  v8[7] = a7;
  v8[4] = a4;
  v8[5] = a5;
  v8[10] = swift_getAssociatedTypeWitness();
  uint64_t v9 = sub_213BD6700();
  v8[11] = v9;
  v8[12] = *(void *)(v9 - 8);
  v8[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_213BCDE84, 0, 0);
}

uint64_t sub_213BCDE84()
{
  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(v0[10] - 8) + 56))(v0[13], 1, 1);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2677FC3E8 + dword_2677FC3E8);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[14] = v1;
  void *v1 = v0;
  v1[1] = sub_213BCDF6C;
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[9];
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  return v8(v6, v2, v5, v3, v4);
}

uint64_t sub_213BCDF6C()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 104);
  uint64_t v3 = *(void *)(*(void *)v1 + 96);
  uint64_t v4 = *(void *)(*(void *)v1 + 88);
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_213BCE19C;
  }
  else {
    uint64_t v5 = sub_213BCE0DC;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_213BCE0DC()
{
  sub_213BCF4B0();
  *(void *)(v0 + 24) = swift_allocError();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2677FC2F8);
  sub_213BD65E0();
  sub_213BD65D0();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_213BCE19C()
{
  v0[2] = v0[15];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2677FC2F8);
  sub_213BD65E0();
  sub_213BD65D0();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_213BCE244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2677FC3F8 + dword_2677FC3F8);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_213BC54C4;
  return v12(a1, a2, a4, a5);
}

uint64_t sub_213BCE31C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_213BD6480();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_213BD6470();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_213BC596C(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_213BD6420();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_213BCE4C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F8F680];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2677FC2F8);
  uint64_t v3 = sub_213BD65B0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);

  return v4(a1, v2, v3);
}

uint64_t static CATTaskTimeoutError.== infix(_:_:)()
{
  return 1;
}

uint64_t CATTaskTimeoutError.hash(into:)()
{
  return sub_213BD67D0();
}

uint64_t CATTaskTimeoutError.hashValue.getter()
{
  return sub_213BD67E0();
}

uint64_t sub_213BCE5D0()
{
  return 1;
}

uint64_t sub_213BCE5D8()
{
  return sub_213BD67E0();
}

uint64_t sub_213BCE61C()
{
  return sub_213BD67D0();
}

uint64_t sub_213BCE644()
{
  return sub_213BD67E0();
}

unint64_t sub_213BCE688()
{
  unint64_t result = qword_2677FC388;
  if (!qword_2677FC388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2677FC388);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CATTaskTimeoutError(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for CATTaskTimeoutError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x213BCE7DCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_213BCE804()
{
  return 0;
}

ValueMetadata *type metadata accessor for CATTaskTimeoutError()
{
  return &type metadata for CATTaskTimeoutError;
}

uint64_t sub_213BCE81C()
{
  uint64_t v1 = *(void *)(v0 + 40);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2677FC2F8);
  uint64_t v2 = sub_213BD65E0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 72) & ~v4;
  uint64_t v6 = *(void *)(v3 + 64);
  uint64_t v18 = v1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = (v5 + v6 + v9) & ~v9;
  uint64_t v11 = *(void *)(v1 - 8);
  uint64_t v12 = v11;
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v10 + *(void *)(v8 + 64) + v13) & ~v13;
  uint64_t v17 = v14 + *(void *)(v11 + 64);
  uint64_t v15 = v4 | v9 | v13 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v5, v2);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0 + v10, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v0 + v14, v18);

  return MEMORY[0x270FA0238](v0, v17, v15);
}

uint64_t sub_213BCEA38(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 40);
  uint64_t v7 = *(void *)(v1 + 48);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2677FC2F8);
  uint64_t v8 = *(void *)(sub_213BD65E0() - 8);
  unint64_t v9 = (*(unsigned __int8 *)(v8 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v8 + 64);
  uint64_t v11 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v12 = (v9 + v10 + *(unsigned __int8 *)(v11 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v13 = v1 + v12;
  uint64_t v14 = v1
      + ((v12 + *(void *)(v11 + 64) + *(unsigned __int8 *)(*(void *)(v5 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80));
  uint64_t v15 = swift_task_alloc();
  long long v16 = *(_OWORD *)(v1 + 56);
  *(void *)(v3 + 16) = v15;
  *(void *)uint64_t v15 = v3;
  *(void *)(v15 + 8) = sub_213BC54C4;
  *(void *)(v15 + 72) = v5;
  *(void *)(v15 + 80) = v7;
  *(void *)(v15 + 56) = v14;
  *(void *)(v15 + 64) = v6;
  *(void *)(v15 + 40) = v1 + v9;
  *(void *)(v15 + 48) = v13;
  *(_OWORD *)(v15 + 24) = v16;
  *(void *)(v15 + 16) = a1;
  return MEMORY[0x270FA2498](sub_213BCCD20, 0, 0);
}

uint64_t sub_213BCEC40(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_213BCFA48;
  return v6(a1);
}

uint64_t sub_213BCED1C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_213BC61BC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2677FC3A0 + dword_2677FC3A0);
  return v6(a1, v4);
}

uint64_t sub_213BCEDD4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2[2];
  uint64_t v6 = v2[5];
  uint64_t v7 = v2[6];
  uint64_t v8 = v2[7];
  uint64_t v10 = v2[8];
  uint64_t v9 = v2[9];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v11;
  void *v11 = v3;
  v11[1] = sub_213BC61BC;
  return sub_213BCCF44((uint64_t)v11, a2, v6, v7, v8, v10, v9, v5);
}

uint64_t sub_213BCEEB8()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2677FC2F8);
  uint64_t v1 = sub_213BD65E0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 72) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_213BCEFAC()
{
  uint64_t v2 = v0[4];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2677FC2F8);
  uint64_t v3 = *(void *)(sub_213BD65E0() - 8);
  uint64_t v4 = (int *)v0[7];
  uint64_t v5 = v0[8];
  uint64_t v6 = (uint64_t)v0 + ((*(unsigned __int8 *)(v3 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_213BC61BC;
  return sub_213BCD6E0((uint64_t)v7, v8, v9, v4, v5, v6, v2);
}

uint64_t sub_213BCF0B4()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v16 = v1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v2 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = *(void *)(v1 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v4 + *(void *)(v2 + 64) + v6) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2677FC2F8);
  uint64_t v9 = sub_213BD65E0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v7 + v8 + v11) & ~v11;
  uint64_t v15 = v12 + *(void *)(v10 + 64);
  uint64_t v13 = v3 | v6 | v11 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v7, v16);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v12, v9);

  return MEMORY[0x270FA0238](v0, v15, v13);
}

uint64_t sub_213BCF2C4()
{
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (v5 + *(void *)(v4 + 64) + *(unsigned __int8 *)(*(void *)(v2 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2 - 8) + 80);
  uint64_t v7 = *(void *)(*(void *)(v2 - 8) + 64);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2677FC2F8);
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(sub_213BD65E0() - 8) + 80);
  unint64_t v9 = v6 + v7 + v8;
  uint64_t v10 = v0 + v5;
  uint64_t v11 = v0 + v6;
  uint64_t v12 = v0 + (v9 & ~v8);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v13;
  void *v13 = v1;
  v13[1] = sub_213BC61BC;
  return sub_213BCDD90((uint64_t)v13, v14, v15, v10, v11, v12, v3, v2);
}

unint64_t sub_213BCF4B0()
{
  unint64_t result = qword_2677FC3F0;
  if (!qword_2677FC3F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677FC3F0);
  }
  return result;
}

uint64_t sub_213BCF504(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5[7] = AssociatedTypeWitness;
  v5[8] = *(void *)(AssociatedTypeWitness - 8);
  v5[9] = swift_task_alloc();
  v5[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_213BCF5F4, 0, 0);
}

uint64_t sub_213BCF5F4()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[8];
  sub_213BD6760();
  swift_getAssociatedConformanceWitness();
  sub_213BD6730();
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[11] = v4;
  v0[12] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v4(v1, v2);
  unint64_t v5 = (void *)swift_task_alloc();
  v0[13] = v5;
  *unint64_t v5 = v0;
  v5[1] = sub_213BCF72C;
  uint64_t v6 = v0[10];
  uint64_t v7 = v0[5];
  uint64_t v8 = v0[3];
  uint64_t v9 = v0[4];
  return MEMORY[0x270FA2380](v6, v8, v9, v7);
}

uint64_t sub_213BCF72C()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 88);
  uint64_t v3 = *(void *)(*v1 + 80);
  uint64_t v4 = *(void *)(*v1 + 56);
  uint64_t v5 = *v1;
  *(void *)(v5 + 112) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_213BCF8E8, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_213BCF8E8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_213BCF954()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_213BCF98C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_213BC54C4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2677FC400 + dword_2677FC400);
  return v6(a1, v4);
}

void *sub_213BCFA4C(uint64_t a1)
{
  uint64_t v2 = (void *)swift_allocObject();
  uint64_t v3 = sub_213BD6310();
  v2[4] = 0;
  v2[5] = 0;
  v2[2] = a1;
  v2[3] = v3;
  return v2;
}

uint64_t sub_213BCFAB4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(*v1 + 80);
  uint64_t v5 = sub_213BD6700();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = &v14[-v6];
  sub_213BD0104();
  uint64_t v8 = v1[5];
  uint64_t v9 = *(void *)(v4 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v9 + 16))(v7, a1, v4);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v4);
  uint64_t v15 = v8;
  swift_beginAccess();
  sub_213BD6370();
  sub_213BD6390();
  uint64_t result = swift_endAccess();
  uint64_t v11 = v2[5];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12)
  {
    __break(1u);
  }
  else
  {
    v2[5] = v13;
    return sub_213BD052C();
  }
  return result;
}

uint64_t sub_213BCFC28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 80);
  uint64_t v5 = sub_213BD6700();
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v18[-1] - v7;
  if ((*(uint64_t (**)(uint64_t))(v3 + 216))(v6) < 1)
  {
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
    return v16(a1, 1, 1, v4);
  }
  else
  {
    uint64_t v9 = v1[4];
    swift_beginAccess();
    uint64_t v10 = v1[3];
    v18[0] = v9;
    swift_bridgeObjectRetain();
    MEMORY[0x2166926E0](v18, v10, MEMORY[0x263F8D6C8], v4, MEMORY[0x263F8D6D8]);
    swift_bridgeObjectRelease();
    uint64_t v11 = v1[4];
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v8, 1, 1, v4);
    v18[3] = v11;
    swift_beginAccess();
    sub_213BD6370();
    sub_213BD6390();
    uint64_t result = swift_endAccess();
    uint64_t v13 = v1[4];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      __break(1u);
    }
    else {
      v1[4] = v15;
    }
  }
  return result;
}

uint64_t sub_213BCFE5C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t result = v1 - v2;
  if (__OFSUB__(v1, v2)) {
    __break(1u);
  }
  return result;
}

uint64_t sub_213BCFE70(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 80);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v16 - v7;
  uint64_t v17 = sub_213BD6320();
  (*(void (**)(void))(*(void *)v1 + 216))();
  sub_213BD6410();
  sub_213BD63F0();
  uint64_t v9 = *(uint64_t (**)(uint64_t))(*(void *)v1 + 216);
  uint64_t v10 = swift_retain();
  if (v9(v10))
  {
    uint64_t v11 = 0;
    BOOL v12 = (void (**)(char *, char *, uint64_t))(v3 + 32);
    while (1)
    {
      uint64_t result = sub_213BD06C8(v11, (uint64_t)v8);
      uint64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        break;
      }
      (*v12)(v6, v8, v2);
      uint64_t v15 = sub_213BD6400();
      ++v11;
      if (v14 == (*(uint64_t (**)(uint64_t))(*(void *)v1 + 216))(v15)) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_5:
    swift_release();
    return v17;
  }
  return result;
}

uint64_t sub_213BD0070()
{
  swift_beginAccess();
  sub_213BD6370();
  sub_213BD6360();
  uint64_t result = swift_endAccess();
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0;
  return result;
}

uint64_t sub_213BD0104()
{
  if (v0[5] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t result = (*(uint64_t (**)(void))(*v0 + 248))();
    if (v0[5] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t result = sub_213BD6740();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_213BD01C8()
{
  uint64_t v1 = *(void *)(*v0 + 80);
  uint64_t v2 = sub_213BD6700();
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v34 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v23 - v6;
  uint64_t v8 = *(void *)(v1 - 8);
  uint64_t result = MEMORY[0x270FA5388](v5);
  uint64_t v35 = (char *)&v23 - v10;
  uint64_t v11 = v0[4];
  if (v11 < 1) {
    return result;
  }
  uint64_t v33 = v0[5];
  uint64_t v32 = v33 - v11;
  if (v33 >= v11)
  {
    uint64_t v12 = v11;
    if (v33 == v11)
    {
LABEL_9:
      v0[4] = 0;
      BOOL v21 = __OFSUB__(v12, v11);
      uint64_t v22 = v12 - v11;
      if (!v21)
      {
        v0[5] = v22;
        return result;
      }
      goto LABEL_14;
    }
    uint64_t v24 = v0;
    uint64_t v13 = v0 + 3;
    uint64_t result = swift_beginAccess();
    uint64_t v14 = 0;
    uint64_t v30 = (void (**)(char *, char *, uint64_t))(v8 + 32);
    uint64_t v31 = (uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48);
    uint64_t v29 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
    uint64_t v26 = (uint64_t (**)(char *, uint64_t))(v8 + 8);
    uint64_t v27 = (void (**)(char *, char *, uint64_t))(v8 + 16);
    uint64_t v15 = MEMORY[0x263F8D6C8];
    uint64_t v16 = MEMORY[0x263F8D6D8];
    unint64_t v28 = v7;
    uint64_t v25 = v11;
    uint64_t v17 = v34;
    while (1)
    {
      uint64_t v18 = v11 + v14;
      if (v11 + v14 >= v33) {
        break;
      }
      uint64_t v19 = *v13;
      v37[0] = v11 + v14;
      swift_bridgeObjectRetain();
      MEMORY[0x2166926E0](v37, v19, v15, v1, v16);
      swift_bridgeObjectRelease();
      uint64_t result = (*v31)(v7, 1, v1);
      if (result == 1) {
        goto LABEL_15;
      }
      uint64_t v20 = v35;
      (*v30)(v35, v7, v1);
      uint64_t v36 = *v29;
      v36(v17, 1, 1, v1);
      uint64_t v38 = v18;
      swift_beginAccess();
      sub_213BD6370();
      sub_213BD6390();
      (*v27)(v17, v20, v1);
      v36(v17, 0, 1, v1);
      uint64_t v7 = v28;
      uint64_t v38 = v14;
      sub_213BD6390();
      swift_endAccess();
      uint64_t result = (*v26)(v20, v1);
      ++v14;
      uint64_t v11 = v25;
      if (v32 == v14)
      {
        uint64_t v0 = v24;
        uint64_t v12 = v24[5];
        goto LABEL_9;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_213BD052C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = sub_213BD6700();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v8 - v5;
  uint64_t result = (*(uint64_t (**)(uint64_t))(v1 + 216))(v4);
  if (v0[2] < result)
  {
    (*(void (**)(void))(*v0 + 208))();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return result;
}

uint64_t sub_213BD066C()
{
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_213BD06A4()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t sub_213BD06C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(*v2 + 80);
  uint64_t v6 = sub_213BD6700();
  uint64_t result = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v15 - v8;
  uint64_t v10 = v2[4];
  BOOL v11 = __OFADD__(a1, v10);
  uint64_t v12 = a1 + v10;
  if (v11)
  {
    __break(1u);
  }
  else
  {
    swift_beginAccess();
    uint64_t v13 = v2[3];
    uint64_t v15 = v12;
    swift_bridgeObjectRetain();
    MEMORY[0x2166926E0](&v15, v13, MEMORY[0x263F8D6C8], v5, MEMORY[0x263F8D6D8]);
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void *)(v5 - 8);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v9, 1, v5);
    if (result != 1) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(a2, v9, v5);
    }
  }
  __break(1u);
  return result;
}

void sub_213BD0830(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_213BD0838@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_213BD06A4();
  *a1 = result;
  return result;
}

void (*sub_213BD0864(void *a1, uint64_t *a2))(void *a1)
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_213BD0910(v4, *a2);
  return sub_213BD08C8;
}

void sub_213BD08C8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_213BD0910(void *a1, uint64_t a2))(void *a1)
{
  uint64_t v5 = *(void *)(*(void *)v2 + 80);
  *a1 = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  a1[1] = v6;
  uint64_t v7 = malloc(*(void *)(v6 + 64));
  a1[2] = v7;
  sub_213BD06C8(a2, (uint64_t)v7);
  return sub_213BD09C8;
}

void sub_213BD09C8(void *a1)
{
  uint64_t v1 = (void *)a1[2];
  (*(void (**)(void *, void))(a1[1] + 8))(v1, *a1);

  free(v1);
}

uint64_t sub_213BD0A14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for CATQueue();

  return MEMORY[0x270F9E1D0](a1, v5, a3);
}

uint64_t sub_213BD0A70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for CATQueue();

  return MEMORY[0x270F9E1B8](v3, a2);
}

uint64_t sub_213BD0AC4()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 216))();
}

void sub_213BD0B08(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t sub_213BD0B18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for CATQueue();

  return MEMORY[0x270F9E150](a1, a2, v7, a4);
}

uint64_t sub_213BD0B84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for CATQueue();

  return MEMORY[0x270F9E148](a1, a2, a3, v9, a5);
}

uint64_t sub_213BD0BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for CATQueue();

  return MEMORY[0x270F9E180](a1, a2, v7, a4);
}

uint64_t sub_213BD0C54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for CATQueue();
  return sub_213BD1274(a1, a2, v7, a4, MEMORY[0x263F8D870], MEMORY[0x263F8D170]);
}

uint64_t sub_213BD0CCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for CATQueue();
  return sub_213BD1274(a1, a2, v7, a4, MEMORY[0x263F8D1A0], MEMORY[0x263F8D180]);
}

uint64_t sub_213BD0D44(uint64_t a1, uint64_t a2)
{
  type metadata accessor for CATQueue();

  return sub_213BD1068(a1, a2);
}

void *sub_213BD0DA0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    *a2 = *result + 1;
  }
  return result;
}

void *sub_213BD0DB8(void *result)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    ++*result;
  }
  return result;
}

uint64_t sub_213BD0DD0()
{
  return swift_getWitnessTable();
}

uint64_t sub_213BD0DEC()
{
  return MEMORY[0x263F8D6E0];
}

uint64_t sub_213BD0DF8()
{
  return swift_getWitnessTable();
}

uint64_t sub_213BD0E14()
{
  return swift_getWitnessTable();
}

uint64_t sub_213BD0E30()
{
  return swift_getWitnessTable();
}

void sub_213BD0E4C(void *a1@<X8>)
{
  *a1 = *v1;
  a1[1] = 0;
}

uint64_t sub_213BD0E58(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_213BD0EAC()
{
  return 2;
}

uint64_t sub_213BD0EB4()
{
  type metadata accessor for CATQueue();
  swift_getWitnessTable();
  uint64_t v0 = sub_213BD14E4();
  swift_release();
  return v0;
}

void sub_213BD0F1C()
{
  type metadata accessor for CATQueue();

  JUMPOUT(0x216692730);
}

uint64_t sub_213BD0F88()
{
  return sub_213BD63E0();
}

uint64_t sub_213BD0FF8()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for CATQueue()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_213BD1068(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v5 = sub_213BD66F0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  BOOL v11 = (char *)v17 - v10;
  v17[1] = AssociatedConformanceWitness;
  LOBYTE(AssociatedConformanceWitness) = sub_213BD63A0();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v12(v11, a1, v5);
  v12(v9, a2, v5);
  if ((AssociatedConformanceWitness & 1) == 0)
  {
    uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
    v16(v9, v5);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v16)(v11, v5);
    goto LABEL_5;
  }
  char v13 = sub_213BD63A0();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v9, v5);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v14)(v11, v5);
  if ((v13 & 1) == 0) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t sub_213BD1274(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, uint64_t), uint64_t (*a6)(char *, char *, uint64_t, uint64_t))
{
  uint64_t v23 = a6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v11 = a5(0, AssociatedTypeWitness, AssociatedConformanceWitness);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v22 - v14;
  uint64_t v16 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v22 - v17;
  char v19 = sub_213BD63A0();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a2, v11);
  if ((v19 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, AssociatedTypeWitness);
    goto LABEL_5;
  }
  char v20 = v23(v18, &v15[*(int *)(v11 + 36)], AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, AssociatedTypeWitness);
  if ((v20 & 1) == 0) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t dispatch thunk of CATAsyncStreamVending.makeStream()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t type metadata accessor for CATSerializer.Nucleus()
{
  uint64_t result = qword_2677FD108;
  if (!qword_2677FD108) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t CATSerializer.deinit()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC410);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  memset(v6, 0, 41);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC418);
  sub_213BD64D0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  swift_release();
  return v0;
}

uint64_t CATSerializer.__deallocating_deinit()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC410);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  memset(v5, 0, 41);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC418);
  sub_213BD64D0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t CATSerializer.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  type metadata accessor for CATSerializer.Nucleus();
  uint64_t v1 = swift_allocObject();
  sub_213BD1C48();
  *(void *)(v0 + 16) = v1;
  return v0;
}

uint64_t CATSerializer.init()()
{
  uint64_t v1 = v0;
  type metadata accessor for CATSerializer.Nucleus();
  uint64_t v2 = swift_allocObject();
  sub_213BD1C48();
  *(void *)(v1 + 16) = v2;
  return v1;
}

Swift::Void __swiftcall CATSerializer.cancelAllTasks()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC410);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  memset(v4, 0, 41);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC418);
  sub_213BD64D0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t CATSerializer.enqueue<A>(respectingCancelAll:_:)(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_213BD27EC(a1, a2, a3, a4);
}

uint64_t sub_213BD192C()
{
  uint64_t v1 = v0;
  if (*(void *)(v0 + 112))
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC2F8);
    sub_213BD6550();
    swift_release();
  }
  uint64_t v2 = v0
     + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_executionLoopContinuation;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC480);
  sub_213BD64E0();
  uint64_t v4 = (uint64_t *)(v0
                 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_currentWorkItem);
  if (*(void *)(v0
                 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_currentWorkItem))
  {
    uint64_t v5 = (uint64_t (*)(void))v4[1];
    swift_retain();
    swift_retain();
    sub_213BC6984(v5);
    swift_release();
    swift_release();
  }
  if (*(void *)(v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_commandLoop))
  {
    swift_retain();
    sub_213BD6550();
    swift_release();
  }
  uint64_t v6 = v1
     + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_commandLoopContinuation;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC418);
  sub_213BD64E0();
  uint64_t v8 = v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_phaseContinuation;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC478);
  sub_213BD64E0();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  uint64_t v10 = v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_executionLoopStream;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC468);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  sub_213BD52A8(*v4);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v12 = v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_commandLoopStream;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC4A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  uint64_t v14 = v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_phaseStream;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC420);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v1);
}

uint64_t sub_213BD1C48()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC258);
  MEMORY[0x270FA5388](v2 - 8);
  v71 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC460);
  uint64_t v69 = *(void *)(v4 - 8);
  uint64_t v70 = v4;
  MEMORY[0x270FA5388](v4);
  v68 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC4B8);
  uint64_t v64 = *(void *)(v6 - 8);
  uint64_t v65 = v6;
  MEMORY[0x270FA5388](v6);
  v63 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC478);
  uint64_t v66 = *(void *)(v8 - 8);
  uint64_t v67 = v8;
  MEMORY[0x270FA5388](v8);
  v60 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC420);
  uint64_t v61 = *(void *)(v10 - 8);
  uint64_t v62 = v10;
  MEMORY[0x270FA5388](v10);
  v59 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC4C0);
  uint64_t v55 = *(void *)(v12 - 8);
  uint64_t v56 = v12;
  MEMORY[0x270FA5388](v12);
  v54 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC418);
  uint64_t v57 = *(void *)(v14 - 8);
  uint64_t v58 = v14;
  MEMORY[0x270FA5388](v14);
  v51 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC4A0);
  uint64_t v52 = *(void *)(v16 - 8);
  uint64_t v53 = v16;
  MEMORY[0x270FA5388](v16);
  v50 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC4C8);
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  BOOL v21 = (char *)&v48 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC480);
  uint64_t v22 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v24 = (char *)&v48 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC468);
  uint64_t v25 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  uint64_t v27 = (char *)&v48 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  *(void *)(v1 + 112) = 0;
  unint64_t v28 = (_OWORD *)(v1
                 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_currentWorkItem);
  *unint64_t v28 = 0u;
  v28[1] = 0u;
  *(_OWORD *)((char *)v28 + 25) = 0u;
  *(void *)(v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_phase) = 0;
  *(void *)(v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_commandLoop) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC430);
  uint64_t v29 = *MEMORY[0x263F8F580];
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 104))(v21, v29, v18);
  sub_213BD6490();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  (*(void (**)(uint64_t, char *, uint64_t))(v25 + 32))(v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_executionLoopStream, v27, v48);
  (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_executionLoopContinuation, v24, v49);
  uint64_t v31 = v54;
  uint64_t v30 = v55;
  uint64_t v32 = v56;
  (*(void (**)(char *, uint64_t, uint64_t))(v55 + 104))(v54, v29, v56);
  uint64_t v33 = v50;
  uint64_t v34 = v51;
  sub_213BD6490();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v32);
  (*(void (**)(uint64_t, char *, uint64_t))(v52 + 32))(v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_commandLoopStream, v33, v53);
  (*(void (**)(uint64_t, char *, uint64_t))(v57 + 32))(v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_commandLoopContinuation, v34, v58);
  uint64_t v36 = v63;
  uint64_t v35 = v64;
  uint64_t v37 = v65;
  (*(void (**)(char *, uint64_t, uint64_t))(v64 + 104))(v63, v29, v65);
  uint64_t v38 = v59;
  uint64_t v39 = v60;
  sub_213BD6490();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v37);
  (*(void (**)(uint64_t, char *, uint64_t))(v61 + 32))(v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_phaseStream, v38, v62);
  uint64_t v40 = v66;
  uint64_t v41 = v67;
  (*(void (**)(uint64_t, char *, uint64_t))(v66 + 32))(v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_phaseContinuation, v39, v67);
  uint64_t v42 = v40;
  (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v39, v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_phaseContinuation, v41);
  uint64_t v72 = *(void *)(v1 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_phase);
  uint64_t v43 = v68;
  sub_213BD64D0();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v39, v41);
  (*(void (**)(char *, uint64_t))(v69 + 8))(v43, v70);
  uint64_t v44 = sub_213BD6480();
  uint64_t v45 = (uint64_t)v71;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v71, 1, 1, v44);
  uint64_t v46 = (void *)swift_allocObject();
  v46[2] = 0;
  v46[3] = 0;
  v46[4] = v1;
  swift_retain();
  sub_213BCE31C(v45, (uint64_t)&unk_2677FC4D8, (uint64_t)v46);
  swift_release();
  return v1;
}

uint64_t sub_213BD253C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC4A0);
  _OWORD v4[3] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v4[4] = v7;
  v4[5] = *(void *)(v7 + 64);
  v4[6] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC258);
  v4[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_213BD263C, a4, 0);
}

uint64_t sub_213BD263C()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[2];
  uint64_t v6 = v0[3];
  uint64_t v7 = v5 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_commandLoopStream;
  uint64_t v8 = sub_213BD6480();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v1, 1, 1, v8);
  uint64_t v9 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v7, v6);
  unint64_t v10 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = 0;
  *(void *)(v11 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v11 + v10, v2, v6);
  *(void *)(v11 + ((v4 + v10 + 7) & 0xFFFFFFFFFFFFFFF8)) = v9;
  *(void *)(v5 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_commandLoop) = sub_213BCE31C(v1, (uint64_t)&unk_2677FC4E8, v11);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_213BD27EC(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  int v27 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC410);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = &v26[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC258);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = &v26[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for CATAsyncGate();
  uint64_t v16 = sub_213BC83D8();
  uint64_t v17 = sub_213BD6480();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v15, 1, 1, v17);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  void v18[4] = a4;
  v18[5] = v16;
  v18[6] = a2;
  v18[7] = a3;
  v18[8] = v5;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v19 = sub_213BD2E38((uint64_t)v15, (uint64_t)&unk_2677FC4B0, (uint64_t)v18);
  sub_213BC596C((uint64_t)v15);
  swift_retain();
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC2F8);
  BOOL v21 = sub_213BC6A78(v19, a4, v20, MEMORY[0x263F8E4E0]);
  uint64_t v28 = v16;
  uint64_t v29 = v21;
  uint64_t v30 = v22;
  uint64_t v31 = v23;
  uint64_t v32 = v24;
  char v33 = v27;
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC418);
  sub_213BD64D0();
  swift_release_n();
  swift_release();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
  return v19;
}

uint64_t sub_213BD2A8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _OWORD v6[3] = a5;
  v6[4] = a6;
  v6[2] = a1;
  uint64_t v7 = (void *)swift_task_alloc();
  v6[5] = v7;
  *uint64_t v7 = v6;
  v7[1] = sub_213BD2B28;
  return sub_213BC8688();
}

uint64_t sub_213BD2B28()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_213BD2C24, 0, 0);
}

uint64_t sub_213BD2C24()
{
  sub_213BD6570();
  uint64_t v4 = (uint64_t (*)(uint64_t))(v0[3] + *(int *)v0[3]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[6] = v1;
  void *v1 = v0;
  v1[1] = sub_213BD2D44;
  uint64_t v2 = v0[2];
  return v4(v2);
}

uint64_t sub_213BD2D44()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_213BD2E38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC258);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213BC5F44(a1, (uint64_t)v7);
  uint64_t v8 = sub_213BD6480();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_213BC596C((uint64_t)v7);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
  }
  else
  {
    sub_213BD6470();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  uint64_t v10 = sub_213BD6420();
  uint64_t v12 = v11;
  swift_unknownObjectRelease();
  if (v12 | v10)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v10;
    v14[3] = v12;
  }
  return swift_task_create();
}

uint64_t sub_213BD2FF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[17] = a4;
  v5[18] = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2677FC4F0);
  v5[19] = v6;
  v5[20] = *(void *)(v6 - 8);
  v5[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_213BD30B8, 0, 0);
}

uint64_t sub_213BD30B8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC4A0);
  sub_213BD6500();
  swift_beginAccess();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v1;
  void *v1 = v0;
  v1[1] = sub_213BD31AC;
  uint64_t v2 = *(void *)(v0 + 152);
  return MEMORY[0x270FA1F68](v0 + 64, 0, 0, v2);
}

uint64_t sub_213BD31AC()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_213BD32A8, 0, 0);
}

uint64_t sub_213BD32A8()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v0 + 88);
  *(void *)(v0 + 184) = v1;
  *(void *)(v0 + 192) = v2;
  uint64_t v5 = *(void *)(v0 + 96);
  *(void *)(v0 + 200) = v3;
  *(void *)(v0 + 208) = v4;
  *(void *)(v0 + 216) = v5;
  char v6 = *(unsigned char *)(v0 + 104);
  *(unsigned char *)(v0 + 57) = v6;
  if (v1 == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 160) + 8))(*(void *)(v0 + 168), *(void *)(v0 + 152));
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
  else
  {
    *(void *)(v0 + 16) = v1;
    *(void *)(v0 + 24) = v2;
    *(void *)(v0 + 32) = v3;
    *(void *)(v0 + 40) = v4;
    *(void *)(v0 + 48) = v5;
    *(unsigned char *)(v0 + 56) = v6;
    uint64_t Strong = swift_weakLoadStrong();
    *(void *)(v0 + 224) = Strong;
    if (Strong)
    {
      return MEMORY[0x270FA2498](sub_213BD3440, Strong, 0);
    }
    else
    {
      sub_213BD5284(*(void *)(v0 + 184));
      uint64_t v10 = (void *)swift_task_alloc();
      *(void *)(v0 + 176) = v10;
      *uint64_t v10 = v0;
      v10[1] = sub_213BD31AC;
      uint64_t v11 = *(void *)(v0 + 152);
      return MEMORY[0x270FA1F68](v0 + 64, 0, 0, v11);
    }
  }
}

uint64_t sub_213BD3440()
{
  sub_213BD3574((long long *)(v0 + 16));
  swift_release();
  return MEMORY[0x270FA2498](sub_213BD34B4, 0, 0);
}

uint64_t sub_213BD34B4()
{
  sub_213BD5284(v0[23]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[22] = v1;
  void *v1 = v0;
  v1[1] = sub_213BD31AC;
  uint64_t v2 = v0[19];
  return MEMORY[0x270FA1F68](v0 + 8, 0, 0, v2);
}

uint64_t sub_213BD3574(long long *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC460);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC468);
  uint64_t v31 = *(void *)(v8 - 8);
  uint64_t v32 = v8;
  uint64_t v9 = *(void *)(v31 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v30 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC258);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v33 = (uint64_t)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC470);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213BD4D20(a1, &v39);
  if ((void)v39)
  {
    uint64_t v16 = *(void *)(v2 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_phase);
    long long v34 = v39;
    long long v29 = v40;
    long long v35 = v40;
    uint64_t v36 = v41;
    char v37 = v42;
    uint64_t v38 = v16;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC480);
    sub_213BD64D0();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    if (!*(void *)(v2 + 112))
    {
      uint64_t v22 = v2
          + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_executionLoopStream;
      uint64_t v23 = sub_213BD6480();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v33, 1, 1, v23);
      *(void *)&long long v29 = swift_allocObject();
      swift_weakInit();
      uint64_t v25 = v30;
      uint64_t v24 = v31;
      uint64_t v26 = v32;
      (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v30, v22, v32);
      unint64_t v27 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
      uint64_t v28 = swift_allocObject();
      *(void *)(v28 + 16) = 0;
      *(void *)(v28 + 24) = 0;
      (*(void (**)(unint64_t, char *, uint64_t))(v24 + 32))(v28 + v27, v25, v26);
      *(void *)(v28 + ((v9 + v27 + 7) & 0xFFFFFFFFFFFFFFF8)) = v29;
      *(void *)(v2 + 112) = sub_213BC7FD4(v33, (uint64_t)&unk_2677FC490, v28);
      swift_release();
    }
    swift_release();
    swift_release();
    return swift_release();
  }
  else
  {
    uint64_t v17 = v2 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_currentWorkItem;
    uint64_t v18 = *(void *)(v2
                    + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_currentWorkItem);
    if (v18 && (*(unsigned char *)(v17 + 40) & 1) != 0)
    {
      uint64_t v19 = *(uint64_t (**)(void))(v17 + 8);
      swift_retain();
      swift_retain();
      swift_retain();
      sub_213BC6984(v19);
      sub_213BD52A8(v18);
    }
    uint64_t v20 = *(void *)(v2 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_phase)
        + 1;
    *(void *)(v2 + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_phase) = v20;
    *(void *)&long long v34 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC478);
    sub_213BD64D0();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_213BD3A50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[12] = a4;
  v5[13] = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC498);
  v5[14] = v6;
  v5[15] = *(void *)(v6 - 8);
  v5[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_213BD3B14, 0, 0);
}

uint64_t sub_213BD3B14()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2677FC468);
  sub_213BD6500();
  swift_beginAccess();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v1;
  void *v1 = v0;
  v1[1] = sub_213BD3C08;
  uint64_t v2 = *(void *)(v0 + 112);
  return MEMORY[0x270FA1F68](v0 + 16, 0, 0, v2);
}

uint64_t sub_213BD3C08()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_213BD3D04, 0, 0);
}

uint64_t sub_213BD3D04()
{
  long long v2 = *(_OWORD *)(v0 + 16);
  long long v1 = *(_OWORD *)(v0 + 32);
  long long v3 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v0 + 144) = v2;
  *(_OWORD *)(v0 + 160) = v1;
  *(_OWORD *)(v0 + 176) = v3;
  *(void *)(v0 + 192) = *(void *)(v0 + 64);
  if ((void)v2)
  {
    uint64_t Strong = swift_weakLoadStrong();
    *(void *)(v0 + 200) = Strong;
    if (Strong)
    {
      uint64_t v5 = Strong;
      swift_retain();
      swift_retain();
      swift_retain();
      return MEMORY[0x270FA2498](sub_213BD3ED4, v5, 0);
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      uint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 136) = v7;
      *uint64_t v7 = v0;
      v7[1] = sub_213BD3C08;
      uint64_t v8 = *(void *)(v0 + 112);
      return MEMORY[0x270FA1F68](v0 + 16, 0, 0, v8);
    }
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 120) + 8))(*(void *)(v0 + 128), *(void *)(v0 + 112));
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_213BD3ED4()
{
  uint64_t v1 = *(void *)(v0 + 184);
  if (v1)
  {
    uint64_t v7 = *(void *)(v0 + 192);
    uint64_t v8 = *(void *)(v0 + 176);
    uint64_t v9 = *(void *)(v0 + 160);
    uint64_t v4 = *(void *)(v0 + 144);
    uint64_t v10 = *(void *)(*(void *)(v0 + 200)
                    + OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_phase);
    swift_retain();
    swift_retain();
    swift_retain();
    if (v10 == v7)
    {
      uint64_t v5 = v9;
      uint64_t v6 = v8;
    }
    else
    {
      sub_213BC6984(*(uint64_t (**)(void))(v0 + 152));
      uint64_t v6 = *(void *)(v0 + 176);
      uint64_t v1 = *(void *)(v0 + 184);
      uint64_t v5 = *(void *)(v0 + 160);
      uint64_t v4 = *(void *)(v0 + 144);
    }
  }
  else
  {
    uint64_t v2 = *(void *)(v0 + 176);
    uint64_t v3 = *(void *)(v0 + 160);
    uint64_t v4 = *(void *)(v0 + 144);
    swift_retain();
    uint64_t v5 = v3;
    swift_retain();
    uint64_t v6 = v2;
    swift_retain();
  }
  uint64_t v11 = *(void *)(v0 + 200);
  uint64_t v12 = *(int **)(v0 + 168);
  uint64_t v13 = *(void *)(v0 + 152);
  sub_213BC8650();
  uint64_t v14 = OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_currentWorkItem;
  *(void *)(v0 + 208) = OBJC_IVAR____TtCC8Catalyst13CATSerializerP33_1A781C39BDB9099759BB8DE3CBC296947Nucleus_currentWorkItem;
  uint64_t v15 = v11 + v14;
  uint64_t v18 = *(void *)v15;
  *(void *)uint64_t v15 = v4;
  *(void *)(v15 + 8) = v13;
  *(void *)(v15 + 16) = v5;
  *(void *)(v15 + 24) = v12;
  *(void *)(v15 + 32) = v6;
  *(unsigned char *)(v15 + 40) = v1 & 1;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_213BD52A8(v18);
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_213BD40AC;
  return sub_213BC69AC(v13, v5, v12);
}

uint64_t sub_213BD40AC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 200);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_213BD41BC, v1, 0);
}

uint64_t sub_213BD41BC()
{
  uint64_t v1 = *(void *)(v0 + 200) + *(void *)(v0 + 208);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v2 = *(void *)v1;
  *(_OWORD *)uint64_t v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 25) = 0u;
  sub_213BD52A8(v2);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA2498](sub_213BD4298, 0, 0);
}

uint64_t sub_213BD4298()
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v1;
  void *v1 = v0;
  v1[1] = sub_213BD3C08;
  uint64_t v2 = *(void *)(v0 + 112);
  return MEMORY[0x270FA1F68](v0 + 16, 0, 0, v2);
}

uint64_t sub_213BD436C()
{
  return v0;
}

uint64_t static Task<>.cat_serialized(on:operation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_213BD27EC(1, a2, a3, a4);
}

uint64_t type metadata accessor for CATSerializer()
{
  return self;
}

uint64_t method lookup function for CATSerializer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CATSerializer);
}

uint64_t dispatch thunk of CATSerializer.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_213BD43F0()
{
  return type metadata accessor for CATSerializer.Nucleus();
}

void sub_213BD43F8()
{
  sub_213BD46A4(319, &qword_2677FC428, MEMORY[0x263F8F590]);
  if (v0 <= 0x3F)
  {
    sub_213BD46A4(319, &qword_2677FC438, MEMORY[0x263F8F5B8]);
    if (v1 <= 0x3F)
    {
      sub_213BD4708(319, &qword_2677FC440, (uint64_t)&type metadata for CATSerializer.Nucleus.Command, MEMORY[0x263F8F590]);
      if (v2 <= 0x3F)
      {
        sub_213BD4708(319, &qword_2677FC448, (uint64_t)&type metadata for CATSerializer.Nucleus.Command, MEMORY[0x263F8F5B8]);
        if (v3 <= 0x3F)
        {
          sub_213BD4708(319, &qword_2677FC450, MEMORY[0x263F8D9D0], MEMORY[0x263F8F5B8]);
          if (v4 <= 0x3F)
          {
            sub_213BD4708(319, &qword_2677FC458, MEMORY[0x263F8D9D0], MEMORY[0x263F8F590]);
            if (v5 <= 0x3F) {
              swift_updateClassMetadata2();
            }
          }
        }
      }
    }
  }
}

void sub_213BD46A4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2677FC430);
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

void sub_213BD4708(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t destroy for CATSerializer.Nucleus.Work()
{
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for CATSerializer.Nucleus.Work(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v3;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CATSerializer.Nucleus.Work(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for CATSerializer.Nucleus.Work(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = v4;
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for CATSerializer.Nucleus.Work(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 41)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CATSerializer.Nucleus.Work(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CATSerializer.Nucleus.Work()
{
  return &type metadata for CATSerializer.Nucleus.Work;
}

unint64_t destroy for CATSerializer.Nucleus.Command(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for CATSerializer.Nucleus.Command(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  }
  else
  {
    uint64_t v3 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    uint64_t v4 = *(void *)(a2 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(void *)(a1 + 32) = v4;
    *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
    swift_retain();
    swift_retain();
    swift_retain();
  }
  return a1;
}

uint64_t assignWithCopy for CATSerializer.Nucleus.Command(uint64_t a1, long long *a2)
{
  unint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)a2;
  if (v4 < 0xFFFFFFFF)
  {
    if (v5 >= 0xFFFFFFFF)
    {
      *(void *)a1 = v5;
      uint64_t v8 = *((void *)a2 + 2);
      *(void *)(a1 + 8) = *((void *)a2 + 1);
      *(void *)(a1 + 16) = v8;
      uint64_t v9 = *((void *)a2 + 4);
      *(void *)(a1 + 24) = *((void *)a2 + 3);
      *(void *)(a1 + 32) = v9;
      *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
      swift_retain();
      swift_retain();
      swift_retain();
      return a1;
    }
LABEL_7:
    long long v10 = *a2;
    long long v11 = a2[1];
    *(_OWORD *)(a1 + 25) = *(long long *)((char *)a2 + 25);
    *(_OWORD *)a1 = v10;
    *(_OWORD *)(a1 + 16) = v11;
    return a1;
  }
  if (v5 < 0xFFFFFFFF)
  {
    swift_release();
    swift_release();
    swift_release();
    goto LABEL_7;
  }
  *(void *)a1 = v5;
  swift_retain();
  swift_release();
  uint64_t v6 = *((void *)a2 + 2);
  *(void *)(a1 + 8) = *((void *)a2 + 1);
  *(void *)(a1 + 16) = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = *((void *)a2 + 4);
  *(void *)(a1 + 24) = *((void *)a2 + 3);
  *(void *)(a1 + 32) = v7;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
  return a1;
}

uint64_t assignWithTake for CATSerializer.Nucleus.Command(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    swift_release();
    swift_release();
    swift_release();
LABEL_5:
    long long v4 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v4;
    *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for CATSerializer.Nucleus.Command(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 41)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CATSerializer.Nucleus.Command(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)unint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

uint64_t sub_213BD4CCC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t sub_213BD4CE4(uint64_t result, int a2)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    uint64_t v2 = a2 ^ 0x80000000;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
  }
  else
  {
    if (!a2) {
      return result;
    }
    uint64_t v2 = (a2 - 1);
  }
  *(void *)unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for CATSerializer.Nucleus.Command()
{
  return &type metadata for CATSerializer.Nucleus.Command;
}

_OWORD *sub_213BD4D20(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(_OWORD *)((char *)a2 + 25) = *(long long *)((char *)a1 + 25);
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

uint64_t sub_213BD4D38()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_213BD4D70()
{
  return objectdestroy_27Tm(&qword_2677FC468);
}

uint64_t sub_213BD4D7C()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2677FC468) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = v0 + v3;
  uint64_t v5 = *(void *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_213BC54C4;
  return sub_213BD3A50((uint64_t)v6, v7, v8, v4, v5);
}

uint64_t sub_213BD4E7C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_213BD4ECC(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 48);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_213BC61BC;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v4 + 40) = v6;
  void *v6 = v4;
  v6[1] = sub_213BD2B28;
  return sub_213BC8688();
}

uint64_t sub_213BD4FC0()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_213BD5000()
{
  uint64_t v2 = *(void *)(v0 + 32);
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *unint64_t v3 = v1;
  v3[1] = sub_213BC61BC;
  return sub_213BD253C((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_213BD5094()
{
  return objectdestroy_27Tm(&qword_2677FC4A0);
}

uint64_t objectdestroy_27Tm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 32) & ~v4;
  uint64_t v6 = v4 | 7;
  unint64_t v7 = ((*(void *)(v3 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  swift_release();

  return MEMORY[0x270FA0238](v1, v7, v6);
}

uint64_t sub_213BD5184()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2677FC4A0) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = v0 + v3;
  uint64_t v5 = *(void *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_213BC54C4;
  return sub_213BD2FF4((uint64_t)v6, v7, v8, v4, v5);
}

uint64_t sub_213BD5284(uint64_t result)
{
  if (result != 1) {
    return sub_213BD52A8(result);
  }
  return result;
}

uint64_t sub_213BD52A8(uint64_t result)
{
  if (result)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_213BD62F0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_213BD6300()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_213BD6310()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_213BD6320()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_213BD6330()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_213BD6340()
{
  return MEMORY[0x270F9D120]();
}

uint64_t sub_213BD6350()
{
  return MEMORY[0x270F9D168]();
}

uint64_t sub_213BD6360()
{
  return MEMORY[0x270F9D1C8]();
}

uint64_t sub_213BD6370()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_213BD6380()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_213BD6390()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_213BD63A0()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_213BD63B0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_213BD63C0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_213BD63D0()
{
  return MEMORY[0x270F9D948]();
}

uint64_t sub_213BD63E0()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_213BD63F0()
{
  return MEMORY[0x270F9DBE0]();
}

uint64_t sub_213BD6400()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_213BD6410()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_213BD6420()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_213BD6430()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_213BD6450()
{
  return MEMORY[0x270FA1E70]();
}

uint64_t sub_213BD6470()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_213BD6480()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_213BD6490()
{
  return MEMORY[0x270FA1F18]();
}

uint64_t sub_213BD64A0()
{
  return MEMORY[0x270FA1F28]();
}

uint64_t sub_213BD64B0()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t sub_213BD64C0()
{
  return MEMORY[0x270FA1F38]();
}

uint64_t sub_213BD64D0()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_213BD64E0()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_213BD64F0()
{
  return MEMORY[0x270FA1F58]();
}

uint64_t sub_213BD6500()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_213BD6520()
{
  return MEMORY[0x270FA1F78]();
}

uint64_t sub_213BD6530()
{
  return MEMORY[0x270FA1F88]();
}

uint64_t sub_213BD6550()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_213BD6570()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_213BD6580()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_213BD65A0()
{
  return MEMORY[0x270FA20B8]();
}

uint64_t sub_213BD65B0()
{
  return MEMORY[0x270FA20C8]();
}

uint64_t sub_213BD65C0()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_213BD65D0()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t sub_213BD65E0()
{
  return MEMORY[0x270FA20E8]();
}

uint64_t sub_213BD65F0()
{
  return MEMORY[0x270FA20F0]();
}

uint64_t sub_213BD6610()
{
  return MEMORY[0x270FA2108]();
}

uint64_t sub_213BD6620()
{
  return MEMORY[0x270FA2118]();
}

uint64_t sub_213BD6630()
{
  return MEMORY[0x270FA2120]();
}

uint64_t sub_213BD6640()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_213BD6650()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_213BD6660()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_213BD66A0()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_213BD66E0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_213BD66F0()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_213BD6700()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_213BD6710()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_213BD6730()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_213BD6740()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_213BD6750()
{
  return MEMORY[0x270F9FA60]();
}

uint64_t sub_213BD6760()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_213BD6780()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_213BD6790()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_213BD67A0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_213BD67B0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_213BD67C0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_213BD67D0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_213BD67E0()
{
  return MEMORY[0x270F9FC90]();
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

Boolean CFHTTPMessageAppendBytes(CFHTTPMessageRef message, const UInt8 *newBytes, CFIndex numBytes)
{
  return MEMORY[0x270EE2850](message, newBytes, numBytes);
}

CFDictionaryRef CFHTTPMessageCopyAllHeaderFields(CFHTTPMessageRef message)
{
  return (CFDictionaryRef)MEMORY[0x270EE2858](message);
}

CFDataRef CFHTTPMessageCopyBody(CFHTTPMessageRef message)
{
  return (CFDataRef)MEMORY[0x270EE2860](message);
}

CFStringRef CFHTTPMessageCopyRequestMethod(CFHTTPMessageRef request)
{
  return (CFStringRef)MEMORY[0x270EE2870](request);
}

CFURLRef CFHTTPMessageCopyRequestURL(CFHTTPMessageRef request)
{
  return (CFURLRef)MEMORY[0x270EE2878](request);
}

CFDataRef CFHTTPMessageCopySerializedMessage(CFHTTPMessageRef message)
{
  return (CFDataRef)MEMORY[0x270EE2880](message);
}

CFHTTPMessageRef CFHTTPMessageCreateEmpty(CFAllocatorRef alloc, Boolean isRequest)
{
  return (CFHTTPMessageRef)MEMORY[0x270EE2888](alloc, isRequest);
}

CFHTTPMessageRef CFHTTPMessageCreateRequest(CFAllocatorRef alloc, CFStringRef requestMethod, CFURLRef url, CFStringRef httpVersion)
{
  return (CFHTTPMessageRef)MEMORY[0x270EE2890](alloc, requestMethod, url, httpVersion);
}

CFHTTPMessageRef CFHTTPMessageCreateResponse(CFAllocatorRef alloc, CFIndex statusCode, CFStringRef statusDescription, CFStringRef httpVersion)
{
  return (CFHTTPMessageRef)MEMORY[0x270EE2898](alloc, statusCode, statusDescription, httpVersion);
}

Boolean CFHTTPMessageIsHeaderComplete(CFHTTPMessageRef message)
{
  return MEMORY[0x270EE28B0](message);
}

Boolean CFHTTPMessageIsRequest(CFHTTPMessageRef message)
{
  return MEMORY[0x270EE28B8](message);
}

void CFHTTPMessageSetBody(CFHTTPMessageRef message, CFDataRef bodyData)
{
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
}

CFTypeRef CFReadStreamCopyProperty(CFReadStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x270EE4D80](stream, propertyName);
}

void CFReadStreamSetDispatchQueue(CFReadStreamRef stream, dispatch_queue_t q)
{
}

uint64_t CFReadStreamSignalEvent()
{
  return MEMORY[0x270EE4DE8]();
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFWriteStreamSetDispatchQueue(CFWriteStreamRef stream, dispatch_queue_t q)
{
}

uint64_t CFWriteStreamSignalEvent()
{
  return MEMORY[0x270EE5580]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x270EF2C18](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x270F055F0](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x270F05620](target, flags);
}

Boolean SCNetworkReachabilityScheduleWithRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x270F05628](target, runLoop, runLoopMode);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x270F05630](target, callout, context);
}

Boolean SCNetworkReachabilityUnscheduleFromRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x270F05640](target, runLoop, runLoopMode);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x270EFDD60](trust, error);
}

OSStatus SecTrustGetTrustResult(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x270EFDD80](trust, result);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x270EFDDA8](trust, anchorCertificates);
}

OSStatus SecTrustSetAnchorCertificatesOnly(SecTrustRef trust, Boolean anchorCertificatesOnly)
{
  return MEMORY[0x270EFDDB8](trust, anchorCertificatesOnly);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x270EFDDE0](trust, policies);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
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

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED8478](*(void *)&a1, a2, a3);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8758](*(void *)&a1, a2, *(void *)&a3);
}

void bzero(void *a1, size_t a2)
{
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x270F9A438](cls, outCount);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x270F9A490](cls);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8F58](*(void *)&a1, a2, *(void *)&a3);
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
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x270ED9518](source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
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

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x270ED9580](source);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x270ED9B98](a1, a2, a3, a4);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED9CD0](*(void *)&a1, a2, a3);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED9D88](*(void *)&a1, a2, a3);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x270ED9EC0](*(void *)&a1, a2, a3, *(void *)&a4);
}

int listen(int a1, int a2)
{
  return MEMORY[0x270EDA078](*(void *)&a1, *(void *)&a2);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x270F9AA90](property);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x270F9AA98](property);
}

objc_property_t *__cdecl protocol_copyPropertyList(Protocol *proto, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x270F9AAB8](proto, outCount);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x270F9AAF8](str);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x270EDB440](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x270EDB5C0](__dst, __src);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return (char *)MEMORY[0x270EDB6C8](__str, __sep);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x270FA0390]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x270FA05E0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x270FA0600]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x270FA0608]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}