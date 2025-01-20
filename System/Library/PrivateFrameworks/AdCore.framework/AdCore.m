void _ADLog(void *a1, void *a2, char a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  id v11;
  id v12;
  void block[4];
  id v14;
  id v15;
  char v16;

  v5 = a1;
  v6 = a2;
  v7 = v5;
  v8 = v7;
  if ([v7 hasSuffix:@"Logging"])
  {
    v8 = objc_msgSend(v7, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v7, "length") - 7, 7, &stru_1F270BEE0);
  }
  if (_ADLog_onceToken != -1) {
    dispatch_once(&_ADLog_onceToken, &__block_literal_global_212);
  }
  if (_ADLog_internalBuild) {
    v9 = a3;
  }
  else {
    v9 = 2;
  }
  v10 = _ADLogQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ADLog_block_invoke_2;
  block[3] = &unk_1E68A0D70;
  v16 = v9;
  v14 = v8;
  v15 = v6;
  v11 = v6;
  v12 = v8;
  dispatch_async(v10, block);
}

id _ADLogQueue()
{
  if (_ADLogQueue_onceToken != -1) {
    dispatch_once(&_ADLogQueue_onceToken, &__block_literal_global_215);
  }
  v0 = (void *)_ADLogQueue_loggingQueue;
  return v0;
}

id ADAdsOptions()
{
  if (ADAdsOptions_once != -1) {
    dispatch_once(&ADAdsOptions_once, &__block_literal_global_0);
  }
  v0 = (void *)ADAdsOptions_sOptions;
  return v0;
}

void sub_1D0EEF144(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id GetKeychainPropertyListForKey(void *a1, OSStatus *a2)
{
  id v3 = a1;
  uint64_t v4 = ADCopyDataFromKeychain(v3, a2);
  v5 = (void *)v4;
  if (*a2) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (v6)
  {
    v7 = [NSString stringWithFormat:@"Error %ld reading keychain data for %@", *a2, v3];
    _ADLog(@"iAdPersistenceLogging", v7, 16);
  }
  else
  {
    id v15 = 0;
    v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:&v15];
    v9 = NSString;
    id v10 = v15;
    v11 = v10;
    if (v8)
    {
      v12 = [v9 stringWithFormat:@"Loaded dictionary for %@", v3];
      _ADLog(@"iAdPersistenceLogging", v12, 0);

      goto LABEL_11;
    }
    v13 = [v9 stringWithFormat:@"Error deserializing data for %@: %@", v3, v10];
    _ADLog(@"iAdPersistenceLogging", v13, 16);
  }
  v8 = 0;
LABEL_11:

  return v8;
}

id ADCopyDataFromKeychain(void *a1, OSStatus *a2)
{
  id v3 = a1;
  uint64_t v4 = ADMakeMutableSecQuery(v3);
  [v4 setObject:*MEMORY[0x1E4F1CFD0] forKeyedSubscript:*MEMORY[0x1E4F3BC70]];
  CFTypeRef result = 0;
  OSStatus v5 = SecItemCopyMatching((CFDictionaryRef)v4, &result);
  *a2 = v5;
  if (v5 || !result)
  {
    if (v5 == -25300)
    {
      v7 = [NSString stringWithFormat:@"No previous keychain records found for key %@.", v3];
      v8 = v7;
      char v9 = 0;
    }
    else
    {
      v7 = [NSString stringWithFormat:@"Error %ld retrieving secure data for key %@", v5, v3];
      v8 = v7;
      char v9 = 16;
    }
    _ADLog(@"iAdPersistenceLogging", v8, v9);

    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithData:");
    CFRelease(result);
  }

  return v6;
}

void sub_1D0EF001C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D0EF00C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id ADMakeMutableSecQuery(void *a1)
{
  v1 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  [v3 setObject:@"apple" forKeyedSubscript:*MEMORY[0x1E4F3B550]];
  [v3 setObject:*MEMORY[0x1E4F3B988] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
  [v3 setObject:@"com.apple.iAdIDRecords" forKeyedSubscript:*MEMORY[0x1E4F3B850]];
  [v3 setObject:*MEMORY[0x1E4F3B570] forKeyedSubscript:*MEMORY[0x1E4F3B558]];
  uint64_t v4 = [v2 dataUsingEncoding:4];

  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F3B688]];
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F3B5C0]];

  return v3;
}

void ADSaveToPromotedContentKeychain(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v11 = 0;
    uint64_t v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:&v11];
    id v5 = v11;
    if (v5)
    {
      [NSString stringWithFormat:@"Error archiving data: %@ for key: %@", v5, v3];
    }
    else
    {
      uint64_t v7 = ADWriteDataToKeychain(v3, v4);
      if (!v7)
      {
        v8 = [NSString stringWithFormat:@"Saved key: %@ keychain", v3];
        char v9 = v8;
        char v10 = 0;
        goto LABEL_8;
      }
      [NSString stringWithFormat:@"Error: %d saving key: %@ to keychain", v7, v3];
    v8 = };
    char v9 = v8;
    char v10 = 16;
LABEL_8:
    _ADLog(@"iAdIDLogging", v9, v10);

    goto LABEL_9;
  }
  BOOL v6 = [NSString stringWithFormat:@"value for key: %@ is nil. So not saving to keychain.", v3];
  _ADLog(@"iAdIDLogging", v6, 16);

LABEL_9:
}

uint64_t ADWriteDataToKeychain(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = ADMakeMutableSecQuery(v3);
  [v5 removeObjectForKey:*MEMORY[0x1E4F3B558]];
  SecItemDelete((CFDictionaryRef)v5);
  if (v4)
  {
    BOOL v6 = ADMakeMutableSecQuery(v3);
    uint64_t v7 = *MEMORY[0x1E4F3BD38];
    [v6 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F3BD38]];
    uint64_t v8 = SecItemAdd((CFDictionaryRef)v6, 0);
    uint64_t v9 = v8;
    if (v8)
    {
      if (v8 == -25299)
      {
        char v10 = ADMakeMutableSecQuery(v3);
        [v10 removeObjectForKey:*MEMORY[0x1E4F3B978]];
        [v10 setObject:v4 forKeyedSubscript:v7];
        ADMakeMutableSecQuery(v3);
        CFDictionaryRef v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

        uint64_t v9 = SecItemUpdate(v11, (CFDictionaryRef)v10);
        if (v9)
        {
          v12 = [NSString stringWithFormat:@"Failed to update keychain item %@. Error %d", v3, v9];
          _ADLog(@"iAdPersistenceLogging", v12, 16);
        }
      }
      else
      {
        char v10 = [NSString stringWithFormat:@"Error %d checking for existence of keychain item %@", v8, v3];
        _ADLog(@"iAdPersistenceLogging", v10, 16);
        CFDictionaryRef v11 = (const __CFDictionary *)v5;
      }

      id v5 = v11;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void _reachabilityDidChange(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = a3;
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"Network reachability flags changed to 0x%x", a2);
  _ADLog(@"iAdInternalLogging", v4, 0);

  uint64_t v5 = 0;
  v7[10] = a2;
  if ((a2 & 2) != 0)
  {
    if ((a2 & 0x10000) != 0)
    {
      BOOL v6 = [NSString stringWithFormat:@"Somehow we believe that 'apple.com' is local to the device. We do not yet have internet access."];
      _ADLog(@"iAdInternalLogging", v6, 16);

      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = 1;
    }
  }
  [v7 _updateStatus:v5];
}

uint64_t ADConfigurationResponseReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
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
          v17 = objc_alloc_init(ADConfiguration);
          [(id)a1 addTheConfiguration:v17];
          if PBReaderPlaceMark() && (ADConfigurationReadFrom((uint64_t)v17, a2))
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
          goto LABEL_34;
        case 3u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 32;
          goto LABEL_34;
        case 4u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 48) |= 1u;
          break;
        case 5u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 16;
LABEL_34:
          v27 = *(void **)(a1 + v20);
          *(void *)(a1 + v20) = v19;

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
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
        *(void *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0) {
          goto LABEL_36;
        }
        v21 += 7;
        BOOL v14 = v22++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_38;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_36:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v23) = 0;
      }
LABEL_38:
      *(_DWORD *)(a1 + 8) = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ADConfigurationReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
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
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 24;
          goto LABEL_35;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 40) |= 2u;
          while (2)
          {
            uint64_t v23 = *v3;
            uint64_t v24 = *(void *)(a2 + v23);
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                BOOL v15 = v21++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_44;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_44:
          *(_DWORD *)(a1 + 32) = v22;
          continue;
        case 3u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          *(unsigned char *)(a1 + 40) |= 4u;
          break;
        case 4u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 16;
LABEL_35:
          v34 = *(void **)(a1 + v19);
          *(void *)(a1 + v19) = v18;

          continue;
        case 7u:
          *(unsigned char *)(a1 + 40) |= 1u;
          uint64_t v36 = *v3;
          unint64_t v37 = *(void *)(a2 + v36);
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v38 = *(void *)(*(void *)(a2 + *v7) + v37);
            *(void *)(a2 + v36) = v37 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v38 = 0;
          }
          *(void *)(a1 + 8) = v38;
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
        uint64_t v30 = *v3;
        uint64_t v31 = *(void *)(a2 + v30);
        unint64_t v32 = v31 + 1;
        if (v31 == -1 || v32 > *(void *)(a2 + *v4)) {
          break;
        }
        char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
        *(void *)(a2 + v30) = v32;
        v29 |= (unint64_t)(v33 & 0x7F) << v27;
        if ((v33 & 0x80) == 0) {
          goto LABEL_46;
        }
        v27 += 7;
        BOOL v15 = v28++ >= 9;
        if (v15)
        {
          uint64_t v29 = 0;
          goto LABEL_48;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_46:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v29 = 0;
      }
LABEL_48:
      *(unsigned char *)(a1 + 36) = v29 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ADClientSettingsResponseReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
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
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v22 = objc_alloc_init(ADParameter);
        [(id)a1 addSearchLandingAdsSettingsParams:v22];
      }
      else
      {
        if (v18 != 2)
        {
          if (v18 == 1)
          {
            *(unsigned char *)(a1 + 32) |= 1u;
            uint64_t v19 = *v3;
            unint64_t v20 = *(void *)(a2 + v19);
            if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)(a2 + *v4))
            {
              uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v20);
              *(void *)(a2 + v19) = v20 + 8;
            }
            else
            {
              *(unsigned char *)(a2 + *v5) = 1;
              uint64_t v21 = 0;
            }
            *(void *)(a1 + 8) = v21;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        uint64_t v22 = objc_alloc_init(ADParameter);
        [(id)a1 addSearchAdsSettingsParams:v22];
      }
      if (!PBReaderPlaceMark() || !ADParameterReadFrom((uint64_t)v22, a2))
      {

        return 0;
      }
      PBReaderRecallMark();
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL ADParameterReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
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
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1D0EF2E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D0EF3E30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ADAttributionRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
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
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 88;
          goto LABEL_54;
        case 2u:
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 104;
          goto LABEL_54;
        case 3u:
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 56;
          goto LABEL_54;
        case 4u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 64;
          goto LABEL_54;
        case 5u:
          *(unsigned char *)(a1 + 124) |= 8u;
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
          uint64_t v54 = 32;
          goto LABEL_88;
        case 6u:
          *(unsigned char *)(a1 + 124) |= 2u;
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v23 = 0;
          }
          uint64_t v54 = 16;
          goto LABEL_88;
        case 7u:
          *(unsigned char *)(a1 + 124) |= 4u;
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v27);
            *(void *)(a2 + v26) = v27 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v23 = 0;
          }
          uint64_t v54 = 24;
          goto LABEL_88;
        case 8u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          *(unsigned char *)(a1 + 124) |= 0x80u;
          while (2)
          {
            uint64_t v31 = *v3;
            uint64_t v32 = *(void *)(a2 + v31);
            unint64_t v33 = v32 + 1;
            if (v32 == -1 || v33 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
              *(void *)(a2 + v31) = v33;
              v30 |= (unint64_t)(v34 & 0x7F) << v28;
              if (v34 < 0)
              {
                v28 += 7;
                BOOL v15 = v29++ >= 9;
                if (v15)
                {
                  uint64_t v30 = 0;
                  goto LABEL_68;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v30 = 0;
          }
LABEL_68:
          *(unsigned char *)(a1 + 120) = v30 != 0;
          continue;
        case 9u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0;
          *(unsigned char *)(a1 + 124) |= 0x40u;
          while (2)
          {
            uint64_t v38 = *v3;
            uint64_t v39 = *(void *)(a2 + v38);
            unint64_t v40 = v39 + 1;
            if (v39 == -1 || v40 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
              *(void *)(a2 + v38) = v40;
              v37 |= (unint64_t)(v41 & 0x7F) << v35;
              if (v41 < 0)
              {
                v35 += 7;
                BOOL v15 = v36++ >= 9;
                if (v15)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_72;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v37) = 0;
          }
LABEL_72:
          uint64_t v53 = 96;
          goto LABEL_77;
        case 0xAu:
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 112;
          goto LABEL_54;
        case 0xBu:
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 72;
          goto LABEL_54;
        case 0xCu:
          *(unsigned char *)(a1 + 124) |= 0x10u;
          uint64_t v42 = *v3;
          unint64_t v43 = *(void *)(a2 + v42);
          if (v43 <= 0xFFFFFFFFFFFFFFF7 && v43 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v43);
            *(void *)(a2 + v42) = v43 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v23 = 0;
          }
          uint64_t v54 = 40;
          goto LABEL_88;
        case 0xDu:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 48;
LABEL_54:
          v44 = *(void **)(a1 + v19);
          *(void *)(a1 + v19) = v18;

          continue;
        case 0xEu:
          *(unsigned char *)(a1 + 124) |= 1u;
          uint64_t v45 = *v3;
          unint64_t v46 = *(void *)(a2 + v45);
          if (v46 <= 0xFFFFFFFFFFFFFFF7 && v46 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v46);
            *(void *)(a2 + v45) = v46 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v23 = 0;
          }
          uint64_t v54 = 8;
LABEL_88:
          *(void *)(a1 + v54) = v23;
          continue;
        case 0xFu:
          char v47 = 0;
          unsigned int v48 = 0;
          uint64_t v37 = 0;
          *(unsigned char *)(a1 + 124) |= 0x20u;
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
        uint64_t v49 = *v3;
        uint64_t v50 = *(void *)(a2 + v49);
        unint64_t v51 = v50 + 1;
        if (v50 == -1 || v51 > *(void *)(a2 + *v4)) {
          break;
        }
        char v52 = *(unsigned char *)(*(void *)(a2 + *v7) + v50);
        *(void *)(a2 + v49) = v51;
        v37 |= (unint64_t)(v52 & 0x7F) << v47;
        if ((v52 & 0x80) == 0) {
          goto LABEL_74;
        }
        v47 += 7;
        BOOL v15 = v48++ >= 9;
        if (v15)
        {
          LODWORD(v37) = 0;
          goto LABEL_76;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_74:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v37) = 0;
      }
LABEL_76:
      uint64_t v53 = 80;
LABEL_77:
      *(_DWORD *)(a1 + v53) = v37;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ADUserTransparencyResponseReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
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
        uint64_t v17 = objc_alloc_init(ADTransparencyDetails);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || !ADTransparencyDetailsReadFrom((uint64_t)v17, a2))
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

void __ADAdsOptions_block_invoke()
{
  v0 = (void *)ADAdsOptions_sOptions;
  ADAdsOptions_sOptions = (uint64_t)&unk_1F2715410;
}

BOOL ADLogAnalyticsRequestReadFrom(char *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
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
        uint64_t v18 = 40;
        goto LABEL_23;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
        goto LABEL_23;
      case 3u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 16;
        goto LABEL_23;
      case 4u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 24;
LABEL_23:
        uint64_t v19 = *(ADAnalyticsEvent **)&a1[v18];
        *(void *)&a1[v18] = v17;
        goto LABEL_24;
      case 0xAu:
        uint64_t v19 = objc_alloc_init(ADAnalyticsEvent);
        [a1 addEvents:v19];
        if PBReaderPlaceMark() && (ADAnalyticsEventReadFrom((uint64_t)v19, a2))
        {
          PBReaderRecallMark();
LABEL_24:

LABEL_25:
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
        goto LABEL_25;
    }
  }
}

__CFString *ADJingleAccountStatusToString(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%d)", a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = off_1E68A0750[a1 + 1];
  }
  return v1;
}

void sub_1D0EF930C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id obj)
{
}

BOOL ADTransparencyDetailsReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
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
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
        goto LABEL_24;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 8;
LABEL_24:
        unint64_t v20 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

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
    uint64_t v18 = PBReaderReadString();
    uint64_t v19 = 24;
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1D0EFA480(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D0EFA8FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D0EFACA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL ADClientSettingsRequestReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
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
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v19 = objc_alloc_init(ADParameter);
        [a1 addCurrentSettingParams:v19];
LABEL_24:
        if (!PBReaderPlaceMark() || !ADParameterReadFrom((uint64_t)v19, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_27;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = (ADParameter *)a1[3];
        a1[3] = v18;
LABEL_27:

        goto LABEL_29;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_29:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v19 = objc_alloc_init(ADParameter);
    [a1 addCurrentSearchLandingAdsSettingParams:v19];
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id ClientTypeToString(uint64_t a1)
{
  if (ClientTypeToString_onceToken != -1) {
    dispatch_once(&ClientTypeToString_onceToken, &__block_literal_global_5);
  }
  id v2 = (void *)ClientTypeToString_strings;
  id v3 = [NSNumber numberWithInteger:a1];
  id v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

void __ClientTypeToString_block_invoke()
{
  v3[7] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F2715028;
  v2[1] = &unk_1F2715040;
  v3[0] = @"ClientType_Default";
  v3[1] = @"ClientType_Tilt";
  v2[2] = &unk_1F2715058;
  v2[3] = &unk_1F2715070;
  v3[2] = @"ClientType_AnonymousDemand";
  v3[3] = @"ClientType_Content";
  v2[4] = &unk_1F2715088;
  v2[5] = &unk_1F27150A0;
  v3[4] = @"ClientType_Toro";
  v3[5] = @"ClientType_DevicePack";
  v2[6] = &unk_1F27150B8;
  v3[6] = @"ClientType_DeviceNewsPlusSubscriber";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:7];
  v1 = (void *)ClientTypeToString_strings;
  ClientTypeToString_strings = v0;
}

void sub_1D0EFDABC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D0EFDB6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D0EFE17C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1D0EFE444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ADOptOutRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
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
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 32;
          goto LABEL_39;
        case 2u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 48) |= 8u;
          break;
        case 3u:
          *(unsigned char *)(a1 + 48) |= 2u;
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v29);
            *(void *)(a2 + v28) = v29 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v30 = 0;
          }
          uint64_t v37 = 16;
          goto LABEL_48;
        case 4u:
          *(unsigned char *)(a1 + 48) |= 1u;
          uint64_t v31 = *v3;
          unint64_t v32 = *(void *)(a2 + v31);
          if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v32);
            *(void *)(a2 + v31) = v32 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v30 = 0;
          }
          uint64_t v37 = 8;
LABEL_48:
          *(void *)(a1 + v37) = v30;
          continue;
        case 5u:
          *(unsigned char *)(a1 + 48) |= 4u;
          uint64_t v33 = *v3;
          unint64_t v34 = *(void *)(a2 + v33);
          if (v34 <= 0xFFFFFFFFFFFFFFFBLL && v34 + 4 <= *(void *)(a2 + *v4))
          {
            int v35 = *(_DWORD *)(*(void *)(a2 + *v7) + v34);
            *(void *)(a2 + v33) = v34 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v35 = 0;
          }
          *(_DWORD *)(a1 + 40) = v35;
          continue;
        case 6u:
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 24;
LABEL_39:
          unsigned int v36 = *(void **)(a1 + v19);
          *(void *)(a1 + v19) = v18;

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
        uint64_t v24 = *v3;
        uint64_t v25 = *(void *)(a2 + v24);
        unint64_t v26 = v25 + 1;
        if (v25 == -1 || v26 > *(void *)(a2 + *v4)) {
          break;
        }
        char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
        *(void *)(a2 + v24) = v26;
        v23 |= (unint64_t)(v27 & 0x7F) << v21;
        if ((v27 & 0x80) == 0) {
          goto LABEL_41;
        }
        v21 += 7;
        BOOL v15 = v22++ >= 9;
        if (v15)
        {
          uint64_t v23 = 0;
          goto LABEL_43;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v23 = 0;
      }
LABEL_43:
      *(unsigned char *)(a1 + 44) = v23 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1D0EFFB58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D0EFFCCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D0F00194(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D0F0043C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL ADKeyedParameterListReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
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
        uint64_t v18 = (ADParameter *)a1[1];
        a1[1] = v17;
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
    uint64_t v18 = objc_alloc_init(ADParameter);
    [a1 addParameterList:v18];
    if (!PBReaderPlaceMark() || !ADParameterReadFrom((uint64_t)v18, a2))
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1D0F015B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ADAnalyticsEventReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
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
          uint64_t v16 = *v5;
          int v17 = *(unsigned __int8 *)(a2 + v16);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      uint64_t v16 = *v5;
      int v17 = *(unsigned __int8 *)(a2 + v16);
      if (*(unsigned char *)(a2 + v16)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v17 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 3)
      {
        uint64_t v26 = *v3;
        unint64_t v27 = *(void *)(a2 + v26);
        if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v28 = *(void *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v27 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + v16) = 1;
          uint64_t v28 = 0;
        }
        *(void *)(a1 + 8) = v28;
      }
      else if ((v10 >> 3) == 2)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        while (1)
        {
          uint64_t v22 = *v3;
          uint64_t v23 = *(void *)(a2 + v22);
          unint64_t v24 = v23 + 1;
          if (v23 == -1 || v24 > *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v24;
          v21 |= (unint64_t)(v25 & 0x7F) << v19;
          if ((v25 & 0x80) == 0) {
            goto LABEL_33;
          }
          v19 += 7;
          BOOL v15 = v20++ >= 9;
          if (v15)
          {
            LODWORD(v21) = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_35:
        *(_DWORD *)(a1 + 16) = v21;
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

uint64_t ADSegmentUpdateRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
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
        int v17 = v10 & 7;
        if (!v16 && v17 != 4)
        {
          switch((v10 >> 3))
          {
            case 2u:
              uint64_t v19 = PBReaderReadData();
              uint64_t v20 = 120;
              goto LABEL_51;
            case 3u:
              uint64_t v19 = PBReaderReadString();
              uint64_t v20 = 144;
              goto LABEL_51;
            case 4u:
              char v21 = 0;
              unsigned int v22 = 0;
              uint64_t v23 = 0;
              *(unsigned char *)(a1 + 160) |= 0x10u;
              while (2)
              {
                uint64_t v24 = *v3;
                uint64_t v25 = *(void *)(a2 + v24);
                unint64_t v26 = v25 + 1;
                if (v25 == -1 || v26 > *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
                  *(void *)(a2 + v24) = v26;
                  v23 |= (unint64_t)(v27 & 0x7F) << v21;
                  if (v27 < 0)
                  {
                    v21 += 7;
                    BOOL v15 = v22++ >= 9;
                    if (v15)
                    {
                      uint64_t v23 = 0;
                      goto LABEL_95;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v23 = 0;
              }
LABEL_95:
              *(unsigned char *)(a1 + 156) = v23 != 0;
              goto LABEL_130;
            case 5u:
              uint64_t v19 = PBReaderReadString();
              uint64_t v20 = 96;
LABEL_51:
              unint64_t v43 = *(void **)(a1 + v20);
              *(void *)(a1 + v20) = v19;

              goto LABEL_130;
            case 6u:
            case 7u:
LABEL_22:
              if (PBReaderSkipValueWithTag()) {
                goto LABEL_130;
              }
              return 0;
            case 8u:
              *(unsigned char *)(a1 + 160) |= 1u;
              uint64_t v28 = *v3;
              unint64_t v29 = *(void *)(a2 + v28);
              if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v29);
                *(void *)(a2 + v28) = v29 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v30 = 0;
              }
              uint64_t v86 = 80;
              goto LABEL_127;
            case 9u:
              *(unsigned char *)(a1 + 160) |= 2u;
              uint64_t v31 = *v3;
              unint64_t v32 = *(void *)(a2 + v31);
              if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v32);
                *(void *)(a2 + v31) = v32 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v30 = 0;
              }
              uint64_t v86 = 88;
LABEL_127:
              *(void *)(a1 + v86) = v30;
              goto LABEL_130;
            case 0xAu:
              *(unsigned char *)(a1 + 160) |= 8u;
              uint64_t v33 = *v3;
              unint64_t v34 = *(void *)(a2 + v33);
              if (v34 <= 0xFFFFFFFFFFFFFFFBLL && v34 + 4 <= *(void *)(a2 + *v4))
              {
                int v35 = *(_DWORD *)(*(void *)(a2 + *v7) + v34);
                *(void *)(a2 + v33) = v34 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                int v35 = 0;
              }
              *(_DWORD *)(a1 + 152) = v35;
              goto LABEL_130;
            case 0xBu:
              char v36 = 0;
              unsigned int v37 = 0;
              uint64_t v38 = 0;
              *(unsigned char *)(a1 + 160) |= 4u;
              while (2)
              {
                uint64_t v39 = *v3;
                uint64_t v40 = *(void *)(a2 + v39);
                unint64_t v41 = v40 + 1;
                if (v40 == -1 || v41 > *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v42 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
                  *(void *)(a2 + v39) = v41;
                  v38 |= (unint64_t)(v42 & 0x7F) << v36;
                  if (v42 < 0)
                  {
                    v36 += 7;
                    BOOL v15 = v37++ >= 9;
                    if (v15)
                    {
                      LODWORD(v38) = 0;
                      goto LABEL_99;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v38) = 0;
              }
LABEL_99:
              *(_DWORD *)(a1 + 104) = v38;
              goto LABEL_130;
            default:
              switch((v10 >> 3))
              {
                case '\'':
                  uint64_t v19 = PBReaderReadString();
                  uint64_t v20 = 136;
                  goto LABEL_51;
                case '(':
                  uint64_t v19 = PBReaderReadString();
                  uint64_t v20 = 128;
                  goto LABEL_51;
                case ')':
                  uint64_t v19 = PBReaderReadData();
                  uint64_t v20 = 112;
                  goto LABEL_51;
                case '*':
                  if (v17 != 2)
                  {
                    char v65 = 0;
                    unsigned int v66 = 0;
                    uint64_t v67 = 0;
                    while (1)
                    {
                      uint64_t v68 = *v3;
                      uint64_t v69 = *(void *)(a2 + v68);
                      unint64_t v70 = v69 + 1;
                      if (v69 == -1 || v70 > *(void *)(a2 + *v4)) {
                        goto LABEL_121;
                      }
                      char v71 = *(unsigned char *)(*(void *)(a2 + *v7) + v69);
                      *(void *)(a2 + v68) = v70;
                      v67 |= (unint64_t)(v71 & 0x7F) << v65;
                      if (v71 < 0)
                      {
                        v65 += 7;
                        BOOL v15 = v66++ >= 9;
                        if (!v15) {
                          continue;
                        }
                      }
                      goto LABEL_122;
                    }
                  }
                  uint64_t result = PBReaderPlaceMark();
                  if (!result) {
                    return result;
                  }
                  while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
                  {
                    char v44 = 0;
                    unsigned int v45 = 0;
                    uint64_t v46 = 0;
                    while (1)
                    {
                      uint64_t v47 = *v3;
                      uint64_t v48 = *(void *)(a2 + v47);
                      unint64_t v49 = v48 + 1;
                      if (v48 == -1 || v49 > *(void *)(a2 + *v4)) {
                        break;
                      }
                      char v50 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
                      *(void *)(a2 + v47) = v49;
                      v46 |= (unint64_t)(v50 & 0x7F) << v44;
                      if (v50 < 0)
                      {
                        v44 += 7;
                        BOOL v15 = v45++ >= 9;
                        if (!v15) {
                          continue;
                        }
                      }
                      goto LABEL_64;
                    }
                    *(unsigned char *)(a2 + *v5) = 1;
LABEL_64:
                    PBRepeatedInt32Add();
                  }
                  goto LABEL_91;
                case '+':
                  if (v17 != 2)
                  {
                    char v72 = 0;
                    unsigned int v73 = 0;
                    uint64_t v74 = 0;
                    while (1)
                    {
                      uint64_t v75 = *v3;
                      uint64_t v76 = *(void *)(a2 + v75);
                      unint64_t v77 = v76 + 1;
                      if (v76 == -1 || v77 > *(void *)(a2 + *v4)) {
                        goto LABEL_121;
                      }
                      char v78 = *(unsigned char *)(*(void *)(a2 + *v7) + v76);
                      *(void *)(a2 + v75) = v77;
                      v74 |= (unint64_t)(v78 & 0x7F) << v72;
                      if (v78 < 0)
                      {
                        v72 += 7;
                        BOOL v15 = v73++ >= 9;
                        if (!v15) {
                          continue;
                        }
                      }
                      goto LABEL_122;
                    }
                  }
                  uint64_t result = PBReaderPlaceMark();
                  if (!result) {
                    return result;
                  }
                  while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
                  {
                    char v51 = 0;
                    unsigned int v52 = 0;
                    uint64_t v53 = 0;
                    while (1)
                    {
                      uint64_t v54 = *v3;
                      uint64_t v55 = *(void *)(a2 + v54);
                      unint64_t v56 = v55 + 1;
                      if (v55 == -1 || v56 > *(void *)(a2 + *v4)) {
                        break;
                      }
                      char v57 = *(unsigned char *)(*(void *)(a2 + *v7) + v55);
                      *(void *)(a2 + v54) = v56;
                      v53 |= (unint64_t)(v57 & 0x7F) << v51;
                      if (v57 < 0)
                      {
                        v51 += 7;
                        BOOL v15 = v52++ >= 9;
                        if (!v15) {
                          continue;
                        }
                      }
                      goto LABEL_77;
                    }
                    *(unsigned char *)(a2 + *v5) = 1;
LABEL_77:
                    PBRepeatedInt32Add();
                  }
                  goto LABEL_91;
                case ',':
                  if (v17 == 2)
                  {
                    uint64_t result = PBReaderPlaceMark();
                    if (!result) {
                      return result;
                    }
                    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
                    {
                      char v58 = 0;
                      unsigned int v59 = 0;
                      uint64_t v60 = 0;
                      while (1)
                      {
                        uint64_t v61 = *v3;
                        uint64_t v62 = *(void *)(a2 + v61);
                        unint64_t v63 = v62 + 1;
                        if (v62 == -1 || v63 > *(void *)(a2 + *v4)) {
                          break;
                        }
                        char v64 = *(unsigned char *)(*(void *)(a2 + *v7) + v62);
                        *(void *)(a2 + v61) = v63;
                        v60 |= (unint64_t)(v64 & 0x7F) << v58;
                        if (v64 < 0)
                        {
                          v58 += 7;
                          BOOL v15 = v59++ >= 9;
                          if (!v15) {
                            continue;
                          }
                        }
                        goto LABEL_90;
                      }
                      *(unsigned char *)(a2 + *v5) = 1;
LABEL_90:
                      PBRepeatedInt32Add();
                    }
LABEL_91:
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
                      uint64_t v83 = *(void *)(a2 + v82);
                      unint64_t v84 = v83 + 1;
                      if (v83 == -1 || v84 > *(void *)(a2 + *v4)) {
                        break;
                      }
                      char v85 = *(unsigned char *)(*(void *)(a2 + *v7) + v83);
                      *(void *)(a2 + v82) = v84;
                      v81 |= (unint64_t)(v85 & 0x7F) << v79;
                      if (v85 < 0)
                      {
                        v79 += 7;
                        BOOL v15 = v80++ >= 9;
                        if (!v15) {
                          continue;
                        }
                      }
                      goto LABEL_122;
                    }
LABEL_121:
                    *(unsigned char *)(a2 + *v5) = 1;
LABEL_122:
                    PBRepeatedInt32Add();
                  }
LABEL_130:
                  if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                    return *(unsigned char *)(a2 + *v5) == 0;
                  }
                  continue;
                default:
                  goto LABEL_22;
              }
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1D0F04B90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D0F04BF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL ADSettingsReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
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
        uint64_t v18 = (ADParameter *)a1[1];
        a1[1] = v17;
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
    uint64_t v18 = objc_alloc_init(ADParameter);
    [a1 addParameters:v18];
    if (!PBReaderPlaceMark() || !ADParameterReadFrom((uint64_t)v18, a2))
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL ADConfigurationRequestReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
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
        uint64_t v17 = objc_alloc_init(ADConfiguration);
        [a1 addCurrentConfiguration:v17];
        if (!PBReaderPlaceMark() || (ADConfigurationReadFrom((uint64_t)v17, a2) & 1) == 0)
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
    uint64_t v17 = (ADConfiguration *)a1[2];
    a1[2] = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SetKeychainPropertyListForKey(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v13 = 0;
  id v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a2 format:200 options:0 error:&v13];
  id v5 = v13;
  BOOL v6 = v5;
  if (v5)
  {
    uint64_t v7 = NSString;
    uint64_t v8 = [v5 code];
    unsigned int v9 = [v6 userInfo];
    unint64_t v10 = [v7 stringWithFormat:@"Error serializing property list. Error %lu.\n%@", v8, v9];
    _ADLog(@"iAdIDLogging", v10, 16);

    uint64_t v11 = 4294899602;
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v11 = ADWriteDataToKeychain(v3, v4);
  if (v11)
  {
    unsigned int v9 = objc_msgSend(NSString, "stringWithFormat:", @"Error saving data to keychain: %d", v11);
    _ADLog(@"iAdInternalLogging", v9, 16);
    goto LABEL_5;
  }
LABEL_6:

  return v11;
}

id ADEncryptString(void *a1)
{
  id v1 = a1;
  if (ADEncryptString_onceToken != -1) {
    dispatch_once(&ADEncryptString_onceToken, &__block_literal_global_13);
  }
  id v2 = [v1 dataUsingEncoding:4];
  size_t v3 = [v2 length];
  id v4 = v2;
  id v5 = (const uint8_t *)[v4 bytes];
  BOOL v6 = (uint8_t *)malloc_type_calloc(ADEncryptString_cipherBufferSize, 1uLL, 0x100004077774924uLL);
  uint64_t v7 = SecKeyEncrypt((SecKeyRef)ADEncryptString_adServerKeyRef, 1u, v5, v3, v6, (size_t *)&ADEncryptString_cipherBufferSize);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to encrypt string with result %d.", v7);
    _ADLog(@"ToroLogging", v8, 16);

    unsigned int v9 = 0;
  }
  else
  {
    unsigned int v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v6 length:ADEncryptString_cipherBufferSize];
  }
  free(v6);

  return v9;
}

size_t __ADEncryptString_block_invoke()
{
  ADEncryptString_adServerKeyRef = SecKeyCreateRSAPublicKey();
  size_t result = SecKeyGetBlockSize((SecKeyRef)ADEncryptString_adServerKeyRef);
  ADEncryptString_cipherBufferSize = result;
  return result;
}

__CFString *ADAdConnectionGetStringForValue(unsigned int a1)
{
  if (a1 > 0xA) {
    return @"<BADVALUE>";
  }
  else {
    return off_1E68A0A98[a1];
  }
}

__CFString *dumpObject(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    unsigned int v22 = @"(null)";
    goto LABEL_51;
  }
  id v32 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v34 = v1;
  size_t v3 = (objc_class *)objc_opt_class();
  for (uint64_t i = objc_opt_class(); ; uint64_t i = objc_opt_class())
  {
    if (v3 == (objc_class *)i)
    {
      uint64_t v19 = objc_msgSend(v2, "AD_jsonString");
      uint64_t v20 = [v19 mutableCopy];

      char v21 = (void *)v20;
      goto LABEL_50;
    }
    unsigned int outCount = 0;
    uint64_t v31 = v3;
    uint64_t v33 = class_copyPropertyList(v3, &outCount);
    if (outCount)
    {
      uint64_t v5 = 0;
      while (1)
      {
        BOOL v6 = [NSString stringWithUTF8String:property_getName(v33[v5])];
        uint64_t v7 = [v34 valueForKey:v6];
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          uint64_t v8 = v7;
          goto LABEL_9;
        }
        if (!v7) {
          break;
        }
        if (v7 != (void *)[(objc_class *)v31 superclass]
          && ([v6 isEqualToString:@"superclass"] & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend(v7, "AD_dictionaryForJSON");
            uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_9;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend(v7, "AD_arrayForJSON");
            uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_9;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend(v7, "AD_dataStringForJSON");
            uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_9;
          }
          NSClassFromString(&cfstr_Nsblock.isa);
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            uint64_t v8 = [NSString stringWithFormat:@"%@", v7];
LABEL_9:
            unsigned int v9 = v8;
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) == 0)
            {
              uint64_t v18 = [NSString stringWithFormat:@"Found an object that could not be converted to JSON: %@ (%@)", v7, objc_opt_class()];
              _ADLog(@"ToroLogging", v18, 0);

              int v17 = 1;
              goto LABEL_34;
            }
            int v16 = [v7 dictionaryRepresentation];
            objc_msgSend(v16, "AD_dictionaryForJSON");
            unsigned int v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
LABEL_10:
          uint64_t v10 = 1;
          while (1)
          {
            uint64_t v11 = [v2 objectForKey:v6];
            if (!v11) {
              break;
            }
            unint64_t v12 = [v2 objectForKey:v6];
            char v13 = [v12 isEqual:v9];

            if (v13) {
              break;
            }
            char v14 = [NSString stringWithFormat:@"WARNING: There are multiple properties in this object with the same name... (%@)", v6];
            _ADLog(@"ToroLogging", v14, 0);

            uint64_t v15 = [NSString stringWithFormat:@"%@_%d", v6, v10];

            uint64_t v10 = (v10 + 1);
            BOOL v6 = (void *)v15;
          }
          [v2 setObject:v9 forKey:v6];
          goto LABEL_15;
        }
        unsigned int v9 = 0;
LABEL_15:

        if (++v5 >= (unint64_t)outCount) {
          goto LABEL_33;
        }
      }
      unsigned int v9 = @"(null)";
      goto LABEL_10;
    }
LABEL_33:
    int v17 = 0;
LABEL_34:
    if (v33 && outCount) {
      free(v33);
    }
    if (v17) {
      break;
    }
    size_t v3 = (objc_class *)[(objc_class *)v31 superclass];
  }
  for (j = objc_opt_class(); j != objc_opt_class(); j = (void *)[j superclass])
  {
    uint64_t v24 = [NSString stringWithUTF8String:class_getName((Class)j)];
    [v32 appendFormat:@"--- %@ ---\n", v24];

    unsigned int v35 = 0;
    uint64_t v25 = class_copyPropertyList((Class)j, &v35);
    if (v35)
    {
      unint64_t v26 = v25;
      for (unint64_t k = 0; k < v35; ++k)
      {
        uint64_t v28 = [NSString stringWithUTF8String:property_getName(v26[k])];
        unint64_t v29 = [v34 valueForKey:v28];
        [v32 appendFormat:@"%@: %@\n", v28, v29];
      }
      if (v35) {
        free(v26);
      }
    }
  }
  char v21 = v32;
LABEL_50:
  unsigned int v22 = [NSString stringWithString:v21];

  id v1 = v34;
LABEL_51:

  return v22;
}

void sub_1D0F06E94()
{
}

uint64_t RequestRetryDelay(uint64_t a1)
{
  if (((a1 - 2) & (a1 - 1)) != 0) {
    return 0;
  }
  else {
    return 30;
  }
}

void takeXPCTransaction(void *a1)
{
  id v1 = a1;
  id v2 = _TransactionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __takeXPCTransaction_block_invoke;
  block[3] = &unk_1E68A0940;
  id v5 = v1;
  id v3 = v1;
  dispatch_sync(v2, block);
}

id _TransactionQueue()
{
  if (_TransactionQueue_onceToken != -1) {
    dispatch_once(&_TransactionQueue_onceToken, &__block_literal_global_163);
  }
  uint64_t v0 = (void *)_TransactionQueue___queue;
  return v0;
}

void __takeXPCTransaction_block_invoke(uint64_t a1)
{
  id v2 = _TransactionsByReason();
  id v5 = [v2 objectForKey:*(void *)(a1 + 32)];

  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v3 = _TransactionsByReason();
    [v3 setObject:v5 forKey:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 32) UTF8String];
  id v4 = (void *)os_transaction_create();
  [v5 addObject:v4];
}

id _TransactionsByReason()
{
  if (_TransactionsByReason_onceToken != -1) {
    dispatch_once(&_TransactionsByReason_onceToken, &__block_literal_global_166);
  }
  uint64_t v0 = (void *)_TransactionsByReason___transactions;
  return v0;
}

void releaseXPCTransaction(void *a1)
{
  id v1 = a1;
  id v2 = _TransactionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __releaseXPCTransaction_block_invoke;
  block[3] = &unk_1E68A0940;
  id v5 = v1;
  id v3 = v1;
  dispatch_sync(v2, block);
}

void __releaseXPCTransaction_block_invoke(uint64_t a1)
{
  id v2 = _TransactionsByReason();
  id v4 = [v2 objectForKey:*(void *)(a1 + 32)];

  if ([v4 count])
  {
    [v4 removeLastObject];
  }
  else
  {
    id v3 = [NSString stringWithFormat:@"****** imbalanced transactions for reason '%@' -- please file a radar ******", *(void *)(a1 + 32)];
    _ADLog(@"LATDLogging", v3, 0);
  }
}

BOOL StringMatch(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 UTF8String];
  id v6 = v4;
  uint64_t v7 = (const char *)[v6 UTF8String];

  BOOL v8 = 0;
  if (v5 && v7)
  {
    memset(&v15, 0, sizeof(v15));
    if (regcomp(&v15, v7, 7))
    {
      MEMORY[0x1F4188790]();
      regerror(0, &v15, v14, 0xFFuLL);
      uint64_t v11 = NSString;
      unint64_t v12 = [NSString stringWithUTF8String:v14];
      char v13 = [v11 stringWithFormat:@"[%s]: Error %d compiling regular expression pattern '%s' - %@", "BOOL StringMatch(NSString *__strong, NSString *__strong)", 0, v7, v12];
      _ADLog(@"iAdInternalLogging", v13, 0);

      memset(&v15, 0, sizeof(v15));
      BOOL v8 = 0;
    }
    else
    {
      int v9 = regexec(&v15, (const char *)[v3 UTF8String], 0, 0, 2);
      MEMORY[0x1D25F3780](&v15);
      BOOL v8 = v9 == 0;
    }
  }

  return v8;
}

id StringIsUUID(void *a1)
{
  id result = a1;
  if (result)
  {
    id v2 = result;
    if ([result hasPrefix:@"DPID-"])
    {
      uint64_t v3 = [v2 stringByReplacingOccurrencesOfString:@"DPID-" withString:&stru_1F270BEE0];

      id v2 = (void *)v3;
    }
    BOOL v4 = StringMatch(v2, @"^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}");

    return (id)v4;
  }
  return result;
}

BOOL StringIsFromUUID(void *a1)
{
  if (!a1) {
    return 0;
  }
  id v1 = (objc_class *)MEMORY[0x1E4F29128];
  id v2 = a1;
  uint64_t v3 = (void *)[[v1 alloc] initWithUUIDString:v2];

  BOOL v4 = v3 != 0;
  return v4;
}

BOOL StringIsZeroUUID(void *a1)
{
  return StringMatch(a1, @"^[0]{8}-[0]{4}-[0]{4}-[0]{4}-[0]{12}");
}

void ADSimulateCrash(uint64_t a1, void *a2, int a3)
{
  id v8 = a2;
  BOOL v4 = [NSString stringWithFormat:@"%@", v8];
  _ADLog(@"iAdInternalLogging", v4, 16);

  getpid();
  SimulateCrash();
  uint64_t v5 = +[ADCoreSettings sharedInstance];
  LODWORD(v4) = [v5 unitTesting];

  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 0;
  }
  if (!v6) {
    exit(1);
  }
  if (a3)
  {
    uint64_t v7 = [NSString stringWithFormat:@"We should exit at this point. If you see this log outside of the Unit Tests, Please file a radar..."];
    _ADLog(@"iAdInternalLogging", v7, 16);
  }
}

void sub_1D0F07AF8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1D0F07CF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D0F07E28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D0F08010(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL ADLogAnalyticsResponseReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  BOOL v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  BOOL v6 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

void sub_1D0F0AFC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D0F0B020(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D0F0B098(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D0F0B100(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D0F0B15C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D0F0B42C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D0F0B558(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL ADOptOutResponseReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  BOOL v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  BOOL v6 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

uint64_t ADUserTargetingPropertiesReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  BOOL v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x1E4F940B8];
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
    int v17 = v10 & 7;
    if (v16 || v17 == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        *(_WORD *)(a1 + 348) |= 1u;
        uint64_t v19 = *v3;
        unint64_t v20 = *(void *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v20);
          *(void *)(a2 + v19) = v20 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v21 = 0;
        }
        *(void *)(a1 + 80) = v21;
        goto LABEL_132;
      case 2u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 112;
        goto LABEL_131;
      case 3u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 184;
        goto LABEL_131;
      case 4u:
        *(_WORD *)(a1 + 348) |= 0x200u;
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 <= 0xFFFFFFFFFFFFFFFBLL && v25 + 4 <= *(void *)(a2 + *v4))
        {
          int v26 = *(_DWORD *)(*(void *)(a2 + *v7) + v25);
          *(void *)(a2 + v24) = v25 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v26 = 0;
        }
        uint64_t v126 = 320;
        goto LABEL_218;
      case 5u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v29 = 0;
        *(_WORD *)(a1 + 348) |= 0x100u;
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
                goto LABEL_158;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v29) = 0;
        }
LABEL_158:
        uint64_t v102 = 288;
        goto LABEL_184;
      case 6u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 120;
        goto LABEL_131;
      case 7u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 264;
        goto LABEL_131;
      case 8u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 216;
        goto LABEL_131;
      case 9u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 240;
        goto LABEL_131;
      case 0xAu:
        PBReaderReadString();
        unint64_t v34 = (ADParameter *)objc_claimAutoreleasedReturnValue();
        if (v34) {
          [(id)a1 addUserKeyboard:v34];
        }
        goto LABEL_88;
      case 0xBu:
        char v35 = 0;
        unsigned int v36 = 0;
        uint64_t v29 = 0;
        *(_WORD *)(a1 + 348) |= 4u;
        while (2)
        {
          uint64_t v37 = *v3;
          uint64_t v38 = *(void *)(a2 + v37);
          unint64_t v39 = v38 + 1;
          if (v38 == -1 || v39 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
            *(void *)(a2 + v37) = v39;
            v29 |= (unint64_t)(v40 & 0x7F) << v35;
            if (v40 < 0)
            {
              v35 += 7;
              BOOL v15 = v36++ >= 9;
              if (v15)
              {
                LODWORD(v29) = 0;
                goto LABEL_162;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v29) = 0;
        }
LABEL_162:
        uint64_t v102 = 128;
        goto LABEL_184;
      case 0xCu:
        if (v17 != 2)
        {
          char v105 = 0;
          unsigned int v106 = 0;
          uint64_t v107 = 0;
          while (1)
          {
            uint64_t v108 = *v3;
            uint64_t v109 = *(void *)(a2 + v108);
            unint64_t v110 = v109 + 1;
            if (v109 == -1 || v110 > *(void *)(a2 + *v4)) {
              goto LABEL_206;
            }
            char v111 = *(unsigned char *)(*(void *)(a2 + *v7) + v109);
            *(void *)(a2 + v108) = v110;
            v107 |= (unint64_t)(v111 & 0x7F) << v105;
            if (v111 < 0)
            {
              v105 += 7;
              BOOL v15 = v106++ >= 9;
              if (!v15) {
                continue;
              }
            }
            goto LABEL_207;
          }
        }
        uint64_t result = PBReaderPlaceMark();
        if (!result) {
          return result;
        }
        while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
        {
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v44 = 0;
          while (1)
          {
            uint64_t v45 = *v3;
            uint64_t v46 = *(void *)(a2 + v45);
            unint64_t v47 = v46 + 1;
            if (v46 == -1 || v47 > *(void *)(a2 + *v4)) {
              break;
            }
            char v48 = *(unsigned char *)(*(void *)(a2 + *v7) + v46);
            *(void *)(a2 + v45) = v47;
            v44 |= (unint64_t)(v48 & 0x7F) << v42;
            if (v48 < 0)
            {
              v42 += 7;
              BOOL v15 = v43++ >= 9;
              if (!v15) {
                continue;
              }
            }
            goto LABEL_59;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_59:
          PBRepeatedInt32Add();
        }
        goto LABEL_147;
      case 0xDu:
        if (v17 != 2)
        {
          char v112 = 0;
          unsigned int v113 = 0;
          uint64_t v114 = 0;
          while (1)
          {
            uint64_t v115 = *v3;
            uint64_t v116 = *(void *)(a2 + v115);
            unint64_t v117 = v116 + 1;
            if (v116 == -1 || v117 > *(void *)(a2 + *v4)) {
              goto LABEL_206;
            }
            char v118 = *(unsigned char *)(*(void *)(a2 + *v7) + v116);
            *(void *)(a2 + v115) = v117;
            v114 |= (unint64_t)(v118 & 0x7F) << v112;
            if (v118 < 0)
            {
              v112 += 7;
              BOOL v15 = v113++ >= 9;
              if (!v15) {
                continue;
              }
            }
            goto LABEL_207;
          }
        }
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
            uint64_t v53 = *(void *)(a2 + v52);
            unint64_t v54 = v53 + 1;
            if (v53 == -1 || v54 > *(void *)(a2 + *v4)) {
              break;
            }
            char v55 = *(unsigned char *)(*(void *)(a2 + *v7) + v53);
            *(void *)(a2 + v52) = v54;
            v51 |= (unint64_t)(v55 & 0x7F) << v49;
            if (v55 < 0)
            {
              v49 += 7;
              BOOL v15 = v50++ >= 9;
              if (!v15) {
                continue;
              }
            }
            goto LABEL_72;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_72:
          PBRepeatedInt32Add();
        }
        goto LABEL_147;
      case 0xEu:
        *(_WORD *)(a1 + 348) |= 0x20u;
        uint64_t v56 = *v3;
        unint64_t v57 = *(void *)(a2 + v56);
        if (v57 <= 0xFFFFFFFFFFFFFFFBLL && v57 + 4 <= *(void *)(a2 + *v4))
        {
          int v26 = *(_DWORD *)(*(void *)(a2 + *v7) + v57);
          *(void *)(a2 + v56) = v57 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v26 = 0;
        }
        uint64_t v126 = 232;
        goto LABEL_218;
      case 0xFu:
        *(_WORD *)(a1 + 348) |= 0x40u;
        uint64_t v58 = *v3;
        unint64_t v59 = *(void *)(a2 + v58);
        if (v59 <= 0xFFFFFFFFFFFFFFFBLL && v59 + 4 <= *(void *)(a2 + *v4))
        {
          int v26 = *(_DWORD *)(*(void *)(a2 + *v7) + v59);
          *(void *)(a2 + v58) = v59 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v26 = 0;
        }
        uint64_t v126 = 256;
        goto LABEL_218;
      case 0x10u:
        *(_WORD *)(a1 + 348) |= 0x10u;
        uint64_t v60 = *v3;
        unint64_t v61 = *(void *)(a2 + v60);
        if (v61 <= 0xFFFFFFFFFFFFFFFBLL && v61 + 4 <= *(void *)(a2 + *v4))
        {
          int v26 = *(_DWORD *)(*(void *)(a2 + *v7) + v61);
          *(void *)(a2 + v60) = v61 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v26 = 0;
        }
        uint64_t v126 = 200;
LABEL_218:
        *(_DWORD *)(a1 + v126) = v26;
        goto LABEL_132;
      case 0x11u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 224;
        goto LABEL_131;
      case 0x14u:
        unint64_t v34 = objc_alloc_init(ADParameter);
        [(id)a1 addTargeting:v34];
        if (PBReaderPlaceMark() && ADParameterReadFrom((uint64_t)v34, a2))
        {
          PBReaderRecallMark();
LABEL_88:

LABEL_132:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 0x15u:
        char v62 = 0;
        unsigned int v63 = 0;
        uint64_t v64 = 0;
        *(_WORD *)(a1 + 348) |= 0x800u;
        while (2)
        {
          uint64_t v65 = *v3;
          uint64_t v66 = *(void *)(a2 + v65);
          unint64_t v67 = v66 + 1;
          if (v66 == -1 || v67 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v68 = *(unsigned char *)(*(void *)(a2 + *v7) + v66);
            *(void *)(a2 + v65) = v67;
            v64 |= (unint64_t)(v68 & 0x7F) << v62;
            if (v68 < 0)
            {
              v62 += 7;
              BOOL v15 = v63++ >= 9;
              if (v15)
              {
                uint64_t v64 = 0;
                goto LABEL_166;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v64 = 0;
        }
LABEL_166:
        BOOL v103 = v64 != 0;
        uint64_t v104 = 345;
        goto LABEL_175;
      case 0x16u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 328;
        goto LABEL_131;
      case 0x17u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 208;
        goto LABEL_131;
      case 0x18u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 104;
        goto LABEL_131;
      case 0x19u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 176;
        goto LABEL_131;
      case 0x1Au:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 280;
        goto LABEL_131;
      case 0x1Bu:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 88;
        goto LABEL_131;
      case 0x1Cu:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 248;
        goto LABEL_131;
      case 0x1Du:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 304;
        goto LABEL_131;
      case 0x1Eu:
        char v69 = 0;
        unsigned int v70 = 0;
        uint64_t v29 = 0;
        *(_WORD *)(a1 + 348) |= 2u;
        while (2)
        {
          uint64_t v71 = *v3;
          uint64_t v72 = *(void *)(a2 + v71);
          unint64_t v73 = v72 + 1;
          if (v72 == -1 || v73 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v74 = *(unsigned char *)(*(void *)(a2 + *v7) + v72);
            *(void *)(a2 + v71) = v73;
            v29 |= (unint64_t)(v74 & 0x7F) << v69;
            if (v74 < 0)
            {
              v69 += 7;
              BOOL v15 = v70++ >= 9;
              if (v15)
              {
                LODWORD(v29) = 0;
                goto LABEL_170;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v29) = 0;
        }
LABEL_170:
        uint64_t v102 = 96;
        goto LABEL_184;
      case 0x1Fu:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 192;
        goto LABEL_131;
      case 0x20u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 144;
        goto LABEL_131;
      case 0x21u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 136;
        goto LABEL_131;
      case 0x22u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 168;
        goto LABEL_131;
      case 0x23u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 160;
        goto LABEL_131;
      case 0x24u:
        char v75 = 0;
        unsigned int v76 = 0;
        uint64_t v77 = 0;
        *(_WORD *)(a1 + 348) |= 0x400u;
        while (2)
        {
          uint64_t v78 = *v3;
          uint64_t v79 = *(void *)(a2 + v78);
          unint64_t v80 = v79 + 1;
          if (v79 == -1 || v80 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v81 = *(unsigned char *)(*(void *)(a2 + *v7) + v79);
            *(void *)(a2 + v78) = v80;
            v77 |= (unint64_t)(v81 & 0x7F) << v75;
            if (v81 < 0)
            {
              v75 += 7;
              BOOL v15 = v76++ >= 9;
              if (v15)
              {
                uint64_t v77 = 0;
                goto LABEL_174;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v77 = 0;
        }
LABEL_174:
        BOOL v103 = v77 != 0;
        uint64_t v104 = 344;
LABEL_175:
        *(unsigned char *)(a1 + v104) = v103;
        goto LABEL_132;
      case 0x25u:
        char v82 = 0;
        unsigned int v83 = 0;
        uint64_t v29 = 0;
        *(_WORD *)(a1 + 348) |= 8u;
        while (2)
        {
          uint64_t v84 = *v3;
          uint64_t v85 = *(void *)(a2 + v84);
          unint64_t v86 = v85 + 1;
          if (v85 == -1 || v86 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v87 = *(unsigned char *)(*(void *)(a2 + *v7) + v85);
            *(void *)(a2 + v84) = v86;
            v29 |= (unint64_t)(v87 & 0x7F) << v82;
            if (v87 < 0)
            {
              v82 += 7;
              BOOL v15 = v83++ >= 9;
              if (v15)
              {
                LODWORD(v29) = 0;
                goto LABEL_179;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v29) = 0;
        }
LABEL_179:
        uint64_t v102 = 152;
        goto LABEL_184;
      case 0x26u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 296;
LABEL_131:
        v88 = *(void **)(a1 + v23);
        *(void *)(a1 + v23) = v22;

        goto LABEL_132;
      case 0x27u:
        if (v17 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
          {
            char v89 = 0;
            unsigned int v90 = 0;
            uint64_t v91 = 0;
            while (1)
            {
              uint64_t v92 = *v3;
              uint64_t v93 = *(void *)(a2 + v92);
              unint64_t v94 = v93 + 1;
              if (v93 == -1 || v94 > *(void *)(a2 + *v4)) {
                break;
              }
              char v95 = *(unsigned char *)(*(void *)(a2 + *v7) + v93);
              *(void *)(a2 + v92) = v94;
              v91 |= (unint64_t)(v95 & 0x7F) << v89;
              if (v95 < 0)
              {
                v89 += 7;
                BOOL v15 = v90++ >= 9;
                if (!v15) {
                  continue;
                }
              }
              goto LABEL_146;
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_146:
            PBRepeatedInt32Add();
          }
LABEL_147:
          PBReaderRecallMark();
        }
        else
        {
          char v119 = 0;
          unsigned int v120 = 0;
          uint64_t v121 = 0;
          while (1)
          {
            uint64_t v122 = *v3;
            uint64_t v123 = *(void *)(a2 + v122);
            unint64_t v124 = v123 + 1;
            if (v123 == -1 || v124 > *(void *)(a2 + *v4)) {
              break;
            }
            char v125 = *(unsigned char *)(*(void *)(a2 + *v7) + v123);
            *(void *)(a2 + v122) = v124;
            v121 |= (unint64_t)(v125 & 0x7F) << v119;
            if (v125 < 0)
            {
              v119 += 7;
              BOOL v15 = v120++ >= 9;
              if (!v15) {
                continue;
              }
            }
            goto LABEL_207;
          }
LABEL_206:
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_207:
          PBRepeatedInt32Add();
        }
        goto LABEL_132;
      case 0x28u:
        char v96 = 0;
        unsigned int v97 = 0;
        uint64_t v29 = 0;
        *(_WORD *)(a1 + 348) |= 0x80u;
        while (2)
        {
          uint64_t v98 = *v3;
          uint64_t v99 = *(void *)(a2 + v98);
          unint64_t v100 = v99 + 1;
          if (v99 == -1 || v100 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v101 = *(unsigned char *)(*(void *)(a2 + *v7) + v99);
            *(void *)(a2 + v98) = v100;
            v29 |= (unint64_t)(v101 & 0x7F) << v96;
            if (v101 < 0)
            {
              v96 += 7;
              BOOL v15 = v97++ >= 9;
              if (v15)
              {
                LODWORD(v29) = 0;
                goto LABEL_183;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v29) = 0;
        }
LABEL_183:
        uint64_t v102 = 272;
LABEL_184:
        *(_DWORD *)(a1 + v102) = v29;
        goto LABEL_132;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_132;
    }
  }
}

uint64_t ADSponsoredSearchRequestReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  BOOL v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = 0x1E68A0000uLL;
    unint64_t v8 = 0x1EA644000uLL;
    unint64_t v9 = 0x1EA644000uLL;
    unint64_t v10 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *v3;
        unint64_t v15 = *(void *)(a2 + v14);
        if (v15 == -1 || v15 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + *v10) + v15);
        *(void *)(a2 + v14) = v15 + 1;
        v13 |= (unint64_t)(v16 & 0x7F) << v11;
        if ((v16 & 0x80) == 0) {
          goto LABEL_12;
        }
        v11 += 7;
        BOOL v17 = v12++ >= 9;
        if (v17)
        {
          unint64_t v13 = 0;
          int v18 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v18 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v13 = 0;
      }
LABEL_14:
      if (v18 || (v13 & 7) == 4) {
        break;
      }
      switch((v13 >> 3))
      {
        case 1u:
          unint64_t v20 = v8;
          unint64_t v21 = v9;
          unint64_t v22 = v7;
          id v23 = objc_alloc_init(*(Class *)(v7 + 1136));
          objc_storeStrong((id *)(a1 + 24), v23);
          if PBReaderPlaceMark() && (ADUserTargetingPropertiesReadFrom((uint64_t)v23, a2))
          {
            PBReaderRecallMark();

            unint64_t v7 = v22;
            unint64_t v9 = v21;
            unint64_t v8 = v20;
            continue;
          }

          return 0;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          *(unsigned char *)(a1 + *(int *)(v8 + 3676)) |= 0x20u;
          while (1)
          {
            uint64_t v28 = *v3;
            unint64_t v29 = *(void *)(a2 + v28);
            if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v30 = *(unsigned char *)(*(void *)(a2 + *v10) + v29);
            *(void *)(a2 + v28) = v29 + 1;
            v27 |= (unint64_t)(v30 & 0x7F) << v25;
            if ((v30 & 0x80) == 0) {
              goto LABEL_71;
            }
            v25 += 7;
            BOOL v17 = v26++ >= 9;
            if (v17)
            {
              uint64_t v27 = 0;
              goto LABEL_73;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_71:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v27 = 0;
          }
LABEL_73:
          BOOL v64 = v27 != 0;
          uint64_t v65 = *(int *)(v9 + 3680);
          goto LABEL_94;
        case 3u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          *(unsigned char *)(a1 + *(int *)(v8 + 3676)) |= 0x10u;
          while (2)
          {
            uint64_t v34 = *v3;
            unint64_t v35 = *(void *)(a2 + v34);
            if (v35 == -1 || v35 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)(a2 + *v10) + v35);
              *(void *)(a2 + v34) = v35 + 1;
              v33 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                BOOL v17 = v32++ >= 9;
                if (v17)
                {
                  uint64_t v33 = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v33 = 0;
          }
LABEL_77:
          BOOL v64 = v33 != 0;
          uint64_t v65 = 51;
          goto LABEL_94;
        case 4u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v39 = 0;
          *(unsigned char *)(a1 + *(int *)(v8 + 3676)) |= 4u;
          while (2)
          {
            uint64_t v40 = *v3;
            unint64_t v41 = *(void *)(a2 + v40);
            if (v41 == -1 || v41 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v42 = *(unsigned char *)(*(void *)(a2 + *v10) + v41);
              *(void *)(a2 + v40) = v41 + 1;
              v39 |= (unint64_t)(v42 & 0x7F) << v37;
              if (v42 < 0)
              {
                v37 += 7;
                BOOL v17 = v38++ >= 9;
                if (v17)
                {
                  uint64_t v39 = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v39 = 0;
          }
LABEL_81:
          BOOL v64 = v39 != 0;
          uint64_t v65 = 49;
          goto LABEL_94;
        case 5u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v45 = 0;
          *(unsigned char *)(a1 + *(int *)(v8 + 3676)) |= 1u;
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
              char v48 = *(unsigned char *)(*(void *)(a2 + *v10) + v47);
              *(void *)(a2 + v46) = v47 + 1;
              v45 |= (unint64_t)(v48 & 0x7F) << v43;
              if (v48 < 0)
              {
                v43 += 7;
                BOOL v17 = v44++ >= 9;
                if (v17)
                {
                  LODWORD(v45) = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v45) = 0;
          }
LABEL_85:
          *(_DWORD *)(a1 + 32) = v45;
          continue;
        case 6u:
          uint64_t v49 = PBReaderReadString();
          uint64_t v50 = 16;
          goto LABEL_55;
        case 7u:
          uint64_t v49 = PBReaderReadString();
          uint64_t v50 = 40;
          goto LABEL_55;
        case 8u:
          uint64_t v49 = PBReaderReadString();
          uint64_t v50 = 8;
LABEL_55:
          uint64_t v51 = *(void **)(a1 + v50);
          *(void *)(a1 + v50) = v49;

          continue;
        case 9u:
          char v52 = 0;
          unsigned int v53 = 0;
          uint64_t v54 = 0;
          *(unsigned char *)(a1 + *(int *)(v8 + 3676)) |= 8u;
          while (2)
          {
            uint64_t v55 = *v3;
            unint64_t v56 = *(void *)(a2 + v55);
            if (v56 == -1 || v56 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v57 = *(unsigned char *)(*(void *)(a2 + *v10) + v56);
              *(void *)(a2 + v55) = v56 + 1;
              v54 |= (unint64_t)(v57 & 0x7F) << v52;
              if (v57 < 0)
              {
                v52 += 7;
                BOOL v17 = v53++ >= 9;
                if (v17)
                {
                  uint64_t v54 = 0;
                  goto LABEL_89;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v54 = 0;
          }
LABEL_89:
          BOOL v64 = v54 != 0;
          uint64_t v65 = 50;
          goto LABEL_94;
        case 0xAu:
          char v58 = 0;
          unsigned int v59 = 0;
          uint64_t v60 = 0;
          *(unsigned char *)(a1 + *(int *)(v8 + 3676)) |= 2u;
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
        uint64_t v61 = *v3;
        unint64_t v62 = *(void *)(a2 + v61);
        if (v62 == -1 || v62 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v63 = *(unsigned char *)(*(void *)(a2 + *v10) + v62);
        *(void *)(a2 + v61) = v62 + 1;
        v60 |= (unint64_t)(v63 & 0x7F) << v58;
        if ((v63 & 0x80) == 0) {
          goto LABEL_91;
        }
        v58 += 7;
        BOOL v17 = v59++ >= 9;
        if (v17)
        {
          uint64_t v60 = 0;
          goto LABEL_93;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_91:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v60 = 0;
      }
LABEL_93:
      BOOL v64 = v60 != 0;
      uint64_t v65 = 48;
LABEL_94:
      *(unsigned char *)(a1 + v65) = v64;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ADAttributionResponseReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  BOOL v4 = (int *)MEMORY[0x1E4F940E0];
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
        BOOL v17 = objc_alloc_init(ADKeyedParameterList);
        [a1 addVersionedAttributionDetails:v17];
        if (!PBReaderPlaceMark() || !ADKeyedParameterListReadFrom(v17, a2))
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

uint64_t ADUserTransparencyRequestReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  BOOL v4 = (int *)MEMORY[0x1E4F940E0];
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
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 16;
          goto LABEL_26;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_26;
        case 3u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 24;
          goto LABEL_26;
        case 4u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 8;
          goto LABEL_26;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
LABEL_26:
          unint64_t v20 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 6u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 52) |= 2u;
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
                  uint64_t v23 = 0;
                  goto LABEL_44;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v23 = 0;
          }
LABEL_44:
          BOOL v33 = v23 != 0;
          uint64_t v34 = 49;
          goto LABEL_49;
        case 7u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          *(unsigned char *)(a1 + 52) |= 1u;
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
          goto LABEL_46;
        }
        v27 += 7;
        BOOL v14 = v28++ >= 9;
        if (v14)
        {
          uint64_t v29 = 0;
          goto LABEL_48;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_46:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v29 = 0;
      }
LABEL_48:
      BOOL v33 = v29 != 0;
      uint64_t v34 = 48;
LABEL_49:
      *(unsigned char *)(a1 + v34) = v33;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ADSegmentUpdateResponseReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  BOOL v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 4)
      {
        *(unsigned char *)(a1 + 32) |= 1u;
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v25);
          *(void *)(a2 + v24) = v25 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v23 = 0;
        }
        uint64_t v27 = 8;
      }
      else
      {
        if (v18 != 3)
        {
          if (v18 == 2)
          {
            uint64_t v19 = PBReaderReadString();
            unint64_t v20 = *(void **)(a1 + 24);
            *(void *)(a1 + 24) = v19;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        *(unsigned char *)(a1 + 32) |= 2u;
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
        uint64_t v27 = 16;
      }
      *(void *)(a1 + v27) = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void ADLogBarrier()
{
  uint64_t v0 = _ADLogQueue();
  dispatch_barrier_sync(v0, &__block_literal_global_21);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return MEMORY[0x1F41092D8]();
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

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
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

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
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

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EF8](allocator, nodename);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1F4101F20](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x1F4101F28](target, queue);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1F40F6E20](query, attributesToUpdate);
}

uint64_t SecKeyCreateRSAPublicKey()
{
  return MEMORY[0x1F40F6ED8]();
}

OSStatus SecKeyEncrypt(SecKeyRef key, SecPadding padding, const uint8_t *plainText, size_t plainTextLen, uint8_t *cipherText, size_t *cipherTextLen)
{
  return MEMORY[0x1F40F6F18](key, *(void *)&padding, plainText, plainTextLen, cipherText, cipherTextLen);
}

size_t SecKeyGetBlockSize(SecKeyRef key)
{
  return MEMORY[0x1F40F6F40](key);
}

uint64_t SimulateCrash()
{
  return MEMORY[0x1F4139E98]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181500](cls, outCount);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1F4181548](cls);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void exit(int a1)
{
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

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  return MEMORY[0x1F40CDCD8](a1, a2, *(void *)&a3);
}

size_t regerror(int a1, const regex_t *a2, char *a3, size_t a4)
{
  return MEMORY[0x1F40CDCE0](*(void *)&a1, a2, a3, a4);
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return MEMORY[0x1F40CDCE8](a1, a2, a3, __pmatch, *(void *)&a5);
}

void regfree(regex_t *a1)
{
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
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

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE9E8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CED00](object);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x1F40CEEB8](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}