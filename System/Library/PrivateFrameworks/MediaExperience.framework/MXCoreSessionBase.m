@interface MXCoreSessionBase
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)enableBluetoothRecordingPreference;
- (BOOL)hasAudioCategory:(id)a3;
- (BOOL)hasAudioMode:(id)a3;
- (BOOL)hasEchoCancelledInput;
- (BOOL)hasEntitlementToSetIsUsingBuiltInMicForRecording;
- (BOOL)hasInput;
- (BOOL)hasPhoneCallBehavior;
- (BOOL)interruptionStyleSetByClient;
- (BOOL)isActive;
- (BOOL)isEligibleForBTSmartRoutingConsideration;
- (BOOL)isEligibleForBTSmartRoutingConsiderationSetByClient;
- (BOOL)isNowPlayingApp;
- (BOOL)isPlaying;
- (BOOL)isRecording;
- (BOOL)isRoutedToOnDemandVAD;
- (BOOL)isSidekick;
- (BOOL)isTheAssistant;
- (BOOL)isUsingBuiltInMicForRecording;
- (BOOL)isUsingExclaveSensor;
- (BOOL)mixesWithEveryone;
- (BOOL)prefersNoInterruptions;
- (BOOL)reporterStarted;
- (BOOL)supportsEchoCancelledInput;
- (BOOL)updateAudioBehaviourFromVARouteConfig:(id)a3;
- (BOOL)wasRecentlyActivated;
- (MXCoreSessionBase)init;
- (NSArray)audioDestinationPriority;
- (NSArray)originalReporterIDs;
- (NSArray)reporterIDs;
- (NSDate)timestampWhenMostRecentlyActivated;
- (NSDictionary)additiveRoutingInfo;
- (NSDictionary)audioBehaviour;
- (NSNumber)ID;
- (NSNumber)clientPID;
- (NSString)audioCategory;
- (NSString)audioMode;
- (NSString)clientName;
- (NSString)displayID;
- (NSString)routingContextUUID;
- (OS_os_transaction)activeOSTransaction;
- (float)interruptionFadeDuration;
- (id)info;
- (int)coreSessionType;
- (unint64_t)mxSessionIDCounter;
- (unsigned)applicationState;
- (unsigned)audioSessionID;
- (unsigned)interruptionStyle;
- (void)dealloc;
- (void)setActiveOSTransaction:(id)a3;
- (void)setApplicationState:(unsigned int)a3;
- (void)setAudioBehaviour:(id)a3;
- (void)setAudioCategory:(id)a3;
- (void)setAudioDestinationPriority:(id)a3;
- (void)setAudioMode:(id)a3;
- (void)setAudioSessionID:(unsigned int)a3;
- (void)setAuditToken:(id *)a3;
- (void)setClientName:(id)a3;
- (void)setClientPID:(id)a3;
- (void)setCoreSessionType:(int)a3;
- (void)setDisplayID:(id)a3;
- (void)setEnableBluetoothRecordingPreference:(BOOL)a3;
- (void)setHasEntitlementToSetIsUsingBuiltInMicForRecording:(BOOL)a3;
- (void)setHasInput:(BOOL)a3;
- (void)setHasPhoneCallBehavior:(BOOL)a3;
- (void)setID:(id)a3;
- (void)setInterruptionFadeDuration:(float)a3;
- (void)setInterruptionStyle:(unsigned int)a3;
- (void)setInterruptionStyleSetByClient:(BOOL)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsEligibleForBTSmartRoutingConsideration:(BOOL)a3;
- (void)setIsEligibleForBTSmartRoutingConsiderationSetByClient:(BOOL)a3;
- (void)setIsNowPlayingApp:(BOOL)a3;
- (void)setIsPlaying:(BOOL)a3;
- (void)setIsRecording:(BOOL)a3;
- (void)setIsTheAssistant:(BOOL)a3;
- (void)setIsUsingBuiltInMicForRecording:(BOOL)a3;
- (void)setIsUsingExclaveSensor:(BOOL)a3;
- (void)setMixesWithEveryone:(BOOL)a3;
- (void)setMxSessionIDCounter:(unint64_t)a3;
- (void)setOriginalReporterIDs:(id)a3;
- (void)setPrefersNoInterruptions:(BOOL)a3;
- (void)setReporterIDs:(id)a3;
- (void)setReporterStarted:(BOOL)a3;
- (void)setRoutingContextUUID:(id)a3;
- (void)setTimestampWhenMostRecentlyActivated:(id)a3;
- (void)updateClientName:(id)a3;
- (void)updateDefaultInterruptionFadeDuration:(id)a3;
@end

@implementation MXCoreSessionBase

- (NSNumber)clientPID
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (NSString)clientName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)displayID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)hasAudioCategory:(id)a3
{
  v4 = [(MXCoreSessionBase *)self audioCategory];
  return [(NSString *)v4 isEqualToString:a3];
}

- (NSString)audioCategory
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHasInput:(BOOL)a3
{
  self->_hasInput = a3;
}

- (BOOL)isEligibleForBTSmartRoutingConsideration
{
  return self->_isEligibleForBTSmartRoutingConsideration;
}

- (NSString)audioMode
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (unsigned)interruptionStyle
{
  return self->_interruptionStyle;
}

- (void)setIsEligibleForBTSmartRoutingConsideration:(BOOL)a3
{
  self->_isEligibleForBTSmartRoutingConsideration = a3;
}

- (void)setHasPhoneCallBehavior:(BOOL)a3
{
  self->_hasPhoneCallBehavior = a3;
}

- (void)setAudioCategory:(id)a3
{
}

- (BOOL)isEligibleForBTSmartRoutingConsiderationSetByClient
{
  return self->_isEligibleForBTSmartRoutingConsiderationSetByClient;
}

- (BOOL)isRoutedToOnDemandVAD
{
  int v3 = [(id)CMSUtility_GetCurrentInputVADUID(self) containsString:0x1EE5EBFC8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    && !CMSMUtility_IsCategoryInputOnly([(MXCoreSessionBase *)self audioCategory]))
  {
    return [(id)CMSUtility_GetCurrentAudioDestination(self) containsString:0x1EE5EBFC8] | v3;
  }
  return v3;
}

- (NSArray)audioDestinationPriority
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (NSDictionary)audioBehaviour
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (unsigned)applicationState
{
  return self->_applicationState;
}

- (NSArray)reporterIDs
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setReporterIDs:(id)a3
{
}

- (void)setOriginalReporterIDs:(id)a3
{
}

- (NSArray)originalReporterIDs
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)isRecording
{
  return self->_isRecording;
}

- (BOOL)isUsingBuiltInMicForRecording
{
  return self->_isUsingBuiltInMicForRecording;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self[5].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[5].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)updateClientName:(id)a3
{
  long long v3 = self;
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(MXCoreSessionBase *)self audioSessionID];
    if ([v4 rangeOfString:@"sid:" options:1] == 0x7FFFFFFFFFFFFFFFLL && v5 != 0)
    {
      id v7 = (id)[[NSString alloc] initWithFormat:@"'sid:0x%x', %@", v5, v4];
      [(MXCoreSessionBase *)v3 setClientName:v7];

      return;
    }
    self = v3;
    a3 = v4;
  }
  [(MXCoreSessionBase *)self setClientName:a3];
}

- (void)setClientName:(id)a3
{
}

- (void)setDisplayID:(id)a3
{
}

- (void)setRoutingContextUUID:(id)a3
{
}

- (void)setReporterStarted:(BOOL)a3
{
  self->_reporterStarted = a3;
}

- (void)setActiveOSTransaction:(id)a3
{
  self->_activeOSTransaction = (OS_os_transaction *)a3;
}

- (id)info
{
  v13 = NSString;
  v12 = [(MXCoreSessionBase *)self ID];
  long long v3 = [(MXCoreSessionBase *)self clientPID];
  id v4 = [(MXCoreSessionBase *)self clientName];
  uint64_t v5 = [(MXCoreSessionBase *)self displayID];
  v6 = [(MXCoreSessionBase *)self audioCategory];
  id v7 = [(MXCoreSessionBase *)self audioMode];
  if ([(MXCoreSessionBase *)self isActive]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  if ([(MXCoreSessionBase *)self isPlaying]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  if ([(MXCoreSessionBase *)self isRecording]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  return (id)[v13 stringWithFormat:@"<ID: %@, PID = %@, Name = %@, BundleID = %@, Category = %@, Mode = %@, Active = %@, Playing = %@, Recording = %@>", v12, v3, v4, v5, v6, v7, v8, v9, v10];
}

- (NSNumber)ID
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPrefersNoInterruptions:(BOOL)a3
{
  self->_prefersNoInterruptions = a3;
}

- (void)setIsUsingExclaveSensor:(BOOL)a3
{
  self->_isUsingExclaveSensor = a3;
}

- (void)setIsUsingBuiltInMicForRecording:(BOOL)a3
{
  self->_isUsingBuiltInMicForRecording = a3;
}

- (void)setInterruptionFadeDuration:(float)a3
{
  self->_interruptionFadeDuration = a3;
}

- (void)setHasEntitlementToSetIsUsingBuiltInMicForRecording:(BOOL)a3
{
  self->_hasEntitlementToSetIsUsingBuiltInMicForRecording = a3;
}

- (void)setApplicationState:(unsigned int)a3
{
  self->_applicationState = a3;
}

- (NSDictionary)additiveRoutingInfo
{
  if (![(MXCoreSessionBase *)self audioSessionID]) {
    return 0;
  }
  long long v3 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionary];
  if ([(MXCoreSessionBase *)self displayID]) {
    [(NSDictionary *)v3 setObject:[(MXCoreSessionBase *)self displayID] forKey:0x1EE5EF668];
  }
  -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", -[MXCoreSessionBase audioSessionID](self, "audioSessionID")), 0x1EE5EF688);
  [(NSDictionary *)v3 setObject:[+[MXSessionManager sharedInstance] getUncustomizedCategory:[(MXCoreSessionBase *)self audioCategory]] forKey:0x1EE5EF368];
  [(NSDictionary *)v3 setObject:[(MXCoreSessionBase *)self audioMode] forKey:0x1EE5EF348];
  if ([(MXCoreSessionBase *)self isTheAssistant]) {
    -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MXCoreSessionBase isTheAssistant](self, "isTheAssistant")), 0x1EE5E9208);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(MXCoreSessionBase *)self activationContext]) {
      [(NSDictionary *)v3 setObject:[(MXCoreSessionBase *)self activationContext] forKey:0x1EE5EF6C8];
    }
    -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", -[MXCoreSessionBase clientPriority](self, "clientPriority")), 0x1EE5EF6A8);
    if ([(MXCoreSessionBase *)self preferredRouteControlFeatures])
    {
      int v4 = objc_msgSend((id)objc_msgSend((id)-[MXCoreSessionBase preferredRouteControlFeatures](self, "preferredRouteControlFeatures"), "objectForKey:", @"RouteControlFeatures"), "unsignedIntValue");
      if (v4 == 1)
      {
        uint64_t v5 = MEMORY[0x1E4F1CC38];
        v6 = kVirtualAudioPlugInSessionDescriptionPreferIndependentRoute_CFString;
      }
      else
      {
        if (v4 != 2) {
          goto LABEL_19;
        }
        [(NSDictionary *)v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"prefer independent route"];
        uint64_t v5 = MEMORY[0x1E4F1CC28];
        v6 = kVirtualAudioPlugInSessionDescriptionSharingKey_CFString;
      }
      [(NSDictionary *)v3 setObject:v5 forKey:*v6];
    }
LABEL_19:
    if ([(MXCoreSessionBase *)self prefersEchoCancelledInput])
    {
      [(NSDictionary *)v3 setObject:0x1EE5EF748 forKey:0x1EE5EF348];
      -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", -[MXCoreSessionBase prefersEchoCancelledInput](self, "prefersEchoCancelledInput")), 0x1EE5EF608);
    }
    uint64_t v9 = MEMORY[0x1E4F1CC38];
    if ([(MXCoreSessionBase *)self allowsBluetoothRecordingCustomization])
    {
      if ([(MXCoreSessionBase *)self shouldEnableBluetoothRecording]) {
        uint64_t v10 = MEMORY[0x1E4F1CC28];
      }
      else {
        uint64_t v10 = v9;
      }
      [(NSDictionary *)v3 setObject:v10 forKey:0x1EE5EF508];
    }
    if ([(MXCoreSessionBase *)self allowsDefaultBuiltInRouteCustomization])
    {
      if (objc_msgSend((id)-[MXCoreSessionBase defaultBuiltInRouteToUse](self, "defaultBuiltInRouteToUse"), "isEqualToString:", @"Speaker"))uint64_t v11 = v9; {
      else
      }
        uint64_t v11 = MEMORY[0x1E4F1CC28];
      [(NSDictionary *)v3 setObject:v11 forKey:0x1EE5EF4E8];
    }
    if ([(MXCoreSessionBase *)self allowedPortTypes])
    {
      uint64_t v7 = [(MXCoreSessionBase *)self allowedPortTypes];
      uint64_t v8 = 0x1EE5EF488;
      goto LABEL_33;
    }
    return v3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", -[MXCoreSessionBase isolatedAudioUseCaseID](self, "isolatedAudioUseCaseID"));
    uint64_t v8 = 0x1EE5EF708;
LABEL_33:
    [(NSDictionary *)v3 setObject:v7 forKey:v8];
    return v3;
  }
  MXSimulateCrash((uint64_t)"This is an abstract method and should be overriden! Please file a radar against 'MediaExperie"
                           "nce Session | All'");
  return v3;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (BOOL)isTheAssistant
{
  return self->_isTheAssistant;
}

- (void)setInterruptionStyle:(unsigned int)a3
{
  self->_interruptionStyle = a3;
}

- (NSString)routingContextUUID
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setMixesWithEveryone:(BOOL)a3
{
  self->_mixesWithEveryone = a3;
}

- (void)setInterruptionStyleSetByClient:(BOOL)a3
{
  self->_interruptionStyleSetByClient = a3;
}

- (void)setAudioDestinationPriority:(id)a3
{
}

- (void)setAudioBehaviour:(id)a3
{
}

- (BOOL)hasPhoneCallBehavior
{
  return self->_hasPhoneCallBehavior;
}

- (void)setClientPID:(id)a3
{
}

- (BOOL)hasInput
{
  return self->_hasInput;
}

- (MXCoreSessionBase)init
{
  v4.receiver = self;
  v4.super_class = (Class)MXCoreSessionBase;
  v2 = [(MXCoreSessionBase *)&v4 init];
  if (v2)
  {
    *((void *)v2 + 11) = [objc_alloc(MEMORY[0x1E4F28ED0]) initWithLongLong:FigAtomicIncrement64()];
    v2[9] = 0;
    *(_WORD *)(v2 + 19) = 0;
    *((void *)v2 + 6) = @"SoloAmbientSound";
    *((void *)v2 + 7) = @"Default";
    *((_WORD *)v2 + 6) = 0;
    v2[8] = 0;
    *((void *)v2 + 17) = 0;
    *((void *)v2 + 12) = 0;
    *((void *)v2 + 13) = 0;
    v2[17] = 1;
  }
  return (MXCoreSessionBase *)v2;
}

- (BOOL)interruptionStyleSetByClient
{
  return self->_interruptionStyleSetByClient;
}

- (void)updateDefaultInterruptionFadeDuration:(id)a3
{
  if ([(MXCoreSessionBase *)self isSidekick]) {
    float v5 = 5.0;
  }
  else {
    float v5 = 2.0;
  }
  if (![(MXCoreSessionBase *)self hasAudioMode:@"Sleep"]
    || ([(MXCoreSessionBase *)self interruptionFadeDuration], *(float *)&v6 != 0.7))
  {
    if (![a3 isEqualToString:@"Sleep"]) {
      return;
    }
    [(MXCoreSessionBase *)self interruptionFadeDuration];
    if (*(float *)&v6 != v5) {
      return;
    }
    float v5 = *(float *)"333?";
  }
  *(float *)&double v6 = v5;
  [(MXCoreSessionBase *)self setInterruptionFadeDuration:v6];
}

- (void)setAudioMode:(id)a3
{
}

- (BOOL)isSidekick
{
  uint64_t v3 = objc_opt_class();
  return [(MXCoreSessionBase *)self isMemberOfClass:v3];
}

- (void)setIsActive:(BOOL)a3
{
  if (a3) {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  }
  else {
    uint64_t v5 = 0;
  }
  [(MXCoreSessionBase *)self setTimestampWhenMostRecentlyActivated:v5];
  self->_isActive = a3;
}

- (void)setTimestampWhenMostRecentlyActivated:(id)a3
{
}

- (BOOL)reporterStarted
{
  return self->_reporterStarted;
}

- (OS_os_transaction)activeOSTransaction
{
  return self->_activeOSTransaction;
}

- (void)setEnableBluetoothRecordingPreference:(BOOL)a3
{
  self->_enableBluetoothRecordingPreference = a3;
}

- (void)setAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_auditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_auditToken.val[4] = v3;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (BOOL)hasAudioMode:(id)a3
{
  objc_super v4 = [(MXCoreSessionBase *)self audioMode];
  return [(NSString *)v4 isEqualToString:a3];
}

- (void)setIsPlaying:(BOOL)a3
{
  self->_isPlaying = a3;
}

- (BOOL)mixesWithEveryone
{
  return self->_mixesWithEveryone;
}

- (void)setIsRecording:(BOOL)a3
{
  self->_isRecording = a3;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v3 = (void *)MEMORY[0x1997179E0](self, a2);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  originalReporterIDs = self->_originalReporterIDs;
  uint64_t v5 = [(NSArray *)originalReporterIDs countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(originalReporterIDs);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) longLongValue];
        off_1E9359D18(v9);
      }
      uint64_t v6 = [(NSArray *)originalReporterIDs countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  self->_audioDestinationPriority = 0;
  self->_audioBehaviour = 0;

  self->_ID = 0;
  self->_clientPID = 0;

  self->_clientName = 0;
  self->_displayID = 0;

  self->_routingContextUUID = 0;
  self->_audioCategory = 0;

  self->_audioMode = 0;
  self->_reporterIDs = 0;

  self->_originalReporterIDs = 0;
  activeOSTransaction = self->_activeOSTransaction;
  if (activeOSTransaction)
  {

    self->_activeOSTransaction = 0;
  }

  self->_timestampWhenMostRecentlyActivated = 0;
  v11.receiver = self;
  v11.super_class = (Class)MXCoreSessionBase;
  [(MXCoreSessionBase *)&v11 dealloc];
}

- (BOOL)wasRecentlyActivated
{
  v2 = [(MXCoreSessionBase *)self timestampWhenMostRecentlyActivated];
  if (v2)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSinceDate:", v2);
    LOBYTE(v2) = v3 <= 2.0;
  }
  return (char)v2;
}

- (BOOL)updateAudioBehaviourFromVARouteConfig:(id)a3
{
  MXSimulateCrash((uint64_t)"This is an abstract method and should be overriden! Please file a radar against 'MediaExperie"
                           "nce Session | All'");
  return 0;
}

- (BOOL)hasEchoCancelledInput
{
  if (CMSMUtility_IsCategoryInputOnly([(MXCoreSessionBase *)self audioCategory])) {
    AudioObjectID CurrentInputVADID = CMSUtility_GetCurrentInputVADID(self);
  }
  else {
    AudioObjectID CurrentInputVADID = CMSUtility_GetCurrentOutputVADID(self);
  }
  return CMSMVAUtility_DoesVADHaveEchoCancelledInput(CurrentInputVADID) != 0;
}

- (BOOL)supportsEchoCancelledInput
{
  VADCategoryFromFigCategoryName = CMSMVAUtility_GetVADCategoryFromFigCategoryName((NSDictionary *)[(MXCoreSessionBase *)self audioCategory]);
  uint64_t VADModeFromFigModeName = CMSMVAUtility_GetVADModeFromFigModeName((uint64_t)[(MXCoreSessionBase *)self audioMode]);
  return CMSMVAUtility_DoesSessionConfigurationSupportEchoCancelledInput((uint64_t)VADCategoryFromFigCategoryName, VADModeFromFigModeName) != 0;
}

- (BOOL)enableBluetoothRecordingPreference
{
  return self->_enableBluetoothRecordingPreference;
}

- (void)setID:(id)a3
{
}

- (int)coreSessionType
{
  return self->_coreSessionType;
}

- (void)setCoreSessionType:(int)a3
{
  self->_coreSessionType = a3;
}

- (float)interruptionFadeDuration
{
  return self->_interruptionFadeDuration;
}

- (BOOL)isNowPlayingApp
{
  return self->_isNowPlayingApp;
}

- (void)setIsNowPlayingApp:(BOOL)a3
{
  self->_isNowPlayingApp = a3;
}

- (void)setIsTheAssistant:(BOOL)a3
{
  self->_isTheAssistant = a3;
}

- (NSDate)timestampWhenMostRecentlyActivated
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (BOOL)hasEntitlementToSetIsUsingBuiltInMicForRecording
{
  return self->_hasEntitlementToSetIsUsingBuiltInMicForRecording;
}

- (void)setIsEligibleForBTSmartRoutingConsiderationSetByClient:(BOOL)a3
{
  self->_isEligibleForBTSmartRoutingConsiderationSetByClient = a3;
}

- (BOOL)isUsingExclaveSensor
{
  return self->_isUsingExclaveSensor;
}

- (unint64_t)mxSessionIDCounter
{
  return self->_mxSessionIDCounter;
}

- (void)setMxSessionIDCounter:(unint64_t)a3
{
  self->_mxSessionIDCounter = a3;
}

- (BOOL)prefersNoInterruptions
{
  return self->_prefersNoInterruptions;
}

@end