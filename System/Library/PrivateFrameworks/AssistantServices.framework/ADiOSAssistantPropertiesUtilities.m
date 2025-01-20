@interface ADiOSAssistantPropertiesUtilities
+ (int)_audibleVoiceFeedbackSettingFromSISchemaToODD:(int)a3;
+ (int)_heySiriHangupEnablementStateFromSISchemaToODD:(int)a3;
+ (int)_siriInCallEnablementStateFromSISchemaToODD:(int)a3;
+ (int)getHangUpEnablementState;
+ (int)getODDCarPlayAnnounceStatusFrom:(int64_t)a3;
+ (int)getSiriInCallEnablementState;
+ (int)getSiriPauseTimeStateFrom:(int64_t)a3;
+ (int)getVoiceFeedbackStatus;
@end

@implementation ADiOSAssistantPropertiesUtilities

+ (int)_audibleVoiceFeedbackSettingFromSISchemaToODD:(int)a3
{
  if ((a3 - 1) >= 6) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (int)_siriInCallEnablementStateFromSISchemaToODD:(int)a3
{
  if ((a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (int)_heySiriHangupEnablementStateFromSISchemaToODD:(int)a3
{
  if ((a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (int)getSiriPauseTimeStateFrom:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3) {
    return a3;
  }
  else {
    return 0;
  }
}

+ (int)getODDCarPlayAnnounceStatusFrom:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return 0;
  }
  else {
    return dword_1003E2A70[a3 - 1];
  }
}

+ (int)getVoiceFeedbackStatus
{
  v3 = +[AFPreferences sharedPreferences];
  unint64_t v4 = (unint64_t)[v3 useDeviceSpeakerForTTS];

  if (v4 > 3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = dword_1003E2A60[v4];
  }
  return _[a1 _audibleVoiceFeedbackSettingFromSISchemaToODD:v5];
}

+ (int)getSiriInCallEnablementState
{
  if (AFDeviceSupportsFullSiriUOD()
    && (+[AFPreferences sharedPreferences],
        v3 = objc_claimAutoreleasedReturnValue(),
        unint64_t v4 = (unint64_t)[v3 siriInCallEnablementState],
        v3,
        v4 <= 2))
  {
    uint64_t v5 = dword_1003E2AEC[v4];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return _[a1 _siriInCallEnablementStateFromSISchemaToODD:v5];
}

+ (int)getHangUpEnablementState
{
  if (AFSupportsCallHangUp()
    && (+[VTPreferences sharedPreferences],
        v3 = objc_claimAutoreleasedReturnValue(),
        unint64_t v4 = (unint64_t)[v3 canUseVoiceTriggerDuringPhoneCallWithState],
        v3,
        v4 <= 2))
  {
    uint64_t v5 = dword_1003E2AEC[v4];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return _[a1 _heySiriHangupEnablementStateFromSISchemaToODD:v5];
}

@end