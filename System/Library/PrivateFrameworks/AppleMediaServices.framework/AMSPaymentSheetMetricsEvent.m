@interface AMSPaymentSheetMetricsEvent
+ (id)_propertyValueClassesForKnownProperties;
+ (id)_timestamp;
+ (id)dictionaryForBiometricMatchState:(int64_t)a3 didBiometricsLockout:(BOOL)a4 biometricsType:(int64_t)a5;
+ (id)dictionaryForCancellationEvent:(unint64_t)a3 didBiometricsLockout:(BOOL)a4 biometricsType:(int64_t)a5;
+ (id)dictionaryForUserAction:(int64_t)a3 didBiometricsLockout:(BOOL)a4;
- (void)addBiometricMatchState:(int64_t)a3;
- (void)addBiometricsState:(int64_t)a3;
- (void)addClientMetadataForPaymentSheetRequest:(id)a3;
- (void)addClientMetadataForPurchaseInfo:(id)a3 metricsDictionary:(id)a4;
- (void)addDualActionSuccess:(BOOL)a3;
- (void)addUserActions:(id)a3;
@end

@implementation AMSPaymentSheetMetricsEvent

+ (id)dictionaryForBiometricMatchState:(int64_t)a3 didBiometricsLockout:(BOOL)a4 biometricsType:(int64_t)a5
{
  BOOL v6 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v10 = v9;
  switch(a3)
  {
    case 0:
      [v9 setObject:@"error" forKeyedSubscript:@"reason"];
      v11 = @"failure";
      v12 = @"result";
      goto LABEL_15;
    case 1:
      [v9 setObject:@"authenticate" forKeyedSubscript:@"actionType"];
      v13 = @"success";
      goto LABEL_6;
    case 2:
      [v9 setObject:@"enterPassword" forKeyedSubscript:@"actionType"];
      v11 = @"EnterPassword";
      goto LABEL_14;
    case 3:
      v14 = @"cancelClicked";
      goto LABEL_13;
    case 4:
      v14 = @"cancelOutside";
      goto LABEL_13;
    case 5:
      v14 = @"cancelHomeButton";
      goto LABEL_13;
    case 6:
      v14 = @"cancelPhysicalButton";
      goto LABEL_13;
    case 7:
      v14 = @"cancelSwipe";
LABEL_13:
      [v9 setObject:v14 forKeyedSubscript:@"actionType"];
      v11 = @"Cancel";
      goto LABEL_14;
    default:
      if (a3 == 100)
      {
        [v9 setObject:@"authenticate" forKeyedSubscript:@"actionType"];
        [v10 setObject:@"invalidCredentials" forKeyedSubscript:@"reason"];
        v13 = @"failure";
LABEL_6:
        [v10 setObject:v13 forKeyedSubscript:@"result"];
        v11 = @"Biometric";
LABEL_14:
        v12 = @"targetId";
LABEL_15:
        [v10 setObject:v11 forKeyedSubscript:v12];
        if (v6) {
          goto LABEL_16;
        }
      }
      else
      {
        v24 = +[AMSLogConfig sharedConfig];
        if (!v24)
        {
          v24 = +[AMSLogConfig sharedConfig];
        }
        v25 = [v24 OSLogObject];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          uint64_t v26 = objc_opt_class();
          v27 = AMSSetLogKeyIfNeeded();
          v28 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
          int v29 = 138543874;
          uint64_t v30 = v26;
          __int16 v31 = 2114;
          v32 = v27;
          __int16 v33 = 2114;
          v34 = v28;
          _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unknown biometric match state: %{public}@", (uint8_t *)&v29, 0x20u);
        }
        if (v6) {
LABEL_16:
        }
          [v10 setObject:&unk_1EDD015E8 forKeyedSubscript:@"bioLockout"];
      }
      switch(a5)
      {
        case 1:
          break;
        case 2:
          v15 = @"touchId";
          goto LABEL_27;
        case 3:
          v15 = @"faceId";
          goto LABEL_27;
        case 4:
          v15 = @"passcode";
          goto LABEL_27;
        case 7:
          v15 = @"opticId";
LABEL_27:
          [v10 setObject:v15 forKeyedSubscript:@"biometricType"];
          break;
        default:
          v16 = +[AMSLogConfig sharedConfig];
          if (!v16)
          {
            v16 = +[AMSLogConfig sharedConfig];
          }
          v17 = [v16 OSLogObject];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            uint64_t v18 = objc_opt_class();
            v19 = AMSSetLogKeyIfNeeded();
            v20 = [MEMORY[0x1E4F28ED0] numberWithInteger:a5];
            int v29 = 138543874;
            uint64_t v30 = v18;
            __int16 v31 = 2114;
            v32 = v19;
            __int16 v33 = 2114;
            v34 = v20;
            _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unknown biometric type: %{public}@", (uint8_t *)&v29, 0x20u);
          }
          break;
      }
      v21 = [a1 _timestamp];
      [v10 setObject:v21 forKeyedSubscript:@"responseTime"];

      v22 = (void *)[v10 copy];
      return v22;
  }
}

+ (id)dictionaryForCancellationEvent:(unint64_t)a3 didBiometricsLockout:(BOOL)a4 biometricsType:(int64_t)a5
{
  unint64_t v7 = a3 - 1;
  uint64_t v8 = 4;
  switch(v7)
  {
    case 0uLL:
      goto LABEL_6;
    case 1uLL:
      uint64_t v8 = 3;
      goto LABEL_6;
    case 2uLL:
      uint64_t v8 = 5;
      goto LABEL_6;
    case 3uLL:
      uint64_t v8 = 6;
      goto LABEL_6;
    case 4uLL:
      uint64_t v8 = 7;
LABEL_6:
      id v9 = objc_msgSend(a1, "dictionaryForBiometricMatchState:didBiometricsLockout:biometricsType:", v8, a4, a5, v5);
      break;
    default:
      id v9 = 0;
      break;
  }
  return v9;
}

+ (id)dictionaryForUserAction:(int64_t)a3 didBiometricsLockout:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = v7;
  switch(a3)
  {
    case 1:
      [v7 setObject:@"ok" forKeyedSubscript:@"actionType"];
      [v8 setObject:@"success" forKeyedSubscript:@"result"];
      id v9 = @"Ok";
      goto LABEL_20;
    case 2:
      v15 = @"cancel";
      goto LABEL_11;
    case 3:
      v15 = @"open";
LABEL_11:
      [v7 setObject:v15 forKeyedSubscript:@"actionType"];
      id v9 = @"IForgot";
      goto LABEL_20;
    case 4:
      [v7 setObject:@"cancel" forKeyedSubscript:@"actionType"];
      [v8 setObject:@"Cancel" forKeyedSubscript:@"targetId"];
      id v9 = @"authenticate";
      v16 = v8;
      goto LABEL_21;
    case 5:
      [v7 setObject:@"invalidCredentials" forKeyedSubscript:@"reason"];
      v17 = @"failure";
      goto LABEL_15;
    case 6:
      v17 = @"success";
LABEL_15:
      uint64_t v18 = @"result";
      goto LABEL_19;
    case 7:
      v17 = @"enterPasswordCancelled";
      goto LABEL_18;
    case 8:
      v17 = @"enterPasswordPressed";
LABEL_18:
      uint64_t v18 = @"actionType";
LABEL_19:
      [v8 setObject:v17 forKeyedSubscript:v18];
      id v9 = @"authenticate";
      goto LABEL_20;
    case 9:
      [v7 setObject:@"cancelHomeButton" forKeyedSubscript:@"actionType"];
      id v9 = @"Cancel";
LABEL_20:
      v16 = v8;
LABEL_21:
      [v16 setObject:v9 forKeyedSubscript:@"targetId"];
      if (v4) {
        goto LABEL_22;
      }
      goto LABEL_23;
    default:
      v10 = +[AMSLogConfig sharedConfig];
      if (!v10)
      {
        v10 = +[AMSLogConfig sharedConfig];
      }
      v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = objc_opt_class();
        v13 = AMSSetLogKeyIfNeeded();
        v14 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
        int v22 = 138543874;
        uint64_t v23 = v12;
        __int16 v24 = 2114;
        v25 = v13;
        __int16 v26 = 2114;
        v27 = v14;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unknown user action: %{public}@", (uint8_t *)&v22, 0x20u);
      }
      if (v4) {
LABEL_22:
      }
        [v8 setObject:&unk_1EDD015E8 forKeyedSubscript:@"bioLockout"];
LABEL_23:
      v19 = [a1 _timestamp];
      [v8 setObject:v19 forKeyedSubscript:@"responseTime"];

      v20 = (void *)[v8 copy];
      return v20;
  }
}

- (void)addBiometricMatchState:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
      uint64_t v5 = @"failure";
      uint64_t v6 = @"result";
      goto LABEL_10;
    case 1:
      [(AMSMetricsEvent *)self setProperty:@"biometricsAnalyze" forBodyKey:@"actionType"];
      id v7 = @"success";
      goto LABEL_6;
    case 2:
      [(AMSMetricsEvent *)self setProperty:@"enterPassword" forBodyKey:@"actionType"];
      [(AMSMetricsEvent *)self setProperty:@"success" forBodyKey:@"result"];
      uint64_t v5 = @"EnterPassword";
      goto LABEL_9;
    case 3:
      [(AMSMetricsEvent *)self setProperty:@"cancel" forBodyKey:@"actionType"];
      [(AMSMetricsEvent *)self setProperty:@"failure" forBodyKey:@"result"];
      uint64_t v5 = @"Cancel";
      goto LABEL_9;
    default:
      if (a3 == 100)
      {
        [(AMSMetricsEvent *)self setProperty:@"biometricsAnalyze" forBodyKey:@"actionType"];
        id v7 = @"failure";
LABEL_6:
        [(AMSMetricsEvent *)self setProperty:v7 forBodyKey:@"result"];
        uint64_t v5 = @"Biometric";
LABEL_9:
        uint64_t v6 = @"targetId";
LABEL_10:
        [(AMSMetricsEvent *)self setProperty:v5 forBodyKey:v6];
      }
      else
      {
        uint64_t v8 = +[AMSLogConfig sharedConfig];
        if (!v8)
        {
          uint64_t v8 = +[AMSLogConfig sharedConfig];
        }
        id v9 = [v8 OSLogObject];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = objc_opt_class();
          v11 = AMSSetLogKeyIfNeeded();
          uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
          int v13 = 138543874;
          uint64_t v14 = v10;
          __int16 v15 = 2114;
          v16 = v11;
          __int16 v17 = 2114;
          uint64_t v18 = v12;
          _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unknown match state: %{public}@", (uint8_t *)&v13, 0x20u);
        }
      }
      return;
  }
}

- (void)addBiometricsState:(int64_t)a3
{
  if (a3 == 1)
  {
    v3 = @"on";
  }
  else
  {
    if (a3 != 2) {
      return;
    }
    v3 = @"off";
  }
  [(AMSMetricsEvent *)self setProperty:v3 forBodyKey:@"bioAuthCommerceSetting"];
}

- (void)addClientMetadataForPaymentSheetRequest:(id)a3
{
  id v8 = a3;
  BOOL v4 = [v8 salableInfoLabel];

  if (v4)
  {
    uint64_t v5 = [v8 salableInfoLabel];
    uint64_t v6 = +[AMSPaymentSheetRequest attributedStringByRemovingPlaceholderTagsFromAttributedString:v5];
    id v7 = [v6 string];

    [(AMSMetricsEvent *)self setProperty:v7 forBodyKey:@"message"];
  }
}

- (void)addClientMetadataForPurchaseInfo:(id)a3 metricsDictionary:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 buyParams];
  id v9 = [v8 stringValue];

  if (v9)
  {
    __int16 v24 = @"buyParams";
    v25[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    [(AMSMetricsEvent *)self setProperty:v10 forBodyKey:@"details"];
  }
  v11 = [v7 objectForKeyedSubscript:@"mtClientId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;

    if (v12) {
      [(AMSMetricsEvent *)self setProperty:v12 forBodyKey:@"clientId"];
    }
  }
  else
  {

    id v12 = 0;
  }
  [(AMSMetricsEvent *)self setProperty:@"SignIn" forBodyKey:@"dialogType"];
  int v13 = [v6 clientInfo];
  uint64_t v14 = +[AMSUserAgent userAgentForProcessInfo:v13];

  if (v14) {
    [(AMSMetricsEvent *)self setProperty:v14 forBodyKey:@"userAgent"];
  }
  __int16 v15 = [v6 clientInfo];
  v16 = [v15 proxyAppBundleID];

  if (v16) {
    goto LABEL_12;
  }
  __int16 v17 = [v6 clientInfo];
  uint64_t v18 = [v17 mappedBundleInfo];
  v16 = [v18 bundleIdentifier];

  if (v16
    || ([v6 clientInfo],
        uint64_t v19 = objc_claimAutoreleasedReturnValue(),
        [v19 bundleIdentifier],
        v16 = objc_claimAutoreleasedReturnValue(),
        v19,
        v16))
  {
LABEL_12:
    [(AMSMetricsEvent *)self setProperty:v16 forBodyKey:@"hostApp"];
  }
  v20 = [v7 objectForKeyedSubscript:@"titleType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = v20;

    if (v21) {
      [(AMSMetricsEvent *)self setProperty:v21 forBodyKey:@"titleType"];
    }
  }
  else
  {

    id v21 = 0;
  }
  int v22 = [v7 objectForKeyedSubscript:@"titleValue"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v22;

    if (v23) {
      [(AMSMetricsEvent *)self setProperty:v23 forBodyKey:@"titleValue"];
    }
  }
  else
  {

    id v23 = 0;
  }
}

- (void)addDualActionSuccess:(BOOL)a3
{
  if (a3) {
    v3 = @"success";
  }
  else {
    v3 = @"failure";
  }
  [(AMSMetricsEvent *)self setProperty:v3 forBodyKey:@"dualAction"];
}

- (void)addUserActions:(id)a3
{
}

+ (id)_propertyValueClassesForKnownProperties
{
  v9[19] = *MEMORY[0x1E4F143B8];
  v8[0] = @"clientId";
  v9[0] = objc_opt_class();
  v8[1] = @"message";
  v9[1] = objc_opt_class();
  v8[2] = @"dialogType";
  v9[2] = objc_opt_class();
  v8[3] = @"mtClientId";
  v9[3] = objc_opt_class();
  v8[4] = @"titleType";
  v9[4] = objc_opt_class();
  v8[5] = @"titleValue";
  v9[5] = objc_opt_class();
  v8[6] = @"details";
  v9[6] = objc_opt_class();
  v8[7] = @"hostApp";
  v9[7] = objc_opt_class();
  v8[8] = @"userAgent";
  v9[8] = objc_opt_class();
  v8[9] = @"userActions";
  v9[9] = objc_opt_class();
  v8[10] = @"bioLockout";
  v9[10] = objc_opt_class();
  v8[11] = @"biometricType";
  v9[11] = objc_opt_class();
  v8[12] = @"dualAction";
  v9[12] = objc_opt_class();
  v8[13] = @"reason";
  v9[13] = objc_opt_class();
  v8[14] = @"responseTime";
  v9[14] = objc_opt_class();
  v8[15] = @"result";
  v9[15] = objc_opt_class();
  v8[16] = @"targetId";
  v9[16] = objc_opt_class();
  v8[17] = @"actionType";
  v9[17] = objc_opt_class();
  v8[18] = @"bioAuthCommerceSetting";
  v9[18] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:19];
  BOOL v4 = (void *)[v3 mutableCopy];

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___AMSPaymentSheetMetricsEvent;
  uint64_t v5 = objc_msgSendSuper2(&v7, sel__propertyValueClassesForKnownProperties);
  [v4 addEntriesFromDictionary:v5];

  return v4;
}

+ (id)_timestamp
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSince1970];
  double v4 = v3;

  uint64_t v5 = NSString;
  id v6 = [MEMORY[0x1E4F28ED0] numberWithLongLong:(uint64_t)v4];
  objc_super v7 = [v5 stringWithFormat:@"%@", v6];

  return v7;
}

@end