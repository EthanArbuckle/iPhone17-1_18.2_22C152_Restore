@interface CSAudioRecordContext
+ (id)contextForBTLEWithDeviceId:(id)a3;
+ (id)contextForBuiltInVoiceTrigger;
+ (id)contextForContinuousConversation;
+ (id)contextForContinuousConversationWithRecordRoute:(id)a3 deviceId:(id)a4;
+ (id)contextForDarwinVoiceTriggerWithDeviceId:(id)a3;
+ (id)contextForDictation;
+ (id)contextForHearstVoiceTriggerWithDeviceId:(id)a3;
+ (id)contextForHomeButton;
+ (id)contextForJarvisWithDeviceId:(id)a3;
+ (id)contextForOpportuneSpeakerListener;
+ (id)contextForOpportuneSpeakerListenerWithCall;
+ (id)contextForRaiseToSpeak;
+ (id)contextForRemoraButtonTriggerWithDeviceId:(id)a3;
+ (id)contextForRemoraVoiceTriggerWithDeviceId:(id)a3;
+ (id)contextForServerInvoke;
+ (id)contextForVoiceTriggerTraining;
+ (id)defaultContext;
+ (id)recordTypeString:(int64_t)a3;
+ (int64_t)audioTypeForContinuousConversation:(int64_t)a3;
- (BOOL)alwaysUseRemoteBuiltInMic;
- (BOOL)isAudioRecordTypeSupportedByContinuousConversation;
- (BOOL)isAudioRecordTypeSupportedByRemora;
- (BOOL)isBuiltInVoiceTriggered;
- (BOOL)isContinuousConversation;
- (BOOL)isContinuousConversationTriggerlessAnnounce;
- (BOOL)isDarwinVoiceTriggered;
- (BOOL)isDictation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGibraltarVoiceTriggered;
- (BOOL)isHearstDoubleTapTriggered;
- (BOOL)isHearstVoiceTriggered;
- (BOOL)isHomePressed;
- (BOOL)isJarvisContinuousConversation;
- (BOOL)isJarvisVoiceTriggered;
- (BOOL)isRTSTriggered;
- (BOOL)isRemoraButtonPress;
- (BOOL)isRemoraTriggered;
- (BOOL)isRemoraVoiceTriggered;
- (BOOL)isRequestDuringActiveCall;
- (BOOL)isRequestFromSpokenNotification;
- (BOOL)isRequestFromTriggerless;
- (BOOL)isServerInvoked;
- (BOOL)isStarkTriggered;
- (BOOL)isTVRemote;
- (BOOL)isTriggeredFromHearst;
- (BOOL)isTriggerlessAnnounce;
- (BOOL)isTypeJarvis;
- (BOOL)isUIButtonPress;
- (BOOL)isVoiceTriggered;
- (BOOL)isVoiceTriggeredFromRemoteXPCDevice;
- (BOOL)isiOSButtonPress;
- (CSAudioRecordContext)initWithAVVCContext:(id)a3;
- (CSAudioRecordContext)initWithRecordType:(int64_t)a3 deviceId:(id)a4;
- (CSAudioRecordContext)initWithXPCObject:(id)a3;
- (NSDictionary)activationMetadata;
- (NSString)deviceId;
- (NSString)turnIdentifier;
- (OS_xpc_object)xpcObject;
- (id)_createAVVCContextWithType:(int64_t)a3 deviceId:(id)a4;
- (id)avvcContext;
- (id)avvcContextSettings;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)avvcActivationMode:(int64_t)a3;
- (int64_t)recordTypeFromAVVCActivationMode:(int64_t)a3;
- (int64_t)speechEvent;
- (int64_t)type;
- (void)setActivationMetadata:(id)a3;
- (void)setAlwaysUseRemoteBuiltInMic:(BOOL)a3;
- (void)setDeviceId:(id)a3;
- (void)setIsRequestDuringActiveCall:(BOOL)a3;
- (void)setIsRequestFromSpokenNotification:(BOOL)a3;
- (void)setIsRequestFromTriggerless:(BOOL)a3;
- (void)setSpeechEvent:(int64_t)a3;
- (void)setTurnIdentifier:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CSAudioRecordContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnIdentifier, 0);
  objc_storeStrong((id *)&self->_activationMetadata, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
}

- (void)setSpeechEvent:(int64_t)a3
{
  self->_speechEvent = a3;
}

- (int64_t)speechEvent
{
  return self->_speechEvent;
}

- (void)setIsRequestFromTriggerless:(BOOL)a3
{
  self->_isRequestFromTriggerless = a3;
}

- (BOOL)isRequestFromTriggerless
{
  return self->_isRequestFromTriggerless;
}

- (void)setIsRequestFromSpokenNotification:(BOOL)a3
{
  self->_isRequestFromSpokenNotification = a3;
}

- (BOOL)isRequestFromSpokenNotification
{
  return self->_isRequestFromSpokenNotification;
}

- (void)setTurnIdentifier:(id)a3
{
}

- (NSString)turnIdentifier
{
  return self->_turnIdentifier;
}

- (void)setActivationMetadata:(id)a3
{
}

- (NSDictionary)activationMetadata
{
  return self->_activationMetadata;
}

- (void)setIsRequestDuringActiveCall:(BOOL)a3
{
  self->_isRequestDuringActiveCall = a3;
}

- (BOOL)isRequestDuringActiveCall
{
  return self->_isRequestDuringActiveCall;
}

- (void)setAlwaysUseRemoteBuiltInMic:(BOOL)a3
{
  self->_alwaysUseRemoteBuiltInMic = a3;
}

- (BOOL)alwaysUseRemoteBuiltInMic
{
  return self->_alwaysUseRemoteBuiltInMic;
}

- (void)setDeviceId:(id)a3
{
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = +[CSAudioRecordContext recordTypeString:self->_type];
  [v3 appendFormat:@"recordType[%@] deviceId[%@] turnIdentifier[%@] alwaysUseBuiltInMic[%d] isRequestDuringActiveCall[%d] triggerEventInfo[%@] spokenNotification [%d] isTriggerless [%d] speechEvent [%ld]", v4, self->_deviceId, self->_turnIdentifier, self->_alwaysUseRemoteBuiltInMic, self->_isRequestDuringActiveCall, self->_activationMetadata, self->_isRequestFromSpokenNotification, self->_isRequestFromTriggerless, self->_speechEvent];

  return v3;
}

- (OS_xpc_object)xpcObject
{
  keys[6] = *(char **)MEMORY[0x1E4F143B8];
  keys[0] = "type";
  keys[1] = "alwaysUseRemoteBuiltInMic";
  keys[2] = "isRequestDuringActiveCall";
  keys[3] = "isSpokenNotification";
  keys[4] = "isRequestTriggerless";
  keys[5] = "speechEvent";
  values[0] = xpc_int64_create(self->_type);
  values[1] = xpc_BOOL_create(self->_alwaysUseRemoteBuiltInMic);
  values[2] = xpc_BOOL_create(self->_isRequestDuringActiveCall);
  values[3] = xpc_BOOL_create(self->_isRequestFromSpokenNotification);
  values[4] = xpc_BOOL_create(self->_isRequestFromTriggerless);
  values[5] = xpc_int64_create(self->_speechEvent);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)keys, values, 6uLL);
  deviceId = self->_deviceId;
  if (deviceId) {
    xpc_dictionary_set_string(v3, "deviceId", [(NSString *)deviceId UTF8String]);
  }
  activationMetadata = self->_activationMetadata;
  if (activationMetadata)
  {
    v6 = [(NSDictionary *)activationMetadata _cs_xpcObject];
    xpc_dictionary_set_value(v3, "triggerEventInfo", v6);
  }
  turnIdentifier = self->_turnIdentifier;
  if (turnIdentifier) {
    xpc_dictionary_set_string(v3, "turnIdentifier", [(NSString *)turnIdentifier UTF8String]);
  }
  for (uint64_t i = 5; i != -1; --i)

  return (OS_xpc_object *)v3;
}

- (int64_t)avvcActivationMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 0x19) {
    return 1752132965;
  }
  else {
    return *(void *)&aPbhw[8 * a3 - 16];
  }
}

- (int64_t)recordTypeFromAVVCActivationMode:(int64_t)a3
{
  int64_t v3 = 1;
  if (a3 > 1886352243)
  {
    if (a3 <= 1936750195)
    {
      int64_t v4 = 1919771247;
      uint64_t v15 = 17;
      if (a3 != 1919776372) {
        uint64_t v15 = 1;
      }
      if (a3 == 1919771248) {
        int64_t v7 = 18;
      }
      else {
        int64_t v7 = v15;
      }
      uint64_t v8 = 1886352244;
      uint64_t v9 = 14;
      BOOL v10 = a3 == 1918986611;
      uint64_t v11 = 9;
    }
    else
    {
      int64_t v4 = 1986357345;
      uint64_t v12 = 2;
      if (a3 != 2003329648) {
        uint64_t v12 = 1;
      }
      if (a3 == 1987012963) {
        uint64_t v13 = 6;
      }
      else {
        uint64_t v13 = v12;
      }
      if (a3 == 1986357346) {
        int64_t v7 = 7;
      }
      else {
        int64_t v7 = v13;
      }
      uint64_t v8 = 1936750196;
      uint64_t v9 = 16;
      BOOL v10 = a3 == 1969840752;
      uint64_t v11 = 4;
    }
  }
  else if (a3 <= 1668314722)
  {
    int64_t v4 = 1651795059;
    uint64_t v14 = 8;
    if (a3 != 1651797093) {
      uint64_t v14 = 1;
    }
    if (a3 == 1651795060) {
      int64_t v7 = 10;
    }
    else {
      int64_t v7 = v14;
    }
    uint64_t v8 = 1635087471;
    uint64_t v9 = 5;
    BOOL v10 = a3 == 1651794544;
    uint64_t v11 = 3;
  }
  else
  {
    int64_t v4 = 1684628339;
    uint64_t v5 = 15;
    if (a3 != 1752396914) {
      uint64_t v5 = 1;
    }
    if (a3 == 1751414371) {
      uint64_t v6 = 11;
    }
    else {
      uint64_t v6 = v5;
    }
    if (a3 == 1684628340) {
      int64_t v7 = 13;
    }
    else {
      int64_t v7 = v6;
    }
    uint64_t v8 = 1668314723;
    uint64_t v9 = 12;
    BOOL v10 = a3 == 1684108899;
    uint64_t v11 = 21;
  }
  if (v10) {
    int64_t v3 = v11;
  }
  if (a3 == v8) {
    int64_t v3 = v9;
  }
  if (a3 <= v4) {
    return v3;
  }
  else {
    return v7;
  }
}

- (BOOL)isAudioRecordTypeSupportedByContinuousConversation
{
  BOOL result = 0;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t type = self->_type;
  if (type <= 0x1B)
  {
    if (((1 << type) & 0xA700C72) != 0) {
      return 1;
    }
    if (((1 << type) & 0x801080) != 0)
    {
      if (+[CSUtils isCarplayWithFlexibleFollowupEnabled])
      {
        return 1;
      }
      uint64_t v5 = CSLogContextFacilityCoreSpeech;
      BOOL v6 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (v6)
      {
        int v7 = 136315138;
        uint64_t v8 = "-[CSAudioRecordContext isAudioRecordTypeSupportedByContinuousConversation]";
        _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s CarPlay support is disabled!", (uint8_t *)&v7, 0xCu);
        return 0;
      }
    }
  }
  return result;
}

- (BOOL)isAudioRecordTypeSupportedByRemora
{
  return (self->_type < 0x13uLL) & (0x64020u >> self->_type);
}

- (BOOL)isUIButtonPress
{
  return self->_type == 4;
}

- (BOOL)isiOSButtonPress
{
  return (self->_type < 0xBuLL) & (0x49Eu >> self->_type);
}

- (BOOL)isTriggerlessAnnounce
{
  return self->_type == 26;
}

- (BOOL)isContinuousConversationTriggerlessAnnounce
{
  return self->_type == 25;
}

- (BOOL)isContinuousConversation
{
  return (self->_type < 0x1CuLL) & (0xAD00000u >> self->_type);
}

- (BOOL)isDictation
{
  return self->_type == 13;
}

- (BOOL)isStarkTriggered
{
  return self->_type == 7;
}

- (BOOL)isServerInvoked
{
  return self->_type == 5;
}

- (BOOL)isTVRemote
{
  return self->_type == 8;
}

- (BOOL)isHomePressed
{
  return self->_type == 1;
}

- (BOOL)isDarwinVoiceTriggered
{
  return self->_type == 21;
}

- (BOOL)isRemoraButtonPress
{
  return self->_type == 18;
}

- (BOOL)isRemoraTriggered
{
  return (unint64_t)(self->_type - 17) < 2;
}

- (BOOL)isRemoraVoiceTriggered
{
  return self->_type == 17;
}

- (BOOL)isTypeJarvis
{
  int64_t type = self->_type;
  return type == 12 || type == 23;
}

- (BOOL)isJarvisContinuousConversation
{
  return self->_type == 23;
}

- (BOOL)isJarvisVoiceTriggered
{
  return self->_type == 12;
}

- (BOOL)isRTSTriggered
{
  return self->_type == 9;
}

- (BOOL)isHearstDoubleTapTriggered
{
  return self->_type == 10;
}

- (BOOL)isHearstVoiceTriggered
{
  return self->_type == 11;
}

- (BOOL)isTriggeredFromHearst
{
  if ([(CSAudioRecordContext *)self isHearstVoiceTriggered]
    || [(CSAudioRecordContext *)self isHearstDoubleTapTriggered])
  {
    return 1;
  }
  return [(CSAudioRecordContext *)self isTriggerlessAnnounce];
}

- (BOOL)isGibraltarVoiceTriggered
{
  if (!+[CSUtils hasRemoteCoreSpeech]
    || !+[CSUtils hasRemoteBuiltInMic])
  {
    return 0;
  }
  return [(CSAudioRecordContext *)self isBuiltInVoiceTriggered];
}

- (BOOL)isVoiceTriggeredFromRemoteXPCDevice
{
  BOOL v3 = [(CSAudioRecordContext *)self isGibraltarVoiceTriggered];
  return [(CSAudioRecordContext *)self isDarwinVoiceTriggered] || v3;
}

- (BOOL)isBuiltInVoiceTriggered
{
  return self->_type == 6;
}

- (BOOL)isVoiceTriggered
{
  BOOL v3 = [(CSAudioRecordContext *)self isBuiltInVoiceTriggered]
    || [(CSAudioRecordContext *)self isHearstVoiceTriggered]
    || [(CSAudioRecordContext *)self isJarvisVoiceTriggered];
  BOOL v4 = [(CSAudioRecordContext *)self isRemoraVoiceTriggered];
  return [(CSAudioRecordContext *)self isDarwinVoiceTriggered] || v4 || v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int64_t type = self->_type;
  if (type == [v4 type])
  {
    deviceId = self->_deviceId;
    uint64_t v7 = [v4 deviceId];
    uint64_t v8 = (void *)v7;
    if (deviceId) {
      BOOL v9 = [(NSString *)deviceId isEqualToString:v7];
    }
    else {
      BOOL v9 = v7 == 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_createAVVCContextWithType:(int64_t)a3 deviceId:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(CSAudioRecordContext *)self avvcActivationMode:a3];
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v9 = [NSNumber numberWithInteger:v7];
  [v8 setObject:v9 forKey:*MEMORY[0x1E4F152E8]];

  if (v6) {
    [v8 setObject:v6 forKey:*MEMORY[0x1E4F152D8]];
  }

  return v8;
}

- (id)avvcContext
{
  return [(CSAudioRecordContext *)self _createAVVCContextWithType:self->_type deviceId:self->_deviceId];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_alloc_init(CSAudioRecordContext);
  [(CSAudioRecordContext *)v5 setType:self->_type];
  [(CSAudioRecordContext *)v5 setAlwaysUseRemoteBuiltInMic:self->_alwaysUseRemoteBuiltInMic];
  id v6 = (void *)[(NSString *)self->_deviceId copyWithZone:a3];
  [(CSAudioRecordContext *)v5 setDeviceId:v6];

  [(CSAudioRecordContext *)v5 setIsRequestDuringActiveCall:self->_isRequestDuringActiveCall];
  int64_t v7 = (void *)[(NSDictionary *)self->_activationMetadata copyWithZone:a3];
  [(CSAudioRecordContext *)v5 setActivationMetadata:v7];

  uint64_t v8 = (void *)[(NSString *)self->_turnIdentifier copyWithZone:a3];
  [(CSAudioRecordContext *)v5 setTurnIdentifier:v8];

  [(CSAudioRecordContext *)v5 setIsRequestFromSpokenNotification:self->_isRequestFromSpokenNotification];
  [(CSAudioRecordContext *)v5 setIsRequestFromTriggerless:self->_isRequestFromTriggerless];
  [(CSAudioRecordContext *)v5 setSpeechEvent:self->_speechEvent];
  return v5;
}

- (CSAudioRecordContext)initWithRecordType:(int64_t)a3 deviceId:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSAudioRecordContext;
  int64_t v7 = [(CSAudioRecordContext *)&v12 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_int64_t type = a3;
    uint64_t v9 = [v6 copy];
    deviceId = v8->_deviceId;
    v8->_deviceId = (NSString *)v9;
  }
  return v8;
}

- (CSAudioRecordContext)initWithAVVCContext:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CSAudioRecordContext;
  uint64_t v5 = [(CSAudioRecordContext *)&v17 init];
  id v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = *MEMORY[0x1E4F152E8];
    uint64_t v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F152E8]];

    if (v8)
    {
      uint64_t v9 = [v4 objectForKeyedSubscript:v7];
      uint64_t v10 = [v9 integerValue];

      v6->_int64_t type = [(CSAudioRecordContext *)v6 recordTypeFromAVVCActivationMode:v10];
    }
    uint64_t v11 = *MEMORY[0x1E4F152D8];
    objc_super v12 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F152D8]];

    if (v12)
    {
      uint64_t v13 = [v4 objectForKeyedSubscript:v11];
      uint64_t v14 = [v13 copy];
      deviceId = v6->_deviceId;
      v6->_deviceId = (NSString *)v14;
    }
  }

  return v6;
}

- (CSAudioRecordContext)initWithXPCObject:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CSAudioRecordContext;
  uint64_t v5 = [(CSAudioRecordContext *)&v18 init];
  if (v5)
  {
    v5->_int64_t type = xpc_dictionary_get_int64(v4, "type");
    v5->_alwaysUseRemoteBuiltInMic = xpc_dictionary_get_BOOL(v4, "alwaysUseRemoteBuiltInMic");
    string = xpc_dictionary_get_string(v4, "deviceId");
    if (string)
    {
      uint64_t v7 = [NSString stringWithUTF8String:string];
      deviceId = v5->_deviceId;
      v5->_deviceId = (NSString *)v7;
    }
    v5->_isRequestDuringActiveCall = xpc_dictionary_get_BOOL(v4, "isRequestDuringActiveCall");
    uint64_t v9 = xpc_dictionary_get_value(v4, "triggerEventInfo");

    if (v9)
    {
      uint64_t v10 = xpc_dictionary_get_dictionary(v4, "triggerEventInfo");
      id v11 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      uint64_t v12 = objc_msgSend(v11, "_cs_initWithXPCObject:", v10);
      activationMetadata = v5->_activationMetadata;
      v5->_activationMetadata = (NSDictionary *)v12;
    }
    uint64_t v14 = xpc_dictionary_get_string(v4, "turnIdentifier");
    if (v14)
    {
      uint64_t v15 = [NSString stringWithUTF8String:v14];
      turnIdentifier = v5->_turnIdentifier;
      v5->_turnIdentifier = (NSString *)v15;
    }
    v5->_isRequestFromSpokenNotification = xpc_dictionary_get_BOOL(v4, "isSpokenNotification");
    v5->_isRequestFromTriggerless = xpc_dictionary_get_BOOL(v4, "isRequestTriggerless");
    v5->_speechEvent = xpc_dictionary_get_int64(v4, "speechEvent");
  }

  return v5;
}

+ (id)recordTypeString:(int64_t)a3
{
  if ((unint64_t)a3 > 0x1B) {
    return @"CSAudioRecordTypeUnknown";
  }
  else {
    return off_1E61FF658[a3];
  }
}

+ (id)defaultContext
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = +[CSAudioRecordContext contextForServerInvoke];
  BOOL v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "+[CSAudioRecordContext defaultContext]";
    __int16 v7 = 2114;
    uint64_t v8 = v2;
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s default to recordContext : %{public}@", (uint8_t *)&v5, 0x16u);
  }
  return v2;
}

+ (id)contextForDictation
{
  v2 = [[CSAudioRecordContext alloc] initWithRecordType:13 deviceId:0];
  return v2;
}

+ (id)contextForDarwinVoiceTriggerWithDeviceId:(id)a3
{
  id v3 = a3;
  id v4 = [[CSAudioRecordContext alloc] initWithRecordType:21 deviceId:v3];

  return v4;
}

+ (int64_t)audioTypeForContinuousConversation:(int64_t)a3
{
  int64_t v3 = 27;
  uint64_t v4 = 20;
  if (a3 == 12) {
    uint64_t v4 = 23;
  }
  if (a3 != 21) {
    int64_t v3 = v4;
  }
  if ((unint64_t)(a3 - 10) >= 2) {
    return v3;
  }
  else {
    return 22;
  }
}

+ (id)contextForContinuousConversationWithRecordRoute:(id)a3 deviceId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (+[CSUtils isDoAPAudioRouteWithRecordRoute:v5])
  {
    __int16 v7 = [CSAudioRecordContext alloc];
    uint64_t v8 = 22;
LABEL_7:
    id v10 = v6;
    goto LABEL_8;
  }
  if (+[CSUtils isJarvisAudioRouteWithRecordRoute:v5])
  {
    __int16 v7 = [CSAudioRecordContext alloc];
    uint64_t v8 = 23;
    goto LABEL_7;
  }
  BOOL v9 = +[CSUtils isDisplayPortRouteWithRecordRoute:v5];
  __int16 v7 = [CSAudioRecordContext alloc];
  if (v9)
  {
    uint64_t v8 = 27;
    goto LABEL_7;
  }
  uint64_t v8 = 20;
  id v10 = 0;
LABEL_8:
  id v11 = [(CSAudioRecordContext *)v7 initWithRecordType:v8 deviceId:v10];

  return v11;
}

+ (id)contextForContinuousConversation
{
  v2 = [[CSAudioRecordContext alloc] initWithRecordType:20 deviceId:0];
  return v2;
}

+ (id)contextForRaiseToSpeak
{
  v2 = [[CSAudioRecordContext alloc] initWithRecordType:9 deviceId:0];
  return v2;
}

+ (id)contextForHomeButton
{
  v2 = [[CSAudioRecordContext alloc] initWithRecordType:1 deviceId:0];
  return v2;
}

+ (id)contextForServerInvoke
{
  v2 = [[CSAudioRecordContext alloc] initWithRecordType:5 deviceId:0];
  return v2;
}

+ (id)contextForVoiceTriggerTraining
{
  v2 = [[CSAudioRecordContext alloc] initWithRecordType:15 deviceId:0];
  return v2;
}

+ (id)contextForBTLEWithDeviceId:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[CSAudioRecordContext alloc] initWithRecordType:8 deviceId:v3];

  return v4;
}

+ (id)contextForJarvisWithDeviceId:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[CSAudioRecordContext alloc] initWithRecordType:12 deviceId:v3];

  return v4;
}

+ (id)contextForBuiltInVoiceTrigger
{
  v2 = [[CSAudioRecordContext alloc] initWithRecordType:6 deviceId:0];
  return v2;
}

+ (id)contextForOpportuneSpeakerListenerWithCall
{
  v2 = [[CSAudioRecordContext alloc] initWithRecordType:19 deviceId:0];
  [(CSAudioRecordContext *)v2 setIsRequestDuringActiveCall:1];
  return v2;
}

+ (id)contextForOpportuneSpeakerListener
{
  v2 = [[CSAudioRecordContext alloc] initWithRecordType:16 deviceId:0];
  return v2;
}

+ (id)contextForRemoraButtonTriggerWithDeviceId:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = [[CSAudioRecordContext alloc] initWithRecordType:18 deviceId:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

+ (id)contextForRemoraVoiceTriggerWithDeviceId:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = [[CSAudioRecordContext alloc] initWithRecordType:17 deviceId:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

+ (id)contextForHearstVoiceTriggerWithDeviceId:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = [[CSAudioRecordContext alloc] initWithRecordType:11 deviceId:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)avvcContextSettings
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(CSAudioRecordContext *)self avvcContext];
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F152E8]];
  uint64_t v5 = [v4 unsignedIntegerValue];

  id v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F152D8]];
  __int16 v7 = (void *)[objc_alloc(MEMORY[0x1E4F154B8]) initWithMode:v5 deviceUID:v6];
  if (+[CSUtils supportHandsFree])
  {
    if ([(CSAudioRecordContext *)self isRequestDuringActiveCall])
    {
      uint64_t v8 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315138;
        uint64_t v14 = "-[CSAudioRecordContext(AVVC) avvcContextSettings]";
        _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Setting mixable to yes as we are in an active call", (uint8_t *)&v13, 0xCu);
      }
      BOOL v9 = +[CSUtils supportRingtoneA2DP];
      if (v5 == 1668314723 || v9) {
        uint64_t v11 = v5;
      }
      else {
        uint64_t v11 = 1987012963;
      }
      [v7 setActivationMode:v11];
    }
    objc_msgSend(v7, "setAnnounceCallsEnabled:", -[CSAudioRecordContext isRequestDuringActiveCall](self, "isRequestDuringActiveCall"));
  }

  return v7;
}

@end