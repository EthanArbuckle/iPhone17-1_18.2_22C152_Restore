@interface AFMyriadMetrics
+ (id)sharedInstance;
- (BOOL)isMyriadMetricsMessage:(id)a3;
- (double)getSessionId:(MyriadMetricsDataV1 *)a3;
- (id)_createEndAnalyticContexFromIntermediateContext:(id)a3 forVersion:(unsigned int)a4 sessionId:(double)a5;
- (id)_getRequestType:(unint64_t)a3;
- (id)getCDASessionId:(MyriadMetricsDataV1 *)a3;
- (int)_getCDASchemaCDATriggerType:(unint64_t)a3;
- (unsigned)getVersion:(MyriadMetricsDataV1 *)a3;
- (void)_decisionMadeContext:(MyriadMetricsDataV1 *)a3 additionalContext:(id)a4 instrumentation:(id)a5 completion:(id)a6;
- (void)_submitMyriadMetrics:(MyriadMetricsDataV1 *)a3 additionalContext:(id)a4 toStream:(id)a5 instrumentation:(id)a6 completion:(id)a7;
- (void)submitAccessoryMyriadMetricsToAnalyticsStream:(id)a3 payload:(id)a4 additionalContext:(id)a5 instrumentation:(id)a6 completion:(id)a7;
- (void)submitAccessoryMyriadMetricsToAnalyticsStream:(id)a3 payload:(id)a4 instrumentation:(id)a5 completion:(id)a6;
- (void)submitMyriadMetricsToAnalyticsStream:(id)a3 context:(id)a4 forEvent:(int64_t)a5 contextNoCopy:(BOOL)a6;
@end

@implementation AFMyriadMetrics

- (void)submitMyriadMetricsToAnalyticsStream:(id)a3 context:(id)a4 forEvent:(int64_t)a5 contextNoCopy:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v9 = a4;
  BOOL v10 = +[AFFeatureFlags isMyriadSelfMetricsEnabled];
  if (v11 && !v10) {
    [v11 logEventWithType:a5 context:v9 contextNoCopy:v6];
  }
}

- (void)submitAccessoryMyriadMetricsToAnalyticsStream:(id)a3 payload:(id)a4 additionalContext:(id)a5 instrumentation:(id)a6 completion:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void *, void))a7;
  if (v12)
  {
    v17 = [[AFMyriadAccessoryMetricMessage alloc] initWithMetricData:v13];
    if (v17)
    {
      v18 = v17;
      v19 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v20 = v19;
        *(_DWORD *)v24 = 136315906;
        *(void *)&v24[4] = "-[AFMyriadMetrics submitAccessoryMyriadMetricsToAnalyticsStream:payload:additionalContext:i"
                             "nstrumentation:completion:]";
        *(_WORD *)&v24[12] = 1024;
        *(_DWORD *)&v24[14] = [v18 version];
        __int16 v25 = 2048;
        id v26 = v12;
        __int16 v27 = 2112;
        *(void *)&long long v28 = v14;
        _os_log_impl(&dword_19CF1D000, v20, OS_LOG_TYPE_INFO, "%s version = %u analytics stream = %p additional = [%@]", v24, 0x26u);
      }
      objc_msgSend(v18, "messageAsStruct", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        v29);
      [(AFMyriadMetrics *)self _submitMyriadMetrics:v24 additionalContext:v14 toStream:v12 instrumentation:v15 completion:v16];
    }
    else
    {
      v22 = +[AFError errorWithCode:2202];
      if (v16) {
        v16[2](v16, v22, 0);
      }
      v23 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v24 = 136315138;
        *(void *)&v24[4] = "-[AFMyriadMetrics submitAccessoryMyriadMetricsToAnalyticsStream:payload:additionalContext:i"
                             "nstrumentation:completion:]";
        _os_log_error_impl(&dword_19CF1D000, v23, OS_LOG_TYPE_ERROR, "%s Invalid analytics data received", v24, 0xCu);
      }

      v18 = 0;
    }
  }
  else
  {
    v21 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v24 = 136315138;
      *(void *)&v24[4] = "-[AFMyriadMetrics submitAccessoryMyriadMetricsToAnalyticsStream:payload:additionalContext:ins"
                           "trumentation:completion:]";
      _os_log_error_impl(&dword_19CF1D000, v21, OS_LOG_TYPE_ERROR, "%s Invalid analytics stream.", v24, 0xCu);
    }
    v18 = +[AFError errorWithCode:2202];
    if (v16) {
      v16[2](v16, v18, 0);
    }
  }
}

- (void)submitAccessoryMyriadMetricsToAnalyticsStream:(id)a3 payload:(id)a4 instrumentation:(id)a5 completion:(id)a6
{
}

- (void)_decisionMadeContext:(MyriadMetricsDataV1 *)a3 additionalContext:(id)a4 instrumentation:(id)a5 completion:(id)a6
{
  v77[3] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, id))a6;
  if (v12)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (a3->version)
    {
      v66 = self;
      v67 = v12;
      v68 = v11;
      v69 = v10;
      v71 = a3;
      uint64_t electionParticipantCount = a3->electionParticipantCount;
      id v15 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", electionParticipantCount);
      [v13 setObject:v15 forKey:@"device_count"];

      v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:electionParticipantCount];
      uint64_t v72 = electionParticipantCount;
      v73 = v16;
      if (electionParticipantCount >= 0x32) {
        uint64_t v17 = 50;
      }
      else {
        uint64_t v17 = electionParticipantCount;
      }
      uint64_t v70 = v17;
      if (v17)
      {
        uint64_t v18 = v17;
        electionParticipantDeviceType = a3->electionParticipantDeviceType;
        do
        {
          id v20 = objc_alloc(MEMORY[0x1E4F1CA60]);
          v76[0] = @"dc";
          v21 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:*electionParticipantDeviceType];
          v77[0] = v21;
          v76[1] = @"pt";
          v22 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:electionParticipantDeviceType[50]];
          v77[1] = v22;
          v76[2] = @"goodness";
          v23 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:*(electionParticipantDeviceType - 50)];
          v77[2] = v23;
          v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:3];
          __int16 v25 = (void *)[v20 initWithDictionary:v24];

          v16 = v73;
          [v73 addObject:v25];

          ++electionParticipantDeviceType;
          --v18;
        }
        while (v18);
      }
      [v13 setObject:v16 forKey:@"goodness_scores"];
      if (v71->previousDecision) {
        id v26 = @"YES";
      }
      else {
        id v26 = @"NO";
      }
      [v13 setObject:v26 forKey:@"previous_decision"];
      __int16 v27 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", (unint64_t)v71->previousDecisionTime);
      [v13 setObject:v27 forKey:@"previous_decision_time"];

      if (v71->decision) {
        long long v28 = @"YES";
      }
      else {
        long long v28 = @"NO";
      }
      [v13 setObject:v28 forKey:@"decision"];
      if (v72)
      {
        uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"%hhu", v71->electionParticipantGoodnessScore[0]);
        [v13 setObject:v29 forKey:@"winner_goodness"];

        v30 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v71->electionParticipantDeviceType[0]);
        [v13 setObject:v30 forKey:@"winner_device_class"];

        v31 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v71->electionParticipantProductType[0]);
        [v13 setObject:v31 forKey:@"winner_product_type"];
      }
      if (v71->homepodInvolved) {
        v32 = @"YES";
      }
      else {
        v32 = @"NO";
      }
      [v13 setObject:v32 forKey:@"homepod_involved"];
      id v10 = v69;
      uint64_t v33 = v70;
      if (v72 && !v71->decision)
      {
        if (v71->electionParticipantGoodnessScore[0] == 255) {
          v34 = @"YES";
        }
        else {
          v34 = @"NO";
        }
        [v13 setObject:v34 forKey:@"winner_sent_suppresssion"];
      }
      unint64_t v35 = 0x1E4F28000uLL;
      v36 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:v71->version];
      [v13 setObject:v36 forKey:@"version"];

      if (v71->lateToElection)
      {
        v37 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedChar:");
        [v13 setObject:v37 forKey:@"late_for_device_arbitration"];

        v38 = [MEMORY[0x1E4F28ED0] numberWithDouble:v71->advInterval];
        [v13 setObject:v38 forKey:@"device_arbitration_delay"];
      }
      if (v69)
      {
        v39 = objc_msgSend(NSString, "stringWithFormat:", @"%hhu", objc_msgSend(v69, "rawGoodnessScore"));
        [v13 setObject:v39 forKey:@"raw_goodness_score"];

        v40 = objc_msgSend(NSString, "stringWithFormat:", @"%hhu", objc_msgSend(v69, "goodnessScore"));
        [v13 setObject:v40 forKey:@"my_goodness"];

        v41 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v69, "deviceClass"));
        [v13 setObject:v41 forKey:@"my_device_class"];

        v42 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v69, "deviceProductType"));
        [v13 setObject:v42 forKey:@"my_product_type"];
      }
      BOOL v43 = +[AFFeatureFlags isMyriadSelfMetricsEnabled];
      if (v11 && v43)
      {
        id v44 = objc_alloc_init(MEMORY[0x1E4FA0288]);
        [v44 setDeviceClass:v71->electionParticipantDeviceType[0]];
        [v44 setProductType:v71->electionParticipantProductType[0]];
        v65 = v44;
        [v44 setGoodnessScore:v71->electionParticipantGoodnessScore[0]];
        id v45 = objc_alloc_init(MEMORY[0x1E4FA0288]);
        objc_msgSend(v45, "setDeviceClass:", objc_msgSend(v69, "deviceClass"));
        objc_msgSend(v45, "setProductType:", objc_msgSend(v69, "deviceProductType"));
        v64 = v45;
        objc_msgSend(v45, "setGoodnessScore:", objc_msgSend(v69, "goodnessScore"));
        if (v70)
        {
          v46 = v71->electionParticipantDeviceType;
          uint64_t v47 = v70;
          do
          {
            id v48 = objc_alloc(MEMORY[0x1E4F1CA60]);
            v74[0] = @"dc";
            v49 = [*(id *)(v35 + 3792) numberWithUnsignedChar:*v46];
            v75[0] = v49;
            v74[1] = @"pt";
            v50 = [*(id *)(v35 + 3792) numberWithUnsignedChar:v46[50]];
            v75[1] = v50;
            v74[2] = @"goodness";
            v51 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:*(v46 - 50)];
            v75[2] = v51;
            v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:3];
            v53 = (void *)[v48 initWithDictionary:v52];

            unint64_t v35 = 0x1E4F28000;
            [v73 addObject:v53];

            ++v46;
            --v47;
          }
          while (v47);
        }
        v54 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v72];
        if (v70)
        {
          v55 = v71->electionParticipantDeviceType;
          do
          {
            id v56 = objc_alloc_init(MEMORY[0x1E4FA0288]);
            [v56 setDeviceClass:*v55];
            [v56 setProductType:v55[50]];
            [v56 setGoodnessScore:*(v55 - 50)];
            [v54 addObject:v56];

            ++v55;
            --v33;
          }
          while (v33);
        }
        if (v71->decision) {
          uint64_t v57 = 1;
        }
        else {
          uint64_t v57 = 2;
        }
        if (v71->previousDecision) {
          uint64_t v58 = 1;
        }
        else {
          uint64_t v58 = 2;
        }
        uint64_t v59 = mach_absolute_time();
        id v11 = v68;
        if (_AFMachAbsoluteTimeRate_onceToken != -1) {
          dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_973);
        }
        id v10 = v69;
        unint64_t v60 = (unint64_t)(((double)(unint64_t)(*(double *)&_AFMachAbsoluteTimeRate_rate * (double)v59)
                                - v71->previousDecisionTime)
                               / 1000000.0);
        int v61 = [v69 rawGoodnessScore];
        v62 = [(AFMyriadMetrics *)v66 getCDASessionId:v71];
        LODWORD(v63) = v61;
        [v68 logCDAElectionDecisionMade:11 withDecision:v57 withPreviousDecision:v58 timeSincePreviousDecision:v60 withWinningDevice:v65 withThisDevice:v64 withParticipants:v54 withRawScore:v63 withBoost:0 withCdaId:v62 currentRequestId:0 withTimestamp:mach_absolute_time()];

        v16 = v73;
      }

      id v12 = v67;
    }
    v12[2](v12, v13);
  }
}

- (void)_submitMyriadMetrics:(MyriadMetricsDataV1 *)a3 additionalContext:(id)a4 toStream:(id)a5 instrumentation:(id)a6 completion:(id)a7
{
  v109[2] = *MEMORY[0x1E4F143B8];
  id v83 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void (**)(id, void *, void *))a7;
  uint64_t v88 = 0;
  v89 = &v88;
  uint64_t v90 = 0x3032000000;
  v91 = __Block_byref_object_copy__23295;
  v92 = __Block_byref_object_dispose__23296;
  id v93 = 0;
  if (a3)
  {
    switch(a3->eventType)
    {
      case 0u:
        unint64_t requestType = a3->requestType;
        uint64_t state = a3->state;
        v108[0] = @"state";
        v16 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", state);
        v108[1] = @"trigger";
        v109[0] = v16;
        uint64_t v17 = [(AFMyriadMetrics *)self _getRequestType:requestType];
        v109[1] = v17;
        uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v109 forKeys:v108 count:2];
        uint64_t v19 = [(AFMyriadMetrics *)self getVersion:a3];
        [(AFMyriadMetrics *)self getSessionId:a3];
        uint64_t v20 = -[AFMyriadMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v18, v19);
        v21 = (void *)v89[5];
        v89[5] = v20;

        if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled]) {
          [v12 logEventWithType:2011 context:v89[5]];
        }
        int v22 = !+[AFFeatureFlags isMyriadSelfMetricsEnabled];
        if (!v13) {
          LOBYTE(v22) = 1;
        }
        if ((v22 & 1) == 0)
        {
          uint64_t v23 = [(AFMyriadMetrics *)self _getCDASchemaCDATriggerType:requestType];
          v24 = [(AFMyriadMetrics *)self getCDASessionId:a3];
          [v13 logCDADeviceStateActivityStartedOrChanged:(state + 1) withTrigger:v23 withCdaId:v24 withTimestamp:mach_absolute_time()];
        }
        break;
      case 1u:
        uint64_t v27 = a3->state;
        v106 = @"state";
        long long v28 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v27);
        v107 = v28;
        uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v107 forKeys:&v106 count:1];
        uint64_t v30 = [(AFMyriadMetrics *)self getVersion:a3];
        [(AFMyriadMetrics *)self getSessionId:a3];
        uint64_t v31 = -[AFMyriadMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v29, v30);
        v32 = (void *)v89[5];
        v89[5] = v31;

        if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled]) {
          [v12 logEventWithType:2012 context:v89[5]];
        }
        int v33 = !+[AFFeatureFlags isMyriadSelfMetricsEnabled];
        if (!v13) {
          LOBYTE(v33) = 1;
        }
        if ((v33 & 1) == 0)
        {
          v34 = [(AFMyriadMetrics *)self getCDASessionId:a3];
          [v13 logCDADeviceStateActivityEnded:(v27 + 1) withCdaId:v34 withTimestamp:mach_absolute_time()];
        }
        break;
      case 2u:
        uint64_t v35 = a3->state;
        double advDelay = a3->advDelay;
        double advInterval = a3->advInterval;
        v104[0] = @"state";
        int v81 = v35;
        v38 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v35);
        v105[0] = v38;
        v104[1] = @"adv-delay";
        v39 = [MEMORY[0x1E4F28ED0] numberWithDouble:advDelay];
        v105[1] = v39;
        v104[2] = @"adv-interval";
        v40 = [MEMORY[0x1E4F28ED0] numberWithDouble:advInterval];
        v105[2] = v40;
        v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:v104 count:3];
        uint64_t v42 = [(AFMyriadMetrics *)self getVersion:a3];
        [(AFMyriadMetrics *)self getSessionId:a3];
        uint64_t v43 = -[AFMyriadMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v41, v42);
        id v44 = (void *)v89[5];
        v89[5] = v43;

        if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled]) {
          [v12 logEventWithType:2002 context:v89[5]];
        }
        int v45 = !+[AFFeatureFlags isMyriadSelfMetricsEnabled];
        if (!v13) {
          LOBYTE(v45) = 1;
        }
        if ((v45 & 1) == 0)
        {
          v46 = [(AFMyriadMetrics *)self getCDASessionId:a3];
          uint64_t v47 = mach_absolute_time();
          *(float *)&double v48 = advDelay;
          *(float *)&double v49 = advInterval;
          [v13 logCDAElectionAdvertisingStarting:(v81 + 1) withDelay:v46 withInterval:v47 withCdaId:v48 withTimestamp:v49];
        }
        break;
      case 3u:
        uint64_t v50 = a3->state;
        v102 = @"state";
        v51 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v50);
        v103 = v51;
        v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v103 forKeys:&v102 count:1];
        uint64_t v53 = [(AFMyriadMetrics *)self getVersion:a3];
        [(AFMyriadMetrics *)self getSessionId:a3];
        uint64_t v54 = -[AFMyriadMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v52, v53);
        v55 = (void *)v89[5];
        v89[5] = v54;

        if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled]) {
          [v12 logEventWithType:2003 context:v89[5]];
        }
        int v56 = !+[AFFeatureFlags isMyriadSelfMetricsEnabled];
        if (!v13) {
          LOBYTE(v56) = 1;
        }
        if ((v56 & 1) == 0)
        {
          uint64_t v57 = [(AFMyriadMetrics *)self getCDASessionId:a3];
          [v13 logCDAElectionAdvertisingStarted:(v50 + 1) withCdaId:v57 withTimestamp:mach_absolute_time()];
        }
        break;
      case 4u:
        uint64_t v58 = a3->state;
        v100[0] = @"state";
        int v82 = v58;
        uint64_t v59 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v58);
        v100[1] = @"unixTime";
        v101[0] = v59;
        unint64_t v60 = (void *)MEMORY[0x1E4F28ED0];
        int v61 = [MEMORY[0x1E4F1C9C8] date];
        [v61 timeIntervalSince1970];
        v62 = objc_msgSend(v60, "numberWithDouble:");
        v101[1] = v62;
        uint64_t v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:2];
        uint64_t v64 = [(AFMyriadMetrics *)self getVersion:a3];
        [(AFMyriadMetrics *)self getSessionId:a3];
        uint64_t v65 = -[AFMyriadMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v63, v64);
        v66 = (void *)v89[5];
        v89[5] = v65;

        if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled]) {
          [v12 logEventWithType:2010 context:v89[5]];
        }
        int v67 = !+[AFFeatureFlags isMyriadSelfMetricsEnabled];
        if (!v13) {
          LOBYTE(v67) = 1;
        }
        if ((v67 & 1) == 0)
        {
          v68 = [(AFMyriadMetrics *)self getCDASessionId:a3];
          [v13 logCDAElectionTimerEnded:(v82 + 1) withCdaId:v68 withTimestamp:mach_absolute_time()];
        }
        break;
      case 5u:
        uint64_t v69 = a3->state;
        v98 = @"state";
        uint64_t v70 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v69);
        v99 = v70;
        v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
        uint64_t v72 = [(AFMyriadMetrics *)self getVersion:a3];
        [(AFMyriadMetrics *)self getSessionId:a3];
        uint64_t v73 = -[AFMyriadMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v71, v72);
        v74 = (void *)v89[5];
        v89[5] = v73;

        if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled]) {
          [v12 logEventWithType:2005 context:v89[5]];
        }
        int v75 = !+[AFFeatureFlags isMyriadSelfMetricsEnabled];
        if (!v13) {
          LOBYTE(v75) = 1;
        }
        if ((v75 & 1) == 0)
        {
          v76 = [(AFMyriadMetrics *)self getCDASessionId:a3];
          [v13 logCDAElectionAdvertisingEnded:(v69 + 1) withCdaId:v76 withTimestamp:mach_absolute_time()];
        }
        break;
      case 6u:
        v84[0] = MEMORY[0x1E4F143A8];
        v84[1] = 3221225472;
        v84[2] = __94__AFMyriadMetrics__submitMyriadMetrics_additionalContext_toStream_instrumentation_completion___block_invoke;
        v84[3] = &unk_1E5928760;
        v86 = &v88;
        v87 = a3;
        v84[4] = self;
        id v85 = v12;
        [(AFMyriadMetrics *)self _decisionMadeContext:a3 additionalContext:v83 instrumentation:v13 completion:v84];

        break;
      default:
        uint64_t v25 = 2201;
        goto LABEL_10;
    }
    id v26 = 0;
  }
  else
  {
    uint64_t v25 = 2202;
LABEL_10:
    id v26 = +[AFError errorWithCode:v25];
  }
  v77 = AFSiriLogContextMyriad;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextMyriad, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v79 = v89[5];
    *(_DWORD *)buf = 136315394;
    v95 = "-[AFMyriadMetrics _submitMyriadMetrics:additionalContext:toStream:instrumentation:completion:]";
    __int16 v96 = 2112;
    uint64_t v97 = v79;
    _os_log_debug_impl(&dword_19CF1D000, v77, OS_LOG_TYPE_DEBUG, "%s Myriad endpoint metrics context: %@", buf, 0x16u);
    if (!v14) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
  if (v14)
  {
LABEL_46:
    v78 = (void *)[(id)v89[5] copy];
    v14[2](v14, v26, v78);
  }
LABEL_47:

  _Block_object_dispose(&v88, 8);
}

uint64_t __94__AFMyriadMetrics__submitMyriadMetrics_additionalContext_toStream_instrumentation_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = a2;
  uint64_t v6 = [v3 getVersion:v4];
  [*(id *)(a1 + 32) getSessionId:*(void *)(a1 + 56)];
  uint64_t v7 = objc_msgSend(v3, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v5, v6);

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t result = +[AFFeatureFlags isMyriadSelfMetricsEnabled];
  if ((result & 1) == 0)
  {
    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    return [v11 logEventWithType:2006 context:v12];
  }
  return result;
}

- (id)_createEndAnalyticContexFromIntermediateContext:(id)a3 forVersion:(unsigned int)a4 sessionId:(double)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  [v9 addEntriesFromDictionary:v8];

  id v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v6];
  [v9 setObject:v10 forKey:@"version"];

  id v11 = [MEMORY[0x1E4F28ED0] numberWithDouble:a5];
  [v9 setObject:v11 forKey:@"session_id"];

  return v9;
}

- (id)getCDASessionId:(MyriadMetricsDataV1 *)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F29128]);
  id v5 = v4;
  if (a3)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"00000000-0000-0000-0000-%012u", a3->sessionId);
    uint64_t v7 = (void *)[v5 initWithUUIDString:v6];
  }
  else
  {
    uint64_t v7 = (void *)[v4 initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  }
  return v7;
}

- (BOOL)isMyriadMetricsMessage:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 objectForKeyedSubscript:@"accessoryMetrics"];
    if (v4)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (double)getSessionId:(MyriadMetricsDataV1 *)a3
{
  if (a3) {
    return (double)a3->sessionId;
  }
  else {
    return 0.0;
  }
}

- (unsigned)getVersion:(MyriadMetricsDataV1 *)a3
{
  if (a3) {
    return a3->version;
  }
  else {
    return 0;
  }
}

- (int)_getCDASchemaCDATriggerType:(unint64_t)a3
{
  if (a3 - 2 > 6) {
    return 0;
  }
  else {
    return dword_19D0E2628[a3 - 2];
  }
}

- (id)_getRequestType:(unint64_t)a3
{
  if (a3 - 2 > 6) {
    return @"Unknown";
  }
  else {
    return off_1E5928780[a3 - 2];
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_23344 != -1) {
    dispatch_once(&sharedInstance_onceToken_23344, &__block_literal_global_23345);
  }
  v2 = (void *)sharedInstance_metrics;
  return v2;
}

void __33__AFMyriadMetrics_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(AFMyriadMetrics);
  v1 = (void *)sharedInstance_metrics;
  sharedInstance_metrics = (uint64_t)v0;
}

@end