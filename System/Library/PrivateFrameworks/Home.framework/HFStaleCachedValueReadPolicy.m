@interface HFStaleCachedValueReadPolicy
- (unint64_t)evaluateWithCharacteristic:(id)a3 traits:(id *)a4;
@end

@implementation HFStaleCachedValueReadPolicy

- (unint64_t)evaluateWithCharacteristic:(id)a3 traits:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 service];
  v7 = [v6 accessory];
  v8 = [v7 home];
  v9 = objc_msgSend(v8, "hf_characteristicValueManager");

  if (v9)
  {
    v10 = +[HFCharacteristicNotificationManager sharedManager];
    v11 = [v9 cachedValueForCharacteristic:v5];

    if (v11) {
      v12 = @"ExplicitlyDisallowed";
    }
    else {
      v12 = @"CacheMissing";
    }
    if (+[HFUtilities hasInternalDiagnostics])
    {
      v13 = HFLogForCategory(0x39uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_msgSend(v5, "hf_prettyDescription");
        v15 = [v9 cachedValueForCharacteristic:v5];
        [v5 value];
        v16 = v27 = v12;
        v17 = [v5 valueUpdatedTime];
        [v10 lastNotificationsEnableRequestDate];
        v18 = v26 = v10;
        *(_DWORD *)buf = 67110402;
        BOOL v29 = v11 != 0;
        __int16 v30 = 2112;
        v31 = v14;
        __int16 v32 = 2112;
        v33 = v15;
        __int16 v34 = 2112;
        v35 = v16;
        __int16 v36 = 2112;
        v37 = v17;
        __int16 v38 = 2112;
        v39 = v18;
        _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "HFStaleCachedValueReadPolicy: isCached=%{BOOL}d for characteristic %@\ncachedValue=%@, value=%@, valueUpdatedTime=%@, lastNotificationsEnableRequestDate=%@", buf, 0x3Au);

        v10 = v26;
        v12 = v27;
      }
    }
    if (a4)
    {
      id v19 = [MEMORY[0x263EFFA08] setWithObject:v12];
      *a4 = v19;
    }
    unint64_t v20 = v11 == 0;
  }
  else
  {
    if (!+[HFUtilities isInternalTest])
    {
      v21 = objc_msgSend(v5, "hf_prettyDescription");
      v22 = [v5 service];
      v23 = [v22 accessory];
      v24 = [v23 home];
      NSLog(&cfstr_MissingValueMa.isa, v21, v24);
    }
    unint64_t v20 = 1;
  }

  return v20;
}

@end