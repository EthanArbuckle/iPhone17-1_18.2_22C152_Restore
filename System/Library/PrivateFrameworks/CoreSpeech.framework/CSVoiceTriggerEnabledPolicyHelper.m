@interface CSVoiceTriggerEnabledPolicyHelper
+ (BOOL)siriInCallPolicy;
@end

@implementation CSVoiceTriggerEnabledPolicyHelper

+ (BOOL)siriInCallPolicy
{
  v2 = +[CSHangUpEnabledMonitor sharedInstance];
  if ([v2 isEnabled])
  {
    unsigned int v3 = 1;
  }
  else
  {
    v4 = +[CSSiriInCallEnabledMonitor sharedInstance];
    unsigned int v3 = [v4 isEnabled];
  }
  unsigned int v5 = +[CSUtils supportHangUp];
  v6 = +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor];
  id v7 = [v6 phoneCallState];

  v8 = +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor];
  unsigned __int8 v9 = [v8 firstPartyCall];

  v10 = +[CSBluetoothWirelessSplitterMonitor sharedInstance];
  v11 = (char *)[v10 splitterState];

  v12 = (char *)+[CSUtils fetchHypotheticalRouteType];
  v13 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 136315394;
    v29 = "+[CSVoiceTriggerEnabledPolicyHelper siriInCallPolicy]";
    __int16 v30 = 1024;
    BOOL v31 = v3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Hang up toggle: %d", (uint8_t *)&v28, 0x12u);
  }
  unint64_t v14 = (unint64_t)v7 - 5;
  if ((v5 & v3 & 1) == 0 && v14 >= 0xFFFFFFFFFFFFFFFELL)
  {
    v15 = CSLogContextFacilityCoreSpeech;
    BOOL v16 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v16) {
      return result;
    }
    int v28 = 136315138;
    v29 = "+[CSVoiceTriggerEnabledPolicyHelper siriInCallPolicy]";
    v18 = "%s VoiceTrigger cannot be turned on since we are not in the desired call state";
    goto LABEL_28;
  }
  if (!v5) {
    goto LABEL_18;
  }
  BOOL v19 = __CFADD__(v14, 2);
  if (v14 < 0xFFFFFFFFFFFFFFFELL) {
    char v20 = 1;
  }
  else {
    char v20 = v9;
  }
  if ((v20 & 1) == 0)
  {
    v15 = CSLogContextFacilityCoreSpeech;
    BOOL v21 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v21) {
      return result;
    }
    int v28 = 136315138;
    v29 = "+[CSVoiceTriggerEnabledPolicyHelper siriInCallPolicy]";
    v18 = "%s VoiceTrigger cannot be turned on since we are in a hang up supported call state but it is not first party.";
    goto LABEL_28;
  }
  if (v19)
  {
    unsigned __int8 v26 = +[CSUtils isIOSDeviceSupportingBargeIn];
    BOOL result = 1;
    if (v12 != (char *)2 && (v26 & 1) == 0)
    {
      v15 = CSLogContextFacilityCoreSpeech;
      BOOL v27 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (v27)
      {
        int v28 = 136315138;
        v29 = "+[CSVoiceTriggerEnabledPolicyHelper siriInCallPolicy]";
        v18 = "%s VoiceTrigger cannot be turned on since the device is not supporting bargeIn and there is no HS phone ca"
              "ll capable headset connected.";
LABEL_28:
        v24 = v15;
        uint32_t v25 = 12;
        goto LABEL_29;
      }
    }
  }
  else
  {
LABEL_18:
    if (v7 != (id)2 || (unint64_t)(v11 - 2) >= 3 && (unint64_t)(v12 - 3) > 0xFFFFFFFFFFFFFFFDLL) {
      return 1;
    }
    v22 = CSLogContextFacilityCoreSpeech;
    BOOL v23 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v23)
    {
      int v28 = 136315906;
      v29 = "+[CSVoiceTriggerEnabledPolicyHelper siriInCallPolicy]";
      __int16 v30 = 1024;
      BOOL v31 = v12 == (char *)2;
      __int16 v32 = 1024;
      BOOL v33 = v12 == (char *)1;
      __int16 v34 = 1024;
      BOOL v35 = (unint64_t)(v11 - 2) < 3;
      v18 = "%s VoiceTrigger cannot be turned on because we are in a ringtone and hsPhoneCallCapableHeadsetConnected: %d "
            "builtInState: %d isInSplitterMode: %d";
      v24 = v22;
      uint32_t v25 = 30;
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v28, v25);
      return 0;
    }
  }
  return result;
}

@end