@interface CSAudioStartStreamOption
+ (id)noAlertOption;
+ (int64_t)avvcAlertOverrideType:(int64_t)a3;
- (BOOL)allowRecordWhileBeep;
- (BOOL)disableBoostForDoAP;
- (BOOL)disableEndpointer;
- (BOOL)disableLocalSpeechRecognizer;
- (BOOL)disablePrewarmLocalAsrAtStartRecording;
- (BOOL)disableRCSelection;
- (BOOL)isAlertBehaviorOverridedBeep;
- (BOOL)potentiallyNeedsCarPlayLatencyCorrection;
- (BOOL)requestHistoricalAudioDataSampleCount;
- (BOOL)requestHistoricalAudioDataWithHostTime;
- (BOOL)requestTelephonyDownlinkAudioTap;
- (BOOL)requireSingleChannelLookup;
- (BOOL)skipAlertBehavior;
- (BOOL)useOpportunisticZLL;
- (CSAudioStartStreamOption)initWithXPCObject:(id)a3;
- (NSString)localizedDescription;
- (NSString)requestMHUUID;
- (NSString)siriSessionUUID;
- (OS_xpc_object)xpcObject;
- (id)avvcAlertBehavior;
- (id)avvcStartRecordSettingsWithAudioStreamHandleId:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initTandemWithOption:(id)a3;
- (int64_t)_alertBehaviorTypeFromAVVCOverrideType:(int64_t)a3;
- (int64_t)errorAlertBehavior;
- (int64_t)startAlertBehavior;
- (int64_t)stopAlertBehavior;
- (unint64_t)estimatedStartHostTime;
- (unint64_t)startRecordingHostTime;
- (unint64_t)startRecordingSampleCount;
- (unsigned)selectedChannel;
- (void)adjustStartRecordingHostTime:(unint64_t)a3;
- (void)setAVVCAlertBehavior:(id)a3;
- (void)setAllowRecordWhileBeep:(BOOL)a3;
- (void)setDisableBoostForDoAP:(BOOL)a3;
- (void)setDisableEndpointer:(BOOL)a3;
- (void)setDisableLocalSpeechRecognizer:(BOOL)a3;
- (void)setDisablePrewarmLocalAsrAtStartRecording:(BOOL)a3;
- (void)setDisableRCSelection:(BOOL)a3;
- (void)setErrorAlertBehavior:(int64_t)a3;
- (void)setEstimatedStartHostTime:(unint64_t)a3;
- (void)setPotentiallyNeedsCarPlayLatencyCorrection:(BOOL)a3;
- (void)setRequestHistoricalAudioDataSampleCount:(BOOL)a3;
- (void)setRequestHistoricalAudioDataWithHostTime:(BOOL)a3;
- (void)setRequestMHUUID:(id)a3;
- (void)setRequestTelephonyDownlinkAudioTap:(BOOL)a3;
- (void)setRequireSingleChannelLookup:(BOOL)a3;
- (void)setSelectedChannel:(unsigned int)a3;
- (void)setSiriSessionUUID:(id)a3;
- (void)setSkipAlertBehavior:(BOOL)a3;
- (void)setStartAlertBehavior:(int64_t)a3;
- (void)setStartRecordingHostTime:(unint64_t)a3;
- (void)setStartRecordingSampleCount:(unint64_t)a3;
- (void)setStopAlertBehavior:(int64_t)a3;
- (void)setUseOpportunisticZLL:(BOOL)a3;
@end

@implementation CSAudioStartStreamOption

- (void)adjustStartRecordingHostTime:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [MEMORY[0x1E4F15400] hostTimeForSeconds:10.0];
  if (v5 >= a3)
  {
    unint64_t v6 = a3;
  }
  else
  {
    unint64_t v6 = v5;
    v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      v14 = "-[CSAudioStartStreamOption(AVVC) adjustStartRecordingHostTime:]";
      __int16 v15 = 2050;
      unint64_t v16 = a3;
      __int16 v17 = 2050;
      unint64_t v18 = v6;
      _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s received hostTimeAdjustment of %{public}llu, instead using max of %{public}llu.", (uint8_t *)&v13, 0x20u);
    }
    v8 = +[CSDiagnosticReporter sharedInstance];
    [v8 submitAudioIssueReport:@"audioStartStreamOptionStartHostTimeAdjustmentExceededMax"];
  }
  uint64_t v9 = [(CSAudioStartStreamOption *)self startRecordingHostTime];
  if (!v9) {
    uint64_t v9 = mach_absolute_time();
  }
  [(CSAudioStartStreamOption *)self setStartRecordingHostTime:v9 + v6];
  v10 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    unint64_t v12 = [(CSAudioStartStreamOption *)self startRecordingHostTime];
    int v13 = 136315650;
    v14 = "-[CSAudioStartStreamOption(AVVC) adjustStartRecordingHostTime:]";
    __int16 v15 = 2050;
    unint64_t v16 = v9;
    __int16 v17 = 2050;
    unint64_t v18 = v12;
    _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Start Recording Host Time: adjustment %{public}llu -> %{public}llu", (uint8_t *)&v13, 0x20u);
  }
}

- (int64_t)_alertBehaviorTypeFromAVVCOverrideType:(int64_t)a3
{
  if ((unint64_t)a3 >= 5) {
    return -1;
  }
  else {
    return a3;
  }
}

- (BOOL)isAlertBehaviorOverridedBeep
{
  return [(CSAudioStartStreamOption *)self startAlertBehavior] == 2
      || [(CSAudioStartStreamOption *)self stopAlertBehavior] == 2
      || [(CSAudioStartStreamOption *)self errorAlertBehavior] == 2;
}

- (id)avvcAlertBehavior
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int64_t v4 = +[CSAudioStartStreamOption avvcAlertOverrideType:[(CSAudioStartStreamOption *)self startAlertBehavior]];
  int64_t v5 = +[CSAudioStartStreamOption avvcAlertOverrideType:[(CSAudioStartStreamOption *)self stopAlertBehavior]];
  int64_t v6 = +[CSAudioStartStreamOption avvcAlertOverrideType:[(CSAudioStartStreamOption *)self errorAlertBehavior]];
  if ([(CSAudioStartStreamOption *)self startAlertBehavior] != -1)
  {
    v7 = [NSNumber numberWithInteger:v4];
    [v3 setObject:v7 forKey:&unk_1F13B8290];
  }
  if ([(CSAudioStartStreamOption *)self stopAlertBehavior] != -1)
  {
    v8 = [NSNumber numberWithInteger:v5];
    [v3 setObject:v8 forKey:&unk_1F13B82A8];
  }
  if ([(CSAudioStartStreamOption *)self errorAlertBehavior] != -1)
  {
    uint64_t v9 = [NSNumber numberWithInteger:v6];
    [v3 setObject:v9 forKey:&unk_1F13B82C0];
  }
  return v3;
}

- (void)setAVVCAlertBehavior:(id)a3
{
  id v4 = a3;
  id v14 = v4;
  if (v4)
  {
    int64_t v5 = [v4 objectForKeyedSubscript:&unk_1F13B8290];

    if (v5)
    {
      int64_t v6 = [v14 objectForKeyedSubscript:&unk_1F13B8290];
      int64_t v7 = -[CSAudioStartStreamOption _alertBehaviorTypeFromAVVCOverrideType:](self, "_alertBehaviorTypeFromAVVCOverrideType:", [v6 unsignedIntegerValue]);
    }
    else
    {
      int64_t v7 = -1;
    }
    [(CSAudioStartStreamOption *)self setStartAlertBehavior:v7];
    uint64_t v9 = [v14 objectForKeyedSubscript:&unk_1F13B82A8];

    if (v9)
    {
      v10 = [v14 objectForKeyedSubscript:&unk_1F13B82A8];
      int64_t v11 = -[CSAudioStartStreamOption _alertBehaviorTypeFromAVVCOverrideType:](self, "_alertBehaviorTypeFromAVVCOverrideType:", [v10 unsignedIntegerValue]);
    }
    else
    {
      int64_t v11 = -1;
    }
    [(CSAudioStartStreamOption *)self setStopAlertBehavior:v11];
    unint64_t v12 = [v14 objectForKeyedSubscript:&unk_1F13B82C0];

    if (v12)
    {
      int v13 = [v14 objectForKeyedSubscript:&unk_1F13B82C0];
      int64_t v8 = -[CSAudioStartStreamOption _alertBehaviorTypeFromAVVCOverrideType:](self, "_alertBehaviorTypeFromAVVCOverrideType:", [v13 unsignedIntegerValue]);
    }
    else
    {
      int64_t v8 = -1;
    }
  }
  else
  {
    int64_t v8 = -1;
    [(CSAudioStartStreamOption *)self setStartAlertBehavior:-1];
    [(CSAudioStartStreamOption *)self setStopAlertBehavior:-1];
  }
  [(CSAudioStartStreamOption *)self setErrorAlertBehavior:v8];
}

- (id)avvcStartRecordSettingsWithAudioStreamHandleId:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F154E8]), "initWithStreamID:atStartHostTime:", a3, -[CSAudioStartStreamOption startRecordingHostTime](self, "startRecordingHostTime"));
  int64_t v5 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v6 = v5;
    int v16 = 136315394;
    __int16 v17 = "-[CSAudioStartStreamOption(AVVC) avvcStartRecordSettingsWithAudioStreamHandleId:]";
    __int16 v18 = 2050;
    unint64_t v19 = [(CSAudioStartStreamOption *)self startRecordingHostTime];
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Start Recording Host Time = %{public}llu", (uint8_t *)&v16, 0x16u);
  }
  int64_t v7 = [(CSAudioStartStreamOption *)self avvcAlertBehavior];
  int64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 objectForKeyedSubscript:&unk_1F13B8290];

    if (v9)
    {
      v10 = [v8 objectForKeyedSubscript:&unk_1F13B8290];
      objc_msgSend(v4, "setStartAlert:", objc_msgSend(v10, "unsignedIntegerValue"));
    }
    int64_t v11 = [v8 objectForKeyedSubscript:&unk_1F13B82A8];

    if (v11)
    {
      unint64_t v12 = [v8 objectForKeyedSubscript:&unk_1F13B82A8];
      objc_msgSend(v4, "setStopAlert:", objc_msgSend(v12, "unsignedIntegerValue"));
    }
    int v13 = [v8 objectForKeyedSubscript:&unk_1F13B82C0];

    if (v13)
    {
      id v14 = [v8 objectForKeyedSubscript:&unk_1F13B82C0];
      objc_msgSend(v4, "setStopOnErrorAlert:", objc_msgSend(v14, "unsignedIntegerValue"));
    }
  }
  objc_msgSend(v4, "setSkipAlert:", -[CSAudioStartStreamOption skipAlertBehavior](self, "skipAlertBehavior"));

  return v4;
}

+ (int64_t)avvcAlertOverrideType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 4) {
    return 0;
  }
  else {
    return a3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriSessionUUID, 0);
  objc_storeStrong((id *)&self->_requestMHUUID, 0);
}

- (void)setPotentiallyNeedsCarPlayLatencyCorrection:(BOOL)a3
{
  self->_potentiallyNeedsCarPlayLatencyCorrection = a3;
}

- (BOOL)potentiallyNeedsCarPlayLatencyCorrection
{
  return self->_potentiallyNeedsCarPlayLatencyCorrection;
}

- (void)setDisableRCSelection:(BOOL)a3
{
  self->_disableRCSelection = a3;
}

- (BOOL)disableRCSelection
{
  return self->_disableRCSelection;
}

- (void)setAllowRecordWhileBeep:(BOOL)a3
{
  self->_allowRecordWhileBeep = a3;
}

- (BOOL)allowRecordWhileBeep
{
  return self->_allowRecordWhileBeep;
}

- (void)setSiriSessionUUID:(id)a3
{
}

- (NSString)siriSessionUUID
{
  return self->_siriSessionUUID;
}

- (void)setRequestMHUUID:(id)a3
{
}

- (NSString)requestMHUUID
{
  return self->_requestMHUUID;
}

- (void)setRequestTelephonyDownlinkAudioTap:(BOOL)a3
{
  self->_requestTelephonyDownlinkAudioTap = a3;
}

- (BOOL)requestTelephonyDownlinkAudioTap
{
  return self->_requestTelephonyDownlinkAudioTap;
}

- (void)setDisableBoostForDoAP:(BOOL)a3
{
  self->_disableBoostForDoAP = a3;
}

- (BOOL)disableBoostForDoAP
{
  return self->_disableBoostForDoAP;
}

- (void)setDisablePrewarmLocalAsrAtStartRecording:(BOOL)a3
{
  self->_disablePrewarmLocalAsrAtStartRecording = a3;
}

- (BOOL)disablePrewarmLocalAsrAtStartRecording
{
  return self->_disablePrewarmLocalAsrAtStartRecording;
}

- (void)setDisableLocalSpeechRecognizer:(BOOL)a3
{
  self->_disableLocalSpeechRecognizer = a3;
}

- (BOOL)disableLocalSpeechRecognizer
{
  return self->_disableLocalSpeechRecognizer;
}

- (void)setDisableEndpointer:(BOOL)a3
{
  self->_disableEndpointer = a3;
}

- (BOOL)disableEndpointer
{
  return self->_disableEndpointer;
}

- (void)setEstimatedStartHostTime:(unint64_t)a3
{
  self->_estimatedStartHostTime = a3;
}

- (unint64_t)estimatedStartHostTime
{
  return self->_estimatedStartHostTime;
}

- (void)setSelectedChannel:(unsigned int)a3
{
  self->_selectedChannel = a3;
}

- (unsigned)selectedChannel
{
  return self->_selectedChannel;
}

- (void)setRequireSingleChannelLookup:(BOOL)a3
{
  self->_requireSingleChannelLookup = a3;
}

- (BOOL)requireSingleChannelLookup
{
  return self->_requireSingleChannelLookup;
}

- (void)setSkipAlertBehavior:(BOOL)a3
{
  self->_skipAlertBehavior = a3;
}

- (BOOL)skipAlertBehavior
{
  return self->_skipAlertBehavior;
}

- (void)setErrorAlertBehavior:(int64_t)a3
{
  self->_errorAlertBehavior = a3;
}

- (int64_t)errorAlertBehavior
{
  return self->_errorAlertBehavior;
}

- (void)setStopAlertBehavior:(int64_t)a3
{
  self->_stopAlertBehavior = a3;
}

- (int64_t)stopAlertBehavior
{
  return self->_stopAlertBehavior;
}

- (void)setStartAlertBehavior:(int64_t)a3
{
  self->_startAlertBehavior = a3;
}

- (int64_t)startAlertBehavior
{
  return self->_startAlertBehavior;
}

- (void)setUseOpportunisticZLL:(BOOL)a3
{
  self->_useOpportunisticZLL = a3;
}

- (BOOL)useOpportunisticZLL
{
  return self->_useOpportunisticZLL;
}

- (void)setStartRecordingSampleCount:(unint64_t)a3
{
  self->_startRecordingSampleCount = a3;
}

- (unint64_t)startRecordingSampleCount
{
  return self->_startRecordingSampleCount;
}

- (void)setStartRecordingHostTime:(unint64_t)a3
{
  self->_startRecordingHostTime = a3;
}

- (unint64_t)startRecordingHostTime
{
  return self->_startRecordingHostTime;
}

- (void)setRequestHistoricalAudioDataSampleCount:(BOOL)a3
{
  self->_requestHistoricalAudioDataSampleCount = a3;
}

- (BOOL)requestHistoricalAudioDataSampleCount
{
  return self->_requestHistoricalAudioDataSampleCount;
}

- (void)setRequestHistoricalAudioDataWithHostTime:(BOOL)a3
{
  self->_requestHistoricalAudioDataWithHostTime = a3;
}

- (BOOL)requestHistoricalAudioDataWithHostTime
{
  return self->_requestHistoricalAudioDataWithHostTime;
}

- (NSString)localizedDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = v3;
  if (self->_requestHistoricalAudioDataWithHostTime) {
    int64_t v5 = @"YES";
  }
  else {
    int64_t v5 = @"NO";
  }
  [v3 appendFormat:@"[requestHistoricalAudioDataWithHostTime = %@]", v5];
  if (self->_requestHistoricalAudioDataSampleCount) {
    int64_t v6 = @"YES";
  }
  else {
    int64_t v6 = @"NO";
  }
  [v4 appendFormat:@"[requestHistoricalAudioDataSampleCount = %@]", v6];
  if (self->_useOpportunisticZLL) {
    int64_t v7 = @"YES";
  }
  else {
    int64_t v7 = @"NO";
  }
  [v4 appendFormat:@"[useOpportunisticZLL = %@]", v7];
  objc_msgSend(v4, "appendFormat:", @"[startRecordingHostTime = %llu]", self->_startRecordingHostTime);
  objc_msgSend(v4, "appendFormat:", @"[startRecordingSampleCount = %llu]", self->_startRecordingSampleCount);
  objc_msgSend(v4, "appendFormat:", @"[alertBehavior = %ld %ld %ld]", self->_startAlertBehavior, self->_stopAlertBehavior, self->_errorAlertBehavior);
  if (self->_skipAlertBehavior) {
    int64_t v8 = @"YES";
  }
  else {
    int64_t v8 = @"NO";
  }
  [v4 appendFormat:@"[skipAlertBehavior = %@]", v8];
  if (self->_requireSingleChannelLookup) {
    uint64_t v9 = @"YES";
  }
  else {
    uint64_t v9 = @"NO";
  }
  [v4 appendFormat:@"[requireSingleChannelLookup = %@]", v9];
  objc_msgSend(v4, "appendFormat:", @"[selectedChannel = %u]", self->_selectedChannel);
  objc_msgSend(v4, "appendFormat:", @"[estimatedStartHostTime = %llu", self->_estimatedStartHostTime);
  objc_msgSend(v4, "appendFormat:", @"[disableEndpointer = %d]", self->_disableEndpointer);
  objc_msgSend(v4, "appendFormat:", @"[disableLocalSpeechRecognizer = %d]", self->_disableLocalSpeechRecognizer);
  objc_msgSend(v4, "appendFormat:", @"[disablePrewarmLocalSpeechRecognizer = %d]", self->_disablePrewarmLocalAsrAtStartRecording);
  objc_msgSend(v4, "appendFormat:", @"[disableBoostForDoAP = %d]", self->_disableBoostForDoAP);
  objc_msgSend(v4, "appendFormat:", @"[requestTelephonyDownlinkTap = %d]", self->_requestTelephonyDownlinkAudioTap);
  objc_msgSend(v4, "appendFormat:", @"[allowRecordWhileBeep = %d]", self->_allowRecordWhileBeep);
  if (self->_disableRCSelection) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  [v4 appendFormat:@"[disableRCSelection = %@]", v10];
  if (self->_potentiallyNeedsCarPlayLatencyCorrection) {
    int64_t v11 = @"YES";
  }
  else {
    int64_t v11 = @"NO";
  }
  [v4 appendFormat:@"[potentiallyNeedsCarPlayLatencyCorrection = %@]", v11];
  return (NSString *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CSAudioStartStreamOption);
  [(CSAudioStartStreamOption *)v4 setRequestHistoricalAudioDataWithHostTime:self->_requestHistoricalAudioDataWithHostTime];
  [(CSAudioStartStreamOption *)v4 setRequestHistoricalAudioDataSampleCount:self->_requestHistoricalAudioDataSampleCount];
  [(CSAudioStartStreamOption *)v4 setStartRecordingHostTime:self->_startRecordingHostTime];
  [(CSAudioStartStreamOption *)v4 setStartRecordingSampleCount:self->_startRecordingSampleCount];
  [(CSAudioStartStreamOption *)v4 setUseOpportunisticZLL:self->_useOpportunisticZLL];
  [(CSAudioStartStreamOption *)v4 setStartAlertBehavior:self->_startAlertBehavior];
  [(CSAudioStartStreamOption *)v4 setStopAlertBehavior:self->_stopAlertBehavior];
  [(CSAudioStartStreamOption *)v4 setErrorAlertBehavior:self->_errorAlertBehavior];
  [(CSAudioStartStreamOption *)v4 setSkipAlertBehavior:self->_skipAlertBehavior];
  [(CSAudioStartStreamOption *)v4 setRequireSingleChannelLookup:self->_requireSingleChannelLookup];
  [(CSAudioStartStreamOption *)v4 setSelectedChannel:self->_selectedChannel];
  [(CSAudioStartStreamOption *)v4 setDisableEndpointer:self->_disableEndpointer];
  [(CSAudioStartStreamOption *)v4 setDisableLocalSpeechRecognizer:self->_disableLocalSpeechRecognizer];
  [(CSAudioStartStreamOption *)v4 setDisablePrewarmLocalAsrAtStartRecording:self->_disablePrewarmLocalAsrAtStartRecording];
  [(CSAudioStartStreamOption *)v4 setRequestMHUUID:self->_requestMHUUID];
  [(CSAudioStartStreamOption *)v4 setSiriSessionUUID:self->_siriSessionUUID];
  [(CSAudioStartStreamOption *)v4 setDisableBoostForDoAP:self->_disableBoostForDoAP];
  [(CSAudioStartStreamOption *)v4 setRequestTelephonyDownlinkAudioTap:self->_requestTelephonyDownlinkAudioTap];
  [(CSAudioStartStreamOption *)v4 setAllowRecordWhileBeep:self->_allowRecordWhileBeep];
  [(CSAudioStartStreamOption *)v4 setDisableRCSelection:self->_disableRCSelection];
  [(CSAudioStartStreamOption *)v4 setPotentiallyNeedsCarPlayLatencyCorrection:self->_potentiallyNeedsCarPlayLatencyCorrection];
  return v4;
}

- (OS_xpc_object)xpcObject
{
  keys[20] = *(char **)MEMORY[0x1E4F143B8];
  keys[0] = "requestHistoricalAudioDataWithHostTime";
  keys[1] = "requestHistoricalAudioDataSampleCount";
  keys[2] = "startRecordingHostTime";
  keys[3] = "startRecordingSampleCount";
  keys[4] = "useOpportunisticZLL";
  keys[5] = "startAlertBehavior";
  keys[6] = "stopAlertBehavior";
  keys[7] = "errorAlertBehavior";
  keys[8] = "skipAlertBehavior";
  keys[9] = "requireSingleChannelLookup";
  keys[10] = "selectedChannel";
  keys[11] = "estimatedStartHostTime";
  keys[12] = "disableEndpointer";
  keys[13] = "disableLocalSpeechRecognizer";
  keys[14] = "disablePrewarmLocalSpeechRecognizer";
  keys[15] = "disableBoostForDoAP";
  keys[16] = "requestTelephonyDownlinkTap";
  keys[17] = "allowRecordWhileBeep";
  keys[18] = "disableRCSelection";
  keys[19] = "potentiallyNeedsCarPlayLatencyCorrection";
  values[0] = xpc_BOOL_create(self->_requestHistoricalAudioDataWithHostTime);
  values[1] = xpc_BOOL_create(self->_requestHistoricalAudioDataSampleCount);
  values[2] = xpc_uint64_create(self->_startRecordingHostTime);
  values[3] = xpc_uint64_create(self->_startRecordingSampleCount);
  values[4] = xpc_BOOL_create(self->_useOpportunisticZLL);
  values[5] = xpc_int64_create(self->_startAlertBehavior);
  values[6] = xpc_int64_create(self->_stopAlertBehavior);
  values[7] = xpc_int64_create(self->_errorAlertBehavior);
  values[8] = xpc_BOOL_create(self->_skipAlertBehavior);
  values[9] = xpc_BOOL_create(self->_requireSingleChannelLookup);
  values[10] = xpc_uint64_create(self->_selectedChannel);
  values[11] = xpc_uint64_create(self->_estimatedStartHostTime);
  values[12] = xpc_BOOL_create(self->_disableEndpointer);
  values[13] = xpc_BOOL_create(self->_disableLocalSpeechRecognizer);
  values[14] = xpc_BOOL_create(self->_disablePrewarmLocalAsrAtStartRecording);
  values[15] = xpc_BOOL_create(self->_disableBoostForDoAP);
  values[16] = xpc_BOOL_create(self->_requestTelephonyDownlinkAudioTap);
  values[17] = xpc_BOOL_create(self->_allowRecordWhileBeep);
  values[18] = xpc_BOOL_create(self->_disableRCSelection);
  values[19] = xpc_BOOL_create(self->_potentiallyNeedsCarPlayLatencyCorrection);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)keys, values, 0x14uLL);
  requestMHUUID = self->_requestMHUUID;
  if (requestMHUUID) {
    xpc_dictionary_set_string(v3, "requestMHUUID", [(NSString *)requestMHUUID UTF8String]);
  }
  siriSessionUUID = self->_siriSessionUUID;
  if (siriSessionUUID) {
    xpc_dictionary_set_string(v3, "siriSessionUUID", [(NSString *)siriSessionUUID UTF8String]);
  }
  for (uint64_t i = 19; i != -1; --i)

  return (OS_xpc_object *)v3;
}

- (CSAudioStartStreamOption)initWithXPCObject:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSAudioStartStreamOption;
  int64_t v5 = [(CSAudioStartStreamOption *)&v13 init];
  if (v5)
  {
    v5->_requestHistoricalAudioDataWithHostTime = xpc_dictionary_get_BOOL(v4, "requestHistoricalAudioDataWithHostTime");
    v5->_requestHistoricalAudioDataSampleCount = xpc_dictionary_get_BOOL(v4, "requestHistoricalAudioDataSampleCount");
    v5->_startRecordingHostTime = xpc_dictionary_get_uint64(v4, "startRecordingHostTime");
    v5->_startRecordingSampleCount = xpc_dictionary_get_uint64(v4, "startRecordingSampleCount");
    v5->_useOpportunisticZLL = xpc_dictionary_get_BOOL(v4, "useOpportunisticZLL");
    v5->_startAlertBehavior = xpc_dictionary_get_int64(v4, "startAlertBehavior");
    v5->_stopAlertBehavior = xpc_dictionary_get_int64(v4, "stopAlertBehavior");
    v5->_errorAlertBehavior = xpc_dictionary_get_int64(v4, "errorAlertBehavior");
    v5->_skipAlertBehavior = xpc_dictionary_get_BOOL(v4, "skipAlertBehavior");
    v5->_requireSingleChannelLookup = xpc_dictionary_get_BOOL(v4, "requireSingleChannelLookup");
    v5->_selectedChannel = xpc_dictionary_get_uint64(v4, "selectedChannel");
    v5->_estimatedStartHostTime = xpc_dictionary_get_uint64(v4, "estimatedStartHostTime");
    v5->_disableEndpointer = xpc_dictionary_get_BOOL(v4, "disableEndpointer");
    v5->_disableLocalSpeechRecognizer = xpc_dictionary_get_BOOL(v4, "disableLocalSpeechRecognizer");
    v5->_disablePrewarmLocalAsrAtStartRecording = xpc_dictionary_get_BOOL(v4, "disablePrewarmLocalSpeechRecognizer");
    v5->_disableBoostForDoAP = xpc_dictionary_get_BOOL(v4, "disableBoostForDoAP");
    v5->_requestTelephonyDownlinkAudioTap = xpc_dictionary_get_BOOL(v4, "requestTelephonyDownlinkTap");
    v5->_allowRecordWhileBeep = xpc_dictionary_get_BOOL(v4, "allowRecordWhileBeep");
    v5->_disableRCSelection = xpc_dictionary_get_BOOL(v4, "disableRCSelection");
    v5->_potentiallyNeedsCarPlayLatencyCorrection = xpc_dictionary_get_BOOL(v4, "potentiallyNeedsCarPlayLatencyCorrection");
    string = xpc_dictionary_get_string(v4, "requestMHUUID");
    if (string)
    {
      uint64_t v7 = [NSString stringWithUTF8String:string];
      requestMHUUID = v5->_requestMHUUID;
      v5->_requestMHUUID = (NSString *)v7;
    }
    uint64_t v9 = xpc_dictionary_get_string(v4, "siriSessionUUID");
    if (v9)
    {
      uint64_t v10 = [NSString stringWithUTF8String:v9];
      siriSessionUUID = v5->_siriSessionUUID;
      v5->_siriSessionUUID = (NSString *)v10;
    }
  }

  return v5;
}

- (id)initTandemWithOption:(id)a3
{
  id v4 = a3;
  int64_t v5 = +[CSAudioStartStreamOption noAlertOption];
  objc_msgSend(v5, "setRequestHistoricalAudioDataSampleCount:", objc_msgSend(v4, "requestHistoricalAudioDataSampleCount"));
  objc_msgSend(v5, "setRequestHistoricalAudioDataWithHostTime:", objc_msgSend(v4, "requestHistoricalAudioDataWithHostTime"));
  objc_msgSend(v5, "setStartRecordingHostTime:", objc_msgSend(v4, "startRecordingHostTime"));
  objc_msgSend(v5, "setStartRecordingSampleCount:", objc_msgSend(v4, "startRecordingSampleCount"));
  objc_msgSend(v5, "setUseOpportunisticZLL:", objc_msgSend(v4, "useOpportunisticZLL"));
  objc_msgSend(v5, "setRequireSingleChannelLookup:", objc_msgSend(v4, "requireSingleChannelLookup"));
  objc_msgSend(v5, "setSelectedChannel:", objc_msgSend(v4, "selectedChannel"));
  uint64_t v6 = [v4 disableBoostForDoAP];

  [v5 setDisableBoostForDoAP:v6];
  return v5;
}

+ (id)noAlertOption
{
  v2 = objc_alloc_init(CSAudioStartStreamOption);
  [(CSAudioStartStreamOption *)v2 setSkipAlertBehavior:1];
  return v2;
}

@end