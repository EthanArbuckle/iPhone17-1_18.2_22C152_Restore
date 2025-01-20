@interface CHMetrics
+ (double)currentTime;
- (BOOL)isEnabled;
- (BOOL)isEventType:(unint64_t)a3 inList:(vector<unsigned)long;
- (CHMetrics)initWithEngine:(id)a3 audioSessionID:(unsigned int)a4 sessionIsShared:(BOOL)a5 isSPI:(BOOL)a6;
- (float)getLoopsForAdvancedPlayer:(id)a3 endTime:(double)a4;
- (float)getLoopsForPlayer:(id)a3 endTime:(double)a4;
- (id).cxx_construct;
- (id)continousDictionary:(id)a3 slot:(unint64_t)a4 intensity:(float)a5;
- (id)continuousSharpnessSlotKeyFromSlotValue:(unint64_t)a3;
- (id)getIDForPlayer:(id)a3;
- (id)getMetricsForPlayer:(id)a3;
- (id)intensityBinKeyFromValue:(float)a3;
- (id)legacyTransientDictionary:(id)a3 eventType:(unint64_t)a4 intensity:(float)a5;
- (id)transientDictionary:(id)a3 index:(unint64_t)a4 intensity:(float)a5;
- (id)transientSharpnessIndexKeyFromIndexValue:(unint64_t)a3;
- (void)addPatternLibraryMetric:(id)a3;
- (void)dealloc;
- (void)dispatchOnLocal:(id)a3;
- (void)handleActionForPlayer:(id)a3 action:(int64_t)a4 time:(double)a5 isAdvanced:(BOOL)a6;
- (void)handleEngineStart;
- (void)handleEngineStop;
- (void)handleFinishedForPlayersAtTime:(double)a3;
- (void)handleInitForPlayer:(id)a3 events:(id)a4 isAdvanced:(BOOL)a5 patternID:(id)a6;
- (void)handleParamCurveEncountered;
- (void)handleStartForPlayer:(id)a3 time:(double)a4 isAdvanced:(BOOL)a5 patternID:(id)a6;
- (void)logMetric:(id)a3 value:(id)a4;
- (void)logPatternLibraryMetric:(id)a3;
- (void)logPowerLogMetric:(id)a3;
- (void)markAdvancedPlaybackAction:(id)a3 action:(int64_t)a4 time:(float)a5;
- (void)markPlaybackAction:(id)a3 action:(int64_t)a4 time:(float)a5;
- (void)prepareAdvancedPlaybackData:(id)a3 events:(id)a4;
- (void)prepareData:(id)a3 events:(id)a4;
- (void)preparePlaybackData:(id)a3 events:(id)a4;
- (void)removePlaybackData:(id)a3;
- (void)resetAdvancedPlaybackData:(id)a3;
- (void)resetPlaybackData:(id)a3;
- (void)retainData:(id)a3 forTestingPlayer:(id)a4;
- (void)sendDetailedMetricsForPlayerID:(id)a3 endTime:(float)a4;
- (void)sendPatternLibraryMetrics;
- (void)setMetricsTestModeEnabled;
- (void)setReporter;
- (void)startReporter;
- (void)stopReporter;
@end

@implementation CHMetrics

- (void)handleEngineStart
{
  [(CHMetrics *)self startReporter];
  [(CHMetrics *)self logPowerLogMetric:@"EngineOn"];
  if (self->_isSPI) {
    v3 = @"startHapticEngine_SPI";
  }
  else {
    v3 = @"startHapticEngine";
  }

  [(CHMetrics *)self logMetric:v3 value:&unk_1F145A4D8];
}

- (void)startReporter
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_sessionIsShared)
  {
    if (kHMETScope)
    {
      v3 = *(id *)kHMETScope;
      if (!v3)
      {
LABEL_9:
        CAReportingClientStartReporter();
        return;
      }
    }
    else
    {
      v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      engineID = self->_engineID;
      int v6 = 136315906;
      v7 = "CHMetrics.mm";
      __int16 v8 = 1024;
      int v9 = 386;
      __int16 v10 = 2080;
      v11 = "-[CHMetrics startReporter]";
      __int16 v12 = 2112;
      v13 = engineID;
      _os_log_impl(&dword_1BA902000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: starting reporter for engine %@", (uint8_t *)&v6, 0x26u);
    }

    goto LABEL_9;
  }
}

- (void)logPowerLogMetric:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (kHMETScope)
  {
    id v4 = *(id *)kHMETScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v10 = "CHMetrics.mm";
    __int16 v11 = 1024;
    int v12 = 439;
    __int16 v13 = 2080;
    uint64_t v14 = "-[CHMetrics logPowerLogMetric:]";
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: logging PowerLog metrics for \"%@\"", buf, 0x26u);
  }

LABEL_8:
  v7 = @"EngineState";
  id v8 = v3;
  int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  CAReportingClientSendMessage();
}

- (id).cxx_construct
{
  *((void *)self + 18) = 0;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 38) = 1065353216;
  return self;
}

- (id)getIDForPlayer:(id)a3
{
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%p", a3);

  return v3;
}

- (CHMetrics)initWithEngine:(id)a3 audioSessionID:(unsigned int)a4 sessionIsShared:(BOOL)a5 isSPI:(BOOL)a6
{
  v89[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CHMetrics;
  __int16 v11 = [(CHMetrics *)&v36 init];
  id v12 = v11;
  if (!v11)
  {
LABEL_29:
    v25 = (CHMetrics *)v12;
    goto LABEL_30;
  }
  if (kHMETScope)
  {
    __int16 v13 = *(id *)kHMETScope;
    if (!v13) {
      goto LABEL_9;
    }
  }
  else
  {
    __int16 v13 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "CHMetrics.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 123;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "-[CHMetrics initWithEngine:audioSessionID:sessionIsShared:isSPI:]";
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v10;
    _os_log_impl(&dword_1BA902000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: initializing metrics for engine %@", buf, 0x26u);
  }

LABEL_9:
  if ([v11 isEnabled])
  {
    dispatch_queue_t v15 = dispatch_queue_create("CHMetricsDispatchQueue", 0);
    id v16 = (void *)*((void *)v11 + 4);
    *((void *)v11 + 4) = v15;

    uint64_t v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"%p", v10);
    v18 = (void *)*((void *)v11 + 2);
    *((void *)v11 + 2) = v17;

    *((void *)v11 + 1) = 1;
    *((_DWORD *)v11 + 6) = a4;
    v11[28] = a5;
    v11[29] = a6;
    [v11 setReporter];
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v20 = (void *)*((void *)v11 + 21);
    *((void *)v11 + 21) = v19;

    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v22 = (void *)*((void *)v11 + 20);
    *((void *)v11 + 20) = v21;

    *((void *)v11 + 5) = 0x3F3333333ECCCCCDLL;
    v23 = [v10 serverConfig];
    v24 = v23;
    if (v23) {
      [v23 hapticTransientIDs];
    }
    else {
      memset(buf, 0, 24);
    }
    v26 = (void *)*((void *)v11 + 6);
    if (v26)
    {
      *((void *)v11 + 7) = v26;
      operator delete(v26);
      *((void *)v11 + 6) = 0;
      *((void *)v11 + 7) = 0;
      *((void *)v11 + 8) = 0;
    }
    *((_OWORD *)v11 + 3) = *(_OWORD *)buf;
    *((void *)v11 + 8) = *(void *)&buf[16];
    memset(buf, 0, 24);

    v27 = [v10 serverConfig];
    v28 = v27;
    if (v27) {
      [v27 hapticContinuousSustainedIDs];
    }
    else {
      memset(buf, 0, 24);
    }
    v29 = (void *)*((void *)v11 + 9);
    if (v29)
    {
      *((void *)v11 + 10) = v29;
      operator delete(v29);
      *((void *)v11 + 9) = 0;
      *((void *)v11 + 10) = 0;
      *((void *)v11 + 11) = 0;
    }
    *(_OWORD *)(v11 + 72) = *(_OWORD *)buf;
    *((void *)v11 + 11) = *(void *)&buf[16];
    memset(buf, 0, 24);

    v30 = [v10 serverConfig];
    v31 = v30;
    if (v30) {
      [v30 hapticContinuousNonsustainedIDs];
    }
    else {
      memset(buf, 0, 24);
    }
    v32 = (void *)*((void *)v11 + 12);
    if (v32)
    {
      *((void *)v11 + 13) = v32;
      operator delete(v32);
      *((void *)v11 + 12) = 0;
      *((void *)v11 + 13) = 0;
      *((void *)v11 + 14) = 0;
    }
    *((_OWORD *)v11 + 6) = *(_OWORD *)buf;
    *((void *)v11 + 14) = *(void *)&buf[16];
    memset(buf, 0, 24);

    *(void *)buf = 8021;
    *(void *)&buf[8] = @"MicroTap2";
    *(void *)&buf[16] = 11093;
    *(void *)&buf[24] = @"MicroTap3";
    *(void *)&buf[32] = 14165;
    v38 = @"MicroTap4";
    uint64_t v39 = 17237;
    v40 = @"MicroTap5";
    uint64_t v41 = 20309;
    v42 = @"MicroTap6";
    uint64_t v43 = 23381;
    v44 = @"MicroTap7";
    uint64_t v45 = 26453;
    v46 = @"MicroTap8";
    uint64_t v47 = 29525;
    v48 = @"MicroTap9";
    uint64_t v49 = 8022;
    v50 = @"MiniTap2";
    uint64_t v51 = 11094;
    v52 = @"MiniTap3";
    uint64_t v53 = 14166;
    v54 = @"MiniTap4";
    uint64_t v55 = 17238;
    v56 = @"MiniTap5";
    uint64_t v57 = 20310;
    v58 = @"MiniTap6";
    uint64_t v59 = 23382;
    v60 = @"MiniTap7";
    uint64_t v61 = 26454;
    v62 = @"MiniTap8";
    uint64_t v63 = 29526;
    v64 = @"MiniTap9";
    uint64_t v65 = 8023;
    v66 = @"FullTap2";
    uint64_t v67 = 11095;
    v68 = @"FullTap3";
    uint64_t v69 = 14167;
    v70 = @"FullTap4";
    uint64_t v71 = 17239;
    v72 = @"FullTap5";
    uint64_t v73 = 20311;
    v74 = @"FullTap6";
    uint64_t v75 = 23383;
    v76 = @"FullTap7";
    uint64_t v77 = 26455;
    v78 = @"FullTap8";
    uint64_t v79 = 29527;
    v80 = @"FullTap9";
    uint64_t v81 = 32512;
    v82 = @"KBKey";
    uint64_t v83 = 32557;
    v84 = @"KBDown";
    uint64_t v85 = 29485;
    v86 = @"KBModifier";
    uint64_t v87 = 32556;
    v88 = @"WoT";
    std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__assign_unique<std::pair<AVHapticPlayerEventType const,NSString * {__strong}> const*>((void *)v11 + 15, (unint64_t *)buf, v89);
    for (uint64_t i = 440; i != -8; i -= 16)

    v34 = (void *)*((void *)v12 + 23);
    *((void *)v12 + 23) = 0;

    *((unsigned char *)v12 + 176) = 0;
    goto LABEL_29;
  }
  v25 = 0;
LABEL_30:

  return v25;
}

- (void)setReporter
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F4E9F0] retrieveSessionWithID:self->_audioSessionID];
  id v5 = v4;
  if (!self->_sessionIsShared)
  {
    self->_int64_t reporterID = CAReportingClientCreateReporterID();
    CAReportingClientSetAudioServiceType();
    int64_t reporterID = self->_reporterID;
    id v25 = 0;
    [v5 setReporterID:reporterID error:&v25];
    id v8 = v25;
    v24 = v8;
    if (v8) {
      int v9 = [v8 code];
    }
    else {
      int v9 = 0;
    }
    id v12 = [MEMORY[0x1E4F28B50] mainBundle];
    __int16 v13 = [v12 bundleIdentifier];
    if (v13
      && ([MEMORY[0x1E4F28B50] mainBundle],
          int v14 = v9,
          v23 = objc_claimAutoreleasedReturnValue(),
          [v23 bundleIdentifier],
          v2 = objc_claimAutoreleasedReturnValue(),
          ([v2 isEqual:@"Unknown"] & 1) == 0))
    {
      uint64_t v17 = [MEMORY[0x1E4F28B50] mainBundle];
      id v16 = [v17 bundleIdentifier];
    }
    else
    {
      dispatch_queue_t v15 = [MEMORY[0x1E4F28F80] processInfo];
      int v14 = v9;
      id v16 = [v15 processName];

      if (!v13)
      {
LABEL_18:

        objc_super v36 = @"HostApplicationDisplayID";
        v37[0] = v16;
        v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
        CAReportingClientSetConfiguration();

        int v19 = v14;
        if (v14) {
          goto LABEL_21;
        }
        goto LABEL_19;
      }
    }

    goto LABEL_18;
  }
  self->_int64_t reporterID = [v4 reporterID];
  if (!kHMETScope)
  {
    int v6 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
    goto LABEL_8;
  }
  int v6 = *(id *)kHMETScope;
  if (v6)
  {
LABEL_8:
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int64_t v11 = self->_reporterID;
      *(_DWORD *)buf = 136315906;
      v27 = "CHMetrics.mm";
      __int16 v28 = 1024;
      int v29 = 361;
      __int16 v30 = 2080;
      v31 = "-[CHMetrics setReporter]";
      __int16 v32 = 2048;
      int64_t v33 = v11;
      _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: updating haptics reporter with audio session reporter id %lld", buf, 0x26u);
    }
  }
LABEL_19:
  if (self->_reporterID > 0) {
    goto LABEL_28;
  }
  int v19 = 0;
LABEL_21:
  if (kHMETScope)
  {
    v20 = *(id *)kHMETScope;
    if (!v20) {
      goto LABEL_28;
    }
  }
  else
  {
    v20 = MEMORY[0x1E4F14500];
    id v21 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    engineID = self->_engineID;
    *(_DWORD *)buf = 136316162;
    v27 = "CHMetrics.mm";
    __int16 v28 = 1024;
    int v29 = 378;
    __int16 v30 = 2080;
    v31 = "-[CHMetrics setReporter]";
    __int16 v32 = 2112;
    int64_t v33 = (int64_t)engineID;
    __int16 v34 = 1024;
    int v35 = v19;
    _os_log_impl(&dword_1BA902000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: unable to set reporter for engine %@: error %d", buf, 0x2Cu);
  }

LABEL_28:
}

- (BOOL)isEnabled
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"hapticmetrics_client_disabled", @"com.apple.corehaptics", 0);
  if (AppBooleanValue)
  {
    if (kHMETScope)
    {
      id v3 = *(id *)kHMETScope;
      if (!v3) {
        return AppBooleanValue == 0;
      }
    }
    else
    {
      id v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315650;
      v7 = "CHMetrics.mm";
      __int16 v8 = 1024;
      int v9 = 409;
      __int16 v10 = 2080;
      int64_t v11 = "-[CHMetrics isEnabled]";
      _os_log_impl(&dword_1BA902000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d %s: client side metrics DISABLED (defaults write com.apple.corehaptics hapticmetrics_client_disabled == true)", (uint8_t *)&v6, 0x1Cu);
    }
  }
  return AppBooleanValue == 0;
}

- (void)logMetric:(id)a3 value:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (kHMETScope)
  {
    v7 = *(id *)kHMETScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    int64_t v11 = "CHMetrics.mm";
    __int16 v12 = 1024;
    int v13 = 432;
    __int16 v14 = 2080;
    dispatch_queue_t v15 = "-[CHMetrics logMetric:value:]";
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: logging metrics for \"%@\"", buf, 0x26u);
  }

LABEL_8:
  int v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v6, v5, 0);
  CAReportingClientSendMessage();
}

- (float)getLoopsForPlayer:(id)a3 endTime:(double)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"playback"];
  v7 = [v6 objectForKeyedSubscript:@"edgeCase"];
  int v8 = [v7 BOOLValue];

  if (!v8)
  {
    int64_t v11 = [v6 objectForKeyedSubscript:@"playbackDuration"];
    [v11 floatValue];
    float v13 = v12;

    __int16 v14 = [v6 objectForKeyedSubscript:@"firstStartTime"];
    [v14 floatValue];
    float v16 = v15;

    id v17 = [v5 objectForKeyedSubscript:@"patternDuration"];
    [v17 floatValue];
    float v19 = v18;

    v20 = [v6 objectForKeyedSubscript:@"playbackLastAction"];
    int v9 = v20;
    float v21 = a4 - v16;
    if (v13 == 0.0 && ![v20 action] && v19 > v21)
    {
      float v13 = v21;
LABEL_26:
      float v10 = v13 / v19;
LABEL_27:

      goto LABEL_28;
    }
    if (v13 < (float)(v19 + v21) && ![v9 action])
    {
      float v13 = v13 + v19;
      goto LABEL_26;
    }
    if (v13 < v21 && [v9 action] == 3 || [v9 action] == 3) {
      goto LABEL_26;
    }
    if (kHMETScope)
    {
      v22 = *(id *)kHMETScope;
      if (!v22)
      {
LABEL_25:
        float v13 = 0.0;
        goto LABEL_26;
      }
    }
    else
    {
      v22 = MEMORY[0x1E4F14500];
      id v24 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136315650;
      v27 = "CHMetrics.mm";
      __int16 v28 = 1024;
      int v29 = 861;
      __int16 v30 = 2080;
      v31 = "-[CHMetrics getLoopsForPlayer:endTime:]";
      _os_log_impl(&dword_1BA902000, v22, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: edge case - no case found", (uint8_t *)&v26, 0x1Cu);
    }

    goto LABEL_25;
  }
  if (!kHMETScope)
  {
    int v9 = MEMORY[0x1E4F14500];
    id v23 = MEMORY[0x1E4F14500];
LABEL_18:
    float v10 = 1.0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136315650;
      v27 = "CHMetrics.mm";
      __int16 v28 = 1024;
      int v29 = 837;
      __int16 v30 = 2080;
      v31 = "-[CHMetrics getLoopsForPlayer:endTime:]";
      _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: edge case - no loop multiplier, log once", (uint8_t *)&v26, 0x1Cu);
    }
    goto LABEL_27;
  }
  int v9 = *(id *)kHMETScope;
  if (v9) {
    goto LABEL_18;
  }
  float v10 = 1.0;
LABEL_28:

  return v10;
}

- (void)markPlaybackAction:(id)a3 action:(int64_t)a4 time:(float)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (kHMETScope)
  {
    int v9 = *(id *)kHMETScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    int v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    engineID = self->_engineID;
    int v46 = 136316418;
    uint64_t v47 = "CHMetrics.mm";
    __int16 v48 = 1024;
    int v49 = 576;
    __int16 v50 = 2080;
    uint64_t v51 = "-[CHMetrics markPlaybackAction:action:time:]";
    __int16 v52 = 2048;
    double v53 = *(double *)&a4;
    __int16 v54 = 2112;
    double v55 = *(double *)&engineID;
    __int16 v56 = 2048;
    id v57 = v8;
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: marking action %ld for engine %@ player %p", (uint8_t *)&v46, 0x3Au);
  }

LABEL_8:
  +[CHMetrics currentTime];
  if (v12 > a5)
  {
    +[CHMetrics currentTime];
    a5 = v13;
  }
  __int16 v14 = [(NSMutableDictionary *)self->_playerData objectForKeyedSubscript:v8];
  float v15 = [v14 objectForKeyedSubscript:@"playback"];
  float v16 = [v15 objectForKeyedSubscript:@"playbackLastAction"];
  id v17 = [v15 objectForKeyedSubscript:@"edgeCase"];
  char v18 = [v17 BOOLValue];

  if ((v18 & 1) == 0)
  {
    if (*(double *)&a4 != 0.0) {
      goto LABEL_17;
    }
    float v19 = [v15 objectForKeyedSubscript:@"firstStartTime"];
    [v19 floatValue];
    if (v20 < 0.0)
    {
    }
    else
    {
      float v21 = [v15 objectForKeyedSubscript:@"firstStartTime"];
      [v21 floatValue];
      BOOL v23 = a5 < v22;

      if (!v23)
      {
LABEL_17:
        if (v16)
        {
          [(PlaybackAction *)v16 time];
          if (a5 < v26)
          {
            if (kHMETScope)
            {
              id v27 = *(id *)kHMETScope;
              if (!v27) {
                goto LABEL_44;
              }
            }
            else
            {
              id v27 = (id)MEMORY[0x1E4F14500];
              id v41 = MEMORY[0x1E4F14500];
            }
            v42 = v27;
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              [(PlaybackAction *)v16 time];
              int v46 = 136316162;
              uint64_t v47 = "CHMetrics.mm";
              __int16 v48 = 1024;
              int v49 = 612;
              __int16 v50 = 2080;
              uint64_t v51 = "-[CHMetrics markPlaybackAction:action:time:]";
              __int16 v52 = 2048;
              double v53 = a5;
              __int16 v54 = 2048;
              double v55 = v43;
              _os_log_impl(&dword_1BA902000, v42, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: edge case: action time out of order %g < %g", (uint8_t *)&v46, 0x30u);
            }

LABEL_39:
LABEL_44:
            [v15 setObject:&unk_1F145A4D8 forKeyedSubscript:@"edgeCase"];
            goto LABEL_45;
          }
          uint64_t v29 = [(PlaybackAction *)v16 action];
          if (a4 == 3 && !v29 || !([(PlaybackAction *)v16 action] | a4))
          {
            [(PlaybackAction *)v16 time];
            float v32 = v31;
            [(PlaybackAction *)v16 setAction:a4];
            *(float *)&double v33 = a5;
            [(PlaybackAction *)v16 setTime:v33];
            float v34 = (float)(a5 - v32) + 0.0;
LABEL_34:
            objc_super v36 = NSNumber;
            v37 = [v15 objectForKeyedSubscript:@"playbackDuration"];
            [v37 floatValue];
            *(float *)&double v39 = v34 + v38;
            v40 = [v36 numberWithFloat:v39];
            [v15 setObject:v40 forKeyedSubscript:@"playbackDuration"];

            goto LABEL_45;
          }
          uint64_t v30 = [(PlaybackAction *)v16 action];
          if (*(double *)&a4 != 0.0 || v30 != 3)
          {
            if (kHMETScope)
            {
              v42 = *(id *)kHMETScope;
              if (!v42) {
                goto LABEL_44;
              }
            }
            else
            {
              v42 = MEMORY[0x1E4F14500];
              id v45 = MEMORY[0x1E4F14500];
            }
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              int v46 = 136315650;
              uint64_t v47 = "CHMetrics.mm";
              __int16 v48 = 1024;
              int v49 = 628;
              __int16 v50 = 2080;
              uint64_t v51 = "-[CHMetrics markPlaybackAction:action:time:]";
              _os_log_impl(&dword_1BA902000, v42, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: edge case: unknown case", (uint8_t *)&v46, 0x1Cu);
            }
            goto LABEL_39;
          }
        }
        else
        {
          float v16 = objc_alloc_init(PlaybackAction);
          [v15 setObject:v16 forKeyedSubscript:@"playbackLastAction"];
          if (*(double *)&a4 != 0.0)
          {
            if (kHMETScope)
            {
              __int16 v28 = *(id *)kHMETScope;
              if (!v28) {
                goto LABEL_44;
              }
            }
            else
            {
              __int16 v28 = MEMORY[0x1E4F14500];
              id v44 = MEMORY[0x1E4F14500];
            }
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              int v46 = 136315650;
              uint64_t v47 = "CHMetrics.mm";
              __int16 v48 = 1024;
              int v49 = 605;
              __int16 v50 = 2080;
              uint64_t v51 = "-[CHMetrics markPlaybackAction:action:time:]";
              _os_log_impl(&dword_1BA902000, v28, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: edge case: did not see startAtTime as first call", (uint8_t *)&v46, 0x1Cu);
            }

            goto LABEL_44;
          }
        }
        [(PlaybackAction *)v16 setAction:0];
        float v34 = 0.0;
        *(float *)&double v35 = a5;
        [(PlaybackAction *)v16 setTime:v35];
        goto LABEL_34;
      }
    }
    *(float *)&double v24 = a5;
    id v25 = [NSNumber numberWithFloat:v24];
    [v15 setObject:v25 forKeyedSubscript:@"firstStartTime"];

    goto LABEL_17;
  }
LABEL_45:
}

+ (double)currentTime
{
  return (double)mach_absolute_time() * 0.0000000416666667;
}

- (void)sendDetailedMetricsForPlayerID:(id)a3 endTime:(float)a4
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v71 = a3;
  v66 = -[NSMutableDictionary objectForKeyedSubscript:](self->_playerData, "objectForKeyedSubscript:");
  uint64_t v65 = [v66 objectForKeyedSubscript:@"transientData"];
  v64 = [v66 objectForKeyedSubscript:@"continuousData"];
  id v6 = [v66 objectForKeyedSubscript:@"isAdvanced"];
  char v7 = [v6 BOOLValue];

  if (v7)
  {
    v72 = [v66 objectForKeyedSubscript:@"advancedPlayback"];
    if (!v72
      || ([v72 objectForKeyedSubscript:@"playbackLastAction"],
          id v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          !v8))
    {
      if (kHMETScope)
      {
        double v12 = *(id *)kHMETScope;
        if (!v12) {
          goto LABEL_79;
        }
      }
      else
      {
        double v12 = MEMORY[0x1E4F14500];
        id v17 = MEMORY[0x1E4F14500];
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_78;
      }
      *(_DWORD *)buf = 136315650;
      v88 = "CHMetrics.mm";
      __int16 v89 = 1024;
      int v90 = 530;
      __int16 v91 = 2080;
      v92 = "-[CHMetrics sendDetailedMetricsForPlayerID:endTime:]";
      char v18 = "%25s:%-5d %s: skipping metrics - no advanced playback actions recorded";
      goto LABEL_77;
    }
    int v9 = [v72 objectForKeyedSubscript:@"firstStartTime"];
    [v9 floatValue];
    float v11 = v10;

    if (v11 > a4)
    {
      if (kHMETScope)
      {
        double v12 = *(id *)kHMETScope;
        if (!v12) {
          goto LABEL_79;
        }
      }
      else
      {
        double v12 = MEMORY[0x1E4F14500];
        id v62 = MEMORY[0x1E4F14500];
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_78;
      }
      *(_DWORD *)buf = 136315650;
      v88 = "CHMetrics.mm";
      __int16 v89 = 1024;
      int v90 = 534;
      __int16 v91 = 2080;
      v92 = "-[CHMetrics sendDetailedMetricsForPlayerID:endTime:]";
      char v18 = "%25s:%-5d %s: skipping metrics - first start time > end time";
LABEL_77:
      _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_DEBUG, v18, buf, 0x1Cu);
      goto LABEL_78;
    }
    [(CHMetrics *)self getLoopsForAdvancedPlayer:v66 endTime:a4];
    float v21 = v20;
    float v22 = [v66 objectForKeyedSubscript:@"advancedPlayback"];
    [(CHMetrics *)self resetAdvancedPlaybackData:v22];
  }
  else
  {
    v72 = [v66 objectForKeyedSubscript:@"playback"];
    if (!v72
      || ([v72 objectForKeyedSubscript:@"playbackLastAction"],
          double v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          !v13))
    {
      if (kHMETScope)
      {
        double v12 = *(id *)kHMETScope;
        if (!v12) {
          goto LABEL_79;
        }
      }
      else
      {
        double v12 = MEMORY[0x1E4F14500];
        id v19 = MEMORY[0x1E4F14500];
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_78;
      }
      *(_DWORD *)buf = 136315650;
      v88 = "CHMetrics.mm";
      __int16 v89 = 1024;
      int v90 = 516;
      __int16 v91 = 2080;
      v92 = "-[CHMetrics sendDetailedMetricsForPlayerID:endTime:]";
      char v18 = "%25s:%-5d %s: skipping metrics - no playback actions recorded";
      goto LABEL_77;
    }
    __int16 v14 = [v72 objectForKeyedSubscript:@"firstStartTime"];
    [v14 floatValue];
    float v16 = v15;

    if (v16 > a4)
    {
      if (kHMETScope)
      {
        double v12 = *(id *)kHMETScope;
        if (!v12) {
          goto LABEL_79;
        }
      }
      else
      {
        double v12 = MEMORY[0x1E4F14500];
        id v63 = MEMORY[0x1E4F14500];
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_78;
      }
      *(_DWORD *)buf = 136315650;
      v88 = "CHMetrics.mm";
      __int16 v89 = 1024;
      int v90 = 520;
      __int16 v91 = 2080;
      v92 = "-[CHMetrics sendDetailedMetricsForPlayerID:endTime:]";
      char v18 = "%25s:%-5d %s: skipping metrics - first start time > end time";
      goto LABEL_77;
    }
    [(CHMetrics *)self getLoopsForPlayer:v66 endTime:a4];
    float v21 = v23;
    float v22 = [v66 objectForKeyedSubscript:@"playback"];
    [(CHMetrics *)self resetPlaybackData:v22];
  }

  if (!kHMETScope)
  {
    id v24 = (id)MEMORY[0x1E4F14500];
    id v25 = MEMORY[0x1E4F14500];
    goto LABEL_32;
  }
  id v24 = *(id *)kHMETScope;
  if (v24)
  {
LABEL_32:
    float v26 = v24;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      engineID = self->_engineID;
      v88 = "CHMetrics.mm";
      __int16 v89 = 1024;
      int v90 = 541;
      __int16 v91 = 2080;
      *(_DWORD *)buf = 136316674;
      v92 = "-[CHMetrics sendDetailedMetricsForPlayerID:endTime:]";
      __int16 v93 = 2112;
      v94 = engineID;
      __int16 v95 = 2112;
      id v96 = v71;
      __int16 v97 = 2048;
      uint64_t v98 = [v65 count];
      __int16 v99 = 2048;
      uint64_t v100 = [v64 count];
      _os_log_impl(&dword_1BA902000, v26, OS_LOG_TYPE_INFO, "%25s:%-5d %s: sending metrics for engine %@ player %@ - %lu transient, %lu continuous", buf, 0x44u);
    }
  }
  v72 = [NSNumber numberWithBool:self->_isSPI];
  if (![v65 count]) {
    goto LABEL_53;
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  __int16 v28 = [v65 allValues];
  obuint64_t j = v28;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v77 objects:v86 count:16];
  if (!v29) {
    goto LABEL_52;
  }
  uint64_t v69 = *(void *)v78;
  double v30 = fmax(v21, 1.0);
  do
  {
    for (uint64_t i = 0; i != v29; ++i)
    {
      if (*(void *)v78 != v69) {
        objc_enumerationMutation(obj);
      }
      float v32 = *(void **)(*((void *)&v77 + 1) + 8 * i);
      v84[0] = @"EventType";
      double v33 = objc_msgSend(v32, "objectForKeyedSubscript:");
      v85[0] = v33;
      v84[1] = @"Intensity";
      float v34 = [v32 objectForKeyedSubscript:@"Intensity"];
      v85[1] = v34;
      v84[2] = @"EventCount";
      double v35 = NSNumber;
      objc_super v36 = [v32 objectForKeyedSubscript:@"EventCount"];
      [v36 floatValue];
      float v38 = [v35 numberWithInt:(int)(v30 * v37)];
      v84[3] = @"SPI";
      v85[2] = v38;
      v85[3] = v72;
      double v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:4];

      if (kHMETScope)
      {
        v40 = *(id *)kHMETScope;
        if (!v40) {
          goto LABEL_48;
        }
      }
      else
      {
        v40 = MEMORY[0x1E4F14500];
        id v41 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v88 = "CHMetrics.mm";
        __int16 v89 = 1024;
        int v90 = 550;
        __int16 v91 = 2080;
        v92 = "-[CHMetrics sendDetailedMetricsForPlayerID:endTime:]";
        __int16 v93 = 2112;
        v94 = v39;
        _os_log_impl(&dword_1BA902000, v40, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: logging metrics data for HapticTransient : %@", buf, 0x26u);
      }

LABEL_48:
      CAReportingClientSendMessage();
      if (self->_retainDataForTesting)
      {
        v42 = (void *)[(NSString *)v39 mutableCopy];
        [(CHMetrics *)self retainData:v42 forTestingPlayer:v71];
      }
    }
    __int16 v28 = obj;
    uint64_t v29 = [obj countByEnumeratingWithState:&v77 objects:v86 count:16];
  }
  while (v29);
LABEL_52:

LABEL_53:
  if ([v64 count])
  {
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    double v12 = [v64 allValues];
    obja = v12;
    uint64_t v43 = [v12 countByEnumeratingWithState:&v73 objects:v83 count:16];
    if (!v43) {
      goto LABEL_78;
    }
    uint64_t v70 = *(void *)v74;
    double v44 = fmax(v21, 1.0);
    while (1)
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v74 != v70) {
          objc_enumerationMutation(obja);
        }
        int v46 = *(void **)(*((void *)&v73 + 1) + 8 * j);
        v81[0] = @"EventType";
        uint64_t v47 = objc_msgSend(v46, "objectForKeyedSubscript:");
        v82[0] = v47;
        v81[1] = @"Intensity";
        __int16 v48 = objc_msgSend(v46, "objectForKeyedSubscript:");
        v82[1] = v48;
        v81[2] = @"EventCount";
        int v49 = NSNumber;
        __int16 v50 = objc_msgSend(v46, "objectForKeyedSubscript:");
        [v50 floatValue];
        __int16 v52 = [v49 numberWithInt:(int)(v44 * v51)];
        v82[2] = v52;
        v81[3] = @"Duration";
        double v53 = NSNumber;
        __int16 v54 = objc_msgSend(v46, "objectForKeyedSubscript:");
        [v54 floatValue];
        *(float *)&double v56 = v21 * v55;
        id v57 = [v53 numberWithFloat:v56];
        v81[4] = @"SPI";
        v82[3] = v57;
        v82[4] = v72;
        uint64_t v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:5];

        if (kHMETScope)
        {
          uint64_t v59 = *(id *)kHMETScope;
          if (!v59) {
            goto LABEL_66;
          }
        }
        else
        {
          uint64_t v59 = MEMORY[0x1E4F14500];
          id v60 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v88 = "CHMetrics.mm";
          __int16 v89 = 1024;
          int v90 = 565;
          __int16 v91 = 2080;
          v92 = "-[CHMetrics sendDetailedMetricsForPlayerID:endTime:]";
          __int16 v93 = 2112;
          v94 = v58;
          _os_log_impl(&dword_1BA902000, v59, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: logging metrics data for HapticContinuous : %@", buf, 0x26u);
        }

LABEL_66:
        CAReportingClientSendMessage();
        if (self->_retainDataForTesting)
        {
          uint64_t v61 = (void *)[(NSString *)v58 mutableCopy];
          [(CHMetrics *)self retainData:v61 forTestingPlayer:v71];
        }
      }
      double v12 = obja;
      uint64_t v43 = [obja countByEnumeratingWithState:&v73 objects:v83 count:16];
      if (!v43)
      {
LABEL_78:

        break;
      }
    }
  }
LABEL_79:
}

- (void)preparePlaybackData:(id)a3 events:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (kHMETScope)
  {
    id v8 = *(id *)kHMETScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    engineID = self->_engineID;
    int v13 = 136316162;
    __int16 v14 = "CHMetrics.mm";
    __int16 v15 = 1024;
    int v16 = 805;
    __int16 v17 = 2080;
    char v18 = "-[CHMetrics preparePlaybackData:events:]";
    __int16 v19 = 2112;
    float v20 = engineID;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: preparing playback data for engine %@ player %@", (uint8_t *)&v13, 0x30u);
  }

LABEL_8:
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v11 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"isAdvanced"];
  [(CHMetrics *)self prepareData:v11 events:v7];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v11 setObject:v12 forKeyedSubscript:@"playback"];
  [(CHMetrics *)self resetPlaybackData:v12];
  [(NSMutableDictionary *)self->_playerData setObject:v11 forKeyedSubscript:v6];
}

- (id)transientDictionary:(id)a3 index:(unint64_t)a4 intensity:(float)a5
{
  id v8 = a3;
  id v9 = [(CHMetrics *)self transientSharpnessIndexKeyFromIndexValue:a4];
  *(float *)&double v10 = a5;
  id v11 = [(CHMetrics *)self intensityBinKeyFromValue:v10];
  id v12 = [v9 stringByAppendingString:v11];
  id v13 = [v8 objectForKey:v12];
  if (!v13)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v13 setObject:v9 forKeyedSubscript:@"EventType"];
    [v13 setObject:v11 forKeyedSubscript:@"Intensity"];
    [v13 setObject:&unk_1F145A4F0 forKeyedSubscript:@"EventCount"];
    [v8 setObject:v13 forKey:v12];
  }

  return v13;
}

- (void)prepareData:(id)a3 events:(id)a4
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v69 = a3;
  id v68 = a4;
  id v6 = [NSNumber numberWithDouble:0.0];
  id v71 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v70 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v7 = v68;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v81 objects:v92 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v82 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        if (![v11 eventCategory])
        {
          uint64_t v12 = [v11 fixedParamCount];
          if (v12 < 1)
          {
            float v15 = 0.0;
          }
          else
          {
            unint64_t v13 = v12 + 1;
            uint64_t v14 = 16 * v12;
            float v15 = 0.0;
            do
            {
              uint64_t v16 = [v11 fixedParams] + v14;
              uint64_t v17 = *(void *)(v16 - 16);
              if (v17 == 2012 || v17 == 1012) {
                float v15 = pow(1.8204, (float)(*(float *)(v16 - 8) * 10.0)) * 0.02;
              }
              --v13;
              v14 -= 16;
            }
            while (v13 > 1);
          }
          [v6 doubleValue];
          double v19 = v18;
          [v11 time];
          double v21 = v20;
          [v11 duration];
          double v23 = v21 + v22;
          double v24 = v15;
          if (v19 < v23 + v15)
          {
            id v25 = NSNumber;
            [v11 time];
            double v27 = v26;
            [v11 duration];
            uint64_t v29 = [v25 numberWithDouble:v27 + v28 + v24];

            id v6 = (void *)v29;
          }
          uint64_t v30 = [v11 eventType];
          long long v78 = 0;
          long long v79 = 0;
          uint64_t v80 = 0;
          std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v78, self->_hapticContinuousSustainedIDs.__begin_, (uint64_t)self->_hapticContinuousSustainedIDs.__end_, self->_hapticContinuousSustainedIDs.__end_ - self->_hapticContinuousSustainedIDs.__begin_);
          if ([(CHMetrics *)self isEventType:v30 inList:&v78])
          {
            BOOL v31 = 1;
          }
          else
          {
            uint64_t v32 = [v11 eventType];
            __p = 0;
            long long v76 = 0;
            uint64_t v77 = 0;
            std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, self->_hapticContinuousNonsustainedIDs.__begin_, (uint64_t)self->_hapticContinuousNonsustainedIDs.__end_, self->_hapticContinuousNonsustainedIDs.__end_ - self->_hapticContinuousNonsustainedIDs.__begin_);
            BOOL v31 = [(CHMetrics *)self isEventType:v32 inList:&__p];
            if (__p)
            {
              long long v76 = __p;
              operator delete(__p);
            }
          }
          if (v78)
          {
            long long v79 = v78;
            operator delete(v78);
          }
          if (v31)
          {
            uint64_t v33 = 0;
            char v34 = 0;
            uint64_t v35 = 0;
            float v36 = 0.0;
            while (v35 < [v11 fixedParamCount])
            {
              if (*(void *)([v11 fixedParams] + v33) == 2000)
              {
                float v36 = *(float *)([v11 fixedParams] + v33 + 8);
                char v34 = 1;
              }
              ++v35;
              v33 += 16;
            }
            unint64_t v43 = [v11 eventType];
            if (v34) {
              *(float *)&double v44 = v36;
            }
            else {
              *(float *)&double v44 = 1.0;
            }
            id v45 = [(CHMetrics *)self continousDictionary:v71 slot:v43 >> 8 intensity:v44];
            int v46 = NSNumber;
            uint64_t v47 = [v45 objectForKeyedSubscript:@"Duration"];
            [v47 floatValue];
            float v49 = v48;
            [v11 duration];
            double v51 = v50 + v49 + v24;
            *(float *)&double v51 = v51;
            __int16 v52 = [v46 numberWithFloat:v51];
            [v45 setObject:v52 forKeyedSubscript:@"Duration"];

            double v53 = NSNumber;
            __int16 v54 = [v45 objectForKeyedSubscript:@"EventCount"];
            float v55 = objc_msgSend(v53, "numberWithInteger:", (int)(objc_msgSend(v54, "intValue") + 1));
            [v45 setObject:v55 forKeyedSubscript:@"EventCount"];
          }
          else
          {
            uint64_t v37 = [v11 eventType];
            v72 = 0;
            long long v73 = 0;
            uint64_t v74 = 0;
            std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v72, self->_hapticTransientIDs.__begin_, (uint64_t)self->_hapticTransientIDs.__end_, self->_hapticTransientIDs.__end_ - self->_hapticTransientIDs.__begin_);
            BOOL v38 = [(CHMetrics *)self isEventType:v37 inList:&v72];
            if (v72)
            {
              long long v73 = v72;
              operator delete(v72);
            }
            if (v38)
            {
              uint64_t v39 = 0;
              char v40 = 0;
              uint64_t v41 = 0;
              float v42 = 0.0;
              while (v41 < [v11 fixedParamCount])
              {
                if (*(void *)([v11 fixedParams] + v39) == 2000)
                {
                  float v42 = *(float *)([v11 fixedParams] + v39 + 8);
                  char v40 = 1;
                }
                ++v41;
                v39 += 16;
              }
              unint64_t v60 = [v11 eventType];
              if (v40) {
                *(float *)&double v61 = v42;
              }
              else {
                *(float *)&double v61 = 1.0;
              }
              id v45 = [(CHMetrics *)self transientDictionary:v70 index:v60 >> 8 intensity:v61];
              id v62 = NSNumber;
              __int16 v54 = [v45 objectForKeyedSubscript:@"EventCount"];
              float v55 = objc_msgSend(v62, "numberWithInteger:", (int)(objc_msgSend(v54, "intValue") + 1));
              [v45 setObject:v55 forKeyedSubscript:@"EventCount"];
            }
            else
            {
              *(void *)buf = [v11 eventType];
              if (!std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::find<AVHapticPlayerEventType>(&self->_legacyHapticTransientEventTypeMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)buf))continue; {
              uint64_t v56 = 0;
              }
              char v57 = 0;
              uint64_t v58 = 0;
              float v59 = 0.0;
              while (v58 < [v11 fixedParamCount])
              {
                if (*(void *)([v11 fixedParams] + v56) == 2000)
                {
                  float v59 = *(float *)([v11 fixedParams] + v56 + 8);
                  char v57 = 1;
                }
                ++v58;
                v56 += 16;
              }
              uint64_t v63 = [v11 eventType];
              if (v57) {
                *(float *)&double v64 = v59;
              }
              else {
                *(float *)&double v64 = 1.0;
              }
              id v45 = [(CHMetrics *)self legacyTransientDictionary:v70 eventType:v63 intensity:v64];
              uint64_t v65 = NSNumber;
              __int16 v54 = [v45 objectForKeyedSubscript:@"EventCount"];
              float v55 = objc_msgSend(v65, "numberWithInteger:", (int)(objc_msgSend(v54, "intValue") + 1));
              [v45 setObject:v55 forKeyedSubscript:@"EventCount"];
            }
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v81 objects:v92 count:16];
    }
    while (v8);
  }

  if (kHMETScope)
  {
    v66 = *(id *)kHMETScope;
    if (!v66) {
      goto LABEL_65;
    }
  }
  else
  {
    v66 = MEMORY[0x1E4F14500];
    id v67 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "CHMetrics.mm";
    __int16 v86 = 1024;
    int v87 = 795;
    __int16 v88 = 2080;
    __int16 v89 = "-[CHMetrics prepareData:events:]";
    __int16 v90 = 2112;
    __int16 v91 = v6;
    _os_log_impl(&dword_1BA902000, v66, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: calculated pattern duration: %@", buf, 0x26u);
  }

LABEL_65:
  [v69 setObject:v71 forKeyedSubscript:@"continuousData"];
  [v69 setObject:v70 forKeyedSubscript:@"transientData"];
  [v69 setObject:v6 forKeyedSubscript:@"patternDuration"];
}

- (BOOL)isEventType:(unint64_t)a3 inList:(vector<unsigned)long
{
  begin = a4->__begin_;
  end = a4->__end_;
  if (a4->__begin_ != end)
  {
    while (*begin != a3)
    {
      if (++begin == end)
      {
        begin = a4->__end_;
        return begin != end;
      }
    }
  }
  return begin != end;
}

- (void)resetPlaybackData:(id)a3
{
  id v3 = a3;
  [v3 setObject:&unk_1F145A4B8 forKeyedSubscript:@"playbackDuration"];
  [v3 setObject:0 forKeyedSubscript:@"playbackLastAction"];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"edgeCase"];
  [v3 setObject:&unk_1F145A4C8 forKeyedSubscript:@"firstStartTime"];
}

void __29__CHMetrics_dispatchOnLocal___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (kHMETScope)
  {
    if (*(unsigned char *)(kHMETScope + 8))
    {
      v1 = *(id *)kHMETScope;
      if (v1)
      {
        v2 = v1;
        if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
        {
          int v3 = 136315650;
          id v4 = "CHMetrics.mm";
          __int16 v5 = 1024;
          int v6 = 426;
          __int16 v7 = 2080;
          uint64_t v8 = "-[CHMetrics dispatchOnLocal:]_block_invoke";
          _os_log_impl(&dword_1BA902000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Block async dispatch complete>", (uint8_t *)&v3, 0x1Cu);
        }
      }
    }
  }
}

void __61__CHMetrics_handleInitForPlayer_events_isAdvanced_patternID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 56)) {
      [WeakRetained prepareAdvancedPlaybackData:v2 events:v3];
    }
    else {
      [WeakRetained preparePlaybackData:v2 events:v3];
    }
  }
}

void __58__CHMetrics_handleActionForPlayer_action_time_isAdvanced___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 48);
    double v4 = *(double *)(a1 + 56);
    *(float *)&double v4 = v4;
    if (*(unsigned char *)(a1 + 64)) {
      [WeakRetained markAdvancedPlaybackAction:v2 action:v3 time:v4];
    }
    else {
      [WeakRetained markPlaybackAction:v2 action:v3 time:v4];
    }
  }
}

void __44__CHMetrics_handleFinishedForPlayersAtTime___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = WeakRetained[20];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          double v8 = *(double *)(a1 + 40);
          *(float *)&double v8 = v8;
          objc_msgSend(v3, "sendDetailedMetricsForPlayerID:endTime:", *(void *)(*((void *)&v9 + 1) + 8 * v7++), v8, (void)v9);
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (id)transientSharpnessIndexKeyFromIndexValue:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"SharpnessIndex%lu", a3);
}

- (void)stopReporter
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_sessionIsShared)
  {
    if (kHMETScope)
    {
      uint64_t v3 = *(id *)kHMETScope;
      if (!v3)
      {
LABEL_9:
        CAReportingClientStopReporter();
        return;
      }
    }
    else
    {
      uint64_t v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      engineID = self->_engineID;
      int v6 = 136315906;
      uint64_t v7 = "CHMetrics.mm";
      __int16 v8 = 1024;
      int v9 = 395;
      __int16 v10 = 2080;
      long long v11 = "-[CHMetrics stopReporter]";
      __int16 v12 = 2112;
      unint64_t v13 = engineID;
      _os_log_impl(&dword_1BA902000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: stopping reporter for engine %@", (uint8_t *)&v6, 0x26u);
    }

    goto LABEL_9;
  }
}

- (void)sendPatternLibraryMetrics
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (kHMETScope)
  {
    id v3 = *(id *)kHMETScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = (id)MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  uint64_t v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_patternLibraryData count];
    *(_DWORD *)buf = 136315906;
    double v23 = "CHMetrics.mm";
    __int16 v24 = 1024;
    int v25 = 468;
    __int16 v26 = 2080;
    double v27 = "-[CHMetrics sendPatternLibraryMetrics]";
    __int16 v28 = 2048;
    uint64_t v29 = v6;
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: sending %lu pattern library metrics", buf, 0x26u);
  }

LABEL_8:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  obuint64_t j = self->_patternLibraryData;
  uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(id *)(*((void *)&v15 + 1) + 8 * i);
        v20[0] = v10;
        v19[0] = @"patternID";
        v19[1] = @"Count";
        long long v11 = [(NSMutableDictionary *)self->_patternLibraryData objectForKeyedSubscript:v10];
        v20[1] = v11;
        v19[2] = @"SPI";
        __int16 v12 = [NSNumber numberWithBool:self->_isSPI];
        v20[2] = v12;
        unint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

        CAReportingClientSendMessage();
      }
      uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v7);
  }

  [(NSMutableDictionary *)self->_patternLibraryData removeAllObjects];
}

- (id)intensityBinKeyFromValue:(float)a3
{
  if (self->_CHMetricsIntensityBin1To2Value > a3) {
    return @"IntensityBin1";
  }
  if (self->_CHMetricsIntensityBin2To3Value <= a3) {
    return @"IntensityBin3";
  }
  return @"IntensityBin2";
}

- (void)handleStartForPlayer:(id)a3 time:(double)a4 isAdvanced:(BOOL)a5 patternID:(id)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v10 = a6;
  if (!v10) {
    [(CHMetrics *)self handleActionForPlayer:v11 action:0 time:v7 isAdvanced:a4];
  }
  [(CHMetrics *)self addPatternLibraryMetric:v10];
}

- (void)handleInitForPlayer:(id)a3 events:(id)a4 isAdvanced:(BOOL)a5 patternID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (self->_isSPI) {
    unint64_t v13 = @"initPatternPlayer_SPI";
  }
  else {
    unint64_t v13 = @"initPatternPlayer";
  }
  [(CHMetrics *)self logMetric:v13 value:&unk_1F145A4D8];
  if (!v12)
  {
    uint64_t v14 = [(CHMetrics *)self getIDForPlayer:v10];
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__CHMetrics_handleInitForPlayer_events_isAdvanced_patternID___block_invoke;
    v16[3] = &unk_1E622E108;
    objc_copyWeak(&v19, &location);
    BOOL v20 = a5;
    id v17 = v14;
    id v18 = v11;
    id v15 = v14;
    [(CHMetrics *)self dispatchOnLocal:v16];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (void)handleFinishedForPlayersAtTime:(double)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (kHMETScope)
  {
    uint64_t v5 = *(id *)kHMETScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    engineID = self->_engineID;
    *(_DWORD *)buf = 136315906;
    id v11 = "CHMetrics.mm";
    __int16 v12 = 1024;
    int v13 = 324;
    __int16 v14 = 2080;
    id v15 = "-[CHMetrics handleFinishedForPlayersAtTime:]";
    __int16 v16 = 2112;
    id v17 = engineID;
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: flushing all player data for engine %@", buf, 0x26u);
  }

LABEL_8:
  objc_initWeak((id *)buf, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__CHMetrics_handleFinishedForPlayersAtTime___block_invoke;
  v8[3] = &unk_1E622E158;
  objc_copyWeak(v9, (id *)buf);
  v9[1] = *(id *)&a3;
  [(CHMetrics *)self dispatchOnLocal:v8];
  objc_destroyWeak(v9);
  objc_destroyWeak((id *)buf);
}

- (void)handleEngineStop
{
  [(CHMetrics *)self logPowerLogMetric:@"EngineOff"];
  [(CHMetrics *)self sendPatternLibraryMetrics];

  [(CHMetrics *)self stopReporter];
}

- (void)handleActionForPlayer:(id)a3 action:(int64_t)a4 time:(double)a5 isAdvanced:(BOOL)a6
{
  id v10 = a3;
  id v11 = [(CHMetrics *)self getIDForPlayer:v10];
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__CHMetrics_handleActionForPlayer_action_time_isAdvanced___block_invoke;
  v13[3] = &unk_1E622E130;
  objc_copyWeak(v15, &location);
  BOOL v16 = a6;
  id v14 = v11;
  v15[1] = (id)a4;
  v15[2] = *(id *)&a5;
  id v12 = v11;
  [(CHMetrics *)self dispatchOnLocal:v13];

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

- (void)dispatchOnLocal:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kHMETScope)
  {
    if (*(unsigned char *)(kHMETScope + 8))
    {
      uint64_t v5 = *(id *)kHMETScope;
      if (v5)
      {
        id v6 = v5;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          BOOL v7 = (void *)MEMORY[0x1BA9F2D90](v4);
          *(_DWORD *)buf = 136315906;
          int v13 = "CHMetrics.mm";
          __int16 v14 = 1024;
          int v15 = 423;
          __int16 v16 = 2080;
          id v17 = "-[CHMetrics dispatchOnLocal:]";
          __int16 v18 = 2048;
          id v19 = v7;
          _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Dispatching block %p async...>", buf, 0x26u);
        }
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__CHMetrics_dispatchOnLocal___block_invoke;
  block[3] = &unk_1E622E180;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(dispatchQueue, block);
}

- (void)addPatternLibraryMetric:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v4 = [(NSMutableDictionary *)self->_patternLibraryData objectForKey:v8];

    if (v4)
    {
      uint64_t v5 = NSNumber;
      id v6 = [(NSMutableDictionary *)self->_patternLibraryData objectForKeyedSubscript:v8];
      BOOL v7 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
      [(NSMutableDictionary *)self->_patternLibraryData setObject:v7 forKeyedSubscript:v8];
    }
    else
    {
      [(NSMutableDictionary *)self->_patternLibraryData setObject:&unk_1F145A4D8 forKeyedSubscript:v8];
    }
  }
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_sessionIsShared && self->_reporterID >= 2) {
    CAReportingClientDestroyReporterID();
  }
  if (kHMETScope)
  {
    id v3 = *(id *)kHMETScope;
    if (!v3) {
      goto LABEL_11;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    engineID = self->_engineID;
    *(_DWORD *)buf = 136315906;
    id v8 = "CHMetrics.mm";
    __int16 v9 = 1024;
    int v10 = 206;
    __int16 v11 = 2080;
    id v12 = "-[CHMetrics dealloc]";
    __int16 v13 = 2112;
    __int16 v14 = engineID;
    _os_log_impl(&dword_1BA902000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: deallocating metrics for engine %@", buf, 0x26u);
  }

LABEL_11:
  v6.receiver = self;
  v6.super_class = (Class)CHMetrics;
  [(CHMetrics *)&v6 dealloc];
}

- (void)handleParamCurveEncountered
{
  if (self->_isSPI) {
    uint64_t v2 = @"initParameterCurve_SPI";
  }
  else {
    uint64_t v2 = @"initParameterCurve";
  }
  [(CHMetrics *)self logMetric:v2 value:&unk_1F145A4D8];
}

- (void)logPatternLibraryMetric:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 length])
  {
    if (kHMETScope)
    {
      objc_super v6 = *(id *)kHMETScope;
      if (!v6)
      {
LABEL_10:
        id v8 = objc_msgSend(NSNumber, "numberWithBool:", self->_isSPI, @"patternID", @"Count", @"SPI", v5, &unk_1F145A4D8);
        v11[2] = v8;
        __int16 v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:3];

        CAReportingClientSendMessage();
        goto LABEL_11;
      }
    }
    else
    {
      objc_super v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v13 = "CHMetrics.mm";
      __int16 v14 = 1024;
      int v15 = 489;
      __int16 v16 = 2080;
      id v17 = "-[CHMetrics logPatternLibraryMetric:]";
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: logging metrics for pattern library \"%@\"", buf, 0x26u);
    }

    goto LABEL_10;
  }
LABEL_11:
}

- (void)markAdvancedPlaybackAction:(id)a3 action:(int64_t)a4 time:(float)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  double v8 = COERCE_DOUBLE(a3);
  if (kHMETScope)
  {
    __int16 v9 = *(id *)kHMETScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    __int16 v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    engineID = self->_engineID;
    int v46 = 136316418;
    uint64_t v47 = "CHMetrics.mm";
    __int16 v48 = 1024;
    int v49 = 639;
    __int16 v50 = 2080;
    double v51 = "-[CHMetrics markAdvancedPlaybackAction:action:time:]";
    __int16 v52 = 2048;
    double v53 = *(double *)&a4;
    __int16 v54 = 2112;
    double v55 = *(double *)&engineID;
    __int16 v56 = 2112;
    double v57 = v8;
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: marking advanced action %ld for engine %@ player %@", (uint8_t *)&v46, 0x3Au);
  }

LABEL_8:
  +[CHMetrics currentTime];
  if (v12 > a5)
  {
    +[CHMetrics currentTime];
    a5 = v13;
  }
  __int16 v14 = [(NSMutableDictionary *)self->_playerData objectForKeyedSubscript:*(void *)&v8];
  int v15 = [v14 objectForKeyedSubscript:@"advancedPlayback"];
  __int16 v16 = [v15 objectForKeyedSubscript:@"playbackLastAction"];
  id v17 = [v15 objectForKeyedSubscript:@"edgeCase"];
  char v18 = [v17 BOOLValue];

  if ((v18 & 1) == 0)
  {
    if (*(double *)&a4 != 0.0) {
      goto LABEL_17;
    }
    id v19 = [v15 objectForKeyedSubscript:@"firstStartTime"];
    [v19 floatValue];
    if (v20 < 0.0)
    {
    }
    else
    {
      double v21 = [v15 objectForKeyedSubscript:@"firstStartTime"];
      [v21 floatValue];
      BOOL v23 = a5 < v22;

      if (!v23)
      {
LABEL_17:
        if (v16)
        {
          [(PlaybackAction *)v16 time];
          if (a5 < v26)
          {
            if (kHMETScope)
            {
              id v27 = *(id *)kHMETScope;
              if (!v27)
              {
LABEL_36:
                [v15 setObject:&unk_1F145A4D8 forKeyedSubscript:@"edgeCase"];
                goto LABEL_46;
              }
            }
            else
            {
              id v27 = (id)MEMORY[0x1E4F14500];
              id v33 = MEMORY[0x1E4F14500];
            }
            char v34 = v27;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              [(PlaybackAction *)v16 time];
              int v46 = 136316162;
              uint64_t v47 = "CHMetrics.mm";
              __int16 v48 = 1024;
              int v49 = 675;
              __int16 v50 = 2080;
              double v51 = "-[CHMetrics markAdvancedPlaybackAction:action:time:]";
              __int16 v52 = 2048;
              double v53 = a5;
              __int16 v54 = 2048;
              double v55 = v35;
              _os_log_impl(&dword_1BA902000, v34, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: edge case: action time out of order %g < %g", (uint8_t *)&v46, 0x30u);
            }

            goto LABEL_36;
          }
          float v29 = 0.0;
          if ([(PlaybackAction *)v16 action] == 1 && (a4 | 2) == 2)
          {
            [(PlaybackAction *)v16 time];
            float v29 = a5 - v30;
            if (kHMETScope)
            {
              id v31 = *(id *)kHMETScope;
              if (!v31) {
                goto LABEL_45;
              }
            }
            else
            {
              id v31 = (id)MEMORY[0x1E4F14500];
              id v37 = MEMORY[0x1E4F14500];
            }
            BOOL v38 = v31;
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              [(PlaybackAction *)v16 time];
              int v46 = 136316418;
              uint64_t v47 = "CHMetrics.mm";
              __int16 v48 = 1024;
              int v49 = 683;
              __int16 v50 = 2080;
              double v51 = "-[CHMetrics markAdvancedPlaybackAction:action:time:]";
              __int16 v52 = 2048;
              double v53 = v29;
              __int16 v54 = 2048;
              double v55 = a5;
              __int16 v56 = 2048;
              double v57 = v39;
              _os_log_impl(&dword_1BA902000, v38, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: paused duration: %g = %g - %g", (uint8_t *)&v46, 0x3Au);
            }
          }
        }
        else
        {
          __int16 v16 = objc_alloc_init(PlaybackAction);
          [v15 setObject:v16 forKeyedSubscript:@"playbackLastAction"];
          if (*(double *)&a4 != 0.0)
          {
            if (kHMETScope)
            {
              __int16 v28 = *(id *)kHMETScope;
              if (!v28) {
                goto LABEL_36;
              }
            }
            else
            {
              __int16 v28 = MEMORY[0x1E4F14500];
              id v36 = MEMORY[0x1E4F14500];
            }
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              int v46 = 136315650;
              uint64_t v47 = "CHMetrics.mm";
              __int16 v48 = 1024;
              int v49 = 667;
              __int16 v50 = 2080;
              double v51 = "-[CHMetrics markAdvancedPlaybackAction:action:time:]";
              _os_log_impl(&dword_1BA902000, v28, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: edge case: did not see startAtTime as first call", (uint8_t *)&v46, 0x1Cu);
            }

            goto LABEL_36;
          }
          [(PlaybackAction *)v16 setAction:0];
          float v29 = 0.0;
          *(float *)&double v32 = a5;
          [(PlaybackAction *)v16 setTime:v32];
        }
LABEL_45:
        char v40 = NSNumber;
        uint64_t v41 = [v15 objectForKeyedSubscript:@"pausedDuration"];
        [v41 floatValue];
        *(float *)&double v43 = v29 + v42;
        double v44 = [v40 numberWithFloat:v43];
        [v15 setObject:v44 forKeyedSubscript:@"pausedDuration"];

        [(PlaybackAction *)v16 setAction:a4];
        *(float *)&double v45 = a5;
        [(PlaybackAction *)v16 setTime:v45];
        goto LABEL_46;
      }
    }
    *(float *)&double v24 = a5;
    int v25 = [NSNumber numberWithFloat:v24];
    [v15 setObject:v25 forKeyedSubscript:@"firstStartTime"];

    goto LABEL_17;
  }
LABEL_46:
}

- (void)resetAdvancedPlaybackData:(id)a3
{
  id v3 = a3;
  [v3 setObject:&unk_1F145A4B8 forKeyedSubscript:@"pausedDuration"];
  [v3 setObject:0 forKeyedSubscript:@"playbackLastAction"];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"edgeCase"];
  [v3 setObject:&unk_1F145A4C8 forKeyedSubscript:@"firstStartTime"];
}

- (void)prepareAdvancedPlaybackData:(id)a3 events:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (kHMETScope)
  {
    double v8 = *(id *)kHMETScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    double v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    engineID = self->_engineID;
    int v13 = 136316162;
    __int16 v14 = "CHMetrics.mm";
    __int16 v15 = 1024;
    int v16 = 817;
    __int16 v17 = 2080;
    char v18 = "-[CHMetrics prepareAdvancedPlaybackData:events:]";
    __int16 v19 = 2112;
    float v20 = engineID;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: preparing advanced playback data for engine %@ player %@", (uint8_t *)&v13, 0x30u);
  }

LABEL_8:
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isAdvanced"];
  [(CHMetrics *)self prepareData:v11 events:v7];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v11 setObject:v12 forKeyedSubscript:@"advancedPlayback"];
  [(CHMetrics *)self resetAdvancedPlaybackData:v12];
  [(NSMutableDictionary *)self->_playerData setObject:v11 forKeyedSubscript:v6];
}

- (void)removePlaybackData:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kHMETScope)
  {
    uint64_t v5 = *(id *)kHMETScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    engineID = self->_engineID;
    int v8 = 136316162;
    id v9 = "CHMetrics.mm";
    __int16 v10 = 1024;
    int v11 = 829;
    __int16 v12 = 2080;
    int v13 = "-[CHMetrics removePlaybackData:]";
    __int16 v14 = 2112;
    __int16 v15 = engineID;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: removing playback data for engine %@ player %@", (uint8_t *)&v8, 0x30u);
  }

LABEL_8:
  [(NSMutableDictionary *)self->_playerData removeObjectForKey:v4];
}

- (float)getLoopsForAdvancedPlayer:(id)a3 endTime:(double)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"advancedPlayback"];
  id v7 = [v6 objectForKeyedSubscript:@"edgeCase"];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    if (kHMETScope)
    {
      id v9 = *(id *)kHMETScope;
      if (!v9)
      {
LABEL_14:
        float v23 = 1.0;
        goto LABEL_15;
      }
    }
    else
    {
      id v9 = MEMORY[0x1E4F14500];
      id v24 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136315650;
      id v27 = "CHMetrics.mm";
      __int16 v28 = 1024;
      int v29 = 871;
      __int16 v30 = 2080;
      id v31 = "-[CHMetrics getLoopsForAdvancedPlayer:endTime:]";
      _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: edge case - no loop multiplier, log once", (uint8_t *)&v26, 0x1Cu);
    }

    goto LABEL_14;
  }
  __int16 v10 = [v6 objectForKeyedSubscript:@"firstStartTime"];
  [v10 floatValue];
  float v12 = v11;

  int v13 = [v5 objectForKeyedSubscript:@"patternDuration"];
  [v13 floatValue];
  float v15 = v14;

  __int16 v16 = [v6 objectForKeyedSubscript:@"pausedDuration"];
  [v16 floatValue];
  float v18 = v17;

  __int16 v19 = [v6 objectForKeyedSubscript:@"playbackLastAction"];
  if ([v19 action] == 3 && (objc_msgSend(v19, "time"), v20 < a4))
  {
    [v19 time];
    float v22 = (float)(v21 - v12) - v18;
  }
  else
  {
    float v22 = a4 - v12 - v18;
  }
  float v23 = v22 / v15;

LABEL_15:
  return v23;
}

- (id)continousDictionary:(id)a3 slot:(unint64_t)a4 intensity:(float)a5
{
  id v8 = a3;
  id v9 = [(CHMetrics *)self continuousSharpnessSlotKeyFromSlotValue:a4];
  *(float *)&double v10 = a5;
  float v11 = [(CHMetrics *)self intensityBinKeyFromValue:v10];
  float v12 = [v9 stringByAppendingString:v11];
  id v13 = [v8 objectForKey:v12];
  if (!v13)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v13 setObject:v9 forKeyedSubscript:@"EventType"];
    [v13 setObject:v11 forKeyedSubscript:@"Intensity"];
    [v13 setObject:&unk_1F145A4B8 forKeyedSubscript:@"Duration"];
    [v13 setObject:&unk_1F145A4F0 forKeyedSubscript:@"EventCount"];
    [v8 setObject:v13 forKey:v12];
  }

  return v13;
}

- (id)continuousSharpnessSlotKeyFromSlotValue:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"SharpnessSlot%lu", a3);
}

- (id)legacyTransientDictionary:(id)a3 eventType:(unint64_t)a4 intensity:(float)a5
{
  id v8 = a3;
  unint64_t v16 = a4;
  id v9 = std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::find<AVHapticPlayerEventType>(&self->_legacyHapticTransientEventTypeMap.__table_.__bucket_list_.__ptr_.__value_, &v16);
  if (!v9) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  id v10 = (id)v9[3];
  *(float *)&double v11 = a5;
  float v12 = [(CHMetrics *)self intensityBinKeyFromValue:v11];
  id v13 = [v10 stringByAppendingString:v12];
  id v14 = [v8 objectForKey:v13];
  if (!v14)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v14 setObject:v10 forKeyedSubscript:@"EventType"];
    [v14 setObject:v12 forKeyedSubscript:@"Intensity"];
    [v14 setObject:&unk_1F145A4F0 forKeyedSubscript:@"EventCount"];
    [v8 setObject:v14 forKey:v13];
  }

  return v14;
}

- (void)setMetricsTestModeEnabled
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (kHMETScope)
  {
    id v3 = *(id *)kHMETScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315650;
    id v8 = "CHMetrics.mm";
    __int16 v9 = 1024;
    int v10 = 992;
    __int16 v11 = 2080;
    float v12 = "-[CHMetrics setMetricsTestModeEnabled]";
    _os_log_impl(&dword_1BA902000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: test mode ENABLED", (uint8_t *)&v7, 0x1Cu);
  }

LABEL_8:
  self->_retainDataForTesting = 1;
  if (!self->_dataForTesting)
  {
    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dataForTesting = self->_dataForTesting;
    self->_dataForTesting = v5;
  }
}

- (id)getMetricsForPlayer:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kHMETScope)
  {
    id v5 = *(id *)kHMETScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    engineID = self->_engineID;
    int v11 = 136316162;
    float v12 = "CHMetrics.mm";
    __int16 v13 = 1024;
    int v14 = 1001;
    __int16 v15 = 2080;
    unint64_t v16 = "-[CHMetrics getMetricsForPlayer:]";
    __int16 v17 = 2112;
    float v18 = engineID;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: retrieving metrics for engine %@ player %@", (uint8_t *)&v11, 0x30u);
  }

LABEL_8:
  id v8 = [(CHMetrics *)self getIDForPlayer:v4];
  __int16 v9 = [(NSMutableDictionary *)self->_dataForTesting objectForKeyedSubscript:v8];

  return v9;
}

- (void)retainData:(id)a3 forTestingPlayer:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (kHMETScope)
  {
    id v8 = *(id *)kHMETScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v52 = "CHMetrics.mm";
    __int16 v53 = 1024;
    int v54 = 1009;
    __int16 v55 = 2080;
    __int16 v56 = "-[CHMetrics retainData:forTestingPlayer:]";
    __int16 v57 = 2112;
    id v58 = v7;
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: adding test player data for player %@", buf, 0x26u);
  }

LABEL_8:
  int v10 = [(NSMutableDictionary *)self->_dataForTesting objectForKeyedSubscript:v7];
  BOOL v11 = v10 == 0;

  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)self->_dataForTesting setObject:v12 forKeyedSubscript:v7];
  }
  __int16 v13 = NSString;
  int v14 = [v6 objectForKeyedSubscript:@"EventType"];
  uint64_t v15 = [v6 objectForKeyedSubscript:@"Intensity"];
  unint64_t v16 = [v13 stringWithFormat:@"%@%@", v14, v15];

  __int16 v17 = [(NSMutableDictionary *)self->_dataForTesting objectForKeyedSubscript:v7];
  float v18 = [v17 objectForKeyedSubscript:v16];
  LOBYTE(v15) = v18 == 0;

  if (v15)
  {
    id v20 = [(NSMutableDictionary *)self->_dataForTesting objectForKeyedSubscript:v7];
    [v20 setValue:v6 forKey:v16];
    goto LABEL_29;
  }
  if (kHMETScope)
  {
    id v19 = *(id *)kHMETScope;
    if (!v19) {
      goto LABEL_19;
    }
  }
  else
  {
    id v19 = (id)MEMORY[0x1E4F14500];
    id v21 = MEMORY[0x1E4F14500];
  }
  float v22 = v19;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    float v23 = [(NSMutableDictionary *)self->_dataForTesting objectForKeyedSubscript:v7];
    id v24 = [v23 objectForKeyedSubscript:v16];
    *(_DWORD *)buf = 136315906;
    __int16 v52 = "CHMetrics.mm";
    __int16 v53 = 1024;
    int v54 = 1016;
    __int16 v55 = 2080;
    __int16 v56 = "-[CHMetrics retainData:forTestingPlayer:]";
    __int16 v57 = 2112;
    id v58 = v24;
    _os_log_impl(&dword_1BA902000, v22, OS_LOG_TYPE_INFO, "%25s:%-5d %s: %@", buf, 0x26u);
  }
LABEL_19:
  if (!kHMETScope)
  {
    int v25 = MEMORY[0x1E4F14500];
    id v26 = MEMORY[0x1E4F14500];
    goto LABEL_23;
  }
  int v25 = *(id *)kHMETScope;
  if (v25)
  {
LABEL_23:
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v52 = "CHMetrics.mm";
      __int16 v53 = 1024;
      int v54 = 1017;
      __int16 v55 = 2080;
      __int16 v56 = "-[CHMetrics retainData:forTestingPlayer:]";
      __int16 v57 = 2112;
      id v58 = v6;
      _os_log_impl(&dword_1BA902000, v25, OS_LOG_TYPE_INFO, "%25s:%-5d %s: %@", buf, 0x26u);
    }
  }
  id v27 = [(NSMutableDictionary *)self->_dataForTesting objectForKeyedSubscript:v7];
  __int16 v28 = [v27 objectForKeyedSubscript:v16];
  int v29 = [v28 objectForKeyedSubscript:@"Duration"];
  BOOL v30 = v29 == 0;

  if (!v30)
  {
    id v31 = NSNumber;
    __int16 v50 = [(NSMutableDictionary *)self->_dataForTesting objectForKeyedSubscript:v7];
    uint64_t v32 = [v50 objectForKeyedSubscript:v16];
    id v33 = [v32 objectForKeyedSubscript:@"Duration"];
    [v33 floatValue];
    float v35 = v34;
    id v36 = [v6 objectForKeyedSubscript:@"Duration"];
    [v36 floatValue];
    *(float *)&double v38 = v35 + v37;
    float v39 = [v31 numberWithFloat:v38];
    char v40 = [(NSMutableDictionary *)self->_dataForTesting objectForKeyedSubscript:v7];
    uint64_t v41 = [v40 objectForKeyedSubscript:v16];
    [v41 setObject:v39 forKeyedSubscript:@"Duration"];
  }
  float v42 = NSNumber;
  id v20 = [(NSMutableDictionary *)self->_dataForTesting objectForKeyedSubscript:v7];
  double v43 = [v20 objectForKeyedSubscript:v16];
  double v44 = [v43 objectForKeyedSubscript:@"EventCount"];
  int v45 = [v44 intValue];
  int v46 = [v6 objectForKeyedSubscript:@"EventCount"];
  uint64_t v47 = objc_msgSend(v42, "numberWithInt:", objc_msgSend(v46, "intValue") + v45);
  __int16 v48 = [(NSMutableDictionary *)self->_dataForTesting objectForKeyedSubscript:v7];
  int v49 = [v48 objectForKeyedSubscript:v16];
  [v49 setObject:v47 forKeyedSubscript:@"EventCount"];

LABEL_29:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataForTesting, 0);
  objc_storeStrong((id *)&self->_patternLibraryData, 0);
  objc_storeStrong((id *)&self->_playerData, 0);
  std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::~__hash_table((uint64_t)&self->_legacyHapticTransientEventTypeMap);
  begin = self->_hapticContinuousNonsustainedIDs.__begin_;
  if (begin)
  {
    self->_hapticContinuousNonsustainedIDs.__end_ = begin;
    operator delete(begin);
  }
  id v4 = self->_hapticContinuousSustainedIDs.__begin_;
  if (v4)
  {
    self->_hapticContinuousSustainedIDs.__end_ = v4;
    operator delete(v4);
  }
  id v5 = self->_hapticTransientIDs.__begin_;
  if (v5)
  {
    self->_hapticTransientIDs.__end_ = v5;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_engineID, 0);
}

@end