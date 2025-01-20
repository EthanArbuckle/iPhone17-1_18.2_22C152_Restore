void sub_1D4695380(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id propertyIMP(void *a1, const char *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  v6 = (void *)MEMORY[0x1D944CB30]();
  v7 = NSStringFromSelector(a2);
  if ([v5 hmbPropertyIsAvailable:v7])
  {
    v8 = [(id)objc_opt_class() hmbProperties];
    v9 = [v8 objectForKey:v7];

    if (v9)
    {
      v10 = [v5 hmbReserved];
      v11 = [v10 objectForKey:v7];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v11)
        {

          goto LABEL_17;
        }
        uint64_t v21 = [v9 defaultValue];
        goto LABEL_16;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1D944CB30]();
      id v18 = v5;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = HMFGetLogIdentifier();
        int v23 = 138543874;
        v24 = v20;
        __int16 v25 = 2112;
        v26 = v7;
        __int16 v27 = 2112;
        id v28 = v18;
        _os_log_impl(&dword_1D4693000, v19, OS_LOG_TYPE_ERROR, "%{public}@Attempting to read property %@ from %@, does not appear defined.", (uint8_t *)&v23, 0x20u);
      }
      v11 = 0;
    }
    uint64_t v21 = 0;
LABEL_16:

    v11 = (void *)v21;
    goto LABEL_17;
  }
  v12 = (void *)MEMORY[0x1D944CB30]();
  id v13 = v5;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = HMFGetLogIdentifier();
    v16 = [v13 hmbContainerDataVersion];
    int v23 = 138544130;
    v24 = v15;
    __int16 v25 = 2112;
    v26 = v7;
    __int16 v27 = 2112;
    id v28 = v13;
    __int16 v29 = 2112;
    v30 = v16;
    _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_ERROR, "%{public}@Attempting to read property %@ on %@, unavailable in homed data version %@ (returning nil).", (uint8_t *)&v23, 0x2Au);
  }

  v11 = 0;
LABEL_17:

  return v11;
}

void setPropertyIMP(void *a1, const char *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a3;
  v7 = (void *)MEMORY[0x1D944CB30]();
  id v8 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  v11 = keyFromSelector(a2);
  if (![v10 hmbPropertyIsReadOnly:v11])
  {
    v17 = [(id)objc_opt_class() hmbProperties];
    id v18 = [v17 objectForKey:v11];
    v19 = (objc_class *)[v18 classObj];

    if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      v24 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v25 = *MEMORY[0x1E4F1C3B8];
      v26 = NSString;
      __int16 v27 = (objc_class *)objc_opt_class();
      uint64_t v28 = NSStringFromClass(v27);
      __int16 v29 = (void *)v28;
      if (v19)
      {
        v32 = NSStringFromClass(v19);
        v33 = [v26 stringWithFormat:@"Property for parameter %@ was supplied as %@, but was expected to be %@.", v11, v29, v32];
        id v31 = [v24 exceptionWithName:v25 reason:v33 userInfo:0];
      }
      else
      {
        v30 = [v26 stringWithFormat:@"Property for parameter %@ was supplied as %@, but was expected to be <UNKNOWN>.", v11, v28];
        id v31 = [v24 exceptionWithName:v25 reason:v30 userInfo:0];
      }
      objc_exception_throw(v31);
    }
    v20 = [v10 hmbReserved];

    if (v20)
    {
      if (v6)
      {
LABEL_12:
        uint64_t v21 = [v10 hmbReserved];
        v22 = objc_msgSend(v11, "hmf_stringWithSmallestEncoding");
        [v21 setValue:v6 forKey:v22];

        goto LABEL_13;
      }
    }
    else
    {
      int v23 = [MEMORY[0x1E4F1CA60] dictionary];
      [v10 setHmbReserved:v23];

      if (v6) {
        goto LABEL_12;
      }
    }
    id v6 = [MEMORY[0x1E4F1CA98] null];
    goto LABEL_12;
  }
  v12 = (void *)MEMORY[0x1D944CB30]();
  id v13 = v10;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = HMFGetLogIdentifier();
    v16 = [v13 hmbContainerDataVersion];
    *(_DWORD *)buf = 138544130;
    v35 = v15;
    __int16 v36 = 2112;
    v37 = v11;
    __int16 v38 = 2112;
    id v39 = v13;
    __int16 v40 = 2112;
    v41 = v16;
    _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_ERROR, "%{public}@Attempting to write property %@ on %@, unwritable in homed data version %@.", buf, 0x2Au);
  }
LABEL_13:
}

id keyFromSelector(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  if ([v1 hasPrefix:@"set"] && objc_msgSend(v1, "length") != 3)
  {
    v2 = objc_msgSend(v1, "substringWithRange:", 3, 1);
    id v3 = [v2 lowercaseString];
    int v4 = [v2 isEqualToString:v3];

    if (v4)
    {
      id v5 = v1;

      goto LABEL_7;
    }
    id v6 = [v2 lowercaseString];
    v7 = objc_msgSend(v1, "substringWithRange:", 4, objc_msgSend(v1, "length") - 5);
    uint64_t v8 = [v6 stringByAppendingString:v7];

    v1 = (void *)v8;
  }
  id v5 = v1;
LABEL_7:

  return v5;
}

uint64_t __execSQLite3(void *a1, sqlite3_stmt *a2, void *a3)
{
  id v5 = a1;
  if (sqlite3_step(a2) != 101)
  {
    if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Statement:a2];
    }
    sqlite3_reset(a2);
LABEL_8:
    uint64_t v7 = 0;
    goto LABEL_10;
  }
  int v6 = sqlite3_changes((sqlite3 *)[v5 connection]);
  if (!sqlite3_reset(a2))
  {
    uint64_t v7 = v6;
    goto LABEL_10;
  }
  if (!a3) {
    goto LABEL_8;
  }
  [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Statement:a2];
  uint64_t v7 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v7;
}

void sub_1D4697590(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4697640(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4698B9C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __getRebuilder(void *a1)
{
  v1 = a1;
  os_unfair_lock_lock_with_options();
  v2 = [(os_unfair_lock_s *)v1 rebuilder];
  os_unfair_lock_unlock(v1 + 2);

  return v2;
}

void sub_1D46996E0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __createRebuilderIfNeeded(void *a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  os_unfair_lock_lock_with_options();
  v2 = [(os_unfair_lock_s *)v1 cloudDatabase];
  id v3 = [v2 configuration];
  int v4 = [v3 isManateeContainer];

  if (!v4)
  {
    int v9 = 0;
    int v10 = 0;
    goto LABEL_6;
  }
  id v5 = [(os_unfair_lock_s *)v1 rebuilder];

  if (v5)
  {
    int v6 = [(os_unfair_lock_s *)v1 rebuilder];
    uint64_t v7 = [v6 rebuildCompleteFuture];
    int v8 = [v7 isFinished];

    if (v8)
    {
      [(os_unfair_lock_s *)v1 setRebuilder:0];
      int v9 = 0;
      int v10 = 1;
    }
    else
    {
      int v10 = 0;
      int v9 = 1;
    }
  }
  else
  {
    int v9 = 0;
    int v10 = 0;
  }
  v12 = [(os_unfair_lock_s *)v1 rebuilder];

  if (v12) {
    goto LABEL_15;
  }
  id v13 = [(os_unfair_lock_s *)v1 cloudZoneID];
  uint64_t v14 = [v13 scope];

  if (v14 != 2)
  {
    v16 = [(os_unfair_lock_s *)v1 cloudZoneID];
    uint64_t v17 = [v16 scope];

    if (v17 == 3)
    {
      v15 = [[HMBSharedCloudZoneRebuilder alloc] initWithCloudZone:v1];
      [(os_unfair_lock_s *)v1 setRebuilder:v15];
      goto LABEL_14;
    }
LABEL_6:
    char v11 = 1;
    goto LABEL_16;
  }
  v15 = [[HMBPrivateCloudZoneRebuilder alloc] initWithCloudZone:v1];
  [(os_unfair_lock_s *)v1 setRebuilder:v15];
LABEL_14:

LABEL_15:
  char v11 = 0;
LABEL_16:
  id v18 = [(os_unfair_lock_s *)v1 rebuilder];

  os_unfair_lock_unlock(v1 + 2);
  v19 = (void *)MEMORY[0x1D944CB30]();
  v20 = v1;
  uint64_t v21 = HMFGetOSLogHandle();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v22)
    {
      int v23 = HMFGetLogIdentifier();
      int v28 = 138543362;
      __int16 v29 = v23;
      _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Rebuilder not allowed on zone.", (uint8_t *)&v28, 0xCu);
    }
  }
  else if (v10)
  {
    if (v22)
    {
      v24 = HMFGetLogIdentifier();
      int v28 = 138543362;
      __int16 v29 = v24;
      _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Re-Created rebuilder for zone (existed but had completed).", (uint8_t *)&v28, 0xCu);
    }
  }
  else if (v9)
  {
    if (v22)
    {
      uint64_t v25 = HMFGetLogIdentifier();
      int v28 = 138543362;
      __int16 v29 = v25;
      _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Re-using rebuilder for zone.", (uint8_t *)&v28, 0xCu);
    }
  }
  else if (v22)
  {
    v26 = HMFGetLogIdentifier();
    int v28 = 138543362;
    __int16 v29 = v26;
    _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Created rebuilder for zone.", (uint8_t *)&v28, 0xCu);
  }

  return v18;
}

void sub_1D4699E70(_Unwind_Exception *exception_object)
{
}

void __destroyRebuilder(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  os_unfair_lock_lock_with_options();
  [(os_unfair_lock_s *)v1 setRebuilder:0];
  os_unfair_lock_unlock(v1 + 2);

  v2 = (void *)MEMORY[0x1D944CB30]();
  id v3 = v1;
  int v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1D4693000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Destroyed rebuilder for zone.", (uint8_t *)&v6, 0xCu);
  }
}

void sub_1D4699FAC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D469B1BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
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

id ____fetchNextBatch_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(_DWORD *)(a1 + 72))
  {
    int v4 = [*(id *)(a1 + 32) statement];
    id v5 = (sqlite3_stmt *)[v4 statement];
    int v6 = *(_DWORD *)(a1 + 72);
    uint64_t v7 = [*(id *)(a1 + 32) currentSequence];
    id v27 = 0;
    hmbBindIntSQLite3(v5, v6, [v7 longLongValue], &v27);
    id v8 = v27;
  }
  else
  {
    id v8 = 0;
  }
  int v9 = *(void **)(a1 + 32);
  int v10 = [v9 statement];
  id v26 = v8;
  objc_msgSend(v9, "bindPropertiesToStatement:error:", objc_msgSend(v10, "statement"), &v26);
  id v11 = v26;

  v12 = [*(id *)(a1 + 32) statement];
  uint64_t v13 = [v12 statement];
  uint64_t v14 = *(void *)(a1 + 64);
  id v25 = v11;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = ____fetchNextBatch_block_invoke_2;
  v22[3] = &unk_1E69EA9F0;
  long long v21 = *(_OWORD *)(a1 + 32);
  id v15 = (id)v21;
  long long v16 = *(_OWORD *)(a1 + 48);
  long long v23 = v21;
  long long v24 = v16;
  LOBYTE(v14) = [v3 fetchSQLite3:v13 limit:v14 error:&v25 block:v22];
  id v17 = v25;

  if ((v14 & 1) == 0)
  {
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
    v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = 0;
  }
  return v17;
}

id ____fetchNextBatch_block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  char v12 = 0;
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8) + 24;
  id v11 = 0;
  uint64_t v7 = [v5 fetchRowFromStatement:a2 skip:&v12 updatedSequence:v6 error:&v11];
  id v8 = v11;
  if (v7)
  {
    if (!v12) {
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v7];
    }
    id v9 = 0;
  }
  else
  {
    *a3 = 1;
    [*(id *)(a1 + 32) setCurrentSequence:0];
    id v9 = v8;
  }

  return v9;
}

void sub_1D469C464(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D469C8A4(_Unwind_Exception *a1)
{
}

void sub_1D469D070(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D469D41C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D469DCAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__555(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__556(uint64_t a1)
{
}

void sub_1D469DE44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D469EB50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __processRecords(void *a1, void *a2, void *a3)
{
  uint64_t v611 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  id v450 = a3;
  v448 = [v4 localDatabase];
  v466 = [v448 local];
  uint64_t v462 = [v4 zoneRow];
  id v5 = objc_alloc(MEMORY[0x1E4F653F0]);
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "__processRecords");
  v490 = (void *)[v5 initWithName:v6];

  uint64_t v7 = (void *)MEMORY[0x1D944CB30]();
  id v455 = v4;
  HMFGetOSLogHandle();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    int v10 = [v490 identifier];
    id v11 = [v10 shortDescription];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2048;
    v606 = a2;
    _os_log_impl(&dword_1D4693000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Beginning processing of block %lu", buf, 0x20u);
  }
  uint64_t v587 = 0;
  v588 = &v587;
  uint64_t v589 = 0x3032000000;
  v590 = __Block_byref_object_copy__716;
  v591 = __Block_byref_object_dispose__717;
  id v592 = 0;
  id v586 = 0;
  v585[0] = MEMORY[0x1E4F143A8];
  v585[1] = 3221225472;
  v585[2] = ____processRecords_block_invoke;
  v585[3] = &unk_1E69EB648;
  v585[4] = &v587;
  v585[5] = a2;
  char v12 = [v466 sqlBlockWithActivity:v490 error:&v586 block:v585];
  id v447 = v586;
  if ((v12 & 1) == 0)
  {
    long long v21 = (void *)MEMORY[0x1D944CB30]();
    id v22 = v455;
    HMFGetOSLogHandle();
    long long v23 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      id v25 = [v490 identifier];
      id v26 = [v25 shortDescription];
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v24;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v26;
      *(_WORD *)&buf[22] = 2048;
      v606 = a2;
      *(_WORD *)v607 = 2112;
      *(void *)&v607[2] = v22;
      *(_WORD *)&v607[10] = 2112;
      *(void *)&v607[12] = v447;
      _os_log_impl(&dword_1D4693000, v23, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch block row %lu from %@: %@", buf, 0x34u);
    }
    [v450 finishWithError:v447];
    goto LABEL_265;
  }
  uint64_t v13 = (void *)v588[5];
  if (!v13)
  {
    id v27 = (void *)MEMORY[0x1D944CB30]();
    id v28 = v455;
    HMFGetOSLogHandle();
    __int16 v29 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      id v31 = [v490 identifier];
      v32 = [v31 shortDescription];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v30;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v32;
      *(_WORD *)&buf[22] = 2048;
      v606 = a2;
      _os_log_impl(&dword_1D4693000, v29, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Could not find block with row %lu", buf, 0x20u);
    }
    v33 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    [v450 finishWithError:v33];
    goto LABEL_264;
  }
  uint64_t v14 = [v13 optionsData];
  BOOL v15 = v14 == 0;

  if (v15)
  {
    v34 = (void *)MEMORY[0x1D944CB30]();
    id v35 = v455;
    HMFGetOSLogHandle();
    __int16 v36 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v38 = [v490 identifier];
      id v39 = [v38 shortDescription];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v37;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v39;
      *(_WORD *)&buf[22] = 2048;
      v606 = a2;
      _os_log_impl(&dword_1D4693000, v36, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Block %lu has not been committed. Ignoring process request.", buf, 0x20u);
    }
    v33 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    [v450 finishWithError:v33];
    goto LABEL_264;
  }
  long long v16 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = [(id)v588[5] optionsData];
  id v584 = 0;
  v458 = [v16 unarchivedObjectOfClass:v17 fromData:v18 error:&v584];
  id v445 = v584;

  if (!v458)
  {
    __int16 v40 = (void *)MEMORY[0x1D944CB30]();
    id v41 = v455;
    HMFGetOSLogHandle();
    uint64_t v42 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v43 = (id)objc_claimAutoreleasedReturnValue();
      v44 = [v490 identifier];
      v45 = [v44 shortDescription];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v43;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v45;
      *(_WORD *)&buf[22] = 2112;
      v606 = v445;
      _os_log_impl(&dword_1D4693000, v42, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to unarchive processing options from options data: %@", buf, 0x20u);
    }
    id v583 = 0;
    char v46 = [v41 removeBlockWithRow:a2 error:&v583];
    id v47 = v583;
    if ((v46 & 1) == 0)
    {
      v48 = (void *)MEMORY[0x1D944CB30]();
      id v49 = v41;
      HMFGetOSLogHandle();
      v50 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v51 = (id)objc_claimAutoreleasedReturnValue();
        v52 = [v490 identifier];
        v53 = [v52 shortDescription];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v51;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v53;
        *(_WORD *)&buf[22] = 2112;
        v606 = v47;
        _os_log_impl(&dword_1D4693000, v50, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] unable to cleanup corrupt block: %@", buf, 0x20u);
      }
    }
    [v450 finishWithError:v445];

    goto LABEL_263;
  }
  uint64_t v577 = 0;
  v578 = &v577;
  uint64_t v579 = 0x3032000000;
  v580 = __Block_byref_object_copy__716;
  v581 = __Block_byref_object_dispose__717;
  id v582 = 0;
  if ([v458 shouldEnqueueMirrorOutput])
  {
    id v576 = 0;
    v575[0] = MEMORY[0x1E4F143A8];
    v575[1] = 3221225472;
    v575[2] = ____processRecords_block_invoke_108;
    v575[3] = &unk_1E69EB648;
    v575[5] = v462;
    v575[4] = &v577;
    char v19 = [v466 sqlBlockWithActivity:v490 error:&v576 block:v575];
    id v20 = v576;
    if ((v19 & 1) == 0)
    {
      v457 = v20;
      v381 = (void *)MEMORY[0x1D944CB30]();
      id v382 = v455;
      HMFGetOSLogHandle();
      v383 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v383, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v384 = (id)objc_claimAutoreleasedReturnValue();
        v385 = [v490 identifier];
        v386 = [v385 shortDescription];
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v384;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v386;
        *(_WORD *)&buf[22] = 2048;
        v606 = (void *)v462;
        *(_WORD *)v607 = 2112;
        *(void *)&v607[2] = v457;
        _os_log_impl(&dword_1D4693000, v383, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to insert output block for zone row %lu: %@", buf, 0x2Au);
      }
      id v574 = 0;
      char v387 = [v382 removeBlockWithRow:a2 error:&v574];
      id v54 = v574;
      if ((v387 & 1) == 0)
      {
        v388 = (void *)MEMORY[0x1D944CB30]();
        id v389 = v382;
        HMFGetOSLogHandle();
        v390 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v390, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v391 = (id)objc_claimAutoreleasedReturnValue();
          v392 = [v490 identifier];
          v393 = [v392 shortDescription];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v391;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v393;
          *(_WORD *)&buf[22] = 2112;
          v606 = v54;
          _os_log_impl(&dword_1D4693000, v390, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to clean up corrupt block: %@", buf, 0x20u);
        }
      }
      [v450 finishWithError:v457];
      goto LABEL_262;
    }
  }
  if ([v458 shouldRollBackIfMirrorOutputFails])
  {
    v457 = [MEMORY[0x1E4F1CA48] array];
  }
  else
  {
    v457 = 0;
  }
  id v54 = [MEMORY[0x1E4F1CA48] array];
  if (v578[5])
  {
    id v454 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  }
  else
  {
    id v454 = 0;
  }
  uint64_t v465 = 0;
  v453 = 0;
  uint64_t v451 = [(id)v588[5] type];
  uint64_t v568 = 0;
  v569 = &v568;
  uint64_t v570 = 0x3032000000;
  v571 = __Block_byref_object_copy__716;
  v572 = __Block_byref_object_dispose__717;
  id v573 = 0;
  do
  {
    context = (void *)MEMORY[0x1D944CB30]();
    v55 = (void *)MEMORY[0x1D944CB30]();
    id v449 = v455;
    HMFGetOSLogHandle();
    v56 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v57 = (id)objc_claimAutoreleasedReturnValue();
      v58 = [v490 identifier];
      v59 = [v58 shortDescription];
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v57;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v59;
      *(_WORD *)&buf[22] = 2048;
      v606 = a2;
      *(_WORD *)v607 = 2112;
      *(void *)&v607[2] = v458;
      *(_WORD *)&v607[10] = 2048;
      *(void *)&v607[12] = v465;
      _os_log_impl(&dword_1D4693000, v56, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Fetching objects for blockRow: %lu options: %@ lastItemRowID: %lu", buf, 0x34u);
    }
    uint64_t v60 = [v458 transactionItemsBatchLimit];
    v567[0] = MEMORY[0x1E4F143A8];
    v567[1] = 3221225472;
    uint64_t v61 = 100;
    if (v60) {
      uint64_t v61 = v60;
    }
    v567[2] = ____processRecords_block_invoke_112;
    v567[3] = &unk_1E69E96B8;
    v567[4] = &v568;
    v567[5] = a2;
    v567[6] = v465;
    v567[7] = v61;
    id v499 = [v466 sqlBlockWithActivity:v490 block:v567];
    if (!v499)
    {
      BOOL v76 = [(id)v569[5] count] == 0;
      v77 = (void *)MEMORY[0x1D944CB30]();
      id v78 = v449;
      if (v76)
      {
        v256 = v78;
        HMFGetOSLogHandle();
        v257 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v257, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          id v258 = (id)objc_claimAutoreleasedReturnValue();
          v259 = [v490 identifier];
          v260 = [v259 shortDescription];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v258;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v260;
          _os_log_impl(&dword_1D4693000, v257, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] No more rows to process", buf, 0x16u);
        }
        int v75 = 19;
        goto LABEL_222;
      }
      v497 = v78;
      HMFGetOSLogHandle();
      v79 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        id v80 = (id)objc_claimAutoreleasedReturnValue();
        v81 = [v490 identifier];
        v82 = [v81 shortDescription];
        uint64_t v83 = [(id)v569[5] count];
        *(_DWORD *)buf = 138544386;
        *(void *)&uint8_t buf[4] = v80;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v82;
        *(_WORD *)&buf[22] = 2048;
        v606 = (void *)v83;
        *(_WORD *)v607 = 2048;
        *(void *)&v607[2] = a2;
        *(_WORD *)&v607[10] = 2112;
        *(void *)&v607[12] = v458;
        _os_log_impl(&dword_1D4693000, v79, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Fetched %lu object(s) to process for blockRow: %lu options: %@", buf, 0x34u);
      }
      v460 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v569[5], "count"));
      long long v565 = 0u;
      long long v564 = 0u;
      long long v563 = 0u;
      long long v562 = 0u;
      obuint64_t j = (id)v569[5];
      uint64_t v84 = [obj countByEnumeratingWithState:&v562 objects:v610 count:16];
      if (!v84)
      {
        id v499 = 0;
        goto LABEL_142;
      }
      id v499 = 0;
      uint64_t v467 = *(void *)v563;
      while (1)
      {
        uint64_t v487 = 0;
        uint64_t v473 = v84;
        v453 += v84;
        do
        {
          if (*(void *)v563 != v467) {
            objc_enumerationMutation(obj);
          }
          v85 = *(void **)(*((void *)&v562 + 1) + 8 * v487);
          uint64_t v465 = [v85 itemRow];
          uint64_t v594 = 0;
          uint64_t v595 = (uint64_t)&v594;
          uint64_t v596 = 0x3032000000;
          v597 = __Block_byref_object_copy__716;
          v598 = __Block_byref_object_dispose__717;
          id v599 = 0;
          uint64_t v86 = [v85 modelEncoding];
          if (v86)
          {
            v87 = [v85 modelData];
            uint64_t v88 = [v85 modelEncoding];
            id v559 = v499;
            v491 = [v497 modelFromData:v87 encoding:v88 storageLocation:2 recordRowID:0 error:&v559];
            id v89 = v559;

            if (v491)
            {
              v90 = [v466 queryContextsByClass];
              v476 = [v90 objectForKey:objc_opt_class()];

              uint64_t v91 = [v491 hmbModelID];
              v92 = *(void **)(v595 + 40);
              *(void *)(v595 + 40) = v91;

              id v499 = v89;
              goto LABEL_58;
            }
            v138 = (void *)MEMORY[0x1D944CB30]();
            id v139 = v497;
            HMFGetOSLogHandle();
            v140 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              id v141 = (id)objc_claimAutoreleasedReturnValue();
              v142 = [v490 identifier];
              v143 = [v142 shortDescription];
              uint64_t v144 = [v85 itemRow];
              *(_DWORD *)buf = 138544386;
              *(void *)&uint8_t buf[4] = v141;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v143;
              *(_WORD *)&buf[22] = 2048;
              v606 = (void *)v144;
              *(_WORD *)v607 = 2112;
              *(void *)&v607[2] = v455;
              *(_WORD *)&v607[10] = 2112;
              *(void *)&v607[12] = v89;
              _os_log_impl(&dword_1D4693000, v140, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] unable to unarchive object for %lu / %@: %@", buf, 0x34u);
            }
            v558[0] = MEMORY[0x1E4F143A8];
            v558[1] = 3221225472;
            v558[2] = ____processRecords_block_invoke_116;
            v558[3] = &unk_1E69EB758;
            v558[4] = v85;
            id v499 = [v466 sqlBlockWithActivity:v490 block:v558];

            if (v499)
            {
              v145 = (void *)MEMORY[0x1D944CB30]();
              id v146 = v139;
              HMFGetOSLogHandle();
              v147 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                id v148 = (id)objc_claimAutoreleasedReturnValue();
                v149 = [v490 identifier];
                v150 = [v149 shortDescription];
                uint64_t v151 = [v85 itemRow];
                *(_DWORD *)buf = 138544386;
                *(void *)&uint8_t buf[4] = v148;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v150;
                *(_WORD *)&buf[22] = 2048;
                v606 = (void *)v151;
                *(_WORD *)v607 = 2112;
                *(void *)&v607[2] = v455;
                *(_WORD *)&v607[10] = 2112;
                *(void *)&v607[12] = v499;
                _os_log_impl(&dword_1D4693000, v147, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] unable to flush bogus row for %lu / %@: %@", buf, 0x34u);
              }
            }
          }
          else
          {
            v93 = [v85 modelData];
            BOOL v94 = v93 == 0;

            if (!v94)
            {
              id v95 = objc_alloc(MEMORY[0x1E4F29128]);
              id v96 = [v85 modelData];
              uint64_t v97 = objc_msgSend(v95, "initWithUUIDBytes:", objc_msgSend(v96, "bytes"));
              v98 = *(void **)(v595 + 40);
              *(void *)(v595 + 40) = v97;

              v491 = 0;
              v476 = 0;
              goto LABEL_58;
            }
            v561[0] = MEMORY[0x1E4F143A8];
            v561[1] = 3221225472;
            v561[2] = ____processRecords_block_invoke_114;
            v561[3] = &unk_1E69EB3E8;
            v561[6] = v462;
            v561[5] = &v594;
            v561[4] = v85;
            v152 = [v466 sqlBlockWithActivity:v490 block:v561];

            if (v152)
            {
              v153 = (void *)MEMORY[0x1D944CB30]();
              id v154 = v497;
              HMFGetOSLogHandle();
              v155 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                id v156 = (id)objc_claimAutoreleasedReturnValue();
                v157 = [v490 identifier];
                v158 = [v157 shortDescription];
                v159 = [v85 externalID];
                *(_DWORD *)buf = 138544386;
                *(void *)&uint8_t buf[4] = v156;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v158;
                *(_WORD *)&buf[22] = 2048;
                v606 = (void *)v462;
                *(_WORD *)v607 = 2112;
                *(void *)&v607[2] = v159;
                *(_WORD *)&v607[10] = 2112;
                *(void *)&v607[12] = v152;
                _os_log_impl(&dword_1D4693000, v155, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] unable to determine modelID for %lu / %@: %@", buf, 0x34u);
              }
            }
            else if (*(void *)(v595 + 40))
            {
              v491 = 0;
              v476 = 0;
              id v499 = 0;
LABEL_58:
              v99 = (void *)MEMORY[0x1D944CB30]();
              id v100 = v497;
              HMFGetOSLogHandle();
              v101 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                id v102 = (id)objc_claimAutoreleasedReturnValue();
                v103 = [v490 identifier];
                uint64_t v104 = [v103 shortDescription];
                v105 = (void *)v104;
                v106 = *(void **)(v595 + 40);
                v107 = @"update/insert";
                if (!v86) {
                  v107 = @"delete";
                }
                *(_DWORD *)buf = 138544386;
                *(void *)&uint8_t buf[4] = v102;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v104;
                *(_WORD *)&buf[22] = 2112;
                v606 = v106;
                *(_WORD *)v607 = 2112;
                *(void *)&v607[2] = v107;
                *(_WORD *)&v607[10] = 2112;
                *(void *)&v607[12] = v85;
                _os_log_impl(&dword_1D4693000, v101, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Found modelID %@ to %@ for row: %@", buf, 0x34u);
              }

              uint64_t v108 = *(void *)(v595 + 40);
              id v557 = 0;
              v494 = [v100 fetchRecordRowWithModelID:v108 returning:-1 error:&v557];
              id v109 = v557;
              id v481 = v109;
              if (v494)
              {
                v110 = (void *)MEMORY[0x1D944CB30]();
                id v111 = v100;
                HMFGetOSLogHandle();
                v112 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
                {
                  HMFGetLogIdentifier();
                  id v113 = (id)objc_claimAutoreleasedReturnValue();
                  v114 = [v490 identifier];
                  v115 = [v114 shortDescription];
                  v116 = *(void **)(v595 + 40);
                  *(_DWORD *)buf = 138544130;
                  *(void *)&uint8_t buf[4] = v113;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v115;
                  *(_WORD *)&buf[22] = 2112;
                  v606 = v116;
                  *(_WORD *)v607 = 2112;
                  *(void *)&v607[2] = v494;
                  _os_log_impl(&dword_1D4693000, v112, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Found existing record for modelID %@: %@", buf, 0x2Au);
                }
                goto LABEL_65;
              }
              BOOL v127 = v109 == 0;
              v110 = (void *)MEMORY[0x1D944CB30]();
              id v128 = v100;
              if (!v127)
              {
                HMFGetOSLogHandle();
                v129 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  id v130 = (id)objc_claimAutoreleasedReturnValue();
                  v131 = [v490 identifier];
                  v132 = [v131 shortDescription];
                  v133 = *(void **)(v595 + 40);
                  v134 = [v85 externalID];
                  *(_DWORD *)buf = 138544642;
                  *(void *)&uint8_t buf[4] = v130;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v132;
                  *(_WORD *)&buf[22] = 2112;
                  v606 = v133;
                  *(_WORD *)v607 = 2048;
                  *(void *)&v607[2] = v462;
                  *(_WORD *)&v607[10] = 2112;
                  *(void *)&v607[12] = v134;
                  __int16 v608 = 2112;
                  id v609 = v481;
                  _os_log_impl(&dword_1D4693000, v129, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] unable to find existing model with modelID %@ for %lu / %@: %@", buf, 0x3Eu);
                }
                v135 = [HMBLocalSQLContextRowItem alloc];
                v478 = [MEMORY[0x1E4F29128] UUID];
                v469 = [v478 data];
                v136 = [*(id *)(v595 + 40) data];
                v137 = [(HMBLocalSQLContextRowItem *)v135 initWithItemRow:0 externalID:v469 externalData:v136 modelEncoding:0 modelData:0];
                [v457 addObject:v137];
LABEL_128:

LABEL_129:
                id v499 = v481;
LABEL_130:

                goto LABEL_131;
              }
              HMFGetOSLogHandle();
              v112 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                id v167 = (id)objc_claimAutoreleasedReturnValue();
                v168 = [v490 identifier];
                v169 = [v168 shortDescription];
                v170 = *(void **)(v595 + 40);
                *(_DWORD *)buf = 138543874;
                *(void *)&uint8_t buf[4] = v167;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v169;
                *(_WORD *)&buf[22] = 2112;
                v606 = v170;
                _os_log_impl(&dword_1D4693000, v112, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Did not find existing record for modelID %@", buf, 0x20u);
              }
LABEL_65:

              if ([v494 modelEncoding])
              {
                v117 = [v494 modelData];
                BOOL v118 = [v117 length] == 0;

                if (!v118)
                {
                  id v556 = v481;
                  v478 = [v100 modelFromRecord:v494 storageLocation:2 error:&v556];
                  id v499 = v556;

                  if (v478)
                  {
                    if (v491)
                    {
                      int v119 = [v458 requiresModelCreation];
                      v120 = (void *)MEMORY[0x1D944CB30]();
                      id v121 = v100;
                      if (v119)
                      {
                        HMFGetOSLogHandle();
                        v122 = (id)objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
                        {
                          HMFGetLogIdentifier();
                          id v123 = (id)objc_claimAutoreleasedReturnValue();
                          v124 = [v490 identifier];
                          v125 = [v124 shortDescription];
                          v126 = [v491 hmbDescription];
                          *(_DWORD *)buf = 138543874;
                          *(void *)&uint8_t buf[4] = v123;
                          *(_WORD *)&buf[12] = 2114;
                          *(void *)&buf[14] = v125;
                          *(_WORD *)&buf[22] = 2112;
                          v606 = v126;
                          _os_log_impl(&dword_1D4693000, v122, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Not updating model because model creation is required: %@", buf, 0x20u);
                        }
                        goto LABEL_130;
                      }
                      HMFGetOSLogHandle();
                      v218 = (id)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v218, OS_LOG_TYPE_DEBUG))
                      {
                        HMFGetLogIdentifier();
                        id v483 = (id)objc_claimAutoreleasedReturnValue();
                        v471 = [v490 identifier];
                        v219 = [v471 shortDescription];
                        uint64_t v220 = [v494 recordRow];
                        v221 = [v491 hmbDescription];
                        v222 = [v85 externalID];
                        v223 = [v222 hmbDescription];
                        *(_DWORD *)buf = 138544386;
                        *(void *)&uint8_t buf[4] = v483;
                        *(_WORD *)&buf[12] = 2114;
                        *(void *)&buf[14] = v219;
                        *(_WORD *)&buf[22] = 2048;
                        v606 = (void *)v220;
                        *(_WORD *)v607 = 2112;
                        *(void *)&v607[2] = v221;
                        *(_WORD *)&v607[10] = 2112;
                        *(void *)&v607[12] = v223;
                        _os_log_impl(&dword_1D4693000, v218, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Updating model %lu / %@ / %@", buf, 0x34u);
                      }
                      id v552 = v499;
                      v224 = [v478 hmbModelByMergingFromModel:v491 isFromCloud:v451 == 1 error:&v552];
                      id v481 = v552;

                      if (!v224)
                      {
                        v248 = (void *)MEMORY[0x1D944CB30]();
                        id v249 = v121;
                        HMFGetOSLogHandle();
                        v250 = (id)objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v250, OS_LOG_TYPE_ERROR))
                        {
                          HMFGetLogIdentifier();
                          id v251 = (id)objc_claimAutoreleasedReturnValue();
                          v252 = [v490 identifier];
                          v253 = [v252 shortDescription];
                          v254 = [v478 hmbDescription];
                          v255 = [v491 hmbDescription];
                          *(_DWORD *)buf = 138544386;
                          *(void *)&uint8_t buf[4] = v251;
                          *(_WORD *)&buf[12] = 2114;
                          *(void *)&buf[14] = v253;
                          *(_WORD *)&buf[22] = 2112;
                          v606 = v254;
                          *(_WORD *)v607 = 2112;
                          *(void *)&v607[2] = v255;
                          *(_WORD *)&v607[10] = 2112;
                          *(void *)&v607[12] = v481;
                          _os_log_impl(&dword_1D4693000, v250, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to merge old record with new values %@ / %@: %@", buf, 0x34u);
                        }
                        id v499 = v481;
                        goto LABEL_130;
                      }
                      v225 = [HMBLocalZoneProcessModelContext alloc];
                      uint64_t v226 = v578[5];
                      v227 = [v85 externalData];
                      v136 = [(HMBLocalZoneProcessModelContext *)v225 initWithModel:v224 outputBlockRow:v226 externalData:v227];

                      v228 = [HMBLocalZoneProcessModelContext alloc];
                      v229 = [v494 pushBlockRow];
                      v230 = [v494 externalData];
                      v469 = [(HMBLocalZoneProcessModelContext *)v228 initWithModel:v478 outputBlockRow:v229 externalData:v230];

                      v137 = [(id)objc_opt_class() outputModelFromUpdateModel:v491 mergedModel:v224];
                    }
                    else
                    {
                      v207 = (void *)MEMORY[0x1D944CB30]();
                      id v208 = v100;
                      HMFGetOSLogHandle();
                      v209 = (id)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v209, OS_LOG_TYPE_DEBUG))
                      {
                        HMFGetLogIdentifier();
                        id v482 = (id)objc_claimAutoreleasedReturnValue();
                        v470 = [v490 identifier];
                        v210 = [v470 shortDescription];
                        uint64_t v211 = [v494 recordRow];
                        v212 = [v478 hmbDescription];
                        v213 = [v85 externalID];
                        v214 = [v213 hmbDescription];
                        *(_DWORD *)buf = 138544386;
                        *(void *)&uint8_t buf[4] = v482;
                        *(_WORD *)&buf[12] = 2114;
                        *(void *)&buf[14] = v210;
                        *(_WORD *)&buf[22] = 2048;
                        v606 = (void *)v211;
                        *(_WORD *)v607 = 2112;
                        *(void *)&v607[2] = v212;
                        *(_WORD *)&v607[10] = 2112;
                        *(void *)&v607[12] = v214;
                        _os_log_impl(&dword_1D4693000, v209, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Deleting model %lu / %@ / %@", buf, 0x34u);
                      }
                      v215 = [HMBLocalZoneProcessModelContext alloc];
                      v216 = [v494 pushBlockRow];
                      v217 = [v494 externalData];
                      v469 = [(HMBLocalZoneProcessModelContext *)v215 initWithModel:v478 outputBlockRow:v216 externalData:v217];

                      v137 = 0;
                      v136 = 0;
                      id v481 = v499;
                    }
LABEL_119:
                    if (v457)
                    {
                      if ([v494 modelEncoding])
                      {
                        v231 = [HMBLocalSQLContextRowItem alloc];
                        v232 = [MEMORY[0x1E4F29128] UUID];
                        v233 = [v232 data];
                        v234 = [*(id *)(v595 + 40) data];
                        uint64_t v235 = [v494 modelEncoding];
                        v236 = [v494 modelData];
                        v237 = [(HMBLocalSQLContextRowItem *)v231 initWithItemRow:0 externalID:v233 externalData:v234 modelEncoding:v235 modelData:v236];
                        [v457 addObject:v237];
                      }
                      else
                      {
                        v238 = [HMBLocalSQLContextRowItem alloc];
                        v232 = [MEMORY[0x1E4F29128] UUID];
                        v233 = [v232 data];
                        v234 = [*(id *)(v595 + 40) data];
                        v236 = [(HMBLocalSQLContextRowItem *)v238 initWithItemRow:0 externalID:v233 externalData:v234 modelEncoding:0 modelData:0];
                        [v457 addObject:v236];
                      }
                    }
                    v239 = [v85 externalData];
                    if (v239)
                    {
                      id v240 = [v85 externalID];
                    }
                    else
                    {
                      id v240 = 0;
                    }

                    v241 = [HMBLocalZoneProcessTuple alloc];
                    uint64_t v242 = v578[5];
                    uint64_t v243 = [v494 recordRow];
                    uint64_t v244 = [v85 itemRow];
                    v245 = [v494 modelSchema];
                    v246 = [v494 modelType];
                    v247 = [(HMBLocalZoneProcessTuple *)v241 initWithPreviousContext:v469 mergedContext:v136 updateModel:v491 outputModel:v137 outputBlockRow:v242 recordRow:v243 itemRow:v244 modelSchema:v245 modelType:v246 externalID:v240 queryTable:v476];
                    [v460 addObject:v247];

                    goto LABEL_128;
                  }
                  v171 = (void *)MEMORY[0x1D944CB30]();
                  id v172 = v100;
                  HMFGetOSLogHandle();
                  v173 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    id v174 = (id)objc_claimAutoreleasedReturnValue();
                    v175 = [v490 identifier];
                    v176 = [v175 shortDescription];
                    uint64_t v177 = [v494 recordRow];
                    *(_DWORD *)buf = 138544130;
                    *(void *)&uint8_t buf[4] = v174;
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v176;
                    *(_WORD *)&buf[22] = 2048;
                    v606 = (void *)v177;
                    *(_WORD *)v607 = 2112;
                    *(void *)&v607[2] = v499;
                    _os_log_impl(&dword_1D4693000, v173, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to unarchive record row %lu: %@", buf, 0x2Au);
                  }
                  v553[0] = MEMORY[0x1E4F143A8];
                  v553[1] = 3221225472;
                  v553[2] = ____processRecords_block_invoke_124;
                  v553[3] = &unk_1E69EADA8;
                  id v178 = v494;
                  id v554 = v178;
                  id v555 = v476;
                  id v481 = [v466 sqlBlockWithActivity:v490 block:v553];

                  if (v481)
                  {
                    v179 = (void *)MEMORY[0x1D944CB30]();
                    id v180 = v172;
                    HMFGetOSLogHandle();
                    v181 = (id)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
                    {
                      HMFGetLogIdentifier();
                      id v182 = (id)objc_claimAutoreleasedReturnValue();
                      v183 = [v490 identifier];
                      v184 = [v183 shortDescription];
                      uint64_t v185 = [v178 recordRow];
                      *(_DWORD *)buf = 138544130;
                      *(void *)&uint8_t buf[4] = v182;
                      *(_WORD *)&buf[12] = 2114;
                      *(void *)&buf[14] = v184;
                      *(_WORD *)&buf[22] = 2048;
                      v606 = (void *)v185;
                      *(_WORD *)v607 = 2112;
                      *(void *)&v607[2] = v481;
                      _os_log_impl(&dword_1D4693000, v181, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to remove corrupt record row %lu: %@", buf, 0x2Au);
                    }
                  }
                }
              }
              if (v491)
              {
                int v186 = [v458 disallowsModelCreation];
                v187 = (void *)MEMORY[0x1D944CB30]();
                id v188 = v100;
                if (!v186)
                {
                  HMFGetOSLogHandle();
                  v199 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v199, OS_LOG_TYPE_DEBUG))
                  {
                    HMFGetLogIdentifier();
                    id v200 = (id)objc_claimAutoreleasedReturnValue();
                    v201 = [v490 identifier];
                    v202 = [v201 shortDescription];
                    v203 = [v491 hmbDescription];
                    *(_DWORD *)buf = 138543874;
                    *(void *)&uint8_t buf[4] = v200;
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v202;
                    *(_WORD *)&buf[22] = 2112;
                    v606 = v203;
                    _os_log_impl(&dword_1D4693000, v199, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Inserting model %@", buf, 0x20u);
                  }
                  v204 = [HMBLocalZoneProcessModelContext alloc];
                  uint64_t v205 = v578[5];
                  v206 = [v85 externalData];
                  v136 = [(HMBLocalZoneProcessModelContext *)v204 initWithModel:v491 outputBlockRow:v205 externalData:v206];

                  v137 = v491;
                  v478 = 0;
                  v469 = 0;
                  goto LABEL_119;
                }
                HMFGetOSLogHandle();
                v189 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v189, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  id v190 = (id)objc_claimAutoreleasedReturnValue();
                  v191 = [v490 identifier];
                  v192 = [v191 shortDescription];
                  v193 = [v491 hmbDescription];
                  *(_DWORD *)buf = 138543874;
                  *(void *)&uint8_t buf[4] = v190;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v192;
                  *(_WORD *)&buf[22] = 2112;
                  v606 = v193;
                  _os_log_impl(&dword_1D4693000, v189, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Not creating model because model creation is disallowed: %@", buf, 0x20u);
                }
              }
              else
              {
                v187 = (void *)MEMORY[0x1D944CB30]();
                id v194 = v100;
                HMFGetOSLogHandle();
                v189 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v189, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  id v195 = (id)objc_claimAutoreleasedReturnValue();
                  v196 = [v490 identifier];
                  v197 = [v196 shortDescription];
                  v198 = *(void **)(v595 + 40);
                  *(_DWORD *)buf = 138543874;
                  *(void *)&uint8_t buf[4] = v195;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v197;
                  *(_WORD *)&buf[22] = 2112;
                  v606 = v198;
                  _os_log_impl(&dword_1D4693000, v189, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] No previous or updated value found for model with ID %@", buf, 0x20u);
                }
              }

              v478 = 0;
              goto LABEL_129;
            }
            v560[0] = MEMORY[0x1E4F143A8];
            v560[1] = 3221225472;
            v560[2] = ____processRecords_block_invoke_115;
            v560[3] = &unk_1E69EB758;
            v560[4] = v85;
            id v499 = [v466 sqlBlockWithActivity:v490 block:v560];

            if (v499)
            {
              v160 = (void *)MEMORY[0x1D944CB30]();
              id v161 = v497;
              HMFGetOSLogHandle();
              v162 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                id v163 = (id)objc_claimAutoreleasedReturnValue();
                v164 = [v490 identifier];
                v165 = [v164 shortDescription];
                uint64_t v166 = [v85 itemRow];
                *(_DWORD *)buf = 138544386;
                *(void *)&uint8_t buf[4] = v163;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v165;
                *(_WORD *)&buf[22] = 2048;
                v606 = (void *)v166;
                *(_WORD *)v607 = 2112;
                *(void *)&v607[2] = v455;
                *(_WORD *)&v607[10] = 2112;
                *(void *)&v607[12] = v499;
                _os_log_impl(&dword_1D4693000, v162, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] unable to flush bogus row for %lu / %@: %@", buf, 0x34u);
              }
            }
          }
LABEL_131:
          _Block_object_dispose(&v594, 8);

          ++v487;
        }
        while (v473 != v487);
        uint64_t v84 = [obj countByEnumeratingWithState:&v562 objects:v610 count:16];
        if (!v84)
        {
LABEL_142:

          long long v550 = 0u;
          long long v551 = 0u;
          long long v548 = 0u;
          long long v549 = 0u;
          id v456 = v460;
          uint64_t v461 = [v456 countByEnumeratingWithState:&v548 objects:v604 count:16];
          if (!v461) {
            goto LABEL_220;
          }
          uint64_t v459 = *(void *)v549;
          while (1)
          {
            for (uint64_t i = 0; i != v461; ++i)
            {
              if (*(void *)v549 != v459) {
                objc_enumerationMutation(v456);
              }
              v261 = *(void **)(*((void *)&v548 + 1) + 8 * i);
              v477 = [v261 previousContext];
              v495 = [v261 mergedContext];
              v472 = [v261 externalID];
              v488 = [v495 externalData];
              uint64_t v262 = [(id)objc_opt_class() outputBlockRowForTuple:v261 activity:v490];
              v492 = (void *)v262;
              if (v488) {
                BOOL v263 = 1;
              }
              else {
                BOOL v263 = v262 == 0;
              }
              if (v263)
              {
                v484 = 0;
                uint64_t v264 = 0;
                goto LABEL_161;
              }
              uint64_t v265 = [v261 outputModel];
              v266 = (void *)v265;
              if (!v265)
              {
                v276 = [v477 model];
                v277 = [v276 hmbModelID];
                v484 = [v277 data];

                uint64_t v264 = 0;
                id v269 = v499;
LABEL_159:

                goto LABEL_160;
              }
              v267 = [v497 modelContainer];
              uint64_t v264 = [v267 bestModelEncodingForStorageLocation:3];

              v268 = [v497 modelContainer];
              id v547 = v499;
              v484 = [v268 dataFromModel:v266 encoding:v264 storageLocation:3 updatedModelIDs:0 error:&v547];
              id v269 = v547;

              if (!v484)
              {
                v270 = (void *)MEMORY[0x1D944CB30]();
                id v271 = v497;
                HMFGetOSLogHandle();
                v272 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v272, OS_LOG_TYPE_ERROR))
                {
                  v474 = v270;
                  HMFGetLogIdentifier();
                  id v500 = (id)objc_claimAutoreleasedReturnValue();
                  v485 = [v490 identifier];
                  v273 = [v485 shortDescription];
                  v274 = [v495 model];
                  v275 = [v274 hmbDescription];
                  *(_DWORD *)buf = 138544130;
                  *(void *)&uint8_t buf[4] = v500;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v273;
                  *(_WORD *)&buf[22] = 2112;
                  v606 = v275;
                  *(_WORD *)v607 = 2112;
                  *(void *)&v607[2] = v269;
                  _os_log_impl(&dword_1D4693000, v272, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to encode object %@ (not attempting to push): %@", buf, 0x2Au);

                  v270 = v474;
                }

                v484 = 0;
                v276 = v492;
                v492 = 0;
                goto LABEL_159;
              }
LABEL_160:

              id v499 = v269;
LABEL_161:
              if (!v495)
              {
                v291 = [v261 modelSchema];
                BOOL v292 = v291 == 0;

                if (v292)
                {
                  uint64_t v279 = 0;
                  v282 = 0;
                  v285 = 0;
                }
                else
                {
                  v285 = [v261 modelSchema];
                  uint64_t v279 = 0;
                  v282 = 0;
                }
                v287 = 0;
                goto LABEL_175;
              }
              v278 = [v497 modelContainer];
              uint64_t v279 = [v278 bestModelEncodingForStorageLocation:2];

              v280 = [v497 modelContainer];
              v281 = [v495 model];
              id v546 = 0;
              v282 = [v280 dataFromModel:v281 encoding:v279 storageLocation:2 updatedModelIDs:0 error:&v546];
              id v475 = v546;

              if (v282)
              {
                v283 = [v497 modelContainer];
                v284 = [v495 model];
                v285 = [v283 schemaHashForModel:v284];

                v286 = [v495 model];
                v287 = [v286 hmbType];

                v288 = [v261 modelSchema];
                if (![v285 isEqual:v288]) {
                  goto LABEL_166;
                }
                v289 = [v261 modelType];
                int v290 = [v287 isEqual:v289];

                if (v290)
                {

                  v285 = 0;
                  v288 = v287;
                  v287 = 0;
LABEL_166:
                }
LABEL_175:
                v530[0] = MEMORY[0x1E4F143A8];
                v530[1] = 3221225472;
                v530[2] = ____processRecords_block_invoke_127;
                v530[3] = &unk_1E69E96E0;
                v530[4] = v261;
                id v475 = v282;
                id v531 = v475;
                id v532 = v492;
                id v301 = v497;
                id v533 = v301;
                id v302 = v490;
                id v534 = v302;
                id obja = v287;
                id v535 = obja;
                id v303 = v477;
                id v536 = v303;
                uint64_t v542 = v264;
                id v537 = v484;
                id v538 = v472;
                id v539 = v488;
                uint64_t v543 = v279;
                id v304 = v285;
                id v540 = v304;
                BOOL v545 = v451 == 1;
                id v305 = v495;
                id v541 = v305;
                uint64_t v544 = v462;
                uint64_t v468 = [v466 sqlTransactionWithActivity:v302 block:v530];

                if (v468)
                {
                  v306 = (void *)MEMORY[0x1D944CB30]();
                  id v307 = v301;
                  HMFGetOSLogHandle();
                  v308 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v308, OS_LOG_TYPE_ERROR))
                  {
                    id v501 = v304;
                    HMFGetLogIdentifier();
                    id v309 = (id)objc_claimAutoreleasedReturnValue();
                    v310 = [v302 identifier];
                    v311 = [v310 shortDescription];
                    uint64_t v312 = [v261 itemRow];
                    v313 = [v307 zoneID];
                    v314 = [v313 name];
                    *(_DWORD *)buf = 138544386;
                    *(void *)&uint8_t buf[4] = v309;
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v311;
                    *(_WORD *)&buf[22] = 2048;
                    v606 = (void *)v312;
                    *(_WORD *)v607 = 2112;
                    *(void *)&v607[2] = v314;
                    *(_WORD *)&v607[10] = 2112;
                    *(void *)&v607[12] = v468;
                    _os_log_impl(&dword_1D4693000, v308, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] unable to update / insert row for %lu / %@: %@", buf, 0x34u);

                    id v304 = v501;
                  }
                }
                else
                {
                  if (v495)
                  {
                    v315 = (void *)MEMORY[0x1D944CB30]();
                    id v316 = v301;
                    if (v303)
                    {
                      HMFGetOSLogHandle();
                      v317 = (id)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v317, OS_LOG_TYPE_DEBUG))
                      {
                        v502 = v315;
                        HMFGetLogIdentifier();
                        id v318 = (id)objc_claimAutoreleasedReturnValue();
                        v319 = [v302 identifier];
                        v320 = [v319 shortDescription];
                        v321 = [v305 model];
                        *(_DWORD *)buf = 138543874;
                        *(void *)&uint8_t buf[4] = v318;
                        *(_WORD *)&buf[12] = 2114;
                        *(void *)&buf[14] = v320;
                        *(_WORD *)&buf[22] = 2112;
                        v606 = v321;
                        _os_log_impl(&dword_1D4693000, v317, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Sending update delegate callback for model: %@", buf, 0x20u);

                        v315 = v502;
                      }

                      v322 = [HMBProcessingModelUpdate alloc];
                      v323 = [v305 model];
                      v324 = [v303 model];
                      v325 = [(HMBProcessingModelUpdate *)v322 initWithModel:v323 previousModel:v324 options:v458 mirrorOutputFuture:v454];

                      v326 = [v305 model];
                      v327 = [v326 hmbModelID];
                      v328 = [v316 observersForModelWithID:v327];

                      long long v520 = 0u;
                      long long v521 = 0u;
                      long long v518 = 0u;
                      long long v519 = 0u;
                      id v329 = v328;
                      uint64_t v330 = [v329 countByEnumeratingWithState:&v518 objects:v601 count:16];
                      if (v330)
                      {
                        uint64_t v331 = *(void *)v519;
                        do
                        {
                          for (uint64_t j = 0; j != v330; ++j)
                          {
                            if (*(void *)v519 != v331) {
                              objc_enumerationMutation(v329);
                            }
                            v333 = [*(id *)(*((void *)&v518 + 1) + 8 * j) localZone:v316 didProcessModelUpdate:v325];
                            if (v333) {
                              [v54 addObject:v333];
                            }
                          }
                          uint64_t v330 = [v329 countByEnumeratingWithState:&v518 objects:v601 count:16];
                        }
                        while (v330);
                      }
                    }
                    else
                    {
                      HMFGetOSLogHandle();
                      v350 = (id)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v350, OS_LOG_TYPE_DEBUG))
                      {
                        v351 = v315;
                        HMFGetLogIdentifier();
                        id v352 = (id)objc_claimAutoreleasedReturnValue();
                        v353 = [v302 identifier];
                        v354 = [v353 shortDescription];
                        v355 = [v305 model];
                        *(_DWORD *)buf = 138543874;
                        *(void *)&uint8_t buf[4] = v352;
                        *(_WORD *)&buf[12] = 2114;
                        *(void *)&buf[14] = v354;
                        *(_WORD *)&buf[22] = 2112;
                        v606 = v355;
                        _os_log_impl(&dword_1D4693000, v350, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Sending creation delegate callback for model: %@", buf, 0x20u);

                        v315 = v351;
                      }

                      v356 = [HMBProcessingModelCreation alloc];
                      v357 = [v305 model];
                      v325 = [(HMBProcessingModelResult *)v356 initWithModel:v357 options:v458 mirrorOutputFuture:v454];

                      v358 = [v305 model];
                      v359 = [v358 hmbModelID];
                      v360 = [v316 observersForModelWithID:v359];

                      long long v524 = 0u;
                      long long v525 = 0u;
                      long long v522 = 0u;
                      long long v523 = 0u;
                      id v329 = v360;
                      uint64_t v361 = [v329 countByEnumeratingWithState:&v522 objects:v602 count:16];
                      if (v361)
                      {
                        uint64_t v362 = *(void *)v523;
                        do
                        {
                          for (uint64_t k = 0; k != v361; ++k)
                          {
                            if (*(void *)v523 != v362) {
                              objc_enumerationMutation(v329);
                            }
                            v364 = [*(id *)(*((void *)&v522 + 1) + 8 * k) localZone:v316 didProcessModelCreation:v325];
                            if (v364) {
                              [v54 addObject:v364];
                            }
                          }
                          uint64_t v361 = [v329 countByEnumeratingWithState:&v522 objects:v602 count:16];
                        }
                        while (v361);
                      }
                    }
                  }
                  else
                  {
                    v334 = (void *)MEMORY[0x1D944CB30]();
                    id v335 = v301;
                    HMFGetOSLogHandle();
                    v336 = (id)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v336, OS_LOG_TYPE_DEBUG))
                    {
                      HMFGetLogIdentifier();
                      id v337 = (id)objc_claimAutoreleasedReturnValue();
                      v338 = [v302 identifier];
                      v339 = [v338 shortDescription];
                      v340 = [v303 model];
                      *(_DWORD *)buf = 138543874;
                      *(void *)&uint8_t buf[4] = v337;
                      *(_WORD *)&buf[12] = 2114;
                      *(void *)&buf[14] = v339;
                      *(_WORD *)&buf[22] = 2112;
                      v606 = v340;
                      _os_log_impl(&dword_1D4693000, v336, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Sending deletion delegate callback for model: %@", buf, 0x20u);
                    }
                    v341 = [HMBProcessingModelDeletion alloc];
                    v342 = [v303 model];
                    v325 = [(HMBProcessingModelResult *)v341 initWithModel:v342 options:v458 mirrorOutputFuture:v454];

                    v343 = [v303 model];
                    v344 = [v343 hmbParentModelID];
                    v345 = [v335 observersForModelWithID:v344];

                    long long v528 = 0u;
                    long long v529 = 0u;
                    long long v526 = 0u;
                    long long v527 = 0u;
                    id v329 = v345;
                    uint64_t v346 = [v329 countByEnumeratingWithState:&v526 objects:v603 count:16];
                    if (v346)
                    {
                      uint64_t v347 = *(void *)v527;
                      do
                      {
                        for (uint64_t m = 0; m != v346; ++m)
                        {
                          if (*(void *)v527 != v347) {
                            objc_enumerationMutation(v329);
                          }
                          v349 = [*(id *)(*((void *)&v526 + 1) + 8 * m) localZone:v335 didProcessModelDeletion:v325];
                          if (v349) {
                            [v54 addObject:v349];
                          }
                        }
                        uint64_t v346 = [v329 countByEnumeratingWithState:&v526 objects:v603 count:16];
                      }
                      while (v346);
                    }
                  }
                }
                id v499 = (id)v468;
                goto LABEL_218;
              }
              v293 = (void *)MEMORY[0x1D944CB30]();
              id v294 = v497;
              HMFGetOSLogHandle();
              v295 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v295, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                id v296 = (id)objc_claimAutoreleasedReturnValue();
                v297 = [v490 identifier];
                v298 = [v297 shortDescription];
                v299 = [v495 model];
                v300 = [v299 hmbDescription];
                *(_DWORD *)buf = 138544130;
                *(void *)&uint8_t buf[4] = v296;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v298;
                *(_WORD *)&buf[22] = 2112;
                v606 = v300;
                *(_WORD *)v607 = 2112;
                *(void *)&v607[2] = v475;
                _os_log_impl(&dword_1D4693000, v295, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to encode model %@: %@", buf, 0x2Au);
              }
LABEL_218:
            }
            uint64_t v461 = [v456 countByEnumeratingWithState:&v548 objects:v604 count:16];
            if (!v461)
            {
LABEL_220:

              int v75 = 0;
              goto LABEL_221;
            }
          }
        }
      }
    }
    v62 = (void *)MEMORY[0x1D944CB30]();
    id v63 = v449;
    HMFGetOSLogHandle();
    v64 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v65 = (id)objc_claimAutoreleasedReturnValue();
      v66 = [v490 identifier];
      v67 = [v66 shortDescription];
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v65;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v67;
      *(_WORD *)&buf[22] = 2048;
      v606 = a2;
      *(_WORD *)v607 = 2112;
      *(void *)&v607[2] = v455;
      *(_WORD *)&v607[10] = 2112;
      *(void *)&v607[12] = v499;
      _os_log_impl(&dword_1D4693000, v64, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch transaction entries for %lu / %@: %@", buf, 0x34u);
    }
    id v566 = 0;
    char v68 = [v63 removeBlockWithRow:a2 error:&v566];
    id v456 = v566;
    if ((v68 & 1) == 0)
    {
      v69 = (void *)MEMORY[0x1D944CB30]();
      id v70 = v63;
      HMFGetOSLogHandle();
      v71 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v72 = (id)objc_claimAutoreleasedReturnValue();
        v73 = [v490 identifier];
        v74 = [v73 shortDescription];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v72;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v74;
        *(_WORD *)&buf[22] = 2112;
        v606 = v456;
        _os_log_impl(&dword_1D4693000, v71, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to clean up corrupt block: %@", buf, 0x20u);
      }
    }
    [v450 finishWithError:v499];
    int v75 = 1;
LABEL_221:

LABEL_222:
    if (v75 != 19 && v75) {
      goto LABEL_261;
    }
  }
  while ([(id)v569[5] count]);
  uint64_t v512 = 0;
  v513 = &v512;
  uint64_t v514 = 0x3032000000;
  v515 = __Block_byref_object_copy__716;
  v516 = __Block_byref_object_dispose__717;
  id v517 = 0;
  if (!v457) {
    goto LABEL_228;
  }
  id v511 = 0;
  v506[0] = MEMORY[0x1E4F143A8];
  v506[1] = 3221225472;
  v506[2] = ____processRecords_block_invoke_131;
  v506[3] = &unk_1E69E9708;
  id v365 = v449;
  id v507 = v365;
  v509 = &v587;
  id v508 = v457;
  v510 = &v512;
  char v366 = [v466 sqlTransactionWithActivity:v490 error:&v511 block:v506];
  id v367 = v511;
  if (v366)
  {

LABEL_228:
    id v367 = (id)v578[5];
    if (v367)
    {
      v368 = (void *)v513[5];
      id v369 = v449;
      id v493 = v367;
      id v489 = v368;
      id v498 = v458;
      id v503 = v490;
      v370 = [v369 localDatabase];
      v496 = [v370 local];

      id v600 = 0;
      v371 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v498 requiringSecureCoding:1 error:&v600];
      id v372 = v600;
      if (v371)
      {
        uint64_t v594 = MEMORY[0x1E4F143A8];
        uint64_t v595 = 3221225472;
        uint64_t v596 = (uint64_t)____finishEnqueueForOutput_block_invoke;
        v597 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E69EADA8;
        v373 = (void (*)(uint64_t))v493;
        v598 = v373;
        id v599 = v371;
        uint64_t v374 = [v496 sqlTransactionWithActivity:v503 block:&v594];

        if (v374)
        {
          v375 = (void *)MEMORY[0x1D944CB30]();
          id v376 = v369;
          v377 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v377, OS_LOG_TYPE_ERROR))
          {
            v378 = HMFGetLogIdentifier();
            v379 = [v503 identifier];
            v380 = [v379 shortDescription];
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v378;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v380;
            *(_WORD *)&buf[22] = 2112;
            v606 = (void *)v374;
            _os_log_impl(&dword_1D4693000, v377, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to update block to enqueue output: %@", buf, 0x20u);
          }
          id v367 = [MEMORY[0x1E4F7A0D8] futureWithError:v374];
        }
        else
        {
          v431 = [v369 mirror];

          v486 = (void *)MEMORY[0x1D944CB30]();
          id v432 = v369;
          v433 = HMFGetOSLogHandle();
          BOOL v434 = os_log_type_enabled(v433, OS_LOG_TYPE_INFO);
          if (v431)
          {
            if (v434)
            {
              v435 = HMFGetLogIdentifier();
              v480 = [v503 identifier];
              v436 = [v480 shortDescription];
              v437 = [v432 mirror];
              *(_DWORD *)buf = 138544130;
              *(void *)&uint8_t buf[4] = v435;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v436;
              *(_WORD *)&buf[22] = 2112;
              v606 = v373;
              *(_WORD *)v607 = 2112;
              *(void *)&v607[2] = v437;
              _os_log_impl(&dword_1D4693000, v433, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Triggering output for output block row %@ on %@", buf, 0x2Au);
            }
            v438 = [v432 mirror];
            objc_msgSend(v438, "triggerOutputForOutputRow:options:", objc_msgSend(v373, "unsignedIntegerValue"), v498);
            id v367 = (id)objc_claimAutoreleasedReturnValue();

            if (v489)
            {
              objc_initWeak(&location, v432);
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = ____finishEnqueueForOutput_block_invoke_136;
              v606 = &unk_1E69E9730;
              objc_copyWeak((id *)&v607[16], &location);
              *(void *)v607 = v503;
              *(void *)&v607[8] = v489;
              id v439 = (id)[v367 addCompletionBlock:buf];

              objc_destroyWeak((id *)&v607[16]);
              objc_destroyWeak(&location);
            }
          }
          else
          {
            if (v434)
            {
              v440 = HMFGetLogIdentifier();
              v441 = [v503 identifier];
              v442 = [v441 shortDescription];
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v440;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v442;
              _os_log_impl(&dword_1D4693000, v433, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Unable to trigger output because self.mirror is nil", buf, 0x16u);
            }
            v443 = (void *)MEMORY[0x1E4F7A0D8];
            v444 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
            id v367 = [v443 futureWithError:v444];
          }
        }

        id v372 = (id)v374;
      }
      else
      {
        v401 = (void *)MEMORY[0x1D944CB30]();
        id v402 = v369;
        v403 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v403, OS_LOG_TYPE_ERROR))
        {
          v404 = HMFGetLogIdentifier();
          v405 = [v503 identifier];
          v406 = [v405 shortDescription];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v404;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v406;
          *(_WORD *)&buf[22] = 2112;
          v606 = v372;
          _os_log_impl(&dword_1D4693000, v403, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to encode options for output: %@", buf, 0x20u);
        }
        id v367 = [MEMORY[0x1E4F7A0D8] futureWithError:v372];
      }

      v407 = [v454 completionHandlerAdapter];
      id v408 = (id)[v367 addCompletionBlock:v407];
    }
    id v505 = 0;
    char v409 = [v449 removeBlockWithRow:a2 error:&v505];
    id v504 = v505;
    if ((v409 & 1) == 0)
    {
      v410 = (void *)MEMORY[0x1D944CB30]();
      id v411 = v449;
      HMFGetOSLogHandle();
      v412 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v412, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v413 = (id)objc_claimAutoreleasedReturnValue();
        v414 = [v490 identifier];
        v415 = [v414 shortDescription];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v413;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v415;
        *(_WORD *)&buf[22] = 2112;
        v606 = v504;
        _os_log_impl(&dword_1D4693000, v412, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to clean up processed block: %@", buf, 0x20u);
      }
    }
    v416 = [[HMBProcessingResult alloc] initWithOptions:v458 actions:v54 mirrorOutputResult:v367];
    v417 = [v449 delegate];
    uint64_t v418 = objc_opt_respondsToSelector();
    if (v418)
    {
      v419 = (void *)MEMORY[0x1D944CB30]();
      id v420 = v449;
      HMFGetOSLogHandle();
      v421 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v421, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        id v422 = (id)objc_claimAutoreleasedReturnValue();
        v423 = [v490 identifier];
        v424 = [v423 shortDescription];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v422;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v424;
        *(_WORD *)&buf[22] = 2112;
        v606 = v416;
        _os_log_impl(&dword_1D4693000, v421, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Sending processing complete callback with result: %@", buf, 0x20u);
      }
      uint64_t v418 = [v417 localZone:v420 didCompleteProcessingWithResult:v416];
    }
    v425 = (void *)MEMORY[0x1D944CB30](v418);
    id v426 = v449;
    HMFGetOSLogHandle();
    v427 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v427, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      id v428 = (id)objc_claimAutoreleasedReturnValue();
      v429 = [v490 identifier];
      v430 = [v429 shortDescription];
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v428;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v430;
      *(_WORD *)&buf[22] = 2048;
      v606 = v453;
      *(_WORD *)v607 = 2048;
      *(void *)&v607[2] = a2;
      _os_log_impl(&dword_1D4693000, v427, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Finished processing %lu row(s) for blockRow: %lu", buf, 0x2Au);
    }
    [v450 finishWithResult:v416];

    id v400 = v504;
  }
  else
  {
    v394 = (void *)MEMORY[0x1D944CB30]();
    id v395 = v365;
    HMFGetOSLogHandle();
    v396 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v396, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v397 = (id)objc_claimAutoreleasedReturnValue();
      v398 = [v490 identifier];
      v399 = [v398 shortDescription];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v397;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v399;
      *(_WORD *)&buf[22] = 2112;
      v606 = v367;
      _os_log_impl(&dword_1D4693000, v396, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to write rollback entries: %@", buf, 0x20u);
    }
    [v450 finishWithError:v367];

    id v400 = v507;
  }

  _Block_object_dispose(&v512, 8);
LABEL_261:
  _Block_object_dispose(&v568, 8);

LABEL_262:
  _Block_object_dispose(&v577, 8);

LABEL_263:
  v33 = v445;
LABEL_264:

LABEL_265:
  _Block_object_dispose(&v587, 8);
}

void sub_1D46A3268(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)&STACK[0x690]);
  _Block_object_dispose(&STACK[0x230], 8);
  _Block_object_dispose(&STACK[0x578], 8);
  _Block_object_dispose(&STACK[0x5E8], 8);
  _Block_object_dispose(&STACK[0x660], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__716(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__717(uint64_t a1)
{
}

id ____processRecords_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v9 = 0;
  uint64_t v4 = [a2 _selectBlockWithRow:v3 error:&v9];
  id v5 = v9;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  return v5;
}

id ____processRecords_block_invoke_108(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v10 = 0;
  uint64_t v4 = [a2 _insertBlockWithZoneRow:v3 type:0 error:&v10];
  id v5 = v10;
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v4];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  return v5;
}

id ____processRecords_block_invoke_112(void *a1, void *a2)
{
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  id v11 = 0;
  uint64_t v6 = [a2 _selectItemsWithBlockRow:v3 rowGreaterThan:v4 limit:v5 returning:-1 error:&v11];
  id v7 = v11;
  uint64_t v8 = *(void *)(a1[4] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;

  return v7;
}

id ____processRecords_block_invoke_114(void *a1, void *a2)
{
  uint64_t v3 = a1[6];
  uint64_t v4 = (void *)a1[4];
  id v5 = a2;
  uint64_t v6 = [v4 externalID];
  id v12 = 0;
  uint64_t v7 = [v5 _selectRecordModelIDWithZoneRow:v3 externalID:v6 error:&v12];

  id v8 = v12;
  uint64_t v9 = *(void *)(a1[5] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;

  return v8;
}

id ____processRecords_block_invoke_115(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = 0;
  objc_msgSend(v3, "_deleteItemWithRow:error:", objc_msgSend(v2, "itemRow"), &v6);

  id v4 = v6;
  return v4;
}

id ____processRecords_block_invoke_116(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = 0;
  objc_msgSend(v3, "_deleteItemWithRow:error:", objc_msgSend(v2, "itemRow"), &v6);

  id v4 = v6;
  return v4;
}

id ____processRecords_block_invoke_124(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v11 = 0;
  objc_msgSend(v4, "_deleteRecordWithRow:error:", objc_msgSend(v3, "recordRow"), &v11);

  id v5 = v11;
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = [*(id *)(a1 + 32) recordRow];
  id v10 = v5;
  [v6 _deleteQueryForRecordRow:v7 error:&v10];
  id v8 = v10;

  return v8;
}

id ____processRecords_block_invoke_127(uint64_t a1, void *a2)
{
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  id v123 = a2;
  if ([*(id *)(a1 + 32) recordRow])
  {
    if (*(void *)(a1 + 40) || *(void *)(a1 + 48))
    {
      id v3 = (void *)MEMORY[0x1D944CB30]();
      id v4 = *(id *)(a1 + 56);
      id v5 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id v6 = HMFGetLogIdentifier();
        BOOL v118 = [*(id *)(a1 + 64) identifier];
        uint64_t v7 = [v118 shortDescription];
        uint64_t v112 = [*(id *)(a1 + 32) recordRow];
        uint64_t v114 = *(void *)(a1 + 48);
        v116 = *(void **)(a1 + 128);
        id v8 = [*(id *)(a1 + 88) hmbDescription];
        v110 = *(void **)(a1 + 72);
        uint64_t v9 = [*(id *)(a1 + 96) hmbDescription];
        [*(id *)(a1 + 104) hmbDescription];
        id v10 = v120 = v3;
        id v11 = [*(id *)(a1 + 80) model];
        id v12 = [v11 hmbModelID];
        *(_DWORD *)buf = 138545666;
        v134 = v6;
        __int16 v135 = 2114;
        uint64_t v136 = (uint64_t)v7;
        __int16 v137 = 2048;
        uint64_t v138 = v112;
        __int16 v139 = 2112;
        uint64_t v140 = v114;
        __int16 v141 = 2048;
        v142 = v116;
        __int16 v143 = 2112;
        uint64_t v144 = v8;
        __int16 v145 = 2112;
        id v146 = v110;
        __int16 v147 = 2112;
        id v148 = v9;
        __int16 v149 = 2112;
        v150 = v10;
        __int16 v151 = 2112;
        v152 = v12;
        _os_log_impl(&dword_1D4693000, v5, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Updating record row: %lu %@ %lu %@ %@ %@ %@ %@", buf, 0x66u);

        id v3 = v120;
      }

      uint64_t v13 = [*(id *)(a1 + 32) recordRow];
      uint64_t v14 = *(void *)(a1 + 136);
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 112);
      id v131 = 0;
      [v123 _updateRecordWithRow:v13 modelEncoding:v14 modelData:v15 modelSchema:v16 error:&v131];
      id v17 = v131;
      if (*(void *)(a1 + 48))
      {
        uint64_t v18 = [*(id *)(a1 + 32) recordRow];
        uint64_t v19 = *(void *)(a1 + 48);
        uint64_t v20 = *(void *)(a1 + 88);
        uint64_t v21 = *(void *)(a1 + 128);
        id v130 = v17;
        id v22 = &v130;
        long long v23 = &v130;
        id v24 = v123;
      }
      else
      {
        if (!*(unsigned char *)(a1 + 152)) {
          goto LABEL_9;
        }
        v71 = [*(id *)(a1 + 80) outputBlockRow];

        if (!v71) {
          goto LABEL_9;
        }
        id v72 = (void *)MEMORY[0x1D944CB30]();
        id v73 = *(id *)(a1 + 56);
        v74 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          int v75 = HMFGetLogIdentifier();
          uint64_t v76 = [*(id *)(a1 + 32) recordRow];
          *(_DWORD *)buf = 138543618;
          v134 = v75;
          __int16 v135 = 2048;
          uint64_t v136 = v76;
          _os_log_impl(&dword_1D4693000, v74, OS_LOG_TYPE_INFO, "%{public}@Received change from mirror while existing record row %lu has pending output push", buf, 0x16u);
        }
        v77 = objc_opt_class();
        id v78 = [*(id *)(a1 + 120) externalData];
        v79 = [*(id *)(a1 + 80) externalData];
        LODWORD(v77) = [v77 shouldMirrorInputExternalData:v78 overwriteExistingExternalData:v79];

        if (!v77) {
          goto LABEL_9;
        }
        id v80 = (void *)MEMORY[0x1D944CB30]();
        id v81 = *(id *)(a1 + 56);
        v82 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v83 = HMFGetLogIdentifier();
          uint64_t v84 = [*(id *)(a1 + 64) identifier];
          v85 = [v84 shortDescription];
          *(_DWORD *)buf = 138543618;
          v134 = v83;
          __int16 v135 = 2114;
          uint64_t v136 = (uint64_t)v85;
          _os_log_impl(&dword_1D4693000, v82, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Resetting pending output push data due to change from mirror", buf, 0x16u);
        }
        uint64_t v18 = [*(id *)(a1 + 32) recordRow];
        id v129 = v17;
        id v22 = &v129;
        long long v23 = &v129;
        id v24 = v123;
        uint64_t v19 = 0;
        uint64_t v20 = 0;
        uint64_t v21 = 0;
      }
      [v24 _updateRecordWithRow:v18 pushBlockRow:v19 pushData:v20 pushEncoding:v21 error:v23];
      id v25 = *v22;

      id v17 = v25;
LABEL_9:
      if (*(void *)(a1 + 104))
      {
        uint64_t v26 = [*(id *)(a1 + 32) recordRow];
        uint64_t v27 = *(void *)(a1 + 96);
        uint64_t v28 = *(void *)(a1 + 104);
        id v128 = v17;
        [v123 _updateRecordWithRow:v26 externalID:v27 externalData:v28 error:&v128];
        id v29 = v128;

        id v17 = v29;
      }
      if (*(void *)(a1 + 72) && *(void *)(a1 + 112))
      {
        uint64_t v30 = [*(id *)(a1 + 32) recordRow];
        uint64_t v31 = *(void *)(a1 + 72);
        uint64_t v32 = *(void *)(a1 + 112);
        id v127 = v17;
        [v123 _updateRecordWithRow:v30 modelType:v31 modelSchema:v32 error:&v127];
        id v33 = v127;

        id v17 = v33;
      }
      if (*(void *)(a1 + 40))
      {
        v34 = [*(id *)(a1 + 32) encodedQueryableColumns];

        if (v34)
        {
          id v35 = [*(id *)(a1 + 32) queryTable];
          uint64_t v36 = *(void *)(a1 + 144);
          uint64_t v37 = [*(id *)(a1 + 32) recordRow];
          __int16 v38 = [*(id *)(a1 + 32) encodedQueryableColumns];
          id v126 = v17;
          [v35 _updateQueryForZoneRow:v36 recordRow:v37 encodedColumns:v38 error:&v126];
          id v39 = v126;

          id v17 = v39;
        }
      }
      goto LABEL_38;
    }
    v93 = (void *)MEMORY[0x1D944CB30]();
    id v94 = *(id *)(a1 + 56);
    id v95 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
    {
      id v96 = HMFGetLogIdentifier();
      uint64_t v97 = [*(id *)(a1 + 64) identifier];
      [v97 shortDescription];
      v98 = v122 = v93;
      uint64_t v99 = [*(id *)(a1 + 32) recordRow];
      uint64_t v100 = *(void *)(a1 + 72);
      v101 = [*(id *)(a1 + 80) model];
      id v102 = [v101 hmbModelID];
      *(_DWORD *)buf = 138544386;
      v134 = v96;
      __int16 v135 = 2114;
      uint64_t v136 = (uint64_t)v98;
      __int16 v137 = 2048;
      uint64_t v138 = v99;
      __int16 v139 = 2112;
      uint64_t v140 = v100;
      __int16 v141 = 2112;
      v142 = v102;
      _os_log_impl(&dword_1D4693000, v95, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Deleting record row: %lu %@ %@", buf, 0x34u);

      v93 = v122;
    }

    uint64_t v103 = [*(id *)(a1 + 32) recordRow];
    id v132 = 0;
    [v123 _deleteRecordWithRow:v103 error:&v132];
    id v92 = v132;
LABEL_37:
    id v17 = v92;
    goto LABEL_38;
  }
  __int16 v40 = *(void **)(a1 + 120);
  if (!v40)
  {
    uint64_t v86 = (void *)MEMORY[0x1D944CB30]();
    id v87 = *(id *)(a1 + 56);
    uint64_t v88 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
      id v89 = HMFGetLogIdentifier();
      v90 = [*(id *)(a1 + 64) identifier];
      uint64_t v91 = [v90 shortDescription];
      *(_DWORD *)buf = 138543618;
      v134 = v89;
      __int16 v135 = 2114;
      uint64_t v136 = (uint64_t)v91;
      _os_log_impl(&dword_1D4693000, v88, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] No record row to update or updated model to insert", buf, 0x16u);
    }
    id v92 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    goto LABEL_37;
  }
  uint64_t v41 = *(void *)(a1 + 144);
  uint64_t v42 = *(void *)(a1 + 96);
  uint64_t v43 = *(void *)(a1 + 104);
  v44 = [v40 model];
  v45 = [v44 hmbModelID];
  char v46 = [*(id *)(a1 + 120) model];
  id v47 = [v46 hmbParentModelID];
  uint64_t v48 = *(void *)(a1 + 72);
  uint64_t v49 = *(void *)(a1 + 112);
  uint64_t v51 = *(void *)(a1 + 128);
  uint64_t v50 = *(void *)(a1 + 136);
  uint64_t v52 = *(void *)(a1 + 88);
  uint64_t v53 = *(void *)(a1 + 40);
  uint64_t v54 = *(void *)(a1 + 48);
  id v125 = 0;
  uint64_t v55 = [v123 _insertRecordWithZoneRow:v41 externalID:v42 externalData:v43 modelID:v45 parentModelID:v47 modelType:v48 modelEncoding:v50 modelData:v53 modelSchema:v49 pushEncoding:v51 pushData:v52 pushBlockRow:v54 error:&v125];
  id v17 = v125;

  v56 = [*(id *)(a1 + 32) encodedQueryableColumns];

  if (v56)
  {
    id v57 = [*(id *)(a1 + 32) queryTable];
    uint64_t v58 = *(void *)(a1 + 144);
    v59 = [*(id *)(a1 + 32) encodedQueryableColumns];
    id v124 = v17;
    [v57 _updateQueryForZoneRow:v58 recordRow:v55 encodedColumns:v59 error:&v124];
    id v60 = v124;

    id v17 = v60;
  }
  uint64_t v61 = (void *)MEMORY[0x1D944CB30]();
  id v62 = *(id *)(a1 + 56);
  id v63 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
  {
    v64 = HMFGetLogIdentifier();
    int v119 = [*(id *)(a1 + 64) identifier];
    id v65 = [v119 shortDescription];
    uint64_t v108 = *(void *)(a1 + 48);
    id v109 = *(void **)(a1 + 128);
    v117 = [*(id *)(a1 + 120) model];
    v115 = [v117 hmbModelID];
    v66 = [v115 UUIDString];
    [*(id *)(a1 + 120) model];
    id v113 = v107 = v55;
    id v111 = [v113 hmbParentModelID];
    v67 = [v111 UUIDString];
    v106 = *(void **)(a1 + 72);
    char v68 = [*(id *)(a1 + 96) hmbDescription];
    [*(id *)(a1 + 104) hmbDescription];
    v69 = id v121 = v61;
    id v70 = [*(id *)(a1 + 88) hmbDescription];
    *(_DWORD *)buf = 138545922;
    v134 = v64;
    __int16 v135 = 2114;
    uint64_t v136 = (uint64_t)v65;
    __int16 v137 = 2048;
    uint64_t v138 = v107;
    __int16 v139 = 2112;
    uint64_t v140 = v108;
    __int16 v141 = 2048;
    v142 = v109;
    __int16 v143 = 2112;
    uint64_t v144 = v66;
    __int16 v145 = 2112;
    id v146 = v67;
    __int16 v147 = 2112;
    id v148 = v106;
    __int16 v149 = 2112;
    v150 = v68;
    __int16 v151 = 2112;
    v152 = v69;
    __int16 v153 = 2112;
    id v154 = v70;
    _os_log_impl(&dword_1D4693000, v63, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Inserting record row: %lu %@ %lu %@ %@ %@ %@ %@ %@", buf, 0x70u);

    uint64_t v61 = v121;
  }

LABEL_38:
  id v104 = v17;

  return v104;
}

id ____processRecords_block_invoke_131(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 zoneRow];
  id v6 = [*(id *)(*(void *)(a1[6] + 8) + 40) optionsData];
  uint64_t v7 = a1[5];
  id v14 = 0;
  uint64_t v8 = [v4 _insertBlockWithZoneRow:v5 type:3 options:v6 items:v7 error:&v14];

  id v9 = v14;
  uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v8];
  uint64_t v11 = *(void *)(a1[7] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  return v9;
}

id ____finishEnqueueForOutput_block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 unsignedIntegerValue];
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = 0;
  [v4 _updateBlockWithRow:v5 options:v6 error:&v9];

  id v7 = v9;
  return v7;
}

void ____finishEnqueueForOutput_block_invoke_136(id *a1, void *a2, void *a3)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    uint64_t v8 = (void *)MEMORY[0x1D944CB30]();
    id v9 = WeakRetained;
    uint64_t v10 = HMFGetOSLogHandle();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v11)
      {
        id v12 = HMFGetLogIdentifier();
        uint64_t v13 = [a1[4] identifier];
        id v14 = [v13 shortDescription];
        uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t))a1[5];
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2112;
        id v60 = v15;
        LOWORD(v61) = 2112;
        *(void *)((char *)&v61 + 2) = v6;
        _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Rolling back block %@ due to push failure: %@", buf, 0x2Au);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      id v60 = __Block_byref_object_copy__716;
      *(void *)&long long v61 = __Block_byref_object_dispose__717;
      *((void *)&v61 + 1) = 0;
      uint64_t v16 = [v9 sql];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = ____finishEnqueueForOutput_block_invoke_137;
      v50[3] = &unk_1E69EB7A8;
      uint64_t v52 = buf;
      id v51 = a1[5];
      id v17 = [v16 sqlBlockWithActivity:0 block:v50];

      if (v17)
      {
        context = (void *)MEMORY[0x1D944CB30]();
        id v18 = v9;
        HMFGetOSLogHandle();
        uint64_t v19 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v20 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v21 = objc_msgSend(a1[4], "identifier", context);
          id v22 = [v21 shortDescription];
          *(_DWORD *)uint64_t v53 = 138543874;
          id v54 = v20;
          __int16 v55 = 2114;
          v56 = v22;
          __int16 v57 = 2112;
          uint64_t v58 = v17;
          _os_log_impl(&dword_1D4693000, v19, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to get block for rollback: %@", v53, 0x20u);
        }
      }
      else
      {
        __int16 v38 = *(void **)(*(void *)&buf[8] + 40);
        if (v38)
        {
          __rollbackBlock(v9, v38);
          context = (void *)MEMORY[0x1D944CB30]();
          id v39 = v9;
          HMFGetOSLogHandle();
          uint64_t v19 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            id v40 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v41 = objc_msgSend(a1[4], "identifier", context);
            uint64_t v42 = [v41 shortDescription];
            uint64_t v43 = (uint64_t (*)(uint64_t, uint64_t))a1[5];
            *(_DWORD *)uint64_t v53 = 138543874;
            id v54 = v40;
            __int16 v55 = 2114;
            v56 = v42;
            __int16 v57 = 2112;
            uint64_t v58 = v43;
            _os_log_impl(&dword_1D4693000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Rollback completed successfully for block %@.", v53, 0x20u);
          }
        }
        else
        {
          context = (void *)MEMORY[0x1D944CB30]();
          id v44 = v9;
          HMFGetOSLogHandle();
          uint64_t v19 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            id v45 = (id)objc_claimAutoreleasedReturnValue();
            char v46 = objc_msgSend(a1[4], "identifier", context);
            id v47 = [v46 shortDescription];
            *(_DWORD *)uint64_t v53 = 138543618;
            id v54 = v45;
            __int16 v55 = 2114;
            v56 = v47;
            _os_log_impl(&dword_1D4693000, v19, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] No block fetched! (no block found)", v53, 0x16u);
          }
        }
      }

      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (v11)
      {
        uint64_t v26 = HMFGetLogIdentifier();
        uint64_t v27 = [a1[4] identifier];
        uint64_t v28 = [v27 shortDescription];
        id v29 = (uint64_t (*)(uint64_t, uint64_t))a1[5];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v26;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v28;
        *(_WORD *)&buf[22] = 2112;
        id v60 = v29;
        _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Removing unused rollback block %@", buf, 0x20u);
      }
      uint64_t v30 = [a1[5] unsignedIntegerValue];
      id v49 = 0;
      char v31 = [v9 removeBlockWithRow:v30 error:&v49];
      id v17 = (uint64_t (*)(uint64_t, uint64_t))v49;
      if ((v31 & 1) == 0)
      {
        uint64_t v32 = (void *)MEMORY[0x1D944CB30]();
        id v33 = v9;
        v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          id v35 = HMFGetLogIdentifier();
          uint64_t v36 = [a1[4] identifier];
          uint64_t v37 = [v36 shortDescription];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v35;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v37;
          *(_WORD *)&buf[22] = 2112;
          id v60 = v17;
          _os_log_impl(&dword_1D4693000, v34, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to cleanup rollback block: %@", buf, 0x20u);
        }
      }
    }
  }
  else
  {
    long long v23 = (void *)MEMORY[0x1D944CB30]();
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v25;
      _os_log_impl(&dword_1D4693000, v24, OS_LOG_TYPE_ERROR, "%{public}@[LocalZone] unable to cleanup rollback block: (lost self)", buf, 0xCu);
    }
  }
}

void sub_1D46A4BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ____finishEnqueueForOutput_block_invoke_137(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v10 = 0;
  uint64_t v5 = objc_msgSend(v4, "_selectBlockWithRow:error:", objc_msgSend(v3, "unsignedIntegerValue"), &v10);

  id v6 = v10;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  return v6;
}

void __rollbackBlock(void *a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [v4 optionsData];
  id v40 = 0;
  uint64_t v8 = [v5 unarchivedObjectOfClass:v6 fromData:v7 error:&v40];
  id v9 = v40;

  id v10 = (void *)MEMORY[0x1D944CB30]();
  id v11 = v3;
  id v12 = HMFGetOSLogHandle();
  uint64_t v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v14;
      __int16 v43 = 2112;
      id v44 = v8;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@rollback options: %@", buf, 0x16u);
    }
    id v39 = v9;
    uint64_t v15 = [v11 fetchItemsInBlock:v4 error:&v39];
    id v16 = v39;

    id v17 = [v11 sql];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = ____rollbackBlock_block_invoke;
    v35[3] = &unk_1E69EB6C0;
    id v18 = v11;
    id v36 = v18;
    id v19 = v4;
    id v37 = v19;
    id v20 = v15;
    id v38 = v20;
    uint64_t v21 = [v17 sqlTransactionWithActivity:0 block:v35];

    if (v21)
    {
      id v33 = v20;
      id v22 = v8;
      long long v23 = (void *)MEMORY[0x1D944CB30]();
      id v24 = v18;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = v26;
        __int16 v43 = 2112;
        id v44 = v21;
        _os_log_impl(&dword_1D4693000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to rollback block: %@", buf, 0x16u);
      }
      uint64_t v8 = v22;
      id v20 = v33;
    }
    id v34 = v21;
    char v27 = objc_msgSend(v18, "removeBlockWithRow:error:", objc_msgSend(v19, "blockRow"), &v34);
    id v9 = v34;

    if ((v27 & 1) == 0)
    {
      uint64_t v28 = (void *)MEMORY[0x1D944CB30]();
      id v29 = v18;
      uint64_t v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        char v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = v31;
        __int16 v43 = 2112;
        id v44 = v9;
        _os_log_impl(&dword_1D4693000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove rollback block: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v32;
      __int16 v43 = 2112;
      id v44 = v9;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine options for rollback block (%@)", buf, 0x16u);
    }
  }
}

id ____rollbackBlock_block_invoke(id *a1, void *a2)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v47 = a2;
  id v3 = (void *)MEMORY[0x1D944CB30]();
  id v4 = a1[4];
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    uint64_t v7 = [a1[5] blockRow];
    *(_DWORD *)buf = 138543618;
    v56 = v6;
    __int16 v57 = 2048;
    uint64_t v58 = v7;
    _os_log_impl(&dword_1D4693000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@invalidating push for block %lu", buf, 0x16u);
  }
  uint64_t v8 = [a1[5] blockRow];
  id v54 = 0;
  [v47 _updateRecordsClearPushWithPushBlockRow:v8 error:&v54];
  id v9 = v54;
  if (!v9)
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    obuint64_t j = a1[6];
    uint64_t v44 = [obj countByEnumeratingWithState:&v50 objects:v65 count:16];
    if (v44)
    {
      uint64_t v43 = *(void *)v51;
      id v39 = a1;
      while (2)
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v51 != v43) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          id v12 = objc_alloc(MEMORY[0x1E4F29128]);
          id v13 = [v11 externalData];
          id v14 = objc_msgSend(v12, "initWithUUIDBytes:", objc_msgSend(v13, "bytes"));

          uint64_t v15 = [a1[4] zoneRow];
          id v49 = 0;
          id v16 = [v47 _selectRecordWithZoneRow:v15 modelID:v14 returning:2 error:&v49];
          id v17 = v49;
          id v9 = v17;
          if (v16) {
            goto LABEL_10;
          }
          if (v17)
          {
            id v16 = 0;
LABEL_23:

            goto LABEL_24;
          }
          if (![v11 modelEncoding])
          {
LABEL_10:
            uint64_t v45 = v9;
            char v46 = v14;
            id v18 = (void *)MEMORY[0x1D944CB30]();
            id v19 = a1[4];
            id v20 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v21 = HMFGetLogIdentifier();
              uint64_t v41 = [v16 recordRow];
              id v22 = [v46 UUIDString];
              uint64_t v42 = v16;
              long long v23 = v18;
              uint64_t v24 = [v11 modelEncoding];
              id v25 = [v11 modelData];
              uint64_t v26 = [v25 hmbDescription];
              *(_DWORD *)buf = 138544386;
              v56 = v21;
              __int16 v57 = 2048;
              uint64_t v58 = v41;
              __int16 v59 = 2112;
              id v60 = v22;
              __int16 v61 = 2048;
              uint64_t v62 = v24;
              id v18 = v23;
              id v16 = v42;
              __int16 v63 = 2112;
              v64 = v26;
              _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@reverting record row %lu / %@ to %lu / %@", buf, 0x34u);

              a1 = v39;
            }

            uint64_t v27 = [v16 recordRow];
            uint64_t v28 = [v11 modelEncoding];
            id v29 = [v11 modelData];
            uint64_t v30 = [v16 modelSchema];
            id v48 = v45;
            [v47 _updateRecordWithRow:v27 modelEncoding:v28 modelData:v29 modelSchema:v30 error:&v48];
            id v9 = v48;

            id v14 = v46;
            if (v9) {
              goto LABEL_23;
            }
          }
          else
          {
            char v31 = (void *)MEMORY[0x1D944CB30]();
            id v32 = a1[4];
            id v33 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              id v34 = HMFGetLogIdentifier();
              uint64_t v35 = [a1[4] zoneRow];
              id v36 = [v14 UUIDString];
              *(_DWORD *)buf = 138543874;
              v56 = v34;
              __int16 v57 = 2048;
              uint64_t v58 = v35;
              a1 = v39;
              __int16 v59 = 2112;
              id v60 = v36;
              _os_log_impl(&dword_1D4693000, v33, OS_LOG_TYPE_ERROR, "%{public}@Rollback is having issues. Expected to find a record row %lu / %@, but we didn't", buf, 0x20u);
            }
          }
        }
        uint64_t v44 = [obj countByEnumeratingWithState:&v50 objects:v65 count:16];
        if (v44) {
          continue;
        }
        break;
      }
    }
    id v9 = 0;
LABEL_24:
  }
  id v37 = v9;

  return v37;
}

void sub_1D46A5E64(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46AA510(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46AAC88(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46AAEAC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __pushRecords(void *a1, void *a2, void *a3, void *a4, char a5, unsigned int a6, void *a7, void *a8)
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v71 = a1;
  id v13 = a2;
  id v62 = a3;
  id v61 = a4;
  id v14 = a7;
  id v58 = a8;
  id v73 = v14;
  if (!v14)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F653F0]);
    id v16 = [NSString stringWithUTF8String:"__pushRecords"];
    id v73 = (void *)[v15 initWithName:v16];
  }
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  obuint64_t j = v13;
  uint64_t v17 = [obj countByEnumeratingWithState:&v100 objects:v111 count:16];
  if (v17)
  {
    uint64_t v68 = *(void *)v101;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v101 != v68) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v100 + 1) + 8 * i);
        id v20 = (void *)MEMORY[0x1D944CB30]();
        id v21 = v71;
        id v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          long long v23 = HMFGetLogIdentifier();
          uint64_t v24 = [v73 identifier];
          id v25 = [v24 shortDescription];
          uint64_t v26 = [v19 hmbDescription];
          *(_DWORD *)buf = 138543874;
          id v106 = v23;
          __int16 v107 = 2114;
          uint64_t v108 = v25;
          __int16 v109 = 2112;
          v110 = v26;
          _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Pushing update for record: %@", buf, 0x20u);
        }
        uint64_t v27 = [v19 hmbDescription];
        [v73 markWithFormat:@"about to update: %@", v27, v58];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v100 objects:v111 count:16];
    }
    while (v17);
  }

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v64 = v62;
  uint64_t v28 = [v64 countByEnumeratingWithState:&v96 objects:v104 count:16];
  if (v28)
  {
    uint64_t v69 = *(void *)v97;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v97 != v69) {
          objc_enumerationMutation(v64);
        }
        uint64_t v30 = *(void **)(*((void *)&v96 + 1) + 8 * j);
        char v31 = (void *)MEMORY[0x1D944CB30]();
        id v32 = v71;
        id v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          id v34 = HMFGetLogIdentifier();
          uint64_t v35 = [v73 identifier];
          id v36 = [v35 shortDescription];
          id v37 = [v30 hmbDescription];
          *(_DWORD *)buf = 138543874;
          id v106 = v34;
          __int16 v107 = 2114;
          uint64_t v108 = v36;
          __int16 v109 = 2112;
          v110 = v37;
          _os_log_impl(&dword_1D4693000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Pushing removal for record: %@", buf, 0x20u);
        }
        id v38 = [v30 hmbDescription];
        [v73 markWithFormat:@"about to remove: %@", v38];
      }
      uint64_t v28 = [v64 countByEnumeratingWithState:&v96 objects:v104 count:16];
    }
    while (v28);
  }

  id v39 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(obj, "count"));
  id v40 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v64, "count"));
  uint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:obj recordIDsToDelete:v64];
  [v41 setConfiguration:v61];
  [v41 setSavePolicy:0];
  [v41 setMarkAsParticipantNeedsNewInvitationToken:a6];
  v92[0] = MEMORY[0x1E4F143A8];
  v92[1] = 3221225472;
  v92[2] = ____pushRecords_block_invoke;
  v92[3] = &unk_1E69EAA68;
  id v42 = v71;
  id v93 = v42;
  id v43 = v73;
  id v94 = v43;
  id v44 = v39;
  id v95 = v44;
  [v41 setPerRecordSaveBlock:v92];
  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = ____pushRecords_block_invoke_15;
  v88[3] = &unk_1E69E9848;
  id v45 = v42;
  id v89 = v45;
  id v46 = v43;
  id v90 = v46;
  id v47 = v40;
  id v91 = v47;
  [v41 setPerRecordDeleteBlock:v88];
  objc_initWeak(&location, v41);
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = ____pushRecords_block_invoke_17;
  v75[3] = &unk_1E69E9898;
  id v48 = v45;
  id v76 = v48;
  id v74 = v46;
  id v77 = v74;
  char v85 = a5;
  id v49 = obj;
  id v78 = v49;
  id v63 = v64;
  id v79 = v63;
  id v65 = v61;
  id v80 = v65;
  char v86 = a6;
  id v70 = v58;
  id v81 = v70;
  objc_copyWeak(&v84, &location);
  id obja = v44;
  id v82 = obja;
  id v72 = v47;
  id v83 = v72;
  long long v50 = (void *)MEMORY[0x1D944CB30]([v41 setModifyRecordsCompletionBlock:v75]);
  id v51 = v48;
  HMFGetOSLogHandle();
  long long v52 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    id v53 = (id)objc_claimAutoreleasedReturnValue();
    id v54 = [v74 identifier];
    __int16 v55 = [v54 shortDescription];
    v56 = [v41 operationID];
    *(_DWORD *)buf = 138543874;
    id v106 = v53;
    __int16 v107 = 2114;
    uint64_t v108 = v55;
    __int16 v109 = 2114;
    v110 = v56;
    _os_log_impl(&dword_1D4693000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Starting CKModifyRecordsOperation with operationID: %{public}@", buf, 0x20u);
  }
  __int16 v57 = [v51 database];
  [v57 addOperation:v41];

  objc_destroyWeak(&v84);
  objc_destroyWeak(&location);
}

void sub_1D46ABEF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id location)
{
  objc_destroyWeak(v36);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____pushRecords_block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1D944CB30]();
  id v11 = a1[4];
  id v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      [a1[5] identifier];
      v15 = id v21 = v7;
      id v16 = [v15 shortDescription];
      uint64_t v17 = [v8 hmbDescription];
      *(_DWORD *)buf = 138543874;
      long long v23 = v14;
      __int16 v24 = 2114;
      id v25 = v16;
      __int16 v26 = 2112;
      id v27 = v17;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully saved record: %@", buf, 0x20u);

      id v7 = v21;
    }

    [a1[6] addObject:v8];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      id v19 = [a1[5] identifier];
      id v20 = [v19 shortDescription];
      *(_DWORD *)buf = 138544130;
      long long v23 = v18;
      __int16 v24 = 2114;
      id v25 = v20;
      __int16 v26 = 2112;
      id v27 = v7;
      __int16 v28 = 2114;
      id v29 = v9;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to save record with ID %@: %{public}@", buf, 0x2Au);
    }
  }
}

void ____pushRecords_block_invoke_15(id *a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D944CB30]();
  id v8 = a1[4];
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [a1[5] identifier];
      id v13 = [v12 shortDescription];
      id v14 = [v5 hmbDescription];
      int v19 = 138544130;
      id v20 = v11;
      __int16 v21 = 2114;
      id v22 = v13;
      __int16 v23 = 2112;
      __int16 v24 = v14;
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to delete record with ID %@: %{public}@", (uint8_t *)&v19, 0x2Au);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      id v16 = [a1[5] identifier];
      uint64_t v17 = [v16 shortDescription];
      id v18 = [v5 hmbDescription];
      int v19 = 138543874;
      id v20 = v15;
      __int16 v21 = 2114;
      id v22 = v17;
      __int16 v23 = 2112;
      __int16 v24 = v18;
      _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully deleted record with ID: %@", (uint8_t *)&v19, 0x20u);
    }
    [a1[6] addObject:v5];
  }
}

void ____pushRecords_block_invoke_17(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1D944CB30]();
  id v11 = *(id *)(a1 + 32);
  id v12 = HMFGetOSLogHandle();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v13)
    {
      id v36 = HMFGetLogIdentifier();
      id v37 = [*(id *)(a1 + 40) identifier];
      id v38 = [v37 shortDescription];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v36;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v38;
      _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKModifyRecordsOperation succeeded", buf, 0x16u);
    }
    [*(id *)(a1 + 40) markWithReason:@"success"];
    goto LABEL_18;
  }
  if (v13)
  {
    id v14 = HMFGetLogIdentifier();
    [*(id *)(a1 + 40) identifier];
    v16 = id v15 = v8;
    [v16 shortDescription];
    id v18 = v17 = v7;
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2114;
    long long v102 = v9;
    _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKModifyRecordsOperation failed: %{public}@", buf, 0x20u);

    id v7 = v17;
    id v8 = v15;
  }
  if ([v9 hmbIsCKLimitExceededError] && !*(unsigned char *)(a1 + 104))
  {
    id v90 = v7;
    id v92 = v8;
    id v43 = *(void **)(a1 + 48);
    id v44 = *(void **)(a1 + 56);
    int v45 = *(unsigned __int8 *)(a1 + 105);
    id v46 = *(void **)(a1 + 40);
    id v47 = *(void **)(a1 + 64);
    id v48 = *(void **)(a1 + 72);
    id v49 = *(id *)(a1 + 32);
    id v50 = v43;
    id v51 = v44;
    id v52 = v47;
    id v84 = v46;
    id v53 = v48;
    id v54 = v51;
    id v82 = v53;
    if ((unint64_t)[v50 count] <= 1 && (unint64_t)objc_msgSend(v51, "count") <= 1)
    {
      __int16 v55 = (void *)MEMORY[0x1D944CB30]();
      id v56 = v49;
      __int16 v57 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v59 = id v58 = v52;
        *(_DWORD *)id v106 = 138543874;
        __int16 v107 = v59;
        __int16 v108 = 2112;
        uint64_t v109 = (uint64_t)v50;
        __int16 v110 = 2112;
        uint64_t v111 = (uint64_t)v54;
        _os_log_impl(&dword_1D4693000, v57, OS_LOG_TYPE_ERROR, "%{public}@Cannot bifurcate, not enough items: (updates: %@, removes: %@)", v106, 0x20u);

        id v52 = v58;
      }

      id v7 = v90;
      id v8 = v92;
      goto LABEL_12;
    }
    uint64_t v88 = v52;
    unint64_t v60 = (unint64_t)[v50 count] >> 1;
    char v86 = objc_msgSend(v50, "subarrayWithRange:", 0, v60);
    id v87 = objc_msgSend(v50, "subarrayWithRange:", v60, objc_msgSend(v50, "count") - v60);
    unint64_t v61 = (unint64_t)[v54 count] >> 1;
    id v62 = objc_msgSend(v54, "subarrayWithRange:", 0, v61);
    char v85 = objc_msgSend(v54, "subarrayWithRange:", v61, objc_msgSend(v54, "count") - v61);
    id v63 = (void *)MEMORY[0x1D944CB30]();
    id v64 = v49;
    id v65 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      uint64_t v66 = HMFGetLogIdentifier();
      uint64_t v67 = [v50 count];
      uint64_t v68 = [v54 count];
      *(_DWORD *)id v106 = 138543874;
      __int16 v107 = v66;
      __int16 v108 = 2048;
      uint64_t v109 = v67;
      __int16 v110 = 2048;
      uint64_t v111 = v68;
      _os_log_impl(&dword_1D4693000, v65, OS_LOG_TYPE_INFO, "%{public}@Record limit exceeded (updates: %lu, removes: %lu), bifurcating operation", v106, 0x20u);
    }
    BOOL v69 = v45 != 0;

    id v70 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    id v71 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    __pushRecords(v64, v86, v62, v88, 0, v69, v84, v70);
    __pushRecords(v64, v87, v85, v88, 0, v69, v84, v71);
    id v72 = (void *)MEMORY[0x1E4F7A0D8];
    v105[0] = v70;
    v105[1] = v71;
    id v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:2];
    [v64 operationScheduler];
    v74 = id v81 = v54;
    [v72 combineAllFutures:v73 ignoringErrors:0 scheduler:v74];
    int v75 = v80 = v50;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = ____pushRecordsBifurcated_block_invoke;
    long long v102 = &unk_1E69E98C0;
    id v103 = v64;
    id v104 = v82;
    id v76 = v82;
    id v83 = v64;
    id v77 = [v75 addSuccessBlock:buf];
    id v78 = [v76 errorOnlyCompletionHandlerAdapter];
    id v79 = (id)[v77 addFailureBlock:v78];

    id v7 = v90;
    id v8 = v92;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
    if (!WeakRetained) {
      _HMFPreconditionFailure();
    }
    id v20 = WeakRetained;
    __int16 v21 = *(void **)(a1 + 32);
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = ____pushRecords_block_invoke_21;
    v93[3] = &unk_1E69E9870;
    id v94 = v21;
    id v95 = *(id *)(a1 + 48);
    id v96 = *(id *)(a1 + 56);
    id v97 = *(id *)(a1 + 64);
    __int16 v100 = *(_WORD *)(a1 + 104);
    id v98 = *(id *)(a1 + 40);
    id v99 = *(id *)(a1 + 72);
    int v22 = [v94 retryCloudKitOperation:v20 afterError:v9 retryBlock:v93];
    char v23 = v22;
    if (v22)
    {
      id v91 = v8;
      __int16 v24 = (void *)MEMORY[0x1D944CB30]();
      id v25 = *(id *)(a1 + 32);
      id v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        [*(id *)(a1 + 40) identifier];
        __int16 v28 = v89 = v7;
        id v29 = [v28 shortDescription];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v27;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v29;
        _os_log_impl(&dword_1D4693000, v26, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKModifyRecordsOperation will be retried", buf, 0x16u);

        id v7 = v89;
      }

      [*(id *)(a1 + 40) markWithReason:@"deferred"];
      id v8 = v91;
    }

    if ((v23 & 1) == 0)
    {
LABEL_12:
      uint64_t v30 = (void *)MEMORY[0x1D944CB30]();
      id v31 = *(id *)(a1 + 32);
      id v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        id v33 = HMFGetLogIdentifier();
        id v34 = [*(id *)(a1 + 40) identifier];
        uint64_t v35 = [v34 shortDescription];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v33;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v35;
        *(_WORD *)&buf[22] = 2114;
        long long v102 = v9;
        _os_log_impl(&dword_1D4693000, v32, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKModifyRecordsOperation failed and cannot be retried: %{public}@", buf, 0x20u);
      }
      [*(id *)(a1 + 40) markWithFormat:@"failed with error: %@", v9];
LABEL_18:
      id v39 = [HMBCloudZoneRecordPushResult alloc];
      id v40 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 80)];
      uint64_t v41 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 88)];
      id v42 = [(HMBCloudZoneRecordPushResult *)v39 initWithUpdatedRecords:v40 deletedRecordIDs:v41 error:v9];

      [*(id *)(a1 + 72) finishWithResult:v42];
    }
  }
}

void ____pushRecordsBifurcated_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v3 lastObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = (void *)MEMORY[0x1D944CB30]();
  id v11 = *(id *)(a1 + 32);
  id v12 = HMFGetOSLogHandle();
  BOOL v13 = v12;
  if (v6) {
    BOOL v14 = v9 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      id v16 = [v3 firstObject];
      id v17 = [v3 lastObject];
      int v22 = 138543874;
      char v23 = v15;
      __int16 v24 = 2112;
      id v25 = v16;
      __int16 v26 = 2112;
      uint64_t v27 = v17;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_ERROR, "%{public}@Both bifurcated pushes failed: %@, %@", (uint8_t *)&v22, 0x20u);
    }
    id v18 = *(void **)(a1 + 40);
    int v19 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    [v18 finishWithError:v19];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v21 = HMFGetLogIdentifier();
      int v22 = 138543362;
      char v23 = v21;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_INFO, "%{public}@Bifurcated push succeeded, merging results", (uint8_t *)&v22, 0xCu);
    }
    int v19 = [v6 pushResultByMergingWithPushResult:v9];
    [*(id *)(a1 + 40) finishWithResult:v19];
  }
}

uint64_t ____pushRecords_block_invoke_21(uint64_t a1)
{
  return __pushRecords(*(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81), *(void *)(a1 + 64), *(void *)(a1 + 72));
}

void sub_1D46AF878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void ____buildTableForClass_block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSString stringWithFormat:@"%@ BLOB", a2];
  [v2 addObject:v3];
}

void ____updateIndexesForClass_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 hasPrefix:@"q"]
    && ([v3 isEqualToString:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v4 = [NSString stringWithFormat:@"DROP INDEX %@", v3];
    id v5 = *(void **)(a1 + 40);
    id v6 = v4;
    id v7 = objc_msgSend(v5, "runSQLite3:", objc_msgSend(v6, "UTF8String"));
    id v8 = (void *)MEMORY[0x1D944CB30]();
    id v9 = *(id *)(a1 + 48);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing unused index: %@", buf, 0x16u);
    }
    if (v7)
    {
      id v12 = (void *)MEMORY[0x1D944CB30]();
      id v13 = *(id *)(a1 + 48);
      BOOL v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v17 = v15;
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to drop index: %@", buf, 0x16u);
      }
    }
    [*(id *)(a1 + 56) removeObjectForKey:v3];
  }
}

void ____updateIndexesForClass_block_invoke_193(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v5 indexName];
    id v8 = [v6 objectForKey:v7];

    if (!v8)
    {
      id v9 = (void *)MEMORY[0x1E4F1CAD0];
      id v10 = [v5 indexedColumns];
      id v11 = [v9 setWithArray:v10];
      uint64_t v12 = [v11 count];
      id v13 = [v5 indexedColumns];
      uint64_t v14 = [v13 count];

      if (v12 == v14)
      {
        id v15 = NSString;
        id v16 = [v5 indexName];
        id v17 = [*(id *)(a1 + 40) modelType];
        __int16 v18 = [NSString stringWithFormat:@"queryable_%@", v17];
        id v19 = [v5 indexedColumns];
        uint64_t v20 = [v19 componentsJoinedByString:@", "];
        __int16 v21 = [v15 stringWithFormat:@"CREATE INDEX IF NOT EXISTS %@ ON %@ (%@)", v16, v18, v20];

        int v22 = (void *)MEMORY[0x1D944CB30]();
        id v23 = *(id *)(a1 + 40);
        __int16 v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          id v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v46 = v25;
          __int16 v47 = 2112;
          id v48 = v21;
          _os_log_impl(&dword_1D4693000, v24, OS_LOG_TYPE_INFO, "%{public}@Creating index: %@", buf, 0x16u);
        }
        __int16 v26 = *(void **)(a1 + 48);
        id v27 = v21;
        uint64_t v28 = objc_msgSend(v26, "runSQLite3:", objc_msgSend(v27, "UTF8String"));
        if (v28)
        {
          id v29 = (void *)MEMORY[0x1D944CB30]();
          id v30 = *(id *)(a1 + 40);
          id v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            id v32 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            id v46 = v32;
            __int16 v47 = 2112;
            id v48 = v27;
            __int16 v49 = 2112;
            id v50 = v28;
            _os_log_impl(&dword_1D4693000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to create index %@: %@", buf, 0x20u);
          }
        }
        else
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
          id v40 = *(void **)(a1 + 32);
          uint64_t v41 = [HMBLocalSQLContextQueryIndex alloc];
          id v42 = [v5 indexedColumns];
          id v43 = [(HMBLocalSQLContextQueryIndex *)v41 initWithColumns:v42];
          id v44 = [v5 indexName];
          [v40 setObject:v43 forKey:v44];
        }
      }
      else
      {
        id v33 = (void *)MEMORY[0x1D944CB30]();
        id v34 = *(id *)(a1 + 40);
        uint64_t v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          id v36 = HMFGetLogIdentifier();
          id v37 = [v5 indexName];
          id v38 = [v5 indexedColumns];
          id v39 = [v38 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 138543874;
          id v46 = v36;
          __int16 v47 = 2112;
          id v48 = v37;
          __int16 v49 = 2112;
          id v50 = v39;
          _os_log_impl(&dword_1D4693000, v35, OS_LOG_TYPE_ERROR, "%{public}@Column list for query %@ has duplicate values: %@", buf, 0x20u);
        }
      }
    }
  }
}

void ____prepareStatementsForClass_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  objc_msgSend(NSString, "stringWithFormat:", @"?%lu", a3 + 3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];
}

void ____prepareStatementsForClass_block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = [a2 prepareOnTable:*(void *)(a1 + 32)];
  if (v4)
  {
    id v3 = [*(id *)(a1 + 32) userQueries];
    [v3 addObject:v4];
  }
}

id ____updateIndexesForClass_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  id v5 = [v4 indexName];

  return v5;
}

void sub_1D46B0AA0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46B2754(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46B2CC4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46B2D58(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46B2E5C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46B2EF0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46B3BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1707(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1708(uint64_t a1)
{
}

void sub_1D46B53D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1779(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1780(uint64_t a1)
{
}

void __setProperty(void *a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() hmbProperties];
  id v9 = [v8 objectForKey:v6];

  if (!v9)
  {
    id v10 = (void *)MEMORY[0x1D944CB30]();
    id v11 = v5;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = [v11 hmbCanonicalType];
      *(_DWORD *)buf = 138544130;
      __int16 v26 = v13;
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2112;
      id v30 = v14;
      __int16 v31 = 2112;
      id v32 = (id)objc_opt_class();
      id v15 = v32;
      id v16 = "%{public}@Unable to set property %@ of %@ from type %@ (no such property exists)";
      goto LABEL_10;
    }
LABEL_12:

    goto LABEL_13;
  }
  if (([v5 hmbPropertyIsAvailable:v6] & 1) == 0)
  {
    id v10 = (void *)MEMORY[0x1D944CB30]();
    id v11 = v5;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = [v11 hmbCanonicalType];
      *(_DWORD *)buf = 138544130;
      __int16 v26 = v13;
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2112;
      id v30 = v14;
      __int16 v31 = 2112;
      id v32 = (id)objc_opt_class();
      id v15 = v32;
      id v16 = "%{public}@Unable to set property %@ of %@ from type %@ (property is unavailable)";
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  if ([v5 hmbPropertyIsReadOnly:v6])
  {
    id v10 = (void *)MEMORY[0x1D944CB30]();
    id v11 = v5;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = [v11 hmbCanonicalType];
      *(_DWORD *)buf = 138544130;
      __int16 v26 = v13;
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2112;
      id v30 = v14;
      __int16 v31 = 2112;
      id v32 = (id)objc_opt_class();
      id v15 = v32;
      id v16 = "%{public}@Unable to set property %@ of %@ from type %@ (property is read-only)";
LABEL_10:
      _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_ERROR, v16, buf, 0x2Au);

LABEL_11:
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (v7)
  {
    [v9 classObj];
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v10 = (void *)MEMORY[0x1D944CB30]();
        id v11 = v5;
        uint64_t v12 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          goto LABEL_12;
        }
        id v13 = HMFGetLogIdentifier();
        uint64_t v20 = [v11 hmbCanonicalType];
        __int16 v21 = objc_opt_class();
        id v23 = v21;
        NSStringFromClass((Class)[v9 classObj]);
        int v22 = v24 = v10;
        *(_DWORD *)buf = 138544386;
        __int16 v26 = v13;
        __int16 v27 = 2112;
        id v28 = v6;
        __int16 v29 = 2112;
        id v30 = v20;
        __int16 v31 = 2112;
        id v32 = v21;
        __int16 v33 = 2112;
        id v34 = v22;
        _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to set property %@ of %@ from type %@ (does not match the expected type %@)", buf, 0x34u);

        id v10 = v24;
        goto LABEL_11;
      }
    }
  }
  id v17 = [v5 hmbReserved];

  if (!v17)
  {
    __int16 v18 = [MEMORY[0x1E4F1CA60] dictionary];
    [v5 setHmbReserved:v18];
  }
  id v19 = [v5 hmbReserved];
  [v19 setObject:v7 forKeyedSubscript:v6];

LABEL_13:
}

uint64_t __isEqualDeepCompare(void *a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v3 count];
      if (v5 == [v4 count])
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v6 = v3;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v29;
          while (2)
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v29 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
              uint64_t v12 = [v6 objectForKey:v11];
              id v13 = [v4 objectForKey:v11];
              if (!v13 || !__isEqualDeepCompare(v12, v13))
              {

                uint64_t isEqualDeepCompare = 0;
                goto LABEL_29;
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
            uint64_t isEqualDeepCompare = 1;
            if (v8) {
              continue;
            }
            goto LABEL_29;
          }
        }
LABEL_25:
        uint64_t isEqualDeepCompare = 1;
LABEL_29:

        goto LABEL_30;
      }
LABEL_27:
      uint64_t isEqualDeepCompare = 0;
      goto LABEL_30;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v3 count];
      if (v15 == [v4 count])
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v6 = v3;
        uint64_t v16 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = 0;
          uint64_t v19 = *(void *)v25;
LABEL_19:
          uint64_t v20 = 0;
          while (1)
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v6);
            }
            uint64_t v21 = *(void *)(*((void *)&v24 + 1) + 8 * v20);
            int v22 = objc_msgSend(v4, "objectAtIndex:", v18 + v20, (void)v24);
            uint64_t isEqualDeepCompare = __isEqualDeepCompare(v21, v22);

            if (!isEqualDeepCompare) {
              goto LABEL_29;
            }
            if (v17 == ++v20)
            {
              v18 += v20;
              uint64_t v17 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v17) {
                goto LABEL_19;
              }
              goto LABEL_25;
            }
          }
        }
        goto LABEL_25;
      }
      goto LABEL_27;
    }
  }
  uint64_t isEqualDeepCompare = HMFEqualObjects();
LABEL_30:

  return isEqualDeepCompare;
}

void __calculateUnavailableReadOnly(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [(id)objc_opt_class() hmbProperties];
  id v6 = [v3 hmbReserved];
  uint64_t v7 = objc_msgSend(v6, "hmf_dictionaryForKey:", @"_U");

  uint64_t v8 = [v3 hmbReserved];
  uint64_t v9 = objc_msgSend(v8, "hmf_dictionaryForKey:", @"_R");

  if (v4)
  {
    id v10 = [v4 dataVersion];
    uint64_t v11 = [v3 hmbDataVersion];
    int v12 = [v10 isGreaterThan:v11];

    if (v12)
    {
      uint64_t v13 = [v4 unavailableVersionsForModelClass:objc_opt_class()];

      uint64_t v14 = [v4 readOnlyVersionsForModelClass:objc_opt_class()];

      uint64_t v9 = (void *)v14;
      uint64_t v7 = (void *)v13;
    }
  }
  char v15 = [v3 hmbIsModelReadOnly];
  char v16 = [v3 hmbIsModelGenericRepresentation];
  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v19 = [v3 hmbContainerDataVersion];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  long long v27 = ____calculateUnavailableReadOnly_block_invoke;
  long long v28 = &unk_1E69E9C68;
  id v29 = v7;
  id v30 = v9;
  char v34 = v16;
  id v31 = v19;
  id v32 = v17;
  char v35 = v15;
  id v33 = v18;
  id v20 = v18;
  id v21 = v17;
  id v22 = v19;
  id v23 = v9;
  id v24 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:&v25];
  objc_msgSend(v3, "setHmbUnavailableProperties:", v21, v25, v26, v27, v28);
  [v3 setHmbReadOnlyProperties:v20];
}

void ____calculateUnavailableReadOnly_block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) objectForKey:v7];
  id v4 = [*(id *)(a1 + 40) objectForKey:v7];
  if (*(unsigned char *)(a1 + 72)
    || (uint64_t v5 = *(void **)(a1 + 48)) != 0 && v3 && [v5 isGreaterThanOrEqualTo:v3])
  {
    [*(id *)(a1 + 56) addObject:v7];
  }
  if (*(unsigned char *)(a1 + 73)
    || (id v6 = *(void **)(a1 + 48)) != 0 && v4 && [v6 isLessThanOrEqualTo:v4])
  {
    [*(id *)(a1 + 64) addObject:v7];
  }
}

void sub_1D46B91E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D46B9E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1911(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1912(uint64_t a1)
{
}

id __modelReferenceFields(void *a1)
{
  id v1 = a1;
  if (__modelReferenceFields_onceToken != -1) {
    dispatch_once(&__modelReferenceFields_onceToken, &__block_literal_global_427);
  }
  id v2 = objc_opt_class();
  os_unfair_lock_lock_with_options();
  id v3 = [(id)__modelReferenceFields_referenceFields objectForKey:v2];
  if (!v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v5 = [v2 hmbProperties];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = ____modelReferenceFields_block_invoke_2;
      v9[3] = &unk_1E69EA080;
      id v6 = v4;
      id v10 = v6;
      [v5 enumerateKeysAndObjectsUsingBlock:v9];
      id v3 = v6;
      [(id)__modelReferenceFields_referenceFields setObject:v3 forKey:v2];
    }
    else
    {
      id v3 = [MEMORY[0x1E4F1CAD0] set];
      [(id)__modelReferenceFields_referenceFields setObject:v3 forKey:v2];
    }
  }
  id v7 = v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&__modelReferenceFields_lock);
  return v7;
}

void sub_1D46BA038(_Unwind_Exception *a1)
{
}

uint64_t ____dataDictionaryFromVersionDictionary_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 hmbData];
}

void ____modelReferenceFields_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (objc_msgSend((id)objc_msgSend(a3, "classObj"), "isSubclassOfClass:", objc_opt_class())) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

uint64_t ____modelReferenceFields_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  uint64_t v1 = __modelReferenceFields_referenceFields;
  __modelReferenceFields_referenceFields = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_1D46BB980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t ____versionDictionaryFromDataDictionary_block_invoke()
{
  return objc_msgSend(MEMORY[0x1E4F65590], "hmbVersionFromData:");
}

void sub_1D46BC244(_Unwind_Exception *a1)
{
}

void ____modelExternalStorageFields_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = [a3 externalRecordField];

  if (v5) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

uint64_t ____modelExternalStorageFields_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  uint64_t v1 = __modelExternalStorageFields_externalStorageFields;
  __modelExternalStorageFields_externalStorageFields = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __fetchChanges(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  v115[1] = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v68 = a2;
  id v63 = a3;
  id v10 = a4;
  id v64 = a5;
  id v65 = v10;
  if (!v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F653F0]);
    int v12 = [NSString stringWithUTF8String:"__fetchChanges"];
    id v65 = (void *)[v11 initWithName:v12];
  }
  uint64_t v67 = [v9 localZone];
  if (v67)
  {
    if (v68) {
      char v13 = 1;
    }
    else {
      char v13 = 2;
    }
    v101[0] = 0;
    v101[1] = v101;
    v101[2] = 0x3032000000;
    v101[3] = __Block_byref_object_copy__2174;
    v101[4] = __Block_byref_object_dispose__2175;
    id v102 = 0;
    v99[0] = 0;
    v99[1] = v99;
    v99[2] = 0x3032000000;
    v99[3] = __Block_byref_object_copy__2174;
    v99[4] = __Block_byref_object_dispose__2175;
    id v100 = 0;
    id v62 = [MEMORY[0x1E4F1CA48] array];
    id v66 = objc_alloc_init(MEMORY[0x1E4F1A060]);
    uint64_t v14 = [v9 defaultDesiredKeys];
    [v66 setDesiredKeys:v14];

    [v66 setPreviousServerChangeToken:v68];
    id v98 = 0;
    uint64_t v15 = [v67 createMirrorInputWithError:&v98];
    id v60 = v98;
    unint64_t v61 = (void *)v15;
    if (v15)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F1A070]);
      uint64_t v17 = [v9 cloudZoneID];
      uint64_t v18 = [v17 zoneID];
      v115[0] = v18;
      uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:1];
      id v20 = [v9 cloudZoneID];
      id v21 = [v20 zoneID];
      id v113 = v21;
      id v114 = v66;
      id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
      id v23 = (void *)[v16 initWithRecordZoneIDs:v19 configurationsByRecordZoneID:v22];

      id v24 = [v9 cloudDatabase];
      uint64_t v25 = [v24 operationConfigurationWithProcessingOptions:v63];
      [v23 setConfiguration:v25];

      v91[0] = MEMORY[0x1E4F143A8];
      v91[1] = 3221225472;
      v91[2] = ____fetchChanges_block_invoke;
      v91[3] = &unk_1E69E9D10;
      id v26 = v9;
      id v92 = v26;
      id v27 = v65;
      id v93 = v27;
      id v94 = v66;
      char v97 = v13;
      id v28 = v62;
      id v95 = v28;
      id v29 = v61;
      id v96 = v29;
      [v23 setRecordWasChangedBlock:v91];
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = ____fetchChanges_block_invoke_16;
      v86[3] = &unk_1E69E9D38;
      id v30 = v26;
      id v87 = v30;
      char v90 = v13;
      id v31 = v27;
      id v88 = v31;
      id v32 = v29;
      id v89 = v32;
      [v23 setRecordWithIDWasDeletedBlock:v86];
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = ____fetchChanges_block_invoke_18;
      v81[3] = &unk_1E69E9D60;
      id v84 = v99;
      char v85 = v101;
      id v33 = v30;
      id v82 = v33;
      id v34 = v31;
      id v83 = v34;
      [v23 setRecordZoneFetchCompletionBlock:v81];
      objc_initWeak(&location, v23);
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = ____fetchChanges_block_invoke_20;
      v69[3] = &unk_1E69E9DB0;
      id v77 = v99;
      id v35 = v33;
      id v70 = v35;
      id v36 = v34;
      id v71 = v36;
      id v72 = v32;
      id v37 = v63;
      id v73 = v37;
      id v74 = v64;
      objc_copyWeak(&v79, &location);
      id v38 = v68;
      id v75 = v38;
      id v76 = v28;
      id v78 = v101;
      id v39 = (void *)MEMORY[0x1D944CB30]([v23 setFetchRecordZoneChangesCompletionBlock:v69]);
      id v40 = v35;
      HMFGetOSLogHandle();
      uint64_t v41 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        __int16 v59 = v39;
        HMFGetLogIdentifier();
        id v42 = (id)objc_claimAutoreleasedReturnValue();
        id v43 = [v36 identifier];
        id v44 = [v43 shortDescription];
        int v45 = [v23 operationID];
        *(_DWORD *)buf = 138544386;
        id v104 = v42;
        __int16 v105 = 2114;
        id v106 = v44;
        __int16 v107 = 2112;
        id v108 = v38;
        __int16 v109 = 2112;
        id v110 = v37;
        __int16 v111 = 2114;
        uint64_t v112 = v45;
        _os_log_impl(&dword_1D4693000, v41, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Starting CKFetchRecordZoneChangesOperation with token: %@ options: %@ operationID: %{public}@", buf, 0x34u);

        id v39 = v59;
      }

      id v46 = [v40 database];
      [v46 addOperation:v23];

      objc_destroyWeak(&v79);
      objc_destroyWeak(&location);

      __int16 v47 = v61;
    }
    else
    {
      id v53 = (void *)MEMORY[0x1D944CB30]();
      id v54 = v9;
      HMFGetOSLogHandle();
      __int16 v55 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v56 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v57 = [v65 identifier];
        id v58 = [v57 shortDescription];
        *(_DWORD *)buf = 138543874;
        id v104 = v56;
        __int16 v105 = 2114;
        id v106 = v58;
        __int16 v107 = 2114;
        id v108 = v60;
        _os_log_impl(&dword_1D4693000, v55, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to create a new mirror input: %{public}@", buf, 0x20u);
      }
      __int16 v47 = 0;
      [v65 markWithReason:@"failed mirror input creation"];
      [v64 finishWithError:v60];
    }

    _Block_object_dispose(v99, 8);
    _Block_object_dispose(v101, 8);
  }
  else
  {
    id v48 = (void *)MEMORY[0x1D944CB30]();
    id v49 = v9;
    id v50 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      uint64_t v51 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v104 = v51;
      _os_log_impl(&dword_1D4693000, v50, OS_LOG_TYPE_ERROR, "%{public}@Lost localZone in __fetchChanges", buf, 0xCu);
    }
    id v52 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    [v64 finishWithError:v52];
  }
}

void sub_1D46BDB64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose((const void *)(v63 - 256), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2174(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2175(uint64_t a1)
{
}

void ____fetchChanges_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    id v73 = v9;
    id v11 = *(void **)(a1 + 32);
    int v12 = (void *)MEMORY[0x1E4F1CAD0];
    char v13 = [*(id *)(a1 + 48) desiredKeys];
    uint64_t v14 = [v12 setWithArray:v13];
    id v77 = 0;
    uint64_t v15 = [v11 decodeModelFromRecord:v8 externalRecordFields:v14 source:2 error:&v77];
    id v16 = v77;

    uint64_t v17 = (void *)MEMORY[0x1D944CB30]();
    id v18 = *(id *)(a1 + 32);
    uint64_t v19 = HMFGetOSLogHandle();
    id v20 = v19;
    if (!v15)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v35 = HMFGetLogIdentifier();
        [*(id *)(a1 + 40) identifier];
        id v36 = v69 = v17;
        id v37 = [v36 shortDescription];
        [v8 hmbDescription];
        id v38 = v8;
        v40 = id v39 = v7;
        *(_DWORD *)buf = 138544130;
        id v79 = v35;
        __int16 v80 = 2114;
        id v81 = v37;
        __int16 v82 = 2112;
        id v83 = v40;
        __int16 v84 = 2114;
        id v85 = v16;
        _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to decode received record %@: %{public}@", buf, 0x2Au);

        id v7 = v39;
        id v8 = v38;
        uint64_t v15 = 0;

        uint64_t v17 = v69;
      }

      goto LABEL_13;
    }
    os_log_type_t v21 = *(unsigned char *)(a1 + 72);
    id v72 = v7;
    if (os_log_type_enabled(v19, v21))
    {
      HMFGetLogIdentifier();
      id v22 = v66 = v16;
      [*(id *)(a1 + 40) identifier];
      id v23 = v68 = v17;
      [v23 shortDescription];
      uint64_t v25 = v24 = v15;
      [v8 hmbDescription];
      id v26 = v67 = v8;
      id v27 = [v24 hmbCanonicalType];
      *(_DWORD *)buf = 138544130;
      id v79 = v22;
      __int16 v80 = 2114;
      id v81 = v25;
      __int16 v82 = 2112;
      id v83 = v26;
      __int16 v84 = 2112;
      id v85 = v27;
      _os_log_impl(&dword_1D4693000, v20, v21, "%{public}@[%{public}@] Received and decoded record: %@/%@", buf, 0x2Au);

      id v8 = v67;
      uint64_t v15 = v24;

      uint64_t v17 = v68;
      id v16 = v66;
      id v7 = v72;
    }

    if ([*(id *)(a1 + 32) isInternalModel:v15])
    {
      [*(id *)(a1 + 56) addObject:v15];
LABEL_13:
      id v10 = v73;
LABEL_28:

      goto LABEL_29;
    }
    id v76 = v16;
    uint64_t v41 = [v8 externalID:&v76];
    id v42 = v76;

    if (!v41)
    {
      __int16 v55 = (void *)MEMORY[0x1D944CB30]();
      id v56 = *(id *)(a1 + 32);
      __int16 v57 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        id v58 = HMFGetLogIdentifier();
        [*(id *)(a1 + 40) identifier];
        id v60 = v59 = v8;
        unint64_t v61 = [v60 shortDescription];
        *(_DWORD *)buf = 138544130;
        id v79 = v58;
        __int16 v80 = 2114;
        id v81 = v61;
        __int16 v82 = 2112;
        id v83 = v59;
        __int16 v84 = 2114;
        id v85 = v42;
        _os_log_impl(&dword_1D4693000, v57, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to encode externalID from record %@: %{public}@", buf, 0x2Au);

        id v8 = v59;
      }

      id v7 = v72;
      goto LABEL_27;
    }
    id v75 = v42;
    id v43 = [v8 externalData:&v75];
    id v44 = v75;

    if (v43)
    {
      int v45 = *(void **)(a1 + 64);
      id v74 = v44;
      char v46 = [v45 stageAdditionForModel:v15 externalID:v41 externalData:v43 error:&v74];
      id v42 = v74;

      if (v46)
      {
LABEL_26:
        id v7 = v72;

LABEL_27:
        id v10 = v73;

        id v16 = v42;
        goto LABEL_28;
      }
      uint64_t v70 = MEMORY[0x1D944CB30]();
      id v47 = *(id *)(a1 + 32);
      id v48 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v50 = id v49 = v47;
        [*(id *)(a1 + 40) identifier];
        v52 = id v51 = v8;
        id v53 = [v52 shortDescription];
        *(_DWORD *)buf = 138543874;
        id v79 = v50;
        __int16 v80 = 2114;
        id v81 = v53;
        __int16 v82 = 2114;
        id v83 = v42;
        _os_log_impl(&dword_1D4693000, v48, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to add model to update to block: %{public}@", buf, 0x20u);

        id v8 = v51;
        id v47 = v49;
      }
      id v44 = v42;
      id v54 = (void *)v70;
    }
    else
    {
      id v54 = (void *)MEMORY[0x1D944CB30]();
      id v47 = *(id *)(a1 + 32);
      id v48 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v62 = v71 = v47;
        [*(id *)(a1 + 40) identifier];
        v64 = id v63 = v8;
        id v65 = [v64 shortDescription];
        *(_DWORD *)buf = 138544130;
        id v79 = v62;
        __int16 v80 = 2114;
        id v81 = v65;
        __int16 v82 = 2112;
        id v83 = v63;
        __int16 v84 = 2114;
        id v85 = v44;
        _os_log_impl(&dword_1D4693000, v48, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to encode externalData from record %@: %{public}@", buf, 0x2Au);

        id v8 = v63;
        id v47 = v71;
      }
    }

    id v42 = v44;
    goto LABEL_26;
  }
  id v28 = (void *)MEMORY[0x1D944CB30]();
  id v29 = *(id *)(a1 + 32);
  id v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    id v31 = HMFGetLogIdentifier();
    id v32 = [*(id *)(a1 + 40) identifier];
    id v33 = [v32 shortDescription];
    id v34 = [v7 hmbDescription];
    *(_DWORD *)buf = 138544130;
    id v79 = v31;
    __int16 v80 = 2114;
    id v81 = v33;
    __int16 v82 = 2112;
    id v83 = v34;
    __int16 v84 = 2114;
    id v85 = v10;
    _os_log_impl(&dword_1D4693000, v30, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch changes for record with ID %@: %{public}@", buf, 0x2Au);
  }
LABEL_29:
}

void ____fetchChanges_block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D944CB30]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  os_log_type_t v10 = *(unsigned char *)(a1 + 56);
  if (os_log_type_enabled(v9, v10))
  {
    id v11 = HMFGetLogIdentifier();
    int v12 = [*(id *)(a1 + 40) identifier];
    [v12 shortDescription];
    char v13 = v5;
    v15 = id v14 = v6;
    [v13 recordName];
    v16 = id v31 = v7;
    *(_DWORD *)buf = 138544130;
    id v35 = v11;
    __int16 v36 = 2114;
    id v37 = v15;
    __int16 v38 = 2114;
    id v39 = v14;
    __int16 v40 = 2114;
    id v41 = v16;
    _os_log_impl(&dword_1D4693000, v9, v10, "%{public}@[%{public}@] Received record deletion for %{public}@/%{public}@", buf, 0x2Au);

    id v7 = v31;
    id v6 = v14;
    id v5 = v13;
  }
  id v33 = 0;
  uint64_t v17 = [v5 externalID:&v33];
  id v18 = v33;
  if (!v17)
  {
    id v22 = (void *)MEMORY[0x1D944CB30]();
    id v23 = *(id *)(a1 + 32);
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v28 = HMFGetLogIdentifier();
      id v29 = [*(id *)(a1 + 40) identifier];
      id v30 = [v29 shortDescription];
      *(_DWORD *)buf = 138544130;
      id v35 = v28;
      __int16 v36 = 2114;
      id v37 = v30;
      __int16 v38 = 2114;
      id v39 = v5;
      __int16 v40 = 2114;
      id v41 = v18;
      _os_log_impl(&dword_1D4693000, v24, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to encode externalID from recordID %{public}@: %{public}@", buf, 0x2Au);
    }
    goto LABEL_10;
  }
  uint64_t v19 = *(void **)(a1 + 48);
  id v32 = v18;
  char v20 = [v19 stageRemovalForModelWithExternalID:v17 error:&v32];
  id v21 = v32;

  if ((v20 & 1) == 0)
  {
    id v22 = (void *)MEMORY[0x1D944CB30]();
    id v23 = *(id *)(a1 + 32);
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      id v26 = [*(id *)(a1 + 40) identifier];
      id v27 = [v26 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v35 = v25;
      __int16 v36 = 2114;
      id v37 = v27;
      __int16 v38 = 2114;
      id v39 = v21;
      _os_log_impl(&dword_1D4693000, v24, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to add model to remove to block: %{public}@", buf, 0x20u);
    }
    id v18 = v21;
LABEL_10:

    id v21 = v18;
  }
}

void ____fetchChanges_block_invoke_18(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a6);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v15 = (void *)MEMORY[0x1D944CB30]();
  id v16 = *(id *)(a1 + 32);
  uint64_t v17 = HMFGetOSLogHandle();
  id v18 = v17;
  if (v14)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      [*(id *)(a1 + 40) identifier];
      id v31 = v13;
      id v20 = v12;
      id v21 = v11;
      id v23 = v22 = v10;
      id v24 = [v23 shortDescription];
      uint64_t v25 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      id v34 = v19;
      __int16 v35 = 2114;
      __int16 v36 = v24;
      __int16 v37 = 2114;
      __int16 v38 = v25;
      _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Failed to fetch newest records: %{public}@", buf, 0x20u);

      id v10 = v22;
      id v11 = v21;
      id v12 = v20;
      id v13 = v31;
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v26 = HMFGetLogIdentifier();
    id v30 = [*(id *)(a1 + 40) identifier];
    id v32 = v10;
    id v27 = [v30 shortDescription];
    id v28 = HMFBooleanToString();
    id v29 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) hmbDescription];
    *(_DWORD *)buf = 138544130;
    id v34 = v26;
    __int16 v35 = 2114;
    __int16 v36 = v27;
    __int16 v37 = 2112;
    __int16 v38 = v28;
    __int16 v39 = 2112;
    __int16 v40 = v29;
    _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched newest records with moreComing: %@ and serverChangeToken: %@", buf, 0x2Au);

    id v10 = v32;
  }
}

void ____fetchChanges_block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  id v71 = v3;
  if (!v4) {
    id v4 = v3;
  }
  id v5 = v4;
  id v6 = (void *)MEMORY[0x1D944CB30]();
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v9)
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 40) identifier];
      id v12 = [v11 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v83 = v10;
      __int16 v84 = 2114;
      id v85 = v12;
      __int16 v86 = 2114;
      uint64_t v87 = (uint64_t)v5;
      _os_log_impl(&dword_1D4693000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchRecordZoneChangesOperation failed: %{public}@", buf, 0x20u);
    }
    [*(id *)(a1 + 48) abort];
    if ([v5 hmbIsCKChangeTokenExpiredError])
    {
      id v13 = (void *)MEMORY[0x1D944CB30]();
      id v14 = *(id *)(a1 + 32);
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = HMFGetLogIdentifier();
        uint64_t v17 = [*(id *)(a1 + 40) identifier];
        id v18 = [v17 shortDescription];
        *(_DWORD *)buf = 138543874;
        id v83 = v16;
        __int16 v84 = 2114;
        id v85 = v18;
        __int16 v86 = 2114;
        uint64_t v87 = (uint64_t)v5;
        _os_log_impl(&dword_1D4693000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Performing cloud pull again with nil change token due to expired change token error: %{public}@", buf, 0x20u);
      }
      __fetchChanges(*(void *)(a1 + 32), 0, *(void *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 64));
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
      if (!WeakRetained) {
        _HMFPreconditionFailure();
      }
      id v47 = WeakRetained;
      id v48 = *(void **)(a1 + 32);
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = ____fetchChanges_block_invoke_24;
      v76[3] = &unk_1E69EB5A8;
      id v77 = v48;
      id v78 = *(id *)(a1 + 72);
      id v79 = *(id *)(a1 + 56);
      id v80 = *(id *)(a1 + 40);
      id v81 = *(id *)(a1 + 64);
      if ([v77 retryCloudKitOperation:v47 afterError:v5 retryBlock:v76])
      {
        id v49 = (void *)MEMORY[0x1D944CB30]();
        id v50 = *(id *)(a1 + 32);
        id v51 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          id v52 = HMFGetLogIdentifier();
          id v53 = [*(id *)(a1 + 40) identifier];
          id v54 = [v53 shortDescription];
          *(_DWORD *)buf = 138543618;
          id v83 = v52;
          __int16 v84 = 2114;
          id v85 = v54;
          _os_log_impl(&dword_1D4693000, v51, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKFetchRecordZoneChangesOperation will be retried", buf, 0x16u);
        }
        [*(id *)(a1 + 40) markWithReason:@"deferred"];
      }
      else
      {
        uint64_t v55 = [v5 hmbIsCKZoneDeletedError];
        if (v55)
        {
          id v56 = (void *)MEMORY[0x1D944CB30]();
          id v57 = *(id *)(a1 + 32);
          id v58 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            id v59 = HMFGetLogIdentifier();
            id v60 = [*(id *)(a1 + 40) identifier];
            unint64_t v61 = [v60 shortDescription];
            *(_DWORD *)buf = 138543874;
            id v83 = v59;
            __int16 v84 = 2114;
            id v85 = v61;
            __int16 v86 = 2114;
            uint64_t v87 = (uint64_t)v5;
            _os_log_impl(&dword_1D4693000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Received cloud zone deletion error: %{public}@", buf, 0x20u);
          }
          uint64_t v55 = [*(id *)(a1 + 32) handleDeletion];
        }
        id v62 = (void *)MEMORY[0x1D944CB30](v55);
        id v63 = *(id *)(a1 + 32);
        id v64 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          id v65 = HMFGetLogIdentifier();
          id v66 = [*(id *)(a1 + 40) identifier];
          id v67 = [v66 shortDescription];
          *(_DWORD *)buf = 138543874;
          id v83 = v65;
          __int16 v84 = 2114;
          id v85 = v67;
          __int16 v86 = 2114;
          uint64_t v87 = (uint64_t)v5;
          _os_log_impl(&dword_1D4693000, v64, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch record zone changes: %{public}@", buf, 0x20u);
        }
        [*(id *)(a1 + 64) finishWithError:v5];
      }
    }
  }
  else
  {
    if (v9)
    {
      uint64_t v19 = HMFGetLogIdentifier();
      id v20 = [*(id *)(a1 + 40) identifier];
      id v21 = [v20 shortDescription];
      *(_DWORD *)buf = 138543618;
      id v83 = v19;
      __int16 v84 = 2114;
      id v85 = v21;
      _os_log_impl(&dword_1D4693000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Committing mirror input block", buf, 0x16u);
    }
    id v22 = *(void **)(a1 + 48);
    uint64_t v23 = *(void *)(a1 + 56);
    id v75 = 0;
    id v24 = [v22 commitWithOptions:v23 error:&v75];
    id v25 = v75;
    id v26 = (void *)MEMORY[0x1D944CB30]();
    id v27 = *(id *)(a1 + 32);
    id v28 = HMFGetOSLogHandle();
    id v29 = v28;
    if (v24)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = HMFGetLogIdentifier();
        id v31 = [*(id *)(a1 + 40) identifier];
        id v32 = [v31 shortDescription];
        uint64_t v33 = [*(id *)(a1 + 80) count];
        *(_DWORD *)buf = 138543874;
        id v83 = v30;
        __int16 v84 = 2114;
        id v85 = v32;
        __int16 v86 = 2048;
        uint64_t v87 = v33;
        _os_log_impl(&dword_1D4693000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Successfully committed block. Handling %lu internal model updates", buf, 0x20u);
      }
      if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40))
      {
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = ____fetchChanges_block_invoke_32;
        v72[3] = &unk_1E69E9D88;
        id v34 = *(id *)(a1 + 32);
        uint64_t v35 = *(void *)(a1 + 96);
        id v73 = v34;
        uint64_t v74 = v35;
        id v36 = (id)[v24 addSuccessBlock:v72];
      }
      uint64_t v37 = [*(id *)(a1 + 80) count];
      if (v37) {
        uint64_t v37 = [*(id *)(a1 + 32) handleUpdatedInternalModels:*(void *)(a1 + 80)];
      }
      __int16 v38 = (void *)MEMORY[0x1D944CB30](v37);
      id v39 = *(id *)(a1 + 32);
      __int16 v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v41 = HMFGetLogIdentifier();
        uint64_t v42 = [*(id *)(a1 + 40) identifier];
        id v43 = [v42 shortDescription];
        *(_DWORD *)buf = 138543618;
        id v83 = v41;
        __int16 v84 = 2114;
        id v85 = v43;
        _os_log_impl(&dword_1D4693000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchRecordZoneChangesOperation succeeded", buf, 0x16u);
      }
      id v44 = *(void **)(a1 + 64);
      int v45 = [[HMBCloudZonePullResult alloc] initWithProcessingFuture:v24];
      [v44 finishWithResult:v45];

      [*(id *)(a1 + 40) markWithReason:@"success"];
    }
    else
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        id v68 = HMFGetLogIdentifier();
        BOOL v69 = [*(id *)(a1 + 40) identifier];
        uint64_t v70 = [v69 shortDescription];
        *(_DWORD *)buf = 138543874;
        id v83 = v68;
        __int16 v84 = 2114;
        id v85 = v70;
        __int16 v86 = 2114;
        uint64_t v87 = (uint64_t)v25;
        _os_log_impl(&dword_1D4693000, v29, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to commit block: %{public}@", buf, 0x20u);
      }
      [*(id *)(a1 + 40) markWithReason:@"failed (commit)."];
      [*(id *)(a1 + 64) finishWithError:v25];
    }
  }
}

uint64_t ____fetchChanges_block_invoke_24(void *a1)
{
  return __fetchChanges(a1[4], a1[5], a1[6], a1[7], a1[8]);
}

void ____fetchChanges_block_invoke_32(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) cloudDatabase];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v4 = [v2 cloudZoneID];
  [v5 updateServerChangeToken:v3 forZoneWithID:v4];
}

void __performCodeOperation(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v13 = a1;
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  if (!v17)
  {
    id v19 = objc_alloc(MEMORY[0x1E4F653F0]);
    id v20 = [NSString stringWithUTF8String:"__performCodeOperation"];
    id v17 = (id)[v19 initWithName:v20];
  }
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F19EB0]) initWithServiceName:v14 functionName:v15 responseClass:a5];
  [v21 setRequest:v16];
  id v22 = [v13 operationConfigurationWithProcessingOptions:0];
  [v21 setConfiguration:v22];

  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = ____performCodeOperation_block_invoke;
  v48[3] = &unk_1E69E9E00;
  id v23 = v13;
  id v49 = v23;
  id v24 = v17;
  id v50 = v24;
  [v21 setRequestCompletedBlock:v48];
  objc_initWeak(&location, v21);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = ____performCodeOperation_block_invoke_7;
  v39[3] = &unk_1E69E9E50;
  id v25 = v23;
  id v40 = v25;
  id v26 = v24;
  id v41 = v26;
  objc_copyWeak(v46, &location);
  id v38 = v14;
  id v42 = v38;
  id v27 = v15;
  id v43 = v27;
  id v36 = v16;
  id v44 = v36;
  v46[1] = a5;
  id v37 = v18;
  id v45 = v37;
  id v28 = (void *)MEMORY[0x1D944CB30]([v21 setCodeOperationCompletionBlock:v39]);
  id v29 = v25;
  HMFGetOSLogHandle();
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    id v32 = [v26 identifier];
    uint64_t v33 = [v32 shortDescription];
    id v34 = [v21 operationID];
    *(_DWORD *)buf = 138544386;
    id v52 = v31;
    __int16 v53 = 2114;
    id v54 = v33;
    __int16 v55 = 2112;
    id v56 = v27;
    __int16 v57 = 2112;
    id v58 = v38;
    __int16 v59 = 2114;
    id v60 = v34;
    _os_log_impl(&dword_1D4693000, v30, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Starting %@ CKCodeOperation for service: %@ operationID: %{public}@", buf, 0x34u);
  }
  uint64_t v35 = [v29 privateDatabase];
  [v35 addOperation:v21];

  objc_destroyWeak(v46);
  objc_destroyWeak(&location);
}

void sub_1D46C06D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
}

void ____performCodeOperation_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) identifier];
    BOOL v9 = [v8 shortDescription];
    id v10 = [v3 requestUUID];
    int v11 = 138543874;
    id v12 = v7;
    __int16 v13 = 2114;
    id v14 = v9;
    __int16 v15 = 2114;
    id v16 = v10;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKCodeOperation finished with request UUID: %{public}@", (uint8_t *)&v11, 0x20u);
  }
}

void ____performCodeOperation_block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D944CB30]();
  id v8 = *(id *)(a1 + 32);
  BOOL v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) identifier];
      __int16 v13 = [v12 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v37 = v11;
      __int16 v38 = 2114;
      id v39 = v13;
      __int16 v40 = 2114;
      id v41 = v6;
      _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKCodeOperation failed: %{public}@", buf, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    if (!WeakRetained) {
      _HMFPreconditionFailure();
    }
    __int16 v15 = WeakRetained;
    id v16 = *(void **)(a1 + 32);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = ____performCodeOperation_block_invoke_9;
    v28[3] = &unk_1E69E9E28;
    id v29 = v16;
    id v30 = *(id *)(a1 + 48);
    id v31 = *(id *)(a1 + 56);
    id v17 = *(id *)(a1 + 64);
    uint64_t v18 = *(void *)(a1 + 88);
    id v32 = v17;
    uint64_t v35 = v18;
    id v33 = *(id *)(a1 + 40);
    id v34 = *(id *)(a1 + 72);
    if ([v29 retryCloudKitOperation:v15 afterError:v6 retryBlock:v28])
    {
      id v19 = (void *)MEMORY[0x1D944CB30]();
      id v20 = *(id *)(a1 + 32);
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v22 = HMFGetLogIdentifier();
        id v23 = [*(id *)(a1 + 40) identifier];
        id v24 = [v23 shortDescription];
        *(_DWORD *)buf = 138543618;
        id v37 = v22;
        __int16 v38 = 2114;
        id v39 = v24;
        _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKCodeOperation will be retried", buf, 0x16u);
      }
    }
    else
    {
      [*(id *)(a1 + 72) finishWithError:v6];
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v25 = HMFGetLogIdentifier();
      id v26 = [*(id *)(a1 + 40) identifier];
      id v27 = [v26 shortDescription];
      *(_DWORD *)buf = 138543618;
      id v37 = v25;
      __int16 v38 = 2114;
      id v39 = v27;
      _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKCodeOperation succeeded", buf, 0x16u);
    }
    [*(id *)(a1 + 72) finishWithResult:v5];
  }
}

uint64_t ____performCodeOperation_block_invoke_9(void *a1)
{
  return __performCodeOperation(a1[4], a1[5], a1[6], a1[7], a1[10], a1[8], a1[9]);
}

void sub_1D46C1040(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __transitionToState(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  buf[3] = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  id v12 = a3;
  __int16 v13 = [v11 cloudZone];
  id v14 = [v13 localZone];
  __int16 v15 = [v14 localDatabase];
  id v16 = [v15 queue];

  if (v16)
  {
    buf[0] = &a9;
    id v17 = (void *)[[NSString alloc] initWithFormat:v12 arguments:&a9];
    objc_initWeak(&location, v11);
    id v18 = objc_alloc_init(MEMORY[0x1E4F7A0E8]);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = ____transitionToState_block_invoke;
    v29[3] = &unk_1E69E9EC8;
    objc_copyWeak(v32, &location);
    id v19 = v18;
    id v30 = v19;
    v32[1] = a2;
    id v20 = v17;
    id v31 = v20;
    [v16 addOperationWithBlock:v29];
    id v21 = [v19 future];

    objc_destroyWeak(v32);
    objc_destroyWeak(&location);
  }
  else
  {
    id v22 = (void *)MEMORY[0x1D944CB30]();
    id v23 = v11;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      LODWORD(buf[0]) = 138543362;
      *(void *)((char *)buf + 4) = v25;
      _os_log_impl(&dword_1D4693000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to get operation queue to change state transition", (uint8_t *)buf, 0xCu);
    }
    id v26 = (void *)MEMORY[0x1E4F7A0D8];
    id v27 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    id v21 = [v26 futureWithError:v27];
  }
  return v21;
}

void sub_1D46C12F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____transitionToState_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    __updateState(WeakRetained, *(void *)(a1 + 56), *(void **)(a1 + 40), *(void **)(a1 + 32));
  }
  else
  {
    id v4 = (void *)MEMORY[0x1D944CB30]();
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = HMFGetLogIdentifier();
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_1D4693000, v5, OS_LOG_TYPE_ERROR, "%{public}@Lost self for cloud zone rebuild", (uint8_t *)&v9, 0xCu);
    }
    id v7 = *(void **)(a1 + 32);
    id v8 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    [v7 finishWithError:v8];
  }
}

void __updateState(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v115 = a3;
  id v114 = a4;
  id v8 = [v7 rebuilderStatus];
  context = (void *)[v8 rebuildState];

  int v9 = (void *)MEMORY[0x1D944CB30]();
  id v10 = (os_unfair_lock_s *)v7;
  uint64_t v11 = HMFGetOSLogHandle();
  id v12 = v11;
  if ((unint64_t)(a2 - 1) >= 2)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = HMFGetLogIdentifier();
      id v19 = +[HMBCloudZoneRebuilderStatus rebuilderStateString:context];
      id v20 = +[HMBCloudZoneRebuilderStatus rebuilderStateString:a2];
      id v21 = [(os_unfair_lock_s *)v10 rebuildCompleteFuture];
      [v21 isFinished];
      id v22 = HMFBooleanToString();
      *(_DWORD *)buf = 138544130;
      *(void *)&void buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2112;
      id v124 = v20;
      *(_WORD *)id v125 = 2112;
      *(void *)&v125[2] = v22;
      _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Requested state transition from %@ to %@ (finished: %@).", buf, 0x2Au);
    }
    if (a2 == 7 && !context)
    {
      id v23 = (void *)MEMORY[0x1D944CB30]();
      id v24 = v10;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&void buf[4] = v26;
        _os_log_impl(&dword_1D4693000, v25, OS_LOG_TYPE_INFO, "%{public}@Initial state transition to complete finishes waitForRebuildCompletion early.", buf, 0xCu);
      }
      id v27 = [(os_unfair_lock_s *)v24 rebuildCompleteFuture];
      [v27 finishWithNoResult];

      char v28 = 1;
      goto LABEL_23;
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = HMFGetLogIdentifier();
      id v14 = +[HMBCloudZoneRebuilderStatus rebuilderStateString:context];
      __int16 v15 = +[HMBCloudZoneRebuilderStatus rebuilderStateString:a2];
      id v16 = [(os_unfair_lock_s *)v10 rebuildCompleteFuture];
      [v16 isFinished];
      id v17 = HMFBooleanToString();
      *(_DWORD *)buf = 138544130;
      *(void *)&void buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      id v124 = v15;
      *(_WORD *)id v125 = 2112;
      *(void *)&v125[2] = v17;
      _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_ERROR, "%{public}@Requested state transition from %@ to %@ (finished: %@).", buf, 0x2Au);
    }
  }
  if ((unint64_t)(a2 - 1) < 6)
  {
    os_unfair_lock_lock_with_options();
    id v29 = [(os_unfair_lock_s *)v10 rebuildCompleteFuture];
    int v30 = [v29 isFinished];

    if (v30)
    {
      id v31 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
      [(os_unfair_lock_s *)v10 setRebuildCompleteFuture:v31];

      os_unfair_lock_unlock(v10 + 2);
      id v32 = (void *)MEMORY[0x1D944CB30]();
      id v33 = v10;
      id v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        uint64_t v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&void buf[4] = v35;
        _os_log_impl(&dword_1D4693000, v34, OS_LOG_TYPE_ERROR, "%{public}@Expected future to be in-progress but it's NOT!", buf, 0xCu);
      }
    }
    else
    {
      os_unfair_lock_unlock(v10 + 2);
    }
    goto LABEL_19;
  }
  if (a2 == 7)
  {
LABEL_19:
    char v28 = 0;
    goto LABEL_24;
  }
  id v36 = (void *)MEMORY[0x1D944CB30]();
  id v37 = v10;
  __int16 v38 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    id v39 = HMFGetLogIdentifier();
    __int16 v40 = +[HMBCloudZoneRebuilderStatus rebuilderStateString:a2];
    *(_DWORD *)buf = 138543618;
    *(void *)&void buf[4] = v39;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v40;
    _os_log_impl(&dword_1D4693000, v38, OS_LOG_TYPE_ERROR, "%{public}@Attempting to transition into invalid state %@ (treating as Complete)", buf, 0x16u);
  }
  char v28 = 0;
LABEL_23:
  a2 = 7;
LABEL_24:
  id v41 = [[HMBCloudZoneRebuilderStatus alloc] initWithState:a2 message:v115];
  [(os_unfair_lock_s *)v10 setRebuilderStatus:v41];

  uint64_t v42 = [(os_unfair_lock_s *)v10 cloudZone];
  id v43 = [v42 cloudDatabase];
  id v44 = [(os_unfair_lock_s *)v10 rebuilderStatus];
  id v45 = [v42 cloudZoneID];
  [v43 updateRebuildStatus:v44 forZoneWithID:v45];

  if (context == (void *)a2) {
    char v46 = 1;
  }
  else {
    char v46 = v28;
  }
  if ((v46 & 1) == 0)
  {
    id v47 = [v42 delegate];
    id v48 = (void *)MEMORY[0x1D944CB30]();
    id v49 = v10;
    id v50 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      id v51 = HMFGetLogIdentifier();
      id v52 = [(os_unfair_lock_s *)v49 rebuilderStatus];
      *(_DWORD *)buf = 138543874;
      *(void *)&void buf[4] = v51;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v47;
      *(_WORD *)&buf[22] = 2112;
      id v124 = v52;
      _os_log_impl(&dword_1D4693000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying delegate %@ of updated rebuild status: %@", buf, 0x20u);
    }
    if (objc_opt_respondsToSelector())
    {
      __int16 v53 = [(os_unfair_lock_s *)v49 rebuilderStatus];
      [v47 cloudZone:v42 didChangeRebuildStatus:v53];
    }
    else
    {
      id v54 = (void *)MEMORY[0x1D944CB30]();
      __int16 v55 = v49;
      id v56 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        __int16 v57 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&void buf[4] = v57;
        _os_log_impl(&dword_1D4693000, v56, OS_LOG_TYPE_INFO, "%{public}@Delegate does not respond to selector.", buf, 0xCu);
      }
    }
  }
  switch(a2)
  {
    case 2:
      id v58 = v10;
      uint64_t v113 = (int)arc4random_uniform(0x3938700u);
      id v59 = (id)__transitionToState(v58, 3, @"Delaying rebuild for %lu usec");
      dispatch_time_t v60 = dispatch_time(0, 1000 * v113);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ____holdoffDelay_block_invoke;
      id v124 = &unk_1E69EA1C8;
      *(void *)id v125 = v58;
      uint64_t v61 = v58;
      dispatch_after(v60, MEMORY[0x1E4F14428], buf);

      objc_msgSend(v114, "finishWithNoResult", v113);
      goto LABEL_63;
    case 4:
      id v62 = v10;
      id v63 = __fetchSentinelModel(v62);
      objc_initWeak(&location, v62);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ____checkLockAcquire_block_invoke;
      id v124 = &unk_1E69E9EF0;
      objc_copyWeak((id *)v125, &location);
      id v64 = (id)[v63 addSuccessBlock:buf];
      v120[0] = MEMORY[0x1E4F143A8];
      v120[1] = 3221225472;
      v120[2] = ____checkLockAcquire_block_invoke_2;
      v120[3] = &unk_1E69E9F40;
      objc_copyWeak(&v121, &location);
      id v65 = (id)[v63 addFailureBlock:v120];
      objc_destroyWeak(&v121);
      objc_destroyWeak((id *)v125);
      objc_destroyWeak(&location);

      goto LABEL_62;
    case 5:
      id v66 = v10;
      id v67 = (void *)MEMORY[0x1D944CB30]();
      id v68 = v66;
      BOOL v69 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v70 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&void buf[4] = v70;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = 0x4082C00000000000;
        _os_log_impl(&dword_1D4693000, v69, OS_LOG_TYPE_DEFAULT, "%{public}@Waiting %.2f seconds for an expected cloud push.", buf, 0x16u);
      }
      os_unfair_lock_lock_with_options();
      id v71 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:0 options:600.0];
      [(os_unfair_lock_s *)v68 setUploadMonitorWatchdogTimer:v71];

      os_unfair_lock_unlock(v68 + 2);
      id v72 = [(os_unfair_lock_s *)v68 uploadMonitorWatchdogTimer];
      [v72 setDelegate:v68];

      id v73 = [(os_unfair_lock_s *)v68 uploadMonitorWatchdogTimer];
      [v73 resume];

      goto LABEL_62;
    case 6:
      uint64_t v74 = v10;
      id v75 = [(os_unfair_lock_s *)v74 cloudZone];
      id v76 = [v75 localZone];
      id v77 = [v75 modelContainer];
      id v78 = [v76 localDatabase];
      id v79 = [v78 queue];

      if (v75 && v76 && v77 && v79)
      {
        id v80 = [v76 queryAllRowRecordsReturning:2];
        id v81 = [[HMBCloudZoneEncodingContext alloc] initWithModelContainer:v77];
        __pushChunk(v74, v75, v76, v77, v79, v81, v80);
      }
      else
      {
        contexta = (void *)MEMORY[0x1D944CB30]();
        id v83 = v74;
        __int16 v84 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          uint64_t v85 = HMFGetLogIdentifier();
          __int16 v86 = @"<NON-NULL>";
          if (!v79) {
            __int16 v86 = @"operationQueue";
          }
          if (!v77) {
            __int16 v86 = @"modelContainer";
          }
          if (!v76) {
            __int16 v86 = @"localZone";
          }
          if (!v75) {
            __int16 v86 = @"cloudZone";
          }
          *(_DWORD *)buf = 138543618;
          *(void *)&void buf[4] = v85;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v86;
          uint64_t v87 = (void *)v85;
          _os_log_impl(&dword_1D4693000, v84, OS_LOG_TYPE_ERROR, "%{public}@Lost %@ for cloud zone rebuild", buf, 0x16u);
        }
      }

      goto LABEL_62;
    case 7:
      [(os_unfair_lock_s *)v10 setLastRebuildUUID:0];
      [(os_unfair_lock_s *)v10 setPreviousSentinelRebuildRecord:0];
      if (!context || context == (void *)7) {
        goto LABEL_49;
      }
      contextb = [v42 localZone];
      uint64_t v88 = [v42 cloudDatabase];
      id v89 = (void *)v88;
      if (v42) {
        BOOL v90 = contextb == 0;
      }
      else {
        BOOL v90 = 1;
      }
      int v92 = v90 || v88 == 0;
      id v93 = (void *)MEMORY[0x1D944CB30]();
      id v94 = v10;
      id v95 = HMFGetOSLogHandle();
      id v96 = v95;
      if (v92)
      {
        if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
        {
          uint64_t v97 = HMFGetLogIdentifier();
          id v98 = (void *)v97;
          id v99 = @"<NON-NULL>";
          if (!v89) {
            id v99 = @"cloudDatabase";
          }
          if (!contextb) {
            id v99 = @"localZone";
          }
          if (!v42) {
            id v99 = @"cloudZone";
          }
          *(_DWORD *)buf = 138543618;
          *(void *)&void buf[4] = v97;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v99;
          _os_log_impl(&dword_1D4693000, v96, OS_LOG_TYPE_ERROR, "%{public}@Lost %@ while completing rebuild.", buf, 0x16u);
        }
        __failedToComplete(v94, v114);
      }
      else
      {
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
        {
          id v100 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          *(void *)&void buf[4] = v100;
          _os_log_impl(&dword_1D4693000, v96, OS_LOG_TYPE_DEFAULT, "%{public}@Removing all records and resetting serverChangeToken.", buf, 0xCu);
        }
        id v119 = 0;
        char v101 = [contextb destroyWithError:&v119];
        id v102 = v119;
        if (v101)
        {
          id v103 = [v42 cloudZoneID];
          [v89 updateServerChangeToken:0 forZoneWithID:v103];

          id v104 = +[HMBProcessingOptions optionsWithLabel:@"Rebuild Complete Fetch."];
          id v105 = (id)[v42 performCloudPullWithOptions:v104];
          id v106 = [v89 delegate];
          if (objc_opt_respondsToSelector())
          {
            __int16 v107 = [v42 cloudZoneID];
            [v106 cloudDatabase:v89 didChangeManateeKeysForZoneWithID:v107];
          }
LABEL_49:
          __int16 v82 = [(os_unfair_lock_s *)v10 rebuildCompleteFuture];
          [v82 finishWithNoResult];

LABEL_62:
          objc_msgSend(v114, "finishWithNoResult", v112);
        }
        else
        {
          id v108 = (void *)MEMORY[0x1D944CB30]();
          __int16 v109 = v94;
          id v110 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
          {
            __int16 v111 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&void buf[4] = v111;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v102;
            _os_log_impl(&dword_1D4693000, v110, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove all records from local zone: %@", buf, 0x16u);
          }
          __failedToComplete(v109, v114);
        }
      }
LABEL_63:

      return;
    default:
      goto LABEL_62;
  }
}

void sub_1D46C23EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ____holdoffDelay_block_invoke(uint64_t a1)
{
  return (id)__transitionToState(*(void *)(a1 + 32), 4, @"Preparing to begin lock acquisition.");
}

id __fetchSentinelModel(void *a1)
{
  id v1 = a1;
  id v2 = [v1 cloudZone];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    id v4 = +[HMBCloudZoneRebuilderModel sentinelUUID];
    id v5 = [v4 UUIDString];
    id v6 = [v2 cloudZoneID];
    id v7 = [v6 zoneID];
    id v8 = (void *)[v3 initWithRecordName:v5 zoneID:v7];

    int v9 = [v2 fetchRecordWithRecordID:v8 canRetry:0];
    objc_initWeak(&location, v1);
    id v10 = (void *)MEMORY[0x1E4F7A0D8];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = ____fetchSentinelModel_block_invoke;
    v17[3] = &unk_1E69EAAD8;
    id v11 = v9;
    id v18 = v11;
    objc_copyWeak(&v19, &location);
    id v12 = [v2 operationScheduler];
    __int16 v13 = [v10 futureWithBlock:v17 scheduler:v12];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F7A0D8];
    __int16 v15 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    __int16 v13 = [v14 futureWithError:v15];
  }
  return v13;
}

void sub_1D46C2670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____checkLockAcquire_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = [v3 hasCompleted];
    int v6 = [v5 BOOLValue];

    if (v6)
    {
      id v7 = (id)__transitionToState(WeakRetained, 7, @"Rebuild found complete at start of check lock acquire.");
    }
    else
    {
      id v11 = [v3 uniqueToken];
      id v12 = [WeakRetained lastRebuildUUID];
      int v13 = [v11 isEqual:v12];

      if (v13)
      {
        id v14 = (void *)MEMORY[0x1D944CB30]();
        id v15 = WeakRetained;
        id v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v29 = v17;
          _os_log_impl(&dword_1D4693000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Sentinel record has not mutated.", buf, 0xCu);
        }
        id v18 = [v15 cloudZone];
        id v19 = [v18 localZone];
        id v20 = [v19 localDatabase];
        id v21 = [v20 queue];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = ____checkLockAcquire_block_invoke_174;
        v26[3] = &unk_1E69EA1C8;
        id v27 = v15;
        [v21 addOperationWithBlock:v26];
      }
      else
      {
        id v22 = [WeakRetained lastRebuildUUID];
        id v25 = [v3 uniqueToken];
        id v23 = (id)__transitionToState(WeakRetained, 5, @"Continue monitoring of upload (token change %@ -> %@)");

        id v24 = objc_msgSend(v3, "uniqueToken", v22, v25);
        [WeakRetained setLastRebuildUUID:v24];
      }
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D944CB30]();
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v29 = v10;
      _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_ERROR, "%{public}@Lost self for cloud zone rebuild", buf, 0xCu);
    }
  }
}

void ____checkLockAcquire_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained cloudZone];
  id val = [v5 cloudDatabase];
  if (WeakRetained && v5 && val)
  {
    if ([v3 isHMFError] && objc_msgSend(v3, "code") == 2)
    {
      int v6 = [v5 localZone];
      id v7 = [v6 localDatabase];
      id v8 = [v7 queue];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = ____checkLockAcquire_block_invoke_181;
      v24[3] = &unk_1E69EA1C8;
      id v25 = WeakRetained;
      [v8 addOperationWithBlock:v24];
    }
    else if ([v3 hmbIsCloudKitError])
    {
      if ([v3 code] == 26 || objc_msgSend(v3, "code") == 28)
      {
        id v15 = (id)__transitionToState(WeakRetained, 7, @"Zone appears removed by the user.");
        objc_initWeak((id *)buf, val);
        id v16 = [v5 startUp];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = ____checkLockAcquire_block_invoke_2_188;
        v21[3] = &unk_1E69E9F18;
        objc_copyWeak(&v23, (id *)buf);
        id v22 = WeakRetained;
        id v17 = (id)[v16 addSuccessBlock:v21];

        objc_destroyWeak(&v23);
        objc_destroyWeak((id *)buf);
      }
      else if ([v3 code] != 112)
      {
        id v19 = (id)__transitionToState(WeakRetained, 2, @"Failed to fetch rebuild model with non-zone related failure: %@");
      }
    }
    else
    {
      id v18 = (id)__transitionToState(WeakRetained, 2, @"Unable to fetch rebuild model: %@");
    }
  }
  else
  {
    int v9 = (void *)MEMORY[0x1D944CB30]();
    id v10 = WeakRetained;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v13 = (void *)v12;
      id v14 = @"<NON-NULL>";
      if (!val) {
        id v14 = @"cloudDatabase";
      }
      if (!v5) {
        id v14 = @"cloudZone";
      }
      if (!WeakRetained) {
        id v14 = @"self";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v12;
      __int16 v28 = 2112;
      id v29 = v14;
      _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_ERROR, "%{public}@Lost %@ for cloud zone rebuild", buf, 0x16u);
    }
  }
}

void sub_1D46C2D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __pushChunk(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v13 = a1;
  id v77 = a2;
  id v75 = a3;
  id v78 = a4;
  id v72 = a5;
  id v74 = a6;
  id v14 = a7;
  id v73 = [MEMORY[0x1E4F1CA60] dictionary];
  id v76 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:100];
  id v15 = 0;
  id v16 = 0;
  unint64_t v71 = 0;
  do
  {
    id v17 = v15;
    do
    {
      id v15 = [v14 nextObject];

      if (!v15)
      {
        __int16 v55 = 0;
        goto LABEL_35;
      }
      id v17 = v15;
    }
    while (![v15 modelEncoding]);
    id v18 = [v15 modelData];
    uint64_t v19 = [v15 modelEncoding];
    id v93 = v16;
    id v20 = [v78 modelFromData:v18 encoding:v19 storageLocation:2 error:&v93];
    id v21 = v93;

    if (v20)
    {
      uint64_t v22 = objc_opt_class();
      if (v22 == objc_opt_class() || (uint64_t v23 = objc_opt_class(), v23 == objc_opt_class()))
      {
        int v33 = 2;
        id v16 = v21;
      }
      else
      {
        id v92 = v21;
        id v24 = [v77 encodeRecordFromModel:v20 existingRecord:0 encodingContext:v74 error:&v92];
        id v25 = v92;

        if (v24)
        {
          id v26 = [v74 createdRecords];
          uint64_t v27 = [v24 recordID];
          __int16 v28 = [v20 hmbModelID];
          [v26 setObject:v27 forKey:v28];

          uint64_t v29 = [v24 size];
          uint64_t v30 = [v24 recordID];
          [v73 setObject:v15 forKey:v30];

          [v76 addObject:v24];
          unint64_t v31 = [v76 count];
          v71 += v29;
          if (v71 > 0x200000 || v31 > 0x64) {
            int v33 = 3;
          }
          else {
            int v33 = 0;
          }
          id v16 = v25;
        }
        else
        {
          id v45 = (void *)MEMORY[0x1D944CB30]();
          id v70 = v13;
          char v46 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            id v47 = HMFGetLogIdentifier();
            id v48 = [v20 hmbDescription];
            *(_DWORD *)buf = 138543874;
            uint64_t v97 = v47;
            __int16 v98 = 2112;
            uint64_t v99 = (uint64_t)v48;
            __int16 v100 = 2112;
            id v101 = v25;
            _os_log_impl(&dword_1D4693000, v46, OS_LOG_TYPE_ERROR, "%{public}@unable to re-encode model %@ for cloud: %@", buf, 0x20u);
          }
          id v49 = [v15 modelID];
          id v94 = v49;
          id v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
          id v16 = [v75 remove:v50];

          if (v16)
          {
            id v51 = (void *)MEMORY[0x1D944CB30]();
            id v52 = v70;
            __int16 v53 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              id v54 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              uint64_t v97 = v54;
              __int16 v98 = 2112;
              uint64_t v99 = (uint64_t)v16;
              _os_log_impl(&dword_1D4693000, v53, OS_LOG_TYPE_ERROR, "%{public}@unable to remove corrupt record: %@", buf, 0x16u);
            }
          }
          int v33 = 2;
        }
      }
    }
    else
    {
      id v34 = (void *)MEMORY[0x1D944CB30]();
      id v35 = v13;
      id v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        id v37 = HMFGetLogIdentifier();
        uint64_t v38 = [v15 recordRow];
        *(_DWORD *)buf = 138543874;
        uint64_t v97 = v37;
        __int16 v98 = 2048;
        uint64_t v99 = v38;
        __int16 v100 = 2112;
        id v101 = v21;
        _os_log_impl(&dword_1D4693000, v36, OS_LOG_TYPE_ERROR, "%{public}@unable to decode model from row %lu: %@", buf, 0x20u);
      }
      id v39 = [v15 modelID];
      id v95 = v39;
      __int16 v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
      id v16 = [v75 remove:v40];

      if (v16)
      {
        id v41 = (void *)MEMORY[0x1D944CB30]();
        id v42 = v35;
        id v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          id v44 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v97 = v44;
          __int16 v98 = 2112;
          uint64_t v99 = (uint64_t)v16;
          _os_log_impl(&dword_1D4693000, v43, OS_LOG_TYPE_ERROR, "%{public}@unable to remove corrupt record: %@", buf, 0x16u);
        }
      }
      int v33 = 2;
    }

    __int16 v55 = v15;
  }
  while (v33 != 3);
LABEL_35:
  id v56 = [v14 error];
  BOOL v57 = v56 == 0;

  if (v57)
  {
    BOOL v59 = v15 == 0;
    dispatch_time_t v60 = [v13 previousSentinelRebuildRecord];
    id v91 = v16;
    uint64_t v61 = __updatedSentinelRecord(v13, v60, v15 == 0, &v91);
    id v62 = v91;

    if (v61)
    {
      [v76 addObject:v61];
    }
    else
    {
      id v63 = (void *)MEMORY[0x1D944CB30]();
      id v64 = v13;
      id v65 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        id v66 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v97 = v66;
        __int16 v98 = 2112;
        uint64_t v99 = (uint64_t)v62;
        _os_log_impl(&dword_1D4693000, v65, OS_LOG_TYPE_ERROR, "%{public}@Unable to generate updated sentinel model: %@", buf, 0x16u);
      }
    }
    id v67 = [v77 pushRecordsToUpdate:v76 recordIDsToRemove:MEMORY[0x1E4F1CBF0] configuration:0 rollbackEnabled:1];
    objc_initWeak((id *)buf, v13);
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = ____pushChunk_block_invoke;
    v81[3] = &unk_1E69EA008;
    objc_copyWeak(&v89, (id *)buf);
    id v82 = v73;
    id v83 = v75;
    BOOL v90 = v59;
    id v84 = v72;
    id v85 = v77;
    id v86 = v78;
    id v87 = v74;
    id v88 = v14;
    id v68 = (id)[v67 addSuccessBlock:v81];
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = ____pushChunk_block_invoke_2;
    v79[3] = &unk_1E69EA690;
    id v80 = v13;
    id v69 = (id)[v67 addFailureBlock:v79];

    objc_destroyWeak(&v89);
    objc_destroyWeak((id *)buf);

    id v16 = v62;
  }
  else
  {
    id v58 = (id)__transitionToState(v13, 2, @"Iteration of rows failed: %@");
  }
}

void sub_1D46C3690(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

void __failedToComplete(void *a1, void *a2)
{
  id v3 = a2;
  id v10 = a1;
  id v4 = [v10 cloudZone];
  id v5 = [v4 configuration];
  int v6 = [v5 shouldRebuildOnManateeKeyLoss];

  if (v6)
  {
    id v7 = @"Going to try to rebuild again.";
    id v8 = v10;
    uint64_t v9 = 2;
  }
  else
  {
    id v7 = @"Waiting for a rebuild.";
    id v8 = v10;
    uint64_t v9 = 1;
  }
  __updateState(v8, v9, v7, v3);
}

id __updatedSentinelRecord(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = [v7 cloudZone];
  if (v9)
  {
    id v10 = objc_alloc_init(HMBCloudZoneRebuilderModel);
    id v11 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
    [(HMBCloudZoneRebuilderModel *)v10 setHasCompleted:v11];

    uint64_t v12 = [MEMORY[0x1E4F29128] UUID];
    [(HMBCloudZoneRebuilderModel *)v10 setUniqueToken:v12];

    id v22 = 0;
    id v13 = [v9 encodeRecordFromModel:v10 existingRecord:v8 error:&v22];
    id v14 = v22;
    id v15 = v14;
    if (v13)
    {
      id v16 = v13;
    }
    else
    {
      if (a4) {
        *a4 = v14;
      }
      id v17 = (void *)MEMORY[0x1D944CB30]();
      id v18 = v7;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v24 = v20;
        __int16 v25 = 2112;
        id v26 = v15;
        _os_log_impl(&dword_1D4693000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode sentinel model: %@", buf, 0x16u);
      }
    }
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    id v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void ____pushChunk_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  id v5 = [v3 fatalError];
  if ([v5 hmbIsCloudKitError])
  {
    int v6 = [v3 fatalError];
    uint64_t v7 = [v6 code];

    if (v7 == 1)
    {
      uint64_t v19 = [v3 fatalError];
      id v8 = (id)__transitionToState(WeakRetained, 2, @"Failed recovery push with error: %@");

      goto LABEL_11;
    }
  }
  else
  {
  }
  uint64_t v9 = [v3 conflicts];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    id v11 = (id)__transitionToState(WeakRetained, 2, @"Failed recovery push due to conflicts.");
  }
  else
  {
    uint64_t v34 = 0;
    id v35 = &v34;
    uint64_t v36 = 0x3032000000;
    id v37 = __Block_byref_object_copy__2552;
    uint64_t v38 = __Block_byref_object_dispose__2553;
    id v39 = 0;
    uint64_t v12 = +[HMBCloudZoneRebuilderModel sentinelUUID];
    id v13 = [v12 UUIDString];

    id v14 = [v3 updatedRecords];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = ____pushChunk_block_invoke_233;
    v28[3] = &unk_1E69E9FB8;
    id v15 = v13;
    id v29 = v15;
    int v33 = &v34;
    id v16 = (os_unfair_lock_s *)WeakRetained;
    uint64_t v30 = v16;
    id v31 = *(id *)(a1 + 32);
    id v32 = *(id *)(a1 + 40);
    [v14 enumerateObjectsUsingBlock:v28];

    os_unfair_lock_lock_with_options();
    [(os_unfair_lock_s *)v16 setPreviousSentinelRebuildRecord:v35[5]];
    os_unfair_lock_unlock(v16 + 2);
    if (*(unsigned char *)(a1 + 96))
    {
      id v17 = (id)__transitionToState(v16, 7, @"Successfully completed recovery.");
    }
    else
    {
      id v18 = *(void **)(a1 + 48);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = ____pushChunk_block_invoke_238;
      v20[3] = &unk_1E69E9FE0;
      id v21 = v16;
      id v22 = *(id *)(a1 + 56);
      id v23 = *(id *)(a1 + 40);
      id v24 = *(id *)(a1 + 64);
      id v25 = *(id *)(a1 + 48);
      id v26 = *(id *)(a1 + 72);
      id v27 = *(id *)(a1 + 80);
      [v18 addOperationWithBlock:v20];
    }
    _Block_object_dispose(&v34, 8);
  }
LABEL_11:
}

void sub_1D46C3D14(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

id ____pushChunk_block_invoke_2(uint64_t a1)
{
  return (id)__transitionToState(*(void *)(a1 + 32), 2, @"Failed recovery push with error (entering back into Holdoff): %@");
}

uint64_t __Block_byref_object_copy__2552(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2553(uint64_t a1)
{
}

void ____pushChunk_block_invoke_233(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = [v4 recordID];
  int v6 = [v5 recordName];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
  }
  else
  {
    id v8 = [v4 recordID];
    id v34 = 0;
    uint64_t v9 = [v8 externalID:&v34];
    id v10 = v34;

    if (!v9)
    {
      id v11 = (void *)MEMORY[0x1D944CB30]();
      id v12 = *(id *)(a1 + 40);
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = HMFGetLogIdentifier();
        id v15 = [v4 recordID];
        id v16 = [v15 hmbDescription];
        *(_DWORD *)buf = 138543874;
        uint64_t v36 = v14;
        __int16 v37 = 2112;
        uint64_t v38 = (uint64_t)v16;
        __int16 v39 = 2112;
        id v40 = v10;
        _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to generate externalID from %@: %@", buf, 0x20u);
      }
    }
    id v33 = v10;
    id v17 = [v4 externalData:&v33];
    id v18 = v33;

    if (!v17)
    {
      uint64_t v19 = (void *)MEMORY[0x1D944CB30]();
      id v20 = *(id *)(a1 + 40);
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = HMFGetLogIdentifier();
        id v23 = [v4 hmbDescription];
        *(_DWORD *)buf = 138543874;
        uint64_t v36 = v22;
        __int16 v37 = 2112;
        uint64_t v38 = (uint64_t)v23;
        __int16 v39 = 2112;
        id v40 = v18;
        _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to generate externalData from %@: %@", buf, 0x20u);
      }
    }
    id v24 = *(void **)(a1 + 48);
    id v25 = [v4 recordID];
    id v26 = [v24 objectForKey:v25];

    if (v26)
    {
      id v27 = objc_msgSend(*(id *)(a1 + 56), "setExternalID:externalData:forRecordRow:", v9, v17, objc_msgSend(v26, "recordRow"));

      if (v27)
      {
        __int16 v28 = (void *)MEMORY[0x1D944CB30]();
        id v29 = *(id *)(a1 + 40);
        uint64_t v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          id v31 = HMFGetLogIdentifier();
          uint64_t v32 = [v26 recordRow];
          *(_DWORD *)buf = 138543874;
          uint64_t v36 = v31;
          __int16 v37 = 2048;
          uint64_t v38 = v32;
          __int16 v39 = 2112;
          id v40 = v27;
          _os_log_impl(&dword_1D4693000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unable to reset externalID and externalData for %lu: %@", buf, 0x20u);
        }
      }
    }
    else
    {
      id v27 = v18;
    }
  }
}

uint64_t ____pushChunk_block_invoke_238(void *a1)
{
  return __pushChunk(a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10]);
}

void ____checkLockAcquire_block_invoke_181(uint64_t a1)
{
}

void ____checkLockAcquire_block_invoke_2_188(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = [*(id *)(a1 + 32) cloudZone];
    int v6 = [v5 cloudZoneID];
    id v7 = (id)[WeakRetained removePrivateZoneWithID:v6];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D944CB30]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v11;
      _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_ERROR, "%{public}@Lost cloudDatabase for cloud zone rebuild", (uint8_t *)&v12, 0xCu);
    }
  }
}

void __lockAcquire(void *a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = (void *)MEMORY[0x1D944CB30]();
  id v3 = v1;
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v31 = v5;
    _os_log_impl(&dword_1D4693000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting to acquire lock.", buf, 0xCu);
  }
  int v6 = [v3 cloudZone];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 cloudDatabase];
    if (v8)
    {
      id v9 = (void *)MEMORY[0x1E4F7A0D8];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = ____lockAcquire_block_invoke;
      v27[3] = &unk_1E69EA378;
      id v10 = v3;
      id v28 = v10;
      id v11 = [v7 operationScheduler];
      int v12 = [v9 lazyFutureWithBlock:v27 scheduler:v11];

      id v13 = [v7 cloudZoneID];
      uint64_t v14 = [v8 removePrivateZoneWithID:v13];
      v29[0] = v14;
      id v15 = [v7 cloudZoneID];
      id v16 = [v8 createPrivateZoneWithID:v15];
      v29[1] = v16;
      v29[2] = v12;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];

      id v18 = [MEMORY[0x1E4F7A0D8] chainFutures:v17];
      objc_initWeak((id *)buf, v10);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = ____lockAcquire_block_invoke_2;
      v25[3] = &unk_1E69E9F68;
      objc_copyWeak(&v26, (id *)buf);
      id v19 = (id)[v18 addSuccessBlock:v25];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = ____lockAcquire_block_invoke_3;
      v23[3] = &unk_1E69E9F40;
      objc_copyWeak(&v24, (id *)buf);
      id v20 = (id)[v18 addFailureBlock:v23];
      objc_destroyWeak(&v24);
      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      id v22 = (id)__transitionToState(v3, 2, @"Lost pointer to cloudDatabase");
    }
  }
  else
  {
    id v21 = (id)__transitionToState(v3, 2, @"Lost pointer to cloudZone");
  }
}

void sub_1D46C4634(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 128));
  _Unwind_Resume(a1);
}

void ____lockAcquire_block_invoke(uint64_t a1, void *a2)
{
}

void ____lockAcquire_block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)__transitionToState(WeakRetained, 6, @"Acquired zone lock for rebuild.");
}

void ____lockAcquire_block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = (id)__transitionToState(WeakRetained, 2, @"Failed to acquire lock due to sentinel model push failure: %@");
}

void __pushSentinelModel(void *a1, uint64_t a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a3;
  id v7 = [v5 cloudZone];
  if (v7)
  {
    id v31 = 0;
    id v8 = __updatedSentinelRecord(v5, 0, a2, &v31);
    id v9 = v31;
    id v10 = (void *)MEMORY[0x1D944CB30]();
    id v11 = v5;
    int v12 = HMFGetOSLogHandle();
    id v13 = v12;
    if (v8)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        id v15 = [v8 hmbDescription];
        *(_DWORD *)buf = 138543618;
        id v34 = v14;
        __int16 v35 = 2112;
        uint64_t v36 = v15;
        _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_INFO, "%{public}@Pushing sentinel record: %@", buf, 0x16u);
      }
      uint64_t v32 = v8;
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
      id v17 = [v7 pushRecordsToUpdate:v16 recordIDsToRemove:MEMORY[0x1E4F1CBF0] configuration:0 rollbackEnabled:1];

      id v18 = [v6 errorOnlyCompletionHandlerAdapter];
      id v19 = (id)[v17 addFailureBlock:v18];

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = ____pushSentinelModel_block_invoke;
      v27[3] = &unk_1E69E9F90;
      id v28 = v11;
      id v29 = v6;
      id v30 = v7;
      id v20 = (id)[v17 addSuccessBlock:v27];
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v25 = HMFGetLogIdentifier();
        id v26 = [v7 zoneID];
        *(_DWORD *)buf = 138543874;
        id v34 = v25;
        __int16 v35 = 2112;
        uint64_t v36 = v26;
        __int16 v37 = 2112;
        id v38 = v9;
        _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to create sentinel model for %@: %@", buf, 0x20u);
      }
      [v6 finishWithError:v9];
    }
  }
  else
  {
    id v21 = (void *)MEMORY[0x1D944CB30]();
    id v22 = v5;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v34 = v24;
      __int16 v35 = 2112;
      uint64_t v36 = @"cloudZone";
      _os_log_impl(&dword_1D4693000, v23, OS_LOG_TYPE_ERROR, "%{public}@Lost %@", buf, 0x16u);
    }
    id v9 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    [v6 finishWithError:v9];
  }
}

void ____pushSentinelModel_block_invoke(id *a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  id v4 = [(__CFString *)v3 fatalError];
  if (([v4 hmbIsCloudKitError] & 1) == 0)
  {

LABEL_7:
    id v13 = [a1[4] cloudZone];
    if (!v13)
    {
      id v27 = (void *)MEMORY[0x1D944CB30]();
      id v28 = a1[4];
      id v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        id v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v53 = v30;
        __int16 v54 = 2112;
        __int16 v55 = @"localCloudZone";
        _os_log_impl(&dword_1D4693000, v29, OS_LOG_TYPE_ERROR, "%{public}@Lost %@", buf, 0x16u);
      }
      id v31 = a1[5];
      id v20 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
      [v31 finishWithError:v20];
      goto LABEL_34;
    }
    uint64_t v14 = [(__CFString *)v3 conflicts];
    id v15 = [v14 anyObject];

    if (v15)
    {
      id v16 = (void *)MEMORY[0x1D944CB30]();
      id v17 = a1[4];
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v53 = v19;
        _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Sentinel record already exists on the server. Returning server version.", buf, 0xCu);
      }
      id v20 = [v15 serverRecord];
      uint64_t v21 = 0;
      if (v20) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v32 = [(__CFString *)v3 updatedRecords];
      uint64_t v21 = [v32 anyObject];

      id v20 = (void *)v21;
      if (v21)
      {
LABEL_12:
        id v51 = 0;
        id v50 = [v13 decodeModelFromRecord:v20 externalRecordFields:0 source:4 error:&v51];
        id v22 = (__CFString *)v51;
        if (v22)
        {
          id v23 = (void *)MEMORY[0x1D944CB30]();
          id v24 = a1[4];
          id v25 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            id v26 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            __int16 v53 = v26;
            __int16 v54 = 2112;
            __int16 v55 = v22;
            _os_log_impl(&dword_1D4693000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode model from CK Record: %@", buf, 0x16u);
          }
          [a1[5] finishWithError:v22];
        }
        else
        {
          id v38 = v50;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v39 = v38;
          }
          else {
            uint64_t v39 = 0;
          }
          id v40 = v39;

          if (v40)
          {
            [a1[6] handleUpdatedRebuilderModel:v40];
            uint64_t v41 = (os_unfair_lock_s *)((char *)a1[4] + 8);
            os_unfair_lock_lock_with_options();
            [a1[4] setPreviousSentinelRebuildRecord:v21];
            os_unfair_lock_unlock(v41);
            [a1[5] finishWithResult:v40];
          }
          else
          {
            context = (void *)MEMORY[0x1D944CB30]();
            id v42 = a1[4];
            id v43 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              id v48 = HMFGetLogIdentifier();
              id v44 = (objc_class *)objc_opt_class();
              NSStringFromClass(v44);
              id v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              __int16 v53 = v48;
              __int16 v54 = 2112;
              __int16 v55 = v45;
              _os_log_impl(&dword_1D4693000, v43, OS_LOG_TYPE_ERROR, "%{public}@Record was not expected type (got %@)", buf, 0x16u);
            }
            id v46 = a1[5];
            id v47 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
            [v46 finishWithError:v47];
          }
        }

LABEL_33:
LABEL_34:

        goto LABEL_35;
      }
    }
    id v33 = (void *)MEMORY[0x1D944CB30]();
    id v34 = a1[4];
    __int16 v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v53 = v36;
      __int16 v54 = 2112;
      __int16 v55 = v3;
      _os_log_impl(&dword_1D4693000, v35, OS_LOG_TYPE_ERROR, "%{public}@Unable to find appropriate error for sentinel record push result: %@", buf, 0x16u);
    }
    id v37 = a1[5];
    id v22 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    [v37 finishWithError:v22];
    goto LABEL_33;
  }
  id v5 = [(__CFString *)v3 fatalError];
  uint64_t v6 = [v5 code];

  if (v6 != 1) {
    goto LABEL_7;
  }
  id v7 = (void *)MEMORY[0x1D944CB30]();
  id v8 = a1[4];
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = [(__CFString *)v3 fatalError];
    *(_DWORD *)buf = 138543618;
    __int16 v53 = v10;
    __int16 v54 = 2112;
    __int16 v55 = v11;
    _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_ERROR, "%{public}@Sentinel model push failed with fatal error: %@", buf, 0x16u);
  }
  id v12 = a1[5];
  id v13 = [(__CFString *)v3 fatalError];
  [v12 finishWithError:v13];
LABEL_35:
}

void sub_1D46C5174(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ____checkLockAcquire_block_invoke_174(uint64_t a1)
{
}

void ____fetchSentinelModel_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 errorOnlyCompletionHandlerAdapter];
  id v6 = (id)[v4 addFailureBlock:v5];

  id v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ____fetchSentinelModel_block_invoke_2;
  v10[3] = &unk_1E69EA058;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  id v8 = v3;
  id v11 = v8;
  id v9 = (id)[v7 addSuccessBlock:v10];

  objc_destroyWeak(&v12);
}

void sub_1D46C5284(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void ____fetchSentinelModel_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained cloudZone];
    id v7 = v6;
    if (v6)
    {
      id v34 = 0;
      id v8 = [v6 decodeModelFromRecord:v3 externalRecordFields:0 source:4 error:&v34];
      id v9 = v34;
      if (v9)
      {
        id v10 = (void *)MEMORY[0x1D944CB30]();
        id v11 = v5;
        id v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          id v13 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v36 = v13;
          __int16 v37 = 2112;
          id v38 = v9;
          _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode model from CK Record: %@", buf, 0x16u);
        }
        [*(id *)(a1 + 32) finishWithError:v9];
      }
      else
      {
        id v23 = v8;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v24 = v23;
        }
        else {
          id v24 = 0;
        }
        id v25 = v24;

        if (!v25)
        {
          context = (void *)MEMORY[0x1D944CB30]();
          id v26 = v5;
          id v27 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            uint64_t v32 = HMFGetLogIdentifier();
            id v28 = (objc_class *)objc_opt_class();
            id v29 = NSStringFromClass(v28);
            *(_DWORD *)buf = 138543618;
            uint64_t v36 = v32;
            __int16 v37 = 2112;
            id v38 = v29;
            _os_log_impl(&dword_1D4693000, v27, OS_LOG_TYPE_ERROR, "%{public}@Record was not expected type (got %@)", buf, 0x16u);
          }
          id v30 = *(void **)(a1 + 32);
          id v31 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
          [v30 finishWithError:v31];
        }
        [v5 setPreviousSentinelRebuildRecord:v3];
        [*(id *)(a1 + 32) finishWithResult:v25];
      }
    }
    else
    {
      id v18 = (void *)MEMORY[0x1D944CB30]();
      id v19 = v5;
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v36 = v21;
        _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_ERROR, "%{public}@Lost cloudZone for cloud zone rebuild", buf, 0xCu);
      }
      id v22 = *(void **)(a1 + 32);
      id v9 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
      [v22 finishWithError:v9];
    }
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1D944CB30]();
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = v16;
      _os_log_impl(&dword_1D4693000, v15, OS_LOG_TYPE_ERROR, "%{public}@Lost self for cloud zone rebuild", buf, 0xCu);
    }
    id v17 = *(void **)(a1 + 32);
    id v7 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    [v17 finishWithError:v7];
  }
}

void sub_1D46C58F8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46C61C8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46C6368(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46C64B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id __processSentinelModel(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 hasCompleted];
  char v5 = [v4 BOOLValue];

  if (v5)
  {
    id v11 = @"Startup with completed sentinel model.";
    id v12 = v3;
    uint64_t v13 = 7;
  }
  else
  {
    uint64_t v14 = [v3 cloudZone];
    id v15 = [v14 configuration];
    int v16 = [v15 shouldRebuildOnManateeKeyLoss];

    id v11 = @"Startup with missing manatee key.";
    id v12 = v3;
    if (v16) {
      uint64_t v13 = 4;
    }
    else {
      uint64_t v13 = 1;
    }
  }
  id v17 = __transitionToState(v12, (void *)v13, v11, v6, v7, v8, v9, v10, v19);

  return v17;
}

void ____startUp_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __processSentinelModel(*(void **)(a1 + 32), v3);
  char v5 = (void *)MEMORY[0x1D944CB30]();
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v11 = 138543618;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched sentinel model: %@.", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = [*(id *)(a1 + 40) completionHandlerAdapter];
  id v10 = (id)[v4 addCompletionBlock:v9];
}

void ____startUp_block_invoke_248(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    *(_DWORD *)id v23 = 138543618;
    *(void *)&void v23[4] = v7;
    __int16 v24 = 2112;
    id v25 = v3;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_ERROR, "%{public}@Sentinel model push failed: %@.", v23, 0x16u);
  }
  int v13 = [v3 hmbIsCKMissingManateeIdentityError];
  id v14 = *(void **)(a1 + 32);
  if (v13)
  {
    uint64_t v15 = [v14 cloudZone];
    int v16 = [v15 configuration];
    int v17 = [v16 shouldRebuildOnManateeKeyLoss];

    id v14 = *(void **)(a1 + 32);
    if (v17)
    {
      id v18 = @"Came up in Manatee Key Loss. Going to try to blow things away and fix them.";
      uint64_t v19 = 4;
    }
    else
    {
      id v18 = @"Don't have keys, waiting for someone else to rebuild the zone.";
      uint64_t v19 = 1;
    }
  }
  else
  {
    id v18 = @"Unable to push sentinel model due to some other issue. Letting startup continue normally.";
    uint64_t v19 = 7;
  }
  id v20 = __transitionToState(v14, (void *)v19, v18, v8, v9, v10, v11, v12, *(uint64_t *)v23);
  uint64_t v21 = [*(id *)(a1 + 40) completionHandlerAdapter];
  id v22 = (id)[v20 addCompletionBlock:v21];
}

void sub_1D46C9444(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46C9674(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46CBB84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D46CC1BC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46CC624(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46CC938(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46CD7F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, os_unfair_lock_t lock, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t __Block_byref_object_copy__3371(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3372(uint64_t a1)
{
}

id ____fetchStoreInfo_block_invoke(uint64_t a1, void *a2)
{
  id v8 = 0;
  uint64_t v3 = [a2 _fetchAllZones:&v8];
  id v4 = v8;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  return v4;
}

id ____createZone_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  uint64_t v5 = [v3 token];
  id v6 = [*(id *)(a1 + 40) name];
  id v10 = 0;
  uint64_t v7 = [v4 _insertZoneWithIdentification:v5 name:v6 error:&v10];

  id v8 = v10;
  [*(id *)(a1 + 32) setZoneRow:v7];

  return v8;
}

void sub_1D46CDC78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D46CEFC8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46CF0DC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46D04D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
}

void sub_1D46D2264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_unfair_lock_t lock)
{
}

void sub_1D46D2D14(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46D3228(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46D3520(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __waitForAccountAvailability(void *a1)
{
  id v1 = a1;
  objc_initWeak(&location, v1);
  uint64_t v2 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  objc_copyWeak(&v7, &location);
  uint64_t v3 = objc_msgSend(v1, "operationScheduler", v6, 3221225472, ____waitForAccountAvailability_block_invoke, &unk_1E69EA2B0);
  id v4 = [v2 lazyFutureWithBlock:&v6 scheduler:v3];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void sub_1D46D363C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____waitForAccountAvailability_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained credentialsAvailabilityListener];
  uint64_t v5 = [v4 waitForAccountAvailability];
  uint64_t v6 = [v3 completionHandlerAdapter];

  id v7 = (id)[v5 addCompletionBlock:v6];
}

id __synchronizeZoneStateForZoneIDs(void *a1, void *a2, void *a3, char a4)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  os_unfair_lock_lock_with_options();
  id v10 = [v9 lastAdministrativeFetch];
  uint64_t v11 = [v9 database];
  uint64_t v12 = [v9 cloudID];
  int v13 = [v9 hmbModelID];
  os_unfair_lock_unlock(v7 + 2);
  if ((a4 & 1) != 0 || (uint64_t v14 = [v10 timeIntervalSinceNow], v15 < -604800.0))
  {
    int v16 = (void *)MEMORY[0x1E4F7A0D8];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = ____synchronizeZoneStateForZoneIDs_block_invoke;
    v25[3] = &unk_1E69EA490;
    id v26 = v8;
    id v27 = v7;
    id v28 = v12;
    id v29 = v11;
    id v30 = v13;
    id v31 = v9;
    int v17 = [(os_unfair_lock_s *)v27 operationScheduler];
    id v18 = [v16 lazyFutureWithBlock:v25 scheduler:v17];
  }
  else
  {
    context = (void *)MEMORY[0x1D944CB30](v14);
    uint64_t v19 = v7;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = HMFGetLogIdentifier();
      uint64_t v21 = HMFBooleanToString();
      *(_DWORD *)buf = 138544130;
      id v33 = v23;
      __int16 v34 = 2114;
      __int16 v35 = v12;
      __int16 v36 = 2114;
      __int16 v37 = v21;
      __int16 v38 = 2114;
      uint64_t v39 = v10;
      _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Not synchronizing zone state for %{public}@ because force=%{public}@ and last administrative fetch was %{public}@", buf, 0x2Au);
    }
    id v18 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v18;
}

void sub_1D46D3CCC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ____synchronizeZoneStateForZoneIDs_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v41 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v4 = [NSString stringWithUTF8String:"__synchronizeZoneStateForZoneIDs_block_invoke"];
  uint64_t v5 = (void *)[v3 initWithName:v4];

  BOOL v6 = *(void *)(a1 + 32) == 0;
  id v7 = (void *)MEMORY[0x1D944CB30]();
  id v8 = *(id *)(a1 + 40);
  id v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v10)
    {
      double v15 = HMFGetLogIdentifier();
      int v16 = [v5 identifier];
      int v17 = [v16 shortDescription];
      id v18 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v56 = v15;
      __int16 v57 = 2114;
      id v58 = v17;
      __int16 v59 = 2112;
      id v60 = v18;
      _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Synchronizing zone state for all zone IDs in database: %@", buf, 0x20u);
    }
  }
  else if (v10)
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = [v5 identifier];
    int v13 = [v12 shortDescription];
    uint64_t v14 = [*(id *)(a1 + 32) hmbDescription];
    *(_DWORD *)buf = 138543874;
    uint64_t v56 = v11;
    __int16 v57 = 2114;
    id v58 = v13;
    __int16 v59 = 2112;
    id v60 = v14;
    _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Synchronizing zone state for zone IDs: %@", buf, 0x20u);
  }
  uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
  id v20 = (os_unfair_lock_s *)(*(void *)(a1 + 40) + 8);
  os_unfair_lock_lock_with_options();
  uint64_t v21 = [*(id *)(a1 + 40) zoneStateByZoneID];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = ____synchronizeZoneStateForZoneIDs_block_invoke_327;
  v50[3] = &unk_1E69EA3A0;
  id v51 = *(id *)(a1 + 32);
  id v52 = *(id *)(a1 + 48);
  id v22 = v19;
  id v53 = v22;
  [v21 enumerateKeysAndObjectsUsingBlock:v50];

  os_unfair_lock_unlock(v20);
  id v23 = (void *)MEMORY[0x1D944CB30]();
  id v24 = *(id *)(a1 + 40);
  id v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    id v26 = HMFGetLogIdentifier();
    id v27 = [v5 identifier];
    id v28 = [v27 shortDescription];
    *(_DWORD *)buf = 138543874;
    uint64_t v56 = v26;
    __int16 v57 = 2114;
    id v58 = v28;
    __int16 v59 = 2112;
    id v60 = v22;
    _os_log_impl(&dword_1D4693000, v25, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Created pre-fetch mapping of zone state by zone ID: %@", buf, 0x20u);
  }
  id v29 = [*(id *)(a1 + 40) fetchZonesWithIDs:*(void *)(a1 + 32) inDatabase:*(void *)(a1 + 56)];
  id v30 = [*(id *)(a1 + 40) fetchSubscriptionsInDatabase:*(void *)(a1 + 56)];
  id v31 = (void *)MEMORY[0x1E4F7A0D8];
  v54[0] = v29;
  v54[1] = v30;
  uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
  id v33 = [v31 chainFutures:v32];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = ____synchronizeZoneStateForZoneIDs_block_invoke_328;
  v42[3] = &unk_1E69EA468;
  id v43 = *(id *)(a1 + 40);
  id v44 = v5;
  id v45 = v29;
  id v46 = *(id *)(a1 + 64);
  id v47 = v30;
  id v48 = *(id *)(a1 + 72);
  id v49 = v22;
  id v34 = v22;
  id v35 = v30;
  id v36 = v29;
  id v37 = v5;
  __int16 v38 = [v33 addSuccessBlock:v42];

  uint64_t v39 = [v41 completionHandlerAdapter];
  id v40 = (id)[v38 addCompletionBlock:v39];
}

void sub_1D46D426C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ____synchronizeZoneStateForZoneIDs_block_invoke_327(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  BOOL v6 = *(void **)(a1 + 32);
  if (!v6 || [v6 containsObject:v11])
  {
    id v7 = (void *)[v5 copy];
    uint64_t v8 = [v11 scope];
    if (v8 == [*(id *)(a1 + 40) scope])
    {
      id v9 = [v7 needsZoneCreation];
      char v10 = [v9 BOOLValue];

      if ((v10 & 1) == 0) {
        [*(id *)(a1 + 48) setObject:v7 forKeyedSubscript:v11];
      }
    }
  }
}

void ____synchronizeZoneStateForZoneIDs_block_invoke_328(uint64_t a1, void *a2)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v46 = a2;
  id v3 = (void *)MEMORY[0x1D944CB30]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = HMFGetLogIdentifier();
    id v7 = [*(id *)(a1 + 40) identifier];
    uint64_t v8 = [v7 shortDescription];
    *(_DWORD *)buf = 138543618;
    id v70 = v6;
    __int16 v71 = 2114;
    id v72 = v8;
    _os_log_impl(&dword_1D4693000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Processing fetched zones and subscriptions for zone state synchronization", buf, 0x16u);
  }
  id v9 = [MEMORY[0x1E4F1CA48] array];
  char v10 = [MEMORY[0x1E4F1CA48] array];
  id v11 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  int v13 = [MEMORY[0x1E4F1CA60] dictionary];
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = ____synchronizeZoneStateForZoneIDs_block_invoke_329;
  v65[3] = &unk_1E69EA3C8;
  uint64_t v14 = *(void **)(a1 + 48);
  id v66 = *(id *)(a1 + 56);
  id v15 = v13;
  id v67 = v15;
  id v16 = (id)[v14 addSuccessBlock:v65];
  int v17 = *(void **)(a1 + 32);
  id v18 = *(void **)(a1 + 64);
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = ____synchronizeZoneStateForZoneIDs_block_invoke_2;
  v61[3] = &unk_1E69EA3F0;
  id v62 = v17;
  id v63 = *(id *)(a1 + 72);
  id v19 = v15;
  id v64 = v19;
  id v20 = (id)[v18 addSuccessBlock:v61];
  uint64_t v21 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  id v22 = *(void **)(a1 + 80);
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = ____synchronizeZoneStateForZoneIDs_block_invoke_3;
  v55[3] = &unk_1E69EA418;
  id v23 = v19;
  id v56 = v23;
  id v57 = *(id *)(a1 + 32);
  id v58 = *(id *)(a1 + 40);
  id v24 = v10;
  id v59 = v24;
  id v47 = v12;
  id v60 = v47;
  [v22 enumerateKeysAndObjectsUsingBlock:v55];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = ____synchronizeZoneStateForZoneIDs_block_invoke_331;
  v50[3] = &unk_1E69EA440;
  id v51 = *(id *)(a1 + 32);
  id v52 = *(id *)(a1 + 40);
  id v49 = v11;
  id v53 = v49;
  id v48 = v9;
  id v54 = v48;
  [v23 enumerateKeysAndObjectsUsingBlock:v50];
  id v45 = v23;
  id v25 = [*(id *)(a1 + 32) stateZone];
  id v26 = v24;
  id v27 = [v25 update:v49];

  if (v27)
  {
    id v28 = (void *)MEMORY[0x1D944CB30]();
    id v29 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = [*(id *)(a1 + 40) identifier];
      id v33 = [v32 shortDescription];
      *(_DWORD *)buf = 138544130;
      id v70 = v31;
      __int16 v71 = 2114;
      id v72 = v33;
      __int16 v73 = 2112;
      id v74 = v49;
      __int16 v75 = 2112;
      id v76 = v27;
      _os_log_impl(&dword_1D4693000, v30, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to update zone models in local DB %@: %@", buf, 0x2Au);

      id v26 = v24;
    }
  }

  os_unfair_lock_unlock(v21);
  [*(id *)(a1 + 32) handleRemovedZoneIDs:v26 userInitiated:0];
  [*(id *)(a1 + 32) handleCreatedZoneIDs:v48];
  id v34 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  id v35 = [MEMORY[0x1E4F1C9C8] date];
  [*(id *)(a1 + 72) setLastAdministrativeFetch:v35];

  id v36 = [*(id *)(a1 + 32) stateZone];
  uint64_t v68 = *(void *)(a1 + 72);
  id v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
  __int16 v38 = [v36 update:v37 remove:v47];

  if (v38)
  {
    uint64_t v39 = (void *)MEMORY[0x1D944CB30]();
    id v40 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      id v43 = [*(id *)(a1 + 40) identifier];
      id v44 = [v43 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v70 = v42;
      __int16 v71 = 2114;
      id v72 = v44;
      __int16 v73 = 2112;
      id v74 = v38;
      _os_log_impl(&dword_1D4693000, v41, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to update database state for zone state synchronization: %@", buf, 0x20u);
    }
  }

  os_unfair_lock_unlock(v34);
}

void sub_1D46D4A4C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ____synchronizeZoneStateForZoneIDs_block_invoke_329(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  id v5 = v3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ____processZones_block_invoke;
  v8[3] = &unk_1E69EA350;
  id v9 = v4;
  id v10 = v5;
  id v6 = v4;
  id v7 = v5;
  [a2 enumerateObjectsUsingBlock:v8];
}

void ____synchronizeZoneStateForZoneIDs_block_invoke_2(void *a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)a1[4];
  id v5 = (void *)a1[5];
  id v6 = (void *)a1[6];
  id v7 = v4;
  id v8 = v5;
  id v9 = v3;
  id v38 = v6;
  id v43 = v7;
  os_unfair_lock_lock_with_options();
  id v37 = v8;
  id v44 = [v8 cloudID];
  os_unfair_lock_unlock(v7 + 2);
  uint64_t v39 = [MEMORY[0x1E4F1CA80] set];
  id v42 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v46;
    uint64_t v40 = *MEMORY[0x1E4F19C08];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(id *)(*((void *)&v45 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v14 = v13;
        }
        else {
          uint64_t v14 = 0;
        }
        id v15 = v14;

        if (v15)
        {
          if ([v44 scope] == 3
            && ([v15 zoneID],
                id v16 = objc_claimAutoreleasedReturnValue(),
                [v16 ownerName],
                int v17 = objc_claimAutoreleasedReturnValue(),
                int v18 = [v17 isEqualToString:v40],
                v17,
                v16,
                v18))
          {
            id v19 = (void *)MEMORY[0x1D944CB30]();
            id v20 = v43;
            uint64_t v21 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              id v22 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v22;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v15;
              _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring unexpected subscription on shared zone: %@", buf, 0x16u);
            }
          }
          else
          {
            id v23 = [HMBCloudZoneID alloc];
            id v24 = [(os_unfair_lock_s *)v43 containerID];
            uint64_t v25 = [v44 scope];
            id v26 = [v15 zoneID];
            id v27 = [(HMBCloudZoneID *)v23 initWithContainerID:v24 scope:v25 zoneID:v26];

            id v28 = [v42 objectForKeyedSubscript:v27];
            if (!v28)
            {
              id v28 = [MEMORY[0x1E4F1CA80] set];
              [v42 setObject:v28 forKeyedSubscript:v27];
            }
            [v28 addObject:v15];
          }
        }
        else
        {
          id v29 = v13;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v30 = v29;
          }
          else {
            id v30 = 0;
          }
          id v31 = v30;

          if (v31)
          {
            [v39 addObject:v31];
          }
          else
          {
            uint64_t v32 = (void *)MEMORY[0x1D944CB30]();
            id v33 = v43;
            id v34 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              id v35 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v35;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v29;
              _os_log_impl(&dword_1D4693000, v34, OS_LOG_TYPE_ERROR, "%{public}@Got unexpected subscription %@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v10);
  }

  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = ____processSubscriptions_block_invoke;
  id v50 = &unk_1E69EA328;
  id v36 = v42;
  id v51 = v36;
  [v38 enumerateKeysAndObjectsUsingBlock:buf];
  os_unfair_lock_lock_with_options();
  [v37 setSubscriptions:v39];
  os_unfair_lock_unlock(v43 + 2);
}

void sub_1D46D5060(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ____synchronizeZoneStateForZoneIDs_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (!v7)
  {
    id v8 = (void *)MEMORY[0x1D944CB30]();
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = [*(id *)(a1 + 48) identifier];
      id v13 = [v12 shortDescription];
      int v19 = 138543874;
      id v20 = v11;
      __int16 v21 = 2114;
      id v22 = v13;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Zone was deleted with ID: %@", (uint8_t *)&v19, 0x20u);
    }
    uint64_t v14 = *(void **)(a1 + 56);
    id v15 = [v6 zoneID];
    [v14 addObject:v15];

    id v16 = *(void **)(a1 + 64);
    int v17 = [v6 hmbModelID];
    [v16 addObject:v17];

    int v18 = [*(id *)(a1 + 40) zoneStateByZoneID];
    [v18 removeObjectForKey:v5];
  }
}

void ____synchronizeZoneStateForZoneIDs_block_invoke_331(id *a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] zoneStateByZoneID];
  id v8 = [v7 objectForKeyedSubscript:v5];

  if (v8)
  {
    id v9 = [v8 subscriptions];
    uint64_t v10 = [v6 subscriptions];
    char v11 = HMFEqualObjects();

    if ((v11 & 1) == 0)
    {
      uint64_t v12 = (void *)MEMORY[0x1D944CB30]();
      id v13 = a1[4];
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = HMFGetLogIdentifier();
        id v29 = [a1[5] identifier];
        id v16 = [v29 shortDescription];
        [v6 subscriptions];
        id v28 = v30 = v12;
        int v17 = [v28 hmbDescription];
        id v27 = [v8 subscriptions];
        int v18 = [v27 hmbDescription];
        *(_DWORD *)buf = 138544386;
        uint64_t v32 = v15;
        __int16 v33 = 2114;
        id v34 = v16;
        __int16 v35 = 2112;
        id v36 = v5;
        __int16 v37 = 2112;
        id v38 = v17;
        __int16 v39 = 2112;
        uint64_t v40 = v18;
        _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Updating subscriptions for zone ID %@ from %@ to %@", buf, 0x34u);

        uint64_t v12 = v30;
      }

      int v19 = [v6 subscriptions];
      [v8 setSubscriptions:v19];

      [a1[6] addObject:v8];
    }
  }
  else
  {
    id v20 = (void *)MEMORY[0x1D944CB30]();
    id v21 = a1[4];
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = HMFGetLogIdentifier();
      id v24 = [a1[5] identifier];
      uint64_t v25 = [v24 shortDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v32 = v23;
      __int16 v33 = 2114;
      id v34 = v25;
      __int16 v35 = 2112;
      id v36 = v5;
      _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Zone was created with ID: %@", buf, 0x20u);
    }
    [a1[7] addObject:v5];
    [a1[6] addObject:v6];
    id v26 = [a1[4] zoneStateByZoneID];
    [v26 setObject:v6 forKey:v5];
  }
}

void ____processSubscriptions_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v5)
  {
    [v7 setSubscriptions:v5];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
    [v7 setSubscriptions:v6];
  }
}

void ____processZones_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [HMBCloudZoneStateModel alloc];
  id v5 = [v3 modelID];
  id v6 = [(HMBCloudZoneStateModel *)v4 initWithModelID:v5 parentModelID:*(void *)(a1 + 32)];

  [(HMBCloudZoneStateModel *)v6 setZoneID:v3];
  [*(id *)(a1 + 40) setObject:v6 forKey:v3];
}

void sub_1D46D5914(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D46D5A1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void ____synchronizeAllZoneState_block_invoke(uint64_t a1, void *a2)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v4 privateDatabaseState];
  id v6 = __synchronizeZoneStateForZoneIDs(v4, 0, v5, *(unsigned char *)(a1 + 40));
  v18[0] = v6;
  id v7 = *(void **)(a1 + 32);
  id v8 = [v7 sharedDatabaseState];
  id v9 = __synchronizeZoneStateForZoneIDs(v7, 0, v8, *(unsigned char *)(a1 + 40));
  v18[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];

  char v11 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v12 = [*(id *)(a1 + 32) operationScheduler];
  id v13 = [v11 combineAllFutures:v10 scheduler:v12];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = ____synchronizeAllZoneState_block_invoke_2;
  v16[3] = &unk_1E69EA2D8;
  id v17 = v3;
  id v14 = v3;
  id v15 = (id)[v13 addCompletionBlock:v16];
}

void ____removeDeletedZones_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA80] set];
  id v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  id v6 = [*(id *)(a1 + 32) zoneStateByZoneID];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ____removeDeletedZones_block_invoke_2;
  v12[3] = &unk_1E69EA328;
  id v7 = v4;
  id v13 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];

  os_unfair_lock_unlock(v5);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ____removeDeletedZones_block_invoke_3;
  v9[3] = &unk_1E69EA350;
  id v10 = *(id *)(a1 + 32);
  id v11 = v3;
  id v8 = v3;
  [v7 enumerateObjectsUsingBlock:v9];
  [v8 finishWithNoResult];
}

void sub_1D46D6450(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ____removeDeletedZones_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id v4 = [v8 needsZoneDeletion];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v8 zoneID];
    [v6 addObject:v7];
  }
}

void ____removeDeletedZones_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_INFO, "%{public}@Found zone ID that needs deletion: %@", (uint8_t *)&v11, 0x16u);
  }
  id v8 = [*(id *)(a1 + 32) removeZoneWithID:v3];
  id v9 = [*(id *)(a1 + 40) completionHandlerAdapter];
  id v10 = (id)[v8 addCompletionBlock:v9];
}

uint64_t ____synchronizeAllZoneState_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithNoResult];
  }
  else {
    return objc_msgSend(v2, "finishWithError:");
  }
}

void sub_1D46D6B04(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __modifyRecordZoneOperation(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v35 = a1;
  id v36 = a2;
  unint64_t v11 = a3;
  unint64_t v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = v14;
  __int16 v37 = (void *)v12;
  id v38 = (void *)v11;
  if (v11 | v12)
  {
    id v34 = v14;
    id v16 = v35;
    if (!v13)
    {
      id v17 = objc_alloc(MEMORY[0x1E4F653F0]);
      int v18 = [NSString stringWithUTF8String:"__modifyRecordZoneOperation"];
      id v13 = (id)[v17 initWithName:v18];
    }
    id v19 = objc_alloc_init(MEMORY[0x1E4F1A180]);
    id v20 = [v35 operationConfigurationWithProcessingOptions:0];
    [v19 setConfiguration:v20];

    if (v38)
    {
      v60[0] = v38;
      id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:1];
      [v19 setRecordZonesToSave:v21];
    }
    if (v12)
    {
      unint64_t v59 = v12;
      id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
      [v19 setRecordZoneIDsToDelete:v22];
    }
    objc_initWeak(&location, v35);
    objc_initWeak(&from, v19);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = ____modifyRecordZoneOperation_block_invoke;
    v39[3] = &unk_1E69EA5C8;
    id v31 = &v45;
    objc_copyWeak(&v45, &location);
    id v13 = v13;
    id v40 = v13;
    objc_copyWeak(&v46, &from);
    id v41 = v34;
    id v33 = v36;
    id v42 = v33;
    id v23 = v38;
    id v43 = v23;
    id v24 = (id)v12;
    id v44 = v24;
    context = (void *)MEMORY[0x1D944CB30]([v19 setModifyRecordZonesCompletionBlock:v39]);
    id v25 = v35;
    HMFGetOSLogHandle();
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      id v28 = objc_msgSend(v13, "identifier", &v45, context);
      id v29 = [v28 shortDescription];
      id v30 = [v19 operationID];
      *(_DWORD *)buf = 138544386;
      id v50 = v27;
      __int16 v51 = 2114;
      id v52 = v29;
      __int16 v53 = 2112;
      id v54 = v23;
      __int16 v55 = 2112;
      id v56 = v24;
      __int16 v57 = 2114;
      id v58 = v30;
      _os_log_impl(&dword_1D4693000, v26, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Starting CKModifyRecordZonesOperation with zoneToSave: %@ zoneIDToRemove: %@ operationID: %{public}@", buf, 0x34u);

      id v16 = v35;
    }

    [v33 addOperation:v19];

    objc_destroyWeak(&v46);
    objc_destroyWeak(v31);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    uint64_t v15 = v34;
  }
  else
  {
    [v14 finishWithNoResult];
    id v16 = v35;
  }
}

void sub_1D46D8488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29,id a30)
{
}

void ____modifyRecordZoneOperation_block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v38 = a2;
  id v39 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 9);
  if (v7)
  {
    id v9 = (void *)MEMORY[0x1D944CB30]();
    id v10 = WeakRetained;
    unint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v12 = HMFGetLogIdentifier();
      id v13 = [a1[4] identifier];
      id v14 = [v13 shortDescription];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2114;
      id v59 = v7;
      _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKModifyRecordZonesOperation failed: %{public}@", buf, 0x20u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v59) = 1;
    if ([v7 hmbIsCKPartialFailureError])
    {
      *(unsigned char *)(*(void *)&buf[8] + 24) = 0;
      uint64_t v15 = [v7 userInfo];
      id v16 = objc_msgSend(v15, "hmf_dictionaryForKey:", *MEMORY[0x1E4F19CD8]);

      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = ____modifyRecordZoneOperation_block_invoke_32;
      v48[3] = &unk_1E69EA578;
      id v49 = v10;
      id v50 = a1[4];
      __int16 v51 = buf;
      [v16 enumerateKeysAndObjectsUsingBlock:v48];
    }
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      id v17 = objc_loadWeakRetained(a1 + 10);
      if (!v17)
      {
        _HMFPreconditionFailure();
        __break(1u);
      }
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = ____modifyRecordZoneOperation_block_invoke_34;
      v40[3] = &unk_1E69EA5A0;
      objc_copyWeak(&v47, a1 + 9);
      id v41 = a1[5];
      id v18 = v7;
      id v42 = v18;
      id v43 = a1[6];
      id v44 = a1[7];
      id v45 = a1[8];
      id v46 = a1[4];
      int v19 = [v10 retryCloudKitOperation:v17 afterError:v18 retryBlock:v40];
      id v20 = (void *)MEMORY[0x1D944CB30]();
      id v21 = v10;
      if (v19)
      {
        HMFGetOSLogHandle();
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          id v23 = v20;
          HMFGetLogIdentifier();
          id v24 = (id)objc_claimAutoreleasedReturnValue();
          id v25 = [a1[4] identifier];
          id v26 = [v25 shortDescription];
          *(_DWORD *)id v52 = 138543618;
          id v53 = v24;
          __int16 v54 = 2114;
          __int16 v55 = v26;
          _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKModifyRecordZonesOperation will be retried", v52, 0x16u);

          id v20 = v23;
        }

        [a1[4] markWithReason:@"deferred"];
      }
      else
      {
        HMFGetOSLogHandle();
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          __int16 v37 = v20;
          HMFGetLogIdentifier();
          id v34 = (id)objc_claimAutoreleasedReturnValue();
          id v35 = [a1[4] identifier];
          id v36 = [v35 shortDescription];
          *(_DWORD *)id v52 = 138543874;
          id v53 = v34;
          __int16 v54 = 2114;
          __int16 v55 = v36;
          __int16 v56 = 2114;
          id v57 = v18;
          _os_log_impl(&dword_1D4693000, v33, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKModifyRecordZonesOperation failed and cannot be retried: %{public}@", v52, 0x20u);

          id v20 = v37;
        }

        [a1[4] markWithFormat:@"failed with error: %@", v18];
        [a1[5] finishWithError:v18];
      }

      objc_destroyWeak(&v47);
      _Block_object_dispose(buf, 8);
      goto LABEL_20;
    }
    _Block_object_dispose(buf, 8);
  }
  id v27 = (void *)MEMORY[0x1D944CB30]();
  id v28 = WeakRetained;
  id v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    id v30 = HMFGetLogIdentifier();
    id v31 = [a1[4] identifier];
    uint64_t v32 = [v31 shortDescription];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v30;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v32;
    _os_log_impl(&dword_1D4693000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKModifyRecordZonesOperation succeeded", buf, 0x16u);
  }
  [a1[5] finishWithNoResult];
LABEL_20:
}

void sub_1D46D8ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  objc_destroyWeak(location);
  _Block_object_dispose((const void *)(v12 - 144), 8);
  _Unwind_Resume(a1);
}

void ____modifyRecordZoneOperation_block_invoke_32(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (([v8 hmbIsCKMissingManateeIdentityError] & 1) != 0
    || [v8 hmbIsCKUnsyncedKeychainError])
  {
    id v9 = (void *)MEMORY[0x1D944CB30]();
    id v10 = *(id *)(a1 + 32);
    unint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      id v13 = [*(id *)(a1 + 40) identifier];
      id v14 = [v13 shortDescription];
      int v15 = 138544130;
      id v16 = v12;
      __int16 v17 = 2114;
      id v18 = v14;
      __int16 v19 = 2114;
      id v20 = v7;
      __int16 v21 = 2114;
      id v22 = v8;
      _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Ignoring partial error for zoneID %{public}@: %{public}@", (uint8_t *)&v15, 0x2Au);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void ____modifyRecordZoneOperation_block_invoke_34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v3 = WeakRetained;
  if (WeakRetained) {
    __modifyRecordZoneOperation(WeakRetained, *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 32));
  }
  else {
    [*(id *)(a1 + 32) finishWithError:*(void *)(a1 + 40)];
  }
}

void sub_1D46D9378(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __fetchCloudZones(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v12)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F653F0]);
    int v15 = [NSString stringWithUTF8String:"__fetchCloudZones"];
    id v12 = (id)[v14 initWithName:v15];
  }
  id v16 = [MEMORY[0x1E4F1CA80] set];
  if (v10)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F1A090]);
    id v18 = [v10 allObjects];
    __int16 v19 = (void *)[v17 initWithRecordZoneIDs:v18];
  }
  else
  {
    __int16 v19 = [MEMORY[0x1E4F1A090] fetchAllRecordZonesOperation];
  }
  id v20 = [v9 operationConfigurationWithProcessingOptions:0];
  [v19 setConfiguration:v20];

  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = ____fetchCloudZones_block_invoke;
  v48[3] = &unk_1E69EA500;
  id v21 = v9;
  id v49 = v21;
  id v22 = v12;
  id v50 = v22;
  id v23 = v16;
  id v51 = v23;
  [v19 setPerRecordZoneCompletionBlock:v48];
  objc_initWeak(&location, v19);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = ____fetchCloudZones_block_invoke_17;
  v39[3] = &unk_1E69EA550;
  id v24 = v21;
  id v40 = v24;
  id v38 = v22;
  id v41 = v38;
  objc_copyWeak(&v46, &location);
  id v25 = v10;
  id v42 = v25;
  id v26 = v11;
  id v43 = v26;
  id v36 = v13;
  id v44 = v36;
  id v37 = v23;
  id v45 = v37;
  id v27 = (void *)MEMORY[0x1D944CB30]([v19 setFetchRecordZonesCompletionBlock:v39]);
  id v28 = v24;
  HMFGetOSLogHandle();
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    id v35 = v25;
    HMFGetLogIdentifier();
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    id v31 = [v38 identifier];
    uint64_t v32 = [v31 shortDescription];
    id v33 = [v26 hmbDescription];
    id v34 = [v19 operationID];
    *(_DWORD *)buf = 138544130;
    id v53 = v30;
    __int16 v54 = 2114;
    __int16 v55 = v32;
    __int16 v56 = 2112;
    id v57 = v33;
    __int16 v58 = 2114;
    id v59 = v34;
    _os_log_impl(&dword_1D4693000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Starting CKFetchRecordZonesOperation for database: %@ operationID: %{public}@", buf, 0x2Au);

    id v25 = v35;
  }

  [v26 addOperation:v19];

  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);
}

void sub_1D46D9940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
}

void ____fetchCloudZones_block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
LABEL_7:
    [a1[6] addObject:v7];
    goto LABEL_8;
  }
  if (([v9 hmbIsCKMissingManateeIdentityError] & 1) != 0
    || [v10 hmbIsCKUnsyncedKeychainError])
  {
    id v11 = (void *)MEMORY[0x1D944CB30]();
    id v12 = a1[4];
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = HMFGetLogIdentifier();
      int v15 = [a1[5] identifier];
      id v16 = [v15 shortDescription];
      [v7 hmbDescription];
      v17 = id v25 = v11;
      *(_DWORD *)buf = 138544130;
      id v27 = v14;
      __int16 v28 = 2114;
      id v29 = v16;
      __int16 v30 = 2114;
      id v31 = v17;
      __int16 v32 = 2114;
      id v33 = v10;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Ignoring Manatee error for zoneID %{public}@: %{public}@", buf, 0x2Au);

      id v11 = v25;
    }

    goto LABEL_7;
  }
  id v18 = (void *)MEMORY[0x1D944CB30]();
  id v19 = a1[4];
  id v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = HMFGetLogIdentifier();
    id v22 = [a1[5] identifier];
    id v23 = [v22 shortDescription];
    id v24 = [v7 hmbDescription];
    *(_DWORD *)buf = 138544130;
    id v27 = v21;
    __int16 v28 = 2114;
    id v29 = v23;
    __int16 v30 = 2114;
    id v31 = v24;
    __int16 v32 = 2114;
    id v33 = v10;
    _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Could not fetch record with zone ID %{public}@: %{public}@", buf, 0x2Au);
  }
LABEL_8:
}

void ____fetchCloudZones_block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6 && ([v6 hmbIsCKPartialFailureError] & 1) == 0)
  {
    id v20 = (void *)MEMORY[0x1D944CB30]();
    id v21 = *(id *)(a1 + 32);
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = HMFGetLogIdentifier();
      id v24 = [*(id *)(a1 + 40) identifier];
      id v25 = [v24 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v50 = v23;
      __int16 v51 = 2114;
      id v52 = v25;
      __int16 v53 = 2114;
      __int16 v54 = v7;
      _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchRecordZonesOperation failed: %{public}@", buf, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    if (!WeakRetained) {
      _HMFPreconditionFailure();
    }
    id v19 = WeakRetained;
    id v27 = *(void **)(a1 + 32);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = ____fetchCloudZones_block_invoke_19;
    v43[3] = &unk_1E69EB5A8;
    id v44 = v27;
    id v45 = *(id *)(a1 + 48);
    id v46 = *(id *)(a1 + 56);
    id v47 = *(id *)(a1 + 40);
    id v48 = *(id *)(a1 + 64);
    int v28 = [v44 retryCloudKitOperation:v19 afterError:v7 retryBlock:v43];
    id v29 = (void *)MEMORY[0x1D944CB30]();
    id v30 = *(id *)(a1 + 32);
    id v31 = HMFGetOSLogHandle();
    __int16 v32 = v31;
    if (v28)
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        id v33 = HMFGetLogIdentifier();
        uint64_t v34 = [*(id *)(a1 + 40) identifier];
        id v35 = [v34 shortDescription];
        *(_DWORD *)buf = 138543618;
        id v50 = v33;
        __int16 v51 = 2114;
        id v52 = v35;
        _os_log_impl(&dword_1D4693000, v32, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKFetchRecordZonesOperation will be retried", buf, 0x16u);
      }
      [*(id *)(a1 + 40) markWithReason:@"deferred"];
    }
    else
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        id v36 = HMFGetLogIdentifier();
        id v37 = [*(id *)(a1 + 40) identifier];
        id v38 = [v37 shortDescription];
        *(_DWORD *)buf = 138543874;
        id v50 = v36;
        __int16 v51 = 2114;
        id v52 = v38;
        __int16 v53 = 2114;
        __int16 v54 = v7;
        _os_log_impl(&dword_1D4693000, v32, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKFetchRecordZonesOperation failed and cannot be retried: %{public}@", buf, 0x20u);
      }
      [*(id *)(a1 + 40) markWithFormat:@"failed with error: %@", v7];
      [*(id *)(a1 + 64) finishWithError:v7];
    }
  }
  else
  {
    id v8 = *(void **)(a1 + 72);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = ____fetchCloudZones_block_invoke_27;
    v40[3] = &unk_1E69EA528;
    id v41 = *(id *)(a1 + 32);
    id v42 = *(id *)(a1 + 56);
    id v9 = objc_msgSend(v8, "na_map:", v40);
    id v10 = (void *)MEMORY[0x1D944CB30]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = [*(id *)(a1 + 40) identifier];
      int v15 = [v14 shortDescription];
      [v9 hmbDescription];
      id v39 = v10;
      id v16 = v7;
      id v18 = v17 = v5;
      *(_DWORD *)buf = 138543874;
      id v50 = v13;
      __int16 v51 = 2114;
      id v52 = v15;
      __int16 v53 = 2112;
      __int16 v54 = v18;
      _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchRecordZonesOperation succeeded with zones: %@", buf, 0x20u);

      id v5 = v17;
      id v7 = v16;
      id v10 = v39;
    }
    [*(id *)(a1 + 64) finishWithResult:v9];

    id v19 = v41;
  }
}

uint64_t ____fetchCloudZones_block_invoke_19(void *a1)
{
  return __fetchCloudZones(a1[4], a1[5], a1[6], a1[7], a1[8]);
}

HMBCloudZoneID *____fetchCloudZones_block_invoke_27(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [HMBCloudZoneID alloc];
  id v5 = [*(id *)(a1 + 32) containerID];
  id v6 = -[HMBCloudZoneID initWithContainerID:scope:zoneID:](v4, "initWithContainerID:scope:zoneID:", v5, [*(id *)(a1 + 40) scope], v3);

  return v6;
}

void ____bindProperties_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA98];
  id v6 = a2;
  id v7 = [v5 null];

  id v8 = *(sqlite3_stmt **)(a1 + 32);
  int v9 = [v6 intValue];

  id v10 = v15;
  if (v7 == v15)
  {
    uint64_t v17 = 0;
    id v11 = (id *)&v17;
    id v12 = &v17;
    id v13 = v8;
    int v14 = v9;
    id v10 = 0;
  }
  else
  {
    uint64_t v16 = 0;
    id v11 = (id *)&v16;
    id v12 = &v16;
    id v13 = v8;
    int v14 = v9;
  }
  hmbBindDataSQLite3(v13, v14, v10, v12);
}

void sub_1D46DAC98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3968(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3969(uint64_t a1)
{
}

void sub_1D46DAFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D46DB3F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D46DBA04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __encodeArguments(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F1CA60];
  id v8 = a2;
  int v9 = [v8 arguments];
  id v10 = objc_msgSend(v7, "dictionaryWithCapacity:", objc_msgSend(v9, "count"));

  id v11 = [v8 arguments];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = ____encodeArguments_block_invoke;
  v17[3] = &unk_1E69EA788;
  id v18 = v5;
  id v19 = v6;
  id v20 = v10;
  id v12 = v10;
  id v13 = v6;
  id v14 = v5;
  [v11 enumerateKeysAndObjectsUsingBlock:v17];

  id v15 = (void *)[v12 copy];
  return v15;
}

void ____encodeArguments_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v22 = a2;
  id v5 = a3;
  if (([v22 hasPrefix:@"_"] & 1) == 0)
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = *(id *)(a1 + 32);
    id v8 = v6;
    id v9 = v22;
    id v10 = [v8 objectForKeyedSubscript:v9];
    if (v10)
    {
      id v11 = [MEMORY[0x1E4F1CA98] null];
      int v12 = [v10 isEqual:v11];

      if (v12)
      {
        id v13 = [MEMORY[0x1E4F1CA98] null];
LABEL_9:

        if (v13)
        {
          [*(id *)(a1 + 48) setObject:v13 forKeyedSubscript:v5];

          goto LABEL_11;
        }
        _HMFPreconditionFailure();
LABEL_15:
        uint64_t v17 = (void *)_HMFPreconditionFailure();
        +[HMBModelUnindexedQuery queryWithSQLPredicate:v19 ascending:v20 arguments:v21];
        return;
      }
      uint64_t v16 = [v7 argumentFields];
      id v14 = [v16 objectForKey:v9];

      if (!v14) {
        goto LABEL_15;
      }
      uint64_t v15 = [v14 encodeQueryableValue:v10];
    }
    else
    {
      id v14 = [v7 encodedDefaultValuesByArgumentName];
      uint64_t v15 = [v14 objectForKeyedSubscript:v9];
    }
    id v13 = (void *)v15;

    goto LABEL_9;
  }
LABEL_11:
}

void sub_1D46DFEE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D46E12A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4527(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4528(uint64_t a1)
{
}

void sub_1D46E1B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D46E1CA0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46E1D34(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46E1DC8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46E5CD0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46E60F8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __fetchRecordsWithRecordIDs(void *a1, void *a2, char a3, void *a4, void *a5)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a4;
  id v12 = a5;
  if (!v11)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F653F0]);
    id v14 = [NSString stringWithUTF8String:"__fetchRecordsWithRecordIDs"];
    id v11 = (id)[v13 initWithName:v14];
  }
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  id v16 = objc_alloc(MEMORY[0x1E4F1A0A8]);
  uint64_t v17 = [v10 allObjects];
  uint64_t v18 = (void *)[v16 initWithRecordIDs:v17];

  uint64_t v19 = [v9 cloudDatabase];
  BOOL v20 = [v19 operationConfigurationWithProcessingOptions:0];
  [v18 setConfiguration:v20];

  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = ____fetchRecordsWithRecordIDs_block_invoke;
  v47[3] = &unk_1E69EA950;
  id v21 = v9;
  id v48 = v21;
  id v22 = v11;
  id v49 = v22;
  id v23 = v15;
  id v50 = v23;
  [v18 setPerRecordCompletionBlock:v47];
  objc_initWeak(&location, v18);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = ____fetchRecordsWithRecordIDs_block_invoke_69;
  v38[3] = &unk_1E69EA9A0;
  id v24 = v21;
  id v39 = v24;
  id v37 = v22;
  id v40 = v37;
  objc_copyWeak(&v44, &location);
  char v45 = a3;
  id v36 = v10;
  id v41 = v36;
  id v25 = v12;
  id v42 = v25;
  id v35 = v23;
  id v43 = v35;
  id v26 = (void *)MEMORY[0x1D944CB30]([v18 setFetchRecordsCompletionBlock:v38]);
  id v27 = v24;
  HMFGetOSLogHandle();
  int v28 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    id v30 = [v37 identifier];
    id v31 = [v30 shortDescription];
    __int16 v32 = [v36 hmbDescription];
    id v33 = [v18 operationID];
    *(_DWORD *)buf = 138544130;
    id v52 = v29;
    __int16 v53 = 2114;
    __int16 v54 = v31;
    __int16 v55 = 2112;
    __int16 v56 = v32;
    __int16 v57 = 2114;
    __int16 v58 = v33;
    _os_log_impl(&dword_1D4693000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Starting CKFetchRecordsOperation with record IDs: %@ operationID: %{public}@", buf, 0x2Au);
  }
  uint64_t v34 = [v27 database];
  [v34 addOperation:v18];

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);
}

void sub_1D46E6648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
}

void ____fetchRecordsWithRecordIDs_block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1D944CB30]();
  id v11 = a1[4];
  id v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v7)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      uint64_t v15 = [a1[5] identifier];
      [v15 shortDescription];
      id v23 = v10;
      uint64_t v17 = v16 = v9;
      uint64_t v18 = [v8 hmbDescription];
      *(_DWORD *)buf = 138544130;
      id v25 = v14;
      __int16 v26 = 2114;
      id v27 = v17;
      __int16 v28 = 2112;
      id v29 = v18;
      __int16 v30 = 2112;
      id v31 = v7;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched record with ID %@: %@", buf, 0x2Au);

      id v9 = v16;
      id v10 = v23;
    }
    [a1[6] setObject:v7 forKeyedSubscript:v8];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      BOOL v20 = [a1[5] identifier];
      id v21 = [v20 shortDescription];
      id v22 = [v8 hmbDescription];
      *(_DWORD *)buf = 138544130;
      id v25 = v19;
      __int16 v26 = 2114;
      id v27 = v21;
      __int16 v28 = 2112;
      id v29 = v22;
      __int16 v30 = 2112;
      id v31 = v9;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch record with ID %@: %@", buf, 0x2Au);
    }
  }
}

void ____fetchRecordsWithRecordIDs_block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D944CB30]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v10)
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) identifier];
      id v13 = [v12 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v46 = v11;
      __int16 v47 = 2114;
      id v48 = v13;
      __int16 v49 = 2114;
      id v50 = v6;
      _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchRecordsOperation failed: %{public}@", buf, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    if (!WeakRetained) {
      _HMFPreconditionFailure();
    }
    uint64_t v15 = WeakRetained;
    id v16 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 80))
    {
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = ____fetchRecordsWithRecordIDs_block_invoke_73;
      v39[3] = &unk_1E69EA978;
      id v40 = v16;
      id v41 = *(id *)(a1 + 48);
      char v44 = *(unsigned char *)(a1 + 80);
      id v42 = *(id *)(a1 + 40);
      id v43 = *(id *)(a1 + 56);
      char v17 = [v40 retryCloudKitOperation:v15 afterError:v6 retryBlock:v39];

      if (v17)
      {
        uint64_t v18 = (void *)MEMORY[0x1D944CB30]();
        id v19 = *(id *)(a1 + 32);
        BOOL v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          id v21 = HMFGetLogIdentifier();
          id v22 = [*(id *)(a1 + 40) identifier];
          id v23 = [v22 shortDescription];
          *(_DWORD *)buf = 138543618;
          id v46 = v21;
          __int16 v47 = 2114;
          id v48 = v23;
          _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKFetchRecordsOperation will be retried", buf, 0x16u);
        }
        [*(id *)(a1 + 40) markWithReason:@"deferred"];
LABEL_22:

        goto LABEL_23;
      }
    }
    else
    {
      [v16 notifyDelegateOfError:v6 forOperation:v15];
    }
    if ([v6 hmbIsCKPartialFailureError] && *(void *)(a1 + 64))
    {
      id v27 = (void *)MEMORY[0x1D944CB30]();
      id v28 = *(id *)(a1 + 32);
      id v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v30 = HMFGetLogIdentifier();
        id v31 = [*(id *)(a1 + 40) identifier];
        uint64_t v32 = [v31 shortDescription];
        *(_DWORD *)buf = 138543618;
        id v46 = v30;
        __int16 v47 = 2114;
        id v48 = v32;
        _os_log_impl(&dword_1D4693000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchRecordsOperation partially failed, but returning those records that were successfully fetched", buf, 0x16u);
      }
      [*(id *)(a1 + 56) finishWithResult:*(void *)(a1 + 64)];
    }
    else
    {
      id v33 = (void *)MEMORY[0x1D944CB30]();
      id v34 = *(id *)(a1 + 32);
      id v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        id v36 = HMFGetLogIdentifier();
        id v37 = [*(id *)(a1 + 40) identifier];
        id v38 = [v37 shortDescription];
        *(_DWORD *)buf = 138543874;
        id v46 = v36;
        __int16 v47 = 2114;
        id v48 = v38;
        __int16 v49 = 2114;
        id v50 = v6;
        _os_log_impl(&dword_1D4693000, v35, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKFetchRecordsOperation failed and cannot be retried: %{public}@", buf, 0x20u);
      }
      [*(id *)(a1 + 40) markWithFormat:@"failed with error: %@", v6];
      [*(id *)(a1 + 56) finishWithError:v6];
    }
    goto LABEL_22;
  }
  if (v10)
  {
    id v24 = HMFGetLogIdentifier();
    id v25 = [*(id *)(a1 + 40) identifier];
    __int16 v26 = [v25 shortDescription];
    *(_DWORD *)buf = 138543618;
    id v46 = v24;
    __int16 v47 = 2114;
    id v48 = v26;
    _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchRecordsOperation succeeded", buf, 0x16u);
  }
  [*(id *)(a1 + 40) markWithReason:@"succeeded"];
  [*(id *)(a1 + 56) finishWithResult:*(void *)(a1 + 64)];
LABEL_23:
}

uint64_t ____fetchRecordsWithRecordIDs_block_invoke_73(uint64_t a1)
{
  return __fetchRecordsWithRecordIDs(*(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

void sub_1D46E81E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t __Block_byref_object_copy__5179(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5180(uint64_t a1)
{
}

id ____fetchNextBatch_block_invoke_5182(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 statement];
  uint64_t v6 = [v5 statement];
  id v7 = [*(id *)(a1 + 32) currentSequenceAsData];
  id v20 = 0;
  [v3 bindPropertiesToStatement:v6 currentSequence:v7 error:&v20];
  id v8 = v20;

  id v9 = [*(id *)(a1 + 32) statement];
  uint64_t v10 = [v9 statement];
  id v19 = v8;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = ____fetchNextBatch_block_invoke_2_5185;
  v15[3] = &unk_1E69EA9F0;
  id v16 = *(id *)(a1 + 32);
  long long v17 = *(_OWORD *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 56);
  LOBYTE(v10) = [v4 fetchSQLite3:v10 error:&v19 block:v15];

  id v11 = v19;
  if ((v10 & 1) == 0)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;
  }
  return v11;
}

id ____fetchNextBatch_block_invoke_2_5185(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  char v15 = 0;
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  id v13 = 0;
  obuint64_t j = v7;
  id v8 = [v5 fetchRowFromStatement:a2 skip:&v15 updatedSequenceColumn:&obj error:&v13];
  objc_storeStrong((id *)(v6 + 40), obj);
  id v9 = v13;
  if (v8)
  {
    if (v15
      || (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1,
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v8],
          unint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count],
          v10 < +[HMBSQLQueryIterator maximumRowsPerSelect]))
    {
      id v11 = 0;
    }
    else
    {
      id v11 = 0;
      *a3 = 1;
    }
  }
  else
  {
    *a3 = 1;
    [*(id *)(a1 + 32) setCurrentSequence:0];
    id v11 = v9;
  }

  return v11;
}

void sub_1D46E86B0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46E8784(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46E89A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46E8AAC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46E8B2C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __queryRecordsWithRecordType(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (v15)
  {
    if (v14) {
      goto LABEL_6;
    }
  }
  else
  {
    id v17 = objc_alloc(MEMORY[0x1E4F653F0]);
    uint64_t v18 = [NSString stringWithUTF8String:"__queryRecordsWithRecordType"];
    id v15 = (id)[v17 initWithName:v18];

    if (v14) {
      goto LABEL_6;
    }
  }
  id v14 = [MEMORY[0x1E4F1CA80] set];
LABEL_6:
  id v19 = objc_alloc(MEMORY[0x1E4F1A2A0]);
  id v20 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  uint64_t v21 = [v19 initWithRecordType:v12 predicate:v20];

  id v22 = objc_alloc(MEMORY[0x1E4F1A2B8]);
  id v43 = (void *)v21;
  if (v13) {
    uint64_t v23 = [v22 initWithCursor:v13];
  }
  else {
    uint64_t v23 = [v22 initWithQuery:v21];
  }
  id v24 = (void *)v23;
  id v25 = [v11 cloudZoneID];
  __int16 v26 = [v25 zoneID];
  [v24 setZoneID:v26];

  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  void v54[2] = ____queryRecordsWithRecordType_block_invoke;
  v54[3] = &unk_1E69EAA68;
  id v27 = v11;
  id v55 = v27;
  id v28 = v15;
  id v56 = v28;
  id v29 = v14;
  id v57 = v29;
  [v24 setRecordMatchedBlock:v54];
  objc_initWeak(&location, v24);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = ____queryRecordsWithRecordType_block_invoke_9;
  v45[3] = &unk_1E69EAA90;
  id v30 = v27;
  id v46 = v30;
  id v44 = v28;
  id v47 = v44;
  objc_copyWeak(&v52, &location);
  id v31 = v12;
  id v48 = v31;
  id v40 = v13;
  id v49 = v40;
  id v41 = v29;
  id v50 = v41;
  id v42 = v16;
  id v51 = v42;
  uint64_t v32 = (void *)MEMORY[0x1D944CB30]([v24 setQueryCompletionBlock:v45]);
  id v33 = v30;
  HMFGetOSLogHandle();
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    id v36 = objc_msgSend(v44, "identifier", v40, v41);
    id v37 = [v36 shortDescription];
    id v38 = [v24 operationID];
    *(_DWORD *)buf = 138544130;
    id v59 = v35;
    __int16 v60 = 2114;
    uint64_t v61 = v37;
    __int16 v62 = 2112;
    id v63 = v31;
    __int16 v64 = 2114;
    id v65 = v38;
    _os_log_impl(&dword_1D4693000, v34, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Starting CKQueryOperation for record type: %@ operationID: %{public}@", buf, 0x2Au);
  }
  id v39 = [v33 database];
  [v39 addOperation:v24];

  objc_destroyWeak(&v52);
  objc_destroyWeak(&location);
}

void sub_1D46E912C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____queryRecordsWithRecordType_block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = (void *)MEMORY[0x1D944CB30]();
  id v11 = a1[4];
  id v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = HMFGetLogIdentifier();
      id v15 = [a1[5] identifier];
      id v16 = [v15 shortDescription];
      [v8 hmbDescription];
      id v24 = v10;
      id v17 = v9;
      v19 = id v18 = v7;
      *(_DWORD *)buf = 138543874;
      __int16 v26 = v14;
      __int16 v27 = 2114;
      id v28 = v16;
      __int16 v29 = 2112;
      id v30 = v19;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Queried record: %@", buf, 0x20u);

      id v7 = v18;
      id v9 = v17;
      unint64_t v10 = v24;
    }
    [a1[6] addObject:v8];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      uint64_t v21 = [a1[5] identifier];
      id v22 = [v21 shortDescription];
      uint64_t v23 = [v7 hmbDescription];
      *(_DWORD *)buf = 138544130;
      __int16 v26 = v20;
      __int16 v27 = 2114;
      id v28 = v22;
      __int16 v29 = 2112;
      id v30 = v23;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to query record with ID %@: %@", buf, 0x2Au);
    }
  }
}

void ____queryRecordsWithRecordType_block_invoke_9(id *a1, void *a2, void *a3)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D944CB30]();
    id v8 = a1[4];
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v10 = HMFGetLogIdentifier();
      id v11 = [a1[5] identifier];
      id v12 = [v11 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v57 = v10;
      __int16 v58 = 2114;
      id v59 = v12;
      __int16 v60 = 2114;
      id v61 = v6;
      _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKQueryOperation failed: %{public}@", buf, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained(a1 + 10);
    if (!WeakRetained) {
      _HMFPreconditionFailure();
    }
    id v14 = WeakRetained;
    id v15 = a1[4];
    uint64_t v46 = MEMORY[0x1E4F143A8];
    uint64_t v47 = 3221225472;
    id v48 = ____queryRecordsWithRecordType_block_invoke_11;
    id v49 = &unk_1E69EBD50;
    id v50 = v15;
    id v51 = a1[6];
    id v52 = a1[7];
    id v53 = a1[8];
    id v54 = a1[5];
    id v55 = a1[9];
    uint64_t v16 = [v50 retryCloudKitOperation:v14 afterError:v6 retryBlock:&v46];
    if (v16)
    {
      id v24 = (void *)MEMORY[0x1D944CB30](v16, v17, v18, v19, v20, v21, v22, v23, v46);
      id v25 = a1[4];
      __int16 v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        __int16 v27 = HMFGetLogIdentifier();
        id v28 = [a1[5] identifier];
        __int16 v29 = [v28 shortDescription];
        *(_DWORD *)buf = 138543618;
        id v57 = v27;
        __int16 v58 = 2114;
        id v59 = v29;
        _os_log_impl(&dword_1D4693000, v26, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKQueryOperation will be retried", buf, 0x16u);
      }
    }
    else
    {
      if (objc_msgSend(v6, "hmbIsCKZoneDeletedError", v46, v47, v48, v49, v50, v51, v52, v53, v54))
      {
        id v37 = (void *)MEMORY[0x1D944CB30]();
        id v38 = a1[4];
        id v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          id v40 = HMFGetLogIdentifier();
          id v41 = [a1[5] identifier];
          id v42 = [v41 shortDescription];
          *(_DWORD *)buf = 138543874;
          id v57 = v40;
          __int16 v58 = 2114;
          id v59 = v42;
          __int16 v60 = 2114;
          id v61 = v6;
          _os_log_impl(&dword_1D4693000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Received cloud zone deletion error: %{public}@", buf, 0x20u);
        }
        [a1[4] handleDeletion];
      }
      [a1[9] finishWithError:v6];
    }
  }
  else
  {
    id v30 = (void *)MEMORY[0x1D944CB30]();
    id v31 = a1[4];
    id v32 = HMFGetOSLogHandle();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v33)
      {
        id v34 = HMFGetLogIdentifier();
        id v35 = [a1[5] identifier];
        id v36 = [v35 shortDescription];
        *(_DWORD *)buf = 138543874;
        id v57 = v34;
        __int16 v58 = 2114;
        id v59 = v36;
        __int16 v60 = 2112;
        id v61 = v5;
        _os_log_impl(&dword_1D4693000, v32, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKQueryOperation finished with cursor: %@", buf, 0x20u);
      }
      __queryRecordsWithRecordType(a1[4], a1[6], v5, a1[8], a1[5], a1[9]);
    }
    else
    {
      if (v33)
      {
        id v43 = HMFGetLogIdentifier();
        id v44 = [a1[5] identifier];
        char v45 = [v44 shortDescription];
        *(_DWORD *)buf = 138543618;
        id v57 = v43;
        __int16 v58 = 2114;
        id v59 = v45;
        _os_log_impl(&dword_1D4693000, v32, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKQueryOperation succeeded", buf, 0x16u);
      }
      [a1[9] finishWithResult:a1[8]];
    }
  }
}

uint64_t ____queryRecordsWithRecordType_block_invoke_11(void *a1)
{
  return __queryRecordsWithRecordType(a1[4], a1[5], a1[6], a1[7], a1[8], a1[9]);
}

void sub_1D46EA5E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5394(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5395(uint64_t a1)
{
}

void sub_1D46EA980(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46EACB4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46EB030(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46EB244(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46EB3F0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46EB598(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46EC094(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void __fetchSubscriptions(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F653F0]);
    id v12 = [NSString stringWithUTF8String:"__fetchSubscriptions"];
    id v9 = (id)[v11 initWithName:v12];
  }
  id v13 = [MEMORY[0x1E4F1A0F0] fetchAllSubscriptionsOperation];
  id v14 = [v7 operationConfigurationWithProcessingOptions:0];
  [v13 setConfiguration:v14];

  objc_initWeak(&location, v13);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = ____fetchSubscriptions_block_invoke;
  v28[3] = &unk_1E69EAB00;
  id v15 = v7;
  id v29 = v15;
  id v16 = v9;
  id v30 = v16;
  objc_copyWeak(&v33, &location);
  id v17 = v8;
  id v31 = v17;
  id v18 = v10;
  id v32 = v18;
  context = (void *)MEMORY[0x1D944CB30]([v13 setFetchSubscriptionCompletionBlock:v28]);
  id v19 = v15;
  HMFGetOSLogHandle();
  uint64_t v20 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v26 = v18;
    HMFGetLogIdentifier();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = [v16 identifier];
    uint64_t v23 = [v22 shortDescription];
    id v24 = [v17 hmbDescription];
    id v25 = [v13 operationID];
    *(_DWORD *)buf = 138544130;
    id v36 = v21;
    __int16 v37 = 2114;
    id v38 = v23;
    __int16 v39 = 2112;
    id v40 = v24;
    __int16 v41 = 2114;
    id v42 = v25;
    _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Starting CKFetchSubscriptionsOperation for database: %@ operationID: %{public}@", buf, 0x2Au);

    id v18 = v26;
  }

  [v17 addOperation:v13];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

void sub_1D46EC428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
}

void ____fetchSubscriptions_block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D944CB30]();
  id v8 = a1[4];
  id v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v10)
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [a1[5] identifier];
      id v13 = [v12 shortDescription];
      *(_DWORD *)buf = 138543874;
      char v45 = v11;
      __int16 v46 = 2114;
      uint64_t v47 = v13;
      __int16 v48 = 2114;
      id v49 = v6;
      _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchSubscriptionsOperation failed: %{public}@", buf, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained(a1 + 8);
    if (!WeakRetained) {
      _HMFPreconditionFailure();
    }
    id v15 = WeakRetained;
    id v16 = a1[4];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = ____fetchSubscriptions_block_invoke_20;
    v39[3] = &unk_1E69EB2F8;
    id v40 = v16;
    id v41 = a1[6];
    id v42 = a1[5];
    id v43 = a1[7];
    int v17 = [v40 retryCloudKitOperation:v15 afterError:v6 retryBlock:v39];
    id v18 = (void *)MEMORY[0x1D944CB30]();
    id v19 = a1[4];
    uint64_t v20 = HMFGetOSLogHandle();
    id v21 = v20;
    if (v17)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        uint64_t v23 = [a1[5] identifier];
        [v23 shortDescription];
        id v25 = v24 = v5;
        *(_DWORD *)buf = 138543618;
        char v45 = v22;
        __int16 v46 = 2114;
        uint64_t v47 = v25;
        _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKFetchSubscriptionsOperation will be retried", buf, 0x16u);

        id v5 = v24;
      }

      [a1[5] markWithReason:@"deferred"];
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v34 = HMFGetLogIdentifier();
        id v35 = [a1[5] identifier];
        [v35 shortDescription];
        v37 = id v36 = v5;
        *(_DWORD *)buf = 138543874;
        char v45 = v34;
        __int16 v46 = 2114;
        uint64_t v47 = v37;
        __int16 v48 = 2114;
        id v49 = v6;
        _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKFetchSubscriptionsOperation failed and cannot be retried: %{public}@", buf, 0x20u);

        id v5 = v36;
      }

      [a1[5] markWithFormat:@"failed with error: %@", v6];
      [a1[7] finishWithError:v6];
    }

    id v33 = v40;
  }
  else
  {
    if (v10)
    {
      id v26 = HMFGetLogIdentifier();
      __int16 v27 = [a1[5] identifier];
      id v28 = [v27 shortDescription];
      [v5 allKeys];
      id v29 = v38 = v5;
      id v30 = [v29 hmbDescription];
      *(_DWORD *)buf = 138543874;
      char v45 = v26;
      __int16 v46 = 2114;
      uint64_t v47 = v28;
      __int16 v48 = 2112;
      id v49 = v30;
      _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchSubscriptionsOperation succeeded with subscription IDs: %@", buf, 0x20u);

      id v5 = v38;
    }

    id v31 = a1[7];
    id v32 = (void *)MEMORY[0x1E4F1CAD0];
    id v15 = [v5 allValues];
    id v33 = [v32 setWithArray:v15];
    [v31 finishWithResult:v33];
  }
}

uint64_t ____fetchSubscriptions_block_invoke_20(void *a1)
{
  return __fetchSubscriptions(a1[4], a1[5], a1[6], a1[7]);
}

void sub_1D46ECBDC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ____performCloudPush_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  id v7 = [*(id *)(a1 + 32) inProgressPushFuturesByOutputBlockRow];
  id v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 40)];
  [v7 setObject:0 forKeyedSubscript:v8];

  os_unfair_lock_unlock(v6);
}

void sub_1D46ED3C4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46EE450(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)&STACK[0x230]);
  _Unwind_Resume(a1);
}

void __pushWithRecovery(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a1;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = [v13 cloudDatabase];
  uint64_t v20 = [v19 operationConfigurationWithProcessingOptions:v17];

  id v21 = [v15 allValues];
  uint64_t v22 = objc_msgSend(v13, "pushRecordsToUpdate:recordIDsToRemove:configuration:rollbackEnabled:", v21, v16, v20, objc_msgSend(v17, "shouldRollBackIfMirrorOutputFails"));

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = ____pushWithRecovery_block_invoke;
  v41[3] = &unk_1E69EABF0;
  id v23 = v13;
  id v42 = v23;
  id v24 = v18;
  id v43 = v24;
  id v25 = (id)[v22 addFailureBlock:v41];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = ____pushWithRecovery_block_invoke_38;
  v33[3] = &unk_1E69EAC18;
  id v34 = v24;
  id v35 = v17;
  id v36 = v23;
  id v37 = v14;
  id v38 = v15;
  id v39 = v16;
  uint64_t v40 = a2;
  id v26 = v16;
  id v27 = v15;
  id v28 = v14;
  id v29 = v23;
  id v30 = v17;
  id v31 = v24;
  id v32 = (id)[v22 addSuccessBlock:v33];
}

void sub_1D46EFA5C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5618(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5619(uint64_t a1)
{
}

void ____modelRequiresPostProcessing_block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  if ([a3 conformsToHMBModelNativeCKWrapper])
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = MEMORY[0x1E4F1CC38];

    *a4 = 1;
  }
}

void ____pushWithRecovery_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_ERROR, "%{public}@Records push failed immediately: %@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 40) finishWithError:v3];
}

void ____pushWithRecovery_block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 conflicts];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
LABEL_26:
    [*(id *)(a1 + 32) finishWithResult:v3];
    goto LABEL_27;
  }
  if ([*(id *)(a1 + 40) shouldRollBackIfMirrorOutputFails]) {
    goto LABEL_23;
  }
  uint64_t v6 = [*(id *)(a1 + 48) delegate];
  char v7 = objc_opt_respondsToSelector();
  int v8 = *(void **)(a1 + 48);
  id v9 = [v3 conflicts];
  __int16 v10 = v9;
  if (v7)
  {
    id v11 = [v9 allObjects];
    char v12 = [v6 cloudZone:v8 didEncounterConflicts:v11 options:*(void *)(a1 + 40)];
  }
  else
  {
    char v12 = [v8 resolveConflicts:v9 options:*(void *)(a1 + 40)];
  }

  if ((v12 & 1) == 0)
  {
LABEL_23:
    id v36 = (void *)MEMORY[0x1D944CB30]();
    id v37 = *(id *)(a1 + 48);
    id v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      id v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v57 = v39;
      _os_log_impl(&dword_1D4693000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@Drop all cloud records requested by conflict resolution delegate callback.", buf, 0xCu);
    }
    goto LABEL_26;
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v45 = v3;
  obuint64_t j = [v3 conflicts];
  uint64_t v13 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v51 = *(void *)v53;
    uint64_t v46 = a1;
    do
    {
      uint64_t v15 = 0;
      uint64_t v47 = v14;
      do
      {
        if (*(void *)v53 != v51) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v52 + 1) + 8 * v15);
        id v17 = *(void **)(a1 + 56);
        id v18 = [v16 recordID];
        id v19 = [v17 objectForKeyedSubscript:v18];

        uint64_t v20 = (void *)MEMORY[0x1D944CB30]();
        id v21 = *(id *)(a1 + 48);
        uint64_t v22 = HMFGetOSLogHandle();
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if (v19)
        {
          if (v23)
          {
            id v24 = HMFGetLogIdentifier();
            id v49 = [v16 recordID];
            id v25 = [v49 hmbDescription];
            id v26 = [v19 model];
            [v26 hmbDescription];
            v28 = id v27 = v20;
            *(_DWORD *)buf = 138543874;
            id v57 = v24;
            __int16 v58 = 2112;
            id v59 = v25;
            __int16 v60 = 2112;
            id v61 = v28;
            _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping cloud push record %@ / %@ due to conflict.", buf, 0x20u);

            uint64_t v20 = v27;
            uint64_t v14 = v47;

            a1 = v46;
          }
        }
        else if (v23)
        {
          HMFGetLogIdentifier();
          id v29 = v50 = v20;
          id v30 = [v16 recordID];
          id v31 = [v30 hmbDescription];
          *(_DWORD *)buf = 138543618;
          id v57 = v29;
          __int16 v58 = 2112;
          id v59 = v31;
          _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping cloud push record %@ due to conflict.", buf, 0x16u);

          uint64_t v14 = v47;
          uint64_t v20 = v50;
        }

        id v32 = *(void **)(a1 + 56);
        id v33 = [v16 recordID];
        [v32 setObject:0 forKeyedSubscript:v33];

        id v34 = *(void **)(a1 + 64);
        id v35 = [v16 recordID];
        [v34 setObject:0 forKeyedSubscript:v35];

        ++v15;
      }
      while (v14 != v15);
      uint64_t v14 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
    }
    while (v14);
  }

  if ([*(id *)(a1 + 64) count] || objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    __pushWithRecovery(*(void *)(a1 + 48), *(void *)(a1 + 80), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 40), *(void *)(a1 + 32));
  }
  else
  {
    uint64_t v40 = *(void **)(a1 + 32);
    id v41 = [HMBCloudZoneRecordPushResult alloc];
    id v42 = [MEMORY[0x1E4F1CAD0] set];
    id v43 = [MEMORY[0x1E4F1CAD0] set];
    id v44 = [(HMBCloudZoneRecordPushResult *)v41 initWithUpdatedRecords:v42 deletedRecordIDs:v43 error:0];
    [v40 finishWithResult:v44];
  }
  id v3 = v45;
LABEL_27:
}

void sub_1D46F0C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

id ____reindexTable_block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) zoneRow];
  id v5 = 0;
  [v1 _deleteAllQueriesForZoneRow:v2 error:&v5];
  id v3 = v5;
  return v3;
}

uint64_t __Block_byref_object_copy__5741(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5742(uint64_t a1)
{
}

void ____reindexTable_block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) buildQueriableFieldsForModel:v5];
  char v7 = [*(id *)(a1 + 32) context];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  obuint64_t j = *(id *)(v8 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = ____reindexTable_block_invoke_3;
  v13[3] = &unk_1E69EAD08;
  id v14 = *(id *)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  id v9 = v5;
  id v16 = v9;
  id v10 = v6;
  uint64_t v11 = *(void *)(a1 + 56);
  id v17 = v10;
  uint64_t v18 = v11;
  char v12 = [v7 sqlBlockWithActivity:0 error:&obj block:v13];
  objc_storeStrong((id *)(v8 + 40), obj);

  if ((v12 & 1) == 0)
  {
    *a3 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

id ____reindexTable_block_invoke_86(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 zoneRow];
  uint64_t v6 = [*(id *)(a1 + 40) modelType];
  id v9 = 0;
  [v4 _insertIndexSentinelWithZoneRow:v5 modelType:v6 error:&v9];

  id v7 = v9;
  return v7;
}

id ____reindexTable_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) zoneRow];
  uint64_t v6 = [*(id *)(a1 + 48) hmbRecordRow];
  uint64_t v7 = *(void *)(a1 + 56);
  id v18 = 0;
  [v4 _updateQueryForZoneRow:v5 recordRow:v6 encodedColumns:v7 error:&v18];
  id v8 = v18;
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v10 = *(void *)(v9 + 24);
  *(void *)(v9 + 24) = v10 + 1;
  if ((v10 & 0x3FF) == 0)
  {
    uint64_t v11 = (void *)MEMORY[0x1D944CB30]();
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) - 1;
      id v16 = [*(id *)(a1 + 32) modelType];
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v14;
      __int16 v21 = 2048;
      uint64_t v22 = v15;
      __int16 v23 = 2112;
      id v24 = v16;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_INFO, "%{public}@Have re-indexed %lu records of %@ type.", buf, 0x20u);
    }
  }

  return v8;
}

void sub_1D46F1504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D46F2230(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46F2910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
}

void sub_1D46F2C1C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46F2FD8(_Unwind_Exception *exception_object)
{
}

void sub_1D46F6968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
}

void sub_1D46F71DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_unfair_lock_t lock)
{
}

void sub_1D46F7E90(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ____initializeShareParticipantModels_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 participant];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v4 ckShareParticipant];
  uint64_t v7 = [v6 participantID];
  id v8 = [v5 objectForKeyedSubscript:v7];

  if (v8)
  {
    uint64_t v9 = *(void **)(a1 + 64);
    uint64_t v10 = [v3 participant];
    uint64_t v11 = [v10 clientIdentifier];
    [v9 setObject:v3 forKeyedSubscript:v11];
  }
  else
  {
    id v12 = (void *)MEMORY[0x1D944CB30]();
    id v13 = *(id *)(a1 + 40);
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      id v16 = [v4 ckShareParticipant];
      id v17 = [v16 participantID];
      *(_DWORD *)buf = 138543618;
      id v24 = v15;
      __int16 v25 = 2112;
      id v26 = v17;
      _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Removing participant that is no longer on share: %@", buf, 0x16u);
    }
    id v18 = *(void **)(a1 + 48);
    id v19 = [v3 hmbModelID];
    uint64_t v22 = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    id v21 = (id)[v18 remove:v20];

    uint64_t v10 = [*(id *)(a1 + 40) recordIDForModel:v3];
    [*(id *)(a1 + 56) addObject:v10];
  }
}

uint64_t ____initializeShareParticipantModels_block_invoke_109(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pushDeletedParticipantRecordIDs:*(void *)(a1 + 40)];
}

uint64_t ____initializeShareParticipantModels_block_invoke_102(uint64_t a1, void *a2)
{
  return [a2 participant];
}

uint64_t ____initializeShareParticipantModels_block_invoke(uint64_t a1, void *a2)
{
  return [a2 participantID];
}

uint64_t ____fetchShareModel_block_invoke(uint64_t a1, void *a2)
{
  return [a2 hmbModelID];
}

void sub_1D46F81B0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46F8344(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D46F86B4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __removeParticipantFromShare(void *a1, void *a2, void *a3)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = (void *)MEMORY[0x1D944CB30]();
  id v9 = v5;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v61 = v11;
    __int16 v62 = 2112;
    uint64_t v63 = (uint64_t)v6;
    __int16 v64 = 2112;
    id v65 = v7;
    _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing participant %@ from share %@", buf, 0x20u);
  }
  id v12 = [v7 participants];
  char v13 = [v12 containsObject:v6];

  if ((v13 & 1) == 0)
  {
    id v21 = (void *)MEMORY[0x1D944CB30]();
    id v22 = v9;
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v61 = v24;
      __int16 v62 = 2112;
      uint64_t v63 = (uint64_t)v6;
      __int16 v64 = 2112;
      id v65 = v7;
      __int16 v25 = "%{public}@Not removing participant %@ from share because it doesn't exist on share: %@";
LABEL_10:
      _os_log_impl(&dword_1D4693000, v23, OS_LOG_TYPE_INFO, v25, buf, 0x20u);
    }
LABEL_11:

    id v26 = [MEMORY[0x1E4F7A0D8] futureWithResult:v7];
    goto LABEL_18;
  }
  if ([v6 role] == 1)
  {
    id v14 = (void *)MEMORY[0x1D944CB30]();
    id v15 = v9;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v61 = v17;
      _os_log_impl(&dword_1D4693000, v16, OS_LOG_TYPE_FAULT, "%{public}@Cannot remove participant from share: Cannot remove the owner from a share", buf, 0xCu);
    }
    id v18 = (void *)MEMORY[0x1E4F7A0D8];
    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = @"Cannot remove the owner from a share";
LABEL_16:
    id v31 = [v19 hmfErrorWithCode:5 reason:v20];
    uint64_t v32 = [v18 futureWithError:v31];
LABEL_17:
    id v26 = (void *)v32;

    goto LABEL_18;
  }
  if ([v6 isCurrentUser])
  {
    uint64_t v27 = (void *)MEMORY[0x1D944CB30]();
    id v28 = v9;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      id v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v61 = v30;
      _os_log_impl(&dword_1D4693000, v29, OS_LOG_TYPE_FAULT, "%{public}@Cannot remove participant from share: Cannot remove the current user from the share", buf, 0xCu);
    }
    id v18 = (void *)MEMORY[0x1E4F7A0D8];
    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = @"Cannot remove the current user from the share";
    goto LABEL_16;
  }
  id v34 = [v7 currentUserParticipant];
  if ([v34 role] == 1)
  {

    goto LABEL_24;
  }
  id v35 = [v7 currentUserParticipant];
  uint64_t v36 = [v35 role];

  if (v36 == 2)
  {
LABEL_24:
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v37 = [v7 participants];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v56;
LABEL_26:
      uint64_t v41 = 0;
      while (1)
      {
        if (*(void *)v56 != v40) {
          objc_enumerationMutation(v37);
        }
        id v42 = *(void **)(*((void *)&v55 + 1) + 8 * v41);
        if ([v6 isEqual:v42]) {
          break;
        }
        if (v39 == ++v41)
        {
          uint64_t v39 = [v37 countByEnumeratingWithState:&v55 objects:v59 count:16];
          if (v39) {
            goto LABEL_26;
          }
          goto LABEL_32;
        }
      }
      id v31 = v42;

      if (!v31) {
        goto LABEL_35;
      }
      [v7 removeParticipant:v31];
      uint64_t v32 = [v9 _pushUpdatedShare:v7];
      goto LABEL_17;
    }
LABEL_32:

LABEL_35:
    id v21 = (void *)MEMORY[0x1D944CB30]();
    id v22 = v9;
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v61 = v24;
      __int16 v62 = 2112;
      uint64_t v63 = (uint64_t)v6;
      __int16 v64 = 2112;
      id v65 = v7;
      __int16 v25 = "%{public}@Didn't find requested participant %@ on share %@. Considering this success";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  id v43 = (void *)MEMORY[0x1D944CB30]();
  id v44 = v9;
  id v45 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
  {
    uint64_t v46 = HMFGetLogIdentifier();
    uint64_t v47 = [v7 currentUserParticipant];
    uint64_t v48 = [v47 role];
    *(_DWORD *)buf = 138543618;
    id v61 = v46;
    __int16 v62 = 2048;
    uint64_t v63 = v48;
    _os_log_impl(&dword_1D4693000, v45, OS_LOG_TYPE_FAULT, "%{public}@Current user participant with non-owner role %ld cannot remove participants from a share", buf, 0x16u);
  }
  id v49 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v50 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v51 = NSString;
  long long v52 = [v7 currentUserParticipant];
  long long v53 = objc_msgSend(v51, "stringWithFormat:", @"Current user participant with non-owner role %ld cannot remove participants from a share", objc_msgSend(v52, "role"));
  long long v54 = [v50 hmfErrorWithCode:5 reason:v53];
  id v26 = [v49 futureWithError:v54];

LABEL_18:
  return v26;
}

void sub_1D46FA02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6289(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6290(uint64_t a1)
{
}

id __addParticipantToShare(void *a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = (void *)MEMORY[0x1D944CB30]();
  id v9 = v5;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    __int16 v25 = v11;
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding participant %@ to share %@", buf, 0x20u);
  }
  id v12 = [v7 participants];
  int v13 = [v12 containsObject:v6];

  if (v13)
  {
    id v14 = (void *)MEMORY[0x1D944CB30]();
    id v15 = v9;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v25 = v17;
      __int16 v26 = 2112;
      id v27 = v6;
      __int16 v28 = 2112;
      id v29 = v7;
      _os_log_impl(&dword_1D4693000, v16, OS_LOG_TYPE_INFO, "%{public}@Removing participant %@ because it already exists on share %@", buf, 0x20u);
    }
    id v18 = __removeParticipantFromShare(v15, v6, v7);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = ____addParticipantToShare_block_invoke;
    v21[3] = &unk_1E69EAF78;
    id v22 = v15;
    id v23 = v6;
    id v19 = [v18 flatMap:v21];
  }
  else
  {
    [v7 addParticipant:v6];
    id v19 = [v9 _pushUpdatedShare:v7];
  }

  return v19;
}

uint64_t ____addParticipantToShare_block_invoke(uint64_t a1, uint64_t a2)
{
  return __addParticipantToShare(*(void *)(a1 + 32), *(void *)(a1 + 40), a2);
}

BOOL __reloadSQLQueryMetadata(void *a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = (sqlite3 *)[v3 connection];
  id v26 = 0;
  id v5 = selectSQLite3(v4, "SELECT master.tbl_name, master.name, index_info.seqno, index_info.name FROM sqlite_master AS master, PRAGMA_INDEX_INFO(master.name) AS index_info WHERE master.type = 'index' AND master.tbl_name like 'queryable_%' ORDER BY master.tbl_name, master.name, index_info.seqno", MEMORY[0x1E4F1CC08], &v26);
  id v6 = v26;
  id v7 = (sqlite3 *)[v3 connection];
  id v25 = v6;
  id v8 = selectSQLite3(v7, "SELECT master.name, table_info.name, table_info.type, master.sql FROM sqlite_master AS master, PRAGMA_TABLE_XINFO(master.name) AS table_info WHERE master.name LIKE 'queryable%' ORDER BY master.name, table_info.name", MEMORY[0x1E4F1CC08], &v25);
  id v9 = v25;

  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x1D944CB30]();
    id v11 = v3;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_ERROR, "%{public}@Significant failure during preparation of queries: %@", buf, 0x16u);
    }
    if (a2) {
      *a2 = v9;
    }
  }
  else
  {
    id v14 = v8;
    id v15 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v29 = 0;
    uint64_t v30 = (uint64_t)&v29;
    uint64_t v31 = 0x3032000000;
    uint64_t v32 = __Block_byref_object_copy__6408;
    id v33 = __Block_byref_object_dispose__6409;
    id v34 = 0;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = __Block_byref_object_copy__6408;
    void v27[4] = __Block_byref_object_dispose__6409;
    id v28 = 0;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = ____parseExistingTables_block_invoke;
    uint64_t v36 = &unk_1E69EB1E8;
    uint64_t v38 = &v29;
    uint64_t v39 = v27;
    id v16 = v15;
    id v37 = v16;
    [v14 enumerateObjectsUsingBlock:buf];
    id v17 = objc_msgSend(v16, "na_dictionaryByMappingValues:", &__block_literal_global_6410);

    _Block_object_dispose(v27, 8);
    _Block_object_dispose(&v29, 8);

    [v3 setQueryTables:v17];
    id v18 = [v3 queryTables];
    id v19 = (void *)MEMORY[0x1E4F1CA60];
    id v20 = v5;
    id v21 = [v19 dictionary];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = ____parseExistingIndexes_block_invoke;
    uint64_t v36 = &unk_1E69EB230;
    id v37 = v21;
    id v22 = v21;
    [v20 enumerateObjectsUsingBlock:buf];

    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    uint64_t v31 = (uint64_t)____parseExistingIndexes_block_invoke_2;
    uint64_t v32 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E69EB280;
    id v33 = v18;
    id v23 = v18;
    [v22 enumerateKeysAndObjectsUsingBlock:&v29];
  }
  return v9 == 0;
}

void sub_1D46FC5F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
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

void sub_1D46FC8EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6408(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6409(uint64_t a1)
{
}

void ____parseExistingTables_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 objectAtIndex:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v3 objectAtIndex:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  uint64_t v10 = [v3 objectAtIndex:2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  int v13 = [v3 objectAtIndex:3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_30;
  }
  if (!v9)
  {
LABEL_30:
    _HMFPreconditionFailure();
LABEL_31:
    _HMFPreconditionFailure();
  }
  if (!v12) {
    goto LABEL_31;
  }
  if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqual:v6] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);
    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    [*(id *)(a1 + 32) setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
  if (([v9 hasPrefix:@"_"] & 1) == 0)
  {
    if ([v12 isEqualToString:@"BLOB"]
      && [v15 containsString:@"CONSTRAINT fk_queryable_"]
      && ([v15 containsString:@"FOREIGN KEY (_record_id) REFERENCES record_v2 (id) ON DELETE CASCADE"] & 1) != 0)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v9];
    }
    else
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        id v19 = (void *)MEMORY[0x1D944CB30]();
        id v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          id v21 = HMFGetLogIdentifier();
          uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          [v15 containsString:@"CONSTRAINT fk_queryable_"];
          id v22 = HMFBooleanToString();
          [v15 containsString:@"FOREIGN KEY (_record_id) REFERENCES record_v2 (id) ON DELETE CASCADE"];
          HMFBooleanToString();
          id v23 = v29 = v19;
          *(_DWORD *)buf = 138544386;
          uint64_t v31 = v21;
          __int16 v32 = 2112;
          uint64_t v33 = v28;
          __int16 v34 = 2112;
          id v35 = v12;
          __int16 v36 = 2112;
          id v37 = v22;
          __int16 v38 = 2112;
          uint64_t v39 = v23;
          _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_INFO, "%{public}@discarding existing index table %@ (%@ / %@ / %@)", buf, 0x34u);

          id v19 = v29;
        }
      }
      id v24 = *(void **)(a1 + 32);
      id v25 = [MEMORY[0x1E4F1CAD0] set];
      [v24 setObject:v25 forKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

      uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
      id v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = 0;
    }
  }
}

void ____parseExistingIndexes_block_invoke(uint64_t a1, void *a2)
{
  id v18 = a2;
  id v3 = [v18 objectAtIndex:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  id v6 = [v18 objectAtIndex:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  id v9 = [v18 objectAtIndex:2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  id v12 = [v18 objectAtIndex:3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v13 = v12;
  }
  else {
    int v13 = 0;
  }
  id v14 = v13;

  if (!v5)
  {
    _HMFPreconditionFailure();
    goto LABEL_27;
  }
  if (!v8)
  {
LABEL_27:
    _HMFPreconditionFailure();
    goto LABEL_28;
  }
  if (!v11)
  {
LABEL_28:
    _HMFPreconditionFailure();
    goto LABEL_29;
  }
  if (!v14)
  {
LABEL_29:
    uint64_t v17 = _HMFPreconditionFailure();
    ____parseExistingIndexes_block_invoke_2(v17);
    return;
  }
  id v15 = [*(id *)(a1 + 32) objectForKey:v5];
  if (!v15)
  {
    id v15 = [MEMORY[0x1E4F1CA60] dictionary];
    [*(id *)(a1 + 32) setObject:v15 forKey:v5];
  }
  uint64_t v16 = [v15 objectForKey:v8];
  if (!v16)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    [v15 setObject:v16 forKey:v8];
  }
  if (([v14 hasPrefix:@"_"] & 1) == 0) {
    [v16 addObject:v14];
  }
}

void ____parseExistingIndexes_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKey:a2];
  uint64_t v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = ____parseExistingIndexes_block_invoke_3;
    v8[3] = &unk_1E69EB258;
    id v9 = v6;
    [v5 enumerateKeysAndObjectsUsingBlock:v8];
  }
}

void ____parseExistingIndexes_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = [[HMBLocalSQLContextQueryIndex alloc] initWithColumns:v5];

  uint64_t v7 = [*(id *)(a1 + 32) mutableIndexes];
  [v7 setObject:v8 forKey:v6];
}

HMBLocalSQLContextQueryTable *____parseExistingTables_block_invoke_83(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v4 = [[HMBLocalSQLContextQueryTable alloc] initWithColumnNames:v3];

  return v4;
}

void __fetchUserRecord(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F653F0]);
    id v12 = [NSString stringWithUTF8String:"__fetchUserRecord"];
    id v9 = (id)[v11 initWithName:v12];
  }
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__6491;
  void v41[4] = __Block_byref_object_dispose__6492;
  id v42 = 0;
  int v13 = [MEMORY[0x1E4F1A0A8] fetchCurrentUserRecordOperation];
  id v14 = [v7 operationConfigurationWithProcessingOptions:0];
  [v13 setConfiguration:v14];

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = ____fetchUserRecord_block_invoke;
  v37[3] = &unk_1E69EB398;
  id v15 = v7;
  id v38 = v15;
  id v16 = v9;
  id v39 = v16;
  uint64_t v40 = v41;
  [v13 setPerRecordCompletionBlock:v37];
  objc_initWeak(&location, v13);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = ____fetchUserRecord_block_invoke_34;
  void v29[3] = &unk_1E69EB3C0;
  id v17 = v15;
  id v30 = v17;
  id v28 = v16;
  id v31 = v28;
  id v27 = &v35;
  objc_copyWeak(&v35, &location);
  id v18 = v8;
  id v32 = v18;
  id v19 = v10;
  id v33 = v19;
  __int16 v34 = v41;
  id v20 = (void *)MEMORY[0x1D944CB30]([v13 setFetchRecordsCompletionBlock:v29]);
  id v21 = v17;
  HMFGetOSLogHandle();
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    id v24 = objc_msgSend(v28, "identifier", &v35);
    id v25 = [v24 shortDescription];
    uint64_t v26 = [v13 operationID];
    *(_DWORD *)buf = 138543874;
    id v44 = v23;
    __int16 v45 = 2114;
    uint64_t v46 = v25;
    __int16 v47 = 2114;
    uint64_t v48 = v26;
    _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Starting CKFetchRecordsOperation for current user record with operationID: %{public}@", buf, 0x20u);
  }
  [v18 addOperation:v13];

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);

  _Block_object_dispose(v41, 8);
}

void sub_1D46FD984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy__6491(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6492(uint64_t a1)
{
}

void ____fetchUserRecord_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = (void *)MEMORY[0x1D944CB30]();
  id v12 = *(id *)(a1 + 32);
  int v13 = HMFGetOSLogHandle();
  id v14 = v13;
  if (v8)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      id v15 = HMFGetLogIdentifier();
      [*(id *)(a1 + 40) identifier];
      v16 = id v21 = v9;
      id v17 = [v16 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v23 = v15;
      __int16 v24 = 2114;
      id v25 = v17;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Fetched user record: %@", buf, 0x20u);

      id v9 = v21;
    }

    [*(id *)(a1 + 40) markWithFormat:@"finished"];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      id v19 = [*(id *)(a1 + 40) identifier];
      id v20 = [v19 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v23 = v18;
      __int16 v24 = 2114;
      id v25 = v20;
      __int16 v26 = 2112;
      id v27 = v10;
      _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch user record: %@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) markWithFormat:@"failed with error: %@", v10];
  }
}

void ____fetchUserRecord_block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D944CB30]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 40) identifier];
      id v12 = [v11 shortDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v46 = v10;
      __int16 v47 = 2114;
      uint64_t v48 = v12;
      __int16 v49 = 2114;
      id v50 = v6;
      _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchRecordsOperation failed: %{public}@", buf, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    if (!WeakRetained) {
      _HMFPreconditionFailure();
    }
    id v14 = WeakRetained;
    id v15 = *(void **)(a1 + 32);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = ____fetchUserRecord_block_invoke_35;
    v40[3] = &unk_1E69EB2F8;
    id v41 = v15;
    id v42 = *(id *)(a1 + 48);
    id v43 = *(id *)(a1 + 40);
    id v44 = *(id *)(a1 + 56);
    int v16 = [v41 retryCloudKitOperation:v14 afterError:v6 retryBlock:v40];
    id v17 = (void *)MEMORY[0x1D944CB30]();
    id v18 = *(id *)(a1 + 32);
    id v19 = HMFGetOSLogHandle();
    id v20 = v19;
    if (v16)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v21 = HMFGetLogIdentifier();
        id v22 = [*(id *)(a1 + 40) identifier];
        id v23 = [v22 shortDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v46 = v21;
        __int16 v47 = 2114;
        uint64_t v48 = v23;
        _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKFetchRecordsOperation will be retried", buf, 0x16u);
      }
      [*(id *)(a1 + 40) markWithReason:@"deferred"];
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v33 = HMFGetLogIdentifier();
        __int16 v34 = [*(id *)(a1 + 40) identifier];
        id v35 = [v34 shortDescription];
        *(_DWORD *)buf = 138543874;
        uint64_t v46 = v33;
        __int16 v47 = 2114;
        uint64_t v48 = v35;
        __int16 v49 = 2114;
        id v50 = v6;
        _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKFetchRecordsOperation failed and cannot be retried: %{public}@", buf, 0x20u);
      }
      [*(id *)(a1 + 40) markWithFormat:@"failed with error: %@", v6];
      [*(id *)(a1 + 56) finishWithError:v6];
    }

LABEL_17:
    goto LABEL_18;
  }
  uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v25 = (void *)MEMORY[0x1D944CB30]();
  id v26 = *(id *)(a1 + 32);
  id v27 = HMFGetOSLogHandle();
  uint64_t v28 = v27;
  if (!v24)
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      __int16 v36 = HMFGetLogIdentifier();
      id v37 = [*(id *)(a1 + 40) identifier];
      id v38 = [v37 shortDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v46 = v36;
      __int16 v47 = 2114;
      uint64_t v48 = v38;
      _os_log_impl(&dword_1D4693000, v28, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKFetchRecordsOperation did not retrieve user record, but no error was returned", buf, 0x16u);
    }
    id v39 = *(void **)(a1 + 56);
    id v14 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    [v39 finishWithError:v14];
    goto LABEL_17;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = HMFGetLogIdentifier();
    id v30 = [*(id *)(a1 + 40) identifier];
    id v31 = [v30 shortDescription];
    id v32 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v46 = v29;
    __int16 v47 = 2114;
    uint64_t v48 = v31;
    __int16 v49 = 2112;
    id v50 = v32;
    _os_log_impl(&dword_1D4693000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchRecordsOperation succeeded with record: %@", buf, 0x20u);
  }
  [*(id *)(a1 + 56) finishWithResult:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
LABEL_18:
}

uint64_t ____fetchUserRecord_block_invoke_35(void *a1)
{
  return __fetchUserRecord(a1[4], a1[5], a1[6], a1[7]);
}

void __acceptInvitation(void *a1, void *a2, void *a3, void *a4)
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F653F0]);
    id v12 = [NSString stringWithUTF8String:"__acceptInvitation"];
    id v9 = (id)[v11 initWithName:v12];
  }
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__6491;
  void v42[4] = __Block_byref_object_dispose__6492;
  id v43 = 0;
  id v13 = objc_alloc_init(MEMORY[0x1E4F19E10]);
  id v14 = [v7 operationConfigurationWithProcessingOptions:0];
  [v13 setConfiguration:v14];

  v52[0] = v8;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
  [v13 setShareMetadatas:v15];

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = ____acceptInvitation_block_invoke;
  v38[3] = &unk_1E69EB370;
  id v16 = v7;
  id v39 = v16;
  id v17 = v9;
  id v40 = v17;
  id v41 = v42;
  [v13 setPerShareCompletionBlock:v38];
  objc_initWeak(&location, v13);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = ____acceptInvitation_block_invoke_30;
  v30[3] = &unk_1E69EB320;
  id v18 = v16;
  id v31 = v18;
  id v29 = v17;
  id v32 = v29;
  objc_copyWeak(&v36, &location);
  id v19 = v8;
  id v33 = v19;
  id v28 = v10;
  id v34 = v28;
  id v35 = v42;
  id v20 = (void *)MEMORY[0x1D944CB30]([v13 setAcceptSharesCompletionBlock:v30]);
  id v21 = v18;
  HMFGetOSLogHandle();
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = [v29 identifier];
    id v25 = [v24 shortDescription];
    id v26 = [v13 operationID];
    *(_DWORD *)buf = 138544130;
    id v45 = v23;
    __int16 v46 = 2114;
    __int16 v47 = v25;
    __int16 v48 = 2112;
    id v49 = v19;
    __int16 v50 = 2114;
    uint64_t v51 = v26;
    _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Starting CKAcceptSharesOperation with share metadata: %@ operationID: %{public}@", buf, 0x2Au);
  }
  id v27 = [v21 container];
  [v27 addOperation:v13];

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

  _Block_object_dispose(v42, 8);
}

void sub_1D46FE684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void ____acceptInvitation_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1D944CB30]();
  id v11 = *(id *)(a1 + 32);
  id v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v14 = HMFGetLogIdentifier();
      id v15 = [*(id *)(a1 + 40) identifier];
      [v15 shortDescription];
      id v21 = v10;
      id v17 = v16 = v9;
      *(_DWORD *)buf = 138544130;
      id v23 = v14;
      __int16 v24 = 2114;
      id v25 = v17;
      __int16 v26 = 2112;
      id v27 = v7;
      __int16 v28 = 2112;
      id v29 = v8;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Successfully accepted share for share metadata %@: %@", buf, 0x2Au);

      id v9 = v16;
      id v10 = v21;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      id v19 = [*(id *)(a1 + 40) identifier];
      id v20 = [v19 shortDescription];
      *(_DWORD *)buf = 138544130;
      id v23 = v18;
      __int16 v24 = 2114;
      id v25 = v20;
      __int16 v26 = 2112;
      id v27 = v7;
      __int16 v28 = 2112;
      id v29 = v9;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to accept share metadata %@: %@", buf, 0x2Au);
    }
  }
}

void ____acceptInvitation_block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [*(id *)(a1 + 40) identifier];
      id v10 = [v9 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v35 = v8;
      __int16 v36 = 2114;
      id v37 = v10;
      __int16 v38 = 2114;
      id v39 = v3;
      _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKAcceptSharesOperation failed: %{public}@", buf, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    if (!WeakRetained) {
      _HMFPreconditionFailure();
    }
    id v12 = WeakRetained;
    id v13 = *(void **)(a1 + 32);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = ____acceptInvitation_block_invoke_31;
    void v29[3] = &unk_1E69EB2F8;
    id v30 = v13;
    id v31 = *(id *)(a1 + 48);
    id v32 = *(id *)(a1 + 40);
    id v33 = *(id *)(a1 + 56);
    int v14 = [v30 retryCloudKitOperation:v12 afterError:v3 retryBlock:v29];
    id v15 = (void *)MEMORY[0x1D944CB30]();
    id v16 = *(id *)(a1 + 32);
    id v17 = HMFGetOSLogHandle();
    id v18 = v17;
    if (v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v19 = HMFGetLogIdentifier();
        id v20 = [*(id *)(a1 + 40) identifier];
        id v21 = [v20 shortDescription];
        *(_DWORD *)buf = 138543618;
        id v35 = v19;
        __int16 v36 = 2114;
        id v37 = v21;
        _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKAcceptSharesOperation will be retried", buf, 0x16u);
      }
      [*(id *)(a1 + 40) markWithReason:@"deferred"];
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __int16 v26 = HMFGetLogIdentifier();
        id v27 = [*(id *)(a1 + 40) identifier];
        __int16 v28 = [v27 shortDescription];
        *(_DWORD *)buf = 138543874;
        id v35 = v26;
        __int16 v36 = 2114;
        id v37 = v28;
        __int16 v38 = 2114;
        id v39 = v3;
        _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKAcceptSharesOperation failed and cannot be retried: %{public}@", buf, 0x20u);
      }
      [*(id *)(a1 + 40) markWithFormat:@"failed with error: %@", v3];
      [*(id *)(a1 + 56) finishWithError:v3];
    }
  }
  else
  {
    if (v7)
    {
      id v22 = HMFGetLogIdentifier();
      id v23 = [*(id *)(a1 + 40) identifier];
      __int16 v24 = [v23 shortDescription];
      id v25 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      id v35 = v22;
      __int16 v36 = 2114;
      id v37 = v24;
      __int16 v38 = 2112;
      id v39 = v25;
      _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKAcceptSharesOperation succeeded with share: %@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) markWithFormat:@"finished"];
    [*(id *)(a1 + 56) finishWithResult:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  }
}

uint64_t ____acceptInvitation_block_invoke_31(void *a1)
{
  return __acceptInvitation(a1[4], a1[5], a1[6], a1[7]);
}

void __fetchShareMetadata(void *a1, void *a2, void *a3, void *a4)
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F653F0]);
    id v12 = [NSString stringWithUTF8String:"__fetchShareMetadata"];
    id v9 = (id)[v11 initWithName:v12];
  }
  v46[0] = 0;
  v46[1] = v46;
  id v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__6491;
  v46[4] = __Block_byref_object_dispose__6492;
  id v47 = 0;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1A0C0]);
  int v14 = [v7 operationConfigurationWithProcessingOptions:0];
  [v13 setConfiguration:v14];

  id v15 = [v8 shareURL];
  v58[0] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:1];
  [v13 setShareURLs:v16];

  id v17 = [v8 shareURL];
  long long v56 = v17;
  id v18 = [v8 token];
  long long v57 = v18;
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
  [v13 setShareInvitationTokensByShareURL:v19];

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = ____fetchShareMetadata_block_invoke;
  v42[3] = &unk_1E69EB348;
  id v20 = v7;
  id v43 = v20;
  id v21 = v9;
  id v44 = v21;
  id v45 = v46;
  [v13 setPerShareMetadataBlock:v42];
  objc_initWeak(&location, v13);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = ____fetchShareMetadata_block_invoke_26;
  v34[3] = &unk_1E69EB320;
  id v22 = v20;
  id v35 = v22;
  id v33 = v21;
  id v36 = v33;
  objc_copyWeak(&v40, &location);
  id v23 = v8;
  id v37 = v23;
  id v32 = v10;
  id v38 = v32;
  id v39 = v46;
  __int16 v24 = (void *)MEMORY[0x1D944CB30]([v13 setFetchShareMetadataCompletionBlock:v34]);
  id v25 = v22;
  HMFGetOSLogHandle();
  __int16 v26 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v28 = [v33 identifier];
    id v29 = [v28 shortDescription];
    id v30 = [v13 operationID];
    *(_DWORD *)buf = 138544130;
    id v49 = v27;
    __int16 v50 = 2114;
    uint64_t v51 = v29;
    __int16 v52 = 2112;
    id v53 = v23;
    __int16 v54 = 2114;
    long long v55 = v30;
    _os_log_impl(&dword_1D4693000, v26, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Starting CKFetchShareMetadataOperation for invitation: %@ operationID: %{public}@", buf, 0x2Au);
  }
  id v31 = [v25 container];
  [v31 addOperation:v13];

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);

  _Block_object_dispose(v46, 8);
}

void sub_1D46FF2D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void ____fetchShareMetadata_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1D944CB30]();
  id v11 = *(id *)(a1 + 32);
  id v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v14 = HMFGetLogIdentifier();
      id v15 = [*(id *)(a1 + 40) identifier];
      [v15 shortDescription];
      id v21 = v10;
      id v17 = v16 = v9;
      *(_DWORD *)buf = 138544130;
      id v23 = v14;
      __int16 v24 = 2114;
      id v25 = v17;
      __int16 v26 = 2112;
      id v27 = v7;
      __int16 v28 = 2112;
      id v29 = v8;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Fetched share metadata for url %@: %@", buf, 0x2Au);

      id v9 = v16;
      id v10 = v21;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      id v19 = [*(id *)(a1 + 40) identifier];
      id v20 = [v19 shortDescription];
      *(_DWORD *)buf = 138544130;
      id v23 = v18;
      __int16 v24 = 2114;
      id v25 = v20;
      __int16 v26 = 2112;
      id v27 = v7;
      __int16 v28 = 2114;
      id v29 = v9;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch share metadata for url %@: %{public}@", buf, 0x2Au);
    }
  }
}

void ____fetchShareMetadata_block_invoke_26(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [*(id *)(a1 + 40) identifier];
      id v10 = [v9 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v35 = v8;
      __int16 v36 = 2114;
      id v37 = v10;
      __int16 v38 = 2114;
      id v39 = v3;
      _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchShareMetadataOperation failed: %{public}@", buf, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    if (!WeakRetained) {
      _HMFPreconditionFailure();
    }
    id v12 = WeakRetained;
    id v13 = *(void **)(a1 + 32);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = ____fetchShareMetadata_block_invoke_27;
    void v29[3] = &unk_1E69EB2F8;
    id v30 = v13;
    id v31 = *(id *)(a1 + 48);
    id v32 = *(id *)(a1 + 40);
    id v33 = *(id *)(a1 + 56);
    int v14 = [v30 retryCloudKitOperation:v12 afterError:v3 retryBlock:v29];
    id v15 = (void *)MEMORY[0x1D944CB30]();
    id v16 = *(id *)(a1 + 32);
    id v17 = HMFGetOSLogHandle();
    id v18 = v17;
    if (v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v19 = HMFGetLogIdentifier();
        id v20 = [*(id *)(a1 + 40) identifier];
        id v21 = [v20 shortDescription];
        *(_DWORD *)buf = 138543618;
        id v35 = v19;
        __int16 v36 = 2114;
        id v37 = v21;
        _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKFetchShareMetadataOperation will be retried", buf, 0x16u);
      }
      [*(id *)(a1 + 40) markWithReason:@"deferred"];
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __int16 v26 = HMFGetLogIdentifier();
        id v27 = [*(id *)(a1 + 40) identifier];
        __int16 v28 = [v27 shortDescription];
        *(_DWORD *)buf = 138543874;
        id v35 = v26;
        __int16 v36 = 2114;
        id v37 = v28;
        __int16 v38 = 2114;
        id v39 = v3;
        _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKFetchShareMetadataOperation failed and cannot be retried: %{public}@", buf, 0x20u);
      }
      [*(id *)(a1 + 40) markWithFormat:@"failed with error: %@", v3];
      [*(id *)(a1 + 56) finishWithError:v3];
    }
  }
  else
  {
    if (v7)
    {
      id v22 = HMFGetLogIdentifier();
      id v23 = [*(id *)(a1 + 40) identifier];
      __int16 v24 = [v23 shortDescription];
      id v25 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      id v35 = v22;
      __int16 v36 = 2114;
      id v37 = v24;
      __int16 v38 = 2112;
      id v39 = v25;
      _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchShareMetadataOperation succeeded with share metadata: %@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) markWithFormat:@"finished"];
    [*(id *)(a1 + 56) finishWithResult:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  }
}

uint64_t ____fetchShareMetadata_block_invoke_27(void *a1)
{
  return __fetchShareMetadata(a1[4], a1[5], a1[6], a1[7]);
}

void __fetchParticipant(void *a1, void *a2, void *a3, void *a4)
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F653F0]);
    id v12 = [NSString stringWithUTF8String:"__fetchParticipant"];
    id v9 = (id)[v11 initWithName:v12];
  }
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__6491;
  void v42[4] = __Block_byref_object_dispose__6492;
  id v43 = 0;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1A0D8]);
  int v14 = [v7 operationConfigurationWithProcessingOptions:0];
  [v13 setConfiguration:v14];

  v52[0] = v8;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
  [v13 setUserIdentityLookupInfos:v15];

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = ____fetchParticipant_block_invoke;
  v38[3] = &unk_1E69EB2D0;
  id v16 = v7;
  id v39 = v16;
  id v17 = v9;
  id v40 = v17;
  id v41 = v42;
  [v13 setShareParticipantFetchedBlock:v38];
  objc_initWeak(&location, v13);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = ____fetchParticipant_block_invoke_9;
  v30[3] = &unk_1E69EB320;
  id v18 = v16;
  id v31 = v18;
  id v29 = v17;
  id v32 = v29;
  objc_copyWeak(&v36, &location);
  id v19 = v8;
  id v33 = v19;
  id v28 = v10;
  id v34 = v28;
  id v35 = v42;
  id v20 = (void *)MEMORY[0x1D944CB30]([v13 setFetchShareParticipantsCompletionBlock:v30]);
  id v21 = v18;
  HMFGetOSLogHandle();
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v24 = [v29 identifier];
    id v25 = [v24 shortDescription];
    __int16 v26 = [v13 operationID];
    *(_DWORD *)buf = 138544130;
    id v45 = v23;
    __int16 v46 = 2114;
    id v47 = v25;
    __int16 v48 = 2112;
    id v49 = v19;
    __int16 v50 = 2114;
    uint64_t v51 = v26;
    _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Starting CKFetchShareParticipantsOperation for lookup info: %@ operationID: %{public}@", buf, 0x2Au);
  }
  id v27 = [v21 container];
  [v27 addOperation:v13];

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

  _Block_object_dispose(v42, 8);
}

void sub_1D46FFEB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void ____fetchParticipant_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) identifier];
    id v9 = [v8 shortDescription];
    int v12 = 138543874;
    id v13 = v7;
    __int16 v14 = 2114;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Fetched share participant: %@", (uint8_t *)&v12, 0x20u);
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v3;
}

void ____fetchParticipant_block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [*(id *)(a1 + 40) identifier];
      uint64_t v10 = [v9 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v35 = v8;
      __int16 v36 = 2114;
      id v37 = v10;
      __int16 v38 = 2114;
      id v39 = v3;
      _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchShareParticipantsOperation failed: %{public}@", buf, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    if (!WeakRetained) {
      _HMFPreconditionFailure();
    }
    int v12 = WeakRetained;
    id v13 = *(void **)(a1 + 32);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = ____fetchParticipant_block_invoke_11;
    void v29[3] = &unk_1E69EB2F8;
    id v30 = v13;
    id v31 = *(id *)(a1 + 48);
    id v32 = *(id *)(a1 + 40);
    id v33 = *(id *)(a1 + 56);
    int v14 = [v30 retryCloudKitOperation:v12 afterError:v3 retryBlock:v29];
    id v15 = (void *)MEMORY[0x1D944CB30]();
    id v16 = *(id *)(a1 + 32);
    id v17 = HMFGetOSLogHandle();
    uint64_t v18 = v17;
    if (v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v19 = HMFGetLogIdentifier();
        id v20 = [*(id *)(a1 + 40) identifier];
        id v21 = [v20 shortDescription];
        *(_DWORD *)buf = 138543618;
        id v35 = v19;
        __int16 v36 = 2114;
        id v37 = v21;
        _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKFetchShareParticipantsOperation will be retried", buf, 0x16u);
      }
      [*(id *)(a1 + 40) markWithReason:@"deferred"];
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __int16 v26 = HMFGetLogIdentifier();
        id v27 = [*(id *)(a1 + 40) identifier];
        id v28 = [v27 shortDescription];
        *(_DWORD *)buf = 138543874;
        id v35 = v26;
        __int16 v36 = 2114;
        id v37 = v28;
        __int16 v38 = 2114;
        id v39 = v3;
        _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKFetchShareParticipantsOperation failed and cannot be retried: %{public}@", buf, 0x20u);
      }
      [*(id *)(a1 + 40) markWithFormat:@"failed with error: %@", v3];
      [*(id *)(a1 + 56) finishWithError:v3];
    }
  }
  else
  {
    if (v7)
    {
      id v22 = HMFGetLogIdentifier();
      id v23 = [*(id *)(a1 + 40) identifier];
      __int16 v24 = [v23 shortDescription];
      id v25 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      id v35 = v22;
      __int16 v36 = 2114;
      id v37 = v24;
      __int16 v38 = 2112;
      id v39 = v25;
      _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchShareParticipantsOperation succeeded with participants: %@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) markWithReason:@"finished"];
    [*(id *)(a1 + 56) finishWithResult:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  }
}

uint64_t ____fetchParticipant_block_invoke_11(void *a1)
{
  return __fetchParticipant(a1[4], a1[5], a1[6], a1[7]);
}

void sub_1D47013F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6701(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6702(uint64_t a1)
{
}

void sub_1D47015EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4701BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4701E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4702098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47023B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47025C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47027C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D470543C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4705518(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __performCloudPull(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  __int16 v50 = a5;
  os_unfair_lock_lock_with_options();
  id v13 = [v10 database];
  __int16 v48 = [v10 hmbModelID];
  os_unfair_lock_unlock(v9 + 2);
  if (!v12)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F653F0]);
    id v15 = [NSString stringWithUTF8String:"__performCloudPull"];
    id v12 = (id)[v14 initWithName:v15];
  }
  __int16 v46 = [MEMORY[0x1E4F1CA48] array];
  id v44 = [MEMORY[0x1E4F1CA48] array];
  id v16 = [MEMORY[0x1E4F1CA48] array];
  id v17 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F1A038]) initWithPreviousServerChangeToken:v11];
  id v20 = [(os_unfair_lock_s *)v9 operationConfigurationWithProcessingOptions:0];
  [v19 setConfiguration:v20];

  [v19 setFetchAllChanges:1];
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = ____performCloudPull_block_invoke;
  v73[3] = &unk_1E69EB558;
  id v21 = v9;
  id v74 = v21;
  id v22 = v12;
  id v75 = v22;
  id v23 = v13;
  id v76 = v23;
  id v24 = v16;
  id v77 = v24;
  [v19 setRecordZoneWithIDChangedBlock:v73];
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = ____performCloudPull_block_invoke_11;
  v67[3] = &unk_1E69EB580;
  id v25 = v21;
  uint64_t v68 = v25;
  id v26 = v22;
  id v69 = v26;
  id v52 = v23;
  id v70 = v52;
  id v27 = v17;
  id v71 = v27;
  id v28 = v18;
  id v72 = v28;
  [v19 setRecordZoneWithIDWasDeletedBlock:v67];
  objc_initWeak(&location, v19);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = ____performCloudPull_block_invoke_12;
  v53[3] = &unk_1E69EB5D0;
  id v29 = v25;
  __int16 v54 = v29;
  id v51 = v26;
  id v55 = v51;
  id v39 = v10;
  id v56 = v39;
  uint64_t v40 = v50;
  long long v57 = v40;
  objc_copyWeak(&v65, &location);
  id v30 = v11;
  id v58 = v30;
  id v43 = v24;
  id v59 = v43;
  id v41 = v48;
  id v60 = v41;
  id v42 = v46;
  id v61 = v42;
  id v45 = v44;
  id v62 = v45;
  id v47 = v27;
  id v63 = v47;
  id v49 = v28;
  id v64 = v49;
  id v31 = (void *)MEMORY[0x1D944CB30]([v19 setFetchDatabaseChangesCompletionBlock:v53]);
  id v32 = v29;
  HMFGetOSLogHandle();
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    id v35 = [v51 identifier];
    __int16 v36 = [v35 shortDescription];
    id v37 = [v52 hmbDescription];
    __int16 v38 = [v19 operationID];
    *(_DWORD *)buf = 138544386;
    id v79 = v34;
    __int16 v80 = 2114;
    id v81 = v36;
    __int16 v82 = 2112;
    id v83 = v37;
    __int16 v84 = 2112;
    id v85 = v30;
    __int16 v86 = 2114;
    id v87 = v38;
    _os_log_impl(&dword_1D4693000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Starting CKFetchDatabaseChangesOperation with database: %@ token: %@ operationID: %{public}@", buf, 0x34u);
  }
  [v52 addOperation:v19];

  objc_destroyWeak(&v65);
  objc_destroyWeak(&location);
}

void sub_1D4705B18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id *location, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id a37)
{
}

void ____performCloudPull_block_invoke(id *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = a1[4];
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = HMFGetLogIdentifier();
    id v8 = [a1[5] identifier];
    id v9 = [v8 shortDescription];
    int v13 = 138543874;
    id v14 = v7;
    __int16 v15 = 2114;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Zone with ID changed: %@", (uint8_t *)&v13, 0x20u);
  }
  id v10 = [HMBCloudZoneID alloc];
  id v11 = [a1[4] containerID];
  id v12 = -[HMBCloudZoneID initWithContainerID:scope:zoneID:](v10, "initWithContainerID:scope:zoneID:", v11, [a1[6] scope], v3);

  [a1[7] addObject:v12];
}

void ____performCloudPull_block_invoke_11(id *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = a1[4];
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = HMFGetLogIdentifier();
    id v8 = [a1[5] identifier];
    id v9 = [v8 shortDescription];
    int v23 = 138543874;
    id v24 = v7;
    __int16 v25 = 2114;
    id v26 = v9;
    __int16 v27 = 2112;
    id v28 = v3;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Zone with ID was deleted: %@", (uint8_t *)&v23, 0x20u);
  }
  id v10 = [HMBCloudZoneID alloc];
  id v11 = [a1[4] containerID];
  id v12 = -[HMBCloudZoneID initWithContainerID:scope:zoneID:](v10, "initWithContainerID:scope:zoneID:", v11, [a1[6] scope], v3);

  [a1[7] addObject:v12];
  int v13 = (os_unfair_lock_s *)((char *)a1[4] + 8);
  os_unfair_lock_lock_with_options();
  id v14 = [a1[4] zoneStateByZoneID];
  __int16 v15 = [v14 objectForKey:v12];
  id v16 = [v15 hmbModelID];

  os_unfair_lock_unlock(v13);
  if (v16)
  {
    [a1[8] addObject:v16];
  }
  else
  {
    __int16 v17 = (void *)MEMORY[0x1D944CB30]();
    id v18 = a1[4];
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      id v21 = [a1[5] identifier];
      id v22 = [v21 shortDescription];
      int v23 = 138543874;
      id v24 = v20;
      __int16 v25 = 2114;
      id v26 = v22;
      __int16 v27 = 2112;
      id v28 = v12;
      _os_log_impl(&dword_1D4693000, v19, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Got a zone deletion for a non-existent zone ID: %@", (uint8_t *)&v23, 0x20u);
    }
  }
}

void sub_1D4705FAC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ____performCloudPull_block_invoke_12(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v83 = a2;
  id v84 = a4;
  id v6 = (void *)MEMORY[0x1D944CB30]();
  uint64_t v86 = a1;
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [*(id *)(a1 + 40) identifier];
    id v11 = [v10 shortDescription];
    id v12 = HMFBooleanToString();
    *(_DWORD *)buf = 138544386;
    id v100 = v9;
    __int16 v101 = 2114;
    uint64_t v102 = v11;
    __int16 v103 = 2112;
    id v104 = v83;
    __int16 v105 = 2112;
    id v106 = v12;
    __int16 v107 = 2114;
    id v108 = v84;
    _os_log_impl(&dword_1D4693000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetch database changes operation completed with token: %@ moreComing: %@ error: %{public}@", buf, 0x34u);
  }
  if (v84)
  {
    int v13 = (void *)MEMORY[0x1D944CB30]();
    id v14 = *(id *)(v86 + 32);
    __int16 v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = HMFGetLogIdentifier();
      __int16 v17 = [*(id *)(v86 + 40) identifier];
      id v18 = [v17 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v100 = v16;
      __int16 v101 = 2114;
      uint64_t v102 = v18;
      __int16 v103 = 2114;
      id v104 = v84;
      _os_log_impl(&dword_1D4693000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchDatabaseChangesOperation failed: %{public}@", buf, 0x20u);
    }
    if ([v84 hmbIsCKChangeTokenExpiredError])
    {
      uint64_t v19 = (void *)MEMORY[0x1D944CB30]();
      id v20 = *(id *)(v86 + 32);
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v22 = HMFGetLogIdentifier();
        int v23 = [*(id *)(v86 + 40) identifier];
        id v24 = [v23 shortDescription];
        *(_DWORD *)buf = 138543618;
        id v100 = v22;
        __int16 v101 = 2114;
        uint64_t v102 = v24;
        _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Retrying CKFetchDatabaseChangesOperation with nil change token due to expired change token error", buf, 0x16u);
      }
      __performCloudPull(*(void *)(v86 + 32), *(void *)(v86 + 48), 0, *(void *)(v86 + 40), *(void *)(v86 + 56));
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v86 + 120));
      if (!WeakRetained)
      {
        _HMFPreconditionFailure();
        __break(1u);
      }
      id v69 = *(void **)(v86 + 32);
      v91[0] = MEMORY[0x1E4F143A8];
      v91[1] = 3221225472;
      v91[2] = ____performCloudPull_block_invoke_14;
      v91[3] = &unk_1E69EB5A8;
      id v92 = v69;
      id v93 = *(id *)(v86 + 48);
      id v94 = *(id *)(v86 + 64);
      id v95 = *(id *)(v86 + 40);
      id v96 = *(id *)(v86 + 56);
      int v70 = [v92 retryCloudKitOperation:WeakRetained afterError:v84 retryBlock:v91];
      id v71 = (void *)MEMORY[0x1D944CB30]();
      id v72 = *(id *)(v86 + 32);
      __int16 v73 = HMFGetOSLogHandle();
      id v74 = v73;
      if (v70)
      {
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          id v75 = HMFGetLogIdentifier();
          id v76 = [*(id *)(v86 + 40) identifier];
          id v77 = [v76 shortDescription];
          *(_DWORD *)buf = 138543618;
          id v100 = v75;
          __int16 v101 = 2114;
          uint64_t v102 = v77;
          _os_log_impl(&dword_1D4693000, v74, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKFetchDatabaseChangesOperation will be retried", buf, 0x16u);
        }
        [*(id *)(v86 + 40) markWithReason:@"deferred"];
      }
      else
      {
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          id v78 = HMFGetLogIdentifier();
          id v79 = [*(id *)(v86 + 40) identifier];
          __int16 v80 = [v79 shortDescription];
          *(_DWORD *)buf = 138543874;
          id v100 = v78;
          __int16 v101 = 2114;
          uint64_t v102 = v80;
          __int16 v103 = 2114;
          id v104 = v84;
          _os_log_impl(&dword_1D4693000, v74, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKFetchDatabaseChangesOperation failed and cannot be retried: %{public}@", buf, 0x20u);
        }
        [*(id *)(v86 + 40) markWithFormat:@"failed with error: %@", v84];
        [*(id *)(v86 + 56) finishWithError:v84];
      }
    }
  }
  else
  {
    uint64_t v25 = v86;
    locuint64_t k = (os_unfair_lock_s *)(*(void *)(v86 + 32) + 8);
    os_unfair_lock_lock_with_options();
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v26 = (void *)[*(id *)(v86 + 72) copy];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v87 objects:v98 count:16];
    if (v27)
    {
      uint64_t v85 = *(void *)v88;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v88 != v85) {
            objc_enumerationMutation(v26);
          }
          uint64_t v29 = *(void **)(*((void *)&v87 + 1) + 8 * i);
          id v30 = [*(id *)(v25 + 32) zoneStateByZoneID];
          id v31 = [v30 objectForKeyedSubscript:v29];
          BOOL v32 = v31 == 0;

          if (v32)
          {
            id v33 = (void *)MEMORY[0x1D944CB30]();
            id v34 = *(id *)(v86 + 32);
            HMFGetOSLogHandle();
            id v35 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              id v36 = (id)objc_claimAutoreleasedReturnValue();
              id v37 = [*(id *)(v86 + 40) identifier];
              __int16 v38 = [v37 shortDescription];
              *(_DWORD *)buf = 138543874;
              id v100 = v36;
              __int16 v101 = 2114;
              uint64_t v102 = v38;
              __int16 v103 = 2112;
              id v104 = v29;
              _os_log_impl(&dword_1D4693000, v35, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Zone with ID was created: %@", buf, 0x20u);
            }
            id v39 = [HMBCloudZoneStateModel alloc];
            uint64_t v40 = [v29 modelID];
            id v41 = [(HMBCloudZoneStateModel *)v39 initWithModelID:v40 parentModelID:*(void *)(v86 + 80)];

            [(HMBCloudZoneStateModel *)v41 setZoneID:v29];
            [*(id *)(v86 + 88) addObject:v29];
            id v42 = [*(id *)(v86 + 32) zoneStateByZoneID];
            [v42 setObject:v41 forKeyedSubscript:v29];

            [*(id *)(v86 + 96) addObject:v41];
            [*(id *)(v86 + 72) removeObject:v29];
          }
          uint64_t v25 = v86;
        }
        uint64_t v27 = [v26 countByEnumeratingWithState:&v87 objects:v98 count:16];
      }
      while (v27);
    }

    id v43 = [*(id *)(v86 + 32) stateZone];
    id v44 = [v43 update:*(void *)(v86 + 96)];

    if (v44)
    {
      id v45 = (void *)MEMORY[0x1D944CB30]();
      id v46 = *(id *)(v86 + 32);
      HMFGetOSLogHandle();
      id v47 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v48 = (id)objc_claimAutoreleasedReturnValue();
        id v49 = [*(id *)(v86 + 40) identifier];
        __int16 v50 = [v49 shortDescription];
        id v51 = *(void **)(v86 + 96);
        *(_DWORD *)buf = 138544130;
        id v100 = v48;
        __int16 v101 = 2114;
        uint64_t v102 = v50;
        __int16 v103 = 2112;
        id v104 = v51;
        __int16 v105 = 2114;
        id v106 = v44;
        _os_log_impl(&dword_1D4693000, v47, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to add created zone models to local DB %@: %{public}@", buf, 0x2Au);
      }
    }

    os_unfair_lock_unlock(lock);
    [*(id *)(v86 + 32) handleRemovedZoneIDs:*(void *)(v86 + 104) userInitiated:0];
    [*(id *)(v86 + 32) handleUpdatedZonesIDs:*(void *)(v86 + 72)];
    [*(id *)(v86 + 32) handleCreatedZoneIDs:*(void *)(v86 + 88)];
    locka = (os_unfair_lock_s *)(*(void *)(v86 + 32) + 8);
    os_unfair_lock_lock_with_options();
    if (v83) {
      objc_msgSend(*(id *)(v86 + 48), "setServerChangeToken:");
    }
    id v52 = [*(id *)(v86 + 32) stateZone];
    uint64_t v97 = *(void *)(v86 + 48);
    id v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
    __int16 v54 = [v52 update:v53 remove:*(void *)(v86 + 112)];

    if (v54)
    {
      id v55 = (void *)MEMORY[0x1D944CB30]();
      id v56 = *(id *)(v86 + 32);
      HMFGetOSLogHandle();
      long long v57 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v58 = (id)objc_claimAutoreleasedReturnValue();
        id v59 = [*(id *)(v86 + 40) identifier];
        id v60 = [v59 shortDescription];
        id v61 = *(void **)(v86 + 112);
        *(_DWORD *)buf = 138544130;
        id v100 = v58;
        __int16 v101 = 2114;
        uint64_t v102 = v60;
        __int16 v103 = 2112;
        id v104 = v61;
        __int16 v105 = 2114;
        id v106 = v54;
        _os_log_impl(&dword_1D4693000, v57, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to remove zone model IDs from local DB %@: %{public}@", buf, 0x2Au);
      }
    }

    os_unfair_lock_unlock(locka);
    id v62 = (void *)MEMORY[0x1D944CB30]();
    id v63 = *(id *)(v86 + 32);
    id v64 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      id v65 = HMFGetLogIdentifier();
      uint64_t v66 = [*(id *)(v86 + 40) identifier];
      id v67 = [v66 shortDescription];
      *(_DWORD *)buf = 138543618;
      id v100 = v65;
      __int16 v101 = 2114;
      uint64_t v102 = v67;
      _os_log_impl(&dword_1D4693000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchDatabaseChangesOperation succeeded", buf, 0x16u);
    }
    [*(id *)(v86 + 56) finishWithNoResult];
  }
}

void sub_1D4706BBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
}

uint64_t ____performCloudPull_block_invoke_14(void *a1)
{
  return __performCloudPull(a1[4], a1[5], a1[6], a1[7], a1[8]);
}

void sub_1D470865C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4708710(_Unwind_Exception *a1)
{
}

void sub_1D4708BF4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t __open(void *a1, void *a2)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v63 = 0;
  uint64_t v4 = __sqlite3Open(v3, 0, &v63);
  id v5 = v63;
  id v6 = v5;
  if (v4)
  {
    [v3 setConnection:v4];
    id v7 = (sqlite3 *)[v3 connection];
    id v62 = v6;
    id v8 = selectSQLite3(v7, "PRAGMA user_version", MEMORY[0x1E4F1CC08], &v62);;
    id v9 = v62;

    id v10 = [v8 firstObject];
    id v11 = [v10 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;

    id v14 = (void *)MEMORY[0x1D944CB30]();
    id v15 = v3;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v65 = v17;
      __int16 v66 = 2112;
      id v67 = v13;
      _os_log_impl(&dword_1D4693000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Current schema version: %@", buf, 0x16u);
    }
    id v61 = v9;
    uint64_t v18 = objc_msgSend(v15, "migrateFromSchemaVersion:error:", objc_msgSend(v13, "integerValue"), &v61);
    id v6 = v61;

    if (v18 == 2)
    {
      __int16 v38 = (void *)MEMORY[0x1D944CB30]();
      id v39 = v15;
      uint64_t v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        id v41 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v65 = v41;
        __int16 v66 = 2112;
        id v67 = v39;
        _os_log_impl(&dword_1D4693000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@Migration needs reopen for context %@", buf, 0x16u);
      }
      sqlite3_close(v4);
    }
    else
    {
      if (v18 != 1)
      {
        if (v18)
        {
          uint64_t v23 = 1;
        }
        else
        {
          uint64_t v19 = (void *)MEMORY[0x1D944CB30]();
          id v20 = v15;
          id v21 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            id v22 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            id v65 = v22;
            __int16 v66 = 2112;
            id v67 = v20;
            __int16 v68 = 2114;
            id v69 = v6;
            _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_ERROR, "%{public}@Migration failed for context %@: %{public}@", buf, 0x20u);
          }
          uint64_t v23 = 0;
          if (a2) {
            *a2 = v6;
          }
        }
        goto LABEL_37;
      }
      id v42 = (void *)MEMORY[0x1D944CB30]();
      id v39 = v15;
      id v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        id v44 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v65 = v44;
        __int16 v66 = 2112;
        id v67 = v39;
        _os_log_impl(&dword_1D4693000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@Migration needs re-init for context %@", buf, 0x16u);
      }
      sqlite3_close(v4);
      id v45 = [v39 url];
      __clean(v45);
    }
    uint64_t v23 = __open(v39, a2);
LABEL_37:

    goto LABEL_38;
  }
  id v24 = [v5 userInfo];
  uint64_t v25 = objc_msgSend(v24, "hmf_numberForKey:", @"extcode");
  uint64_t v26 = [v25 integerValue];

  if (v26 != 14)
  {
    if (a2)
    {
LABEL_36:
      id v6 = v6;
      uint64_t v23 = 0;
      *a2 = v6;
      goto LABEL_38;
    }
LABEL_49:
    uint64_t v23 = 0;
    goto LABEL_38;
  }

  id v60 = 0;
  uint64_t v27 = __sqlite3Open(v3, 1, &v60);
  id v28 = v60;
  uint64_t v29 = [v3 url];
  id v30 = [v29 scheme];
  char v31 = [v30 isEqualToString:@"memory"];

  if ((v31 & 1) == 0)
  {
    id v59 = v28;
    BOOL v32 = selectSQLite3(v27, "PRAGMA journal_mode=WAL", MEMORY[0x1E4F1CC08], &v59);;
    id v6 = v59;

    if (v32)
    {
      id v33 = (void *)MEMORY[0x1D944CB30]();
      id v34 = v3;
      id v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        id v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v65 = v36;
        __int16 v66 = 2112;
        id v67 = v34;
        _os_log_impl(&dword_1D4693000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@Re-opening newly created database after successfully turning on WAL for context: %@", buf, 0x16u);
      }
      sqlite3_close(v27);
      id v58 = v6;
      uint64_t v27 = __sqlite3Open(v34, 0, &v58);
      id v28 = v58;

      if (v27)
      {

        goto LABEL_21;
      }
      if (a2) {
        *a2 = v28;
      }
      id v51 = (void *)MEMORY[0x1D944CB30]();
      id v55 = v34;
      id v53 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        id v56 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v65 = v56;
        __int16 v66 = 2112;
        id v67 = v55;
        __int16 v68 = 2114;
        id v69 = v28;
        _os_log_impl(&dword_1D4693000, v53, OS_LOG_TYPE_ERROR, "%{public}@Failed re-open of WAL-enabled context %@: %{public}@", buf, 0x20u);
      }
      id v6 = v28;
    }
    else
    {
      if (a2) {
        *a2 = v6;
      }
      id v51 = (void *)MEMORY[0x1D944CB30]();
      id v52 = v3;
      id v53 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        __int16 v54 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v65 = v54;
        __int16 v66 = 2112;
        id v67 = v52;
        __int16 v68 = 2114;
        id v69 = v6;
        _os_log_impl(&dword_1D4693000, v53, OS_LOG_TYPE_ERROR, "%{public}@Failed to turn on WAL for context %@: %{public}@", buf, 0x20u);
      }
    }

    goto LABEL_49;
  }
LABEL_21:
  [v3 setConnection:v27];
  id v57 = v28;
  char v37 = [v3 initializeNewlyCreatedDatabaseWithError:&v57];
  id v6 = v57;

  if ((v37 & 1) == 0)
  {
    id v46 = (void *)MEMORY[0x1D944CB30]();
    id v47 = v3;
    id v48 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      id v49 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v65 = v49;
      __int16 v66 = 2112;
      id v67 = v47;
      __int16 v68 = 2112;
      id v69 = v6;
      _os_log_impl(&dword_1D4693000, v48, OS_LOG_TYPE_ERROR, "%{public}@Failed to initialize newly created database for context %@: %@", buf, 0x20u);
    }
    if (a2) {
      goto LABEL_36;
    }
    goto LABEL_49;
  }
  uint64_t v23 = 1;
LABEL_38:

  return v23;
}

sqlite3 *__sqlite3Open(void *a1, int a2, void *a3)
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = v5;
  if (a2) {
    int v7 = 6;
  }
  else {
    int v7 = 2;
  }
  ppDb = 0;
  id v8 = [v5 url];
  id v9 = [v8 scheme];
  int v10 = [v9 isEqualToString:@"memory"];

  if (v10)
  {
    if ((a2 & 1) == 0)
    {
      uint64_t v25 = (void *)MEMORY[0x1D944CB30]();
      id v26 = v6;
      uint64_t v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v41 = v28;
        _os_log_impl(&dword_1D4693000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to open memory database with create == NO", buf, 0xCu);
      }
      if (a3)
      {
        uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
        id v48 = @"extcode";
        v49[0] = &unk_1F2C4CB10;
        id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:&v48 count:1];
        *a3 = [v29 hmfErrorWithCode:3 userInfo:v30];
      }
      goto LABEL_25;
    }
    id v11 = ":memory:";
  }
  else
  {
    id v12 = [v6 url];
    id v11 = (const char *)[v12 fileSystemRepresentation];
  }
  uint64_t v13 = sqlite3_open_v2(v11, &ppDb, v7, 0);
  if (v13)
  {
    uint64_t v14 = v13;
    if (v13 == 14 && (a2 & 1) == 0)
    {
      id v15 = (void *)MEMORY[0x1D944CB30]();
      id v36 = v6;
      __int16 v17 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      uint64_t v18 = HMFGetLogIdentifier();
      char v37 = ppDb;
      id v20 = [v36 url];
      id v21 = [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Status:14];
      *(_DWORD *)buf = 138544130;
      id v41 = v18;
      __int16 v42 = 2048;
      id v43 = v37;
      __int16 v44 = 2112;
      id v45 = v20;
      __int16 v46 = 2114;
      id v47 = v21;
      id v22 = "%{public}@Can't open context %p without creating because no database exists already at %@: %{public}@";
      uint64_t v23 = v17;
      os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      id v15 = (void *)MEMORY[0x1D944CB30]();
      id v16 = v6;
      __int16 v17 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      uint64_t v18 = HMFGetLogIdentifier();
      uint64_t v19 = ppDb;
      id v20 = [v16 url];
      id v21 = [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Status:v14];
      *(_DWORD *)buf = 138544130;
      id v41 = v18;
      __int16 v42 = 2048;
      id v43 = v19;
      __int16 v44 = 2112;
      id v45 = v20;
      __int16 v46 = 2114;
      id v47 = v21;
      id v22 = "%{public}@Failed to open context %p at %@: %{public}@";
      uint64_t v23 = v17;
      os_log_type_t v24 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_1D4693000, v23, v24, v22, buf, 0x2Au);

LABEL_23:
    sqlite3_close(ppDb);
    if (a3)
    {
      [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Status:v14];
      id v35 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
LABEL_25:
    id v35 = 0;
    goto LABEL_26;
  }
  char v31 = (void *)MEMORY[0x1D944CB30]([v6 setConnection:ppDb]);
  BOOL v32 = v6;
  id v33 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    id v34 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v41 = v34;
    __int16 v42 = 2112;
    id v43 = v32;
    _os_log_impl(&dword_1D4693000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully opened sqlite database handle for context: %@", buf, 0x16u);
  }
  id v35 = ppDb;
LABEL_26:

  return v35;
}

id selectSQLite3(sqlite3 *a1, const char *a2, void *a3, void *a4)
{
  v67[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  __removeExtraWhitespace(a2);
  id v8 = objc_claimAutoreleasedReturnValue();
  id v9 = (const char *)[v8 UTF8String];
  int v10 = [MEMORY[0x1E4F1CA48] array];
  id v11 = 0;
  id v12 = 0;
  ppStmt = 0;
  if (*a4) {
    goto LABEL_50;
  }
  if (sqlite3_prepare_v2(a1, v9, -1, &ppStmt, 0))
  {
    [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Connection:a1 statement:v9];
    id v11 = 0;
    id v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_50;
  }
  id v60 = v10;
  int v13 = sqlite3_bind_parameter_count(ppStmt);
  if (v13 >= 2)
  {
    int v14 = v13;
    unsigned int v15 = 1;
    unint64_t v16 = 0x1E4F29000uLL;
    uint64_t v56 = *MEMORY[0x1E4F64ED0];
    while (1)
    {
      if (*a4)
      {
LABEL_47:
        id v11 = 0;
LABEL_49:
        id v12 = 0;
        int v10 = v60;
        goto LABEL_50;
      }
      __int16 v17 = sqlite3_bind_parameter_name(ppStmt, v15);
      if (!v17)
      {
        id v43 = (void *)MEMORY[0x1E4F28C58];
        v67[0] = &unk_1F2C4CAF8;
        v66[0] = @"extcode";
        v66[1] = @"text";
        __int16 v44 = objc_msgSend(*(id *)(v16 + 24), "stringWithFormat:", @"statement cannot contain nameless parameters (%ld is nameless)", v15);
        v67[1] = v44;
        v66[2] = @"statement";
        id v45 = [*(id *)(v16 + 24) stringWithUTF8String:v9];
        v67[2] = v45;
        __int16 v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:3];
        *a4 = [v43 errorWithDomain:v56 code:3 userInfo:v46];

        goto LABEL_47;
      }
      uint64_t v18 = v17;
      uint64_t v19 = [*(id *)(v16 + 24) stringWithUTF8String:v17];
      id v20 = [v7 objectForKey:v19];

      if (v20)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
      }
      sqlite3_bind_null(ppStmt, v15);
LABEL_24:

      if (v14 == ++v15) {
        goto LABEL_32;
      }
    }
    id v21 = v20;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      uint64_t v23 = v21;
    }
    else {
      uint64_t v23 = 0;
    }
    id v59 = v23;

    if (isKindOfClass)
    {
      hmbBindDataSQLite3(ppStmt, v15, v21, a4);
    }
    else
    {
      id v24 = v21;
      objc_opt_class();
      char v25 = objc_opt_isKindOfClass();
      if (v25) {
        id v26 = v24;
      }
      else {
        id v26 = 0;
      }
      id v27 = v26;

      if (v25)
      {
        hmbBindStringSQLite3(ppStmt, v15, v24, a4);
        goto LABEL_22;
      }
      id v57 = v9;
      id v28 = v24;
      objc_opt_class();
      char v29 = objc_opt_isKindOfClass();
      if (v29) {
        id v30 = v28;
      }
      else {
        id v30 = 0;
      }
      id v31 = v30;

      if (v29)
      {
        hmbBindIntSQLite3(ppStmt, v15, [v28 longLongValue], a4);
        id v24 = 0;
        id v9 = v57;
        goto LABEL_23;
      }
      __int16 v54 = (void *)MEMORY[0x1E4F28C58];
      v65[0] = &unk_1F2C4CAF8;
      v64[0] = @"extcode";
      v64[1] = @"text";
      BOOL v32 = NSString;
      id v33 = (objc_class *)objc_opt_class();
      id v55 = NSStringFromClass(v33);
      id v53 = [v32 stringWithFormat:@"bind parameter %s is not of a recognized type %@ is not a (NSNull, NSData, NSString, or NSNumber)", v18, v55];
      v65[1] = v53;
      v64[2] = @"statement";
      id v9 = v57;
      id v34 = [NSString stringWithUTF8String:v57];
      v65[2] = v34;
      id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:3];
      *a4 = [v54 errorWithDomain:v56 code:3 userInfo:v35];
    }
    id v24 = 0;
LABEL_22:
    id v28 = 0;
LABEL_23:

    unint64_t v16 = 0x1E4F29000;
    goto LABEL_24;
  }
LABEL_32:
  int v10 = v60;
  if (*a4)
  {
    id v11 = 0;
    id v12 = 0;
  }
  else
  {
    id v58 = v9;
    id v36 = 0;
    uint64_t v37 = sqlite3_column_count(ppStmt);
    while (1)
    {
      int v38 = sqlite3_step(ppStmt);
      if (v38 != 100) {
        break;
      }
      id v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v37];

      if ((int)v37 >= 1)
      {
        uint64_t v39 = 0;
        do
        {
          int v40 = sqlite3_column_type(ppStmt, v39);
          switch(v40)
          {
            case 1:
              uint64_t v41 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", sqlite3_column_int64(ppStmt, v39));
              break;
            case 2:
              uint64_t v41 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", sqlite3_column_double(ppStmt, v39));
              break;
            case 3:
              uint64_t v41 = [NSString hmbStringWithSQLite3Column:ppStmt column:v39];
              break;
            case 4:
              uint64_t v41 = [MEMORY[0x1E4F1C9B8] hmbDataWithSQLite3Column:ppStmt column:v39];
              break;
            case 5:
              uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
              break;
            default:
              id v47 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v48 = *MEMORY[0x1E4F64ED0];
              v63[0] = &unk_1F2C4CAF8;
              v62[0] = @"extcode";
              v62[1] = @"text";
              id v49 = objc_msgSend(NSString, "stringWithFormat:", @"column %ld is of SQLite3 type %ld (not recognized)", v39, v40);
              v63[1] = v49;
              v62[2] = @"statement";
              __int16 v50 = [NSString stringWithUTF8String:v58];
              v63[2] = v50;
              id v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:3];
              *a4 = [v47 errorWithDomain:v48 code:3 userInfo:v51];

              goto LABEL_49;
          }
          __int16 v42 = (void *)v41;
          [v11 addObject:v41];

          uint64_t v39 = (v39 + 1);
        }
        while (v37 != v39);
      }
      int v10 = v60;
      [v60 addObject:v11];
      id v36 = v11;
    }
    if (v38 != 101)
    {
      *a4 = [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Statement:ppStmt];
    }
    sqlite3_finalize(ppStmt);
    if (*a4) {
      id v12 = 0;
    }
    else {
      id v12 = v10;
    }
    id v11 = v36;
  }
LABEL_50:

  return v12;
}

void __clean(void *a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = [v1 lastPathComponent];
  uint64_t v4 = [v1 URLByDeletingLastPathComponent];
  id v43 = 0;
  id v5 = [v2 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:0 options:0 error:&v43];
  id v6 = v43;
  BOOL v32 = v3;
  if (v5)
  {
    id v26 = v4;
    id v27 = v1;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    char v25 = v5;
    obuint64_t j = v5;
    uint64_t v30 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v30)
    {
      uint64_t v29 = *(void *)v40;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v40 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v31 = v7;
          id v8 = *(void **)(*((void *)&v39 + 1) + 8 * v7);
          id v9 = [v8 lastPathComponent];
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          v44[0] = &stru_1F2C3E4E0;
          v44[1] = @"-shm";
          v44[2] = @"-wal";
          id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
          uint64_t v10 = [v33 countByEnumeratingWithState:&v35 objects:v45 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v36;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v36 != v12) {
                  objc_enumerationMutation(v33);
                }
                int v14 = [v3 stringByAppendingString:*(void *)(*((void *)&v35 + 1) + 8 * i)];
                int v15 = [v9 isEqualToString:v14];

                if (v15)
                {
                  id v34 = v6;
                  char v16 = [v2 removeItemAtURL:v8 error:&v34];
                  id v17 = v34;

                  if ((v16 & 1) == 0)
                  {
                    uint64_t v18 = (void *)MEMORY[0x1D944CB30]();
                    uint64_t v19 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                    {
                      HMFGetLogIdentifier();
                      id v21 = v20 = v2;
                      *(_DWORD *)buf = 138543874;
                      uint64_t v48 = v21;
                      __int16 v49 = 2112;
                      __int16 v50 = v8;
                      __int16 v51 = 2112;
                      id v52 = v17;
                      _os_log_impl(&dword_1D4693000, v19, OS_LOG_TYPE_ERROR, "%{public}@unable to remove %@: %@", buf, 0x20u);

                      uint64_t v2 = v20;
                      id v3 = v32;
                    }
                  }
                  id v6 = v17;
                }
              }
              uint64_t v11 = [v33 countByEnumeratingWithState:&v35 objects:v45 count:16];
            }
            while (v11);
          }

          uint64_t v7 = v31 + 1;
        }
        while (v31 + 1 != v30);
        uint64_t v30 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v30);
    }

    uint64_t v4 = v26;
    id v1 = v27;
    id v5 = v25;
  }
  else
  {
    id v22 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v48 = v24;
      __int16 v49 = 2112;
      __int16 v50 = v4;
      __int16 v51 = 2112;
      id v52 = v6;
      _os_log_impl(&dword_1D4693000, v23, OS_LOG_TYPE_ERROR, "%{public}@unable to get files in %@ (%@)", buf, 0x20u);

      id v3 = v32;
    }
  }
}

id __removeExtraWhitespace(const char *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28E78] stringWithCapacity:strlen(a1)];
  char v3 = *a1;
  if (*a1)
  {
    BOOL v4 = 0;
    id v5 = (unsigned __int8 *)(a1 + 1);
    uint64_t v6 = MEMORY[0x1E4F14390];
    do
    {
      uint64_t v7 = v3;
      if (v3 < 0) {
        int v8 = __maskrune(v3, 0x4000uLL);
      }
      else {
        int v8 = *(_DWORD *)(v6 + 4 * v7 + 60) & 0x4000;
      }
      BOOL v9 = v8 != 0;
      if (v8)
      {
        if (!v4) {
          [v2 appendString:@" "];
        }
      }
      else
      {
        objc_msgSend(v2, "appendFormat:", @"%c", v7);
      }
      int v10 = *v5++;
      char v3 = v10;
      BOOL v4 = v9;
    }
    while (v10);
  }
  return v2;
}

uint64_t hmbBindDataSQLite3(sqlite3_stmt *a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = v7;
  if (!*a4)
  {
    id v11 = v7;
    if (v7)
    {
      if ([v7 length])
      {
        if ([v11 length])
        {
          id v9 = v11;
          id v7 = (id)sqlite3_bind_blob64(a1, a2, (const void *)[v9 bytes], objc_msgSend(v9, "length"), 0);
        }
        else
        {
          id v7 = (id)sqlite3_bind_zeroblob(a1, a2, 0);
        }
      }
      else
      {
        id v7 = (id)sqlite3_bind_zeroblob64(a1, a2, 0);
      }
    }
    else
    {
      id v7 = (id)sqlite3_bind_null(a1, a2);
    }
    id v8 = v11;
    if (v7)
    {
      id v7 = [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Statement:a1];
      id v8 = v11;
      *a4 = v7;
    }
  }
  return MEMORY[0x1F41817F8](v7, v8);
}

uint64_t hmbBindStringSQLite3(sqlite3_stmt *a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = v7;
  if (!*a4)
  {
    id v10 = v7;
    id v7 = v7
       ? (id) sqlite3_bind_text(a1, a2, (const char *)[v7 UTF8String], -1, 0)
       : (id)sqlite3_bind_null(a1, a2);
    id v8 = v10;
    if (v7)
    {
      id v7 = [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Statement:a1];
      id v8 = v10;
      *a4 = v7;
    }
  }
  return MEMORY[0x1F41817F8](v7, v8);
}

sqlite3_stmt *hmbBindIntSQLite3(sqlite3_stmt *result, int a2, sqlite3_int64 a3, void *a4)
{
  if (!*a4)
  {
    id v5 = result;
    result = (sqlite3_stmt *)sqlite3_bind_int64(result, a2, a3);
    if (result)
    {
      result = [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Statement:v5];
      *a4 = result;
    }
  }
  return result;
}

void sub_1D470A7C0(_Unwind_Exception *a1)
{
}

void hmbBindUUIDSQLite3(sqlite3_stmt *a1, int a2, void *a3, void *a4)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = v7;
  if (!*a4)
  {
    if (!v7)
    {
      if (!sqlite3_bind_null(a1, a2)) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    v9[0] = 0;
    v9[1] = 0;
    [v7 getUUIDBytes:v9];
    if (sqlite3_bind_blob64(a1, a2, v9, 0x10uLL, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
LABEL_4:
      *a4 = [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Statement:a1];
    }
  }
LABEL_5:
}

uint64_t hmbBindIntNumberSQLite3(sqlite3_stmt *a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = v7;
  if (!*a4)
  {
    id v10 = v7;
    id v7 = v7 ? (id)sqlite3_bind_int64(a1, a2, [v7 unsignedIntegerValue]) : (id)sqlite3_bind_null(a1, a2);
    id v8 = v10;
    if (v7)
    {
      id v7 = [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Statement:a1];
      id v8 = v10;
      *a4 = v7;
    }
  }
  return MEMORY[0x1F41817F8](v7, v8);
}

sqlite3_stmt *prepareSQLite3(sqlite3 *a1, const char *a2, void *a3)
{
  ppStmt = 0;
  __removeExtraWhitespace(a2);
  id v6 = objc_claimAutoreleasedReturnValue();
  if (sqlite3_prepare_v2(a1, (const char *)[v6 UTF8String], -1, &ppStmt, 0))
  {
    if (a3)
    {
      [MEMORY[0x1E4F28C58] hmbErrorWithSQLite3Connection:a1 statement:a2];
      id v7 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = ppStmt;
  }

  return v7;
}

void sub_1D470B7B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7336(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7337(uint64_t a1)
{
}

void sub_1D470BE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D470C044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D470C280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D470C474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D470C680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __modelsFromRecords(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a1;
  id v7 = a2;
  objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v7, "count"));
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        int v14 = v11;
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        char v16 = (void *)MEMORY[0x1D944CB30]();
        id v21 = v14;
        id v17 = [v6 modelFromRecord:v15 storageLocation:2 error:&v21];
        id v11 = v21;

        if (v17)
        {
          if (!a3 || (objc_opt_isKindOfClass() & 1) != 0) {
            [v20 addObject:v17];
          }
        }
        else if (![v11 isHMFError] || objc_msgSend(v11, "code") != 2)
        {

          goto LABEL_16;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v11 = 0;
  }

  if (!v20)
  {
LABEL_16:
    if (a4)
    {
      id v11 = v11;
      id v20 = 0;
      *a4 = v11;
    }
    else
    {
      id v20 = 0;
    }
  }

  return v20;
}

void sub_1D470CA94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D470CCAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D470CF00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D470D610(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

BOOL __execAndSetError(void *a1, sqlite3_stmt *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a3;
  if (!v8)
  {
    uint64_t v9 = [v7 execSQLite3:a2];
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  uint64_t v9 = v8;
  uint64_t v10 = (void *)MEMORY[0x1D944CB30]();
  id v11 = v7;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    int v15 = 138543874;
    char v16 = v13;
    __int16 v17 = 2080;
    uint64_t v18 = sqlite3_sql(a2);
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_INFO, "%{public}@ignoring exec due to previous error %s: %@", (uint8_t *)&v15, 0x20u);
  }
  if (a4)
  {
LABEL_7:
    if (v9) {
      *a4 = v9;
    }
  }
LABEL_9:

  return v9 == 0;
}

void sub_1D470D910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D470DB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7521(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7522(uint64_t a1)
{
}

void sub_1D470DDC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D470DF48(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D470E0AC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D470E2CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D470E5B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D470E888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D470EA38(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D470EB98(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D470ECF8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D470EF14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D470F1B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __execRowAndSetError(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a3;
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    id v18 = 0;
    uint64_t v10 = [v7 insertSQLite3:a2 error:&v18];
    id v11 = v18;
    if (!v10)
    {
      int v13 = (void *)MEMORY[0x1D944CB30]();
      id v14 = v7;
      int v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        char v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v20 = v16;
        __int16 v21 = 2114;
        id v22 = v11;
        _os_log_impl(&dword_1D4693000, v15, OS_LOG_TYPE_ERROR, "%{public}@Error executing statement: %{public}@", buf, 0x16u);
      }
      if (a4)
      {
        if (v11)
        {
          *a4 = v11;
        }
        else
        {
          id v17 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
          *a4 = v17;
        }
      }
    }
  }
  return v10;
}

void sub_1D470F594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D470F7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D470F9EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D470FC80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4710100(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D47102A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4710578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D471081C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47109A4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D4710B04(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D4710C68(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D4710E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4711044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4711378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4711614(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D47117CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47139E8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D4713C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7742(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7743(uint64_t a1)
{
}

void sub_1D4713F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47141DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4714510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D471485C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4714BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4714EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D471516C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D471543C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4715734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4715CDC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D4715EF8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D47160FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D4716474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D471666C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D471688C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4716AE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4716CB8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D4716EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D471712C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D471734C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D471756C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47178BC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

__CFString *HMBStringFromLoggingVisibility(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<UNKNOWN %lu>", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E69EBC18[a1];
  }
  return v1;
}

void sub_1D471A7F4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D471A9BC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __unregisterSubscriptionForSubscriptionID(void *a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = [(os_unfair_lock_s *)v5 initialCloudSyncFuture];
  char v9 = [v8 isFinished];

  if ((v9 & 1) == 0) {
    _HMFPreconditionFailure();
  }
  os_unfair_lock_lock_with_options();
  uint64_t v10 = [v7 subscriptions];
  os_unfair_lock_unlock(v5 + 2);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = ____unregisterSubscriptionForSubscriptionID_block_invoke;
  v26[3] = &unk_1E69EBD28;
  id v11 = v6;
  id v27 = v11;
  if (objc_msgSend(v10, "na_any:", v26))
  {
    uint64_t v12 = [v7 database];
    id v28 = v11;
    int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    id v14 = [(os_unfair_lock_s *)v5 pushSubscriptionsForDatabase:v12 subscriptionsToSave:MEMORY[0x1E4F1CBF0] subscriptionIDsToRemove:v13];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = ____unregisterSubscriptionForSubscriptionID_block_invoke_47;
    v21[3] = &unk_1E69EBC88;
    id v22 = v5;
    id v23 = v7;
    id v24 = v10;
    id v25 = v11;
    int v15 = [v14 addSuccessBlock:v21];
  }
  else
  {
    char v16 = (void *)MEMORY[0x1D944CB30]();
    id v17 = v5;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      __int16 v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v30 = v19;
      __int16 v31 = 2112;
      id v32 = v11;
      __int16 v33 = 2112;
      id v34 = v10;
      _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Not unregistering database subscription ID %@ because it is not in our list of existing database subscription: %@", buf, 0x20u);
    }
    int v15 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v15;
}

void sub_1D471AF04(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t ____unregisterSubscriptionForSubscriptionID_block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 subscriptionID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void ____unregisterSubscriptionForSubscriptionID_block_invoke_47(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = ____unregisterSubscriptionForSubscriptionID_block_invoke_2;
  v14[3] = &unk_1E69EBD28;
  id v5 = *(void **)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v6 = objc_msgSend(v5, "na_filter:", v14);
  [*(id *)(a1 + 40) setSubscriptions:v6];

  id v7 = [*(id *)(a1 + 32) stateZone];
  v20[0] = *(void *)(a1 + 40);
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  char v9 = [v7 update:v8];

  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x1D944CB30]();
    id v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    uint64_t v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v17 = v13;
      __int16 v18 = 2112;
      __int16 v19 = v9;
      _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to update database state: %@", buf, 0x16u);
    }
  }

  os_unfair_lock_unlock(v4);
}

void sub_1D471B16C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t ____unregisterSubscriptionForSubscriptionID_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 subscriptionID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

void sub_1D471B584(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D471BA44(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D471BF0C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D471C3F8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D471C6B0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __modifySubscriptions(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  id v34 = a2;
  id v12 = a3;
  id v37 = a4;
  id v13 = a5;
  id v35 = a6;
  long long v36 = v12;
  if ([v12 count] || objc_msgSend(v37, "count"))
  {
    if (!v13)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F653F0]);
      id v15 = [NSString stringWithUTF8String:"__modifySubscriptions"];
      id v13 = (id)[v14 initWithName:v15];
    }
    id v16 = objc_alloc_init(MEMORY[0x1E4F1A1B8]);
    id v17 = [v11 operationConfigurationWithProcessingOptions:0];
    [v16 setConfiguration:v17];

    [v16 setSubscriptionsToSave:v12];
    [v16 setSubscriptionIDsToDelete:v37];
    objc_initWeak(&location, v16);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = ____modifySubscriptions_block_invoke;
    v38[3] = &unk_1E69EBD78;
    id v18 = v11;
    id v39 = v18;
    id v13 = v13;
    id v40 = v13;
    objc_copyWeak(&v45, &location);
    id v32 = v34;
    id v41 = v32;
    id v19 = v12;
    id v42 = v19;
    id v20 = v37;
    id v43 = v20;
    id v44 = v35;
    context = (void *)MEMORY[0x1D944CB30]([v16 setModifySubscriptionsCompletionBlock:v38]);
    id v21 = v18;
    HMFGetOSLogHandle();
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v31 = v11;
      HMFGetLogIdentifier();
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      id v24 = [v13 identifier];
      id v25 = [v24 shortDescription];
      id v26 = [v16 operationID];
      *(_DWORD *)buf = 138544386;
      id v48 = v23;
      __int16 v49 = 2114;
      __int16 v50 = v25;
      __int16 v51 = 2112;
      id v52 = v19;
      __int16 v53 = 2112;
      id v54 = v20;
      __int16 v55 = 2114;
      uint64_t v56 = v26;
      _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Starting CKModifySubscriptionsOperation with subscriptionsToSave: %@ subscriptionIDsToRemove: %@ operationID: %{public}@", buf, 0x34u);

      id v11 = v31;
    }

    [v32 addOperation:v16];

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
  }
  else
  {
    id v27 = (void *)MEMORY[0x1D944CB30]();
    id v28 = v11;
    uint64_t v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v48 = v30;
      _os_log_impl(&dword_1D4693000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Skipping subscription modify for empty save and remove lists", buf, 0xCu);
    }
    [v35 finishWithNoResult];
  }
}

void sub_1D471CC40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
}

void ____modifySubscriptions_block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)MEMORY[0x1D944CB30]();
  id v11 = a1[4];
  id v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = HMFGetLogIdentifier();
      id v15 = [a1[5] identifier];
      id v16 = [v15 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v48 = v14;
      __int16 v49 = 2114;
      __int16 v50 = v16;
      __int16 v51 = 2114;
      id v52 = v9;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKModifySubscriptionsOperation failed: %{public}@", buf, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained(a1 + 10);
    if (!WeakRetained) {
      _HMFPreconditionFailure();
    }
    id v18 = WeakRetained;
    id v19 = a1[4];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = ____modifySubscriptions_block_invoke_35;
    v40[3] = &unk_1E69EBD50;
    id v41 = v19;
    id v42 = a1[6];
    id v43 = a1[7];
    id v44 = a1[8];
    id v45 = a1[5];
    id v46 = a1[9];
    int v20 = [v41 retryCloudKitOperation:v18 afterError:v9 retryBlock:v40];
    id v21 = (void *)MEMORY[0x1D944CB30]();
    id v22 = a1[4];
    id v23 = HMFGetOSLogHandle();
    id v24 = v23;
    if (v20)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        id v25 = HMFGetLogIdentifier();
        id v26 = [a1[5] identifier];
        [v26 shortDescription];
        id v38 = v8;
        v28 = id v27 = v7;
        *(_DWORD *)buf = 138543618;
        id v48 = v25;
        __int16 v49 = 2114;
        __int16 v50 = v28;
        _os_log_impl(&dword_1D4693000, v24, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKModifySubscriptionsOperation will be retried", buf, 0x16u);

        id v7 = v27;
        id v8 = v38;
      }
      [a1[5] markWithReason:@"deferred"];
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v39 = v8;
        id v35 = v34 = v7;
        long long v36 = [a1[5] identifier];
        id v37 = [v36 shortDescription];
        *(_DWORD *)buf = 138543874;
        id v48 = v35;
        __int16 v49 = 2114;
        __int16 v50 = v37;
        __int16 v51 = 2114;
        id v52 = v9;
        _os_log_impl(&dword_1D4693000, v24, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKModifySubscriptionsOperation failed and cannot be retried: %{public}@", buf, 0x20u);

        id v7 = v34;
        id v8 = v39;
      }

      [a1[5] markWithFormat:@"failed with error: %@", v9];
      [a1[9] finishWithError:v9];
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v29 = v8;
      id v31 = v30 = v7;
      id v32 = [a1[5] identifier];
      __int16 v33 = [v32 shortDescription];
      *(_DWORD *)buf = 138543618;
      id v48 = v31;
      __int16 v49 = 2114;
      __int16 v50 = v33;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKModifySubscriptionsOperation succeeded", buf, 0x16u);

      id v7 = v30;
      id v8 = v29;
    }

    [a1[5] markWithReason:@"succeeded"];
    [a1[9] finishWithNoResult];
  }
}

uint64_t ____modifySubscriptions_block_invoke_35(void *a1)
{
  return __modifySubscriptions(a1[4], a1[5], a1[6], a1[7], a1[8], a1[9]);
}

void sub_1D471DD1C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D471DF28(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t CKContainerEnvironmentString()
{
  return MEMORY[0x1F40D6288]();
}

uint64_t CKDatabaseScopeString()
{
  return MEMORY[0x1F40D62F0]();
}

uint64_t CKStringFromParticipantPermission()
{
  return MEMORY[0x1F40D64A0]();
}

uint64_t DebugGetErrorString()
{
  return MEMORY[0x1F4116330]();
}

uint64_t HMFBooleanToString()
{
  return MEMORY[0x1F411CB28]();
}

uint64_t HMFCreateOSLogHandle()
{
  return MEMORY[0x1F411CB30]();
}

uint64_t HMFDispatchQueueName()
{
  return MEMORY[0x1F411CB50]();
}

uint64_t HMFEqualObjects()
{
  return MEMORY[0x1F411CB68]();
}

uint64_t HMFGetLogIdentifier()
{
  return MEMORY[0x1F411CB70]();
}

uint64_t HMFGetOSLogHandle()
{
  return MEMORY[0x1F411CB78]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1F40E6FD8](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t OPACKDecodeData()
{
  return MEMORY[0x1F41168C0]();
}

uint64_t OPACKEncoderCreateData()
{
  return MEMORY[0x1F41168D0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HMFPreconditionFailure()
{
  return MEMORY[0x1F411CC08]();
}

uint64_t _HMFPreconditionFailureWithFormat()
{
  return MEMORY[0x1F411CC10]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __HMFActivityScopeLeave()
{
  return MEMORY[0x1F411CC18]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1F41814C8](cls, name, imp, types);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182BD0](strm, *(void *)&flush);
}

uLong deflateBound(z_streamp strm, uLong sourceLen)
{
  return MEMORY[0x1F4182BD8](strm, sourceLen);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182BE0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BE8](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182CB0](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182CB8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CC8](strm, *(void *)&windowBits, version, *(void *)&stream_size);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
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

void objc_terminate(void)
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

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1F40CD5E8]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F98](a1, *(void *)&a2, a3, a4, a5);
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

const char *__cdecl sqlite3_bind_parameter_name(sqlite3_stmt *a1, int a2)
{
  return (const char *)MEMORY[0x1F4181FD8](a1, *(void *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_bind_zeroblob(sqlite3_stmt *a1, int a2, int n)
{
  return MEMORY[0x1F4182008](a1, *(void *)&a2, *(void *)&n);
}

int sqlite3_bind_zeroblob64(sqlite3_stmt *a1, int a2, sqlite3_uint64 a3)
{
  return MEMORY[0x1F4182010](a1, *(void *)&a2, a3);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1F4182050](a1);
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

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
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

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1F4182190](db);
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

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

int sqlite3_get_autocommit(sqlite3 *a1)
{
  return MEMORY[0x1F41821F0](a1);
}

int sqlite3_initialize(void)
{
  return MEMORY[0x1F4182208]();
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1F4182230](a1);
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

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}