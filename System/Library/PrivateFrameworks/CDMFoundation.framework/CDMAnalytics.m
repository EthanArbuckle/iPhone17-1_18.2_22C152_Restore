@interface CDMAnalytics
+ (id)constructContextUpdateOutcome:(int)a3 numTurnsRollback:(int)a4 locale:(id)a5;
+ (void)recordCDMSetupFailureEvent:(id)a3 withError:(id)a4;
+ (void)recordCDMSetupSuccessEvent:(id)a3;
+ (void)recordContextUpdateOutcome:(int)a3 numTurnsRollback:(int)a4 locale:(id)a5;
+ (void)recordGraphFailureEvent:(id)a3 withError:(id)a4;
+ (void)recordGraphSuccessEvent:(id)a3 withTopParserId:(id)a4;
+ (void)recordReceivedNluRequestEvent:(id)a3 withNluRequest:(id)a4;
@end

@implementation CDMAnalytics

+ (void)recordCDMSetupSuccessEvent:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    AnalyticsSendEventLazy();
    v5 = v6;
  }
  else
  {
    v5 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "+[CDMAnalytics recordCDMSetupSuccessEvent:]";
      _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s [WARN]: Skipping recordCDMSetupSuccessEvent due to locale being nil.", buf, 0xCu);
    }
  }
}

+ (void)recordGraphFailureEvent:(id)a3 withError:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      v8 = [v6 domain];
      [v7 code];
    }
    else
    {
      v8 = @"UnknownErrorDomain";
    }
    id v10 = v5;
    v11 = v8;
    uint64_t v9 = v8;
    AnalyticsSendEventLazy();
  }
  else
  {
    uint64_t v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "+[CDMAnalytics recordGraphFailureEvent:withError:]";
      _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: Skipping recordGraphFailureEvent due to locale being nil.", buf, 0xCu);
    }
  }
}

id __50__CDMAnalytics_recordGraphFailureEvent_withError___block_invoke(void *a1)
{
  v6[4] = *MEMORY[0x263EF8340];
  v5[0] = @"locale";
  v5[1] = @"wasSuccessful";
  uint64_t v1 = a1[5];
  v6[0] = a1[4];
  v6[1] = MEMORY[0x263EFFA80];
  v6[2] = v1;
  v5[2] = @"errorDomain";
  v5[3] = @"errorCode";
  v2 = [NSNumber numberWithInteger:a1[6]];
  v6[3] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:4];

  return v3;
}

+ (void)recordGraphSuccessEvent:(id)a3 withTopParserId:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v8 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315138;
    v13 = "+[CDMAnalytics recordGraphSuccessEvent:withTopParserId:]";
    uint64_t v9 = "%s [WARN]: Skipping recordGraphSuccessEvent due to locale being nil.";
LABEL_8:
    _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, v9, buf, 0xCu);
    goto LABEL_9;
  }
  if (!v6)
  {
    v8 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315138;
    v13 = "+[CDMAnalytics recordGraphSuccessEvent:withTopParserId:]";
    uint64_t v9 = "%s [WARN]: Skipping recordGraphSuccessEvent due to parserId being nil.";
    goto LABEL_8;
  }
  id v10 = v5;
  id v11 = v7;
  AnalyticsSendEventLazy();

  v8 = v10;
LABEL_9:
}

id __56__CDMAnalytics_recordGraphSuccessEvent_withTopParserId___block_invoke(uint64_t a1)
{
  v5[3] = *MEMORY[0x263EF8340];
  v4[0] = @"locale";
  v4[1] = @"wasSuccessful";
  uint64_t v1 = *(void *)(a1 + 40);
  v5[0] = *(void *)(a1 + 32);
  v5[1] = MEMORY[0x263EFFA88];
  v4[2] = @"topParseParserId";
  v5[2] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

+ (void)recordCDMSetupFailureEvent:(id)a3 withError:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      v8 = [v6 domain];
      [v7 code];
    }
    else
    {
      v8 = @"UnknownErrorDomain";
    }
    id v10 = v5;
    id v11 = v8;
    uint64_t v9 = v8;
    AnalyticsSendEventLazy();
  }
  else
  {
    uint64_t v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "+[CDMAnalytics recordCDMSetupFailureEvent:withError:]";
      _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: Skipping recordCDMSetupFailureEvent due to locale being nil.", buf, 0xCu);
    }
  }
}

id __53__CDMAnalytics_recordCDMSetupFailureEvent_withError___block_invoke(void *a1)
{
  v6[4] = *MEMORY[0x263EF8340];
  v5[0] = @"locale";
  v5[1] = @"wasSuccessful";
  uint64_t v1 = a1[5];
  v6[0] = a1[4];
  v6[1] = MEMORY[0x263EFFA80];
  v6[2] = v1;
  v5[2] = @"errorDomain";
  v5[3] = @"errorCode";
  v2 = [NSNumber numberWithInteger:a1[6]];
  v6[3] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:4];

  return v3;
}

id __43__CDMAnalytics_recordCDMSetupSuccessEvent___block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  v4[0] = @"locale";
  v4[1] = @"wasSuccessful";
  v5[0] = v1;
  v5[1] = MEMORY[0x263EFFA88];
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

+ (void)recordContextUpdateOutcome:(int)a3 numTurnsRollback:(int)a4 locale:(id)a5
{
  id v6 = a5;
  id v5 = v6;
  AnalyticsSendEventLazy();
}

uint64_t __67__CDMAnalytics_recordContextUpdateOutcome_numTurnsRollback_locale___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) constructContextUpdateOutcome:*(unsigned int *)(a1 + 48) numTurnsRollback:*(unsigned int *)(a1 + 52) locale:*(void *)(a1 + 32)];
}

+ (id)constructContextUpdateOutcome:(int)a3 numTurnsRollback:(int)a4 locale:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v14[4] = *MEMORY[0x263EF8340];
  if ((a3 - 1) > 2) {
    id v6 = @"None";
  }
  else {
    id v6 = off_2647A56E0[a3 - 1];
  }
  v14[0] = v6;
  v13[0] = @"reformType";
  v13[1] = @"numTurnsRollback";
  v7 = NSNumber;
  v8 = (__CFString *)a5;
  uint64_t v9 = [v7 numberWithInt:v5];
  v14[1] = v9;
  v14[2] = @"success";
  v13[2] = @"status";
  v13[3] = @"locale";
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = @"nil";
  }
  v14[3] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
}

+ (void)recordReceivedNluRequestEvent:(id)a3 withNluRequest:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v8 = v5;
    id v9 = v6;
    AnalyticsSendEventLazy();

    v7 = v8;
  }
  else
  {
    v7 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "+[CDMAnalytics recordReceivedNluRequestEvent:withNluRequest:]";
      _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, "%s [WARN]: Skipping recordReceivedNluRequestEvent due to locale being nil.", buf, 0xCu);
    }
  }
}

id __61__CDMAnalytics_recordReceivedNluRequestEvent_withNluRequest___block_invoke(uint64_t a1)
{
  v9[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  v8[0] = @"locale";
  v8[1] = @"previousTurnCount";
  v9[0] = v2;
  id v3 = NSNumber;
  v4 = [v1 previousTurnInputs];
  id v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v9[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

@end