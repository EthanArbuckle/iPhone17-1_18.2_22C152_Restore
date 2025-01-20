@interface SGMIFollowUpAnalyzer
+ (id)_analyzeFeatureVector:(id)a3 withRegExpDictionary:(id)a4 forOutgoingMail:(BOOL)a5 withDetectedLanguage:(id)a6 withRegExLanguage:(id)a7 withCustomTimeRange:(BOOL)a8;
+ (id)_analyzeForFollowUpMailWithBody:(id)a3 isSent:(BOOL)a4 messageId:(id)a5 date:(id)a6;
+ (id)analyzeBody:(id)a3 forLanguage:(id)a4 forDate:(id)a5 withCustomTimeRange:(BOOL)a6;
+ (id)analyzeFeatureVector:(id)a3;
+ (id)analyzeForFollowUpMailWithBody:(id)a3 isSent:(BOOL)a4 messageId:(id)a5 date:(id)a6;
+ (id)analyzeIncomingMailFeatureVector:(id)a3;
+ (id)analyzeOutgoingMailFeatureVector:(id)a3;
+ (id)identifyFollowUpWarningFromSubject:(id)a3 body:(id)a4 date:(id)a5;
+ (void)logFollowUpStatsAndSetting;
+ (void)reportUserEngagement:(int64_t)a3 forWarning:(id)a4;
@end

@implementation SGMIFollowUpAnalyzer

+ (void)logFollowUpStatsAndSetting
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = +[SGSqlEntityStore defaultStore];
  v3 = [v2 sgmiFeatureStore];
  v4 = [v3 getNSDateForKey:@"lastSGMIFollowUpStatsAndSettingReportingDate"];
  if (v4)
  {
LABEL_2:
    [v4 timeIntervalSinceNow];
    if (v5 >= -2419200.0) {
      goto LABEL_15;
    }
    goto LABEL_8;
  }
  uint64_t v6 = [v2 getNSDateForKey:@"lastSGMIFollowUpStatsAndSettingReportingDate"];
  if (v6)
  {
    v7 = (void *)v6;
    [v3 setNSDate:v6 forKey:@"lastSGMIFollowUpStatsAndSettingReportingDate"];
    v4 = [v3 getNSDateForKey:@"lastSGMIFollowUpStatsAndSettingReportingDate"];

    if (!v4) {
      goto LABEL_15;
    }
    [v2 deleteValueForKey:@"lastSGMIFollowUpStatsAndSettingReportingDate"];
    goto LABEL_2;
  }
  v4 = 0;
LABEL_8:
  v8 = [v2 sgmiFeatureStore];
  v9 = [v8 followUpWarningStats];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1CB18]);
    v11 = (void *)[v10 initWithSuiteName:*MEMORY[0x1E4F601C0]];
    v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "BOOLForKey:", *MEMORY[0x1E4F600F0]) ^ 1);
    v13 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [v12 BOOLValue];
      v15 = @"disabled";
      if (v14) {
        v15 = @"enabled";
      }
      *(_DWORD *)buf = 138412290;
      v22 = v15;
      _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEFAULT, "SGMIFollowUpManager Sending an event to CoreAnalytics: FollowUp is %@", buf, 0xCu);
    }

    uint64_t v18 = MEMORY[0x1E4F143A8];
    v19 = v12;
    id v20 = v9;
    id v16 = v12;
    AnalyticsSendEventLazy();
    v17 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v18, 3221225472, __50__SGMIFollowUpAnalyzer_logFollowUpStatsAndSetting__block_invoke, &unk_1E65B7210);
    [v3 setNSDate:v17 forKey:@"lastSGMIFollowUpStatsAndSettingReportingDate"];
  }
LABEL_15:
}

id __50__SGMIFollowUpAnalyzer_logFollowUpStatsAndSetting__block_invoke(uint64_t a1)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v10[0] = v3;
  v9[0] = @"enabled";
  v9[1] = @"positiveEngagement";
  v4 = [v2 positiveEngagement];
  v10[1] = v4;
  v9[2] = @"noEngagement";
  double v5 = [*(id *)(a1 + 40) noEngagement];
  v10[2] = v5;
  v9[3] = @"negativeEngagement";
  uint64_t v6 = [*(id *)(a1 + 40) negativeEngagement];
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

+ (void)reportUserEngagement:(int64_t)a3 forWarning:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = &unk_1F2535838;
    v12[1] = &unk_1F2535850;
    v13[0] = @"positive";
    v13[1] = @"negative";
    v12[2] = &unk_1F2535868;
    v13[2] = @"no engagement";
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
    v8 = [NSNumber numberWithInteger:a3];
    v9 = [v7 objectForKeyedSubscript:v8];
    *(_DWORD *)buf = 138412290;
    int64_t v15 = (int64_t)v9;
    _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEFAULT, "SGMI received %@ feedback for follow up warning", buf, 0xCu);
  }
  if ((unint64_t)a3 > 1)
  {
    id v10 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v15 = a3;
      _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "[Follow Up] Engagement type %ld received is not supported.", buf, 0xCu);
    }
  }
  else
  {
    id v10 = +[SGSqlEntityStore defaultStore];
    v11 = [v10 sgmiFeatureStore];
    [v11 incrementUserEngagement:a3 == 1 forFollowUpWarning:v5];
  }
}

+ (id)analyzeIncomingMailFeatureVector:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[SGMIConfig defaultConfig];
  uint64_t v6 = [v4 mailMessage];
  v7 = [v6 textContentLanguageIdentifier];

  v8 = [MEMORY[0x1E4F1CA20] currentLocale];
  v9 = [v8 languageCode];

  if (v7
    && ([v5 detectors],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 objectForKeyedSubscript:v7],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    id v12 = v7;

    v9 = v12;
  }
  else if (!v9)
  {
    goto LABEL_7;
  }
  v13 = [v5 detectors];
  int v14 = [v13 objectForKeyedSubscript:v9];
  int64_t v15 = [v14 followUpOnIncomingMails];
  uint64_t v16 = [v15 body];

  if (v16)
  {
    v34 = &unk_1F2535820;
    v17 = [v5 detectors];
    uint64_t v18 = [v17 objectForKeyedSubscript:v9];
    v19 = [v18 followUpOnIncomingMails];
    id v20 = [v19 body];
    v35[0] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];

    goto LABEL_8;
  }
LABEL_7:
  v21 = (void *)MEMORY[0x1E4F1CC08];
LABEL_8:
  v22 = [v5 followUpWarningsParameters];
  uint64_t v23 = [v22 objectForKeyedSubscript:v9];
  v24 = [v23 objectForKeyedSubscript:computeCustomTimeRange];
  uint64_t v25 = [v24 BOOLValue];

  v26 = [MEMORY[0x1E4F5DAF0] followUpComputeCustomTimeRangeForLanguage:v9];

  if (v26)
  {
    v27 = [MEMORY[0x1E4F5DAF0] followUpComputeCustomTimeRangeForLanguage:v9];
    uint64_t v25 = [v27 BOOLValue];

    v28 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = [NSNumber numberWithBool:v25];
      int v32 = 138412290;
      v33 = v29;
      _os_log_impl(&dword_1CA650000, v28, OS_LOG_TYPE_DEFAULT, "[Follow Up] CustomTimeRange behavior specified in asset overriden by default setting. Value: %@", (uint8_t *)&v32, 0xCu);
    }
  }
  v30 = [a1 _analyzeFeatureVector:v4 withRegExpDictionary:v21 forOutgoingMail:0 withDetectedLanguage:v7 withRegExLanguage:v9 withCustomTimeRange:v25];

  return v30;
}

+ (id)analyzeOutgoingMailFeatureVector:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[SGMIConfig defaultConfig];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    v7 = [v4 mailMessage];
    v8 = [v7 textContentLanguageIdentifier];

    v9 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v10 = [v9 languageCode];

    if (v8
      && ([v5 detectors],
          v11 = objc_claimAutoreleasedReturnValue(),
          [v11 objectForKeyedSubscript:v8],
          id v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          v11,
          v12))
    {
      id v13 = v8;

      id v10 = v13;
    }
    else if (!v10)
    {
LABEL_10:
      v30 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = [v6 description];
        int v42 = 138412802;
        v43 = v8;
        __int16 v44 = 2112;
        v45 = v10;
        __int16 v46 = 2112;
        v47 = v31;
        _os_log_impl(&dword_1CA650000, v30, OS_LOG_TYPE_DEFAULT, "Follow Up. [analyzeOutgoingMailFeatureVector] detectedLanguage: %@ regExLanguage %@ regexes loaded: %@", (uint8_t *)&v42, 0x20u);
      }
      int v32 = [v5 followUpWarningsParameters];
      v33 = [v32 objectForKeyedSubscript:v10];
      v34 = [v33 objectForKeyedSubscript:computeCustomTimeRange];
      uint64_t v35 = [v34 BOOLValue];

      v36 = [MEMORY[0x1E4F5DAF0] followUpComputeCustomTimeRangeForLanguage:v10];

      if (v36)
      {
        v37 = [MEMORY[0x1E4F5DAF0] followUpComputeCustomTimeRangeForLanguage:v10];
        uint64_t v35 = [v37 BOOLValue];

        v38 = sgMailIntelligenceLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = [NSNumber numberWithBool:v35];
          int v42 = 138412290;
          v43 = v39;
          _os_log_impl(&dword_1CA650000, v38, OS_LOG_TYPE_DEFAULT, "[Follow Up] CustomTimeRange behavior specified in asset overriden by default setting. Value: %@", (uint8_t *)&v42, 0xCu);
        }
      }
      v40 = [a1 _analyzeFeatureVector:v4 withRegExpDictionary:v6 forOutgoingMail:1 withDetectedLanguage:v8 withRegExLanguage:v10 withCustomTimeRange:v35];

      goto LABEL_20;
    }
    int v14 = [v5 detectors];
    int64_t v15 = [v14 objectForKeyedSubscript:v10];
    uint64_t v16 = [v15 followUpOnOutgoingMailsQuestions];
    v17 = [v16 body];

    if (v17)
    {
      uint64_t v18 = [v5 detectors];
      v19 = [v18 objectForKeyedSubscript:v10];
      id v20 = [v19 followUpOnOutgoingMailsQuestions];
      v21 = [v20 body];
      [v6 setObject:v21 forKeyedSubscript:&unk_1F2535790];
    }
    v22 = [v5 detectors];
    uint64_t v23 = [v22 objectForKeyedSubscript:v10];
    v24 = [v23 followUpOnOutgoingMailsAsks];
    uint64_t v25 = [v24 body];

    if (v25)
    {
      v26 = [v5 detectors];
      v27 = [v26 objectForKeyedSubscript:v10];
      v28 = [v27 followUpOnOutgoingMailsAsks];
      v29 = [v28 body];
      [v6 setObject:v29 forKeyedSubscript:&unk_1F25357A8];
    }
    goto LABEL_10;
  }
  uint64_t v6 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v42) = 0;
    _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEFAULT, "Follow Up. [analyzeOutgoingMailFeatureVector] nil config. Follow Up processing aborted.", (uint8_t *)&v42, 2u);
  }
  v40 = 0;
LABEL_20:

  return v40;
}

+ (id)_analyzeForFollowUpMailWithBody:(id)a3 isSent:(BOOL)a4 messageId:(id)a5 date:(id)a6
{
  BOOL v8 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = v11;
  if (v9 && v10 && v11)
  {
    v23[0] = v9;
    v22[0] = @"body";
    v22[1] = @"isSent";
    id v13 = [NSNumber numberWithBool:v8];
    v23[1] = v13;
    v23[2] = v10;
    v22[2] = @"messageId";
    v22[3] = @"appleMailMessageId";
    v22[4] = @"date";
    v23[3] = &stru_1F24EEF20;
    v23[4] = v12;
    int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:5];

    int64_t v15 = [[SGSimpleMailMessage alloc] initWithMessageDictionary:v14];
    uint64_t v16 = [SGMIFeatureVector alloc];
    v17 = +[SGSqlEntityStore defaultStore];
    uint64_t v18 = [(SGMIFeatureVector *)v16 initWithMessageId:v10 hasHashedMessageId:0 simpleMailMessage:v15 senderConnectionScore:&unk_1F25357C0 biomeMessageSummary:0 store:v17 preLoadedFeatureNames:&unk_1F2536860];

    v19 = +[SGMIFollowUpAnalyzer analyzeFeatureVector:v18];
  }
  else
  {
    int v14 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [NSNumber numberWithInt:v9 == 0];
      *(_DWORD *)buf = 138740739;
      id v25 = v9;
      __int16 v26 = 2112;
      v27 = v20;
      __int16 v28 = 2112;
      id v29 = v10;
      __int16 v30 = 2112;
      v31 = v12;
      _os_log_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEFAULT, "Follow Up. [analyzeForFollowUpMailWithBody:isSent:messageId:date] Can't initialize mailDictionary: nil object. body: %{sensitive}@, isNil_body: %@, messageId: %@, date: %@", buf, 0x2Au);
    }
    v19 = 0;
  }

  return v19;
}

+ (id)analyzeForFollowUpMailWithBody:(id)a3 isSent:(BOOL)a4 messageId:(id)a5 date:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (analyzeForFollowUpMailWithBody_isSent_messageId_date___pasOnceToken30 != -1) {
    dispatch_once(&analyzeForFollowUpMailWithBody_isSent_messageId_date___pasOnceToken30, &__block_literal_global_9502);
  }
  id v13 = (id)analyzeForFollowUpMailWithBody_isSent_messageId_date___pasExprOnceResult;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__9503;
  v38 = __Block_byref_object_dispose__9504;
  id v39 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__SGMIFollowUpAnalyzer_analyzeForFollowUpMailWithBody_isSent_messageId_date___block_invoke_2;
  block[3] = &unk_1E65B71E8;
  v31 = &v34;
  id v32 = a1;
  id v14 = v10;
  id v28 = v14;
  BOOL v33 = a4;
  id v15 = v11;
  id v29 = v15;
  id v16 = v12;
  id v30 = v16;
  dispatch_block_t v17 = dispatch_block_create((dispatch_block_flags_t)0, block);
  dispatch_async(v13, v17);
  if ([MEMORY[0x1E4F93B18] waitForBlock:v17 timeoutSeconds:0.25] == 1)
  {
    uint64_t v18 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v18, OS_LOG_TYPE_ERROR, "SGMIFollowUpAnalyzer: Mail Intelligence's SPI back end timed out", buf, 2u);
    }

    if (analyzeForFollowUpMailWithBody_isSent_messageId_date___pasOnceToken32 != -1) {
      dispatch_once(&analyzeForFollowUpMailWithBody_isSent_messageId_date___pasOnceToken32, &__block_literal_global_89);
    }
    id v19 = (id)analyzeForFollowUpMailWithBody_isSent_messageId_date___pasExprOnceResult_86;
    id v20 = (void *)MEMORY[0x1E4F93B18];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __77__SGMIFollowUpAnalyzer_analyzeForFollowUpMailWithBody_isSent_messageId_date___block_invoke_2_91;
    v23[3] = &unk_1E65C0440;
    id v25 = v17;
    id v24 = v14;
    [v20 runAsyncOnQueue:v19 afterDelaySeconds:v23 block:5.0];

    id v21 = 0;
  }
  else
  {
    id v21 = (id)v35[5];
  }

  _Block_object_dispose(&v34, 8);
  return v21;
}

uint64_t __77__SGMIFollowUpAnalyzer_analyzeForFollowUpMailWithBody_isSent_messageId_date___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 64) _analyzeForFollowUpMailWithBody:*(void *)(a1 + 32) isSent:*(unsigned __int8 *)(a1 + 72) messageId:*(void *)(a1 + 40) date:*(void *)(a1 + 48)];
  return MEMORY[0x1F41817F8]();
}

uint64_t __77__SGMIFollowUpAnalyzer_analyzeForFollowUpMailWithBody_isSent_messageId_date___block_invoke_2_91(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t result = [MEMORY[0x1E4F93B18] waitForBlock:*(void *)(a1 + 40) timeoutSeconds:0.0];
  if (result == 1)
  {
    uint64_t v3 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      uint64_t v4 = [*(id *)(a1 + 32) length];
      int v5 = 134217984;
      uint64_t v6 = v4;
      _os_log_fault_impl(&dword_1CA650000, v3, OS_LOG_TYPE_FAULT, "SGMIFollowUpAnalyzer: Mail Intelligence's SPI back took over 5 seconds on a %tu-lengthed content: we have to xpc_transaction_exit_clean", (uint8_t *)&v5, 0xCu);
    }

    return xpc_transaction_exit_clean();
  }
  return result;
}

void __77__SGMIFollowUpAnalyzer_analyzeForFollowUpMailWithBody_isSent_messageId_date___block_invoke_87()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  dispatch_queue_t v1 = dispatch_queue_create("SGMIFollowUpAnalyzer-timeout", 0);
  v2 = (void *)analyzeForFollowUpMailWithBody_isSent_messageId_date___pasExprOnceResult_86;
  analyzeForFollowUpMailWithBody_isSent_messageId_date___pasExprOnceResult_86 = (uint64_t)v1;
}

void __77__SGMIFollowUpAnalyzer_analyzeForFollowUpMailWithBody_isSent_messageId_date___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  dispatch_queue_t v1 = dispatch_queue_create("SGMIFollowUpAnalyzer-processing", 0);
  v2 = (void *)analyzeForFollowUpMailWithBody_isSent_messageId_date___pasExprOnceResult;
  analyzeForFollowUpMailWithBody_isSent_messageId_date___pasExprOnceResult = (uint64_t)v1;
}

+ (id)identifyFollowUpWarningFromSubject:(id)a3 body:(id)a4 date:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138740483;
    id v16 = v8;
    __int16 v17 = 2117;
    id v18 = v9;
    __int16 v19 = 2117;
    id v20 = v10;
    _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEFAULT, "Follow Up. [identifyFollowUpWarningFromSubject:body:date] Computing warning for subject: %{sensitive}@ body:%{sensitive}@ date:%{sensitive}@", (uint8_t *)&v15, 0x20u);
  }

  if (v10)
  {
    id v12 = [a1 analyzeForFollowUpMailWithBody:v9 isSent:1 messageId:&stru_1F24EEF20 date:v10];
  }
  else
  {
    id v13 = [MEMORY[0x1E4F1C9C8] now];
    id v12 = [a1 analyzeForFollowUpMailWithBody:v9 isSent:1 messageId:&stru_1F24EEF20 date:v13];
  }
  return v12;
}

+ (id)_analyzeFeatureVector:(id)a3 withRegExpDictionary:(id)a4 forOutgoingMail:(BOOL)a5 withDetectedLanguage:(id)a6 withRegExLanguage:(id)a7 withCustomTimeRange:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v87 = a5;
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v91 = a3;
  id v90 = a4;
  id v88 = a6;
  id v12 = a7;
  id v13 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v91 messageId];
    int v15 = [NSNumber numberWithBool:v8];
    *(_DWORD *)buf = 138412803;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2117;
    *(void *)&buf[14] = v91;
    *(_WORD *)&buf[22] = 2112;
    v129 = v15;
    _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Analyze Feature Vector for messageId %@. Feature Vector: %{sensitive}@ with CustomRange %@", buf, 0x20u);
  }
  id v16 = +[SGMIConfig defaultConfig];
  __int16 v17 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v16;
    _os_log_impl(&dword_1CA650000, v17, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] SGMIConfig loaded: %@", buf, 0xCu);
  }

  id v18 = [v91 mailMessage];
  __int16 v19 = [v18 textContent];

  id v89 = v12;
  if (v90 && v16 && v19)
  {
    id v20 = [v16 followUpWarningsParameters];
    uint64_t v86 = [v20 objectForKeyedSubscript:safeguardingQuotedRegionsRegex];

    v85 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v86 options:1 error:0];
    uint64_t v21 = objc_msgSend(v85, "firstMatchInString:options:range:", v19, 0, 0, objc_msgSend(v19, "length"));
    v84 = v21;
    if (v21) {
      uint64_t v22 = [v21 range];
    }
    else {
      uint64_t v22 = [v19 length];
    }
    id v25 = [v19 substringToIndex:v22];

    __int16 v19 = [v25 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v129 = __Block_byref_object_copy__9503;
    *(void *)&long long v130 = __Block_byref_object_dispose__9504;
    *((void *)&v130 + 1) = 0;
    uint64_t v114 = 0;
    v115 = &v114;
    uint64_t v116 = 0x3032000000;
    v117 = __Block_byref_object_copy__9503;
    v118 = __Block_byref_object_dispose__9504;
    id v119 = 0;
    __int16 v26 = [v91 mailMessage];
    v27 = [v26 date];
    id v28 = v27;
    if (v27)
    {
      id v29 = v27;
    }
    else
    {
      id v29 = [MEMORY[0x1E4F1C9C8] now];
    }
    id v119 = v29;

    uint64_t v108 = 0;
    v109 = &v108;
    uint64_t v110 = 0x3032000000;
    v111 = __Block_byref_object_copy__9503;
    v112 = __Block_byref_object_dispose__9504;
    id v113 = 0;
    id v30 = (void *)v115[5];
    [v16 defaultTimeIntervalToStartWarningExposition];
    objc_msgSend(v30, "dateByAddingTimeInterval:");
    id v113 = (id)objc_claimAutoreleasedReturnValue();
    v106[0] = 0;
    v106[1] = v106;
    v106[2] = 0x3032000000;
    v106[3] = __Block_byref_object_copy__9503;
    v106[4] = __Block_byref_object_dispose__9504;
    id v107 = 0;
    id v107 = (id)v109[5];
    if ([v19 length])
    {
      v31 = (void *)MEMORY[0x1CB79B230]();
      id v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, objc_msgSend(v19, "length"));
      BOOL v33 = [v91 mailMessage];
      uint64_t v34 = [v33 quotedRegions];
      [v32 removeIndexes:v34];

      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __142__SGMIFollowUpAnalyzer__analyzeFeatureVector_withRegExpDictionary_forOutgoingMail_withDetectedLanguage_withRegExLanguage_withCustomTimeRange___block_invoke;
      v92[3] = &unk_1E65B71C0;
      id v35 = v32;
      id v93 = v35;
      id v94 = v19;
      BOOL v104 = v8;
      id v95 = v91;
      v100 = v106;
      v101 = &v108;
      id v96 = v16;
      id v97 = v89;
      v102 = &v114;
      BOOL v105 = v87;
      v103 = buf;
      id v98 = v97;
      id v99 = v88;
      [v90 enumerateKeysAndObjectsUsingBlock:v92];
    }
    uint64_t v36 = [*(id *)(*(void *)&buf[8] + 40) snippet];
    if (!v36) {
      goto LABEL_27;
    }
    v37 = [*(id *)(*(void *)&buf[8] + 40) signature];
    if (v37)
    {
      v38 = [*(id *)(*(void *)&buf[8] + 40) detectedLanguage];
      if (v38)
      {
        id v39 = [*(id *)(*(void *)&buf[8] + 40) startDate];
        BOOL v40 = v39 == 0;

        if (!v40)
        {
          v41 = sgMailIntelligenceLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            int v42 = *(void **)(*(void *)&buf[8] + 40);
            *(_DWORD *)v120 = 138739971;
            v121 = v42;
            _os_log_impl(&dword_1CA650000, v41, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Exiting the method. Warning found %{sensitive}@", v120, 0xCu);
          }
LABEL_30:

          v55 = [MEMORY[0x1E4F5DAF0] followUpTimeRangeForDebugging];
          BOOL v56 = [v55 count] == 0;

          if (!v56)
          {
            v57 = sgMailIntelligenceLogHandle();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              v58 = *(void **)(*(void *)&buf[8] + 40);
              *(_DWORD *)v120 = 138739971;
              v121 = v58;
              _os_log_impl(&dword_1CA650000, v57, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] followUpTimeRangeForDebugging was set in defaults settings. Overriding the custom time range for warning %{sensitive}@", v120, 0xCu);
            }

            [v16 defaultTimeIntervalToStartWarningExposition];
            double v60 = v59;
            [v16 defaultTimeIntervalForAWarning];
            double v62 = v61;
            v63 = [MEMORY[0x1E4F5DAF0] followUpTimeRangeForDebugging];
            v64 = [v63 objectForKeyedSubscript:@"startOffset"];

            if (v64)
            {
              v65 = [MEMORY[0x1E4F5DAF0] followUpTimeRangeForDebugging];
              v66 = [v65 objectForKeyedSubscript:@"startOffset"];
              [v66 doubleValue];
              double v60 = v67;
            }
            v68 = [MEMORY[0x1E4F5DAF0] followUpTimeRangeForDebugging];
            v69 = [v68 objectForKeyedSubscript:@"endOffset"];

            if (v69)
            {
              v70 = [MEMORY[0x1E4F5DAF0] followUpTimeRangeForDebugging];
              v71 = [v70 objectForKeyedSubscript:@"endOffset"];
              [v71 doubleValue];
              double v62 = v72;
            }
            v73 = [(id)v115[5] dateByAddingTimeInterval:v60];
            v74 = [v73 dateByAddingTimeInterval:v62];
            v75 = [*(id *)(*(void *)&buf[8] + 40) type];
            id v76 = objc_alloc(MEMORY[0x1E4F5DA68]);
            v77 = [*(id *)(*(void *)&buf[8] + 40) snippet];
            v78 = [*(id *)(*(void *)&buf[8] + 40) core];
            v79 = [*(id *)(*(void *)&buf[8] + 40) signature];
            uint64_t v80 = [v76 initWithSnippet:v77 core:v78 signature:v79 detectedLanguage:v88 isIncomingMessage:!v87 score:&unk_1F2535808 startDate:v73 startDateCore:0 endDate:v74 endDateCore:0];
            v81 = *(void **)(*(void *)&buf[8] + 40);
            *(void *)(*(void *)&buf[8] + 40) = v80;

            [*(id *)(*(void *)&buf[8] + 40) setType:v75];
          }
          id v24 = *(id *)(*(void *)&buf[8] + 40);
          _Block_object_dispose(v106, 8);

          _Block_object_dispose(&v108, 8);
          _Block_object_dispose(&v114, 8);

          _Block_object_dispose(buf, 8);
          uint64_t v23 = v86;
          goto LABEL_39;
        }
LABEL_27:
        v43 = sgMailIntelligenceLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v44 = NSNumber;
          v83 = [*(id *)(*(void *)&buf[8] + 40) snippet];
          v45 = [v44 numberWithInt:v83 == 0];
          __int16 v46 = NSNumber;
          v47 = [*(id *)(*(void *)&buf[8] + 40) signature];
          uint64_t v48 = [v46 numberWithInt:v47 == 0];
          v49 = NSNumber;
          v50 = [*(id *)(*(void *)&buf[8] + 40) detectedLanguage];
          v51 = [v49 numberWithInt:v50 == 0];
          v52 = NSNumber;
          v53 = [*(id *)(*(void *)&buf[8] + 40) startDate];
          v54 = [v52 numberWithInt:v53 == 0];
          *(_DWORD *)v120 = 138413058;
          v121 = v45;
          __int16 v122 = 2112;
          v123 = v48;
          __int16 v124 = 2112;
          v125 = v51;
          __int16 v126 = 2112;
          v127 = v54;
          _os_log_impl(&dword_1CA650000, v43, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Warning not raised, as one of the following is nil. isNil_snippet: %@, isNil_signature: %@, isNil_detectedLanguage: %@, isNil_startDate: %@", v120, 0x2Au);
        }
        v41 = *(NSObject **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = 0;
        goto LABEL_30;
      }
    }
    goto LABEL_27;
  }
  uint64_t v23 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413059;
    *(void *)&uint8_t buf[4] = v89;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2117;
    v129 = (uint64_t (*)(uint64_t, uint64_t))v19;
    LOWORD(v130) = 2112;
    *(void *)((char *)&v130 + 2) = v90;
    _os_log_impl(&dword_1CA650000, v23, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Aborting computation. Language %@, Config %@, Body %{sensitive}@, RegExpDictionary %@", buf, 0x2Au);
  }
  id v24 = 0;
LABEL_39:

  return v24;
}

void __142__SGMIFollowUpAnalyzer__analyzeFeatureVector_withRegExpDictionary_forOutgoingMail_withDetectedLanguage_withRegExLanguage_withCustomTimeRange___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v8;
    _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector][RegEx loop] Checking for a match in RegEx: %@", buf, 0xCu);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __142__SGMIFollowUpAnalyzer__analyzeFeatureVector_withRegExpDictionary_forOutgoingMail_withDetectedLanguage_withRegExLanguage_withCustomTimeRange___block_invoke_54;
  void v13[3] = &unk_1E65B7198;
  id v14 = v8;
  id v10 = *(void **)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  char v25 = *(unsigned char *)(a1 + 120);
  id v16 = *(id *)(a1 + 48);
  long long v22 = *(_OWORD *)(a1 + 88);
  id v17 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 64);
  char v26 = *(unsigned char *)(a1 + 121);
  long long v23 = *(_OWORD *)(a1 + 104);
  id v19 = *(id *)(a1 + 72);
  id v20 = *(id *)(a1 + 80);
  id v21 = v7;
  uint64_t v24 = a4;
  id v11 = v7;
  id v12 = v8;
  [v10 enumerateRangesUsingBlock:v13];
}

void __142__SGMIFollowUpAnalyzer__analyzeFeatureVector_withRegExpDictionary_forOutgoingMail_withDetectedLanguage_withRegExLanguage_withCustomTimeRange___block_invoke_54(uint64_t a1, NSUInteger a2, NSUInteger a3, unsigned char *a4)
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  v96.NSUInteger length = a3;
  context = (void *)MEMORY[0x1CB79B230]();
  v96.NSUInteger location = a2;
  id v98 = objc_msgSend(*(id *)(a1 + 32), "matchForString:withinRange:", *(void *)(a1 + 40), __PAIR128__(v96.length, a2));
  uint64_t v115 = 0;
  uint64_t v116 = (NSRange *)&v115;
  uint64_t v117 = 0x3010000000;
  uint64_t v119 = 0;
  uint64_t v120 = 0;
  v118 = "";
  uint64_t v119 = [v98 range];
  uint64_t v120 = v6;
  id v7 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138739971;
    *(void *)((char *)&buf + 4) = v98;
    _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Match found: %{sensitive}@", (uint8_t *)&buf, 0xCu);
  }

  id v8 = v98;
  if (v98)
  {
    id v8 = v98;
    if ([v98 location] != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (*(unsigned char *)(a1 + 136))
      {
        id v9 = sgMailIntelligenceLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138739971;
          *(void *)((char *)&buf + 4) = v98;
          _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Match valid: %{sensitive}@", (uint8_t *)&buf, 0xCu);
        }

        NSUInteger v10 = [v98 location];
        uint64_t v11 = [v98 range];
        v131.NSUInteger length = v12 + v11 + 64;
        v130.NSUInteger location = a2;
        v130.NSUInteger length = v96.length;
        v131.NSUInteger location = v10;
        NSRange v13 = NSIntersectionRange(v130, v131);
        id v14 = sgMailIntelligenceLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = *(void **)(a1 + 40);
          uint64_t v16 = [v98 range];
          id v18 = objc_msgSend(v15, "substringWithRange:", v16, v17);
          LODWORD(buf) = 138739971;
          *(void *)((char *)&buf + 4) = v18;
          _os_log_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Looking for a potential time reference in: %{sensitive}@", (uint8_t *)&buf, 0xCu);
        }
        if (v13.length)
        {
          uint64_t v19 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v13.location, v13.length);
          id v20 = [*(id *)(a1 + 48) mailMessage];
          id v21 = [v20 date];
          long long v22 = +[SGDataDetectorMatch detectionsInPlainText:v19 baseDate:v21];
          id v94 = (void *)v19;

          long long v23 = sgMailIntelligenceLogHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1CA650000, v23, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Exploring Data Detector matches.", (uint8_t *)&buf, 2u);
          }

          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v125 = 0x3032000000;
          __int16 v126 = __Block_byref_object_copy__9503;
          v127 = __Block_byref_object_dispose__9504;
          id v128 = 0;
          id v128 = [MEMORY[0x1E4F1C9C8] distantFuture];
          long long v111 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          long long v114 = 0u;
          id v24 = v22;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v111 objects:v123 count:16];
          if (v25)
          {
            uint64_t v26 = *(void *)v112;
            do
            {
              for (uint64_t i = 0; i != v25; ++i)
              {
                if (*(void *)v112 != v26) {
                  objc_enumerationMutation(v24);
                }
                if ([*(id *)(*((void *)&v111 + 1) + 8 * i) matchType] == 3)
                {
                  id v28 = [v24 objectAtIndexedSubscript:0];
                  uint64_t v29 = [v28 detectedDate];
                  uint64_t v30 = *(void *)(*(void *)(a1 + 96) + 8);
                  v31 = *(void **)(v30 + 40);
                  *(void *)(v30 + 40) = v29;

                  if ([*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) compare:*(void *)(*((void *)&buf + 1) + 40)] == -1)
                  {
                    uint64_t v33 = *(void *)(*(void *)(a1 + 96) + 8);
                    uint64_t v32 = *((void *)&buf + 1);
                  }
                  else
                  {
                    uint64_t v32 = *((void *)&buf + 1);
                    uint64_t v33 = *((void *)&buf + 1);
                  }
                  objc_storeStrong((id *)(v32 + 40), *(id *)(v33 + 40));
                  NSUInteger location = v116[2].location;
                  NSUInteger length = v116[2].length;
                  uint64_t v36 = [v24 objectAtIndexedSubscript:0];
                  uint64_t v37 = [v36 range];
                  uint64_t v39 = v38;

                  NSUInteger v40 = v37 + v39;
                  v41 = v116;
                  if (length > v37 + v39) {
                    NSUInteger v40 = length;
                  }
                  v116[2].NSUInteger location = location;
                  v41[2].NSUInteger length = v40;
                }
              }
              uint64_t v25 = [v24 countByEnumeratingWithState:&v111 objects:v123 count:16];
            }
            while (v25);
          }

          int v42 = *(void **)(*((void *)&buf + 1) + 40);
          v43 = [*(id *)(a1 + 48) mailMessage];
          __int16 v44 = [v43 date];
          BOOL v45 = [v42 compare:v44] == -1;

          if (v45) {
            objc_storeStrong((id *)(*((void *)&buf + 1) + 40), *(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40));
          }
          __int16 v46 = sgMailIntelligenceLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v47 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
            *(_DWORD *)v121 = 138739971;
            uint64_t v122 = v47;
            _os_log_impl(&dword_1CA650000, v46, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Exploration Data Detector matches finished. Warning start date %{sensitive}@", v121, 0xCu);
          }

          uint64_t v48 = sgMailIntelligenceLogHandle();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v121 = 0;
            _os_log_impl(&dword_1CA650000, v48, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Exploring Data Detector Mapped Additions matches.", v121, 2u);
          }

          v49 = [*(id *)(a1 + 56) detectors];
          v50 = [v49 objectForKeyedSubscript:*(void *)(a1 + 64)];
          v51 = [v50 followUpOnIncomingMails];
          v52 = [v51 dataDetectorMappedAdditions];
          v105[0] = MEMORY[0x1E4F143A8];
          v105[1] = 3221225472;
          v105[2] = __142__SGMIFollowUpAnalyzer__analyzeFeatureVector_withRegExpDictionary_forOutgoingMail_withDetectedLanguage_withRegExLanguage_withCustomTimeRange___block_invoke_56;
          v105[3] = &unk_1E65B7148;
          id v53 = v94;
          uint64_t v54 = *(void *)(a1 + 96);
          id v106 = v53;
          uint64_t v108 = v54;
          id v107 = *(id *)(a1 + 48);
          p_long long buf = &buf;
          uint64_t v110 = &v115;
          [v52 enumerateKeysAndObjectsUsingBlock:v105];

          v55 = sgMailIntelligenceLogHandle();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v56 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
            *(_DWORD *)v121 = 138739971;
            uint64_t v122 = v56;
            _os_log_impl(&dword_1CA650000, v55, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Exploration Data Detector Mapped Additions matches finished. Warning start date %{sensitive}@", v121, 0xCu);
          }

          v57 = sgMailIntelligenceLogHandle();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v121 = 0;
            _os_log_impl(&dword_1CA650000, v57, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Exploring Data Detector Additions matches.", v121, 2u);
          }

          v58 = [*(id *)(a1 + 56) detectors];
          double v59 = [v58 objectForKeyedSubscript:*(void *)(a1 + 64)];
          double v60 = [v59 followUpOnIncomingMails];
          double v61 = [v60 dataDetectorAdditions];
          v99[0] = MEMORY[0x1E4F143A8];
          v99[1] = 3221225472;
          v99[2] = __142__SGMIFollowUpAnalyzer__analyzeFeatureVector_withRegExpDictionary_forOutgoingMail_withDetectedLanguage_withRegExLanguage_withCustomTimeRange___block_invoke_58;
          v99[3] = &unk_1E65B7170;
          id v62 = v53;
          uint64_t v63 = *(void *)(a1 + 96);
          id v100 = v62;
          uint64_t v102 = v63;
          id v101 = *(id *)(a1 + 48);
          v103 = &buf;
          BOOL v104 = &v115;
          [v61 enumerateKeysAndObjectsUsingBlock:v99];

          v64 = sgMailIntelligenceLogHandle();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v65 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
            *(_DWORD *)v121 = 138739971;
            uint64_t v122 = v65;
            _os_log_impl(&dword_1CA650000, v64, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Exploration Data Detector Additions matches finished. Warning start date %{sensitive}@", v121, 0xCu);
          }

          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), *(id *)(*((void *)&buf + 1) + 40));
          v66 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
          double v67 = [*(id *)(a1 + 48) mailMessage];
          v68 = [v67 date];
          BOOL v69 = [v66 compare:v68] == -1;

          if (v69) {
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40));
          }
          v70 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
          v71 = [MEMORY[0x1E4F1C9C8] distantFuture];
          if (v70 == v71)
          {
            uint64_t v73 = *(void *)(*(void *)(a1 + 104) + 8);
            uint64_t v72 = *(void *)(*(void *)(a1 + 96) + 8);
          }
          else
          {
            uint64_t v72 = *(void *)(*(void *)(a1 + 96) + 8);
            uint64_t v73 = v72;
          }
          objc_storeStrong((id *)(v72 + 40), *(id *)(v73 + 40));

          if (*(unsigned char *)(a1 + 137)
            && [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) compare:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)] == -1)
          {
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40));
          }
          NSRange v74 = NSIntersectionRange(v96, v116[2]);
          v116[2] = v74;

          _Block_object_dispose(&buf, 8);
        }
      }
      id v75 = [NSString alloc];
      if (v116[2].location) {
        id v76 = @"…";
      }
      else {
        id v76 = &stru_1F24EEF20;
      }
      v77 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:");
      v78 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      uint64_t v79 = [v77 stringByTrimmingCharactersInSet:v78];
      uint64_t v80 = (void *)v79;
      if (v116[2].length + v116[2].location >= v96.location + v96.length) {
        v81 = &stru_1F24EEF20;
      }
      else {
        v81 = @"…";
      }
      v82 = (void *)[v75 initWithFormat:@"%@%@%@", v76, v79, v81];

      id v83 = objc_alloc(MEMORY[0x1E4F5DA68]);
      id v84 = [NSString alloc];
      uint64_t v85 = *(void *)(a1 + 72);
      uint64_t v86 = [v98 signature];
      BOOL v87 = (void *)[v84 initWithFormat:@"%@-%@", v85, v86];
      uint64_t v88 = *(void *)(a1 + 80);
      LODWORD(v85) = *(unsigned __int8 *)(a1 + 137);
      id v89 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
      [*(id *)(a1 + 56) defaultTimeIntervalForAWarning];
      id v90 = objc_msgSend(v89, "dateByAddingTimeInterval:");
      uint64_t v91 = [v83 initWithSnippet:v82 core:v82 signature:v87 detectedLanguage:v88 isIncomingMessage:v85 == 0 score:&unk_1F2535808 startDate:v89 startDateCore:0 endDate:v90 endDateCore:0];
      uint64_t v92 = *(void *)(*(void *)(a1 + 120) + 8);
      id v93 = *(void **)(v92 + 40);
      *(void *)(v92 + 40) = v91;

      [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) setType:*(void *)(a1 + 88)];
      if (!*(unsigned char *)(a1 + 136))
      {
        *a4 = 1;
        **(unsigned char **)(a1 + 128) = 1;
      }

      id v8 = v98;
    }
  }
  _Block_object_dispose(&v115, 8);
}

void __142__SGMIFollowUpAnalyzer__analyzeFeatureVector_withRegExpDictionary_forOutgoingMail_withDetectedLanguage_withRegExLanguage_withCustomTimeRange___block_invoke_56(uint64_t a1, void *a2, void *a3)
{
  id v21 = a3;
  int v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = objc_msgSend(v6, "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  uint64_t v9 = v8;

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v10 = [*(id *)(a1 + 40) mailMessage];
    uint64_t v11 = [v10 date];
    uint64_t v12 = +[SGDataDetectorMatch detectionsInPlainText:v21 baseDate:v11];
    NSRange v13 = [v12 objectAtIndexedSubscript:0];
    uint64_t v14 = [v13 detectedDate];
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) compare:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)] == -1)
    {
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    }
    else
    {
      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v18 = v17;
    }
    objc_storeStrong((id *)(v17 + 40), *(id *)(v18 + 40));
    uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
    unint64_t v20 = *(void *)(v19 + 40);
    if (v20 <= v7 + v9) {
      unint64_t v20 = v7 + v9;
    }
    *(void *)(v19 + 40) = v20;
  }
}

void __142__SGMIFollowUpAnalyzer__analyzeFeatureVector_withRegExpDictionary_forOutgoingMail_withDetectedLanguage_withRegExLanguage_withCustomTimeRange___block_invoke_58(uint64_t a1, void *a2, void *a3)
{
  id v19 = a3;
  int v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = objc_msgSend(v6, "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  uint64_t v9 = v8;

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v10 = [*(id *)(a1 + 40) mailMessage];
    uint64_t v11 = [v10 date];
    [v19 doubleValue];
    uint64_t v12 = objc_msgSend(v11, "dateByAddingTimeInterval:");
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) compare:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)] == -1)
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    }
    else
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v16 = v15;
    }
    objc_storeStrong((id *)(v15 + 40), *(id *)(v16 + 40));
    uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
    unint64_t v18 = *(void *)(v17 + 40);
    if (v18 <= v7 + v9) {
      unint64_t v18 = v7 + v9;
    }
    *(void *)(v17 + 40) = v18;
  }
}

+ (id)analyzeBody:(id)a3 forLanguage:(id)a4 forDate:(id)a5 withCustomTimeRange:(BOOL)a6
{
  BOOL v38 = a6;
  v40[5] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[SGMIConfig defaultConfig];
  uint64_t v12 = objc_opt_new();
  uint64_t v13 = [v11 detectors];
  uint64_t v14 = [v13 objectForKeyedSubscript:v9];
  uint64_t v15 = [v14 followUpOnOutgoingMailsQuestions];
  uint64_t v16 = [v15 body];

  if (v16)
  {
    uint64_t v17 = [v11 detectors];
    unint64_t v18 = [v17 objectForKeyedSubscript:v9];
    id v19 = [v18 followUpOnOutgoingMailsQuestions];
    unint64_t v20 = [v19 body];
    [v12 setObject:v20 forKeyedSubscript:&unk_1F2535790];
  }
  id v21 = [v11 detectors];
  long long v22 = [v21 objectForKeyedSubscript:v9];
  long long v23 = [v22 followUpOnOutgoingMailsAsks];
  id v24 = [v23 body];

  if (v24)
  {
    uint64_t v25 = [v11 detectors];
    uint64_t v26 = [v25 objectForKeyedSubscript:v9];
    v27 = [v26 followUpOnOutgoingMailsAsks];
    id v28 = [v27 body];
    [v12 setObject:v28 forKeyedSubscript:&unk_1F25357A8];
  }
  v39[0] = @"body";
  v39[1] = @"isSent";
  v40[0] = v8;
  v40[1] = MEMORY[0x1E4F1CC38];
  v39[2] = @"messageId";
  v39[3] = @"appleMailMessageId";
  v40[2] = &stru_1F24EEF20;
  v40[3] = &stru_1F24EEF20;
  v39[4] = @"date";
  uint64_t v29 = v10;
  if (!v10)
  {
    uint64_t v29 = [MEMORY[0x1E4F1C9C8] now];
  }
  v40[4] = v29;
  uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:5];
  if (!v10) {

  }
  v31 = [[SGSimpleMailMessage alloc] initWithMessageDictionary:v30];
  uint64_t v32 = [SGMIFeatureVector alloc];
  uint64_t v33 = +[SGSqlEntityStore defaultStore];
  uint64_t v34 = [(SGMIFeatureVector *)v32 initWithMessageId:&stru_1F24EEF20 hasHashedMessageId:0 simpleMailMessage:v31 senderConnectionScore:&unk_1F25357C0 biomeMessageSummary:0 store:v33 preLoadedFeatureNames:&unk_1F2536848];

  id v35 = [a1 _analyzeFeatureVector:v34 withRegExpDictionary:v12 forOutgoingMail:1 withDetectedLanguage:v9 withRegExLanguage:v9 withCustomTimeRange:v38];

  return v35;
}

+ (id)analyzeFeatureVector:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [v3 messageId];
    int v12 = 138412547;
    uint64_t v13 = v5;
    __int16 v14 = 2117;
    id v15 = v3;
    _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEFAULT, "Follow Up. [analyzeFeatureVector] Analyze Feature Vector with messageId %@. Feature Vector: %{sensitive}@", (uint8_t *)&v12, 0x16u);
  }
  id v6 = [v3 mailMessage];
  if ([v6 isSent]) {
    +[SGMIFollowUpAnalyzer analyzeOutgoingMailFeatureVector:v3];
  }
  else {
  uint64_t v7 = +[SGMIFollowUpAnalyzer analyzeIncomingMailFeatureVector:v3];
  }

  id v8 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138739971;
    uint64_t v13 = v7;
    _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEFAULT, "Follow Up. [analyzeFeatureVector] Storing Detection Stats for Warning  %{sensitive}@", (uint8_t *)&v12, 0xCu);
  }

  id v9 = +[SGSqlEntityStore defaultStore];
  id v10 = [v9 sgmiFeatureStore];
  [v10 updateFollowUpDetectionStatsWithWarning:v7];

  return v7;
}

@end