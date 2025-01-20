@interface AFMyriadInstrumentation
- (AFMyriadInstrumentation)init;
- (CDASchemaCDAScoreBoosters)currentBoost;
- (id)_boostTypeAsString:(unsigned __int8)a3;
- (id)_createSchemaClientEvent:(id)a3;
- (void)_logRequestLinkMessageRequestId:(id)a3 cdaId:(id)a4;
- (void)_sendAndLogClientEvent:(id)a3 stState:(int)a4 atTimestamp:(unint64_t)a5;
- (void)getPreviousBoostsWithCompletion:(id)a3;
- (void)logCDADeviceStateActivityEnded:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5;
- (void)logCDADeviceStateActivityStartedOrChanged:(int)a3 withTrigger:(int)a4 withCdaId:(id)a5 withTimestamp:(unint64_t)a6;
- (void)logCDAElectionAdvertisingEnded:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5;
- (void)logCDAElectionAdvertisingEnding:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5;
- (void)logCDAElectionAdvertisingStarted:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5;
- (void)logCDAElectionAdvertisingStarting:(int)a3 withDelay:(float)a4 withInterval:(float)a5 withCdaId:(id)a6 withTimestamp:(unint64_t)a7;
- (void)logCDAElectionDecisionMade:(int)a3 withDecision:(int)a4 withPreviousDecision:(int)a5 timeSincePreviousDecision:(unint64_t)a6 withWinningDevice:(id)a7 withThisDevice:(id)a8 withParticipants:(id)a9 withRawScore:(unsigned int)a10 withBoost:(id)a11 withCdaId:(id)a12 currentRequestId:(id)a13 withTimestamp:(unint64_t)a14;
- (void)logCDAElectionDecisionMadeDebug:(int)a3 withCrossDeviceArbitrationAllowed:(BOOL)a4 advertisementData:(id)a5 withDeviceGroup:(unsigned int)a6 withCdaId:(id)a7 withTimestamp:(unint64_t)a8;
- (void)logCDAElectionTimerEnded:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5;
- (void)resetCurrentBoost;
- (void)updateBoost:(unsigned __int8)a3 value:(unsigned int)a4;
- (void)updateIsTrump:(BOOL)a3 withReason:(int)a4;
@end

@implementation AFMyriadInstrumentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousBoosts, 0);
  objc_storeStrong((id *)&self->_currentBoost, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_logRequestLinkMessageRequestId:(id)a3 cdaId:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    queue = self->_queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__AFMyriadInstrumentation__logRequestLinkMessageRequestId_cdaId___block_invoke;
    v11[3] = &unk_1E592C710;
    id v12 = v7;
    id v13 = v6;
    dispatch_async(queue, v11);
  }
  else
  {
    v10 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[AFMyriadInstrumentation _logRequestLinkMessageRequestId:cdaId:]";
      _os_log_debug_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_DEBUG, "%s Skipped emitting RequestLinkEvent as requestId or cdaId is nil", buf, 0xCu);
    }
  }
}

void __65__AFMyriadInstrumentation__logRequestLinkMessageRequestId_cdaId___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) UUIDString];
  v3 = ADCreateRequestLinkInfo(v2, 23);

  v4 = [*(id *)(a1 + 40) UUIDString];
  v5 = ADCreateRequestLinkInfo(v4, 1);

  ADEmitRequestLinkEventMessage(v3, v5);
  id v6 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 136315650;
    v10 = "-[AFMyriadInstrumentation _logRequestLinkMessageRequestId:cdaId:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_debug_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_DEBUG, "%s Emitting Myriad RequestLinkEvent with requestId: %@, cdaId: %@", (uint8_t *)&v9, 0x20u);
  }
}

- (id)_createSchemaClientEvent:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4FA0218];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v4];

  id v7 = objc_alloc_init(MEMORY[0x1E4FA0220]);
  [v7 setCdaId:v6];
  [v5 setEventMetadata:v7];

  return v5;
}

- (void)updateIsTrump:(BOOL)a3 withReason:(int)a4
{
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__AFMyriadInstrumentation_updateIsTrump_withReason___block_invoke;
  v5[3] = &unk_1E5929898;
  v5[4] = self;
  BOOL v7 = a3;
  int v6 = a4;
  dispatch_async(queue, v5);
}

void __52__AFMyriadInstrumentation_updateIsTrump_withReason___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4FA0290]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  [v2 setIsTrump:*(unsigned __int8 *)(a1 + 44)];
  [*(id *)(*(void *)(a1 + 32) + 16) setTrumpReason:*(unsigned int *)(a1 + 40)];
  int v6 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    int v7 = *(unsigned __int8 *)(a1 + 44);
    unsigned int v8 = *(_DWORD *)(a1 + 40) - 1;
    if (v8 > 7) {
      int v9 = @"CDATRUMPREASON_UNKNOWN";
    }
    else {
      int v9 = off_1E59299C0[v8];
    }
    int v11 = 136315650;
    uint64_t v12 = "-[AFMyriadInstrumentation updateIsTrump:withReason:]_block_invoke";
    __int16 v13 = 1024;
    int v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    v10 = v6;
    _os_log_debug_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_DEBUG, "%s trump: %d, with Reason:%@", (uint8_t *)&v11, 0x1Cu);
  }
}

- (void)updateBoost:(unsigned __int8)a3 value:(unsigned int)a4
{
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AFMyriadInstrumentation_updateBoost_value___block_invoke;
  v5[3] = &unk_1E5929898;
  v5[4] = self;
  unsigned __int8 v7 = a3;
  unsigned int v6 = a4;
  dispatch_async(queue, v5);
}

void __45__AFMyriadInstrumentation_updateBoost_value___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 16))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4FA0290]);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v2;
  }
  id v5 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 44);
    unsigned int v8 = v5;
    int v9 = [v6 _boostTypeAsString:v7];
    int v10 = *(_DWORD *)(a1 + 40);
    int v11 = 136315650;
    uint64_t v12 = "-[AFMyriadInstrumentation updateBoost:value:]_block_invoke";
    __int16 v13 = 2112;
    int v14 = v9;
    __int16 v15 = 1024;
    int v16 = v10;
    _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s boostType: %@, boostValue:%d", (uint8_t *)&v11, 0x1Cu);
  }
  switch(*(unsigned char *)(a1 + 44))
  {
    case 1:
      [*(id *)(*(void *)(a1 + 32) + 16) setDeviceBoost:*(unsigned int *)(a1 + 40)];
      break;
    case 2:
      [*(id *)(*(void *)(a1 + 32) + 16) setRecentUnlockBoost:*(unsigned int *)(a1 + 40)];
      break;
    case 3:
      [*(id *)(*(void *)(a1 + 32) + 16) setRecentRaiseToWakeBoost:*(unsigned int *)(a1 + 40)];
      break;
    case 4:
      [*(id *)(*(void *)(a1 + 32) + 16) setRecentSiriRequestBoost:*(unsigned int *)(a1 + 40)];
      break;
    case 5:
      [*(id *)(*(void *)(a1 + 32) + 16) setRecentMotionBoost:*(unsigned int *)(a1 + 40)];
      break;
    case 6:
      [*(id *)(*(void *)(a1 + 32) + 16) setRecentPlaybackBoost:*(unsigned int *)(a1 + 40)];
      break;
    case 7:
      [*(id *)(*(void *)(a1 + 32) + 16) setRecentAlarmBoost:*(unsigned int *)(a1 + 40)];
      break;
    default:
      return;
  }
}

- (id)_boostTypeAsString:(unsigned __int8)a3
{
  if ((a3 - 1) > 6) {
    return @"AFCDABoostTypeUnknown";
  }
  else {
    return off_1E5929988[(a3 - 1)];
  }
}

- (void)_sendAndLogClientEvent:(id)a3 stState:(int)a4 atTimestamp:(unint64_t)a5
{
  unsigned int v6 = (void *)MEMORY[0x1E4F9F9A8];
  id v7 = a3;
  id v8 = [v6 sharedStream];
  [v8 emitMessage:v7 timestamp:a5];
}

- (void)resetCurrentBoost
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__AFMyriadInstrumentation_resetCurrentBoost__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

void __44__AFMyriadInstrumentation_resetCurrentBoost__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

- (CDASchemaCDAScoreBoosters)currentBoost
{
  return self->_currentBoost;
}

- (void)logCDAElectionDecisionMadeDebug:(int)a3 withCrossDeviceArbitrationAllowed:(BOOL)a4 advertisementData:(id)a5 withDeviceGroup:(unsigned int)a6 withCdaId:(id)a7 withTimestamp:(unint64_t)a8
{
  id v14 = a5;
  id v15 = a7;
  queue = self->_queue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __151__AFMyriadInstrumentation_logCDAElectionDecisionMadeDebug_withCrossDeviceArbitrationAllowed_advertisementData_withDeviceGroup_withCdaId_withTimestamp___block_invoke;
  v19[3] = &unk_1E5929870;
  v19[4] = self;
  id v20 = v15;
  BOOL v25 = a4;
  unsigned int v23 = a6;
  int v24 = a3;
  id v21 = v14;
  unint64_t v22 = a8;
  id v17 = v14;
  id v18 = v15;
  dispatch_async(queue, v19);
}

void __151__AFMyriadInstrumentation_logCDAElectionDecisionMadeDebug_withCrossDeviceArbitrationAllowed_advertisementData_withDeviceGroup_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _createSchemaClientEvent:*(void *)(a1 + 40)];
  id v3 = objc_alloc_init(MEMORY[0x1E4FA0228]);
  [v3 setIsCrossDeviceArbitrationAllowed:*(unsigned __int8 *)(a1 + 72)];
  [v3 setDeviceGroup:*(unsigned int *)(a1 + 64)];
  [v3 setAdvertisementDatas:*(void *)(a1 + 48)];
  [v2 setDebugElectionDecisionMade:v3];
  [*(id *)(a1 + 32) _sendAndLogClientEvent:v2 stState:*(unsigned int *)(a1 + 68) atTimestamp:*(void *)(a1 + 56)];
  uint64_t v4 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    unsigned int v6 = *(_DWORD *)(a1 + 68) - 1;
    if (v6 > 0x11) {
      id v7 = @"CDASTATE_UNKNOWN";
    }
    else {
      id v7 = off_1E59298F8[v6];
    }
    int v8 = *(unsigned __int8 *)(a1 + 72);
    int v9 = *(_DWORD *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 48);
    int v12 = 136316418;
    __int16 v13 = "-[AFMyriadInstrumentation logCDAElectionDecisionMadeDebug:withCrossDeviceArbitrationAllowed:advertisementData:"
          "withDeviceGroup:withCdaId:withTimestamp:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 1024;
    int v19 = v8;
    __int16 v20 = 1024;
    int v21 = v9;
    __int16 v22 = 2112;
    uint64_t v23 = v10;
    int v11 = v4;
    _os_log_debug_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@, arbitrationAllowed: %d, deviceGroup: %d, advertisements: %@", (uint8_t *)&v12, 0x36u);
  }
}

- (void)logCDAElectionDecisionMade:(int)a3 withDecision:(int)a4 withPreviousDecision:(int)a5 timeSincePreviousDecision:(unint64_t)a6 withWinningDevice:(id)a7 withThisDevice:(id)a8 withParticipants:(id)a9 withRawScore:(unsigned int)a10 withBoost:(id)a11 withCdaId:(id)a12 currentRequestId:(id)a13 withTimestamp:(unint64_t)a14
{
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a11;
  id v22 = a12;
  id v23 = a13;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __228__AFMyriadInstrumentation_logCDAElectionDecisionMade_withDecision_withPreviousDecision_timeSincePreviousDecision_withWinningDevice_withThisDevice_withParticipants_withRawScore_withBoost_withCdaId_currentRequestId_withTimestamp___block_invoke;
  block[3] = &unk_1E5929848;
  block[4] = self;
  id v34 = v22;
  int v42 = a4;
  int v43 = a5;
  id v35 = v18;
  id v36 = v19;
  id v37 = v21;
  id v38 = v20;
  unsigned int v44 = a10;
  int v45 = a3;
  unint64_t v40 = a6;
  unint64_t v41 = a14;
  id v39 = v23;
  id v25 = v23;
  id v26 = v20;
  id v27 = v21;
  id v28 = v19;
  id v29 = v18;
  id v30 = v22;
  dispatch_async(queue, block);
}

void __228__AFMyriadInstrumentation_logCDAElectionDecisionMade_withDecision_withPreviousDecision_timeSincePreviousDecision_withWinningDevice_withThisDevice_withParticipants_withRawScore_withBoost_withCdaId_currentRequestId_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _createSchemaClientEvent:*(void *)(a1 + 40)];
  id v3 = objc_alloc_init(MEMORY[0x1E4FA0278]);
  [v3 setDecision:*(unsigned int *)(a1 + 104)];
  [v3 setPreviousDecision:*(unsigned int *)(a1 + 108)];
  [v3 setWinningDevice:*(void *)(a1 + 48)];
  [v3 setThisDevice:*(void *)(a1 + 56)];
  [v3 setRawGoodnessScore:*(unsigned int *)(a1 + 112)];
  [v3 setTimeSinceLastDecisionInMs:*(void *)(a1 + 88)];
  uint64_t v4 = *(void *)(a1 + 64);
  if (!v4) {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
  }
  [v3 setGoodnessScoreBoosts:v4];
  [v3 setHeardParticipants:*(void *)(a1 + 72)];
  [v2 setElectionDecisionMade:v3];
  [*(id *)(a1 + 32) _sendAndLogClientEvent:v2 stState:*(unsigned int *)(a1 + 116) atTimestamp:*(void *)(a1 + 96)];
  [*(id *)(a1 + 32) _logRequestLinkMessageRequestId:*(void *)(a1 + 80) cdaId:*(void *)(a1 + 40)];
  uint64_t v5 = (id)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v8 = *(_DWORD *)(a1 + 116) - 1;
    if (v8 > 0x11) {
      int v9 = @"CDASTATE_UNKNOWN";
    }
    else {
      int v9 = off_1E59298F8[v8];
    }
    id v30 = v9;
    uint64_t v10 = @"CDADECISION_UNKNOWN";
    int v11 = *(_DWORD *)(a1 + 104);
    int v12 = *(_DWORD *)(a1 + 108);
    if (v11 == 1) {
      __int16 v13 = @"CDADECISION_WIN";
    }
    else {
      __int16 v13 = @"CDADECISION_UNKNOWN";
    }
    if (v11 == 2) {
      __int16 v14 = @"CDADECISION_LOSS";
    }
    else {
      __int16 v14 = v13;
    }
    if (v12 == 1) {
      uint64_t v10 = @"CDADECISION_WIN";
    }
    if (v12 == 2) {
      uint64_t v10 = @"CDADECISION_LOSS";
    }
    id v26 = v10;
    id v27 = v14;
    uint64_t v29 = *(void *)(a1 + 88);
    uint64_t v15 = *(void **)(a1 + 48);
    uint64_t v24 = *(void *)(a1 + 40);
    int v28 = [v15 goodnessScore];
    __int16 v16 = *(void **)(a1 + 56);
    int v25 = [v16 goodnessScore];
    id v17 = [*(id *)(a1 + 72) debugDescription];
    int v23 = *(_DWORD *)(a1 + 112);
    id v18 = [v3 goodnessScoreBoosts];
    id v19 = [v18 debugDescription];
    id v20 = [v3 goodnessScoreBoosts];
    unsigned int v21 = [v20 trumpReason] - 1;
    if (v21 > 7) {
      id v22 = @"CDATRUMPREASON_UNKNOWN";
    }
    else {
      id v22 = off_1E59299C0[v21];
    }
    *(_DWORD *)buf = 136318466;
    v32 = "-[AFMyriadInstrumentation logCDAElectionDecisionMade:withDecision:withPreviousDecision:timeSincePreviousDecisi"
          "on:withWinningDevice:withThisDevice:withParticipants:withRawScore:withBoost:withCdaId:currentRequestId:withTim"
          "estamp:]_block_invoke";
    __int16 v33 = 2112;
    uint64_t v34 = v24;
    __int16 v35 = 2112;
    id v36 = v30;
    __int16 v37 = 2112;
    id v38 = v27;
    __int16 v39 = 2112;
    unint64_t v40 = v26;
    __int16 v41 = 2048;
    uint64_t v42 = v29;
    __int16 v43 = 2112;
    unsigned int v44 = v15;
    __int16 v45 = 1024;
    int v46 = v28;
    __int16 v47 = 2112;
    v48 = v16;
    __int16 v49 = 1024;
    int v50 = v25;
    __int16 v51 = 2112;
    v52 = v17;
    __int16 v53 = 1024;
    int v54 = v23;
    __int16 v55 = 2112;
    v56 = v19;
    __int16 v57 = 2112;
    v58 = v22;
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@, withDecision: %@, withPreviousDecision: %@, timeSincePreviousDecision: %llu, withWinningDevice: %@ (score: %d), withThisDevice: %@ (score: %d), withParticipants: %@, withRawScore:%u, withBoost:%@, withTrumpReason:%@", buf, 0x82u);
  }
  if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled])
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(*(void *)(a1 + 32) + 16));
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = 0;
}

- (void)logCDAElectionTimerEnded:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5
{
  id v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__AFMyriadInstrumentation_logCDAElectionTimerEnded_withCdaId_withTimestamp___block_invoke;
  v11[3] = &unk_1E59297F8;
  void v11[4] = self;
  id v12 = v8;
  int v14 = a3;
  unint64_t v13 = a5;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __76__AFMyriadInstrumentation_logCDAElectionTimerEnded_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _createSchemaClientEvent:*(void *)(a1 + 40)];
  id v3 = objc_alloc_init(MEMORY[0x1E4FA0280]);
  [v3 setState:*(unsigned int *)(a1 + 56)];
  [v2 setElectionTimerEnded:v3];
  [*(id *)(a1 + 32) _sendAndLogClientEvent:v2 stState:*(unsigned int *)(a1 + 56) atTimestamp:*(void *)(a1 + 48)];
  uint64_t v4 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    unsigned int v6 = *(_DWORD *)(a1 + 56) - 1;
    if (v6 > 0x11) {
      id v7 = @"CDASTATE_UNKNOWN";
    }
    else {
      id v7 = off_1E59298F8[v6];
    }
    int v9 = 136315650;
    id v10 = "-[AFMyriadInstrumentation logCDAElectionTimerEnded:withCdaId:withTimestamp:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    int v14 = v7;
    id v8 = v4;
    _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)logCDAElectionAdvertisingEnding:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5
{
  id v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__AFMyriadInstrumentation_logCDAElectionAdvertisingEnding_withCdaId_withTimestamp___block_invoke;
  v11[3] = &unk_1E59297F8;
  void v11[4] = self;
  id v12 = v8;
  int v14 = a3;
  unint64_t v13 = a5;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __83__AFMyriadInstrumentation_logCDAElectionAdvertisingEnding_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _createSchemaClientEvent:*(void *)(a1 + 40)];
  id v3 = objc_alloc_init(MEMORY[0x1E4FA0260]);
  [v3 setState:*(unsigned int *)(a1 + 56)];
  id v4 = objc_alloc_init(MEMORY[0x1E4FA0230]);
  [v4 setStartedOrChanged:v3];
  [v2 setCdaAdvertisingEndChanged:v4];
  [*(id *)(a1 + 32) _sendAndLogClientEvent:v2 stState:*(unsigned int *)(a1 + 56) atTimestamp:*(void *)(a1 + 48)];
  uint64_t v5 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    unsigned int v7 = *(_DWORD *)(a1 + 56) - 1;
    if (v7 > 0x11) {
      id v8 = @"CDASTATE_UNKNOWN";
    }
    else {
      id v8 = off_1E59298F8[v7];
    }
    int v10 = 136315650;
    __int16 v11 = "-[AFMyriadInstrumentation logCDAElectionAdvertisingEnding:withCdaId:withTimestamp:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    int v9 = v5;
    _os_log_debug_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)logCDAElectionAdvertisingEnded:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5
{
  id v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__AFMyriadInstrumentation_logCDAElectionAdvertisingEnded_withCdaId_withTimestamp___block_invoke;
  v11[3] = &unk_1E59297F8;
  void v11[4] = self;
  id v12 = v8;
  int v14 = a3;
  unint64_t v13 = a5;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __82__AFMyriadInstrumentation_logCDAElectionAdvertisingEnded_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _createSchemaClientEvent:*(void *)(a1 + 40)];
  id v3 = objc_alloc_init(MEMORY[0x1E4FA0258]);
  [v3 setState:*(unsigned int *)(a1 + 56)];
  id v4 = objc_alloc_init(MEMORY[0x1E4FA0230]);
  [v4 setEnded:v3];
  [v2 setCdaAdvertisingEndChanged:v4];
  [*(id *)(a1 + 32) _sendAndLogClientEvent:v2 stState:*(unsigned int *)(a1 + 56) atTimestamp:*(void *)(a1 + 48)];
  uint64_t v5 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    unsigned int v7 = *(_DWORD *)(a1 + 56) - 1;
    if (v7 > 0x11) {
      id v8 = @"CDASTATE_UNKNOWN";
    }
    else {
      id v8 = off_1E59298F8[v7];
    }
    int v10 = 136315650;
    __int16 v11 = "-[AFMyriadInstrumentation logCDAElectionAdvertisingEnded:withCdaId:withTimestamp:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    int v9 = v5;
    _os_log_debug_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)logCDAElectionAdvertisingStarting:(int)a3 withDelay:(float)a4 withInterval:(float)a5 withCdaId:(id)a6 withTimestamp:(unint64_t)a7
{
  id v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__AFMyriadInstrumentation_logCDAElectionAdvertisingStarting_withDelay_withInterval_withCdaId_withTimestamp___block_invoke;
  block[3] = &unk_1E5929820;
  block[4] = self;
  id v16 = v12;
  int v18 = a3;
  float v19 = a4;
  float v20 = a5;
  unint64_t v17 = a7;
  id v14 = v12;
  dispatch_async(queue, block);
}

void __108__AFMyriadInstrumentation_logCDAElectionAdvertisingStarting_withDelay_withInterval_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _createSchemaClientEvent:*(void *)(a1 + 40)];
  id v3 = objc_alloc_init(MEMORY[0x1E4FA0270]);
  [v3 setState:*(unsigned int *)(a1 + 56)];
  LODWORD(v4) = *(_DWORD *)(a1 + 60);
  [v3 setAdvertisementDelay:v4];
  LODWORD(v5) = *(_DWORD *)(a1 + 64);
  [v3 setAdvertisementInterval:v5];
  id v6 = objc_alloc_init(MEMORY[0x1E4FA0238]);
  [v6 setStartedOrChanged:v3];
  [v2 setCdaAdvertisingStartChanged:v6];
  [*(id *)(a1 + 32) _sendAndLogClientEvent:v2 stState:*(unsigned int *)(a1 + 56) atTimestamp:*(void *)(a1 + 48)];
  unsigned int v7 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    unsigned int v9 = *(_DWORD *)(a1 + 56) - 1;
    if (v9 > 0x11) {
      int v10 = @"CDASTATE_UNKNOWN";
    }
    else {
      int v10 = off_1E59298F8[v9];
    }
    int v12 = 136315650;
    uint64_t v13 = "-[AFMyriadInstrumentation logCDAElectionAdvertisingStarting:withDelay:withInterval:withCdaId:withTimestamp:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    unint64_t v17 = v10;
    __int16 v11 = v7;
    _os_log_debug_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v12, 0x20u);
  }
}

- (void)logCDAElectionAdvertisingStarted:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5
{
  id v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__AFMyriadInstrumentation_logCDAElectionAdvertisingStarted_withCdaId_withTimestamp___block_invoke;
  v11[3] = &unk_1E59297F8;
  void v11[4] = self;
  id v12 = v8;
  int v14 = a3;
  unint64_t v13 = a5;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __84__AFMyriadInstrumentation_logCDAElectionAdvertisingStarted_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _createSchemaClientEvent:*(void *)(a1 + 40)];
  id v3 = objc_alloc_init(MEMORY[0x1E4FA0268]);
  [v3 setState:*(unsigned int *)(a1 + 56)];
  id v4 = objc_alloc_init(MEMORY[0x1E4FA0238]);
  [v4 setEnded:v3];
  [v2 setCdaAdvertisingStartChanged:v4];
  [*(id *)(a1 + 32) _sendAndLogClientEvent:v2 stState:*(unsigned int *)(a1 + 56) atTimestamp:*(void *)(a1 + 48)];
  double v5 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    unsigned int v7 = *(_DWORD *)(a1 + 56) - 1;
    if (v7 > 0x11) {
      id v8 = @"CDASTATE_UNKNOWN";
    }
    else {
      id v8 = off_1E59298F8[v7];
    }
    int v10 = 136315650;
    __int16 v11 = "-[AFMyriadInstrumentation logCDAElectionAdvertisingStarted:withCdaId:withTimestamp:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    unsigned int v9 = v5;
    _os_log_debug_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)logCDADeviceStateActivityEnded:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5
{
  id v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__AFMyriadInstrumentation_logCDADeviceStateActivityEnded_withCdaId_withTimestamp___block_invoke;
  v11[3] = &unk_1E59297F8;
  void v11[4] = self;
  id v12 = v8;
  int v14 = a3;
  unint64_t v13 = a5;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __82__AFMyriadInstrumentation_logCDADeviceStateActivityEnded_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _createSchemaClientEvent:*(void *)(a1 + 40)];
  id v3 = objc_alloc_init(MEMORY[0x1E4FA0240]);
  [v3 setState:*(unsigned int *)(a1 + 56)];
  id v4 = objc_alloc_init(MEMORY[0x1E4FA0250]);
  [v4 setEnded:v3];
  [v2 setDeviceElectionStateContext:v4];
  [*(id *)(a1 + 32) _sendAndLogClientEvent:v2 stState:*(unsigned int *)(a1 + 56) atTimestamp:*(void *)(a1 + 48)];
  double v5 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    unsigned int v7 = *(_DWORD *)(a1 + 56) - 1;
    if (v7 > 0x11) {
      id v8 = @"CDASTATE_UNKNOWN";
    }
    else {
      id v8 = off_1E59298F8[v7];
    }
    int v10 = 136315650;
    __int16 v11 = "-[AFMyriadInstrumentation logCDADeviceStateActivityEnded:withCdaId:withTimestamp:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    unsigned int v9 = v5;
    _os_log_debug_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)logCDADeviceStateActivityStartedOrChanged:(int)a3 withTrigger:(int)a4 withCdaId:(id)a5 withTimestamp:(unint64_t)a6
{
  id v10 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __105__AFMyriadInstrumentation_logCDADeviceStateActivityStartedOrChanged_withTrigger_withCdaId_withTimestamp___block_invoke;
  v13[3] = &unk_1E592B1A8;
  v13[4] = self;
  id v14 = v10;
  int v16 = a3;
  int v17 = a4;
  unint64_t v15 = a6;
  id v12 = v10;
  dispatch_async(queue, v13);
}

void __105__AFMyriadInstrumentation_logCDADeviceStateActivityStartedOrChanged_withTrigger_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _createSchemaClientEvent:*(void *)(a1 + 40)];
  id v3 = objc_alloc_init(MEMORY[0x1E4FA0248]);
  [v3 setState:*(unsigned int *)(a1 + 56)];
  if (*(_DWORD *)(a1 + 60)) {
    objc_msgSend(v3, "setTrigger:");
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4FA0250]);
  [v4 setStartedOrChanged:v3];
  [v2 setDeviceElectionStateContext:v4];
  double v5 = [MEMORY[0x1E4F9F9A8] sharedStream];
  [v5 emitMessage:v2 timestamp:*(void *)(a1 + 48)];

  uint64_t v6 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v7 = *(_DWORD *)(a1 + 56) - 1;
    if (v7 > 0x11) {
      id v8 = @"CDASTATE_UNKNOWN";
    }
    else {
      id v8 = off_1E59298F8[v7];
    }
    uint64_t v9 = *(void *)(a1 + 40);
    unsigned int v10 = *(_DWORD *)(a1 + 60) - 1;
    if (v10 > 7) {
      __int16 v11 = @"CDATRIGGER_UKNOWN";
    }
    else {
      __int16 v11 = off_1E59298B8[v10];
    }
    int v13 = 136315906;
    id v14 = "-[AFMyriadInstrumentation logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    float v20 = v11;
    id v12 = v6;
    _os_log_debug_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@, trigger: %@", (uint8_t *)&v13, 0x2Au);
  }
}

- (void)getPreviousBoostsWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__AFMyriadInstrumentation_getPreviousBoostsWithCompletion___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __59__AFMyriadInstrumentation_getPreviousBoostsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(a1 + 32) + 24));
  }
  return result;
}

- (AFMyriadInstrumentation)init
{
  v8.receiver = self;
  v8.super_class = (Class)AFMyriadInstrumentation;
  id v2 = [(AFMyriadInstrumentation *)&v8 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.assistant.myriad.instrumentation", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

@end