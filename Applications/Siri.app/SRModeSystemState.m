@interface SRModeSystemState
- (BOOL)isConnectedToAudioAccessory;
- (BOOL)isConnectedToCarPlay;
- (BOOL)isDeviceSilentMode;
- (BOOL)isEyesFree;
- (BOOL)isForCarDND;
- (BOOL)isRequestEmergencyCall;
- (BOOL)isRequestMadeWithPhysicalDeviceInteraction;
- (BOOL)isScreenOffBeforeRequest;
- (BOOL)isVoiceTriggerRequest;
- (BOOL)userTouchedSnippet;
- (BOOL)userTypedInSiri;
- (SASRequestOptions)requestOptions;
- (SRModeSystemState)init;
- (id)_requestOptions;
- (id)description;
- (unint64_t)voiceFeedbackSetting;
- (void)_connectedOutputDevicesDidChange:(id)a3;
- (void)_fetchConnectedAudioAccessoryState;
- (void)setRequestOptions:(id)a3;
- (void)setUserTouchedSnippet:(BOOL)a3;
- (void)setUserTypedInSiri:(BOOL)a3;
- (void)setVoiceFeedbackSetting:(unint64_t)a3;
@end

@implementation SRModeSystemState

- (SRModeSystemState)init
{
  v16.receiver = self;
  v16.super_class = (Class)SRModeSystemState;
  v2 = [(SRModeSystemState *)&v16 init];
  if (v2)
  {
    v3 = +[AFPreferences sharedPreferences];
    unint64_t v4 = (unint64_t)[v3 useDeviceSpeakerForTTS];
    if (v4 > 3) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = qword_1000DC420[v4];
    }
    v2->_voiceFeedbackSetting = v5;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.siri.AudioAccessoryQueue", 0);
    audioAccessoryQueue = v2->_audioAccessoryQueue;
    v2->_audioAccessoryQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = +[AVOutputContext sharedSystemAudioContext];
    sharedSystemAudioContext = v2->_sharedSystemAudioContext;
    v2->_sharedSystemAudioContext = (AVOutputContext *)v8;

    [(SRModeSystemState *)v2 _fetchConnectedAudioAccessoryState];
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v2 selector:"_connectedOutputDevicesDidChange:" name:AVOutputContextOutputDeviceDidChangeNotification object:0];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"_connectedOutputDevicesDidChange:" name:AVOutputContextOutputDevicesDidChangeNotification object:0];

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.siri.mode.SystemState", 0);
    v13 = (AFNotifyObserver *)[objc_alloc((Class)AFNotifyObserver) initWithName:@"com.apple.springboard.ringerstate" options:1 queue:v12 delegate:0];
    ringerStateObserver = v2->_ringerStateObserver;
    v2->_ringerStateObserver = v13;
  }
  return v2;
}

- (BOOL)userTypedInSiri
{
  v2 = [(SRModeSystemState *)self _requestOptions];
  id v3 = [v2 requestSource];

  return v3 == (id)32 || v3 == (id)23;
}

- (BOOL)isVoiceTriggerRequest
{
  id v3 = [(SRModeSystemState *)self _requestOptions];
  id v4 = [v3 requestSource];

  uint64_t v5 = [(SRModeSystemState *)self _requestOptions];
  dispatch_queue_t v6 = [v5 speechRequestOptions];
  id v7 = [v6 activationEvent];

  BOOL v10 = v4 == (id)18 && v7 == (id)15 || v4 == (id)44;
  return v4 == (id)8 || v10;
}

- (BOOL)isConnectedToCarPlay
{
  v2 = [(SRModeSystemState *)self _requestOptions];
  unsigned __int8 v3 = [v2 isConnectedToCarPlay];

  return v3;
}

- (BOOL)isForCarDND
{
  v2 = [(SRModeSystemState *)self _requestOptions];
  unsigned __int8 v3 = [v2 isForCarDND];

  return v3;
}

- (BOOL)isEyesFree
{
  v2 = [(SRModeSystemState *)self _requestOptions];
  unsigned __int8 v3 = [v2 isForEyesFree];

  return v3;
}

- (BOOL)isConnectedToAudioAccessory
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  audioAccessoryQueue = self->_audioAccessoryQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001B0E0;
  v5[3] = &unk_100143500;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(audioAccessoryQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isScreenOffBeforeRequest
{
  return 0;
}

- (BOOL)isRequestMadeWithPhysicalDeviceInteraction
{
  v2 = [(SRModeSystemState *)self _requestOptions];
  unint64_t v3 = (unint64_t)[v2 requestSource];

  return (v3 > 0x37) | (0x37800E1880000EuLL >> v3) & 1;
}

- (BOOL)isDeviceSilentMode
{
  return [(AFNotifyObserver *)self->_ringerStateObserver state] == 0;
}

- (BOOL)isRequestEmergencyCall
{
  return 0;
}

- (id)description
{
  v20 = +[NSString stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  v21[0] = v20;
  v19 = +[NSString stringWithFormat:@"userTypedInSiri=%i", [(SRModeSystemState *)self userTypedInSiri]];
  v21[1] = v19;
  v18 = +[NSString stringWithFormat:@"userTouchedSnippet=%i", [(SRModeSystemState *)self userTouchedSnippet]];
  v21[2] = v18;
  unint64_t v3 = [(SRModeSystemState *)self voiceFeedbackSetting];
  CFStringRef v4 = @"SRModeVoiceFeedbackPreferSilentResponses";
  if (v3 == 1) {
    CFStringRef v4 = @"SRModeVoiceFeedbackAutomatic";
  }
  if (v3 == 2) {
    CFStringRef v4 = @"SRModeVoiceFeedbackPreferSpokenResponses";
  }
  v17 = +[NSString stringWithFormat:@"voiceFeedbackSetting=%@", v4];
  v21[3] = v17;
  uint64_t v5 = +[NSString stringWithFormat:@"isVoiceTriggerRequest=%i", [(SRModeSystemState *)self isVoiceTriggerRequest]];
  v21[4] = v5;
  uint64_t v6 = +[NSString stringWithFormat:@"isConnectedToCarPlay=%i", [(SRModeSystemState *)self isConnectedToCarPlay]];
  v21[5] = v6;
  id v7 = +[NSString stringWithFormat:@"isForCarDND=%i", [(SRModeSystemState *)self isForCarDND]];
  v21[6] = v7;
  uint64_t v8 = +[NSString stringWithFormat:@"isEyesFree=%i", [(SRModeSystemState *)self isEyesFree]];
  v21[7] = v8;
  char v9 = +[NSString stringWithFormat:@"isConnectedToAudioAccessory=%i", [(SRModeSystemState *)self isConnectedToAudioAccessory]];
  v21[8] = v9;
  BOOL v10 = +[NSString stringWithFormat:@"isScreenOffBeforeRequest=%i", [(SRModeSystemState *)self isScreenOffBeforeRequest]];
  v21[9] = v10;
  v11 = +[NSString stringWithFormat:@"isRequestMadeWithPhysicalDeviceInteraction=%i", [(SRModeSystemState *)self isRequestMadeWithPhysicalDeviceInteraction]];
  v21[10] = v11;
  dispatch_queue_t v12 = +[NSString stringWithFormat:@"isDeviceSilentMode=%i", [(SRModeSystemState *)self isDeviceSilentMode]];
  v21[11] = v12;
  v13 = +[NSString stringWithFormat:@"isRequestEmergencyCall=%i", [(SRModeSystemState *)self isRequestEmergencyCall]];
  v21[12] = v13;
  v21[13] = @">";
  v14 = +[NSArray arrayWithObjects:v21 count:14];

  v15 = [v14 componentsJoinedByString:@"; "];

  return v15;
}

- (id)_requestOptions
{
  unint64_t v3 = [(SRModeSystemState *)self requestOptions];
  if ([v3 requestSource] == (id)9)
  {
    CFStringRef v4 = [(SRModeSystemState *)self requestOptions];
    uint64_t v5 = [v4 originalRequestOptions];

    if (v5)
    {
      uint64_t v6 = [(SRModeSystemState *)self requestOptions];
      id v7 = [v6 originalRequestOptions];

      goto LABEL_6;
    }
  }
  else
  {
  }
  id v7 = [(SRModeSystemState *)self requestOptions];
LABEL_6:

  return v7;
}

- (void)_fetchConnectedAudioAccessoryState
{
  self->_connectedToAudioAccessory = 0;
  objc_initWeak(&location, self);
  audioAccessoryQueue = self->_audioAccessoryQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001B67C;
  v4[3] = &unk_100143410;
  objc_copyWeak(&v5, &location);
  dispatch_async(audioAccessoryQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_connectedOutputDevicesDidChange:(id)a3
{
  CFStringRef v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[SRModeSystemState _connectedOutputDevicesDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #modes: output devices changed, re-fetching connected audio accessory state", (uint8_t *)&v5, 0xCu);
  }
  [(SRModeSystemState *)self _fetchConnectedAudioAccessoryState];
}

- (SASRequestOptions)requestOptions
{
  return self->_requestOptions;
}

- (void)setRequestOptions:(id)a3
{
}

- (void)setUserTypedInSiri:(BOOL)a3
{
  self->_userTypedInSiri = a3;
}

- (BOOL)userTouchedSnippet
{
  return self->_userTouchedSnippet;
}

- (void)setUserTouchedSnippet:(BOOL)a3
{
  self->_userTouchedSnippet = a3;
}

- (unint64_t)voiceFeedbackSetting
{
  return self->_voiceFeedbackSetting;
}

- (void)setVoiceFeedbackSetting:(unint64_t)a3
{
  self->_voiceFeedbackSetting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestOptions, 0);
  objc_storeStrong((id *)&self->_audioAccessoryQueue, 0);
  objc_storeStrong((id *)&self->_sharedSystemAudioContext, 0);
  objc_storeStrong((id *)&self->_connectedOutputDevicesObserver, 0);

  objc_storeStrong((id *)&self->_ringerStateObserver, 0);
}

@end