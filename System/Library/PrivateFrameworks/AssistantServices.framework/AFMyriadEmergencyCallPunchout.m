@interface AFMyriadEmergencyCallPunchout
- (AFMyriadEmergencyCallPunchout)init;
- (void)initiateEmergencyCallMyriad;
@end

@implementation AFMyriadEmergencyCallPunchout

- (void).cxx_destruct
{
}

- (void)initiateEmergencyCallMyriad
{
}

void __60__AFMyriadEmergencyCallPunchout_initiateEmergencyCallMyriad__block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v0 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[AFMyriadEmergencyCallPunchout initiateEmergencyCallMyriad]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v0, OS_LOG_TYPE_INFO, "%s Punching out to Phone app to make emergency call", buf, 0xCu);
  }
  id v1 = objc_alloc_init((Class)getTUCallProviderManagerClass());
  id v2 = objc_alloc((Class)getTUDialRequestClass());
  v3 = [v1 emergencyProvider];
  v4 = (void *)[v2 initWithProvider:v3];

  [v4 setPerformDialAssist:0];
  [v4 setDialType:1];
  v5 = getTUCallSourceIdentifierSpeakerRoute();
  [v4 setAudioSourceIdentifier:v5];

  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[AFMyriadEmergencyCallPunchout initiateEmergencyCallMyriad]_block_invoke";
    __int16 v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s Emergency beacon handling created dial request %@", buf, 0x16u);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__AFMyriadEmergencyCallPunchout_initiateEmergencyCallMyriad__block_invoke_6;
  v8[3] = &unk_1E592C248;
  id v9 = v4;
  id v7 = v4;
  [v1 launchAppForDialRequest:v7 completion:v8];
}

void __60__AFMyriadEmergencyCallPunchout_initiateEmergencyCallMyriad__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[AFMyriadEmergencyCallPunchout initiateEmergencyCallMyriad]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Emergency beacon initiated call failed, error: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    int v6 = 136315394;
    id v7 = "-[AFMyriadEmergencyCallPunchout initiateEmergencyCallMyriad]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s Emergency beacon initiated call created: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (AFMyriadEmergencyCallPunchout)init
{
  v6.receiver = self;
  v6.super_class = (Class)AFMyriadEmergencyCallPunchout;
  id v2 = [(AFMyriadEmergencyCallPunchout *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.myriad_emergncy_call", 0);
    myriadEmergencyCallingQueue = v2->_myriadEmergencyCallingQueue;
    v2->_myriadEmergencyCallingQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end