@interface ADVolumeService
- (ADVolumeService)initWithQueue:(id)a3 instanceContext:(id)a4 speechController:(id)a5;
- (BOOL)_fetchSystemVolumeForCategory:(id)a3 andMode:(id)a4 audioRoute:(id)a5 withName:(id)a6 usingSystemController:(id)a7 volume:(float *)a8;
- (BOOL)_updateSystemVolumeForCategory:(id)a3 andMode:(id)a4 audioRoute:(id)a5 withName:(id)a6 usingSystemController:(id)a7 volume:(float)a8 operationType:(int64_t)a9;
- (float)_mediaPlaybackVolume;
- (void)_fetchSmartSiriVolumeForType:(unint64_t)a3;
- (void)_fetchSystemVolumes;
- (void)_fetchSystemVolumesUsingSystemController:(id)a3;
- (void)_handleSystemVolumeChangeForCategory:(id)a3 volume:(float)a4 audioCategory:(id)a5 reason:(id)a6;
- (void)_setNeedsUpdateSiriVolume;
- (void)_startObservingSystemControllerLifecycle;
- (void)_startObservingSystemVolumes;
- (void)_stopObservingSystemControllerLifecycle;
- (void)_stopObservingSystemVolumes;
- (void)_updateSiriVolume:(BOOL)a3 completion:(id)a4;
- (void)_updateSiriVolumeIfNeeded;
- (void)adAVSystemControllerDidChange:(id)a3;
- (void)fetchSmartSiriVolumeForType:(unint64_t)a3;
- (void)getMusicOutputVolumeForAudioRoute:(id)a3 withName:(id)a4 completion:(id)a5;
- (void)getSiriOutputVolumeForAudioRoute:(id)a3 withName:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)setClientConfiguration:(id)a3;
- (void)setSiriOutputVolume:(float)a3 forAudioRoute:(id)a4 withName:(id)a5 operationType:(int64_t)a6 completion:(id)a7;
- (void)systemVolumeChanged:(id)a3;
- (void)updateSiriOutputVolume:(BOOL)a3 completion:(id)a4;
- (void)waitUntilSiriOutputVolumeUpdatesAfterTimestamp:(unint64_t)a3 withTimeout:(double)a4 block:(id)a5;
@end

@implementation ADVolumeService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBlocks, 0);
  objc_storeStrong((id *)&self->_volumesByCategory, 0);
  objc_storeStrong((id *)&self->_clientConfiguration, 0);
  objc_storeStrong((id *)&self->_speechController, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (float)_mediaPlaybackVolume
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = [(NSMutableDictionary *)self->_volumesByCategory objectForKey:@"Audio/Video"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)_updateSiriVolume:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(id, void))a4;
  v7 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "-[ADVolumeService _updateSiriVolume:completion:]";
    __int16 v43 = 1024;
    LODWORD(v44) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s forceUpdate = %d", buf, 0x12u);
  }
  self->_needsUpdateSiriVolume = 0;
  uint64_t v8 = mach_absolute_time();
  float smartSiriVolume = self->_smartSiriVolume;
  v10 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "-[ADVolumeService _updateSiriVolume:completion:]";
    __int16 v43 = 2048;
    double v44 = smartSiriVolume;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Cached Smart Siri volume is %f.", buf, 0x16u);
  }
  if (AFIsHorseman())
  {
    v11 = [(AFClientConfiguration *)self->_clientConfiguration deviceSetupFlowBeginDate];
    v12 = [(AFClientConfiguration *)self->_clientConfiguration deviceSetupFlowEndDate];
    int IsActive = AFDeviceSetupIsActive();

    if (IsActive)
    {
      v14 = AFSiriLogContextSpeech;
      if (self->_deviceSetupFlowSiriVolume == 0.0)
      {
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v42 = "-[ADVolumeService _updateSiriVolume:completion:]";
          __int16 v43 = 2048;
          double v44 = smartSiriVolume;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Setting device setup volume to %f", buf, 0x16u);
          v14 = AFSiriLogContextSpeech;
        }
        self->_deviceSetupFlowSiriVolume = smartSiriVolume;
      }
      else
      {
        float smartSiriVolume = self->_deviceSetupFlowSiriVolume;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "-[ADVolumeService _updateSiriVolume:completion:]";
        __int16 v43 = 2048;
        double v44 = smartSiriVolume;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Setting resolved volume to device setup volume %f", buf, 0x16u);
        float smartSiriVolume = self->_deviceSetupFlowSiriVolume;
      }
    }
    else
    {
      v15 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v42 = "-[ADVolumeService _updateSiriVolume:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Resetting device setup volume", buf, 0xCu);
      }
      self->_deviceSetupFlowSiriVolume = 0.0;
    }
    [(AFClientConfiguration *)self->_clientConfiguration outputVolume];
    if (v16 > 0.0)
    {
      float v17 = v16;
      v18 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "-[ADVolumeService _updateSiriVolume:completion:]";
        __int16 v43 = 2048;
        double v44 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Setting resolved volume to client configured output volume %f", buf, 0x16u);
      }
      float smartSiriVolume = v17;
    }
  }
  if (AFIsInternalInstall())
  {
    v19 = +[ADPreferences sharedPreferences];
    float v40 = 0.0;
    if ([v19 getMinimumOutputVolume:&v40])
    {
      v20 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "-[ADVolumeService _updateSiriVolume:completion:]";
        __int16 v43 = 2048;
        double v44 = v40;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s Minimum Siri volume is set to %f.", buf, 0x16u);
      }
      if (smartSiriVolume < v40) {
        float smartSiriVolume = v40;
      }
    }
    float v39 = 0.0;
    if ([v19 getMaximumOutputVolume:&v39])
    {
      v21 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "-[ADVolumeService _updateSiriVolume:completion:]";
        __int16 v43 = 2048;
        double v44 = v39;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s Maximum Siri volume is set to %f.", buf, 0x16u);
      }
      if (smartSiriVolume >= v39) {
        float smartSiriVolume = v39;
      }
    }
  }
  v22 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "-[ADVolumeService _updateSiriVolume:completion:]";
    __int16 v43 = 2048;
    double v44 = smartSiriVolume;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s Resolved Siri volume is %f.", buf, 0x16u);
  }
  if (!v4)
  {
    v23 = [(NSMutableDictionary *)self->_volumesByCategory objectForKey:@"VoiceCommand"];
    v24 = v23;
    if (v23)
    {
      [v23 floatValue];
      float v26 = v25;
      v27 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "-[ADVolumeService _updateSiriVolume:completion:]";
        __int16 v43 = 2048;
        double v44 = v26;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s Cached Siri volume is %f.", buf, 0x16u);
      }
      if (vabds_f32(smartSiriVolume, v26) < 0.01)
      {
        v28 = AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v42 = "-[ADVolumeService _updateSiriVolume:completion:]";
          __int16 v43 = 2048;
          double v44 = v26;
          __int16 v45 = 2048;
          double v46 = smartSiriVolume;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s Ignored because current Siri volume is %f and resolved Siri volume is %f. They are close enough.", buf, 0x20u);
        }

        if (v6) {
          v6[2](v6, 0);
        }
        goto LABEL_51;
      }
    }
    else
    {
      v29 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v42 = "-[ADVolumeService _updateSiriVolume:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s Cached Siri volume is missing.", buf, 0xCu);
      }
    }
  }
  os_signpost_id_t v30 = os_signpost_id_generate(AFSiriLogContextSpeech);
  v31 = AFSiriLogContextSpeech;
  v32 = v31;
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "SiriUpdateOutputVolume", "enableTelemetry=YES", buf, 2u);
  }

  v33 = +[ADAVSystemControllerLifecycleManager sharedManager];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1003505B0;
  v34[3] = &unk_10050D580;
  float v38 = smartSiriVolume;
  v34[4] = self;
  os_signpost_id_t v36 = v30;
  uint64_t v37 = v8;
  v35 = v6;
  [v33 getAVSystemControllerWithTimeout:v34 completion:2.0];

LABEL_51:
}

- (void)_updateSiriVolumeIfNeeded
{
  v3 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    BOOL needsUpdateSiriVolume = self->_needsUpdateSiriVolume;
    int v5 = 136315394;
    v6 = "-[ADVolumeService _updateSiriVolumeIfNeeded]";
    __int16 v7 = 1024;
    BOOL v8 = needsUpdateSiriVolume;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s BOOL needsUpdateSiriVolume = %d", (uint8_t *)&v5, 0x12u);
  }
  if (self->_needsUpdateSiriVolume) {
    [(ADVolumeService *)self _updateSiriVolume:0 completion:0];
  }
}

- (void)_setNeedsUpdateSiriVolume
{
  v3 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    BOOL needsUpdateSiriVolume = self->_needsUpdateSiriVolume;
    *(_DWORD *)buf = 136315394;
    v9 = "-[ADVolumeService _setNeedsUpdateSiriVolume]";
    __int16 v10 = 1024;
    BOOL v11 = needsUpdateSiriVolume;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s BOOL needsUpdateSiriVolume = %d", buf, 0x12u);
  }
  if (!self->_needsUpdateSiriVolume)
  {
    self->_BOOL needsUpdateSiriVolume = 1;
    dispatch_time_t v5 = dispatch_time(0, 200000000);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100350C50;
    block[3] = &unk_10050E138;
    block[4] = self;
    dispatch_after(v5, queue, block);
  }
}

- (void)_fetchSmartSiriVolumeForType:(unint64_t)a3
{
  dispatch_time_t v5 = [(AFClientConfiguration *)self->_clientConfiguration deviceSetupFlowBeginDate];
  v6 = [(AFClientConfiguration *)self->_clientConfiguration deviceSetupFlowEndDate];
  int IsActive = AFDeviceSetupIsActive();

  if (IsActive) {
    a3 = 3;
  }
  [(CSSpeechController *)self->_speechController getVolumeForTTSType:a3];
  float v9 = v8;
  if (v8 >= 0.0 && v8 <= 1.0)
  {
    self->_float smartSiriVolume = v8;
    v12 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315650;
      v14 = "-[ADVolumeService _fetchSmartSiriVolumeForType:]";
      __int16 v15 = 2048;
      double v16 = v9;
      __int16 v17 = 2048;
      unint64_t v18 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Smart Siri volume is %f for type: %lu.", (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    BOOL v11 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      v14 = "_ADVolumeServiceSmartSiriVolumeIsValid";
      __int16 v15 = 2048;
      double v16 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Invalid Smart Siri Volume: %f", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)_handleSystemVolumeChangeForCategory:(id)a3 volume:(float)a4 audioCategory:(id)a5 reason:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  int v13 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v18 = 136316162;
    v19 = "-[ADVolumeService _handleSystemVolumeChangeForCategory:volume:audioCategory:reason:]";
    __int16 v20 = 2112;
    id v21 = v10;
    __int16 v22 = 2048;
    double v23 = a4;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2112;
    id v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s category = %@, volume = %f, audioCategory = %@, reason = %@", (uint8_t *)&v18, 0x34u);
  }
  v14 = [(NSMutableDictionary *)self->_volumesByCategory objectForKey:v10];
  *(float *)&double v15 = a4;
  double v16 = +[NSNumber numberWithFloat:v15];
  if ([v14 isEqual:v16])
  {
    AFIsHorseman();
  }
  else
  {
    [(NSMutableDictionary *)self->_volumesByCategory setObject:v16 forKey:v10];
    if (AFIsHorseman()
      && [v11 isEqualToString:@"Audio/Video"]
      && self->_deviceSetupFlowSiriVolume > 0.0)
    {
      __int16 v17 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        int v18 = 136315650;
        v19 = "-[ADVolumeService _handleSystemVolumeChangeForCategory:volume:audioCategory:reason:]";
        __int16 v20 = 2112;
        id v21 = v11;
        __int16 v22 = 2112;
        double v23 = *(double *)&v12;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Resetting device setup volume due to %@ audio category volume change for %@.", (uint8_t *)&v18, 0x20u);
      }
      self->_deviceSetupFlowSiriVolume = 0.0;
    }
  }
}

- (void)systemVolumeChanged:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v25 = "-[ADVolumeService systemVolumeChanged:]";
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s notification = %@", buf, 0x16u);
  }
  uint64_t v6 = mach_absolute_time();
  __int16 v7 = [v4 userInfo];
  float v8 = [v7 objectForKey:AVSystemController_AudioCategoryNotificationParameter];
  uint64_t v9 = [v7 objectForKey:AVSystemController_AudioVolumeChangeReasonNotificationParameter];
  id v10 = (void *)v9;
  id v11 = @"Notification";
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  id v12 = v11;

  int v13 = [v7 objectForKey:AVSystemController_AudioVolumeNotificationParameter];
  [v13 floatValue];
  int v15 = v14;

  if (v8)
  {
    double v16 = +[ADAVSystemControllerLifecycleManager sharedManager];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1003512B8;
    v18[3] = &unk_10050D530;
    v18[4] = self;
    id v19 = v8;
    int v23 = v15;
    __int16 v20 = v12;
    uint64_t v22 = v6;
    id v21 = v4;
    [v16 getAVSystemControllerWithTimeout:v18 completion:2.0];
  }
  else
  {
    __int16 v17 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v25 = "-[ADVolumeService systemVolumeChanged:]";
      __int16 v26 = 2112;
      id v27 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Ignored because no audio category is specified in the notification %@.", buf, 0x16u);
    }
  }
}

- (BOOL)_updateSystemVolumeForCategory:(id)a3 andMode:(id)a4 audioRoute:(id)a5 withName:(id)a6 usingSystemController:(id)a7 volume:(float)a8 operationType:(int64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  __int16 v20 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316674;
    v62 = "-[ADVolumeService _updateSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volume:operationType:]";
    __int16 v63 = 2112;
    id v64 = v15;
    __int16 v65 = 2112;
    id v66 = v16;
    __int16 v67 = 2112;
    id v68 = v17;
    __int16 v69 = 2112;
    id v70 = v18;
    __int16 v71 = 2048;
    double v72 = a8;
    __int16 v73 = 2048;
    int64_t v74 = a9;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s category = %@, mode = %@, audioRoute = %@, routeName = %@, volume = %f, operationType = %ld", buf, 0x48u);
  }
  BOOL v21 = 0;
  if (v15 && v19)
  {
    if (v17)
    {
      id v22 = [v17 avscRouteDescription];
      if (v22) {
        goto LABEL_7;
      }
      os_signpost_id_t v36 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v62 = "-[ADVolumeService _updateSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volume:operationType:]";
        __int16 v63 = 2112;
        id v64 = v17;
        uint64_t v37 = "%s Unable to find a pickable route matching audio route %@.";
LABEL_31:
        float v38 = v36;
        uint32_t v39 = 22;
LABEL_32:
        _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, v37, buf, v39);
      }
    }
    else
    {
      if (v18)
      {
        id v49 = v16;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v50 = v19;
        id v53 = v15;
        v28 = [v19 pickableRoutesForCategory:v15 andMode:v16];
        id v29 = [v28 countByEnumeratingWithState:&v54 objects:v60 count:16];
        if (v29)
        {
          id v30 = v29;
          uint64_t v31 = *(void *)v55;
LABEL_19:
          uint64_t v32 = 0;
          while (1)
          {
            if (*(void *)v55 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = *(void **)(*((void *)&v54 + 1) + 8 * v32);
            v34 = [v33 objectForKey:AVSystemController_RouteDescriptionKey_AVAudioRouteName];
            unsigned __int8 v35 = [v18 isEqualToString:v34];

            if (v35) {
              break;
            }
            if (v30 == (id)++v32)
            {
              id v30 = [v28 countByEnumeratingWithState:&v54 objects:v60 count:16];
              if (v30) {
                goto LABEL_19;
              }
              goto LABEL_25;
            }
          }
          id v22 = v33;

          id v19 = v50;
          id v15 = v53;
          id v16 = v49;
          if (v22) {
            goto LABEL_7;
          }
        }
        else
        {
LABEL_25:

          id v19 = v50;
          id v15 = v53;
          id v16 = v49;
        }
        os_signpost_id_t v36 = AFSiriLogContextSpeech;
        if (!os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR)) {
          goto LABEL_43;
        }
        *(_DWORD *)buf = 136315394;
        v62 = "-[ADVolumeService _updateSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volume:operationType:]";
        __int16 v63 = 2112;
        id v64 = 0;
        uint64_t v37 = "%s Unable to find a pickable route matching audio route %@.";
        goto LABEL_31;
      }
      id v22 = [v19 attributeForKey:AVSystemController_PickedRouteAttribute];
      if (v22)
      {
LABEL_7:
        int v23 = AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v62 = "-[ADVolumeService _updateSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volum"
                "e:operationType:]";
          __int16 v63 = 2112;
          id v64 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s routeInfo = %@", buf, 0x16u);
        }
        __int16 v24 = [v22 objectForKey:AVSystemController_RouteDescriptionKey_AVAudioRouteName];
        id v25 = [v22 objectForKey:AVSystemController_RouteDescriptionKey_RouteUID];
        v52 = [v22 objectForKey:AVSystemController_RouteDescriptionKey_RouteSubtype];
        __int16 v26 = AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          v62 = "-[ADVolumeService _updateSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volum"
                "e:operationType:]";
          __int16 v63 = 2112;
          id v64 = v24;
          __int16 v65 = 2112;
          id v66 = v25;
          __int16 v67 = 2112;
          id v68 = v52;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s route = %@, deviceIdentifier = %@, routeSubtype = %@", buf, 0x2Au);
        }
        switch(a9)
        {
          case 1:
            *(float *)&double v27 = a8;
            if ([v19 setVolume:v15 category:v16 mode:v24 route:v25 deviceIdentifier:v52 routeSubtype:v27 rampUpDuration:0.0 rampDownDuration:0.0])goto LABEL_39; {
            break;
            }
          case 3:
            BOOL v21 = 0;
            if ([v19 changeVolumeForRoute:0 forCategory:v15 mode:v16 route:v24 deviceIdentifier:v25 andRouteSubtype:v52])
            {
LABEL_40:

              goto LABEL_44;
            }
            break;
          case 2:
            if ([v19 changeVolumeForRoute:1 forCategory:v15 mode:v16 route:v24 deviceIdentifier:v25 andRouteSubtype:v52])
            {
LABEL_39:
              BOOL v21 = 0;
              goto LABEL_40;
            }
            break;
          default:
            double v46 = AFSiriLogContextSpeech;
            if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v62 = "-[ADVolumeService _updateSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:v"
                    "olume:operationType:]";
              _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%s Unsupported volume operation type.", buf, 0xCu);
            }
            goto LABEL_39;
        }
        +[AFAnalytics sharedAnalytics];
        id v51 = v19;
        id v40 = v17;
        v42 = id v41 = v16;
        v58[0] = @"category";
        v58[1] = @"volume";
        v59[0] = v15;
        *(float *)&double v43 = a8;
        double v44 = +[NSNumber numberWithFloat:v43];
        v59[1] = v44;
        __int16 v45 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:2];
        [v42 logEventWithType:4603 context:v45];

        id v16 = v41;
        id v17 = v40;
        id v19 = v51;
        BOOL v21 = 1;
        goto LABEL_40;
      }
      v47 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v62 = "-[ADVolumeService _updateSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volume:operationType:]";
        uint64_t v37 = "%s There's no picked route.";
        float v38 = v47;
        uint32_t v39 = 12;
        goto LABEL_32;
      }
    }
LABEL_43:
    BOOL v21 = 0;
  }
LABEL_44:

  return v21;
}

- (BOOL)_fetchSystemVolumeForCategory:(id)a3 andMode:(id)a4 audioRoute:(id)a5 withName:(id)a6 usingSystemController:(id)a7 volume:(float *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v59 = "-[ADVolumeService _fetchSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volume:]";
    __int16 v60 = 2112;
    id v61 = v13;
    __int16 v62 = 2112;
    id v63 = v14;
    __int16 v64 = 2112;
    id v65 = v15;
    __int16 v66 = 2112;
    id v67 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s category = %@, mode = %@, audioRoute = %@, routeName = %@", buf, 0x34u);
  }
  if (!a8) {
    goto LABEL_34;
  }
  BOOL v19 = 0;
  *a8 = 0.0;
  if (!v13 || !v17) {
    goto LABEL_35;
  }
  if (!v15)
  {
    if (v16)
    {
      id v46 = v14;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v48 = v17;
      id v50 = v13;
      id v30 = [v17 pickableRoutesForCategory:v13 andMode:v14];
      id v31 = [v30 countByEnumeratingWithState:&v51 objects:v57 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v52;
LABEL_18:
        uint64_t v34 = 0;
        while (1)
        {
          if (*(void *)v52 != v33) {
            objc_enumerationMutation(v30);
          }
          unsigned __int8 v35 = *(void **)(*((void *)&v51 + 1) + 8 * v34);
          os_signpost_id_t v36 = [v35 objectForKey:AVSystemController_RouteDescriptionKey_AVAudioRouteName];
          unsigned __int8 v37 = [v16 isEqualToString:v36];

          if (v37) {
            break;
          }
          if (v32 == (id)++v34)
          {
            id v32 = [v30 countByEnumeratingWithState:&v51 objects:v57 count:16];
            if (v32) {
              goto LABEL_18;
            }
            goto LABEL_24;
          }
        }
        id v20 = v35;

        id v17 = v48;
        id v13 = v50;
        id v14 = v46;
        if (v20) {
          goto LABEL_8;
        }
      }
      else
      {
LABEL_24:

        id v17 = v48;
        id v13 = v50;
        id v14 = v46;
      }
      float v38 = AFSiriLogContextSpeech;
      if (!os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = 136315394;
      v59 = "-[ADVolumeService _fetchSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volume:]";
      __int16 v60 = 2112;
      id v61 = 0;
      uint32_t v39 = "%s Unable to find a pickable route matching audio route %@.";
      goto LABEL_30;
    }
    id v20 = [v17 attributeForKey:AVSystemController_PickedRouteAttribute];
    if (v20) {
      goto LABEL_8;
    }
    v42 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v59 = "-[ADVolumeService _fetchSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volume:]";
      uint32_t v39 = "%s There's no picked route.";
      id v40 = v42;
      uint32_t v41 = 12;
      goto LABEL_31;
    }
LABEL_34:
    BOOL v19 = 0;
    goto LABEL_35;
  }
  id v20 = [v15 avscRouteDescription];
  if (!v20)
  {
    float v38 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v59 = "-[ADVolumeService _fetchSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volume:]";
      __int16 v60 = 2112;
      id v61 = v15;
      uint32_t v39 = "%s Unable to find a pickable route matching audio route %@.";
LABEL_30:
      id v40 = v38;
      uint32_t v41 = 22;
LABEL_31:
      _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, v39, buf, v41);
      goto LABEL_34;
    }
    goto LABEL_34;
  }
LABEL_8:
  BOOL v21 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v59 = "-[ADVolumeService _fetchSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volume:]";
    __int16 v60 = 2112;
    id v61 = v20;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s routeInfo = %@", buf, 0x16u);
  }
  id v49 = [v20 objectForKey:AVSystemController_RouteDescriptionKey_AVAudioRouteName];
  id v22 = [v20 objectForKey:AVSystemController_RouteDescriptionKey_RouteUID];
  int v23 = [v20 objectForKey:AVSystemController_RouteDescriptionKey_RouteSubtype];
  __int16 v24 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v59 = "-[ADVolumeService _fetchSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volume:]";
    __int16 v60 = 2112;
    id v61 = v49;
    __int16 v62 = 2112;
    id v63 = v22;
    __int16 v64 = 2112;
    id v65 = v23;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s route = %@, deviceIdentifier = %@, routeSubtype = %@", buf, 0x2Au);
  }
  unsigned int v25 = [v17 getVolume:a8 category:v13 mode:v14 route:v49 deviceIdentifier:v22 routeSubtype:v23];
  BOOL v19 = v25 == 0;
  if (!v25)
  {
    __int16 v45 = +[AFAnalytics sharedAnalytics];
    v55[1] = @"volume";
    v56[0] = v13;
    v55[0] = @"category";
    *(float *)&double v26 = *a8;
    double v44 = +[NSNumber numberWithFloat:v26];
    v56[1] = v44;
    +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
    id v47 = v17;
    id v27 = v15;
    id v29 = v28 = v14;
    [v45 logEventWithType:4602 context:v29];

    id v14 = v28;
    id v15 = v27;
    id v17 = v47;
  }
LABEL_35:

  return v19;
}

- (void)_fetchSystemVolumesUsingSystemController:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[ADVolumeService _fetchSystemVolumesUsingSystemController:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  int v12 = 0;
  uint64_t v6 = [v4 volumeCategoryForAudioCategory:@"Audio/Video"];
  if (v6)
  {
    if ([(ADVolumeService *)self _fetchSystemVolumeForCategory:v6 andMode:0 audioRoute:0 withName:0 usingSystemController:v4 volume:&v12])
    {
      LODWORD(v7) = v12;
      [(ADVolumeService *)self _handleSystemVolumeChangeForCategory:v6 volume:@"Audio/Video" audioCategory:@"ClientFetch" reason:v7];
    }
  }
  else
  {
    float v8 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "-[ADVolumeService _fetchSystemVolumesUsingSystemController:]";
      __int16 v15 = 2112;
      CFStringRef v16 = @"Audio/Video";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Unable to get the volume category for audio category '%@'", buf, 0x16u);
    }
  }
  int v12 = 0;
  uint64_t v9 = [v4 volumeCategoryForAudioCategory:@"VoiceCommand"];

  if (v9)
  {
    if ([(ADVolumeService *)self _fetchSystemVolumeForCategory:v9 andMode:@"SpeechRecognition" audioRoute:0 withName:0 usingSystemController:v4 volume:&v12])
    {
      LODWORD(v10) = v12;
      [(ADVolumeService *)self _handleSystemVolumeChangeForCategory:v9 volume:@"VoiceCommand" audioCategory:@"ClientFetch" reason:v10];
    }
  }
  else
  {
    id v11 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "-[ADVolumeService _fetchSystemVolumesUsingSystemController:]";
      __int16 v15 = 2112;
      CFStringRef v16 = @"VoiceCommand";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Unable to get the volume category for audio category '%@'", buf, 0x16u);
    }
  }
}

- (void)_fetchSystemVolumes
{
  v3 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    double v7 = "-[ADVolumeService _fetchSystemVolumes]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v4 = +[ADAVSystemControllerLifecycleManager sharedManager];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100352608;
  v5[3] = &unk_10050D4E0;
  v5[4] = self;
  [v4 getAVSystemControllerWithTimeout:v5 completion:2.0];
}

- (void)_stopObservingSystemVolumes
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:AVSystemController_SystemVolumeDidChangeNotification object:0];
}

- (void)_startObservingSystemVolumes
{
  [(ADVolumeService *)self _stopObservingSystemVolumes];
  id v3 = +[AVSystemController sharedAVSystemController];
  uint64_t v6 = AVSystemController_SystemVolumeDidChangeNotification;
  id v4 = +[NSArray arrayWithObjects:&v6 count:1];
  [v3 setAttribute:v4 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];
  dispatch_time_t v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"systemVolumeChanged:" name:AVSystemController_SystemVolumeDidChangeNotification object:0];
}

- (void)_stopObservingSystemControllerLifecycle
{
  id v3 = +[ADAVSystemControllerLifecycleManager sharedManager];
  [v3 removeObserver:self];
}

- (void)_startObservingSystemControllerLifecycle
{
  [(ADVolumeService *)self _stopObservingSystemControllerLifecycle];
  id v3 = +[ADAVSystemControllerLifecycleManager sharedManager];
  [v3 addObserver:self];
}

- (void)adAVSystemControllerDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100352A20;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100352AF8;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setSiriOutputVolume:(float)a3 forAudioRoute:(id)a4 withName:(id)a5 operationType:(int64_t)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  __int16 v15 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    id v27 = "-[ADVolumeService setSiriOutputVolume:forAudioRoute:withName:operationType:completion:]";
    __int16 v28 = 2048;
    double v29 = a3;
    __int16 v30 = 2112;
    id v31 = v12;
    __int16 v32 = 2112;
    id v33 = v13;
    __int16 v34 = 2048;
    int64_t v35 = a6;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s volume = %f, audioRoute = %@, routeName = %@, operationType = %ld", buf, 0x34u);
  }
  queue = self->_queue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100352D18;
  v20[3] = &unk_10050D4B8;
  v20[4] = self;
  id v21 = v12;
  id v22 = v13;
  id v23 = v14;
  float v25 = a3;
  int64_t v24 = a6;
  id v17 = v13;
  id v18 = v12;
  id v19 = v14;
  dispatch_async(queue, v20);
}

- (void)getSiriOutputVolumeForAudioRoute:(id)a3 withName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "-[ADVolumeService getSiriOutputVolumeForAudioRoute:withName:completion:]";
      __int16 v19 = 2112;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s audioRoute = %@, routeName = %@", buf, 0x20u);
    }
    queue = self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100353330;
    v13[3] = &unk_10050E228;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(queue, v13);
  }
}

- (void)getMusicOutputVolumeForAudioRoute:(id)a3 withName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "-[ADVolumeService getMusicOutputVolumeForAudioRoute:withName:completion:]";
      __int16 v19 = 2112;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s audioRoute = %@, routeName = %@", buf, 0x20u);
    }
    queue = self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1003538D4;
    v13[3] = &unk_10050E228;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(queue, v13);
  }
}

- (void)setClientConfiguration:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100353DB8;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)waitUntilSiriOutputVolumeUpdatesAfterTimestamp:(unint64_t)a3 withTimeout:(double)a4 block:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    if (self->_isSmartSiriVolumeAvailable)
    {
      id v9 = objc_alloc((Class)AFSafetyBlock);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100354068;
      v18[3] = &unk_10050D3A0;
      v18[4] = self;
      id v19 = v8;
      unint64_t v20 = a3;
      id v10 = [v9 initWithBlock:v18];
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10035408C;
      block[3] = &unk_10050D3C8;
      id v15 = v10;
      unint64_t v16 = a3;
      block[4] = self;
      double v17 = a4;
      id v12 = v10;
      dispatch_async(queue, block);
    }
    else
    {
      id v13 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v22 = "-[ADVolumeService waitUntilSiriOutputVolumeUpdatesAfterTimestamp:withTimeout:block:]";
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Smart Siri Volume is not supported on this platform.", buf, 0xCu);
      }
      (*((void (**)(id, void))v8 + 2))(v8, 0);
    }
  }
}

- (void)updateSiriOutputVolume:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  double v7 = (void (**)(void, void))v6;
  if (!self->_isSmartSiriVolumeAvailable)
  {
    id v9 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[ADVolumeService updateSiriOutputVolume:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Smart Siri Volume is not supported on this platform.", buf, 0xCu);
      if (!v7) {
        goto LABEL_6;
      }
    }
    else if (!v7)
    {
      goto LABEL_6;
    }
    v7[2](v7, 0);
    goto LABEL_6;
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100354364;
  block[3] = &unk_10050D378;
  block[4] = self;
  BOOL v12 = a3;
  id v11 = v6;
  dispatch_async(queue, block);

LABEL_6:
}

- (void)fetchSmartSiriVolumeForType:(unint64_t)a3
{
  if (self->_isSmartSiriVolumeAvailable)
  {
    queue = self->_queue;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100354484;
    v5[3] = &unk_10050D8C0;
    v5[4] = self;
    void v5[5] = a3;
    dispatch_async(queue, v5);
  }
  else
  {
    id v4 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      double v7 = "-[ADVolumeService fetchSmartSiriVolumeForType:]";
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Smart Siri Volume is not supported on this platform.", buf, 0xCu);
    }
  }
}

- (ADVolumeService)initWithQueue:(id)a3 instanceContext:(id)a4 speechController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ADVolumeService;
  BOOL v12 = [(ADVolumeService *)&v20 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    if (v10)
    {
      id v14 = (AFInstanceContext *)v10;
    }
    else
    {
      id v14 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v13->_instanceContext;
    v13->_instanceContext = v14;

    objc_storeStrong((id *)&v13->_speechController, a5);
    v13->_isSmartSiriVolumeAvailable = sub_1003545D0((uint64_t)v13->_instanceContext);
    queue = v13->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100354678;
    block[3] = &unk_10050E138;
    id v19 = v13;
    dispatch_async(queue, block);
  }
  return v13;
}

@end