@interface CSEndpointDelayReporter
- (BOOL)didReportEndpointDelay;
- (BOOL)isMedocEnabled;
- (CSEndpointDelayReporter)initWithRequestMHUUID:(id)a3 turnIdentifier:(id)a4;
- (CSEndpointDelayReporter)initWithRequestMHUUID:(id)a3 turnIdentifier:(id)a4 withMedocEnabled:(BOOL)a5;
- (NSString)curTRPId;
- (NSString)requestMHUUID;
- (NSUUID)turnIdentifier;
- (double)endpointTimeInMs;
- (double)userSpeakingEndedTimeInMs;
- (double)userSpeakingStartedTimeInMs;
- (unint64_t)audioDeliveryHostTimeDelta;
- (unint64_t)endpointBufferHostTime;
- (unint64_t)endpointHostTime;
- (unint64_t)estimatedUserSpeakingEndedHostTime;
- (unint64_t)estimatedUserSpeakingStartedHostTime;
- (unint64_t)stopRecordingHostTime;
- (unint64_t)userSpeakingEndedHostTime;
- (unint64_t)userSpeakingStartedHostTime;
- (void)_emitEndpointDelayMessage:(double)a3 epdModel:(double)a4 speakingStart:(double)a5 speakingEnd:(double)a6 epdV2:(double)a7;
- (void)_reportUserSpeakingContext;
- (void)instrumentEndpointSignpostsForServerEndpointWithEndTime:(double)a3 leadingSilence:(double)a4 trailingSilence:(double)a5 stopRecordingMachContinuousTime:(unint64_t)a6 skippedSamplesTimeInSec:(double)a7 firstAudioSampleSensorHostTime:(unint64_t)a8;
- (void)reportEndpointDelayIfNeed;
- (void)reset;
- (void)setAudioDeliveryHostTimeDelta:(unint64_t)a3;
- (void)setCurTRPId:(id)a3;
- (void)setDidReportEndpointDelay:(BOOL)a3;
- (void)setEndpointBufferHostTime:(unint64_t)a3;
- (void)setEndpointHostTime:(unint64_t)a3;
- (void)setEndpointTimeInMs:(double)a3;
- (void)setIsMedocEnabled:(BOOL)a3;
- (void)setRequestMHUUID:(id)a3;
- (void)setSpeechRecognizedContext:(id)a3 withEndpointerMetrics:(id)a4;
- (void)setSpeechRecognizedContext:(id)a3 withEndpointerMetrics:(id)a4 withTrpId:(id)a5;
- (void)setStopRecordingHostTime:(unint64_t)a3;
- (void)setTurnIdentifier:(id)a3;
- (void)setUserSpeakingEndedHostTime:(unint64_t)a3;
- (void)setUserSpeakingEndedTimeInMs:(double)a3;
- (void)setUserSpeakingStartedHostTime:(unint64_t)a3;
- (void)setUserSpeakingStartedTimeInMs:(double)a3;
@end

@implementation CSEndpointDelayReporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curTRPId, 0);
  objc_storeStrong((id *)&self->_turnIdentifier, 0);
  objc_storeStrong((id *)&self->_requestMHUUID, 0);
}

- (void)setIsMedocEnabled:(BOOL)a3
{
  self->_isMedocEnabled = a3;
}

- (BOOL)isMedocEnabled
{
  return self->_isMedocEnabled;
}

- (void)setCurTRPId:(id)a3
{
}

- (NSString)curTRPId
{
  return self->_curTRPId;
}

- (void)setDidReportEndpointDelay:(BOOL)a3
{
  self->_didReportEndpointDelay = a3;
}

- (BOOL)didReportEndpointDelay
{
  return self->_didReportEndpointDelay;
}

- (void)setTurnIdentifier:(id)a3
{
}

- (NSUUID)turnIdentifier
{
  return self->_turnIdentifier;
}

- (void)setRequestMHUUID:(id)a3
{
}

- (NSString)requestMHUUID
{
  return self->_requestMHUUID;
}

- (void)setStopRecordingHostTime:(unint64_t)a3
{
  self->_stopRecordingHostTime = a3;
}

- (unint64_t)stopRecordingHostTime
{
  return self->_stopRecordingHostTime;
}

- (void)setUserSpeakingEndedHostTime:(unint64_t)a3
{
  self->_userSpeakingEndedHostTime = a3;
}

- (unint64_t)userSpeakingEndedHostTime
{
  return self->_userSpeakingEndedHostTime;
}

- (void)setUserSpeakingStartedHostTime:(unint64_t)a3
{
  self->_userSpeakingStartedHostTime = a3;
}

- (unint64_t)userSpeakingStartedHostTime
{
  return self->_userSpeakingStartedHostTime;
}

- (void)setAudioDeliveryHostTimeDelta:(unint64_t)a3
{
  self->_audioDeliveryHostTimeDelta = a3;
}

- (unint64_t)audioDeliveryHostTimeDelta
{
  return self->_audioDeliveryHostTimeDelta;
}

- (void)setEndpointHostTime:(unint64_t)a3
{
  self->_endpointHostTime = a3;
}

- (unint64_t)endpointHostTime
{
  return self->_endpointHostTime;
}

- (void)setEndpointBufferHostTime:(unint64_t)a3
{
  self->_endpointBufferHostTime = a3;
}

- (unint64_t)endpointBufferHostTime
{
  return self->_endpointBufferHostTime;
}

- (void)setUserSpeakingEndedTimeInMs:(double)a3
{
  self->_userSpeakingEndedTimeInMs = a3;
}

- (double)userSpeakingEndedTimeInMs
{
  return self->_userSpeakingEndedTimeInMs;
}

- (void)setUserSpeakingStartedTimeInMs:(double)a3
{
  self->_userSpeakingStartedTimeInMs = a3;
}

- (double)userSpeakingStartedTimeInMs
{
  return self->_userSpeakingStartedTimeInMs;
}

- (void)setEndpointTimeInMs:(double)a3
{
  self->_endpointTimeInMs = a3;
}

- (double)endpointTimeInMs
{
  return self->_endpointTimeInMs;
}

- (void)_reportUserSpeakingContext
{
  if (self->_turnIdentifier || self->_requestMHUUID)
  {
    if (self->_userSpeakingStartedHostTime)
    {
      if (self->_curTRPId && self->_isMedocEnabled)
      {
        id v3 = objc_alloc_init((Class)MHSchemaMHUserSpeakingContext);
        id v4 = objc_alloc_init((Class)MHSchemaMHUserSpeakingStarted);
        [v4 setExists:1];
        [v3 setStartedOrChanged:v4];
        id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:self->_curTRPId];
        id v6 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v5];
        [v3 setTrpId:v6];

        id v7 = objc_alloc_init((Class)MHSchemaMHClientEvent);
        id v8 = objc_alloc_init((Class)MHSchemaMHClientEventMetadata);
        id v9 = objc_alloc((Class)SISchemaUUID);
        id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:self->_requestMHUUID];
        id v11 = [v9 initWithNSUUID:v10];
        [v8 setMhId:v11];

        [v7 setEventMetadata:v8];
        [v7 setUserSpeakingContext:v3];
        v12 = +[AssistantSiriAnalytics sharedStream];
        [v12 emitMessage:v7 timestamp:self->_userSpeakingStartedHostTime];
      }
      else
      {
        id v3 = objc_alloc_init((Class)SISchemaUEIUserSpeakingContext);
        id v4 = objc_alloc_init((Class)SISchemaUEIUserSpeakingStarted);
        [v4 setExists:1];
        [v3 setStartedOrChanged:v4];
        id v5 = +[AFAnalytics sharedAnalytics];
        [v5 logInstrumentation:v3 machAbsoluteTime:self->_userSpeakingStartedHostTime turnIdentifier:self->_turnIdentifier];
      }

      v13 = CSLogCategoryEP;
      if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
      {
        curTRPId = self->_curTRPId;
        int v29 = 136315394;
        v30 = "-[CSEndpointDelayReporter _reportUserSpeakingContext]";
        __int16 v31 = 2112;
        v32 = curTRPId;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s logInstrumentation for speakingStarted, trpId: %@", (uint8_t *)&v29, 0x16u);
      }
    }
    v15 = self->_curTRPId;
    if (self->_userSpeakingEndedHostTime)
    {
      if (v15 && self->_isMedocEnabled)
      {
        id v16 = objc_alloc_init((Class)MHSchemaMHUserSpeakingContext);
        id v17 = objc_alloc_init((Class)MHSchemaMHUserSpeakingEnded);
        [v17 setExists:1];
        [v16 setEnded:v17];
        id v18 = [objc_alloc((Class)NSUUID) initWithUUIDString:self->_curTRPId];
        id v19 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v18];
        [v16 setTrpId:v19];

        id v20 = objc_alloc_init((Class)MHSchemaMHClientEvent);
        id v21 = objc_alloc_init((Class)MHSchemaMHClientEventMetadata);
        id v22 = objc_alloc((Class)SISchemaUUID);
        id v23 = [objc_alloc((Class)NSUUID) initWithUUIDString:self->_requestMHUUID];
        id v24 = [v22 initWithNSUUID:v23];
        [v21 setMhId:v24];

        [v20 setEventMetadata:v21];
        [v20 setUserSpeakingContext:v16];
        v25 = +[AssistantSiriAnalytics sharedStream];
        [v25 emitMessage:v20 timestamp:self->_userSpeakingEndedHostTime];
      }
      else
      {
        id v16 = objc_alloc_init((Class)SISchemaUEIUserSpeakingContext);
        id v17 = objc_alloc_init((Class)SISchemaUEIUserSpeakingEnded);
        [v17 setExists:1];
        [v16 setEnded:v17];
        id v18 = +[AFAnalytics sharedAnalytics];
        [v18 logInstrumentation:v16 machAbsoluteTime:self->_userSpeakingEndedHostTime turnIdentifier:self->_turnIdentifier];
      }

      v26 = CSLogCategoryEP;
      if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
      {
        v27 = self->_curTRPId;
        int v29 = 136315394;
        v30 = "-[CSEndpointDelayReporter _reportUserSpeakingContext]";
        __int16 v31 = 2112;
        v32 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s logInstrumentation for speakingEnded, trpId: %@", (uint8_t *)&v29, 0x16u);
      }
    }
    else if (v15 && self->_isMedocEnabled)
    {
      v28 = +[CSDiagnosticReporter sharedInstance];
      [v28 submitSELFIssueReport:kCSDiagnosticReporterMHUserSpeakingContextEndedMissingWithMedocEnabled];
    }
  }
}

- (void)_emitEndpointDelayMessage:(double)a3 epdModel:(double)a4 speakingStart:(double)a5 speakingEnd:(double)a6 epdV2:(double)a7
{
  id v13 = objc_alloc_init((Class)MHSchemaMHEndpointDelayContext);
  [v13 setEndpointDelayInNs:(unint64_t)a3];
  [v13 setEndpointModelDelayInNs:(unint64_t)a4];
  [v13 setSpeakingStartInNs:(unint64_t)a5];
  [v13 setSpeakingEndInNs:(unint64_t)a6];
  if (a7 != 0.0) {
    [v13 setEndpointDelayInNsV2:(unint64_t)a7];
  }
  v14 = +[CSEndpointLoggingHelper getMHClientEventByMhUUID:self->_requestMHUUID];
  [v14 setEndpointDelayContext:v13];
  v15 = +[AssistantSiriAnalytics sharedStream];
  [v15 emitMessage:v14];

  if (a3 >= 3.0e10)
  {
    id v16 = +[CSDiagnosticReporter sharedInstance];
    uint64_t v17 = kCSDiagnosticReporterEndpointDelayTooHigh;
    CFStringRef v20 = @"EPD";
    id v18 = +[NSNumber numberWithDouble:a3];
    id v21 = v18;
    id v19 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    [v16 submitEndpointerIssueReport:v17 withContext:v19];
  }
}

- (void)instrumentEndpointSignpostsForServerEndpointWithEndTime:(double)a3 leadingSilence:(double)a4 trailingSilence:(double)a5 stopRecordingMachContinuousTime:(unint64_t)a6 skippedSamplesTimeInSec:(double)a7 firstAudioSampleSensorHostTime:(unint64_t)a8
{
  CSMachAbsoluteTimeToMachContinuousTime();
  CSMachAbsoluteTimeAddTimeInterval();
  double v14 = a3 - a5;
  unint64_t v15 = CSMachAbsoluteTimeAddTimeInterval();
  if (a6 >= v15)
  {
    CSMachAbsoluteTimeGetTimeInterval();
    *(float *)&double v19 = v19;
    double v20 = (double)(unint64_t)+[CSFTimeUtils secondsToNs:v19];
    *(float *)&double v21 = a5;
    double v22 = (double)(unint64_t)+[CSFTimeUtils millisecondsToNs:v21];
    *(float *)&double v23 = a4;
    double v24 = (double)(unint64_t)+[CSFTimeUtils millisecondsToNs:v23];
    *(float *)&double v25 = v14;
    [(CSEndpointDelayReporter *)self _emitEndpointDelayMessage:v20 epdModel:v22 speakingStart:v24 speakingEnd:(double)(unint64_t)+[CSFTimeUtils millisecondsToNs:v25] epdV2:0.0];
    v26 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      requestMHUUID = self->_requestMHUUID;
      int v31 = 136316418;
      v32 = "-[CSEndpointDelayReporter instrumentEndpointSignpostsForServerEndpointWithEndTime:leadingSilence:trailingSil"
            "ence:stopRecordingMachContinuousTime:skippedSamplesTimeInSec:firstAudioSampleSensorHostTime:]";
      __int16 v33 = 2112;
      double v34 = *(double *)&requestMHUUID;
      __int16 v35 = 2050;
      double v36 = v20 / 1000000.0;
      __int16 v37 = 2050;
      double v38 = v22 / 1000000.0;
      __int16 v39 = 2050;
      double v40 = (v20 - v22) / 1000000.0;
      __int16 v41 = 2050;
      double v42 = a7;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "KeyLog - %s Submitted SEP to SELF for MH ID: %@ - EPD (ms): %{public}f, EPD_Model (ms): %{public}f, EPD_Latency (ms): %{public}f, Skipped Samples (sec): %{public}f", (uint8_t *)&v31, 0x3Eu);
    }
    self->_userSpeakingStartedHostTime = CSMachAbsoluteTimeAddTimeInterval();
    self->_userSpeakingEndedHostTime = CSMachAbsoluteTimeAddTimeInterval();
    [(CSEndpointDelayReporter *)self _reportUserSpeakingContext];
    os_signpost_id_t v28 = os_signpost_id_generate(CSLogContextFacilityCoreSpeech);
    int v29 = CSLogContextFacilityCoreSpeech;
    v30 = v29;
    if (v28 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      uint64_t v17 = CSLogContextFacilityCoreSpeech;
    }
    else
    {
      if (os_signpost_enabled(v29))
      {
        int v31 = 134349570;
        v32 = (const char *)v15;
        __int16 v33 = 2080;
        double v34 = COERCE_DOUBLE("SiriX");
        __int16 v35 = 2080;
        double v36 = COERCE_DOUBLE("enableTelemetry=YES");
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_BEGIN, v28, "EndpointDelay", "%{public, signpost.description:begin_time}llu, %s %s", (uint8_t *)&v31, 0x20u);
      }

      uint64_t v17 = CSLogContextFacilityCoreSpeech;
      if (os_signpost_enabled(v17))
      {
        int v31 = 134349570;
        v32 = (const char *)a6;
        __int16 v33 = 2080;
        double v34 = COERCE_DOUBLE("SiriX");
        __int16 v35 = 2080;
        double v36 = COERCE_DOUBLE("enableTelemetry=YES");
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, v28, "EndpointDelay", "%{public, signpost.description:end_time}llu, %s %s", (uint8_t *)&v31, 0x20u);
      }
    }
  }
  else
  {
    id v16 = (void *)CSLogCategoryEP;
    if (!os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    uint64_t v17 = v16;
    CSMachAbsoluteTimeGetTimeInterval();
    int v31 = 136315650;
    v32 = "-[CSEndpointDelayReporter instrumentEndpointSignpostsForServerEndpointWithEndTime:leadingSilence:trailingSilen"
          "ce:stopRecordingMachContinuousTime:skippedSamplesTimeInSec:firstAudioSampleSensorHostTime:]";
    __int16 v33 = 2050;
    double v34 = a3 / 1000.0;
    __int16 v35 = 2050;
    double v36 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s Server End Time - %{public}f, Host Recording Time - %{public}f", (uint8_t *)&v31, 0x20u);
  }
}

- (void)reportEndpointDelayIfNeed
{
  if (self->_didReportEndpointDelay) {
    goto LABEL_19;
  }
  unint64_t stopRecordingHostTime = self->_stopRecordingHostTime;
  if (!stopRecordingHostTime)
  {
LABEL_15:
    double v22 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_ERROR))
    {
      unint64_t userSpeakingEndedHostTime = self->_userSpeakingEndedHostTime;
      double userSpeakingEndedTimeInMs = self->_userSpeakingEndedTimeInMs;
      double endpointTimeInMs = self->_endpointTimeInMs;
      *(_DWORD *)buf = 136316162;
      v59 = "-[CSEndpointDelayReporter reportEndpointDelayIfNeed]";
      __int16 v60 = 2050;
      v61 = (const char *)stopRecordingHostTime;
      __int16 v62 = 2050;
      v63 = (const char *)userSpeakingEndedHostTime;
      __int16 v64 = 2050;
      double v65 = userSpeakingEndedTimeInMs;
      __int16 v66 = 2050;
      double v67 = endpointTimeInMs;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s Not reporting EPD due to unexpected zero or negative component values: _stopRecordingHostTime: %{public}llu, _userSpeakingEndedHostTime: %{public}llu, _userSpeakingEndedTimeInMs: %{public}f, _endpointTimeInMs: %{public}f", buf, 0x34u);
      unint64_t stopRecordingHostTime = self->_stopRecordingHostTime;
    }
    double v23 = +[NSNumber numberWithUnsignedLongLong:stopRecordingHostTime, @"stopRecordingHostTime"];
    v55[0] = v23;
    v54[1] = @"userSpeakingEndedHostTime";
    double v24 = +[NSNumber numberWithUnsignedLongLong:self->_userSpeakingEndedHostTime];
    v55[1] = v24;
    v54[2] = @"userSpeakingEndedTimeInMs";
    double v25 = +[NSNumber numberWithDouble:self->_userSpeakingEndedTimeInMs];
    v55[2] = v25;
    v54[3] = @"endpointTimeInMs";
    v26 = +[NSNumber numberWithDouble:self->_endpointTimeInMs];
    v55[3] = v26;
    v27 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:4];

    os_signpost_id_t v28 = +[CSDiagnosticReporter sharedInstance];
    int v29 = v28;
    v30 = &kCSDiagnosticReporterEndpointDelayComponentsNegative;
    goto LABEL_18;
  }
  unint64_t v4 = self->_userSpeakingEndedHostTime;
  if (!v4 || self->_userSpeakingEndedTimeInMs <= 0.0 || self->_endpointTimeInMs <= 0.0)
  {
    if (self->_endpointTimeInMs >= 0.0 && self->_userSpeakingEndedTimeInMs >= 0.0) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  self->_didReportEndpointDelay = 1;
  +[CSFTimeUtils hostTimeToTimeInterval:stopRecordingHostTime - v4];
  double v6 = v5 * 1000.0;
  double v7 = self->_endpointTimeInMs - self->_userSpeakingEndedTimeInMs;
  double v8 = v5 * 1000.0 - v7;
  CSMachAbsoluteTimeGetTimeInterval();
  double v10 = v9 * 1000.0;
  double v11 = v7 + v9 * 1000.0;
  v12 = CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v59 = "-[CSEndpointDelayReporter reportEndpointDelayIfNeed]";
    __int16 v60 = 2050;
    v61 = *(const char **)&v6;
    __int16 v62 = 2050;
    v63 = *(const char **)&v7;
    __int16 v64 = 2050;
    double v65 = v8;
    __int16 v66 = 2050;
    double v67 = v7 + v10;
    __int16 v68 = 2050;
    double v69 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "KeyLog - %s EPD (ms): %{public}f, EPD_Model (ms): %{public}f, EPD_Latency (ms): %{public}f, EPD_V2 (ms): %{public}f, EPD_Latency_V2 (ms): %{public}f", buf, 0x3Eu);
  }
  uint64_t v13 = mach_continuous_time();
  uint64_t v14 = mach_absolute_time();
  os_signpost_id_t v15 = os_signpost_id_generate(CSLogContextFacilityCoreSpeech);
  id v16 = CSLogContextFacilityCoreSpeech;
  uint64_t v17 = v16;
  if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    double v20 = CSLogContextFacilityCoreSpeech;
  }
  else
  {
    uint64_t v18 = v13 - v14;
    if (os_signpost_enabled(v16))
    {
      double v19 = (const char *)(self->_userSpeakingEndedHostTime + v18);
      *(_DWORD *)buf = 134349570;
      v59 = v19;
      __int16 v60 = 2080;
      v61 = "SiriX";
      __int16 v62 = 2080;
      v63 = "enableTelemetry=YES";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "EndpointDelay", "%{public, signpost.description:begin_time}llu, %s %s", buf, 0x20u);
    }

    double v20 = CSLogContextFacilityCoreSpeech;
    if (os_signpost_enabled(v20))
    {
      double v21 = (const char *)(self->_stopRecordingHostTime + v18);
      *(_DWORD *)buf = 134349570;
      v59 = v21;
      __int16 v60 = 2080;
      v61 = "SiriX";
      __int16 v62 = 2080;
      v63 = "enableTelemetry=YES";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_END, v15, "EndpointDelay", "%{public, signpost.description:end_time}llu, %s %s", buf, 0x20u);
    }
  }

  *(float *)&double v36 = v6;
  double v37 = (double)(unint64_t)+[CSFTimeUtils millisecondsToNs:v36];
  *(float *)&double v38 = v7;
  double v39 = (double)(unint64_t)+[CSFTimeUtils millisecondsToNs:v38];
  double userSpeakingStartedTimeInMs = self->_userSpeakingStartedTimeInMs;
  *(float *)&double userSpeakingStartedTimeInMs = userSpeakingStartedTimeInMs;
  double v41 = (double)(unint64_t)+[CSFTimeUtils millisecondsToNs:userSpeakingStartedTimeInMs];
  double v42 = self->_userSpeakingEndedTimeInMs;
  *(float *)&double v42 = v42;
  double v43 = (double)(unint64_t)+[CSFTimeUtils millisecondsToNs:v42];
  *(float *)&double v44 = v11;
  [(CSEndpointDelayReporter *)self _emitEndpointDelayMessage:v37 epdModel:v39 speakingStart:v41 speakingEnd:v43 epdV2:(double)(unint64_t)+[CSFTimeUtils millisecondsToNs:v44]];
  v45 = CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    requestMHUUID = self->_requestMHUUID;
    *(_DWORD *)buf = 136315394;
    v59 = "-[CSEndpointDelayReporter reportEndpointDelayIfNeed]";
    __int16 v60 = 2112;
    v61 = (const char *)requestMHUUID;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%s Submit MHEndpointDelayContextEvent to SELF for MH ID: %@", buf, 0x16u);
  }
  if (v6 < 0.0 || v7 < 0.0 || v8 < 0.0)
  {
    v47 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v59 = "-[CSEndpointDelayReporter reportEndpointDelayIfNeed]";
      __int16 v60 = 2048;
      v61 = *(const char **)&v6;
      __int16 v62 = 2048;
      v63 = *(const char **)&v7;
      __int16 v64 = 2048;
      double v65 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%s One or more EPD values are negative: EPD: %f, EPD_Model: %f, EPD_Latency: %f", buf, 0x2Au);
    }
    v56[0] = @"EPD";
    v48 = +[NSNumber numberWithDouble:v6];
    v57[0] = v48;
    v56[1] = @"EPD_Model";
    v49 = +[NSNumber numberWithDouble:v7];
    v57[1] = v49;
    v56[2] = @"EPD_Latency";
    v50 = +[NSNumber numberWithDouble:v8];
    v57[2] = v50;
    v27 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:3];

    os_signpost_id_t v28 = +[CSDiagnosticReporter sharedInstance];
    int v29 = v28;
    v30 = &kCSDiagnosticReporterEndpointDelayValuesNegative;
LABEL_18:
    [v28 submitEndpointerIssueReport:*v30 withContext:v27];
  }
LABEL_19:
  int v31 = CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    double v32 = self->_endpointTimeInMs;
    double v33 = self->_userSpeakingEndedTimeInMs;
    unint64_t v34 = self->_userSpeakingEndedHostTime;
    double v35 = *(double *)&self->_stopRecordingHostTime;
    *(_DWORD *)buf = 136316162;
    v59 = "-[CSEndpointDelayReporter reportEndpointDelayIfNeed]";
    __int16 v60 = 2050;
    v61 = *(const char **)&v32;
    __int16 v62 = 2050;
    v63 = *(const char **)&v33;
    __int16 v64 = 2050;
    double v65 = *(double *)&v34;
    __int16 v66 = 2050;
    double v67 = v35;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s endpointTimeInMs %{public}f, userSpeakingEndedTime: %{public}f, _userSpeakingEndedMachAbsTime: %{public}llu, stopRecordingMachAbsTime: %{public}llu", buf, 0x34u);
  }
}

- (void)setSpeechRecognizedContext:(id)a3 withEndpointerMetrics:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = a3;
    double v8 = [v7 objectForKey:@"leadingSilence"];
    double v9 = [v7 objectForKey:@"trailingSilence"];
    double v10 = [v7 objectForKey:@"endTime"];

    if (v8 && v9 && v10)
    {
      [v8 doubleValue];
      self->_double userSpeakingStartedTimeInMs = v11;
      [v10 doubleValue];
      double v13 = v12;
      [v9 doubleValue];
      self->_double userSpeakingEndedTimeInMs = v13 - v14;
      self->_unint64_t endpointBufferHostTime = (unint64_t)[v6 endpointBufferHostTime];
      self->_unint64_t endpointHostTime = (unint64_t)[v6 endpointHostTime];
      self->_unint64_t audioDeliveryHostTimeDelta = (unint64_t)[v6 audioDeliveryHostTimeDelta];
      [v6 totalAudioRecorded];
      self->_double endpointTimeInMs = v15;
      self->_unint64_t userSpeakingStartedHostTime = [(CSEndpointDelayReporter *)self estimatedUserSpeakingStartedHostTime];
      unint64_t v16 = [(CSEndpointDelayReporter *)self estimatedUserSpeakingEndedHostTime];
      self->_unint64_t userSpeakingEndedHostTime = v16;
      uint64_t v17 = CSLogCategoryEP;
      if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
      {
        double userSpeakingStartedTimeInMs = self->_userSpeakingStartedTimeInMs;
        double userSpeakingEndedTimeInMs = self->_userSpeakingEndedTimeInMs;
        unint64_t stopRecordingHostTime = self->_stopRecordingHostTime;
        unint64_t endpointBufferHostTime = self->_endpointBufferHostTime;
        unint64_t endpointHostTime = self->_endpointHostTime;
        unint64_t audioDeliveryHostTimeDelta = self->_audioDeliveryHostTimeDelta;
        unint64_t userSpeakingStartedHostTime = self->_userSpeakingStartedHostTime;
        int v25 = 136317186;
        v26 = "-[CSEndpointDelayReporter setSpeechRecognizedContext:withEndpointerMetrics:]";
        __int16 v27 = 2050;
        double v28 = userSpeakingStartedTimeInMs;
        __int16 v29 = 2050;
        double v30 = userSpeakingEndedTimeInMs;
        __int16 v31 = 2050;
        unint64_t v32 = userSpeakingStartedHostTime;
        __int16 v33 = 2050;
        unint64_t v34 = v16;
        __int16 v35 = 2050;
        unint64_t v36 = stopRecordingHostTime;
        __int16 v37 = 2050;
        unint64_t v38 = endpointBufferHostTime;
        __int16 v39 = 2050;
        unint64_t v40 = endpointHostTime;
        __int16 v41 = 2050;
        unint64_t v42 = audioDeliveryHostTimeDelta;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s _userSpeakingStartedTimeInMs %{public}f, _userSpeakingEndedTimeInMs: %{public}f, _userSpeakingStartedHostTime: %{public}llu, _userSpeakingEndedHostTime: %{public}llu, _stopRecordingHostTime: %{public}llu, _endpointBufferHostTime: %{public}llu, _endpointHostTime: %{public}llu, _audioDeliveryHostTimeDelta: %{public}llu", (uint8_t *)&v25, 0x5Cu);
      }
      [(CSEndpointDelayReporter *)self _reportUserSpeakingContext];
    }
  }
}

- (void)setSpeechRecognizedContext:(id)a3 withEndpointerMetrics:(id)a4 withTrpId:(id)a5
{
  objc_storeStrong((id *)&self->_curTRPId, a5);
  id v8 = a4;
  id v9 = a3;
  [(CSEndpointDelayReporter *)self setSpeechRecognizedContext:v9 withEndpointerMetrics:v8];
}

- (unint64_t)estimatedUserSpeakingEndedHostTime
{
  double endpointTimeInMs = self->_endpointTimeInMs;
  if (endpointTimeInMs <= 0.0
    || !self->_endpointBufferHostTime
    || ((double v4 = self->_userSpeakingEndedTimeInMs, v4 > 0.0) ? (v5 = endpointTimeInMs <= v4) : (v5 = 1), v5))
  {
    id v6 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_ERROR))
    {
      double userSpeakingEndedTimeInMs = self->_userSpeakingEndedTimeInMs;
      unint64_t endpointBufferHostTime = self->_endpointBufferHostTime;
      int v10 = 136315906;
      double v11 = "-[CSEndpointDelayReporter estimatedUserSpeakingEndedHostTime]";
      __int16 v12 = 2050;
      double v13 = endpointTimeInMs;
      __int16 v14 = 2050;
      unint64_t v15 = endpointBufferHostTime;
      __int16 v16 = 2050;
      double v17 = userSpeakingEndedTimeInMs;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Unable to accurately estimate userSpeakingEndedHostTime. _endpointTimeInMs: %{public}f, _endpointBufferHostTime: %{public}llu, _userSpeakingEndedTimeInMs: %{public}f", (uint8_t *)&v10, 0x2Au);
    }
    return 0;
  }
  else
  {
    return CSMachAbsoluteTimeSubtractTimeInterval();
  }
}

- (unint64_t)estimatedUserSpeakingStartedHostTime
{
  double endpointTimeInMs = self->_endpointTimeInMs;
  if (endpointTimeInMs > 0.0 && self->_endpointBufferHostTime && endpointTimeInMs > self->_userSpeakingStartedTimeInMs)
  {
    return CSMachAbsoluteTimeSubtractTimeInterval();
  }
  else
  {
    BOOL v5 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_ERROR))
    {
      unint64_t endpointBufferHostTime = self->_endpointBufferHostTime;
      double userSpeakingStartedTimeInMs = self->_userSpeakingStartedTimeInMs;
      int v8 = 136315906;
      id v9 = "-[CSEndpointDelayReporter estimatedUserSpeakingStartedHostTime]";
      __int16 v10 = 2050;
      double v11 = endpointTimeInMs;
      __int16 v12 = 2050;
      unint64_t v13 = endpointBufferHostTime;
      __int16 v14 = 2050;
      double v15 = userSpeakingStartedTimeInMs;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Unable to accurately estimate userSpeakingStartedHostTime. _endpointTimeInMs: %{public}f, _endpointBufferHostTime: %{public}llu, _userSpeakingStartedTimeInMs: %{public}f", (uint8_t *)&v8, 0x2Au);
    }
    return 0;
  }
}

- (void)reset
{
  id v3 = CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[CSEndpointDelayReporter reset]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  self->_didReportEndpointDelay = 0;
  *(_OWORD *)&self->_double endpointTimeInMs = 0u;
  *(_OWORD *)&self->_double userSpeakingEndedTimeInMs = 0u;
  *(_OWORD *)&self->_unint64_t endpointHostTime = 0u;
  *(_OWORD *)&self->_unint64_t userSpeakingStartedHostTime = 0u;
  self->_unint64_t stopRecordingHostTime = 0;
  curTRPId = self->_curTRPId;
  self->_curTRPId = 0;
}

- (CSEndpointDelayReporter)initWithRequestMHUUID:(id)a3 turnIdentifier:(id)a4 withMedocEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CSEndpointDelayReporter;
  __int16 v10 = [(CSEndpointDelayReporter *)&v19 init];
  if (v10)
  {
    double v11 = (NSString *)[v8 copy];
    requestMHUUID = v10->_requestMHUUID;
    v10->_requestMHUUID = v11;

    unint64_t v13 = (NSUUID *)[v9 copy];
    turnIdentifier = v10->_turnIdentifier;
    v10->_turnIdentifier = v13;

    v10->_isMedocEnabled = v5;
    double v15 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = v10->_requestMHUUID;
      double v17 = v10->_turnIdentifier;
      *(_DWORD *)buf = 136315906;
      double v21 = "-[CSEndpointDelayReporter initWithRequestMHUUID:turnIdentifier:withMedocEnabled:]";
      __int16 v22 = 2112;
      double v23 = v16;
      __int16 v24 = 2112;
      int v25 = v17;
      __int16 v26 = 1024;
      BOOL v27 = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s _requestMHUUID: %@, _turnIdentifier: %@ _medocEnabled: %d", buf, 0x26u);
    }
    [(CSEndpointDelayReporter *)v10 reset];
  }

  return v10;
}

- (CSEndpointDelayReporter)initWithRequestMHUUID:(id)a3 turnIdentifier:(id)a4
{
  return [(CSEndpointDelayReporter *)self initWithRequestMHUUID:a3 turnIdentifier:a4 withMedocEnabled:0];
}

@end