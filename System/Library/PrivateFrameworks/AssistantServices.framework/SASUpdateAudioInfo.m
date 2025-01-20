@interface SASUpdateAudioInfo
- (BOOL)ad_isDifferentFromStartSpeech:(id)a3;
- (id)ad_deferredMetricsContext;
- (void)ad_updateWithRecordingInfo:(id)a3 speechRequestOptions:(id)a4 clientConfiguration:(id)a5;
@end

@implementation SASUpdateAudioInfo

- (id)ad_deferredMetricsContext
{
  v12.receiver = self;
  v12.super_class = (Class)SASUpdateAudioInfo;
  v3 = [(SASUpdateAudioInfo *)&v12 ad_deferredMetricsContext];
  v4 = [(SASUpdateAudioInfo *)self audioSource];
  if (v4) {
    [v3 setObject:v4 forKey:SASUpdateAudioInfoAudioSourcePListKey];
  }

  v5 = [(SASUpdateAudioInfo *)self origin];
  if (v5) {
    [v3 setObject:v5 forKey:SASUpdateAudioInfoOriginPListKey];
  }

  v6 = [(SASUpdateAudioInfo *)self headsetAddress];
  if (v6) {
    [v3 setObject:v6 forKey:SASUpdateAudioInfoHeadsetAddressPListKey];
  }

  v7 = [(SASUpdateAudioInfo *)self headsetId];
  if (v7) {
    [v3 setObject:v7 forKey:SASUpdateAudioInfoHeadsetIdPListKey];
  }

  v8 = [(SASUpdateAudioInfo *)self headsetName];
  if (v8) {
    [v3 setObject:v8 forKey:SASUpdateAudioInfoHeadsetNamePListKey];
  }

  v9 = [(SASUpdateAudioInfo *)self vendorId];
  if (v9) {
    [v3 setObject:v9 forKey:SASUpdateAudioInfoVendorIdPListKey];
  }

  v10 = [(SASUpdateAudioInfo *)self productId];
  if (v10) {
    [v3 setObject:v10 forKey:SASUpdateAudioInfoProductIdPListKey];
  }

  return v3;
}

- (void)ad_updateWithRecordingInfo:(id)a3 speechRequestOptions:(id)a4 clientConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 source];
  objc_super v12 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v66 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
    __int16 v67 = 2112;
    uint64_t v68 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s audioSource = %@", buf, 0x16u);
  }
  [(SASUpdateAudioInfo *)self setAudioSource:v11];
  v13 = [v8 destination];
  v14 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v66 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
    __int16 v67 = 2112;
    uint64_t v68 = (uint64_t)v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s audioDestination = %@", buf, 0x16u);
  }
  [(SASUpdateAudioInfo *)self setAudioDestination:v13];
  v15 = [v8 codec];
  [(SASUpdateAudioInfo *)self setCodec:SASCodecForString()];

  v16 = [v8 deviceIdentifier];
  [(SASUpdateAudioInfo *)self setDeviceIdentifier:v16];

  v17 = [v8 modelName];
  [(SASUpdateAudioInfo *)self setDeviceModel:v17];

  v18 = [v8 dspStatus];
  [(SASUpdateAudioInfo *)self setDspStatus:v18];

  v19 = [v8 headsetAddress];
  [(SASUpdateAudioInfo *)self setHeadsetAddress:v19];

  v20 = [v8 headsetName];
  [(SASUpdateAudioInfo *)self setHeadsetName:v20];

  v21 = [v8 productId];
  [(SASUpdateAudioInfo *)self setProductId:v21];

  v22 = [v8 vendorId];
  [(SASUpdateAudioInfo *)self setVendorId:v22];

  -[SASUpdateAudioInfo setTriggeredTwoShotBorealis:](self, "setTriggeredTwoShotBorealis:", [v8 triggeredTwoShotBorealis]);
  v23 = [(SASUpdateAudioInfo *)self recordingInfo];
  id v24 = [v23 copy];

  if (!v24) {
    id v24 = objc_alloc_init((Class)SASRecordingInfo);
  }
  id v25 = v9;
  uint64_t v61 = v11;
  id v63 = v10;
  if (!AFHasRingerSwitch()) {
    goto LABEL_14;
  }
  id v26 = [v10 deviceRingerSwitchState];
  v27 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    v28 = v27;
    v29 = AFDeviceRingerSwitchStateGetName();
    *(_DWORD *)buf = 136315394;
    v66 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
    __int16 v67 = 2112;
    uint64_t v68 = (uint64_t)v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s deviceRingerSwitchState = %@", buf, 0x16u);

    id v9 = v25;
  }
  if (v26)
  {
    v30 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v66 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
      __int16 v67 = 1024;
      LODWORD(v68) = v26 != (id)1;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%s SASRecordingInfo.ringerSwitchOff = %d", buf, 0x12u);
    }
    [v24 setRingerSwitchOff:v26 != (id)1];
    char v31 = 1;
  }
  else
  {
LABEL_14:
    char v31 = 0;
  }
  id v32 = objc_msgSend(v8, "audioAlertStyle", v61, v63);
  if (!v32) {
    goto LABEL_32;
  }
  v33 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v66 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
    __int16 v67 = 2048;
    uint64_t v68 = (uint64_t)v32;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%s audioAlertStyle = %ld", buf, 0x16u);
  }
  if (v32 == (id)1)
  {
    v34 = (id *)&SASRecordingInfoAlertTypeNoneValue;
  }
  else if (v32 == (id)3)
  {
    int v35 = AFHasHapticEngine();
    v34 = (id *)&SASRecordingInfoAlertTypeVibrationValue;
    if (v35) {
      v34 = (id *)&SASRecordingInfoAlertTypeHapticValue;
    }
  }
  else
  {
    if (v32 != (id)2)
    {
      id v36 = 0;
      goto LABEL_27;
    }
    v34 = (id *)&SASRecordingInfoAlertTypeBeepValue;
  }
  id v36 = *v34;
LABEL_27:
  v37 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v66 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
    __int16 v67 = 2112;
    uint64_t v68 = (uint64_t)v36;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s SASRecordingInfo.alertType = %@", buf, 0x16u);
  }
  if (v36)
  {
    [v24 setAlertType:v36];
    char v31 = 1;
  }

  id v9 = v25;
LABEL_32:
  [v8 firstBufferTimestamp];
  if (v38 <= 0.0) {
    goto LABEL_58;
  }
  double v39 = v38;
  v40 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v66 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
    __int16 v67 = 2048;
    uint64_t v68 = *(void *)&v39;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%s firstBufferTimestamp (baseline) = %f", buf, 0x16u);
  }
  if ([v9 activationEvent] == (id)1)
  {
    [v9 homeButtonDownEventTime];
    double v42 = v41;
    v43 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v66 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
      __int16 v67 = 2048;
      uint64_t v68 = *(void *)&v42;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%s homeButtonDownTimestamp = %f", buf, 0x16u);
    }
    if (v42 > 0.0)
    {
      v44 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v66 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
        __int16 v67 = 2048;
        uint64_t v68 = (uint64_t)((v42 - v39) * 1000.0);
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%s SASRecordingInfo.buttonDowntime = %llu", buf, 0x16u);
      }
      v45 = +[NSNumber numberWithLongLong:(uint64_t)((v42 - v39) * 1000.0)];
      [v24 setButtonDowntime:v45];

      char v31 = 1;
      id v9 = v25;
    }
  }
  [v8 startRecordingTimestamp];
  double v47 = v46;
  v48 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v66 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
    __int16 v67 = 2048;
    uint64_t v68 = *(void *)&v47;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "%s startRecordingTimestamp = %f", buf, 0x16u);
  }
  if (v47 > 0.0)
  {
    v49 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v66 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
      __int16 v67 = 2048;
      uint64_t v68 = (uint64_t)((v47 - v39) * 1000.0);
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "%s SASRecordingInfo.activationTime = %llu", buf, 0x16u);
    }
    v50 = +[NSNumber numberWithLongLong:(uint64_t)((v47 - v39) * 1000.0)];
    [v24 setActivationTime:v50];

    v51 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v66 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
      __int16 v67 = 1024;
      LODWORD(v68) = v39 < v47;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "%s SASRecordingInfo.zeroLatencyLaunch = %d", buf, 0x12u);
    }
    [v24 setZeroLatencyLaunch:v39 < v47];
    char v31 = 1;
    id v9 = v25;
  }
  [v8 activationAlertStartTimestamp];
  double v53 = v52;
  v54 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v66 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
    __int16 v67 = 2048;
    uint64_t v68 = *(void *)&v53;
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "%s activationAlertStartTimestamp = %f", buf, 0x16u);
  }
  if (v53 <= 0.0) {
    goto LABEL_58;
  }
  uint64_t v55 = (uint64_t)((v53 - v39) * 1000.0);
  if (v32 == (id)3)
  {
    v60 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v66 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
      __int16 v67 = 2048;
      uint64_t v68 = (uint64_t)((v53 - v39) * 1000.0);
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "%s SASRecordingInfo.activationHapticAlertStartTime = %llu", buf, 0x16u);
    }
    v57 = +[NSNumber numberWithLongLong:v55];
    [v24 setActivationHapticAlertStartTime:v57];
    goto LABEL_63;
  }
  if (v32 != (id)2)
  {
LABEL_58:
    v59 = v62;
    v58 = v64;
    if ((v31 & 1) == 0) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }
  v56 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v66 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
    __int16 v67 = 2048;
    uint64_t v68 = (uint64_t)((v53 - v39) * 1000.0);
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "%s SASRecordingInfo.activationAudioAlertStartTime = %llu", buf, 0x16u);
  }
  v57 = +[NSNumber numberWithLongLong:v55];
  [v24 setActivationAudioAlertStartTime:v57];
LABEL_63:

  v59 = v62;
  v58 = v64;
LABEL_64:
  [(SASUpdateAudioInfo *)self setRecordingInfo:v24];
LABEL_65:
}

- (BOOL)ad_isDifferentFromStartSpeech:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SASUpdateAudioInfo *)self codec];
  if (v5 != [v4 codec]
    || ([(SASUpdateAudioInfo *)self vendorId],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6)
    || ([(SASUpdateAudioInfo *)self productId],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    BOOL v8 = 1;
  }
  else
  {
    unint64_t v10 = 0;
    v16 = "audioSource";
    v17 = "deviceIdentifier";
    v18 = "deviceModel";
    v19 = "dspStatus";
    v20 = "headsetAddress";
    v21 = "headsetId";
    BOOL v8 = 1;
    v22 = "headsetName";
    do
    {
      uint64_t v11 = (&v16)[v10];
      objc_super v12 = -[SASUpdateAudioInfo performSelector:](self, "performSelector:", v11, v16, v17, v18, v19, v20, v21, v22);
      uint64_t v13 = [v4 performSelector:v11];
      if (v12 == (void *)v13)
      {
      }
      else
      {
        v14 = (void *)v13;
        unsigned int v15 = [v12 isEqualToString:v13];

        if (!v15) {
          break;
        }
      }
      BOOL v8 = v10++ < 6;
    }
    while (v10 != 7);
  }

  return v8;
}

@end