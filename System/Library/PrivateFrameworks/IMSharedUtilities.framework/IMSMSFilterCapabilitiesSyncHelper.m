@interface IMSMSFilterCapabilitiesSyncHelper
+ (BOOL)isSMSFilteringEnabledInSMSFilterCapabilitiesOptions;
+ (BOOL)isSubActionActiveInSMSFilterCapabilitiesOptions:(unint64_t)a3 subAction:(int64_t)a4 action:(int64_t)a5;
+ (BOOL)isValidSMSFilterCapabilitiesOptions:(unint64_t)a3;
+ (BOOL)isValidSubActionForDeviceID:(id)a3 action:(int64_t)a4 subAction:(int64_t)a5;
+ (BOOL)shouldUpdateSMSFilterSyncDeviceParamsForDeviceID:(id)a3 smsFilterCapabilitiesOptions:(unint64_t)a4 filterExtensionName:(id)a5;
+ (id)fetchFilterExtensionNameForDeviceID:(id)a3;
+ (id)fetchSMSFilterSyncDeviceParams;
+ (unint64_t)IMSMSFilterCapabilitiesOptionForFilterSubAction:(int64_t)a3 action:(int64_t)a4;
+ (unint64_t)fetchSMSFilterCapabilitiesOptions;
+ (unint64_t)fetchSMSFilterCapabilitiesOptionsForDeviceID:(id)a3;
+ (void)storeSMSFilterCapabilitiesOptions:(unint64_t)a3;
+ (void)storeSMSFilterSyncDeviceParams:(id)a3;
+ (void)updateFilterExtensionName;
+ (void)updateSMSFilterCapabilitiesOptions;
+ (void)updateSMSFilterCapabilitiesOptionsCache;
+ (void)updateSMSFilterCapabilitiesOptionsForDeviceID:(id)a3 smsFilterCapabilitiesOptions:(unint64_t)a4 filterExtensionName:(id)a5;
+ (void)updateSMSFilterCapabilitiesOptionsForSelf;
+ (void)updateSMSFilterSyncDeviceParamsCache;
+ (void)verifyCurrentRelayDevicesActive:(id)a3;
@end

@implementation IMSMSFilterCapabilitiesSyncHelper

+ (id)fetchSMSFilterSyncDeviceParams
{
  v3 = +[IMFeatureFlags sharedFeatureFlags];
  int v4 = [v3 isSMSFilterSyncEnabled];

  if (!v4)
  {
LABEL_5:
    id v5 = (id)qword_1E94FF4A8;
    goto LABEL_9;
  }
  if (+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering])
  {
    if (!qword_1E94FF4A8) {
      [a1 updateSMSFilterSyncDeviceParamsCache];
    }
    goto LABEL_5;
  }
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  id v5 = 0;
LABEL_9:

  return v5;
}

+ (BOOL)shouldUpdateSMSFilterSyncDeviceParamsForDeviceID:(id)a3 smsFilterCapabilitiesOptions:(unint64_t)a4 filterExtensionName:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = +[IMFeatureFlags sharedFeatureFlags];
  int v11 = [v10 isSMSFilterSyncEnabled];

  if (v11)
  {
    if (+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering])
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v12 = [a1 fetchSMSFilterSyncDeviceParams];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            v18 = [v17 deviceUniqueID];
            if ([v18 isEqualToString:v8]
              && [v17 smsFilterCapabilitiesOptions] == a4)
            {
              v19 = [v17 filterExtensionName];
              int v20 = [v19 isEqualToString:v9];

              if (v20)
              {
                if (_IMWillLog()) {
                  _IMAlwaysLog();
                }
                BOOL v21 = 0;
                goto LABEL_23;
              }
            }
            else
            {
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
      BOOL v21 = 1;
LABEL_23:
    }
    else
    {
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
      BOOL v21 = 0;
    }
  }
  else
  {
    BOOL v21 = 1;
  }

  return v21;
}

+ (void)updateSMSFilterCapabilitiesOptionsForDeviceID:(id)a3 smsFilterCapabilitiesOptions:(unint64_t)a4 filterExtensionName:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v8 = a5;
  id v9 = +[IMFeatureFlags sharedFeatureFlags];
  int v10 = [v9 isSMSFilterSyncEnabled];

  if (v10)
  {
    BOOL v11 = +[IMSMSFilterHelper supportsIncomingSMSRelayFiltering];
    int v12 = _IMWillLog();
    if (v11)
    {
      if (v12)
      {
        unint64_t v33 = a4;
        id v34 = v8;
        id v32 = v39;
        _IMAlwaysLog();
      }
      id v35 = a1;
      uint64_t v13 = objc_msgSend(a1, "fetchSMSFilterSyncDeviceParams", v32, v33, v34);
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v15 = objc_alloc_init(SMSFilterSyncDeviceParams);
      v16 = v15;
      if (a4)
      {
        [(SMSFilterSyncDeviceParams *)v15 setDeviceUniqueID:v39];
        unint64_t v17 = a4;
        [(SMSFilterSyncDeviceParams *)v16 setSmsFilterCapabilitiesOptions:a4];
        [(SMSFilterSyncDeviceParams *)v16 setFilterExtensionName:v8];
        [v14 addObject:v16];
        uint64_t v18 = 1;
      }
      else
      {
        unint64_t v17 = 0;
        uint64_t v18 = 2;
      }
      v36 = v16;
      id v37 = v8;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id obj = v13;
      uint64_t v19 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        char v21 = 0;
        uint64_t v22 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v41 != v22) {
              objc_enumerationMutation(obj);
            }
            long long v24 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            long long v25 = [v24 deviceUniqueID];
            char v26 = [v25 isEqualToString:v39];

            if (v26)
            {
              if (v17) {
                uint64_t v18 = 3;
              }
              v21 |= v17 == 0;
            }
            else
            {
              [v14 addObject:v24];
            }
          }
          uint64_t v20 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
        }
        while (v20);
      }
      else
      {
        char v21 = 0;
      }

      if (v17 || (v21 & 1) != 0)
      {
        long long v27 = v14;
        [v35 storeSMSFilterSyncDeviceParams:v14];
        CFPreferencesSetAppValue(@"sForceDisableSMSFilteringIpadCompleted", (CFPropertyListRef)*MEMORY[0x1E4F1CFD0], @"com.apple.MobileSMS");
        v44[0] = @"IMMetricsCollectorEventSMSFilterSyncDeviceCount";
        v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
        v45[0] = v28;
        v44[1] = @"IMMetricsCollectorEventSMSFilterSyncStateChangedTypeKey";
        uint64_t v29 = [NSNumber numberWithUnsignedInteger:v18];
        v45[1] = v29;
        v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];

        v31 = +[IMMetricsCollector sharedInstance];
        [v31 trackEvent:@"com.apple.Messages.IMMetricsCollectorEventSMSFilterSyncStateChanged" withDictionary:v30];
      }
      else
      {
      }
      id v8 = v37;
    }
    else if (v12)
    {
      _IMAlwaysLog();
    }
  }
}

+ (void)updateFilterExtensionName
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = +[IMFeatureFlags sharedFeatureFlags];
  int v4 = [v3 isSMSFilterSyncEnabled];

  if (v4)
  {
    if (+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering])
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v6 = [a1 fetchSMSFilterSyncDeviceParams];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v6);
            }
            BOOL v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            int v12 = [v11 filterExtensionName];
            uint64_t v13 = [v12 length];

            if (v13)
            {
              id v14 = [v11 filterExtensionName];
              [v5 addObject:v14];
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v8);
      }

      uint64_t v15 = (void *)[v5 count];
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
      if (v15)
      {
        if (v15 == (void *)1)
        {
          uint64_t v15 = [v5 anyObject];
        }
        else
        {
          v16 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v15);
          uint64_t v15 = [v16 stringByAppendingString:@" filters"];
        }
      }
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
      CFPreferencesSetAppValue(@"spamFiltrationExtensionName", v15, @"com.apple.MobileSMS");
    }
    else if (_IMWillLog())
    {
      _IMAlwaysLog();
    }
  }
}

+ (void)storeSMSFilterSyncDeviceParams:(id)a3
{
  id v4 = a3;
  id v5 = +[IMFeatureFlags sharedFeatureFlags];
  int v6 = [v5 isSMSFilterSyncEnabled];

  if (!v6) {
    goto LABEL_18;
  }
  if (+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering])
  {
    uint64_t v7 = [a1 fetchSMSFilterSyncDeviceParams];
    int v8 = [v4 isEqualToArray:v7];

    if (v8)
    {
      if (_IMWillLog()) {
        goto LABEL_7;
      }
      goto LABEL_18;
    }
    qword_1EB4A5648 = -1;
    uint64_t v9 = (void *)qword_1E94FF4A8;
    qword_1E94FF4A8 = 0;

    if ([v4 count])
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      BOOL v11 = (void *)[v4 copy];
      id v16 = 0;
      int v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v16];
      id v13 = v16;
      if (v13)
      {
        id v14 = v13;
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }

LABEL_17:
        goto LABEL_18;
      }
      [v10 setValue:v12 forKey:@"smsFilterSyncDeviceParams"];
    }
    else
    {
      id v10 = 0;
    }
    CFPreferencesSetAppValue(@"smsFilterSyncDeviceParams", v10, @"com.apple.MobileSMS");
    CFStringRef v15 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    CFPreferencesSynchronize(@"com.apple.MobileSMS", v15, (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    [a1 updateFilterExtensionName];
    [a1 updateSMSFilterCapabilitiesOptions];
    if ([a1 isSMSFilteringEnabledInSMSFilterCapabilitiesOptions]) {
      +[IMSMSFilterCapabilitiesBinder handleSMSFilterCapabilitiesOptionsChange];
    }
    goto LABEL_17;
  }
  if (_IMWillLog()) {
LABEL_7:
  }
    _IMAlwaysLog();
LABEL_18:
}

+ (void)updateSMSFilterSyncDeviceParamsCache
{
  v2 = +[IMFeatureFlags sharedFeatureFlags];
  int v3 = [v2 isSMSFilterSyncEnabled];

  if (v3)
  {
    if (+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering])
    {
      id v4 = IMGetCachedDomainValueForKey();
      id v5 = v4;
      if (!v4 || ![v4 count]) {
        goto LABEL_18;
      }
      int v6 = [v5 objectForKey:@"smsFilterSyncDeviceParams"];
      id v16 = 0;
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v6 error:&v16];
      id v8 = v16;
      uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v10 = objc_opt_class();
      BOOL v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
      [v7 _enableStrictSecureDecodingMode];
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
      uint64_t v12 = [v7 decodeObjectOfClasses:v11 forKey:*MEMORY[0x1E4F284E8]];
      id v13 = (void *)qword_1E94FF4A8;
      qword_1E94FF4A8 = v12;

      uint64_t v14 = qword_1E94FF4A8;
      int v15 = _IMWillLog();
      if (!v14 || v8)
      {
        if (v15) {
LABEL_16:
        }
          _IMAlwaysLog();
      }
      else if (v15)
      {
        goto LABEL_16;
      }

LABEL_18:
      return;
    }
    if (_IMWillLog())
    {
      _IMAlwaysLog();
    }
  }
}

+ (id)fetchFilterExtensionNameForDeviceID:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[IMFeatureFlags sharedFeatureFlags];
  int v6 = [v5 isSMSFilterSyncEnabled];

  if (v6)
  {
    if (+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering])
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v7 = [a1 fetchSMSFilterSyncDeviceParams];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            id v13 = [v12 deviceUniqueID];
            int v14 = [v13 isEqualToString:v4];

            if (v14)
            {
              if (_IMWillLog())
              {
                long long v17 = [v12 filterExtensionName];
                id v18 = v4;
                _IMAlwaysLog();
              }
              int v15 = objc_msgSend(v12, "filterExtensionName", v17, v18);

              goto LABEL_15;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
    else if (_IMWillLog())
    {
      _IMAlwaysLog();
    }
  }
  int v15 = 0;
LABEL_15:

  return v15;
}

+ (unint64_t)fetchSMSFilterCapabilitiesOptionsForDeviceID:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[IMFeatureFlags sharedFeatureFlags];
  int v6 = [v5 isSMSFilterSyncEnabled];

  if (v6)
  {
    if (+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering])
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v7 = [a1 fetchSMSFilterSyncDeviceParams];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            id v13 = [v12 deviceUniqueID];
            int v14 = [v13 isEqualToString:v4];

            if (v14)
            {
              if (_IMWillLog())
              {
                uint64_t v17 = [v12 smsFilterCapabilitiesOptions];
                id v18 = v4;
                _IMAlwaysLog();
              }
              unint64_t v15 = objc_msgSend(v12, "smsFilterCapabilitiesOptions", v17, v18);

              goto LABEL_15;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
    else if (_IMWillLog())
    {
      _IMAlwaysLog();
    }
  }
  unint64_t v15 = 0;
LABEL_15:

  return v15;
}

+ (BOOL)isValidSubActionForDeviceID:(id)a3 action:(int64_t)a4 subAction:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = +[IMFeatureFlags sharedFeatureFlags];
  int v10 = [v9 isSMSFilterSyncEnabled];

  if (v10)
  {
    uint64_t v11 = [a1 fetchSMSFilterCapabilitiesOptionsForDeviceID:v8];
    BOOL v12 = ([a1 IMSMSFilterCapabilitiesOptionForFilterSubAction:a5 action:a4] & v11) != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (void)verifyCurrentRelayDevicesActive:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[IMFeatureFlags sharedFeatureFlags];
  int v6 = [v5 isSMSFilterSyncEnabled];

  if (v6)
  {
    if (+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering])
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = objc_msgSend(a1, "fetchSMSFilterSyncDeviceParams", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            int v14 = [v13 deviceUniqueID];
            int v15 = [v4 containsObject:v14];

            if (v15) {
              [v7 addObject:v13];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);
      }

      [a1 storeSMSFilterSyncDeviceParams:v7];
    }
    else if (_IMWillLog())
    {
      _IMAlwaysLog();
    }
  }
}

+ (BOOL)isValidSMSFilterCapabilitiesOptions:(unint64_t)a3
{
  char v3 = a3;
  id v4 = +[IMFeatureFlags sharedFeatureFlags];
  char v5 = [v4 isSMSFilterSyncEnabled];

  return v3 & v5;
}

+ (BOOL)isSMSFilteringEnabledInSMSFilterCapabilitiesOptions
{
  char v3 = +[IMFeatureFlags sharedFeatureFlags];
  int v4 = [v3 isSMSFilterSyncEnabled];

  if (!v4) {
    goto LABEL_6;
  }
  if (!+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering])
  {
    LODWORD(v5) = _IMWillLog();
    if (!v5) {
      return v5;
    }
    _IMAlwaysLog();
LABEL_6:
    LOBYTE(v5) = 0;
    return v5;
  }
  return ((unint64_t)[a1 fetchSMSFilterCapabilitiesOptions] >> 1) & 1;
}

+ (unint64_t)fetchSMSFilterCapabilitiesOptions
{
  char v3 = +[IMFeatureFlags sharedFeatureFlags];
  int v4 = [v3 isSMSFilterSyncEnabled];

  if (v4) {
    BOOL v5 = qword_1EB4A5648 == -1;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5) {
    [a1 updateSMSFilterCapabilitiesOptionsCache];
  }
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  return qword_1EB4A5648;
}

+ (void)updateSMSFilterCapabilitiesOptionsForSelf
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v3 = +[IMFeatureFlags sharedFeatureFlags];
  int v4 = [v3 isSMSFilterSyncEnabled];

  if (v4 && !IMSharedHelperDeviceIsiPad())
  {
    BOOL v5 = +[IMSMSFilterHelper fetchSMSFilterExtensionParams];
    if ([v5 count])
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v15;
        uint64_t v10 = 3;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            BOOL v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            if ([v12 subAction]) {
              v10 |= objc_msgSend(a1, "IMSMSFilterCapabilitiesOptionForFilterSubAction:action:", objc_msgSend(v12, "subAction"), objc_msgSend(v12, "action"));
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v8);
      }
      else
      {
        uint64_t v10 = 3;
      }
    }
    else
    {
      uint64_t v10 = 1;
    }
    if (_IMWillLog())
    {
      uint64_t v13 = v10;
      _IMAlwaysLog();
    }
    objc_msgSend(a1, "storeSMSFilterCapabilitiesOptions:", v10, v13);
  }
}

+ (void)updateSMSFilterCapabilitiesOptions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v3 = +[IMFeatureFlags sharedFeatureFlags];
  int v4 = [v3 isSMSFilterSyncEnabled];

  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v5 = [a1 fetchSMSFilterSyncDeviceParams];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      uint64_t v9 = 1;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v9 |= [*(id *)(*((void *)&v12 + 1) + 8 * i) smsFilterCapabilitiesOptions];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
    else
    {
      uint64_t v9 = 1;
    }

    if (_IMWillLog())
    {
      uint64_t v11 = v9;
      _IMAlwaysLog();
    }
    objc_msgSend(a1, "storeSMSFilterCapabilitiesOptions:", v9, v11);
  }
}

+ (void)storeSMSFilterCapabilitiesOptions:(unint64_t)a3
{
  int v4 = +[IMFeatureFlags sharedFeatureFlags];
  int v5 = [v4 isSMSFilterSyncEnabled];

  if (v5)
  {
    qword_1EB4A5648 = -1;
    CFPreferencesSetAppValue(@"spamFilterExtensionCapabilitiesOptions", (CFPropertyListRef)[NSNumber numberWithUnsignedInteger:a3], @"com.apple.MobileSMS");
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    CFPreferencesSynchronize(@"com.apple.MobileSMS", v6, v7);
  }
}

+ (void)updateSMSFilterCapabilitiesOptionsCache
{
  char v3 = +[IMFeatureFlags sharedFeatureFlags];
  int v4 = [v3 isSMSFilterSyncEnabled];

  if (v4)
  {
    int v5 = IMGetCachedDomainValueForKey();
    if (v5
      || ([a1 updateSMSFilterCapabilitiesOptionsForSelf],
          IMGetCachedDomainValueForKey(),
          (int v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v6 = [v5 unsignedIntegerValue];
    }
    else
    {
      uint64_t v6 = 0;
    }
    qword_1EB4A5648 = v6;
  }
}

+ (unint64_t)IMSMSFilterCapabilitiesOptionForFilterSubAction:(int64_t)a3 action:(int64_t)a4
{
  char v5 = a3;
  uint64_t v6 = +[IMFeatureFlags sharedFeatureFlags];
  int v7 = [v6 isSMSFilterSyncEnabled];

  if (!v7) {
    return 0;
  }
  unint64_t v8 = 1 << (v5 + 1);
  if (a4 != 4) {
    unint64_t v8 = 0;
  }
  if (a4 == 3) {
    return 1 << (v5 + 7);
  }
  else {
    return v8;
  }
}

+ (BOOL)isSubActionActiveInSMSFilterCapabilitiesOptions:(unint64_t)a3 subAction:(int64_t)a4 action:(int64_t)a5
{
  unint64_t v8 = +[IMFeatureFlags sharedFeatureFlags];
  int v9 = [v8 isSMSFilterSyncEnabled];

  return v9
      && (+[IMSMSFilterCapabilitiesSyncHelper IMSMSFilterCapabilitiesOptionForFilterSubAction:a4 action:a5] & a3) != 0;
}

@end