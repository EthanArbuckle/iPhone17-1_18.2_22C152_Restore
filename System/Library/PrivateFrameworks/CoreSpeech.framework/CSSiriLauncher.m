@interface CSSiriLauncher
+ (id)sharedLauncher;
- (void)_notifyBuiltInVoiceTriggerPrewarm:(id)a3 activationSource:(int64_t)a4 completion:(id)a5;
- (void)deactivateSiriActivationConnectionWithReason:(int64_t)a3 withOptions:(unint64_t)a4 withContext:(id)a5;
- (void)notifyBluetoothDeviceVoiceTrigger:(id)a3 deviceId:(id)a4 completion:(id)a5;
- (void)notifyBluetoothDeviceVoiceTriggerPrewarm:(id)a3 deviceId:(id)a4 completion:(id)a5;
- (void)notifyBuiltInVoiceTrigger:(id)a3 myriadPHash:(id)a4 completion:(id)a5;
- (void)notifyBuiltInVoiceTriggerPrewarm:(id)a3 completion:(id)a4;
- (void)notifyBuiltInVoiceTriggerPrewarmExclave:(id)a3 completion:(id)a4;
- (void)notifyCarPlayVoiceTrigger:(id)a3 deviceId:(id)a4 myriadPHash:(id)a5 completion:(id)a6;
- (void)notifyCarPlayVoiceTriggerPrewarm:(id)a3 deviceId:(id)a4 completion:(id)a5;
- (void)notifyContinuousConversationActivation:(id)a3 deviceId:(id)a4 completion:(id)a5;
- (void)notifyDarwinVoiceTrigger:(id)a3 deviceId:(id)a4 myriadPHash:(id)a5 myriadLateActivationExpirationTime:(id)a6 completion:(id)a7;
- (void)notifyDarwinVoiceTriggerPrewarmWithCompletion:(id)a3;
- (void)notifyRemoraVoiceTrigger:(id)a3 myriadPHash:(id)a4 deviceId:(id)a5 completion:(id)a6;
- (void)notifyRemoraVoiceTriggerPrewarm:(id)a3 deviceId:(id)a4 completion:(id)a5;
- (void)notifyWakeKeywordSpokenBluetoothDevice:(id)a3 deviceId:(id)a4;
- (void)notifyWakeKeywordSpokenCarPlay:(id)a3 deviceId:(id)a4;
- (void)notifyWakeKeywordSpokenInBuiltInMic:(id)a3;
@end

@implementation CSSiriLauncher

- (void)notifyDarwinVoiceTrigger:(id)a3 deviceId:(id)a4 myriadPHash:(id)a5 myriadLateActivationExpirationTime:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a4;
  if (+[CSUtils supportsSCDAFramework])
  {
    v16 = SCDAContext;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000D17BC;
    v33[3] = &unk_100250F50;
    v17 = &v34;
    id v34 = v12;
    v18 = &v35;
    id v35 = v13;
    v19 = v33;
  }
  else
  {
    v16 = AFMyriadContext;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000D1858;
    v30[3] = &unk_100250F78;
    v17 = &v31;
    id v31 = v12;
    v18 = &v32;
    id v32 = v13;
    v19 = v30;
  }
  id v20 = [v16 newWithBuilder:v19];

  v21 = +[NSMutableDictionary dictionary];
  v22 = v21;
  if (v11) {
    [v21 setObject:v11 forKey:AFSiriActivationUserInfoKey[1]];
  }
  if (v20)
  {
    unsigned int v23 = +[CSUtils supportsSCDAFramework];
    uint64_t v24 = 2;
    if (v23) {
      uint64_t v24 = 10;
    }
    [v22 setObject:v20 forKey:AFSiriActivationUserInfoKey[v24]];
  }
  if (v11)
  {
    v25 = +[CSFVoiceTriggerEventInfoSelfLogger sharedLogger];
    [v25 logSiriLaunchStartedWithVoiceTriggerEventInfo:v11];
  }
  mach_absolute_time();
  v28 = v11;
  v29 = v14;
  id v26 = v14;
  id v27 = v11;
  AFSiriActivationHoneycombDeviceVoiceTrigger();
}

- (void)notifyDarwinVoiceTriggerPrewarmWithCompletion:(id)a3
{
  id v3 = a3;
  mach_absolute_time();
  v5 = v3;
  id v4 = v3;
  AFSiriActivationVoiceTriggerPrewarm();
}

- (void)deactivateSiriActivationConnectionWithReason:(int64_t)a3 withOptions:(unint64_t)a4 withContext:(id)a5
{
  id v7 = a5;
  id v8 = [objc_alloc((Class)AFSiriActivationConnection) initWithServicePort:AFSiriActivationServiceGetPort()];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000D1CAC;
  v9[3] = &unk_100250F28;
  v9[4] = a3;
  [v8 deactivateForReason:a3 options:a4 context:v7 completion:v9];
}

- (void)notifyContinuousConversationActivation:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[CSSiriLauncher notifyContinuousConversationActivation:deviceId:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  mach_absolute_time();
  id v12 = v9;
  id v11 = v9;
  AFSiriActivationContinuousConversation();
}

- (void)notifyRemoraVoiceTrigger:(id)a3 myriadPHash:(id)a4 deviceId:(id)a5 completion:(id)a6
{
  if (a6) {
    (*((void (**)(id))a6 + 2))(a6);
  }
}

- (void)notifyRemoraVoiceTriggerPrewarm:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  if (a5)
  {
    uint64_t v6 = CSErrorDomain;
    id v7 = a5;
    id v8 = +[NSError errorWithDomain:v6 code:1852 userInfo:0];
    (*((void (**)(id, void, id))a5 + 2))(v7, 0, v8);
  }
}

- (void)notifyWakeKeywordSpokenBluetoothDevice:(id)a3 deviceId:(id)a4
{
  id v4 = a4;
  mach_absolute_time();
  AFSiriActivationVoiceKeywordDetected();
}

- (void)notifyBluetoothDeviceVoiceTrigger:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = +[NSMutableDictionary dictionary];
  id v11 = v10;
  if (v7)
  {
    [v10 setObject:v7 forKey:AFSiriActivationUserInfoKey[1]];
    id v12 = +[CSFVoiceTriggerEventInfoSelfLogger sharedLogger];
    [v12 logSiriLaunchStartedWithVoiceTriggerEventInfo:v7];
  }
  mach_absolute_time();
  id v15 = v7;
  v16 = v8;
  id v13 = v8;
  id v14 = v7;
  AFSiriActivationVoiceTriggerActivate();
}

- (void)notifyBluetoothDeviceVoiceTriggerPrewarm:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  mach_absolute_time();
  id v11 = v7;
  id v10 = v7;
  AFSiriActivationVoiceTriggerPrewarm();
}

- (void)notifyWakeKeywordSpokenCarPlay:(id)a3 deviceId:(id)a4
{
  id v4 = a4;
  mach_absolute_time();
  AFSiriActivationVoiceKeywordDetected();
}

- (void)notifyCarPlayVoiceTrigger:(id)a3 deviceId:(id)a4 myriadPHash:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  if (+[CSUtils supportsSCDAFramework])
  {
    id v13 = SCDAContext;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000D29BC;
    v28[3] = &unk_100250E78;
    id v14 = &v29;
    id v29 = v10;
    id v15 = v28;
  }
  else
  {
    id v13 = AFMyriadContext;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000D2A38;
    v26[3] = &unk_100250EA0;
    id v14 = &v27;
    id v27 = v10;
    id v15 = v26;
  }
  id v16 = [v13 newWithBuilder:v15];

  v17 = +[NSMutableDictionary dictionary];
  v18 = v17;
  if (v9) {
    [v17 setObject:v9 forKey:AFSiriActivationUserInfoKey[1]];
  }
  if (v16)
  {
    unsigned int v19 = +[CSUtils supportsSCDAFramework];
    uint64_t v20 = 2;
    if (v19) {
      uint64_t v20 = 10;
    }
    [v18 setObject:v16 forKey:AFSiriActivationUserInfoKey[v20]];
  }
  if (v9)
  {
    v21 = +[CSFVoiceTriggerEventInfoSelfLogger sharedLogger];
    [v21 logSiriLaunchStartedWithVoiceTriggerEventInfo:v9];
  }
  mach_absolute_time();
  uint64_t v24 = v9;
  v25 = v11;
  id v22 = v11;
  id v23 = v9;
  AFSiriActivationVoiceTriggerActivate();
}

- (void)notifyCarPlayVoiceTriggerPrewarm:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  mach_absolute_time();
  id v11 = v7;
  id v10 = v7;
  AFSiriActivationVoiceTriggerPrewarm();
}

- (void)notifyWakeKeywordSpokenInBuiltInMic:(id)a3
{
  mach_absolute_time();
  AFSiriActivationVoiceKeywordDetected();
}

- (void)notifyBuiltInVoiceTrigger:(id)a3 myriadPHash:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[NSMutableDictionary dictionary];
  id v11 = v10;
  if (v7)
  {
    [v10 setObject:v7 forKey:AFSiriActivationUserInfoKey[1]];
    unsigned __int8 v12 = +[CSUtils isFirstPassSourceTypeRingtoneWithVTEI:v7];
  }
  else
  {
    unsigned __int8 v12 = 0;
  }
  if (+[CSUtils supportsSCDAFramework])
  {
    id v13 = SCDAContext;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000D3290;
    v27[3] = &unk_100250D98;
    id v14 = &v28;
    id v28 = v8;
    unsigned __int8 v29 = v12;
    id v15 = v27;
  }
  else
  {
    id v13 = AFMyriadContext;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000D33C0;
    v24[3] = &unk_100250DC0;
    id v14 = &v25;
    id v25 = v8;
    unsigned __int8 v26 = v12;
    id v15 = v24;
  }
  id v16 = [v13 newWithBuilder:v15];

  if (v16)
  {
    unsigned int v17 = +[CSUtils supportsSCDAFramework];
    uint64_t v18 = 2;
    if (v17) {
      uint64_t v18 = 10;
    }
    [v11 setObject:v16 forKey:AFSiriActivationUserInfoKey[v18]];
  }
  +[CSUtils isVoiceTriggerFromExclaveWithVTEI:v7];
  if (v7)
  {
    unsigned int v19 = +[CSFVoiceTriggerEventInfoSelfLogger sharedLogger];
    [v19 logSiriLaunchStartedWithVoiceTriggerEventInfo:v7];
  }
  mach_absolute_time();
  id v23 = v9;
  id v22 = v7;
  id v20 = v9;
  id v21 = v7;
  AFSiriActivationVoiceTriggerActivate();
}

- (void)_notifyBuiltInVoiceTriggerPrewarm:(id)a3 activationSource:(int64_t)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  mach_absolute_time();
  id v9 = v6;
  id v8 = v6;
  AFSiriActivationVoiceTriggerPrewarm();
}

- (void)notifyBuiltInVoiceTriggerPrewarm:(id)a3 completion:(id)a4
{
}

- (void)notifyBuiltInVoiceTriggerPrewarmExclave:(id)a3 completion:(id)a4
{
}

+ (id)sharedLauncher
{
  if (+[CSUtils isDarwinOS])
  {
    id v2 = 0;
  }
  else
  {
    if (qword_1002A3968 != -1) {
      dispatch_once(&qword_1002A3968, &stru_100250D48);
    }
    id v2 = (id)qword_1002A3960;
  }
  return v2;
}

@end