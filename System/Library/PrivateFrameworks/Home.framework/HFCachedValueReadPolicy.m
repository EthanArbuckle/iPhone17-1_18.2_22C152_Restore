@interface HFCachedValueReadPolicy
- (unint64_t)evaluateWithCharacteristic:(id)a3 traits:(id *)a4;
@end

@implementation HFCachedValueReadPolicy

- (unint64_t)evaluateWithCharacteristic:(id)a3 traits:(id *)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 service];
  v7 = [v6 accessory];
  v8 = [v7 home];

  v9 = objc_msgSend(v8, "hf_characteristicValueManager");
  if (v9)
  {
    v10 = +[HFCharacteristicNotificationManager notificationsStateContainer];
    v11 = [v10 lastNotificationsEnableRequestDateForCharacteristic:v5 forHome:v8];
    v12 = [v9 cachedValueForCharacteristic:v5];

    if (v12)
    {
      if ([v5 isNotificationEnabled])
      {
        uint64_t v13 = [v5 valueUpdatedTime];
        if (!v13) {
          goto LABEL_6;
        }
        v14 = (void *)v13;
        v15 = [v5 valueUpdatedTime];
        v16 = [MEMORY[0x263EFF910] distantPast];
        char v17 = [v15 isEqualToDate:v16];

        if ((v17 & 1) == 0)
        {
          if ([v10 notificationsEnabledForCharacteristic:v5 inHome:v8])
          {
            int v18 = [v10 cacheUpToDateWithNotificationsEnabledForCharacteristic:v5 inHome:v8];
            if (v18) {
              v19 = @"CacheUpToDate";
            }
            else {
              v19 = @"NotificationsEnabledAfterLastRead";
            }
          }
          else
          {
            int v18 = 0;
            v19 = @"HomeNotificationsDisabled";
          }
        }
        else
        {
LABEL_6:
          int v18 = 0;
          v19 = @"CacheNeverUpdated";
        }
      }
      else
      {
        int v18 = 0;
        v19 = @"CharacteristicNotificationsDisabled";
      }
    }
    else
    {
      int v18 = 0;
      v19 = @"CacheMissing";
    }
    if (+[HFUtilities hasInternalDiagnostics])
    {
      v25 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "hf_prettyDescription");
        v26 = v32 = a4;
        v27 = [v9 cachedValueForCharacteristic:v5];
        [v5 value];
        v28 = v34 = v11;
        [v5 valueUpdatedTime];
        v29 = v33 = v19;
        *(_DWORD *)buf = 67110658;
        int v36 = v18;
        __int16 v37 = 2112;
        v38 = v26;
        __int16 v39 = 2112;
        v40 = v27;
        __int16 v41 = 2112;
        v42 = v28;
        __int16 v43 = 2112;
        v44 = v29;
        __int16 v45 = 2112;
        v46 = v34;
        __int16 v47 = 2112;
        v48 = v10;
        _os_log_impl(&dword_20B986000, v25, OS_LOG_TYPE_DEFAULT, "HFCachedValueReadPolicy: cacheUpToDate=%{BOOL}d for characteristic %@\ncachedValue=%@, value=%@, valueUpdatedTime=%@, lastNotificationsEnableRequestDate=%@, notificationStateContainer=%@", buf, 0x44u);

        v19 = v33;
        v11 = v34;

        a4 = v32;
      }
    }
    if (a4)
    {
      id v30 = [MEMORY[0x263EFFA08] setWithObject:v19];
      *a4 = v30;
    }
    unint64_t v24 = v18 ^ 1u;
  }
  else
  {
    if (!+[HFUtilities isInternalTest])
    {
      v20 = objc_msgSend(v5, "hf_prettyDescription");
      v21 = [v5 service];
      v22 = [v21 accessory];
      v23 = [v22 home];
      NSLog(&cfstr_MissingValueMa.isa, v20, v23);
    }
    unint64_t v24 = 1;
  }

  return v24;
}

@end