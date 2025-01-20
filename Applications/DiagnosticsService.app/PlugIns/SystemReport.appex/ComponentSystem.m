@interface ComponentSystem
- (BOOL)isInBoxUpdateEligibleMode;
- (BOOL)isInDiagnosticsMode;
- (BOOL)isPasscodeLocked;
- (BOOL)isPasscodeSet;
- (BOOL)isServicePart;
- (BOOL)supportsInductiveCharging;
- (CTXPCServiceSubscriptionInfo)subscriptionInfo;
- (CoreTelephonyClient)telephonyClient;
- (id)carrierBundleVersion;
- (id)carrierName;
- (id)carrierName2;
- (id)carrierNameForSimCard:(int64_t)a3;
- (id)currentStandbyTime;
- (id)currentUsageTime;
- (id)languageCode;
- (id)localeCode;
- (id)productVersionExtra;
- (id)supplementalBuildVersion;
- (void)_setupTelephonyClient;
- (void)populateAttributes:(id)a3;
- (void)setSubscriptionInfo:(id)a3;
- (void)setTelephonyClient:(id)a3;
@end

@implementation ComponentSystem

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ComponentSystem;
  [(ComponentSystemBase *)&v23 populateAttributes:v4];
  [(ComponentSystem *)self _setupTelephonyClient];
  v5 = [(ComponentSystem *)self carrierName];
  [v4 setObject:v5 forKeyedSubscript:@"carrierName"];

  v6 = [(ComponentSystem *)self carrierName2];
  [v4 setObject:v6 forKeyedSubscript:@"carrierName2"];

  v7 = [(ComponentSystem *)self carrierBundleVersion];
  [v4 setObject:v7 forKeyedSubscript:@"carrierBundleVersion"];

  v8 = +[NSNumber numberWithBool:[(ComponentSystem *)self isInDiagnosticsMode]];
  [v4 setObject:v8 forKeyedSubscript:@"inDiagnosticsMode"];

  v9 = +[NSNumber numberWithBool:_AXSVoiceOverTouchEnabled() != 0];
  [v4 setObject:v9 forKeyedSubscript:@"voiceOverEnabled"];

  v10 = +[NSNumber numberWithBool:[(ComponentSystem *)self isServicePart]];
  [v4 setObject:v10 forKeyedSubscript:@"isServicePart"];

  v11 = [(ComponentSystem *)self localeCode];
  [v4 setObject:v11 forKeyedSubscript:@"regionCode"];

  v12 = [(ComponentSystem *)self languageCode];
  [v4 setObject:v12 forKeyedSubscript:@"languageCode"];

  v13 = +[NSNumber numberWithBool:[(ComponentSystem *)self supportsInductiveCharging]];
  [v4 setObject:v13 forKeyedSubscript:@"supportsInductiveCharging"];

  v14 = [(ComponentSystem *)self supplementalBuildVersion];
  [v4 setObject:v14 forKeyedSubscript:@"supplementalBuildVersion"];

  v15 = [(ComponentSystem *)self productVersionExtra];
  [v4 setObject:v15 forKeyedSubscript:@"productVersionExtra"];

  v16 = +[NSNumber numberWithBool:[(ComponentSystem *)self isInBoxUpdateEligibleMode]];
  [v4 setObject:v16 forKeyedSubscript:@"isInBoxUpdateEligibleMode"];

  if (![(ComponentSystem *)self isInDiagnosticsMode])
  {
    v17 = [(ComponentSystem *)self currentStandbyTime];
    v18 = [v17 stringValue];
    [v4 setObject:v18 forKeyedSubscript:@"currentStandbyTime"];

    v19 = [(ComponentSystem *)self currentUsageTime];
    v20 = [v19 stringValue];
    [v4 setObject:v20 forKeyedSubscript:@"currentUsageTime"];

    v21 = +[NSNumber numberWithBool:[(ComponentSystem *)self isPasscodeLocked]];
    [v4 setObject:v21 forKeyedSubscript:@"isPasscodeLocked"];

    v22 = +[NSNumber numberWithBool:[(ComponentSystem *)self isPasscodeSet]];
    [v4 setObject:v22 forKeyedSubscript:@"isPasscodeSet"];
  }
}

- (id)carrierName
{
  v2 = [(ComponentSystem *)self carrierNameForSimCard:0];
  v3 = stringOrNull(v2);

  return v3;
}

- (id)carrierName2
{
  v2 = [(ComponentSystem *)self carrierNameForSimCard:1];
  v3 = stringOrNull(v2);

  return v3;
}

- (id)carrierBundleVersion
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[ComponentSystem carrierBundleVersion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v4 = [(ComponentSystem *)self telephonyClient];
  if (v4
    && (v5 = (void *)v4,
        [(ComponentSystem *)self subscriptionInfo],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v8 = [(ComponentSystem *)self subscriptionInfo];
    v9 = [v8 subscriptions];

    id v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v10)
    {
      id v12 = v10;
      uint64_t v13 = *(void *)v28;
      *(void *)&long long v11 = 138412546;
      long long v25 = v11;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v9);
          }
          v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v16 = [(ComponentSystem *)self telephonyClient];
          id v26 = 0;
          id v17 = [v16 copyCarrierBundleVersion:v15 error:&v26];
          v18 = (char *)v26;

          if (v18)
          {
            v19 = DiagnosticLogHandleForCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              id v20 = [v15 slotID];
              *(_DWORD *)buf = v25;
              v32 = v18;
              __int16 v33 = 2048;
              id v34 = v20;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "copyCarrierBundleVersion failed: error: %@ on slot: %ld", buf, 0x16u);
            }
          }
          else
          {
            v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v15 slotID]);
            [v7 setObject:v17 forKeyedSubscript:v19];
          }
        }
        id v12 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v12);
    }

    v21 = [v7 allValues];
    v22 = [v21 componentsJoinedByString:@"; "];

    objc_super v23 = stringOrNull(v22);
  }
  else
  {
    objc_super v23 = +[NSNull null];
  }

  return v23;
}

- (id)currentStandbyTime
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[ComponentSystem currentStandbyTime]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  *(_DWORD *)buf = -1082130432;
  SBSSpringBoardServerPort();
  SBGetBatteryUsageTimesInSeconds();
  LODWORD(v3) = -1082130432;
  uint64_t v4 = +[NSNumber numberWithFloat:v3];
  v5 = numberOrNull(v4);

  return v5;
}

- (id)currentUsageTime
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[ComponentSystem currentUsageTime]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  *(_DWORD *)buf = -1082130432;
  SBSSpringBoardServerPort();
  SBGetBatteryUsageTimesInSeconds();
  LODWORD(v3) = *(_DWORD *)buf;
  uint64_t v4 = +[NSNumber numberWithFloat:v3];
  v5 = numberOrNull(v4);

  return v5;
}

- (BOOL)isInDiagnosticsMode
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[ComponentSystem isInDiagnosticsMode]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  return +[CBSUtilities isCheckerBoardActive];
}

- (id)carrierNameForSimCard:(int64_t)a3
{
  int v4 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[ComponentSystem carrierNameForSimCard:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v5 = [(ComponentSystem *)self telephonyClient];
  if (!v5
    || (v6 = (void *)v5,
        [(ComponentSystem *)self subscriptionInfo],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    objc_super v23 = +[NSNull null];
    goto LABEL_35;
  }
  uint64_t v8 = 1;
  id v29 = [objc_alloc((Class)CTBundle) initWithBundleType:1];
  if (a3)
  {
    if (a3 != 1)
    {
      v24 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v37 = (const char *)a3;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Requested sim card slot %ld is not present in CoreTelephony subscriptions", buf, 0xCu);
      }

      objc_super v23 = stringOrNull(0);
      v14 = 0;
      v22 = 0;
      goto LABEL_34;
    }
    uint64_t v8 = 2;
  }
  v9 = [(ComponentSystem *)self subscriptionInfo];
  id v10 = [v9 subscriptionsInUse];

  if (v10)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v12)
    {
      id v13 = v12;
      id v26 = v10;
      v14 = 0;
      long long v28 = 0;
      uint64_t v15 = *(void *)v32;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v11);
          }
          id v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if ([v17 slotID] == (id)v8)
          {
            v18 = [(ComponentSystem *)self telephonyClient];
            id v30 = v14;
            id v19 = [v18 copyCarrierBundleValue:v17 key:@"CarrierName" bundleType:v29 error:&v30];
            id v20 = v30;

            if (v19)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v21 = v28;
                long long v28 = v19;
              }
              else
              {
                v21 = DiagnosticLogHandleForCategory();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v37 = (const char *)v19;
                  _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Carrier name %@ is not a string!", buf, 0xCu);
                }
              }
            }
            else
            {
              v21 = DiagnosticLogHandleForCategory();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                v37 = (const char *)a3;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No carrier name for card slot %ld", buf, 0xCu);
              }
            }

            v14 = v20;
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v13);
      id v10 = v26;
      v22 = v28;
      goto LABEL_33;
    }
  }
  else
  {
    long long v11 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to get subscriptions from subscription info", buf, 2u);
    }
  }
  v22 = 0;
  v14 = 0;
LABEL_33:

  objc_super v23 = stringOrNull(v22);

LABEL_34:
LABEL_35:

  return v23;
}

- (BOOL)isPasscodeLocked
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[ComponentSystem isPasscodeLocked]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  return MGGetBoolAnswer();
}

- (BOOL)isPasscodeSet
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[ComponentSystem isPasscodeSet]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  return MGGetBoolAnswer();
}

- (BOOL)isServicePart
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[ComponentSystem isServicePart]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  double v3 = +[DASoftLinking coreRepairClass:@"CRRepairStatus"];
  if (v3)
  {
    id v10 = 0;
    int v4 = [(objc_class *)v3 isServicePartWithError:&v10];
    uint64_t v5 = v10;
    if (v5)
    {
      v6 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v9 = [v5 localizedDescription];
        *(_DWORD *)buf = 138412290;
        id v12 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error getting Service Part Status. Error: %@", buf, 0xCu);
      }
    }
    if (v4) {
      unsigned __int8 v7 = [v4 isEqualToString:@"1"];
    }
    else {
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    uint64_t v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Repair data not available for this device, skipping.", buf, 2u);
    }
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)localeCode
{
  v2 = +[NSLocale currentLocale];
  double v3 = [v2 localeIdentifier];

  return v3;
}

- (id)languageCode
{
  v2 = +[NSLocale currentLocale];
  double v3 = [v2 languageCode];

  return v3;
}

- (BOOL)supportsInductiveCharging
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[ComponentSystem supportsInductiveCharging]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  return MGGetBoolAnswer();
}

- (void)_setupTelephonyClient
{
  id v3 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:0];
  [(ComponentSystem *)self setTelephonyClient:v3];

  int v4 = [(ComponentSystem *)self telephonyClient];

  if (v4)
  {
    uint64_t v5 = [(ComponentSystem *)self telephonyClient];
    id v9 = 0;
    v6 = [v5 getSubscriptionInfoWithError:&v9];
    unsigned __int8 v7 = v9;
    [(ComponentSystem *)self setSubscriptionInfo:v6];

    if (!v7) {
      return;
    }
    uint64_t v8 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v11 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "CoreTelephonyClient getSubscriptionInfoWithError failed: error: %@", buf, 0xCu);
    }
  }
  else
  {
    unsigned __int8 v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to create CoreTelephony client!", buf, 2u);
    }
  }
}

- (id)supplementalBuildVersion
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    unsigned __int8 v7 = "-[ComponentSystem supplementalBuildVersion]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  id v3 = (void *)MGCopyAnswer();
  int v4 = stringOrNull(v3);

  return v4;
}

- (id)productVersionExtra
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    unsigned __int8 v7 = "-[ComponentSystem productVersionExtra]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  id v3 = (void *)MGCopyAnswer();
  int v4 = stringOrNull(v3);

  return v4;
}

- (BOOL)isInBoxUpdateEligibleMode
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v11 = "-[ComponentSystem isInBoxUpdateEligibleMode]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v3 = objc_alloc_init((Class)MIBUClient);
  int v4 = v3;
  if (v3)
  {
    id v9 = 0;
    unsigned __int8 v5 = [v3 isInBoxUpdateMode:&v9];
    int v6 = (char *)v9;
    if (v6)
    {
      unsigned __int8 v7 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        long long v11 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to check if we are in in-box update eligible mode with error %@", buf, 0xCu);
      }
    }
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
}

- (CTXPCServiceSubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (void)setSubscriptionInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);

  objc_storeStrong((id *)&self->_telephonyClient, 0);
}

@end