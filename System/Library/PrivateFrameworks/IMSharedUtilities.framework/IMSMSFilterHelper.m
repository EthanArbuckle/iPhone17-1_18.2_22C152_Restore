@interface IMSMSFilterHelper
+ (BOOL)IDSDeviceSupportsIncomingSMSRelayFilteringForDeviceType:(int64_t)a3;
+ (BOOL)isValidActiveFilterAction:(int64_t)a3 subAction:(int64_t)a4;
+ (BOOL)supportsIncomingSMSRelayFiltering;
+ (id)fetchSMSFilterExtensionParams;
+ (id)fetchSMSFilterParamForCategory:(int64_t)a3 subCategory:(int64_t)a4;
+ (id)filterLabelForAction:(int64_t)a3 subAction:(int64_t)a4;
+ (id)smsFilterParamForFilterMode:(unint64_t)a3;
+ (int64_t)filterActionForCategory:(int64_t)a3;
+ (int64_t)filterSubActionForCategory:(int64_t)a3 subCategory:(int64_t)a4;
+ (unint64_t)conversationFilterModeForMessageFilter:(unint64_t)a3;
+ (void)updateSMSFilterExtensionParams;
@end

@implementation IMSMSFilterHelper

+ (id)fetchSMSFilterExtensionParams
{
  v2 = (void *)qword_1E94FFBF8;
  if (qword_1E94FFBF8) {
    goto LABEL_21;
  }
  if (IMGetDomainBoolForKey())
  {
    v3 = IMGetCachedDomainValueForKey();
    v4 = v3;
    if (!v3 || ![v3 count])
    {
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
      +[IMSMSFilterCapabilitiesBinder handleSubClassificationFilterChange];
      goto LABEL_20;
    }
    v5 = [v4 objectForKey:@"spamFilterExtensionParams"];
    id v17 = 0;
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:&v17];
    id v7 = v17;
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    [v6 _enableStrictSecureDecodingMode];
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
    uint64_t v11 = [v6 decodeObjectOfClasses:v10 forKey:*MEMORY[0x1E4F284E8]];
    v12 = (void *)qword_1E94FFBF8;
    qword_1E94FFBF8 = v11;

    uint64_t v13 = qword_1E94FFBF8;
    int v14 = _IMWillLog();
    if (!v13 || v7)
    {
      if (v14) {
LABEL_18:
      }
        _IMAlwaysLog();
    }
    else if (v14)
    {
      goto LABEL_18;
    }

LABEL_20:
    v2 = (void *)qword_1E94FFBF8;
LABEL_21:
    id v15 = v2;
    goto LABEL_22;
  }
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  id v15 = 0;
LABEL_22:

  return v15;
}

+ (void)updateSMSFilterExtensionParams
{
  v2 = (void *)qword_1E94FFBF8;
  qword_1E94FFBF8 = 0;

  v3 = IMGetCachedDomainValueForKey();
  v4 = v3;
  if (v3 && [v3 count])
  {
    v5 = [v4 objectForKey:@"spamFilterExtensionParams"];
    id v15 = 0;
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:&v15];
    id v7 = v15;
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    [v6 _enableStrictSecureDecodingMode];
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
    uint64_t v11 = [v6 decodeObjectOfClasses:v10 forKey:*MEMORY[0x1E4F284E8]];
    v12 = (void *)qword_1E94FFBF8;
    qword_1E94FFBF8 = v11;

    uint64_t v13 = qword_1E94FFBF8;
    int v14 = _IMWillLog();
    if (!v13 || v7)
    {
      if (v14) {
LABEL_10:
      }
        _IMAlwaysLog();
    }
    else if (v14)
    {
      goto LABEL_10;
    }
  }
}

+ (id)fetchSMSFilterParamForCategory:(int64_t)a3 subCategory:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = +[IMSMSFilterHelper fetchSMSFilterExtensionParams];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 action] == a3 && objc_msgSend(v11, "subAction") == a4)
        {
          id v12 = v11;
          goto LABEL_12;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_12:

  return v12;
}

+ (id)smsFilterParamForFilterMode:(unint64_t)a3
{
  return (id)MEMORY[0x1F4181798](a1, sel_fetchSMSFilterParamForCategory_subCategory_);
}

+ (int64_t)filterActionForCategory:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    return 2;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = +[IMSMSFilterHelper fetchSMSFilterExtensionParams];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 category] == a3)
        {
          int64_t v3 = [v10 action];
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  int64_t v3 = 0;
LABEL_13:

  return v3;
}

+ (int64_t)filterSubActionForCategory:(int64_t)a3 subCategory:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = +[IMSMSFilterHelper fetchSMSFilterExtensionParams];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 category] == a3 && objc_msgSend(v11, "subCategory") == a4)
        {
          int64_t v12 = [v11 subAction];
          goto LABEL_12;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  int64_t v12 = 0;
LABEL_12:

  return v12;
}

+ (id)filterLabelForAction:(int64_t)a3 subAction:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = +[IMSMSFilterHelper fetchSMSFilterExtensionParams];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    v10 = @"filtered";
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        int64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v12 action] == a3 && objc_msgSend(v12, "subAction") == a4)
        {
          v10 = [v12 label];
          goto LABEL_13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    v10 = @"filtered";
  }
LABEL_13:

  return v10;
}

+ (BOOL)isValidActiveFilterAction:(int64_t)a3 subAction:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)qword_1E94FFBF8;
  qword_1E94FFBF8 = 0;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = +[IMSMSFilterHelper fetchSMSFilterExtensionParams];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        int64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v12 action] == a3 && objc_msgSend(v12, "subAction") == a4)
        {
          BOOL v13 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_12:

  return v13;
}

+ (unint64_t)conversationFilterModeForMessageFilter:(unint64_t)a3
{
  unint64_t v3 = a3 & 0xF;
  uint64_t v4 = 5;
  if (v3 != 3) {
    uint64_t v4 = 0;
  }
  if (v3 != 4) {
    unint64_t v3 = v4;
  }
  if (a3 >= 0x10) {
    return v3;
  }
  else {
    return a3;
  }
}

+ (BOOL)supportsIncomingSMSRelayFiltering
{
  v2 = +[IMFeatureFlags sharedFeatureFlags];
  int v3 = [v2 isSMSFilterSyncEnabled];

  return v3 && IMSharedHelperDeviceIsiPad();
}

+ (BOOL)IDSDeviceSupportsIncomingSMSRelayFilteringForDeviceType:(int64_t)a3
{
  uint64_t v4 = +[IMFeatureFlags sharedFeatureFlags];
  char v5 = [v4 isSMSFilterSyncEnabled];

  if (a3 == 4) {
    return v5;
  }
  else {
    return 0;
  }
}

@end