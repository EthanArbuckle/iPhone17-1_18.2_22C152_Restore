@interface AFSUPFunctionProvider
+ (BOOL)_shouldAutomaticallyProvideFunctions;
- (AFSUPFunctionProvider)init;
- (AFSUPFunctionProvider)initWithLocale:(id)a3;
- (id)_callFunction:(id)a3 withArguments:(id)a4;
- (id)_contextDeviceName:(id)a3;
- (id)_contextRoomName:(id)a3;
- (id)_currentLongDate:(id)a3;
- (id)_currentShortDate:(id)a3;
- (id)_currentTime:(id)a3;
- (id)_currentWeekday:(id)a3;
- (id)_dateFormattedWithFormatter:(id)a3 arguments:(id)a4;
- (id)_deviceModel;
- (id)_lowercaseString:(id)a3;
- (id)_meCard;
- (id)_meCardIdentifier:(id)a3;
- (id)_peerInfoForContextIdentifier:(id)a3;
- (id)_siriUsageDescription:(id)a3;
- (id)_speechRecognitionUsageDescription:(id)a3;
- (id)_tempInWeatherUnits:(id)a3;
- (id)_userFirstName:(id)a3;
- (id)_userFullName:(id)a3;
- (id)_userLastName:(id)a3;
- (id)_userMiddleName:(id)a3;
- (id)_userNickName:(id)a3;
- (id)stringForExpression:(id)a3;
- (id)stringForExpression:(id)a3 containsPrivacySensitiveContents:(BOOL *)a4;
@end

@implementation AFSUPFunctionProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

- (id)stringForExpression:(id)a3 containsPrivacySensitiveContents:(BOOL *)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v6 = (__CFString *)a3;
  v7 = v6;
  if (a4) {
    *a4 = 0;
  }
  unint64_t v8 = [(__CFString *)v6 length];
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (v8)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v43 = 0u;
    CFStringRef theString = v7;
    uint64_t v53 = 0;
    int64_t v54 = v8;
    CharactersPtr = CFStringGetCharactersPtr(v7);
    CStringPtr = 0;
    v51 = (UniChar *)CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
    }
    v37 = v7;
    int64_t v14 = 0;
    char v15 = 0;
    int v16 = 0;
    int64_t v55 = 0;
    int64_t v56 = 0;
    unsigned int v17 = 1;
    v52 = CStringPtr;
    while (1)
    {
      int64_t v18 = v54;
      if (v54 <= v14)
      {
        uint64_t v22 = 0;
        UniChar v21 = 0;
        goto LABEL_17;
      }
      v19 = v51;
      if (v51)
      {
        uint64_t v20 = v53 + v14;
      }
      else
      {
        if (v52)
        {
          UniChar v21 = v52[v53 + v14];
          goto LABEL_14;
        }
        uint64_t v25 = v55;
        BOOL v26 = v56 > v14 && v55 <= v14;
        if (!v26)
        {
          if (v17 - 1 >= 4) {
            int64_t v27 = v14 - 4;
          }
          else {
            int64_t v27 = 0;
          }
          if (v27 + 64 < v54) {
            int64_t v18 = v27 + 64;
          }
          int64_t v55 = v27;
          int64_t v56 = v18;
          v60.location = v53 + v27;
          v60.length = v18 - v27;
          CFStringGetCharacters(theString, v60, buffer);
          uint64_t v25 = v55;
        }
        uint64_t v20 = v14 - v25;
        v19 = buffer;
      }
      UniChar v21 = v19[v20];
LABEL_14:
      uint64_t v22 = v21;
      if (v21 == 125)
      {
        --v16;
        uint64_t v22 = 125;
        goto LABEL_23;
      }
      if (v21 == 123)
      {
        ++v16;
        uint64_t v22 = 123;
LABEL_23:
        if (v15) {
          v24 = v11;
        }
        else {
          v24 = v9;
        }
        objc_msgSend(v24, "appendFormat:", @"%C", v22);
        goto LABEL_27;
      }
LABEL_17:
      if (v16) {
        goto LABEL_23;
      }
      if (v21 == 35)
      {
        char v15 = 1;
      }
      else
      {
        if (v21 != 58) {
          goto LABEL_23;
        }
        if ([v11 length])
        {
          [v10 addObject:v11];
          id v23 = objc_alloc_init(MEMORY[0x1E4F28E78]);

          int v16 = 0;
          id v11 = v23;
        }
        else
        {
          int v16 = 0;
        }
      }
LABEL_27:
      int64_t v14 = v17;
      BOOL v26 = v8 > v17++;
      if (!v26)
      {
        if ([v11 length]) {
          [v10 addObject:v11];
        }
        v7 = v37;
        break;
      }
    }
  }
  v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v29 = v10;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v38 objects:v57 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v39 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = [(AFSpeakableUtteranceParser *)self parseStringWithFormat:*(void *)(*((void *)&v38 + 1) + 8 * i) error:0];
        if (v34) {
          [v28 addObject:v34];
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v38 objects:v57 count:16];
    }
    while (v31);
  }

  v35 = [(AFSUPFunctionProvider *)self _callFunction:v9 withArguments:v28];

  return v35;
}

- (id)stringForExpression:(id)a3
{
  return [(AFSUPFunctionProvider *)self stringForExpression:a3 containsPrivacySensitiveContents:0];
}

- (id)_callFunction:(id)a3 withArguments:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 isEqualToString:@"currentTime"] & 1) != 0
    || [v6 isEqualToString:@"currentTimeIn"])
  {
    uint64_t v8 = [(AFSUPFunctionProvider *)self _currentTime:v7];
LABEL_4:
    id v9 = (void *)v8;
    goto LABEL_5;
  }
  if (([v6 isEqualToString:@"currentDateShort"] & 1) != 0
    || [v6 isEqualToString:@"currentDateShortIn"])
  {
    uint64_t v8 = [(AFSUPFunctionProvider *)self _currentShortDate:v7];
    goto LABEL_4;
  }
  if (([v6 isEqualToString:@"currentDateLong"] & 1) != 0
    || [v6 isEqualToString:@"currentDateLongIn"])
  {
    uint64_t v8 = [(AFSUPFunctionProvider *)self _currentLongDate:v7];
    goto LABEL_4;
  }
  if (([v6 isEqualToString:@"currentDayOfWeek"] & 1) != 0
    || [v6 isEqualToString:@"currentDayOfWeekIn"])
  {
    uint64_t v8 = [(AFSUPFunctionProvider *)self _currentWeekday:v7];
    goto LABEL_4;
  }
  if ([v6 isEqualToString:@"tempInWeatherUnits"])
  {
    uint64_t v8 = [(AFSUPFunctionProvider *)self _tempInWeatherUnits:v7];
    goto LABEL_4;
  }
  if ([v6 isEqualToString:@"deviceModel"])
  {
    uint64_t v8 = [(AFSUPFunctionProvider *)self _deviceModel];
    goto LABEL_4;
  }
  if ([v6 isEqualToString:@"lowercase"])
  {
    uint64_t v8 = [(AFSUPFunctionProvider *)self _lowercaseString:v7];
    goto LABEL_4;
  }
  if ([v6 isEqualToString:@"siriUsageDescription"])
  {
    uint64_t v8 = [(AFSUPFunctionProvider *)self _siriUsageDescription:v7];
    goto LABEL_4;
  }
  if ([v6 isEqualToString:@"speechRecognitionUsageDescription"])
  {
    uint64_t v8 = [(AFSUPFunctionProvider *)self _speechRecognitionUsageDescription:v7];
    goto LABEL_4;
  }
  if ([v6 isEqualToString:@"contextRoomName"])
  {
    uint64_t v8 = [(AFSUPFunctionProvider *)self _contextRoomName:v7];
    goto LABEL_4;
  }
  if ([v6 isEqualToString:@"contextDeviceName"])
  {
    uint64_t v8 = [(AFSUPFunctionProvider *)self _contextDeviceName:v7];
    goto LABEL_4;
  }
  if ([v6 isEqualToString:@"fullName"])
  {
    uint64_t v8 = [(AFSUPFunctionProvider *)self _userFullName:v7];
    goto LABEL_4;
  }
  if ([v6 isEqualToString:@"firstName"])
  {
    uint64_t v8 = [(AFSUPFunctionProvider *)self _userFirstName:v7];
    goto LABEL_4;
  }
  if ([v6 isEqualToString:@"middleName"])
  {
    uint64_t v8 = [(AFSUPFunctionProvider *)self _userMiddleName:v7];
    goto LABEL_4;
  }
  if ([v6 isEqualToString:@"lastName"])
  {
    uint64_t v8 = [(AFSUPFunctionProvider *)self _userLastName:v7];
    goto LABEL_4;
  }
  if ([v6 isEqualToString:@"nickName"])
  {
    uint64_t v8 = [(AFSUPFunctionProvider *)self _userNickName:v7];
    goto LABEL_4;
  }
  if ([v6 isEqualToString:@"internalGUID"])
  {
    uint64_t v8 = [(AFSUPFunctionProvider *)self _meCardIdentifier:v7];
    goto LABEL_4;
  }
  id v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315394;
    v13 = "-[AFSUPFunctionProvider _callFunction:withArguments:]";
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_error_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_ERROR, "%s Unhandled functor %@", (uint8_t *)&v12, 0x16u);
  }
  id v9 = 0;
LABEL_5:

  return v9;
}

- (id)_peerInfoForContextIdentifier:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v3];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__13301;
  BOOL v26 = __Block_byref_object_dispose__13302;
  int64_t v27 = objc_alloc_init(AFSettingsConnection);
  uint64_t v16 = 0;
  unsigned int v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__13301;
  uint64_t v20 = __Block_byref_object_dispose__13302;
  id v21 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = (void *)v23[5];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__AFSUPFunctionProvider__peerInfoForContextIdentifier___block_invoke;
  v12[3] = &unk_1E5926F48;
  __int16 v14 = &v16;
  id v7 = v5;
  v13 = v7;
  id v15 = &v22;
  [v6 getOriginDeviceInfoForContextIdentifier:v4 completion:v12];
  dispatch_time_t v8 = dispatch_time(0, 250000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    id v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v29 = "-[AFSUPFunctionProvider _peerInfoForContextIdentifier:]";
      __int16 v30 = 2048;
      uint64_t v31 = 0x406F400000000000;
      _os_log_error_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_ERROR, "%s Timed out fetching peerInfo after waiting %0.1g milliseconds", buf, 0x16u);
    }
  }
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __55__AFSUPFunctionProvider__peerInfoForContextIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

- (id)_contextDeviceName:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    dispatch_semaphore_t v5 = [v4 firstObject];
    id v6 = [(AFSUPFunctionProvider *)self _peerInfoForContextIdentifier:v5];

    id v7 = [v6 name];
    dispatch_time_t v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315394;
      int v12 = "-[AFSUPFunctionProvider _contextDeviceName:]";
      __int16 v13 = 2112;
      __int16 v14 = v7;
      _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s Computed value: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    id v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      int v12 = "-[AFSUPFunctionProvider _contextDeviceName:]";
      _os_log_error_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_ERROR, "%s Missing argument for contextDeviceName", (uint8_t *)&v11, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)_contextRoomName:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    dispatch_semaphore_t v5 = [v4 firstObject];
    id v6 = [(AFSUPFunctionProvider *)self _peerInfoForContextIdentifier:v5];

    id v7 = [v6 roomName];
    dispatch_time_t v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315394;
      int v12 = "-[AFSUPFunctionProvider _contextRoomName:]";
      __int16 v13 = 2112;
      __int16 v14 = v7;
      _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s Computed value: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    id v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      int v12 = "-[AFSUPFunctionProvider _contextRoomName:]";
      _os_log_error_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_ERROR, "%s Missing argument for contextRoomName", (uint8_t *)&v11, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)_speechRecognitionUsageDescription:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 firstObject];
    dispatch_semaphore_t v5 = _AFLocalizedValueForInfoPlistKey(v4, @"NSSpeechRecognitionUsageDescription");
  }
  else
  {
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      id v9 = "-[AFSUPFunctionProvider _speechRecognitionUsageDescription:]";
      _os_log_error_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_ERROR, "%s No argument for speechRecognitionUsageDescription", (uint8_t *)&v8, 0xCu);
    }
    dispatch_semaphore_t v5 = 0;
  }

  return v5;
}

- (id)_siriUsageDescription:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 firstObject];
    dispatch_semaphore_t v5 = _AFLocalizedValueForInfoPlistKey(v4, @"NSSiriUsageDescription");
  }
  else
  {
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      id v9 = "-[AFSUPFunctionProvider _siriUsageDescription:]";
      _os_log_error_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_ERROR, "%s ERROR: No argument for siriUsageDescription", (uint8_t *)&v8, 0xCu);
    }
    dispatch_semaphore_t v5 = 0;
  }

  return v5;
}

- (id)_meCardIdentifier:(id)a3
{
  id v3 = [(AFSUPFunctionProvider *)self _meCard];
  id v4 = [v3 internalGUID];

  return v4;
}

- (id)_userNickName:(id)a3
{
  id v3 = [(AFSUPFunctionProvider *)self _meCard];
  id v4 = [v3 nickName];

  return v4;
}

- (id)_userLastName:(id)a3
{
  id v3 = [(AFSUPFunctionProvider *)self _meCard];
  id v4 = [v3 lastName];

  return v4;
}

- (id)_userMiddleName:(id)a3
{
  id v3 = [(AFSUPFunctionProvider *)self _meCard];
  id v4 = [v3 middleName];

  return v4;
}

- (id)_userFirstName:(id)a3
{
  id v3 = [(AFSUPFunctionProvider *)self _meCard];
  id v4 = [v3 firstName];

  return v4;
}

- (id)_userFullName:(id)a3
{
  id v3 = [(AFSUPFunctionProvider *)self _meCard];
  id v4 = [v3 fullName];

  return v4;
}

- (id)_meCard
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__13301;
  uint64_t v25 = __Block_byref_object_dispose__13302;
  BOOL v26 = objc_alloc_init(AFSettingsConnection);
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__13301;
  v19 = __Block_byref_object_dispose__13302;
  id v20 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = (void *)v22[5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __32__AFSUPFunctionProvider__meCard__block_invoke;
  v11[3] = &unk_1E5926F20;
  __int16 v13 = &v15;
  id v4 = v2;
  int v12 = v4;
  __int16 v14 = &v21;
  [v3 getMeCard:v11];
  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  intptr_t v6 = dispatch_semaphore_wait(v4, v5);
  id v7 = AFSiriLogContextConnection;
  if (v6 && os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[AFSUPFunctionProvider _meCard]";
    __int16 v29 = 2048;
    uint64_t v30 = 0x4000000000000000;
    _os_log_error_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_ERROR, "%s Timed out fetching meCard  after waiting %0.1g seconds", buf, 0x16u);
    id v7 = AFSiriLogContextConnection;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (v16[5]) {
      int v8 = @"a meCard";
    }
    else {
      int v8 = @"(null)";
    }
    *(_DWORD *)buf = 136315394;
    v28 = "-[AFSUPFunctionProvider _meCard]";
    __int16 v29 = 2112;
    uint64_t v30 = (uint64_t)v8;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s Got %@", buf, 0x16u);
  }
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __32__AFSUPFunctionProvider__meCard__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      __int16 v14 = "-[AFSUPFunctionProvider _meCard]_block_invoke";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_error_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_ERROR, "%s Error fetching meCard %@", (uint8_t *)&v13, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  int v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;
}

- (id)_deviceModel
{
  dispatch_semaphore_t v2 = (void *)MGCopyAnswer();
  return v2;
}

- (id)_lowercaseString:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 objectAtIndex:0];
    id v5 = +[AFPreferences sharedPreferences];
    uint64_t v6 = [v5 languageCode];
    id v7 = (void *)v6;
    uint64_t v8 = @"en-US";
    if (v6) {
      uint64_t v8 = (__CFString *)v6;
    }
    id v9 = v8;

    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:v9];
    uint64_t v11 = [v4 lowercaseStringWithLocale:v10];
  }
  else
  {
    int v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      __int16 v15 = "-[AFSUPFunctionProvider _lowercaseString:]";
      _os_log_error_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_ERROR, "%s No argument for initLowercase", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)_tempInWeatherUnits:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  CFPreferencesAppSynchronize(@"com.apple.weather");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"Celsius", @"com.apple.weather", 0);
  if ([v3 count])
  {
    id v5 = [v3 objectAtIndex:0];
    uint64_t v6 = v5;
    id v7 = v5;
    if (!AppBooleanValue)
    {
      [v5 floatValue];
      id v9 = &off_19D0E2000;
      float v10 = v8 * 1.8;
      LODWORD(v9) = llroundf(v10 + 32.0);
      id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v9);
    }
  }
  else
  {
    uint64_t v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int v14 = "-[AFSUPFunctionProvider _tempInWeatherUnits:]";
      _os_log_error_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_ERROR, "%s No argument for weather units.", buf, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)_currentWeekday:(id)a3
{
  dateFormatter = self->_dateFormatter;
  id v5 = a3;
  [(NSDateFormatter *)dateFormatter setDateFormat:@"eeee"];
  uint64_t v6 = [(AFSUPFunctionProvider *)self _dateFormattedWithFormatter:self->_dateFormatter arguments:v5];

  return v6;
}

- (id)_currentShortDate:(id)a3
{
  dateFormatter = self->_dateFormatter;
  id v5 = a3;
  [(NSDateFormatter *)dateFormatter setDateStyle:1];
  [(NSDateFormatter *)self->_dateFormatter setTimeStyle:0];
  uint64_t v6 = [(AFSUPFunctionProvider *)self _dateFormattedWithFormatter:self->_dateFormatter arguments:v5];

  return v6;
}

- (id)_currentLongDate:(id)a3
{
  dateFormatter = self->_dateFormatter;
  id v5 = a3;
  [(NSDateFormatter *)dateFormatter setDateStyle:3];
  [(NSDateFormatter *)self->_dateFormatter setTimeStyle:0];
  uint64_t v6 = [(AFSUPFunctionProvider *)self _dateFormattedWithFormatter:self->_dateFormatter arguments:v5];

  return v6;
}

- (id)_currentTime:(id)a3
{
  timeFormatter = self->_timeFormatter;
  id v5 = a3;
  [(NSDateFormatter *)timeFormatter setDateStyle:0];
  [(NSDateFormatter *)self->_timeFormatter setTimeStyle:1];
  uint64_t v6 = (void *)MEMORY[0x1E4F28C10];
  id v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  float v8 = [v6 dateFormatFromTemplate:@"jjmma" options:0 locale:v7];

  id v9 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"Hk"];
  uint64_t v10 = [v8 rangeOfCharacterFromSet:v9];

  uint64_t v11 = (void *)MEMORY[0x1E4F28C10];
  int v12 = [(NSDateFormatter *)self->_timeFormatter locale];
  int v13 = [v11 dateFormatFromTemplate:@"hhmma" options:0 locale:v12];

  int v14 = (void *)MEMORY[0x1E4F28C10];
  uint64_t v15 = [(NSDateFormatter *)self->_timeFormatter locale];
  uint64_t v16 = [v14 dateFormatFromTemplate:@"HHmm" options:0 locale:v15];

  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v17 = v13;
  }
  else {
    uint64_t v17 = v16;
  }
  [(NSDateFormatter *)self->_timeFormatter setDateFormat:v17];
  uint64_t v18 = [(AFSUPFunctionProvider *)self _dateFormattedWithFormatter:self->_timeFormatter arguments:v5];

  return v18;
}

- (id)_dateFormattedWithFormatter:(id)a3 arguments:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 count];
  if (v7)
  {
    unint64_t v8 = v7;
    id v9 = [v6 objectAtIndex:0];
    uint64_t v10 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v9];
    if (!v10)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:v9];
    }
    [v5 setTimeZone:v10];

    if (v8 >= 2)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F1C9A8];
      int v12 = [v6 objectAtIndex:1];
      int v13 = [v11 calendarWithIdentifier:v12];
      goto LABEL_8;
    }
  }
  else
  {
    int v14 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    [v5 setTimeZone:v14];
  }
  int v13 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int v12 = [v5 locale];
  [v13 setLocale:v12];
LABEL_8:

  [v5 setCalendar:v13];
  uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v16 = [v5 stringFromDate:v15];

  return v16;
}

- (AFSUPFunctionProvider)initWithLocale:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AFSUPFunctionProvider;
  id v5 = [(AFSpeakableUtteranceParser *)&v11 initWithLocale:v4];
  if (v5)
  {
    id v6 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = v5->_dateFormatter;
    v5->_dateFormatter = v6;

    [(NSDateFormatter *)v5->_dateFormatter setLocale:v4];
    unint64_t v8 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    timeFormatter = v5->_timeFormatter;
    v5->_timeFormatter = v8;

    [(NSDateFormatter *)v5->_timeFormatter setLocale:v4];
  }

  return v5;
}

- (AFSUPFunctionProvider)init
{
  id v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v4 = [(AFSUPFunctionProvider *)self initWithLocale:v3];

  return v4;
}

+ (BOOL)_shouldAutomaticallyProvideFunctions
{
  return 0;
}

@end