@interface CSVoiceProfileRetrainManager
+ (CSVoiceProfileRetrainManager)sharedInstance;
- (CSVoiceProfileRetrainManager)init;
- (OS_dispatch_queue)queue;
- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4;
- (void)CSSpeakerRecognitionAssetDownloadMonitor:(id)a3 didInstallNewAsset:(BOOL)a4 assetProviderType:(unint64_t)a5;
- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4;
- (void)_migrateTDVoiceProfileCallback;
- (void)_retrainingVoiceProfile:(id)a3 voiceProfile:(id)a4 asset:(id)a5;
- (void)_runVoiceProfileRetrainerWithAsset:(id)a3 withLanguageCode:(id)a4;
- (void)_speakerRecognitionCleanupDuplicatedProfilesCallback;
- (void)_speakerRecognitionModelRetrainCallback;
- (void)setQueue:(id)a3;
- (void)triggerVoiceProfileRetrainingWithAsset:(id)a3;
@end

@implementation CSVoiceProfileRetrainManager

- (void).cxx_destruct
{
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_retrainingVoiceProfile:(id)a3 voiceProfile:(id)a4 asset:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = CSLogContextFacilityCoreSpeech;
  if (v9)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[CSVoiceProfileRetrainManager _retrainingVoiceProfile:voiceProfile:asset:]";
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s recognitionAsset:%@", buf, 0x16u);
    }
    [v7 pruneImplicitUtterancesOfProfile:v8 withAsset:v9];
    v17[0] = SSRVoiceRetrainingVoiceProfileKey;
    v17[1] = SSRVoiceRetrainingFilterToVoiceTriggerUtterancesKey;
    v18[0] = v8;
    v18[1] = &__kCFBooleanTrue;
    v17[2] = SSRVoiceRetrainingAssetKey;
    v18[2] = v9;
    v11 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
    id v16 = 0;
    id v12 = [objc_alloc((Class)SSRVoiceProfileRetrainingContext) initWithVoiceRetrainingContext:v11 error:&v16];
    id v13 = v16;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100155C04;
    v14[3] = &unk_100252EB8;
    id v15 = v8;
    [v7 triggerRetrainingVoiceProfile:v15 withContext:v12 withCompletion:v14];
  }
  else if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[CSVoiceProfileRetrainManager _retrainingVoiceProfile:voiceProfile:asset:]";
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Asset is nil. Cannot retrain voice profile.", buf, 0xCu);
  }
}

- (void)_runVoiceProfileRetrainerWithAsset:(id)a3 withLanguageCode:(id)a4
{
  id v22 = a3;
  id v20 = a4;
  v5 = +[SSRVoiceProfileManager sharedInstance];
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_100156238;
  v34[4] = sub_100156248;
  id v35 = 0;
  v6 = +[CSVoiceTriggerEnabledMonitor sharedInstance];
  unsigned __int8 v7 = [v6 isEnabled];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100156250;
  block[3] = &unk_100253A90;
  id v8 = v5;
  id v32 = v8;
  v33 = v34;
  if (qword_1002A3C20 == -1)
  {
    if ((v7 & 1) == 0) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&qword_1002A3C20, block);
    if ((v7 & 1) == 0)
    {
LABEL_3:
      if (!+[CSUtils supportsSpeakerRecognitionAssets])goto LABEL_28; {
    }
      }
  }
  [v8 cleanupVoiceProfileModelFilesForLocale:v20 withAsset:v22];
  id v9 = [v8 provisionedVoiceProfilesForAppDomain:SSRSpeakerRecognitionSiriAppDomain withLocale:v20];
  v10 = CSLogContextFacilityCoreSpeech;
  BOOL v11 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[CSVoiceProfileRetrainManager _runVoiceProfileRetrainerWithAsset:withLanguageCode:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2114;
      v39 = v9;
      LOWORD(v40) = 2112;
      *(void *)((char *)&v40 + 2) = v22;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s languageCode:  %{public}@ -voiceProfileArray: %{public}@, _currentAsset:%@", buf, 0x2Au);
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v12 = v9;
    id v13 = [v12 countByEnumeratingWithState:&v27 objects:v41 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v28;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v39 = sub_100156238;
          *(void *)&long long v40 = sub_100156248;
          *((void *)&v40 + 1) = v22;
          if ([*((id *)&v40 + 1) useSpeakerRecognitionAsset])
          {
            v17 = +[SSRAssetManager sharedManager];
            v23[0] = _NSConcreteStackBlock;
            v23[1] = 3221225472;
            v23[2] = sub_10015644C;
            v23[3] = &unk_100252E90;
            v26 = buf;
            v23[4] = self;
            id v24 = v8;
            uint64_t v25 = v16;
            [v17 getSpeakerRecognitionAssetWithLanguage:v20 completion:v23];
          }
          else
          {
            [(CSVoiceProfileRetrainManager *)self _retrainingVoiceProfile:v8 voiceProfile:v16 asset:*(void *)(*(void *)&buf[8] + 40)];
          }
          if ((CSIsCommunalDevice() & 1) == 0 && (unint64_t)[v12 count] >= 2)
          {
            v18 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v36 = 136315138;
              v37 = "-[CSVoiceProfileRetrainManager _runVoiceProfileRetrainerWithAsset:withLanguageCode:]";
              _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s ERR: Constraining pruning and retraining to first profile", v36, 0xCu);
            }
            _Block_object_dispose(buf, 8);

            goto LABEL_26;
          }
          _Block_object_dispose(buf, 8);
        }
        id v13 = [v12 countByEnumeratingWithState:&v27 objects:v41 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_26:
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[CSVoiceProfileRetrainManager _runVoiceProfileRetrainerWithAsset:withLanguageCode:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s No voice profiles found, trigger a download", buf, 0xCu);
    }
    [v8 triggerVoiceProfileDownload];
  }

LABEL_28:

  _Block_object_dispose(v34, 8);
}

- (void)_migrateTDVoiceProfileCallback
{
  id v2 = +[SSRVoiceProfileManager sharedInstance];
  [v2 migrateTDVoiceProfilesToTDTI];
}

- (void)_speakerRecognitionCleanupDuplicatedProfilesCallback
{
  v3 = +[CSVoiceTriggerEnabledMonitor sharedInstance];
  unsigned int v4 = [v3 isEnabled];

  if (CSIsIOS() && v4)
  {
    v5 = +[SSRVoiceProfileManager sharedInstance];
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "-[CSVoiceProfileRetrainManager _speakerRecognitionCleanupDuplicatedProfilesCallback]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Triggered cleanup of duplicated profiles", buf, 0xCu);
    }
    if ([v5 triggerVoiceProfileDuplicatesCleanup])
    {
      unsigned __int8 v7 = +[CSUtils getSiriLanguageWithFallback:0];
      id v8 = +[CSVoiceTriggerAssetHandler sharedHandler];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10015689C;
      v10[3] = &unk_100252E40;
      v10[4] = self;
      id v11 = v7;
      id v9 = v7;
      [v8 getVoiceTriggerAssetWithEndpointId:0 completion:v10];
    }
  }
}

- (void)_speakerRecognitionModelRetrainCallback
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[CSVoiceProfileRetrainManager _speakerRecognitionModelRetrainCallback]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s SpeakerRecognition Model Missing - Triggering voice profile retraining", buf, 0xCu);
  }
  unsigned int v4 = +[CSUtils getSiriLanguageWithFallback:0];
  v5 = +[SSRAssetManager sharedManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100156C20;
  v7[3] = &unk_100252E40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getSpeakerRecognitionAssetWithLanguage:v6 completion:v7];
}

- (void)CSSpeakerRecognitionAssetDownloadMonitor:(id)a3 didInstallNewAsset:(BOOL)a4 assetProviderType:(unint64_t)a5
{
  unsigned __int8 v7 = +[CSUtils supportsSpeakerRecognitionAssets];
  id v8 = CSLogContextFacilityCoreSpeech;
  if (v7)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v15 = "-[CSVoiceProfileRetrainManager CSSpeakerRecognitionAssetDownloadMonitor:didInstallNewAsset:assetProviderType:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s New SpeakerRecognition assets downloaded - Triggering voice profile retraining", buf, 0xCu);
    }
    id v9 = +[CSUtils getSiriLanguageWithFallback:0];
    if (a5)
    {
      v10 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v15 = "-[CSVoiceProfileRetrainManager CSSpeakerRecognitionAssetDownloadMonitor:didInstallNewAsset:assetProviderType:]";
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s ERR: SpeakerRecognition asset is only from MobileAsset Provider", buf, 0xCu);
      }
    }
    else
    {
      id v11 = +[SSRAssetManager sharedManager];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100157064;
      v12[3] = &unk_100252E40;
      v12[4] = self;
      id v13 = v9;
      [v11 getSpeakerRecognitionAssetWithLanguage:v13 completion:v12];
    }
  }
  else if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[CSVoiceProfileRetrainManager CSSpeakerRecognitionAssetDownloadMonitor:didInstallNewAsset:assetProviderType:]";
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s ERR: Ignoring CSSpeakerRecognitionAssetDownloadMonitorDelegate for non-TVOS platforms !", buf, 0xCu);
  }
}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v5 = a4;
  id v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[CSVoiceProfileRetrainManager CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]";
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Language Changed to %{public}@ - Triggering voice profile retraining", buf, 0x16u);
  }
  unsigned __int8 v7 = +[CSVoiceTriggerAssetHandler sharedHandler];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001573E4;
  v9[3] = &unk_100252E40;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v7 getVoiceTriggerAssetWithEndpointId:0 completion:v9];
}

- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100157690;
  v5[3] = &unk_100253AB8;
  BOOL v6 = a4;
  v5[4] = self;
  dispatch_async(queue, v5);
}

- (void)triggerVoiceProfileRetrainingWithAsset:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100157AD4;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (CSVoiceProfileRetrainManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)CSVoiceProfileRetrainManager;
  id v2 = [(CSVoiceProfileRetrainManager *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("cs.secondpass.retrainer.q", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    id v5 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100157D78;
    block[3] = &unk_100253AE0;
    id v6 = v2;
    id v10 = v6;
    dispatch_async(v5, block);
    unsigned __int8 v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v13 = "-[CSVoiceProfileRetrainManager init]";
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Created CSVoiceProfileRetrainManager %@", buf, 0x16u);
    }
  }
  return v2;
}

+ (CSVoiceProfileRetrainManager)sharedInstance
{
  if (qword_1002A3C18 != -1) {
    dispatch_once(&qword_1002A3C18, &stru_100252DC8);
  }
  id v2 = (void *)qword_1002A3C10;
  return (CSVoiceProfileRetrainManager *)v2;
}

@end