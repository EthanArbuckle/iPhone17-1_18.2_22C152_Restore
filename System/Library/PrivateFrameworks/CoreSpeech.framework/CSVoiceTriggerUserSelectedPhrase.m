@interface CSVoiceTriggerUserSelectedPhrase
- (BOOL)_isMultiPhrase:(unint64_t)a3;
- (BOOL)mphSelected;
- (BOOL)multiPhraseSelected;
- (CSVoiceTriggerUserSelectedPhrase)initWithEndpointId:(id)a3;
- (CSVoiceTriggerUserSelectedPhrase)initWithEndpointId:(id)a3 vtPreferences:(id)a4;
- (CSVoiceTriggerUserSelectedPhraseDelegate)delegate;
- (NSUUID)endpointDeviceId;
- (OS_dispatch_queue)queue;
- (VTPreferences)vtPrefrences;
- (unint64_t)_fetchUserSelectedPhraseType;
- (unint64_t)uSelectedPhraseType;
- (unint64_t)userSelectedPhraseType;
- (void)_registerForNotification;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setEndpointDeviceId:(id)a3;
- (void)setMphSelected:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setUSelectedPhraseType:(unint64_t)a3;
- (void)setVtPrefrences:(id)a3;
- (void)vtPhraseTypeDidChangeNotificationReceived;
@end

@implementation CSVoiceTriggerUserSelectedPhrase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_endpointDeviceId, 0);
  objc_storeStrong((id *)&self->_vtPrefrences, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setUSelectedPhraseType:(unint64_t)a3
{
  self->_uSelectedPhraseType = a3;
}

- (unint64_t)uSelectedPhraseType
{
  return self->_uSelectedPhraseType;
}

- (void)setMphSelected:(BOOL)a3
{
  self->_mphSelected = a3;
}

- (BOOL)mphSelected
{
  return self->_mphSelected;
}

- (void)setEndpointDeviceId:(id)a3
{
}

- (NSUUID)endpointDeviceId
{
  return self->_endpointDeviceId;
}

- (void)setVtPrefrences:(id)a3
{
}

- (VTPreferences)vtPrefrences
{
  return self->_vtPrefrences;
}

- (CSVoiceTriggerUserSelectedPhraseDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSVoiceTriggerUserSelectedPhraseDelegate *)WeakRetained;
}

- (BOOL)multiPhraseSelected
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100147C48;
  block[3] = &unk_100252970;
  block[4] = &v8;
  objc_copyWeak(&v6, &location);
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v9 + 24);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return (char)queue;
}

- (unint64_t)userSelectedPhraseType
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100147D4C;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_registerForNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)kVTPreferencesVTPhraseTypeDidChangeDarwinNotification;
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100147DBC, v4, 0, CFNotificationSuspensionBehaviorDrop);
}

- (void)vtPhraseTypeDidChangeNotificationReceived
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100147E6C;
  v4[3] = &unk_1002533D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)_isMultiPhrase:(unint64_t)a3
{
  return a3 == 1;
}

- (unint64_t)_fetchUserSelectedPhraseType
{
  if (+[CSUtils isDarwinOS]) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 2 * (self->_endpointDeviceId != 0);
  }
  id v4 = -[VTPreferences getUserPreferredVoiceTriggerPhraseTypeForDeviceType:endpointId:error:](self->_vtPrefrences, "getUserPreferredVoiceTriggerPhraseTypeForDeviceType:endpointId:error:", v3);
  id v5 = 0;
  if (v5)
  {
    uint64_t v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v9 = "-[CSVoiceTriggerUserSelectedPhrase _fetchUserSelectedPhraseType]";
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Error fetching the user selected phrase type %@", buf, 0x16u);
    }
  }

  return (unint64_t)v4;
}

- (void)dealloc
{
  uint64_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSVoiceTriggerUserSelectedPhrase dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kVTPreferencesVTPhraseTypeDidChangeDarwinNotification, 0);
  v5.receiver = self;
  v5.super_class = (Class)CSVoiceTriggerUserSelectedPhrase;
  [(CSVoiceTriggerUserSelectedPhrase *)&v5 dealloc];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001482CC;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (CSVoiceTriggerUserSelectedPhrase)initWithEndpointId:(id)a3 vtPreferences:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CSVoiceTriggerUserSelectedPhrase;
  uint64_t v9 = [(CSVoiceTriggerUserSelectedPhrase *)&v17 init];
  __int16 v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endpointDeviceId, a3);
    if (v8)
    {
      id v11 = (VTPreferences *)v8;
    }
    else
    {
      id v11 = +[VTPreferences sharedPreferences];
    }
    vtPrefrences = v10->_vtPrefrences;
    v10->_vtPrefrences = v11;

    uint64_t v13 = +[CSUtils getSerialQueue:@"com.apple.com.CSUserSelectedVTPhraseMonitor" qualityOfService:33];
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    id v15 = [(CSVoiceTriggerUserSelectedPhrase *)v10 _fetchUserSelectedPhraseType];
    v10->_uSelectedPhraseType = (unint64_t)v15;
    v10->_mphSelected = [(CSVoiceTriggerUserSelectedPhrase *)v10 _isMultiPhrase:v15];
    [(CSVoiceTriggerUserSelectedPhrase *)v10 _registerForNotification];
  }

  return v10;
}

- (CSVoiceTriggerUserSelectedPhrase)initWithEndpointId:(id)a3
{
  return [(CSVoiceTriggerUserSelectedPhrase *)self initWithEndpointId:a3 vtPreferences:0];
}

@end