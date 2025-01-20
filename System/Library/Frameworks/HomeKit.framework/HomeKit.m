void sub_19D1AB76C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_19D1AB9AC(_Unwind_Exception *exception_object)
{
}

id sharedIdentifierSaltStore()
{
  if (sharedIdentifierSaltStore_onceToken != -1) {
    dispatch_once(&sharedIdentifierSaltStore_onceToken, &__block_literal_global_87);
  }
  v0 = (void *)sharedIdentifierSaltStore_identifierSaltStore;

  return v0;
}

void sub_19D1AC5B0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1AC634(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1AC894(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1AD054(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1AD744(_Unwind_Exception *a1)
{
}

void sub_19D1ADFB8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1AE374(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1AEEB0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1AF22C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t isAllowedCharType(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    v2 = allowedCharValueTypes();
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v9;
      while (2)
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v9 != v4) {
            objc_enumerationMutation(v2);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {

            goto LABEL_12;
          }
          ++v5;
        }
        while (v3 != v5);
        uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }

    uint64_t v6 = 0;
  }
  else
  {
LABEL_12:
    uint64_t v6 = 1;
  }

  return v6;
}

void sub_19D1AFF00(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x19D1AFEB4);
  }
  _Unwind_Resume(a1);
}

void sub_19D1B09B4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id allowedCharValueTypes()
{
  if (allowedCharValueTypes_onceToken != -1) {
    dispatch_once(&allowedCharValueTypes_onceToken, &__block_literal_global_43_24561);
  }
  v0 = (void *)allowedCharValueTypes_charValueTypes;

  return v0;
}

void sub_19D1B2508(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1B26B0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1B3918(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long buf)
{
  if (a2 == 1)
  {
    id v19 = objc_begin_catch(a1);
    v20 = (void *)MEMORY[0x19F3A64A0]();
    HMFGetOSLogHandle();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543618;
      *(void *)((char *)&buf + 4) = v22;
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = v19;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Exception while searching list (%@)", (uint8_t *)&buf, 0x16u);
    }

    objc_end_catch();
    JUMPOUT(0x19D1B38A4);
  }
  os_unfair_lock_unlock(v17);
  _Unwind_Resume(a1);
}

void sub_19D1B3BE0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1B575C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1B5A30(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1B64BC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id _dictionaryRepresentationForReportContext(void *a1)
{
  id v1 = a1;
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = [v1 reportDomain];
  [v2 setObject:v3 forKeyedSubscript:@"HMHomeReportDomainMessageKey"];

  uint64_t v4 = [v1 requestInfo];
  [v2 setObject:v4 forKeyedSubscript:@"HMHomeRequestInfoMessageKey"];

  [v1 reportTimeout];
  if (v5 > 0.0)
  {
    uint64_t v6 = NSNumber;
    [v1 reportTimeout];
    v7 = objc_msgSend(v6, "numberWithDouble:");
    [v2 setObject:v7 forKeyedSubscript:@"HMHomeReportTimeoutMessageKey"];
  }
  long long v8 = (void *)[v2 copy];

  return v8;
}

void sub_19D1B692C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_19D1B70E8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1B821C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMAccessoryCertificationStatusToString(uint64_t a1)
{
  uint64_t v1 = @"Unknown";
  if (a1 == 1) {
    uint64_t v1 = @"Not Certified";
  }
  if (a1 == 2) {
    return @"Certified";
  }
  else {
    return v1;
  }
}

void sub_19D1B83FC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1B86A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1B9F2C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id resolveCharacteristic(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  double v5 = [v4 service];
  uint64_t v6 = [v5 accessory];
  v7 = [v6 uuid];
  long long v8 = [v3 accessoryWithUUID:v7];

  long long v9 = [v4 instanceID];

  long long v10 = [v5 instanceID];
  long long v11 = [v8 _findCharacteristic:v9 forService:v10];

  return v11;
}

void sub_19D1BC39C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMHomeManagerOptionsShortDescription(uint64_t a1)
{
  if (!a1)
  {
    v2 = @"None";
    goto LABEL_21;
  }
  __int16 v1 = a1;
  if (a1 == -1)
  {
    v2 = @"All";
    goto LABEL_21;
  }
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (v1)
  {
    [v3 addObject:@"HM"];
    if ((v1 & 2) == 0)
    {
LABEL_7:
      if ((v1 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_26;
    }
  }
  else if ((v1 & 2) == 0)
  {
    goto LABEL_7;
  }
  [v4 addObject:@"PI"];
  if ((v1 & 4) == 0)
  {
LABEL_8:
    if ((v1 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v4 addObject:@"RM"];
  if ((v1 & 8) == 0)
  {
LABEL_9:
    if ((v1 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v4 addObject:@"USR"];
  if ((v1 & 0x10) == 0)
  {
LABEL_10:
    if ((v1 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v4 addObject:@"CA"];
  if ((v1 & 0x20) == 0)
  {
LABEL_11:
    if ((v1 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v4 addObject:@"SET"];
  if ((v1 & 0x40) == 0)
  {
LABEL_12:
    if ((v1 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v4 addObject:@"AMA"];
  if ((v1 & 0x80) == 0)
  {
LABEL_13:
    if ((v1 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v4 addObject:@"MS"];
  if ((v1 & 0x100) == 0)
  {
LABEL_14:
    if ((v1 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v4 addObject:@"APA"];
  if ((v1 & 0x200) == 0)
  {
LABEL_15:
    if ((v1 & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v4 addObject:@"HAP"];
  if ((v1 & 0x400) == 0)
  {
LABEL_16:
    if ((v1 & 0x800) == 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v4 addObject:@"TVA"];
  if ((v1 & 0x800) == 0)
  {
LABEL_17:
    if ((v1 & 0x1000) == 0) {
      goto LABEL_18;
    }
LABEL_36:
    [v4 addObject:@"WRA"];
    if ((v1 & 0x8000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_35:
  [v4 addObject:@"DEV"];
  if ((v1 & 0x1000) != 0) {
    goto LABEL_36;
  }
LABEL_18:
  if (v1 < 0) {
LABEL_19:
  }
    [v4 addObject:@"SEA"];
LABEL_20:
  v2 = [v4 componentsJoinedByString:@","];

LABEL_21:

  return v2;
}

void sub_19D1BDC48(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1BDD3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D1BE014(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1BE0CC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1BE38C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL HMPBMetadataCharacteristicReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
LABEL_22:
        id v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 8;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL HMPBMetadataServiceReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
LABEL_22:
        id v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 8;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t HMPBMetadataCategoryReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
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
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
        while (1)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            goto LABEL_34;
          }
          v20 += 7;
          BOOL v14 = v21++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_36;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_36:
        *(_DWORD *)(a1 + 16) = v22;
      }
      else
      {
        if (v17 == 2)
        {
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 8;
        }
        else
        {
          if (v17 != 1)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 24;
        }
        v26 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D1BFF2C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id encodeRootObject(void *a1)
{
  id v1 = a1;
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v3 encodeObject:v1 forKey:*MEMORY[0x1E4F284E8]];
  [v3 finishEncoding];
  id v4 = [v3 encodedData];

  return v4;
}

__CFString *HMHomeAddWalletKeyErrorCodeAsString(unint64_t a1)
{
  if (a1 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown add wallet key error code: %ld", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E59442D8[a1];
  }

  return v1;
}

void ____handleAccessoryRuntimeStateUpdate_block_invoke(uint64_t a1)
{
}

id HMCreateFrameworkCacheDirectory()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = HMClientScopedHomeKitCacheDirectoryName();
  v4[0] = v0;
  v4[1] = @"com.apple.HomeKit.HMCache";
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  v2 = HMCreateHomeKitCacheSubdirectoryWithRelativePathComponents(v1);

  return v2;
}

id HMClientScopedHomeKitCacheDirectoryName()
{
  v0 = [MEMORY[0x1E4F65540] processInfo];
  id v1 = [v0 applicationIdentifier];
  if (!v1)
  {
    id v1 = [v0 name];
    if (!v1)
    {
      v2 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v0, "identifier"));
      id v1 = [v2 stringValue];
    }
  }

  return v1;
}

void sub_19D1C5244(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1C5544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D1C5D58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D1C5FC8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1C6094(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1C64E0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id HMCreateHomeKitCacheSubdirectoryWithRelativePathComponents(void *a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (![v1 count]) {
    _HMFPreconditionFailure();
  }
  HMCacheSubdirectoryWithRelativePath(@"com.apple.HomeKit");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [v2 stringByDeletingLastPathComponent];
  int v5 = [v3 isWritableFileAtPath:v4];

  if (!v5) {
    goto LABEL_7;
  }
  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v42 = 0;
  char v7 = [v6 createDirectoryAtPath:v2 withIntermediateDirectories:0 attributes:0 error:&v42];
  id v8 = v42;

  if ((v7 & 1) == 0)
  {
    unsigned int v9 = [v8 domain];
    if ([v9 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v10 = [v8 code];

      if (v10 == 516) {
        goto LABEL_6;
      }
    }
    else
    {
    }
    v33 = (void *)MEMORY[0x19F3A64A0]();
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v44 = v35;
      __int16 v45 = 2112;
      id v46 = v2;
      __int16 v47 = 2112;
      uint64_t v48 = (uint64_t)v8;
      _os_log_impl(&dword_19D1A8000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to create HomeKit cache directory %@: %@", buf, 0x20u);
    }

    char v25 = 0;
    v16 = @"com.apple.HomeKit";
    goto LABEL_25;
  }
LABEL_6:

LABEL_7:
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v36 = v1;
  id v11 = v1;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v51 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v39;
    uint64_t v15 = *MEMORY[0x1E4F281F8];
    v16 = @"com.apple.HomeKit";
    while (2)
    {
      uint64_t v17 = 0;
      uint64_t v18 = v2;
      uint64_t v19 = v16;
      do
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v11);
        }
        -[__CFString stringByAppendingPathComponent:](v19, "stringByAppendingPathComponent:", *(void *)(*((void *)&v38 + 1) + 8 * v17), v36);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

        HMCacheSubdirectoryWithRelativePath(v16);
        id v2 = (id)objc_claimAutoreleasedReturnValue();

        char v20 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v37 = 0;
        char v21 = [v20 createDirectoryAtPath:v2 withIntermediateDirectories:0 attributes:0 error:&v37];
        id v22 = v37;

        if ((v21 & 1) == 0)
        {
          uint64_t v23 = [v22 domain];
          if (([v23 isEqualToString:v15] & 1) == 0)
          {

LABEL_21:
            v26 = (void *)MEMORY[0x19F3A64A0]();
            v27 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v28 = HMFGetLogIdentifier();
              uint64_t v29 = [v22 code];
              v30 = [v22 userInfo];
              v31 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
              *(_DWORD *)buf = 138544130;
              v44 = v28;
              __int16 v45 = 2112;
              id v46 = v2;
              __int16 v47 = 2048;
              uint64_t v48 = v29;
              __int16 v49 = 2112;
              v50 = v31;
              _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to create HomeKit cache subdirectory %@: %ld, %@", buf, 0x2Au);
            }

            char v25 = 0;
            goto LABEL_24;
          }
          uint64_t v24 = [v22 code];

          if (v24 != 516) {
            goto LABEL_21;
          }
        }

        ++v17;
        uint64_t v18 = v2;
        uint64_t v19 = v16;
      }
      while (v13 != v17);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v51 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  else
  {
    v16 = @"com.apple.HomeKit";
  }

  id v2 = v2;
  char v25 = v2;
LABEL_24:
  id v1 = v36;
LABEL_25:

  return v25;
}

id HMCacheSubdirectoryWithRelativePath(void *a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = [v2 URLsForDirectory:13 inDomains:1];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned int v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        buf[0] = 0;
        uint64_t v10 = objc_msgSend(v9, "path", (void)v24);
        id v11 = [v10 stringByAppendingPathComponent:v1];

        uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
        int v13 = [v12 fileExistsAtPath:v11 isDirectory:buf];
        int v14 = buf[0];

        if (v13) {
          BOOL v15 = v14 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15)
        {
          uint64_t v18 = v4;
          goto LABEL_19;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v6);
  }

  v16 = [v4 firstObject];
  uint64_t v18 = v16;
  if (v16)
  {
    uint64_t v17 = [v16 path];
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x19F3A64A0]();
    char v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      char v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v21;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_FAULT, "%{public}@Failed to determine HomeKit cache directory; falling back to a temporary directory",
        buf,
        0xCu);
    }
    uint64_t v17 = NSTemporaryDirectory();
  }
  id v22 = v17;
  id v11 = objc_msgSend(v17, "stringByAppendingPathComponent:", v1, (void)v24);

LABEL_19:

  return v11;
}

id localizationKeyForCharacteristicType(void *a1)
{
  if (a1)
  {
    a1 = [(id)characteristicTypeLocalizationKeyMapping objectForKeyedSubscript:a1];
    uint64_t v1 = vars8;
  }
  return a1;
}

id localizationKeyForServiceType(void *a1)
{
  if (a1)
  {
    a1 = [(id)serviceTypeLocalizationKeyMapping objectForKeyedSubscript:a1];
    uint64_t v1 = vars8;
  }
  return a1;
}

void sub_19D1CAF38(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1CAFD4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1CB048(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1CC5AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_19D1CC67C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1CCCD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, id *a11, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  objc_destroyWeak(location);
  objc_destroyWeak(v34);
  objc_destroyWeak(v33);
  objc_destroyWeak(a11);
  objc_destroyWeak(a10);
  objc_destroyWeak(&a32);
  objc_destroyWeak(a12);
  objc_destroyWeak((id *)(v35 - 152));
  os_unfair_lock_unlock(v32);
  _Unwind_Resume(a1);
}

void sub_19D1CD438(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1CD508(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id HMDispatchQueueNameString(void *a1, void *a2)
{
  id v3 = NSString;
  id v4 = a2;
  id v5 = a1;
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  if (v4) {
    id v8 = @".";
  }
  else {
    id v8 = &stru_1EEE9DD88;
  }
  if (v4) {
    unsigned int v9 = v4;
  }
  else {
    unsigned int v9 = &stru_1EEE9DD88;
  }
  uint64_t v10 = [v5 hash];

  id v11 = [v3 stringWithFormat:@"com.apple.HomeKit.%@%@%@.%tu", v7, v8, v9, v10];

  return v11;
}

void sub_19D1CE9B4(_Unwind_Exception *a1)
{
}

void sub_19D1CED7C(_Unwind_Exception *a1)
{
}

BOOL isInternalBuild()
{
  v0 = [MEMORY[0x1E4F65548] productInfo];
  BOOL v1 = [v0 productVariant] == 3;

  return v1;
}

void sub_19D1CF7CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19D1CF868(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19D1D06D8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1D07EC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __initializeMappingsAndPaths_block_invoke()
{
  uint64_t v313 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v31 = @"0000003E-0000-1000-8000-0026BB765291";
  *((void *)&v31 + 1) = @"0000008D-0000-1000-8000-0026BB765291";
  v170 = @"ACCESSORY_INFORMATION_SVC";
  v171 = @"AIR_QUALITY_SENSOR_SVC";
  *(void *)&long long v32 = @"00000096-0000-1000-8000-0026BB765291";
  *((void *)&v32 + 1) = @"00000097-0000-1000-8000-0026BB765291";
  v172 = @"BATTERY_SVC";
  v173 = @"CARBON_DIOXIDE_SENSOR_SVC";
  *(void *)&long long v33 = @"0000007F-0000-1000-8000-0026BB765291";
  *((void *)&v33 + 1) = @"00000080-0000-1000-8000-0026BB765291";
  v174 = @"CARBON_MONOXIDE_SENSOR_SVC";
  v175 = @"CONTACT_SENSOR_SVC";
  *(void *)&long long v34 = @"00000081-0000-1000-8000-0026BB765291";
  *((void *)&v34 + 1) = @"00000121-0000-1000-8000-0026BB765291";
  v176 = @"DOOR_SVC";
  v177 = @"DOORBELL_SVC";
  uint64_t v35 = @"00000040-0000-1000-8000-0026BB765291";
  id v36 = @"00000041-0000-1000-8000-0026BB765291";
  v178 = @"FAN_SVC";
  v179 = @"GARAGE_DOOR_OPENER_SVC";
  id v37 = @"00000082-0000-1000-8000-0026BB765291";
  long long v38 = @"00000083-0000-1000-8000-0026BB765291";
  v180 = @"HUMIDITY_SENSOR_SVC";
  v181 = @"LEAK_SENSOR_SVC";
  long long v39 = @"00000084-0000-1000-8000-0026BB765291";
  long long v40 = @"00000043-0000-1000-8000-0026BB765291";
  v182 = @"LIGHT_SENSOR_SVC";
  v183 = @"LIGHTBULB_SVC";
  long long v41 = @"00000044-0000-1000-8000-0026BB765291";
  id v42 = @"00000045-0000-1000-8000-0026BB765291";
  v184 = @"LOCK_MANAGEMENT_SVC";
  v185 = @"LOCK_MECHANISM_SVC";
  v43 = @"00000085-0000-1000-8000-0026BB765291";
  v44 = @"00000086-0000-1000-8000-0026BB765291";
  v186 = @"MOTION_SENSOR_SVC";
  v187 = @"OCCUPANCY_SENSOR_SVC";
  __int16 v45 = @"00000047-0000-1000-8000-0026BB765291";
  id v46 = @"0000007E-0000-1000-8000-0026BB765291";
  v188 = @"OUTLET_SVC";
  v189 = @"SECURITY_SYSTEM_SVC";
  __int16 v47 = @"00000087-0000-1000-8000-0026BB765291";
  uint64_t v48 = @"00000088-0000-1000-8000-0026BB765291";
  v190 = @"SMOKE_SENSOR_SVC";
  v191 = @"STATEFUL_PROGRAMMABLE_SWITCH_SVC";
  __int16 v49 = @"00000089-0000-1000-8000-0026BB765291";
  v50 = @"00000049-0000-1000-8000-0026BB765291";
  v192 = @"STATELESS_PROGRAMMABLE_SWITCH_SVC";
  v193 = @"SWITCH_SVC";
  v51 = @"0000008A-0000-1000-8000-0026BB765291";
  uint64_t v52 = @"0000004A-0000-1000-8000-0026BB765291";
  v194 = @"TEMPERATURE_SENSOR_SVC";
  v195 = @"THERMOSTAT_SVC";
  v53 = @"0000008B-0000-1000-8000-0026BB765291";
  v54 = @"0000008C-0000-1000-8000-0026BB765291";
  v196 = @"WINDOW_SVC";
  v197 = @"WINDOW_COVERING_SVC";
  v55 = @"00000110-0000-1000-8000-0026BB765291";
  v56 = @"00000111-0000-1000-8000-0026BB765291";
  v198 = @"CAMERA_STREAM_SVC";
  v199 = @"CAMERA_CTRL_SVC";
  v57 = @"00000112-0000-1000-8000-0026BB765291";
  v58 = @"00000113-0000-1000-8000-0026BB765291";
  v200 = @"MICROPHONE_SVC";
  v201 = @"SPEAKER_SVC";
  v59 = @"000000BB-0000-1000-8000-0026BB765291";
  v60 = @"000000B7-0000-1000-8000-0026BB765291";
  v202 = @"AIR_PURIFIER_SVC";
  v203 = @"VENTILATION_FAN_SVC";
  v61 = @"000000BA-0000-1000-8000-0026BB765291";
  v62 = @"000000BC-0000-1000-8000-0026BB765291";
  v204 = @"FILTER_MAINTENANCE_SVC";
  v205 = @"HEATER_COOLER_SVC";
  v63 = @"000000B9-0000-1000-8000-0026BB765291";
  v64 = @"000000BD-0000-1000-8000-0026BB765291";
  v206 = @"SLATS_SVC";
  v207 = @"HUMIDIFIER_DEHUMIDIFIER_SVC";
  v65 = @"000000CC-0000-1000-8000-0026BB765291";
  v66 = @"000000CF-0000-1000-8000-0026BB765291";
  v208 = @"LABEL_SVC";
  v209 = @"IRRIGATION_SYSTEM_SVC";
  v67 = @"000000D0-0000-1000-8000-0026BB765291";
  v68 = @"000000D7-0000-1000-8000-0026BB765291";
  v210 = @"VALVE_SVC";
  v211 = @"FAUCET_SVC";
  v69 = @"0000021A-0000-1000-8000-0026BB765291";
  v70 = @"00000204-0000-1000-8000-0026BB765291";
  v212 = @"CAMERA_OPERATING_MODE_SVC";
  v213 = @"CAMERA_RECORDING_MGMT_SVC";
  v71 = @"00000122-0000-1000-8000-0026BB765291";
  v72 = @"00000125-0000-1000-8000-0026BB765291";
  v214 = @"TARGET_CONTROL_MANAGEMENT_SVC";
  v215 = @"TARGET_CONTROL_SVC";
  v73 = @"000000D8-0000-1000-8000-0026BB765291";
  v74 = @"000000D9-0000-1000-8000-0026BB765291";
  v216 = @"TELEVISION_SVC";
  v217 = @"INPUT_SOURCE_SVC";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v170 forKeys:&v31 count:48];
  BOOL v1 = (void *)serviceTypeLocalizationKeyMapping;
  serviceTypeLocalizationKeyMapping = v0;

  *(void *)&long long v31 = @"00000001-0000-1000-8000-0026BB765291";
  *((void *)&v31 + 1) = @"00000064-0000-1000-8000-0026BB765291";
  v170 = @"ADMIN_ONLY_ACCESS_CHR";
  v171 = @"AIR_PARTICULATE_DENSITY_CHR";
  *(void *)&long long v32 = @"00000065-0000-1000-8000-0026BB765291";
  *((void *)&v32 + 1) = @"00000095-0000-1000-8000-0026BB765291";
  v172 = @"AIR_PARTICULATE_SIZE_CHR";
  v173 = @"AIR_QUALITY_CHR";
  *(void *)&long long v33 = @"00000005-0000-1000-8000-0026BB765291";
  *((void *)&v33 + 1) = @"00000068-0000-1000-8000-0026BB765291";
  v174 = @"AUDIO_FEEDBACK_CHR";
  v175 = @"BATTERY_LEVEL_CHR";
  *(void *)&long long v34 = @"00000008-0000-1000-8000-0026BB765291";
  *((void *)&v34 + 1) = @"00000092-0000-1000-8000-0026BB765291";
  v176 = @"BRIGHTNESS_CHR";
  v177 = @"CARBON_DIOXIDE_DETECTED_CHR";
  uint64_t v35 = @"00000093-0000-1000-8000-0026BB765291";
  id v36 = @"00000094-0000-1000-8000-0026BB765291";
  v178 = @"CARBON_DIOXIDE_LEVEL_CHR";
  v179 = @"CARBON_DIOXIDE_PEAK_LEVEL_CHR";
  id v37 = @"00000069-0000-1000-8000-0026BB765291";
  long long v38 = @"00000090-0000-1000-8000-0026BB765291";
  v180 = @"CARBON_MONOXIDE_DETECTED_CHR";
  v181 = @"CARBON_MONOXIDE_LEVEL_CHR";
  long long v39 = @"00000091-0000-1000-8000-0026BB765291";
  long long v40 = @"0000008F-0000-1000-8000-0026BB765291";
  v182 = @"CARBON_MONOXIDE_PEAK_LEVEL_CHR";
  v183 = @"CHARGING_STATE_CHR";
  long long v41 = @"0000006A-0000-1000-8000-0026BB765291";
  id v42 = @"0000000D-0000-1000-8000-0026BB765291";
  v184 = @"CONTACT_SENSOR_STATE_CHR";
  v185 = @"COOLING_THRESHOLD_TEMPERATURE_CHR";
  v43 = @"0000000E-0000-1000-8000-0026BB765291";
  v44 = @"0000000F-0000-1000-8000-0026BB765291";
  v186 = @"CURRENT_DOOR_STATE_CHR";
  v187 = @"CURRENT_HEATING_COOLING_STATE_CHR";
  __int16 v45 = @"0000006C-0000-1000-8000-0026BB765291";
  id v46 = @"0000006B-0000-1000-8000-0026BB765291";
  v188 = @"CURRENT_HORIZONTAL_TILT_ANGLE_CHR";
  v189 = @"CURRENT_LIGHT_LEVEL_CHR";
  __int16 v47 = @"0000006D-0000-1000-8000-0026BB765291";
  uint64_t v48 = @"00000010-0000-1000-8000-0026BB765291";
  v190 = @"CURRENT_POSITION_CHR";
  v191 = @"CURRENT_RELATIVE_HUMIDITY_CHR";
  __int16 v49 = @"00000066-0000-1000-8000-0026BB765291";
  v50 = @"00000011-0000-1000-8000-0026BB765291";
  v192 = @"CURRENT_SECURITY_SYSTEM_STATE_CHR";
  v193 = @"CURRENT_TEMPERATURE_CHR";
  v51 = @"0000006E-0000-1000-8000-0026BB765291";
  uint64_t v52 = @"00000053-0000-1000-8000-0026BB765291";
  v194 = @"CURRENT_VERTICAL_TILT_ANGLE_CHR";
  v195 = @"HARDWARE_VERSION_CHR";
  v53 = @"00000012-0000-1000-8000-0026BB765291";
  v54 = @"0000006F-0000-1000-8000-0026BB765291";
  v196 = @"HEATING_THRESHOLD_TEMPERATURE_CHR";
  v197 = @"HOLD_POSITION_CHR";
  v55 = @"00000014-0000-1000-8000-0026BB765291";
  v56 = @"00000013-0000-1000-8000-0026BB765291";
  v198 = @"IDENTIFY_CHR";
  v199 = @"HUE_CHR";
  v57 = @"00000070-0000-1000-8000-0026BB765291";
  v58 = @"00000019-0000-1000-8000-0026BB765291";
  v200 = @"LEAK_DETECTED_CHR";
  v201 = @"LOCK_MANAGEMENT_CONTROLPOINT_CHR";
  v59 = @"0000001A-0000-1000-8000-0026BB765291";
  v60 = @"0000001D-0000-1000-8000-0026BB765291";
  v202 = @"LOCK_MANAGEMENT_AUTO_SECURITY_TIMEOUT_CHR";
  v203 = @"CURRENT_LOCK_MECHANISM_STATE_CHR";
  v61 = @"0000001C-0000-1000-8000-0026BB765291";
  v62 = @"0000001E-0000-1000-8000-0026BB765291";
  v204 = @"LOCK_MECHANISM_LAST_KNOWN_ACTION_CHR";
  v205 = @"TARGET_LOCK_MECHANISM_STATE_CHR";
  v63 = @"0000001F-0000-1000-8000-0026BB765291";
  v64 = @"00000022-0000-1000-8000-0026BB765291";
  v206 = @"LOGS_CHR";
  v207 = @"MOTION_DETECTED_CHR";
  v65 = @"00000023-0000-1000-8000-0026BB765291";
  v66 = @"00000024-0000-1000-8000-0026BB765291";
  v208 = @"NAME_CHR";
  v209 = @"OBSTRUCTION_DETECTED_CHR";
  v67 = @"00000071-0000-1000-8000-0026BB765291";
  v68 = @"00000026-0000-1000-8000-0026BB765291";
  v210 = @"OCCUPANCY_DETECTED_CHR";
  v211 = @"OUTLET_IN_USE_CHR";
  v69 = @"00000072-0000-1000-8000-0026BB765291";
  v70 = @"00000025-0000-1000-8000-0026BB765291";
  v212 = @"POSITION_STATE_CHR";
  v213 = @"POWER_STATE_CHR";
  v71 = @"00000073-0000-1000-8000-0026BB765291";
  v72 = @"00000074-0000-1000-8000-0026BB765291";
  v214 = @"PROGRAMMABLE_SWITCH_EVENT_CHR";
  v215 = @"PROGRAMMABLE_SWITCH_OUTPUT_STATE_CHR";
  v73 = @"00000028-0000-1000-8000-0026BB765291";
  v74 = @"00000029-0000-1000-8000-0026BB765291";
  v216 = @"ROTATION_DIRECTION_CHR";
  v217 = @"ROTATION_SPEED_CHR";
  v75 = @"0000002F-0000-1000-8000-0026BB765291";
  v76 = @"0000008E-0000-1000-8000-0026BB765291";
  v218 = @"SATURATION_CHR";
  v219 = @"SECURITY_SYSTEM_ALARM_TYPE_CHR";
  v77 = @"00000076-0000-1000-8000-0026BB765291";
  v78 = @"00000075-0000-1000-8000-0026BB765291";
  v220 = @"SMOKE_DETECTED_CHR";
  v221 = @"STATUS_ACTIVE_CHR";
  v79 = @"00000077-0000-1000-8000-0026BB765291";
  v80 = @"00000078-0000-1000-8000-0026BB765291";
  v222 = @"STATUS_FAULT_CHR";
  v223 = @"STATUS_JAMMED_CHR";
  v81 = @"00000079-0000-1000-8000-0026BB765291";
  v82 = @"0000007A-0000-1000-8000-0026BB765291";
  v224 = @"STATUS_LOW_BATTERY_CHR";
  v225 = @"STATUS_TAMPERED_CHR";
  v83 = @"00000032-0000-1000-8000-0026BB765291";
  v84 = @"00000033-0000-1000-8000-0026BB765291";
  v226 = @"TARGET_DOOR_STATE_CHR";
  v227 = @"TARGET_HEATING_COOLING_STATE_CHR";
  v85 = @"0000007B-0000-1000-8000-0026BB765291";
  v86 = @"0000007C-0000-1000-8000-0026BB765291";
  v228 = @"TARGET_HORIZONTAL_TILT_ANGLE_CHR";
  v229 = @"TARGET_POSITION_CHR";
  v87 = @"00000034-0000-1000-8000-0026BB765291";
  v88 = @"00000067-0000-1000-8000-0026BB765291";
  v230 = @"TARGET_RELATIVE_HUMIDITY_CHR";
  v231 = @"TARGET_SECURITY_SYSTEM_STATE_CHR";
  v89 = @"00000035-0000-1000-8000-0026BB765291";
  v90 = @"0000007D-0000-1000-8000-0026BB765291";
  v232 = @"TARGET_TEMPERATURE_CHR";
  v233 = @"TARGET_VERTICAL_TILT_ANGLE_CHR";
  v91 = @"00000036-0000-1000-8000-0026BB765291";
  v234 = @"TEMPERATURE_UNITS_CHR";
  v92 = @"00000037-0000-1000-8000-0026BB765291";
  v235 = @"VERSION_CHR";
  v93 = @"00000054-0000-1000-8000-0026BB765291";
  v236 = @"SOFTWARE_VERSION_CHR";
  v94 = @"00000120-0000-1000-8000-0026BB765291";
  v237 = @"STREAMING_STATUS";
  v95 = @"00000118-0000-1000-8000-0026BB765291";
  v238 = @"SETUP_STREAM_ENDPOINT";
  v96 = @"00000114-0000-1000-8000-0026BB765291";
  v239 = @"SUPP_VIDEO_CONFIG";
  v97 = @"00000115-0000-1000-8000-0026BB765291";
  v240 = @"SUPP_AUDIO_CONFIG";
  v98 = @"00000116-0000-1000-8000-0026BB765291";
  v241 = @"SUPP_RTP_CONFIG";
  v99 = @"00000117-0000-1000-8000-0026BB765291";
  v242 = @"SELECT_STREAM_CONFIG";
  v100 = @"00000119-0000-1000-8000-0026BB765291";
  v243 = @"VOLUME";
  v101 = @"0000011A-0000-1000-8000-0026BB765291";
  v244 = @"MUTE";
  v102 = @"0000011B-0000-1000-8000-0026BB765291";
  v245 = @"NIGHT_VISION";
  v103 = @"0000011C-0000-1000-8000-0026BB765291";
  v246 = @"OPTICAL_ZOOM";
  v104 = @"0000011D-0000-1000-8000-0026BB765291";
  v247 = @"DIGITAL_ZOOM";
  v105 = @"0000011E-0000-1000-8000-0026BB765291";
  v248 = @"IMAGE_ROTATION";
  v106 = @"0000011F-0000-1000-8000-0026BB765291";
  v249 = @"IMAGE_MIRRORING";
  v107 = @"000000B0-0000-1000-8000-0026BB765291";
  v250 = @"ACTIVE";
  v108 = @"000000A9-0000-1000-8000-0026BB765291";
  v251 = @"CURRENT_AIR_PURIFIER_STATE";
  v109 = @"000000AF-0000-1000-8000-0026BB765291";
  v252 = @"CURRENT_FAN_STATE";
  v110 = @"000000B1-0000-1000-8000-0026BB765291";
  v253 = @"CURRENT_HEATER_COOLER_STATE";
  v111 = @"000000B3-0000-1000-8000-0026BB765291";
  v254 = @"CURRENT_HUMIDIFIER_DEHUMIDIFIER_STATE";
  v112 = @"000000AA-0000-1000-8000-0026BB765291";
  v255 = @"CURRENT_SLAT_STATE";
  v113 = @"000000C1-0000-1000-8000-0026BB765291";
  v256 = @"CURRENT_TILT_ANGLE";
  v114 = @"000000C9-0000-1000-8000-0026BB765291";
  v257 = @"DEHUMIDIFIER_THRESHOLD";
  v115 = @"000000AC-0000-1000-8000-0026BB765291";
  v258 = @"FILTER_CHANGE_INDICATION";
  v116 = @"000000AB-0000-1000-8000-0026BB765291";
  v259 = @"FILTER_LIFE_LEVEL";
  v117 = @"000000AD-0000-1000-8000-0026BB765291";
  v260 = @"FILTER_RESET_CHANGE_INDICATION";
  v118 = @"000000CA-0000-1000-8000-0026BB765291";
  v261 = @"HUMIDIFIER_THRESHOLD";
  v119 = @"000000A7-0000-1000-8000-0026BB765291";
  v262 = @"LOCK_PHYSICAL_CONTROLS";
  v120 = @"000000C4-0000-1000-8000-0026BB765291";
  v263 = @"NITROGENDIOXIDE_DENSITY";
  v121 = @"000000C3-0000-1000-8000-0026BB765291";
  v264 = @"OZONE_DENSITY";
  v122 = @"000000C6-0000-1000-8000-0026BB765291";
  v265 = @"PM2_5_DENSITY";
  v123 = @"000000C7-0000-1000-8000-0026BB765291";
  v266 = @"PM10_DENSITY";
  v124 = @"000000C0-0000-1000-8000-0026BB765291";
  v267 = @"SLAT_TYPE";
  v125 = @"000000C5-0000-1000-8000-0026BB765291";
  v268 = @"SULPHURDIOXIDE_DENSITY";
  v126 = @"000000B6-0000-1000-8000-0026BB765291";
  v269 = @"SWING_MODE";
  v127 = @"000000A8-0000-1000-8000-0026BB765291";
  v270 = @"TARGET_AIR_PURIFIER_STATE";
  v128 = @"000000BF-0000-1000-8000-0026BB765291";
  v271 = @"TARGET_FAN_STATE";
  v129 = @"000000B2-0000-1000-8000-0026BB765291";
  v272 = @"TARGET_HEATER_COOLER_STATE";
  v130 = @"000000B4-0000-1000-8000-0026BB765291";
  v273 = @"TARGET_HUMIDIFIER_DEHUMIDIFIER_STATE";
  v131 = @"000000C2-0000-1000-8000-0026BB765291";
  v274 = @"TARGET_TILT_ANGLE";
  v132 = @"000000C8-0000-1000-8000-0026BB765291";
  v275 = @"VOC_DENSITY";
  v133 = @"000000B5-0000-1000-8000-0026BB765291";
  v276 = @"WATER_LEVEL";
  v134 = @"000000CB-0000-1000-8000-0026BB765291";
  v277 = @"LABEL_INDEX";
  v135 = @"000000CD-0000-1000-8000-0026BB765291";
  v278 = @"LABEL_NAMESPACE";
  v136 = @"000000CE-0000-1000-8000-0026BB765291";
  v279 = @"COLOR_TEMPERATURE";
  v137 = @"000000D1-0000-1000-8000-0026BB765291";
  v280 = @"PROGRAM_MODE";
  v138 = @"000000D2-0000-1000-8000-0026BB765291";
  v281 = @"IN_USE";
  v139 = @"000000D3-0000-1000-8000-0026BB765291";
  v282 = @"SET_DURATION";
  v140 = @"000000D4-0000-1000-8000-0026BB765291";
  v283 = @"REMAINING_DURATION";
  v141 = @"000000D5-0000-1000-8000-0026BB765291";
  v284 = @"VALVE_TYPE";
  v142 = @"000000D6-0000-1000-8000-0026BB765291";
  v285 = @"IS_CONFIGURED";
  v143 = @"00000126-0000-1000-8000-0026BB765291";
  v286 = @"BUTTON_EVENT";
  v144 = @"00000124-0000-1000-8000-0026BB765291";
  v287 = @"TARGET_LIST";
  v145 = @"00000123-0000-1000-8000-0026BB765291";
  v288 = @"SUPPORTED_TARGET_CONFIGURATION";
  v146 = @"00000128-0000-1000-8000-0026BB765291";
  v289 = @"SELECT_AUDIO_STREAM_CONFIG";
  v147 = @"000000E7-0000-1000-8000-0026BB765291";
  v290 = @"ACTIVE_IDENTIFIER";
  v148 = @"0000021D-0000-1000-8000-0026BB765291";
  v291 = @"CAMERA_OPERATING_MODE_INDICATOR";
  v149 = @"00000223-0000-1000-8000-0026BB765291";
  v292 = @"EVENT_SNAPSHOTS_ACTIVE";
  v150 = @"00000226-0000-1000-8000-0026BB765291";
  v293 = @"RECORDING_AUDIO_ACTIVE";
  v151 = @"000000DB-0000-1000-8000-0026BB765291";
  v294 = @"INPUT_SOURCE_TYPE";
  v152 = @"000000DC-0000-1000-8000-0026BB765291";
  v295 = @"INPUT_DEVICE_TYPE";
  v153 = @"000000DD-0000-1000-8000-0026BB765291";
  v296 = @"CLOSED_CAPTIONS";
  v154 = @"000000E8-0000-1000-8000-0026BB765291";
  v297 = @"SLEEP_DISCOVERY_MODE";
  v155 = @"000000E0-0000-1000-8000-0026BB765291";
  v298 = @"CURRENT_MEDIA_STATE";
  v156 = @"00000137-0000-1000-8000-0026BB765291";
  v299 = @"TARGET_MEDIA_STATE";
  v157 = @"000000E1-0000-1000-8000-0026BB765291";
  v300 = @"REMOTE_KEY";
  v158 = @"000000E2-0000-1000-8000-0026BB765291";
  v301 = @"PICTURE_MODE";
  v159 = @"000000DF-0000-1000-8000-0026BB765291";
  v302 = @"POWER_MODE_SELECTION";
  v160 = @"000000E6-0000-1000-8000-0026BB765291";
  v303 = @"IDENTIFIER";
  v161 = @"000000E3-0000-1000-8000-0026BB765291";
  v304 = @"CONFIGURED_NAME";
  v162 = @"000000E9-0000-1000-8000-0026BB765291";
  v305 = @"VOLUME_CONTROL_TYPE";
  v163 = @"000000EA-0000-1000-8000-0026BB765291";
  v306 = @"VOLUME_SELECTOR";
  v164 = @"00000135-0000-1000-8000-0026BB765291";
  v307 = @"CURRENT_VISIBILITY_STATE";
  v165 = @"00000134-0000-1000-8000-0026BB765291";
  v308 = @"TARGET_VISIBILITY_STATE";
  v166 = @"00000052-0000-1000-8000-0026BB765291";
  v309 = @"FIRMWARE_VERSION_CHR";
  v167 = @"00000020-0000-1000-8000-0026BB765291";
  v310 = @"MANUFACTURER_CHR";
  v168 = @"00000021-0000-1000-8000-0026BB765291";
  v311 = @"MODEL_CHR";
  v169 = @"00000030-0000-1000-8000-0026BB765291";
  v312 = @"SERIAL_NUMBER_CHR";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v170 forKeys:&v31 count:143];
  id v3 = (void *)characteristicTypeLocalizationKeyMapping;
  characteristicTypeLocalizationKeyMapping = v2;

  context = (void *)MEMORY[0x19F3A64A0]();
  id v4 = _getAccessoryCategoryTypeMappings();
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v6 = [v4 allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:&v170 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v4, "hmf_stringForKey:", v11);
        int v13 = [v12 stringByAppendingString:@"_SINGULAR"];

        int v14 = objc_msgSend(v13, "hmf_stringWithSmallestEncoding");
        [v5 setObject:v14 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:&v170 count:16];
    }
    while (v8);
  }

  uint64_t v15 = [v5 copy];
  v16 = (void *)accessoryCategoryLocalizationSingularKeyMapping;
  accessoryCategoryLocalizationSingularKeyMapping = v15;

  uint64_t v17 = _getAccessoryCategoryTypeMappings();
  uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v19 = [v17 allKeys];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:&v170 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v31 + 1) + 8 * j);
        long long v25 = objc_msgSend(v17, "hmf_stringForKey:", v24);
        long long v26 = [v25 stringByAppendingString:@"_MULTIPLE"];

        long long v27 = objc_msgSend(v26, "hmf_stringWithSmallestEncoding");
        [v18 setObject:v27 forKeyedSubscript:v24];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:&v170 count:16];
    }
    while (v21);
  }

  uint64_t v28 = [v18 copy];
  uint64_t v29 = (void *)accessoryCategoryLocalizationPluralKeyMapping;
  accessoryCategoryLocalizationPluralKeyMapping = v28;
}

id _getAccessoryCategoryTypeMappings()
{
  v4[36] = *MEMORY[0x1E4F143B8];
  v3[0] = @"61102194-9993-48BF-A1EF-6C7DC50F0C01";
  v3[1] = @"DD4DE411-8F01-44EE-866A-1F96144DC1B6";
  v4[0] = @"BRIDGE_CATEGORY";
  v4[1] = @"DOOR_CATEGORY";
  v3[2] = @"C25D5FCE-52EC-4599-A815-1192C5F08C7F";
  v3[3] = @"151CB559-0DF9-40AA-8A67-12AF06C4449D";
  v4[2] = @"DOOR_LOCK_CATEGORY";
  void v4[3] = @"FAN_CATEGORY";
  v3[4] = @"604B6E52-2C87-4596-B4C9-D15077C0C07F";
  v3[5] = @"C9EE63DB-2FF7-4514-826A-2FC2F0D4C9F0";
  v4[4] = @"GARAGE_DOOR_OPENER_CATEGORY";
  v4[5] = @"IP_CAMERA_CATEGORY";
  v3[6] = @"57D56F4D-3302-41F7-AB34-5365AA180E81";
  v3[7] = @"0FBA259B-05AC-46F2-875F-204ABB6D9FE7";
  v4[6] = @"LIGHTBULB_CATEGORY";
  v4[7] = @"OTHER_CATEGORY";
  v3[8] = @"730F40D4-6D0E-4903-B09E-520A08AFB78C";
  v3[9] = @"3F9B944B-B8DF-4570-BAF5-CD31A8B321A7";
  v4[8] = @"OUTLET_CATEGORY";
  v4[9] = @"PROGRAMMABLE_SWITCH_CATEGORY";
  v3[10] = @"8E33483E-2102-4BFE-9295-0A187D114188";
  v3[11] = @"14D8FE28-2998-49E3-AC95-E3969BE2957C";
  v4[10] = @"RANGE_EXTENDER_CATEGORY";
  v4[11] = @"SECURITY_SYSTEM_CATEGORY";
  v3[12] = @"772AFB8E-8D2F-455E-90E5-9852E6C4DD31";
  v3[13] = @"2F4C3164-8DE4-4A4F-93BA-DD1D5068DF0B";
  v4[12] = @"SENSOR_CATEGORY";
  v4[13] = @"SWITCH_CATEGORY";
  v3[14] = @"79668DCF-89FB-450D-94B5-AEE70B7B09F1";
  v3[15] = @"957A52E0-BE03-490C-8305-7B20C1CC17BA";
  v4[14] = @"THERMOSTAT_CATEGORY";
  v4[15] = @"VIDEO_DOORBELL_CATEGORY";
  v3[16] = @"1C501511-408E-4C1E-816B-3FC011FFD5B1";
  v3[17] = @"2FB9EE1F-1C21-4D0B-9383-9B65F64DBF0E";
  v4[16] = @"WINDOW_CATEGORY";
  v4[17] = @"WINDOW_COVERING_CATEGORY";
  v3[18] = @"5510B997-D711-4636-870F-82BB61092B15";
  v3[19] = @"BF7036FD-93CF-49B5-954F-CD2B760D11DA";
  v4[18] = @"AIR_PURIFIER_CATEGORY";
  v4[19] = @"AIR_HEATER_CATEGORY";
  v3[20] = @"18DDD63A-27F9-4341-B59B-759D3D114586";
  v3[21] = @"3FEB9075-C9AF-4629-ADBC-A853259C645A";
  v4[20] = @"AIR_CONDITIONER_CATEGORY";
  v4[21] = @"AIR_HUMIDIFIER_CATEGORY";
  v3[22] = @"1E15B639-DC98-41D4-A394-2E4A1D54AA3A";
  v3[23] = @"C0F5EDC5-4003-464A-9E5D-0DB36677BC35";
  v4[22] = @"AIR_DEHUMIDIFIER_CATEGORY";
  v4[23] = @"SPEAKER_CATEGORY";
  v3[24] = @"94D3FBD5-0A74-4EE4-BE1A-C97E82ADFA33";
  v3[25] = @"43CE6F7E-F7E8-44B4-80CE-5786F6E6CD47";
  v4[24] = @"SPRINKLER_CATEGORY";
  v4[25] = @"FAUCET_CATEGORY";
  v3[26] = @"39D2A5B4-F9A6-43F6-90E7-0019F0C0E99F";
  v3[27] = @"F6D2A2AC-3A6E-4E6F-8196-678ABE909D8E";
  v4[26] = @"SHOWER_HEAD_CATEGORY";
  v4[27] = @"APPLE_TV_CATEGORY";
  v3[28] = @"1D8FD40E-7CAE-4AD5-9973-977D18890DE2";
  v3[29] = @"8BFB739C-1E09-4F7B-ABB8-DD7BADD0E8A9";
  v4[28] = @"HOMEPOD_CATEGORY";
  v4[29] = @"AIRPORT_CATEGORY";
  v3[30] = @"770ADB51-8848-491A-BFA3-C34EA096CC92";
  v3[31] = @"830C0952-7CD8-44FB-B0C0-DA4EDB0F32A9";
  v4[30] = @"TARGET_CONTROLLER_CATEGORY";
  v4[31] = @"TELEVISION_CATEGORY";
  v3[32] = @"337635B4-552A-48AD-A38D-DD2D5E826C9A";
  uint64_t v0 = localizedWiFiStringKey(@"ROUTER_CATEGORY");
  v4[32] = v0;
  v4[33] = @"AUDIO_RECEIVER_CATEGORY";
  v3[33] = @"BE15659C-3CE6-4FD0-B152-BCDB488446C6";
  v3[34] = @"FB953A08-6CDD-44E0-B011-CFAC559A3CFB";
  v3[35] = @"B0C866C4-3E25-4F6A-8476-A8A3B579A86E";
  v4[34] = @"TELEVISION_SET_TOP_BOX_CATEGORY";
  v4[35] = @"TELEVISION_STREAMING_STICK_CATEGORY";
  BOOL v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:36];

  return v1;
}

id localizedWiFiStringKey(void *a1)
{
  id v1 = a1;
  int v2 = MGGetBoolAnswer();
  id v3 = @"WIFI";
  if (v2) {
    id v3 = @"WLAN";
  }
  id v4 = [NSString stringWithFormat:@"%@_%@", v1, v3];

  return v4;
}

void ____handleAccessoryRuntimeStateUpdate_block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homeManager];
  [v2 notifyDelegateOfBatchNotificationsEndWithReason:*(void *)(a1 + 40)];
}

void __handleAccessoryRuntimeStateUpdate(void *a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = [v6 allKeys];
  uint64_t v10 = [v8 setWithArray:v9];

  uint64_t v11 = dispatch_group_create();
  uint64_t v12 = [v5 homeManager];
  long long v25 = v7;
  [v12 notifyDelegateOfBatchNotificationsStartWithReason:v7];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v26 = v5;
  int v13 = [v5 accessories];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v19 = [v18 uuid];
        uint64_t v20 = [v19 UUIDString];

        if ([v10 containsObject:v20])
        {
          uint64_t v21 = objc_msgSend(v6, "hmf_dictionaryForKey:", v20);
          dispatch_group_enter(v11);
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = ____handleAccessoryRuntimeStateUpdate_block_invoke;
          v30[3] = &unk_1E59452E8;
          long long v31 = v11;
          [v18 handleRuntimeStateUpdate:v21 completionHandler:v30];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v15);
  }

  uint64_t v22 = dispatch_get_global_queue(-32768, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ____handleAccessoryRuntimeStateUpdate_block_invoke_2;
  block[3] = &unk_1E5945628;
  id v28 = v26;
  id v29 = v25;
  id v23 = v25;
  id v24 = v26;
  dispatch_group_notify(v11, v22, block);
}

void sub_19D1D468C(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x320], 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_19D1D5600(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMHomeManagerStatusToString(unint64_t a1)
{
  if (!a1)
  {
    uint64_t v8 = @"None";
    goto LABEL_11;
  }
  id v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = v2;
  if (a1)
  {
    [v2 addObject:@"Busy"];
    if ((a1 & 0x10) == 0)
    {
LABEL_4:
      if ((a1 & 0x20) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((a1 & 0x10) == 0)
  {
    goto LABEL_4;
  }
  [v3 addObject:@"Needs Device Setup"];
  if ((a1 & 0x20) != 0) {
LABEL_5:
  }
    [v3 addObject:@"No Account"];
LABEL_6:
  uint64_t v4 = [v3 count];
  if (a1 > 0x3F || !v4)
  {
    id v5 = NSString;
    id v6 = [NSNumber numberWithUnsignedInteger:a1];
    id v7 = [v5 stringWithFormat:@"Unknown (%@)", v6];
    [v3 addObject:v7];
  }
  uint64_t v8 = [v3 componentsJoinedByString:@", "];

LABEL_11:

  return v8;
}

__CFString *HMHomeManagerOptionsToString(uint64_t a1)
{
  if (!a1)
  {
    id v2 = @"None";
    goto LABEL_21;
  }
  __int16 v1 = a1;
  if (a1 == -1)
  {
    id v2 = @"All";
    goto LABEL_21;
  }
  id v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = v3;
  if (v1)
  {
    [v3 addObject:@"Homes"];
    if ((v1 & 2) == 0)
    {
LABEL_7:
      if ((v1 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_26;
    }
  }
  else if ((v1 & 2) == 0)
  {
    goto LABEL_7;
  }
  [v4 addObject:@"Pairing Identities"];
  if ((v1 & 4) == 0)
  {
LABEL_8:
    if ((v1 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v4 addObject:@"Rooms"];
  if ((v1 & 8) == 0)
  {
LABEL_9:
    if ((v1 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v4 addObject:@"Users"];
  if ((v1 & 0x10) == 0)
  {
LABEL_10:
    if ((v1 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v4 addObject:@"Current Accessory"];
  if ((v1 & 0x20) == 0)
  {
LABEL_11:
    if ((v1 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v4 addObject:@"Settings"];
  if ((v1 & 0x40) == 0)
  {
LABEL_12:
    if ((v1 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v4 addObject:@"Apple Media Accessories"];
  if ((v1 & 0x80) == 0)
  {
LABEL_13:
    if ((v1 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v4 addObject:@"Media Systems"];
  if ((v1 & 0x100) == 0)
  {
LABEL_14:
    if ((v1 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v4 addObject:@"AirPlay Accessories"];
  if ((v1 & 0x200) == 0)
  {
LABEL_15:
    if ((v1 & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v4 addObject:@"HAP Accessories"];
  if ((v1 & 0x400) == 0)
  {
LABEL_16:
    if ((v1 & 0x800) == 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v4 addObject:@"Television Accessories"];
  if ((v1 & 0x800) == 0)
  {
LABEL_17:
    if ((v1 & 0x1000) == 0) {
      goto LABEL_18;
    }
LABEL_36:
    [v4 addObject:@"Wi-Fi Router Accessories"];
    if ((v1 & 0x8000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_35:
  [v4 addObject:@"Devices"];
  if ((v1 & 0x1000) != 0) {
    goto LABEL_36;
  }
LABEL_18:
  if (v1 < 0) {
LABEL_19:
  }
    [v4 addObject:@"Siri Endpoint Accessories"];
LABEL_20:
  id v2 = [v4 componentsJoinedByString:@", "];

LABEL_21:

  return v2;
}

__CFString *HMXPCClientEntitlementsShortDescription(unint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:64];
  if (a1)
  {
    for (uint64_t i = 1; i - 1 < a1; i *= 2)
    {
      if ((i & a1) != 0)
      {
        if (i > 4095)
        {
          if (i < 0x20000)
          {
            if (i < 0x4000)
            {
              if (i == 4096)
              {
                uint64_t v4 = @"MSG";
                goto LABEL_52;
              }
              if (i == 0x2000)
              {
                uint64_t v4 = @"PM";
                goto LABEL_52;
              }
            }
            else
            {
              switch(i)
              {
                case 0x4000:
                  uint64_t v4 = @"ASA";
                  goto LABEL_52;
                case 0x8000:
                  uint64_t v4 = @"DIA";
                  goto LABEL_52;
                case 0x10000:
                  uint64_t v4 = @"SD";
                  goto LABEL_52;
              }
            }
          }
          else if (i >= 0x100000)
          {
            switch(i)
            {
              case 0x100000:
                uint64_t v4 = @"LCF";
                goto LABEL_52;
              case 0x200000:
                uint64_t v4 = @"MSP";
                goto LABEL_52;
              case 0x400000:
                uint64_t v4 = @"HMMM";
                goto LABEL_52;
            }
          }
          else
          {
            switch(i)
            {
              case 0x20000:
                uint64_t v4 = @"WK";
                goto LABEL_52;
              case 0x40000:
                uint64_t v4 = @"AI";
                goto LABEL_52;
              case 0x80000:
                uint64_t v4 = @"HML";
LABEL_52:
                [v2 addObject:v4];
                break;
            }
          }
        }
        else
        {
          if (i <= 63)
          {
            uint64_t v4 = @"API";
            switch(i)
            {
              case 1:
                goto LABEL_52;
              case 2:
                uint64_t v4 = @"BG";
                goto LABEL_52;
              case 3:
              case 5:
              case 6:
              case 7:
                continue;
              case 4:
                uint64_t v4 = @"SPI";
                goto LABEL_52;
              case 8:
                uint64_t v4 = @"PI";
                goto LABEL_52;
              default:
                if (i == 16)
                {
                  uint64_t v4 = @"PIP";
                }
                else
                {
                  if (i != 32) {
                    continue;
                  }
                  uint64_t v4 = @"RLP";
                }
                break;
            }
            goto LABEL_52;
          }
          if (i > 511)
          {
            switch(i)
            {
              case 512:
                uint64_t v4 = @"MUS";
                goto LABEL_52;
              case 1024:
                uint64_t v4 = @"LOC";
                goto LABEL_52;
              case 2048:
                uint64_t v4 = @"SA";
                goto LABEL_52;
            }
          }
          else
          {
            switch(i)
            {
              case 64:
                uint64_t v4 = @"SP";
                goto LABEL_52;
              case 128:
                uint64_t v4 = @"CC";
                goto LABEL_52;
              case 256:
                uint64_t v4 = @"CI";
                goto LABEL_52;
            }
          }
        }
      }
    }
  }
  if ([v2 count])
  {
    id v5 = [v2 componentsJoinedByString:@","];
  }
  else
  {
    id v5 = @"None";
  }

  return v5;
}

__CFString *HMHomeManagerDataSyncStateToString(unint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<Unknown value: %lu>", a1);
    __int16 v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v1 = off_1E59421A8[a1];
  }

  return v1;
}

uint64_t HMPrivacyGetAuthorizationStatusForHomeKit()
{
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"HMPrivacyGetAuthorizationStatusForHomeKit"];
  int v1 = TCCAccessPreflight();
  if (v1) {
    uint64_t v2 = v1 == 1;
  }
  else {
    uint64_t v2 = 5;
  }
  [v0 invalidate];

  return v2;
}

void sub_19D1D7044(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1D76F0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMStringFromHomeLocation(unint64_t a1)
{
  if (a1 > 3) {
    return @"HMHomeLocationAway";
  }
  else {
    return off_1E5941908[a1];
  }
}

void sub_19D1D79A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1D9AB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location, id a11)
{
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  os_unfair_lock_unlock(v11);
  _Unwind_Resume(a1);
}

void sub_19D1D9F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
  os_unfair_lock_unlock(v10);
  _Unwind_Resume(a1);
}

void __HMPrivacyRequestAccessForService(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6) {
    _HMFPreconditionFailure();
  }
  id v7 = (void (**)(void, void))v6;
  if (a1)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"HMPrivacyRequestAccessForService"];
    int v9 = TCCAccessPreflight();
    if ((v9 - 1) >= 2)
    {
      if (!v9) {
        v7[2](v7, 1);
      }
    }
    else
    {
      id v13 = v5;
      uint64_t v15 = v7;
      id v14 = v8;
      TCCAccessRequest();
    }
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v12;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot request TCC access with unknown service", buf, 0xCu);
    }
    v7[2](v7, 0);
  }
}

void sub_19D1DA8B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D1DAF54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id HMCreateConfigurationsCacheDirectory()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = HMClientScopedHomeKitCacheDirectoryName();
  v4[0] = v0;
  v4[1] = @"com.apple.HomeKit.configurations";
  int v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = HMCreateHomeKitCacheSubdirectoryWithRelativePathComponents(v1);

  return v2;
}

BOOL HMIsHAPMetadataNeededForHMHomeManagerOptions(__int16 a1)
{
  return (a1 & 0x9701) != 0;
}

BOOL HMAreSnapshotsAllowedForCameraAccessMode(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

__CFString *HMHomeWalletKeyColorAsString(uint64_t a1)
{
  if (a1 > 14935010)
  {
    if (a1 == 15521450)
    {
      uint64_t v2 = @"PolishedBrass";
    }
    else
    {
      if (a1 != 14935011)
      {
LABEL_12:
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown wallet key color: %ld", a1);
        uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v2;
      }
      uint64_t v2 = @"SatinChrome";
    }
  }
  else
  {
    if (a1)
    {
      if (a1 == 14341582)
      {
        uint64_t v2 = @"SatinNickel";
        return v2;
      }
      goto LABEL_12;
    }
    uint64_t v2 = @"MatteBlack";
  }
  return v2;
}

void __HMIsCurrentProcessSPIEntitled_block_invoke()
{
  id v8 = [MEMORY[0x1E4F65540] processInfo];
  uint64_t v0 = [v8 valueForEntitlement:@"com.apple.private.homekit"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v1 = v0;
  }
  else {
    uint64_t v1 = 0;
  }
  id v2 = v1;

  char v3 = [v2 BOOLValue];
  if (v3)
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [v8 valueForEntitlement:@"com.apple.homekit.private-spi-access"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    char v4 = [v7 BOOLValue];
  }
  HMIsCurrentProcessSPIEntitled_spiEntitled = v4;
}

void __HMIsCurrentProcessAnExtension_block_invoke()
{
  id v2 = [MEMORY[0x1E4F963E8] currentProcess];
  uint64_t v0 = [v2 bundle];
  uint64_t v1 = [v0 extensionPointIdentifier];
  HMIsCurrentProcessAnExtension_isCurrentProcessAnExtension = v1 != 0;
}

uint64_t __sharedIdentifierSaltStore_block_invoke()
{
  uint64_t v0 = objc_alloc_init(HMIdentifierSaltStore);
  uint64_t v1 = sharedIdentifierSaltStore_identifierSaltStore;
  sharedIdentifierSaltStore_identifierSaltStore = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_19D1DED44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_19D1E1EEC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1E2210(_Unwind_Exception *a1)
{
}

id HMHomeManagerCurrentHomeSPIClientIdentifier()
{
  uint64_t v0 = (id)CFPreferencesCopyAppValue(@"HMCurrentHomeSPIClientIdentifierStatusKey", @"com.apple.homed");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v1 = v0;
  }
  else {
    uint64_t v1 = 0;
  }
  id v2 = v1;

  if (v2) {
    char v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v2];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

void __allowedCharValueTypes_block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  void v4[3] = objc_opt_class();
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v0 setWithArray:v1];
  char v3 = (void *)allowedCharValueTypes_charValueTypes;
  allowedCharValueTypes_charValueTypes = v2;
}

void sub_19D1E3BF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HMUserActionPredictionDuetPredictionStoreReadFrom(void *a1, uint64_t a2)
{
  char v3 = (int *)MEMORY[0x1E4F940E8];
  char v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3))
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
      else
      {
        uint64_t v18 = objc_alloc_init(HMUserActionPredictionDuetPredictionValue);
        [a1 addPrediction:v18];
        if (!PBReaderPlaceMark()
          || (HMUserActionPredictionDuetPredictionValueReadFrom((uint64_t)v18, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t HMMediaSourceDisplayOrderProfile.canModifyOrder.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_canModifyOrder);
}

uint64_t sub_19D1E42D4()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_televisionProfile), sel_mediaSourceDisplayOrder);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (!v1) {
    return v2;
  }
  char v3 = v1;
  sub_19D1E4464();
  unint64_t v4 = sub_19D457388();

  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v5) {
      goto LABEL_4;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    return v2;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_19D457568();
  swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_14;
  }
LABEL_4:
  uint64_t result = sub_19D1E4FA8(0, v5 & ~(v5 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if ((v4 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x19F3A5980](i, v4);
      }
      else {
        id v8 = *(id *)(v4 + 8 * i + 32);
      }
      unsigned int v9 = v8;
      id v10 = objc_msgSend(v8, sel_integerValue);

      unint64_t v12 = *(void *)(v2 + 16);
      unint64_t v11 = *(void *)(v2 + 24);
      if (v12 >= v11 >> 1) {
        sub_19D1E4FA8(v11 > 1, v12 + 1, 1);
      }
      *(void *)(v2 + 16) = v12 + 1;
      *(void *)(v2 + 8 * v12 + 32) = v10;
    }
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

unint64_t sub_19D1E4464()
{
  unint64_t result = qword_1E943E1B0;
  if (!qword_1E943E1B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E943E1B0);
  }
  return result;
}

uint64_t sub_19D1E44A4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x19F3A6CA0](v3);
  uint64_t v5 = *(void *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_19D1E4500(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_delegate;
  swift_beginAccess();
  *(void *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_19D1E4564()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_delegate;
  swift_beginAccess();
  return MEMORY[0x19F3A6CA0](v1);
}

uint64_t sub_19D1E45B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_19D1E4620(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_delegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x19F3A6CA0](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_19D1E46A8;
}

void sub_19D1E46A8(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + *(void *)(*(void *)a1 + 48) + 8) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }

  free(v3);
}

uint64_t sub_19D1E4730(uint64_t a1)
{
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 128) = v1;
  return MEMORY[0x1F4188298](sub_19D1E4750, 0, 0);
}

uint64_t sub_19D1E4750()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = *(void **)(v0[16] + OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_televisionProfile);
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    sub_19D457508();
    uint64_t v4 = (uint64_t *)(v1 + 32);
    do
    {
      uint64_t v5 = *v4++;
      objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v5);
      sub_19D4574E8();
      sub_19D457518();
      sub_19D457528();
      sub_19D4574F8();
      --v3;
    }
    while (v3);
  }
  sub_19D1E4464();
  uint64_t v6 = sub_19D457378();
  v0[17] = v6;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = sub_19D1E4918;
  uint64_t v7 = swift_continuation_init();
  v0[10] = MEMORY[0x1E4F143A8];
  v0[11] = 0x40000000;
  v0[12] = sub_19D1E4AFC;
  v0[13] = &block_descriptor;
  v0[14] = v7;
  objc_msgSend(v2, sel_updateMediaSourceDisplayOrder_completionHandler_, v6, v0 + 10);
  return MEMORY[0x1F41881E8](v0 + 2);
}

uint64_t sub_19D1E4918()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 144) = v1;
  if (v1) {
    uint64_t v2 = sub_19D1E4A8C;
  }
  else {
    uint64_t v2 = sub_19D1E4A28;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_19D1E4A28()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_19D1E4A8C()
{
  uint64_t v1 = *(void **)(v0 + 136);
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_19D1E4AFC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E2A0);
    uint64_t v4 = swift_allocError();
    *uint64_t v5 = a2;
    id v6 = a2;
    return MEMORY[0x1F4188208](v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return MEMORY[0x1F4188200](v7);
  }
}

void sub_19D1E4BF4(void *a1)
{
  uint64_t v3 = MEMORY[0x19F3A6CA0](v1+ OBJC_IVAR____TtCC7HomeKit32HMMediaSourceDisplayOrderProfileP33_9553D125375AA03A444888892644919534HMTelevisionProfileDelegateAdaptor_displayOrderProfile);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    id v5 = objc_msgSend(a1, sel_context);
    id v6 = objc_msgSend(v5, sel_delegateCaller);

    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v4;
    v10[4] = sub_19D1E534C;
    v10[5] = v7;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 1107296256;
    v10[2] = sub_19D1E4DB8;
    v10[3] = &block_descriptor_16;
    id v8 = _Block_copy(v10);
    id v9 = v4;
    swift_release();
    objc_msgSend(v6, sel_invokeBlock_, v8);
    _Block_release(v8);
  }
}

uint64_t sub_19D1E4D28(uint64_t a1)
{
  uint64_t v2 = a1 + OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x19F3A6CA0](v2);
  if (result)
  {
    uint64_t v4 = *(void *)(v2 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, ObjectType, v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_19D1E4DB8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_19D1E4E94()
{
  return sub_19D1E4F14(0, type metadata accessor for HMMediaSourceDisplayOrderProfile.HMTelevisionProfileDelegateAdaptor);
}

id HMMediaSourceDisplayOrderProfile.__deallocating_deinit(uint64_t a1)
{
  return sub_19D1E4F14(a1, type metadata accessor for HMMediaSourceDisplayOrderProfile);
}

id sub_19D1E4F14(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_19D1E4FA8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_19D1E546C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t type metadata accessor for HMMediaSourceDisplayOrderProfile()
{
  return self;
}

uint64_t method lookup function for HMMediaSourceDisplayOrderProfile(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HMMediaSourceDisplayOrderProfile);
}

uint64_t dispatch thunk of HMMediaSourceDisplayOrderProfile.order.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of HMMediaSourceDisplayOrderProfile.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of HMMediaSourceDisplayOrderProfile.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of HMMediaSourceDisplayOrderProfile.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of HMMediaSourceDisplayOrderProfile.writeOrder(_:)(uint64_t a1)
{
  objc_super v4 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v1) + 0x90);
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *id v5 = v2;
  v5[1] = sub_19D1E51E8;
  return v7(a1);
}

uint64_t sub_19D1E51E8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of HMMediaSourceDisplayOrderProfile.Delegate.mediaSourceDisplayOrderProfileDidUpdateOrder(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t type metadata accessor for HMMediaSourceDisplayOrderProfile.HMTelevisionProfileDelegateAdaptor()
{
  return self;
}

uint64_t sub_19D1E5314()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_19D1E534C()
{
  return sub_19D1E4D28(*(void *)(v0 + 16));
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

uint64_t sub_19D1E536C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_19D1E55CC(a1, a2, a3, (void *)*v3, &qword_1E943E290, &qword_1E943E298);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_19D1E539C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_19D1E55CC(a1, a2, a3, (void *)*v3, &qword_1E943E280, &qword_1E943E288);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_19D1E53CC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_19D1E575C(a1, a2, a3, *v3, &qword_1E943E278);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_19D1E53FC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_19D1E575C(a1, a2, a3, *v3, &qword_1E943E270);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_19D1E542C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_19D1E58CC(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_19D1E544C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_19D1E5A34(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_19D1E546C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E2A8);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    id v10 = (char *)MEMORY[0x1E4FBC860];
  }
  char v13 = v10 + 32;
  id v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_19D4575A8();
  __break(1u);
  return result;
}

uint64_t sub_19D1E55CC(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    char v13 = (void *)swift_allocObject();
    int64_t v14 = _swift_stdlib_malloc_size(v13);
    uint64_t v15 = v14 - 32;
    if (v14 < 32) {
      uint64_t v15 = v14 - 17;
    }
    v13[2] = v11;
    v13[3] = 2 * (v15 >> 4);
  }
  else
  {
    char v13 = (void *)MEMORY[0x1E4FBC860];
  }
  unint64_t v16 = (unint64_t)(v13 + 4);
  unint64_t v17 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v13 != a4 || v16 >= v17 + 16 * v11) {
      memmove(v13 + 4, a4 + 4, 16 * v11);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v17 >= v16 + 16 * v11 || v16 >= v17 + 16 * v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_32:
  uint64_t result = sub_19D4575A8();
  __break(1u);
  return result;
}

uint64_t sub_19D1E575C(char a1, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v11 = (char *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    uint64_t v11 = (char *)MEMORY[0x1E4FBC860];
  }
  int64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if (a1)
  {
    if (v11 != a4 || v14 >= &v15[16 * v9]) {
      memmove(v14, v15, 16 * v9);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[16 * v9] || v14 >= &v15[16 * v9])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v11;
  }
LABEL_32:
  uint64_t result = sub_19D4575A8();
  __break(1u);
  return result;
}

uint64_t sub_19D1E58CC(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E268);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  int64_t v14 = a4 + 32;
  size_t v15 = 32 * v8;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[v15]) {
      memmove(v13, v14, v15);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_19D4575A8();
  __break(1u);
  return result;
}

uint64_t sub_19D1E5A34(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E258);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E260);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_19D4575A8();
  __break(1u);
  return result;
}

char *sub_19D1E5BD8(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_televisionProfile] = a1;
  uint64_t v3 = v1;
  id v4 = a1;
  unsigned __int8 v5 = objc_msgSend(v4, sel_mediaSourceDisplayOrderModifiable);
  v3[OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_canModifyOrder] = v5;
  unint64_t v6 = (objc_class *)type metadata accessor for HMMediaSourceDisplayOrderProfile.HMTelevisionProfileDelegateAdaptor();
  int64_t v7 = (char *)objc_allocWithZone(v6);
  swift_unknownObjectWeakInit();
  *(void *)&v7[OBJC_IVAR____TtCC7HomeKit32HMMediaSourceDisplayOrderProfileP33_9553D125375AA03A444888892644919534HMTelevisionProfileDelegateAdaptor_televisionProfile] = v4;
  v13.receiver = v7;
  v13.super_class = v6;
  id v8 = v4;
  uint64_t v9 = (char *)objc_msgSendSuper2(&v13, sel_init);
  objc_msgSend(*(id *)&v9[OBJC_IVAR____TtCC7HomeKit32HMMediaSourceDisplayOrderProfileP33_9553D125375AA03A444888892644919534HMTelevisionProfileDelegateAdaptor_televisionProfile], sel_setDelegate_, v9);
  *(void *)&v3[OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_displayOrderProfileDelegateAdaptor] = v9;

  v12.receiver = v3;
  v12.super_class = (Class)type metadata accessor for HMMediaSourceDisplayOrderProfile();
  uint64_t v10 = (char *)objc_msgSendSuper2(&v12, sel_initWithAccessoryProfile_, v8);
  if (*(void *)&v10[OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_displayOrderProfileDelegateAdaptor]) {
    swift_unknownObjectWeakAssign();
  }
  return v10;
}

void sub_19D1E5D1C()
{
  *(void *)&v0[OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_delegate + 8] = 0;
  swift_unknownObjectWeakInit();

  sub_19D4574A8();
  swift_bridgeObjectRelease();
  sub_19D457558();
  __break(1u);
}

uint64_t sub_19D1E5DB4(uint64_t a1)
{
  return a1;
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

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_1E943E2B0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1E943E2B0);
    }
  }
}

uint64_t AccessoryInfoFetchSettingItem.keyPath.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AccessoryInfoFetchSettingItem.__allocating_init(keyPath:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t AccessoryInfoFetchSettingItem.init(keyPath:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return v2;
}

uint64_t sub_19D1E5EF8()
{
  uint64_t v0 = (void *)sub_19D4571B8();
  uint64_t v1 = (void *)sub_19D4571B8();
  uint64_t v2 = (void *)sub_19D457268();
  id v3 = (id)HMImmutableSettingChangeEventTopicFromComponents(v0, v1, v2);

  uint64_t v4 = sub_19D457278();
  return v4;
}

void AccessoryInfoFetchSettingItem.__allocating_init()()
{
}

void AccessoryInfoFetchSettingItem.init()()
{
}

uint64_t sub_19D1E5FEC()
{
  return swift_bridgeObjectRelease();
}

uint64_t AccessoryInfoFetchSettingItem.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AccessoryInfoFetchSettingItem.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t type metadata accessor for AccessoryInfoFetchSettingItem()
{
  return self;
}

uint64_t method lookup function for AccessoryInfoFetchSettingItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AccessoryInfoFetchSettingItem);
}

uint64_t dispatch thunk of AccessoryInfoFetchSettingItem.__allocating_init(keyPath:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

id sub_19D1E609C(uint64_t a1)
{
  sub_19D457278();
  id v3 = v1;
  sub_19D4571F8();
  *(void *)&v3[OBJC_IVAR___HMAccessoryInfoFetchController_dataSource + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v3[OBJC_IVAR___HMAccessoryInfoFetchController_messageDispatcher] = 0;
  uint64_t v4 = OBJC_IVAR___HMAccessoryInfoFetchController_accessoryFetchHistory;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E350);
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = MEMORY[0x1E4FBC868];
  *(_DWORD *)(v5 + 24) = 0;
  *(void *)(v5 + 16) = v6;
  *(void *)&v3[v4] = v5;
  *(void *)&v3[OBJC_IVAR___HMAccessoryInfoFetchController_minimumFetchThrottleSeconds] = 0x403E000000000000;
  int64_t v7 = &v3[OBJC_IVAR___HMAccessoryInfoFetchController_homeUUID];
  uint64_t v8 = sub_19D4571D8();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v7, a1, v8);

  v12.receiver = v3;
  v12.super_class = (Class)type metadata accessor for AccessoryInfoFetchController();
  id v10 = objc_msgSendSuper2(&v12, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  return v10;
}

uint64_t sub_19D1E6234(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return MEMORY[0x1F4188298](sub_19D1E6254, 0, 0);
}

uint64_t sub_19D1E6254()
{
  long long v33 = v0;
  uint64_t v1 = v0;
  v0[2] = MEMORY[0x1E4FBC860];
  uint64_t v2 = (void **)(v0 + 2);
  uint64_t v3 = v0[4] + OBJC_IVAR___HMAccessoryInfoFetchController_dataSource;
  uint64_t v4 = MEMORY[0x19F3A6CA0](v3);
  v0[5] = v4;
  uint64_t v5 = v0[4];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)(v3 + 8);
    uint64_t v8 = *(void *)(v5 + OBJC_IVAR___HMAccessoryInfoFetchController_accessoryFetchHistory);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v8 + 24));
    sub_19D1E7CC4((uint64_t *)(v8 + 16), v5, v6, v7);
    os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 24));
    unint64_t v14 = v1[3];
    swift_release();
    if (v14 >> 62)
    {
LABEL_20:
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_19D457568();
      uint64_t v16 = v1[3];
      uint64_t v31 = v23;
      if (v23) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v16 = swift_bridgeObjectRetain();
      uint64_t v31 = v15;
      if (v15)
      {
LABEL_11:
        uint64_t v17 = v6;
        uint64_t v6 = v7;
        uint64_t v18 = 0;
        unint64_t v19 = v14 & 0xC000000000000001;
        uint64_t v30 = v16 + 32;
        while (1)
        {
          if (v19)
          {
            unint64_t v14 = MEMORY[0x19F3A5980](v18, v1[3]);
            uint64_t v20 = v18 + 1;
            if (__OFADD__(v18, 1)) {
              goto LABEL_19;
            }
          }
          else
          {
            unint64_t v14 = *(void *)(v30 + 8 * v18);
            swift_retain();
            uint64_t v20 = v18 + 1;
            if (__OFADD__(v18, 1))
            {
LABEL_19:
              __break(1u);
              goto LABEL_20;
            }
          }
          uint64_t v7 = (uint64_t)v1;
          uint64_t v21 = v1[4];
          unint64_t v32 = v14;
          sub_19D1E68DC((uint64_t *)&v32, v17, v6, v21, v2);
          swift_release();
          ++v18;
          if (v20 == v31)
          {
            swift_bridgeObjectRelease();
            uint64_t v22 = v1[2];
            goto LABEL_22;
          }
        }
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v22 = MEMORY[0x1E4FBC860];
LABEL_22:
    uint64_t v24 = v1[4];
    if (*(void *)(v22 + 16))
    {
      uint64_t v25 = swift_task_alloc();
      v1[6] = v25;
      *(void *)(v25 + 16) = v24;
      *(void *)(v25 + 24) = v2;
      long long v26 = (void *)swift_task_alloc();
      v1[7] = v26;
      void *v26 = v1;
      v26[1] = sub_19D1E66E0;
      return MEMORY[0x1F4188160]();
    }
    long long v27 = sub_19D4571E8();
    os_log_type_t v28 = sub_19D4573F8();
    if (os_log_type_enabled(v27, v28))
    {
      id v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v29 = 0;
      _os_log_impl(&dword_19D1A8000, v27, v28, "Nothing left to fetch", v29, 2u);
      MEMORY[0x19F3A6C10](v29, -1, -1);
    }
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
    objc_super v12 = (uint64_t (*)(void))v1[1];
  }
  else
  {
    uint64_t v9 = sub_19D4571E8();
    os_log_type_t v10 = sub_19D457418();
    if (os_log_type_enabled(v9, v10))
    {
      size_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)size_t v11 = 0;
      _os_log_impl(&dword_19D1A8000, v9, v10, "Nil data source", v11, 2u);
      MEMORY[0x19F3A6C10](v11, -1, -1);
    }

    objc_msgSend(self, sel_hmErrorWithCode_, 21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    objc_super v12 = (uint64_t (*)(void))v0[1];
  }
  return v12();
}

uint64_t sub_19D1E66E0()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_19D1E6868;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_19D1E67FC;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_19D1E67FC()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_19D1E6868()
{
  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_19D1E68DC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, void **a5)
{
  v99 = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E378);
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  v97 = (uint64_t (*)(char *, uint64_t))((char *)&v87 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v9);
  v102 = (char *)&v87 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E380);
  MEMORY[0x1F4188790](v12 - 8);
  unint64_t v14 = (char *)&v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_19D4571D8();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  v89 = (char *)&v87 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  v101 = (char *)&v87 - v20;
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  v95 = (char *)&v87 - v22;
  MEMORY[0x1F4188790](v21);
  uint64_t v24 = (char *)&v87 - v23;
  uint64_t v25 = *a1;
  uint64_t ObjectType = swift_getObjectType();
  long long v27 = *(void (**)(uint64_t, uint64_t))(a3 + 8);
  uint64_t v96 = a2;
  uint64_t v93 = ObjectType;
  uint64_t v94 = a3;
  v27(a4, v25 + OBJC_IVAR____TtC7HomeKit32AccessoryInfoFetchItemCollection_accessoryUniqueIdentifier);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_19D1E8F8C((uint64_t)v14, &qword_1E943E380);
    swift_retain_n();
    os_log_type_t v28 = sub_19D4571E8();
    os_log_type_t v29 = sub_19D457418();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v92 = v25;
      uint64_t v31 = (uint8_t *)v30;
      uint64_t v32 = swift_slowAlloc();
      v104 = (char *)v32;
      *(_DWORD *)uint64_t v31 = 136315138;
      sub_19D1E9838(&qword_1E943E388);
      uint64_t v33 = sub_19D457628();
      uint64_t v103 = sub_19D1EFF40(v33, v34, (uint64_t *)&v104);
      sub_19D457438();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_19D1A8000, v28, v29, "Accessory %s not found in home", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x19F3A6C10](v32, -1, -1);
      MEMORY[0x19F3A6C10](v31, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    objc_msgSend(self, sel_hmErrorWithCode_, 2);
    return swift_willThrow();
  }
  uint64_t v91 = v15;
  uint64_t v92 = v25;
  uint64_t v98 = v16;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v24, v14, v15);
  uint64_t v90 = a4;
  long long v35 = *(os_unfair_lock_s **)(a4 + OBJC_IVAR___HMAccessoryInfoFetchController_accessoryFetchHistory);
  swift_retain();
  os_unfair_lock_lock(v35 + 6);
  uint64_t v36 = *(void *)&v35[4]._os_unfair_lock_opaque;
  uint64_t v37 = *(void *)(v36 + 16);
  v100 = v24;
  if (v37 && (unint64_t v38 = sub_19D1F0530((uint64_t)v24), (v39 & 1) != 0))
  {
    unint64_t v40 = v38;
    uint64_t v41 = *(void *)(v36 + 56);
    uint64_t v42 = sub_19D4571A8();
    uint64_t v43 = *(void *)(v42 - 8);
    uint64_t v44 = v43;
    uint64_t v45 = v41 + *(void *)(v43 + 72) * v40;
    uint64_t v46 = (uint64_t)v102;
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v102, v45, v42);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v44 + 56))(v46, 0, 1, v42);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v44 + 48))(v46, 1, v42) != 1)
    {
      sub_19D1E8F8C(v46, &qword_1E943E378);
      os_unfair_lock_unlock(v35 + 6);
      swift_release();
      v78 = v89;
      uint64_t v79 = v98;
      uint64_t v52 = v100;
      uint64_t v49 = v91;
      (*(void (**)(char *, char *, uint64_t))(v98 + 16))(v89, v100, v91);
      v80 = sub_19D4571E8();
      os_log_type_t v81 = sub_19D4573F8();
      if (os_log_type_enabled(v80, v81))
      {
        v82 = (uint8_t *)swift_slowAlloc();
        uint64_t v83 = swift_slowAlloc();
        v104 = (char *)v83;
        *(_DWORD *)v82 = 136315138;
        sub_19D1E9838(&qword_1E943E388);
        uint64_t v84 = sub_19D457628();
        uint64_t v103 = sub_19D1EFF40(v84, v85, (uint64_t *)&v104);
        uint64_t v49 = v91;
        sub_19D457438();
        swift_bridgeObjectRelease();
        v59 = *(void (**)(char *, uint64_t))(v79 + 8);
        v59(v78, v49);
        _os_log_impl(&dword_19D1A8000, v80, v81, "%s will not be queried due to fetch throttle", v82, 0xCu);
        swift_arrayDestroy();
        uint64_t v86 = v83;
        uint64_t v52 = v100;
        MEMORY[0x19F3A6C10](v86, -1, -1);
        MEMORY[0x19F3A6C10](v82, -1, -1);
      }
      else
      {

        v59 = *(void (**)(char *, uint64_t))(v79 + 8);
        v59(v78, v49);
      }
      return ((uint64_t (*)(char *, uint64_t))v59)(v52, v49);
    }
    v87 = (char *)&v35[4];
    os_unfair_lock_t v88 = v35 + 6;
    v89 = (char *)v35;
  }
  else
  {
    v87 = (char *)&v35[4];
    os_unfair_lock_t v88 = v35 + 6;
    v89 = (char *)v35;
    uint64_t v42 = sub_19D4571A8();
    uint64_t v46 = (uint64_t)v102;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v102, 1, 1, v42);
  }
  sub_19D1E8F8C(v46, &qword_1E943E378);
  v102 = *(char **)(v98 + 16);
  uint64_t v47 = (uint64_t)v95;
  uint64_t v48 = v100;
  uint64_t v49 = v91;
  ((void (*)(char *, char *, uint64_t))v102)(v95, v100, v91);
  uint64_t v50 = (uint64_t)v97;
  uint64_t v51 = v90;
  (*(void (**)(uint64_t, uint64_t))(v94 + 16))(v90, v93);
  sub_19D4571A8();
  uint64_t v52 = v48;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v50, 0, 1, v42);
  sub_19D1E7490(v50, v47);
  os_unfair_lock_unlock(v88);
  swift_release();
  v53 = v101;
  ((void (*)(char *, char *, uint64_t))v102)(v101, v52, v49);
  v54 = sub_19D4571E8();
  os_log_type_t v55 = sub_19D4573F8();
  if (os_log_type_enabled(v54, v55))
  {
    v56 = (uint8_t *)swift_slowAlloc();
    v102 = (char *)swift_slowAlloc();
    v104 = v102;
    *(_DWORD *)v56 = 136315138;
    sub_19D1E9838(&qword_1E943E388);
    uint64_t v57 = sub_19D457628();
    uint64_t v103 = sub_19D1EFF40(v57, v58, (uint64_t *)&v104);
    uint64_t v52 = v100;
    sub_19D457438();
    swift_bridgeObjectRelease();
    v59 = *(void (**)(char *, uint64_t))(v98 + 8);
    v59(v53, v49);
    _os_log_impl(&dword_19D1A8000, v54, v55, "%s will be queried", v56, 0xCu);
    v60 = v102;
    swift_arrayDestroy();
    MEMORY[0x19F3A6C10](v60, -1, -1);
    v61 = v56;
    uint64_t v51 = v90;
    MEMORY[0x19F3A6C10](v61, -1, -1);
  }
  else
  {

    v59 = *(void (**)(char *, uint64_t))(v98 + 8);
    v59(v53, v49);
  }
  unint64_t v63 = *(void *)(v92 + 16);
  if (!(v63 >> 62))
  {
    uint64_t v64 = *(void *)((v63 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    if (v64) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = sub_19D457568();
  uint64_t v64 = result;
  if (!result)
  {
LABEL_33:
    swift_bridgeObjectRelease_n();
    return ((uint64_t (*)(char *, uint64_t))v59)(v52, v49);
  }
LABEL_16:
  if (v64 < 1)
  {
    __break(1u);
  }
  else
  {
    v97 = (uint64_t (*)(char *, uint64_t))v59;
    uint64_t v65 = 0;
    v102 = (char *)(v51 + OBJC_IVAR___HMAccessoryInfoFetchController_homeUUID);
    v101 = (char *)(v63 & 0xC000000000000001);
    do
    {
      if (v101)
      {
        uint64_t v67 = MEMORY[0x19F3A5980](v65, v63);
      }
      else
      {
        uint64_t v67 = *(void *)(v63 + 8 * v65 + 32);
        swift_retain();
      }
      uint64_t v68 = (*(uint64_t (**)(char *, char *))(*(void *)v67 + 88))(v52, v102);
      if (v69)
      {
        uint64_t v70 = v68;
        uint64_t v71 = v69;
        unint64_t v72 = v63;
        v73 = v99;
        v74 = *v99;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        void *v73 = v74;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v74 = sub_19D1EFAE8(0, v74[2] + 1, 1, v74);
          __CFString *v99 = v74;
        }
        unint64_t v77 = v74[2];
        unint64_t v76 = v74[3];
        if (v77 >= v76 >> 1)
        {
          v74 = sub_19D1EFAE8((void *)(v76 > 1), v77 + 1, 1, v74);
          __CFString *v99 = v74;
        }
        v74[2] = v77 + 1;
        v66 = &v74[2 * v77];
        v66[4] = v70;
        v66[5] = v71;
        uint64_t v52 = v100;
        unint64_t v63 = v72;
      }
      swift_release();
      ++v65;
    }
    while (v64 != v65);
    swift_bridgeObjectRelease_n();
    return v97(v52, v91);
  }
  return result;
}

uint64_t sub_19D1E7490(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E378);
  MEMORY[0x1F4188790]();
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_19D4571A8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1, 1, v8) == 1)
  {
    sub_19D1E8F8C(a1, &qword_1E943E378);
    sub_19D1E8FE8(a2, v7);
    uint64_t v12 = sub_19D4571D8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a2, v12);
    return sub_19D1E8F8C((uint64_t)v7, &qword_1E943E378);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v11, a1, v8);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v17 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_19D1E9540((uint64_t)v11, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v17;
    swift_bridgeObjectRelease();
    uint64_t v15 = sub_19D4571D8();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(a2, v15);
  }
}

void sub_19D1E76BC(uint64_t a1, void *a2, uint64_t *a3)
{
  long long v27 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E358);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_allocWithZone(MEMORY[0x1E4F65488]);
  uint64_t v10 = @"HMAccessoryInfoFetchMessageName";
  uint64_t v11 = (void *)sub_19D4571B8();
  id v12 = objc_msgSend(v9, sel_initWithTarget_, v11);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E360);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19D47AB80;
  *(void *)(inited + 32) = sub_19D457278();
  *(void *)(inited + 40) = v14;
  uint64_t v15 = *a3;
  *(void *)(inited + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E368);
  *(void *)(inited + 48) = v15;
  swift_bridgeObjectRetain();
  sub_19D1EA558(inited);
  id v16 = objc_allocWithZone(MEMORY[0x1E4F654B0]);
  uint64_t v17 = (void *)sub_19D457218();
  swift_bridgeObjectRelease();
  id v18 = objc_msgSend(v16, sel_initWithName_destination_payload_, v10, v12, v17);

  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  unint64_t v19 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v20 = swift_allocObject();
  uint64_t v21 = v27;
  *(void *)(v20 + 16) = v27;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v20 + v19, v8, v5);
  aBlock[4] = sub_19D1E8EEC;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19D1E7C18;
  aBlock[3] = &block_descriptor_1;
  uint64_t v22 = _Block_copy(aBlock);
  uint64_t v23 = v21;
  swift_release();
  objc_msgSend(v18, sel_setResponseHandler_, v22);
  _Block_release(v22);
  uint64_t v24 = *(void **)&v23[OBJC_IVAR___HMAccessoryInfoFetchController_messageDispatcher];
  if (v24)
  {
    id v25 = v24;
    objc_msgSend(v25, sel_sendMessage_, v18);
  }
}

uint64_t sub_19D1E79DC(void *a1)
{
  if (a1)
  {
    id v2 = a1;
    id v3 = a1;
    id v4 = a1;
    uint64_t v5 = sub_19D4571E8();
    os_log_type_t v6 = sub_19D457418();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 138412290;
      id v9 = a1;
      uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
      sub_19D457438();
      *uint64_t v8 = v14;

      _os_log_impl(&dword_19D1A8000, v5, v6, "Fetch failed %@", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E370);
      swift_arrayDestroy();
      MEMORY[0x19F3A6C10](v8, -1, -1);
      MEMORY[0x19F3A6C10](v7, -1, -1);
    }
    else
    {
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E358);
    return sub_19D4573D8();
  }
  else
  {
    uint64_t v10 = sub_19D4571E8();
    os_log_type_t v11 = sub_19D4573F8();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_19D1A8000, v10, v11, "Fetch succeeded", v12, 2u);
      MEMORY[0x19F3A6C10](v12, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E358);
    return sub_19D4573E8();
  }
}

uint64_t sub_19D1E7C18(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void (**)(void *, uint64_t))(a1 + 32);
  if (a3) {
    uint64_t v5 = sub_19D457228();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a2;
  v4(a2, v5);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_19D1E7CC4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v91 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E378);
  MEMORY[0x1F4188790](v7 - 8);
  v82 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_19D4571A8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  unint64_t v76 = (char *)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v70 - v13;
  uint64_t v15 = sub_19D4571D8();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  v80 = (char *)&v70 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  uint64_t v103 = (uint64_t)&v70 - v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E398);
  uint64_t v21 = MEMORY[0x1F4188790](v20 - 8);
  uint64_t v94 = (char *)&v70 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v21);
  uint64_t v93 = (uint64_t)&v70 - v23;
  uint64_t v83 = a1;
  uint64_t v24 = *a1;
  uint64_t v25 = *(void *)(*a1 + 64);
  uint64_t v73 = *a1 + 64;
  uint64_t v26 = 1 << *(unsigned char *)(v24 + 32);
  uint64_t v27 = -1;
  if (v26 < 64) {
    uint64_t v27 = ~(-1 << v26);
  }
  unint64_t v28 = v27 & v25;
  uint64_t v79 = a2 + OBJC_IVAR___HMAccessoryInfoFetchController_log;
  unint64_t v29 = (unint64_t)(v26 + 63) >> 6;
  uint64_t v86 = v10 + 16;
  v97 = (void (**)(char *, uint64_t, uint64_t))(v10 + 32);
  uint64_t v98 = (void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  uint64_t v92 = a4;
  uint64_t v89 = a4 + 24;
  uint64_t v90 = (void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32);
  uint64_t v95 = v16;
  v100 = (void (**)(char *, uint64_t))(v16 + 8);
  v78 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
  uint64_t v96 = v10;
  os_unfair_lock_t v88 = (void (**)(char *, uint64_t))(v10 + 8);
  unint64_t v70 = v29 - 1;
  uint64_t result = swift_bridgeObjectRetain();
  unint64_t v31 = 0;
  int64_t v77 = v29;
  unint64_t v71 = v29 - 5;
  uint64_t v87 = result;
  uint64_t v72 = result + 104;
  *(void *)&long long v32 = 136315138;
  long long v75 = v32;
  uint64_t v74 = MEMORY[0x1E4FBC840] + 8;
  uint64_t v99 = v9;
  uint64_t v84 = a2;
  uint64_t v85 = v15;
  os_log_type_t v81 = v14;
  while (1)
  {
    if (v28)
    {
      uint64_t v101 = (v28 - 1) & v28;
      unint64_t v102 = v31;
      unint64_t v34 = __clz(__rbit64(v28)) | (v31 << 6);
      goto LABEL_8;
    }
    int64_t v40 = v31 + 1;
    if (__OFADD__(v31, 1)) {
      break;
    }
    if (v40 >= v77)
    {
      unint64_t v42 = v31;
    }
    else
    {
      unint64_t v41 = *(void *)(v73 + 8 * v40);
      if (v41) {
        goto LABEL_12;
      }
      unint64_t v42 = v31 + 1;
      if ((uint64_t)(v31 + 2) < v77)
      {
        unint64_t v41 = *(void *)(v73 + 8 * (v31 + 2));
        if (v41)
        {
          int64_t v40 = v31 + 2;
          goto LABEL_12;
        }
        unint64_t v42 = v31 + 2;
        if ((uint64_t)(v31 + 3) < v77)
        {
          unint64_t v41 = *(void *)(v73 + 8 * (v31 + 3));
          if (v41)
          {
            int64_t v40 = v31 + 3;
LABEL_12:
            uint64_t v101 = (v41 - 1) & v41;
            unint64_t v102 = v40;
            unint64_t v34 = __clz(__rbit64(v41)) + (v40 << 6);
LABEL_8:
            uint64_t v35 = v87;
            uint64_t v36 = (uint64_t)v94;
            (*(void (**)(char *, unint64_t, uint64_t))(v95 + 16))(v94, *(void *)(v87 + 48) + *(void *)(v95 + 72) * v34, v15);
            uint64_t v37 = v96;
            unint64_t v38 = *(void *)(v35 + 56) + *(void *)(v96 + 72) * v34;
            uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E3A0);
            (*(void (**)(uint64_t, unint64_t, uint64_t))(v37 + 16))(v36 + *(int *)(v39 + 48), v38, v9);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v36, 0, 1, v39);
            goto LABEL_15;
          }
          int64_t v40 = v31 + 4;
          unint64_t v42 = v31 + 3;
          if ((uint64_t)(v31 + 4) < v77)
          {
            unint64_t v41 = *(void *)(v73 + 8 * v40);
            if (v41) {
              goto LABEL_12;
            }
            while (v71 != v31)
            {
              unint64_t v41 = *(void *)(v72 + 8 * v31++);
              if (v41)
              {
                int64_t v40 = v31 + 4;
                goto LABEL_12;
              }
            }
            unint64_t v42 = v70;
          }
        }
      }
    }
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E3A0);
    uint64_t v44 = v94;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v94, 1, 1, v43);
    uint64_t v101 = 0;
    unint64_t v102 = v42;
    uint64_t v36 = (uint64_t)v44;
LABEL_15:
    uint64_t v45 = v93;
    sub_19D1E987C(v36, v93, &qword_1E943E398);
    uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E3A0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 48))(v45, 1, v46) == 1) {
      return swift_release();
    }
    uint64_t v47 = v45 + *(int *)(v46 + 48);
    (*v90)(v103, v45, v15);
    uint64_t v48 = *v97;
    (*v97)(v14, v47, v9);
    uint64_t ObjectType = swift_getObjectType();
    if (fabs((*(double (**)(uint64_t, char *, uint64_t))(v92 + 24))(a2, v14, ObjectType)) < 30.0)
    {
      (*v88)(v14, v9);
      uint64_t v33 = *v100;
    }
    else
    {
      uint64_t v50 = v80;
      (*v98)(v80, v103, v15);
      uint64_t v51 = sub_19D4571E8();
      os_log_type_t v52 = sub_19D4573F8();
      if (os_log_type_enabled(v51, v52))
      {
        uint64_t v53 = v15;
        uint64_t v54 = swift_slowAlloc();
        uint64_t v55 = swift_slowAlloc();
        uint64_t v104 = v55;
        *(_DWORD *)uint64_t v54 = v75;
        sub_19D1E9838(&qword_1E943E388);
        uint64_t v56 = sub_19D457628();
        *(void *)(v54 + 4) = sub_19D1EFF40(v56, v57, &v104);
        swift_bridgeObjectRelease();
        uint64_t v33 = *v100;
        (*v100)(v50, v53);
        _os_log_impl(&dword_19D1A8000, v51, v52, "Clearing fetch history for %s", (uint8_t *)v54, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x19F3A6C10](v55, -1, -1);
        MEMORY[0x19F3A6C10](v54, -1, -1);
      }
      else
      {

        uint64_t v33 = *v100;
        (*v100)(v50, v15);
      }
      unint64_t v58 = v83;
      swift_bridgeObjectRetain();
      unint64_t v59 = sub_19D1F0530(v103);
      char v61 = v60;
      swift_bridgeObjectRelease();
      a2 = v84;
      if (v61)
      {
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v63 = *v58;
        uint64_t v104 = *v58;
        uint64_t *v58 = 0x8000000000000000;
        uint64_t v64 = v85;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_19D1F1274();
          uint64_t v63 = v104;
        }
        v33((char *)(*(void *)(v63 + 48) + *(void *)(v95 + 72) * v59), v64);
        uint64_t v65 = v104;
        v66 = v76;
        uint64_t v67 = v99;
        v48(v76, *(void *)(v104 + 56) + *(void *)(v96 + 72) * v59, v99);
        sub_19D1E920C(v59, v65);
        uint64_t *v58 = v65;
        swift_bridgeObjectRelease();
        uint64_t v68 = (uint64_t)v82;
        v48(v82, (uint64_t)v66, v67);
        uint64_t v69 = 0;
        a2 = v84;
      }
      else
      {
        uint64_t v69 = 1;
        uint64_t v68 = (uint64_t)v82;
        uint64_t v67 = v99;
      }
      (*v78)(v68, v69, 1, v67);
      sub_19D1E8F8C(v68, &qword_1E943E378);
      uint64_t v14 = v81;
      (*v88)(v81, v67);
      uint64_t v15 = v85;
    }
    uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v33)(v103, v15);
    uint64_t v9 = v99;
    unint64_t v28 = v101;
    unint64_t v31 = v102;
  }
  __break(1u);
  return result;
}

id AccessoryInfoFetchController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void AccessoryInfoFetchController.init()()
{
}

id AccessoryInfoFetchController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccessoryInfoFetchController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_19D1E8838@<X0>(uint64_t a1@<X8>)
{
  id v3 = (void *)sub_19D4571B8();
  id v4 = objc_msgSend(v1, sel_accessoryWithUniqueIdentifier_, v3);

  if (v4)
  {
    id v5 = objc_msgSend(v4, sel_uuid);

    sub_19D4571C8();
    uint64_t v6 = sub_19D4571D8();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
    uint64_t v8 = v6;
    uint64_t v9 = a1;
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v11 = sub_19D4571D8();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v8 = v11;
    uint64_t v9 = a1;
    uint64_t v10 = 1;
  }

  return v7(v9, v10, 1, v8);
}

uint64_t sub_19D1E894C()
{
  return sub_19D457188();
}

char *HMHome.accessoryInfoFetchController.getter()
{
  id v1 = v0;
  uint64_t v2 = sub_19D4571D8();
  MEMORY[0x1F4188790](v2 - 8);
  id v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(v1, sel_accessoryInfoFetch))
  {
    sub_19D457458();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
  }
  sub_19D1E987C((uint64_t)v15, (uint64_t)v16, &qword_1E943E330);
  if (v17)
  {
    type metadata accessor for AccessoryInfoFetchController();
    if (swift_dynamicCast()) {
      return (char *)v14[1];
    }
  }
  else
  {
    sub_19D1E8F8C((uint64_t)v16, &qword_1E943E330);
  }
  id v6 = objc_msgSend(v1, sel_uuid);
  sub_19D4571C8();

  id v7 = objc_allocWithZone((Class)type metadata accessor for AccessoryInfoFetchController());
  id v5 = (char *)sub_19D1E609C((uint64_t)v4);
  id v8 = objc_msgSend(v1, sel_context);
  if (!v8)
  {
    id v9 = objc_allocWithZone((Class)_HMContext);
    uint64_t v10 = (void *)sub_19D457268();
    id v8 = objc_msgSend(v9, sel_initWithName_, v10);
  }
  id v11 = objc_msgSend(v8, sel_messageDispatcher);
  uint64_t v12 = *(void **)&v5[OBJC_IVAR___HMAccessoryInfoFetchController_messageDispatcher];
  *(void *)&v5[OBJC_IVAR___HMAccessoryInfoFetchController_messageDispatcher] = v11;

  *(void *)&v5[OBJC_IVAR___HMAccessoryInfoFetchController_dataSource + 8] = &off_1EEE9A740;
  swift_unknownObjectWeakAssign();

  objc_msgSend(v1, sel_setAccessoryInfoFetch_, v5);
  return v5;
}

void sub_19D1E8B9C(uint64_t a1)
{
  sub_19D1E76BC(a1, *(void **)(v1 + 16), *(uint64_t **)(v1 + 24));
}

uint64_t type metadata accessor for AccessoryInfoFetchController()
{
  uint64_t result = qword_1E943E338;
  if (!qword_1E943E338) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_19D1E8BF0()
{
  return type metadata accessor for AccessoryInfoFetchController();
}

uint64_t sub_19D1E8BF8()
{
  uint64_t result = sub_19D457208();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_19D4571D8();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t method lookup function for AccessoryInfoFetchController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AccessoryInfoFetchController);
}

uint64_t dispatch thunk of AccessoryInfoFetchController.fetchUpdates(for:)(uint64_t a1)
{
  id v4 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v1) + 0xD8);
  id v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *id v5 = v2;
  v5[1] = sub_19D1E51E8;
  return v7(a1);
}

uint64_t sub_19D1E8E1C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E358);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_19D1E8EEC(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E358);

  return sub_19D1E79DC(a1);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_19D1E8F8C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_19D1E8FE8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_19D4571A8();
  uint64_t v18 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  unint64_t v9 = sub_19D1F0530(a1);
  LOBYTE(a1) = v10;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *v3;
    uint64_t v19 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_19D1F1274();
      uint64_t v12 = v19;
    }
    uint64_t v13 = *(void *)(v12 + 48);
    uint64_t v14 = sub_19D4571D8();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13 + *(void *)(*(void *)(v14 - 8) + 72) * v9, v14);
    uint64_t v15 = *(void (**)(char *, unint64_t, uint64_t))(v18 + 32);
    v15(v8, *(void *)(v12 + 56) + *(void *)(v18 + 72) * v9, v6);
    sub_19D1E920C(v9, v12);
    *uint64_t v3 = v12;
    swift_bridgeObjectRelease();
    v15(a2, (unint64_t)v8, v6);
    return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(a2, 0, 1, v6);
  }
  else
  {
    uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    return v17(a2, 1, 1, v6);
  }
}

unint64_t sub_19D1E920C(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_19D4571D8();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x1F4188790]();
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 64;
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    unint64_t result = sub_19D457468();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      unint64_t v39 = (result + 1) & v12;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v40 = v13;
      uint64_t v37 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      unint64_t v38 = v14;
      uint64_t v36 = v12;
      do
      {
        uint64_t v16 = v9;
        uint64_t v17 = v15;
        int64_t v18 = v15 * v11;
        v38(v8, *(void *)(a2 + 48) + v15 * v11, v4);
        sub_19D1E9838(&qword_1E943E390);
        uint64_t v19 = sub_19D457248();
        unint64_t result = (*v37)(v8, v4);
        unint64_t v20 = v19 & v12;
        if (a1 >= (uint64_t)v39)
        {
          if (v20 >= v39 && a1 >= (uint64_t)v20)
          {
LABEL_16:
            if (v17 * a1 < v18
              || *(void *)(a2 + 48) + v17 * a1 >= (unint64_t)(*(void *)(a2 + 48) + v18 + v17))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v17 * a1 != v18)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v23 = *(void *)(a2 + 56);
            uint64_t v24 = *(void *)(*(void *)(sub_19D4571A8() - 8) + 72);
            int64_t v25 = v24 * a1;
            unint64_t result = v23 + v24 * a1;
            int64_t v26 = v24 * v11;
            unint64_t v27 = v23 + v24 * v11 + v24;
            BOOL v28 = v25 < v26 || result >= v27;
            uint64_t v9 = v16;
            if (v28)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              a1 = v11;
              uint64_t v12 = v36;
            }
            else
            {
              a1 = v11;
              uint64_t v12 = v36;
              if (v25 != v26)
              {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
                a1 = v11;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v20 >= v39 || a1 >= (uint64_t)v20)
        {
          goto LABEL_16;
        }
        uint64_t v9 = v16;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v12;
        uint64_t v15 = v17;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    unint64_t v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v30 = *v29;
    uint64_t v31 = (-1 << a1) - 1;
  }
  else
  {
    unint64_t v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v29;
    uint64_t v30 = (-1 << a1) - 1;
  }
  *unint64_t v29 = v31 & v30;
  uint64_t v32 = *(void *)(a2 + 16);
  BOOL v33 = __OFSUB__(v32, 1);
  uint64_t v34 = v32 - 1;
  if (v33)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v34;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_19D1E9540(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_19D4571D8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790]();
  unint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_19D1F0530(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_19D1F1274();
      goto LABEL_7;
    }
    sub_19D1F06D8(v17, a3 & 1);
    unint64_t v28 = sub_19D1F0530(a2);
    if ((v18 & 1) == (v29 & 1))
    {
      unint64_t v14 = v28;
      unint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_19D1E9744(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_19D457658();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7];
  uint64_t v22 = sub_19D4571A8();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 40);
  uint64_t v25 = v22;
  uint64_t v26 = v21 + *(void *)(v23 + 72) * v14;

  return v24(v26, a1, v25);
}

uint64_t sub_19D1E9744(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_19D4571D8();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = sub_19D4571A8();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, a3, v11);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

uint64_t sub_19D1E9838(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_19D4571D8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_19D1E987C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_19D1E98E0()
{
  uint64_t v0 = self;
  uint64_t v1 = (void *)sub_19D4571B8();
  uint64_t v2 = (void *)sub_19D4571B8();
  id v3 = objc_msgSend(v0, sel_topicFromSuffixID_homeUUID_accessoryUUID_, 506, v1, v2);

  if (!v3) {
    return 0;
  }
  uint64_t v4 = sub_19D457278();

  return v4;
}

uint64_t AccessoryInfoFetchSoftwareUpdateItem.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t AccessoryInfoFetchSoftwareUpdateItem.init()()
{
  return v0;
}

uint64_t AccessoryInfoFetchSoftwareUpdateItem.deinit()
{
  return v0;
}

uint64_t AccessoryInfoFetchSoftwareUpdateItem.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for AccessoryInfoFetchSoftwareUpdateItem()
{
  return self;
}

uint64_t _sSo11HMAccessoryC7HomeKitE18televisionProfiles3for13isSPIEntitledSaySo0A7ProfileCGSaySo9HMServiceCG_SbtFZ_0(unint64_t a1, char a2)
{
  unint64_t v2 = a1;
  uint64_t v55 = MEMORY[0x1E4FBC860];
  if (a1 >> 62) {
    goto LABEL_56;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_19D457568())
  {
    unint64_t v4 = 0;
    unint64_t v51 = v2 & 0xC000000000000001;
    unint64_t v47 = v2 + 32;
    uint64_t v48 = v2 & 0xFFFFFFFFFFFFFF8;
    unint64_t v49 = v2;
    uint64_t v50 = v3;
    while (1)
    {
      if (v51)
      {
        id v5 = (id)MEMORY[0x19F3A5980](v4, v2);
      }
      else
      {
        if (v4 >= *(void *)(v48 + 16)) {
          goto LABEL_55;
        }
        id v5 = *(id *)(v47 + 8 * v4);
      }
      id v52 = v5;
      BOOL v6 = __OFADD__(v4, 1);
      unint64_t v7 = v4 + 1;
      if (v6) {
        break;
      }
      unint64_t v46 = v7;
      id v8 = objc_msgSend(v5, sel_serviceType);
      uint64_t v9 = sub_19D457278();
      uint64_t v11 = v10;

      if (v9 == sub_19D457278() && v11 == v12)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v14 = sub_19D457638();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v14 & 1) == 0)
        {

          goto LABEL_5;
        }
      }
      uint64_t v54 = MEMORY[0x1E4FBC860];
      swift_bridgeObjectRetain();
      unint64_t v15 = 0;
      do
      {
        if (v51)
        {
          id v16 = (id)MEMORY[0x19F3A5980](v15, v2);
        }
        else
        {
          if (v15 >= *(void *)(v48 + 16)) {
            goto LABEL_53;
          }
          id v16 = *(id *)(v47 + 8 * v15);
        }
        uint64_t v17 = v16;
        BOOL v6 = __OFADD__(v15++, 1);
        if (v6)
        {
          __break(1u);
LABEL_53:
          __break(1u);
          goto LABEL_54;
        }
        id v18 = objc_msgSend(v52, sel_linkedServiceInstanceIDs);
        sub_19D1EA0D8(0, (unint64_t *)&qword_1E943E1B0);
        unint64_t v19 = sub_19D457388();

        if (v19 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v20 = sub_19D457568();
          swift_bridgeObjectRelease();
          if (!v20)
          {
LABEL_19:

            swift_bridgeObjectRelease();
            continue;
          }
        }
        else
        {
          uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (!v20) {
            goto LABEL_19;
          }
        }
        unint64_t v53 = v15;
        sub_19D1EA0D8(0, &qword_1E943E3A8);
        uint64_t v21 = 4;
        while (1)
        {
          if ((v19 & 0xC000000000000001) != 0) {
            id v22 = (id)MEMORY[0x19F3A5980](v21 - 4, v19);
          }
          else {
            id v22 = *(id *)(v19 + 8 * v21);
          }
          uint64_t v23 = v22;
          uint64_t v24 = v21 - 3;
          if (__OFADD__(v21 - 4, 1))
          {
            __break(1u);
            goto LABEL_51;
          }
          id v25 = objc_msgSend(v17, sel_instanceID);
          char v26 = sub_19D457428();

          if (v26) {
            break;
          }

          ++v21;
          if (v24 == v20)
          {

            swift_bridgeObjectRelease();
            unint64_t v2 = v49;
            uint64_t v3 = v50;
            unint64_t v15 = v53;
            goto LABEL_20;
          }
        }
        swift_bridgeObjectRelease();
        id v27 = v17;
        MEMORY[0x19F3A5820]();
        unint64_t v15 = v53;
        unint64_t v2 = v49;
        if (*(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_19D4573B8();
        }
        sub_19D4573C8();
        sub_19D4573A8();

        uint64_t v3 = v50;
LABEL_20:
        ;
      }
      while (v15 != v3);
      swift_bridgeObjectRelease();
      if (a2)
      {
        id v28 = objc_allocWithZone((Class)HMTelevisionProfile);
        sub_19D1EA0D8(0, &qword_1EB4F2078);
        id v29 = v52;
        swift_bridgeObjectRetain();
        uint64_t v30 = (void *)sub_19D457378();
        swift_bridgeObjectRelease();
        id v31 = objc_msgSend(v28, sel_initWithTelevisionService_linkedServices_, v29, v30);

        id v32 = v31;
        MEMORY[0x19F3A5820]();
        if (*(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_19D4573B8();
        }
        sub_19D4573C8();
        sub_19D4573A8();
      }
      id v33 = objc_allocWithZone((Class)HMTelevisionProfile);
      sub_19D1EA0D8(0, &qword_1EB4F2078);
      id v34 = v52;
      uint64_t v35 = (void *)sub_19D457378();
      swift_bridgeObjectRelease();
      id v36 = objc_msgSend(v33, sel_initWithTelevisionService_linkedServices_, v34, v35);

      id v37 = objc_msgSend(v36, sel_accessoryProfile);
      self;
      uint64_t v38 = swift_dynamicCastObjCClass();
      if (v38)
      {
        unint64_t v39 = (void *)v38;
        id v40 = objc_allocWithZone((Class)type metadata accessor for HMMediaSourceDisplayOrderProfile());
        id v41 = v37;
        unint64_t v42 = sub_19D1E5BD8(v39);

        uint64_t v43 = v42;
        MEMORY[0x19F3A5820]();
        if (*(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_19D4573B8();
        }
        sub_19D4573C8();
        sub_19D4573A8();

        uint64_t v3 = v50;
      }
      else
      {
      }
LABEL_5:
      unint64_t v4 = v46;
      if (v46 == v3)
      {
LABEL_51:
        swift_bridgeObjectRelease();
        return v55;
      }
    }
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x1E4FBC860];
}

uint64_t sub_19D1EA0D8(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_19D1EA114(uint64_t a1)
{
  uint64_t v2 = v1;
  int64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = MEMORY[0x1E4FBC860];
  if (!v3) {
    return v4;
  }
  uint64_t v29 = MEMORY[0x1E4FBC860];
  sub_19D1E53CC(0, v3, 0);
  uint64_t v4 = v29;
  uint64_t result = sub_19D1F224C(a1);
  uint64_t v8 = result;
  uint64_t v9 = 0;
  uint64_t v10 = a1 + 64;
  int64_t v24 = v3;
  int v25 = v7;
  uint64_t v26 = a1 + 64;
  while ((v8 & 0x8000000000000000) == 0 && v8 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v13 = (unint64_t)v8 >> 6;
    if ((*(void *)(v10 + 8 * ((unint64_t)v8 >> 6)) & (1 << v8)) == 0) {
      goto LABEL_23;
    }
    if (*(_DWORD *)(a1 + 36) != v7) {
      goto LABEL_24;
    }
    uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8 * v8);
    uint64_t v14 = swift_bridgeObjectRetain();
    uint64_t v15 = sub_19D1EA348(v14);
    uint64_t v27 = v2;
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v17 = *(void *)(v29 + 16);
    unint64_t v16 = *(void *)(v29 + 24);
    if (v17 >= v16 >> 1) {
      uint64_t result = sub_19D1E53CC(v16 > 1, v17 + 1, 1);
    }
    *(void *)(v29 + 16) = v17 + 1;
    uint64_t v18 = v29 + 16 * v17;
    *(void *)(v18 + 32) = v28;
    *(void *)(v18 + 40) = v15;
    int64_t v11 = 1 << *(unsigned char *)(a1 + 32);
    if (v8 >= v11) {
      goto LABEL_25;
    }
    uint64_t v10 = a1 + 64;
    uint64_t v19 = *(void *)(v26 + 8 * v13);
    if ((v19 & (1 << v8)) == 0) {
      goto LABEL_26;
    }
    int v7 = v25;
    if (*(_DWORD *)(a1 + 36) != v25) {
      goto LABEL_27;
    }
    unint64_t v20 = v19 & (-2 << (v8 & 0x3F));
    if (v20)
    {
      int64_t v11 = __clz(__rbit64(v20)) | v8 & 0xFFFFFFFFFFFFFFC0;
      uint64_t v2 = v27;
      int64_t v12 = v24;
    }
    else
    {
      unint64_t v21 = v13 + 1;
      unint64_t v22 = (unint64_t)(v11 + 63) >> 6;
      uint64_t v2 = v27;
      int64_t v12 = v24;
      if (v13 + 1 < v22)
      {
        unint64_t v23 = *(void *)(v26 + 8 * v21);
        if (v23)
        {
LABEL_20:
          int64_t v11 = __clz(__rbit64(v23)) + (v21 << 6);
        }
        else
        {
          while (v22 - 2 != v13)
          {
            unint64_t v23 = *(void *)(a1 + 80 + 8 * v13++);
            if (v23)
            {
              unint64_t v21 = v13 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v9;
    uint64_t v8 = v11;
    if (v9 == v12) {
      return v4;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_19D1EA348(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (!v1) {
    return v2;
  }
  uint64_t v25 = MEMORY[0x1E4FBC860];
  sub_19D1E53FC(0, v1, 0);
  uint64_t v2 = v25;
  uint64_t result = sub_19D1F224C(a1);
  uint64_t v6 = result;
  uint64_t v7 = 0;
  uint64_t v8 = a1 + 64;
  int64_t v21 = v1;
  int v22 = v5;
  uint64_t v23 = a1 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v11 = (unint64_t)v6 >> 6;
    if ((*(void *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0) {
      goto LABEL_23;
    }
    if (*(_DWORD *)(a1 + 36) != v5) {
      goto LABEL_24;
    }
    uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8 * v6);
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8 * v6);
    unint64_t v14 = *(void *)(v25 + 16);
    unint64_t v13 = *(void *)(v25 + 24);
    uint64_t result = swift_bridgeObjectRetain();
    if (v14 >= v13 >> 1) {
      uint64_t result = sub_19D1E53FC(v13 > 1, v14 + 1, 1);
    }
    *(void *)(v25 + 16) = v14 + 1;
    uint64_t v15 = v25 + 16 * v14;
    *(void *)(v15 + 32) = v24;
    *(void *)(v15 + 40) = v12;
    int64_t v9 = 1 << *(unsigned char *)(a1 + 32);
    if (v6 >= v9) {
      goto LABEL_25;
    }
    uint64_t v8 = a1 + 64;
    uint64_t v16 = *(void *)(v23 + 8 * v11);
    if ((v16 & (1 << v6)) == 0) {
      goto LABEL_26;
    }
    int v5 = v22;
    if (*(_DWORD *)(a1 + 36) != v22) {
      goto LABEL_27;
    }
    unint64_t v17 = v16 & (-2 << (v6 & 0x3F));
    if (v17)
    {
      int64_t v9 = __clz(__rbit64(v17)) | v6 & 0xFFFFFFFFFFFFFFC0;
      int64_t v10 = v21;
    }
    else
    {
      unint64_t v18 = v11 + 1;
      unint64_t v19 = (unint64_t)(v9 + 63) >> 6;
      int64_t v10 = v21;
      if (v11 + 1 < v19)
      {
        unint64_t v20 = *(void *)(v23 + 8 * v18);
        if (v20)
        {
LABEL_20:
          int64_t v9 = __clz(__rbit64(v20)) + (v18 << 6);
        }
        else
        {
          while (v19 - 2 != v11)
          {
            unint64_t v20 = *(void *)(a1 + 80 + 8 * v11++);
            if (v20)
            {
              unint64_t v18 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v7;
    uint64_t v6 = v9;
    if (v7 == v10) {
      return v2;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

unint64_t sub_19D1EA558(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E5C0);
  uint64_t v2 = sub_19D457598();
  int64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_19D1F4664(v6, (uint64_t)&v15, &qword_1E943E5C8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_19D1F05B4(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_19D1F46C8(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_19D1EA690()
{
  uint64_t v0 = sub_19D457208();
  __swift_allocate_value_buffer(v0, qword_1E943E3B0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E943E3B0);
  sub_19D457278();
  return sub_19D4571F8();
}

BOOL AccessoryMFiCapability.matchesCase(_:)(uint64_t a1)
{
  if (*(char *)(v1 + 8) >= 0) {
    return *(char *)(a1 + 8) >= 0;
  }
  else {
    return *(char *)(a1 + 8) < 0;
  }
}

uint64_t sub_19D1EA740(char a1)
{
  if (a1) {
    return 7567206;
  }
  else {
    return 7364963;
  }
}

uint64_t sub_19D1EA760(char *a1, char *a2)
{
  return sub_19D1EA8B8(*a1, *a2);
}

uint64_t sub_19D1EA76C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0x2D6465776F6C6C61;
  }
  else {
    unint64_t v3 = 0xD000000000000019;
  }
  if (v2) {
    unint64_t v4 = 0x800000019D47BB40;
  }
  else {
    unint64_t v4 = 0xEF6E6F736A2E6C6ELL;
  }
  if (a2) {
    unint64_t v5 = 0x2D6465776F6C6C61;
  }
  else {
    unint64_t v5 = 0xD000000000000019;
  }
  if (a2) {
    unint64_t v6 = 0xEF6E6F736A2E6C6ELL;
  }
  else {
    unint64_t v6 = 0x800000019D47BB40;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_19D457638();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_19D1EA824(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 1936744803;
  }
  else {
    uint64_t v3 = 6580592;
  }
  if (v2) {
    unint64_t v4 = 0xE300000000000000;
  }
  else {
    unint64_t v4 = 0xE400000000000000;
  }
  if (a2) {
    uint64_t v5 = 1936744803;
  }
  else {
    uint64_t v5 = 6580592;
  }
  if (a2) {
    unint64_t v6 = 0xE400000000000000;
  }
  else {
    unint64_t v6 = 0xE300000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_19D457638();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_19D1EA8B8(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 7567206;
  }
  else {
    uint64_t v2 = 7364963;
  }
  if (a2) {
    uint64_t v3 = 7567206;
  }
  else {
    uint64_t v3 = 7364963;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_19D457638();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_19D1EA928()
{
  return sub_19D1EA930();
}

uint64_t sub_19D1EA930()
{
  return sub_19D4576C8();
}

uint64_t sub_19D1EA998()
{
  return sub_19D4576C8();
}

uint64_t sub_19D1EAA0C()
{
  return sub_19D4576C8();
}

uint64_t sub_19D1EAAA0()
{
  return sub_19D1EAB80();
}

uint64_t sub_19D1EAAA8()
{
  sub_19D4572A8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_19D1EAB24()
{
  sub_19D4572A8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_19D1EAB80()
{
  sub_19D4572A8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_19D1EABC8()
{
  return sub_19D1EABD0();
}

uint64_t sub_19D1EABD0()
{
  return sub_19D4576C8();
}

uint64_t sub_19D1EAC34()
{
  return sub_19D4576C8();
}

uint64_t sub_19D1EACA4()
{
  return sub_19D4576C8();
}

uint64_t sub_19D1EAD34@<X0>(char *a1@<X8>)
{
  return sub_19D1EC510(a1);
}

uint64_t sub_19D1EAD40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_19D1EA740(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_19D1EAD6C()
{
  return sub_19D1EA740(*v0);
}

uint64_t sub_19D1EAD74@<X0>(char *a1@<X8>)
{
  return sub_19D1EC5AC(a1);
}

uint64_t sub_19D1EAD80()
{
  return 0;
}

void sub_19D1EAD8C(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_19D1EAD98(uint64_t a1)
{
  unint64_t v2 = sub_19D1F3EB4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_19D1EADD4(uint64_t a1)
{
  unint64_t v2 = sub_19D1F3EB4();

  return MEMORY[0x1F41862B0](a1, v2);
}

void sub_19D1EAE10(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  int v9 = a4 & 1;
  if (a1 == 1735877473 && a2 == 0xE400000000000000 || (sub_19D457638() & 1) != 0)
  {
    *(void *)a5 = a3;
    *(unsigned char *)(a5 + 8) = v9;
  }
  else if (a1 == 7106157 && a2 == 0xE300000000000000 || (sub_19D457638() & 1) != 0)
  {
    if (v9)
    {
      if (qword_1E943E190 != -1) {
        swift_once();
      }
      uint64_t v10 = sub_19D457208();
      __swift_project_value_buffer(v10, (uint64_t)qword_1E943E3B0);
      swift_bridgeObjectRetain_n();
      unint64_t v11 = sub_19D4571E8();
      os_log_type_t v12 = sub_19D457418();
      if (os_log_type_enabled(v11, v12))
      {
        BOOL v13 = (uint8_t *)swift_slowAlloc();
        uint64_t v14 = swift_slowAlloc();
        uint64_t v23 = v14;
        *(_DWORD *)BOOL v13 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_19D1EFF40(a1, a2, &v23);
        sub_19D457438();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_19D1A8000, v11, v12, "Missing firmwareStart for %s", v13, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x19F3A6C10](v14, -1, -1);
        MEMORY[0x19F3A6C10](v13, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v23 = 0;
      unint64_t v24 = 0xE000000000000000;
      sub_19D4574A8();
      swift_bridgeObjectRelease();
      uint64_t v23 = 0xD00000000000001ALL;
      unint64_t v24 = 0x800000019D47C2A0;
      swift_bridgeObjectRetain();
      sub_19D4572B8();
      swift_bridgeObjectRelease();
      uint64_t v20 = v23;
      unint64_t v21 = v24;
      sub_19D1F42D4();
      swift_allocError();
      *(void *)uint64_t v22 = v20;
      *(void *)(v22 + 8) = v21;
      *(unsigned char *)(v22 + 16) = 1;
      swift_willThrow();
    }
    else
    {
      *(void *)a5 = a3;
      *(unsigned char *)(a5 + 8) = 0x80;
    }
  }
  else
  {
    if (qword_1E943E190 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_19D457208();
    __swift_project_value_buffer(v15, (uint64_t)qword_1E943E3B0);
    swift_bridgeObjectRetain_n();
    uint64_t v16 = sub_19D4571E8();
    os_log_type_t v17 = sub_19D4573F8();
    if (os_log_type_enabled(v16, v17))
    {
      unint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)unint64_t v18 = 136315138;
      uint64_t v23 = v19;
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_19D1EFF40(a1, a2, &v23);
      sub_19D457438();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19D1A8000, v16, v17, "Ignoring unknown capability %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x19F3A6C10](v19, -1, -1);
      MEMORY[0x19F3A6C10](v18, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    *(void *)a5 = 0;
    *(unsigned char *)(a5 + 8) = -2;
  }
}

uint64_t sub_19D1EB270(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v13 = a5;
  v12[1] = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E550);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19D1F3EB4();
  sub_19D4576E8();
  char v15 = 0;
  sub_19D457608();
  if (!v5)
  {
    char v14 = 1;
    sub_19D4575F8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_19D1EB3F0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_19D1F3CA4(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
    *(unsigned char *)(a2 + 24) = v7 & 1;
  }
  return result;
}

uint64_t sub_19D1EB428(void *a1)
{
  return sub_19D1EB270(a1, *(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(unsigned __int8 *)(v1 + 24));
}

uint64_t AccessoryMFiCapabilitiesList.accessoriesByVendorID.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AccessoryMFiCapabilitiesList.accessoriesByVendorID.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*AccessoryMFiCapabilitiesList.accessoriesByVendorID.modify())()
{
  return nullsub_1;
}

HomeKit::AccessoryMFiCapabilitiesList __swiftcall AccessoryMFiCapabilitiesList.init()()
{
  uint64_t v1 = v0;
  result.accessoriesByVendorID._rawValue = (void *)sub_19D1F2474(MEMORY[0x1E4FBC860]);
  v1->accessoriesByVendorID._rawValue = result.accessoriesByVendorID._rawValue;
  return result;
}

uint64_t AccessoryMFiCapabilitiesList.init(capabilities:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 40);
  swift_bridgeObjectRetain();
  uint64_t result = sub_19D1F2574(a1);
  *a2 = v4;
  return result;
}

uint64_t sub_19D1EB528@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_19D4575B8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_19D1EB57C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_19D1F3E9C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_19D1EB5A8@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_19D4575B8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_19D1EB600(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_19D1EB60C(uint64_t a1)
{
  unint64_t v2 = sub_19D1F25E8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_19D1EB648(uint64_t a1)
{
  unint64_t v2 = sub_19D1F25E8();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t AccessoryMFiCapabilitiesList.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E3C8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19D1F25E8();
  sub_19D4576D8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  unint64_t v58 = a2;
  unint64_t v59 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E3D8);
  sub_19D1F2A20(&qword_1E943E3E0, &qword_1E943E3D8, (void (*)(void))sub_19D1F2684);
  sub_19D4575E8();
  id v67 = 0;
  uint64_t v56 = v8;
  uint64_t v57 = v5;
  uint64_t v10 = v68[0];
  int64_t v11 = *(void *)(v68[0] + 16);
  if (v11)
  {
    uint64_t v72 = MEMORY[0x1E4FBC860];
    sub_19D1E536C(0, v11, 0);
    uint64_t v12 = 0;
    uint64_t v13 = v72;
    v55[1] = v10;
    uint64_t v61 = v6;
    uint64_t v62 = v10 + 32;
    int64_t v60 = v11;
    while (1)
    {
      uint64_t v64 = v12;
      uint64_t v65 = v13;
      char v14 = (uint64_t *)(v62 + 16 * v12);
      uint64_t v15 = v14[1];
      uint64_t v63 = *v14;
      int64_t v16 = *(void *)(v15 + 16);
      uint64_t v66 = v15;
      if (v16)
      {
        v68[0] = MEMORY[0x1E4FBC860];
        swift_bridgeObjectRetain_n();
        sub_19D1E539C(0, v16, 0);
        uint64_t v17 = v68[0];
        unint64_t v18 = (uint64_t *)(v15 + 40);
        do
        {
          uint64_t v20 = *(v18 - 1);
          uint64_t v19 = *v18;
          v68[0] = v17;
          unint64_t v22 = *(void *)(v17 + 16);
          unint64_t v21 = *(void *)(v17 + 24);
          swift_bridgeObjectRetain();
          if (v22 >= v21 >> 1)
          {
            sub_19D1E539C(v21 > 1, v22 + 1, 1);
            uint64_t v17 = v68[0];
          }
          *(void *)(v17 + 16) = v22 + 1;
          uint64_t v23 = v17 + 16 * v22;
          *(void *)(v23 + 32) = v20;
          *(void *)(v23 + 40) = v19;
          v18 += 2;
          --v16;
        }
        while (v16);
        swift_bridgeObjectRelease();
        if (!*(void *)(v17 + 16))
        {
LABEL_27:
          unint64_t v24 = (void *)MEMORY[0x1E4FBC868];
          unint64_t v71 = (void *)MEMORY[0x1E4FBC868];
          swift_bridgeObjectRetain();
          goto LABEL_28;
        }
      }
      else
      {
        swift_bridgeObjectRetain();
        uint64_t v17 = MEMORY[0x1E4FBC860];
        if (!*(void *)(MEMORY[0x1E4FBC860] + 16)) {
          goto LABEL_27;
        }
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E3F0);
      unint64_t v24 = (void *)sub_19D457598();
      uint64_t v25 = *(void *)(v17 + 16);
      unint64_t v71 = v24;
      swift_bridgeObjectRetain();
      if (v25)
      {
        unint64_t v26 = 0;
        uint64_t v27 = (uint64_t *)(v17 + 40);
        while (v26 < *(void *)(v17 + 16))
        {
          uint64_t v28 = *(v27 - 1);
          uint64_t v29 = *v27;
          swift_bridgeObjectRetain();
          if (!v29) {
            goto LABEL_28;
          }
          v70[0] = v29;
          v70[1] = v28;
          unint64_t v31 = sub_19D1F062C(v28);
          uint64_t v32 = v24[2];
          BOOL v33 = (v30 & 1) == 0;
          uint64_t v34 = v32 + v33;
          if (__OFADD__(v32, v33)) {
            goto LABEL_39;
          }
          char v35 = v30;
          if (v24[3] < v34)
          {
            sub_19D1F0BA8(v34, 1, &qword_1E943E3F0);
            unint64_t v24 = v71;
            unint64_t v36 = sub_19D1F062C(v28);
            if ((v35 & 1) != (v37 & 1)) {
              goto LABEL_41;
            }
            unint64_t v31 = v36;
          }
          if (v35)
          {
            id v69 = *(id *)(v24[7] + 8 * v31);
            swift_bridgeObjectRetain();
            id v38 = v67;
            sub_19D1EBD30((uint64_t *)&v69, v70, v68);
            id v67 = v38;
            if (v38) {
              goto LABEL_42;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v39 = v24[7];
            uint64_t v40 = v68[0];
            swift_bridgeObjectRelease();
            *(void *)(v39 + 8 * v31) = v40;
          }
          else
          {
            v24[(v31 >> 6) + 8] |= 1 << v31;
            uint64_t v41 = 8 * v31;
            *(void *)(v24[6] + v41) = v28;
            *(void *)(v24[7] + v41) = v29;
            uint64_t v42 = v24[2];
            BOOL v43 = __OFADD__(v42, 1);
            uint64_t v44 = v42 + 1;
            if (v43) {
              goto LABEL_40;
            }
            v24[2] = v44;
          }
          ++v26;
          v27 += 2;
          if (v25 == v26) {
            goto LABEL_28;
          }
        }
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        sub_19D457658();
        __break(1u);
LABEL_42:
        swift_bridgeObjectRelease();
        id v69 = v67;
        id v54 = v67;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E2A0);
        if (swift_dynamicCast())
        {
          v68[0] = 0;
          v68[1] = 0xE000000000000000;
          sub_19D4574A8();
          sub_19D4572B8();
          sub_19D457538();
          sub_19D4572B8();
          sub_19D457558();
          __break(1u);
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_release();
        __break(1u);
        goto LABEL_45;
      }
LABEL_28:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      uint64_t v13 = v65;
      uint64_t v72 = v65;
      unint64_t v46 = *(void *)(v65 + 16);
      unint64_t v45 = *(void *)(v65 + 24);
      if (v46 >= v45 >> 1)
      {
        sub_19D1E536C(v45 > 1, v46 + 1, 1);
        uint64_t v13 = v72;
      }
      uint64_t v47 = v63;
      uint64_t v12 = v64 + 1;
      *(void *)(v13 + 16) = v46 + 1;
      uint64_t v48 = v13 + 16 * v46;
      *(void *)(v48 + 32) = v47;
      *(void *)(v48 + 40) = v24;
      uint64_t v6 = v61;
      if (v12 == v60)
      {
        swift_bridgeObjectRelease();
        goto LABEL_33;
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v13 = MEMORY[0x1E4FBC860];
LABEL_33:
  unint64_t v49 = v58;
  if (*(void *)(v13 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E3F8);
    uint64_t v50 = sub_19D457598();
  }
  else
  {
    uint64_t v50 = MEMORY[0x1E4FBC868];
  }
  uint64_t v51 = (uint64_t)v59;
  v68[0] = v50;
  id v52 = v67;
  sub_19D1F17B0(v13, 1, (uint64_t)v68);
  if (v52)
  {
LABEL_45:
    uint64_t result = swift_release();
    __break(1u);
  }
  else
  {
    uint64_t v53 = v68[0];
    (*(void (**)(char *, uint64_t))(v6 + 8))(v56, v57);
    *unint64_t v49 = v53;
    return __swift_destroy_boxed_opaque_existential_1Tm(v51);
  }
  return result;
}

uint64_t sub_19D1EBD30@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  if (qword_1E943E190 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_19D457208();
  __swift_project_value_buffer(v8, (uint64_t)qword_1E943E3B0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_19D4571E8();
  os_log_type_t v10 = sub_19D457418();
  if (os_log_type_enabled(v9, v10))
  {
    int64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v22 = v21;
    *(_DWORD *)int64_t v11 = 136315138;
    buf = v11;
    uint64_t v24 = v6;
    swift_bridgeObjectRetain();
    uint64_t v12 = swift_bridgeObjectRetain();
    sub_19D1F1F60(v12);
    uint64_t v13 = MEMORY[0x19F3A5850](v6, &type metadata for AccessoryMFiCapability);
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    uint64_t v24 = sub_19D1EFF40(v13, v15, &v22);
    sub_19D457438();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_19D1A8000, v9, v10, "Unexpected duplicate products, capabilities: %s", buf, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F3A6C10](v21, -1, -1);
    MEMORY[0x19F3A6C10](buf, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v24 = v7;
  uint64_t v16 = *(void *)(v6 + 16);
  if (v16)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v17 = (unsigned char *)(v6 + 40);
    while (1)
    {
      char v18 = *v17;
      uint64_t v22 = *((void *)v17 - 1);
      char v23 = v18;
      sub_19D1EF810((uint64_t)&v24, &v22);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      v17 += 16;
      if (!--v16)
      {
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v7 = v24;
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
  }
  else
  {
    uint64_t result = swift_bridgeObjectRetain();
LABEL_12:
    *a3 = v7;
  }
  return result;
}

uint64_t sub_19D1EBFE8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  if (qword_1E943E190 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_19D457208();
  __swift_project_value_buffer(v6, (uint64_t)qword_1E943E3B0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_19D4571E8();
  os_log_type_t v8 = sub_19D457418();
  if (os_log_type_enabled(v7, v8))
  {
    os_log_type_t v20 = v8;
    uint64_t v21 = a3;
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v22 = v19;
    *(_DWORD *)uint64_t v9 = 136315138;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E5B0);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_19D47AB80;
    *(void *)(v10 + 32) = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    int64_t v11 = (void *)v10;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v11 = sub_19D1EFD08(0, 2, 1, (void *)v10);
    }
    unint64_t v13 = v11[2];
    unint64_t v12 = v11[3];
    if (v13 >= v12 >> 1) {
      int64_t v11 = sub_19D1EFD08((void *)(v12 > 1), v13 + 1, 1, v11);
    }
    v11[2] = v13 + 1;
    v11[v13 + 4] = v5;
    swift_bridgeObjectRelease();
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E5B8);
    uint64_t v15 = MEMORY[0x19F3A5850](v11, v14);
    unint64_t v17 = v16;
    swift_bridgeObjectRelease();
    sub_19D1EFF40(v15, v17, &v22);
    sub_19D457438();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_19D1A8000, v7, v20, "Unexpected duplicate vendors, pids: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F3A6C10](v19, -1, -1);
    MEMORY[0x19F3A6C10](v9, -1, -1);

    a3 = v21;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t result = sub_19D1EFA5C(v4, v5);
  *a3 = result;
  return result;
}

uint64_t AccessoryMFiCapabilitiesList.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E400);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19D1F25E8();
  sub_19D4576E8();
  uint64_t v6 = swift_bridgeObjectRetain();
  uint64_t v7 = sub_19D1EA114(v6);
  swift_bridgeObjectRelease();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E3D8);
  sub_19D1F2A20(&qword_1E943E408, &qword_1E943E3D8, (void (*)(void))sub_19D1F26D8);
  sub_19D457618();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_19D1EC488(char a1)
{
  if (a1) {
    return 1936744803;
  }
  else {
    return 6580592;
  }
}

uint64_t sub_19D1EC4B0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return AccessoryMFiCapabilitiesList.init(from:)(a1, a2);
}

uint64_t sub_19D1EC4C8(void *a1)
{
  return AccessoryMFiCapabilitiesList.encode(to:)(a1);
}

uint64_t sub_19D1EC4E0(char *a1, char *a2)
{
  return sub_19D1EA824(*a1, *a2);
}

uint64_t sub_19D1EC4EC()
{
  return sub_19D1EA998();
}

uint64_t sub_19D1EC4F4()
{
  return sub_19D1EAB24();
}

uint64_t sub_19D1EC4FC()
{
  return sub_19D1EAC34();
}

uint64_t sub_19D1EC504@<X0>(char *a1@<X8>)
{
  return sub_19D1EC510(a1);
}

uint64_t sub_19D1EC510@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_19D4575B8();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_19D1EC56C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_19D1EC488(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_19D1EC598()
{
  return sub_19D1EC488(*v0);
}

uint64_t sub_19D1EC5A0@<X0>(char *a1@<X8>)
{
  return sub_19D1EC5AC(a1);
}

uint64_t sub_19D1EC5AC@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_19D4575B8();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_19D1EC60C(uint64_t a1)
{
  unint64_t v2 = sub_19D1F272C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_19D1EC648(uint64_t a1)
{
  unint64_t v2 = sub_19D1F272C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t AccessoryMFiCapabilitiesList.Product.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E418);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  os_log_type_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19D1F272C();
  sub_19D4576D8();
  if (!v2)
  {
    char v36 = 0;
    sub_19D1F2780();
    sub_19D4575E8();
    uint64_t v9 = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E430);
    char v36 = 1;
    sub_19D1F2A20(&qword_1E943E438, &qword_1E943E430, (void (*)(void))sub_19D1F27D4);
    sub_19D4575E8();
    unint64_t v31 = a2;
    uint64_t v11 = v34;
    uint64_t v12 = *(void *)(v34 + 16);
    if (v12)
    {
      uint64_t v29 = v5;
      uint64_t v30 = v6;
      swift_bridgeObjectRetain();
      uint64_t v28 = v11;
      unint64_t v13 = (char *)(v11 + 56);
      BOOL v33 = (void *)MEMORY[0x1E4FBC860];
      do
      {
        uint64_t v17 = v9;
        char v18 = *v13;
        unint64_t v19 = *((void *)v13 - 2);
        uint64_t v20 = *((void *)v13 - 1);
        uint64_t v21 = *((void *)v13 - 3);
        swift_bridgeObjectRetain();
        sub_19D1EAE10(v21, v19, v20, v18, (uint64_t)&v34);
        swift_bridgeObjectRelease();
        unsigned __int8 v22 = v35;
        if (v35 <= 0xFDu)
        {
          char v23 = v33;
          uint64_t v32 = v34;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            char v23 = sub_19D1EFBF8(0, v23[2] + 1, 1, v23);
          }
          unint64_t v25 = v23[2];
          unint64_t v24 = v23[3];
          BOOL v33 = v23;
          if (v25 >= v24 >> 1) {
            BOOL v33 = sub_19D1EFBF8((void *)(v24 > 1), v25 + 1, 1, v33);
          }
          uint64_t v15 = v32;
          uint64_t v14 = v33;
          v33[2] = v25 + 1;
          unint64_t v16 = &v14[2 * v25];
          v16[4] = v15;
          *((unsigned char *)v16 + 40) = v22;
        }
        uint64_t v9 = v17;
        v13 += 32;
        --v12;
      }
      while (v12);
      swift_bridgeObjectRelease();
      uint64_t v5 = v29;
      uint64_t v6 = v30;
      unint64_t v26 = v33;
    }
    else
    {
      unint64_t v26 = (void *)MEMORY[0x1E4FBC860];
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    swift_bridgeObjectRelease();
    uint64_t v27 = v31;
    void *v31 = v9;
    v27[1] = v26;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t AccessoryMFiCapabilitiesList.Product.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E448);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  uint64_t v8 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19D1F272C();
  sub_19D4576E8();
  uint64_t v28 = v7;
  char v27 = 0;
  sub_19D1F2828();
  uint64_t v9 = v26;
  sub_19D457618();
  if (v9) {
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  unint64_t v26 = v6;
  int64_t v11 = *(void *)(v8 + 16);
  uint64_t v12 = MEMORY[0x1E4FBC860];
  if (v11)
  {
    v23[1] = 0;
    uint64_t v24 = v4;
    uint64_t v25 = v3;
    uint64_t v28 = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRetain();
    sub_19D1E542C(0, v11, 0);
    v23[0] = v8;
    unint64_t v13 = (unsigned __int8 *)(v8 + 40);
    uint64_t v12 = v28;
    do
    {
      uint64_t v14 = *((void *)v13 - 1);
      int v15 = *v13;
      if ((v15 & 0x80u) != 0) {
        uint64_t v16 = 7106157;
      }
      else {
        uint64_t v16 = 1735877473;
      }
      if ((v15 & 0x80u) != 0) {
        unint64_t v17 = 0xE300000000000000;
      }
      else {
        unint64_t v17 = 0xE400000000000000;
      }
      uint64_t v28 = v12;
      unint64_t v19 = *(void *)(v12 + 16);
      unint64_t v18 = *(void *)(v12 + 24);
      if (v19 >= v18 >> 1)
      {
        uint64_t v21 = v14;
        sub_19D1E542C(v18 > 1, v19 + 1, 1);
        uint64_t v14 = v21;
        uint64_t v12 = v28;
      }
      v13 += 16;
      *(void *)(v12 + 16) = v19 + 1;
      uint64_t v20 = v12 + 32 * v19;
      *(void *)(v20 + 32) = v16;
      *(void *)(v20 + 40) = v17;
      *(void *)(v20 + 48) = v14;
      *(unsigned char *)(v20 + 56) = (v15 & 0xFFFFFF81) == 1;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
    uint64_t v4 = v24;
    uint64_t v3 = v25;
  }
  uint64_t v28 = v12;
  char v27 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E430);
  sub_19D1F2A20(&qword_1E943E458, &qword_1E943E430, (void (*)(void))sub_19D1F287C);
  unsigned __int8 v22 = v26;
  sub_19D457618();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v22, v3);
}

uint64_t sub_19D1ECD04(char a1)
{
  if (a1) {
    return 0x73746375646F7270;
  }
  else {
    return 6580598;
  }
}

uint64_t sub_19D1ECD34@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return AccessoryMFiCapabilitiesList.Product.init(from:)(a1, a2);
}

uint64_t sub_19D1ECD4C(void *a1)
{
  return AccessoryMFiCapabilitiesList.Product.encode(to:)(a1);
}

BOOL sub_19D1ECD64(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_19D1ECD7C()
{
  return sub_19D4576C8();
}

uint64_t sub_19D1ECDC4()
{
  return sub_19D4576B8();
}

uint64_t sub_19D1ECDF0()
{
  return sub_19D4576C8();
}

uint64_t sub_19D1ECE34()
{
  return sub_19D1ECD04(*v0);
}

uint64_t sub_19D1ECE3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_19D1F4100(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_19D1ECE64(uint64_t a1)
{
  unint64_t v2 = sub_19D1F28D0();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_19D1ECEA0(uint64_t a1)
{
  unint64_t v2 = sub_19D1F28D0();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t AccessoryMFiCapabilitiesList.Vendor.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E468);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v10 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19D1F28D0();
  sub_19D4576E8();
  uint64_t v12 = v8;
  char v11 = 0;
  sub_19D1F2924();
  sub_19D457618();
  if (!v2)
  {
    uint64_t v12 = v10;
    char v11 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E480);
    sub_19D1F2A20(&qword_1E943E488, &qword_1E943E480, (void (*)(void))sub_19D1F2978);
    sub_19D457618();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t AccessoryMFiCapabilitiesList.Vendor.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E498);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19D1F28D0();
  sub_19D4576D8();
  if (!v2)
  {
    char v13 = 0;
    sub_19D1F29CC();
    sub_19D4575E8();
    uint64_t v9 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E480);
    char v13 = 1;
    sub_19D1F2A20(&qword_1E943E4A8, &qword_1E943E480, (void (*)(void))sub_19D1F2A8C);
    sub_19D4575E8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v10 = v14;
    *a2 = v9;
    a2[1] = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t sub_19D1ED2CC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return AccessoryMFiCapabilitiesList.Vendor.init(from:)(a1, a2);
}

uint64_t sub_19D1ED2E4(void *a1)
{
  return AccessoryMFiCapabilitiesList.Vendor.encode(to:)(a1);
}

uint64_t sub_19D1ED2FC()
{
  id v1 = objc_msgSend(*v0, sel_attributes);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_19D457228();

  return v3;
}

uint64_t sub_19D1ED36C@<X0>(uint64_t a1@<X8>)
{
  id v3 = objc_msgSend(*v1, sel_getLocalFileUrl);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_19D457158();

    uint64_t v5 = sub_19D457168();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
    uint64_t v7 = v5;
    uint64_t v8 = a1;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = sub_19D457168();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v7 = v10;
    uint64_t v8 = a1;
    uint64_t v9 = 1;
  }

  return v6(v8, v9, 1, v7);
}

uint64_t sub_19D1ED434(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_19D457568();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x1E4FBC860];
  if (!v2) {
    return v3;
  }
  uint64_t v17 = MEMORY[0x1E4FBC860];
  uint64_t result = sub_19D1E544C(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v3 = v17;
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v5 = 0;
      do
      {
        uint64_t v6 = MEMORY[0x19F3A5980](v5, a1);
        uint64_t v17 = v3;
        unint64_t v8 = *(void *)(v3 + 16);
        unint64_t v7 = *(void *)(v3 + 24);
        if (v8 >= v7 >> 1)
        {
          sub_19D1E544C(v7 > 1, v8 + 1, 1);
          uint64_t v3 = v17;
        }
        ++v5;
        uint64_t v15 = sub_19D1EA0D8(0, &qword_1E943E568);
        uint64_t v16 = &off_1EEE9A7B0;
        *(void *)&long long v14 = v6;
        *(void *)(v3 + 16) = v8 + 1;
        sub_19D1F4284(&v14, v3 + 40 * v8 + 32);
      }
      while (v2 != v5);
    }
    else
    {
      uint64_t v9 = (void **)(a1 + 32);
      do
      {
        uint64_t v10 = *v9;
        uint64_t v17 = v3;
        unint64_t v12 = *(void *)(v3 + 16);
        unint64_t v11 = *(void *)(v3 + 24);
        id v13 = v10;
        if (v12 >= v11 >> 1)
        {
          sub_19D1E544C(v11 > 1, v12 + 1, 1);
          uint64_t v3 = v17;
        }
        uint64_t v15 = sub_19D1EA0D8(0, &qword_1E943E568);
        uint64_t v16 = &off_1EEE9A7B0;
        *(void *)&long long v14 = v13;
        *(void *)(v3 + 16) = v12 + 1;
        sub_19D1F4284(&v14, v3 + 40 * v12 + 32);
        ++v9;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_19D1ED628(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return MEMORY[0x1F41881F8]();
}

id sub_19D1ED64C()
{
  id v1 = objc_msgSend(*v0, sel_results);
  if (v1)
  {
    sub_19D1EA0D8(0, &qword_1E943E568);
    unint64_t v2 = sub_19D457388();

    id v1 = (id)sub_19D1ED434(v2);
    swift_bridgeObjectRelease();
  }
  return v1;
}

uint64_t HMAccessoryMatterCapabilities.contentVersion.getter()
{
  return *(void *)(v0 + 48);
}

HomeKit::HMAccessoryMatterCapabilities::AssetFilename_optional __swiftcall HMAccessoryMatterCapabilities.AssetFilename.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  uint64_t v3 = sub_19D4575B8();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  char *v2 = v5;
  return result;
}

uint64_t HMAccessoryMatterCapabilities.AssetFilename.rawValue.getter()
{
  if (*v0) {
    return 0x2D6465776F6C6C61;
  }
  else {
    return 0xD000000000000019;
  }
}

uint64_t sub_19D1ED784(char *a1, char *a2)
{
  return sub_19D1EA76C(*a1, *a2);
}

uint64_t sub_19D1ED790()
{
  return sub_19D1EAA0C();
}

uint64_t sub_19D1ED798()
{
  return sub_19D1EAAA8();
}

uint64_t sub_19D1ED7A0()
{
  return sub_19D1EACA4();
}

HomeKit::HMAccessoryMatterCapabilities::AssetFilename_optional sub_19D1ED7A8(Swift::String *a1)
{
  return HMAccessoryMatterCapabilities.AssetFilename.init(rawValue:)(*a1);
}

uint64_t sub_19D1ED7B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HMAccessoryMatterCapabilities.AssetFilename.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t HMAccessoryMatterCapabilities.init(type:)(uint64_t a1, unsigned char *a2)
{
  *(void *)(v2 + 56) = a1;
  *(unsigned char *)(v2 + 81) = *a2;
  return MEMORY[0x1F4188298](sub_19D1ED804, 0, 0);
}

uint64_t sub_19D1ED804()
{
  *(unsigned char *)(v0 + 80) = *(unsigned char *)(v0 + 81);
  *(void *)(v0 + 40) = &type metadata for DefaultMobileAssetDataSource;
  *(void *)(v0 + 48) = &off_1EEE9ADE8;
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  void *v1 = v0;
  v1[1] = sub_19D1ED8C4;
  uint64_t v2 = *(void *)(v0 + 56);
  return sub_19D1EDA10(v2, (unsigned char *)(v0 + 80), v0 + 16);
}

uint64_t sub_19D1ED8C4()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_19D1ED9F8, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_19D1ED9F8()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19D1EDA10(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  *(void *)(v3 + 272) = a1;
  *(void *)(v3 + 280) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E570);
  *(void *)(v3 + 288) = swift_task_alloc();
  uint64_t v5 = sub_19D457168();
  *(void *)(v3 + 296) = v5;
  *(void *)(v3 + 304) = *(void *)(v5 - 8);
  *(void *)(v3 + 312) = swift_task_alloc();
  *(void *)(v3 + 320) = swift_task_alloc();
  *(unsigned char *)(v3 + 336) = *a2;
  return MEMORY[0x1F4188298](sub_19D1EDB1C, 0, 0);
}

uint64_t sub_19D1EDB1C()
{
  sub_19D1F4498(v0[35], v0[34]);
  id v1 = objc_allocWithZone(MEMORY[0x1E4F77FB8]);
  uint64_t v2 = (void *)sub_19D457268();
  id v3 = objc_msgSend(v1, sel_initWithType_, v2);

  if (v3)
  {
    v0[18] = sub_19D1EA0D8(0, &qword_1E943E578);
    v0[19] = &off_1EEE9A7C8;
    v0[15] = v3;
    objc_msgSend(v3, sel_returnTypes_, 1);
    v0[2] = v0;
    v0[7] = v0 + 30;
    v0[3] = sub_19D1EDCAC;
    uint64_t v5 = swift_continuation_init();
    v0[20] = MEMORY[0x1E4F143A8];
    v0[21] = 0x40000000;
    v0[22] = sub_19D1ED628;
    v0[23] = &block_descriptor_0;
    v0[24] = v5;
    objc_msgSend(v3, sel_queryMetaData_, v0 + 20);
    uint64_t v4 = v0 + 2;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x1F41881E8](v4);
}

uint64_t sub_19D1EDCAC()
{
  *(void *)(*(void *)v0 + 328) = *(void *)(*(void *)v0 + 240);
  return MEMORY[0x1F4188298](sub_19D1EDDA8, 0, 0);
}

uint64_t sub_19D1EDDA8()
{
  sub_19D1EE748(*(void *)(v0 + 328), (void *)(v0 + 120), v0 + 80);
  uint64_t v1 = *(void *)(v0 + 296);
  uint64_t v2 = *(void *)(v0 + 304);
  uint64_t v3 = *(void *)(v0 + 288);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 120);
  sub_19D1F4284((long long *)(v0 + 80), v0 + 200);
  uint64_t v4 = *(void *)(v0 + 224);
  uint64_t v5 = *(void *)(v0 + 232);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 200), v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_19D1E8F8C(*(void *)(v0 + 288), &qword_1E943E570);
    sub_19D1F42D4();
    uint64_t v6 = (void *)swift_allocError();
    *(void *)uint64_t v7 = 0;
    *(void *)(v7 + 8) = 0;
    *(unsigned char *)(v7 + 16) = 2;
    swift_willThrow();
    if (qword_1E943E190 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_19D457208();
    __swift_project_value_buffer(v12, (uint64_t)qword_1E943E3B0);
    id v13 = v6;
    id v14 = v6;
    uint64_t v15 = sub_19D4571E8();
    os_log_type_t v16 = sub_19D457418();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      unint64_t v18 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 138543362;
      id v19 = v6;
      uint64_t v20 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 264) = v20;
      sub_19D457438();
      *unint64_t v18 = v20;

      _os_log_impl(&dword_19D1A8000, v15, v16, "Unable to parse capabilities: %{public}@", v17, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E370);
      swift_arrayDestroy();
      MEMORY[0x19F3A6C10](v18, -1, -1);
      MEMORY[0x19F3A6C10](v17, -1, -1);
    }
    else
    {
    }
    uint64_t v21 = *(void *)(v0 + 280);

    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1Tm(v21);
    uint64_t v22 = *(void *)(v0 + 272);
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 200);
    __swift_destroy_boxed_opaque_existential_1Tm(v22);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    char v23 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 304) + 32))(*(void *)(v0 + 320), *(void *)(v0 + 288), *(void *)(v0 + 296));
    sub_19D457148();
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_19D457178();
    unint64_t v10 = v9;
    uint64_t v32 = (void *)(v0 + 200);
    unint64_t v11 = *(void (**)(void, void))(*(void *)(v0 + 304) + 8);
    v11(*(void *)(v0 + 312), *(void *)(v0 + 296));
    sub_19D457128();
    swift_allocObject();
    sub_19D457118();
    sub_19D1F2AE0();
    sub_19D457108();
    swift_release();
    uint64_t v25 = *(void *)(v0 + 272);
    uint64_t v26 = *(void *)(v0 + 280);
    v11(*(void *)(v0 + 320), *(void *)(v0 + 296));
    sub_19D1F2B34(v8, v10);
    *(void *)(v25 + 40) = *(void *)(v0 + 256);
    uint64_t v27 = *(void *)(v0 + 224);
    uint64_t v28 = *(void *)(v0 + 232);
    __swift_project_boxed_opaque_existential_1(v32, v27);
    uint64_t v29 = sub_19D1EF444(v27, v28);
    LOBYTE(v28) = v30;
    __swift_destroy_boxed_opaque_existential_1Tm(v26);
    if (v28) {
      uint64_t v31 = 0;
    }
    else {
      uint64_t v31 = v29;
    }
    *(void *)(v25 + 48) = v31;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v32);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    char v23 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v23();
}

uint64_t HMAccessoryMatterCapabilities.init(from:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  a3[3] = &type metadata for DefaultMobileAssetDataSource;
  a3[4] = &off_1EEE9ADE8;
  sub_19D457128();
  swift_allocObject();
  sub_19D457118();
  sub_19D1F2AE0();
  sub_19D457108();
  swift_release();
  uint64_t result = sub_19D1F2B34(a1, a2);
  if (v3) {
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a3);
  }
  a3[5] = v8;
  a3[6] = 0;
  return result;
}

uint64_t HMAccessoryMatterCapabilities.isCapabilityAllowed(_:vendorID:productID:)(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v4 = *(void *)(v3 + 40);
  if (*(void *)(v4 + 16))
  {
    uint64_t v5 = *a1;
    char v6 = *((unsigned char *)a1 + 8);
    uint64_t v7 = *a3;
    unint64_t v8 = sub_19D1F062C(*a2);
    if (v9)
    {
      uint64_t v10 = *(void *)(*(void *)(v4 + 56) + 8 * v8);
      if (*(void *)(v10 + 16))
      {
        unint64_t v11 = sub_19D1F062C(v7);
        if (v12)
        {
          uint64_t v13 = *(void *)(*(void *)(v10 + 56) + 8 * v11);
          uint64_t v14 = *(void *)(v13 + 16);
          if (v14)
          {
            uint64_t v15 = (unsigned char *)(v13 + 40);
            uint64_t result = 1;
            do
            {
              uint64_t v17 = *((void *)v15 - 1);
              if (v6 < 0)
              {
                if ((*v15 & 0x80) != 0 && v5 >= v17) {
                  return 1;
                }
              }
              else if ((*v15 & 0x80) == 0)
              {
                if (v6) {
                  return result;
                }
                if ((*v15 & 1) != 0 || v5 >= v17) {
                  return result;
                }
              }
              v15 += 16;
              --v14;
            }
            while (v14);
          }
        }
      }
    }
  }
  return 0;
}

uint64_t HMAccessoryMatterCapabilities.debugDescription.getter()
{
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E4D0);
  sub_19D1F2B8C();
  uint64_t v0 = sub_19D457238();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_19D1EE6D4()
{
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E4D0);
  sub_19D1F2B8C();
  uint64_t v0 = sub_19D457238();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_19D1EE748@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  if (a1)
  {
    if (qword_1E943E190 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_19D457208();
    __swift_project_value_buffer(v5, (uint64_t)qword_1E943E3B0);
    char v6 = sub_19D4571E8();
    os_log_type_t v7 = sub_19D457418();
    if (!os_log_type_enabled(v6, v7)) {
      goto LABEL_33;
    }
    unint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v8 = 134217984;
    *(void *)&long long v49 = a1;
    sub_19D457438();
    char v9 = "Unable to query metadata: %ld";
    uint64_t v10 = v6;
    os_log_type_t v11 = v7;
    char v12 = v8;
    uint32_t v13 = 12;
    goto LABEL_32;
  }
  uint64_t v14 = v3;
  uint64_t v16 = a2[3];
  uint64_t v17 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v16);
  uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 24))(v16, v17);
  if (!v18)
  {
    if (qword_1E943E190 == -1)
    {
LABEL_24:
      uint64_t v32 = sub_19D457208();
      __swift_project_value_buffer(v32, (uint64_t)qword_1E943E3B0);
      char v6 = sub_19D4571E8();
      os_log_type_t v33 = sub_19D457418();
      if (!os_log_type_enabled(v6, v33))
      {
LABEL_33:

        sub_19D1F42D4();
        swift_allocError();
        *(void *)uint64_t v35 = 0;
        *(void *)(v35 + 8) = 0;
        *(unsigned char *)(v35 + 16) = 2;
        return swift_willThrow();
      }
      unint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v8 = 0;
      char v9 = "No results for metadata";
      goto LABEL_31;
    }
LABEL_45:
    swift_once();
    goto LABEL_24;
  }
  uint64_t v52 = a3;
  uint64_t v19 = *(void *)(v18 + 16);
  if (v19)
  {
    uint64_t v20 = v18 + 32;
    swift_bridgeObjectRetain();
    uint64_t v21 = (void *)MEMORY[0x1E4FBC860];
    do
    {
      sub_19D1F4498(v20, (uint64_t)&v44);
      sub_19D1EED9C(&v44, (uint64_t)&v49);
      if (v14)
      {
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v44);
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        __break(1u);
        return result;
      }
      uint64_t v14 = 0;
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v44);
      if ((void)v51)
      {
        long long v46 = v49;
        long long v47 = v50;
        long long v48 = v51;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v21 = sub_19D1EFE18(0, v21[2] + 1, 1, v21);
        }
        unint64_t v23 = v21[2];
        unint64_t v22 = v21[3];
        if (v23 >= v22 >> 1) {
          uint64_t v21 = sub_19D1EFE18((void *)(v22 > 1), v23 + 1, 1, v21);
        }
        v21[2] = v23 + 1;
        uint64_t v24 = &v21[6 * v23];
        long long v25 = v46;
        long long v26 = v48;
        v24[3] = v47;
        v24[4] = v26;
        v24[2] = v25;
      }
      else
      {
        sub_19D1E8F8C((uint64_t)&v49, &qword_1E943E588);
      }
      v20 += 40;
      --v19;
    }
    while (v19);
    swift_bridgeObjectRelease_n();
    unint64_t v27 = v21[2];
    if (!v27) {
      goto LABEL_27;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v21 = (void *)MEMORY[0x1E4FBC860];
    unint64_t v27 = *(void *)(MEMORY[0x1E4FBC860] + 16);
    if (!v27)
    {
LABEL_27:
      swift_bridgeObjectRelease();
      if (qword_1E943E190 != -1) {
        swift_once();
      }
      uint64_t v34 = sub_19D457208();
      __swift_project_value_buffer(v34, (uint64_t)qword_1E943E3B0);
      char v6 = sub_19D4571E8();
      os_log_type_t v33 = sub_19D457418();
      if (!os_log_type_enabled(v6, v33)) {
        goto LABEL_33;
      }
      unint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v8 = 0;
      char v9 = "Empty results for metadata";
LABEL_31:
      uint64_t v10 = v6;
      os_log_type_t v11 = v33;
      char v12 = v8;
      uint32_t v13 = 2;
LABEL_32:
      _os_log_impl(&dword_19D1A8000, v10, v11, v9, v12, v13);
      MEMORY[0x19F3A6C10](v8, -1, -1);
      goto LABEL_33;
    }
  }
  if (qword_1E943E190 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_19D457208();
  __swift_project_value_buffer(v28, (uint64_t)qword_1E943E3B0);
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_19D4571E8();
  os_log_type_t v30 = sub_19D457408();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 134217984;
    *(void *)&long long v49 = v21[2];
    sub_19D457438();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_19D1A8000, v29, v30, "Filtering %ld results", v31, 0xCu);
    MEMORY[0x19F3A6C10](v31, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  if (v21[2] < v27)
  {
    __break(1u);
    goto LABEL_45;
  }
  sub_19D1F4664((uint64_t)(v21 + 4), (uint64_t)&v46, &qword_1E943E590);
  uint64_t v44 = v46;
  sub_19D1F4284((long long *)((char *)&v46 + 8), (uint64_t)&v45);
  sub_19D1F4664((uint64_t)&v44, (uint64_t)&v41, &qword_1E943E590);
  unint64_t v37 = v27 - 1;
  if (v37)
  {
    swift_bridgeObjectRetain();
    uint64_t v38 = (uint64_t)(v21 + 10);
    do
    {
      sub_19D1F4664(v38, (uint64_t)&v49, &qword_1E943E590);
      if ((uint64_t)v41 >= (uint64_t)v49) {
        uint64_t v39 = &v41;
      }
      else {
        uint64_t v39 = &v49;
      }
      sub_19D1F4664((uint64_t)v39, (uint64_t)v40, &qword_1E943E590);
      sub_19D1E8F8C((uint64_t)&v49, &qword_1E943E590);
      sub_19D1E8F8C((uint64_t)&v41, &qword_1E943E590);
      long long v41 = v40[0];
      long long v42 = v40[1];
      long long v43 = v40[2];
      v38 += 48;
      --v37;
    }
    while (v37);
    swift_bridgeObjectRelease();
  }
  long long v49 = v41;
  long long v50 = v42;
  long long v51 = v43;
  sub_19D1E8F8C((uint64_t)&v44, &qword_1E943E590);
  swift_bridgeObjectRelease();
  sub_19D1F4284((long long *)((char *)&v49 + 8), (uint64_t)&v46 + 8);
  return sub_19D1F4284((long long *)((char *)&v46 + 8), v52);
}

void sub_19D1EED9C(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  uint64_t v6 = sub_19D1EF444(v4, v5);
  if (v7)
  {
    if (qword_1E943E190 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_19D457208();
    __swift_project_value_buffer(v14, (uint64_t)qword_1E943E3B0);
    sub_19D1F4498((uint64_t)a1, (uint64_t)v43);
    uint64_t v15 = sub_19D4571E8();
    os_log_type_t v16 = sub_19D4573F8();
    if (!os_log_type_enabled(v15, v16)) {
      goto LABEL_19;
    }
    uint64_t v41 = a2;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v45 = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    uint64_t v40 = v17 + 4;
    uint64_t v19 = __swift_project_boxed_opaque_existential_1(v43, v44);
    MEMORY[0x1F4188790](v19);
    (*(void (**)(char *))(v21 + 16))((char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v22 = sub_19D457288();
    a2 = v41;
    uint64_t v42 = sub_19D1EFF40(v22, v23, &v45);
    sub_19D457438();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v43);
    uint64_t v24 = "Ignoring asset due to missing content version: %s";
  }
  else
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1[3];
    uint64_t v10 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v9);
    uint64_t v11 = sub_19D1EF444(v9, v10);
    if ((v12 & 1) == 0)
    {
      uint64_t v13 = v11;
      if (v11 == 2)
      {
        *(void *)a2 = v8;
        sub_19D1F4498((uint64_t)a1, a2 + 8);
        return;
      }
      if (qword_1E943E190 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_19D457208();
      __swift_project_value_buffer(v32, (uint64_t)qword_1E943E3B0);
      sub_19D1F4498((uint64_t)a1, (uint64_t)v43);
      uint64_t v15 = sub_19D4571E8();
      os_log_type_t v33 = sub_19D4573F8();
      if (os_log_type_enabled(v15, v33))
      {
        uint64_t v17 = swift_slowAlloc();
        uint64_t v41 = swift_slowAlloc();
        uint64_t v42 = v13;
        uint64_t v45 = v41;
        *(_DWORD *)uint64_t v17 = 134218242;
        sub_19D457438();
        *(_WORD *)(v17 + 12) = 2080;
        uint64_t v40 = v17 + 14;
        uint64_t v34 = __swift_project_boxed_opaque_existential_1(v43, v44);
        MEMORY[0x1F4188790](v34);
        (*(void (**)(char *))(v36 + 16))((char *)&v40 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
        uint64_t v37 = sub_19D457288();
        uint64_t v42 = sub_19D1EFF40(v37, v38, &v45);
        sub_19D457438();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v43);
        _os_log_impl(&dword_19D1A8000, v15, v33, "Ignoring asset due to compatibility version: %ld: %s", (uint8_t *)v17, 0x16u);
        uint64_t v39 = v41;
        swift_arrayDestroy();
        uint64_t v31 = v39;
        goto LABEL_14;
      }
LABEL_19:
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v43);
      goto LABEL_20;
    }
    if (qword_1E943E190 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_19D457208();
    __swift_project_value_buffer(v25, (uint64_t)qword_1E943E3B0);
    sub_19D1F4498((uint64_t)a1, (uint64_t)v43);
    uint64_t v15 = sub_19D4571E8();
    os_log_type_t v16 = sub_19D4573F8();
    if (!os_log_type_enabled(v15, v16)) {
      goto LABEL_19;
    }
    uint64_t v41 = a2;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v45 = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    uint64_t v40 = v17 + 4;
    long long v26 = __swift_project_boxed_opaque_existential_1(v43, v44);
    MEMORY[0x1F4188790](v26);
    (*(void (**)(char *))(v28 + 16))((char *)&v40 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v29 = sub_19D457288();
    uint64_t v42 = sub_19D1EFF40(v29, v30, &v45);
    sub_19D457438();
    a2 = v41;
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v43);
    uint64_t v24 = "Ignoring asset due to missing compatibility version: %s";
  }
  _os_log_impl(&dword_19D1A8000, v15, v16, v24, (uint8_t *)v17, 0xCu);
  swift_arrayDestroy();
  uint64_t v31 = v18;
LABEL_14:
  MEMORY[0x19F3A6C10](v31, -1, -1);
  MEMORY[0x19F3A6C10](v17, -1, -1);
LABEL_20:

  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
}

uint64_t sub_19D1EF444(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (*(uint64_t (**)(void))(a2 + 8))();
  if (!v2)
  {
    long long v9 = 0u;
    long long v10 = 0u;
LABEL_12:
    sub_19D1E8F8C((uint64_t)&v9, &qword_1E943E330);
    return 0;
  }
  uint64_t v3 = v2;
  *(void *)&long long v9 = sub_19D457278();
  *((void *)&v9 + 1) = v4;
  sub_19D457498();
  if (*(void *)(v3 + 16) && (unint64_t v5 = sub_19D1F0694((uint64_t)v8), (v6 & 1) != 0))
  {
    sub_19D1F437C(*(void *)(v3 + 56) + 32 * v5, (uint64_t)&v9);
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_19D1F4328((uint64_t)v8);
  if (!*((void *)&v10 + 1)) {
    goto LABEL_12;
  }
  if (swift_dynamicCast()) {
    return v8[0];
  }
  else {
    return 0;
  }
}

HomeKit::HMAccessoryMatterCapabilities::VendorID_optional __swiftcall HMAccessoryMatterCapabilities.VendorID.init(rawValue:)(Swift::Int rawValue)
{
  *(void *)uint64_t v1 = rawValue;
  *(unsigned char *)(v1 + 8) = 0;
  result.value.rawValue = rawValue;
  return result;
}

HomeKit::HMAccessoryMatterCapabilities::VendorID __swiftcall HMAccessoryMatterCapabilities.VendorID.init(_:)(HomeKit::HMAccessoryMatterCapabilities::VendorID result)
{
  v1->rawValue = result.rawValue;
  return result;
}

uint64_t HMAccessoryMatterCapabilities.VendorID.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t HMAccessoryMatterCapabilities.VendorID.rawValue.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*HMAccessoryMatterCapabilities.VendorID.rawValue.modify())()
{
  return nullsub_1;
}

void *sub_19D1EF598@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_19D1EF5A8(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_19D1EF5B8()
{
  return sub_19D4576B8();
}

uint64_t sub_19D1EF5E8()
{
  return sub_19D457358();
}

uint64_t sub_19D1EF648()
{
  return sub_19D457348();
}

BOOL sub_19D1EF698(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t HMAccessoryMatterCapabilities.ProductID.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t (*HMAccessoryMatterCapabilities.ProductID.rawValue.modify())()
{
  return nullsub_1;
}

uint64_t sub_19D1EF6D4()
{
  return sub_19D4576C8();
}

uint64_t sub_19D1EF71C()
{
  return sub_19D4576C8();
}

uint64_t sub_19D1EF760()
{
  return sub_19D457358();
}

uint64_t sub_19D1EF7C0()
{
  return sub_19D457348();
}

void sub_19D1EF810(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  int v4 = *((char *)a2 + 8);
  unint64_t v5 = *(void **)a1;
  uint64_t v6 = *(void *)(*(void *)a1 + 16);
  if (v6)
  {
    char v7 = (char *)(v5 + 5);
    uint64_t v8 = *(void *)(*(void *)a1 + 16);
    while (1)
    {
      BOOL v9 = v4 >= 0;
      int v10 = *v7;
      v7 += 16;
      if (v10 < 0) {
        BOOL v9 = v4 < 0;
      }
      if (v9) {
        break;
      }
      if (!--v8) {
        goto LABEL_7;
      }
    }
    if (qword_1E943E190 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_19D457208();
    __swift_project_value_buffer(v14, (uint64_t)qword_1E943E3B0);
    uint64_t v15 = sub_19D4571E8();
    os_log_type_t v16 = sub_19D457418();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v21 = v18;
      *(_DWORD *)uint64_t v17 = 136315138;
      uint64_t v19 = sub_19D457288();
      sub_19D1EFF40(v19, v20, &v21);
      sub_19D457438();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_19D1A8000, v15, v16, "Dropping capability %s because of a duplicate entry", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x19F3A6C10](v18, -1, -1);
      MEMORY[0x19F3A6C10](v17, -1, -1);
    }
  }
  else
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v5 = sub_19D1EFBF8(0, v6 + 1, 1, v5);
    }
    unint64_t v12 = v5[2];
    unint64_t v11 = v5[3];
    if (v12 >= v11 >> 1) {
      unint64_t v5 = sub_19D1EFBF8((void *)(v11 > 1), v12 + 1, 1, v5);
    }
    v5[2] = v12 + 1;
    uint64_t v13 = &v5[2 * v12];
    v13[4] = v3;
    *((unsigned char *)v13 + 40) = v4;
    *(void *)a1 = v5;
  }
}

uint64_t sub_19D1EFA5C(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_19D1F1AD8(a1, (uint64_t)sub_19D1F20AC, 0, isUniquelyReferenced_nonNull_native, &v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

void *sub_19D1EFAE8(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E5D0);
      int v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      int v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_19D1F2380(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_19D1EFBF8(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E5A8);
      int v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      int v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_19D1F3F08(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_19D1EFD08(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E5B0);
      int v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      int v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_19D1F3FF4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_19D1EFE18(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E598);
      int v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4]) {
          memmove(v12, a4 + 4, 48 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      int v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v12 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_19D1F44FC(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_19D1EFF40(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_19D1F0014(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_19D1F437C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_19D1F437C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_19D1F0014(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_19D457448();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_19D1F01D0(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_19D4574D8();
  if (!v8)
  {
    sub_19D457548();
    __break(1u);
LABEL_17:
    uint64_t result = sub_19D4575A8();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_19D1F01D0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_19D1F0268(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_19D1F03E0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_19D1F03E0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_19D1F0268(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_19D1F515C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_19D4574B8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_19D457548();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_19D4572C8();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_19D4575A8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_19D457548();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

uint64_t sub_19D1F03E0(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E5A0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_19D4575A8();
  __break(1u);
  return result;
}

unint64_t sub_19D1F0530(uint64_t a1)
{
  sub_19D4571D8();
  sub_19D1E9838(&qword_1E943E390);
  uint64_t v2 = sub_19D457248();

  return sub_19D1F0E80(a1, v2);
}

unint64_t sub_19D1F05B4(uint64_t a1, uint64_t a2)
{
  sub_19D4576A8();
  sub_19D4572A8();
  uint64_t v4 = sub_19D4576C8();

  return sub_19D1F102C(a1, a2, v4);
}

unint64_t sub_19D1F062C(uint64_t a1)
{
  sub_19D4576A8();
  sub_19D4576B8();
  uint64_t v2 = sub_19D4576C8();
  return sub_19D1F1110(a1, v2);
}

unint64_t sub_19D1F0694(uint64_t a1)
{
  uint64_t v2 = sub_19D457478();

  return sub_19D1F11AC(a1, v2);
}

uint64_t sub_19D1F06D8(uint64_t a1, int a2)
{
  unint64_t v3 = v2;
  uint64_t v53 = sub_19D4571A8();
  uint64_t v5 = *(void *)(v53 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v52 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_19D4571D8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E5D8);
  int v50 = a2;
  uint64_t v12 = sub_19D457588();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_39;
  }
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  uint64_t v44 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  uint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v45 = v5 + 16;
  long long v46 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v48 = v5;
  uint64_t v49 = v8;
  uint64_t v18 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  long long v51 = (uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32);
  uint64_t v19 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v21 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v17)
    {
      unint64_t v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v24 = v23 | (v21 << 6);
      goto LABEL_20;
    }
    if (__OFADD__(v21++, 1)) {
      goto LABEL_41;
    }
    if (v21 >= v43) {
      break;
    }
    long long v26 = v44;
    unint64_t v27 = v44[v21];
    if (!v27)
    {
      int64_t v28 = v21 + 1;
      if (v21 + 1 >= v43)
      {
LABEL_32:
        swift_release();
        unint64_t v3 = v42;
        if ((v50 & 1) == 0) {
          goto LABEL_39;
        }
        goto LABEL_35;
      }
      unint64_t v27 = v44[v28];
      if (!v27)
      {
        while (1)
        {
          int64_t v21 = v28 + 1;
          if (__OFADD__(v28, 1)) {
            break;
          }
          if (v21 >= v43) {
            goto LABEL_32;
          }
          unint64_t v27 = v44[v21];
          ++v28;
          if (v27) {
            goto LABEL_19;
          }
        }
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return result;
      }
      ++v21;
    }
LABEL_19:
    unint64_t v17 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v21 << 6);
LABEL_20:
    uint64_t v29 = *(void *)(v49 + 72);
    unint64_t v30 = *(void *)(v11 + 48) + v29 * v24;
    if (v50)
    {
      (*v18)(v10, v30, v7);
      uint64_t v31 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v48 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v48 + 32))(v52, v31 + v32 * v24, v53);
    }
    else
    {
      (*v46)(v10, v30, v7);
      uint64_t v33 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v48 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v48 + 16))(v52, v33 + v32 * v24, v53);
    }
    sub_19D1E9838(&qword_1E943E390);
    uint64_t result = sub_19D457248();
    uint64_t v34 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v35 = result & ~v34;
    unint64_t v36 = v35 >> 6;
    if (((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v34) >> 6;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_40;
        }
        BOOL v39 = v36 == v38;
        if (v36 == v38) {
          unint64_t v36 = 0;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v19 + 8 * v36);
      }
      while (v40 == -1);
      unint64_t v22 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(void *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*v18)((char *)(*(void *)(v13 + 48) + v29 * v22), (unint64_t)v10, v7);
    uint64_t result = (*v51)(*(void *)(v13 + 56) + v32 * v22, v52, v53);
    ++*(void *)(v13 + 16);
  }
  swift_release();
  unint64_t v3 = v42;
  long long v26 = v44;
  if ((v50 & 1) == 0) {
    goto LABEL_39;
  }
LABEL_35:
  uint64_t v41 = 1 << *(unsigned char *)(v11 + 32);
  if (v41 >= 64) {
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v26 = -1 << v41;
  }
  *(void *)(v11 + 16) = 0;
LABEL_39:
  uint64_t result = swift_release();
  *unint64_t v3 = v13;
  return result;
}

uint64_t sub_19D1F0BA8(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t result = sub_19D457588();
  uint64_t v8 = result;
  if (*(void *)(v6 + 16))
  {
    int64_t v9 = 0;
    uint64_t v33 = (void *)(v6 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v6 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v6 + 64);
    int64_t v32 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v9 << 6);
      }
      else
      {
        int64_t v21 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v6 + 64;
        if (v21 >= v32) {
          goto LABEL_33;
        }
        unint64_t v22 = v33[v21];
        ++v9;
        if (!v22)
        {
          int64_t v9 = v21 + 1;
          if (v21 + 1 >= v32) {
            goto LABEL_33;
          }
          unint64_t v22 = v33[v9];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v32)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v4 = v3;
                goto LABEL_40;
              }
              uint64_t v31 = 1 << *(unsigned char *)(v6 + 32);
              if (v31 >= 64) {
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v33 = -1 << v31;
              }
              uint64_t v4 = v3;
              *(void *)(v6 + 16) = 0;
              break;
            }
            unint64_t v22 = v33[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v9 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_42;
                }
                if (v9 >= v32) {
                  goto LABEL_33;
                }
                unint64_t v22 = v33[v9];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v9 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v9 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v6 + 48) + v28);
      uint64_t v30 = *(void *)(*(void *)(v6 + 56) + v28);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_19D4576A8();
      sub_19D4576B8();
      uint64_t result = sub_19D4576C8();
      uint64_t v14 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v8 + 48) + v18) = v29;
      *(void *)(*(void *)(v8 + 56) + v18) = v30;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v4 = v8;
  return result;
}

unint64_t sub_19D1F0E80(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_19D4571D8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_19D1E9838(&qword_1E943E5E0);
      char v15 = sub_19D457258();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

unint64_t sub_19D1F102C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_19D457638() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_19D457638() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_19D1F1110(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_19D1F11AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_19D1F43D8(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x19F3A5940](v9, a1);
      sub_19D1F4328((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

char *sub_19D1F1274()
{
  uint64_t v1 = v0;
  uint64_t v39 = sub_19D4571A8();
  uint64_t v43 = *(void *)(v39 - 8);
  MEMORY[0x1F4188790]();
  unint64_t v38 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_19D4571D8();
  uint64_t v42 = *(void *)(v37 - 8);
  MEMORY[0x1F4188790]();
  unint64_t v36 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E5D8);
  uint64_t v4 = *v0;
  uint64_t v5 = sub_19D457578();
  uint64_t v6 = v5;
  if (!*(void *)(v4 + 16))
  {
    unint64_t result = (char *)swift_release();
LABEL_25:
    uint64_t *v1 = v6;
    return result;
  }
  unint64_t result = (char *)(v5 + 64);
  uint64_t v8 = (char *)(v4 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  uint64_t v30 = v1;
  uint64_t v31 = v4 + 64;
  if (v6 != v4 || result >= &v8[8 * v9]) {
    unint64_t result = (char *)memmove(result, v8, 8 * v9);
  }
  int64_t v10 = 0;
  uint64_t v11 = *(void *)(v4 + 16);
  uint64_t v40 = v4;
  uint64_t v41 = v6;
  *(void *)(v6 + 16) = v11;
  uint64_t v12 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v4 + 64);
  int64_t v44 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v15 = v43;
  uint64_t v35 = v42 + 16;
  uint64_t v16 = v42;
  uint64_t v33 = v42 + 32;
  uint64_t v34 = v43 + 16;
  uint64_t v32 = v43 + 32;
  uint64_t v17 = v36;
  uint64_t v18 = v38;
  uint64_t v19 = v41;
  while (1)
  {
    if (v14)
    {
      uint64_t v45 = (v14 - 1) & v14;
      unint64_t v20 = __clz(__rbit64(v14)) | (v10 << 6);
      uint64_t v21 = v40;
      goto LABEL_9;
    }
    BOOL v27 = __OFADD__(v10++, 1);
    uint64_t v21 = v40;
    if (v27) {
      goto LABEL_27;
    }
    if (v10 >= v44)
    {
LABEL_24:
      unint64_t result = (char *)swift_release();
      uint64_t v1 = v30;
      uint64_t v6 = v41;
      goto LABEL_25;
    }
    unint64_t v28 = *(void *)(v31 + 8 * v10);
    if (!v28) {
      break;
    }
LABEL_21:
    uint64_t v45 = (v28 - 1) & v28;
    unint64_t v20 = __clz(__rbit64(v28)) + (v10 << 6);
LABEL_9:
    unint64_t v22 = *(void *)(v16 + 72) * v20;
    uint64_t v23 = v37;
    (*(void (**)(char *, unint64_t, uint64_t))(v16 + 16))(v17, *(void *)(v21 + 48) + v22, v37);
    unint64_t v24 = *(void *)(v15 + 72) * v20;
    unint64_t v25 = *(void *)(v21 + 56) + v24;
    uint64_t v26 = v39;
    (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v18, v25, v39);
    (*(void (**)(unint64_t, char *, uint64_t))(v16 + 32))(*(void *)(v19 + 48) + v22, v17, v23);
    unint64_t result = (char *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v15 + 32))(*(void *)(v19 + 56) + v24, v18, v26);
    unint64_t v14 = v45;
  }
  int64_t v29 = v10 + 1;
  if (v10 + 1 >= v44) {
    goto LABEL_24;
  }
  unint64_t v28 = *(void *)(v31 + 8 * v29);
  if (v28)
  {
    ++v10;
    goto LABEL_21;
  }
  uint64_t v6 = v41;
  while (1)
  {
    int64_t v10 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v10 >= v44)
    {
      unint64_t result = (char *)swift_release();
      uint64_t v1 = v30;
      goto LABEL_25;
    }
    unint64_t v28 = *(void *)(v31 + 8 * v10);
    ++v29;
    if (v28) {
      goto LABEL_21;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

void *sub_19D1F1614(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_19D457578();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  unint64_t result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    unint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v14) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v7 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    uint64_t v18 = *(void *)(*(void *)(v3 + 56) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = *(void *)(*(void *)(v3 + 48) + v17);
    *(void *)(*(void *)(v5 + 56) + v17) = v18;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v14) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v7 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_19D1F17B0(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v28 = v5;
  if (!v5)
  {
LABEL_18:
    swift_bridgeObjectRelease_n();
    return;
  }
  unint64_t v6 = 0;
  uint64_t v7 = (uint64_t *)(a1 + 40);
  while (1)
  {
    if (v6 >= *(void *)(a1 + 16))
    {
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      sub_19D457658();
      __break(1u);
      goto LABEL_26;
    }
    uint64_t v9 = *(v7 - 1);
    uint64_t v8 = *v7;
    swift_bridgeObjectRetain();
    if (!v8) {
      goto LABEL_18;
    }
    v33[2] = v9;
    v33[0] = v8;
    int64_t v10 = *(void **)a3;
    unint64_t v12 = sub_19D1F062C(v9);
    uint64_t v13 = v10[2];
    BOOL v14 = (v11 & 1) == 0;
    uint64_t v15 = v13 + v14;
    if (__OFADD__(v13, v14)) {
      goto LABEL_23;
    }
    char v16 = v11;
    if (v10[3] < v15) {
      break;
    }
    if (a2)
    {
      if (v11) {
        goto LABEL_13;
      }
    }
    else
    {
      sub_19D1F1614(&qword_1E943E3F8);
      if (v16) {
        goto LABEL_13;
      }
    }
LABEL_16:
    unint64_t v22 = *(void **)a3;
    *(void *)(*(void *)a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    uint64_t v23 = 8 * v12;
    *(void *)(v22[6] + v23) = v9;
    *(void *)(v22[7] + v23) = v8;
    uint64_t v24 = v22[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_24;
    }
    v22[2] = v26;
LABEL_3:
    ++v6;
    v7 += 2;
    a2 = 1;
    if (v28 == v6) {
      goto LABEL_18;
    }
  }
  sub_19D1F0BA8(v15, a2 & 1, &qword_1E943E3F8);
  unint64_t v17 = sub_19D1F062C(v9);
  if ((v16 & 1) != (v18 & 1)) {
    goto LABEL_25;
  }
  unint64_t v12 = v17;
  if ((v16 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_13:
  int64_t v19 = *(void **)a3;
  id v32 = *(id *)(*(void *)(*(void *)a3 + 56) + 8 * v12);
  swift_bridgeObjectRetain();
  sub_19D1EBFE8((uint64_t *)&v32, v33, v31);
  if (!v29)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v20 = v19[7];
    uint64_t v21 = v31[0];
    swift_bridgeObjectRelease();
    *(void *)(v20 + 8 * v12) = v21;
    goto LABEL_3;
  }
  swift_bridgeObjectRelease();
  id v32 = v29;
  id v27 = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E2A0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
LABEL_26:
  v31[0] = 0;
  v31[1] = 0xE000000000000000;
  sub_19D4574A8();
  sub_19D4572B8();
  sub_19D457538();
  sub_19D4572B8();
  sub_19D457558();
  __break(1u);
}

uint64_t sub_19D1F1AD8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = ~v7;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = -v7;
  uint64_t v63 = a1;
  uint64_t v64 = a1 + 64;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  else {
    uint64_t v11 = -1;
  }
  uint64_t v65 = v8;
  uint64_t v66 = 0;
  uint64_t v67 = v11 & v9;
  uint64_t v68 = a2;
  uint64_t v69 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_19D1F20B8(&v61);
  uint64_t v12 = v62;
  if (v62)
  {
    uint64_t v13 = &OBJC_IVAR___HMSetupAccessoryPayload__supportsBTLE;
    uint64_t v56 = a5;
    while (1)
    {
      uint64_t v18 = v61;
      int64_t v19 = (void *)*a5;
      unint64_t v21 = sub_19D1F062C(v61);
      uint64_t v22 = v19[2];
      BOOL v23 = (v20 & 1) == 0;
      uint64_t v24 = v22 + v23;
      if (__OFADD__(v22, v23)) {
        break;
      }
      char v25 = v20;
      if (v19[3] >= v24)
      {
        if ((a4 & 1) == 0) {
          sub_19D1F1614(&qword_1E943E3F0);
        }
      }
      else
      {
        sub_19D1F0BA8(v24, a4 & 1, &qword_1E943E3F0);
        unint64_t v26 = sub_19D1F062C(v18);
        if ((v25 & 1) != (v27 & 1)) {
          goto LABEL_41;
        }
        unint64_t v21 = v26;
      }
      uint64_t v15 = (void *)*a5;
      uint64_t v16 = 8 * v21;
      if (v25)
      {
        BOOL v14 = *(void **)(v15[7] + 8 * v21);
        uint64_t v28 = *(void *)(v12 + 16);
        if (v28)
        {
          uint64_t v57 = 8 * v21;
          unint64_t v58 = (void *)*a5;
          uint64_t v29 = v12 + 32;
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          uint64_t v30 = v14;
          uint64_t v31 = 0;
          uint64_t v59 = v12 + 32;
          uint64_t v60 = v28;
          do
          {
            id v32 = (uint64_t *)(v29 + 16 * v31);
            uint64_t v33 = *v32;
            int v34 = *((char *)v32 + 8);
            uint64_t v35 = v30[2];
            if (v35)
            {
              uint64_t v36 = 5;
              uint64_t v37 = v30[2];
              while (1)
              {
                BOOL v38 = v34 >= 0;
                if (SLOBYTE(v30[v36]) < 0) {
                  BOOL v38 = v34 < 0;
                }
                if (v38) {
                  break;
                }
                v36 += 2;
                if (!--v37) {
                  goto LABEL_26;
                }
              }
              if (*((void *)v13 + 50) != -1) {
                swift_once();
              }
              uint64_t v42 = sub_19D457208();
              __swift_project_value_buffer(v42, (uint64_t)qword_1E943E3B0);
              uint64_t v43 = sub_19D4571E8();
              os_log_type_t v44 = sub_19D457418();
              if (os_log_type_enabled(v43, v44))
              {
                uint64_t v45 = swift_slowAlloc();
                long long v46 = v13;
                uint64_t v47 = swift_slowAlloc();
                uint64_t v70 = v47;
                *(_DWORD *)uint64_t v45 = 136315138;
                uint64_t v48 = sub_19D457288();
                *(void *)(v45 + 4) = sub_19D1EFF40(v48, v49, &v70);
                swift_bridgeObjectRelease();
                _os_log_impl(&dword_19D1A8000, v43, v44, "Dropping capability %s because of a duplicate entry", (uint8_t *)v45, 0xCu);
                swift_arrayDestroy();
                uint64_t v50 = v47;
                uint64_t v13 = v46;
                uint64_t v28 = v60;
                MEMORY[0x19F3A6C10](v50, -1, -1);
                uint64_t v51 = v45;
                uint64_t v29 = v59;
                MEMORY[0x19F3A6C10](v51, -1, -1);
              }
            }
            else
            {
LABEL_26:
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v30 = sub_19D1EFBF8(0, v35 + 1, 1, v30);
              }
              unint64_t v40 = v30[2];
              unint64_t v39 = v30[3];
              if (v40 >= v39 >> 1) {
                uint64_t v30 = sub_19D1EFBF8((void *)(v39 > 1), v40 + 1, 1, v30);
              }
              v30[2] = v40 + 1;
              uint64_t v41 = &v30[2 * v40];
              v41[4] = v33;
              *((unsigned char *)v41 + 40) = v34;
            }
            ++v31;
          }
          while (v31 != v28);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          BOOL v14 = v30;
          a5 = v56;
          uint64_t v16 = v57;
          uint64_t v15 = v58;
        }
        else
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
        }
        uint64_t v17 = v15[7];
        swift_bridgeObjectRelease();
        *(void *)(v17 + v16) = v14;
      }
      else
      {
        v15[(v21 >> 6) + 8] |= 1 << v21;
        *(void *)(v15[6] + 8 * v21) = v18;
        *(void *)(v15[7] + 8 * v21) = v12;
        uint64_t v52 = v15[2];
        BOOL v53 = __OFADD__(v52, 1);
        uint64_t v54 = v52 + 1;
        if (v53) {
          goto LABEL_40;
        }
        _OWORD v15[2] = v54;
      }
      sub_19D1F20B8(&v61);
      uint64_t v12 = v62;
      a4 = 1;
      if (!v62) {
        goto LABEL_38;
      }
    }
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    uint64_t result = sub_19D457658();
    __break(1u);
  }
  else
  {
LABEL_38:
    swift_release();
    swift_bridgeObjectRelease();
    sub_19D1F465C();
    return swift_release();
  }
  return result;
}

uint64_t sub_19D1F1F60(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_19D1EFBF8(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v10 = &v3[2 * v9 + 4];
  if (a1 + 32 < (unint64_t)&v10[2 * v8] && (unint64_t)v10 < a1 + 32 + 16 * v8) {
    goto LABEL_24;
  }
  memcpy(v10, (const void *)(a1 + 32), 16 * v8);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v3[2];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_19D4575A8();
  __break(1u);
  return result;
}

uint64_t sub_19D1F20AC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  *a2 = v2;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_19D1F20B8@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  int64_t v5 = v1[3];
  unint64_t v4 = v1[4];
  int64_t v6 = v5;
  if (!v4)
  {
    int64_t v14 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      return result;
    }
    int64_t v15 = (unint64_t)(v1[2] + 64) >> 6;
    if (v14 < v15)
    {
      uint64_t v16 = v1[1];
      unint64_t v17 = *(void *)(v16 + 8 * v14);
      if (v17)
      {
LABEL_9:
        uint64_t v7 = (v17 - 1) & v17;
        unint64_t v8 = __clz(__rbit64(v17)) + (v14 << 6);
        int64_t v6 = v14;
        goto LABEL_3;
      }
      int64_t v18 = v5 + 2;
      int64_t v6 = v5 + 1;
      if (v5 + 2 < v15)
      {
        unint64_t v17 = *(void *)(v16 + 8 * v18);
        if (v17)
        {
LABEL_12:
          int64_t v14 = v18;
          goto LABEL_9;
        }
        int64_t v6 = v5 + 2;
        if (v5 + 3 < v15)
        {
          unint64_t v17 = *(void *)(v16 + 8 * (v5 + 3));
          if (v17)
          {
            int64_t v14 = v5 + 3;
            goto LABEL_9;
          }
          int64_t v18 = v5 + 4;
          int64_t v6 = v5 + 3;
          if (v5 + 4 < v15)
          {
            unint64_t v17 = *(void *)(v16 + 8 * v18);
            if (v17) {
              goto LABEL_12;
            }
            int64_t v14 = v5 + 5;
            int64_t v6 = v5 + 4;
            if (v5 + 5 < v15)
            {
              unint64_t v17 = *(void *)(v16 + 8 * v14);
              if (v17) {
                goto LABEL_9;
              }
              int64_t v6 = v15 - 1;
              int64_t v19 = v5 + 6;
              while (v15 != v19)
              {
                unint64_t v17 = *(void *)(v16 + 8 * v19++);
                if (v17)
                {
                  int64_t v14 = v19 - 1;
                  goto LABEL_9;
                }
              }
            }
          }
        }
      }
    }
    v1[3] = v6;
    v1[4] = 0;
    *a1 = 0;
    a1[1] = 0;
    return result;
  }
  uint64_t v7 = (v4 - 1) & v4;
  unint64_t v8 = __clz(__rbit64(v4)) | (v5 << 6);
LABEL_3:
  uint64_t v9 = 8 * v8;
  uint64_t v10 = *(void *)(*(void *)(v3 + 48) + 8 * v8);
  uint64_t v11 = *(void *)(*(void *)(v3 + 56) + v9);
  v1[3] = v6;
  v1[4] = v7;
  uint64_t v12 = (void (*)(void *))v1[5];
  v20[0] = v10;
  v20[1] = v11;
  swift_bridgeObjectRetain();
  v12(v20);

  return swift_bridgeObjectRelease();
}

uint64_t sub_19D1F224C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_19D1F22D4()
{
  return sub_19D4576C8();
}

BOOL _s7HomeKit22AccessoryMFiCapabilityO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  int v3 = *((char *)a1 + 8);
  uint64_t v4 = *a2;
  if (v3 < 0) {
    return *((char *)a2 + 8) < 0 && v2 == v4;
  }
  if ((a2[1] & 0x80) == 0)
  {
    if (v3)
    {
      if (a2[1]) {
        return 1;
      }
    }
    else if ((a2[1] & 1) == 0 && v2 == v4)
    {
      return 1;
    }
  }
  return 0;
}

uint64_t sub_19D1F2378()
{
  return 1;
}

uint64_t sub_19D1F2380(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_19D4575A8();
  __break(1u);
  return result;
}

unint64_t sub_19D1F2474(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return MEMORY[0x1E4FBC868];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E3F8);
  int v3 = (void *)sub_19D457598();
  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  unint64_t result = sub_19D1F062C(v5);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  unint64_t v8 = a1 + 7;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v3[6] + v9) = v5;
    *(void *)(v3[7] + v9) = v4;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      break;
    }
    v3[2] = v12;
    if (!--v1) {
      goto LABEL_8;
    }
    BOOL v13 = v8 + 2;
    uint64_t v5 = *(v8 - 1);
    uint64_t v14 = *v8;
    swift_bridgeObjectRetain();
    unint64_t result = sub_19D1F062C(v5);
    unint64_t v8 = v13;
    uint64_t v4 = v14;
    if (v15) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_19D1F2574(uint64_t a1)
{
  return a1;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_19D1F25E8()
{
  unint64_t result = qword_1E943E3D0;
  if (!qword_1E943E3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E3D0);
  }
  return result;
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

unint64_t sub_19D1F2684()
{
  unint64_t result = qword_1E943E3E8;
  if (!qword_1E943E3E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E3E8);
  }
  return result;
}

unint64_t sub_19D1F26D8()
{
  unint64_t result = qword_1E943E410;
  if (!qword_1E943E410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E410);
  }
  return result;
}

unint64_t sub_19D1F272C()
{
  unint64_t result = qword_1E943E420;
  if (!qword_1E943E420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E420);
  }
  return result;
}

unint64_t sub_19D1F2780()
{
  unint64_t result = qword_1E943E428;
  if (!qword_1E943E428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E428);
  }
  return result;
}

unint64_t sub_19D1F27D4()
{
  unint64_t result = qword_1E943E440;
  if (!qword_1E943E440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E440);
  }
  return result;
}

unint64_t sub_19D1F2828()
{
  unint64_t result = qword_1E943E450;
  if (!qword_1E943E450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E450);
  }
  return result;
}

unint64_t sub_19D1F287C()
{
  unint64_t result = qword_1E943E460;
  if (!qword_1E943E460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E460);
  }
  return result;
}

unint64_t sub_19D1F28D0()
{
  unint64_t result = qword_1E943E470;
  if (!qword_1E943E470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E470);
  }
  return result;
}

unint64_t sub_19D1F2924()
{
  unint64_t result = qword_1E943E478;
  if (!qword_1E943E478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E478);
  }
  return result;
}

unint64_t sub_19D1F2978()
{
  unint64_t result = qword_1E943E490;
  if (!qword_1E943E490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E490);
  }
  return result;
}

unint64_t sub_19D1F29CC()
{
  unint64_t result = qword_1E943E4A0;
  if (!qword_1E943E4A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E4A0);
  }
  return result;
}

uint64_t sub_19D1F2A20(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_19D1F2A8C()
{
  unint64_t result = qword_1E943E4B0;
  if (!qword_1E943E4B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E4B0);
  }
  return result;
}

unint64_t sub_19D1F2AE0()
{
  unint64_t result = qword_1E943E4C8;
  if (!qword_1E943E4C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E4C8);
  }
  return result;
}

uint64_t sub_19D1F2B34(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

unint64_t sub_19D1F2B8C()
{
  unint64_t result = qword_1E943E4D8;
  if (!qword_1E943E4D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E4D8);
  }
  return result;
}

unint64_t sub_19D1F2BE4()
{
  unint64_t result = qword_1E943E4E0;
  if (!qword_1E943E4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E4E0);
  }
  return result;
}

unint64_t sub_19D1F2C3C()
{
  unint64_t result = qword_1E943E4E8;
  if (!qword_1E943E4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E4E8);
  }
  return result;
}

unint64_t sub_19D1F2C94()
{
  unint64_t result = qword_1E943E4F0;
  if (!qword_1E943E4F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E4F0);
  }
  return result;
}

id sub_19D1F2CEC(id result, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return (id)swift_bridgeObjectRetain();
  }
  if (!a3) {
    return result;
  }
  return result;
}

void destroy for AssetError(uint64_t a1)
{
}

void sub_19D1F2D1C(void *a1, uint64_t a2, char a3)
{
  if (a3 == 1)
  {
    swift_bridgeObjectRelease();
  }
  else if (!a3)
  {
  }
}

uint64_t _s7HomeKit10AssetErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_19D1F2CEC(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for AssetError(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_19D1F2CEC(*(id *)a2, v4, v5);
  unint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_19D1F2D1C(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AssetError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_19D1F2D1C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AssetError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AssetError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_19D1F2EC8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_19D1F2EE0(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AssetError()
{
  return &type metadata for AssetError;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for AccessoryMFiCapability(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7F && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 127);
  }
  unsigned int v3 = (*(unsigned char *)(a1 + 8) & 0x7E | (*(unsigned __int8 *)(a1 + 8) >> 7)) ^ 0x7F;
  if (v3 >= 0x7E) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for AccessoryMFiCapability(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7E)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)__n128 result = a2 - 127;
    if (a3 >= 0x7F) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7F) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(unsigned char *)(result + 8) = 2 * (((-a2 >> 1) & 0x3F) - ((_BYTE)a2 << 6));
    }
  }
  return result;
}

uint64_t sub_19D1F2FC4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8) >> 7;
}

uint64_t sub_19D1F2FD0(uint64_t result)
{
  *(unsigned char *)(result + 8) &= ~0x80u;
  return result;
}

uint64_t sub_19D1F2FE0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = *(unsigned char *)(result + 8) & 1 | (a2 << 7);
  return result;
}

ValueMetadata *type metadata accessor for AccessoryMFiCapability()
{
  return &type metadata for AccessoryMFiCapability;
}

ValueMetadata *type metadata accessor for AccessoryMFiCapabilitiesList()
{
  return &type metadata for AccessoryMFiCapabilitiesList;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for AccessoryMFiCapabilitiesList.Product()
{
  return &type metadata for AccessoryMFiCapabilitiesList.Product;
}

void *initializeBufferWithCopyOfBuffer for AccessoryMFiCapabilitiesList.Vendor(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *_s7HomeKit28AccessoryMFiCapabilitiesListV7ProductVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for AccessoryMFiCapabilitiesList.Vendor(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s7HomeKit28AccessoryMFiCapabilitiesListV7ProductVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_19D1F312C(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AccessoryMFiCapabilitiesList.Vendor()
{
  return &type metadata for AccessoryMFiCapabilitiesList.Vendor;
}

uint64_t destroy for HMAccessoryMatterCapabilities(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HMAccessoryMatterCapabilities(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for HMAccessoryMatterCapabilities(uint64_t *a1, uint64_t *a2)
{
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        __n128 result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        BOOL v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *__n128 result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for HMAccessoryMatterCapabilities(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for HMAccessoryMatterCapabilities(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HMAccessoryMatterCapabilities(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HMAccessoryMatterCapabilities()
{
  return &type metadata for HMAccessoryMatterCapabilities;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for HMAccessoryMatterCapabilities.AssetFilename()
{
  return &type metadata for HMAccessoryMatterCapabilities.AssetFilename;
}

ValueMetadata *type metadata accessor for HMAccessoryMatterCapabilities.VendorID()
{
  return &type metadata for HMAccessoryMatterCapabilities.VendorID;
}

ValueMetadata *type metadata accessor for HMAccessoryMatterCapabilities.ProductID()
{
  return &type metadata for HMAccessoryMatterCapabilities.ProductID;
}

ValueMetadata *type metadata accessor for DefaultMobileAssetDataSource()
{
  return &type metadata for DefaultMobileAssetDataSource;
}

ValueMetadata *type metadata accessor for AccessoryMFiCapabilitiesList.Vendor.CodingKeys()
{
  return &type metadata for AccessoryMFiCapabilitiesList.Vendor.CodingKeys;
}

uint64_t initializeBufferWithCopyOfBuffer for AccessoryMFiCapability.Representation(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AccessoryMFiCapability.Representation()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AccessoryMFiCapability.Representation(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AccessoryMFiCapability.Representation(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AccessoryMFiCapability.Representation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for AccessoryMFiCapability.Representation(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 25)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AccessoryMFiCapability.Representation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AccessoryMFiCapability.Representation()
{
  return &type metadata for AccessoryMFiCapability.Representation;
}

ValueMetadata *type metadata accessor for AccessoryMFiCapabilitiesList.Product.CodingKeys()
{
  return &type metadata for AccessoryMFiCapabilitiesList.Product.CodingKeys;
}

uint64_t getEnumTagSinglePayload for AccessoryMFiCapabilitiesList.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for AccessoryMFiCapabilitiesList.CodingKeys(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x19D1F38E0);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_19D1F3908()
{
  return 0;
}

ValueMetadata *type metadata accessor for AccessoryMFiCapabilitiesList.CodingKeys()
{
  return &type metadata for AccessoryMFiCapabilitiesList.CodingKeys;
}

unint64_t sub_19D1F3924()
{
  unint64_t result = qword_1E943E4F8;
  if (!qword_1E943E4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E4F8);
  }
  return result;
}

unint64_t sub_19D1F397C()
{
  unint64_t result = qword_1E943E500;
  if (!qword_1E943E500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E500);
  }
  return result;
}

unint64_t sub_19D1F39D4()
{
  unint64_t result = qword_1E943E508;
  if (!qword_1E943E508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E508);
  }
  return result;
}

unint64_t sub_19D1F3A2C()
{
  unint64_t result = qword_1E943E510;
  if (!qword_1E943E510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E510);
  }
  return result;
}

unint64_t sub_19D1F3A84()
{
  unint64_t result = qword_1E943E518;
  if (!qword_1E943E518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E518);
  }
  return result;
}

unint64_t sub_19D1F3ADC()
{
  unint64_t result = qword_1E943E520;
  if (!qword_1E943E520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E520);
  }
  return result;
}

unint64_t sub_19D1F3B34()
{
  unint64_t result = qword_1E943E528;
  if (!qword_1E943E528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E528);
  }
  return result;
}

unint64_t sub_19D1F3B8C()
{
  unint64_t result = qword_1E943E530;
  if (!qword_1E943E530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E530);
  }
  return result;
}

unint64_t sub_19D1F3BE4()
{
  unint64_t result = qword_1E943E538;
  if (!qword_1E943E538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E538);
  }
  return result;
}

uint64_t sub_19D1F3C38()
{
  return sub_19D4576C8();
}

uint64_t sub_19D1F3C8C()
{
  return sub_19D4572A8();
}

uint64_t sub_19D1F3CA4(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E540);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19D1F3EB4();
  sub_19D4576D8();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  else
  {
    char v11 = 0;
    uint64_t v7 = sub_19D4575D8();
    char v10 = 1;
    swift_bridgeObjectRetain();
    sub_19D4575C8();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_19D1F3E9C()
{
  return 0x73726F646E6576;
}

unint64_t sub_19D1F3EB4()
{
  unint64_t result = qword_1E943E548;
  if (!qword_1E943E548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E548);
  }
  return result;
}

char *sub_19D1F3F08(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  unint64_t result = (char *)sub_19D4575A8();
  __break(1u);
  return result;
}

uint64_t sub_19D1F3FF4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E5B8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_19D4575A8();
  __break(1u);
  return result;
}

uint64_t sub_19D1F4100(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 6580598 && a2 == 0xE300000000000000;
  if (v3 || (sub_19D457638() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73746375646F7270 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_19D457638();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unint64_t sub_19D1F41DC()
{
  unint64_t result = qword_1E943E558;
  if (!qword_1E943E558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E558);
  }
  return result;
}

unint64_t sub_19D1F4230()
{
  unint64_t result = qword_1E943E560;
  if (!qword_1E943E560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E560);
  }
  return result;
}

uint64_t sub_19D1F4284(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_19D1F42D4()
{
  unint64_t result = qword_1E943E580;
  if (!qword_1E943E580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E580);
  }
  return result;
}

uint64_t sub_19D1F4328(uint64_t a1)
{
  return a1;
}

uint64_t sub_19D1F437C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_19D1F43D8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_19D1F4498(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_19D1F44FC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E590);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_19D4575A8();
  __break(1u);
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_19D1F465C()
{
  return swift_release();
}

uint64_t sub_19D1F4664(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_19D1F46C8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t _s7HomeKit29HMAccessoryMatterCapabilitiesV13AssetFilenameOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s7HomeKit29HMAccessoryMatterCapabilitiesV13AssetFilenameOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x19D1F4834);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_19D1F485C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_19D1F4864(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AccessoryMFiCapability.Representation.CodingKeys()
{
  return &type metadata for AccessoryMFiCapability.Representation.CodingKeys;
}

unint64_t sub_19D1F4884()
{
  unint64_t result = qword_1E943E5E8;
  if (!qword_1E943E5E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E5E8);
  }
  return result;
}

unint64_t sub_19D1F48DC()
{
  unint64_t result = qword_1E943E5F0;
  if (!qword_1E943E5F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E5F0);
  }
  return result;
}

unint64_t sub_19D1F4934()
{
  unint64_t result = qword_1E943E5F8;
  if (!qword_1E943E5F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E943E5F8);
  }
  return result;
}

uint64_t sub_19D1F49BC()
{
  uint64_t v0 = self;
  uint64_t v1 = (void *)sub_19D4571B8();
  int v2 = (void *)sub_19D4571B8();
  id v3 = objc_msgSend(v0, sel_topicFromSuffixID_homeUUID_accessoryUUID_, 513, v1, v2);

  if (!v3) {
    return 0;
  }
  uint64_t v4 = sub_19D457278();

  return v4;
}

uint64_t AccessoryInfoFetchMediaStateItem.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t AccessoryInfoFetchMediaStateItem.init()()
{
  return v0;
}

uint64_t AccessoryInfoFetchMediaStateItem.deinit()
{
  return v0;
}

uint64_t AccessoryInfoFetchMediaStateItem.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for AccessoryInfoFetchMediaStateItem()
{
  return self;
}

id HMAccessory.matterNodeID.getter()
{
  id v1 = objc_msgSend(v0, sel_matterNodeID);
  int v2 = v1;
  if (!v1) {
    return 0;
  }
  id v3 = objc_msgSend(v1, sel_unsignedLongLongValue);

  return v3;
}

uint64_t sub_19D1F4B38()
{
  uint64_t result = sub_19D457278();
  qword_1E943E600 = result;
  *(void *)algn_1E943E608 = v1;
  return result;
}

uint64_t HMCharacteristicPropertySupportsEventNotification.getter()
{
  if (qword_1E943E198 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1E943E600;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t HMService.matterEndpointID.getter()
{
  id v1 = objc_msgSend(v0, sel_matterEndpointID);
  int v2 = v1;
  if (v1)
  {
    unsigned int v3 = objc_msgSend(v1, sel_unsignedShortValue);
  }
  else
  {
    unsigned int v3 = 0;
  }
  return v3 | ((v2 == 0) << 16);
}

uint64_t AccessoryInfoFetchItem.init()()
{
  return v0;
}

uint64_t AccessoryInfoFetchItem.deinit()
{
  return v0;
}

uint64_t AccessoryInfoFetchItem.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t sub_19D1F4C60()
{
  return 0;
}

uint64_t AccessoryInfoFetchItem.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for AccessoryInfoFetchItem()
{
  return self;
}

uint64_t method lookup function for AccessoryInfoFetchItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AccessoryInfoFetchItem);
}

uint64_t dispatch thunk of AccessoryInfoFetchItem.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t AccessoryInfoFetchItemCollection.__allocating_init(accessoryUniqueIdentifier:accessoryInfoFetchItems:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a2;
  uint64_t v5 = v4 + OBJC_IVAR____TtC7HomeKit32AccessoryInfoFetchItemCollection_accessoryUniqueIdentifier;
  uint64_t v6 = sub_19D4571D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a1, v6);
  return v4;
}

uint64_t AccessoryInfoFetchItemCollection.init(accessoryUniqueIdentifier:accessoryInfoFetchItems:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a2;
  uint64_t v4 = v2 + OBJC_IVAR____TtC7HomeKit32AccessoryInfoFetchItemCollection_accessoryUniqueIdentifier;
  uint64_t v5 = sub_19D4571D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(v4, a1, v5);
  return v2;
}

uint64_t AccessoryInfoFetchItemCollection.deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC7HomeKit32AccessoryInfoFetchItemCollection_accessoryUniqueIdentifier;
  uint64_t v2 = sub_19D4571D8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t AccessoryInfoFetchItemCollection.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC7HomeKit32AccessoryInfoFetchItemCollection_accessoryUniqueIdentifier;
  uint64_t v2 = sub_19D4571D8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v3, v4);
}

uint64_t sub_19D1F4EE8()
{
  return type metadata accessor for AccessoryInfoFetchItemCollection();
}

uint64_t type metadata accessor for AccessoryInfoFetchItemCollection()
{
  uint64_t result = qword_1E943E610;
  if (!qword_1E943E610) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_19D1F4F3C()
{
  uint64_t result = sub_19D4571D8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for AccessoryInfoFetchItemCollection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AccessoryInfoFetchItemCollection);
}

uint64_t dispatch thunk of AccessoryInfoFetchItemCollection.__allocating_init(accessoryUniqueIdentifier:accessoryInfoFetchItems:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

id HMUserActionPredictionTransformerMatter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id HMUserActionPredictionTransformerMatter.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HMUserActionPredictionTransformerMatter();
  return objc_msgSendSuper2(&v2, sel_init);
}

id HMUserActionPredictionTransformerMatter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HMUserActionPredictionTransformerMatter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *sub_19D1F515C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E943E5A0);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  void v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_19D1F51C4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_19D457318();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x19F3A57A0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

unsigned __int8 *sub_19D1F5240(uint64_t a1, uint64_t a2, int64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_19D457328();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_19D1F55A4();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    unint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v7 = (unsigned __int8 *)sub_19D4574D8();
  }
LABEL_7:
  uint64_t v11 = sub_19D1F5328(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_19D1F5328(unsigned __int8 *result, uint64_t a2, int64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            unint64_t v9 = 0;
            for (uint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              if (!is_mul_ok(v9, a3)) {
                return 0;
              }
              unint64_t v13 = v9 * a3;
              unsigned __int8 v14 = v11 + v12;
              BOOL v15 = v13 >= v14;
              unint64_t v9 = v13 - v14;
              if (!v15) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_66;
    }
    if (a2)
    {
      unsigned __int8 v25 = a3 + 48;
      unsigned __int8 v26 = a3 + 55;
      unsigned __int8 v27 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v25 = 58;
      }
      else
      {
        unsigned __int8 v27 = 97;
        unsigned __int8 v26 = 65;
      }
      if (result)
      {
        unint64_t v28 = 0;
        do
        {
          unsigned int v29 = *result;
          if (v29 < 0x30 || v29 >= v25)
          {
            if (v29 < 0x41 || v29 >= v26)
            {
              if (v29 < 0x61 || v29 >= v27) {
                return 0;
              }
              char v30 = -87;
            }
            else
            {
              char v30 = -55;
            }
          }
          else
          {
            char v30 = -48;
          }
          if (!is_mul_ok(v28, a3)) {
            return 0;
          }
          unint64_t v31 = v28 * a3;
          unsigned __int8 v32 = v29 + v30;
          BOOL v15 = __CFADD__(v31, v32);
          unint64_t v28 = v31 + v32;
          if (v15) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)v28;
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }
  uint64_t v16 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v17 = a3 + 48;
  unsigned __int8 v18 = a3 + 55;
  unsigned __int8 v19 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v17 = 58;
  }
  else
  {
    unsigned __int8 v19 = 97;
    unsigned __int8 v18 = 65;
  }
  if (!result) {
    return 0;
  }
  unint64_t v9 = 0;
  char v20 = result + 1;
  do
  {
    unsigned int v21 = *v20;
    if (v21 < 0x30 || v21 >= v17)
    {
      if (v21 < 0x41 || v21 >= v18)
      {
        if (v21 < 0x61 || v21 >= v19) {
          return 0;
        }
        char v22 = -87;
      }
      else
      {
        char v22 = -55;
      }
    }
    else
    {
      char v22 = -48;
    }
    if (!is_mul_ok(v9, a3)) {
      return 0;
    }
    unint64_t v23 = v9 * a3;
    unsigned __int8 v24 = v21 + v22;
    BOOL v15 = __CFADD__(v23, v24);
    unint64_t v9 = v23 + v24;
    if (v15) {
      return 0;
    }
    ++v20;
    --v16;
  }
  while (v16);
  return (unsigned __int8 *)v9;
}

uint64_t sub_19D1F55A4()
{
  unint64_t v0 = sub_19D457338();
  uint64_t v4 = sub_19D1F5624(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_19D1F5624(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_19D1F577C(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_19D1F515C(v9, 0);
      unint64_t v12 = sub_19D1F587C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_19D4574D8();
LABEL_4:
        JUMPOUT(0x19F3A5750);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x1E4FBC860];
    }
    uint64_t v13 = MEMORY[0x19F3A5750](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x19F3A5750]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_19D1F577C(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_19D1F51C4(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_19D1F51C4(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x1F4183AA8](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x1F4183AA8](a1, a2, a3, a4);
}

unint64_t sub_19D1F587C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    void v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_19D1F51C4(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_19D457308();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_19D4574D8();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_19D1F51C4(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_19D4572D8();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_19D1F5A90(uint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v3 = a2;
  uint64_t v4 = HIBYTE(a2) & 0xF;
  uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = result & 0xFFFFFFFFFFFFLL;
  }
  if (v6)
  {
    uint64_t v8 = result;
    if ((v3 & 0x1000000000000000) != 0) {
      goto LABEL_69;
    }
    if ((v3 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0) {
        uint64_t v9 = (unsigned __int8 *)((v3 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v9 = (unsigned __int8 *)sub_19D4574D8();
      }
      unint64_t v10 = (unint64_t)sub_19D1F5328(v9, v5, 10);
      char v12 = v11 & 1;
LABEL_37:
      while ((v12 & 1) == 0)
      {
        id v19 = objc_msgSend((id)a3, sel_accessories);
        sub_19D1F5F04();
        a3 = sub_19D457388();

        if (a3 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v8 = sub_19D457568();
          if (!v8)
          {
LABEL_72:
            swift_bridgeObjectRelease_n();
            return 0;
          }
        }
        else
        {
          uint64_t v8 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (!v8) {
            goto LABEL_72;
          }
        }
        uint64_t v20 = 4;
        while (1)
        {
          id v21 = (a3 & 0xC000000000000001) != 0
              ? (id)MEMORY[0x19F3A5980](v20 - 4, a3)
              : *(id *)(a3 + 8 * v20);
          uint64_t v3 = (uint64_t)v21;
          uint64_t v22 = v20 - 3;
          if (__OFADD__(v20 - 4, 1)) {
            break;
          }
          id v23 = objc_msgSend(v21, sel_matterNodeID);
          if (v23)
          {
            unsigned __int8 v24 = v23;
            id v25 = objc_msgSend(v23, sel_unsignedLongLongValue);

            if (v25 == (id)v10)
            {
              swift_bridgeObjectRelease_n();
              return v3;
            }
          }

          ++v20;
          if (v22 == v8) {
            goto LABEL_72;
          }
        }
        __break(1u);
LABEL_69:
        swift_bridgeObjectRetain();
        unint64_t v10 = (unint64_t)sub_19D1F5240(v8, v3, 10);
        char v12 = v34;
        swift_bridgeObjectRelease();
      }
      return 0;
    }
    v35[0] = result;
    v35[1] = v3 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (v4)
      {
        if (v4 != 1 && (BYTE1(result) - 48) <= 9u)
        {
          unint64_t v10 = (BYTE1(result) - 48);
          if (v4 == 2) {
            goto LABEL_36;
          }
          if ((BYTE2(result) - 48) <= 9u)
          {
            unint64_t v10 = 10 * (BYTE1(result) - 48) + (BYTE2(result) - 48);
            uint64_t v16 = v4 - 3;
            if (!v16) {
              goto LABEL_36;
            }
            unint64_t v17 = (unsigned __int8 *)v35 + 3;
            while (1)
            {
              unsigned int v18 = *v17 - 48;
              if (v18 > 9) {
                break;
              }
              if (!is_mul_ok(v10, 0xAuLL)) {
                break;
              }
              BOOL v14 = __CFADD__(10 * v10, v18);
              unint64_t v10 = 10 * v10 + v18;
              if (v14) {
                break;
              }
              char v12 = 0;
              ++v17;
              if (!--v16) {
                goto LABEL_37;
              }
            }
          }
        }
LABEL_33:
        unint64_t v10 = 0;
LABEL_34:
        char v12 = 1;
        goto LABEL_37;
      }
    }
    else
    {
      if (result != 45)
      {
        if (v4 && (result - 48) <= 9u)
        {
          unint64_t v10 = (result - 48);
          if (v4 == 1) {
            goto LABEL_36;
          }
          if ((BYTE1(result) - 48) <= 9u)
          {
            unint64_t v10 = 10 * (result - 48) + (BYTE1(result) - 48);
            uint64_t v26 = v4 - 2;
            if (!v26) {
              goto LABEL_36;
            }
            unint64_t v27 = (unsigned __int8 *)v35 + 2;
            while (1)
            {
              unsigned int v28 = *v27 - 48;
              if (v28 > 9) {
                break;
              }
              if (!is_mul_ok(v10, 0xAuLL)) {
                break;
              }
              BOOL v14 = __CFADD__(10 * v10, v28);
              unint64_t v10 = 10 * v10 + v28;
              if (v14) {
                break;
              }
              char v12 = 0;
              ++v27;
              if (!--v26) {
                goto LABEL_37;
              }
            }
          }
        }
        goto LABEL_33;
      }
      if (v4)
      {
        if (v4 != 1)
        {
          unsigned __int8 v13 = BYTE1(result) - 48;
          if ((BYTE1(result) - 48) <= 9u)
          {
            unint64_t v10 = 0;
            BOOL v14 = v13 == 0;
            unint64_t v15 = -(uint64_t)v13;
            if (!v14) {
              goto LABEL_34;
            }
            if (v4 == 2)
            {
              char v12 = 0;
              unint64_t v10 = v15;
              goto LABEL_37;
            }
            unsigned __int8 v29 = BYTE2(result) - 48;
            if ((BYTE2(result) - 48) <= 9u && is_mul_ok(v15, 0xAuLL))
            {
              unint64_t v30 = 10 * v15;
              unint64_t v10 = v30 - v29;
              if (v30 >= v29)
              {
                uint64_t v31 = v4 - 3;
                if (v31)
                {
                  unsigned __int8 v32 = (unsigned __int8 *)v35 + 3;
                  while (1)
                  {
                    unsigned int v33 = *v32 - 48;
                    if (v33 > 9) {
                      goto LABEL_33;
                    }
                    if (!is_mul_ok(v10, 0xAuLL)) {
                      goto LABEL_33;
                    }
                    BOOL v14 = 10 * v10 >= v33;
                    unint64_t v10 = 10 * v10 - v33;
                    if (!v14) {
                      goto LABEL_33;
                    }
                    char v12 = 0;
                    ++v32;
                    if (!--v31) {
                      goto LABEL_37;
                    }
                  }
                }
LABEL_36:
                char v12 = 0;
                goto LABEL_37;
              }
            }
          }
        }
        goto LABEL_33;
      }
      __break(1u);
    }
    __break(1u);
    return result;
  }
  return 0;
}

uint64_t type metadata accessor for HMUserActionPredictionTransformerMatter()
{
  return self;
}

uint64_t method lookup function for HMUserActionPredictionTransformerMatter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HMUserActionPredictionTransformerMatter);
}

uint64_t dispatch thunk of static HMUserActionPredictionTransformerMatter.matchingMatterAccessory(for:home:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

unint64_t sub_19D1F5F04()
{
  unint64_t result = qword_1E943E620;
  if (!qword_1E943E620)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E943E620);
  }
  return result;
}

uint64_t HMMediaGroupProtoMediaDestinationReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_31;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_31;
        case 3u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 40) |= 1u;
          break;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
LABEL_31:
          uint64_t v26 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v23 = *v3;
        unint64_t v24 = *(void *)(a2 + v23);
        if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
        *(void *)(a2 + v23) = v24 + 1;
        v22 |= (unint64_t)(v25 & 0x7F) << v20;
        if ((v25 & 0x80) == 0) {
          goto LABEL_33;
        }
        v20 += 7;
        BOOL v14 = v21++ >= 9;
        if (v14)
        {
          uint64_t v22 = 0;
          goto LABEL_35;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v22 = 0;
      }
LABEL_35:
      *(void *)(a1 + 8) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D1F7C30(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1F80B0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1FF808(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D1FF8A4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void _initLocationEventWithRegion(void *a1, void *a2)
{
  uint64_t v6 = a1;
  uint64_t v3 = [a2 copy];
  uint64_t v4 = (void *)v6[7];
  v6[7] = v3;

  uint64_t v5 = (void *)v6[8];
  v6[8] = 0;

  v6[9] = 1;
}

uint64_t HMMediaGroupProtoMediaGroupRoleReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        [(id)a1 clearOneofValuesForRole];
        *(unsigned char *)(a1 + 20) |= 1u;
        *(_DWORD *)(a1 + 16) = 1;
        uint64_t v23 = objc_alloc_init(HMMediaGroupProtoMediaSystemRoles);
        objc_storeStrong((id *)(a1 + 8), v23);
        if (!PBReaderPlaceMark() || !HMMediaGroupProtoMediaSystemRolesReadFrom((uint64_t)v23, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if ((v10 >> 3))
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
      else
      {
        unsigned int v17 = 0;
        while (1)
        {
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 == -1 || v19 >= *(void *)(a2 + *v4)) {
            break;
          }
          unint64_t v20 = v19 + 1;
          int v21 = *(char *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v20;
          if (v21 < 0 && v17++ <= 8) {
            continue;
          }
          goto LABEL_33;
        }
        *(unsigned char *)(a2 + *v5) = 1;
      }
LABEL_33:
      ;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL HMMediaGroupProtoMediaParticipantDataReadFrom(id *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v18 = objc_alloc_init(HMMediaGroupProtoMediaDestinationControllerData);
        objc_storeStrong(a1 + 3, v18);
        if (!PBReaderPlaceMark()
          || (HMMediaGroupProtoMediaDestinationControllerDataReadFrom((uint64_t)v18, a2) & 1) == 0)
        {
LABEL_34:

          return 0;
        }
LABEL_28:
        PBReaderRecallMark();
LABEL_29:

        goto LABEL_31;
      }
      if (v17 == 1)
      {
        uint64_t v18 = objc_alloc_init(HMMediaGroupProtoMediaDestination);
        objc_storeStrong(a1 + 2, v18);
        if (!PBReaderPlaceMark()
          || (HMMediaGroupProtoMediaDestinationReadFrom((uint64_t)v18, a2) & 1) == 0)
        {
          goto LABEL_34;
        }
        goto LABEL_28;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_31:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    PBReaderReadData();
    uint64_t v18 = (HMMediaGroupProtoMediaDestinationControllerData *)objc_claimAutoreleasedReturnValue();
    if (v18) {
      [a1 addBackupGroups:v18];
    }
    goto LABEL_29;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t HMAccessoryDiagnosticInfoProtoSetupInfoReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x100000000uLL;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_339;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_341;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_339:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_341:
          uint64_t v243 = 264;
          goto LABEL_515;
        case 5u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x8000000uLL;
          while (2)
          {
            uint64_t v26 = *v3;
            unint64_t v27 = *(void *)(a2 + v26);
            if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
              *(void *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_345;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_345:
          uint64_t v243 = 224;
          goto LABEL_515;
        case 6u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 4uLL;
          while (2)
          {
            uint64_t v31 = *v3;
            unint64_t v32 = *(void *)(a2 + v31);
            if (v32 == -1 || v32 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
              *(void *)(a2 + v31) = v32 + 1;
              v19 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                BOOL v14 = v30++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_349;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_349:
          uint64_t v243 = 24;
          goto LABEL_515;
        case 7u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x10000uLL;
          while (2)
          {
            uint64_t v36 = *v3;
            unint64_t v37 = *(void *)(a2 + v36);
            if (v37 == -1 || v37 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
              *(void *)(a2 + v36) = v37 + 1;
              v19 |= (unint64_t)(v38 & 0x7F) << v34;
              if (v38 < 0)
              {
                v34 += 7;
                BOOL v14 = v35++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_353;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_353:
          uint64_t v243 = 136;
          goto LABEL_515;
        case 8u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x4000000uLL;
          while (2)
          {
            uint64_t v41 = *v3;
            unint64_t v42 = *(void *)(a2 + v41);
            if (v42 == -1 || v42 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
              *(void *)(a2 + v41) = v42 + 1;
              v19 |= (unint64_t)(v43 & 0x7F) << v39;
              if (v43 < 0)
              {
                v39 += 7;
                BOOL v14 = v40++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_357;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_357:
          uint64_t v243 = 216;
          goto LABEL_515;
        case 9u:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x2000000uLL;
          while (2)
          {
            uint64_t v46 = *v3;
            unint64_t v47 = *(void *)(a2 + v46);
            if (v47 == -1 || v47 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v48 = *(unsigned char *)(*(void *)(a2 + *v7) + v47);
              *(void *)(a2 + v46) = v47 + 1;
              v19 |= (unint64_t)(v48 & 0x7F) << v44;
              if (v48 < 0)
              {
                v44 += 7;
                BOOL v14 = v45++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_361;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_361:
          uint64_t v243 = 208;
          goto LABEL_515;
        case 0xAu:
          char v49 = 0;
          unsigned int v50 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x40000000uLL;
          while (2)
          {
            uint64_t v51 = *v3;
            unint64_t v52 = *(void *)(a2 + v51);
            if (v52 == -1 || v52 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v53 = *(unsigned char *)(*(void *)(a2 + *v7) + v52);
              *(void *)(a2 + v51) = v52 + 1;
              v19 |= (unint64_t)(v53 & 0x7F) << v49;
              if (v53 < 0)
              {
                v49 += 7;
                BOOL v14 = v50++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_365;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_365:
          uint64_t v243 = 248;
          goto LABEL_515;
        case 0xBu:
          char v54 = 0;
          unsigned int v55 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 2uLL;
          while (2)
          {
            uint64_t v56 = *v3;
            unint64_t v57 = *(void *)(a2 + v56);
            if (v57 == -1 || v57 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v58 = *(unsigned char *)(*(void *)(a2 + *v7) + v57);
              *(void *)(a2 + v56) = v57 + 1;
              v19 |= (unint64_t)(v58 & 0x7F) << v54;
              if (v58 < 0)
              {
                v54 += 7;
                BOOL v14 = v55++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_369;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_369:
          uint64_t v243 = 16;
          goto LABEL_515;
        case 0xCu:
          char v59 = 0;
          unsigned int v60 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 8uLL;
          while (2)
          {
            uint64_t v61 = *v3;
            unint64_t v62 = *(void *)(a2 + v61);
            if (v62 == -1 || v62 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v63 = *(unsigned char *)(*(void *)(a2 + *v7) + v62);
              *(void *)(a2 + v61) = v62 + 1;
              v19 |= (unint64_t)(v63 & 0x7F) << v59;
              if (v63 < 0)
              {
                v59 += 7;
                BOOL v14 = v60++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_373;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_373:
          uint64_t v243 = 32;
          goto LABEL_515;
        case 0xDu:
          char v64 = 0;
          unsigned int v65 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x400uLL;
          while (2)
          {
            uint64_t v66 = *v3;
            unint64_t v67 = *(void *)(a2 + v66);
            if (v67 == -1 || v67 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v68 = *(unsigned char *)(*(void *)(a2 + *v7) + v67);
              *(void *)(a2 + v66) = v67 + 1;
              v19 |= (unint64_t)(v68 & 0x7F) << v64;
              if (v68 < 0)
              {
                v64 += 7;
                BOOL v14 = v65++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_377;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_377:
          uint64_t v243 = 88;
          goto LABEL_515;
        case 0xEu:
          char v69 = 0;
          unsigned int v70 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x200uLL;
          while (2)
          {
            uint64_t v71 = *v3;
            unint64_t v72 = *(void *)(a2 + v71);
            if (v72 == -1 || v72 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v73 = *(unsigned char *)(*(void *)(a2 + *v7) + v72);
              *(void *)(a2 + v71) = v72 + 1;
              v19 |= (unint64_t)(v73 & 0x7F) << v69;
              if (v73 < 0)
              {
                v69 += 7;
                BOOL v14 = v70++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_381;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_381:
          uint64_t v243 = 80;
          goto LABEL_515;
        case 0xFu:
          char v74 = 0;
          unsigned int v75 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 1uLL;
          while (2)
          {
            uint64_t v76 = *v3;
            unint64_t v77 = *(void *)(a2 + v76);
            if (v77 == -1 || v77 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v78 = *(unsigned char *)(*(void *)(a2 + *v7) + v77);
              *(void *)(a2 + v76) = v77 + 1;
              v19 |= (unint64_t)(v78 & 0x7F) << v74;
              if (v78 < 0)
              {
                v74 += 7;
                BOOL v14 = v75++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_385;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_385:
          uint64_t v243 = 8;
          goto LABEL_515;
        case 0x10u:
          char v79 = 0;
          unsigned int v80 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x10000000uLL;
          while (2)
          {
            uint64_t v81 = *v3;
            unint64_t v82 = *(void *)(a2 + v81);
            if (v82 == -1 || v82 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v83 = *(unsigned char *)(*(void *)(a2 + *v7) + v82);
              *(void *)(a2 + v81) = v82 + 1;
              v19 |= (unint64_t)(v83 & 0x7F) << v79;
              if (v83 < 0)
              {
                v79 += 7;
                BOOL v14 = v80++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_389;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_389:
          uint64_t v243 = 232;
          goto LABEL_515;
        case 0x11u:
          char v84 = 0;
          unsigned int v85 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x20000uLL;
          while (2)
          {
            uint64_t v86 = *v3;
            unint64_t v87 = *(void *)(a2 + v86);
            if (v87 == -1 || v87 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v88 = *(unsigned char *)(*(void *)(a2 + *v7) + v87);
              *(void *)(a2 + v86) = v87 + 1;
              v19 |= (unint64_t)(v88 & 0x7F) << v84;
              if (v88 < 0)
              {
                v84 += 7;
                BOOL v14 = v85++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_393;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_393:
          uint64_t v243 = 144;
          goto LABEL_515;
        case 0x12u:
          char v89 = 0;
          unsigned int v90 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x20000000uLL;
          while (2)
          {
            uint64_t v91 = *v3;
            unint64_t v92 = *(void *)(a2 + v91);
            if (v92 == -1 || v92 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v93 = *(unsigned char *)(*(void *)(a2 + *v7) + v92);
              *(void *)(a2 + v91) = v92 + 1;
              v19 |= (unint64_t)(v93 & 0x7F) << v89;
              if (v93 < 0)
              {
                v89 += 7;
                BOOL v14 = v90++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_397;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_397:
          uint64_t v243 = 240;
          goto LABEL_515;
        case 0x13u:
          char v94 = 0;
          unsigned int v95 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x20uLL;
          while (2)
          {
            uint64_t v96 = *v3;
            unint64_t v97 = *(void *)(a2 + v96);
            if (v97 == -1 || v97 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v98 = *(unsigned char *)(*(void *)(a2 + *v7) + v97);
              *(void *)(a2 + v96) = v97 + 1;
              v19 |= (unint64_t)(v98 & 0x7F) << v94;
              if (v98 < 0)
              {
                v94 += 7;
                BOOL v14 = v95++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_401;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_401:
          uint64_t v243 = 48;
          goto LABEL_515;
        case 0x14u:
          char v99 = 0;
          unsigned int v100 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x100000uLL;
          while (2)
          {
            uint64_t v101 = *v3;
            unint64_t v102 = *(void *)(a2 + v101);
            if (v102 == -1 || v102 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v103 = *(unsigned char *)(*(void *)(a2 + *v7) + v102);
              *(void *)(a2 + v101) = v102 + 1;
              v19 |= (unint64_t)(v103 & 0x7F) << v99;
              if (v103 < 0)
              {
                v99 += 7;
                BOOL v14 = v100++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_405;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_405:
          uint64_t v243 = 168;
          goto LABEL_515;
        case 0x15u:
          char v104 = 0;
          unsigned int v105 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x10uLL;
          while (2)
          {
            uint64_t v106 = *v3;
            unint64_t v107 = *(void *)(a2 + v106);
            if (v107 == -1 || v107 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v108 = *(unsigned char *)(*(void *)(a2 + *v7) + v107);
              *(void *)(a2 + v106) = v107 + 1;
              v19 |= (unint64_t)(v108 & 0x7F) << v104;
              if (v108 < 0)
              {
                v104 += 7;
                BOOL v14 = v105++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_409;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_409:
          uint64_t v243 = 40;
          goto LABEL_515;
        case 0x16u:
          char v109 = 0;
          unsigned int v110 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x80000000uLL;
          while (2)
          {
            uint64_t v111 = *v3;
            unint64_t v112 = *(void *)(a2 + v111);
            if (v112 == -1 || v112 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v113 = *(unsigned char *)(*(void *)(a2 + *v7) + v112);
              *(void *)(a2 + v111) = v112 + 1;
              v19 |= (unint64_t)(v113 & 0x7F) << v109;
              if (v113 < 0)
              {
                v109 += 7;
                BOOL v14 = v110++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_413;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_413:
          uint64_t v243 = 256;
          goto LABEL_515;
        case 0x17u:
          char v114 = 0;
          unsigned int v115 = 0;
          uint64_t v116 = 0;
          *(void *)(a1 + 384) |= 0x400000000uLL;
          while (2)
          {
            uint64_t v117 = *v3;
            unint64_t v118 = *(void *)(a2 + v117);
            if (v118 == -1 || v118 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v119 = *(unsigned char *)(*(void *)(a2 + *v7) + v118);
              *(void *)(a2 + v117) = v118 + 1;
              v116 |= (unint64_t)(v119 & 0x7F) << v114;
              if (v119 < 0)
              {
                v114 += 7;
                BOOL v14 = v115++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_417;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_417:
          uint64_t v244 = 304;
          goto LABEL_474;
        case 0x18u:
          char v120 = 0;
          unsigned int v121 = 0;
          uint64_t v116 = 0;
          *(void *)(a1 + 384) |= 0x800000000uLL;
          while (2)
          {
            uint64_t v122 = *v3;
            unint64_t v123 = *(void *)(a2 + v122);
            if (v123 == -1 || v123 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v124 = *(unsigned char *)(*(void *)(a2 + *v7) + v123);
              *(void *)(a2 + v122) = v123 + 1;
              v116 |= (unint64_t)(v124 & 0x7F) << v120;
              if (v124 < 0)
              {
                v120 += 7;
                BOOL v14 = v121++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_421;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_421:
          uint64_t v244 = 308;
          goto LABEL_474;
        case 0x19u:
          char v125 = 0;
          unsigned int v126 = 0;
          uint64_t v116 = 0;
          *(void *)(a1 + 384) |= 0x4000000000uLL;
          while (2)
          {
            uint64_t v127 = *v3;
            unint64_t v128 = *(void *)(a2 + v127);
            if (v128 == -1 || v128 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v129 = *(unsigned char *)(*(void *)(a2 + *v7) + v128);
              *(void *)(a2 + v127) = v128 + 1;
              v116 |= (unint64_t)(v129 & 0x7F) << v125;
              if (v129 < 0)
              {
                v125 += 7;
                BOOL v14 = v126++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_425;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_425:
          uint64_t v244 = 360;
          goto LABEL_474;
        case 0x1Au:
          char v130 = 0;
          unsigned int v131 = 0;
          uint64_t v116 = 0;
          *(void *)(a1 + 384) |= 0x8000000000uLL;
          while (2)
          {
            uint64_t v132 = *v3;
            unint64_t v133 = *(void *)(a2 + v132);
            if (v133 == -1 || v133 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v134 = *(unsigned char *)(*(void *)(a2 + *v7) + v133);
              *(void *)(a2 + v132) = v133 + 1;
              v116 |= (unint64_t)(v134 & 0x7F) << v130;
              if (v134 < 0)
              {
                v130 += 7;
                BOOL v14 = v131++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_429;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_429:
          uint64_t v244 = 364;
          goto LABEL_474;
        case 0x1Bu:
          char v135 = 0;
          unsigned int v136 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x800uLL;
          while (2)
          {
            uint64_t v137 = *v3;
            unint64_t v138 = *(void *)(a2 + v137);
            if (v138 == -1 || v138 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v139 = *(unsigned char *)(*(void *)(a2 + *v7) + v138);
              *(void *)(a2 + v137) = v138 + 1;
              v19 |= (unint64_t)(v139 & 0x7F) << v135;
              if (v139 < 0)
              {
                v135 += 7;
                BOOL v14 = v136++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_433;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_433:
          uint64_t v243 = 96;
          goto LABEL_515;
        case 0x1Cu:
          uint64_t v140 = PBReaderReadString();
          uint64_t v141 = 320;
          goto LABEL_330;
        case 0x1Du:
          uint64_t v140 = PBReaderReadString();
          uint64_t v141 = 328;
          goto LABEL_330;
        case 0x1Eu:
          char v142 = 0;
          unsigned int v143 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x1000uLL;
          while (2)
          {
            uint64_t v144 = *v3;
            unint64_t v145 = *(void *)(a2 + v144);
            if (v145 == -1 || v145 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v146 = *(unsigned char *)(*(void *)(a2 + *v7) + v145);
              *(void *)(a2 + v144) = v145 + 1;
              v19 |= (unint64_t)(v146 & 0x7F) << v142;
              if (v146 < 0)
              {
                v142 += 7;
                BOOL v14 = v143++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_437;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_437:
          uint64_t v243 = 104;
          goto LABEL_515;
        case 0x1Fu:
          uint64_t v140 = PBReaderReadString();
          uint64_t v141 = 336;
          goto LABEL_330;
        case 0x20u:
          char v147 = 0;
          unsigned int v148 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x1000000uLL;
          while (2)
          {
            uint64_t v149 = *v3;
            unint64_t v150 = *(void *)(a2 + v149);
            if (v150 == -1 || v150 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v151 = *(unsigned char *)(*(void *)(a2 + *v7) + v150);
              *(void *)(a2 + v149) = v150 + 1;
              v19 |= (unint64_t)(v151 & 0x7F) << v147;
              if (v151 < 0)
              {
                v147 += 7;
                BOOL v14 = v148++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_441;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_441:
          uint64_t v243 = 200;
          goto LABEL_515;
        case 0x21u:
          char v152 = 0;
          unsigned int v153 = 0;
          uint64_t v116 = 0;
          *(void *)(a1 + 384) |= 0x1000000000uLL;
          while (2)
          {
            uint64_t v154 = *v3;
            unint64_t v155 = *(void *)(a2 + v154);
            if (v155 == -1 || v155 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v156 = *(unsigned char *)(*(void *)(a2 + *v7) + v155);
              *(void *)(a2 + v154) = v155 + 1;
              v116 |= (unint64_t)(v156 & 0x7F) << v152;
              if (v156 < 0)
              {
                v152 += 7;
                BOOL v14 = v153++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_445;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_445:
          uint64_t v244 = 312;
          goto LABEL_474;
        case 0x22u:
          char v157 = 0;
          unsigned int v158 = 0;
          uint64_t v116 = 0;
          *(void *)(a1 + 384) |= 0x2000000000uLL;
          while (2)
          {
            uint64_t v159 = *v3;
            unint64_t v160 = *(void *)(a2 + v159);
            if (v160 == -1 || v160 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v161 = *(unsigned char *)(*(void *)(a2 + *v7) + v160);
              *(void *)(a2 + v159) = v160 + 1;
              v116 |= (unint64_t)(v161 & 0x7F) << v157;
              if (v161 < 0)
              {
                v157 += 7;
                BOOL v14 = v158++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_449;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_449:
          uint64_t v244 = 316;
          goto LABEL_474;
        case 0x23u:
          uint64_t v140 = PBReaderReadString();
          uint64_t v141 = 272;
          goto LABEL_330;
        case 0x24u:
          char v162 = 0;
          unsigned int v163 = 0;
          uint64_t v116 = 0;
          *(void *)(a1 + 384) |= 0x80000000000uLL;
          while (2)
          {
            uint64_t v164 = *v3;
            unint64_t v165 = *(void *)(a2 + v164);
            if (v165 == -1 || v165 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v166 = *(unsigned char *)(*(void *)(a2 + *v7) + v165);
              *(void *)(a2 + v164) = v165 + 1;
              v116 |= (unint64_t)(v166 & 0x7F) << v162;
              if (v166 < 0)
              {
                v162 += 7;
                BOOL v14 = v163++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_453;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_453:
          uint64_t v244 = 380;
          goto LABEL_474;
        case 0x25u:
          char v167 = 0;
          unsigned int v168 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x8000uLL;
          while (2)
          {
            uint64_t v169 = *v3;
            unint64_t v170 = *(void *)(a2 + v169);
            if (v170 == -1 || v170 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v171 = *(unsigned char *)(*(void *)(a2 + *v7) + v170);
              *(void *)(a2 + v169) = v170 + 1;
              v19 |= (unint64_t)(v171 & 0x7F) << v167;
              if (v171 < 0)
              {
                v167 += 7;
                BOOL v14 = v168++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_457;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_457:
          uint64_t v243 = 128;
          goto LABEL_515;
        case 0x26u:
          char v172 = 0;
          unsigned int v173 = 0;
          uint64_t v116 = 0;
          *(void *)(a1 + 384) |= 0x20000000000uLL;
          while (2)
          {
            uint64_t v174 = *v3;
            unint64_t v175 = *(void *)(a2 + v174);
            if (v175 == -1 || v175 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v176 = *(unsigned char *)(*(void *)(a2 + *v7) + v175);
              *(void *)(a2 + v174) = v175 + 1;
              v116 |= (unint64_t)(v176 & 0x7F) << v172;
              if (v176 < 0)
              {
                v172 += 7;
                BOOL v14 = v173++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_461;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_461:
          uint64_t v244 = 372;
          goto LABEL_474;
        case 0x27u:
          char v177 = 0;
          unsigned int v178 = 0;
          uint64_t v116 = 0;
          *(void *)(a1 + 384) |= 0x40000000000uLL;
          while (2)
          {
            uint64_t v179 = *v3;
            unint64_t v180 = *(void *)(a2 + v179);
            if (v180 == -1 || v180 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v181 = *(unsigned char *)(*(void *)(a2 + *v7) + v180);
              *(void *)(a2 + v179) = v180 + 1;
              v116 |= (unint64_t)(v181 & 0x7F) << v177;
              if (v181 < 0)
              {
                v177 += 7;
                BOOL v14 = v178++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_465;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_465:
          uint64_t v244 = 376;
          goto LABEL_474;
        case 0x28u:
          char v182 = 0;
          unsigned int v183 = 0;
          uint64_t v116 = 0;
          *(void *)(a1 + 384) |= 0x10000000000uLL;
          while (2)
          {
            uint64_t v184 = *v3;
            unint64_t v185 = *(void *)(a2 + v184);
            if (v185 == -1 || v185 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v186 = *(unsigned char *)(*(void *)(a2 + *v7) + v185);
              *(void *)(a2 + v184) = v185 + 1;
              v116 |= (unint64_t)(v186 & 0x7F) << v182;
              if (v186 < 0)
              {
                v182 += 7;
                BOOL v14 = v183++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_469;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_469:
          uint64_t v244 = 368;
          goto LABEL_474;
        case 0x29u:
          char v187 = 0;
          unsigned int v188 = 0;
          uint64_t v116 = 0;
          *(void *)(a1 + 384) |= 0x200000000uLL;
          while (2)
          {
            uint64_t v189 = *v3;
            unint64_t v190 = *(void *)(a2 + v189);
            if (v190 == -1 || v190 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v191 = *(unsigned char *)(*(void *)(a2 + *v7) + v190);
              *(void *)(a2 + v189) = v190 + 1;
              v116 |= (unint64_t)(v191 & 0x7F) << v187;
              if (v191 < 0)
              {
                v187 += 7;
                BOOL v14 = v188++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_473;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_473:
          uint64_t v244 = 280;
LABEL_474:
          *(_DWORD *)(a1 + v244) = v116;
          continue;
        case 0x2Au:
          char v192 = 0;
          unsigned int v193 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x2000uLL;
          while (2)
          {
            uint64_t v194 = *v3;
            unint64_t v195 = *(void *)(a2 + v194);
            if (v195 == -1 || v195 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v196 = *(unsigned char *)(*(void *)(a2 + *v7) + v195);
              *(void *)(a2 + v194) = v195 + 1;
              v19 |= (unint64_t)(v196 & 0x7F) << v192;
              if (v196 < 0)
              {
                v192 += 7;
                BOOL v14 = v193++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_478;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_478:
          uint64_t v243 = 112;
          goto LABEL_515;
        case 0x2Bu:
          uint64_t v140 = PBReaderReadString();
          uint64_t v141 = 344;
          goto LABEL_330;
        case 0x2Cu:
          char v197 = 0;
          unsigned int v198 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x4000uLL;
          while (2)
          {
            uint64_t v199 = *v3;
            unint64_t v200 = *(void *)(a2 + v199);
            if (v200 == -1 || v200 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v201 = *(unsigned char *)(*(void *)(a2 + *v7) + v200);
              *(void *)(a2 + v199) = v200 + 1;
              v19 |= (unint64_t)(v201 & 0x7F) << v197;
              if (v201 < 0)
              {
                v197 += 7;
                BOOL v14 = v198++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_482;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_482:
          uint64_t v243 = 120;
          goto LABEL_515;
        case 0x2Du:
          uint64_t v140 = PBReaderReadString();
          uint64_t v141 = 352;
          goto LABEL_330;
        case 0x2Eu:
          char v202 = 0;
          unsigned int v203 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x800000uLL;
          while (2)
          {
            uint64_t v204 = *v3;
            unint64_t v205 = *(void *)(a2 + v204);
            if (v205 == -1 || v205 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v206 = *(unsigned char *)(*(void *)(a2 + *v7) + v205);
              *(void *)(a2 + v204) = v205 + 1;
              v19 |= (unint64_t)(v206 & 0x7F) << v202;
              if (v206 < 0)
              {
                v202 += 7;
                BOOL v14 = v203++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_486;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_486:
          uint64_t v243 = 192;
          goto LABEL_515;
        case 0x2Fu:
          char v207 = 0;
          unsigned int v208 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x40000uLL;
          while (2)
          {
            uint64_t v209 = *v3;
            unint64_t v210 = *(void *)(a2 + v209);
            if (v210 == -1 || v210 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v211 = *(unsigned char *)(*(void *)(a2 + *v7) + v210);
              *(void *)(a2 + v209) = v210 + 1;
              v19 |= (unint64_t)(v211 & 0x7F) << v207;
              if (v211 < 0)
              {
                v207 += 7;
                BOOL v14 = v208++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_490;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_490:
          uint64_t v243 = 152;
          goto LABEL_515;
        case 0x30u:
          char v212 = 0;
          unsigned int v213 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x200000uLL;
          while (2)
          {
            uint64_t v214 = *v3;
            unint64_t v215 = *(void *)(a2 + v214);
            if (v215 == -1 || v215 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v216 = *(unsigned char *)(*(void *)(a2 + *v7) + v215);
              *(void *)(a2 + v214) = v215 + 1;
              v19 |= (unint64_t)(v216 & 0x7F) << v212;
              if (v216 < 0)
              {
                v212 += 7;
                BOOL v14 = v213++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_494;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_494:
          uint64_t v243 = 176;
          goto LABEL_515;
        case 0x31u:
          char v217 = 0;
          unsigned int v218 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x80000uLL;
          while (2)
          {
            uint64_t v219 = *v3;
            unint64_t v220 = *(void *)(a2 + v219);
            if (v220 == -1 || v220 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v221 = *(unsigned char *)(*(void *)(a2 + *v7) + v220);
              *(void *)(a2 + v219) = v220 + 1;
              v19 |= (unint64_t)(v221 & 0x7F) << v217;
              if (v221 < 0)
              {
                v217 += 7;
                BOOL v14 = v218++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_498;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_498:
          uint64_t v243 = 160;
          goto LABEL_515;
        case 0x32u:
          char v222 = 0;
          unsigned int v223 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x40uLL;
          while (2)
          {
            uint64_t v224 = *v3;
            unint64_t v225 = *(void *)(a2 + v224);
            if (v225 == -1 || v225 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v226 = *(unsigned char *)(*(void *)(a2 + *v7) + v225);
              *(void *)(a2 + v224) = v225 + 1;
              v19 |= (unint64_t)(v226 & 0x7F) << v222;
              if (v226 < 0)
              {
                v222 += 7;
                BOOL v14 = v223++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_502;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_502:
          uint64_t v243 = 56;
          goto LABEL_515;
        case 0x33u:
          char v227 = 0;
          unsigned int v228 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x80uLL;
          while (2)
          {
            uint64_t v229 = *v3;
            unint64_t v230 = *(void *)(a2 + v229);
            if (v230 == -1 || v230 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v231 = *(unsigned char *)(*(void *)(a2 + *v7) + v230);
              *(void *)(a2 + v229) = v230 + 1;
              v19 |= (unint64_t)(v231 & 0x7F) << v227;
              if (v231 < 0)
              {
                v227 += 7;
                BOOL v14 = v228++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_506;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_506:
          uint64_t v243 = 64;
          goto LABEL_515;
        case 0x34u:
          uint64_t v140 = PBReaderReadString();
          uint64_t v141 = 288;
          goto LABEL_330;
        case 0x35u:
          char v232 = 0;
          unsigned int v233 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x100uLL;
          while (2)
          {
            uint64_t v234 = *v3;
            unint64_t v235 = *(void *)(a2 + v234);
            if (v235 == -1 || v235 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v236 = *(unsigned char *)(*(void *)(a2 + *v7) + v235);
              *(void *)(a2 + v234) = v235 + 1;
              v19 |= (unint64_t)(v236 & 0x7F) << v232;
              if (v236 < 0)
              {
                v232 += 7;
                BOOL v14 = v233++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_510;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_510:
          uint64_t v243 = 72;
          goto LABEL_515;
        case 0x36u:
          uint64_t v140 = PBReaderReadString();
          uint64_t v141 = 296;
LABEL_330:
          v237 = *(void **)(a1 + v141);
          *(void *)(a1 + v141) = v140;

          continue;
        case 0x37u:
          char v238 = 0;
          unsigned int v239 = 0;
          uint64_t v19 = 0;
          *(void *)(a1 + 384) |= 0x400000uLL;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v240 = *v3;
        unint64_t v241 = *(void *)(a2 + v240);
        if (v241 == -1 || v241 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v242 = *(unsigned char *)(*(void *)(a2 + *v7) + v241);
        *(void *)(a2 + v240) = v241 + 1;
        v19 |= (unint64_t)(v242 & 0x7F) << v238;
        if ((v242 & 0x80) == 0) {
          goto LABEL_512;
        }
        v238 += 7;
        BOOL v14 = v239++ >= 9;
        if (v14)
        {
          uint64_t v19 = 0;
          goto LABEL_514;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_512:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v19 = 0;
      }
LABEL_514:
      uint64_t v243 = 184;
LABEL_515:
      *(void *)(a1 + v243) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t HMAccessorySettingConstraintTypeFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"minimumValue"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"maximumValue"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"stepValue"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"validValue"])
  {
    uint64_t v2 = 4;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *HMAccessorySettingConstraintTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Unknown";
  }
  else {
    return off_1E593E5A0[a1 - 1];
  }
}

void sub_19D20DB34(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D20DC04(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 64;
          goto LABEL_46;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 72) |= 8u;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  uint64_t v22 = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_57:
          uint64_t v42 = 32;
          goto LABEL_70;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 72) |= 4u;
          while (2)
          {
            uint64_t v28 = *v3;
            unint64_t v29 = *(void *)(a2 + v28);
            if (v29 == -1 || v29 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
              *(void *)(a2 + v28) = v29 + 1;
              v22 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  uint64_t v22 = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_61:
          uint64_t v42 = 24;
          goto LABEL_70;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 56;
          goto LABEL_46;
        case 5u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 72) |= 1u;
          while (2)
          {
            uint64_t v33 = *v3;
            unint64_t v34 = *(void *)(a2 + v33);
            if (v34 == -1 || v34 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
              *(void *)(a2 + v33) = v34 + 1;
              v22 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                BOOL v14 = v32++ >= 9;
                if (v14)
                {
                  uint64_t v22 = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_65:
          uint64_t v42 = 8;
          goto LABEL_70;
        case 6u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_46;
        case 7u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 48;
LABEL_46:
          uint64_t v36 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 8u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 72) |= 2u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v39 = *v3;
        unint64_t v40 = *(void *)(a2 + v39);
        if (v40 == -1 || v40 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
        *(void *)(a2 + v39) = v40 + 1;
        v22 |= (unint64_t)(v41 & 0x7F) << v37;
        if ((v41 & 0x80) == 0) {
          goto LABEL_67;
        }
        v37 += 7;
        BOOL v14 = v38++ >= 9;
        if (v14)
        {
          uint64_t v22 = 0;
          goto LABEL_69;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_67:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v22 = 0;
      }
LABEL_69:
      uint64_t v42 = 16;
LABEL_70:
      *(void *)(a1 + v42) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t HMSoftwareUpdateProgressEventComponentsFromTopic(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if ([v5 hasSuffix:@"info.softwareUpdate.progress"])
  {
    uint64_t v6 = [v5 componentsSeparatedByString:@"."];
    if ([v6 count] == 5)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F29128]);
      char v8 = [v6 objectAtIndexedSubscript:0];
      unsigned int v9 = (void *)[v7 initWithUUIDString:v8];

      id v10 = objc_alloc(MEMORY[0x1E4F29128]);
      uint64_t v11 = [v6 objectAtIndexedSubscript:1];
      unint64_t v12 = (void *)[v10 initWithUUIDString:v11];

      if (v9) {
        BOOL v13 = v12 == 0;
      }
      else {
        BOOL v13 = 1;
      }
      uint64_t v14 = !v13;
      if (!v13)
      {
        if (a2) {
          *a2 = v9;
        }
        if (a3) {
          *a3 = v12;
        }
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

void sub_19D212A4C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D212E0C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2132E8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2135F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_unfair_lock_t lock)
{
}

void sub_19D213684(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2143C8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2151F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL isValidTimeComparison(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 leftExpression];
  uint64_t v3 = [v1 rightExpression];
  if ([v2 expressionType] != 4) {
    goto LABEL_9;
  }
  uint64_t v4 = [v2 function];
  int v5 = [v4 isEqualToString:@"now"];

  if (!v5
    || [v1 predicateOperatorType] != 2
    && [v1 predicateOperatorType] != 4
    && [v1 predicateOperatorType])
  {
    goto LABEL_9;
  }
  if (![v3 expressionType]
    && ([v3 constantValue],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    char v8 = [v3 constantValue];
    BOOL v9 = +[HMPredicateUtilities areOnlyHourAndMinuteSet:v8];
  }
  else
  {
LABEL_9:
    BOOL v9 = 0;
  }

  return v9;
}

void sub_19D218E68(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D218F94(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D218FF8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMAccessoryDiagnosticInfoProtoDiagnosticInfoReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 64) |= 2u;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_55;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_57;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_55:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_57:
        *(void *)(a1 + 16) = v20;
        goto LABEL_69;
      case 2u:
        char v26 = objc_alloc_init(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo);
        objc_storeStrong((id *)(a1 + 24), v26);
        if (!PBReaderPlaceMark()
          || (HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfoReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_71;
        }
        goto LABEL_53;
      case 3u:
        char v26 = objc_alloc_init(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo);
        objc_storeStrong((id *)(a1 + 56), v26);
        if (!PBReaderPlaceMark()
          || (HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfoReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_71;
        }
        goto LABEL_53;
      case 4u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v29 = 0;
        *(unsigned char *)(a1 + 64) |= 4u;
        while (2)
        {
          uint64_t v30 = *v3;
          uint64_t v31 = *(void *)(a2 + v30);
          unint64_t v32 = v31 + 1;
          if (v31 == -1 || v32 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
            *(void *)(a2 + v30) = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if (v33 < 0)
            {
              v27 += 7;
              BOOL v15 = v28++ >= 9;
              if (v15)
              {
                LODWORD(v29) = 0;
                goto LABEL_61;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v29) = 0;
        }
LABEL_61:
        uint64_t v43 = 32;
        goto LABEL_66;
      case 5u:
        char v34 = 0;
        unsigned int v35 = 0;
        uint64_t v29 = 0;
        *(unsigned char *)(a1 + 64) |= 8u;
        while (2)
        {
          uint64_t v36 = *v3;
          uint64_t v37 = *(void *)(a2 + v36);
          unint64_t v38 = v37 + 1;
          if (v37 == -1 || v38 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v39 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
            *(void *)(a2 + v36) = v38;
            v29 |= (unint64_t)(v39 & 0x7F) << v34;
            if (v39 < 0)
            {
              v34 += 7;
              BOOL v15 = v35++ >= 9;
              if (v15)
              {
                LODWORD(v29) = 0;
                goto LABEL_65;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v29) = 0;
        }
LABEL_65:
        uint64_t v43 = 48;
LABEL_66:
        *(_DWORD *)(a1 + v43) = v29;
        goto LABEL_69;
      case 6u:
        *(unsigned char *)(a1 + 64) |= 1u;
        uint64_t v40 = *v3;
        unint64_t v41 = *(void *)(a2 + v40);
        if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v42 = *(void *)(*(void *)(a2 + *v7) + v41);
          *(void *)(a2 + v40) = v41 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v42 = 0;
        }
        *(void *)(a1 + 8) = v42;
        goto LABEL_69;
      case 7u:
        char v26 = objc_alloc_init(HMAccessoryDiagnosticInfoProtoSetupInfo);
        objc_storeStrong((id *)(a1 + 40), v26);
        if (PBReaderPlaceMark()
          && (HMAccessoryDiagnosticInfoProtoSetupInfoReadFrom((uint64_t)v26, a2) & 1) != 0)
        {
LABEL_53:
          PBReaderRecallMark();

LABEL_69:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_71:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_69;
    }
  }
}

void sub_19D21AC7C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D21AE88(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D21B22C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMAudioAnalysisEventBulletinEventProtoValueEventReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent);
        [a1 addEvents:v17];
        if (!PBReaderPlaceMark()
          || (HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEventReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

__CFString *HMLightProfileSupportedFeaturesAsString(unint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a1)
  {
    uint64_t v3 = 1;
    unint64_t v4 = a1;
    do
    {
      if ((v3 & a1) != 0)
      {
        if (v3 == 2)
        {
          v4 &= ~2uLL;
        }
        else if (v3 == 1)
        {
          v4 &= ~1uLL;
          [v2 addObject:@"natural-lighting"];
        }
      }
      v3 *= 2;
    }
    while (v3 - 1 < a1);
    if (v4)
    {
      int v5 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown supported features: %lu", a1);
      [v2 addObject:v5];
    }
  }
  if ([v2 count])
  {
    uint64_t v6 = [v2 componentsJoinedByString:@", "];
  }
  else
  {
    uint64_t v6 = @"none";
  }

  return v6;
}

__CFString *HMSettingVersionValueTypeAsString(uint64_t a1)
{
  if (a1 == 1)
  {
    id v1 = @"HMSettingReadVersionValue";
  }
  else if (a1 == 2)
  {
    id v1 = @"HMSettingWriteVersionValue";
  }
  else
  {
    id v2 = NSString;
    uint64_t v3 = [NSNumber numberWithInteger:a1];
    id v1 = [v2 stringWithFormat:@"Unknown type (%@)", v3];
  }

  return v1;
}

uint64_t HMImmutableSettingsProtoAvailableLanguageListEventReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(HMImmutableSettingsProtoLanguageValueEvent);
        [a1 addLanguages:v17];
        if (!PBReaderPlaceMark() || !HMImmutableSettingsProtoLanguageValueEventReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id HMImmutableSettingValueTypeAsString(unint64_t a1)
{
  if (a1 >= 6)
  {
    id v2 = NSString;
    uint64_t v3 = [NSNumber numberWithInteger:a1];
    id v1 = [v2 stringWithFormat:@"UnknownType(%@)", v3];
  }
  else
  {
    id v1 = *(&off_1E593E728 + a1);
  }

  return v1;
}

uint64_t HMAccessoryInfoProtoPrimaryUserInfoEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v19 += 7;
          BOOL v14 = v20++ >= 9;
          if (v14)
          {
            LODWORD(v21) = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_33:
        *(_DWORD *)(a1 + 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        char v18 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D221554(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2216F8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D221B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t IDSFoundationLibraryCore()
{
  if (!IDSFoundationLibraryCore_frameworkLibrary) {
    IDSFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return IDSFoundationLibraryCore_frameworkLibrary;
}

Class __getIDSDestinationClass_block_invoke(uint64_t a1)
{
  if (!IDSFoundationLibraryCore())
  {
    uint64_t v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("IDSDestination");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getIDSDestinationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)__IDSFoundationLibraryCore_block_invoke();
  }
  return result;
}

uint64_t __IDSFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IDSFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __IDSLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IDSLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t HMAccessoryInfoProtoNetworkServiceEventReadFrom(unsigned char *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_40;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_40;
        case 3u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          a1[84] |= 1u;
          break;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_40;
        case 5u:
          char v26 = PBReaderReadString();
          if (v26) {
            [a1 addIpv4Addresses:v26];
          }
          goto LABEL_37;
        case 6u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 48;
          goto LABEL_40;
        case 7u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 64;
          goto LABEL_40;
        case 8u:
          char v26 = PBReaderReadString();
          if (v26) {
            [a1 addIpv6Addresses:v26];
          }
LABEL_37:

          continue;
        case 9u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 56;
          goto LABEL_40;
        case 0xAu:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 72;
LABEL_40:
          char v27 = *(void **)&a1[v18];
          *(void *)&a1[v18] = v17;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v23 = *v3;
        unint64_t v24 = *(void *)(a2 + v23);
        if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
        *(void *)(a2 + v23) = v24 + 1;
        v22 |= (unint64_t)(v25 & 0x7F) << v20;
        if ((v25 & 0x80) == 0) {
          goto LABEL_44;
        }
        v20 += 7;
        BOOL v14 = v21++ >= 9;
        if (v14)
        {
          uint64_t v22 = 0;
          goto LABEL_46;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_44:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v22 = 0;
      }
LABEL_46:
      a1[80] = v22 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

__CFString *HMMediaSystemRoleTypeAsString(uint64_t a1)
{
  if (a1 == 1)
  {
    id v2 = @"HMMediaSystemRoleTypeLeft";
  }
  else if (a1 == 2)
  {
    id v2 = @"HMMediaSystemRoleTypeRight";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMMediaSystemRoleType %tu", a1);
    id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

void sub_19D224220(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D224C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HMImmutableSettingsProtoBoolValueEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_31:
        *(unsigned char *)(a1 + _Block_object_dispose(&a9, 8) = v19 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D228C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_unfair_lock_t lock)
{
}

void sub_19D228F44(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D22947C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D229678(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2299AC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D229AF8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMMediaDestinationSupportOptionsAsString(unint64_t a1)
{
  if (a1)
  {
    id v2 = @"HT ";
    uint64_t v3 = &stru_1EEE9DD88;
    if ((a1 & 1) == 0) {
      id v2 = &stru_1EEE9DD88;
    }
    unint64_t v4 = v2;
    int v5 = @"AG ";
    if ((a1 & 8) == 0) {
      int v5 = &stru_1EEE9DD88;
    }
    uint64_t v6 = v5;
    id v7 = @"MHT ";
    if ((a1 & 4) == 0) {
      id v7 = &stru_1EEE9DD88;
    }
    char v8 = v7;
    unsigned int v9 = @"HT+ ";
    if ((a1 & 0x40) == 0) {
      unsigned int v9 = &stru_1EEE9DD88;
    }
    unint64_t v10 = v9;
    uint64_t v11 = @"MS+ ";
    if ((a1 & 0x80) == 0) {
      uint64_t v11 = &stru_1EEE9DD88;
    }
    unint64_t v12 = v11;
    char v13 = @"MS ";
    if ((a1 & 0x10) == 0) {
      char v13 = &stru_1EEE9DD88;
    }
    BOOL v14 = v13;
    int v15 = @"MMS ";
    if ((a1 & 0x20) == 0) {
      int v15 = &stru_1EEE9DD88;
    }
    int v16 = v15;
    if (a1 >= 0x100)
    {
      char v17 = NSString;
      unsigned int v18 = [NSNumber numberWithUnsignedInteger:a1];
      uint64_t v3 = [v17 stringWithFormat:@"unknown(%@)", v18];
    }
    uint64_t v19 = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@", v4, v6, v8, v14, v16, v10, v12, v3];
  }
  else
  {
    uint64_t v19 = @"None";
  }

  return v19;
}

__CFString *HMMediaDestinationTypeAsString(unint64_t a1)
{
  if (a1 >= 5)
  {
    id v2 = NSString;
    uint64_t v3 = [NSNumber numberWithInteger:a1];
    uint64_t v1 = [v2 stringWithFormat:@"Unknown type %@", v3];
  }
  else
  {
    uint64_t v1 = off_1E593E8C8[a1];
  }

  return v1;
}

void sub_19D231690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL HMMediaGroupProtoMediaSystemRolesReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&a9, 8) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D233B70(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL HMDurationsApproximatelyEqual(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 0.001;
}

__CFString *HMResidentDeviceStatusDescription(unint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a1)
  {
    uint64_t v3 = 1;
    unint64_t v4 = a1;
    do
    {
      if ((v3 & a1) != 0)
      {
        uint64_t v5 = v3 - 1;
        if (unint64_t)(v3 - 1) <= 7 && ((0x8Bu >> v5))
        {
          [v2 addObject:off_1E593E9E0[v5]];
          v4 &= ~v3;
        }
      }
      v3 *= 2;
    }
    while (v3 - 1 < a1);
    if (v4)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown device status: %lu", v4);
      [v2 addObject:v6];
    }
  }
  if ([v2 count])
  {
    id v7 = [v2 componentsJoinedByString:@", "];
  }
  else
  {
    id v7 = @"none";
  }

  return v7;
}

__CFString *HMResidentDeviceCapabilitiesDescription(unint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!a1) {
    goto LABEL_82;
  }
  uint64_t v3 = 1;
  unint64_t v4 = a1;
  do
  {
    if ((v3 & a1) == 0) {
      goto LABEL_79;
    }
    if (v3 >= 0x10000)
    {
      if (v3 > 0xFFFFFF)
      {
        if (v3 > 0xFFFFFFF)
        {
          if (v3 > 0x3FFFFFFF)
          {
            if (v3 == 0x40000000)
            {
              uint64_t v5 = @"restricted-guest";
            }
            else
            {
              if (v3 != 0x80000000) {
                goto LABEL_79;
              }
              uint64_t v5 = @"matter-owner-cert-fetch";
            }
          }
          else if (v3 == 0x10000000)
          {
            uint64_t v5 = @"matterTTU";
          }
          else
          {
            if (v3 != 0x20000000) {
              goto LABEL_79;
            }
            uint64_t v5 = @"UWB";
          }
        }
        else if (v3 > 0x3FFFFFF)
        {
          if (v3 == 0x4000000)
          {
            uint64_t v5 = @"matter-shared-admin-pairing";
          }
          else
          {
            if (v3 != 0x8000000) {
              goto LABEL_79;
            }
            uint64_t v5 = @"event-log";
          }
        }
        else if (v3 == 0x1000000)
        {
          uint64_t v5 = @"custom media destination";
        }
        else
        {
          if (v3 != 0x2000000) {
            goto LABEL_79;
          }
          uint64_t v5 = @"thread-network-credential-sharing";
        }
      }
      else if (v3 >= 0x100000)
      {
        if (v3 >= 0x400000)
        {
          if (v3 == 0x400000)
          {
            uint64_t v5 = @"chip";
          }
          else
          {
            if (v3 != 0x800000) {
              goto LABEL_79;
            }
            uint64_t v5 = @"resident-firmware-update";
          }
        }
        else if (v3 == 0x100000)
        {
          uint64_t v5 = @"camera-package-detection";
        }
        else
        {
          if (v3 != 0x200000) {
            goto LABEL_79;
          }
          uint64_t v5 = @"access-codes";
        }
      }
      else if (v3 >= 0x40000)
      {
        if (v3 == 0x40000)
        {
          uint64_t v5 = @"wallet-key";
        }
        else
        {
          if (v3 != 0x80000) {
            goto LABEL_79;
          }
          uint64_t v5 = @"lock-notification-context";
        }
      }
      else if (v3 == 0x10000)
      {
        uint64_t v5 = @"thread-border-router";
      }
      else
      {
        if (v3 != 0x20000) {
          goto LABEL_79;
        }
        uint64_t v5 = @"camera-recording-reachability-notifications";
      }
      goto LABEL_78;
    }
    if (v3 > 255)
    {
      if (v3 > 4095)
      {
        if (v3 >= 0x4000)
        {
          if (v3 == 0x4000)
          {
            uint64_t v5 = @"natural-lighting";
          }
          else
          {
            if (v3 != 0x8000) {
              goto LABEL_79;
            }
            uint64_t v5 = @"announce";
          }
        }
        else if (v3 == 4096)
        {
          uint64_t v5 = @"camera-activity-zones";
        }
        else
        {
          if (v3 != 0x2000) {
            goto LABEL_79;
          }
          uint64_t v5 = @"face-classification";
        }
      }
      else if (v3 > 1023)
      {
        if (v3 == 1024)
        {
          uint64_t v5 = @"camera-significant-event-notifications";
        }
        else
        {
          if (v3 != 2048) {
            goto LABEL_79;
          }
          uint64_t v5 = @"firmware-update";
        }
      }
      else if (v3 == 256)
      {
        uint64_t v5 = @"shortcut-actions";
      }
      else
      {
        if (v3 != 512) {
          goto LABEL_79;
        }
        uint64_t v5 = @"media-actions";
      }
      goto LABEL_78;
    }
    if (v3 > 15)
    {
      if (v3 > 63)
      {
        if (v3 == 64)
        {
          uint64_t v5 = @"camera-recording";
        }
        else
        {
          if (v3 != 128) {
            goto LABEL_79;
          }
          uint64_t v5 = @"router-management";
        }
      }
      else if (v3 == 16)
      {
        uint64_t v5 = @"media-system";
      }
      else
      {
        if (v3 != 32) {
          goto LABEL_79;
        }
        uint64_t v5 = @"media-actions-internal-build";
      }
LABEL_78:
      v4 &= ~v3;
      [v2 addObject:v5];
      goto LABEL_79;
    }
    uint64_t v5 = @"triggers";
    switch(v3)
    {
      case 1:
        goto LABEL_78;
      case 2:
        uint64_t v5 = @"administrators";
        goto LABEL_78;
      case 4:
        uint64_t v5 = @"remote-access-restrictions";
        goto LABEL_78;
      case 8:
        uint64_t v5 = @"shared-event-trigger-activation";
        goto LABEL_78;
      default:
        break;
    }
LABEL_79:
    v3 *= 2;
  }
  while (v3 - 1 < a1);
  if (v4)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown capabilities: %lu", v4);
    [v2 addObject:v6];
  }
LABEL_82:
  if ([v2 count])
  {
    id v7 = [v2 componentsJoinedByString:@", "];
  }
  else
  {
    id v7 = @"none";
  }

  return v7;
}

void sub_19D237564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D2377C4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D237E04(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMIsValidSignificantEvent(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"sunrise"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"sunset"];
  }

  return v2;
}

BOOL HMIsValidSignificantEventOffset(void *a1)
{
  id v1 = a1;
  BOOL v2 = ([v1 hour] != 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v1, "minute") != 0x7FFFFFFFFFFFFFFFLL)
    && [v1 era] == 0x7FFFFFFFFFFFFFFFLL
    && [v1 year] == 0x7FFFFFFFFFFFFFFFLL
    && [v1 month] == 0x7FFFFFFFFFFFFFFFLL
    && [v1 day] == 0x7FFFFFFFFFFFFFFFLL
    && [v1 weekday] == 0x7FFFFFFFFFFFFFFFLL
    && [v1 weekdayOrdinal] == 0x7FFFFFFFFFFFFFFFLL
    && [v1 quarter] == 0x7FFFFFFFFFFFFFFFLL
    && [v1 weekOfMonth] == 0x7FFFFFFFFFFFFFFFLL
    && [v1 weekOfYear] == 0x7FFFFFFFFFFFFFFFLL
    && [v1 yearForWeekOfYear] == 0x7FFFFFFFFFFFFFFFLL;

  return v2;
}

void sub_19D23BC08(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMMediaDestinationControllerUpateOptionsAsString(uint64_t a1)
{
  if (a1)
  {
    char v1 = a1;
    BOOL v2 = &stru_1EEE9DD88;
    if (a1)
    {
      BOOL v2 = [NSString stringWithFormat:@"%@ %@", &stru_1EEE9DD88, @"Unavailable"];
    }
    if ((v1 & 2) != 0)
    {
      uint64_t v3 = [NSString stringWithFormat:@"%@ %@", v2, @"Unconfigured"];

      BOOL v2 = (__CFString *)v3;
    }
  }
  else
  {
    BOOL v2 = @"No Options";
  }

  return v2;
}

uint64_t HMPBNaturalLightingActionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
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
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 8;
      }
      else
      {
        if (v17 == 2)
        {
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 28) |= 1u;
          while (1)
          {
            uint64_t v24 = *v3;
            unint64_t v25 = *(void *)(a2 + v24);
            if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if ((v26 & 0x80) == 0) {
              goto LABEL_34;
            }
            v21 += 7;
            BOOL v14 = v22++ >= 9;
            if (v14)
            {
              uint64_t v23 = 0;
              goto LABEL_36;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v23 = 0;
          }
LABEL_36:
          *(unsigned char *)(a1 + 24) = v23 != 0;
          continue;
        }
        if (v17 != 1)
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
        }
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 16;
      }
      uint64_t v20 = *(void **)(a1 + v19);
      *(void *)(a1 + v19) = v18;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D23E4FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D23E9BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HMEventTriggerActivationStateAsString(unint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMEventTriggerActivationState %tu", a1);
    char v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v1 = off_1E593EAA8[a1];
  }

  return v1;
}

BOOL HMPBAccessoryReferenceReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        unint64_t v17 = objc_alloc_init(HMPBHomeReference);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (HMPBHomeReferenceReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadData();
    unint64_t v17 = *(HMPBHomeReference **)(a1 + 16);
    *(void *)(a1 + 16) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id HMImmutableSettingChangeEventTopicFromComponentsLegacy(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F654E8];
  unint64_t v4 = [NSString stringWithFormat:@"%@.%@.settings.%@.updated", a1, a2, a3];
  uint64_t v5 = objc_msgSend(v3, "hmf_cachedInstanceForString:", v4);

  return v5;
}

id HMImmutableSettingChangeEventTopicFromComponentsHH2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F654E8];
  unint64_t v4 = [NSString stringWithFormat:@"home.%@.accessory.%@.settings.%@.updated", a1, a2, a3];
  uint64_t v5 = objc_msgSend(v3, "hmf_cachedInstanceForString:", v4);

  return v5;
}

uint64_t HMImmutableSettingChangeEventComponentsFromTopic(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = [a1 componentsSeparatedByString:@"."];
  if ((unint64_t)[v7 count] >= 5)
  {
    char v8 = [v7 objectAtIndexedSubscript:2];
    if ([v8 isEqualToString:@"settings"])
    {
      unsigned int v9 = [v7 lastObject];
      int v10 = [v9 isEqualToString:@"updated"];

      if (v10)
      {
        id v11 = objc_alloc(MEMORY[0x1E4F29128]);
        unint64_t v12 = [v7 objectAtIndexedSubscript:0];
        char v13 = (void *)[v11 initWithUUIDString:v12];

        id v14 = objc_alloc(MEMORY[0x1E4F29128]);
        int v15 = [v7 objectAtIndexedSubscript:1];
        int v16 = (void *)[v14 initWithUUIDString:v15];

        uint64_t v17 = [v7 count] - 4;
        uint64_t v18 = v7;
        uint64_t v19 = 3;
        goto LABEL_5;
      }
    }
    else
    {
    }
  }
  if ((unint64_t)[v7 count] < 7)
  {
    uint64_t v23 = 0;
  }
  else
  {
    char v13 = [v7 objectAtIndexedSubscript:0];
    if (![v13 isEqualToString:@"home"])
    {
      uint64_t v23 = 0;
LABEL_29:

      goto LABEL_30;
    }
    int v16 = [v7 objectAtIndexedSubscript:2];
    if (![v16 isEqualToString:@"accessory"])
    {
      uint64_t v23 = 0;
LABEL_28:

      goto LABEL_29;
    }
    uint64_t v20 = [v7 objectAtIndexedSubscript:4];
    if (![v20 isEqualToString:@"settings"])
    {
      uint64_t v23 = 0;
LABEL_27:

      goto LABEL_28;
    }
    uint64_t v24 = [v7 lastObject];
    uint64_t v23 = [v24 isEqualToString:@"updated"];

    if (v23)
    {
      id v25 = objc_alloc(MEMORY[0x1E4F29128]);
      char v26 = [v7 objectAtIndexedSubscript:1];
      char v13 = (void *)[v25 initWithUUIDString:v26];

      id v27 = objc_alloc(MEMORY[0x1E4F29128]);
      unsigned int v28 = [v7 objectAtIndexedSubscript:3];
      int v16 = (void *)[v27 initWithUUIDString:v28];

      uint64_t v17 = [v7 count] - 6;
      uint64_t v18 = v7;
      uint64_t v19 = 5;
LABEL_5:
      uint64_t v20 = objc_msgSend(v18, "subarrayWithRange:", v19, v17);
      uint64_t v21 = [v20 componentsJoinedByString:@"."];
      id v22 = (id)v21;
      uint64_t v23 = 0;
      if (v13 && v16 && v21)
      {
        if (a2) {
          *a2 = v13;
        }
        if (a3) {
          *a3 = v16;
        }
        if (a4)
        {
          id v22 = v22;
          *a4 = v22;
        }
        uint64_t v23 = 1;
      }

      goto LABEL_27;
    }
  }
LABEL_30:

  return v23;
}

BOOL HMImmutableSettingChangeEventComponentsFromMediaSystemTopic(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = +[HMEventTopicHelper decodeTopic:a1];
  char v8 = [v7 asMediaSystemSettingTopic];
  unsigned int v9 = v8;
  if (v8)
  {
    *a2 = [v8 homeUUID];
    *a3 = [v9 mediaSystemUUID];
    *a4 = [v9 mediaSystemSettingKeyPath];
  }

  return v9 != 0;
}

uint64_t HMImmutableSettingChangeEventTopicFromMediaSystem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [NSString stringWithFormat:@"home.%@.mediagroup.stereo.%@.settings.%@.updated", a1, a2, a3];
}

void sub_19D2426B0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMHomeAddWalletKeyOptionsDescription(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a1 >= 1)
  {
    uint64_t v3 = 1;
    uint64_t v4 = a1;
    while (1)
    {
      if ((v3 & a1) == 0) {
        goto LABEL_11;
      }
      switch(v3)
      {
        case 1:
          uint64_t v5 = @"suppress-wallet-notification";
          break;
        case 4:
          uint64_t v5 = @"enable-UWB";
          break;
        case 2:
          uint64_t v5 = @"enable-express";
          break;
        default:
          goto LABEL_11;
      }
      v4 &= ~v3;
      [v2 addObject:v5];
LABEL_11:
      v3 *= 2;
      if (v3 > a1 || !v3)
      {
        if (v4) {
          goto LABEL_14;
        }
        goto LABEL_15;
      }
    }
  }
  uint64_t v4 = a1;
  if (a1)
  {
LABEL_14:
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown options: %lu", v4);
    [v2 addObject:v6];
  }
LABEL_15:
  if ([v2 count])
  {
    id v7 = [v2 componentsJoinedByString:@", "];
  }
  else
  {
    id v7 = @"none";
  }

  return v7;
}

void sub_19D24A8EC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D24AB58(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D24E258(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMStringFromCameraClipQuality(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      id v2 = @"Timelapse";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown quality: %ld", a1);
      id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v2 = @"Full";
  }
  return v2;
}

void sub_19D256D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D2572DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D2579D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D2581B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D2589F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D2599EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D259C90(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D259DC4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D25A0DC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D25A1C8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D25A24C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D25A3F0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D25A480(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D25A510(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D25A58C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMSetupAccessoryProgressAsString(unint64_t a1)
{
  if (a1 >= 0x33)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown progress state: %lu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E593EED0[a1];
  }

  return v1;
}

BOOL HMPBActionSetReadFrom(char *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
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
      if (v9++ >= 9)
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
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
        goto LABEL_28;
      case 2u:
        uint64_t v19 = objc_alloc_init(HMPBActionContainer);
        [a1 addActions:v19];
        if PBReaderPlaceMark() && (HMPBActionContainerReadFrom((uint64_t)v19, a2))
        {
          PBReaderRecallMark();
LABEL_29:

LABEL_30:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 3u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
        goto LABEL_28;
      case 4u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 40;
        goto LABEL_28;
      case 5u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 24;
LABEL_28:
        uint64_t v19 = *(HMPBActionContainer **)&a1[v18];
        *(void *)&a1[v18] = v17;
        goto LABEL_29;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_30;
    }
  }
}

uint64_t HMMediaGroupProtoMediaDestinationControllerDataReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_24;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_24;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
LABEL_24:
          uint64_t v20 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose(&a9, 8) = v17;

          continue;
        case 4u:
          uint64_t v21 = PBReaderReadString();
          if (v21) {
            [(id)a1 addAvailableDestinations:v21];
          }

          continue;
        case 5u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          *(unsigned char *)(a1 + 48) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v25 = *v3;
        unint64_t v26 = *(void *)(a2 + v25);
        if (v26 == -1 || v26 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
        *(void *)(a2 + v25) = v26 + 1;
        v24 |= (unint64_t)(v27 & 0x7F) << v22;
        if ((v27 & 0x80) == 0) {
          goto LABEL_36;
        }
        v22 += 7;
        BOOL v14 = v23++ >= 9;
        if (v14)
        {
          uint64_t v24 = 0;
          goto LABEL_38;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_36:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v24 = 0;
      }
LABEL_38:
      *(void *)(a1 + _Block_object_dispose(&a9, 8) = v24;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

__CFString *HMPresenceEventTypeAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMPresenceEventType %tu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E593F170[a1 - 1];
  }

  return v1;
}

__CFString *HMPresenceEventUserTypeAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMPresenceEventUserType %tu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E593F190[a1 - 1];
  }

  return v1;
}

uint64_t eventTypeForPresenceTypeAndGranularity(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (([v3 isEqualToString:@"HMPresenceTypeCurrentUserAtHome"] & 1) != 0
    || ([v3 isEqualToString:@"HMPresenceTypeAnyUserAtHome"] & 1) != 0
    || [v3 isEqualToString:@"HMPresenceTypeUsersAtHome"])
  {
    if (a2 == 1) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 3;
    }
  }
  else if (([v3 isEqualToString:@"HMPresenceTypeCurrentUserNotAtHome"] & 1) != 0 {
         || ([v3 isEqualToString:@"HMPresenceTypeNoUserAtHome"] & 1) != 0
  }
         || [v3 isEqualToString:@"HMPresenceTypeUsersNotAtHome"])
  {
    if (a2 == 1) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 4;
    }
  }
  else
  {
    uint64_t v4 = kInvalidHMPresenceEventType;
  }

  return v4;
}

uint64_t userTypeForPresenceTypeAndGranularity(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"HMPresenceTypeCurrentUserAtHome"] & 1) != 0
    || ([v1 isEqualToString:@"HMPresenceTypeCurrentUserNotAtHome"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else if (([v1 isEqualToString:@"HMPresenceTypeAnyUserAtHome"] & 1) != 0 {
         || ([v1 isEqualToString:@"HMPresenceTypeNoUserAtHome"] & 1) != 0)
  }
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"HMPresenceTypeUsersAtHome"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"HMPresenceTypeUsersNotAtHome"])
  {
    uint64_t v2 = 3;
  }
  else
  {
    uint64_t v2 = kInvalidHMPresenceEventUserType;
  }

  return v2;
}

__CFString *presenceTypeForEventTypeAndGranularity(uint64_t a1, uint64_t a2)
{
  switch(a1)
  {
    case 1:
    case 3:
      uint64_t v3 = a2 - 1;
      if ((unint64_t)(a2 - 1) >= 3) {
        goto LABEL_9;
      }
      uint64_t v4 = &off_1E593F1A8;
      goto LABEL_6;
    case 2:
    case 4:
      uint64_t v3 = a2 - 1;
      if ((unint64_t)(a2 - 1) >= 3) {
        goto LABEL_9;
      }
      uint64_t v4 = &off_1E593F1C0;
LABEL_6:
      uint64_t v5 = *v4[v3];
      break;
    default:
LABEL_9:
      uint64_t v5 = 0;
      break;
  }
  return v5;
}

uint64_t granularityForEventType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 4) {
    id v1 = (char *)&kInvalidHMPresenceEventActivationGranularity;
  }
  else {
    id v1 = (char *)&unk_19D47B950 + 8 * a1 - 8;
  }
  return *(void *)v1;
}

uint64_t HMAccessoryInfoProtoAccountInfoEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_24;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_24;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
LABEL_24:
          uint64_t v20 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose(&a9, 8) = v17;

          continue;
        case 4u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
        *(void *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0) {
          goto LABEL_33;
        }
        v21 += 7;
        BOOL v14 = v22++ >= 9;
        if (v14)
        {
          uint64_t v23 = 0;
          goto LABEL_35;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v23 = 0;
      }
LABEL_35:
      *(unsigned char *)(a1 + 32) = v23 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id _HMErrorFromOSStatus(uint64_t a1)
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v2 = (void (*)(uint64_t))getHMErrorFromOSStatusSymbolLoc_ptr;
  unint64_t v10 = getHMErrorFromOSStatusSymbolLoc_ptr;
  if (!getHMErrorFromOSStatusSymbolLoc_ptr)
  {
    uint64_t v3 = (void *)CoreHAPLibrary();
    v8[3] = (uint64_t)dlsym(v3, "HMErrorFromOSStatus");
    getHMErrorFromOSStatusSymbolLoc_ptr = (_UNKNOWN *)v8[3];
    uint64_t v2 = (void (*)(uint64_t))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    dlerror();
    uint64_t v6 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  uint64_t v4 = v2(a1);

  return v4;
}

void *__getHMErrorFromOSStatusSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreHAPLibrary();
  uint64_t result = dlsym(v2, "HMErrorFromOSStatus");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHMErrorFromOSStatusSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreHAPLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreHAPLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __CoreHAPLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E593F1D8;
    uint64_t v5 = 0;
    CoreHAPLibraryCore_frameworkLibrary = _sl_dlopen();
    id v1 = (void *)v3[0];
    uint64_t v0 = CoreHAPLibraryCore_frameworkLibrary;
    if (CoreHAPLibraryCore_frameworkLibrary)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      id v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return CoreHAPLibraryCore_frameworkLibrary;
}

uint64_t __CoreHAPLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreHAPLibraryCore_frameworkLibrary = result;
  return result;
}

id getHAPTLVUnsignedNumberValueClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getHAPTLVUnsignedNumberValueClass_softClass;
  uint64_t v7 = getHAPTLVUnsignedNumberValueClass_softClass;
  if (!getHAPTLVUnsignedNumberValueClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getHAPTLVUnsignedNumberValueClass_block_invoke;
    v3[3] = &unk_1E5943DD8;
    v3[4] = &v4;
    __getHAPTLVUnsignedNumberValueClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_19D266AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

HMNetworkRouterWANStatus *__getHAPTLVUnsignedNumberValueClass_block_invoke(uint64_t a1)
{
  CoreHAPLibrary();
  uint64_t result = (HMNetworkRouterWANStatus *)objc_getClass("HAPTLVUnsignedNumberValue");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHAPTLVUnsignedNumberValueClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (HMNetworkRouterWANStatus *)abort_report_np();
    return [(HMNetworkRouterWANStatus *)v3 initWithIdentifier:v5 status:v6];
  }
  return result;
}

void sub_19D267DA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D2683D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D268D08(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D26A32C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
}

void sub_19D26AC78(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D26B048(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D26B110(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D26BAC0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D26BB50(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D26BBE0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D26BC70(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D26EC08(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D270308(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D27043C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMImmutableSettingsProtoBoolSettingEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  SEL v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(HMImmutableSettingsProtoBoolValueEvent);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark()
          || (HMImmutableSettingsProtoBoolValueEventReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D271A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D271D88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D272708(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
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

void sub_19D273248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D2735E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D2741B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D2745B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _PreorderTraverseGroupsWithBlock(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  v6[2](v6, v5, a2);
  uint64_t v7 = [v5 groups];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___PreorderTraverseGroupsWithBlock_block_invoke;
  v10[3] = &unk_1E593F610;
  id v11 = v5;
  id v12 = v6;
  char v8 = v6;
  id v9 = v5;
  objc_msgSend(v7, "na_each:", v10);
}

void sub_19D274E1C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D274FC8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D275030(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D275110(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2752D8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D275340(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D275478(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMCameraAudioStreamSettingAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown audio stream setting %tu", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E593F680[a1 - 1];
  }

  return v1;
}

void sub_19D2781F0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D278E2C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D279350(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D279874(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D279D98(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D27A3D8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D27AA18(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D27AEE4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D281BC0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D281D3C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id HMDaysOfTheWeekToString(char a1)
{
  uint64_t v2 = (void *)[@"<" mutableCopy];
  if (a1)
  {
    appendDayToString(@"Sun", v2);
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  appendDayToString(@"Mon", v2);
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  appendDayToString(@"Tue", v2);
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  appendDayToString(@"Wed", v2);
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  appendDayToString(@"Thu", v2);
  if ((a1 & 0x20) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  appendDayToString(@"Fri", v2);
  if ((a1 & 0x40) != 0) {
LABEL_8:
  }
    appendDayToString(@"Sat", v2);
LABEL_9:
  [v2 appendString:@">"];
  uint64_t v3 = (void *)[v2 copy];

  return v3;
}

void appendDayToString(void *a1, void *a2)
{
  id v4 = a1;
  id v3 = a2;
  if ((unint64_t)[v3 length] >= 2) {
    [v3 appendString:@", "];
  }
  [v3 appendString:v4];
}

id HMDaysOfTheWeekToConciseString(char a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28E78] stringWithCapacity:objc_msgSend(@"<SuMTuWThFSa>", "length")];
  [v2 appendString:@"<"];
  if (a1)
  {
    [v2 appendString:@"Su"];
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v2 appendString:@"M"];
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v2 appendString:@"Tu"];
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v2 appendString:@"W"];
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v2 appendString:@"Th"];
  if ((a1 & 0x20) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  [v2 appendString:@"F"];
  if ((a1 & 0x40) != 0) {
LABEL_8:
  }
    [v2 appendString:@"Sa"];
LABEL_9:
  [v2 appendString:@">"];
  id v3 = (void *)[v2 copy];

  return v3;
}

uint64_t HMDaysOfTheWeekForWeekday(char a1)
{
  return 1 << (a1 - 1);
}

id HMDaysOfTheWeekToDateComponents(int a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:7];
  for (uint64_t i = 1; i != 8; ++i)
  {
    if (((1 << (i - 1)) & a1) != 0)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      [v4 setWeekday:i];
      [v2 addObject:v4];
    }
  }
  id v5 = (void *)[v2 copy];

  return v5;
}

uint64_t HMDaysOfTheWeekFromDateComponents(void *a1, BOOL *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v17 = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v4 = a2 != 0;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v3);
        }
        unint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = [v10 calendar];
        id v12 = v11;
        BOOL v4 = (!v11 || ([v11 maximumRangeOfUnit:512] == 1 ? (v14 = v13 == 7) : (v14 = 0), v14))
          && (uint64_t v15 = [v10 weekday], (unint64_t)(v15 - 8) >= 0xFFFFFFFFFFFFFFF9)
          && (v7 |= (1 << (v15 - 1)), v4)
          && [v10 era] == 0x7FFFFFFFFFFFFFFFLL
          && [v10 year] == 0x7FFFFFFFFFFFFFFFLL
          && [v10 month] == 0x7FFFFFFFFFFFFFFFLL
          && [v10 day] == 0x7FFFFFFFFFFFFFFFLL
          && [v10 hour] == 0x7FFFFFFFFFFFFFFFLL
          && [v10 minute] == 0x7FFFFFFFFFFFFFFFLL
          && [v10 second] == 0x7FFFFFFFFFFFFFFFLL
          && [v10 nanosecond] == 0x7FFFFFFFFFFFFFFFLL
          && [v10 weekdayOrdinal] == 0x7FFFFFFFFFFFFFFFLL
          && [v10 quarter] == 0x7FFFFFFFFFFFFFFFLL
          && [v10 weekOfMonth] == 0x7FFFFFFFFFFFFFFFLL
          && [v10 weekOfYear] == 0x7FFFFFFFFFFFFFFFLL
          && [v10 yearForWeekOfYear] == 0x7FFFFFFFFFFFFFFFLL;
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (v17) {
    BOOL *v17 = v4;
  }

  return v7;
}

void sub_19D28482C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D284990(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D284B04(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D284DF0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D284F98(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D285044(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2850BC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2858FC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D285F68(_Unwind_Exception *a1)
{
}

void sub_19D28618C(_Unwind_Exception *a1)
{
}

void sub_19D28738C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
}

uint64_t __Block_byref_object_copy__15485(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15486(uint64_t a1)
{
}

id HMSoftwareUpdateAssetSourceAsString(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __HMSoftwareUpdateAssetSourceAsString_block_invoke;
  void v4[3] = &__block_descriptor_40_e35_B32__0__NSString_8__NSNumber_16_B24l;
  v4[4] = a1;
  id v1 = [&unk_1EEF08268 keysOfEntriesPassingTest:v4];
  uint64_t v2 = [v1 anyObject];

  return v2;
}

void sub_19D287ED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL __HMSoftwareUpdateAssetSourceAsString_block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [a3 integerValue];
  if (v5 == v6) {
    *a4 = 1;
  }
  return v5 == v6;
}

void sub_19D2886E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D288D50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D289350(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL isValidHMSoftwareUpdateAssetSourceString(uint64_t a1)
{
  id v1 = [&unk_1EEF08268 objectForKeyedSubscript:a1];
  BOOL v2 = v1 != 0;

  return v2;
}

id validHMSoftwareUpdateAssetSourceStrings()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = objc_msgSend(&unk_1EEF08268, "allKeys", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v8 + 1) + 8 * i);
        if ([v0 length]) {
          [v0 appendString:@", "];
        }
        [v0 appendString:v6];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }

  return v0;
}

uint64_t stringToHMSoftwareUpdateAssetSource(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [&unk_1EEF08268 objectForKeyedSubscript:v1];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 unsignedIntValue];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v9 = 138543618;
      long long v10 = v7;
      __int16 v11 = 2112;
      id v12 = v1;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_ERROR, "%{public}@Invalid update asset source string %@", (uint8_t *)&v9, 0x16u);
    }
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_19D28C1AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D28C998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D28D1E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D28DE3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,char a21)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15818(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15819(uint64_t a1)
{
}

void sub_19D28E8FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D28F18C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_19D28F80C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D28F8F8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id _HMSignificantEventKeyPath(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"sunrise"]
    || [v1 isEqualToString:@"sunset"])
  {
    id v2 = v1;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is not a significant event", v1 format];
    id v2 = 0;
  }

  return v2;
}

__CFString *HMStringFromPersonFaceCropSource(unint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown source: %ld", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E593FB20[a1];
  }

  return v1;
}

__CFString *HMSoftwareUpdateNeedsAttentionReasonsToString(unint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a1)
  {
    uint64_t v3 = 1;
    unint64_t v4 = a1;
    do
    {
      if ((v3 & a1) != 0)
      {
        uint64_t v5 = v3 - 1;
        if (unint64_t)(v3 - 1) <= 7 && ((0x8Bu >> v5))
        {
          v4 &= ~v3;
          [v2 addObject:off_1E593FC90[v5]];
        }
      }
      v3 *= 2;
    }
    while (v3 - 1 < a1);
    if (v4)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown options %lu", v4);
      [v2 addObject:v6];
    }
  }
  if ([v2 count])
  {
    uint64_t v7 = [v2 componentsJoinedByString:@", "];
  }
  else
  {
    uint64_t v7 = @"None";
  }

  return v7;
}

void sub_19D2972FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D2975CC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D297B78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_19D297EF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D298518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_19D298888(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_19D298FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_19D299768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D299DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D299F50(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMSoftwareUpdateStateToString(unint64_t a1)
{
  if (a1 > 5) {
    return @"unknown";
  }
  else {
    return off_1E593FCE8[a1];
  }
}

__CFString *HMSoftwareUpdateUpdateTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"Unknown";
  }
  else {
    return off_1E593FCD0[a1 - 1];
  }
}

void sub_19D29AAF4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D29ABDC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D29AEAC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D29B158(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D29B1CC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D29B418(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D29B75C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id generateURLForHomeKitObject(void *a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [MEMORY[0x1E4F29088] componentsWithString:@"com.apple.Home://"];
  uint64_t v6 = [v3 queryName];
  [v5 setHost:v6];

  uint64_t v7 = [v3 uuidString];
  long long v8 = [@"/" stringByAppendingString:v7];
  [v5 setPath:v8];

  if ([v4 count])
  {
    char v26 = v5;
    id v28 = v3;
    int v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v27 = v4;
    obuint64_t j = v4;
    uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(obj);
          }
          BOOL v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v15 = [v14 queryName];
          int v16 = [v14 uuidString];
          uint64_t v17 = [v9 objectForKeyedSubscript:v15];

          if (v17)
          {
            long long v18 = NSString;
            long long v19 = [v9 objectForKeyedSubscript:v15];
            long long v20 = [v19 value];
            uint64_t v21 = [v18 stringWithFormat:@"%@,%@", v20, v16];

            int v16 = (void *)v21;
          }
          unsigned int v22 = [MEMORY[0x1E4F290C8] queryItemWithName:v15 value:v16];
          [v9 setObject:v22 forKeyedSubscript:v15];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v11);
    }

    uint64_t v23 = [v9 allValues];
    uint64_t v5 = v26;
    [v26 setQueryItems:v23];

    id v4 = v27;
    id v3 = v28;
  }
  uint64_t v24 = [v5 URL];

  return v24;
}

__CFString *playbackStateAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return @"Unknown";
  }
  else {
    return off_1E593FE20[a1 - 1];
  }
}

void appendToShortDescription(void *a1, void *a2, void *a3)
{
  id v7 = a1;
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (v5) {
      [v7 appendFormat:@"%@=", v5];
    }
    [v7 appendFormat:@"%@;", v6];
  }
}

BOOL HMPBCharacteristicReferenceReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(HMPBServiceReference);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || !HMPBServiceReferenceReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadData();
    uint64_t v17 = *(HMPBServiceReference **)(a1 + 16);
    *(void *)(a1 + 16) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D29E5BC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id resolveProfiles(void *a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __resolveProfiles_block_invoke;
  v7[3] = &unk_1E593FF50;
  id v8 = v3;
  id v4 = v3;
  id v5 = objc_msgSend(a1, "na_map:", v7);

  return v5;
}

id __resolveProfiles_block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uniqueIdentifier];
  id v4 = [v2 mediaProfileWithUUID:v3];

  return v4;
}

id getMPPlaybackArchiveClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getMPPlaybackArchiveClass_softClass;
  uint64_t v7 = getMPPlaybackArchiveClass_softClass;
  if (!getMPPlaybackArchiveClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getMPPlaybackArchiveClass_block_invoke;
    v3[3] = &unk_1E5943DD8;
    v3[4] = &v4;
    __getMPPlaybackArchiveClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_19D29EC90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMPPlaybackArchiveClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MediaPlayerLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    void v4[3] = __MediaPlayerLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E593FF70;
    uint64_t v6 = 0;
    MediaPlayerLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!MediaPlayerLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("MPPlaybackArchive");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  getMPPlaybackArchiveClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MediaPlayerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaPlayerLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_19D29FC04(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D29FE0C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D29FF04(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2A0544(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2A0C4C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2A2454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D2A6E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D2A76F4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2A7830(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMPBMediaPlaybackActionReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 8;
          goto LABEL_34;
        case 2u:
          long long v19 = PBReaderReadData();
          if (v19) {
            -[HMPBMediaPlaybackAction addMediaProfiles:](a1, v19);
          }

          continue;
        case 3u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 48) |= 1u;
          break;
        case 5u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 40;
          goto LABEL_34;
        case 6u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 32;
LABEL_34:
          id v27 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose(&a9, 8) = v17;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v23 = *v3;
        unint64_t v24 = *(void *)(a2 + v23);
        if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
        *(void *)(a2 + v23) = v24 + 1;
        v22 |= (unint64_t)(v25 & 0x7F) << v20;
        if ((v25 & 0x80) == 0) {
          goto LABEL_36;
        }
        v20 += 7;
        BOOL v14 = v21++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_38;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_36:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v22) = 0;
      }
LABEL_38:
      *(_DWORD *)(a1 + 16) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL HMAccessoryInfoProtoPublicPairingIdentityReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
LABEL_22:
        long long v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&a9, 8) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadData();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id HMINControlHomeIntentShortDescription(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = a2;
  id v5 = a1;
  uint64_t v6 = [v3 string];
  uint64_t v7 = [v5 contents];
  char v8 = [v7 firstObject];

  unsigned int v9 = [v8 filter];
  unint64_t v10 = [v5 identifier];

  appendToShortDescription(v6, @"IntentIdentifier", v10);
  uint64_t v11 = [v9 home];
  unint64_t v12 = [v11 string];
  appendToShortDescription(v6, @"home", v12);

  char v13 = [v9 home];
  BOOL v14 = [v13 identifier];
  appendToShortDescription(v6, @"homeIdentifier", v14);

  int v15 = [v9 scene];
  int v16 = [v15 string];
  appendToShortDescription(v6, @"scene", v16);

  uint64_t v17 = [v9 scene];
  uint64_t v18 = [v17 identifier];
  appendToShortDescription(v6, @"sceneIdentifier", v18);

  appendToShortDescription(v6, @"outcome", v4);

  return v6;
}

uint64_t HMRemoteEventRouterProtoConnectedClientInfoReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(&a9, 8) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D2AB264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D2AB354(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_19D2AB7CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____requestFetch_block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    id v2 = (void *)a1[4];
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
    [v2 softwareUpdateManager:v3 didReceiveRequestToFetchUpdateWithCompletionHandler:v4];
  }
  else
  {
    id v5 = (void *)MEMORY[0x19F3A64A0]();
    id v6 = (id)a1[5];
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      char v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      BOOL v14 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling legacy fetch delegate", buf, 0xCu);
    }
    unsigned int v9 = (void *)a1[4];
    uint64_t v10 = a1[5];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = ____requestFetch_block_invoke_159;
    v11[3] = &unk_1E59400F8;
    id v12 = (id)a1[6];
    [v9 softwareUpdateManager:v10 didReceiveRequestToFetchWithCompletionHandler:v11];
  }
}

uint64_t ____requestFetch_block_invoke_159(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_19D2AC3E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_19D2AC9B0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2ACD78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D2AD114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D2ADD20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HMStringFromCameraClipEncryptionScheme(uint64_t a1)
{
  if (a1 == 1)
  {
    uint64_t v2 = @"AES256GCM";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<Unknown scheme: %lu>", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

BOOL HMPBServiceReferenceReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(HMPBAccessoryReference);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || !HMPBAccessoryReferenceReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadData();
    uint64_t v17 = *(HMPBAccessoryReference **)(a1 + 16);
    *(void *)(a1 + 16) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t HMPBMatterCommandActionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (1)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            goto LABEL_35;
          }
          v20 += 7;
          BOOL v14 = v21++ >= 9;
          if (v14)
          {
            uint64_t v22 = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_37:
        *(unsigned char *)(a1 + 24) = v22 != 0;
      }
      else if (v17 == 2)
      {
        char v26 = objc_alloc_init(HMPBCommandContainer);
        [(id)a1 addCommands:v26];
        if (!PBReaderPlaceMark() || !HMPBCommandContainerReadFrom((uint64_t)v26, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadData();
        long long v19 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(&a9, 8) = v18;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL HMMediaGroupProtoMediaDestinationAggregateDataReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v18 = objc_alloc_init(HMMediaGroupProtoMediaGroupData);
        [a1 addGroup:v18];
        if (!PBReaderPlaceMark() || (HMMediaGroupProtoMediaGroupDataReadFrom((uint64_t)v18, a2) & 1) == 0)
        {
LABEL_34:

          return 0;
        }
        goto LABEL_29;
      }
      if (v17 == 2) {
        break;
      }
      if (v17 == 1)
      {
        uint64_t v18 = objc_alloc_init(HMMediaGroupProtoMediaDestination);
        [a1 addDestination:v18];
        if (!PBReaderPlaceMark()
          || (HMMediaGroupProtoMediaDestinationReadFrom((uint64_t)v18, a2) & 1) == 0)
        {
          goto LABEL_34;
        }
LABEL_29:
        PBReaderRecallMark();

        goto LABEL_31;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_31:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = objc_alloc_init(HMMediaGroupProtoMediaDestinationControllerData);
    [a1 addDestinationControllerData:v18];
    if (!PBReaderPlaceMark()
      || (HMMediaGroupProtoMediaDestinationControllerDataReadFrom((uint64_t)v18, a2) & 1) == 0)
    {
      goto LABEL_34;
    }
    goto LABEL_29;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D2B5D08(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2B5F4C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMNetworkStatusAsString(uint64_t a1)
{
  if (a1)
  {
    int v1 = a1;
    if ((a1 & 1) == 0)
    {
      uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v3 = v2;
      if ((v1 & 2) != 0)
      {
        [v2 addObject:@"Cable Not Connected"];
        if ((v1 & 4) == 0)
        {
LABEL_5:
          if ((v1 & 8) == 0) {
            goto LABEL_6;
          }
          goto LABEL_22;
        }
      }
      else if ((v1 & 4) == 0)
      {
        goto LABEL_5;
      }
      [v3 addObject:@"No IP address"];
      if ((v1 & 8) == 0)
      {
LABEL_6:
        if ((v1 & 0x10) == 0) {
          goto LABEL_7;
        }
        goto LABEL_23;
      }
LABEL_22:
      [v3 addObject:@"No Gateway"];
      if ((v1 & 0x10) == 0)
      {
LABEL_7:
        if ((v1 & 0x20) == 0) {
          goto LABEL_8;
        }
        goto LABEL_24;
      }
LABEL_23:
      [v3 addObject:@"Gateway Not Reachable"];
      if ((v1 & 0x20) == 0)
      {
LABEL_8:
        if ((v1 & 0x40) == 0) {
          goto LABEL_9;
        }
        goto LABEL_25;
      }
LABEL_24:
      [v3 addObject:@"No DNS Servers"];
      if ((v1 & 0x40) == 0)
      {
LABEL_9:
        if ((v1 & 0x80) == 0) {
          goto LABEL_10;
        }
        goto LABEL_26;
      }
LABEL_25:
      [v3 addObject:@"DNS Servers Not Reachable"];
      if ((v1 & 0x80) == 0)
      {
LABEL_10:
        if ((v1 & 0x100) == 0) {
          goto LABEL_11;
        }
        goto LABEL_27;
      }
LABEL_26:
      [v3 addObject:@"Authentication Failure"];
      if ((v1 & 0x100) == 0)
      {
LABEL_11:
        if ((v1 & 0x20000000) == 0) {
          goto LABEL_12;
        }
        goto LABEL_28;
      }
LABEL_27:
      [v3 addObject:@"Walled"];
      if ((v1 & 0x20000000) == 0)
      {
LABEL_12:
        if ((v1 & 0x40000000) == 0)
        {
LABEL_14:
          uint64_t v4 = [v3 componentsJoinedByString:@", "];

          goto LABEL_17;
        }
LABEL_13:
        [v3 addObject:@"Satellite Not Connected"];
        goto LABEL_14;
      }
LABEL_28:
      [v3 addObject:@"Not Ready"];
      if ((v1 & 0x40000000) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    uint64_t v4 = @"Unknown";
  }
  else
  {
    uint64_t v4 = @"Good";
  }
LABEL_17:

  return v4;
}

BOOL HMXPCEventRouterProtoChangeRegistrationsMessageReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 4) {
        break;
      }
      if ((v10 >> 3) == 3)
      {
        unint64_t v17 = PBReaderReadString();
        if (v17) {
          [a1 addTopicFilterAdditions:v17];
        }
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    unint64_t v17 = PBReaderReadString();
    if (v17) {
      [a1 addTopicFilterRemovals:v17];
    }
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D2B9480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAnalyticsSendEventLazySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __CoreAnalyticsLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E5940158;
    uint64_t v7 = 0;
    CoreAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)CoreAnalyticsLibraryCore_frameworkLibrary;
    if (CoreAnalyticsLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)CoreAnalyticsLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "AnalyticsSendEventLazy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAnalyticsSendEventLazySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreAnalyticsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreAnalyticsLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_19D2BA6EC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2BF418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMTRSetupPayloadClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MatterLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    void v4[3] = __MatterLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5940198;
    uint64_t v6 = 0;
    MatterLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!MatterLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("MTRSetupPayload");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  getMTRSetupPayloadClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MatterLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MatterLibraryCore_frameworkLibrary = result;
  return result;
}

__CFString *HMMMTransportRestrictionToString(unint64_t a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E59402C8[a1];
  }
}

__CFString *HMMMUserRestrictionToString(unint64_t a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E59402B0[a1];
  }
}

uint64_t HMAccessoryDiagnosticInfoProtoIdsInfoReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v23 = PBReaderReadString();
        unint64_t v24 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(&a9, 8) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_31;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_33:
        *(_DWORD *)(a1 + 16) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t HMImmutableSettingsProtoIntegerValueEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 16) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_31:
        *(void *)(a1 + _Block_object_dispose(&a9, 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id hm_assistantIdentifierWithSalts(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDForAssistantFromBaseUUID:withSalts:", a2, a3);
  uint64_t v7 = [v6 UUIDString];

  char v8 = 0;
  if (a2 && v7)
  {
    unsigned int v9 = [@"X-HM://A/" stringByAppendingFormat:@"%@=%@", v5, v7];
    unint64_t v10 = objc_msgSend(v9, "hmf_stringWithSmallestEncoding");

    char v8 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v10);
  }

  return v8;
}

id hm_assistantIdentifier(void *a1, uint64_t a2)
{
  return hm_assistantIdentifierWithSalts(a1, a2, 0);
}

void sub_19D2C50EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
}

void sub_19D2C555C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2C55D8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2C576C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2C633C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2C6438(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2C64A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2C6518(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2C97E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
}

void sub_19D2CA97C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23275(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23276(uint64_t a1)
{
}

__CFString *HMMediaDestinationControllerSupportOptionsAsString(unint64_t a1)
{
  if (a1)
  {
    char v1 = a1;
    uint64_t v2 = &stru_1EEE9DD88;
    if (a1 >= 8)
    {
      uint64_t v3 = NSString;
      uint64_t v4 = [NSNumber numberWithUnsignedInteger:a1];
      uint64_t v2 = [v3 stringWithFormat:@"unknown(%@) ", v4];
    }
    id v5 = @"HP ";
    if ((v1 & 1) == 0) {
      id v5 = &stru_1EEE9DD88;
    }
    uint64_t v6 = @"HPM ";
    if ((v1 & 2) == 0) {
      uint64_t v6 = &stru_1EEE9DD88;
    }
    uint64_t v7 = @"HP+ ";
    if ((v1 & 4) == 0) {
      uint64_t v7 = &stru_1EEE9DD88;
    }
    char v8 = [NSString stringWithFormat:@"< %@%@%@%@>", v5, v6, v7, v2];
  }
  else
  {
    char v8 = @"<None>";
  }

  return v8;
}

void sub_19D2CF278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
}

void sub_19D2CF318(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id getHomeConfigurationVersion()
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"kHomeConfigurationVersionKey", @"com.apple.homed", &keyExistsAndHasValidFormat);
  if (AppIntegerValue) {
    BOOL v1 = keyExistsAndHasValidFormat == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1) {
    uint64_t v2 = -1;
  }
  else {
    uint64_t v2 = AppIntegerValue;
  }
  uint64_t v3 = [NSNumber numberWithLong:v2];

  return v3;
}

id getAssistantConfigurationVersion()
{
  id v0 = HMPreferencesNumberValueForKey(@"kAssistantConfigurationVersionKey");
  BOOL v1 = v0;
  if (!v0) {
    id v0 = &unk_1EEF07E60;
  }
  id v2 = v0;

  return v2;
}

id HMPreferencesNumberValueForKey(const __CFString *a1)
{
  BOOL v1 = (id)CFPreferencesCopyAppValue(a1, @"com.apple.homed");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }
  id v3 = v2;

  return v3;
}

id getAssistantConfigurationSnapshot()
{
  id v0 = getAssistantConfigurationVersion();
  BOOL v1 = HMPreferencesNumberValueForKey(@"kAssistantConfigurationNumberOfEntitiesKey");
  uint64_t v2 = [v1 unsignedIntegerValue];

  id v3 = [NSString stringWithFormat:@"%@:%lu", v0, v2 + 1];

  return v3;
}

id getLastSyncedAssistantConfigurationVersion()
{
  id v0 = HMPreferencesNumberValueForKey(@"kLastSyncedAssistantConfigurationVersionKey");
  if ([v0 unsignedIntegerValue])
  {
    id v1 = v0;
  }
  else
  {
    id v1 = [NSNumber numberWithUnsignedInteger:1];
  }
  uint64_t v2 = v1;

  return v2;
}

BOOL areIncomingInvitesPresent()
{
  return CFPreferencesGetAppBooleanValue(@"kIncomingInvitesPresent", @"com.apple.homed", 0) != 0;
}

uint64_t HMHomeManagerConfiguredHomesCount()
{
  id v0 = HMPreferencesNumberValueForKey(@"HMConfiguredHomesCountStatusKey");
  uint64_t v1 = [v0 unsignedIntegerValue];

  return v1;
}

BOOL areHomesConfigured()
{
  return CFPreferencesGetAppBooleanValue(@"kHomesConfigured", @"com.apple.homed", 0) != 0;
}

BOOL HMHomeManagerAreAnyAccessoriesConfigured()
{
  return CFPreferencesGetAppBooleanValue(@"kAccessoriesConfiguredStatusKey", @"com.apple.homed", 0) != 0;
}

BOOL HMHomeManagerAreAnySpeakersConfigured()
{
  return CFPreferencesGetAppBooleanValue(@"kSpeakersConfiguredStatusKey", @"com.apple.homed", 0) != 0;
}

BOOL areAnyHomePodMiniConfigured()
{
  return CFPreferencesGetAppBooleanValue(@"HMSmallHomePodsConfiguredStatusKey", @"com.apple.homed", 0) != 0;
}

BOOL areAnyLargeHomePodConfigured()
{
  return CFPreferencesGetAppBooleanValue(@"HMHomePod_6_1_ConfiguredStatusKey", @"com.apple.homed", 0) != 0;
}

BOOL areAnyHomePodsConfigured()
{
  return CFPreferencesGetAppBooleanValue(@"HMHomePodsConfiguredStatusKey", @"com.apple.homed", 0) != 0;
}

BOOL HMHomeManagerAreAnyTelevisionAccessoriesConfigured()
{
  return CFPreferencesGetAppBooleanValue(@"HMTelevisionAccessoriesConfiguredStatusKey", @"com.apple.homed", 0) != 0;
}

BOOL HMHomeManagerAreAnyAppleTVAccessoriesConfigured()
{
  return CFPreferencesGetAppBooleanValue(@"HMAppleTVAccessoriesConfiguredStatusKey", @"com.apple.homed", 0) != 0;
}

BOOL HMHomeManagerIsDemoModeActive()
{
  return CFPreferencesGetAppBooleanValue(@"kHMDDemoModeStatusKey", @"com.apple.homed", 0) != 0;
}

void runOnMainQueue(void *a1)
{
  id v1 = a1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __runOnMainQueue_block_invoke;
  block[3] = &unk_1E59454C0;
  id v4 = v1;
  id v2 = v1;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __runOnMainQueue_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void initializeMappingsAndPaths()
{
  if (initializeMappingsAndPaths_pred != -1) {
    dispatch_once(&initializeMappingsAndPaths_pred, &__block_literal_global_24447);
  }
}

id localizationKeyForAccessoryCategoryType(void *a1)
{
  if (a1)
  {
    a1 = [(id)accessoryCategoryLocalizationSingularKeyMapping objectForKeyedSubscript:a1];
    uint64_t v1 = vars8;
  }
  return a1;
}

id pluralLocalizationKeyForAccessoryCategoryType(void *a1)
{
  if (a1)
  {
    a1 = [(id)accessoryCategoryLocalizationPluralKeyMapping objectForKeyedSubscript:a1];
    uint64_t v1 = vars8;
  }
  return a1;
}

id HMHomeKitCacheDirectory()
{
  return HMCacheSubdirectoryWithRelativePath(@"com.apple.HomeKit");
}

id HMCreateHomeKitCacheDirectory()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v0 = HMCacheSubdirectoryWithRelativePath(@"com.apple.HomeKit");
  uint64_t v1 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = 0;
  char v2 = [v1 createDirectoryAtPath:v0 withIntermediateDirectories:1 attributes:0 error:&v9];
  id v3 = v9;

  if (v2)
  {
    id v4 = v0;
  }
  else
  {
    id v5 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      char v13 = v0;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to create HomeKit cache directory %@: %@", buf, 0x20u);
    }
    id v4 = 0;
  }

  return v4;
}

id HMConfigurationsCacheDirectory()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  id v0 = NSString;
  v6[0] = @"com.apple.HomeKit";
  uint64_t v1 = HMClientScopedHomeKitCacheDirectoryName();
  v6[1] = v1;
  v6[2] = @"com.apple.HomeKit.configurations";
  char v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  id v3 = objc_msgSend(v0, "pathWithComponents:", v2, v6[0]);

  id v4 = HMCacheSubdirectoryWithRelativePath(v3);

  return v4;
}

id HMFrameworkCacheDirectory()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  id v0 = NSString;
  v6[0] = @"com.apple.HomeKit";
  uint64_t v1 = HMClientScopedHomeKitCacheDirectoryName();
  v6[1] = v1;
  v6[2] = @"com.apple.HomeKit.HMCache";
  char v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  id v3 = objc_msgSend(v0, "pathWithComponents:", v2, v6[0]);

  id v4 = HMCacheSubdirectoryWithRelativePath(v3);

  return v4;
}

id HMSoftwareUpdateCacheDirectory()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  id v0 = NSString;
  v6[0] = @"com.apple.HomeKit";
  uint64_t v1 = HMClientScopedHomeKitCacheDirectoryName();
  v6[1] = v1;
  v6[2] = @"com.apple.HomeKit.SoftwareUpdate";
  char v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  id v3 = objc_msgSend(v0, "pathWithComponents:", v2, v6[0]);

  id v4 = HMCacheSubdirectoryWithRelativePath(v3);

  return v4;
}

id HMCreateSoftwareUpdateCacheDirectory()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  id v0 = HMClientScopedHomeKitCacheDirectoryName();
  v4[0] = v0;
  v4[1] = @"com.apple.HomeKit.SoftwareUpdate";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  char v2 = HMCreateHomeKitCacheSubdirectoryWithRelativePathComponents(v1);

  return v2;
}

BOOL HMAreStringsEqualIgnoringCase(__CFString *a1, __CFString *a2)
{
  if (!a1) {
    a1 = &stru_1EEE9DD88;
  }
  if (a2) {
    char v2 = a2;
  }
  else {
    char v2 = &stru_1EEE9DD88;
  }
  return [(__CFString *)a1 caseInsensitiveCompare:v2] == 0;
}

id HMTimedRotatedUUID(id a1, void *a2, unint64_t a3, void *a4)
{
  id v4 = a1;
  if (a1)
  {
    if (a3 <= 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = a3;
    }
    id v7 = a2;
    id v8 = v4;
    [a4 timeIntervalSince1970];
    unint64_t v15 = (unint64_t)(v9 * 1000.0) / (86400000 * v6);
    unint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", objc_msgSend(v7, "length") + 8);
    uint64_t v11 = [v7 dataUsingEncoding:4];

    [v10 appendData:v11];
    [v10 appendBytes:&v15 length:8];
    __int16 v12 = (void *)MEMORY[0x1E4F29128];
    char v13 = (void *)[v8 copy];

    objc_msgSend(v12, "hmf_UUIDWithNamespace:data:", v13, v10);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

id HMDailyRotatedUUID(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F1C9C8];
  id v2 = a1;
  id v3 = [v1 now];
  id v4 = HMTimedRotatedUUID(v2, @"0259F789-5C52-4436-85CF-9EC109813484", 1uLL, v3);

  return v4;
}

id HMGenerateDecimalDigitPasswordWithLength(uint64_t a1, void *a2)
{
  uint64_t v3 = SecPasswordCreateWithRandomDigits();
  id v4 = (void *)v3;
  if (a2 && !v3)
  {
    *a2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52 description:0 reason:0 suggestion:0 underlyingError:0];
  }

  return v4;
}

uint64_t HMIsPasswordWeak(uint64_t a1)
{
  return MEMORY[0x1F40F6FB8](0, a1);
}

uint64_t HMMaxLengthForNaming()
{
  if (HMMaxLengthForNaming__hmf_once_t7 != -1) {
    dispatch_once(&HMMaxLengthForNaming__hmf_once_t7, &__block_literal_global_55_24575);
  }
  return HMMaxLengthForNaming__hmf_once_v8;
}

void __HMMaxLengthForNaming_block_invoke()
{
  id v2 = [MEMORY[0x1E4F65530] sharedPreferences];
  id v0 = [v2 preferenceForKey:@"maxLengthForNaming"];
  uint64_t v1 = [v0 numberValue];
  HMMaxLengthForNaming__hmf_once_id v8 = [v1 unsignedIntValue];
}

void *HMArabicNumeralByChineseNumeralDictionary()
{
  return &unk_1EEF089E8;
}

void HMDispatchToContextQueueIfNotNil(void *a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    id v8 = [v6 queue];
    dispatch_async(v8, v7);
  }
  else
  {
    double v9 = (void *)MEMORY[0x19F3A64A0]();
    id v10 = v5;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      __int16 v14 = v12;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to dispatch to context queue due to nil context", (uint8_t *)&v13, 0xCu);
    }
  }
}

id HMTransientIdentifier()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  v2[1] = 0;
  MEMORY[0x19F3A6CD0](v2);
  LODWORD(v2[0]) = -1431655766;
  id v0 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v2];

  return v0;
}

id HMExceptionForError(void *a1)
{
  id v1 = a1;
  if ([v1 isHMError])
  {
    id v2 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v3 = *MEMORY[0x1E4F1C3C8];
    id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "hmStringFromErrorCode:", objc_msgSend(v1, "code"));
    id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

    return v5;
  }
  else
  {
    uint64_t v7 = _HMFPreconditionFailure();
    return (id)HMAccessoryUUIDsAsStringForAccessories(v7);
  }
}

id HMAccessoryUUIDsAsStringForAccessories(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "uuid", (void)v11);
        double v9 = [v8 UUIDString];

        if (v9) {
          [v2 addObject:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v2;
}

id HMDateFromDateWithHourAndMinuteComponents(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9A8];
  uint64_t v6 = *MEMORY[0x1E4F1C318];
  id v7 = a1;
  id v8 = [v5 calendarWithIdentifier:v6];
  double v9 = [v8 components:28 fromDate:v7];

  [v9 setHour:a2];
  [v9 setMinute:a3];
  [v9 setSecond:0];
  id v10 = [v8 dateFromComponents:v9];

  return v10;
}

id HMDateComponentFromSecondsOfDay(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  unint64_t v4 = [v2 integerValue];

  [v3 setValue:v4 / 0xE10 forComponent:32];
  [v3 setValue:v4 % 0xE10 / 0x3C forComponent:64];

  return v3;
}

uint64_t HMSecondsFromDateComponent(void *a1)
{
  id v1 = NSNumber;
  id v2 = a1;
  uint64_t v3 = 3600 * [v2 valueForComponent:32];
  uint64_t v4 = [v2 valueForComponent:64];

  return [v1 numberWithInteger:v3 + 60 * v4];
}

id HMMatterScheduleIntervalFromStartAndEndDates(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a1;
  uint64_t v6 = [v4 currentCalendar];
  id v7 = [v6 components:96 fromDate:v3];

  if ([v7 hour] == 23 && objc_msgSend(v7, "minute") == 59)
  {
    [v3 timeIntervalSince1970];
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)(60 * ((int)v8 / 60) + 60)];

    id v3 = (id)v9;
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v5 endDate:v3];

  return v10;
}

double HMDSecureClassBulletinUserAttributionTime()
{
  if (HMDSecureClassBulletinUserAttributionTime__hmf_once_t12 != -1) {
    dispatch_once(&HMDSecureClassBulletinUserAttributionTime__hmf_once_t12, &__block_literal_global_170);
  }
  return *(double *)&HMDSecureClassBulletinUserAttributionTime__hmf_once_v13;
}

void __HMDSecureClassBulletinUserAttributionTime_block_invoke()
{
  id v3 = [MEMORY[0x1E4F65530] sharedPreferences];
  id v0 = [v3 preferenceForKey:@"HMDSecureClassBulletinUserAttributionTime"];
  id v1 = [v0 numberValue];
  [v1 doubleValue];
  HMDSecureClassBulletinUserAttributionTime__hmf_once_long long v13 = v2;
}

id HMAllowedClassesForMatterCommand()
{
  if (HMAllowedClassesForMatterCommand__hmf_once_t14 != -1) {
    dispatch_once(&HMAllowedClassesForMatterCommand__hmf_once_t14, &__block_literal_global_172);
  }
  id v0 = (void *)HMAllowedClassesForMatterCommand__hmf_once_v15;

  return v0;
}

uint64_t __HMAllowedClassesForMatterCommand_block_invoke()
{
  id v0 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v0, "arrayWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);
  uint64_t v9 = HMAllowedClassesForMatterCommand__hmf_once_v15;
  HMAllowedClassesForMatterCommand__hmf_once_uint64_t v15 = v8;

  return MEMORY[0x1F41817F8](v8, v9);
}

uint64_t canSupportNativeMatter(uint64_t result, void *a2)
{
  if (result)
  {
    uint64_t v2 = [a2 categoryType];
    uint64_t v3 = [v2 isEqual:@"0FBA259B-05AC-46F2-875F-204ABB6D9FE7"];

    return v3;
  }
  return result;
}

uint64_t isRestoreSupportedForCharacteristic(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    if (isRestoreSupportedForCharacteristic_onceToken != -1) {
      dispatch_once(&isRestoreSupportedForCharacteristic_onceToken, &__block_literal_global_24704);
    }
    uint64_t v2 = [(id)isRestoreSupportedForCharacteristic_supportedRestoreCharacteristics containsObject:v1];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void __isRestoreSupportedForCharacteristic_block_invoke()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"00000025-0000-1000-8000-0026BB765291";
  v2[1] = @"000000B0-0000-1000-8000-0026BB765291";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];
  id v1 = (void *)isRestoreSupportedForCharacteristic_supportedRestoreCharacteristics;
  isRestoreSupportedForCharacteristic_supportedRestoreCharacteristics = v0;
}

__CFString *HMAccessoryInfoOptionAsString(uint64_t a1)
{
  if (!a1)
  {
    uint64_t v2 = @"AccessoryInfoNoOption";
    goto LABEL_10;
  }
  char v1 = a1;
  uint64_t v2 = &stru_1EEE9DD88;
  if ((a1 & 1) == 0)
  {
    if ((a1 & 2) == 0) {
      goto LABEL_4;
    }
LABEL_8:
    uint64_t v3 = [NSString stringWithFormat:@"%@ %@", v2, @"HMAccessoryInfoOptionAccount"];

    uint64_t v2 = (__CFString *)v3;
    if ((v1 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v2 = [NSString stringWithFormat:@"%@ %@", &stru_1EEE9DD88, @"HMAccessoryInfoOptionWifi"];
  if ((v1 & 2) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((v1 & 4) != 0)
  {
LABEL_9:
    uint64_t v4 = [NSString stringWithFormat:@"%@ %@", v2, @"HMAccessoryInfoOptionPrimaryUser"];

    uint64_t v2 = (__CFString *)v4;
  }
LABEL_10:

  return v2;
}

id HMAccessoryInfoEventTopicsFromOption(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!a1)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_10;
  }
  uint64_t v7 = objc_opt_new();
  if ((a1 & 1) == 0)
  {
    if ((a1 & 2) == 0) {
      goto LABEL_4;
    }
LABEL_8:
    uint64_t v9 = +[HMAccessoryEventTopic topicFromSuffixID:510 homeUUID:v5 accessoryUUID:v6];
    [v7 addObject:v9];

    if ((a1 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v8 = +[HMAccessoryEventTopic topicFromSuffixID:504 homeUUID:v5 accessoryUUID:v6];
  [v7 addObject:v8];

  if ((a1 & 2) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((a1 & 4) != 0)
  {
LABEL_9:
    id v10 = +[HMAccessoryEventTopic topicFromSuffixID:503 homeUUID:v5 accessoryUUID:v6];
    [v7 addObject:v10];
  }
LABEL_10:

  return v7;
}

void sub_19D2D7A18(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2D7A94(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2D7CEC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2D7DBC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2D9104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D2D9864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D2DA2AC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMAccessoryCurrentNetworkProtectionModeAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%ld)", a1);
    char v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v1 = off_1E59409F0[a1 - 1];
  }

  return v1;
}

__CFString *HMAccessoryNetworkProtectionModeAsString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 3)
    {
      uint64_t v2 = @"Open";
    }
    else if (a1 == 1)
    {
      uint64_t v2 = @"HomeKit Only";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%ld)", a1);
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v2 = @"Auto";
  }
  return v2;
}

__CFString *HMAccessoryWiFiCredentialTypeAsString(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%ld)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5940A10[a1];
  }

  return v1;
}

uint64_t UIKitLibraryCore()
{
  if (!UIKitLibraryCore_frameworkLibrary) {
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return UIKitLibraryCore_frameworkLibrary;
}

uint64_t __Block_byref_object_copy__25476(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25477(uint64_t a1)
{
}

void sub_19D2DBA64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getNSDocumentTypeDocumentAttributeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitLibrary();
  uint64_t result = dlsym(v2, "NSDocumentTypeDocumentAttribute");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNSDocumentTypeDocumentAttributeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t UIKitLibrary()
{
  uint64_t v0 = UIKitLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *__getNSPlainTextDocumentTypeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitLibrary();
  uint64_t result = dlsym(v2, "NSPlainTextDocumentType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNSPlainTextDocumentTypeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getNSCharacterEncodingDocumentAttributeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitLibrary();
  uint64_t result = dlsym(v2, "NSCharacterEncodingDocumentAttribute");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __UIKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrary = result;
  return result;
}

unint64_t SoftwareUpdateV2ErrorCodeFromSUControllerErrorCode(unint64_t result)
{
  if (result > 0x3B) {
    return -1;
  }
  return result;
}

void sub_19D2E0348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D2E2708(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2E277C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2E2808(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2E28F4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2E2A30(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2E2ABC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2E2BA8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMProtoResidentCapabilitiesReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          unsigned int v18 = *(void **)(a1 + 8);
          *(void *)(a1 + _Block_object_dispose(&a9, 8) = v17;

          continue;
        case 4u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(void *)(a1 + 56) |= 0x400uLL;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  uint64_t v22 = 0;
                  goto LABEL_291;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_291:
          BOOL v248 = v22 != 0;
          uint64_t v249 = 26;
          goto LABEL_440;
        case 5u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(void *)(a1 + 56) |= 0x10000000uLL;
          while (2)
          {
            uint64_t v29 = *v3;
            unint64_t v30 = *(void *)(a2 + v29);
            if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  uint64_t v28 = 0;
                  goto LABEL_295;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_295:
          BOOL v248 = v28 != 0;
          uint64_t v249 = 44;
          goto LABEL_440;
        case 6u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(void *)(a1 + 56) |= 0x20000000uLL;
          while (2)
          {
            uint64_t v35 = *v3;
            unint64_t v36 = *(void *)(a2 + v35);
            if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
              *(void *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                BOOL v14 = v33++ >= 9;
                if (v14)
                {
                  uint64_t v34 = 0;
                  goto LABEL_299;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v34 = 0;
          }
LABEL_299:
          BOOL v248 = v34 != 0;
          uint64_t v249 = 45;
          goto LABEL_440;
        case 7u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(void *)(a1 + 56) |= 0x400000uLL;
          while (2)
          {
            uint64_t v41 = *v3;
            unint64_t v42 = *(void *)(a2 + v41);
            if (v42 == -1 || v42 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
              *(void *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                BOOL v14 = v39++ >= 9;
                if (v14)
                {
                  uint64_t v40 = 0;
                  goto LABEL_303;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v40 = 0;
          }
LABEL_303:
          BOOL v248 = v40 != 0;
          uint64_t v249 = 38;
          goto LABEL_440;
        case 8u:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v46 = 0;
          *(void *)(a1 + 56) |= 0x1000uLL;
          while (2)
          {
            uint64_t v47 = *v3;
            unint64_t v48 = *(void *)(a2 + v47);
            if (v48 == -1 || v48 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
              *(void *)(a2 + v47) = v48 + 1;
              v46 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                BOOL v14 = v45++ >= 9;
                if (v14)
                {
                  uint64_t v46 = 0;
                  goto LABEL_307;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v46 = 0;
          }
LABEL_307:
          BOOL v248 = v46 != 0;
          uint64_t v249 = 28;
          goto LABEL_440;
        case 9u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v52 = 0;
          *(void *)(a1 + 56) |= 0x20000uLL;
          while (2)
          {
            uint64_t v53 = *v3;
            unint64_t v54 = *(void *)(a2 + v53);
            if (v54 == -1 || v54 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v55 = *(unsigned char *)(*(void *)(a2 + *v7) + v54);
              *(void *)(a2 + v53) = v54 + 1;
              v52 |= (unint64_t)(v55 & 0x7F) << v50;
              if (v55 < 0)
              {
                v50 += 7;
                BOOL v14 = v51++ >= 9;
                if (v14)
                {
                  uint64_t v52 = 0;
                  goto LABEL_311;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v52 = 0;
          }
LABEL_311:
          BOOL v248 = v52 != 0;
          uint64_t v249 = 33;
          goto LABEL_440;
        case 0xAu:
          char v56 = 0;
          unsigned int v57 = 0;
          uint64_t v58 = 0;
          *(void *)(a1 + 56) |= 0x2000000uLL;
          while (2)
          {
            uint64_t v59 = *v3;
            unint64_t v60 = *(void *)(a2 + v59);
            if (v60 == -1 || v60 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v61 = *(unsigned char *)(*(void *)(a2 + *v7) + v60);
              *(void *)(a2 + v59) = v60 + 1;
              v58 |= (unint64_t)(v61 & 0x7F) << v56;
              if (v61 < 0)
              {
                v56 += 7;
                BOOL v14 = v57++ >= 9;
                if (v14)
                {
                  uint64_t v58 = 0;
                  goto LABEL_315;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v58 = 0;
          }
LABEL_315:
          BOOL v248 = v58 != 0;
          uint64_t v249 = 41;
          goto LABEL_440;
        case 0xBu:
          char v62 = 0;
          unsigned int v63 = 0;
          uint64_t v64 = 0;
          *(void *)(a1 + 56) |= 0x100uLL;
          while (2)
          {
            uint64_t v65 = *v3;
            unint64_t v66 = *(void *)(a2 + v65);
            if (v66 == -1 || v66 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v67 = *(unsigned char *)(*(void *)(a2 + *v7) + v66);
              *(void *)(a2 + v65) = v66 + 1;
              v64 |= (unint64_t)(v67 & 0x7F) << v62;
              if (v67 < 0)
              {
                v62 += 7;
                BOOL v14 = v63++ >= 9;
                if (v14)
                {
                  uint64_t v64 = 0;
                  goto LABEL_319;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v64 = 0;
          }
LABEL_319:
          BOOL v248 = v64 != 0;
          uint64_t v249 = 24;
          goto LABEL_440;
        case 0xCu:
          char v68 = 0;
          unsigned int v69 = 0;
          uint64_t v70 = 0;
          *(void *)(a1 + 56) |= 0x10000uLL;
          while (2)
          {
            uint64_t v71 = *v3;
            unint64_t v72 = *(void *)(a2 + v71);
            if (v72 == -1 || v72 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v73 = *(unsigned char *)(*(void *)(a2 + *v7) + v72);
              *(void *)(a2 + v71) = v72 + 1;
              v70 |= (unint64_t)(v73 & 0x7F) << v68;
              if (v73 < 0)
              {
                v68 += 7;
                BOOL v14 = v69++ >= 9;
                if (v14)
                {
                  uint64_t v70 = 0;
                  goto LABEL_323;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v70 = 0;
          }
LABEL_323:
          BOOL v248 = v70 != 0;
          uint64_t v249 = 32;
          goto LABEL_440;
        case 0xDu:
          char v74 = 0;
          unsigned int v75 = 0;
          uint64_t v76 = 0;
          *(void *)(a1 + 56) |= 0x800000uLL;
          while (2)
          {
            uint64_t v77 = *v3;
            unint64_t v78 = *(void *)(a2 + v77);
            if (v78 == -1 || v78 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v79 = *(unsigned char *)(*(void *)(a2 + *v7) + v78);
              *(void *)(a2 + v77) = v78 + 1;
              v76 |= (unint64_t)(v79 & 0x7F) << v74;
              if (v79 < 0)
              {
                v74 += 7;
                BOOL v14 = v75++ >= 9;
                if (v14)
                {
                  uint64_t v76 = 0;
                  goto LABEL_327;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v76 = 0;
          }
LABEL_327:
          BOOL v248 = v76 != 0;
          uint64_t v249 = 39;
          goto LABEL_440;
        case 0xEu:
          char v80 = 0;
          unsigned int v81 = 0;
          uint64_t v82 = 0;
          *(void *)(a1 + 56) |= 0x800uLL;
          while (2)
          {
            uint64_t v83 = *v3;
            unint64_t v84 = *(void *)(a2 + v83);
            if (v84 == -1 || v84 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v85 = *(unsigned char *)(*(void *)(a2 + *v7) + v84);
              *(void *)(a2 + v83) = v84 + 1;
              v82 |= (unint64_t)(v85 & 0x7F) << v80;
              if (v85 < 0)
              {
                v80 += 7;
                BOOL v14 = v81++ >= 9;
                if (v14)
                {
                  uint64_t v82 = 0;
                  goto LABEL_331;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v82 = 0;
          }
LABEL_331:
          BOOL v248 = v82 != 0;
          uint64_t v249 = 27;
          goto LABEL_440;
        case 0xFu:
          char v86 = 0;
          unsigned int v87 = 0;
          uint64_t v88 = 0;
          *(void *)(a1 + 56) |= 0x40uLL;
          while (2)
          {
            uint64_t v89 = *v3;
            unint64_t v90 = *(void *)(a2 + v89);
            if (v90 == -1 || v90 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v91 = *(unsigned char *)(*(void *)(a2 + *v7) + v90);
              *(void *)(a2 + v89) = v90 + 1;
              v88 |= (unint64_t)(v91 & 0x7F) << v86;
              if (v91 < 0)
              {
                v86 += 7;
                BOOL v14 = v87++ >= 9;
                if (v14)
                {
                  uint64_t v88 = 0;
                  goto LABEL_335;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v88 = 0;
          }
LABEL_335:
          BOOL v248 = v88 != 0;
          uint64_t v249 = 22;
          goto LABEL_440;
        case 0x10u:
          char v92 = 0;
          unsigned int v93 = 0;
          uint64_t v94 = 0;
          *(void *)(a1 + 56) |= 0x400000000uLL;
          while (2)
          {
            uint64_t v95 = *v3;
            unint64_t v96 = *(void *)(a2 + v95);
            if (v96 == -1 || v96 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v97 = *(unsigned char *)(*(void *)(a2 + *v7) + v96);
              *(void *)(a2 + v95) = v96 + 1;
              v94 |= (unint64_t)(v97 & 0x7F) << v92;
              if (v97 < 0)
              {
                v92 += 7;
                BOOL v14 = v93++ >= 9;
                if (v14)
                {
                  uint64_t v94 = 0;
                  goto LABEL_339;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v94 = 0;
          }
LABEL_339:
          BOOL v248 = v94 != 0;
          uint64_t v249 = 50;
          goto LABEL_440;
        case 0x11u:
          char v98 = 0;
          unsigned int v99 = 0;
          uint64_t v100 = 0;
          *(void *)(a1 + 56) |= 0x80000uLL;
          while (2)
          {
            uint64_t v101 = *v3;
            unint64_t v102 = *(void *)(a2 + v101);
            if (v102 == -1 || v102 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v103 = *(unsigned char *)(*(void *)(a2 + *v7) + v102);
              *(void *)(a2 + v101) = v102 + 1;
              v100 |= (unint64_t)(v103 & 0x7F) << v98;
              if (v103 < 0)
              {
                v98 += 7;
                BOOL v14 = v99++ >= 9;
                if (v14)
                {
                  uint64_t v100 = 0;
                  goto LABEL_343;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v100 = 0;
          }
LABEL_343:
          BOOL v248 = v100 != 0;
          uint64_t v249 = 35;
          goto LABEL_440;
        case 0x12u:
          char v104 = 0;
          unsigned int v105 = 0;
          uint64_t v106 = 0;
          *(void *)(a1 + 56) |= 0x800000000uLL;
          while (2)
          {
            uint64_t v107 = *v3;
            unint64_t v108 = *(void *)(a2 + v107);
            if (v108 == -1 || v108 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v109 = *(unsigned char *)(*(void *)(a2 + *v7) + v108);
              *(void *)(a2 + v107) = v108 + 1;
              v106 |= (unint64_t)(v109 & 0x7F) << v104;
              if (v109 < 0)
              {
                v104 += 7;
                BOOL v14 = v105++ >= 9;
                if (v14)
                {
                  uint64_t v106 = 0;
                  goto LABEL_347;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v106 = 0;
          }
LABEL_347:
          BOOL v248 = v106 != 0;
          uint64_t v249 = 51;
          goto LABEL_440;
        case 0x13u:
          char v110 = 0;
          unsigned int v111 = 0;
          uint64_t v112 = 0;
          *(void *)(a1 + 56) |= 0x200uLL;
          while (2)
          {
            uint64_t v113 = *v3;
            unint64_t v114 = *(void *)(a2 + v113);
            if (v114 == -1 || v114 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v115 = *(unsigned char *)(*(void *)(a2 + *v7) + v114);
              *(void *)(a2 + v113) = v114 + 1;
              v112 |= (unint64_t)(v115 & 0x7F) << v110;
              if (v115 < 0)
              {
                v110 += 7;
                BOOL v14 = v111++ >= 9;
                if (v14)
                {
                  uint64_t v112 = 0;
                  goto LABEL_351;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v112 = 0;
          }
LABEL_351:
          BOOL v248 = v112 != 0;
          uint64_t v249 = 25;
          goto LABEL_440;
        case 0x14u:
          char v116 = 0;
          unsigned int v117 = 0;
          uint64_t v118 = 0;
          *(void *)(a1 + 56) |= 0x20uLL;
          while (2)
          {
            uint64_t v119 = *v3;
            unint64_t v120 = *(void *)(a2 + v119);
            if (v120 == -1 || v120 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v121 = *(unsigned char *)(*(void *)(a2 + *v7) + v120);
              *(void *)(a2 + v119) = v120 + 1;
              v118 |= (unint64_t)(v121 & 0x7F) << v116;
              if (v121 < 0)
              {
                v116 += 7;
                BOOL v14 = v117++ >= 9;
                if (v14)
                {
                  uint64_t v118 = 0;
                  goto LABEL_355;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v118 = 0;
          }
LABEL_355:
          BOOL v248 = v118 != 0;
          uint64_t v249 = 21;
          goto LABEL_440;
        case 0x15u:
          char v122 = 0;
          unsigned int v123 = 0;
          uint64_t v124 = 0;
          *(void *)(a1 + 56) |= 0x80uLL;
          while (2)
          {
            uint64_t v125 = *v3;
            unint64_t v126 = *(void *)(a2 + v125);
            if (v126 == -1 || v126 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v127 = *(unsigned char *)(*(void *)(a2 + *v7) + v126);
              *(void *)(a2 + v125) = v126 + 1;
              v124 |= (unint64_t)(v127 & 0x7F) << v122;
              if (v127 < 0)
              {
                v122 += 7;
                BOOL v14 = v123++ >= 9;
                if (v14)
                {
                  uint64_t v124 = 0;
                  goto LABEL_359;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v124 = 0;
          }
LABEL_359:
          BOOL v248 = v124 != 0;
          uint64_t v249 = 23;
          goto LABEL_440;
        case 0x16u:
          char v128 = 0;
          unsigned int v129 = 0;
          uint64_t v130 = 0;
          *(void *)(a1 + 56) |= 0x80000000uLL;
          while (2)
          {
            uint64_t v131 = *v3;
            unint64_t v132 = *(void *)(a2 + v131);
            if (v132 == -1 || v132 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v133 = *(unsigned char *)(*(void *)(a2 + *v7) + v132);
              *(void *)(a2 + v131) = v132 + 1;
              v130 |= (unint64_t)(v133 & 0x7F) << v128;
              if (v133 < 0)
              {
                v128 += 7;
                BOOL v14 = v129++ >= 9;
                if (v14)
                {
                  uint64_t v130 = 0;
                  goto LABEL_363;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v130 = 0;
          }
LABEL_363:
          BOOL v248 = v130 != 0;
          uint64_t v249 = 47;
          goto LABEL_440;
        case 0x17u:
          char v134 = 0;
          unsigned int v135 = 0;
          uint64_t v136 = 0;
          *(void *)(a1 + 56) |= 0x40000000uLL;
          while (2)
          {
            uint64_t v137 = *v3;
            unint64_t v138 = *(void *)(a2 + v137);
            if (v138 == -1 || v138 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v139 = *(unsigned char *)(*(void *)(a2 + *v7) + v138);
              *(void *)(a2 + v137) = v138 + 1;
              v136 |= (unint64_t)(v139 & 0x7F) << v134;
              if (v139 < 0)
              {
                v134 += 7;
                BOOL v14 = v135++ >= 9;
                if (v14)
                {
                  uint64_t v136 = 0;
                  goto LABEL_367;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v136 = 0;
          }
LABEL_367:
          BOOL v248 = v136 != 0;
          uint64_t v249 = 46;
          goto LABEL_440;
        case 0x18u:
          char v140 = 0;
          unsigned int v141 = 0;
          uint64_t v142 = 0;
          *(void *)(a1 + 56) |= 0x2000uLL;
          while (2)
          {
            uint64_t v143 = *v3;
            unint64_t v144 = *(void *)(a2 + v143);
            if (v144 == -1 || v144 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v145 = *(unsigned char *)(*(void *)(a2 + *v7) + v144);
              *(void *)(a2 + v143) = v144 + 1;
              v142 |= (unint64_t)(v145 & 0x7F) << v140;
              if (v145 < 0)
              {
                v140 += 7;
                BOOL v14 = v141++ >= 9;
                if (v14)
                {
                  uint64_t v142 = 0;
                  goto LABEL_371;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v142 = 0;
          }
LABEL_371:
          BOOL v248 = v142 != 0;
          uint64_t v249 = 29;
          goto LABEL_440;
        case 0x19u:
          char v146 = 0;
          unsigned int v147 = 0;
          uint64_t v148 = 0;
          *(void *)(a1 + 56) |= 0x200000000uLL;
          while (2)
          {
            uint64_t v149 = *v3;
            unint64_t v150 = *(void *)(a2 + v149);
            if (v150 == -1 || v150 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v151 = *(unsigned char *)(*(void *)(a2 + *v7) + v150);
              *(void *)(a2 + v149) = v150 + 1;
              v148 |= (unint64_t)(v151 & 0x7F) << v146;
              if (v151 < 0)
              {
                v146 += 7;
                BOOL v14 = v147++ >= 9;
                if (v14)
                {
                  uint64_t v148 = 0;
                  goto LABEL_375;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v148 = 0;
          }
LABEL_375:
          BOOL v248 = v148 != 0;
          uint64_t v249 = 49;
          goto LABEL_440;
        case 0x1Au:
          char v152 = 0;
          unsigned int v153 = 0;
          uint64_t v154 = 0;
          *(void *)(a1 + 56) |= 0x40000uLL;
          while (2)
          {
            uint64_t v155 = *v3;
            unint64_t v156 = *(void *)(a2 + v155);
            if (v156 == -1 || v156 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v157 = *(unsigned char *)(*(void *)(a2 + *v7) + v156);
              *(void *)(a2 + v155) = v156 + 1;
              v154 |= (unint64_t)(v157 & 0x7F) << v152;
              if (v157 < 0)
              {
                v152 += 7;
                BOOL v14 = v153++ >= 9;
                if (v14)
                {
                  uint64_t v154 = 0;
                  goto LABEL_379;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v154 = 0;
          }
LABEL_379:
          BOOL v248 = v154 != 0;
          uint64_t v249 = 34;
          goto LABEL_440;
        case 0x1Bu:
          char v158 = 0;
          unsigned int v159 = 0;
          uint64_t v160 = 0;
          *(void *)(a1 + 56) |= 0x4000000uLL;
          while (2)
          {
            uint64_t v161 = *v3;
            unint64_t v162 = *(void *)(a2 + v161);
            if (v162 == -1 || v162 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v163 = *(unsigned char *)(*(void *)(a2 + *v7) + v162);
              *(void *)(a2 + v161) = v162 + 1;
              v160 |= (unint64_t)(v163 & 0x7F) << v158;
              if (v163 < 0)
              {
                v158 += 7;
                BOOL v14 = v159++ >= 9;
                if (v14)
                {
                  uint64_t v160 = 0;
                  goto LABEL_383;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v160 = 0;
          }
LABEL_383:
          BOOL v248 = v160 != 0;
          uint64_t v249 = 42;
          goto LABEL_440;
        case 0x1Cu:
          char v164 = 0;
          unsigned int v165 = 0;
          uint64_t v166 = 0;
          *(void *)(a1 + 56) |= 0x100000000uLL;
          while (2)
          {
            uint64_t v167 = *v3;
            unint64_t v168 = *(void *)(a2 + v167);
            if (v168 == -1 || v168 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v169 = *(unsigned char *)(*(void *)(a2 + *v7) + v168);
              *(void *)(a2 + v167) = v168 + 1;
              v166 |= (unint64_t)(v169 & 0x7F) << v164;
              if (v169 < 0)
              {
                v164 += 7;
                BOOL v14 = v165++ >= 9;
                if (v14)
                {
                  uint64_t v166 = 0;
                  goto LABEL_387;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v166 = 0;
          }
LABEL_387:
          BOOL v248 = v166 != 0;
          uint64_t v249 = 48;
          goto LABEL_440;
        case 0x1Du:
          char v170 = 0;
          unsigned int v171 = 0;
          uint64_t v172 = 0;
          *(void *)(a1 + 56) |= 2uLL;
          while (2)
          {
            uint64_t v173 = *v3;
            unint64_t v174 = *(void *)(a2 + v173);
            if (v174 == -1 || v174 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v175 = *(unsigned char *)(*(void *)(a2 + *v7) + v174);
              *(void *)(a2 + v173) = v174 + 1;
              v172 |= (unint64_t)(v175 & 0x7F) << v170;
              if (v175 < 0)
              {
                v170 += 7;
                BOOL v14 = v171++ >= 9;
                if (v14)
                {
                  uint64_t v172 = 0;
                  goto LABEL_391;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v172 = 0;
          }
LABEL_391:
          BOOL v248 = v172 != 0;
          uint64_t v249 = 17;
          goto LABEL_440;
        case 0x1Eu:
          char v176 = 0;
          unsigned int v177 = 0;
          uint64_t v178 = 0;
          *(void *)(a1 + 56) |= 0x8000uLL;
          while (2)
          {
            uint64_t v179 = *v3;
            unint64_t v180 = *(void *)(a2 + v179);
            if (v180 == -1 || v180 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v181 = *(unsigned char *)(*(void *)(a2 + *v7) + v180);
              *(void *)(a2 + v179) = v180 + 1;
              v178 |= (unint64_t)(v181 & 0x7F) << v176;
              if (v181 < 0)
              {
                v176 += 7;
                BOOL v14 = v177++ >= 9;
                if (v14)
                {
                  uint64_t v178 = 0;
                  goto LABEL_395;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v178 = 0;
          }
LABEL_395:
          BOOL v248 = v178 != 0;
          uint64_t v249 = 31;
          goto LABEL_440;
        case 0x1Fu:
          char v182 = 0;
          unsigned int v183 = 0;
          uint64_t v184 = 0;
          *(void *)(a1 + 56) |= 0x200000uLL;
          while (2)
          {
            uint64_t v185 = *v3;
            unint64_t v186 = *(void *)(a2 + v185);
            if (v186 == -1 || v186 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v187 = *(unsigned char *)(*(void *)(a2 + *v7) + v186);
              *(void *)(a2 + v185) = v186 + 1;
              v184 |= (unint64_t)(v187 & 0x7F) << v182;
              if (v187 < 0)
              {
                v182 += 7;
                BOOL v14 = v183++ >= 9;
                if (v14)
                {
                  uint64_t v184 = 0;
                  goto LABEL_399;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v184 = 0;
          }
LABEL_399:
          BOOL v248 = v184 != 0;
          uint64_t v249 = 37;
          goto LABEL_440;
        case 0x20u:
          char v188 = 0;
          unsigned int v189 = 0;
          uint64_t v190 = 0;
          *(void *)(a1 + 56) |= 0x4000uLL;
          while (2)
          {
            uint64_t v191 = *v3;
            unint64_t v192 = *(void *)(a2 + v191);
            if (v192 == -1 || v192 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v193 = *(unsigned char *)(*(void *)(a2 + *v7) + v192);
              *(void *)(a2 + v191) = v192 + 1;
              v190 |= (unint64_t)(v193 & 0x7F) << v188;
              if (v193 < 0)
              {
                v188 += 7;
                BOOL v14 = v189++ >= 9;
                if (v14)
                {
                  uint64_t v190 = 0;
                  goto LABEL_403;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v190 = 0;
          }
LABEL_403:
          BOOL v248 = v190 != 0;
          uint64_t v249 = 30;
          goto LABEL_440;
        case 0x21u:
          char v194 = 0;
          unsigned int v195 = 0;
          uint64_t v196 = 0;
          *(void *)(a1 + 56) |= 0x1000000uLL;
          while (2)
          {
            uint64_t v197 = *v3;
            unint64_t v198 = *(void *)(a2 + v197);
            if (v198 == -1 || v198 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v199 = *(unsigned char *)(*(void *)(a2 + *v7) + v198);
              *(void *)(a2 + v197) = v198 + 1;
              v196 |= (unint64_t)(v199 & 0x7F) << v194;
              if (v199 < 0)
              {
                v194 += 7;
                BOOL v14 = v195++ >= 9;
                if (v14)
                {
                  uint64_t v196 = 0;
                  goto LABEL_407;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v196 = 0;
          }
LABEL_407:
          BOOL v248 = v196 != 0;
          uint64_t v249 = 40;
          goto LABEL_440;
        case 0x22u:
          char v200 = 0;
          unsigned int v201 = 0;
          uint64_t v202 = 0;
          *(void *)(a1 + 56) |= 0x10uLL;
          while (2)
          {
            uint64_t v203 = *v3;
            unint64_t v204 = *(void *)(a2 + v203);
            if (v204 == -1 || v204 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v205 = *(unsigned char *)(*(void *)(a2 + *v7) + v204);
              *(void *)(a2 + v203) = v204 + 1;
              v202 |= (unint64_t)(v205 & 0x7F) << v200;
              if (v205 < 0)
              {
                v200 += 7;
                BOOL v14 = v201++ >= 9;
                if (v14)
                {
                  uint64_t v202 = 0;
                  goto LABEL_411;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v202 = 0;
          }
LABEL_411:
          BOOL v248 = v202 != 0;
          uint64_t v249 = 20;
          goto LABEL_440;
        case 0x23u:
          char v206 = 0;
          unsigned int v207 = 0;
          uint64_t v208 = 0;
          *(void *)(a1 + 56) |= 0x8000000uLL;
          while (2)
          {
            uint64_t v209 = *v3;
            unint64_t v210 = *(void *)(a2 + v209);
            if (v210 == -1 || v210 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v211 = *(unsigned char *)(*(void *)(a2 + *v7) + v210);
              *(void *)(a2 + v209) = v210 + 1;
              v208 |= (unint64_t)(v211 & 0x7F) << v206;
              if (v211 < 0)
              {
                v206 += 7;
                BOOL v14 = v207++ >= 9;
                if (v14)
                {
                  uint64_t v208 = 0;
                  goto LABEL_415;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v208 = 0;
          }
LABEL_415:
          BOOL v248 = v208 != 0;
          uint64_t v249 = 43;
          goto LABEL_440;
        case 0x24u:
          char v212 = 0;
          unsigned int v213 = 0;
          uint64_t v214 = 0;
          *(void *)(a1 + 56) |= 0x100000uLL;
          while (2)
          {
            uint64_t v215 = *v3;
            unint64_t v216 = *(void *)(a2 + v215);
            if (v216 == -1 || v216 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v217 = *(unsigned char *)(*(void *)(a2 + *v7) + v216);
              *(void *)(a2 + v215) = v216 + 1;
              v214 |= (unint64_t)(v217 & 0x7F) << v212;
              if (v217 < 0)
              {
                v212 += 7;
                BOOL v14 = v213++ >= 9;
                if (v14)
                {
                  uint64_t v214 = 0;
                  goto LABEL_419;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v214 = 0;
          }
LABEL_419:
          BOOL v248 = v214 != 0;
          uint64_t v249 = 36;
          goto LABEL_440;
        case 0x25u:
          char v218 = 0;
          unsigned int v219 = 0;
          uint64_t v220 = 0;
          *(void *)(a1 + 56) |= 0x1000000000uLL;
          while (2)
          {
            uint64_t v221 = *v3;
            unint64_t v222 = *(void *)(a2 + v221);
            if (v222 == -1 || v222 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v223 = *(unsigned char *)(*(void *)(a2 + *v7) + v222);
              *(void *)(a2 + v221) = v222 + 1;
              v220 |= (unint64_t)(v223 & 0x7F) << v218;
              if (v223 < 0)
              {
                v218 += 7;
                BOOL v14 = v219++ >= 9;
                if (v14)
                {
                  uint64_t v220 = 0;
                  goto LABEL_423;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v220 = 0;
          }
LABEL_423:
          BOOL v248 = v220 != 0;
          uint64_t v249 = 52;
          goto LABEL_440;
        case 0x26u:
          char v224 = 0;
          unsigned int v225 = 0;
          uint64_t v226 = 0;
          *(void *)(a1 + 56) |= 4uLL;
          while (2)
          {
            uint64_t v227 = *v3;
            unint64_t v228 = *(void *)(a2 + v227);
            if (v228 == -1 || v228 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v229 = *(unsigned char *)(*(void *)(a2 + *v7) + v228);
              *(void *)(a2 + v227) = v228 + 1;
              v226 |= (unint64_t)(v229 & 0x7F) << v224;
              if (v229 < 0)
              {
                v224 += 7;
                BOOL v14 = v225++ >= 9;
                if (v14)
                {
                  uint64_t v226 = 0;
                  goto LABEL_427;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v226 = 0;
          }
LABEL_427:
          BOOL v248 = v226 != 0;
          uint64_t v249 = 18;
          goto LABEL_440;
        case 0x27u:
          char v230 = 0;
          unsigned int v231 = 0;
          uint64_t v232 = 0;
          *(void *)(a1 + 56) |= 8uLL;
          while (2)
          {
            uint64_t v233 = *v3;
            unint64_t v234 = *(void *)(a2 + v233);
            if (v234 == -1 || v234 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v235 = *(unsigned char *)(*(void *)(a2 + *v7) + v234);
              *(void *)(a2 + v233) = v234 + 1;
              v232 |= (unint64_t)(v235 & 0x7F) << v230;
              if (v235 < 0)
              {
                v230 += 7;
                BOOL v14 = v231++ >= 9;
                if (v14)
                {
                  uint64_t v232 = 0;
                  goto LABEL_431;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v232 = 0;
          }
LABEL_431:
          BOOL v248 = v232 != 0;
          uint64_t v249 = 19;
          goto LABEL_440;
        case 0x28u:
          char v236 = 0;
          unsigned int v237 = 0;
          uint64_t v238 = 0;
          *(void *)(a1 + 56) |= 1uLL;
          while (2)
          {
            uint64_t v239 = *v3;
            unint64_t v240 = *(void *)(a2 + v239);
            if (v240 == -1 || v240 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v241 = *(unsigned char *)(*(void *)(a2 + *v7) + v240);
              *(void *)(a2 + v239) = v240 + 1;
              v238 |= (unint64_t)(v241 & 0x7F) << v236;
              if (v241 < 0)
              {
                v236 += 7;
                BOOL v14 = v237++ >= 9;
                if (v14)
                {
                  uint64_t v238 = 0;
                  goto LABEL_435;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v238 = 0;
          }
LABEL_435:
          BOOL v248 = v238 != 0;
          uint64_t v249 = 16;
          goto LABEL_440;
        case 0x29u:
          char v242 = 0;
          unsigned int v243 = 0;
          uint64_t v244 = 0;
          *(void *)(a1 + 56) |= 0x2000000000uLL;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v245 = *v3;
        unint64_t v246 = *(void *)(a2 + v245);
        if (v246 == -1 || v246 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v247 = *(unsigned char *)(*(void *)(a2 + *v7) + v246);
        *(void *)(a2 + v245) = v246 + 1;
        v244 |= (unint64_t)(v247 & 0x7F) << v242;
        if ((v247 & 0x80) == 0) {
          goto LABEL_437;
        }
        v242 += 7;
        BOOL v14 = v243++ >= 9;
        if (v14)
        {
          uint64_t v244 = 0;
          goto LABEL_439;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_437:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v244 = 0;
      }
LABEL_439:
      BOOL v248 = v244 != 0;
      uint64_t v249 = 53;
LABEL_440:
      *(unsigned char *)(a1 + v249) = v248;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D2EA77C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2EAE88(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2EAF2C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2EB7F4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2EB8A4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2F5D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HMAccessoryAllowedHostPurposeAsString(unint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!a1) {
    goto LABEL_37;
  }
  uint64_t v3 = 1;
  unint64_t v4 = a1;
  do
  {
    if ((v3 & a1) == 0) {
      goto LABEL_33;
    }
    if (v3 > 127)
    {
      if (v3 <= 1023)
      {
        switch(v3)
        {
          case 128:
            id v5 = @"UsageMetrics";
            break;
          case 256:
            id v5 = @"Diagnostics";
            break;
          case 512:
            id v5 = @"RemoteAccess";
            break;
          default:
            goto LABEL_33;
        }
      }
      else if (v3 > 4095)
      {
        if (v3 == 4096)
        {
          id v5 = @"ConnectivityChecks";
        }
        else
        {
          if (v3 != 0x2000) {
            goto LABEL_33;
          }
          id v5 = @"EmergencyNotifications";
        }
      }
      else if (v3 == 1024)
      {
        id v5 = @"HomeEcosystem";
      }
      else
      {
        if (v3 != 2048) {
          goto LABEL_33;
        }
        id v5 = @"TimeSynchronization";
      }
      goto LABEL_32;
    }
    if (v3 > 15)
    {
      switch(v3)
      {
        case 16:
          id v5 = @"UserEvents";
          break;
        case 32:
          id v5 = @"UserStorage";
          break;
        case 64:
          id v5 = @"Notifications";
          break;
        default:
          goto LABEL_33;
      }
LABEL_32:
      v4 &= ~v3;
      [v2 addObject:v5];
      goto LABEL_33;
    }
    id v5 = @"Other";
    switch(v3)
    {
      case 1:
        goto LABEL_32;
      case 2:
        id v5 = @"FirmwareUpdate";
        goto LABEL_32;
      case 4:
        id v5 = @"AccountManagement";
        goto LABEL_32;
      case 8:
        id v5 = @"PeerToPeer";
        goto LABEL_32;
      default:
        break;
    }
LABEL_33:
    v3 *= 2;
  }
  while (v3 - 1 < a1);
  if ((a1 & 1) == 0 && v4) {
    [v2 addObject:@"Other"];
  }
LABEL_37:
  if ([v2 count])
  {
    id v6 = [v2 componentsJoinedByString:@", "];
  }
  else
  {
    id v6 = @"none";
  }

  return v6;
}

void sub_19D2F7774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D2F7F98(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D2F8498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D3052A4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D30AA0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D318E24(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D318EA0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3198C0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3199A0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D319B50(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D31B27C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_19D31C0E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D31C6A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D31DAD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D31E750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D31F078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D31F828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D324E94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D3259A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,char a21)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__29324(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__29325(uint64_t a1)
{
}

void sub_19D326268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D3268FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D327DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D328864(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_19D32A5C0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D32A6B0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D32AC54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D32AD94(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D32B288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D32B874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D32C248(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_19D32CB60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D32D4A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D3302F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

__CFString *HMUserPrivilegeToString(unint64_t a1)
{
  if (a1 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E59418E8[a1];
  }
}

__CFString *userConsentAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"HMUserConsentResponseNoForAccessoryDetailConfirmation";
  }
  else {
    return off_1E59418D0[a1 - 1];
  }
}

__CFString *HMHomeSupportedFeatureAsString(uint64_t a1)
{
  if (a1 == 1) {
    return @"Supports Add Network Router";
  }
  else {
    return @"Unknown";
  }
}

__CFString *HMNetworkProtectionModeAsString(uint64_t a1)
{
  uint64_t v1 = @"Unknown";
  if (!a1) {
    uint64_t v1 = @"Not Protected";
  }
  if (a1 == 1) {
    return @"Protected";
  }
  else {
    return v1;
  }
}

__CFString *HMNetworkRouterSupportAsString(unint64_t a1)
{
  if (!a1)
  {
    id v6 = @"Enabled";
    goto LABEL_15;
  }
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  uint64_t v3 = v2;
  unint64_t v4 = a1;
  if (a1)
  {
    [v2 addObject:@"Home Protection Mode Updates disabled"];
    unint64_t v4 = a1 & 0xFFFFFFFFFFFFFFFELL;
    if ((a1 & 2) == 0)
    {
LABEL_4:
      if ((a1 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_4;
  }
  [v3 addObject:@"Accessory Protection Mode Updates disabled"];
  v4 &= ~2uLL;
  if ((a1 & 4) != 0)
  {
LABEL_5:
    [v3 addObject:@"Add Network Router disabled"];
    v4 &= ~4uLL;
  }
LABEL_6:
  uint64_t v5 = [v3 count];
  if (!v4 || v5)
  {
    id v6 = [v3 componentsJoinedByString:@","];
  }
  else
  {
    id v6 = @"Unknown";
  }

LABEL_15:

  return v6;
}

__CFString *HMNetworkRouterSupportDisableReasonAsString(unint64_t a1)
{
  if (!a1)
  {
    uint64_t v5 = @"None";
    goto LABEL_19;
  }
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  uint64_t v3 = v2;
  unint64_t v4 = a1;
  if ((a1 & 8) != 0)
  {
    [v2 addObject:@"No Active Network Router in home"];
    unint64_t v4 = a1 & 0xFFFFFFFFFFFFFFF7;
    if ((a1 & 1) == 0)
    {
LABEL_4:
      if ((a1 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_14;
    }
  }
  else if ((a1 & 1) == 0)
  {
    goto LABEL_4;
  }
  [v3 addObject:@"No HomeHub or incompatible OS version on HomeHub"];
  v4 &= ~1uLL;
  if ((a1 & 2) == 0)
  {
LABEL_5:
    if ((a1 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v3 addObject:@"Incompatible OS version"];
  v4 &= ~2uLL;
  if ((a1 & 4) == 0)
  {
LABEL_6:
    if ((a1 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  [v3 addObject:@"Insufficient Privileges"];
  v4 &= ~4uLL;
  if ((a1 & 0x10) != 0)
  {
LABEL_7:
    [v3 addObject:@"Incompatible OS version to change accessory protection"];
    v4 &= ~0x10uLL;
  }
LABEL_8:
  if ([v3 count] || !v4)
  {
    uint64_t v5 = [v3 componentsJoinedByString:@","];
  }
  else
  {
    uint64_t v5 = @"Unknown";
  }

LABEL_19:

  return v5;
}

void sub_19D334A94(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_19D334E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D3352E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D3355A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HMUserPresenceComputeStatusAsString(unint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMUserPresenceComputeStatus %tu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5941980[a1];
  }

  return v1;
}

__CFString *HMSiriEndpointOnboardingResultAsString(unint64_t a1)
{
  if (a1 >= 4)
  {
    uint64_t v2 = NSString;
    uint64_t v3 = [NSNumber numberWithInteger:a1];
    uint64_t v1 = [v2 stringWithFormat:@"Unknown result (%@)", v3];
  }
  else
  {
    uint64_t v1 = off_1E59419D0[a1];
  }

  return v1;
}

__CFString *HMAccessorySettingsDataSourceSubscribeOptionsAsString(uint64_t a1)
{
  if (a1)
  {
    char v2 = a1;
    uint64_t v3 = &stru_1EEE9DD88;
    if (v2)
    {
      uint64_t v3 = [NSString stringWithFormat:@"%@ %@", &stru_1EEE9DD88, @"SubscribeToOnlyLiveSettings"];
      uint64_t v1 = vars8;
    }
  }
  else
  {
    uint64_t v3 = @"SubscribeWithNoOptions";
  }
  return v3;
}

void sub_19D33B98C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 160));
  _Unwind_Resume(a1);
}

void sub_19D33C608(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D33DBE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D3412E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

Class __getHAPSystemKeychainStoreClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CoreHAPLibraryCore_frameworkLibrary_30845)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    void v4[3] = __CoreHAPLibraryCore_block_invoke_30846;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5942190;
    uint64_t v6 = 0;
    CoreHAPLibraryCore_frameworkLibrary_30845 = _sl_dlopen();
    char v2 = (void *)v4[0];
    if (!CoreHAPLibraryCore_frameworkLibrary_30845)
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
    Class result = objc_getClass("HAPSystemKeychainStore");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    char v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  getHAPSystemKeychainStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreHAPLibraryCore_block_invoke_30846()
{
  uint64_t result = _sl_dlopen();
  CoreHAPLibraryCore_frameworkLibrary_30845 = result;
  return result;
}

void sub_19D345F8C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__30944(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__30945(uint64_t a1)
{
}

void sub_19D3491A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D349EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D34ADB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D34B008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D34B220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D34B438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D34B66C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D34B884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D34BAB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D34BD40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D34BFAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D34C218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D34C484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D34C71C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D34C934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D34CCB0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_19D34D064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D34D3B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D34DB10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D34F6B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location,id a24)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a24);
  _Unwind_Resume(a1);
}

void sub_19D34FD50(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D350708(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3514EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *HMHomeManagerNameValidationOptionsToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7) {
    return @"HMHomeManagerNameValidationOptionsNotSupported";
  }
  else {
    return off_1E59421E0[a1 - 1];
  }
}

__CFString *HMHomeManagerMultiUserStatusToString(uint64_t a1)
{
  if (a1 == 1)
  {
    uint64_t v2 = @"HMHomeManagerMultiUserStatusReady";
  }
  else if (a1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"HMHomeManagerMultiUserStatus(%ld)", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v2 = @"HMHomeManagerMultiUserStatusUninitialized";
  }
  return v2;
}

uint64_t HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfoReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 80;
        goto LABEL_45;
      case 2u:
        unsigned int v21 = objc_alloc_init(HMAccessoryInfoProtoWifiNetworkInfoEvent);
        objc_storeStrong((id *)(a1 + 176), v21);
        if (!PBReaderPlaceMark()
          || (HMAccessoryInfoProtoWifiNetworkInfoEventReadFrom((uint64_t)v21, a2) & 1) == 0)
        {
          goto LABEL_112;
        }
        goto LABEL_69;
      case 3u:
        unsigned int v21 = objc_alloc_init(HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo);
        objc_storeStrong((id *)(a1 + 48), v21);
        if (!PBReaderPlaceMark()
          || !HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfoReadFrom((uint64_t)v21, a2))
        {
          goto LABEL_112;
        }
        goto LABEL_69;
      case 4u:
        unsigned int v21 = objc_alloc_init(HMAccessoryDiagnosticInfoProtoCloudInfo);
        objc_storeStrong((id *)(a1 + 40), v21);
        if (!PBReaderPlaceMark()
          || (HMAccessoryDiagnosticInfoProtoCloudInfoReadFrom((uint64_t)v21, a2) & 1) == 0)
        {
          goto LABEL_112;
        }
        goto LABEL_69;
      case 5u:
        unsigned int v21 = objc_alloc_init(HMAccessoryDiagnosticInfoProtoIdsInfo);
        objc_storeStrong((id *)(a1 + 64), v21);
        if (!PBReaderPlaceMark()
          || (HMAccessoryDiagnosticInfoProtoIdsInfoReadFrom((uint64_t)v21, a2) & 1) == 0)
        {
          goto LABEL_112;
        }
        goto LABEL_69;
      case 6u:
        unsigned int v21 = objc_alloc_init(HMRemoteEventRouterProtoServerDiagnosticInfo);
        objc_storeStrong((id *)(a1 + 56), v21);
        if (!PBReaderPlaceMark()
          || (HMRemoteEventRouterProtoServerDiagnosticInfoReadFrom((uint64_t)v21, a2) & 1) == 0)
        {
          goto LABEL_112;
        }
        goto LABEL_69;
      case 7u:
        *(unsigned char *)(a1 + 184) |= 1u;
        uint64_t v22 = *v3;
        unint64_t v23 = *(void *)(a2 + v22);
        if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v24 = *(void *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v23 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v24 = 0;
        }
        *(void *)(a1 + _Block_object_dispose(&a9, 8) = v24;
        goto LABEL_110;
      case 8u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 144;
        goto LABEL_45;
      case 9u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 88;
        goto LABEL_45;
      case 0xAu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 168;
        goto LABEL_45;
      case 0xBu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 136;
        goto LABEL_45;
      case 0xCu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 72;
LABEL_45:
        char v25 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_110;
      case 0xDu:
        unsigned int v21 = objc_alloc_init(HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor);
        objc_storeStrong((id *)(a1 + 152), v21);
        if (!PBReaderPlaceMark()
          || (HMSoftwareUpdateEventProtoSoftwareUpdateDescriptorReadFrom((uint64_t)v21, a2) & 1) == 0)
        {
          goto LABEL_112;
        }
        goto LABEL_69;
      case 0xEu:
        unsigned int v21 = objc_alloc_init(HMSoftwareUpdateEventProtoSoftwareUpdateProgress);
        objc_storeStrong((id *)(a1 + 160), v21);
        if (!PBReaderPlaceMark()
          || (HMSoftwareUpdateEventProtoSoftwareUpdateProgressReadFrom((uint64_t)v21, a2) & 1) == 0)
        {
          goto LABEL_112;
        }
        goto LABEL_69;
      case 0xFu:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
        *(unsigned char *)(a1 + 184) |= 8u;
        while (2)
        {
          uint64_t v29 = *v3;
          uint64_t v30 = *(void *)(a2 + v29);
          unint64_t v31 = v30 + 1;
          if (v30 == -1 || v31 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v31;
            v28 |= (unint64_t)(v32 & 0x7F) << v26;
            if (v32 < 0)
            {
              v26 += 7;
              BOOL v15 = v27++ >= 9;
              if (v15)
              {
                uint64_t v28 = 0;
                goto LABEL_94;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v28 = 0;
        }
LABEL_94:
        uint64_t v52 = 32;
        goto LABEL_103;
      case 0x10u:
        unsigned int v21 = objc_alloc_init(HMAccessoryInfoProtoNetworkInfoEvent);
        [(id)a1 addNetworkInfo:v21];
        if (!PBReaderPlaceMark()
          || !HMAccessoryInfoProtoNetworkInfoEventReadFrom((id *)&v21->super.super.isa, a2))
        {
          goto LABEL_112;
        }
        goto LABEL_69;
      case 0x11u:
        unsigned int v21 = objc_alloc_init(HMAccessoryInfoProtoNetworkServiceEvent);
        [(id)a1 addNetworkServiceInfo:v21];
        if (!PBReaderPlaceMark() || (HMAccessoryInfoProtoNetworkServiceEventReadFrom(v21, a2) & 1) == 0) {
          goto LABEL_112;
        }
        goto LABEL_69;
      case 0x12u:
        unsigned int v21 = objc_alloc_init(HMAccessoryDiagnosticInfoProtoVisibleDeviceInfo);
        [(id)a1 addNetworkVisibleDeviceInfos:v21];
        goto LABEL_67;
      case 0x13u:
        unsigned int v21 = objc_alloc_init(HMAccessoryDiagnosticInfoProtoVisibleDeviceInfo);
        [(id)a1 addNearbyVisibleDeviceInfos:v21];
LABEL_67:
        if (PBReaderPlaceMark()
          && HMAccessoryDiagnosticInfoProtoVisibleDeviceInfoReadFrom((uint64_t)v21, a2))
        {
LABEL_69:
          PBReaderRecallMark();

LABEL_110:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_112:

        return 0;
      case 0x14u:
        char v33 = 0;
        unsigned int v34 = 0;
        uint64_t v28 = 0;
        *(unsigned char *)(a1 + 184) |= 2u;
        while (2)
        {
          uint64_t v35 = *v3;
          uint64_t v36 = *(void *)(a2 + v35);
          unint64_t v37 = v36 + 1;
          if (v36 == -1 || v37 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
            *(void *)(a2 + v35) = v37;
            v28 |= (unint64_t)(v38 & 0x7F) << v33;
            if (v38 < 0)
            {
              v33 += 7;
              BOOL v15 = v34++ >= 9;
              if (v15)
              {
                uint64_t v28 = 0;
                goto LABEL_98;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v28 = 0;
        }
LABEL_98:
        uint64_t v52 = 16;
        goto LABEL_103;
      case 0x15u:
        char v39 = 0;
        unsigned int v40 = 0;
        uint64_t v28 = 0;
        *(unsigned char *)(a1 + 184) |= 4u;
        while (2)
        {
          uint64_t v41 = *v3;
          uint64_t v42 = *(void *)(a2 + v41);
          unint64_t v43 = v42 + 1;
          if (v42 == -1 || v43 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
            *(void *)(a2 + v41) = v43;
            v28 |= (unint64_t)(v44 & 0x7F) << v39;
            if (v44 < 0)
            {
              v39 += 7;
              BOOL v15 = v40++ >= 9;
              if (v15)
              {
                uint64_t v28 = 0;
                goto LABEL_102;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v28 = 0;
        }
LABEL_102:
        uint64_t v52 = 24;
LABEL_103:
        *(void *)(a1 + v52) = v28;
        goto LABEL_110;
      case 0x16u:
        char v45 = 0;
        unsigned int v46 = 0;
        uint64_t v47 = 0;
        *(unsigned char *)(a1 + 184) |= 0x10u;
        while (2)
        {
          uint64_t v48 = *v3;
          uint64_t v49 = *(void *)(a2 + v48);
          unint64_t v50 = v49 + 1;
          if (v49 == -1 || v50 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v51 = *(unsigned char *)(*(void *)(a2 + *v7) + v49);
            *(void *)(a2 + v4_Block_object_dispose(&a9, 8) = v50;
            v47 |= (unint64_t)(v51 & 0x7F) << v45;
            if (v51 < 0)
            {
              v45 += 7;
              BOOL v15 = v46++ >= 9;
              if (v15)
              {
                LODWORD(v47) = 0;
                goto LABEL_107;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v47) = 0;
        }
LABEL_107:
        *(_DWORD *)(a1 + 12_Block_object_dispose(&a9, 8) = v47;
        goto LABEL_110;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_110;
    }
  }
}

void sub_19D35A5A0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMProtoAccessoryCapabilitiesReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = *(void **)(a1 + 8);
          *(void *)(a1 + _Block_object_dispose(&a9, 8) = v17;

          continue;
        case 4u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(void *)(a1 + 56) |= 0x400000uLL;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  uint64_t v22 = 0;
                  goto LABEL_298;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_298:
          BOOL v254 = v22 != 0;
          uint64_t v255 = 38;
          goto LABEL_451;
        case 5u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(void *)(a1 + 56) |= 0x2000uLL;
          while (2)
          {
            uint64_t v29 = *v3;
            unint64_t v30 = *(void *)(a2 + v29);
            if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  uint64_t v28 = 0;
                  goto LABEL_302;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_302:
          BOOL v254 = v28 != 0;
          uint64_t v255 = 29;
          goto LABEL_451;
        case 6u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(void *)(a1 + 56) |= 0x100000uLL;
          while (2)
          {
            uint64_t v35 = *v3;
            unint64_t v36 = *(void *)(a2 + v35);
            if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
              *(void *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                BOOL v14 = v33++ >= 9;
                if (v14)
                {
                  uint64_t v34 = 0;
                  goto LABEL_306;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v34 = 0;
          }
LABEL_306:
          BOOL v254 = v34 != 0;
          uint64_t v255 = 36;
          goto LABEL_451;
        case 7u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(void *)(a1 + 56) |= 0x200000uLL;
          while (2)
          {
            uint64_t v41 = *v3;
            unint64_t v42 = *(void *)(a2 + v41);
            if (v42 == -1 || v42 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
              *(void *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                BOOL v14 = v39++ >= 9;
                if (v14)
                {
                  uint64_t v40 = 0;
                  goto LABEL_310;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v40 = 0;
          }
LABEL_310:
          BOOL v254 = v40 != 0;
          uint64_t v255 = 37;
          goto LABEL_451;
        case 8u:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v46 = 0;
          *(void *)(a1 + 56) |= 0x40000000uLL;
          while (2)
          {
            uint64_t v47 = *v3;
            unint64_t v48 = *(void *)(a2 + v47);
            if (v48 == -1 || v48 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
              *(void *)(a2 + v47) = v48 + 1;
              v46 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                BOOL v14 = v45++ >= 9;
                if (v14)
                {
                  uint64_t v46 = 0;
                  goto LABEL_314;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v46 = 0;
          }
LABEL_314:
          BOOL v254 = v46 != 0;
          uint64_t v255 = 46;
          goto LABEL_451;
        case 9u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v52 = 0;
          *(void *)(a1 + 56) |= 0x100uLL;
          while (2)
          {
            uint64_t v53 = *v3;
            unint64_t v54 = *(void *)(a2 + v53);
            if (v54 == -1 || v54 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v55 = *(unsigned char *)(*(void *)(a2 + *v7) + v54);
              *(void *)(a2 + v53) = v54 + 1;
              v52 |= (unint64_t)(v55 & 0x7F) << v50;
              if (v55 < 0)
              {
                v50 += 7;
                BOOL v14 = v51++ >= 9;
                if (v14)
                {
                  uint64_t v52 = 0;
                  goto LABEL_318;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v52 = 0;
          }
LABEL_318:
          BOOL v254 = v52 != 0;
          uint64_t v255 = 24;
          goto LABEL_451;
        case 0xAu:
          char v56 = 0;
          unsigned int v57 = 0;
          uint64_t v58 = 0;
          *(void *)(a1 + 56) |= 0x1000000000uLL;
          while (2)
          {
            uint64_t v59 = *v3;
            unint64_t v60 = *(void *)(a2 + v59);
            if (v60 == -1 || v60 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v61 = *(unsigned char *)(*(void *)(a2 + *v7) + v60);
              *(void *)(a2 + v59) = v60 + 1;
              v58 |= (unint64_t)(v61 & 0x7F) << v56;
              if (v61 < 0)
              {
                v56 += 7;
                BOOL v14 = v57++ >= 9;
                if (v14)
                {
                  uint64_t v58 = 0;
                  goto LABEL_322;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v58 = 0;
          }
LABEL_322:
          BOOL v254 = v58 != 0;
          uint64_t v255 = 52;
          goto LABEL_451;
        case 0xBu:
          char v62 = 0;
          unsigned int v63 = 0;
          uint64_t v64 = 0;
          *(void *)(a1 + 56) |= 0x20uLL;
          while (2)
          {
            uint64_t v65 = *v3;
            unint64_t v66 = *(void *)(a2 + v65);
            if (v66 == -1 || v66 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v67 = *(unsigned char *)(*(void *)(a2 + *v7) + v66);
              *(void *)(a2 + v65) = v66 + 1;
              v64 |= (unint64_t)(v67 & 0x7F) << v62;
              if (v67 < 0)
              {
                v62 += 7;
                BOOL v14 = v63++ >= 9;
                if (v14)
                {
                  uint64_t v64 = 0;
                  goto LABEL_326;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v64 = 0;
          }
LABEL_326:
          BOOL v254 = v64 != 0;
          uint64_t v255 = 21;
          goto LABEL_451;
        case 0xCu:
          char v68 = 0;
          unsigned int v69 = 0;
          uint64_t v70 = 0;
          *(void *)(a1 + 56) |= 0x10000uLL;
          while (2)
          {
            uint64_t v71 = *v3;
            unint64_t v72 = *(void *)(a2 + v71);
            if (v72 == -1 || v72 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v73 = *(unsigned char *)(*(void *)(a2 + *v7) + v72);
              *(void *)(a2 + v71) = v72 + 1;
              v70 |= (unint64_t)(v73 & 0x7F) << v68;
              if (v73 < 0)
              {
                v68 += 7;
                BOOL v14 = v69++ >= 9;
                if (v14)
                {
                  uint64_t v70 = 0;
                  goto LABEL_330;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v70 = 0;
          }
LABEL_330:
          BOOL v254 = v70 != 0;
          uint64_t v255 = 32;
          goto LABEL_451;
        case 0xDu:
          char v74 = 0;
          unsigned int v75 = 0;
          uint64_t v76 = 0;
          *(void *)(a1 + 56) |= 0x100000000uLL;
          while (2)
          {
            uint64_t v77 = *v3;
            unint64_t v78 = *(void *)(a2 + v77);
            if (v78 == -1 || v78 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v79 = *(unsigned char *)(*(void *)(a2 + *v7) + v78);
              *(void *)(a2 + v77) = v78 + 1;
              v76 |= (unint64_t)(v79 & 0x7F) << v74;
              if (v79 < 0)
              {
                v74 += 7;
                BOOL v14 = v75++ >= 9;
                if (v14)
                {
                  uint64_t v76 = 0;
                  goto LABEL_334;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v76 = 0;
          }
LABEL_334:
          BOOL v254 = v76 != 0;
          uint64_t v255 = 48;
          goto LABEL_451;
        case 0xEu:
          char v80 = 0;
          unsigned int v81 = 0;
          uint64_t v82 = 0;
          *(void *)(a1 + 56) |= 0x4000000uLL;
          while (2)
          {
            uint64_t v83 = *v3;
            unint64_t v84 = *(void *)(a2 + v83);
            if (v84 == -1 || v84 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v85 = *(unsigned char *)(*(void *)(a2 + *v7) + v84);
              *(void *)(a2 + v83) = v84 + 1;
              v82 |= (unint64_t)(v85 & 0x7F) << v80;
              if (v85 < 0)
              {
                v80 += 7;
                BOOL v14 = v81++ >= 9;
                if (v14)
                {
                  uint64_t v82 = 0;
                  goto LABEL_338;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v82 = 0;
          }
LABEL_338:
          BOOL v254 = v82 != 0;
          uint64_t v255 = 42;
          goto LABEL_451;
        case 0xFu:
          char v86 = 0;
          unsigned int v87 = 0;
          uint64_t v88 = 0;
          *(void *)(a1 + 56) |= 0x40000uLL;
          while (2)
          {
            uint64_t v89 = *v3;
            unint64_t v90 = *(void *)(a2 + v89);
            if (v90 == -1 || v90 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v91 = *(unsigned char *)(*(void *)(a2 + *v7) + v90);
              *(void *)(a2 + v89) = v90 + 1;
              v88 |= (unint64_t)(v91 & 0x7F) << v86;
              if (v91 < 0)
              {
                v86 += 7;
                BOOL v14 = v87++ >= 9;
                if (v14)
                {
                  uint64_t v88 = 0;
                  goto LABEL_342;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v88 = 0;
          }
LABEL_342:
          BOOL v254 = v88 != 0;
          uint64_t v255 = 34;
          goto LABEL_451;
        case 0x10u:
          char v92 = 0;
          unsigned int v93 = 0;
          uint64_t v94 = 0;
          *(void *)(a1 + 56) |= 0x20000uLL;
          while (2)
          {
            uint64_t v95 = *v3;
            unint64_t v96 = *(void *)(a2 + v95);
            if (v96 == -1 || v96 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v97 = *(unsigned char *)(*(void *)(a2 + *v7) + v96);
              *(void *)(a2 + v95) = v96 + 1;
              v94 |= (unint64_t)(v97 & 0x7F) << v92;
              if (v97 < 0)
              {
                v92 += 7;
                BOOL v14 = v93++ >= 9;
                if (v14)
                {
                  uint64_t v94 = 0;
                  goto LABEL_346;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v94 = 0;
          }
LABEL_346:
          BOOL v254 = v94 != 0;
          uint64_t v255 = 33;
          goto LABEL_451;
        case 0x11u:
          char v98 = 0;
          unsigned int v99 = 0;
          uint64_t v100 = 0;
          *(void *)(a1 + 56) |= 0x400uLL;
          while (2)
          {
            uint64_t v101 = *v3;
            unint64_t v102 = *(void *)(a2 + v101);
            if (v102 == -1 || v102 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v103 = *(unsigned char *)(*(void *)(a2 + *v7) + v102);
              *(void *)(a2 + v101) = v102 + 1;
              v100 |= (unint64_t)(v103 & 0x7F) << v98;
              if (v103 < 0)
              {
                v98 += 7;
                BOOL v14 = v99++ >= 9;
                if (v14)
                {
                  uint64_t v100 = 0;
                  goto LABEL_350;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v100 = 0;
          }
LABEL_350:
          BOOL v254 = v100 != 0;
          uint64_t v255 = 26;
          goto LABEL_451;
        case 0x12u:
          char v104 = 0;
          unsigned int v105 = 0;
          uint64_t v106 = 0;
          *(void *)(a1 + 56) |= 0x8000000uLL;
          while (2)
          {
            uint64_t v107 = *v3;
            unint64_t v108 = *(void *)(a2 + v107);
            if (v108 == -1 || v108 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v109 = *(unsigned char *)(*(void *)(a2 + *v7) + v108);
              *(void *)(a2 + v107) = v108 + 1;
              v106 |= (unint64_t)(v109 & 0x7F) << v104;
              if (v109 < 0)
              {
                v104 += 7;
                BOOL v14 = v105++ >= 9;
                if (v14)
                {
                  uint64_t v106 = 0;
                  goto LABEL_354;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v106 = 0;
          }
LABEL_354:
          BOOL v254 = v106 != 0;
          uint64_t v255 = 43;
          goto LABEL_451;
        case 0x13u:
          char v110 = 0;
          unsigned int v111 = 0;
          uint64_t v112 = 0;
          *(void *)(a1 + 56) |= 0x10uLL;
          while (2)
          {
            uint64_t v113 = *v3;
            unint64_t v114 = *(void *)(a2 + v113);
            if (v114 == -1 || v114 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v115 = *(unsigned char *)(*(void *)(a2 + *v7) + v114);
              *(void *)(a2 + v113) = v114 + 1;
              v112 |= (unint64_t)(v115 & 0x7F) << v110;
              if (v115 < 0)
              {
                v110 += 7;
                BOOL v14 = v111++ >= 9;
                if (v14)
                {
                  uint64_t v112 = 0;
                  goto LABEL_358;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v112 = 0;
          }
LABEL_358:
          BOOL v254 = v112 != 0;
          uint64_t v255 = 20;
          goto LABEL_451;
        case 0x14u:
          char v116 = 0;
          unsigned int v117 = 0;
          uint64_t v118 = 0;
          *(void *)(a1 + 56) |= 0x4000000000uLL;
          while (2)
          {
            uint64_t v119 = *v3;
            unint64_t v120 = *(void *)(a2 + v119);
            if (v120 == -1 || v120 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v121 = *(unsigned char *)(*(void *)(a2 + *v7) + v120);
              *(void *)(a2 + v119) = v120 + 1;
              v118 |= (unint64_t)(v121 & 0x7F) << v116;
              if (v121 < 0)
              {
                v116 += 7;
                BOOL v14 = v117++ >= 9;
                if (v14)
                {
                  uint64_t v118 = 0;
                  goto LABEL_362;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v118 = 0;
          }
LABEL_362:
          BOOL v254 = v118 != 0;
          uint64_t v255 = 54;
          goto LABEL_451;
        case 0x15u:
          char v122 = 0;
          unsigned int v123 = 0;
          uint64_t v124 = 0;
          *(void *)(a1 + 56) |= 0x200000000uLL;
          while (2)
          {
            uint64_t v125 = *v3;
            unint64_t v126 = *(void *)(a2 + v125);
            if (v126 == -1 || v126 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v127 = *(unsigned char *)(*(void *)(a2 + *v7) + v126);
              *(void *)(a2 + v125) = v126 + 1;
              v124 |= (unint64_t)(v127 & 0x7F) << v122;
              if (v127 < 0)
              {
                v122 += 7;
                BOOL v14 = v123++ >= 9;
                if (v14)
                {
                  uint64_t v124 = 0;
                  goto LABEL_366;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v124 = 0;
          }
LABEL_366:
          BOOL v254 = v124 != 0;
          uint64_t v255 = 49;
          goto LABEL_451;
        case 0x16u:
          char v128 = 0;
          unsigned int v129 = 0;
          uint64_t v130 = 0;
          *(void *)(a1 + 56) |= 0x10000000uLL;
          while (2)
          {
            uint64_t v131 = *v3;
            unint64_t v132 = *(void *)(a2 + v131);
            if (v132 == -1 || v132 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v133 = *(unsigned char *)(*(void *)(a2 + *v7) + v132);
              *(void *)(a2 + v131) = v132 + 1;
              v130 |= (unint64_t)(v133 & 0x7F) << v128;
              if (v133 < 0)
              {
                v128 += 7;
                BOOL v14 = v129++ >= 9;
                if (v14)
                {
                  uint64_t v130 = 0;
                  goto LABEL_370;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v130 = 0;
          }
LABEL_370:
          BOOL v254 = v130 != 0;
          uint64_t v255 = 44;
          goto LABEL_451;
        case 0x17u:
          char v134 = 0;
          unsigned int v135 = 0;
          uint64_t v136 = 0;
          *(void *)(a1 + 56) |= 0x400000000uLL;
          while (2)
          {
            uint64_t v137 = *v3;
            unint64_t v138 = *(void *)(a2 + v137);
            if (v138 == -1 || v138 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v139 = *(unsigned char *)(*(void *)(a2 + *v7) + v138);
              *(void *)(a2 + v137) = v138 + 1;
              v136 |= (unint64_t)(v139 & 0x7F) << v134;
              if (v139 < 0)
              {
                v134 += 7;
                BOOL v14 = v135++ >= 9;
                if (v14)
                {
                  uint64_t v136 = 0;
                  goto LABEL_374;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v136 = 0;
          }
LABEL_374:
          BOOL v254 = v136 != 0;
          uint64_t v255 = 50;
          goto LABEL_451;
        case 0x18u:
          char v140 = 0;
          unsigned int v141 = 0;
          uint64_t v142 = 0;
          *(void *)(a1 + 56) |= 0x4000uLL;
          while (2)
          {
            uint64_t v143 = *v3;
            unint64_t v144 = *(void *)(a2 + v143);
            if (v144 == -1 || v144 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v145 = *(unsigned char *)(*(void *)(a2 + *v7) + v144);
              *(void *)(a2 + v143) = v144 + 1;
              v142 |= (unint64_t)(v145 & 0x7F) << v140;
              if (v145 < 0)
              {
                v140 += 7;
                BOOL v14 = v141++ >= 9;
                if (v14)
                {
                  uint64_t v142 = 0;
                  goto LABEL_378;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v142 = 0;
          }
LABEL_378:
          BOOL v254 = v142 != 0;
          uint64_t v255 = 30;
          goto LABEL_451;
        case 0x19u:
          char v146 = 0;
          unsigned int v147 = 0;
          uint64_t v148 = 0;
          *(void *)(a1 + 56) |= 0x800000000uLL;
          while (2)
          {
            uint64_t v149 = *v3;
            unint64_t v150 = *(void *)(a2 + v149);
            if (v150 == -1 || v150 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v151 = *(unsigned char *)(*(void *)(a2 + *v7) + v150);
              *(void *)(a2 + v149) = v150 + 1;
              v148 |= (unint64_t)(v151 & 0x7F) << v146;
              if (v151 < 0)
              {
                v146 += 7;
                BOOL v14 = v147++ >= 9;
                if (v14)
                {
                  uint64_t v148 = 0;
                  goto LABEL_382;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v148 = 0;
          }
LABEL_382:
          BOOL v254 = v148 != 0;
          uint64_t v255 = 51;
          goto LABEL_451;
        case 0x1Au:
          char v152 = 0;
          unsigned int v153 = 0;
          uint64_t v154 = 0;
          *(void *)(a1 + 56) |= 0x800uLL;
          while (2)
          {
            uint64_t v155 = *v3;
            unint64_t v156 = *(void *)(a2 + v155);
            if (v156 == -1 || v156 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v157 = *(unsigned char *)(*(void *)(a2 + *v7) + v156);
              *(void *)(a2 + v155) = v156 + 1;
              v154 |= (unint64_t)(v157 & 0x7F) << v152;
              if (v157 < 0)
              {
                v152 += 7;
                BOOL v14 = v153++ >= 9;
                if (v14)
                {
                  uint64_t v154 = 0;
                  goto LABEL_386;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v154 = 0;
          }
LABEL_386:
          BOOL v254 = v154 != 0;
          uint64_t v255 = 27;
          goto LABEL_451;
        case 0x1Bu:
          char v158 = 0;
          unsigned int v159 = 0;
          uint64_t v160 = 0;
          *(void *)(a1 + 56) |= 0x8000uLL;
          while (2)
          {
            uint64_t v161 = *v3;
            unint64_t v162 = *(void *)(a2 + v161);
            if (v162 == -1 || v162 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v163 = *(unsigned char *)(*(void *)(a2 + *v7) + v162);
              *(void *)(a2 + v161) = v162 + 1;
              v160 |= (unint64_t)(v163 & 0x7F) << v158;
              if (v163 < 0)
              {
                v158 += 7;
                BOOL v14 = v159++ >= 9;
                if (v14)
                {
                  uint64_t v160 = 0;
                  goto LABEL_390;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v160 = 0;
          }
LABEL_390:
          BOOL v254 = v160 != 0;
          uint64_t v255 = 31;
          goto LABEL_451;
        case 0x1Cu:
          char v164 = 0;
          unsigned int v165 = 0;
          uint64_t v166 = 0;
          *(void *)(a1 + 56) |= 0x40uLL;
          while (2)
          {
            uint64_t v167 = *v3;
            unint64_t v168 = *(void *)(a2 + v167);
            if (v168 == -1 || v168 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v169 = *(unsigned char *)(*(void *)(a2 + *v7) + v168);
              *(void *)(a2 + v167) = v168 + 1;
              v166 |= (unint64_t)(v169 & 0x7F) << v164;
              if (v169 < 0)
              {
                v164 += 7;
                BOOL v14 = v165++ >= 9;
                if (v14)
                {
                  uint64_t v166 = 0;
                  goto LABEL_394;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v166 = 0;
          }
LABEL_394:
          BOOL v254 = v166 != 0;
          uint64_t v255 = 22;
          goto LABEL_451;
        case 0x1Du:
          char v170 = 0;
          unsigned int v171 = 0;
          uint64_t v172 = 0;
          *(void *)(a1 + 56) |= 0x800000uLL;
          while (2)
          {
            uint64_t v173 = *v3;
            unint64_t v174 = *(void *)(a2 + v173);
            if (v174 == -1 || v174 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v175 = *(unsigned char *)(*(void *)(a2 + *v7) + v174);
              *(void *)(a2 + v173) = v174 + 1;
              v172 |= (unint64_t)(v175 & 0x7F) << v170;
              if (v175 < 0)
              {
                v170 += 7;
                BOOL v14 = v171++ >= 9;
                if (v14)
                {
                  uint64_t v172 = 0;
                  goto LABEL_398;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v172 = 0;
          }
LABEL_398:
          BOOL v254 = v172 != 0;
          uint64_t v255 = 39;
          goto LABEL_451;
        case 0x1Eu:
          char v176 = 0;
          unsigned int v177 = 0;
          uint64_t v178 = 0;
          *(void *)(a1 + 56) |= 0x80uLL;
          while (2)
          {
            uint64_t v179 = *v3;
            unint64_t v180 = *(void *)(a2 + v179);
            if (v180 == -1 || v180 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v181 = *(unsigned char *)(*(void *)(a2 + *v7) + v180);
              *(void *)(a2 + v179) = v180 + 1;
              v178 |= (unint64_t)(v181 & 0x7F) << v176;
              if (v181 < 0)
              {
                v176 += 7;
                BOOL v14 = v177++ >= 9;
                if (v14)
                {
                  uint64_t v178 = 0;
                  goto LABEL_402;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v178 = 0;
          }
LABEL_402:
          BOOL v254 = v178 != 0;
          uint64_t v255 = 23;
          goto LABEL_451;
        case 0x1Fu:
          char v182 = 0;
          unsigned int v183 = 0;
          uint64_t v184 = 0;
          *(void *)(a1 + 56) |= 0x2000000uLL;
          while (2)
          {
            uint64_t v185 = *v3;
            unint64_t v186 = *(void *)(a2 + v185);
            if (v186 == -1 || v186 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v187 = *(unsigned char *)(*(void *)(a2 + *v7) + v186);
              *(void *)(a2 + v185) = v186 + 1;
              v184 |= (unint64_t)(v187 & 0x7F) << v182;
              if (v187 < 0)
              {
                v182 += 7;
                BOOL v14 = v183++ >= 9;
                if (v14)
                {
                  uint64_t v184 = 0;
                  goto LABEL_406;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v184 = 0;
          }
LABEL_406:
          BOOL v254 = v184 != 0;
          uint64_t v255 = 41;
          goto LABEL_451;
        case 0x20u:
          char v188 = 0;
          unsigned int v189 = 0;
          uint64_t v190 = 0;
          *(void *)(a1 + 56) |= 0x1000000uLL;
          while (2)
          {
            uint64_t v191 = *v3;
            unint64_t v192 = *(void *)(a2 + v191);
            if (v192 == -1 || v192 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v193 = *(unsigned char *)(*(void *)(a2 + *v7) + v192);
              *(void *)(a2 + v191) = v192 + 1;
              v190 |= (unint64_t)(v193 & 0x7F) << v188;
              if (v193 < 0)
              {
                v188 += 7;
                BOOL v14 = v189++ >= 9;
                if (v14)
                {
                  uint64_t v190 = 0;
                  goto LABEL_410;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v190 = 0;
          }
LABEL_410:
          BOOL v254 = v190 != 0;
          uint64_t v255 = 40;
          goto LABEL_451;
        case 0x21u:
          char v194 = 0;
          unsigned int v195 = 0;
          uint64_t v196 = 0;
          *(void *)(a1 + 56) |= 8uLL;
          while (2)
          {
            uint64_t v197 = *v3;
            unint64_t v198 = *(void *)(a2 + v197);
            if (v198 == -1 || v198 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v199 = *(unsigned char *)(*(void *)(a2 + *v7) + v198);
              *(void *)(a2 + v197) = v198 + 1;
              v196 |= (unint64_t)(v199 & 0x7F) << v194;
              if (v199 < 0)
              {
                v194 += 7;
                BOOL v14 = v195++ >= 9;
                if (v14)
                {
                  uint64_t v196 = 0;
                  goto LABEL_414;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v196 = 0;
          }
LABEL_414:
          BOOL v254 = v196 != 0;
          uint64_t v255 = 19;
          goto LABEL_451;
        case 0x22u:
          char v200 = 0;
          unsigned int v201 = 0;
          uint64_t v202 = 0;
          *(void *)(a1 + 56) |= 4uLL;
          while (2)
          {
            uint64_t v203 = *v3;
            unint64_t v204 = *(void *)(a2 + v203);
            if (v204 == -1 || v204 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v205 = *(unsigned char *)(*(void *)(a2 + *v7) + v204);
              *(void *)(a2 + v203) = v204 + 1;
              v202 |= (unint64_t)(v205 & 0x7F) << v200;
              if (v205 < 0)
              {
                v200 += 7;
                BOOL v14 = v201++ >= 9;
                if (v14)
                {
                  uint64_t v202 = 0;
                  goto LABEL_418;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v202 = 0;
          }
LABEL_418:
          BOOL v254 = v202 != 0;
          uint64_t v255 = 18;
          goto LABEL_451;
        case 0x23u:
          char v206 = 0;
          unsigned int v207 = 0;
          uint64_t v208 = 0;
          *(void *)(a1 + 56) |= 1uLL;
          while (2)
          {
            uint64_t v209 = *v3;
            unint64_t v210 = *(void *)(a2 + v209);
            if (v210 == -1 || v210 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v211 = *(unsigned char *)(*(void *)(a2 + *v7) + v210);
              *(void *)(a2 + v209) = v210 + 1;
              v208 |= (unint64_t)(v211 & 0x7F) << v206;
              if (v211 < 0)
              {
                v206 += 7;
                BOOL v14 = v207++ >= 9;
                if (v14)
                {
                  uint64_t v208 = 0;
                  goto LABEL_422;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v208 = 0;
          }
LABEL_422:
          BOOL v254 = v208 != 0;
          uint64_t v255 = 16;
          goto LABEL_451;
        case 0x24u:
          char v212 = 0;
          unsigned int v213 = 0;
          uint64_t v214 = 0;
          *(void *)(a1 + 56) |= 0x80000uLL;
          while (2)
          {
            uint64_t v215 = *v3;
            unint64_t v216 = *(void *)(a2 + v215);
            if (v216 == -1 || v216 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v217 = *(unsigned char *)(*(void *)(a2 + *v7) + v216);
              *(void *)(a2 + v215) = v216 + 1;
              v214 |= (unint64_t)(v217 & 0x7F) << v212;
              if (v217 < 0)
              {
                v212 += 7;
                BOOL v14 = v213++ >= 9;
                if (v14)
                {
                  uint64_t v214 = 0;
                  goto LABEL_426;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v214 = 0;
          }
LABEL_426:
          BOOL v254 = v214 != 0;
          uint64_t v255 = 35;
          goto LABEL_451;
        case 0x25u:
          char v218 = 0;
          unsigned int v219 = 0;
          uint64_t v220 = 0;
          *(void *)(a1 + 56) |= 0x1000uLL;
          while (2)
          {
            uint64_t v221 = *v3;
            unint64_t v222 = *(void *)(a2 + v221);
            if (v222 == -1 || v222 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v223 = *(unsigned char *)(*(void *)(a2 + *v7) + v222);
              *(void *)(a2 + v221) = v222 + 1;
              v220 |= (unint64_t)(v223 & 0x7F) << v218;
              if (v223 < 0)
              {
                v218 += 7;
                BOOL v14 = v219++ >= 9;
                if (v14)
                {
                  uint64_t v220 = 0;
                  goto LABEL_430;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v220 = 0;
          }
LABEL_430:
          BOOL v254 = v220 != 0;
          uint64_t v255 = 28;
          goto LABEL_451;
        case 0x26u:
          char v224 = 0;
          unsigned int v225 = 0;
          uint64_t v226 = 0;
          *(void *)(a1 + 56) |= 0x200uLL;
          while (2)
          {
            uint64_t v227 = *v3;
            unint64_t v228 = *(void *)(a2 + v227);
            if (v228 == -1 || v228 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v229 = *(unsigned char *)(*(void *)(a2 + *v7) + v228);
              *(void *)(a2 + v227) = v228 + 1;
              v226 |= (unint64_t)(v229 & 0x7F) << v224;
              if (v229 < 0)
              {
                v224 += 7;
                BOOL v14 = v225++ >= 9;
                if (v14)
                {
                  uint64_t v226 = 0;
                  goto LABEL_434;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v226 = 0;
          }
LABEL_434:
          BOOL v254 = v226 != 0;
          uint64_t v255 = 25;
          goto LABEL_451;
        case 0x27u:
          char v230 = 0;
          unsigned int v231 = 0;
          uint64_t v232 = 0;
          *(void *)(a1 + 56) |= 2uLL;
          while (2)
          {
            uint64_t v233 = *v3;
            unint64_t v234 = *(void *)(a2 + v233);
            if (v234 == -1 || v234 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v235 = *(unsigned char *)(*(void *)(a2 + *v7) + v234);
              *(void *)(a2 + v233) = v234 + 1;
              v232 |= (unint64_t)(v235 & 0x7F) << v230;
              if (v235 < 0)
              {
                v230 += 7;
                BOOL v14 = v231++ >= 9;
                if (v14)
                {
                  uint64_t v232 = 0;
                  goto LABEL_438;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v232 = 0;
          }
LABEL_438:
          BOOL v254 = v232 != 0;
          uint64_t v255 = 17;
          goto LABEL_451;
        case 0x28u:
          char v236 = 0;
          unsigned int v237 = 0;
          uint64_t v238 = 0;
          *(void *)(a1 + 56) |= 0x80000000uLL;
          while (2)
          {
            uint64_t v239 = *v3;
            unint64_t v240 = *(void *)(a2 + v239);
            if (v240 == -1 || v240 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v241 = *(unsigned char *)(*(void *)(a2 + *v7) + v240);
              *(void *)(a2 + v239) = v240 + 1;
              v238 |= (unint64_t)(v241 & 0x7F) << v236;
              if (v241 < 0)
              {
                v236 += 7;
                BOOL v14 = v237++ >= 9;
                if (v14)
                {
                  uint64_t v238 = 0;
                  goto LABEL_442;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v238 = 0;
          }
LABEL_442:
          BOOL v254 = v238 != 0;
          uint64_t v255 = 47;
          goto LABEL_451;
        case 0x29u:
          char v242 = 0;
          unsigned int v243 = 0;
          uint64_t v244 = 0;
          *(void *)(a1 + 56) |= 0x2000000000uLL;
          while (2)
          {
            uint64_t v245 = *v3;
            unint64_t v246 = *(void *)(a2 + v245);
            if (v246 == -1 || v246 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v247 = *(unsigned char *)(*(void *)(a2 + *v7) + v246);
              *(void *)(a2 + v245) = v246 + 1;
              v244 |= (unint64_t)(v247 & 0x7F) << v242;
              if (v247 < 0)
              {
                v242 += 7;
                BOOL v14 = v243++ >= 9;
                if (v14)
                {
                  uint64_t v244 = 0;
                  goto LABEL_446;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v244 = 0;
          }
LABEL_446:
          BOOL v254 = v244 != 0;
          uint64_t v255 = 53;
          goto LABEL_451;
        case 0x2Au:
          char v248 = 0;
          unsigned int v249 = 0;
          uint64_t v250 = 0;
          *(void *)(a1 + 56) |= 0x20000000uLL;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v251 = *v3;
        unint64_t v252 = *(void *)(a2 + v251);
        if (v252 == -1 || v252 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v253 = *(unsigned char *)(*(void *)(a2 + *v7) + v252);
        *(void *)(a2 + v251) = v252 + 1;
        v250 |= (unint64_t)(v253 & 0x7F) << v248;
        if ((v253 & 0x80) == 0) {
          goto LABEL_448;
        }
        v248 += 7;
        BOOL v14 = v249++ >= 9;
        if (v14)
        {
          uint64_t v250 = 0;
          goto LABEL_450;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_448:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v250 = 0;
      }
LABEL_450:
      BOOL v254 = v250 != 0;
      uint64_t v255 = 45;
LABEL_451:
      *(unsigned char *)(a1 + v255) = v254;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D363E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__33125(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__33126(uint64_t a1)
{
}

void sub_19D3669E8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D367260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D36C970(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_19D36DC7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D36ED1C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D37A418(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19D37ADC8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_19D37C52C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 160));
  _Unwind_Resume(a1);
}

void sub_19D37DC5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D380104(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3801EC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D38192C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D381F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D382488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D382E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D383B30(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D383E28(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D383EAC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D384078(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3840FC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D38484C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D38492C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D385DAC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D385E30(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D386084(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D386114(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3861A4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D386234(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3862C4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D386410(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3866D4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D386868(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3868EC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D386970(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D387EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
}

id HMAccessoryTransportTypesToString(char a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = v2;
  if (a1)
  {
    [v2 addObject:@"IP"];
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:@"BluetoothLE"];
  if ((a1 & 8) == 0)
  {
LABEL_4:
    if ((a1 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  [v3 addObject:@"WAC"];
  if ((a1 & 0x10) != 0) {
LABEL_5:
  }
    [v3 addObject:@"AirPlay"];
LABEL_6:
  unint64_t v4 = [v3 componentsJoinedByString:@";"];

  return v4;
}

__CFString *HMAccessoryLinkQualityToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Unknown";
  }
  else {
    return off_1E5942A28[a1 - 1];
  }
}

uint64_t HMAccessoryInfoProtoWifiNetworkInfoEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_26;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 48;
          goto LABEL_26;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_26;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_26;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
LABEL_26:
          char v20 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose(&a9, 8) = v17;

          continue;
        case 6u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 60) |= 1u;
          while (2)
          {
            uint64_t v24 = *v3;
            unint64_t v25 = *(void *)(a2 + v24);
            if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
              *(void *)(a2 + v24) = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                BOOL v14 = v22++ >= 9;
                if (v14)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_46;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v23) = 0;
          }
LABEL_46:
          *(_DWORD *)(a1 + 40) = v23;
          continue;
        case 7u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          *(unsigned char *)(a1 + 60) |= 2u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v30 = *v3;
        unint64_t v31 = *(void *)(a2 + v30);
        if (v31 == -1 || v31 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
        *(void *)(a2 + v30) = v31 + 1;
        v29 |= (unint64_t)(v32 & 0x7F) << v27;
        if ((v32 & 0x80) == 0) {
          goto LABEL_48;
        }
        v27 += 7;
        BOOL v14 = v28++ >= 9;
        if (v14)
        {
          uint64_t v29 = 0;
          goto LABEL_50;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_48:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v29 = 0;
      }
LABEL_50:
      *(unsigned char *)(a1 + 56) = v29 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t HMAccessoryInfoProtoSoftwareVersionInfoEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 40) |= 1u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_44;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_46;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_44:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_46:
          uint64_t v36 = 8;
          goto LABEL_55;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 40) |= 2u;
          while (2)
          {
            uint64_t v26 = *v3;
            unint64_t v27 = *(void *)(a2 + v26);
            if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
              *(void *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_50:
          uint64_t v36 = 16;
          goto LABEL_55;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 40) |= 4u;
          break;
        case 4u:
          uint64_t v34 = PBReaderReadString();
          uint64_t v35 = *(void **)(a1 + 32);
          *(void *)(a1 + 32) = v34;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v31 = *v3;
        unint64_t v32 = *(void *)(a2 + v31);
        if (v32 == -1 || v32 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
        *(void *)(a2 + v31) = v32 + 1;
        v19 |= (unint64_t)(v33 & 0x7F) << v29;
        if ((v33 & 0x80) == 0) {
          goto LABEL_52;
        }
        v29 += 7;
        BOOL v14 = v30++ >= 9;
        if (v14)
        {
          uint64_t v19 = 0;
          goto LABEL_54;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_52:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v19 = 0;
      }
LABEL_54:
      uint64_t v36 = 24;
LABEL_55:
      *(void *)(a1 + v36) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D38CC38(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D38CE60(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D38CEC4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D38CF34(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D38D0FC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D38D308(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D38D36C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D38D3DC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D38E984(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D38EC88(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D38ED08(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D38F00C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D38F310(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D38F390(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D391DF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_unfair_lock_t lock)
{
}

void sub_19D391EE0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D392000(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3926C0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D392734(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3929EC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D393860(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D396658(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D396704(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3967A0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMAccessorySettingsPartialFetchFailureTypeToString(unint64_t a1)
{
  if (a1 >= 4)
  {
    uint64_t v2 = NSString;
    uint64_t v3 = [NSNumber numberWithInteger:a1];
    uint64_t v1 = [v2 stringWithFormat:@"Unknown type (%@)", v3];
  }
  else
  {
    uint64_t v1 = off_1E5942C08[a1];
  }

  return v1;
}

void sub_19D3974B8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMCameraHomePresenceAsString(uint64_t a1)
{
  if (a1 == 3)
  {
    uint64_t v2 = @"HMCameraHomePresenceHome";
  }
  else if (a1 == 4)
  {
    uint64_t v2 = @"HMCameraHomePresenceNotAtHome";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMCameraHomePresence %tu", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *HMCameraAccessModeAsString(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid value: %lu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5942DA8[a1];
  }

  return v1;
}

uint64_t HMCameraSignificantEventTypesFromReasons(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v1);
        }
        switch([*(id *)(*((void *)&v8 + 1) + 8 * i) unsignedIntegerValue])
        {
          case 1:
            v4 |= 1uLL;
            break;
          case 2:
            v4 |= 2uLL;
            break;
          case 3:
            v4 |= 4uLL;
            break;
          case 4:
            v4 |= 8uLL;
            break;
          case 5:
            v4 |= 0x10uLL;
            break;
          default:
            continue;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

BOOL HMIsRecordingAllowedForCameraAccessMode(uint64_t a1)
{
  return a1 == 2;
}

BOOL HMIsStreamingAllowedForCameraAccessMode(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

BOOL HMIsMotionDetectionAllowedForCameraAccessMode(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

BOOL HMIsSignificantEventDetectionAllowedForCameraAccessMode(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

uint64_t HMCameraSignificantEventTypesAsString()
{
  return NSPrintF();
}

uint64_t HMCameraSupportedFeaturesAsString()
{
  return NSPrintF();
}

uint64_t HMCameraSignificantEventPersonFamiliarityOptionsAsString()
{
  return NSPrintF();
}

__CFString *HMPresenceEventActivationGranularityAsString(uint64_t a1)
{
  if (a1 == 1)
  {
    uint64_t v2 = @"HMPresenceEventActivationGranularityUser";
  }
  else if (a1 == 2)
  {
    uint64_t v2 = @"HMPresenceEventActivationGranularityHome";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMPresenceEventActivationGranularity %tu", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t HMRemoteEventRouterProtoServerDiagnosticInfoReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 40) |= 2u;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_49;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_51;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_49:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_51:
        *(void *)(a1 + 16) = v20;
        goto LABEL_63;
      case 2u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v27 = 0;
        *(unsigned char *)(a1 + 40) |= 8u;
        while (2)
        {
          uint64_t v28 = *v3;
          uint64_t v29 = *(void *)(a2 + v28);
          unint64_t v30 = v29 + 1;
          if (v29 == -1 || v30 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
            *(void *)(a2 + v2_Block_object_dispose(&a9, 8) = v30;
            v27 |= (unint64_t)(v31 & 0x7F) << v25;
            if (v31 < 0)
            {
              v25 += 7;
              BOOL v15 = v26++ >= 9;
              if (v15)
              {
                LODWORD(v27) = 0;
                goto LABEL_55;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v27) = 0;
        }
LABEL_55:
        uint64_t v43 = 36;
        goto LABEL_60;
      case 3u:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v27 = 0;
        *(unsigned char *)(a1 + 40) |= 4u;
        while (2)
        {
          uint64_t v34 = *v3;
          uint64_t v35 = *(void *)(a2 + v34);
          unint64_t v36 = v35 + 1;
          if (v35 == -1 || v36 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
            *(void *)(a2 + v34) = v36;
            v27 |= (unint64_t)(v37 & 0x7F) << v32;
            if (v37 < 0)
            {
              v32 += 7;
              BOOL v15 = v33++ >= 9;
              if (v15)
              {
                LODWORD(v27) = 0;
                goto LABEL_59;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v27) = 0;
        }
LABEL_59:
        uint64_t v43 = 32;
LABEL_60:
        *(_DWORD *)(a1 + v43) = v27;
        goto LABEL_63;
      case 4u:
        *(unsigned char *)(a1 + 40) |= 1u;
        uint64_t v38 = *v3;
        unint64_t v39 = *(void *)(a2 + v38);
        if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v40 = *(void *)(*(void *)(a2 + *v7) + v39);
          *(void *)(a2 + v3_Block_object_dispose(&a9, 8) = v39 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v40 = 0;
        }
        *(void *)(a1 + _Block_object_dispose(&a9, 8) = v40;
        goto LABEL_63;
      case 0xBu:
        unint64_t v42 = objc_alloc_init(HMRemoteEventRouterProtoConnectedClientInfo);
        [(id)a1 addConnectedClients:v42];
        if (PBReaderPlaceMark()
          && (HMRemoteEventRouterProtoConnectedClientInfoReadFrom((uint64_t)v42, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_63:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_63;
    }
  }
}

void sub_19D39E7B0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D39E8DC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMPBHomeReferenceReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadData();
        char v18 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(&a9, 8) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D3A0074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,uint64_t a27,uint64_t a28,char a29)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__38136(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__38137(uint64_t a1)
{
}

void *__getAnalyticsSendEventLazySymbolLoc_block_invoke_38247(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!CoreAnalyticsLibraryCore_frameworkLibrary_38249)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __CoreAnalyticsLibraryCore_block_invoke_38250;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E5942F88;
    uint64_t v7 = 0;
    CoreAnalyticsLibraryCore_frameworkLibrary_38249 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)CoreAnalyticsLibraryCore_frameworkLibrary_38249;
    if (CoreAnalyticsLibraryCore_frameworkLibrary_38249)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)CoreAnalyticsLibraryCore_frameworkLibrary_38249;
LABEL_5:
  uint64_t result = dlsym(v2, "AnalyticsSendEventLazy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAnalyticsSendEventLazySymbolLoc_ptr_38246 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreAnalyticsLibraryCore_block_invoke_38250()
{
  uint64_t result = _sl_dlopen();
  CoreAnalyticsLibraryCore_frameworkLibrary_38249 = result;
  return result;
}

void sub_19D3A5EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D3A6370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D3A6584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D3A698C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D3A72A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D3A8BD8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3A8C54(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3A929C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D3A9610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D3AA1DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

Class __getSFDeviceClass_block_invoke(uint64_t a1)
{
  SharingLibrary();
  Class result = objc_getClass("SFDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSFDeviceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__28__HMSymptomFixSession_start__block_invoke(v3);
  }
  return result;
}

void SharingLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!SharingLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __SharingLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5943148;
    uint64_t v3 = 0;
    SharingLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v0 = (void *)v1[0];
    if (SharingLibraryCore_frameworkLibrary)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      uint64_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __SharingLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SharingLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_19D3AB988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getSFDeviceRepairSessionClass_block_invoke(uint64_t a1)
{
  SharingLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SFDeviceRepairSession");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSFDeviceRepairSessionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    long long v2 = (HMSetting *)abort_report_np();
    [(HMSetting *)v2 .cxx_destruct];
  }
}

uint64_t HMImmutableSettingsProtoBoundedIntegerSettingEventReadFrom(uint64_t a1, uint64_t a2)
{
  SEL v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = objc_alloc_init(HMImmutableSettingsProtoIntegerValueEvent);
          objc_storeStrong((id *)(a1 + 32), v17);
          if (PBReaderPlaceMark()
            && (HMImmutableSettingsProtoIntegerValueEventReadFrom((uint64_t)v17, a2) & 1) != 0)
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)(a1 + 40) |= 2u;
          while (1)
          {
            uint64_t v22 = *v3;
            unint64_t v23 = *(void *)(a2 + v22);
            if (v23 == -1 || v23 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0) {
              goto LABEL_46;
            }
            v19 += 7;
            BOOL v14 = v20++ >= 9;
            if (v14)
            {
              uint64_t v21 = 0;
              goto LABEL_48;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_46:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v21 = 0;
          }
LABEL_48:
          uint64_t v35 = 16;
          goto LABEL_57;
        case 3u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)(a1 + 40) |= 1u;
          while (2)
          {
            uint64_t v27 = *v3;
            unint64_t v28 = *(void *)(a2 + v27);
            if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
              *(void *)(a2 + v27) = v28 + 1;
              v21 |= (unint64_t)(v29 & 0x7F) << v25;
              if (v29 < 0)
              {
                v25 += 7;
                BOOL v14 = v26++ >= 9;
                if (v14)
                {
                  uint64_t v21 = 0;
                  goto LABEL_52;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v21 = 0;
          }
LABEL_52:
          uint64_t v35 = 8;
          goto LABEL_57;
        case 4u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)(a1 + 40) |= 4u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v32 = *v3;
        unint64_t v33 = *(void *)(a2 + v32);
        if (v33 == -1 || v33 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
        *(void *)(a2 + v32) = v33 + 1;
        v21 |= (unint64_t)(v34 & 0x7F) << v30;
        if ((v34 & 0x80) == 0) {
          goto LABEL_54;
        }
        v30 += 7;
        BOOL v14 = v31++ >= 9;
        if (v14)
        {
          uint64_t v21 = 0;
          goto LABEL_56;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_54:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v21 = 0;
      }
LABEL_56:
      uint64_t v35 = 24;
LABEL_57:
      *(void *)(a1 + v35) = v21;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL HMPBCommandContainerReadFrom(uint64_t a1, uint64_t a2)
{
  SEL v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
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
      if (v9++ >= 9)
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
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 32;
        goto LABEL_26;
      case 2u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 40;
        goto LABEL_26;
      case 3u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 16;
        goto LABEL_26;
      case 4u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 24;
        goto LABEL_26;
      case 5u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 48;
LABEL_26:
        char v19 = *(HMPBAccessoryReference **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&location, 8) = v17;
        goto LABEL_27;
      case 6u:
        char v19 = objc_alloc_init(HMPBAccessoryReference);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (PBReaderPlaceMark() && HMPBAccessoryReferenceReadFrom((uint64_t)v19, a2))
        {
          PBReaderRecallMark();
LABEL_27:

LABEL_28:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_28;
    }
  }
}

BOOL HMAccessoryInfoProtoAirportInfoEventReadFrom(uint64_t a1, uint64_t a2)
{
  SEL v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 16;
LABEL_22:
        char v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&location, 8) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadData();
    uint64_t v18 = 8;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D3B081C(_Unwind_Exception *a1)
{
}

void sub_19D3B0DF8(_Unwind_Exception *a1)
{
}

void sub_19D3B149C(_Unwind_Exception *a1)
{
}

__CFString *HMAccountStatusToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"HMAccountStatus_PrimaryAccountAdded";
  }
  else {
    return off_1E5943228[a1 - 1];
  }
}

__CFString *HMStringFromIntentRequestType(uint64_t a1)
{
  uint64_t v1 = @"execute";
  if (a1 != 1) {
    uint64_t v1 = 0;
  }
  if (a1) {
    return v1;
  }
  else {
    return @"confirm";
  }
}

void sub_19D3B2C10(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3B5D58(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3B6364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D3B6698(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3B67C0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3B8614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  os_unfair_lock_unlock(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__41357(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__41358(uint64_t a1)
{
}

void sub_19D3BB590(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3BB60C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3BB7A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3BB894(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3BB964(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMImmutableSettingTypeAsString(unint64_t a1)
{
  if (a1 >= 7)
  {
    long long v2 = NSString;
    SEL v3 = [NSNumber numberWithInteger:a1];
    uint64_t v1 = [v2 stringWithFormat:@"UnknownType(%@)", v3];
  }
  else
  {
    uint64_t v1 = off_1E59432C8[a1];
  }

  return v1;
}

void sub_19D3BFCAC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3C2B20(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3C2BFC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3C2EA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D3C544C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3C5600(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3C57B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t IDSFoundationLibraryCore_42280()
{
  if (!IDSFoundationLibraryCore_frameworkLibrary_42282) {
    IDSFoundationLibraryCore_frameworkLibrary_42282 = _sl_dlopen();
  }
  return IDSFoundationLibraryCore_frameworkLibrary_42282;
}

Class __getIDSURIClass_block_invoke(uint64_t a1)
{
  if (!IDSFoundationLibraryCore_42280())
  {
    SEL v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("IDSURI");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getIDSURIClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)__IDSFoundationLibraryCore_block_invoke_42283();
  }
  return result;
}

uint64_t __IDSFoundationLibraryCore_block_invoke_42283()
{
  uint64_t result = _sl_dlopen();
  IDSFoundationLibraryCore_frameworkLibrary_42282 = result;
  return result;
}

void sub_19D3C5A2C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3C6358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D3C6E80(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_19D3C7190(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3C7AEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D3C9514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D3C985C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3C9C60(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3C9D48(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3C9E30(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3C9F18(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3CA944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D3CB1CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t UIKitLibraryCore_42511()
{
  if (!UIKitLibraryCore_frameworkLibrary_42524) {
    UIKitLibraryCore_frameworkLibrary_42524 = _sl_dlopen();
  }
  return UIKitLibraryCore_frameworkLibrary_42524;
}

void *__getNSDocumentTypeDocumentAttributeSymbolLoc_block_invoke_42514(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitLibrary_42515();
  uint64_t result = dlsym(v2, "NSDocumentTypeDocumentAttribute");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNSDocumentTypeDocumentAttributeSymbolLoc_ptr_42513 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t UIKitLibrary_42515()
{
  uint64_t v0 = UIKitLibraryCore_42511();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *__getNSHTMLTextDocumentTypeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitLibrary_42515();
  uint64_t result = dlsym(v2, "NSHTMLTextDocumentType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNSHTMLTextDocumentTypeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getNSCharacterEncodingDocumentAttributeSymbolLoc_block_invoke_42520(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitLibrary_42515();
  uint64_t result = dlsym(v2, "NSCharacterEncodingDocumentAttribute");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr_42519 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __UIKitLibraryCore_block_invoke_42525()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrary_42524 = result;
  return result;
}

__CFString *HMStringFromCameraSignificantEventConfidenceLevel(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v2 = @"low";
      break;
    case 100:
      uint64_t v2 = @"high";
      break;
    case 50:
      uint64_t v2 = @"medium";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown type: %lu", a1);
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v2;
}

__CFString *HMStringFromCameraSignificantEventReason(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown type: %lu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E59435C0[a1 - 1];
  }

  return v1;
}

uint64_t HMAccessoryInfoProtoSleepWakeStateEventReadFrom(uint64_t a1, uint64_t a2)
{
  SEL v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 16) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_31:
        *(void *)(a1 + _Block_object_dispose(&location, 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D3D1388(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3D304C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3D341C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3D3900(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3D3E4C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3D5680(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3DB108(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3DB64C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3DB768(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfoReadFrom(uint64_t a1, uint64_t a2)
{
  SEL v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
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
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = objc_alloc_init(HMAccessoryInfoProtoWifiNetworkInfoEvent);
        objc_storeStrong((id *)(a1 + 80), v17);
        if (PBReaderPlaceMark()
          && (HMAccessoryInfoProtoWifiNetworkInfoEventReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
          goto LABEL_42;
        }
        goto LABEL_69;
      case 2u:
        char v17 = objc_alloc_init(HMAccessoryInfoProtoNetworkInfoEvent);
        [(id)a1 addNetworkInfo:v17];
        if (!PBReaderPlaceMark()
          || !HMAccessoryInfoProtoNetworkInfoEventReadFrom((id *)&v17->super.super.isa, a2))
        {
          goto LABEL_69;
        }
        goto LABEL_42;
      case 3u:
        char v17 = objc_alloc_init(HMAccessoryInfoProtoNetworkServiceEvent);
        [(id)a1 addNetworkServiceInfo:v17];
        if (!PBReaderPlaceMark() || (HMAccessoryInfoProtoNetworkServiceEventReadFrom(v17, a2) & 1) == 0) {
          goto LABEL_69;
        }
        goto LABEL_42;
      case 6u:
        char v17 = objc_alloc_init(HMRemoteEventRouterProtoServerDiagnosticInfo);
        objc_storeStrong((id *)(a1 + 24), v17);
        if (!PBReaderPlaceMark()
          || (HMRemoteEventRouterProtoServerDiagnosticInfoReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_69;
        }
        goto LABEL_42;
      case 0xBu:
        char v17 = objc_alloc_init(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo);
        [(id)a1 addVisibleAccessoriesInfo:v17];
        if (!PBReaderPlaceMark()
          || (HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfoReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_69;
        }
        goto LABEL_42;
      case 0xCu:
        PBReaderReadString();
        char v17 = (HMAccessoryInfoProtoWifiNetworkInfoEvent *)objc_claimAutoreleasedReturnValue();
        if (v17) {
          [(id)a1 addVisibleIDSDevices:v17];
        }
        goto LABEL_43;
      case 0xDu:
        char v17 = objc_alloc_init(HMAccessoryDiagnosticInfoProtoVisibleDeviceInfo);
        [(id)a1 addNetworkVisibleDeviceInfos:v17];
        goto LABEL_40;
      case 0xEu:
        char v17 = objc_alloc_init(HMAccessoryDiagnosticInfoProtoVisibleDeviceInfo);
        [(id)a1 addProximityVisibleDeviceInfos:v17];
LABEL_40:
        if (PBReaderPlaceMark()
          && HMAccessoryDiagnosticInfoProtoVisibleDeviceInfoReadFrom((uint64_t)v17, a2))
        {
LABEL_42:
          PBReaderRecallMark();
LABEL_43:

LABEL_67:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_69:

        return 0;
      case 0xFu:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 88) |= 1u;
        while (2)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if (v24 < 0)
            {
              v19 += 7;
              BOOL v14 = v20++ >= 9;
              if (v14)
              {
                uint64_t v21 = 0;
                goto LABEL_61;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v21 = 0;
        }
LABEL_61:
        uint64_t v30 = 8;
        goto LABEL_66;
      case 0x10u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 88) |= 2u;
        while (2)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v28 + 1;
            v21 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              BOOL v14 = v26++ >= 9;
              if (v14)
              {
                uint64_t v21 = 0;
                goto LABEL_65;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v21 = 0;
        }
LABEL_65:
        uint64_t v30 = 16;
LABEL_66:
        *(void *)(a1 + v30) = v21;
        goto LABEL_67;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_67;
    }
  }
}

BOOL HMXPCEventRouterProtoEventsMessageReadFrom(void *a1, uint64_t a2)
{
  SEL v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 3)
      {
        id v17 = objc_alloc_init(MEMORY[0x1E4F69F80]);
        [a1 addCachedEvents:v17];
      }
      else
      {
        if ((v10 >> 3) != 2)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
          continue;
        }
        id v17 = objc_alloc_init(MEMORY[0x1E4F69F80]);
        [a1 addEvents:v17];
      }
      if (!PBReaderPlaceMark() || (HMEProtoEventInfoReadFrom() & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t HMSoftwareUpdateEventProtoSoftwareUpdateDescriptorReadFrom(uint64_t a1, uint64_t a2)
{
  SEL v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 100) |= 0x10u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_77;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_79;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_77:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_79:
          uint64_t v58 = 40;
          goto LABEL_104;
        case 2u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 88;
          goto LABEL_61;
        case 3u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 72;
          goto LABEL_61;
        case 4u:
          uint64_t v24 = PBReaderReadData();
          uint64_t v25 = 80;
          goto LABEL_61;
        case 5u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 100) |= 4u;
          while (2)
          {
            uint64_t v28 = *v3;
            unint64_t v29 = *(void *)(a2 + v28);
            if (v29 == -1 || v29 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
              *(void *)(a2 + v2_Block_object_dispose(&location, 8) = v29 + 1;
              v19 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_83;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_83:
          uint64_t v58 = 24;
          goto LABEL_104;
        case 6u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 100) |= 8u;
          while (2)
          {
            uint64_t v33 = *v3;
            unint64_t v34 = *(void *)(a2 + v33);
            if (v34 == -1 || v34 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
              *(void *)(a2 + v33) = v34 + 1;
              v19 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                BOOL v14 = v32++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_87;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_87:
          uint64_t v58 = 32;
          goto LABEL_104;
        case 7u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 100) |= 0x20u;
          while (2)
          {
            uint64_t v38 = *v3;
            unint64_t v39 = *(void *)(a2 + v38);
            if (v39 == -1 || v39 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
              *(void *)(a2 + v3_Block_object_dispose(&location, 8) = v39 + 1;
              v19 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                BOOL v14 = v37++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_91;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_91:
          uint64_t v58 = 48;
          goto LABEL_104;
        case 8u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 56;
          goto LABEL_61;
        case 9u:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 100) |= 1u;
          while (2)
          {
            uint64_t v43 = *v3;
            unint64_t v44 = *(void *)(a2 + v43);
            if (v44 == -1 || v44 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v45 = *(unsigned char *)(*(void *)(a2 + *v7) + v44);
              *(void *)(a2 + v43) = v44 + 1;
              v19 |= (unint64_t)(v45 & 0x7F) << v41;
              if (v45 < 0)
              {
                v41 += 7;
                BOOL v14 = v42++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_95;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_95:
          uint64_t v58 = 8;
          goto LABEL_104;
        case 0xAu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 64;
LABEL_61:
          uint64_t v46 = *(void **)(a1 + v25);
          *(void *)(a1 + v25) = v24;

          continue;
        case 0xBu:
          char v47 = 0;
          unsigned int v48 = 0;
          uint64_t v49 = 0;
          *(unsigned char *)(a1 + 100) |= 0x40u;
          while (2)
          {
            uint64_t v50 = *v3;
            unint64_t v51 = *(void *)(a2 + v50);
            if (v51 == -1 || v51 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v52 = *(unsigned char *)(*(void *)(a2 + *v7) + v51);
              *(void *)(a2 + v50) = v51 + 1;
              v49 |= (unint64_t)(v52 & 0x7F) << v47;
              if (v52 < 0)
              {
                v47 += 7;
                BOOL v14 = v48++ >= 9;
                if (v14)
                {
                  uint64_t v49 = 0;
                  goto LABEL_99;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v49 = 0;
          }
LABEL_99:
          *(unsigned char *)(a1 + 96) = v49 != 0;
          continue;
        case 0xCu:
          char v53 = 0;
          unsigned int v54 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 100) |= 2u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v55 = *v3;
        unint64_t v56 = *(void *)(a2 + v55);
        if (v56 == -1 || v56 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v57 = *(unsigned char *)(*(void *)(a2 + *v7) + v56);
        *(void *)(a2 + v55) = v56 + 1;
        v19 |= (unint64_t)(v57 & 0x7F) << v53;
        if ((v57 & 0x80) == 0) {
          goto LABEL_101;
        }
        v53 += 7;
        BOOL v14 = v54++ >= 9;
        if (v14)
        {
          uint64_t v19 = 0;
          goto LABEL_103;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_101:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v19 = 0;
      }
LABEL_103:
      uint64_t v58 = 16;
LABEL_104:
      *(void *)(a1 + v5_Block_object_dispose(&location, 8) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t HMMediaGroupProtoMediaGroupDataReadFrom(uint64_t a1, uint64_t a2)
{
  SEL v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
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
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
        goto LABEL_27;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 40;
        goto LABEL_27;
      case 3u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 48;
        goto LABEL_27;
      case 4u:
        PBReaderReadString();
        uint64_t v20 = (HMMediaGroupProtoMediaGroupRole *)objc_claimAutoreleasedReturnValue();
        if (v20) {
          [(id)a1 addDestinationIdentifiers:v20];
        }
        goto LABEL_31;
      case 5u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
LABEL_27:
        unint64_t v21 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&location, 8) = v17;

        goto LABEL_43;
      case 6u:
        uint64_t v20 = objc_alloc_init(HMMediaGroupProtoMediaGroupRole);
        objc_storeStrong((id *)(a1 + 24), v20);
        if PBReaderPlaceMark() && (HMMediaGroupProtoMediaGroupRoleReadFrom((uint64_t)v20, a2))
        {
          PBReaderRecallMark();
LABEL_31:

LABEL_43:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 7u:
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0;
        *(unsigned char *)(a1 + 60) |= 1u;
        while (2)
        {
          uint64_t v25 = *v3;
          unint64_t v26 = *(void *)(a2 + v25);
          if (v26 == -1 || v26 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
            *(void *)(a2 + v25) = v26 + 1;
            v24 |= (unint64_t)(v27 & 0x7F) << v22;
            if (v27 < 0)
            {
              v22 += 7;
              BOOL v14 = v23++ >= 9;
              if (v14)
              {
                uint64_t v24 = 0;
                goto LABEL_42;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v24 = 0;
        }
LABEL_42:
        *(unsigned char *)(a1 + 56) = v24 != 0;
        goto LABEL_43;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_43;
    }
  }
}

void sub_19D3E9AC8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __secureDescription(void *a1, char a2)
{
  id v3 = a1;
  int v15 = NSString;
  uint64_t v4 = objc_opt_class();
  char v17 = a2;
  if (a2)
  {
    uint64_t v18 = &stru_1EEE9DD88;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", v3);
    uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  int v16 = [v3 releaseNotesSummary];
  uint64_t v5 = HMFBooleanToString();
  long long v6 = [v3 releaseNotes];
  uint64_t v7 = HMFBooleanToString();
  char v8 = [v3 textReleaseNotes];
  unsigned int v9 = HMFBooleanToString();
  unint64_t v10 = [v3 licenseAgreement];
  uint64_t v11 = HMFBooleanToString();
  unint64_t v12 = [v3 licenseAgreementVersion];
  char v13 = [v15 stringWithFormat:@"<%@%@, Summary = %@, Release Notes = %@, Text Release Notes = %@, License = %@, License Version = %@>", v4, v18, v5, v7, v9, v11, v12];

  if ((v17 & 1) == 0) {

  }
  return v13;
}

void sub_19D3EB648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL HMAccessoryInfoProtoNetworkInfoEventReadFrom(id *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
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
      if (v9++ >= 9)
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
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 1;
        goto LABEL_24;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 4;
        goto LABEL_24;
      case 3u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 5;
LABEL_24:
        uint64_t v19 = (HMAccessoryInfoProtoAirportInfoEvent *)a1[v18];
        a1[v18] = (id)v17;
        goto LABEL_32;
      case 4u:
        PBReaderReadString();
        uint64_t v19 = (HMAccessoryInfoProtoAirportInfoEvent *)objc_claimAutoreleasedReturnValue();
        if (v19) {
          [a1 addIpv4Addresses:v19];
        }
        goto LABEL_32;
      case 5u:
        PBReaderReadString();
        uint64_t v19 = (HMAccessoryInfoProtoAirportInfoEvent *)objc_claimAutoreleasedReturnValue();
        if (v19) {
          [a1 addIpv6Addresses:v19];
        }
        goto LABEL_32;
      case 6u:
        uint64_t v19 = objc_alloc_init(HMAccessoryInfoProtoAirportInfoEvent);
        objc_storeStrong(a1 + 6, v19);
        if (PBReaderPlaceMark() && HMAccessoryInfoProtoAirportInfoEventReadFrom((uint64_t)v19, a2))
        {
          PBReaderRecallMark();
LABEL_32:

LABEL_33:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_33;
    }
  }
}

BOOL HMImmutableSettingsProtoLanguageValueEventReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_25;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_25;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_25;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
LABEL_25:
          uint64_t v19 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose(&location, 8) = v17;

          goto LABEL_26;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_26:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t HMImmutableSettingsProtoValueEventReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
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
      if (v9++ >= 9)
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
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 0u:
        unsigned int v17 = 0;
        do
        {
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 == -1 || v19 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
            goto LABEL_40;
          }
          unint64_t v20 = v19 + 1;
          int v21 = *(char *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v1_Block_object_dispose(&location, 8) = v20;
          if ((v21 & 0x80000000) == 0) {
            break;
          }
        }
        while (v17++ <= 8);
        goto LABEL_40;
      case 1u:
        [(id)a1 clearOneofValuesForSettingValueEvent];
        *(unsigned char *)(a1 + 48) |= 1u;
        *(_DWORD *)(a1 + 32) = 1;
        uint64_t v24 = objc_alloc_init(HMImmutableSettingsProtoStringValueEvent);
        objc_storeStrong((id *)(a1 + 40), v24);
        if (!PBReaderPlaceMark()
          || (HMImmutableSettingsProtoStringValueEventReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
          goto LABEL_44;
        }
        goto LABEL_39;
      case 2u:
        [(id)a1 clearOneofValuesForSettingValueEvent];
        *(unsigned char *)(a1 + 48) |= 1u;
        *(_DWORD *)(a1 + 32) = 2;
        uint64_t v24 = objc_alloc_init(HMImmutableSettingsProtoIntegerValueEvent);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark()
          || (HMImmutableSettingsProtoIntegerValueEventReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
          goto LABEL_44;
        }
        goto LABEL_39;
      case 3u:
        [(id)a1 clearOneofValuesForSettingValueEvent];
        *(unsigned char *)(a1 + 48) |= 1u;
        *(_DWORD *)(a1 + 32) = 3;
        uint64_t v24 = objc_alloc_init(HMImmutableSettingsProtoBoolValueEvent);
        objc_storeStrong((id *)(a1 + 8), v24);
        if (!PBReaderPlaceMark()
          || (HMImmutableSettingsProtoBoolValueEventReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
          goto LABEL_44;
        }
        goto LABEL_39;
      case 4u:
        [(id)a1 clearOneofValuesForSettingValueEvent];
        *(unsigned char *)(a1 + 48) |= 1u;
        *(_DWORD *)(a1 + 32) = 4;
        uint64_t v24 = objc_alloc_init(HMImmutableSettingsProtoLanguageValueEvent);
        objc_storeStrong((id *)(a1 + 24), v24);
        if (PBReaderPlaceMark() && HMImmutableSettingsProtoLanguageValueEventReadFrom((uint64_t)v24, a2))
        {
LABEL_39:
          PBReaderRecallMark();

LABEL_40:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_44:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_40;
    }
  }
}

__CFString *HMSettingConstraintTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Unknown";
  }
  else {
    return off_1E5943BD8[a1 - 1];
  }
}

void sub_19D3F8A98(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3F8DE0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3F8EAC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3F91CC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3FA0F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_unfair_lock_t lock)
{
}

void sub_19D3FA45C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3FA70C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMDLocationAuthorizationAsString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown auth: %ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5943CB0[a1];
  }

  return v1;
}

__CFString *HMDRegionStateString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown region state: %ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5943CC8[a1];
  }

  return v1;
}

__CFString *HMCLAuthorizationStatusAsString(unsigned int a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown location authorization: %ld", (int)a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5943CE0[a1];
  }

  return v1;
}

__CFString *HMCLRegionStateAsString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown region state: %ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5943D08[a1];
  }

  return v1;
}

uint64_t HMIsValidRegion(void *a1)
{
  id v1 = a1;
  if (v1
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    if ([v1 notifyOnEntry]) {
      uint64_t v2 = 1;
    }
    else {
      uint64_t v2 = [v1 notifyOnExit];
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t HMSoftwareUpdateEventProtoSoftwareUpdateProgressReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        *(unsigned char *)(a1 + 20) |= 1u;
        uint64_t v21 = *v3;
        unint64_t v22 = *(void *)(a2 + v21);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v23 = 0;
        }
        *(void *)(a1 + _Block_object_dispose(&location, 8) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        *(unsigned char *)(a1 + 20) |= 2u;
        uint64_t v18 = *v3;
        unint64_t v19 = *(void *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFFBLL && v19 + 4 <= *(void *)(a2 + *v4))
        {
          int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v1_Block_object_dispose(&location, 8) = v19 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v20 = 0;
        }
        *(_DWORD *)(a1 + 16) = v20;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D3FEF90(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3FF190(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3FF348(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D3FF4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  os_unfair_lock_unlock(v7);
  _Unwind_Resume(a1);
}

uint64_t WorkflowKitLibraryCore()
{
  if (!WorkflowKitLibraryCore_frameworkLibrary) {
    WorkflowKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return WorkflowKitLibraryCore_frameworkLibrary;
}

Class __getWFHomeWorkflowClass_block_invoke(uint64_t a1)
{
  if (!WorkflowKitLibraryCore())
  {
    id v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("WFHomeWorkflow");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getWFHomeWorkflowClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)__WorkflowKitLibraryCore_block_invoke();
  }
  return result;
}

uint64_t __WorkflowKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  WorkflowKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_19D40027C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D400DEC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D401878(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D40358C(_Unwind_Exception *a1)
{
}

void sub_19D4036E0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D406B8C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D406C7C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D406E20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, os_unfair_lock_s *lock)
{
}

void sub_19D406F94(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D407044(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D4070D0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D407140(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D4071CC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D407258(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D407308(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D407768(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMDeviceSetupSessionStateAsString(unint64_t a1)
{
  if (a1 >= 4)
  {
    uint64_t v2 = NSString;
    id v3 = [NSNumber numberWithInteger:a1];
    id v1 = [v2 stringWithFormat:@"Unknown state (%@)", v3];
  }
  else
  {
    id v1 = off_1E5943FC0[a1];
  }

  return v1;
}

void sub_19D40A0C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HMImmutableSettingsProtoLanguageSettingEventReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        unsigned int v17 = objc_alloc_init(HMImmutableSettingsProtoLanguageValueEvent);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || !HMImmutableSettingsProtoLanguageValueEventReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D41027C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t __validateAccessories(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v6 = 1;
LABEL_11:

  return v6;
}

void sub_19D4104C0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMAssistantAccessControlOptionsToString(uint64_t a1)
{
  if (a1)
  {
    char v1 = a1;
    uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v3 = v2;
    if (v1) {
      [v2 addObject:@"Allow Unauthenticated Requests"];
    }
    uint64_t v4 = [v3 componentsJoinedByString:@", "];
  }
  else
  {
    uint64_t v4 = @"None";
  }

  return v4;
}

void sub_19D413964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D41403C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D4153D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D415DB4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D415E30(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D415FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D416134(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL HMActionSetTypeIsHomeOwned(void *a1)
{
  id v1 = a1;
  BOOL v2 = ([@"HMActionSetTypeUserDefined" isEqualToString:v1] & 1) != 0
    || +[HMActionSet isBuiltinActionSetType:v1];

  return v2;
}

void HMProxify(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if (HMProxify_once != -1) {
    dispatch_once(&HMProxify_once, &__block_literal_global_52641);
  }
  BOOL v2 = self;
  Class Class = object_getClass(a1);
  uint64_t v4 = [(objc_class *)Class instanceMethodForSelector:sel_dealloc];
  if (v4 != HMProxify_defaultDealloc)
  {
    if (isInternalBuild())
    {
      uint64_t v12 = [NSString stringWithFormat:@"%@ cannot be safely proxified, has custom dealloc method", Class, v13, v14];
      goto LABEL_20;
    }
    uint64_t v6 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = HMFGetLogIdentifier();
      __int16 v17 = 2112;
      Class v18 = Class;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_FAULT, "%{public}@%@ cannot be safely proxified, has custom dealloc method (proceeding anyway)", buf, 0x16u);
    }
  }
  size_t InstanceSize = class_getInstanceSize(Class);
  if (InstanceSize >= HMProxify_proxyClassIVarSize)
  {
    objc_destructInstance(a1);
    object_setClass(a1, (Class)HMProxify_proxyClassIVar);
    a1[1] = v2;
    return;
  }
  if (InstanceSize >= HMProxify_proxyClassAssocSize)
  {
    objc_destructInstance(a1);
    object_setClass(a1, (Class)HMProxify_proxyClassAssoc);
    objc_setAssociatedObject(a1, &HMProxyObjectAssocTargetKey, v2, (void *)1);
    return;
  }
  size_t v8 = InstanceSize;
  if (isInternalBuild())
  {
    uint64_t v12 = [NSString stringWithFormat:@"%@ cannot be proxified, instance size too small (%zu < %zu)", Class, v8, HMProxify_proxyClassAssocSize];
LABEL_20:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v12 userInfo:0]);
  }
  long long v9 = (void *)MEMORY[0x19F3A64A0]();
  long long v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    Class v18 = Class;
    __int16 v19 = 2048;
    size_t v20 = v8;
    __int16 v21 = 2048;
    uint64_t v22 = HMProxify_proxyClassAssocSize;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_FAULT, "%{public}@%@ cannot be proxified, instance size too small (%zu < %zu)", buf, 0x2Au);
  }
}

uint64_t __HMProxify_block_invoke()
{
  HMProxify_proxyClassIVar = objc_opt_class();
  HMProxify_proxyClassIVarSize = class_getInstanceSize((Class)HMProxify_proxyClassIVar);
  HMProxify_proxyClassAssoc = objc_opt_class();
  HMProxify_proxyClassAssocSize = class_getInstanceSize((Class)HMProxify_proxyClassAssoc);
  uint64_t result = [MEMORY[0x1E4FBA8A8] instanceMethodForSelector:sel_dealloc];
  HMProxify_defaultDealloc = result;
  return result;
}

uint64_t HMAccessoryDiagnosticInfoProtoCloudInfoReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
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
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 20) |= 4u;
        while (1)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0) {
            goto LABEL_49;
          }
          v24 += 7;
          BOOL v14 = v25++ >= 9;
          if (v14)
          {
            uint64_t v26 = 0;
            goto LABEL_51;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_49:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v26 = 0;
        }
LABEL_51:
        *(unsigned char *)(a1 + 16) = v26 != 0;
      }
      else
      {
        if (v17 == 2)
        {
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 20) |= 2u;
          while (1)
          {
            uint64_t v32 = *v3;
            unint64_t v33 = *(void *)(a2 + v32);
            if (v33 == -1 || v33 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v33 + 1;
            v20 |= (unint64_t)(v34 & 0x7F) << v30;
            if ((v34 & 0x80) == 0) {
              goto LABEL_53;
            }
            v30 += 7;
            BOOL v14 = v31++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_55;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_55:
          uint64_t v36 = 12;
        }
        else
        {
          if (v17 != 1)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 20) |= 1u;
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
              goto LABEL_45;
            }
            v18 += 7;
            BOOL v14 = v19++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_47;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_47:
          uint64_t v36 = 8;
        }
        *(_DWORD *)(a1 + v36) = v20;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t HMImmutableSettingsProtoSettingChangeEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
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
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 0u:
        unsigned int v17 = 0;
        do
        {
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 == -1 || v19 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
            goto LABEL_51;
          }
          unint64_t v20 = v19 + 1;
          int v21 = *(char *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v1_Block_object_dispose(&location, 8) = v20;
          if ((v21 & 0x80000000) == 0) {
            break;
          }
        }
        while (v17++ <= 8);
        goto LABEL_51;
      case 1u:
        uint64_t v23 = PBReaderReadString();
        char v24 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v23;

        goto LABEL_51;
      case 2u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v27 = 0;
        *(unsigned char *)(a1 + 68) |= 2u;
        while (2)
        {
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 == -1 || v29 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
            *(void *)(a2 + v2_Block_object_dispose(&location, 8) = v29 + 1;
            v27 |= (unint64_t)(v30 & 0x7F) << v25;
            if (v30 < 0)
            {
              v25 += 7;
              BOOL v14 = v26++ >= 9;
              if (v14)
              {
                uint64_t v27 = 0;
                goto LABEL_57;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v27 = 0;
        }
LABEL_57:
        *(unsigned char *)(a1 + 64) = v27 != 0;
        goto LABEL_51;
      case 0xBu:
        [(id)a1 clearOneofValuesForSettingChangeEvent];
        *(unsigned char *)(a1 + 68) |= 1u;
        *(_DWORD *)(a1 + 4_Block_object_dispose(&location, 8) = 1;
        uint64_t v32 = objc_alloc_init(HMImmutableSettingsProtoStringSettingEvent);
        objc_storeStrong((id *)(a1 + 56), v32);
        if (!PBReaderPlaceMark()
          || (HMImmutableSettingsProtoStringSettingEventReadFrom((uint64_t)v32, a2) & 1) == 0)
        {
          goto LABEL_59;
        }
        goto LABEL_50;
      case 0xCu:
        [(id)a1 clearOneofValuesForSettingChangeEvent];
        *(unsigned char *)(a1 + 68) |= 1u;
        *(_DWORD *)(a1 + 4_Block_object_dispose(&location, 8) = 2;
        uint64_t v32 = objc_alloc_init(HMImmutableSettingsProtoBoundedIntegerSettingEvent);
        objc_storeStrong((id *)(a1 + 24), v32);
        if (!PBReaderPlaceMark()
          || (HMImmutableSettingsProtoBoundedIntegerSettingEventReadFrom((uint64_t)v32, a2) & 1) == 0)
        {
          goto LABEL_59;
        }
        goto LABEL_50;
      case 0xDu:
        [(id)a1 clearOneofValuesForSettingChangeEvent];
        *(unsigned char *)(a1 + 68) |= 1u;
        *(_DWORD *)(a1 + 4_Block_object_dispose(&location, 8) = 3;
        uint64_t v32 = objc_alloc_init(HMImmutableSettingsProtoBoolSettingEvent);
        objc_storeStrong((id *)(a1 + 16), v32);
        if (!PBReaderPlaceMark()
          || (HMImmutableSettingsProtoBoolSettingEventReadFrom((uint64_t)v32, a2) & 1) == 0)
        {
          goto LABEL_59;
        }
        goto LABEL_50;
      case 0xEu:
        [(id)a1 clearOneofValuesForSettingChangeEvent];
        *(unsigned char *)(a1 + 68) |= 1u;
        *(_DWORD *)(a1 + 4_Block_object_dispose(&location, 8) = 4;
        uint64_t v32 = objc_alloc_init(HMImmutableSettingsProtoLanguageSettingEvent);
        objc_storeStrong((id *)(a1 + 40), v32);
        if (!PBReaderPlaceMark()
          || (HMImmutableSettingsProtoLanguageSettingEventReadFrom((uint64_t)v32, a2) & 1) == 0)
        {
          goto LABEL_59;
        }
        goto LABEL_50;
      case 0xFu:
        [(id)a1 clearOneofValuesForSettingChangeEvent];
        *(unsigned char *)(a1 + 68) |= 1u;
        *(_DWORD *)(a1 + 4_Block_object_dispose(&location, 8) = 5;
        uint64_t v32 = objc_alloc_init(HMImmutableSettingsProtoAvailableLanguageListEvent);
        objc_storeStrong((id *)(a1 + 8), v32);
        if (PBReaderPlaceMark()
          && (HMImmutableSettingsProtoAvailableLanguageListEventReadFrom(v32, a2) & 1) != 0)
        {
LABEL_50:
          PBReaderRecallMark();

LABEL_51:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_59:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_51;
    }
  }
}

uint64_t HMAccessoryInfoProtoMediaStateEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 48) |= 1u;
          while (1)
          {
            uint64_t v21 = *v3;
            uint64_t v22 = *(void *)(a2 + v21);
            unint64_t v23 = v22 + 1;
            if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0) {
              goto LABEL_47;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              uint64_t v20 = 0;
              goto LABEL_49;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_47:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v20 = 0;
          }
LABEL_49:
          uint64_t v43 = 8;
          goto LABEL_58;
        case 2u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 48) |= 4u;
          while (2)
          {
            uint64_t v28 = *v3;
            uint64_t v29 = *(void *)(a2 + v28);
            unint64_t v30 = v29 + 1;
            if (v29 == -1 || v30 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
              *(void *)(a2 + v2_Block_object_dispose(&location, 8) = v30;
              v20 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v15 = v27++ >= 9;
                if (v15)
                {
                  uint64_t v20 = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v20 = 0;
          }
LABEL_53:
          uint64_t v43 = 24;
          goto LABEL_58;
        case 3u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 48) |= 2u;
          break;
        case 4u:
          *(unsigned char *)(a1 + 48) |= 8u;
          uint64_t v38 = *v3;
          unint64_t v39 = *(void *)(a2 + v38);
          if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v40 = *(void *)(*(void *)(a2 + *v7) + v39);
            *(void *)(a2 + v3_Block_object_dispose(&location, 8) = v39 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v40 = 0;
          }
          *(void *)(a1 + 32) = v40;
          continue;
        case 5u:
          uint64_t v41 = PBReaderReadString();
          unsigned int v42 = *(void **)(a1 + 40);
          *(void *)(a1 + 40) = v41;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v34 = *v3;
        uint64_t v35 = *(void *)(a2 + v34);
        unint64_t v36 = v35 + 1;
        if (v35 == -1 || v36 > *(void *)(a2 + *v4)) {
          break;
        }
        char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
        *(void *)(a2 + v34) = v36;
        v20 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0) {
          goto LABEL_55;
        }
        v32 += 7;
        BOOL v15 = v33++ >= 9;
        if (v15)
        {
          uint64_t v20 = 0;
          goto LABEL_57;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_55:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v20 = 0;
      }
LABEL_57:
      uint64_t v43 = 16;
LABEL_58:
      *(void *)(a1 + v43) = v20;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t HMImmutableSettingsProtoStringValueEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        char v18 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(&location, 8) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfoReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        char v18 = *(HMAccessoryInfoProtoPublicPairingIdentity **)(a1 + 16);
        *(void *)(a1 + 16) = v17;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v18 = objc_alloc_init(HMAccessoryInfoProtoPublicPairingIdentity);
    objc_storeStrong((id *)(a1 + 8), v18);
    if (!PBReaderPlaceMark() || !HMAccessoryInfoProtoPublicPairingIdentityReadFrom((uint64_t)v18, a2))
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D41D450(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL HMPBCharacteristicWriteActionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 6) {
        break;
      }
      if (v17 == 5)
      {
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 24;
LABEL_26:
        uint64_t v20 = *(HMPBCharacteristicReference **)(a1 + v19);
        *(void *)(a1 + v19) = v18;
LABEL_27:

        goto LABEL_29;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 8;
        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_29:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v20 = objc_alloc_init(HMPBCharacteristicReference);
    objc_storeStrong((id *)(a1 + 16), v20);
    if (!PBReaderPlaceMark() || !HMPBCharacteristicReferenceReadFrom((uint64_t)v20, a2))
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_27;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL HMAccessoryDiagnosticInfoProtoVisibleDeviceInfoReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&location, 8) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D424A94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D425340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D425F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D426C3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
}

void sub_19D42781C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D427D40(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D42862C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D428B50(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D428CA8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D428DA8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D42BA44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D42BC98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_19D42C85C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D42CA64(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D42CEC4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, long long buf)
{
  if (a2 == 1)
  {
    id v15 = objc_begin_catch(a1);
    int v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = a11;
    HMFGetOSLogHandle();
    uint64_t v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543618;
      *(void *)((char *)&buf + 4) = v19;
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = v15;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize accessory collection setting item value due to unexpected exception: %@", (uint8_t *)&buf, 0x16u);
    }

    objc_end_catch();
    JUMPOUT(0x19D42CE34);
  }
  os_unfair_lock_unlock(v13);
  _Unwind_Resume(a1);
}

void sub_19D42D8F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __validateItem(void *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = v6;
  uint64_t v8 = 1;
  if (v5 && v6)
  {
    unsigned int v9 = [v6 value];
    [v5 itemValueClasses];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      while (2)
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          if (objc_opt_isKindOfClass())
          {
            uint64_t v8 = 1;
            id v17 = v10;
            goto LABEL_14;
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    if (a3)
    {
      id v15 = (void *)MEMORY[0x1E4F28C58];
      int v16 = NSString;
      id v17 = [v7 value];
      uint64_t v18 = [v16 stringWithFormat:@"Item value class, %@, is not in expected classes: %@", objc_opt_class(), v10, v20];
      *a3 = [v15 hmErrorWithCode:22 description:@"Invalid value class." reason:v18 suggestion:0];

      uint64_t v8 = 0;
LABEL_14:
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  return v8;
}

id __constraintsForItems(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = [a1 internal];
  id v6 = [v5 constraints];
  uint64_t v7 = [v4 setWithArray:v6];

  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v3, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v15 = [HMAccessorySettingConstraint alloc];
        int v16 = -[HMAccessorySettingConstraint initWithType:value:](v15, "initWithType:value:", 4, v14, (void)v21);
        id v17 = [v7 member:v16];
        if (v17) {
          uint64_t v18 = v17;
        }
        else {
          uint64_t v18 = v16;
        }
        [v8 addObject:v18];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  uint64_t v19 = [v8 array];

  return v19;
}

void sub_19D42E79C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,id location)
{
  objc_destroyWeak(v53);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D42EEA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a27);
  _Unwind_Resume(a1);
}

void sub_19D42F410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, id a19)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a19);
  _Unwind_Resume(a1);
}

uint64_t HMAccessorySettingTypeFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"data"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"number"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"string"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"selection"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"collection"])
  {
    uint64_t v2 = 5;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *HMAccessorySettingTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"Unknown";
  }
  else {
    return off_1E5944B00[a1 - 1];
  }
}

uint64_t HMAccessorySettingPropertiesFromString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 containsString:@"r"];
  int v3 = [v1 containsString:@"w"];

  if (v3) {
    return v2 | 2;
  }
  else {
    return v2;
  }
}

id HMAccessorySettingPropertiesToString(char a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28E78] string];
  int v3 = v2;
  if (a1) {
    [v2 appendString:@"r"];
  }
  if ((a1 & 2) != 0) {
    [v3 appendString:@"w"];
  }

  return v3;
}

__CFString *HMServiceConfigurationStateAsString(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<Unknown value: %ld>", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E5944C78[a1];
  }

  return v1;
}

void sub_19D4333AC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D433428(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D433608(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D433768(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D4337C4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D433C98(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D433D28(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D433DB8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D433E94(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D433F70(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D433FF4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D434084(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMServiceOperatingStateAsString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMServiceOperatingState %ld", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E5944C60[a1];
  }

  return v1;
}

__CFString *HMServiceOperatingStateAbnormalReasonsAsString(unint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!a1) {
    goto LABEL_14;
  }
  uint64_t v3 = 1;
  unint64_t v4 = a1;
  do
  {
    if ((v3 & a1) == 0) {
      goto LABEL_11;
    }
    switch(v3)
    {
      case 1:
        id v5 = @"HMServiceOperatingStateAbnormalReasonOther";
        break;
      case 4:
        id v5 = @"HMServiceOperatingStateAbnormalReasonHighTemperature";
        break;
      case 2:
        id v5 = @"HMServiceOperatingStateAbnormalReasonLowTemperature";
        break;
      default:
        goto LABEL_11;
    }
    v4 &= ~v3;
    [v2 addObject:v5];
LABEL_11:
    v3 *= 2;
  }
  while (v3 - 1 < a1);
  if (v4)
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMServiceOperatingStateAbnormalReasons %lu", v4);
    [v2 addObject:v6];
  }
LABEL_14:
  if ([v2 count])
  {
    uint64_t v7 = [v2 componentsJoinedByString:@", "];
  }
  else
  {
    uint64_t v7 = @"None";
  }

  return v7;
}

BOOL isPresenceAuthorizationValid(void *a1)
{
  return (unint64_t)([a1 value] - 1) < 2;
}

__CFString *HMSiriEndpointProfileSessionStateTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) >= 5)
  {
    id v2 = NSString;
    uint64_t v3 = [NSNumber numberWithInteger:a1];
    id v1 = [v2 stringWithFormat:@"Unknown (%@)", v3];
  }
  else
  {
    id v1 = off_1E5944D80[a1 + 1];
  }

  return v1;
}

__CFString *HMSiriEndpointProfileCapabilityToString(unint64_t a1)
{
  if (a1)
  {
    id v2 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v3 = v2;
    if (a1) {
      [v2 addObject:@"Needs Onboarding"];
    }
    if ((a1 & 2) != 0) {
      [v3 addObject:@"Supports Onboarding"];
    }
    uint64_t v4 = [v3 count];
    if (a1 > 3 || !v4)
    {
      id v5 = NSString;
      id v6 = [NSNumber numberWithUnsignedInteger:a1];
      uint64_t v7 = [v5 stringWithFormat:@"Unknown (%@)", v6];
      [v3 addObject:v7];
    }
    uint64_t v8 = [v3 componentsJoinedByString:@"/"];
  }
  else
  {
    uint64_t v8 = @"None";
  }

  return v8;
}

__CFString *HMSiriEndpointProfileMultifunctionButtonTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) >= 3)
  {
    id v2 = NSString;
    uint64_t v3 = [NSNumber numberWithInteger:a1];
    id v1 = [v2 stringWithFormat:@"Unknown (%@)", v3];
  }
  else
  {
    id v1 = off_1E5944DA8[a1 + 1];
  }

  return v1;
}

__CFString *HMActionTypeAsString(unint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown action type: %lu", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E5944DC0[a1];
  }

  return v1;
}

id HMClassForActionType(unint64_t a1)
{
  if (a1 > 5)
  {
    id v2 = 0;
  }
  else
  {
    id v2 = objc_opt_class();
  }
  return v2;
}

uint64_t HMImmutableSettingsProtoStringSettingEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        id v17 = objc_alloc_init(HMImmutableSettingsProtoStringValueEvent);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark()
          || (HMImmutableSettingsProtoStringValueEventReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19D43A4C0(_Unwind_Exception *a1)
{
}

void sub_19D43A560(_Unwind_Exception *a1)
{
}

void sub_19D43A770(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D43AB3C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D43C97C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D43CA98(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMPBActionContainerReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
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
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 44) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_41;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_43;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_43:
        *(_DWORD *)(a1 + 40) = v19;
        goto LABEL_44;
      case 2u:
        long long v24 = objc_alloc_init(HMPBCharacteristicWriteAction);
        objc_storeStrong((id *)(a1 + 8), v24);
        if (!PBReaderPlaceMark() || !HMPBCharacteristicWriteActionReadFrom((uint64_t)v24, a2)) {
          goto LABEL_46;
        }
        goto LABEL_39;
      case 3u:
        long long v24 = objc_alloc_init(HMPBMediaPlaybackAction);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark() || (HMPBMediaPlaybackActionReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_46;
        }
        goto LABEL_39;
      case 4u:
        long long v24 = objc_alloc_init(HMPBNaturalLightingAction);
        objc_storeStrong((id *)(a1 + 32), v24);
        if (!PBReaderPlaceMark() || (HMPBNaturalLightingActionReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_46;
        }
        goto LABEL_39;
      case 5u:
        long long v24 = objc_alloc_init(HMPBMatterCommandAction);
        objc_storeStrong((id *)(a1 + 24), v24);
        if PBReaderPlaceMark() && (HMPBMatterCommandActionReadFrom((uint64_t)v24, a2))
        {
LABEL_39:
          PBReaderRecallMark();

LABEL_44:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_46:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_44;
    }
  }
}

void sub_19D43EC78(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D43F914(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D43FA50(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMStringFromAccessoryCommunicationProtocol(uint64_t a1)
{
  if (a1 == 1)
  {
    id v2 = @"HAP";
  }
  else if (a1 == 2)
  {
    id v2 = @"CHIP";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown type: %lu", a1);
    id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t base36Decode(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  while (1)
  {
    int v8 = *(unsigned __int8 *)(a1 + v7);
    if ((v8 - 48) < 0xA)
    {
      int v9 = -48;
      goto LABEL_5;
    }
    int v9 = -55;
    if ((v8 - 65) >= 0x1A) {
      break;
    }
LABEL_5:
    uint64_t v12 = (v9 + v8) + 36 * v5;
    unint64_t v11 = (__PAIR128__(36 * v6, (v9 + v8)) + (unint64_t)v5 * (unsigned __int128)0x24uLL) >> 64;
    uint64_t result = v12;
    if (__PAIR128__(v11, v12) < __PAIR128__(v6, v5))
    {
      uint64_t v13 = MEMORY[0x19F3A64A0]();
      BOOL v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = HMFGetLogIdentifier();
        int v22 = 138543362;
        long long v23 = v15;
        _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Decoding base-36 encoded string overflowed 128 bits", (uint8_t *)&v22, 0xCu);
      }
      int v16 = (void *)v13;
      goto LABEL_14;
    }
    ++v7;
    uint64_t v5 = v12;
    unint64_t v6 = v11;
    if (a2 == v7) {
      return result;
    }
  }
  uint64_t v17 = MEMORY[0x19F3A64A0]();
  unsigned int v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = HMFGetLogIdentifier();
    int v20 = *(unsigned __int8 *)(a1 + v7);
    int v22 = 138543618;
    long long v23 = v19;
    __int16 v24 = 1024;
    int v25 = v20;
    _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Decoding base-36 encoded string encountered an invalid character - 0x%02x", (uint8_t *)&v22, 0x12u);
  }
  int v16 = (void *)v17;
LABEL_14:
  if (!a3) {
    return 0;
  }
  id v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  uint64_t result = 0;
  *a3 = v21;
  return result;
}

void sub_19D4452DC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMHomeManagerCachePolicyToString(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<Unknown cache policy: %lu>", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5945210[a1];
  }

  return v1;
}

__CFString *HMHomeManagerInactiveUpdatingLevelToString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<Unknown inactive updating level: %lu>", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5945230[a1];
  }

  return v1;
}

uint64_t isValidPresenceType(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"HMPresenceTypeCurrentUserAtHome"] & 1) != 0
    || ([v1 isEqualToString:@"HMPresenceTypeCurrentUserNotAtHome"] & 1) != 0
    || ([v1 isEqualToString:@"HMPresenceTypeAnyUserAtHome"] & 1) != 0
    || ([v1 isEqualToString:@"HMPresenceTypeNoUserAtHome"] & 1) != 0
    || ([v1 isEqualToString:@"HMPresenceTypeUsersAtHome"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"HMPresenceTypeUsersNotAtHome"];
  }

  return v2;
}

uint64_t usersListApplicable(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"HMPresenceTypeUsersAtHome"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"HMPresenceTypeUsersNotAtHome"];
  }

  return v2;
}

void sub_19D44AC30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____handleFinishedUnarchive_block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) state];
  uint64_t v3 = (void *)MEMORY[0x19F3A64A0]();
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2 == 3)
  {
    if (v6)
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v8 = *(HMSoftwareUpdateDocumentation **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      unsigned int v54 = v7;
      __int16 v55 = 2112;
      unint64_t v56 = v8;
      _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Finished unarchive with error: %@", buf, 0x16u);
    }
    int v9 = *(void **)(a1 + 32);
    if (*(void *)(a1 + 40))
    {
      [v9 setState:2];
    }
    else
    {
      id v11 = v9;
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F654E0]) initWithName:@"HMSoftwareUpdateDocumentationAsset.validation"];
      uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
      BOOL v14 = (void *)MEMORY[0x1E4F28B50];
      int v15 = [v11 bundleURL];
      int v16 = [v14 bundleWithURL:v15];

      if (v16)
      {
        unint64_t v51 = v13;
        char v52 = v12;
        uint64_t v17 = +[HMSoftwareUpdateDocumentation localizationsForBundle:v16];
        uint64_t v18 = [(HMSoftwareUpdateDocumentation *)v17 count];
        uint64_t v19 = (void *)MEMORY[0x19F3A64A0]();
        id v20 = v11;
        id v21 = HMFGetOSLogHandle();
        int v22 = v21;
        if (v18)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            long long v23 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            unsigned int v54 = v23;
            __int16 v55 = 2112;
            unint64_t v56 = v17;
            _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_INFO, "%{public}@Available localizations: %@", buf, 0x16u);
          }
          __int16 v24 = [[HMSoftwareUpdateDocumentation alloc] initWithBundle:v16];
          BOOL v25 = v24 != 0;
          uint64_t v26 = (void *)MEMORY[0x19F3A64A0]();
          id v27 = v20;
          uint64_t v28 = HMFGetOSLogHandle();
          uint64_t v29 = v28;
          if (v24)
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              unint64_t v30 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              unsigned int v54 = v30;
              __int16 v55 = 2112;
              unint64_t v56 = v24;
              _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_INFO, "%{public}@Cached documentation: %@", buf, 0x16u);
            }
            char v31 = 0;
          }
          else
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v40 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              unsigned int v54 = v40;
              __int16 v55 = 2112;
              unint64_t v56 = v16;
              _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse documentation for asset bundle: %@", buf, 0x16u);
            }
            char v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
          }
          uint64_t v13 = v51;

          uint64_t v12 = v52;
        }
        else
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v39 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            unsigned int v54 = v39;
            __int16 v55 = 2112;
            unint64_t v56 = v16;
            _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@No available localization for asset bundle: %@", buf, 0x16u);
          }
          char v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
          BOOL v25 = 0;
          uint64_t v12 = v52;
        }
      }
      else
      {
        char v32 = (void *)MEMORY[0x19F3A64A0]();
        id v33 = v11;
        uint64_t v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          uint64_t v35 = v13;
          v37 = unint64_t v36 = v12;
          uint64_t v38 = [v33 bundleURL];
          *(_DWORD *)buf = 138543618;
          unsigned int v54 = v37;
          __int16 v55 = 2112;
          unint64_t v56 = v38;
          _os_log_impl(&dword_19D1A8000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to create bundle from: %@", buf, 0x16u);

          uint64_t v12 = v36;
          uint64_t v13 = v35;
        }

        char v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
        BOOL v25 = 0;
      }

      id v41 = v31;

      unsigned int v42 = (HMSoftwareUpdateDocumentation *)v41;
      if (v25)
      {
        [*(id *)(a1 + 32) setState:4];
      }
      else
      {
        uint64_t v43 = (void *)MEMORY[0x19F3A64A0]();
        id v44 = *(id *)(a1 + 32);
        char v45 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v46 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          unsigned int v54 = v46;
          __int16 v55 = 2112;
          unint64_t v56 = v42;
          _os_log_impl(&dword_19D1A8000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to validate asset with error: %@", buf, 0x16u);
        }
        [*(id *)(a1 + 32) setError:v42];
        [*(id *)(a1 + 32) setState:5];
        char v47 = [MEMORY[0x1E4F28CB8] defaultManager];
        unsigned int v48 = [*(id *)(a1 + 32) bundleURL];
        [v47 removeItemAtURL:v48 error:0];
      }
      uint64_t v49 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v50 = [*(id *)(a1 + 32) archiveURL];
      [v49 removeItemAtURL:v50 error:0];
    }
    [*(id *)(a1 + 32) setExtractor:0];
  }
  else
  {
    if (v6)
    {
      unint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      unsigned int v54 = v10;
      _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to finish unarchive, not currently unarchiving", buf, 0xCu);
    }
  }
}

void sub_19D44B9C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __processNextArchivedData(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    uint64_t v3 = v1[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ____processNextArchivedData_block_invoke;
    block[3] = &unk_1E59452E8;
    uint64_t v5 = v1;
    dispatch_async(v3, block);
  }
}

void ____processNextArchivedData_block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) archivedFileStream];
  int v4 = [v3 hasBytesAvailable];

  uint64_t v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = *v2;
  uint64_t v7 = HMFGetOSLogHandle();
  int v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v21 = v9;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Reading next chunk from the archive", buf, 0xCu);
    }
    id v11 = *(void **)(a1 + 32);
    unint64_t v10 = (id *)(a1 + 32);
    uint64_t v12 = [v11 archivedFileStream];
    uint64_t v13 = [v12 read:buf maxLength:4096];

    BOOL v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:v13];
    objc_initWeak(&location, *v10);
    int v15 = [*v10 extractor];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = ____processNextArchivedData_block_invoke_308;
    v17[3] = &unk_1E5945360;
    objc_copyWeak(&v18, &location);
    [v15 supplyBytes:v14 withCompletionBlock:v17];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v21 = v16;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Reached end of input stream", buf, 0xCu);
    }
    [*(id *)(a1 + 32) finishUnarchive];
  }
}

void sub_19D44BEC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____processNextArchivedData_block_invoke_308(uint64_t a1, void *a2, int a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (v5)
  {
    int v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = v7;
    unint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to append data with error: %@", (uint8_t *)&v12, 0x16u);
    }
    [v9 cancelUnarchiveWithError:v5];
  }
  else if (a3)
  {
    [WeakRetained finishUnarchive];
  }
  else
  {
    __processNextArchivedData();
  }
}

id __resourceBundleForBundle(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 URLForResource:@"AssetData" withExtension:0];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B50] bundleWithURL:v2];
  }
  else
  {
    int v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = HMFGetLogIdentifier();
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to find resource bundle", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v3 = 0;
  }

  return v3;
}

HMHTMLDocument *__htmlDocumentForResource(void *a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [v5 URLForResource:v7 withExtension:@"html" subdirectory:0 localization:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        if (v13)
        {
          id v15 = (void *)v13;
          id v22 = 0;
          __int16 v14 = [[HMHTMLDocument alloc] initWithURL:v13 error:&v22];
          id v16 = v22;
          if (!v14)
          {
            uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
            id v18 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              uint64_t v19 = HMFGetLogIdentifier();
              id v20 = [v15 path];
              *(_DWORD *)buf = 138543874;
              uint64_t v28 = v19;
              __int16 v29 = 2112;
              unint64_t v30 = v20;
              __int16 v31 = 2112;
              id v32 = v16;
              _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@Unable to load document, %@, with error: %@", buf, 0x20u);
            }
          }

          goto LABEL_15;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v33 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  __int16 v14 = 0;
LABEL_15:

  return v14;
}

void sub_19D44F544(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMSiriEndpointProfileAssistantActiveTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) >= 3)
  {
    uint64_t v2 = NSString;
    uint64_t v3 = [NSNumber numberWithInteger:a1];
    id v1 = [v2 stringWithFormat:@"Unknown (%@)", v3];
  }
  else
  {
    id v1 = off_1E5945450[a1 + 1];
  }

  return v1;
}

uint64_t HMUserActionPredictionDuetPredictionValueReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  int v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 16;
          goto LABEL_24;
        case 2u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 40;
          goto LABEL_24;
        case 3u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 32;
LABEL_24:
          id v21 = *(void **)(a1 + v19);
          *(void *)(a1 + v19) = v18;

          continue;
        case 4u:
          *(unsigned char *)(a1 + 48) |= 1u;
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v24 = *(void *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v24 = 0;
          }
          *(void *)(a1 + _Block_object_dispose(&location, 8) = v24;
          continue;
        case 5u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          *(unsigned char *)(a1 + 48) |= 2u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v28 = *v3;
        uint64_t v29 = *(void *)(a2 + v28);
        unint64_t v30 = v29 + 1;
        if (v29 == -1 || v30 > *(void *)(a2 + *v4)) {
          break;
        }
        char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
        *(void *)(a2 + v2_Block_object_dispose(&location, 8) = v30;
        v27 |= (unint64_t)(v31 & 0x7F) << v25;
        if ((v31 & 0x80) == 0) {
          goto LABEL_36;
        }
        v25 += 7;
        BOOL v15 = v26++ >= 9;
        if (v15)
        {
          LODWORD(v27) = 0;
          goto LABEL_38;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_36:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v27) = 0;
      }
LABEL_38:
      *(_DWORD *)(a1 + 24) = v27;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t HMUserDefaultCamerasAccessLevel(int a1)
{
  if (a1) {
    return 2;
  }
  else {
    return 1;
  }
}

__CFString *HMUserCameraAccessLevelAsString(uint64_t a1)
{
  if (a1 == 1)
  {
    uint64_t v2 = @"HMUserCameraAccessLevelStream";
  }
  else if (a1 == 2)
  {
    uint64_t v2 = @"HMUserCameraAccessLevelStreamAndViewRecordings";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMUserCameraAccessLevel %tu", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

BOOL HMUserIsStreamingAllowedWithCameraAccessLevel(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

BOOL HMUserIsRecordingAllowedWithCameraAccessLevel(uint64_t a1)
{
  return a1 == 2;
}

BOOL HMUserIsValidCameraAccessLevel(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

__CFString *HMUserPresenceAuthorizationStatusAsString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMUserPresenceAuthorizationStatus %tu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5945548[a1];
  }

  return v1;
}

void sub_19D4537F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__63115(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__63116(uint64_t a1)
{
}

void sub_19D456020(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D456660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_unfair_lock_t lock)
{
}

uint64_t sub_19D457108()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_19D457118()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_19D457128()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_19D457138()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_19D457148()
{
  return MEMORY[0x1F40E49E8]();
}

uint64_t sub_19D457158()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_19D457168()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_19D457178()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_19D457188()
{
  return MEMORY[0x1F40E51F0]();
}

uint64_t sub_19D457198()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_19D4571A8()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_19D4571B8()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t sub_19D4571C8()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_19D4571D8()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_19D4571E8()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_19D4571F8()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_19D457208()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_19D457218()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_19D457228()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_19D457238()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_19D457248()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_19D457258()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_19D457268()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_19D457278()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_19D457288()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_19D457298()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_19D4572A8()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_19D4572B8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_19D4572C8()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_19D4572D8()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_19D4572E8()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_19D457308()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_19D457318()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_19D457328()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_19D457338()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_19D457348()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_19D457358()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_19D457368()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_19D457378()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_19D457388()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_19D457398()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_19D4573A8()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_19D4573B8()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_19D4573C8()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_19D4573D8()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_19D4573E8()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_19D4573F8()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_19D457408()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_19D457418()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_19D457428()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_19D457438()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_19D457448()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_19D457458()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_19D457468()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_19D457478()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_19D457488()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_19D457498()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_19D4574A8()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_19D4574B8()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_19D4574C8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_19D4574D8()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_19D4574E8()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_19D4574F8()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_19D457508()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_19D457518()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_19D457528()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_19D457538()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_19D457548()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_19D457558()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_19D457568()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_19D457578()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_19D457588()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_19D457598()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_19D4575A8()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_19D4575B8()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_19D4575C8()
{
  return MEMORY[0x1F4185518]();
}

uint64_t sub_19D4575D8()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_19D4575E8()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_19D4575F8()
{
  return MEMORY[0x1F4185648]();
}

uint64_t sub_19D457608()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_19D457618()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_19D457628()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_19D457638()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_19D457658()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_19D457668()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_19D457678()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_19D457688()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_19D457698()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_19D4576A8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_19D4576B8()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_19D4576C8()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_19D4576D8()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_19D4576E8()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x1F40C94F8]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x1F40C9500]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBDD0](sbuf);
}

uint64_t HMEProtoEventInfoReadFrom()
{
  return MEMORY[0x1F41226E8]();
}

uint64_t HMFBooleanToString()
{
  return MEMORY[0x1F411CB28]();
}

uint64_t HMFCreateOSLogHandle()
{
  return MEMORY[0x1F411CB30]();
}

uint64_t HMFDigestAlgorithmFromString()
{
  return MEMORY[0x1F411CB40]();
}

uint64_t HMFDigestAlgorithmToString()
{
  return MEMORY[0x1F411CB48]();
}

uint64_t HMFEnabledStatusToString()
{
  return MEMORY[0x1F411CB58]();
}

uint64_t HMFEncodedRootObject()
{
  return MEMORY[0x1F411CB60]();
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

uint64_t HMFMethodDescription()
{
  return MEMORY[0x1F411CB88]();
}

uint64_t HMFQOSClassFromQualityOfService()
{
  return MEMORY[0x1F411CBC8]();
}

uint64_t HMFQualityOfServiceToString()
{
  return MEMORY[0x1F411CBD8]();
}

uint64_t HM_FEATURE_RVC_DEFAULTS_ENABLED()
{
  return MEMORY[0x1F41226F0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

BOOL NSEqualPoints(NSPoint aPoint, NSPoint bPoint)
{
  return MEMORY[0x1F40E70B8]((__n128)aPoint, *(__n128 *)&aPoint.y, (__n128)bPoint, *(__n128 *)&bPoint.y);
}

BOOL NSEqualRects(NSRect aRect, NSRect bRect)
{
  return MEMORY[0x1F40E70C0]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x1F40E7168]();
}

uint64_t NSPrintF()
{
  return MEMORY[0x1F41167B0]();
}

uint64_t NSRandomData()
{
  return MEMORY[0x1F41167D0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x1F40E7290]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1F40E72A8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1F41471D8]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1F41471F0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1F4147248]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t SecPasswordCreateWithRandomDigits()
{
  return MEMORY[0x1F40F6FA0]();
}

uint64_t SecPasswordIsPasswordWeak()
{
  return MEMORY[0x1F40F6FB0]();
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x1F415CBB8]();
}

uint64_t TCCAccessRequest()
{
  return MEMORY[0x1F415CBD8]();
}

uint64_t TLV8BufferAppend()
{
  return MEMORY[0x1F4116B30]();
}

uint64_t TLV8BufferFree()
{
  return MEMORY[0x1F4116B48]();
}

uint64_t TLV8BufferInit()
{
  return MEMORY[0x1F4116B50]();
}

uint64_t TLV8GetNext()
{
  return MEMORY[0x1F4116B68]();
}

uint64_t TLV8GetOrCopyCoalesced()
{
  return MEMORY[0x1F4116B70]();
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

uint64_t _dyld_images_for_addresses()
{
  return MEMORY[0x1F40C9E68]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1F41814C8](cls, name, imp, types);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1F41814F8](cls, outCount);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x1F4181530](cls);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
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

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA0](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1F40CBE70]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x1F40CC1A8](a1, a2);
  return result;
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1F41815F8](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1F4181600](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1F4181618](m);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1F40CD048](*(void *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

void nw_connection_cancel(nw_connection_t connection)
{
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1F40F2AE0](endpoint, parameters);
}

void nw_connection_receive_message(nw_connection_t connection, nw_connection_receive_completion_t completion)
{
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
}

void nw_connection_set_path_changed_handler(nw_connection_t connection, nw_connection_path_event_handler_t handler)
{
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
}

void nw_connection_set_viability_changed_handler(nw_connection_t connection, nw_connection_BOOLean_event_handler_t handler)
{
}

void nw_connection_start(nw_connection_t connection)
{
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x1F40F2F50](error);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1F40F3938](path);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void *__cdecl objc_destructInstance(id obj)
{
  return (void *)MEMORY[0x1F41816D8](obj);
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

Class object_setClass(id a1, Class a2)
{
  return (Class)MEMORY[0x1F4181A90](a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
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

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
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

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

void uuid_generate(uuid_t out)
{
}