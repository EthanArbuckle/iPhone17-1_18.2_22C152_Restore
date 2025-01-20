@interface DASActivity
@end

@implementation DASActivity

void __30___DASActivity_initWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v10 isEqual:@"progress"])
    {
      v6 = [v5 ns];
      v7 = *(void **)(a1 + 32);
      v8 = objc_msgSend(v10, "dk_dedup");
      [v7 setObject:v6 forKeyedSubscript:v8];
    }
    else
    {
      v9 = *(void **)(a1 + 32);
      v6 = objc_msgSend(v10, "dk_dedup");
      [v9 setObject:v5 forKeyedSubscript:v6];
    }
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v10];
  }
}

uint64_t __48___DASActivity_setConstraintsWithXPCDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = [NSString stringWithUTF8String:a2];
  if ([v6 isEqualToString:@"MotionState"])
  {
    [*(id *)(a1 + 32) setMotionState:xpc_int64_get_value(v5)];
    goto LABEL_19;
  }
  if ([v6 isEqualToString:@"MagneticInterferenceSensitivity"])
  {
LABEL_4:
    [*(id *)(a1 + 32) setBool:xpc_BOOL_get_value(v5) forUserInfoKey:v6];
    goto LABEL_19;
  }
  if ([v6 isEqualToString:@"MinBatteryLevel"])
  {
    unint64_t value = xpc_int64_get_value(v5);
    if (value <= 0x64) {
      unint64_t v8 = value;
    }
    else {
      unint64_t v8 = 0;
    }
    v9 = *(void **)(a1 + 32);
    uint64_t v10 = [NSNumber numberWithLongLong:v8];
LABEL_17:
    v13 = (void *)v10;
    [v9 setObject:v10 forUserInfoKey:v6];
LABEL_18:

    goto LABEL_19;
  }
  if ([v6 isEqualToString:@"MinDataBudgetPercentage"])
  {
    double v11 = xpc_double_get_value(v5);
    if (v11 < 0.0 || v11 > 1.0) {
      double v11 = 0.0;
    }
    v9 = *(void **)(a1 + 32);
    uint64_t v10 = [NSNumber numberWithDouble:v11];
    goto LABEL_17;
  }
  if ([v6 isEqualToString:@"MailFetch"]
    || [v6 isEqualToString:@"BypassBatteryAging"]
    || [v6 isEqualToString:@"UserRequestedBackupActivity"])
  {
    goto LABEL_4;
  }
  if ([v6 isEqualToString:@"DataBudgetName"])
  {
    string_ptr = xpc_string_get_string_ptr(v5);
    if (!string_ptr) {
      goto LABEL_19;
    }
    v13 = [NSString stringWithUTF8String:string_ptr];
    [*(id *)(a1 + 32) setClientDataBudgetName:v13];
    goto LABEL_18;
  }
  if ([v6 isEqualToString:@"BypassPeakPower"]
    || [v6 isEqualToString:@"BeforeApplicationLaunch"]
    || [v6 isEqualToString:@"com.apple.das.overrideRateLimiting"])
  {
    goto LABEL_4;
  }
  if ([v6 isEqualToString:@"ActivityType"])
  {
    v16 = xpc_string_get_string_ptr(v5);
    if (!v16) {
      goto LABEL_19;
    }
    v13 = [NSString stringWithUTF8String:v16];
    [*(id *)(a1 + 32) setActivityType:v13];
    goto LABEL_18;
  }
  if ([v6 isEqualToString:@"Backlogged"])
  {
    [*(id *)(a1 + 32) setBacklogged:xpc_BOOL_get_value(v5)];
    goto LABEL_19;
  }
  if ([v6 isEqualToString:@"BlockRebootActivitiesForSU"]
    || [v6 isEqualToString:@"UseStatisticalModelForTriggersRestart"])
  {
    goto LABEL_4;
  }
  if ([v6 isEqualToString:@"RemoteDevice"])
  {
    v17 = xpc_string_get_string_ptr(v5);
    if (!v17) {
      goto LABEL_19;
    }
    v13 = [NSString stringWithUTF8String:v17];
    [*(id *)(a1 + 32) setRemoteDevice:v13];
    goto LABEL_18;
  }
  if ([v6 isEqualToString:@"RateLimitConfiguration"])
  {
    v18 = xpc_string_get_string_ptr(v5);
    if (!v18) {
      goto LABEL_19;
    }
    v13 = [NSString stringWithUTF8String:v18];
    [*(id *)(a1 + 32) setRateLimitConfigurationName:v13];
    goto LABEL_18;
  }
  if ([v6 isEqualToString:@"ServiceName"])
  {
    v19 = xpc_string_get_string_ptr(v5);
    if (v19)
    {
      v13 = [NSString stringWithUTF8String:v19];
      [*(id *)(a1 + 32) setServiceName:v13];
      goto LABEL_18;
    }
  }
LABEL_19:

  return 1;
}

void __37___DASActivity_ckPushContentMatches___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v8 = [v7 objectForKeyedSubscript:@"sid"];

      if (v8)
      {
        v9 = *(void **)(a1 + 32);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __37___DASActivity_ckPushContentMatches___block_invoke_2;
        v12[3] = &unk_1E6112D88;
        id v10 = v7;
        uint64_t v11 = *(void *)(a1 + 40);
        id v13 = v10;
        uint64_t v14 = v11;
        uint64_t v15 = a4;
        [v9 enumerateKeysAndObjectsUsingBlock:v12];
      }
    }
  }
}

uint64_t __37___DASActivity_ckPushContentMatches___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v15 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v15;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 objectForKeyedSubscript:@"sid"];
      if (v7)
      {
        unint64_t v8 = (void *)v7;
        v9 = [v6 objectForKeyedSubscript:@"sid"];
        id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"sid"];
        char v11 = [v9 isEqual:v10];

        if (v11)
        {
          char v12 = 1;
LABEL_8:
          **(unsigned char **)(a1 + 48) = 1;
          *a4 = 1;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v12;
          goto LABEL_9;
        }
      }
      id v13 = [v6 objectForKeyedSubscript:@"sid"];

      if (v13)
      {
        char v12 = 0;
        goto LABEL_8;
      }
    }
LABEL_9:
  }

  return MEMORY[0x1F41817F8]();
}

void __28___DASActivity_policyScores__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = NSNumber;
  id v6 = a2;
  [a3 score];
  objc_msgSend(v5, "numberWithDouble:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

uint64_t __52___DASActivity_validClassesForUserInfoSerialization__block_invoke()
{
  id v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  validClassesForUserInfoSerialization_validClasses = objc_msgSend(v15, "setWithObjects:", v14, v13, v12, v11, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);

  return MEMORY[0x1F41817F8]();
}

void __35___DASActivity_sharedDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v1 = (void *)sharedDateFormatter_formatter;
  sharedDateFormatter_formatter = (uint64_t)v0;

  [(id)sharedDateFormatter_formatter setDateStyle:1];
  [(id)sharedDateFormatter_formatter setTimeStyle:2];
  uint64_t v2 = (void *)sharedDateFormatter_formatter;
  id v3 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v2 setTimeZone:v3];
}

@end