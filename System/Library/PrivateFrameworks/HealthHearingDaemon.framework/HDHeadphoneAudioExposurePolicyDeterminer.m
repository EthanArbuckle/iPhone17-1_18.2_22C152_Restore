@interface HDHeadphoneAudioExposurePolicyDeterminer
+ (id)determinePreviousFireDateWithStore:(id)a3 error:(id *)a4;
@end

@implementation HDHeadphoneAudioExposurePolicyDeterminer

+ (id)determinePreviousFireDateWithStore:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v24 = 0;
  uint64_t v6 = [v5 _fetchPreviousSevenDayLocalNotificationFireDateWithError:&v24];
  id v7 = v24;
  if (!v7)
  {
    id v23 = 0;
    uint64_t v10 = [v5 _fetchPreviousSevenDayRemoteNotificationFireDateWithError:&v23];
    id v8 = v23;
    if (v8)
    {
      if (a4)
      {
        v9 = 0;
        *a4 = v8;
LABEL_29:

        goto LABEL_30;
      }
      _HKLogDroppedError();
LABEL_12:
      v9 = 0;
      goto LABEL_29;
    }
    if (!(v6 | v10))
    {
      _HKInitializeLogging();
      v11 = (void *)*MEMORY[0x263F09910];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        uint64_t v13 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        uint64_t v26 = v13;
        _os_log_impl(&dword_22615C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Determiner returning nil", buf, 0xCu);
      }
      goto LABEL_12;
    }
    if (v6 && !v10)
    {
      _HKInitializeLogging();
      v14 = (void *)*MEMORY[0x263F09910];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      goto LABEL_24;
    }
    if (v6 || !v10)
    {
      int v15 = objc_msgSend((id)v6, "hk_isAfterDate:", v10);
      _HKInitializeLogging();
      v14 = (void *)*MEMORY[0x263F09910];
      BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (v16)
        {
LABEL_23:
          v17 = v14;
          uint64_t v18 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          uint64_t v26 = v18;
          _os_log_impl(&dword_22615C000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Determiner returning local notification fire date", buf, 0xCu);
        }
LABEL_24:
        id v19 = (id)v6;
LABEL_28:
        v9 = v19;
        goto LABEL_29;
      }
      if (v16) {
        goto LABEL_26;
      }
    }
    else
    {
      _HKInitializeLogging();
      v14 = (void *)*MEMORY[0x263F09910];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
      {
LABEL_26:
        v20 = v14;
        uint64_t v21 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        uint64_t v26 = v21;
        _os_log_impl(&dword_22615C000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Determiner returning remote notification fire date", buf, 0xCu);
      }
    }
    id v19 = (id)v10;
    goto LABEL_28;
  }
  id v8 = v7;
  if (a4)
  {
    id v8 = v7;
    v9 = 0;
    *a4 = v8;
  }
  else
  {
    _HKLogDroppedError();
    v9 = 0;
  }
LABEL_30:

  return v9;
}

@end