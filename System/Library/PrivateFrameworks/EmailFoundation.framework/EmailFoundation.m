uint64_t EFEncodeCacheableInstance(void *a1, void *a2, uint64_t a3)
{
  id AssociatedObject;
  NSObject *v7;

  if (objc_msgSend(a2, "ef_isNSXPCCoder"))
  {
    os_unfair_recursive_lock_lock_with_options();
    AssociatedObject = objc_getAssociatedObject(a1, @"EFCacheableInstanceID");
    if (!AssociatedObject)
    {
      if (EFEncodeCacheableInstance_onceToken != -1) {
        dispatch_once(&EFEncodeCacheableInstance_onceToken, &__block_literal_global_2);
      }
      AssociatedObject = (id)EFEncodeCacheableInstance_sInstanceID++;
      ++EFEncodeCacheableInstance_sInstanceCount;
      if (__ROR8__(0x5D4E8FB00BCBE61DLL * EFEncodeCacheableInstance_sInstanceCount + 0xA7C5AC471B460, 5) <= 0xA7C5AC471B46uLL)
      {
        if (_log_onceToken != -1) {
          dispatch_once(&_log_onceToken, &__block_literal_global_3);
        }
        v7 = _log_log;
        if (os_log_type_enabled((os_log_t)_log_log, OS_LOG_TYPE_DEBUG)) {
          EFEncodeCacheableInstance_cold_1(v7);
        }
      }
      objc_setAssociatedObject(a1, @"EFCacheableInstanceID", AssociatedObject, 0);
    }
    os_unfair_recursive_lock_unlock();
    [a2 encodeInt64:AssociatedObject forKey:@"EFCacheableInstanceID"];
  }
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

void sub_1B5A5BF50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5C0F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5C228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5C2E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5C488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5C60C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5C6F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5C854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5C8E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5C990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5CA20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5CAE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5CEF8(uint64_t a1)
{
  *(void *)(v3 - 112) = a1;

  _Unwind_Resume(*(_Unwind_Exception **)(v3 - 112));
}

void sub_1B5A5D3F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5D5DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5D698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5D78C(_Unwind_Exception *a1)
{
}

void sub_1B5A5D83C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5D94C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1B5A5DA3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5DC44(_Unwind_Exception *a1)
{
  objc_end_catch();

  _Unwind_Resume(a1);
}

uint64_t EFDecodeCacheableInstance(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = [a2 decodeInt64ForKey:@"EFCacheableInstanceID"];
  if (v4)
  {
    uint64_t v5 = v4;
    os_unfair_recursive_lock_lock_with_options();
    v6 = (void *)sInstanceCache;
    if (!sInstanceCache)
    {
      v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:514 valueOptions:5 capacity:15000];
      sInstanceCache = (uint64_t)v6;
    }
    uint64_t v7 = [v6 objectForKey:v5];
    if (!v7)
    {
      uint64_t v7 = [(id)(*(uint64_t (**)(uint64_t))(a3 + 16))(a3) cachedSelf];
      [(id)sInstanceCache setObject:v7 forKey:v5];
    }
    os_unfair_recursive_lock_unlock();
    return v7;
  }
  else
  {
    v9 = (void *)(*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
    return [v9 cachedSelf];
  }
}

uint64_t EFObjectsAreEqual(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  if (v3 | v4) {
    uint64_t v5 = [(id)v3 isEqual:v4];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

void sub_1B5A5DE4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5DEB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5DF10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5DFA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5E054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5E5C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

uint64_t EFSQLVerboseDebugLoggingEnabled()
{
  if (EFSQLVerboseDebugLoggingEnabled_onceToken != -1) {
    dispatch_once(&EFSQLVerboseDebugLoggingEnabled_onceToken, &__block_literal_global_31);
  }
  return EFSQLVerboseDebugLoggingEnabled_enabled;
}

void sub_1B5A5E898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5EE10(_Unwind_Exception *a1)
{
  v6 = v2;

  _Unwind_Resume(a1);
}

void sub_1B5A5EF90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5F064(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5F22C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5F2D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5F36C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5F51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5F748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5F84C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5F8E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5FB70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5FD84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5FE44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5FED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A5FF88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6008C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6011C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A60278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A602F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A603BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A60558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A60770(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6090C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EFSQLPreparedStatement;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

uint64_t EFSetsAreEqual(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  if (v3 | v4) {
    uint64_t v5 = [(id)v3 isEqualToSet:v4];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

void sub_1B5A60A40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A60B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A60BD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A60C70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1B5A60D24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A60DC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A60E2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A60EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A610CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __hashForDigest_block_invoke(uint64_t result, unsigned __int8 *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a4)
  {
    while (1)
    {
      unsigned int v5 = *a2++;
      *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) |= (unint64_t)v5 << (8
                                                                                                * *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24));
      uint64_t v6 = *(void *)(*(void *)(result + 40) + 8);
      uint64_t v7 = *(void *)(v6 + 24) + 1;
      *(void *)(v6 + 24) = v7;
      if (v7 == 8) {
        break;
      }
      if (!--a4) {
        return result;
      }
    }
    *a5 = 1;
  }
  return result;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t *__Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  return std::set<long long>::set[abi:ne180100]((uint64_t *)(a1 + 48), a2 + 48);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
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

unint64_t EFMurmurHash3Mix(unint64_t a1)
{
  int v2 = is32Bit();
  unint64_t v3 = 0xC4CEB9FE1A85EC53
     * ((0xFF51AFD7ED558CCDLL * (a1 ^ (a1 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (a1 ^ (a1 >> 33))) >> 33));
  unint64_t v4 = v3 ^ (v3 >> 33);
  unsigned int v5 = -1028477387 * ((-2048144789 * (a1 ^ WORD1(a1))) ^ ((-2048144789 * (a1 ^ WORD1(a1))) >> 13));
  uint64_t v6 = v5 ^ HIWORD(v5);
  if (v2) {
    return v6;
  }
  else {
    return v4;
  }
}

uint64_t is32Bit()
{
  if (is32Bit_onceToken != -1) {
    dispatch_once(&is32Bit_onceToken, &__block_literal_global_7);
  }
  if (!EFIsRunningUnitTests()) {
    return 0;
  }
  v0 = [MEMORY[0x1E4F29060] currentThread];
  v1 = [v0 threadDictionary];
  int v2 = [v1 objectForKeyedSubscript:@"EFHashing.UseMurmur3x86-32"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

void sub_1B5A6145C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t EFIsRunningUnitTests()
{
  if (EFIsRunningUnitTests_onceToken != -1) {
    dispatch_once(&EFIsRunningUnitTests_onceToken, &__block_literal_global_40);
  }
  return EFIsRunningUnitTests_result;
}

void sub_1B5A615AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A61648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A61764(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A618CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A61A28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A61D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A61E60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A61F58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6207C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A623FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A62580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6269C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A62700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A627BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6292C(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1B5A629BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A62A68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A62C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B5A62CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A62E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A62E90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A63030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A631B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6330C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A634C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A635B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1B5A63690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6370C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A63820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1B5A63954(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A639EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A63A84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A63C78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A63D84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A63DF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A63E7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A63FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6409C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A64140(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A641B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A643D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);

  _Unwind_Resume(a1);
}

void sub_1B5A64590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A64694(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A647EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A649F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _EFLocalizedString(void *a1, dispatch_once_t *a2, id *a3)
{
  uint64_t v3 = _EFLocalizedStringFromTable(a1, a2, a3, 0);

  return v3;
}

id _EFLocalizedStringFromTable(void *a1, dispatch_once_t *a2, id *a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___EFLocalizedStringFromTable_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  if (*a2 != -1) {
    dispatch_once(a2, block);
  }
  uint64_t v9 = [*a3 localizedStringForKey:v7 value:0 table:v8];

  return v9;
}

void sub_1B5A64BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A64C54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A64EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, id a20)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a20);

  _Unwind_Resume(a1);
}

void sub_1B5A650A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

id EFLogRegisterStateCaptureBlock(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a4;
  v10 = v9;
  if (!v7 || !v9)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = objc_msgSend(NSString, "stringWithUTF8String:", "id<EFCancelable>  _Nonnull EFLogRegisterStateCaptureBlock(__strong dispatch_queue_t _Nonnull, NSString *__strong _Nonnull, EFLogStateType, __strong EFLogStateCaptureBlock _Nonnull)");
    [v16 handleFailureInFunction:v17 file:@"EFLogging.m" lineNumber:42 description:@"No dispatch queue or 'state capture block' can be found. Please check previous logging"];
  }
  v18[5] = MEMORY[0x1E4F143A8];
  v18[6] = 3221225472;
  v18[7] = __EFLogRegisterStateCaptureBlock_block_invoke;
  v18[8] = &unk_1E6122338;
  uint64_t v21 = a3;
  id v11 = v10;
  id v20 = v11;
  id v12 = v8;
  id v19 = v12;
  uint64_t v13 = os_state_add_handler();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __EFLogRegisterStateCaptureBlock_block_invoke_14;
  v18[3] = &__block_descriptor_40_e5_v8__0l;
  v18[4] = v13;
  v14 = +[EFCancelationToken tokenWithCancelationBlock:v18];

  return v14;
}

void sub_1B5A6528C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A65450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6559C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A657EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,void *a29,void *a30)
{
  _Unwind_Resume(a1);
}

void sub_1B5A65C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25)
{
  _Unwind_Resume(a1);
}

void sub_1B5A65EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1B5A65F38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6600C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A660BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A66204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6638C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_1B5A66478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A66540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6660C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A666C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A66838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A668C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A66948(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A669F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A66AB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A66B44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A66BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A66C44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A66D34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A67024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location,char a34)
{
  objc_destroyWeak(v37);
  objc_destroyWeak(v36);

  objc_destroyWeak(&location);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v39 - 176), 8);

  _Block_object_dispose((const void *)(v39 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B5A6716C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A671FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A673E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25)
{
  v29 = v27;

  _Unwind_Resume(a1);
}

void sub_1B5A675F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  v27 = v25;

  _Unwind_Resume(a1);
}

void sub_1B5A678F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_1B5A67A6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A67AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id EFAtomicObjectLoad(unint64_t *a1)
{
  v1 = (void *)atomic_load(a1);
  return v1;
}

void sub_1B5A67BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A67C94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A67DC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A67EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1B5A67F74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A68010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A68090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6817C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A68234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A68498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1B5A68574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A687CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A688A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A68970(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A68A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A68BBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A68C2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A68DA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A68ED4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A68F44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A68FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A69078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A69104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A69284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A69308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A693B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A69434(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B5A694D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A69588(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A696EC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B5A697F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A69894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A699D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A69B60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A69C80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A69D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A69F74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6A72C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,_Unwind_Exception *exception_object,uint64_t a22,void *a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6AA8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6AB1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6AC00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6AE48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6B024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6B1BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6B314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6B460(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6B598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6B630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6B6B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6B7D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *describableObjectForExpression(void *a1)
{
  id v1 = a1;
  int v2 = @"<evaluated object>";
  switch([v1 expressionType])
  {
    case 0:
      uint64_t v3 = [v1 constantValue];
      if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          int v2 = @"<constant>";
          goto LABEL_6;
        }
        unint64_t v4 = +[EFPrivacy fullyRedactedStringForString:v3];
      }
      else
      {
        unint64_t v4 = (__CFString *)v1;
      }
      int v2 = v4;
LABEL_6:

      goto LABEL_18;
    case 2:
      int v2 = @"<variable>";
      goto LABEL_18;
    case 3:
      int v2 = (__CFString *)v1;
      goto LABEL_18;
    case 4:
      int v2 = @"<function>";
      goto LABEL_18;
    case 5:
      int v2 = @"<union set>";
      goto LABEL_18;
    case 6:
      int v2 = @"<intersect set>";
      goto LABEL_18;
    case 7:
      int v2 = @"<minus set>";
      goto LABEL_18;
    case 13:
      int v2 = @"<subquery>";
      goto LABEL_18;
    case 14:
      int v2 = @"<aggregate>";
      goto LABEL_18;
    case 15:
      int v2 = @"<any key>";
      goto LABEL_18;
    case 19:
      int v2 = @"<block>";
      goto LABEL_18;
    case 20:
      int v2 = @"<conditional>";
      goto LABEL_18;
    default:
LABEL_18:

      return v2;
  }
}

void sub_1B5A6B990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6BB44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6BEB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6C00C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6C0C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6C218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6C6BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6C788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6C83C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6C8D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6C958(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6C9F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6CAE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6CB80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL EFProtectedDataAvailable()
{
  if (_InitObservation_sOnceToken != -1) {
    dispatch_once(&_InitObservation_sOnceToken, &__block_literal_global_81);
  }
  return sContentProtectionState == 3 || sContentProtectionState == 0;
}

void sub_1B5A6CCDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6CDC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6CE54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *EFStringWithInt64(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v1 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__str = v1;
  long long v6 = v1;
  int v2 = snprintf(__str, 0x20uLL, "%lld", a1);
  uint64_t v3 = (__CFString *)CFStringCreateWithBytes(0, (const UInt8 *)__str, v2, 0x600u, 0);

  return v3;
}

void sub_1B5A6CF84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6D0E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6D1D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6D248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6D2AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6D330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t EFArraysAreEqual(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  if (v3 | v4) {
    uint64_t v5 = [(id)v3 isEqualToArray:v4];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

void sub_1B5A6D3B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6D5B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6D6B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, void *a11)
{
}

void std::__tree<long long>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<long long>::destroy(a1, *a2);
    std::__tree<long long>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void sub_1B5A6D794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t **std::__tree<long long>::__assign_multi<std::__tree_const_iterator<long long,std::__tree_node<long long,void *> *,long>>(uint64_t **result, void *a2, void *a3)
{
  uint64_t v5 = result;
  if (result[2])
  {
    long long v6 = *result;
    uint64_t v7 = result[1];
    *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1]) {
      id v8 = (uint64_t *)v6[1];
    }
    else {
      id v8 = v6;
    }
    v14 = result;
    v15 = v8;
    v16 = v8;
    if (v8)
    {
      v15 = std::__tree<long long>::_DetachedTreeCache::__detach_next((uint64_t)v8);
      if (a2 != a3)
      {
        id v9 = a2;
        do
        {
          v8[4] = v9[4];
          std::__tree<long long>::__node_insert_multi(v5, v8);
          id v8 = v15;
          v16 = v15;
          if (v15) {
            v15 = std::__tree<long long>::_DetachedTreeCache::__detach_next((uint64_t)v15);
          }
          v10 = (void *)v9[1];
          if (v10)
          {
            do
            {
              a2 = v10;
              v10 = (void *)*v10;
            }
            while (v10);
          }
          else
          {
            do
            {
              a2 = (void *)v9[2];
              BOOL v11 = *a2 == (void)v9;
              id v9 = a2;
            }
            while (!v11);
          }
          if (!v8) {
            break;
          }
          id v9 = a2;
        }
        while (a2 != a3);
      }
    }
    result = (uint64_t **)std::__tree<long long>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v14);
  }
  if (a2 != a3)
  {
    do
    {
      result = (uint64_t **)std::__tree<long long>::__emplace_multi<long long const&>(v5, a2 + 4);
      id v12 = (void *)a2[1];
      if (v12)
      {
        do
        {
          uint64_t v13 = v12;
          id v12 = (void *)*v12;
        }
        while (v12);
      }
      else
      {
        do
        {
          uint64_t v13 = (void *)a2[2];
          BOOL v11 = *v13 == (void)a2;
          a2 = v13;
        }
        while (!v11);
      }
      a2 = v13;
    }
    while (v13 != a3);
  }
  return result;
}

void sub_1B5A6D8F4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__tree<long long>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1B5A6DA84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6DB60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6DBFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id EFAtomicObjectSetIfNil(atomic_ullong *a1, void *a2)
{
  int v2 = EFAtomicObjectSetIfIdentical(a1, 0, a2);

  return v2;
}

id EFAtomicObjectSetIfIdentical(atomic_ullong *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = objc_msgSend(NSString, "stringWithUTF8String:", "id<NSObject>  _Nullable EFAtomicObjectSetIfIdentical(EFAtomicObject * _Nonnull, id<NSObject>  _Nullable __strong, __strong id<NSObject> _Nonnull)");
    [v13 handleFailureInFunction:v14, @"EFAtomicObject.m", 22, @"Invalid parameter not satisfying: %@", @"newObject != nil" file lineNumber description];
  }
  id v7 = v6;
  id v8 = v7;
  id v9 = v5;
  atomic_compare_exchange_strong(a1, (unint64_t *)&v9, (unint64_t)v7);
  v10 = v5;
  id v11 = v7;
  if (v9 != v5)
  {
    CFRelease(v7);
    v15 = (void *)atomic_load((unint64_t *)a1);
    id v11 = v15;
    v10 = v8;
  }

  return v11;
}

void sub_1B5A6DD58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6DEA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL EFIsNotNull_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CA98] null];
    BOOL v4 = v3 != v2;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

void sub_1B5A6DF58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6E054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6E27C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6E33C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6E3A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6E438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6E4B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6E538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6E680(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6E738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EFLazyCache;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1B5A6E81C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6E8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6E96C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6EA80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6EBE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6ED08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6EEC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6EF74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6F008(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B5A6F0CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6F294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6F320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  v10 = v9;

  a9.super_class = (Class)EFListStateCapturer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1B5A6F40C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6F468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)_EFKeyValueObserverHandler;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1B5A6F4E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EFDeallocInvocationToken;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1B5A6F5E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6F720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6F8DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6FA70(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);

  _Unwind_Resume(a1);
}

void sub_1B5A6FB0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6FC4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  objc_destroyWeak(v15);
  _Unwind_Resume(a1);
}

void sub_1B5A6FCDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6FDD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6FEB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A6FF90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1B5A70028(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B5A7009C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A70234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A702CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t __EFLogRegisterStateCaptureBlock_block_invoke_14(uint64_t a1)
{
  return MEMORY[0x1F40CD578](*(void *)(a1 + 32));
}

void sub_1B5A70370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A70400(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A704A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A70644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A707E8(_Unwind_Exception *a1)
{
  id v9 = v8;

  _Unwind_Resume(a1);
}

void sub_1B5A708B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A70940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A70A1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A70D60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A70F0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A70FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A710B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5A71190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5A71288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1B5A712FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A71384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A71444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A71504(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A715E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A71678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A717E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A71878(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A71AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1B5A71BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A71C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A71D4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A71ECC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&trampolineWithScheduler_object__sTrampolineLock);

  _Unwind_Resume(a1);
}

void sub_1B5A71FF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A72068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A72184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A72508(uint64_t a1)
{
  *(void *)(v3 - 112) = a1;

  _Unwind_Resume(*(_Unwind_Exception **)(v3 - 112));
}

void sub_1B5A72638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A726A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7271C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A72820(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __EFRegisterContentProtectionObserver_block_invoke(uint64_t a1)
{
  value = [[_EFContentProtectionObserverWrapper alloc] initWithObserver:*(void *)(a1 + 32) queue:*(void *)(a1 + 40)];
  Mutable = (__CFDictionary *)_observers;
  if (!_observers)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
    _observers = (uint64_t)Mutable;
  }
  CFDictionaryAddValue(Mutable, *(const void **)(a1 + 32), value);
}

void sub_1B5A72914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A729B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A72A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A72AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A72BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A72C50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A72F54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A730F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

void sub_1B5A731D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A73298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *EFSQLStringForConflictResolution(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 3) {
    return @"ABORT";
  }
  else {
    return off_1E61231A8[a1 - 2];
  }
}

void sub_1B5A73454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void sub_1B5A735E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A736FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7389C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A739A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A73B30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void EFRegisterContentProtectionObserver(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (!v3)
  {
    id v8 = "nil != observer";
    int v9 = 247;
    goto LABEL_8;
  }
  if (!v4)
  {
    id v8 = "NULL != queue";
    int v9 = 248;
    goto LABEL_8;
  }
  if ((id)_observationQueue == v4)
  {
    id v8 = "_observationQueue != queue";
    int v9 = 249;
LABEL_8:
    __assert_rtn("EFRegisterContentProtectionObserver", "EFContentProtectionObserver.m", v9, v8);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __EFRegisterContentProtectionObserver_block_invoke;
  v10[3] = &unk_1E6121B90;
  id v6 = v3;
  id v11 = v6;
  id v7 = v5;
  id v12 = v7;
  _InitAndPerformSync(v10);
}

void sub_1B5A73D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void _InitAndPerformSync(void *a1)
{
  uint64_t v1 = _InitObservation_sOnceToken;
  id v2 = a1;
  id v4 = v2;
  if (v1 == -1)
  {
    id v3 = v2;
  }
  else
  {
    dispatch_once(&_InitObservation_sOnceToken, &__block_literal_global_81);
    id v3 = v4;
  }
  dispatch_sync((dispatch_queue_t)_observationQueue, v3);
}

void sub_1B5A73E00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A73E8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A73F18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A73FBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A74170(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B5A7435C(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

BOOL EFIsNull_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CA98] null];
    BOOL v4 = v3 == v2;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

void sub_1B5A74404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ef_xpc_activity_register(const char *a1, void *a2, void *a3)
{
}

void sub_1B5A745B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7469C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7478C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EFStoppableScheduler;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

id EFAtomicObjectRelease(unint64_t *a1)
{
  do
  {
    id v2 = (void *)atomic_load(a1);
    id v3 = v2;
    atomic_compare_exchange_strong((atomic_ullong *volatile)a1, (unint64_t *)&v3, 0);
  }
  while (v3 != v2);
  return v2;
}

void sub_1B5A74868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<long long>::__emplace_unique_key_args<long long,long long const&>(uint64_t **a1, uint64_t *a2, uint64_t *a3)
{
  id v6 = a1 + 1;
  id v5 = a1[1];
  if (v5)
  {
    uint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        id v8 = (uint64_t **)v5;
        uint64_t v9 = v5[4];
        if (v7 >= v9) {
          break;
        }
        id v5 = *v8;
        id v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      id v5 = v8[1];
      if (!v5)
      {
        id v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    id v8 = a1 + 1;
LABEL_10:
    v10 = (uint64_t *)operator new(0x28uLL);
    void v10[4] = *a3;
    std::__tree<long long>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

uint64_t *std::__tree<long long>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  id v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      id v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      id v3 = (uint64_t *)v2[2];
      BOOL v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), id v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            uint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            uint64_t v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              id v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            void *v9 = v2;
            v2[2] = (uint64_t)v9;
            id v3 = v9[2];
            id v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), id v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            id v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          id v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        id v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

BOOL EFDeviceUnlockedSinceBoot()
{
  return MKBDeviceUnlockedSinceBoot() != 0;
}

void sub_1B5A74C18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *EFStringWithInt(int a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v1 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__str = v1;
  long long v6 = v1;
  int v2 = snprintf(__str, 0x20uLL, "%d", a1);
  id v3 = (__CFString *)CFStringCreateWithBytes(0, (const UInt8 *)__str, v2, 0x600u, 0);

  return v3;
}

void sub_1B5A74DC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __EFEncodeCacheableInstance_block_invoke()
{
  uint64_t result = getpid();
  EFEncodeCacheableInstance_sInstanceID = (unint64_t)__rbit32(result) << 32;
  return result;
}

void sub_1B5A74FD8(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

id EFSystemBuildVersion()
{
  if (sSystemVersionsOnce != -1) {
    dispatch_once(&sSystemVersionsOnce, &__block_literal_global_41);
  }
  v0 = (void *)sBuildVersion;

  return v0;
}

void sub_1B5A75178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A75210(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A75280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __activityLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "XPCActivity");
  long long v1 = (void *)activityLog_log;
  activityLog_log = (uint64_t)v0;
}

void sub_1B5A7564C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A757C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A75870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A75928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t EFIsSeedBuild()
{
  os_log_t v0 = (void *)MGCopyAnswer();
  uint64_t v1 = [v0 isEqual:@"Beta"];

  return v1;
}

void sub_1B5A75984(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A75AAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void EFContentProtectionValidateObservedStateIsUnlocked()
{
  if (_InitObservation_sOnceToken != -1) {
    dispatch_once(&_InitObservation_sOnceToken, &__block_literal_global_81);
  }
  if ((unint64_t)(sContentProtectionState - 1) <= 1 && !_KeyBagLockState())
  {
    os_log_t v0 = _observationQueue;
    dispatch_sync(v0, &__block_literal_global_54);
  }
}

void sub_1B5A75D08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _Log()
{
  if (_Log_onceToken != -1) {
    dispatch_once(&_Log_onceToken, &__block_literal_global_96);
  }
  os_log_t v0 = (void *)_Log_log;

  return v0;
}

id _Log_0()
{
  if (_Log_onceToken_0 != -1) {
    dispatch_once(&_Log_onceToken_0, &__block_literal_global_4);
  }
  os_log_t v0 = (void *)_Log_log_0;

  return v0;
}

uint64_t _KeyBagLockState()
{
  LODWORD(result) = MKBGetDeviceLockState();
  if (result >= 4) {
    return -1;
  }
  else {
    return result;
  }
}

void __EFIsRunningUnitTests_block_invoke()
{
  if (NSClassFromString(&cfstr_Xctestcase.isa))
  {
    id v0 = [MEMORY[0x1E4F28B50] allBundles];
    EFIsRunningUnitTests_uint64_t result = objc_msgSend(v0, "ef_any:", &__block_literal_global_4_2);
  }
}

void sub_1B5A75F7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A76014(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A76140(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B5A76208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t EFNonContainerizedHomeDirectory()
{
  uid_t v0 = geteuid();
  if (!v0) {
    uid_t v0 = getuid();
  }
  uint64_t v1 = getpwuid(v0);
  if (!v1 || (pw_dir = v1->pw_dir) == 0)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v4 = [NSString stringWithUTF8String:"NSURL * _Nonnull EFNonContainerizedHomeDirectory(void)"];
    [v3 handleFailureInFunction:v4 file:@"EFPathUtilities.m" lineNumber:33 description:@"Couldn't get non-containerized home directory"];

    pw_dir = 0;
  }
  id v5 = (void *)MEMORY[0x1E4F1CB10];

  return [v5 fileURLWithFileSystemRepresentation:pw_dir isDirectory:1 relativeToURL:0];
}

void sub_1B5A76390(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A76470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id EFBundleIdentifierForXPCConnection(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1F4188790](a1);
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = v1;
  id v3 = v2;
  if (!v2)
  {
    uint64_t v7 = 0;
    goto LABEL_25;
  }
  BOOL v4 = [v2 valueForEntitlement:@"application-identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 rangeOfString:@"."] == 10 && v5 + 10 < (unint64_t)objc_msgSend(v4, "length"))
    {
      id v6 = [v4 substringFromIndex:11];
    }
    else
    {
      id v6 = v4;
    }
    uint64_t v7 = v6;
    goto LABEL_24;
  }
  int v8 = [v3 processIdentifier];
  if (getpid() != v8
    || ([MEMORY[0x1E4F28B50] mainBundle], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (getpid() == v8)
    {
      v10 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v11 = v10;
      if (v10)
      {
        id v12 = [v10 bundleURL];

        goto LABEL_20;
      }
    }
    memset(__b, 170, sizeof(__b));
    if (!proc_pidpath(v8, __b, 0x1000u)) {
      goto LABEL_22;
    }
    uint64_t v9 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:__b isDirectory:0 relativeToURL:0];
    if (v9)
    {
      uint64_t v13 = (void *)_CFBundleCopyBundleURLForExecutableURL();
      v14 = [v13 pathExtension];
      uint64_t v15 = [v14 length];

      if (v15) {
        v16 = v13;
      }
      else {
        v16 = v9;
      }
      id v12 = v16;

LABEL_20:
      if (v12)
      {
        uint64_t v9 = [MEMORY[0x1E4F28B50] bundleWithURL:v12];

        goto LABEL_23;
      }
LABEL_22:
      uint64_t v9 = 0;
    }
  }
LABEL_23:
  uint64_t v7 = [v9 bundleIdentifier];

LABEL_24:
LABEL_25:

  return v7;
}

void sub_1B5A766F0(_Unwind_Exception *a1)
{
  id v6 = v3;

  _Unwind_Resume(a1);
}

void sub_1B5A76920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A76A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void ___ef_xpc_activity_register_block_invoke(uint64_t a1, void *a2)
{
  *(void *)&v17[5] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  int v5 = state;
  if (!state)
  {
    int v8 = activityLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      int v16 = 136446210;
      *(void *)v17 = v9;
      _os_log_impl(&dword_1B5A59000, v8, OS_LOG_TYPE_INFO, "Check in '%{public}s'", (uint8_t *)&v16, 0xCu);
    }

    v10 = (void (**)(id, xpc_object_t))*(id *)(a1 + 32);
    uint64_t v11 = v3;
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    v10[2](v10, v12);
    xpc_object_t v13 = xpc_activity_copy_criteria(v11);
    v14 = v13;
    if (!v13 || !xpc_equal(v13, v12)) {
      xpc_activity_set_criteria(v11, v12);
    }

    goto LABEL_14;
  }
  if (state != 2)
  {
    activityLog();
    v10 = (void (**)(id, xpc_object_t))objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 48);
      int v16 = 67109378;
      v17[0] = v5;
      LOWORD(v17[1]) = 2082;
      *(void *)((char *)&v17[1] + 2) = v15;
      _os_log_impl(&dword_1B5A59000, (os_log_t)v10, OS_LOG_TYPE_INFO, "Unexpected state %u for '%{public}s'", (uint8_t *)&v16, 0x12u);
    }
LABEL_14:

    goto LABEL_15;
  }
  id v6 = activityLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    int v16 = 136446210;
    *(void *)v17 = v7;
    _os_log_impl(&dword_1B5A59000, v6, OS_LOG_TYPE_INFO, "Run '%{public}s'", (uint8_t *)&v16, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_15:
}

void sub_1B5A76CC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id activityLog()
{
  if (activityLog_onceToken != -1) {
    dispatch_once(&activityLog_onceToken, &__block_literal_global_42);
  }
  uid_t v0 = (void *)activityLog_log;

  return v0;
}

void _ef_xpc_activity_register(const char *a1, int a2, void *a3, void *a4)
{
  uint64_t v7 = a3;
  id v8 = a4;
  if (a2)
  {
    xpc_object_t v9 = (id)*MEMORY[0x1E4F14158];
  }
  else
  {
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    v7[2](v7, v9);
  }
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = ___ef_xpc_activity_register_block_invoke;
  handler[3] = &unk_1E6123928;
  uint64_t v15 = a1;
  v10 = v7;
  xpc_object_t v13 = v10;
  id v11 = v8;
  id v14 = v11;
  xpc_activity_register(a1, v9, handler);
}

void sub_1B5A76E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1B5A77048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A77148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A77208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A772D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A77470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B5A77638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  v25 = v24;
  objc_destroyWeak(v25);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);

  _Unwind_Resume(a1);
}

void sub_1B5A77744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7780C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A77ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

id _ef_log_EFObservable()
{
  if (_ef_log_EFObservable_onceToken != -1) {
    dispatch_once(&_ef_log_EFObservable_onceToken, &__block_literal_global);
  }
  uid_t v0 = (void *)_ef_log_EFObservable_log;

  return v0;
}

void sub_1B5A77D28(_Unwind_Exception *a1)
{
  BOOL v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B5A77DB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A77F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1B5A78150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29)
{
  _Unwind_Resume(a1);
}

void sub_1B5A78278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A78350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A784F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7859C(_Unwind_Exception *a1)
{
  BOOL v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B5A78654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A78738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A788E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  int v16 = v14;

  _Unwind_Resume(a1);
}

void sub_1B5A78968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A789EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A78B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A78CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_1B5A78E34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A791BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,void *a36,void *a37)
{
  _Block_object_dispose((const void *)(v42 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B5A792AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7953C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B5A796D8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);

  _Unwind_Resume(a1);
}

void sub_1B5A79828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7990C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A79B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A79C24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A79D84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A79EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7A070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7A1C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7A6AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,void *a32,void *a33,void *a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,void *a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *a49)
{
  _Block_object_dispose((const void *)(v52 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B5A7A7A0()
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1B5A7A81C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7A8B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7AA00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id EFAtomicObjectReleaseIfIdentical(atomic_ullong *a1, void *a2)
{
  id v2 = a2;
  atomic_compare_exchange_strong(a1, (unint64_t *)&v2, 0);
  if (v2 == a2) {
    return a2;
  }
  else {
    return 0;
  }
}

void EFAtomicSetOnceObjectRelease(atomic_ullong *a1)
{
}

id EFAtomicSetOnceObjectLoad(atomic_ullong *a1, void *a2)
{
  id v3 = a2;
  explicit = (void *)atomic_load_explicit(a1, memory_order_acquire);
  id v5 = explicit;
  if (explicit)
  {
    id v6 = v5;
  }
  else
  {
    id v8 = v3[2](v3);
    if (v8)
    {
      id v9 = v8;
      id v6 = v9;
      v10 = 0;
      atomic_compare_exchange_strong(a1, (unint64_t *)&v10, (unint64_t)v9);
      if (v10)
      {

        id v11 = v10;
        id v6 = v11;
      }
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

void sub_1B5A7AB78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7AC98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7ADB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7AF78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7B048(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7B0D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7B3D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void addStringToIndexes(void *a1, void *a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9 = a2;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __addStringToIndexes_block_invoke;
  v11[3] = &unk_1E6121D68;
  id v12 = v9;
  id v10 = v9;
  addValueToIndexesWithBlock(a1, a3, a4, a5, v11);
}

void sub_1B5A7B4EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void addDataToIndexes(void *a1, void *a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9 = a2;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __addDataToIndexes_block_invoke;
  v11[3] = &unk_1E6121D68;
  id v12 = v9;
  id v10 = v9;
  addValueToIndexesWithBlock(a1, a3, a4, a5, v11);
}

void sub_1B5A7B5C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7B7A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7BB2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id bestBloomFilterCandidate(void *a1, void *a2, unint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v29 = a1;
  id v30 = a2;
  uint64_t v8 = 0;
  id v33 = 0;
  id v34 = 0;
  do
  {
    uint64_t v31 = v8;
    context = (void *)MEMORY[0x1BA9A5240]();
    uint64_t v9 = arc4random();
    uint32_t v10 = arc4random();
    id v28 = v29;
    id v11 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v12 = v28;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v41 count:16];
    uint64_t v14 = v10 | (unint64_t)(v9 << 32);
    if (v13)
    {
      uint64_t v15 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            addStringToIndexes(v11, v17, a3, a4, v14);
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              addDataToIndexes(v11, v17, a3, a4, v14);
            }
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v13);
    }

    id v18 = [[EFBloomFilter alloc] _initWithBucketCount:a3 hashFunctionCount:a4 seed:v14 indexes:v11];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __bestBloomFilterCandidate_block_invoke;
    v35[3] = &unk_1E6121D90;
    id v19 = v18;
    id v36 = v19;
    id v20 = objc_msgSend(v30, "ef_filter:", v35);
    unint64_t v21 = [v20 count];
    if (v34 && v21 >= [v33 count]) {
      goto LABEL_17;
    }
    id v22 = v19;

    id v23 = v20;
    if (v21)
    {
      id v33 = v23;
      id v34 = v22;
LABEL_17:
      char v24 = 0;
      goto LABEL_19;
    }
    char v24 = 1;
    id v33 = v23;
    id v34 = v22;
LABEL_19:

    uint64_t v8 = v31 + 1;
    if (v31 == 9) {
      char v25 = 1;
    }
    else {
      char v25 = v24;
    }
  }
  while ((v25 & 1) == 0);
  if (a5) {
    *a5 = v33;
  }

  return v34;
}

void sub_1B5A7BEBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7C2AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7C500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 80), 8);

  _Unwind_Resume(a1);
}

void sub_1B5A7C600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t checkValueWithBlock(void *a1, void *a2)
{
  id v3 = a1;
  BOOL v4 = a2;
  unint64_t v5 = [v3 bucketCount];
  uint64_t v6 = [v3 seed];
  uint64_t v7 = [v3 hashFunctionCount];
  if (v7)
  {
    while (1)
    {
      uint64_t v8 = v7 ^ v6;
      unint64_t v14 = 0;
      uint64_t v9 = v7 - 1;
      if (v7 == 1)
      {
        v4[2](v4, v8, &v14, 0);
        uint64_t v9 = 1;
      }
      else
      {
        unint64_t v13 = 0;
        ((void (**)(id, uint64_t, unint64_t *, unint64_t *))v4)[2](v4, v8, &v14, &v13);
        if (([v3[1] containsIndex:v13 % v5] & 1) == 0)
        {
          uint64_t v10 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v10 = [v3[1] containsIndex:v14 % v5];
      uint64_t v7 = v9 - 1;
      if (v9 == 1) {
        char v11 = 0;
      }
      else {
        char v11 = v10;
      }
      if ((v11 & 1) == 0) {
        goto LABEL_12;
      }
    }
  }
  uint64_t v10 = 1;
LABEL_12:

  return v10;
}

void sub_1B5A7C72C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7C81C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7CA48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7CAE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7CB88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7CC38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7CCD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7CD6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void addValueToIndexesWithBlock(void *a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a1;
  for (uint64_t i = a5; a3; a3 = v12 - 1)
  {
    uint64_t v11 = a3 ^ a4;
    unint64_t v14 = 0;
    uint64_t v12 = a3 - 1;
    if (v12)
    {
      unint64_t v13 = 0;
      i[2](i, v11, &v14, &v13);
      [v9 addIndex:v13 % a2];
    }
    else
    {
      i[2](i, v11, &v14, 0);
      uint64_t v12 = 1;
    }
    [v9 addIndex:v14 % a2];
  }
}

void sub_1B5A7CE60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t __addStringToIndexes_block_invoke(uint64_t a1, uint64_t a2, unint64_t *a3, void *a4)
{
  unint64_t result = EFMurmurHash3String(*(void **)(a1 + 32), a2, a4);
  *a3 = result;
  return result;
}

unint64_t __addDataToIndexes_block_invoke(uint64_t a1, uint64_t a2, unint64_t *a3, void *a4)
{
  unint64_t result = EFMurmurHash3Data(*(void **)(a1 + 32), a2, a4);
  *a3 = result;
  return result;
}

uint64_t __bestBloomFilterCandidate_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [*(id *)(a1 + 32) mayContainString:v3];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = 0;
      goto LABEL_7;
    }
    uint64_t v4 = [*(id *)(a1 + 32) mayContainData:v3];
  }
  uint64_t v5 = v4;
LABEL_7:

  return v5;
}

void sub_1B5A7CF68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __appendIndexesToData_block_invoke(uint64_t result, unint64_t a2)
{
  char v2 = a2;
  uint64_t v3 = result;
  unint64_t v4 = a2 >> 6;
  if (a2 >> 6 != *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v5 = *(void *)(*(void *)(result + 48) + 8);
    uint64_t v6 = *(void *)(v5 + 24);
    if (*(unsigned char *)(result + 56)) {
      uint64_t v6 = *(void *)(v5 + 24);
    }
    *(void *)(v5 + 24) = v6;
    unint64_t result = [*(id *)(result + 32) appendBytes:*(void *)(*(void *)(result + 48) + 8) + 24 length:8];
    *(void *)(*(void *)(*(void *)(v3 + 48) + 8) + 24) = 0;
    while (++*(void *)(*(void *)(*(void *)(v3 + 40) + 8) + 24) < v4)
      unint64_t result = [*(id *)(v3 + 32) appendBytes:*(void *)(*(void *)(v3 + 48) + 8) + 24 length:8];
  }
  *(void *)(*(void *)(*(void *)(v3 + 48) + 8) + 24) |= 1 << v2;
  return result;
}

void sub_1B5A7D20C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7D448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7D614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7D710(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E6121900, MEMORY[0x1E4FBA1D0]);
}

void sub_1B5A7D784(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  unint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D8] + 16);
  return result;
}

os_log_t ___log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.email", "cacheable");
  _log_log = (uint64_t)result;
  return result;
}

void sub_1B5A7D878(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7D8E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EFAutoCancelationToken;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1B5A7DAC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7DB38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7DCC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t EFDataAreEqual(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  if (v3 | v4) {
    uint64_t v5 = [(id)v3 isEqualToData:v4];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

void sub_1B5A7DD98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t EFStringsAreEqual(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  if (v3 | v4) {
    uint64_t v5 = [(id)v3 isEqualToString:v4];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

void sub_1B5A7DE10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t EFAttributedStringsAreEqual(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  if (v3 | v4) {
    uint64_t v5 = [(id)v3 isEqualToAttributedString:v4];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

void sub_1B5A7DE88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t EFDictionarysAreEqual(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  if (v3 | v4) {
    uint64_t v5 = [(id)v3 isEqualToDictionary:v4];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

void sub_1B5A7DF00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t EFNumbersAreEqual(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  uint64_t v5 = (v3 | v4) == 0;
  if (v4) {
    uint64_t v5 = [(id)v3 isEqualToNumber:v4];
  }

  return v5;
}

void sub_1B5A7DF78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *EFContentProtectionStateDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 4) {
    return @"unknown";
  }
  else {
    return off_1E6121ED0[a1 + 1];
  }
}

id _DiagnosticStateDictionary()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v1 = v0;
  if ((unint64_t)(sContentProtectionState + 1) > 4) {
    char v2 = @"unknown";
  }
  else {
    char v2 = off_1E6121ED0[sContentProtectionState + 1];
  }
  [v0 setObject:v2 forKeyedSubscript:@"Recorded state"];
  unint64_t v3 = _KeyBagLockState() + 1;
  if (v3 > 4) {
    unint64_t v4 = @"unknown";
  }
  else {
    unint64_t v4 = off_1E6121ED0[v3];
  }
  [v1 setObject:v4 forKeyedSubscript:@"System state"];
  MKBDeviceUnlockedSinceBoot();
  uint64_t v5 = NSStringFromBOOL();
  [v1 setObject:v5 forKeyedSubscript:@"Unlocked since boot"];

  id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v6 setTimeStyle:3];
  [v6 setDateStyle:2];
  if (*(double *)&_lastNotificationTime == 0.0)
  {
    uint64_t v8 = @"never";
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*(double *)&_lastNotificationTime];
    uint64_t v8 = [v6 stringFromDate:v7];
  }
  if (*(double *)&_beganObservingTime == 0.0)
  {
    uint64_t v10 = @"never";
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*(double *)&_beganObservingTime];
    uint64_t v10 = [v6 stringFromDate:v9];
  }
  [v1 setObject:v8 forKeyedSubscript:@"Last lock_status notification"];
  [v1 setObject:v10 forKeyedSubscript:@"Began observing lock_status"];
  id v11 = (id)_observers;
  if ([v11 count])
  {
    uint64_t v12 = [v11 allValues];
    unint64_t v13 = objc_msgSend(v12, "ef_map:", &__block_literal_global_3);
    unint64_t v14 = [v13 componentsJoinedByString:@", "];
    [v1 setObject:v14 forKeyedSubscript:@"Observers"];
  }

  return v1;
}

void sub_1B5A7E208(_Unwind_Exception *a1)
{
  id v9 = v5;

  _Unwind_Resume(a1);
}

void sub_1B5A7E360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void EFUnregisterContentProtectionObserver(void *a1)
{
  id v1 = a1;
  if (!v1) {
    __assert_rtn("EFUnregisterContentProtectionObserver", "EFContentProtectionObserver.m", 264, "nil != observer");
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __EFUnregisterContentProtectionObserver_block_invoke;
  v3[3] = &unk_1E6121B40;
  id v2 = v1;
  id v4 = v2;
  _InitAndPerformSync(v3);
}

void sub_1B5A7E44C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void __EFUnregisterContentProtectionObserver_block_invoke(uint64_t a1)
{
  if (_observers) {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)_observers, *(const void **)(a1 + 32));
  }
}

uint64_t EFContentProtectionGetObservedState()
{
  if (_InitObservation_sOnceToken != -1) {
    dispatch_once(&_InitObservation_sOnceToken, &__block_literal_global_81);
  }
  return sContentProtectionState;
}

void EFPerformSyncWithProtectedDataAvailability(void *a1)
{
  id v1 = a1;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __EFPerformSyncWithProtectedDataAvailability_block_invoke;
  v3[3] = &unk_1E6121E00;
  id v4 = v1;
  id v2 = v1;
  _InitAndPerformSync(v3);
}

void sub_1B5A7E558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t __EFPerformSyncWithProtectedDataAvailability_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  BOOL v2 = EFProtectedDataAvailable();
  unint64_t v3 = *(uint64_t (**)(uint64_t, BOOL))(v1 + 16);

  return v3(v1, v2);
}

BOOL EFProtectedDataAvailableInState()
{
  if (_InitObservation_sOnceToken != -1) {
    dispatch_once(&_InitObservation_sOnceToken, &__block_literal_global_81);
  }
  return sContentProtectionState == 3 || sContentProtectionState == 0;
}

void __EFContentProtectionValidateObservedStateIsUnlocked_block_invoke()
{
}

void _NotifyObserversWithContentProtectionState(unint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)_observationQueue);
  if (a1 == -1) {
    _NotifyObserversWithContentProtectionState_cold_1();
  }
  unint64_t v2 = sContentProtectionState;
  if (sContentProtectionState == -1) {
    _NotifyObserversWithContentProtectionState_cold_2();
  }
  unint64_t v3 = _Log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2 == a1)
  {
    if (v4)
    {
      uint64_t v5 = @"disabled";
      switch(a1)
      {
        case 0uLL:
          uint64_t v5 = @"unlocked";
          break;
        case 1uLL:
          uint64_t v5 = @"locked";
          break;
        case 2uLL:
          uint64_t v5 = @"locking";
          break;
        case 3uLL:
          break;
        default:
          uint64_t v5 = @"unknown";
          break;
      }
      *(_DWORD *)buf = 138543618;
      char v25 = v5;
      __int16 v26 = 2114;
      v27 = v5;
      _os_log_impl(&dword_1B5A59000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring lock state change from %{public}@ to %{public}@", buf, 0x16u);
    }
    goto LABEL_44;
  }
  if (v4)
  {
    if (v2 > 3) {
      id v6 = @"unknown";
    }
    else {
      id v6 = off_1E6121EB0[v2];
    }
    if (a1 > 3) {
      uint64_t v7 = @"unknown";
    }
    else {
      uint64_t v7 = off_1E6121EB0[a1];
    }
    *(_DWORD *)buf = 138543618;
    char v25 = v6;
    __int16 v26 = 2114;
    v27 = v7;
    _os_log_impl(&dword_1B5A59000, v3, OS_LOG_TYPE_DEFAULT, "Keybag transitioning from %{public}@ to %{public}@", buf, 0x16u);
  }

  if (a1 == 1 && !v2)
  {
    uint64_t v8 = _Log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      _NotifyObserversWithContentProtectionState_cold_4(v8);
    }

    goto LABEL_28;
  }
  if (v2)
  {
    if (v2 != 1)
    {
      if (v2 == 2 && a1 < 2) {
        goto LABEL_31;
      }
LABEL_28:
      id v9 = _Log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        _NotifyObserversWithContentProtectionState_cold_3(v9);
      }

      goto LABEL_31;
    }
    if (a1) {
      goto LABEL_28;
    }
  }
  else if (a1 != 2)
  {
    goto LABEL_28;
  }
LABEL_31:
  int v10 = v2;
  atomic_compare_exchange_strong((atomic_uint *volatile)&sContentProtectionState, (unsigned int *)&v10, a1);
  if (v10 != v2) {
    return;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = [(id)_observers allValues];
  unint64_t v3 = obj;
  uint64_t v11 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        unint64_t v14 = a1;
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int v16 = [v15 queue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = ___NotifyObserversWithContentProtectionState_block_invoke;
        block[3] = &unk_1E6121E90;
        block[4] = v15;
        void block[5] = v14;
        a1 = v14;
        block[6] = v2;
        dispatch_async(v16, block);
      }
      unint64_t v3 = obj;
      uint64_t v11 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
LABEL_44:
}

void sub_1B5A7E9B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void EFContentProtectionSimulateState(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __EFContentProtectionSimulateState_block_invoke;
  v1[3] = &__block_descriptor_40_e5_v8__0l;
  v1[4] = a1;
  _InitAndPerformSync(v1);
}

void __EFContentProtectionSimulateState_block_invoke(uint64_t a1)
{
}

id EFContentProtectionDumpDiagnosticState()
{
  id v0 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"\n==== EFContentProtectionObserver ====\n"];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __EFContentProtectionDumpDiagnosticState_block_invoke;
  v3[3] = &unk_1E6121B40;
  id v1 = v0;
  id v4 = v1;
  _InitAndPerformSync(v3);

  return v1;
}

void sub_1B5A7EB0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void __EFContentProtectionDumpDiagnosticState_block_invoke(uint64_t a1)
{
  unint64_t v2 = _DiagnosticStateDictionary();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __EFContentProtectionDumpDiagnosticState_block_invoke_2;
  v3[3] = &unk_1E6121E28;
  id v4 = *(id *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void sub_1B5A7EBC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t __EFContentProtectionDumpDiagnosticState_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@: %@\n", a2, a3];
}

void sub_1B5A7ED50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void EFVerifyFileProtectionType(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = (id)*MEMORY[0x1E4F1C598];
  id v18 = 0;
  uint64_t v6 = *MEMORY[0x1E4F1C590];
  id v17 = 0;
  int v7 = [v3 getResourceValue:&v18 forKey:v6 error:&v17];
  id v8 = v18;

  id v9 = v17;
  if (v7)
  {
    if ([v8 isEqualToString:v4])
    {
      int v10 = _Log_0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [v3 path];
        *(_DWORD *)buf = 138412546;
        long long v20 = v11;
        __int16 v21 = 2114;
        id v22 = v4;
        _os_log_impl(&dword_1B5A59000, v10, OS_LOG_TYPE_DEFAULT, "%@ has file protection type %{public}@", buf, 0x16u);
      }
    }
    else
    {
      unint64_t v14 = _Log_0();
      int v10 = v14;
      if (v8)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          uint64_t v15 = [v3 path];
          *(_DWORD *)buf = 138412802;
          long long v20 = v15;
          __int16 v21 = 2114;
          id v22 = v8;
          __int16 v23 = 2114;
          id v24 = v4;
          _os_log_fault_impl(&dword_1B5A59000, v10, OS_LOG_TYPE_FAULT, "%@ has incorrect file protection type %{public}@, expected %{public}@", buf, 0x20u);
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = [v3 path];
        *(_DWORD *)buf = 138412546;
        long long v20 = v16;
        __int16 v21 = 2114;
        id v22 = v4;
        _os_log_impl(&dword_1B5A59000, v10, OS_LOG_TYPE_DEFAULT, "%@ has no file protection type, expected %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    int v10 = _Log_0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [v3 path];
      unint64_t v13 = objc_msgSend(v9, "ef_publicDescription");
      EFVerifyFileProtectionType_cold_1(v12, v13, buf, v10);
    }
  }
}

void sub_1B5A7EFF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7F0A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  int v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EFDebouncer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1B5A7F11C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7F28C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7F3BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void WithDeviceIsInternal(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "void WithDeviceIsInternal(void (^ _Nonnull __strong)(void), BOOL)");
    [v5 handleFailureInFunction:v6, @"EFDevice.m", 223, @"Invalid parameter not satisfying: %@", @"handler" file lineNumber description];
  }
  id v4 = +[EFDevice testingDeviceWithInternal:a2];
  +[EFDevice setCurrentDevice:v4];

  v3[2](v3);
  +[EFDevice setCurrentDevice:0];
}

void sub_1B5A7F630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7F86C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7FA50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A7FEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1B5A80430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A805B0(_Unwind_Exception *a1)
{
  objc_end_catch();

  _Unwind_Resume(a1);
}

void sub_1B5A805DC(void *a1)
{
}

uint64_t OUTLINED_FUNCTION_0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

void sub_1B5A808B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A80968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A80AF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A80BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock(v10);

  _Unwind_Resume(a1);
}

void sub_1B5A80D48(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v4);

  _Unwind_Resume(a1);
}

void sub_1B5A80DFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock(v10);

  _Unwind_Resume(a1);
}

void sub_1B5A81314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_unfair_lock_t lock, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  _Unwind_Resume(a1);
}

void sub_1B5A81494(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8154C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A815D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A81894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  long long v20 = v19;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5A81988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A81A3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A81B28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A81BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A81C50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A81CDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A81D68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A81E04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A81EA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A81F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A81FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A820AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A82140(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A821D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A82260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8239C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1B5A82458(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A825F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1B5A826C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A82798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A82A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A82B28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A82CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A82E70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A82FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1B5A830E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A83180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8322C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A832C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void test_setUse32BitMurmurHash3()
{
  id v1 = [MEMORY[0x1E4F29060] currentThread];
  id v0 = [v1 threadDictionary];
  [v0 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"EFHashing.UseMurmur3x86-32"];
}

void sub_1B5A83448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void test_unsetUse32BitMurmurHash3()
{
  id v1 = [MEMORY[0x1E4F29060] currentThread];
  id v0 = [v1 threadDictionary];
  [v0 setObject:0 forKeyedSubscript:@"EFHashing.UseMurmur3x86-32"];
}

void sub_1B5A834D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

unint64_t EFMurmurHash3String(void *a1, uint64_t a2, void *a3)
{
  id v5 = [a1 dataUsingEncoding:4];
  unint64_t v6 = EFMurmurHash3Data(v5, a2, a3);

  return v6;
}

void sub_1B5A83548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t EFMurmurHash3Data(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  if (!is32Bit())
  {
    id v14 = v5;
    unint64_t v15 = [v14 length];
    id v9 = v14;
    uint64_t v16 = [v9 bytes];
    if (v15 >= 0x10)
    {
      unint64_t v18 = v15 >> 4;
      long long v19 = (void *)(v16 + 8);
      uint64_t v17 = a2;
      do
      {
        a2 = 5
           * (__ROR8__((0x4CF5AD432745937FLL* ((0x88A129EA80000000 * *(v19 - 1)) | ((0x87C37B91114253D5 * *(v19 - 1)) >> 33))) ^ a2, 37)+ v17)+ 1390208809;
        uint64_t v17 = 5
            * (a2
             + __ROR8__((0x87C37B91114253D5* ((0x4E8B26FE00000000 * *v19) | ((unint64_t)(0x4CF5AD432745937FLL * *v19) >> 31))) ^ v17, 33))+ 944331445;
        v19 += 2;
        --v18;
      }
      while (v18);
    }
    else
    {
      uint64_t v17 = a2;
    }
    unint64_t v20 = 0;
    unint64_t v21 = 0;
    unint64_t v22 = 0;
    unint64_t v23 = 0;
    unint64_t v24 = 0;
    unint64_t v25 = 0;
    unint64_t v26 = 0;
    unint64_t v27 = 0;
    unint64_t v28 = 0;
    unint64_t v29 = 0;
    unint64_t v30 = 0;
    unint64_t v31 = 0;
    unint64_t v32 = 0;
    id v33 = (unsigned __int8 *)(v16 + (v15 & 0xFFFFFFFFFFFFFFF0));
    switch(v15 & 0xF)
    {
      case 1uLL:
        goto LABEL_24;
      case 2uLL:
        goto LABEL_23;
      case 3uLL:
        goto LABEL_22;
      case 4uLL:
        goto LABEL_21;
      case 5uLL:
        goto LABEL_20;
      case 6uLL:
        goto LABEL_19;
      case 7uLL:
        goto LABEL_18;
      case 8uLL:
        goto LABEL_17;
      case 9uLL:
        goto LABEL_16;
      case 0xAuLL:
        goto LABEL_15;
      case 0xBuLL:
        goto LABEL_14;
      case 0xCuLL:
        goto LABEL_13;
      case 0xDuLL:
        goto LABEL_12;
      case 0xEuLL:
        goto LABEL_11;
      case 0xFuLL:
        unint64_t v20 = (unint64_t)v33[14] << 48;
LABEL_11:
        unint64_t v21 = v20 | ((unint64_t)v33[13] << 40);
LABEL_12:
        unint64_t v22 = v21 ^ ((unint64_t)v33[12] << 32);
LABEL_13:
        unint64_t v23 = v22 ^ ((unint64_t)v33[11] << 24);
LABEL_14:
        unint64_t v24 = v23 ^ ((unint64_t)v33[10] << 16);
LABEL_15:
        unint64_t v25 = v24 ^ ((unint64_t)v33[9] << 8);
LABEL_16:
        v17 ^= 0x87C37B91114253D5
             * ((0x4E8B26FE00000000 * (v25 ^ v33[8])) | ((0x4CF5AD432745937FLL * (v25 ^ v33[8])) >> 31));
LABEL_17:
        unint64_t v26 = (unint64_t)v33[7] << 56;
LABEL_18:
        unint64_t v27 = v26 | ((unint64_t)v33[6] << 48);
LABEL_19:
        unint64_t v28 = v27 ^ ((unint64_t)v33[5] << 40);
LABEL_20:
        unint64_t v29 = v28 ^ ((unint64_t)v33[4] << 32);
LABEL_21:
        unint64_t v30 = v29 ^ ((unint64_t)v33[3] << 24);
LABEL_22:
        unint64_t v31 = v30 ^ ((unint64_t)v33[2] << 16);
LABEL_23:
        unint64_t v32 = v31 ^ ((unint64_t)v33[1] << 8);
LABEL_24:
        a2 ^= 0x4CF5AD432745937FLL
            * ((0x88A129EA80000000 * (v32 ^ *v33)) | ((0x87C37B91114253D5 * (v32 ^ *v33)) >> 33));
        break;
      default:
        break;
    }
    unint64_t v34 = (a2 ^ v15) + (v17 ^ v15);
    unint64_t v35 = v34 + (v17 ^ v15);
    unint64_t v36 = 0xC4CEB9FE1A85EC53
        * ((0xFF51AFD7ED558CCDLL * (v34 ^ (v34 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v34 ^ (v34 >> 33))) >> 33));
    unint64_t v37 = v36 ^ (v36 >> 33);
    unint64_t v38 = 0xC4CEB9FE1A85EC53
        * ((0xFF51AFD7ED558CCDLL * (v35 ^ (v35 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v35 ^ (v35 >> 33))) >> 33));
    unint64_t v39 = v38 ^ (v38 >> 33);
    unint64_t v40 = v39 + v37;
    if (a3) {
      *a3 = v40 + v39;
    }
    goto LABEL_56;
  }
  id v6 = v5;
  int v7 = v6;
  if (a3)
  {
    unint64_t v8 = [v6 length];
    id v9 = v7;
    uint64_t v10 = [v9 bytes];
    if (v8 >= 0x10)
    {
      unint64_t v52 = v8 >> 4;
      v53 = (int *)(v10 + 8);
      int v13 = a2;
      int v12 = a2;
      int v11 = a2;
      do
      {
        int v54 = *(v53 - 1);
        HIDWORD(v55) = (-1425107063 * ((-888307712 * *(v53 - 2)) | ((597399067 * *(v53 - 2)) >> 17))) ^ a2;
        LODWORD(v55) = HIDWORD(v55);
        int v56 = *v53;
        int v57 = v53[1];
        v53 += 4;
        LODWORD(a2) = 5 * ((v55 >> 13) + v13) + 1444728091;
        HIDWORD(v55) = (951274213 * ((-1752629248 * v54) | ((-1425107063 * v54) >> 16))) ^ v13;
        LODWORD(v55) = HIDWORD(v55);
        int v13 = 5 * ((v55 >> 15) + v12) + 197830471;
        HIDWORD(v55) = (-1578923117 * ((-1781923840 * v56) | ((951274213 * v56) >> 15))) ^ v12;
        LODWORD(v55) = HIDWORD(v55);
        int v58 = 5 * ((v55 >> 17) + v11);
        HIDWORD(v55) = (597399067 * ((-1953300480 * v57) | ((-1578923117 * v57) >> 16))) ^ v11;
        LODWORD(v55) = HIDWORD(v55);
        int v12 = v58 - 1764942795;
        int v11 = 5 * ((v55 >> 19) + a2) + 850148119;
        --v52;
      }
      while (v52);
    }
    else
    {
      int v11 = a2;
      int v12 = a2;
      int v13 = a2;
    }
    int v59 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    int v69 = 0;
    v70 = (unsigned __int8 *)(v10 + (v8 & 0xFFFFFFFFFFFFFFF0));
    switch(v8 & 0xF)
    {
      case 1uLL:
        goto LABEL_54;
      case 2uLL:
        goto LABEL_53;
      case 3uLL:
        goto LABEL_52;
      case 4uLL:
        goto LABEL_51;
      case 5uLL:
        goto LABEL_50;
      case 6uLL:
        goto LABEL_49;
      case 7uLL:
        goto LABEL_48;
      case 8uLL:
        goto LABEL_47;
      case 9uLL:
        goto LABEL_46;
      case 0xAuLL:
        goto LABEL_45;
      case 0xBuLL:
        goto LABEL_44;
      case 0xCuLL:
        goto LABEL_43;
      case 0xDuLL:
        goto LABEL_42;
      case 0xEuLL:
        goto LABEL_41;
      case 0xFuLL:
        int v59 = v70[14] << 16;
LABEL_41:
        int v60 = v59 | (v70[13] << 8);
LABEL_42:
        v11 ^= 597399067 * ((776732672 * (v60 ^ v70[12])) | ((-1578923117 * (v60 ^ v70[12])) >> 14));
LABEL_43:
        int v61 = v70[11] << 24;
LABEL_44:
        int v62 = v61 | (v70[10] << 16);
LABEL_45:
        int v63 = v62 ^ (v70[9] << 8);
LABEL_46:
        v12 ^= -1578923117 * ((-1781923840 * (v63 ^ v70[8])) | ((951274213 * (v63 ^ v70[8])) >> 15));
LABEL_47:
        int v64 = v70[7] << 24;
LABEL_48:
        int v65 = v64 | (v70[6] << 16);
LABEL_49:
        int v66 = v65 ^ (v70[5] << 8);
LABEL_50:
        v13 ^= 951274213 * ((-1752629248 * (v66 ^ v70[4])) | ((-1425107063 * (v66 ^ v70[4])) >> 16));
LABEL_51:
        int v67 = v70[3] << 24;
LABEL_52:
        int v68 = v67 | (v70[2] << 16);
LABEL_53:
        int v69 = v68 ^ (v70[1] << 8);
LABEL_54:
        LODWORD(a2) = (-1425107063 * ((-888307712 * (v69 ^ *v70)) | ((597399067 * (v69 ^ *v70)) >> 17))) ^ a2;
        break;
      default:
        break;
    }
    int v71 = v11 ^ v8;
    __int32 v72 = (v12 ^ v8) + (v13 ^ v8) + (a2 ^ v8) + v71;
    v73.i32[0] = v72;
    v73.i32[1] = v72 + (v13 ^ v8);
    v73.i32[2] = v72 + (v12 ^ v8);
    v73.i32[3] = v72 + v71;
    int8x16_t v74 = (int8x16_t)vmulq_s32((int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32(v73, 0x10uLL), (int8x16_t)v73), vdupq_n_s32(0x85EBCA6B));
    int8x16_t v75 = (int8x16_t)vmulq_s32((int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v74, 0xDuLL), v74), vdupq_n_s32(0xC2B2AE35));
    int32x4_t v76 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v75, 0x10uLL), v75);
    unsigned int v77 = vaddvq_s32(v76);
    unint64_t v40 = v77;
    *(_DWORD *)a3 = v77 + v76.i32[1];
LABEL_56:

    goto LABEL_57;
  }
  unint64_t v41 = [v6 length];
  id v42 = v7;
  uint64_t v43 = [v42 bytes];
  if (v41 >= 4)
  {
    unint64_t v44 = v41 >> 2;
    v45 = (int *)v43;
    do
    {
      int v46 = *v45++;
      HIDWORD(v47) = (461845907 * ((380141568 * v46) | ((-862048943 * v46) >> 17))) ^ a2;
      LODWORD(v47) = HIDWORD(v47);
      LODWORD(a2) = 5 * (v47 >> 19) - 430675100;
      --v44;
    }
    while (v44);
  }
  int v48 = 0;
  v49 = (unsigned __int8 *)(v43 + (v41 & 0xFFFFFFFFFFFFFFFCLL));
  unint64_t v50 = v41 & 3;
  switch(v50)
  {
    case 1uLL:
      goto LABEL_35;
    case 2uLL:
LABEL_34:
      v48 |= v49[1] << 8;
LABEL_35:
      LODWORD(a2) = (461845907 * ((380141568 * (v48 ^ *v49)) | ((-862048943 * (v48 ^ *v49)) >> 17))) ^ a2;
      break;
    case 3uLL:
      int v48 = v49[2] << 16;
      goto LABEL_34;
  }
  unsigned int v51 = -2048144789 * (a2 ^ v41 ^ ((a2 ^ v41) >> 16));
  unint64_t v40 = (-1028477387 * (v51 ^ (v51 >> 13))) ^ ((-1028477387 * (v51 ^ (v51 >> 13))) >> 16);

LABEL_57:
  return v40;
}

void sub_1B5A83C0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A83D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A83E6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1B5A83FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8419C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8426C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A842DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_1B5A8437C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A84460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, void *a11)
{
}

void sub_1B5A8476C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  std::__tree<long long>::destroy(v21, a21);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1B5A8490C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A84ADC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A84BE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A84D04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A84D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, void *a11)
{
}

uint64_t *std::set<long long>::insert[abi:ne180100]<std::__tree_const_iterator<long long,std::__tree_node<long long,void *> *,long>>(uint64_t *result, void *a2, void *a3)
{
  if (a2 != a3)
  {
    uint64_t v4 = a2;
    id v5 = (uint64_t **)result;
    id v6 = result + 1;
    do
    {
      os_log_t result = std::__tree<long long>::__emplace_hint_unique_key_args<long long,long long const&>(v5, v6, v4 + 4, v4 + 4);
      int v7 = (void *)v4[1];
      if (v7)
      {
        do
        {
          unint64_t v8 = v7;
          int v7 = (void *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          unint64_t v8 = (void *)v4[2];
          BOOL v9 = *v8 == (void)v4;
          uint64_t v4 = v8;
        }
        while (!v9);
      }
      uint64_t v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

void sub_1B5A84F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A84FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  std::__tree<long long>::destroy((uint64_t)&a9, a10);

  _Unwind_Resume(a1);
}

uint64_t *std::__tree<long long>::__node_insert_multi(uint64_t **a1, uint64_t *a2)
{
  id v3 = a1 + 1;
  uint64_t v4 = a1[1];
  if (v4)
  {
    do
    {
      while (1)
      {
        id v3 = (uint64_t **)v4;
        if (a2[4] >= v4[4]) {
          break;
        }
        uint64_t v4 = (uint64_t *)*v4;
        id v5 = v3;
        if (!*v3) {
          goto LABEL_8;
        }
      }
      uint64_t v4 = (uint64_t *)v4[1];
    }
    while (v4);
    id v5 = v3 + 1;
  }
  else
  {
    id v5 = a1 + 1;
  }
LABEL_8:
  std::__tree<long long>::__insert_node_at(a1, (uint64_t)v3, v5, a2);
  return a2;
}

void *std::__tree<long long>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  os_log_t result = *(void **)(a1 + 16);
  if (result)
  {
    id v3 = (void *)*result;
    if (*result == a1)
    {
      void *result = 0;
      while (1)
      {
        uint64_t v4 = (void *)result[1];
        if (!v4) {
          break;
        }
        do
        {
          os_log_t result = v4;
          uint64_t v4 = (void *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; id v3 = (void *)result[1])
      {
        do
        {
          os_log_t result = v3;
          id v3 = (void *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t std::__tree<long long>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  std::__tree<long long>::destroy(*(void *)a1, *(void **)(a1 + 16));
  unint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    id v3 = (void *)v2[2];
    if (v3)
    {
      do
      {
        unint64_t v2 = v3;
        id v3 = (void *)v3[2];
      }
      while (v3);
      *(void *)(a1 + 8) = v2;
    }
    std::__tree<long long>::destroy(*(void *)a1, v2);
  }
  return a1;
}

uint64_t *std::__tree<long long>::__emplace_multi<long long const&>(uint64_t **a1, uint64_t *a2)
{
  uint64_t v4 = (uint64_t *)operator new(0x28uLL);
  uint64_t v5 = *a2;
  v4[4] = *a2;
  id v6 = a1 + 1;
  int v7 = a1[1];
  if (v7)
  {
    do
    {
      while (1)
      {
        id v6 = (uint64_t **)v7;
        if (v5 >= v7[4]) {
          break;
        }
        int v7 = (uint64_t *)*v7;
        unint64_t v8 = v6;
        if (!*v6) {
          goto LABEL_8;
        }
      }
      int v7 = (uint64_t *)v7[1];
    }
    while (v7);
    unint64_t v8 = v6 + 1;
  }
  else
  {
    unint64_t v8 = a1 + 1;
  }
LABEL_8:
  std::__tree<long long>::__insert_node_at(a1, (uint64_t)v6, v8, v4);
  return v4;
}

uint64_t *std::set<long long>::set[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::set<long long>::insert[abi:ne180100]<std::__tree_const_iterator<long long,std::__tree_node<long long,void *> *,long>>(a1, *(void **)a2, (void *)(a2 + 8));
  return a1;
}

void sub_1B5A85204(_Unwind_Exception *a1)
{
  std::__tree<long long>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<long long>::__emplace_hint_unique_key_args<long long,long long const&>(uint64_t **a1, void *a2, uint64_t *a3, uint64_t *a4)
{
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  id v6 = (uint64_t **)std::__tree<long long>::__find_equal<long long>(a1, a2, &v11, &v10, a3);
  int v7 = *v6;
  if (!*v6)
  {
    unint64_t v8 = v6;
    int v7 = (uint64_t *)operator new(0x28uLL);
    v7[4] = *a4;
    std::__tree<long long>::__insert_node_at(a1, v11, v8, v7);
  }
  return v7;
}

void *std::__tree<long long>::__find_equal<long long>(void *a1, void *a2, void *a3, void *a4, uint64_t *a5)
{
  uint64_t v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, uint64_t v7 = a2[4], *a5 < v7))
  {
    uint64_t v8 = *a2;
    if ((void *)*a1 == a2)
    {
      unint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      BOOL v9 = (void *)*a2;
      do
      {
        unint64_t v10 = v9;
        BOOL v9 = (void *)v9[1];
      }
      while (v9);
    }
    else
    {
      int v13 = a2;
      do
      {
        unint64_t v10 = (void *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        int v13 = v10;
      }
      while (v14);
    }
    uint64_t v15 = *a5;
    if (v10[4] < *a5) {
      goto LABEL_17;
    }
    uint64_t v16 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v17 = v16;
          uint64_t v18 = v16[4];
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = (void *)*v17;
          uint64_t v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        uint64_t v5 = v17 + 1;
        uint64_t v16 = (void *)v17[1];
      }
      while (v16);
    }
    else
    {
      uint64_t v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    int v12 = (void *)a2[1];
    do
    {
      a4 = v12;
      int v12 = (void *)*v12;
    }
    while (v12);
  }
  else
  {
    long long v19 = a2;
    do
    {
      a4 = (void *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      long long v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= a4[4])
  {
    unint64_t v20 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v21 = v20;
          uint64_t v22 = v20[4];
          if (v6 >= v22) {
            break;
          }
          unint64_t v20 = (void *)*v21;
          uint64_t v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        uint64_t v5 = v21 + 1;
        unint64_t v20 = (void *)v21[1];
      }
      while (v20);
    }
    else
    {
      uint64_t v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

uint64_t std::__tree<long long>::__erase_unique<long long>(uint64_t a1, uint64_t *a2)
{
  unint64_t v2 = *(void **)(a1 + 8);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *a2;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  do
  {
    uint64_t v5 = v2[4];
    BOOL v6 = v5 < v3;
    if (v5 >= v3) {
      uint64_t v7 = v2;
    }
    else {
      uint64_t v7 = v2 + 1;
    }
    if (!v6) {
      uint64_t v4 = v2;
    }
    unint64_t v2 = (void *)*v7;
  }
  while (*v7);
  if (v4 == (uint64_t *)(a1 + 8) || v3 < v4[4]) {
    return 0;
  }
  std::__tree<long long>::__remove_node_pointer((uint64_t **)a1, v4);
  operator delete(v4);
  return 1;
}

uint64_t *std::__tree<long long>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  unint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      uint64_t v3 = v2;
      unint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    uint64_t v4 = a2;
    do
    {
      uint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  BOOL v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      uint64_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      uint64_t v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  BOOL v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 == v3)
  {
    uint64_t *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      uint64_t v7 = 0;
      os_log_t result = (uint64_t *)v2;
    }
    else
    {
      uint64_t v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    uint64_t *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      os_log_t result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      int v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      uint64_t *v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        os_log_t result = v7;
      }
      uint64_t v7 = *(uint64_t **)(*v7 + 8);
    }
    uint64_t v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      uint64_t v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        *uint64_t v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        uint64_t v16 = v7;
      }
      else
      {
        uint64_t v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      unint64_t v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      uint64_t *v24 = v23;
      goto LABEL_72;
    }
    uint64_t v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      uint64_t v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    uint64_t v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      os_log_t result = v7;
    }
    uint64_t v7 = *(uint64_t **)v12;
  }
  long long v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  unint64_t v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    unint64_t v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    uint64_t *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    long long v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  unint64_t v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

double std::__set_intersection[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,std::__tree_const_iterator<long long,std::__tree_node<long long,void *> *,long>,std::__tree_const_iterator<long long,std::__tree_node<long long,void *> *,long>,std::__tree_const_iterator<long long,std::__tree_node<long long,void *> *,long>,std::__tree_const_iterator<long long,std::__tree_node<long long,void *> *,long>,std::insert_iterator<std::set<long long>>>@<D0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  *(void *)&long long v22 = a5;
  *((void *)&v22 + 1) = a6;
  if (a1 != a2)
  {
    uint64_t v10 = a3;
    if (a3 != a4)
    {
      uint64_t v11 = a1;
      do
      {
        uint64_t v12 = v11[4];
        uint64_t v13 = v10[4];
        if (v12 >= v13)
        {
          if (v13 >= v12)
          {
            std::insert_iterator<std::set<long long>>::operator=[abi:ne180100]((uint64_t)&v22, v11 + 4);
            uint64_t v17 = (void *)v11[1];
            if (v17)
            {
              do
              {
                uint64_t v16 = v17;
                uint64_t v17 = (void *)*v17;
              }
              while (v17);
            }
            else
            {
              do
              {
                uint64_t v16 = (void *)v11[2];
                BOOL v18 = *v16 == (void)v11;
                uint64_t v11 = v16;
              }
              while (!v18);
            }
          }
          else
          {
            uint64_t v16 = v11;
          }
          long long v19 = (void *)v10[1];
          if (v19)
          {
            do
            {
              uint64_t v10 = v19;
              long long v19 = (void *)*v19;
            }
            while (v19);
          }
          else
          {
            do
            {
              unint64_t v20 = v10;
              uint64_t v10 = (void *)v10[2];
            }
            while ((void *)*v10 != v20);
          }
          uint64_t v11 = v16;
        }
        else
        {
          uint64_t v14 = (void *)v11[1];
          if (v14)
          {
            do
            {
              uint64_t v11 = v14;
              uint64_t v14 = (void *)*v14;
            }
            while (v14);
          }
          else
          {
            do
            {
              uint64_t v15 = v11;
              uint64_t v11 = (void *)v11[2];
            }
            while ((void *)*v11 != v15);
          }
        }
      }
      while (v11 != a2 && v10 != a4);
    }
  }
  *(void *)a7 = a2;
  *(void *)(a7 + 8) = a4;
  double result = *(double *)&v22;
  *(_OWORD *)(a7 + 16) = v22;
  return result;
}

uint64_t std::insert_iterator<std::set<long long>>::operator=[abi:ne180100](uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = std::__tree<long long>::__emplace_hint_unique_key_args<long long,long long const&>(*(uint64_t ***)a1, *(void **)(a1 + 8), a2, a2);
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = (uint64_t *)v3[1];
  if (v4)
  {
    do
    {
      int v5 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  else
  {
    do
    {
      int v5 = (uint64_t *)v3[2];
      BOOL v6 = *v5 == (void)v3;
      uint64_t v3 = v5;
    }
    while (!v6);
  }
  *(void *)(a1 + 8) = v5;
  return a1;
}

void sub_1B5A85AD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A85B4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A85BBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A85CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A85DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A85E18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A85EB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A85FE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A86054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A860CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A861F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A862BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A86314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A86368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A86414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A86490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8653C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A865CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A86678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A86720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A867AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A86A08(_Unwind_Exception *a1)
{
  uint64_t v7 = v5;

  _Unwind_Resume(a1);
}

void sub_1B5A86E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  uint64_t v25 = v22;

  _Unwind_Resume(a1);
}

void sub_1B5A86F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A87068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A87128(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id EFFetchSignpostLog()
{
  if (EFFetchSignpostLog_onceToken != -1) {
    dispatch_once(&EFFetchSignpostLog_onceToken, &__block_literal_global_8);
  }
  id v0 = (void *)EFFetchSignpostLog_log;

  return v0;
}

void __EFFetchSignpostLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email.fetch.signpost", "PointsOfInterest");
  uint64_t v1 = (void *)EFFetchSignpostLog_log;
  EFFetchSignpostLog_log = (uint64_t)v0;
}

_DWORD *__EFLogRegisterStateCaptureBlock_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = *(_DWORD *)(a2 + 16);
  if ((v3 & 1) != 0 && v4 == 1
    || (v3 & 2) != 0 && v4 == 2
    || ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 0 ? (BOOL v5 = v4 == 3) : (BOOL v5 = 0), v5))
  {
    uint64_t v7 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if (![v7 count])
    {
      BOOL v6 = 0;
LABEL_23:

      return v6;
    }
    id v14 = 0;
    int v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:200 options:0 error:&v14];
    id v9 = v14;
    if (v8)
    {
      size_t v10 = [v8 length];
      uint64_t v11 = malloc_type_calloc(1uLL, v10 + 200, 0xACC82145uLL);
      BOOL v6 = v11;
      if (v11)
      {
        _DWORD *v11 = 1;
        v11[1] = v10;
        if ([*(id *)(a1 + 32) UTF8String]) {
          __strlcpy_chk();
        }
        memcpy(v6 + 50, (const void *)[v8 bytes], v10);
        goto LABEL_22;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __EFLogRegisterStateCaptureBlock_block_invoke_cold_2();
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_msgSend(v9, "ef_publicDescription");
      __EFLogRegisterStateCaptureBlock_block_invoke_cold_1((uint64_t)v7, v12, buf);
    }
    BOOL v6 = 0;
LABEL_22:

    goto LABEL_23;
  }
  return 0;
}

void sub_1B5A87410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A874E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A87750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A878FC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v3);
  _Unwind_Resume(a1);
}

void sub_1B5A879F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A87BA4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B5A87CB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A87DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A87EE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A87F88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A88030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t EFRoundUnsignedInteger(unint64_t result, unint64_t a2)
{
  if (result)
  {
    double v3 = (double)result;
    double v4 = log10((double)result);
    double v5 = __exp10((double)(int)((double)a2 - ceil(v4)));
    return (unint64_t)((double)(uint64_t)llround(v5 * v3) / v5);
  }
  return result;
}

long double _EFARC4NormallyDistributedRandomDouble(long double *a1, double a2, double a3)
{
  long double v6 = (double)arc4random() / 4294967300.0 * 1.0 + 2.22044605e-16;
  double v7 = (double)arc4random() / 4294967300.0;
  long double v8 = log(v6);
  double v9 = v7 * 6.28318531;
  double v10 = sqrt(v8 * -2.0);
  if (a1) {
    *a1 = a2 + sin(v9) * v10 * a3;
  }
  return a2 + cos(v9) * v10 * a3;
}

long double EFARC4NormallyDistributedRandomDouble(double a1, double a2)
{
  return _EFARC4NormallyDistributedRandomDouble(0, a1, a2);
}

void EFARC4NormallyDistributedRandomDoubleWithMinimum(double a1, double a2, double a3)
{
}

void EFARC4NormallyDistributedRandomDoubleInRange(double a1, double a2, double a3, double a4)
{
  if (a4 <= a3)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", "double EFARC4NormallyDistributedRandomDoubleInRange(double, double, double, double)");
    [v11 handleFailureInFunction:v12 file:@"EFMathUtilities.m" lineNumber:46 description:@"max must be greater than min"];
  }
  do
  {
    double v13 = 0.0;
    double v8 = _EFARC4NormallyDistributedRandomDouble(&v13, a1, a2);
    if (v8 >= a3 && v8 <= a4) {
      break;
    }
  }
  while (v13 < a3 || v13 > a4);
}

void sub_1B5A882EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A88370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A88414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A884C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A885C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A88724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A887D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t kCompareTuples_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 index];
  if (v6 >= [v5 index])
  {
    unint64_t v8 = [v4 index];
    uint64_t v7 = v8 > [v5 index];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

void sub_1B5A888E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8897C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A88A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1B5A88D58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A88E9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A88FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A89038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A890E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A891A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A892A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8933C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A89434(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8948C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A894E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A89560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A897CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A89920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _ef_log_EFNetworkStatus()
{
  if (_ef_log_EFNetworkStatus_onceToken != -1) {
    dispatch_once(&_ef_log_EFNetworkStatus_onceToken, &__block_literal_global_11);
  }
  os_log_t v0 = (void *)_ef_log_EFNetworkStatus_log;

  return v0;
}

void sub_1B5A89A8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A89CB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A89EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  long long v22 = v21;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);

  _Unwind_Resume(a1);
}

void sub_1B5A8A000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8A084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8A0F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8A164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8A3A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8A4B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8A638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8A6C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8A788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8A840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8A8AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8A9C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1B5A8AA84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8AC98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8ADC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8AFF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8B118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8B400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8B4E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8B5C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5A8B6E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8B7EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8B8EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8BA00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8BB14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8BC28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8BD3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8BE50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8BF64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8BFFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8C074(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8C10C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8C218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8C2F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8C3D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8C534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8C624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8C6BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8C77C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8C800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8C8F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8C978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8CA7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8CB70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id EFComparatorFromSortDescriptors(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v6 = [NSString stringWithUTF8String:"NSComparator  _Nonnull EFComparatorFromSortDescriptors(NSArray<NSSortDescriptor *> *__strong _Nonnull)"];
    [v5 handleFailureInFunction:v6, @"EFNSComparatorAdditions.m", 11, @"Invalid parameter not satisfying: %@", @"sortDescriptors" file lineNumber description];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __EFComparatorFromSortDescriptors_block_invoke;
  aBlock[3] = &unk_1E6122548;
  id v8 = v1;
  id v2 = v1;
  double v3 = _Block_copy(aBlock);

  return v3;
}

void sub_1B5A8CD40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __EFComparatorFromSortDescriptors_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "compareObject:toObject:", v5, v6, (void)v13);
      if (v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v11 = 0;
  }

  return v11;
}

void sub_1B5A8CE88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8D018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8D1A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8D268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8D444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8D5DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8D690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8D6FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8D894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8D9D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8DAF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8DBC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8DCF8(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B5A8DE44(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B5A8DF90(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B5A8E0B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8E1A4(_Unwind_Exception *a1)
{
  double v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B5A8E25C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8E36C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8E4DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8E584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8E5F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8E6A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8E744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _sharedShortDateFormatter()
{
  os_log_t v0 = (void *)_sharedShortDateFormatter___sharedShortDateFormatter;
  if (!_sharedShortDateFormatter___sharedShortDateFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v2 = (void *)_sharedShortDateFormatter___sharedShortDateFormatter;
    _sharedShortDateFormatter___sharedShortDateFormatter = (uint64_t)v1;

    [(id)_sharedShortDateFormatter___sharedShortDateFormatter setTimeStyle:1];
    [(id)_sharedShortDateFormatter___sharedShortDateFormatter setDateStyle:1];
    os_log_t v0 = (void *)_sharedShortDateFormatter___sharedShortDateFormatter;
  }

  return v0;
}

id _sharedLongDateFormatter()
{
  os_log_t v0 = (void *)_sharedLongDateFormatter___sharedLongDateFormatter;
  if (!_sharedLongDateFormatter___sharedLongDateFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v2 = (void *)_sharedLongDateFormatter___sharedLongDateFormatter;
    _sharedLongDateFormatter___sharedLongDateFormatter = (uint64_t)v1;

    [(id)_sharedLongDateFormatter___sharedLongDateFormatter setTimeStyle:1];
    [(id)_sharedLongDateFormatter___sharedLongDateFormatter setDateStyle:3];
    [(id)_sharedLongDateFormatter___sharedLongDateFormatter setDoesRelativeDateFormatting:1];
    os_log_t v0 = (void *)_sharedLongDateFormatter___sharedLongDateFormatter;
  }

  return v0;
}

void sub_1B5A8EAA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8EB34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8EBEC(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t ___sharedMediumRelativeDateFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v1 = (void *)_sharedMediumRelativeDateFormatter__sharedMediumRelativeDateFormatter;
  _sharedMediumRelativeDateFormatter__sharedMediumRelativeDateFormatter = (uint64_t)v0;

  [(id)_sharedMediumRelativeDateFormatter__sharedMediumRelativeDateFormatter setTimeStyle:1];
  [(id)_sharedMediumRelativeDateFormatter__sharedMediumRelativeDateFormatter setDateStyle:2];
  id v2 = (void *)_sharedMediumRelativeDateFormatter__sharedMediumRelativeDateFormatter;

  return [v2 setDoesRelativeDateFormatting:1];
}

uint64_t ___sharedMediumRelativeDateOnlyFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v1 = (void *)_sharedMediumRelativeDateOnlyFormatter__sharedMediumRelativeDateOnlyFormatter;
  _sharedMediumRelativeDateOnlyFormatter__sharedMediumRelativeDateOnlyFormatter = (uint64_t)v0;

  [(id)_sharedMediumRelativeDateOnlyFormatter__sharedMediumRelativeDateOnlyFormatter setDateStyle:2];
  id v2 = (void *)_sharedMediumRelativeDateOnlyFormatter__sharedMediumRelativeDateOnlyFormatter;

  return [v2 setDoesRelativeDateFormatting:1];
}

uint64_t ___sharedShortTimeFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v1 = (void *)_sharedShortTimeFormatter__sharedShortTimeFormatter;
  _sharedShortTimeFormatter__sharedShortTimeFormatter = (uint64_t)v0;

  id v2 = (void *)_sharedShortTimeFormatter__sharedShortTimeFormatter;

  return [v2 setTimeStyle:1];
}

void sub_1B5A8ED9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8EE74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5A8EF34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8F010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5A8F0D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8F23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8F370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8F440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8F534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8F6DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8F754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8F7B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8F814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8F874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8F8D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8F934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8F99C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A8FB28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5A8FDB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5A8FE98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A902E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_1B5A903C0()
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1B5A90480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id truncatedDescriptionToMaxAllowableSize(void *a1, unint64_t a2)
{
  id v3 = a1;
  unint64_t v4 = [v3 length];
  if (v4 >= a2) {
    unint64_t v5 = a2;
  }
  else {
    unint64_t v5 = v4;
  }
  id v6 = [v3 substringToIndex:v5];

  return v6;
}

void sub_1B5A904FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A90658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void __initErrorDecodersOnce_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v1 = (void *)sErrorDecoders;
  sErrorDecoders = (uint64_t)v0;

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.mail.errorDecoder", 0);
  id v3 = (void *)sErrorDecodeQueue;
  sErrorDecodeQueue = (uint64_t)v2;
}

uint64_t __stringForPublicInfo_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@" %@=%@", a2, a3];
}

void sub_1B5A907C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A90A24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A90AF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A90C50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A90DC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A90EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A91030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A91144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A911F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A91280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A913C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A91448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A914E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _sharedIntegerWithGroupingFormatter()
{
  id v0 = (void *)_sharedIntegerWithGroupingFormatter___sharedIntegerWithGroupingFormatter;
  if (!_sharedIntegerWithGroupingFormatter___sharedIntegerWithGroupingFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    dispatch_queue_t v2 = (void *)_sharedIntegerWithGroupingFormatter___sharedIntegerWithGroupingFormatter;
    _sharedIntegerWithGroupingFormatter___sharedIntegerWithGroupingFormatter = (uint64_t)v1;

    [(id)_sharedIntegerWithGroupingFormatter___sharedIntegerWithGroupingFormatter setUsesGroupingSeparator:1];
    [(id)_sharedIntegerWithGroupingFormatter___sharedIntegerWithGroupingFormatter setGroupingSize:3];
    id v0 = (void *)_sharedIntegerWithGroupingFormatter___sharedIntegerWithGroupingFormatter;
  }

  return v0;
}

id _sharedIntegerFormatter()
{
  id v0 = (void *)_sharedIntegerFormatter___sharedIntegerFormatter;
  if (!_sharedIntegerFormatter___sharedIntegerFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    dispatch_queue_t v2 = (void *)_sharedIntegerFormatter___sharedIntegerFormatter;
    _sharedIntegerFormatter___sharedIntegerFormatter = (uint64_t)v1;

    [(id)_sharedIntegerFormatter___sharedIntegerFormatter setUsesGroupingSeparator:0];
    id v0 = (void *)_sharedIntegerFormatter___sharedIntegerFormatter;
  }

  return v0;
}

void sub_1B5A9165C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A91744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A91848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9196C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A91A08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A91C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A91D4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A91F20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9206C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A923AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1B5A9252C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A925F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A92714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1B5A92958(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A92B58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A92D48(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B5A93004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9316C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9326C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A933C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9356C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9362C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A936D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A93774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9388C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A93990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A93A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A93C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A93CC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *operatorDescriptionForPredicate(void *a1)
{
  unint64_t v1 = [a1 compoundPredicateType];
  if (v1 > 2) {
    return 0;
  }
  else {
    return off_1E61228F0[v1];
  }
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_1B5A93DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A93EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A94064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5A941CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A94344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1B5A94470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A945DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A946B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9484C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A94A98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A94CC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A94E4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A94F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A950A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9524C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A95340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9544C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A954DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9562C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *EFStringWithUInt64(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v1 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__str = v1;
  long long v6 = v1;
  int v2 = snprintf(__str, 0x20uLL, "%llu", a1);
  id v3 = (__CFString *)CFStringCreateWithBytes(0, (const UInt8 *)__str, v2, 0x600u, 0);

  return v3;
}

__CFString *EFStringWithUnsignedInteger(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v1 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__str = v1;
  long long v6 = v1;
  int v2 = snprintf(__str, 0x20uLL, "%lu", a1);
  id v3 = (__CFString *)CFStringCreateWithBytes(0, (const UInt8 *)__str, v2, 0x600u, 0);

  return v3;
}

void sub_1B5A957EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A958F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A95FCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A96080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A963F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B5A964F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9667C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A96754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A96908(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A96A04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A96A70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A96AF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A96B80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A96BFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A96CC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A96D10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A96E6C(_Unwind_Exception *a1)
{
  unint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1B5A97154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9730C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1B5A97410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A975B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_1B5A97690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9770C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A978D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A97990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A97A40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A97C4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A97D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A97F4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9805C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9818C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9825C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A982DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A98388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A98430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A98528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A98644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A986E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *_EFRepairString(void *a1)
{
  long long v1 = a1;
  if (![(__CFString *)v1 length]
    || (uint64_t v2 = [(__CFString *)v1 fastestEncoding], v2 == 4)
    || v2 == 1)
  {
    id v3 = v1;
LABEL_5:
    unint64_t v4 = v3;
    goto LABEL_6;
  }
  CStringPtr = CFStringGetCStringPtr(v1, 4u);
  uint64_t v7 = v1;
  uint64_t v8 = v7;
  if (CStringPtr)
  {
    unint64_t v4 = v7;
    goto LABEL_6;
  }
  uint64_t v9 = self;

  if (!v9)
  {

LABEL_45:
    id v3 = v8;
    goto LABEL_5;
  }
  int64_t v68 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  int64_t v67 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v64 = 0xAAAAAAAAAAAAAAAALL;
  long long v60 = v10;
  long long v61 = v10;
  long long v58 = v10;
  long long v59 = v10;
  long long v56 = v10;
  long long v57 = v10;
  *(_OWORD *)buffer = v10;
  long long v55 = v10;
  CFIndex Length = CFStringGetLength(v8);
  int v62 = v8;
  uint64_t v65 = 0;
  CFIndex v66 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v8);
  if (CharactersPtr) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = CFStringGetCStringPtr(v8, 0x600u);
  }
  unint64_t v64 = (unint64_t)v12;
  int64_t v67 = 0;
  int64_t v68 = 0;
  if (Length >= 1)
  {
    uint64_t v13 = 0;
    int64_t v14 = 0;
    int64_t v15 = 0;
    UniChar v16 = 0;
    BOOL v17 = 1;
    uint64_t v18 = 64;
    while (1)
    {
      if ((unint64_t)v15 >= 4) {
        uint64_t v19 = 4;
      }
      else {
        uint64_t v19 = v15;
      }
      if (v66 <= v15)
      {
        if (v16 >> 10 == 54) {
          goto LABEL_43;
        }
        UniChar v20 = 0;
      }
      else
      {
        if (CharactersPtr)
        {
          UniChar v20 = CharactersPtr[v15 + v65];
        }
        else if (v64)
        {
          UniChar v20 = *(char *)(v64 + v65 + v15);
        }
        else
        {
          if (v68 <= v15 || v14 > v15)
          {
            uint64_t v22 = -v19;
            uint64_t v23 = v19 + v13;
            uint64_t v24 = v18 - v19;
            int64_t v25 = v15 + v22;
            int64_t v26 = v25 + 64;
            if (v25 + 64 >= v66) {
              int64_t v26 = v66;
            }
            int64_t v67 = v25;
            int64_t v68 = v26;
            v27.location = v25 + v65;
            if (v66 >= v24) {
              uint64_t v28 = v24;
            }
            else {
              uint64_t v28 = v66;
            }
            v27.length = v28 + v23;
            CFStringGetCharacters(v62, v27, buffer);
            int64_t v14 = v67;
          }
          UniChar v20 = buffer[v15 - v14];
        }
        if ((v16 >> 10 == 54) != (v20 >> 10 == 55)) {
          goto LABEL_43;
        }
      }
      BOOL v17 = ++v15 < Length;
      --v13;
      ++v18;
      UniChar v16 = v20;
      if (Length == v15) {
        goto LABEL_43;
      }
    }
  }
  UniChar v16 = 0;
  BOOL v17 = 0;
LABEL_43:

  if (!v17 && (v16 & 0xFC00) != 0xD800) {
    goto LABEL_45;
  }
  unint64_t v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", -[__CFString length](v8, "length"));
  unint64_t v29 = v8;
  unint64_t v30 = self;

  if (v30)
  {
    *(void *)&long long v31 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v60 = v31;
    long long v61 = v31;
    long long v58 = v31;
    long long v59 = v31;
    long long v56 = v31;
    long long v57 = v31;
    *(_OWORD *)buffer = v31;
    long long v55 = v31;
    unsigned int v51 = v29;
    CFIndex v32 = CFStringGetLength(v29);
    int v62 = v29;
    uint64_t v65 = 0;
    CFIndex v66 = v32;
    CharactersPtr = CFStringGetCharactersPtr(v29);
    if (CharactersPtr) {
      id v33 = 0;
    }
    else {
      id v33 = CFStringGetCStringPtr(v29, 0x600u);
    }
    unint64_t v64 = (unint64_t)v33;
    int64_t v67 = 0;
    int64_t v68 = 0;
    if (v32 >= 1)
    {
      uint64_t v34 = 0;
      int64_t v35 = 0;
      BOOL v36 = 0;
      __int16 v37 = 0;
      uint64_t v38 = 64;
      do
      {
        if ((unint64_t)v35 >= 4) {
          uint64_t v39 = 4;
        }
        else {
          uint64_t v39 = v35;
        }
        __int16 v53 = -21846;
        CFIndex v40 = v66;
        if (v66 <= v35)
        {
          BOOL v42 = 0;
          __int16 v53 = 0;
        }
        else
        {
          if (CharactersPtr)
          {
            UniChar v41 = CharactersPtr[v35 + v65];
          }
          else if (v64)
          {
            UniChar v41 = *(char *)(v64 + v65 + v35);
          }
          else
          {
            int64_t v44 = v67;
            if (v68 <= v35 || v67 > v35)
            {
              uint64_t v46 = -v39;
              uint64_t v47 = v39 + v34;
              uint64_t v48 = v38 - v39;
              int64_t v49 = v35 + v46;
              int64_t v50 = v49 + 64;
              if (v49 + 64 >= v66) {
                int64_t v50 = v66;
              }
              int64_t v67 = v49;
              int64_t v68 = v50;
              if (v66 >= v48) {
                CFIndex v40 = v48;
              }
              v70.length = v40 + v47;
              v70.location = v49 + v65;
              CFStringGetCharacters(v62, v70, buffer);
              int64_t v44 = v67;
            }
            UniChar v41 = buffer[v35 - v44];
          }
          __int16 v53 = v41;
          BOOL v42 = (v41 & 0xFC00) == 55296;
          if (v36 && (v41 & 0xFC00) == 56320)
          {
            v52[0] = v37;
            v52[1] = v41;
            uint64_t v43 = (void *)[[NSString alloc] initWithCharacters:v52 length:2];
            [(__CFString *)v4 appendString:v43];
            goto LABEL_74;
          }
          if ((v41 & 0xF800 | 0x400) == 0xDC00) {
            goto LABEL_75;
          }
        }
        uint64_t v43 = (void *)[[NSString alloc] initWithCharacters:&v53 length:1];
        [(__CFString *)v4 appendString:v43];
LABEL_74:

LABEL_75:
        ++v35;
        __int16 v37 = v53;
        --v34;
        ++v38;
        BOOL v36 = v42;
      }
      while (v32 != v35);
    }
    unint64_t v29 = v51;
  }

LABEL_6:

  return v4;
}

void sub_1B5A98BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1B5A98CDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A98D68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A98ED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A98F7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9900C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A990BC(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B5A991B0(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B5A9923C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A992B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9933C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A993A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9956C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A995FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9968C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A99754(_Unwind_Exception *a1)
{
  unint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1B5A99840(_Unwind_Exception *a1)
{
  unint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1B5A99980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A99A2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A99A98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A99B04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A99B70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A99BDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A99C60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A99CD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A99D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A99E24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (!v13) {

  }
  _Unwind_Resume(a1);
}

uint64_t EFCopyResponseDataForURLRequest(void *a1, void *a2, void *a3, uint64_t a4)
{
  return objc_claimAutoreleasedReturnValue();
}

id _EFCopyResponseDataForURLRequest(void *a1, void *a2, void *a3, uint64_t a4, double a5)
{
  id v9 = a1;
  id v10 = a2;
  uint64_t v11 = objc_alloc_init(_EFURLConnectionDelegate);
  uint64_t v12 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
  uint64_t v13 = v12;
  if (v9) {
    objc_msgSend(v12, "set_sourceApplicationBundleIdentifier:", v9);
  }
  int64_t v14 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v13 delegate:v11 delegateQueue:0];
  int64_t v15 = [v14 dataTaskWithRequest:v10];
  UniChar v16 = v15;
  if (v15)
  {
    [v15 resume];
    BOOL v17 = [(_EFURLConnectionDelegate *)v11 future];
    uint64_t v18 = [v17 resultWithTimeout:a4 error:a5];

    if (a3)
    {
      *a3 = [(_EFURLConnectionDelegate *)v11 response];
    }
    [v14 invalidateAndCancel];
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

void sub_1B5A9A02C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void EFPostUTF8FormData(void *a1, uint64_t a2, void *a3, uint64_t a4, double a5)
{
  id v12 = a1;
  id v9 = a3;
  id v10 = [MEMORY[0x1E4F28E88] requestWithURL:a2];
  [v10 setHTTPMethod:@"POST"];
  [v10 addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
  [v10 setHTTPBody:v9];
  id v11 = _EFCopyResponseDataForURLRequest(v12, v10, 0, a4, a5);
}

void sub_1B5A9A15C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9A230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9A3A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9A44C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9A4BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9A580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9A5F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9A680(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9A74C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9A7BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9A980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9A9E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9AB6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9AD18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9ADF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9AE90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9AF38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9B010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9B124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9B1B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9B290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9B3D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9B4D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9B55C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9B638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9B7F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9B890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9B984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9BB40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9BCA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9BE5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9BF10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9BFF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9C1DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Block_object_dispose((const void *)(v16 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B5A9C340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9C510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9C604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1B5A9C6DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9C7DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9CA14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,void *a28,void *a29)
{
  id v33 = v31;

  _Unwind_Resume(a1);
}

void sub_1B5A9CB60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9CC8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9CE90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9D054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9D0F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9D23C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9D404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9D4B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9D520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9D5A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9D620(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9D6BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9D734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9D7A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9D91C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9D978()
{
}

void sub_1B5A9DA34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9DADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9DC7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9DE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9DF98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9E180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B5A9E254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9E378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9E474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9E550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9E5D4(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B5A9E6A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9E718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9E828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9E8C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9E9DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9EA84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9EB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9EBF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9ECC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9ED6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9EFE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9F0A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9F14C(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B5A9F208(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B5A9F2AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9F338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9F3D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9F484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9F520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9F5B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9F658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9F6C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9F7B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9F8B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9F920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9F9DC(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B5A9FA64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9FAFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9FB98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9FC44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9FCD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9FD54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9FDE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9FE4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9FEC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A9FF74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA0020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA00C4(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B5AA01A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA0398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA04C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_1B5AA05B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA06B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA07B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA0A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA0BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA0D90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _ef_log_EFProtectedFile()
{
  if (_ef_log_EFProtectedFile_onceToken != -1) {
    dispatch_once(&_ef_log_EFProtectedFile_onceToken, &__block_literal_global_24);
  }
  id v0 = (void *)_ef_log_EFProtectedFile_log;

  return v0;
}

void sub_1B5AA10EC(_Unwind_Exception *a1)
{
  unint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1B5AA1268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA1308(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA1350(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA13B0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B5AA14A8(_Unwind_Exception *exception_object)
{
}

void sub_1B5AA1714(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);
  _Unwind_Resume(a1);
}

void sub_1B5AA17AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA196C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B5AA1B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA1BB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA1C00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA1CF4(_Unwind_Exception *exception_object)
{
}

void sub_1B5AA1D60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA1EC8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B5AA200C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA2360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t EFMarkFileAsPurgeable(void *a1, void *a2)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  int v4 = open((const char *)[v3 fileSystemRepresentation], 0);
  int v5 = v4;
  if (v4 < 0)
  {
    uint64_t v11 = *__error();
    if (a2)
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F289D0];
      v21[0] = v3;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      *a2 = [v12 errorWithDomain:*MEMORY[0x1E4F28798] code:v11 userInfo:v13];
    }
    id v9 = EFPurgeableFileLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int64_t v14 = [v3 path];
      EFMarkFileAsPurgeable_cold_1(v14, (uint64_t)v19, v11);
    }
  }
  else
  {
    v19[0] = 65539;
    int v6 = ffsctl(v4, 0xC0084A44uLL, v19, 0);
    if (!v6)
    {
      close(v5);
      uint64_t v15 = 1;
      goto LABEL_13;
    }
    close(v5);
    if (a2)
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F289D0];
      id v18 = v3;
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      *a2 = [v7 errorWithDomain:*MEMORY[0x1E4F28798] code:v6 userInfo:v8];
    }
    id v9 = EFPurgeableFileLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [v3 path];
      EFMarkFileAsPurgeable_cold_2(v10, (uint64_t)v19, v6);
    }
  }

  uint64_t v15 = 0;
LABEL_13:

  return v15;
}

void sub_1B5AA2600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id EFPurgeableFileLog()
{
  if (EFPurgeableFileLog_onceToken != -1) {
    dispatch_once(&EFPurgeableFileLog_onceToken, &__block_literal_global_25);
  }
  id v0 = (void *)EFPurgeableFileLog_log;

  return v0;
}

uint64_t EFMarkFileAsPurgeableFD(int a1)
{
  uint64_t v2 = 65539;
  return ffsctl(a1, 0xC0084A44uLL, &v2, 0);
}

uint64_t EFGetFileIsPurgeableFD(int a1, BOOL *a2)
{
  uint64_t v4 = 0;
  uint64_t result = ffsctl(a1, 0x40084A47uLL, &v4, 0);
  if (a2)
  {
    if (!result) {
      *a2 = (v4 & 0xE00) != 0;
    }
  }
  return result;
}

void __EFPurgeableFileLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EFPurgeableFile");
  long long v1 = (void *)EFPurgeableFileLog_log;
  EFPurgeableFileLog_log = (uint64_t)v0;
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  return result;
}

void sub_1B5AA2814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA289C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA292C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA2998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA2A70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA2B1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA2BD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA2CEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA2DB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA2E3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA2EBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA2F58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA3010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA30F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA3190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA3288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA33EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA3538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA35E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA37BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA388C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA3998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA3AA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA3B3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA3BC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA3CB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA3D70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA3DD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA3EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA3F44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA3FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA40CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA4134(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA41C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA4338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA4404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA448C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA4514(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA459C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA4650(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA46BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA4774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA4838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA4930(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA4A4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA4B10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA4C88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA4D28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA4F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA50DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA5224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA52F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA53D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA546C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA550C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA55AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA564C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA56F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA5794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA583C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA58B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA5928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA59E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA5AAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA5B74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA5C3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA5CDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA5DC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA5ED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA5F94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA6010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA6080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA60F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA6160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA6200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA62B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA6358(_Unwind_Exception *a1)
{
}

void sub_1B5AA64C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA65AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA66B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA67A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA686C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA693C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA69C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA6B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA6C64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA7064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA7274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA7400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA7514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA7664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA76F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA778C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA7928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA7994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA7ACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *__EFSQLVerboseDebugLoggingEnabled_block_invoke()
{
  os_log_t v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v1 = [v0 BOOLForKey:@"EFSQLVerboseDebugLoggingEnabled"];

  uint64_t result = getenv("OS_ACTIVITY_DT_MODE");
  if (result) {
    char v3 = v1;
  }
  else {
    char v3 = 1;
  }
  EFSQLVerboseDebugLoggingEnabled_enabled = v3;
  return result;
}

void sub_1B5AA7B48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA7C68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA7E18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA7E90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA7EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA7F98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA80B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA8254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___registerSQLiteErrorDomainUserInfoValueProvider_block_invoke()
{
  return [MEMORY[0x1E4F28C58] setUserInfoValueProviderForDomain:@"EFSQLiteErrorDomain" provider:&__block_literal_global_165];
}

id ___registerSQLiteErrorDomainUserInfoValueProvider_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  if (![a3 isEqualToString:*MEMORY[0x1E4F28228]])
  {
    uint64_t v8 = 0;
    goto LABEL_177;
  }
  uint64_t v5 = [v4 code];
  int v6 = [v4 userInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"EFSQLiteExtendedErrorCodeKey"];

  if (v7) {
    uint64_t v5 = [v7 intValue];
  }
  id v9 = NSString;
  if ((int)v5 <= 538)
  {
    if ((int)v5 > 100)
    {
      switch((int)v5)
      {
        case 256:
          id v10 = @"SQLITE_OK_LOAD_PERMANENTLY";
          break;
        case 257:
          id v10 = @"SQLITE_ERROR_MISSING_COLLSEQ";
          break;
        case 258:
        case 259:
        case 260:
        case 263:
        case 265:
        case 268:
        case 269:
        case 271:
        case 272:
        case 273:
        case 274:
        case 276:
        case 277:
        case 278:
        case 280:
        case 281:
        case 282:
          goto LABEL_116;
        case 261:
          id v10 = @"SQLITE_BUSY_RECOVERY";
          break;
        case 262:
          id v10 = @"SQLITE_LOCKED_SHAREDCACHE";
          break;
        case 264:
          id v10 = @"SQLITE_READONLY_RECOVERY";
          break;
        case 266:
          id v10 = @"SQLITE_IOERR_READ";
          break;
        case 267:
          id v10 = @"SQLITE_CORRUPT_VTAB";
          break;
        case 270:
          id v10 = @"SQLITE_CANTOPEN_NOTEMPDIR";
          break;
        case 275:
          id v10 = @"SQLITE_CONSTRAINT_CHECK";
          break;
        case 279:
          id v10 = @"SQLITE_AUTH_USER";
          break;
        case 283:
          id v10 = @"SQLITE_NOTICE_RECOVER_WAL";
          break;
        case 284:
          id v10 = @"SQLITE_WARNING_AUTOINDEX";
          break;
        default:
          switch((int)v5)
          {
            case 512:
              id v10 = @"SQLITE_OK_SYMLINK";
              break;
            case 513:
              id v10 = @"SQLITE_ERROR_RETRY";
              break;
            case 514:
            case 515:
            case 519:
            case 521:
            case 524:
            case 525:
            case 527:
            case 528:
            case 529:
            case 530:
              goto LABEL_116;
            case 516:
              id v10 = @"SQLITE_ABORT_ROLLBACK";
              break;
            case 517:
              id v10 = @"SQLITE_BUSY_SNAPSHOT";
              break;
            case 518:
              id v10 = @"SQLITE_LOCKED_VTAB";
              break;
            case 520:
              id v10 = @"SQLITE_READONLY_CANTLOCK";
              break;
            case 522:
              id v10 = @"SQLITE_IOERR_SHORT_READ";
              break;
            case 523:
              id v10 = @"SQLITE_CORRUPT_SEQUENCE";
              break;
            case 526:
              id v10 = @"SQLITE_CANTOPEN_ISDIR";
              break;
            case 531:
              id v10 = @"SQLITE_CONSTRAINT_COMMITHOOK";
              break;
            default:
              if (v5 != 101) {
                goto LABEL_116;
              }
              id v10 = @"SQLITE_DONE";
              break;
          }
          break;
      }
    }
    else
    {
      id v10 = @"SQLITE_OK";
      switch((int)v5)
      {
        case 0:
          goto LABEL_176;
        case 1:
          id v10 = @"SQLITE_ERROR";
          break;
        case 2:
          id v10 = @"SQLITE_INTERNAL";
          break;
        case 3:
          id v10 = @"SQLITE_PERM";
          break;
        case 4:
          id v10 = @"SQLITE_ABORT";
          break;
        case 5:
          id v10 = @"SQLITE_BUSY";
          break;
        case 6:
          id v10 = @"SQLITE_LOCKED";
          break;
        case 7:
          id v10 = @"SQLITE_NOMEM";
          break;
        case 8:
          id v10 = @"SQLITE_READONLY";
          break;
        case 9:
          id v10 = @"SQLITE_INTERRUPT";
          break;
        case 10:
          id v10 = @"SQLITE_IOERR";
          break;
        case 11:
          id v10 = @"SQLITE_CORRUPT";
          break;
        case 12:
          id v10 = @"SQLITE_NOTFOUND";
          break;
        case 13:
          id v10 = @"SQLITE_FULL";
          break;
        case 14:
          id v10 = @"SQLITE_CANTOPEN";
          break;
        case 15:
          id v10 = @"SQLITE_PROTOCOL";
          break;
        case 16:
          id v10 = @"SQLITE_EMPTY";
          break;
        case 17:
          id v10 = @"SQLITE_SCHEMA";
          break;
        case 18:
          id v10 = @"SQLITE_TOOBIG";
          break;
        case 19:
          id v10 = @"SQLITE_CONSTRAINT";
          break;
        case 20:
          id v10 = @"SQLITE_MISMATCH";
          break;
        case 21:
          id v10 = @"SQLITE_MISUSE";
          break;
        case 22:
          id v10 = @"SQLITE_NOLFS";
          break;
        case 23:
          id v10 = @"SQLITE_AUTH";
          break;
        case 24:
          id v10 = @"SQLITE_FORMAT";
          break;
        case 25:
          id v10 = @"SQLITE_RANGE";
          break;
        case 26:
          id v10 = @"SQLITE_NOTADB";
          break;
        case 27:
          id v10 = @"SQLITE_NOTICE";
          break;
        case 28:
          id v10 = @"SQLITE_WARNING";
          break;
        default:
          if (v5 != 100) {
            goto LABEL_116;
          }
          id v10 = @"SQLITE_ROW";
          break;
      }
    }
    goto LABEL_176;
  }
  if ((int)v5 > 2569)
  {
    if ((int)v5 > 5129)
    {
      if ((int)v5 > 6665)
      {
        if ((int)v5 > 7433)
        {
          switch(v5)
          {
            case 0x1D0A:
              id v10 = @"SQLITE_IOERR_BEGIN_ATOMIC";
              goto LABEL_176;
            case 0x1E0A:
              id v10 = @"SQLITE_IOERR_COMMIT_ATOMIC";
              goto LABEL_176;
            case 0x1F0A:
              id v10 = @"SQLITE_IOERR_ROLLBACK_ATOMIC";
              goto LABEL_176;
          }
        }
        else
        {
          switch(v5)
          {
            case 0x1A0A:
              id v10 = @"SQLITE_IOERR_CONVPATH";
              goto LABEL_176;
            case 0x1B0A:
              id v10 = @"SQLITE_IOERR_VNODE";
              goto LABEL_176;
            case 0x1C0A:
              id v10 = @"SQLITE_IOERR_AUTH";
              goto LABEL_176;
          }
        }
      }
      else if ((int)v5 > 5897)
      {
        switch(v5)
        {
          case 0x170A:
            id v10 = @"SQLITE_IOERR_DELETE_NOENT";
            goto LABEL_176;
          case 0x180A:
            id v10 = @"SQLITE_IOERR_MMAP";
            goto LABEL_176;
          case 0x190A:
            id v10 = @"SQLITE_IOERR_GETTEMPPATH";
            goto LABEL_176;
        }
      }
      else
      {
        switch(v5)
        {
          case 0x140A:
            id v10 = @"SQLITE_IOERR_SHMLOCK";
            goto LABEL_176;
          case 0x150A:
            id v10 = @"SQLITE_IOERR_SHMMAP";
            goto LABEL_176;
          case 0x160A:
            id v10 = @"SQLITE_IOERR_SEEK";
            goto LABEL_176;
        }
      }
    }
    else if ((int)v5 > 3593)
    {
      if ((int)v5 > 4361)
      {
        switch(v5)
        {
          case 0x110A:
            id v10 = @"SQLITE_IOERR_DIR_CLOSE";
            goto LABEL_176;
          case 0x120A:
            id v10 = @"SQLITE_IOERR_SHMOPEN";
            goto LABEL_176;
          case 0x130A:
            id v10 = @"SQLITE_IOERR_SHMSIZE";
            goto LABEL_176;
        }
      }
      else
      {
        switch(v5)
        {
          case 0xE0A:
            id v10 = @"SQLITE_IOERR_CHECKRESERVEDLOCK";
            goto LABEL_176;
          case 0xF0A:
            id v10 = @"SQLITE_IOERR_LOCK";
            goto LABEL_176;
          case 0x100A:
            id v10 = @"SQLITE_IOERR_CLOSE";
            goto LABEL_176;
        }
      }
    }
    else if ((int)v5 > 2834)
    {
      switch(v5)
      {
        case 0xB13:
          id v10 = @"SQLITE_CONSTRAINT_PINNED";
          goto LABEL_176;
        case 0xC0A:
          id v10 = @"SQLITE_IOERR_NOMEM";
          goto LABEL_176;
        case 0xD0A:
          id v10 = @"SQLITE_IOERR_ACCESS";
          goto LABEL_176;
      }
    }
    else
    {
      switch(v5)
      {
        case 0xA0A:
          id v10 = @"SQLITE_IOERR_DELETE";
          goto LABEL_176;
        case 0xA13:
          id v10 = @"SQLITE_CONSTRAINT_ROWID";
          goto LABEL_176;
        case 0xB0A:
          id v10 = @"SQLITE_IOERR_BLOCKED";
          goto LABEL_176;
      }
    }
LABEL_116:
    objc_msgSend(NSString, "stringWithFormat:", @"unknown error code: %d", v5);
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_176;
  }
  if ((int)v5 > 1293)
  {
    if ((int)v5 > 1801)
    {
      if ((int)v5 > 2066)
      {
        switch(v5)
        {
          case 0x813:
            id v10 = @"SQLITE_CONSTRAINT_UNIQUE";
            goto LABEL_176;
          case 0x90A:
            id v10 = @"SQLITE_IOERR_RDLOCK";
            goto LABEL_176;
          case 0x913:
            id v10 = @"SQLITE_CONSTRAINT_VTAB";
            goto LABEL_176;
        }
      }
      else
      {
        switch(v5)
        {
          case 0x70A:
            id v10 = @"SQLITE_IOERR_FSTAT";
            goto LABEL_176;
          case 0x713:
            id v10 = @"SQLITE_CONSTRAINT_TRIGGER";
            goto LABEL_176;
          case 0x80A:
            id v10 = @"SQLITE_IOERR_UNLOCK";
            goto LABEL_176;
        }
      }
    }
    else if ((int)v5 > 1545)
    {
      switch(v5)
      {
        case 0x60A:
          id v10 = @"SQLITE_IOERR_TRUNCATE";
          goto LABEL_176;
        case 0x60E:
          id v10 = @"SQLITE_CANTOPEN_SYMLINK";
          goto LABEL_176;
        case 0x613:
          id v10 = @"SQLITE_CONSTRAINT_PRIMARYKEY";
          goto LABEL_176;
      }
    }
    else
    {
      switch(v5)
      {
        case 0x50E:
          id v10 = @"SQLITE_CANTOPEN_DIRTYWAL";
          goto LABEL_176;
        case 0x513:
          id v10 = @"SQLITE_CONSTRAINT_NOTNULL";
          goto LABEL_176;
        case 0x608:
          id v10 = @"SQLITE_READONLY_DIRECTORY";
          goto LABEL_176;
      }
    }
    goto LABEL_116;
  }
  if ((int)v5 > 1031)
  {
    if ((int)v5 > 1042)
    {
      switch(v5)
      {
        case 0x413:
          id v10 = @"SQLITE_CONSTRAINT_FUNCTION";
          goto LABEL_176;
        case 0x508:
          id v10 = @"SQLITE_READONLY_CANTINIT";
          goto LABEL_176;
        case 0x50A:
          id v10 = @"SQLITE_IOERR_DIR_FSYNC";
          goto LABEL_176;
      }
    }
    else
    {
      switch(v5)
      {
        case 0x408:
          id v10 = @"SQLITE_READONLY_DBMOVED";
          goto LABEL_176;
        case 0x40A:
          id v10 = @"SQLITE_IOERR_FSYNC";
          goto LABEL_176;
        case 0x40E:
          id v10 = @"SQLITE_CANTOPEN_CONVPATH";
          goto LABEL_176;
      }
    }
    goto LABEL_116;
  }
  if ((int)v5 > 777)
  {
    switch(v5)
    {
      case 0x30A:
        id v10 = @"SQLITE_IOERR_WRITE";
        goto LABEL_176;
      case 0x30E:
        id v10 = @"SQLITE_CANTOPEN_FULLPATH";
        goto LABEL_176;
      case 0x313:
        id v10 = @"SQLITE_CONSTRAINT_FOREIGNKEY";
        goto LABEL_176;
    }
    goto LABEL_116;
  }
  if (v5 == 539)
  {
    id v10 = @"SQLITE_NOTICE_RECOVER_ROLLBACK";
    goto LABEL_176;
  }
  if (v5 == 769)
  {
    id v10 = @"SQLITE_ERROR_SNAPSHOT";
    goto LABEL_176;
  }
  if (v5 != 776) {
    goto LABEL_116;
  }
  id v10 = @"SQLITE_READONLY_ROLLBACK";
LABEL_176:
  uint64_t v8 = [v9 stringWithFormat:@"%@: %s", v10, sqlite3_errstr(v5)];

LABEL_177:

  return v8;
}

void sub_1B5AA8B88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *EFSQLStringForCollation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return &stru_1F0EAE5A8;
  }
  else {
    return off_1E61231C8[a1 - 1];
  }
}

__CFString *EFSQLStringForOrderDirection(uint64_t a1)
{
  char v1 = &stru_1F0EAE5A8;
  if (a1 == 1) {
    char v1 = @"ASC";
  }
  if (a1 == 2) {
    return @"DESC";
  }
  else {
    return v1;
  }
}

void sub_1B5AA8DD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA8E5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA8EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA8F90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA9000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA9218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA9468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA9520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA9584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA979C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA984C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA9940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5AA9A68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA9AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA9BB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA9C60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA9D3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA9DBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA9E94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AA9F84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAA070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAA168(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAA264(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAA350(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAA448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAA570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAA668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAA760(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAA850(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAA934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAAA24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAAB3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAAC58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAAD58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAAE8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAAF90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAB07C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAB164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAB25C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAB348(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAB430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAB4FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAB568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAB690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAB72C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAB838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAB928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAB9C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AABAA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AABB40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AABC20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AABCBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AABD9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AABE38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AABEA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AABF68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AABFE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAC108(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAC1A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAC244(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAC364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAC408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAC58C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAC6F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAC828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAC904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAC97C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AACB5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AACD10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AACE18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AACFC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAD0A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAD2AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAD3FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAD4F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAD608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAD6B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAD718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAD950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AADA34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AADB2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1B5AADC4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5AADD88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AADFFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAE104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAE2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAE474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAE540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAE650(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAE700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAE8BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAEA48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAEBF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAED58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAEDBC()
{
}

void sub_1B5AAEDC4()
{
}

void sub_1B5AAEDCC()
{
}

void sub_1B5AAEDD4()
{
}

void sub_1B5AAEDDC()
{
}

void sub_1B5AAEF40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAF058(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAF0E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAF1A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAF304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAF39C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAF45C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAF75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id _keyForClassInstanceProperty(void *a1, objc_class *a2, const char *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v19 = a1;
  Name = class_getName(a2);
  size_t v6 = strlen(Name);
  uint64_t v7 = sel_getName(a3);
  uint64_t v22 = Name;
  size_t v8 = strlen(v7);
  id v21 = v19;
  id v9 = (const char *)[v21 UTF8String];
  size_t v10 = strlen(v9);
  uint64_t v20 = &v18;
  size_t v11 = v10 + 1 + v6;
  MEMORY[0x1F4188790](v10);
  int64_t v14 = (char *)&v18 - v13;
  if ((v15 & 1) == 0) {
    memset((char *)&v18 - v13, 170, v12);
  }
  memcpy(v14, v9, v10);
  v14[v10] = 1;
  memcpy(&v14[v10 + 1], v22, v6);
  v14[v11] = 46;
  memcpy(&v14[v11 + 1], v7, v8);
  v14[v11 + 1 + v8] = 0;
  uint64_t v16 = [NSString stringWithUTF8String:v14];

  return v16;
}

void sub_1B5AAF984(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAFB68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

id _keyForLookupValue(void *a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const char *)[a1 UTF8String];
  size_t v5 = strlen(v4);
  id v6 = [v3 description];
  uint64_t v7 = (const char *)[v6 UTF8String];

  size_t v8 = strlen(v7);
  MEMORY[0x1F4188790](v8);
  size_t v11 = (char *)v15 - v10;
  if ((v12 & 1) == 0) {
    memset((char *)v15 - v10, 170, v9);
  }
  memcpy(v11, v4, v5);
  v11[v5] = 1;
  memcpy(&v11[v5 + 1], v7, v8);
  v11[v8 + 1 + v5] = 0;
  uint64_t v13 = [NSString stringWithUTF8String:v11];

  return v13;
}

void sub_1B5AAFD28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AAFF60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _keyForProtocolInstanceProperty(void *a1, Protocol *a2, const char *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v19 = a1;
  Name = protocol_getName(a2);
  size_t v6 = strlen(Name);
  uint64_t v7 = sel_getName(a3);
  uint64_t v22 = Name;
  size_t v8 = strlen(v7);
  id v21 = v19;
  size_t v9 = (const char *)[v21 UTF8String];
  size_t v10 = strlen(v9);
  uint64_t v20 = &v18;
  size_t v11 = v10 + 2 + v6;
  MEMORY[0x1F4188790](v10);
  int64_t v14 = (char *)&v18 - v13;
  if ((v15 & 1) == 0) {
    memset((char *)&v18 - v13, 170, v12);
  }
  memcpy(v14, v9, v10);
  *(_WORD *)&v14[v10] = 15361;
  memcpy(&v14[v10 + 2], v22, v6);
  *(_WORD *)&v14[v11] = 11838;
  memcpy(&v14[v11 + 2], v7, v8);
  v14[v11 + 2 + v8] = 0;
  uint64_t v16 = [NSString stringWithUTF8String:v14];

  return v16;
}

void sub_1B5AB015C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB0298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB0384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB0454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB05BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB06DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB083C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB0CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB0F0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB1054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB11D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB1324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB1404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB14C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB1684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB1834(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB1930(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B5AB19EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB1A98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB1D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB1E84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB1FA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB20FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB2278(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB2598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB2708(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _ef_log_EFSQLQueryGenerator()
{
  if (_ef_log_EFSQLQueryGenerator_onceToken != -1) {
    dispatch_once(&_ef_log_EFSQLQueryGenerator_onceToken, &__block_literal_global_34);
  }
  os_log_t v0 = (void *)_ef_log_EFSQLQueryGenerator_log;

  return v0;
}

void sub_1B5AB319C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB34B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB35A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB396C(uint64_t a1)
{
  *(void *)(v3 - 104) = a1;

  _Unwind_Resume(*(_Unwind_Exception **)(v3 - 104));
}

void sub_1B5AB3A7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB3C48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB3EA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB3FA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB40E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB425C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB42E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB43C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB44C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB45B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB465C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB4714(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB4828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB49C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB4AC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB4B60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB4C54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB4D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB50FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB521C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB5744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB59EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB5B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB5C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB5C9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB5D30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB5E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB5EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB5F8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB60E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB6160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB61C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB6278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB6338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB64CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB6544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB6638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB66FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB6770(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB6848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB68EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB6AC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB6B64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB6BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB6CC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB6D84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB6F0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B5AB6FFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB7074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB70F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB7180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB71E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB7260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB72DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB7488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  _Block_object_dispose(&a22, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_1B5AB7534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB75CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB76A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB7780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB77F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void EFSaveTailspin(unint64_t a1, void *a2)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (_os_feature_enabled_impl())
  {
    if (a1 > 0xA) {
      id v4 = @"unknown-cause";
    }
    else {
      id v4 = sContextNames[3 * a1];
    }
    memset(__b, 170, 0x288uLL);
    LODWORD(__b[4]) = 0;
    *(void *)int8x16_t v75 = 0xE00000001;
    LODWORD(v76) = 1;
    HIDWORD(v76) = getpid();
    v74[0] = 648;
    int v16 = sysctl(v75, 4u, __b, v74, 0, 0);
    __int16 v17 = __b[4];
    uint64_t v18 = _tsl();
    id v19 = v18;
    if (v16 || (v17 & 0x800) == 0)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = [(__CFString *)v4 UTF8String];
        uint64_t v23 = _shortContextName(a1);
        LODWORD(__b[0]) = 136446466;
        *(void *)((char *)__b + 4) = v22;
        WORD2(__b[1]) = 2114;
        *(void *)((char *)&__b[1] + 6) = v23;
        _os_log_impl(&dword_1B5A59000, v19, OS_LOG_TYPE_DEFAULT, "Saving tailspin for %{public}s (%{public}@)", (uint8_t *)__b, 0x16u);
      }
      char v24 = DRTailspinRequest();
      id v19 = 0;
      if ((v24 & 1) == 0)
      {
        int64_t v25 = _tsl();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          int v71 = _shortContextName(a1);
          LODWORD(__b[0]) = 138543874;
          *(void *)((char *)__b + 4) = v4;
          WORD2(__b[1]) = 2114;
          *(void *)((char *)&__b[1] + 6) = v71;
          HIWORD(__b[2]) = 2114;
          __b[3] = v19;
          _os_log_error_impl(&dword_1B5A59000, v25, OS_LOG_TYPE_ERROR, "Failed to generate %{public}@ (%{public}@) tailspin: %{public}@", (uint8_t *)__b, 0x20u);
        }
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = [(__CFString *)v4 UTF8String];
      id v21 = _shortContextName(a1);
      LODWORD(__b[0]) = 136446466;
      *(void *)((char *)__b + 4) = v20;
      WORD2(__b[1]) = 2114;
      *(void *)((char *)&__b[1] + 6) = v21;
      _os_log_impl(&dword_1B5A59000, v19, OS_LOG_TYPE_INFO, "Skipping tailspin for %{public}s (%{public}@)", (uint8_t *)__b, 0x16u);
    }
    goto LABEL_30;
  }
  if (!os_variant_has_internal_diagnostics()) {
    goto LABEL_15;
  }
  memset(__b, 170, 0x288uLL);
  LODWORD(__b[4]) = 0;
  *(void *)int8x16_t v75 = 0xE00000001;
  LODWORD(v76) = 1;
  HIDWORD(v76) = getpid();
  v74[0] = 648;
  if (!sysctl(v75, 4u, __b, v74, 0, 0) && (__b[4] & 0x800) != 0) {
    goto LABEL_15;
  }
  if (_shouldSaveTailspin_o != -1) {
    dispatch_once(&_shouldSaveTailspin_o, &__block_literal_global_86);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_shouldSaveTailspin_lock);
  if (a1 > 0xA) {
    goto LABEL_14;
  }
  if (_systemTimeScale_o != -1) {
    dispatch_once(&_systemTimeScale_o, &__block_literal_global_97);
  }
  uint64_t v5 = mach_continuous_time();
  uint64_t v7 = _systemTimeScale_machTimebaseInfo;
  unint64_t v6 = *(unsigned int *)algn_1EB4926AC;
  size_t v8 = (void *)_shouldSaveTailspin_last;
  size_t v9 = [NSNumber numberWithInteger:a1];
  size_t v10 = [v8 objectForKeyedSubscript:v9];
  uint64_t v11 = [v10 unsignedIntegerValue];

  unint64_t v12 = v5 * v7 / v6 / 0x3B9ACA00;
  if (v11)
  {
    if (v12 - v11 < _shouldSaveTailspin_threshold)
    {
LABEL_14:
      os_unfair_lock_unlock((os_unfair_lock_t)&_shouldSaveTailspin_lock);
LABEL_15:
      uint64_t v13 = _tsl();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        _shortContextName(a1);
        id v14 = objc_claimAutoreleasedReturnValue();
        uint64_t v15 = [v14 UTF8String];
        LODWORD(__b[0]) = 136446210;
        *(void *)((char *)__b + 4) = v15;
        _os_log_impl(&dword_1B5A59000, v13, OS_LOG_TYPE_INFO, "Skipping tailspin for %{public}s", (uint8_t *)__b, 0xCu);
      }
      goto LABEL_30;
    }
  }
  int64_t v26 = [NSNumber numberWithUnsignedLongLong:v12];
  CFRange v27 = (void *)_shouldSaveTailspin_last;
  uint64_t v28 = [NSNumber numberWithInteger:a1];
  [v27 setObject:v26 forKeyedSubscript:v28];

  os_unfair_lock_unlock((os_unfair_lock_t)&_shouldSaveTailspin_lock);
  unint64_t v29 = _tsl();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    _shortContextName(a1);
    id v30 = objc_claimAutoreleasedReturnValue();
    uint64_t v31 = [v30 UTF8String];
    LODWORD(__b[0]) = 136446210;
    *(void *)((char *)__b + 4) = v31;
    _os_log_impl(&dword_1B5A59000, v29, OS_LOG_TYPE_DEFAULT, "Saving tailspin for %{public}s", (uint8_t *)__b, 0xCu);
  }
  id v72 = v3;
  if (_temporaryTailspinPath_o != -1) {
    dispatch_once(&_temporaryTailspinPath_o, &__block_literal_global_101);
  }
  CFIndex v32 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(v74[0]) = -86;
  int v33 = [v32 fileExistsAtPath:@"/var/mobile/Library/Mail/tailspin-work" isDirectory:v74];
  if (LOBYTE(v74[0])) {
    int v34 = 0;
  }
  else {
    int v34 = v33;
  }
  if (v34 == 1)
  {
    [v32 removeItemAtPath:@"/var/mobile/Library/Mail/tailspin-work" error:0];
  }
  else if (v33)
  {

    goto LABEL_44;
  }
  *(void *)int8x16_t v75 = 0;
  int v35 = [v32 createDirectoryAtPath:@"/var/mobile/Library/Mail/tailspin-work" withIntermediateDirectories:1 attributes:0 error:v75];
  id v36 = *(id *)v75;
  __int16 v37 = v36;
  if (!v35)
  {
    BOOL v42 = _tsl();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      id v43 = [v37 localizedDescription];
      uint64_t v44 = [v43 UTF8String];
      LODWORD(__b[0]) = 138543618;
      *(void *)((char *)__b + 4) = @"/var/mobile/Library/Mail/tailspin-work";
      WORD2(__b[1]) = 2082;
      *(void *)((char *)&__b[1] + 6) = v44;
      _os_log_impl(&dword_1B5A59000, v42, OS_LOG_TYPE_DEFAULT, "Unable to create %{public}@: %{public}s", (uint8_t *)__b, 0x16u);
    }
    uint64_t v38 = _tsl();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      EFSaveTailspin_cold_2(v38, v45, v46, v47, v48, v49, v50, v51);
    }
    UniChar v41 = 0;
    goto LABEL_50;
  }

LABEL_44:
  uint64_t v38 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v39 = _shortContextName(a1);
  CFIndex v40 = [(id)_temporaryTailspinPath_filenameFormatter stringFromDate:v38];
  UniChar v41 = [NSString stringWithFormat:@"%@/mailspin-%@-%@.tailspin", @"/var/mobile/Library/Mail/tailspin-work", v39, v40];

LABEL_50:
  id v52 = v41;
  int v53 = open((const char *)[v52 UTF8String], 514, 438);
  if (v53 == -1)
  {
    int v70 = *__error();
    long long v57 = _tsl();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      EFSaveTailspin_cold_1((uint64_t)v52, v70, v57);
    }
  }
  else
  {
    if (_tailspinMinTimestamp_o != -1) {
      dispatch_once(&_tailspinMinTimestamp_o, &__block_literal_global_115);
    }
    uint64_t v54 = mach_absolute_time();
    uint64_t v55 = _tailspinMinTimestamp_absoluteTicksBeforeNow;
    id v56 = v72;
    long long v57 = [@"Mail EFTailspin: " mutableCopy];
    long long v58 = sContextNames[3 * a1 + 2];
    [v57 appendFormat:@"%s: ", [(__CFString *)v58 UTF8String]];
    id v59 = v56;
    -[NSObject appendFormat:](v57, "appendFormat:", @"%s", [v59 UTF8String]);

    LODWORD(v59) = os_variant_has_internal_diagnostics();
    v74[0] = *MEMORY[0x1E4FBA9A8];
    long long v60 = [NSNumber numberWithUnsignedLongLong:v54 - v55];
    size_t v61 = *MEMORY[0x1E4FBA9B8];
    *(void *)int8x16_t v75 = v60;
    int32x4_t v76 = v57;
    size_t v62 = *MEMORY[0x1E4FBA980];
    v74[1] = v61;
    v74[2] = v62;
    size_t v63 = *MEMORY[0x1E4FBA988];
    uint64_t v77 = MEMORY[0x1E4F1CC38];
    uint64_t v78 = MEMORY[0x1E4F1CC38];
    size_t v64 = *MEMORY[0x1E4FBA9C0];
    v74[3] = v63;
    v74[4] = v64;
    uint64_t v65 = [NSNumber numberWithBool:v59 ^ 1];
    v79 = v65;
    CFIndex v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:5];

    int64_t v67 = dispatch_get_global_queue(9, 0);
    int64_t v68 = _tsl();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v69 = [v52 UTF8String];
      LODWORD(__b[0]) = 136446210;
      *(void *)((char *)__b + 4) = v69;
      _os_log_impl(&dword_1B5A59000, v68, OS_LOG_TYPE_DEFAULT, "Attempting mailspin for: %{public}s", (uint8_t *)__b, 0xCu);
    }

    __b[0] = MEMORY[0x1E4F143A8];
    __b[1] = 3221225472;
    __b[2] = ___generateTailspin_block_invoke;
    __b[3] = &unk_1E6123870;
    LODWORD(__b[5]) = v53;
    __b[4] = v52;
    tailspin_dump_output_with_options();
  }
LABEL_30:
}

void sub_1B5AB8250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

id _tsl()
{
  if (_tsl_o != -1) {
    dispatch_once(&_tsl_o, &__block_literal_global_39);
  }
  os_log_t v0 = (void *)_tsl_h;

  return v0;
}

__CFString *_shortContextName(unint64_t a1)
{
  if (a1 > 0xA)
  {
    uint64_t v2 = @"unknown-cause";
  }
  else
  {
    uint64_t v2 = sContextNames[3 * a1 + 1];
  }
  return v2;
}

void ___tsl_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EFTailspin");
  uint64_t v1 = (void *)_tsl_h;
  _tsl_h = (uint64_t)v0;
}

void ___shouldSaveTailspin_block_invoke()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v1 = (void *)_shouldSaveTailspin_last;
  _shouldSaveTailspin_last = (uint64_t)v0;

  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = (id)[v2 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.mail"];

  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"group.com.apple.mail"];
  uint64_t v5 = v4;
  if (v4 && (uint64_t v6 = [v4 integerForKey:@"MinimumSecondsBetweenTailspins"]) != 0)
  {
    uint64_t v7 = _tsl();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      uint64_t v12 = v6;
      size_t v8 = "Non-standard tailspin rate limit: %ld minimum seconds between tailspins";
      size_t v9 = v7;
      uint32_t v10 = 12;
LABEL_7:
      _os_log_impl(&dword_1B5A59000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v10);
    }
  }
  else
  {
    uint64_t v7 = _tsl();
    uint64_t v6 = 3600;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 67109120;
      LODWORD(v12) = 3600;
      size_t v8 = "Standard tailspin rate limit: %d minimum seconds between tailspins";
      size_t v9 = v7;
      uint32_t v10 = 8;
      goto LABEL_7;
    }
  }

  _shouldSaveTailspin_threshold = v6;
}

void sub_1B5AB8640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___systemTimeScale_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_systemTimeScale_machTimebaseInfo);
}

void ___generateTailspin_block_invoke(uint64_t a1, char a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (fsync(*(_DWORD *)(a1 + 40)) == -1) {
    ___generateTailspin_block_invoke_cold_3();
  }
  if (close(*(_DWORD *)(a1 + 40)) == -1) {
    ___generateTailspin_block_invoke_cold_3();
  }
  id v4 = _tsl();
  uint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [*(id *)(a1 + 32) UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v46 = (__CFString *)v6;
      _os_log_impl(&dword_1B5A59000, v5, OS_LOG_TYPE_DEFAULT, "Mailspin success: %{public}s", buf, 0xCu);
    }

    uint64_t v7 = (__CFString *)*(id *)(a1 + 32);
    size_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    size_t v9 = [v8 attributesOfItemAtPath:v7 error:0];
    uint32_t v10 = v9;
    if (v9)
    {
      int v11 = [v9 objectForKey:*MEMORY[0x1E4F28390]];
      BOOL v12 = v11 == 0;

      if (v12)
      {
        id v30 = _tsl();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v46 = v7;
          _os_log_impl(&dword_1B5A59000, v30, OS_LOG_TYPE_DEFAULT, "Empty tailspin file: %{public}@", buf, 0xCu);
        }

        [v8 removeItemAtPath:v7 error:0];
        goto LABEL_29;
      }
    }
    uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v44 = -86;
    if ([v13 fileExistsAtPath:@"/var/mobile/Library/Caches/com.apple.backboardd/spool" isDirectory:&v44])
    {
    }
    else
    {
      id v43 = 0;
      int v21 = [v13 createDirectoryAtPath:@"/var/mobile/Library/Caches/com.apple.backboardd/spool" withIntermediateDirectories:1 attributes:0 error:&v43];
      id v22 = v43;
      uint64_t v23 = v22;
      if (!v21)
      {
        uint64_t v31 = _tsl();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = [v23 localizedDescription];
          uint64_t v33 = [v32 UTF8String];
          *(_DWORD *)buf = 138543618;
          uint64_t v46 = @"/var/mobile/Library/Caches/com.apple.backboardd/spool";
          __int16 v47 = 2082;
          uint64_t v48 = v33;
          _os_log_impl(&dword_1B5A59000, v31, OS_LOG_TYPE_DEFAULT, "Unable to create %{public}@: %{public}s", buf, 0x16u);
        }
        int64_t v26 = _tsl();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          ___generateTailspin_block_invoke_cold_1(v26, v34, v35, v36, v37, v38, v39, v40);
        }
        goto LABEL_28;
      }
    }
    char v24 = NSString;
    int64_t v25 = [(__CFString *)v7 lastPathComponent];
    int64_t v26 = [v24 stringWithFormat:@"%@/%@", @"/var/mobile/Library/Caches/com.apple.backboardd/spool", v25];

    id v43 = 0;
    [v8 moveItemAtPath:v7 toPath:v26 error:&v43];
    id v27 = v43;
    uint64_t v28 = _tsl();
    unint64_t v29 = v28;
    if (v27)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        id v41 = [v27 localizedDescription];
        uint64_t v42 = [v41 UTF8String];
        *(_DWORD *)buf = 138543874;
        uint64_t v46 = v7;
        __int16 v47 = 2114;
        uint64_t v48 = (uint64_t)v26;
        __int16 v49 = 2082;
        uint64_t v50 = v42;
        _os_log_error_impl(&dword_1B5A59000, v29, OS_LOG_TYPE_ERROR, "Failed move %{public}@ -> %{public}@: %{public}s", buf, 0x20u);
      }
      [v8 removeItemAtPath:v7 error:0];
    }
    else
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v46 = v7;
        __int16 v47 = 2114;
        uint64_t v48 = (uint64_t)v26;
        _os_log_impl(&dword_1B5A59000, v29, OS_LOG_TYPE_DEFAULT, "Successful move %{public}@ -> %{public}@", buf, 0x16u);
      }
    }
LABEL_28:

LABEL_29:
    return;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    ___generateTailspin_block_invoke_cold_2(v5, v14, v15, v16, v17, v18, v19, v20);
  }
}

void sub_1B5AB8AC0(_Unwind_Exception *a1)
{
  size_t v8 = v6;

  _Unwind_Resume(a1);
}

uint64_t ___temporaryTailspinPath_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v1 = (void *)_temporaryTailspinPath_filenameFormatter;
  _temporaryTailspinPath_filenameFormatter = (uint64_t)v0;

  uint64_t v2 = (void *)_temporaryTailspinPath_filenameFormatter;

  return [v2 setDateFormat:@"yyyy-MMdd-HHmm-ssSSS"];
}

void ___tailspinMinTimestamp_block_invoke()
{
  if (_systemTimeScale_o != -1) {
    dispatch_once(&_systemTimeScale_o, &__block_literal_global_97);
  }
  _tailspinMinTimestamp_absoluteTicksBeforeNow = 1000000000
                                               * (unint64_t)*(unsigned int *)algn_1EB4926AC
                                               / _systemTimeScale_machTimebaseInfo;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t __EFIsRunningUnitTests_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 infoDictionary];
  id v4 = [v3 objectForKeyedSubscript:@"CFBundlePackageType"];
  char v5 = [v4 isEqual:@"BNDL"];

  if (v5)
  {
    uint64_t v6 = [v2 bundleIdentifier];
    uint64_t v7 = [v6 componentsSeparatedByString:@"."];

    uint64_t v8 = objc_msgSend(v7, "ef_any:", &__block_literal_global_16_0);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_1B5AB8CF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __EFIsRunningUnitTests_block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 hasSuffix:@"Tests"];
}

void _readVersions_block_invoke()
{
  id v0 = (void *)MEMORY[0x1BA9A5240]();
  CFDictionaryRef v1 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v1)
  {
    CFDictionaryRef v2 = v1;
    uint64_t v3 = objc_msgSend((id)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x1E4F1CD30]), "copy");
    id v4 = (void *)sProductVersion;
    sProductVersion = v3;

    uint64_t v5 = objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F1CD10]), "copy");
    uint64_t v6 = (void *)sBuildVersion;
    sBuildVersion = v5;

    CFRelease(v2);
  }
}

uint64_t EFIsCustomerBuild()
{
  if (EFIsSeedBuild()) {
    return 0;
  }
  CFDictionaryRef v1 = +[EFDevice currentDevice];
  int v2 = [v1 isInternal];

  return v2 ^ 1u;
}

void sub_1B5AB8E2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id EFProductName()
{
  id v0 = (void *)MGCopyAnswer();
  CFDictionaryRef v1 = [NSString stringWithFormat:@"%@ Mail", v0];

  return v1;
}

void sub_1B5AB8EAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id EFVerboseVersion()
{
  if (EFVerboseVersion_onceToken != -1) {
    dispatch_once(&EFVerboseVersion_onceToken, &__block_literal_global_13_2);
  }
  id v0 = (void *)EFVerboseVersion_verboseVersion;

  return v0;
}

void __EFVerboseVersion_block_invoke()
{
  id v0 = [NSString alloc];
  EFProductName();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  CFDictionaryRef v1 = EFSystemBuildVersion();
  uint64_t v2 = [v0 initWithFormat:@"%@ %@", v4, v1];
  uint64_t v3 = (void *)EFVerboseVersion_verboseVersion;
  EFVerboseVersion_verboseVersion = v2;
}

void sub_1B5AB8FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

id EFSystemVersion()
{
  if (sSystemVersionsOnce != -1) {
    dispatch_once(&sSystemVersionsOnce, &__block_literal_global_41);
  }
  id v0 = (void *)sProductVersion;

  return v0;
}

void sub_1B5AB9120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB91B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB92F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB93E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB9510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB9660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB9754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB98C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB99CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB9B88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB9C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB9CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB9ED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5AB9FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B5ABA030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5ABA12C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5ABA314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5ABA470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5ABA54C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5ABA66C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5ABA8F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5ABAB00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5ABACB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5ABAE54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5ABAFE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5ABB11C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1B5ABB378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5ABB478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5ABB578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5ABB64C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5ABB6F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5ABB75C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ef_xpc_activity_register_withcriteria(const char *a1, void *a2, void *a3)
{
}

void ef_xpc_activity_run_if_necessary(const char *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)*MEMORY[0x1E4F14158];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __ef_xpc_activity_run_if_necessary_block_invoke;
  v6[3] = &unk_1E6123950;
  id v7 = v3;
  uint64_t v8 = a1;
  id v5 = v3;
  xpc_activity_register(a1, v4, v6);
}

void sub_1B5ABB8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void __ef_xpc_activity_run_if_necessary_block_invoke(uint64_t a1, void *a2)
{
  *(void *)&v16[5] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  int v5 = state;
  if (!state)
  {
    uint64_t v8 = activityLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v15 = 136446210;
      *(void *)uint64_t v16 = v9;
      _os_log_impl(&dword_1B5A59000, v8, OS_LOG_TYPE_INFO, "Check in '%{public}s'", (uint8_t *)&v15, 0xCu);
    }

    uint32_t v10 = *(const char **)(a1 + 40);
    int v11 = xpc_activity_copy_criteria(v3);
    BOOL v12 = v11;
    if (!v11 || !xpc_dictionary_get_count(v11))
    {
      uint64_t v13 = activityLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v15 = 136446210;
        *(void *)uint64_t v16 = v10;
        _os_log_impl(&dword_1B5A59000, v13, OS_LOG_TYPE_INFO, "Unregister '%{public}s'", (uint8_t *)&v15, 0xCu);
      }

      xpc_activity_unregister(v10);
    }
    goto LABEL_15;
  }
  if (state != 2)
  {
    BOOL v12 = activityLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      int v15 = 67109378;
      v16[0] = v5;
      LOWORD(v16[1]) = 2082;
      *(void *)((char *)&v16[1] + 2) = v14;
      _os_log_impl(&dword_1B5A59000, v12, OS_LOG_TYPE_INFO, "Unexpected state %u for '%{public}s'", (uint8_t *)&v15, 0x12u);
    }
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v6 = activityLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    int v15 = 136446210;
    *(void *)uint64_t v16 = v7;
    _os_log_impl(&dword_1B5A59000, v6, OS_LOG_TYPE_INFO, "Run '%{public}s'", (uint8_t *)&v15, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_16:
}

void sub_1B5ABBB0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id EFFuture.isFinished.getter()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_isFinished);
}

id EFFuture.isCancelled.getter()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_isCancelled);
}

uint64_t EFFuture.__allocating_init<A>(_:)()
{
  uint64_t v0 = swift_allocObject();
  EFFuture.init<A>(_:)();
  return v0;
}

uint64_t EFFuture.init<A>(_:)()
{
  self;
  uint64_t result = swift_dynamicCastObjCClass();
  if (result)
  {
    *(void *)(v0 + 16) = result;
    return v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t EFFuture.__allocating_init(_:)(uint64_t a1)
{
  uint64_t result = static EFFuture.asAnyObject(_:)(a1);
  if (result)
  {
    id v4 = objc_msgSend(self, sel_futureWithResult_, result);
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))(a1);
    uint64_t v5 = swift_allocObject();
    EFFuture.init<A>(_:)();
    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static EFFuture.asAnyObject(_:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v4 = sub_1B5AC0128();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v11 - v6;
  uint64_t v8 = *(void *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v11 - v6, a1, v3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v7, 0, 1, v3);
  BOOL v9 = sub_1B5ABDC2C((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t result = 0;
  if (!v9) {
    return sub_1B5AC0138();
  }
  return result;
}

uint64_t EFFuture.__allocating_init(_:)(void *a1)
{
  uint64_t v2 = (void *)sub_1B5AC00E8();
  id v3 = objc_msgSend(self, sel_futureWithError_, v2);

  uint64_t v4 = swift_allocObject();
  EFFuture.init<A>(_:)();
  return v4;
}

uint64_t EFFuture.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = *(void *)(v2 + 80);
  v5[3] = a1;
  v5[4] = a2;
  void v11[4] = sub_1B5ABDE90;
  v11[5] = v5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1B5ABC0E4;
  v11[3] = &block_descriptor;
  uint64_t v6 = _Block_copy(v11);
  uint64_t v7 = self;
  swift_retain();
  id v8 = objc_msgSend(v7, sel_futureWithBlock_, v6);
  _Block_release(v6);
  swift_release();
  swift_release();
  uint64_t v9 = swift_allocObject();
  EFFuture.init<A>(_:)();
  return v9;
}

uint64_t sub_1B5ABBFC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](a1);
  id v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9(v6);
  type metadata accessor for EFFuture();
  uint64_t v10 = static EFFuture.asAnyObject(_:)((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, a4);
  return v10;
}

id sub_1B5ABC0E4(uint64_t a1, uint64_t a2)
{
  id v3 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v4 = (void *)v3(a2);
  swift_release();

  return v4;
}

uint64_t EFFuture.result()@<X0>(uint64_t a1@<X8>)
{
  v15[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v14 = *v1;
  uint64_t v3 = *(void *)(v14 + 80);
  uint64_t v4 = sub_1B5AC0128();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v13 - v6;
  id v8 = (void *)v1[2];
  v15[0] = 0;
  id v9 = objc_msgSend(v8, sel_result_, v15);
  if (v15[0])
  {
    id v10 = v15[0];
    swift_willThrow();

    return swift_unknownObjectRelease();
  }
  else
  {
    static EFFuture.asValue(_:)((uint64_t)v9, v7);
    uint64_t v12 = *(void *)(v3 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v7, 1, v3) == 1)
    {
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      __break(1u);
    }
    else
    {
      swift_unknownObjectRelease();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(a1, v7, v3);
    }
  }
  return result;
}

uint64_t static EFFuture.asValue(_:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v5 = *(void *)(v2 + 80);
  uint64_t v6 = sub_1B5AC0128();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)v15 - v8;
  v15[1] = a1;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(qword_1E9D92420);
  int v10 = swift_dynamicCast();
  uint64_t v11 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  if (v10)
  {
    uint64_t v12 = *(void *)(v5 - 8);
    v11(v9, 0, 1, v5);
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(a2, v9, v5);
    return ((uint64_t (*)(char *, void, uint64_t, uint64_t))v11)(a2, 0, 1, v5);
  }
  else
  {
    v11(v9, 1, 1, v5);
    v15[0] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA98]), sel_init);
    int v14 = swift_dynamicCast();
    v11(a2, v14 ^ 1u, 1, v5);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

uint64_t EFFuture.result(withTimeout:)@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  v18[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(*v2 + 80);
  uint64_t v6 = sub_1B5AC0128();
  uint64_t v17 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v16 - v7;
  id v9 = (void *)v2[2];
  v18[0] = 0;
  id v10 = objc_msgSend(v9, sel_resultWithTimeout_error_, v18, a2);
  id v11 = v18[0];
  if (v10)
  {
    uint64_t v12 = swift_unknownObjectRetain();
    static EFFuture.asValue(_:)(v12, v8);
    swift_unknownObjectRelease();
    uint64_t v13 = *(void *)(v5 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v8, 1, v5) == 1)
    {
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v8, v6);
      __break(1u);
    }
    else
    {
      swift_unknownObjectRelease();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a1, v8, v5);
    }
  }
  else
  {
    int v15 = v11;
    sub_1B5AC00F8();

    return swift_willThrow();
  }
  return result;
}

uint64_t EFFuture.result(beforeDate:)@<X0>(uint64_t a1@<X8>)
{
  v17[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*v1 + 80);
  uint64_t v4 = sub_1B5AC0128();
  uint64_t v16 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v15 - v5;
  uint64_t v7 = (void *)v1[2];
  uint64_t v8 = (void *)sub_1B5AC0108();
  v17[0] = 0;
  id v9 = objc_msgSend(v7, sel_resultBeforeDate_error_, v8, v17);

  id v10 = v17[0];
  if (v9)
  {
    uint64_t v11 = swift_unknownObjectRetain();
    static EFFuture.asValue(_:)(v11, v6);
    swift_unknownObjectRelease();
    uint64_t v12 = *(void *)(v3 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v3) == 1)
    {
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v6, v4);
      __break(1u);
    }
    else
    {
      swift_unknownObjectRelease();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(a1, v6, v3);
    }
  }
  else
  {
    int v14 = v10;
    sub_1B5AC00F8();

    return swift_willThrow();
  }
  return result;
}

uint64_t EFFuture.onSuccess(on:block:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = (void *)v3[2];
  id v9 = (void *)swift_allocObject();
  v9[2] = *(void *)(v7 + 80);
  v9[3] = a2;
  v9[4] = a3;
  v12[4] = sub_1B5ABDEF8;
  v12[5] = v9;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 1107296256;
  v12[2] = sub_1B5ABCD18;
  v12[3] = &block_descriptor_6;
  id v10 = _Block_copy(v12);
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_onScheduler_addSuccessBlock_, a1, v10);
  _Block_release(v10);
  return swift_retain();
}

uint64_t sub_1B5ABCB38(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_1B5AC0128();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v16 - v10;
  uint64_t v12 = *(void *)(a4 - 8);
  MEMORY[0x1F4188790](v9);
  int v14 = (char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for EFFuture();
  static EFFuture.asValue(_:)(a1, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, a4) == 1)
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v11, a4);
    a2(v14);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, a4);
  }
  return result;
}

uint64_t sub_1B5ABCD18(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t EFFuture.onError(on:block:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void **)(v3 + 16);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  void v11[4] = sub_1B5ABDF04;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1B5ABCE74;
  v11[3] = &block_descriptor_12;
  uint64_t v9 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_onScheduler_addFailureBlock_, a1, v9);
  _Block_release(v9);
  return swift_retain();
}

void sub_1B5ABCE74(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t EFFuture.always(on:block:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void **)(v3 + 16);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  void v11[4] = sub_1B5ABDF64;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1B5ABCFD8;
  v11[3] = &block_descriptor_18;
  uint64_t v9 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_onScheduler_always_, a1, v9);
  _Block_release(v9);
  return swift_retain();
}

uint64_t sub_1B5ABCFD8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t EFFuture.then<A>(on:block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  type metadata accessor for EFFuture();
  uint64_t v10 = (void *)v4[2];
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = *(void *)(v9 + 80);
  v11[3] = a4;
  void v11[4] = a2;
  v11[5] = a3;
  v16[4] = sub_1B5ABDFDC;
  v16[5] = v11;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 1107296256;
  v16[2] = sub_1B5ABD370;
  v16[3] = &block_descriptor_24;
  uint64_t v12 = _Block_copy(v16);
  swift_retain();
  swift_release();
  id v13 = objc_msgSend(v10, sel_onScheduler_then_, a1, v12);
  _Block_release(v12);
  uint64_t v14 = swift_allocObject();
  EFFuture.init<A>(_:)();
  return v14;
}

uint64_t sub_1B5ABD174(uint64_t a1, uint64_t (*a2)(char *), uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_1B5AC0128();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v18 - v10;
  uint64_t v12 = *(void *)(a4 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for EFFuture();
  static EFFuture.asValue(_:)(a1, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, a4) == 1)
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v11, a4);
    uint64_t v15 = a2(v14);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, a4);
    id v16 = *(id *)(v15 + 16);
    swift_release();
    return (uint64_t)v16;
  }
  return result;
}

id sub_1B5ABD370(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  uint64_t v3 = (void *)v1(v2);
  swift_release();
  swift_unknownObjectRelease();

  return v3;
}

uint64_t EFFuture.recover<A>(on:block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  type metadata accessor for EFFuture();
  uint64_t v10 = (void *)v4[2];
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = *(void *)(v9 + 80);
  v11[3] = a4;
  void v11[4] = a2;
  v11[5] = a3;
  v16[4] = sub_1B5ABDFE8;
  v16[5] = v11;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 1107296256;
  v16[2] = sub_1B5ABD534;
  v16[3] = &block_descriptor_30;
  uint64_t v12 = _Block_copy(v16);
  swift_retain();
  swift_release();
  id v13 = objc_msgSend(v10, sel_onScheduler_recover_, a1, v12);
  _Block_release(v12);
  uint64_t v14 = swift_allocObject();
  EFFuture.init<A>(_:)();
  return v14;
}

id sub_1B5ABD534(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  uint64_t v5 = (void *)v3();
  swift_release();

  return v5;
}

uint64_t EFFuture.map<A>(on:transform:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  type metadata accessor for EFFuture();
  uint64_t v10 = (void *)v4[2];
  uint64_t v11 = (void *)swift_allocObject();
  uint64_t v12 = *(void *)(v9 + 80);
  v11[2] = v12;
  v11[3] = a4;
  void v11[4] = a2;
  v11[5] = a3;
  id v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = a4;
  v13[4] = sub_1B5ABE02C;
  v13[5] = v11;
  v18[4] = sub_1B5ABE038;
  v18[5] = v13;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 1107296256;
  id v18[2] = sub_1B5ABDA78;
  v18[3] = &block_descriptor_39;
  uint64_t v14 = _Block_copy(v18);
  swift_retain();
  swift_release();
  id v15 = objc_msgSend(v10, sel_onScheduler_map_, a1, v14);
  _Block_release(v14);
  uint64_t v16 = swift_allocObject();
  EFFuture.init<A>(_:)();
  return v16;
}

uint64_t sub_1B5ABD72C@<X0>(uint64_t a1@<X0>, void (*a2)(char *)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v9 = sub_1B5AC0128();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  id v13 = (char *)&v19 - v12;
  uint64_t v14 = *(void *)(a3 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for EFFuture();
  static EFFuture.asValue(_:)(a1, v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, a3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    uint64_t v17 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v13, a3);
    v20(v16);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, a3);
    uint64_t v17 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 56))(a5, v17, 1, a4);
}

uint64_t sub_1B5ABD95C@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_1B5AC0128();
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v14 - v9;
  a2(a1);
  uint64_t v11 = *(void *)(a3 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, a3);
  if (result == 1)
  {
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
  }
  else
  {
    *(void *)(a4 + 24) = a3;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)a4);
    return (*(uint64_t (**)(uint64_t *, char *, uint64_t))(v11 + 32))(boxed_opaque_existential_0, v10, a3);
  }
  return result;
}

id sub_1B5ABDA78(uint64_t a1)
{
  void (*v1)(void *__return_ptr, uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void v10[3];
  uint64_t v11;
  uint64_t vars8;

  uint64_t v1 = *(void (**)(void *__return_ptr, uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v10, v2);
  swift_release();
  swift_unknownObjectRelease();
  uint64_t v3 = v11;
  if (v11)
  {
    id v4 = __swift_project_boxed_opaque_existential_0(v10, v11);
    uint64_t v5 = *(void *)(v3 - 8);
    MEMORY[0x1F4188790](v4);
    uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v5 + 16))(v7);
    uint64_t v8 = (void *)sub_1B5AC0138();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t EFFuture.deinit()
{
  return v0;
}

uint64_t EFFuture.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 24, 7);
}

BOOL sub_1B5ABDC2C(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v4 = sub_1B5AC0128();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)v15 - v9;
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)v15 - v9, a1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 48))(v10, 1, v3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
LABEL_6:
    v11(v8, a1, v4);
    goto LABEL_7;
  }
  sub_1B5ABE20C();
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v12 = (void *)v15[1];
  v11(v8, a1, v4);
  if (!v12)
  {
LABEL_7:
    sub_1B5AC0118();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    self;
    BOOL v13 = swift_dynamicCastObjCClass() != 0;
    swift_unknownObjectRelease();
    return v13;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return 0;
}

uint64_t sub_1B5ABDE58()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B5ABDE90(uint64_t a1)
{
  return sub_1B5ABBFC4(a1, v1[3], v1[4], v1[2]);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
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

uint64_t sub_1B5ABDEF8(uint64_t a1)
{
  return sub_1B5ABCB38(a1, *(void (**)(char *))(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 16));
}

uint64_t sub_1B5ABDF04()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1B5ABDF2C()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B5ABDF64()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t type metadata accessor for EFFuture()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1B5ABDFA4()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1B5ABDFDC(uint64_t a1)
{
  return sub_1B5ABD174(a1, *(uint64_t (**)(char *))(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 16));
}

id sub_1B5ABDFE8()
{
  id v1 = *(id *)((*(uint64_t (**)(void))(v0 + 32))() + 16);
  swift_release();
  return v1;
}

uint64_t sub_1B5ABE02C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1B5ABD72C(a1, *(void (**)(char *))(v2 + 32), *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_1B5ABE038@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1B5ABD95C(a1, *(void (**)(uint64_t))(v2 + 32), *(void *)(v2 + 24), a2);
}

uint64_t sub_1B5ABE048()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for EFFuture(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for EFFuture);
}

uint64_t dispatch thunk of EFFuture.__allocating_init<A>(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_1E9D924A8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1E9D924A8);
    }
  }
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_1B5ABE20C()
{
  unint64_t result = qword_1E9D924B0[0];
  if (!qword_1E9D924B0[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_1E9D924B0);
  }
  return result;
}

uint64_t EFPromise.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = objc_msgSend(objc_allocWithZone((Class)EFPromise), sel_init);
  return v0;
}

uint64_t EFPromise.init()()
{
  *(void *)(v0 + 16) = objc_msgSend(objc_allocWithZone((Class)EFPromise), sel_init);
  return v0;
}

uint64_t EFPromise.future.getter()
{
  type metadata accessor for EFFuture();
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_future);
  return EFFuture.__allocating_init<A>(_:)();
}

uint64_t EFPromise.finish(_:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 80);
  uint64_t v4 = sub_1B5AC0128();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v10 - v6;
  uint64_t v8 = *(void *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v10 - v6, a1, v3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v7, 0, 1, v3);
  LOBYTE(a1) = EFPromise.finish(with:error:)(v7, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return a1 & 1;
}

uint64_t EFPromise.finish(with:error:)(char *a1, void *a2)
{
  uint64_t v5 = *(void *)(*v2 + 80);
  uint64_t v6 = sub_1B5AC0128();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v15 - v8;
  id v16 = (id)v2[2];
  uint64_t v10 = *(void *)(v5 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  uint64_t v12 = 0;
  if (v11(a1, 1, v5) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, a1, v6);
    uint64_t result = v11(v9, 1, v5);
    if (result == 1)
    {
      __break(1u);
      return result;
    }
    type metadata accessor for EFFuture();
    uint64_t v12 = static EFFuture.asAnyObject(_:)((uint64_t)v9);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v9, v5);
  }
  if (a2) {
    a2 = (void *)sub_1B5AC00E8();
  }
  id v14 = objc_msgSend(v16, sel_finishWithResult_error_, v12, a2);
  swift_unknownObjectRelease();

  return (uint64_t)v14;
}

uint64_t EFPromise.finish(_:)(void *a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 80);
  uint64_t v4 = sub_1B5AC0128();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v9 - v6;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))((char *)&v9 - v6, 1, 1, v3);
  LOBYTE(a1) = EFPromise.finish(with:error:)(v7, a1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return a1 & 1;
}

uint64_t EFPromise.finish(_:)(void (*a1)(uint64_t))
{
  uint64_t v3 = *(void *)(*(void *)v1 + 80);
  uint64_t v4 = sub_1B5AC0128();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v11 - v8;
  a1(v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v9, 0, 1, v3);
  EFPromise.finish(with:error:)(v9, 0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v9, v4);
}

uint64_t EFPromise.deinit()
{
  return v0;
}

uint64_t EFPromise.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t type metadata accessor for EFPromise()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for EFPromise(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for EFPromise);
}

uint64_t dispatch thunk of EFPromise.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t Locked.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_allocObject();
  uint64_t v4 = sub_1B5ABEF40(a1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v2 + 80) - 8) + 8))(a1);
  return v4;
}

uint64_t Locked.init(_:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = sub_1B5ABEF40(a1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 8))(a1);
  return v4;
}

void Locked.performWhileLocked<A>(_:)(void (*a1)(uint64_t))
{
  uint64_t v2 = v1;
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v2 + *(void *)(*(void *)v2 + 96)));
  uint64_t v4 = v2 + *(void *)(*(void *)v2 + 88);
  swift_beginAccess();
  a1(v4);
  swift_endAccess();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v2 + *(void *)(*(void *)v2 + 96)));
}

void Locked.value()()
{
}

void Locked.get<A>(_:)()
{
}

void Locked.set<A>(_:to:)()
{
}

uint64_t sub_1B5ABECBC(uint64_t a1)
{
  MEMORY[0x1F4188790](a1);
  (*(void (**)(char *, uint64_t))(v1 + 16))((char *)&v5 - v2, v3);
  return swift_setAtReferenceWritableKeyPath();
}

void Locked.update(to:)()
{
}

uint64_t Locked.deinit()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 88));
  return v0;
}

uint64_t Locked.__deallocating_deinit()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 88));
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

void Locked.subscript.getter()
{
}

uint64_t sub_1B5ABEF40(uint64_t a1)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v1 + 80) - 8) + 16))(v1 + *(void *)(*(void *)v1 + 88), a1);
  uint64_t v2 = (_DWORD *)swift_slowAlloc();
  *(void *)(v1 + *(void *)(*(void *)v1 + 96)) = v2;
  _DWORD *v2 = 0;
  return v1;
}

uint64_t sub_1B5ABEFDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v2 + 16) - 8) + 16))(a2, a1);
}

uint64_t sub_1B5ABF010(uint64_t a1)
{
  return MEMORY[0x1F4186550](a1, v1);
}

uint64_t sub_1B5ABF018(uint64_t a1)
{
  return sub_1B5ABECBC(a1);
}

uint64_t sub_1B5ABF020(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v7 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v4);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_1B5ABF0D8()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for Locked()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for Locked(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Locked);
}

uint64_t dispatch thunk of Locked.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

void EFEncodeCacheableInstance_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 134217984;
  uint64_t v2 = EFEncodeCacheableInstance_sInstanceCount;
  _os_log_debug_impl(&dword_1B5A59000, log, OS_LOG_TYPE_DEBUG, "Has created %td instance IDs.", (uint8_t *)&v1, 0xCu);
}

void _NotifyObserversWithContentProtectionState_cold_1()
{
  __assert_rtn("_NotifyObserversWithContentProtectionState", "EFContentProtectionObserver.m", 115, "EFContentProtectionStateInvalid != state");
}

void _NotifyObserversWithContentProtectionState_cold_2()
{
  __assert_rtn("_NotifyObserversWithContentProtectionState", "EFContentProtectionObserver.m", 116, "EFContentProtectionStateInvalid != sContentProtectionState");
}

void _NotifyObserversWithContentProtectionState_cold_3(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_fault_impl(&dword_1B5A59000, log, OS_LOG_TYPE_FAULT, "Invalid KeyBag state transition", v1, 2u);
}

void _NotifyObserversWithContentProtectionState_cold_4(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1B5A59000, log, OS_LOG_TYPE_ERROR, "Brace for impact, keybag was locked without grace period!", v1, 2u);
}

void EFVerifyFileProtectionType_cold_1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1B5A59000, log, OS_LOG_TYPE_ERROR, "Could not get file protection type for %@: %{public}@", buf, 0x16u);
}

void WithDeviceIsInternal_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1B5A59000, log, OS_LOG_TYPE_FAULT, "Exception occured: %{public}@\nSymbols:\n%{public}@", buf, 0x16u);
}

void __EFLogRegisterStateCaptureBlock_block_invoke_cold_1(uint64_t a1, void *a2, uint8_t *buf)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1B5A59000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Looks like this failed to transform state dictionary %@ into a property list, please check previous logging: %{public}@", buf, 0x16u);
}

void __EFLogRegisterStateCaptureBlock_block_invoke_cold_2()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_1B5A59000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "no state data could be collected, see previous logging", v0, 2u);
}

void EFMarkFileAsPurgeable_cold_1(void *a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_0_0((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_error_impl(&dword_1B5A59000, v5, OS_LOG_TYPE_ERROR, "Failed to open '%@': %{errno}d", v4, 0x12u);
}

void EFMarkFileAsPurgeable_cold_2(void *a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_0_0((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_error_impl(&dword_1B5A59000, v5, OS_LOG_TYPE_ERROR, "Failed to mark '%@' as purgeable %{errno}d", v4, 0x12u);
}

void EFSaveTailspin_cold_1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_1B5A59000, log, OS_LOG_TYPE_ERROR, "Failed to open %{public}@: %{darwin.errno}d", (uint8_t *)&v3, 0x12u);
}

void EFSaveTailspin_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___generateTailspin_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___generateTailspin_block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t ___generateTailspin_block_invoke_cold_3()
{
  return _os_assumes_log();
}

uint64_t sub_1B5AC00E8()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1B5AC00F8()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1B5AC0108()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1B5AC0118()
{
  return MEMORY[0x1F4184638]();
}

uint64_t sub_1B5AC0128()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1B5AC0138()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9718](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9720](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9728](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
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

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1F40C97C0](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C97C8](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E08](number);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1F40D8680](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1F40D8698](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x1F40D86A8](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

uint64_t CFUniCharGetUnicodePropertyDataForPlane()
{
  return MEMORY[0x1F40D8A08]();
}

uint64_t CompressFile()
{
  return MEMORY[0x1F410A150]();
}

uint64_t CreateCompressionQueue()
{
  return MEMORY[0x1F410A158]();
}

uint64_t DRTailspinRequest()
{
  return MEMORY[0x1F4117570]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x1F412F930]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1F40E7298](proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1F40D8BB0]();
}

uint64_t _CFBundleCopyFrameworkURLForExecutablePath()
{
  return MEMORY[0x1F40D8BE0]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x1F40D91E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1F40C9F98]();
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

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

int bcmp(const void *a1, const void *a2, size_t a3)
{
  return MEMORY[0x1F40CA528](a1, a2, a3);
}

void bzero(void *a1, size_t a2)
{
}

Protocol **__cdecl class_copyProtocolList(Class cls, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x1F4181508](cls, outCount);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1F4181548](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1F4181558](cls);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1F40CB880](from, to, state, *(void *)&flags);
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
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

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

void dispatch_block_perform(dispatch_block_flags_t flags, dispatch_block_t block)
{
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

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1F40CBE70]();
}

void exit(int a1)
{
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC0D8](*(void *)&a1, a2, a3, *(void *)&a4);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

int fsync(int a1)
{
  return MEMORY[0x1F40CC2D8](*(void *)&a1);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1F40CC2F8](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1F40CC300](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1F40CC308](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1F40CC4E8](*(void *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1F40F3938](path);
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return MEMORY[0x1F40F3960](path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x1F40F3970](path);
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x1F40F39A8]();
}

nw_path_monitor_t nw_path_monitor_create_with_type(nw_interface_type_t required_interface_type)
{
  return (nw_path_monitor_t)MEMORY[0x1F40F39B8](*(void *)&required_interface_type);
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
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

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1F40CD0F0](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

uint64_t os_transaction_copy_description()
{
  return MEMORY[0x1F40CD598]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1F40CD628]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

Protocol **__cdecl protocol_copyProtocolList(Protocol *proto, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x1F4181B00](proto, outCount);
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1F4181B10](p);
}

objc_property_t protocol_getProperty(Protocol *proto, const char *name, BOOL isRequiredProperty, BOOL isInstanceProperty)
{
  return (objc_property_t)MEMORY[0x1F4181B18](proto, name, isRequiredProperty, isInstanceProperty);
}

int pthread_main_np(void)
{
  return MEMORY[0x1F40CDA68]();
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1F40CDE08]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F98](a1, *(void *)&a2, a3, a4, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return MEMORY[0x1F4181FC8](a1);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1F4181FD0](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1F4182050](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1F4182058](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F4182088](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1F41820B0](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

sqlite3 *__cdecl sqlite3_db_handle(sqlite3_stmt *a1)
{
  return (sqlite3 *)MEMORY[0x1F4182158](a1);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1F41821A0](*(void *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1F41821C0](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

void sqlite3_free(void *a1)
{
}

void *__cdecl sqlite3_malloc64(sqlite3_uint64 a1)
{
  return (void *)MEMORY[0x1F4182250](a1);
}

char *sqlite3_mprintf(const char *a1, ...)
{
  return (char *)MEMORY[0x1F4182258](a1);
}

sqlite3_stmt *__cdecl sqlite3_next_stmt(sqlite3 *pDb, sqlite3_stmt *pStmt)
{
  return (sqlite3_stmt *)MEMORY[0x1F4182270](pDb, pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1F41823A0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x1F4186780]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

uint64_t tailspin_dump_output_with_options()
{
  return MEMORY[0x1F41824B8]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1F40CE978](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1F40CEE88](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1F40CF040](object1, object2);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1F40CF250]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}