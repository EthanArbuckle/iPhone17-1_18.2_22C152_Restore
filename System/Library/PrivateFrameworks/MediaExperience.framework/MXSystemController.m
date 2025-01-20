@interface MXSystemController
+ (BOOL)getCanBeNowPlayingAppForPID:(int)a3;
+ (BOOL)isAppAllowedToInitiatePlayback:(id)a3;
+ (BOOL)isNonSerializedCopyProperty:(id)a3;
+ (BOOL)isNonSerializedSetProperty:(id)a3;
+ (int)getPIDForAnyAppThatWantsVolumeChanges;
+ (int)getPIDToInheritAppStateFromForPID:(int)a3;
+ (void)dumpInfoOfMXSystemControllers;
+ (void)initialize;
+ (void)mxSystemControllerListAddInstance:(id)a3 isSidekick:(BOOL)a4;
+ (void)mxSystemControllerListBeginIteration;
+ (void)mxSystemControllerListEndIteration;
+ (void)notifyAll:(id)a3 payload:(id)a4 dontPostIfSuspended:(BOOL)a5;
+ (void)notifyAll:(id)a3 payload:(id)a4 dontPostIfSuspended:(BOOL)a5 remoteDeviceID:(id)a6;
+ (void)updateMXSystemControllerList;
- (BOOL)appWantsVolumeChanges;
- (BOOL)canBeNowPlayingApp;
- (BOOL)hasEntitlementForPIDInheritance;
- (BOOL)hasEntitlementForSilentModeNotifications;
- (BOOL)hasEntitlementToAllowAppsToInitiatePlayback;
- (BOOL)hasEntitlementToClearCacheForFirstPartyPhoneCalls;
- (BOOL)hasEntitlementToEnableWombat;
- (BOOL)hasEntitlementToInitiateRecordingTemporarily;
- (BOOL)hasEntitlementToSetRelativeVoiceOverVolume;
- (BOOL)hasEntitlementToSetSilentMode;
- (BOOL)isAppAllowedToInitiatePlayback:(id)a3;
- (BOOL)isSomeoneRecording;
- (BOOL)phoneCallExists;
- (BOOL)someLongFormVideoClientIsActiveOverAirPlayVideo;
- (BOOL)someLongFormVideoClientIsPlaying;
- (BOOL)someLongFormVideoClientIsPlayingOverAirPlayVideo;
- (BOOL)someSharePlayCapableCallSessionIsActive;
- (MXSystemController)initWithPID:(int)a3;
- (MXSystemController)initWithPID:(int)a3 remoteDeviceID:(id)a4;
- (NSData)auditToken;
- (NSDate)appsAllowedToInitiatePlaybackTimestamp;
- (NSDictionary)notificationsSubscribedTo;
- (NSSet)appsAllowedToInitiatePlayback;
- (NSSet)remoteDeviceIDs;
- (NSString)appsAllowedToInitiatePlaybackClientType;
- (NSString)bundleID;
- (NSString)displayID;
- (NSString)remoteDeviceID;
- (id)info;
- (int)_performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 outVolume:(float *)a10 outSequenceNumber:(int64_t *)a11 outMuted:(BOOL *)a12 outCategoryCopy:(id *)a13 outModeCopy:(id *)a14;
- (int)_performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 rampUpDuration:(float)a10 rampDownDuration:(float)a11 outVolume:(float *)a12 outSequenceNumber:(int64_t *)a13 outMuted:(BOOL *)a14 outCategoryCopy:(id *)a15 outModeCopy:(id *)a16;
- (int)_performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 rampUpDuration:(float)a10 rampDownDuration:(float)a11 outVolume:(float *)a12 outSequenceNumber:(int64_t *)a13 outMuted:(BOOL *)a14 outCategoryCopy:(id *)a15 outModeCopy:(id *)a16 retainFullMute:(BOOL)a17;
- (int)_performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 rampUpwardDuration:(id)a10 rampDownwardDuration:(id)a11 outVolume:(float *)a12 outSequenceNumber:(int64_t *)a13 outMuted:(BOOL *)a14 outCategoryCopy:(id *)a15 outModeCopy:(id *)a16;
- (int)allowAppsToInitiatePlayback:(id)a3 clientType:(id)a4 isTemporary:(BOOL)a5;
- (int)applyPIDToInheritAppStateFrom:(const void *)a3;
- (int)clearUplinkMutedCache;
- (int)clientPID;
- (int)copyAttributeForKey:(id)a3 withValueOut:(void *)a4;
- (int)copyAttributeForKeyInternal:(id)a3 withValueOut:(void *)a4;
- (int)copySessionIDsWithMuteValue:(id *)a3 muteValue:(BOOL *)a4;
- (int)getInputMute:(id *)a3 outMuteValue:(BOOL *)a4;
- (int)getVolumeButtonDelta:(id)a3 outVolumeDelta:(float *)a4;
- (int)grantMediaEndowmentWithEnvironmentID:(id)a3 endowmentPayload:(id)a4;
- (int)performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 outVolume:(float *)a10 outSequenceNumber:(int64_t *)a11 outMuted:(BOOL *)a12 outCategoryCopy:(id *)a13 outModeCopy:(id *)a14;
- (int)performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 rampUpDuration:(float)a10 rampDownDuration:(float)a11 outVolume:(float *)a12 outSequenceNumber:(int64_t *)a13 outMuted:(BOOL *)a14 outCategoryCopy:(id *)a15 outModeCopy:(id *)a16;
- (int)performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 rampUpDuration:(float)a10 rampDownDuration:(float)a11 outVolume:(float *)a12 outSequenceNumber:(int64_t *)a13 outMuted:(BOOL *)a14 outCategoryCopy:(id *)a15 outModeCopy:(id *)a16 retainFullMute:(BOOL)a17;
- (int)performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 rampUpwardDuration:(id)a10 rampDownwardDuration:(id)a11 outVolume:(float *)a12 outSequenceNumber:(int64_t *)a13 outMuted:(BOOL *)a14 outCategoryCopy:(id *)a15 outModeCopy:(id *)a16;
- (int)pidToInheritAppStateFrom;
- (int)remoteDeviceControlIsAllowed:(unsigned int *)a3;
- (int)revokeMediaEndowmentWithEnvironmentID:(id)a3;
- (int)setAttributeForKey:(id)a3 andValue:(const void *)a4;
- (int)setAttributeForKeyInternal:(id)a3 andValue:(const void *)a4;
- (int)setInputMute:(id *)a3 muteValue:(BOOL)a4;
- (int)setSilentMode:(BOOL)a3 untilTime:(id)a4 reason:(id)a5 clientType:(unsigned int)a6;
- (int)toggleInputMute;
- (void)applyCanBeNowPlayingApp:(const void *)a3;
- (void)dealloc;
- (void)setAppWantsVolumeChanges:(BOOL)a3;
- (void)setAppsAllowedToInitiatePlayback:(id)a3;
- (void)setAppsAllowedToInitiatePlaybackClientType:(id)a3;
- (void)setAppsAllowedToInitiatePlaybackTimestamp:(id)a3;
- (void)setAuditToken:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCanBeNowPlayingApp:(BOOL)a3;
- (void)setClientPID:(int)a3;
- (void)setDisplayID:(id)a3;
- (void)setHasEntitlementForPIDInheritance:(BOOL)a3;
- (void)setHasEntitlementForSilentModeNotifications:(BOOL)a3;
- (void)setHasEntitlementToAllowAppsToInitiatePlayback:(BOOL)a3;
- (void)setHasEntitlementToClearCacheForFirstPartyPhoneCalls:(BOOL)a3;
- (void)setHasEntitlementToEnableWombat:(BOOL)a3;
- (void)setHasEntitlementToInitiateRecordingTemporarily:(BOOL)a3;
- (void)setHasEntitlementToSetRelativeVoiceOverVolume:(BOOL)a3;
- (void)setHasEntitlementToSetSilentMode:(BOOL)a3;
- (void)setNotificationsSubscribedTo:(id)a3;
- (void)setPidToInheritAppStateFrom:(int)a3;
- (void)setRemoteDeviceID:(id)a3;
- (void)setRemoteDeviceIDs:(id)a3;
- (void)volumeCategoryAndMode:(id)a3 mode:(id)a4 outCategoryCopy:(id *)a5 outModeCopy:(id *)a6;
@end

@implementation MXSystemController

+ (BOOL)getCanBeNowPlayingAppForPID:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  +[MXSystemController mxSystemControllerListBeginIteration];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = (void *)gMXSystemControllerList;
  uint64_t v5 = [(id)gMXSystemControllerList countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (v9 && [*(id *)(*((void *)&v12 + 1) + 8 * i) clientPID] == a3)
        {
          char v10 = [v9 canBeNowPlayingApp];
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  char v10 = 0;
LABEL_12:
  +[MXSystemController mxSystemControllerListEndIteration];
  return v10;
}

- (int)clientPID
{
  return self->_clientPID;
}

+ (void)mxSystemControllerListEndIteration
{
  [(id)gMXSystemControllerListReadLock lock];
  if (!--gMXSystemControllerListActiveReaders) {
    dispatch_semaphore_signal((dispatch_semaphore_t)gMXSystemControllerListWriteSemaphore);
  }
  v2 = (void *)gMXSystemControllerListReadLock;
  [v2 unlock];
}

+ (void)mxSystemControllerListBeginIteration
{
  [(id)gMXSystemControllerListReadLock lock];
  if (!gMXSystemControllerListActiveReaders++) {
    dispatch_semaphore_wait((dispatch_semaphore_t)gMXSystemControllerListWriteSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  }
  v3 = (void *)gMXSystemControllerListReadLock;
  [v3 unlock];
}

- (BOOL)canBeNowPlayingApp
{
  return self->_canBeNowPlayingApp;
}

void __88__MXSystemController_InternalUse__notifyAll_payload_dontPostIfSuspended_remoteDeviceID___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = &gSidekickMXSystemControllerList;
  if (!*(void *)(a1 + 32)) {
    v3 = &gMXSystemControllerList;
  }
  v4 = (void *)*v3;
  +[MXSystemController mxSystemControllerListBeginIteration];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v33;
    v24 = v4;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v32 + 1) + 8 * v8);
        if (v9)
        {
          if ([*(id *)(a1 + 40) isEqualToString:@"ActiveAudioRouteDidChange"])
          {
            CFTypeRef cf = 0;
            FigRoutingManagerContextUtilities_CopySystemMusicContextUUID((uint64_t)&cf);
            if (!FigRoutingContextUtilities_IsFollowingAnotherContext((uint64_t)cf)
              && ((objc_msgSend((id)objc_msgSend(v9, "displayID"), "isEqualToString:", @"com.apple.Music") & 1) != 0
               || objc_msgSend((id)objc_msgSend(v9, "displayID"), "isEqualToString:", @"com.apple.TVMusic")))
            {
              if (dword_1E9359E48)
              {
                int v30 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                v4 = v24;
                int v10 = 1;
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              else
              {
                int v10 = 1;
              }
            }
            else
            {
              int v10 = 0;
            }
            if (cf) {
              CFRelease(cf);
            }
          }
          else
          {
            int v10 = 0;
          }
          uint64_t v11 = objc_msgSend((id)objc_msgSend(v9, "notificationsSubscribedTo", v22, v23), "objectForKey:", *(void *)(a1 + 40));
          if (*(unsigned char *)(a1 + 56))
          {
            BOOL v12 = MX_RunningBoardServices_GetApplicationStateForPID([v9 clientPID], 0) - 3 < 0xFFFFFFFE;
            if (v10) {
              goto LABEL_31;
            }
          }
          else
          {
            BOOL v12 = 1;
            if (v10) {
              goto LABEL_31;
            }
          }
          if (v11) {
            BOOL v13 = !v12;
          }
          else {
            BOOL v13 = 1;
          }
          if (!v13)
          {
            if (!*(void *)(a1 + 32)
              || (uint64_t v14 = [v9 remoteDeviceID]) != 0
              && (uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(v9, "remoteDeviceID")),
                  (v14 & 1) != 0)
              || MX_FeatureFlags_IsAirPlayDaemonEnabled(v14, v15)
              && *(void *)(a1 + 32)
              && [v9 remoteDeviceIDs]
              && objc_msgSend((id)objc_msgSend(v9, "remoteDeviceIDs"), "containsObject:", *(void *)(a1 + 32)))
            {
              [v2 addObject:v9];
            }
          }
        }
LABEL_31:
        ++v8;
      }
      while (v6 != v8);
      uint64_t v17 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
      uint64_t v6 = v17;
    }
    while (v17);
  }
  +[MXSystemController mxSystemControllerListEndIteration];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v18 = [v2 countByEnumeratingWithState:&v25 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", *(void *)(a1 + 40), *(void *)(*((void *)&v25 + 1) + 8 * i), *(void *)(a1 + 48));
      }
      uint64_t v19 = [v2 countByEnumeratingWithState:&v25 objects:v36 count:16];
    }
    while (v19);
  }
}

- (NSDictionary)notificationsSubscribedTo
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

void __49__MXSystemController_initWithPID_remoteDeviceID___block_invoke_2(uint64_t a1)
{
  id v2 = (__CFString *)MX_RunningBoardServices_CopyDisplayIDForPID(objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32)
                                                                                                + 8)
                                                                                    + 40), "clientPID"));
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setDisplayID:v2];
}

- (void)setDisplayID:(id)a3
{
}

- (int)copyAttributeForKey:(id)a3 withValueOut:(void *)a4
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  uint64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  +[MXInitialization waitUntilMXIsFullyInitialized];
  if (+[MXSystemController isNonSerializedCopyProperty:a3])
  {
    int v8 = [(MXSystemController *)self copyAttributeForKeyInternal:a3 withValueOut:a4];
    *((_DWORD *)v14 + 6) = v8;
  }
  else
  {
    v9 = MXGetSerialQueue();
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__MXSystemController_copyAttributeForKey_withValueOut___block_invoke;
    v12[3] = &unk_1E57C5808;
    v12[4] = self;
    v12[5] = a3;
    v12[6] = &v13;
    v12[7] = a4;
    MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController copyAttributeForKey:withValueOut:]", (uint64_t)"MXSystemController_Embedded.m", 1197, 0, 0, v9, (uint64_t)v12);
  }
  -[MXAudioStatistics sendSinglePerformanceMessageForRoutine:operationTime:details:](+[MXAudioStatistics sharedInstance](MXAudioStatistics, "sharedInstance"), "sendSinglePerformanceMessageForRoutine:operationTime:details:", "-[MXSystemController copyAttributeForKey:withValueOut:]", FigGetUpTimeNanoseconds() - UpTimeNanoseconds, a3);
  int v10 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v10;
}

+ (BOOL)isNonSerializedCopyProperty:(id)a3
{
  return [(id)gMXSystemControllerNonSerializedCopyProperties containsObject:a3];
}

- (int)copyAttributeForKeyInternal:(id)a3 withValueOut:(void *)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"ActiveNeroVisualStreamInfo"])
  {
    active = (NSArray *)FigRoutingManagerCopyActiveNeroVisualStreamInfo((uint64_t)[+[MXSessionManager sharedInstance] systemMirroringRoutingContextUUID]);
LABEL_18:
    uint64_t v19 = active;
    int result = 0;
    *(void *)a4 = v19;
    return result;
  }
  if ([a3 isEqualToString:@"ActivePhoneCallInfo"])
  {
    int v8 = (void *)CMSMUtility_CopyActivePhoneCallInfo();
    CurrentlyAirPlayingVideoStreamsDictionary = v8;
    if (!v8)
    {
LABEL_7:

      return 0;
    }
    BOOL v10 = objc_msgSend((id)objc_msgSend(v8, "objectForKey:", @"ClientPriority"), "intValue") == 10;
    id v11 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v12 = (id)objc_msgSend(v11, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", v10), @"CallIsHighPriority", 0, v48, v49);
LABEL_6:
    *(void *)a4 = v12;
    goto LABEL_7;
  }
  if ([a3 isEqualToString:@"AirPlayScreenSuspended"])
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
    int IsSuspended = CMScreenIsSuspended();
LABEL_10:
    BOOL v16 = IsSuspended != 0;
LABEL_16:
    id v18 = v14;
LABEL_17:
    active = (NSArray *)objc_msgSend(v18, "initWithBool:", v16, v46, v47);
    goto LABEL_18;
  }
  if ([a3 isEqualToString:@"AppWantsVolumeChanges"])
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
    uint64_t v17 = [(MXSystemController *)self appWantsVolumeChanges];
LABEL_15:
    BOOL v16 = v17;
    goto LABEL_16;
  }
  if ([a3 isEqualToString:@"CanBeNowPlayingApp"])
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
    uint64_t v17 = [(MXSystemController *)self canBeNowPlayingApp];
    goto LABEL_15;
  }
  if ([a3 isEqualToString:@"CarPlayAuxStreamSupport"])
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
    int IsSuspended = FigRoutingManager_iOSIsCarPlayAuxStreamSupported();
    goto LABEL_10;
  }
  if ([a3 isEqualToString:@"CarPlayIsConnected"])
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
    uint64_t v17 = [+[MXSessionManager sharedInstance] carPlayIsConnected];
    goto LABEL_15;
  }
  if ([a3 isEqualToString:@"CarPlayIsPlayingLongerDurationSession"])
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
    int IsSuspended = CMSMUtility_CarPlayIsPlayingLongerDurationSession();
    goto LABEL_10;
  }
  if ([a3 isEqualToString:@"CarPlaySupportsMixableSiri"])
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
    int IsSuspended = CMSMUtility_DoesCarPlaySupportMixableSiri();
    goto LABEL_10;
  }
  if ([a3 isEqualToString:@"ExternalScreenType"])
  {
    ScreenType = (NSArray *)CMScreenGetScreenType();
LABEL_29:
    active = ScreenType;
    goto LABEL_18;
  }
  if ([a3 isEqualToString:@"CurrentlyActiveCategory"])
  {
    active = (NSArray *)CMSMUtility_CopyCurrentlyActiveCategory();
    goto LABEL_18;
  }
  if ([a3 isEqualToString:@"CurrentlyActiveMode"])
  {
    active = (NSArray *)CMSMUtility_CopyCurrentlyActiveMode();
    goto LABEL_18;
  }
  if ([a3 isEqualToString:@"CurrentVideoStreams"])
  {
    CurrentlyAirPlayingVideoStreamsDictionary = CMSMUtility_CreateCurrentlyAirPlayingVideoStreamsDictionary(@"CurrentVideoStreams_BundleID", @"CurrentVideoStreams_VideoRoutes");
    id v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", CurrentlyAirPlayingVideoStreamsDictionary, 0);
    goto LABEL_6;
  }
  if ([a3 isEqualToString:@"DeviceSupportsPiP"])
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
    int IsSuspended = CMSMDeviceState_SupportsPiP();
    goto LABEL_10;
  }
  if ([a3 isEqualToString:@"HeadphoneJackHasInput"])
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
    int IsSuspended = vaemHeadphoneJackHasInput(1);
    goto LABEL_10;
  }
  if ([a3 isEqualToString:@"HeadphoneJackIsConnected"])
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
    int IsSuspended = vaemHeadphoneJackIsConnected(1);
    goto LABEL_10;
  }
  if ([a3 isEqualToString:@"HighestArbitrationPriorityForTipi"])
  {
    if (MX_FeatureFlags_IsSmartRoutingOnActivationEnabled()) {
      id v21 = [+[MXSessionManager sharedInstance] copyHighestPriorityActiveSession:0x1EE5EBF48 deviceIdentifier:0];
    }
    else {
      id v21 = CMSM_CopyHighestPriorityLocalPlayingSession(1);
    }
    CurrentlyAirPlayingVideoStreamsDictionary = v21;
    uint64_t LocalSessionPriority = CMSM_GetLocalSessionPriority(v21, 1);
    id v24 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v25 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:LocalSessionPriority];
    if ([CurrentlyAirPlayingVideoStreamsDictionary displayID]) {
      long long v26 = (__CFString *)[CurrentlyAirPlayingVideoStreamsDictionary displayID];
    }
    else {
      long long v26 = @"Unknown";
    }
    id v12 = (id)objc_msgSend(v24, "initWithObjectsAndKeys:", v25, @"HighestArbitrationPriorityForTipi_AudioScore", v26, @"HighestArbitrationPriorityForTipi_BundleID", 0);
    goto LABEL_6;
  }
  if ([a3 isEqualToString:@"iOSWillRequestToBorrowStarkMainAudio"])
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
    int v22 = 1;
LABEL_49:
    int IsSuspended = CMSMUtility_iOSWillRequestCarMainAudio(v22);
    goto LABEL_10;
  }
  if ([a3 isEqualToString:@"iOSWillRequestToTakeStarkMainAudio"])
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
    int v22 = 0;
    goto LABEL_49;
  }
  if ([a3 isEqualToString:@"IsSomeoneRecording"])
  {
    uint64_t IsSomeClientRecording = CMSMUtility_IsSomeClientRecording();
    id v28 = objc_alloc(MEMORY[0x1E4F28ED0]);
    uint64_t v29 = IsSomeClientRecording;
LABEL_57:
    active = (NSArray *)[v28 initWithUnsignedInt:v29];
    goto LABEL_18;
  }
  if ([a3 isEqualToString:@"LongFormVideoApps"])
  {
    ScreenType = [+[MXSessionManager sharedInstance] longFormVideoApps];
    goto LABEL_29;
  }
  if ([a3 isEqualToString:@"NowPlayingAppDisplayID"])
  {
    ScreenType = [+[MXNowPlayingAppManager sharedInstance] nowPlayingAppDisplayID];
    goto LABEL_29;
  }
  if ([a3 isEqualToString:@"NowPlayingAppIsInterrupted"])
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
    int IsSuspended = CMSMNP_GetNowPlayingAppIsInterrupted();
    goto LABEL_10;
  }
  if ([a3 isEqualToString:@"NowPlayingAppIsPlaying"])
  {
    int IsPlaying = CMSMNP_GetNowPlayingAppIsPlaying();
LABEL_66:
    id v18 = objc_alloc(MEMORY[0x1E4F28ED0]);
    BOOL v16 = IsPlaying != 0;
    goto LABEL_17;
  }
  if ([a3 isEqualToString:@"NowPlayingAppPID"])
  {
    active = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28ED0]), "initWithLong:", -[MXNowPlayingAppManager nowPlayingAppPID](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "nowPlayingAppPID"));
    goto LABEL_18;
  }
  if ([a3 isEqualToString:@"NowPlayingAppShouldResumeForCarPlay"])
  {
    int IsPlaying = CMSMNP_GetNowPlayingAppShouldResumeForCarPlay();
    if (dword_1E9359E48)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    goto LABEL_66;
  }
  if (![a3 isEqualToString:@"MaximumSpeakerVolumeLimit"])
  {
    if ([a3 isEqualToString:@"MinimumAllowedMaximumSpeakerVolumeLimit"])
    {
      id v34 = objc_alloc(MEMORY[0x1E4F28ED0]);
      LODWORD(v35) = 1045220557;
LABEL_84:
      active = (NSArray *)objc_msgSend(v34, "initWithFloat:", v35, v46, v47);
      goto LABEL_18;
    }
    if ([a3 isEqualToString:@"PhoneCallExists"])
    {
      id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
      int IsSuspended = CMSMUtility_IsPhoneCallActive();
      goto LABEL_10;
    }
    if ([a3 isEqualToString:@"PIDToInheritApplicationStateFrom"])
    {
      id v38 = objc_alloc(MEMORY[0x1E4F28ED0]);
      uint64_t v29 = [(MXSystemController *)self pidToInheritAppStateFrom];
      id v28 = v38;
      goto LABEL_57;
    }
    if ([a3 isEqualToString:@"PlayingSessionsDescription"])
    {
      active = (NSArray *)CMSMNotificationUtility_CreatePlayingSessionsDescription();
      goto LABEL_18;
    }
    if ([a3 isEqualToString:@"RecommendedMaximumSpeakerVolumeLimit"])
    {
      id v34 = objc_alloc(MEMORY[0x1E4F28ED0]);
      LODWORD(v35) = 0.5;
      goto LABEL_84;
    }
    if ([a3 isEqualToString:@"DuckScalarForVoiceOver"])
    {
      if (!MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled()) {
        return -12981;
      }
      if ([(MXSystemController *)self hasEntitlementToSetRelativeVoiceOverVolume])
      {
        id v39 = objc_alloc(MEMORY[0x1E4F28ED0]);
        [+[MXSessionManager sharedInstance] duckScalarForVoiceOver];
        id v34 = v39;
        goto LABEL_84;
      }
      return -12988;
    }
    if ([a3 isEqualToString:@"RecordingClientPIDs"])
    {
      ScreenType = [+[MXSessionManager sharedInstance] recordingClientPIDs];
      goto LABEL_29;
    }
    if ([a3 isEqualToString:@"RecordingSessionsDescription"])
    {
      active = (NSArray *)CMSMNotificationUtility_CreateRecordingSessionsDescription();
      goto LABEL_18;
    }
    if ([a3 isEqualToString:@"ShouldIgnorePlayCommandsFromAccessory"])
    {
      id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
      int IsSuspended = CMSMUtility_ShouldIgnorePlayCommandsFromAccessory();
      goto LABEL_10;
    }
    if ([a3 isEqualToString:@"SilentModeEnabled"])
    {
      if ([(MXSystemController *)self hasEntitlementForSilentModeNotifications]|| [(MXSystemController *)self hasEntitlementToSetSilentMode])
      {
        id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
        uint64_t v17 = [+[MXSessionManager sharedInstance] silentModeEnabled];
        goto LABEL_15;
      }
      v40 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return -12988;
    }
    if ([a3 isEqualToString:@"SomeClientIsPlaying"])
    {
      id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
      int IsSuspended = CMSMUtility_SomeClientIsPlaying();
      goto LABEL_10;
    }
    if ([a3 isEqualToString:@"SomeClientIsPlayingLongFormAudio"])
    {
      id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
      int IsSuspended = CMSMUtility_SomeClientIsPlayingLongFormAudio();
      goto LABEL_10;
    }
    if ([a3 isEqualToString:@"SomeLongFormVideoClientIsActiveOverAirPlayVideo"])
    {
      id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
      int IsSuspended = CMSMUtility_IsAnyLongFormVideoSessionActiveOverAirPlayVideo();
      goto LABEL_10;
    }
    if ([a3 isEqualToString:@"SomeLongFormVideoClientIsPlaying"])
    {
      id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
      int IsSuspended = CMSMUtility_IsAnyLongFormVideoSessionPlaying();
      goto LABEL_10;
    }
    if ([a3 isEqualToString:@"SomeLongFormVideoClientIsPlayingOverAirPlayVideo"])
    {
      id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
      int IsSuspended = CMSMUtility_IsAnyLongFormVideoSessionPlayingOverAirPlayVideo();
      goto LABEL_10;
    }
    if ([a3 isEqualToString:@"SomeRecordingSessionPresentThatDisallowsSystemSounds"])
    {
      id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
      int IsSuspended = CMSMUtility_IsSomeRecordingSessionPresentThatDisallowsSystemSounds();
      goto LABEL_10;
    }
    if ([a3 isEqualToString:@"SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlerts"])
    {
      id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
      int IsSuspended = CMSMUtility_SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlerts();
      goto LABEL_10;
    }
    if ([a3 isEqualToString:@"StarkMainAudioIsOwnedByiOSButBorrowedByCar"])
    {
      id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
      uint64_t v17 = [+[MXSessionManager sharedInstance] starkMainAudioIsOwnedByiOSButBorrowedByCar];
      goto LABEL_15;
    }
    if ([a3 isEqualToString:@"SystemHasAudioInputDevice"])
    {
      id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
      int IsSuspended = vaemSystemHasAudioInputDevice();
      goto LABEL_10;
    }
    if ([a3 isEqualToString:@"SystemHasAudioInputDeviceExcludingBluetooth"])
    {
      id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
      int IsSuspended = vaemSystemHasAudioInputDeviceExcludingBluetooth();
      goto LABEL_10;
    }
    if ([a3 isEqualToString:@"SystemIsAnAppleTV"])
    {
      id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
      int IsSuspended = CMSMDeviceState_ItsAnAppleTV();
      goto LABEL_10;
    }
    if ([a3 isEqualToString:@"UplinkMute"])
    {
      if (!MX_FeatureFlags_IsSessionBasedMutingEnabled())
      {
        int v43 = MX_FeatureFlags_IsCallManagementMuteControlEnabled();
        id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
        v44 = +[MXSessionManager sharedInstance];
        if (v43) {
          uint64_t v17 = [(MXSessionManager *)v44 uplinkMuteSetByClient];
        }
        else {
          uint64_t v17 = [(MXSessionManager *)v44 uplinkMute];
        }
        goto LABEL_15;
      }
      v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      MXSimulateCrash((uint64_t)"This is unexpected. Please file a radar to MediaExperience (New Bugs) | All.");
      return -12984;
    }
    if ([a3 isEqualToString:@"VibeIntensity"])
    {
      float v42 = PVMGetVibeIntensityPreference();
    }
    else
    {
      if ([a3 isEqualToString:@"VoicePromptStyle"])
      {
        ScreenType = (NSArray *)CMSMUtility_GetVoicePromptStyle();
        goto LABEL_29;
      }
      if ([a3 isEqualToString:@"RemoteDeviceIDs"])
      {
        ScreenType = [(NSSet *)[(MXSystemController *)self remoteDeviceIDs] allObjects];
        goto LABEL_29;
      }
      if ([a3 isEqualToString:@"WombatEnabled"])
      {
        id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
        uint64_t v17 = [+[MXSessionManager sharedInstance] wombatEnabled];
        goto LABEL_15;
      }
      if (([a3 isEqualToString:@"ActiveAudioRoute"] & 1) != 0
        || [a3 isEqualToString:@"CurrentlyActiveRoute"])
      {
        cmsmUpdateCurrentActiveRoutesInfo();
        ScreenType = (NSArray *)CMSMUtility_GetCurrentRouteTypeAtIndex(0);
        goto LABEL_29;
      }
      if ([a3 isEqualToString:@"ActiveClientPIDsThatHideTheSpeechDetectionDevice"])
      {
        active = (NSArray *)CMSMUtility_CopyActiveClientPIDsThatHideTheSpeechDetectionDevice();
        goto LABEL_18;
      }
      if ([a3 isEqualToString:@"ActiveInputRouteForPlayAndRecordNoBluetooth"])
      {
        CurrentlyAirPlayingVideoStreamsDictionary = vaemCopyActiveInputRouteNamesForRouteConfiguration((NSDictionary *)@"PlayAndRecord", @"Default", 0);
        id v12 = (id)[CurrentlyAirPlayingVideoStreamsDictionary firstObject];
        goto LABEL_6;
      }
      if ([a3 isEqualToString:@"AvailableVirtualAudioDevices"])
      {
        active = (NSArray *)vaemCopyAvailableVADUIDs();
        goto LABEL_18;
      }
      if ([a3 isEqualToString:@"CallScreeningStatus"])
      {
        id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
        int IsSuspended = vaemGetCallScreeningStatus();
        goto LABEL_10;
      }
      if ([a3 isEqualToString:@"ContinuityScreenOutputPortAvailable"])
      {
        if (MX_FeatureFlags_IsOnenessEnabled()) {
          BOOL IsContinuityScreenOutputPortPresentInConnectedOutputPorts = vaemIsContinuityScreenOutputPortPresentInConnectedOutputPorts();
        }
        else {
          BOOL IsContinuityScreenOutputPortPresentInConnectedOutputPorts = 0;
        }
        id v18 = objc_alloc(MEMORY[0x1E4F28ED0]);
        BOOL v16 = IsContinuityScreenOutputPortPresentInConnectedOutputPorts;
        goto LABEL_17;
      }
      if ([a3 isEqualToString:@"CurrentPhoneCallIsRoutedViaCarBT"])
      {
        active = (NSArray *)CMSMUtility_CopyCurrentPhoneCallIsRoutedViaCarBT();
        goto LABEL_18;
      }
      if ([a3 isEqualToString:@"CurrentPlayingSessionIsRoutedViaCarBT"])
      {
        active = (NSArray *)CMSMUtility_CopyCurrentPlayingSessionIsRoutedViaCarBT();
        goto LABEL_18;
      }
      if ([a3 isEqualToString:@"CurrentPrimaryAppDisplayID"])
      {
        active = (NSArray *)MX_FrontBoardServcies_CopyPrimaryAppDisplayID();
        goto LABEL_18;
      }
      if ([a3 isEqualToString:@"CurrentRouteHasVolumeControl"])
      {
        active = (NSArray *)CMSMUtility_CopyCurrentRouteHasVolumeControl();
        goto LABEL_18;
      }
      if ([a3 isEqualToString:@"DownlinkMute"])
      {
        id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
        int IsSuspended = vaemGetDownlinkMute();
        goto LABEL_10;
      }
      if ([a3 isEqualToString:@"FullMute"])
      {
        id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
        int IsSuspended = vaemGetFullMute();
        goto LABEL_10;
      }
      if (![a3 isEqualToString:@"HeadphoneVolumeLimit"])
      {
        if ([a3 isEqualToString:@"PickableRoutes"])
        {
          CurrentlyAirPlayingVideoStreamsDictionary = CMSMUtility_CopyPickableRoutes();
          id v12 = (id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:CurrentlyAirPlayingVideoStreamsDictionary copyItems:1];
          goto LABEL_6;
        }
        if ([a3 isEqualToString:@"PickedRoute"])
        {
          active = (NSArray *)cmsmDeepCopyPickedRoute();
          goto LABEL_18;
        }
        if ([a3 isEqualToString:@"SpeechDetectionDevicePresent"])
        {
          id v14 = objc_alloc(MEMORY[0x1E4F28ED0]);
          int IsSuspended = vaemSpeechDetectionVADExists();
          goto LABEL_10;
        }
        if ([a3 isEqualToString:@"ThermalControlInfo"])
        {
          active = (NSArray *)vaemCopyThermalControlInfo();
          goto LABEL_18;
        }
        if ([a3 isEqualToString:@"ThermalGainAdjustment_Haptics"])
        {
          active = (NSArray *)vaemCopyThermalGainAdjustment_Haptics();
          goto LABEL_18;
        }
        if ([a3 isEqualToString:@"ThermalGainAdjustment_Speaker"])
        {
          active = (NSArray *)vaemCopyThermalGainAdjustment_Speaker();
          goto LABEL_18;
        }
        if ([a3 isEqualToString:@"TopOfNowPlayingAppStackDisplayID"])
        {
          active = [+[MXNowPlayingAppManager sharedInstance] copyTopOfNowPlayingAppStack];
          goto LABEL_18;
        }
        return -12984;
      }
      float v42 = PVMGetVolumeLimit();
    }
    float v32 = v42;
LABEL_83:
    id v34 = objc_alloc(MEMORY[0x1E4F28ED0]);
    *(float *)&double v35 = v32;
    goto LABEL_84;
  }
  if (MX_FeatureFlags_IsMaxSpeakerVolumeLimitEnabled())
  {
    float v32 = PVMGetMaxVolumeLimitForBuiltInSpeaker();
    if (dword_1E9359E48)
    {
      long long v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    goto LABEL_83;
  }
  id v36 = objc_alloc(MEMORY[0x1E4F28ED0]);
  LODWORD(v37) = -1.0;
  *(void *)a4 = [v36 initWithFloat:v37];
  return -15687;
}

+ (int)getPIDToInheritAppStateFromForPID:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  +[MXSystemController mxSystemControllerListBeginIteration];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = (void *)gMXSystemControllerList;
  uint64_t v5 = [(id)gMXSystemControllerList countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (v9
          && [*(id *)(*((void *)&v12 + 1) + 8 * i) clientPID] == a3
          && [v9 pidToInheritAppStateFrom])
        {
          int v10 = [v9 pidToInheritAppStateFrom];
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  int v10 = 0;
LABEL_13:
  +[MXSystemController mxSystemControllerListEndIteration];
  return v10;
}

+ (int)getPIDForAnyAppThatWantsVolumeChanges
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  +[MXSystemController mxSystemControllerListBeginIteration];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = (void *)gMXSystemControllerList;
  uint64_t v3 = [(id)gMXSystemControllerList countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (v7 && [*(id *)(*((void *)&v10 + 1) + 8 * i) appWantsVolumeChanges])
        {
          int v8 = [v7 clientPID];
          goto LABEL_12;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  int v8 = 0;
LABEL_12:
  +[MXSystemController mxSystemControllerListEndIteration];
  return v8;
}

- (BOOL)appWantsVolumeChanges
{
  return self->_appWantsVolumeChanges;
}

+ (void)notifyAll:(id)a3 payload:(id)a4 dontPostIfSuspended:(BOOL)a5 remoteDeviceID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  long long v12 = MXGetNotificationSenderQueue();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__MXSystemController_InternalUse__notifyAll_payload_dontPostIfSuspended_remoteDeviceID___block_invoke;
  v13[3] = &unk_1E57C8F20;
  v13[4] = a6;
  v13[5] = a3;
  BOOL v14 = a5;
  v13[6] = a4;
  MXDispatchAsync((uint64_t)"+[MXSystemController(InternalUse) notifyAll:payload:dontPostIfSuspended:remoteDeviceID:]", (uint64_t)"MXSystemController_Embedded.m", 2947, 0, 0, v12, (uint64_t)v13);
}

+ (void)notifyAll:(id)a3 payload:(id)a4 dontPostIfSuspended:(BOOL)a5
{
}

uint64_t __55__MXSystemController_copyAttributeForKey_withValueOut___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) copyAttributeForKeyInternal:*(void *)(a1 + 40) withValueOut:*(void *)(a1 + 56)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __223__MXSystemController_performVolumeOperation_volume_category_mode_routeName_routeDeviceIdentifier_routeSubtype_rampUpDuration_rampDownDuration_outVolume_outSequenceNumber_outMuted_outCategoryCopy_outModeCopy_retainFullMute___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 132);
  LODWORD(a3) = *(_DWORD *)(a1 + 136);
  LODWORD(a4) = *(_DWORD *)(a1 + 140);
  LOBYTE(v6) = *(unsigned char *)(a1 + 144);
  uint64_t result = [*(id *)(a1 + 32) _performVolumeOperation:*(unsigned int *)(a1 + 128) volume:*(void *)(a1 + 40) category:*(void *)(a1 + 48) mode:*(void *)(a1 + 56) routeName:*(void *)(a1 + 64) routeDeviceIdentifier:*(void *)(a1 + 72) routeSubtype:a2 rampUpDuration:a3 rampDownDuration:a4 outVolume:*(void *)(a1 + 88) outSequenceNumber:*(void *)(a1 + 96) outMuted:*(void *)(a1 + 104) outCategoryCopy:*(void *)(a1 + 112) outModeCopy:*(void *)(a1 + 120) retainFullMute:v6];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = result;
  return result;
}

- (int)_performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 rampUpDuration:(float)a10 rampDownDuration:(float)a11 outVolume:(float *)a12 outSequenceNumber:(int64_t *)a13 outMuted:(BOOL *)a14 outCategoryCopy:(id *)a15 outModeCopy:(id *)a16 retainFullMute:(BOOL)a17
{
  +[MXInitialization waitUntilMXIsFullyInitialized];
  if (a10 < 0.0 || a11 < 0.0) {
    return -12981;
  }
  id v28 = a9;
  int v25 = a11 > 0.0 && a10 > 0.0;
  uint64_t v26 = [(MXSystemController *)self clientPID];
  return MXSMPerformVolumeOperation(a3, (__CFString *)a5, a7, a8, v29, v25, v26, a12, a4, a10, a11, a14, (CFTypeRef *)a15, a13, 0, a17);
}

uint64_t __50__MXSystemController_setAttributeForKey_andValue___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setAttributeForKeyInternal:*(void *)(a1 + 40) andValue:*(void *)(a1 + 56)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int)setAttributeForKey:(id)a3 andValue:(const void *)a4
{
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  uint64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  +[MXInitialization waitUntilMXIsFullyInitialized];
  if (+[MXSystemController isNonSerializedSetProperty:a3])
  {
    int v8 = [(MXSystemController *)self setAttributeForKeyInternal:a3 andValue:a4];
    *((_DWORD *)v14 + 6) = v8;
  }
  else
  {
    v9 = MXGetSerialQueue();
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__MXSystemController_setAttributeForKey_andValue___block_invoke;
    v12[3] = &unk_1E57C5808;
    v12[4] = self;
    v12[5] = a3;
    v12[6] = &v13;
    v12[7] = a4;
    MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController setAttributeForKey:andValue:]", (uint64_t)"MXSystemController_Embedded.m", 1227, 0, 0, v9, (uint64_t)v12);
  }
  -[MXAudioStatistics sendSinglePerformanceMessageForRoutine:operationTime:details:](+[MXAudioStatistics sharedInstance](MXAudioStatistics, "sharedInstance"), "sendSinglePerformanceMessageForRoutine:operationTime:details:", "-[MXSystemController setAttributeForKey:andValue:]", FigGetUpTimeNanoseconds() - UpTimeNanoseconds, a3);
  int v10 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v10;
}

+ (BOOL)isNonSerializedSetProperty:(id)a3
{
  return [(id)gMXSystemControllerNonSerializedSetProperties containsObject:a3];
}

- (int)performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 rampUpDuration:(float)a10 rampDownDuration:(float)a11 outVolume:(float *)a12 outSequenceNumber:(int64_t *)a13 outMuted:(BOOL *)a14 outCategoryCopy:(id *)a15 outModeCopy:(id *)a16 retainFullMute:(BOOL)a17
{
  +[MXInitialization waitUntilMXIsFullyInitialized];
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x2020000000;
  int v38 = 0;
  long long v27 = MXGetSerialQueue();
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __223__MXSystemController_performVolumeOperation_volume_category_mode_routeName_routeDeviceIdentifier_routeSubtype_rampUpDuration_rampDownDuration_outVolume_outSequenceNumber_outMuted_outCategoryCopy_outModeCopy_retainFullMute___block_invoke;
  v29[3] = &unk_1E57C8EA8;
  unsigned int v30 = a3;
  v29[4] = self;
  v29[5] = a5;
  v29[6] = a6;
  v29[7] = a7;
  v29[8] = a8;
  v29[9] = a9;
  float v31 = a4;
  float v32 = a10;
  float v33 = a11;
  v29[10] = &v35;
  v29[11] = a12;
  v29[12] = a13;
  v29[13] = a14;
  v29[14] = a15;
  v29[15] = a16;
  BOOL v34 = a17;
  MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController performVolumeOperation:volume:category:mode:routeName:routeDeviceIdentifier:routeSubtype:rampUpDuration:rampDownDuration:outVolume:outSequenceNumber:outMuted:outCategoryCopy:outModeCopy:retainFullMute:]", (uint64_t)"MXSystemController_Embedded.m", 738, 0, 0, v27, (uint64_t)v29);
  LODWORD(a9) = *((_DWORD *)v36 + 6);
  _Block_object_dispose(&v35, 8);
  return (int)a9;
}

- (MXSystemController)initWithPID:(int)a3
{
  return [(MXSystemController *)self initWithPID:*(void *)&a3 remoteDeviceID:0];
}

- (MXSystemController)initWithPID:(int)a3 remoteDeviceID:(id)a4
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3052000000;
  uint64_t v17 = __Block_byref_object_copy__3;
  id v18 = __Block_byref_object_dispose__3;
  uint64_t v19 = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  int v8 = __49__MXSystemController_initWithPID_remoteDeviceID___block_invoke;
  v9 = &unk_1E57C8E08;
  id v11 = a4;
  long long v12 = &v14;
  int v13 = a3;
  int v10 = self;
  if (MX_FeatureFlags_IsOffloadACQEnabled())
  {
    v8((uint64_t)v7);
  }
  else
  {
    uint64_t v4 = MXGetSerialQueue();
    MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController initWithPID:remoteDeviceID:]", (uint64_t)"MXSystemController_Embedded.m", 284, 0, 0, v4, (uint64_t)v7);
  }
  uint64_t v5 = (MXSystemController *)v15[5];
  _Block_object_dispose(&v14, 8);
  return v5;
}

void __49__MXSystemController_initWithPID_remoteDeviceID___block_invoke(uint64_t a1)
{
  v12.receiver = *(id *)(a1 + 32);
  v12.super_class = (Class)MXSystemController;
  id v2 = objc_msgSendSuper2(&v12, sel_init);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v2;
  if (v2)
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 20) = *(_DWORD *)(a1 + 56);
    *(unsigned char *)(*(void *)(a1 + 32) + 10) = 0;
    *(void *)(*(void *)(a1 + 32) + 56) = 0;
    *(void *)(*(void *)(a1 + 32) + 64) = 0;
    int v3 = *(_DWORD *)(a1 + 56);
    *(unsigned char *)(*(void *)(a1 + 32) + 12) = v3 == getpid();
    int v4 = *(_DWORD *)(a1 + 56);
    *(unsigned char *)(*(void *)(a1 + 32) + 13) = v4 == getpid();
    int v5 = *(_DWORD *)(a1 + 56);
    *(unsigned char *)(*(void *)(a1 + 32) + 14) = v5 == getpid();
    int v6 = *(_DWORD *)(a1 + 56);
    *(unsigned char *)(*(void *)(a1 + 32) + 15) = v6 == getpid();
    *(void *)(*(void *)(a1 + 32) + 80) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_initWeak(&location, *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    uint64_t v7 = *(void **)(a1 + 40);
    if (v7) {
      *(void *)(*(void *)(a1 + 32) + 88) = v7;
    }
    +[MXSystemController mxSystemControllerListAddInstance:objc_loadWeak(&location) isSidekick:v7 != 0];
    id v8 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v9 = MXGetSerialQueue();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__MXSystemController_initWithPID_remoteDeviceID___block_invoke_2;
    v10[3] = &unk_1E57C5B30;
    v10[4] = *(void *)(a1 + 48);
    MXDispatchAsync((uint64_t)"-[MXSystemController initWithPID:remoteDeviceID:]_block_invoke", (uint64_t)"MXSystemController_Embedded.m", 269, 0, 0, v9, (uint64_t)v10);
    objc_destroyWeak(&location);
  }
}

+ (void)mxSystemControllerListAddInstance:(id)a3 isSidekick:(BOOL)a4
{
  BOOL v4 = a4;
  objc_initWeak(&location, a3);
  dispatch_semaphore_wait((dispatch_semaphore_t)gMXSystemControllerListWriteSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (v4)
  {
    int v5 = &gSidekickMXSystemControllerList;
    [(id)gSidekickMXSystemControllerList addPointer:objc_loadWeak(&location)];
  }
  else
  {
    int v5 = &gMXSystemControllerList;
    [(id)gMXSystemControllerList addPointer:objc_loadWeak(&location)];
  }
  [(id)*v5 compact];
  dispatch_semaphore_signal((dispatch_semaphore_t)gMXSystemControllerListWriteSemaphore);
  objc_destroyWeak(&location);
}

- (int)setAttributeForKeyInternal:(id)a3 andValue:(const void *)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"AirPlayScreenSuspended"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int refreshed = [(id)a4 BOOLValue];
      id v8 = [+[MXSessionManager sharedInstance] systemMirroringRoutingContextUUID];
      if (refreshed)
      {
        FigRoutingManagerSuspendCurrentEndpointScreen((uint64_t)v8);
        return 0;
      }
      FigRoutingManagerResumeCurrentEndpointScreen((uint64_t)v8);
      return refreshed;
    }
    goto LABEL_194;
  }
  if ([a3 isEqualToString:@"AllowAppToFadeInTemporarily"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (MX_FeatureFlags_IsHandoffEnabled())
      {
        [+[MXSessionManager sharedInstance] setAppAllowedToFadeInTemporarily:a4];
        cmsmStartAllowedToFadeInTemporarilyTimer();
      }
      return 0;
    }
LABEL_194:
    return FigSignalErrorAt();
  }
  if ([a3 isEqualToString:@"AllowAppToInitiatePlaybackTemporarily"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [+[MXSessionManager sharedInstance] setAppAllowedToInitiatePlaybackTemporarily:a4];
      cmsmStartAllowedToInitiatePlaybackTemporarilyTimer();
      return 0;
    }
    goto LABEL_194;
  }
  if ([a3 isEqualToString:@"AllowAppToInitiateRecordingTemporarily"])
  {
    if ([(MXSystemController *)self hasEntitlementToInitiateRecordingTemporarily])
    {
      if (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        [+[MXSessionManager sharedInstance] setAppAllowedToInitiateRecordingTemporarily:a4];
        return 0;
      }
    }
    goto LABEL_194;
  }
  if ([a3 isEqualToString:@"AppWantsVolumeChanges"])
  {
    -[MXSystemController setAppWantsVolumeChanges:](self, "setAppWantsVolumeChanges:", [(id)a4 BOOLValue]);
    return 0;
  }
  if ([a3 isEqualToString:@"CarSpeechStateChanged"])
  {
    if (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if ([(id)a4 BOOLValue]) {
        CMSMNotificationUtility_PostVoicePromptStyleDidChange();
      }
      return 0;
    }
    goto LABEL_194;
  }
  if ([a3 isEqualToString:@"ClientAuditToken"])
  {
    if (a4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(MXSystemController *)self setAuditToken:a4];
        *(void *)&long long v10 = -1;
        *((void *)&v10 + 1) = -1;
        *(_OWORD *)valuePtr[0].val = v10;
        *(_OWORD *)&valuePtr[0].val[4] = v10;
        [(id)a4 getBytes:valuePtr length:32];
        CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        audit_token_t token = valuePtr[0];
        objc_super v12 = SecTaskCreateWithAuditToken(v11, &token);
        CFStringRef v13 = SecTaskCopySigningIdentifier(v12, 0);
        [(MXSystemController *)self setBundleID:v13];
        [(MXSystemController *)self setHasEntitlementForPIDInheritance:0];
        uint64_t v14 = (void *)SecTaskCopyValueForEntitlement(v12, @"com.apple.UIKit.vends-view-services", 0);
        if (([v14 BOOLValue] & 1) != 0
          || (v14,
              uint64_t v14 = (void *)SecTaskCopyValueForEntitlement(v12, @"com.apple.private.coremedia.pidinheritance.allow", 0), [v14 BOOLValue]))
        {
          [(MXSystemController *)self setHasEntitlementForPIDInheritance:1];
        }

        int v15 = [(MXSystemController *)self clientPID];
        if (v15 != getpid())
        {
          uint64_t v16 = (void *)SecTaskCopyValueForEntitlement(v12, @"com.apple.private.mediaexperience.allowwombatenabled", 0);
          -[MXSystemController setHasEntitlementToEnableWombat:](self, "setHasEntitlementToEnableWombat:", [v16 BOOLValue]);

          uint64_t v17 = (void *)SecTaskCopyValueForEntitlement(v12, @"com.apple.private.mediaexperience.setsilentmode.allow", 0);
          -[MXSystemController setHasEntitlementToSetSilentMode:](self, "setHasEntitlementToSetSilentMode:", [v17 BOOLValue]);

          id v18 = (void *)SecTaskCopyValueForEntitlement(v12, @"com.apple.private.mediaexperience.silentmodenotifications.allow", 0);
          -[MXSystemController setHasEntitlementForSilentModeNotifications:](self, "setHasEntitlementForSilentModeNotifications:", [v18 BOOLValue]);

          uint64_t v19 = (void *)SecTaskCopyValueForEntitlement(v12, @"com.apple.private.mediaexperience.allowvoiprecording", 0);
          -[MXSystemController setHasEntitlementToInitiateRecordingTemporarily:](self, "setHasEntitlementToInitiateRecordingTemporarily:", [v19 BOOLValue]);

          if (![(MXSystemController *)self hasEntitlementToInitiateRecordingTemporarily])
          {
            uint64_t v20 = (void *)SecTaskCopyValueForEntitlement(v12, @"com.apple.private.mediaexperience.allowrecordingtemporarily", 0);
            -[MXSystemController setHasEntitlementToInitiateRecordingTemporarily:](self, "setHasEntitlementToInitiateRecordingTemporarily:", [v20 BOOLValue]);
          }
          id v21 = (void *)SecTaskCopyValueForEntitlement(v12, @"com.apple.private.mediaexperience.clearmutestatecache.allow", 0);
          -[MXSystemController setHasEntitlementToClearCacheForFirstPartyPhoneCalls:](self, "setHasEntitlementToClearCacheForFirstPartyPhoneCalls:", [v21 BOOLValue]);

          if (MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled())
          {
            int v22 = (void *)SecTaskCopyValueForEntitlement(v12, @"com.apple.private.mediaexperience.relativevoiceovervolume.allow", 0);
            [(MXSystemController *)self setHasEntitlementToSetRelativeVoiceOverVolume:v22 != 0];
          }
          uint64_t v23 = (void *)SecTaskCopyValueForEntitlement(v12, @"com.apple.private.mediaexperience.systemcontroller.allowappstoinitiateplayback", 0);
          -[MXSystemController setHasEntitlementToAllowAppsToInitiatePlayback:](self, "setHasEntitlementToAllowAppsToInitiatePlayback:", [v23 BOOLValue]);
        }
        if (v12) {
          CFRelease(v12);
        }
        if (v13) {
          CFRelease(v13);
        }
        return 0;
      }
    }
    goto LABEL_194;
  }
  if ([a3 isEqualToString:@"NowPlayingAppShouldResumeForCarPlay"])
  {
    if (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[MXSessionManager nowPlayingAppShouldResumeForCarPlay:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "nowPlayingAppShouldResumeForCarPlay:", [(id)a4 BOOLValue]);
      return 0;
    }
    goto LABEL_194;
  }
  if ([a3 isEqualToString:@"PostInterruptionEndedNotification"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_194;
    }
    uint64_t v24 = objc_msgSend((id)objc_msgSend((id)a4, "objectForKey:", @"AudioSessionID"), "unsignedIntValue");
    int v25 = objc_msgSend((id)objc_msgSend((id)a4, "objectForKey:", @"IsResumable"), "BOOLValue");
    if (dword_1E9359E48)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return CMSMUtility_PostInterruptionEndedNotificationForAudioSessionID(v24, v25);
  }
  if ([a3 isEqualToString:@"StarkMainAudioIsOwnedByiOSButBorrowedByCar"])
  {
    if (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[MXSessionManager setStarkMainAudioIsOwnedByiOSButBorrowedByCar:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "setStarkMainAudioIsOwnedByiOSButBorrowedByCar:", [(id)a4 BOOLValue]);
      return 0;
    }
    goto LABEL_194;
  }
  if ([a3 isEqualToString:@"SubscribeToNotifications"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithDictionary:", -[MXSystemController notificationsSubscribedTo](self, "notificationsSubscribedTo"));
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      uint64_t v28 = [(id)a4 countByEnumeratingWithState:&v80 objects:v87 count:16];
      if (!v28) {
        goto LABEL_76;
      }
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v81;
      uint64_t v78 = *(void *)v81;
      while (1)
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v81 != v30) {
            objc_enumerationMutation((id)a4);
          }
          float v32 = *(void **)(*((void *)&v80 + 1) + 8 * i);
          if (!objc_msgSend(v32, "isEqualToString:", @"SilentModeEnabledDidChange", p_token, v77)) {
            goto LABEL_66;
          }
          if ([(MXSystemController *)self hasEntitlementForSilentModeNotifications]|| [(MXSystemController *)self hasEntitlementToSetSilentMode])
          {
            objc_msgSend(v27, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", 1), v32);
LABEL_66:
            objc_msgSend(v27, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", 1), v32);
            if ([v32 isEqualToString:@"EffectiveVolumeDidChange"])
            {
              objc_msgSend(v27, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", 1), @"SystemVolumeDidChange");
              objc_msgSend(v27, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", 1), @"UserFullMuteDidChange");
            }
            continue;
          }
          unsigned int v85 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          float v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v34 = v85;
          if (os_log_type_enabled(v33, type)) {
            unsigned int v35 = v34;
          }
          else {
            unsigned int v35 = v34 & 0xFFFFFFFE;
          }
          if (v35)
          {
            id v36 = [(MXSystemController *)self displayID];
            token.val[0] = 136315394;
            *(void *)&token.val[1] = "-[MXSystemController(InternalUse) setAttributeForKeyInternal:andValue:]";
            LOWORD(token.val[3]) = 2114;
            *(void *)((char *)&token.val[3] + 2) = v36;
            LODWORD(v77) = 22;
            p_audit_token_t token = &token;
            _os_log_send_and_compose_impl();
          }
          uint64_t v30 = v78;
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        uint64_t v29 = [(id)a4 countByEnumeratingWithState:&v80 objects:v87 count:16];
        if (!v29)
        {
LABEL_76:
          -[MXSystemController setNotificationsSubscribedTo:](self, "setNotificationsSubscribedTo:", v27, p_token, v77);

          return 0;
        }
      }
    }
    int refreshed = FigSignalErrorAt();
    if (!dword_1E9359E48) {
      return refreshed;
    }
LABEL_153:
    unsigned int v85 = 0;
    v66 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return refreshed;
  }
  if ([a3 isEqualToString:@"VibeIntensity"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(id)a4 floatValue];
      float v38 = v37;
      if (v37 != PVMGetVibeIntensityPreference())
      {
        if (dword_1E9359E48)
        {
          id v39 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        uint64_t v48 = PVMSetVibeIntensityPreference(v38);
        int refreshed = v48;
        if (!v48) {
          FigRoutingContextUtilities_LogCurrentState(v48, v49);
        }
        return refreshed;
      }
      return 0;
    }
    goto LABEL_194;
  }
  uint64_t v40 = [a3 isEqualToString:@"RemoteDeviceIDs"];
  if (v40)
  {
    if (MX_FeatureFlags_IsAirPlayDaemonEnabled(v40, v41))
    {
      if (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (dword_1E9359E48)
        {
          unsigned int v85 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          float v42 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        uint64_t v50 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:a4];
        [(MXSystemController *)self setRemoteDeviceIDs:v50];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __71__MXSystemController_InternalUse__setAttributeForKeyInternal_andValue___block_invoke;
        block[3] = &unk_1E57C6368;
        block[4] = self;
        if (setAttributeForKeyInternal_andValue__onceToken == -1) {
          return 0;
        }
        dispatch_once(&setAttributeForKeyInternal_andValue__onceToken, block);
        return 0;
      }
    }
    goto LABEL_194;
  }
  if ([a3 isEqualToString:@"AppToInterruptCurrentNowPlayingSession"])
  {
    if (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (dword_1E9359E48)
      {
        v44 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      [+[MXSessionManager sharedInstance] appToInterruptCurrentNowPlayingSession:a4];
      return 0;
    }
    goto LABEL_194;
  }
  if ([a3 isEqualToString:@"AvailableForVoicePrompts"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a4, @"PortNumber");
      if (Value)
      {
        valuePtr[0].val[0] = 0;
        CFNumberGetValue(Value, kCFNumberSInt32Type, valuePtr);
        BOOL v46 = CFDictionaryGetValue((CFDictionaryRef)a4, @"BTDetails_IsAvailableForVoicePrompts") == (const void *)*MEMORY[0x1E4F1CFD0];
        int refreshed = vaeSetPortAvailableForVoicePrompts(valuePtr[0].val[0], v46);
        cmsmUpdatePickableRouteDescriptionLists(1);
        return refreshed;
      }
      return 0;
    }
    goto LABEL_194;
  }
  if ([a3 isEqualToString:@"CallScreeningStatus"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_194;
    }
    int v47 = [(id)a4 BOOLValue];
    return vaemSetCallScreeningStatus(v47);
  }
  if ([a3 isEqualToString:@"CanBeNowPlayingApp"])
  {
    [(MXSystemController *)self applyCanBeNowPlayingApp:a4];
    return 0;
  }
  if ([a3 isEqualToString:@"DownlinkMute"])
  {
    if (a4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_194;
      }
    }
    if (MX_FeatureFlags_IsCallManagementMuteControlEnabled())
    {
      id v51 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      objc_msgSend(v51, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", 1), @"MuteCmd");
      [v51 setObject:a4 forKey:@"MuteValue"];
      int refreshed = CMSMUtility_AudioToolboxServerRefreshMuteState();

      return refreshed;
    }
    int v58 = [(id)a4 BOOLValue];
    return vaemSetDownlinkMute(v58);
  }
  if ([a3 isEqualToString:@"DuckScalarForVoiceOver"])
  {
    if (!MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled()) {
      goto LABEL_194;
    }
    if (![(MXSystemController *)self hasEntitlementToSetRelativeVoiceOverVolume])goto LABEL_194; {
    objc_opt_class();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_194;
    }
    [(id)a4 floatValue];
    int v53 = v52;
    v54 = +[MXSessionManager sharedInstance];
    LODWORD(v55) = v53;
    [(MXSessionManager *)v54 setDuckScalarForVoiceOver:v55];
    return 0;
  }
  if ([a3 isEqualToString:@"FullMute"])
  {
    if (a4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_194;
      }
    }
    int v56 = [(id)a4 BOOLValue];
    if (vaemGetFullMute() != v56)
    {
      if (dword_1E9359E48)
      {
        v57 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return vaemSetFullMute();
    }
    return 0;
  }
  if ([a3 isEqualToString:@"HeadphoneVolumeLimit"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_194;
    }
    [(id)a4 floatValue];
    float v60 = v59;
    uint64_t VolumeSequenceNumber = CMSMUtility_GetVolumeSequenceNumber();
    PVMSetVolumeLimit(VolumeSequenceNumber, v60);
    return 0;
  }
  if ([a3 isEqualToString:@"InterruptAudioSessionIDForHandoff"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_194;
    }
    uint64_t v62 = [(id)a4 unsignedIntValue];
    return CMSMUtility_InterruptAudioSessionIDForHandoff(v62);
  }
  if ([a3 isEqualToString:@"MakeStarkPortRoutableForPhoneCall"])
  {
    if (a4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_194;
      }
    }
    -[MXSessionManager makeStarkPortRoutableForPhoneCall:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "makeStarkPortRoutableForPhoneCall:", [(id)a4 BOOLValue]);
    return 0;
  }
  if ([a3 isEqualToString:@"MakeStarkPortRoutableForPlayingSession"])
  {
    if (a4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_194;
      }
    }
    -[MXSessionManager makeStarkPortRoutableForPlayingSession:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "makeStarkPortRoutableForPlayingSession:", [(id)a4 BOOLValue]);
    return 0;
  }
  if ([a3 isEqualToString:@"MaximumSpeakerVolumeLimit"])
  {
    if (!MX_FeatureFlags_IsMaxSpeakerVolumeLimitEnabled()) {
      goto LABEL_194;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_194;
    }
    [(id)a4 floatValue];
    float v64 = v63;
    int refreshed = PVMSetMaxVolumeLimitForBuiltInSpeaker(v63);
    if (!refreshed)
    {
      *(float *)&double v65 = v64;
      CMSMNotificationUtility_PostMaximumVolumeLimitForBuiltInSpeakerDidChangeIfNeeded(v65);
      return refreshed;
    }
    goto LABEL_153;
  }
  if ([a3 isEqualToString:@"OverrideToPartnerRoute"])
  {
    if (dword_1E9359E48)
    {
      v67 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return CMSMVAUtility_OverrideToPartnerPort();
  }
  if ([a3 isEqualToString:@"PickedRoute"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_194;
    }
    [(MXSystemController *)self displayID];
    return cmsmActivateEndpointFromRouteDescription((const __CFDictionary *)a4);
  }
  if ([a3 isEqualToString:@"PickedRouteWithPassword"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_194;
    }
    [(id)a4 valueForKey:@"RouteName"];
    if (dword_1E9359E48)
    {
      v68 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend((id)objc_msgSend((id)a4, "valueForKey:", @"AVAudioRouteName", p_token, v77), "isEqualToString:", @"AirTunes");
    [(MXSystemController *)self displayID];
    return cmsmActivateEndpointFromRouteDescription((const __CFDictionary *)a4);
  }
  if ([a3 isEqualToString:@"PIDToInheritApplicationStateFrom"])
  {
    [(MXSystemController *)self applyPIDToInheritAppStateFrom:a4];
    return 0;
  }
  if ([a3 isEqualToString:@"PopNowPlayingAppStack"])
  {
    if (!MX_FeatureFlags_IsNowPlayingAppStackEnabled()) {
      goto LABEL_194;
    }
    +[MXNowPlayingAppManager processNowPlayingAppPIDChangeIfNeeded:](MXNowPlayingAppManager, "processNowPlayingAppPIDChangeIfNeeded:", [+[MXNowPlayingAppManager sharedInstance] resetNowPlayingAppIfNeeded:7 allowedToBeNowPlaying:0 canBeNowPlayingApp:0]);
    return 0;
  }
  if ([a3 isEqualToString:@"RouteAwayFromAirPlay"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (dword_1E9359E48)
      {
        v69 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      CMSMAP_DisconnectAllAirPlaySessions(1);
      return 0;
    }
    goto LABEL_194;
  }
  if ([a3 isEqualToString:@"ThermalControlInfo"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_194;
    }
    return vaemSetThermalControlInfo((uint64_t)a4);
  }
  if ([a3 isEqualToString:@"ThermalGainAdjustment_Haptics"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_194;
    }
    [a3 floatValue];
    vaemUpdateHapticsThermalGainAdjustment(v70);
    return 0;
  }
  if ([a3 isEqualToString:@"ThermalGainAdjustment_Speaker"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_194;
    }
    [a3 floatValue];
    vaemUpdateSpeakerThermalGainAdjustment(v71);
    return 0;
  }
  if (![a3 isEqualToString:@"UplinkMute"])
  {
    if ([a3 isEqualToString:@"WombatEnabled"])
    {
      if (![(MXSystemController *)self hasEntitlementToEnableWombat]) {
        goto LABEL_194;
      }
      -[MXSessionManager setWombatEnabled:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "setWombatEnabled:", [(id)a4 BOOLValue]);
    }
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_194;
  }
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    v72 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    MXSimulateCrash((uint64_t)"This is unexpected. Please file a radar to MediaExperience (New Bugs) | All.");
    return -12984;
  }
  if (MX_FeatureFlags_IsCallManagementMuteControlEnabled())
  {
    v73 = +[MXSessionManager sharedInstance];
    *(void *)&long long v74 = -1;
    *((void *)&v74 + 1) = -1;
    *(_OWORD *)valuePtr[0].val = v74;
    *(_OWORD *)&valuePtr[0].val[4] = v74;
    return [(MXSessionManager *)v73 updateMuteState:valuePtr muteValue:a4];
  }
  int v75 = [(id)a4 BOOLValue];
  return vaemSetUplinkMute(v75);
}

- (void)setNotificationsSubscribedTo:(id)a3
{
}

- (void)setHasEntitlementToInitiateRecordingTemporarily:(BOOL)a3
{
  self->_hasEntitlementToInitiateRecordingTemporarily = a3;
}

- (void)setHasEntitlementForPIDInheritance:(BOOL)a3
{
  self->_hasEntitlementForPIDInheritance = a3;
}

- (void)setHasEntitlementToSetSilentMode:(BOOL)a3
{
  self->_hasEntitlementToSetSilentMode = a3;
}

- (void)setHasEntitlementToSetRelativeVoiceOverVolume:(BOOL)a3
{
  self->_hasEntitlementToSetRelativeVoiceOverVolume = a3;
}

- (void)setHasEntitlementToEnableWombat:(BOOL)a3
{
  self->_hasEntitlementToEnableWombat = a3;
}

- (void)setHasEntitlementToClearCacheForFirstPartyPhoneCalls:(BOOL)a3
{
  self->_hasEntitlementToClearCacheForFirstPartyPhoneCalls = a3;
}

- (void)setHasEntitlementToAllowAppsToInitiatePlayback:(BOOL)a3
{
  self->_hasEntitlementToAllowAppsToInitiatePlayback = a3;
}

- (void)setHasEntitlementForSilentModeNotifications:(BOOL)a3
{
  self->_hasEntitlementForSilentModeNotifications = a3;
}

- (void)setBundleID:(id)a3
{
}

- (void)setAuditToken:(id)a3
{
}

- (BOOL)hasEntitlementToInitiateRecordingTemporarily
{
  return self->_hasEntitlementToInitiateRecordingTemporarily;
}

- (void)applyCanBeNowPlayingApp:(const void *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && !CMSMUtility_FetchUIShouldIgnoreRemoteControlEvents([(MXSystemController *)self clientPID]))
  {
    int v5 = [(MXSystemController *)self canBeNowPlayingApp];
    if (v5 != [(id)a3 BOOLValue])
    {
      -[MXSystemController setCanBeNowPlayingApp:](self, "setCanBeNowPlayingApp:", [(id)a3 BOOLValue]);
      if (dword_1E9359E48)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      [+[MXNowPlayingAppManager sharedInstance] updateNowPlayingApp:[(MXSystemController *)self clientPID] session:0 reasonForUpdate:4];
      CMSMUtility_UpdateRoutingContextForSessionsWithPID([(MXSystemController *)self clientPID]);
      [+[MXSessionManager sharedInstance] updateSupportedOutputChannelLayouts];
    }
  }
}

- (id)info
{
  if ([(MXSystemController *)self remoteDeviceID]) {
    return (id)[NSString stringWithFormat:@"<MXSystemController: %@ PID=%d RemoteDeviceID=%@, listOfNotificationSubscriptions=%@>", -[MXSystemController displayID](self, "displayID"), -[MXSystemController clientPID](self, "clientPID"), -[MXSystemController remoteDeviceID](self, "remoteDeviceID"), -[MXSystemController notificationsSubscribedTo](self, "notificationsSubscribedTo"), v11, v12];
  }
  if (MX_FeatureFlags_IsAirPlayDaemonEnabled(0, v3)
    && [(MXSystemController *)self remoteDeviceIDs])
  {
    return (id)[NSString stringWithFormat:@"<MXSystemController: %@ PID=%d RemoteDeviceIDs=%@, listOfNotificationSubscriptions=%@>", -[MXSystemController displayID](self, "displayID"), -[MXSystemController clientPID](self, "clientPID"), -[MXSystemController remoteDeviceIDs](self, "remoteDeviceIDs"), -[MXSystemController notificationsSubscribedTo](self, "notificationsSubscribedTo"), v11, v12];
  }
  int v5 = NSString;
  int v6 = [(MXSystemController *)self displayID];
  uint64_t v7 = [(MXSystemController *)self clientPID];
  uint64_t v8 = [(MXSystemController *)self pidToInheritAppStateFrom];
  if ([(MXSystemController *)self appWantsVolumeChanges]) {
    uint64_t v9 = "YES";
  }
  else {
    uint64_t v9 = "NO";
  }
  if ([(MXSystemController *)self hasEntitlementToEnableWombat]) {
    long long v10 = @"YES";
  }
  else {
    long long v10 = @"NO";
  }
  return (id)[v5 stringWithFormat:@"<MXSystemController: %@ PID=%d InheritingFrom=%d wantsVolumeChanges=%s hasEntitlementToEnableWombat=%@, listOfNotificationSubscriptions=%@>", v6, v7, v8, v9, v10, -[MXSystemController notificationsSubscribedTo](self, "notificationsSubscribedTo")];
}

- (int)pidToInheritAppStateFrom
{
  return self->_pidToInheritAppStateFrom;
}

- (void)setCanBeNowPlayingApp:(BOOL)a3
{
  self->_canBeNowPlayingApp = a3;
}

- (NSSet)remoteDeviceIDs
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)remoteDeviceID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)hasEntitlementToEnableWombat
{
  return self->_hasEntitlementToEnableWombat;
}

- (NSString)displayID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

+ (void)initialize
{
  if (self == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
    if ((dword_1E9359E48 & 0x100) != 0) {
      dword_1E9359E48 = 0;
    }
    MXSystemControllerSetup();
    gMXSystemControllerNonSerializedCopyProperties = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"ActiveNeroVisualStreamInfo", @"ActivePhoneCallInfo", @"AirPlayScreenSuspended", @"AppWantsVolumeChanges", @"CanBeNowPlayingApp", @"CarPlayAuxStreamSupport", @"CarPlayIsConnected", @"CarPlayIsPlayingLongerDurationSession", @"CarPlaySupportsMixableSiri", @"ExternalScreenType", @"CurrentlyActiveCategory", @"CurrentlyActiveMode", @"CurrentVideoStreams", @"DeviceSupportsPiP", @"HeadphoneJackHasInput", @"HeadphoneJackIsConnected", @"HighestArbitrationPriorityForTipi",
                                                       @"iOSWillRequestToBorrowStarkMainAudio",
                                                       @"iOSWillRequestToTakeStarkMainAudio",
                                                       @"IsSomeoneRecording",
                                                       @"LongFormVideoApps",
                                                       @"MaximumSpeakerVolumeLimit",
                                                       @"MinimumAllowedMaximumSpeakerVolumeLimit",
                                                       @"NowPlayingAppDisplayID",
                                                       @"NowPlayingAppIsInterrupted",
                                                       @"NowPlayingAppIsPlaying",
                                                       @"NowPlayingAppPID",
                                                       @"NowPlayingAppShouldResumeForCarPlay",
                                                       @"PhoneCallExists",
                                                       @"PIDToInheritApplicationStateFrom",
                                                       @"PlayingSessionsDescription",
                                                       @"RecommendedMaximumSpeakerVolumeLimit",
                                                       @"RecordingClientPIDs",
                                                       @"RecordingSessionsDescription",
                                                       @"ShouldIgnorePlayCommandsFromAccessory",
                                                       @"SilentModeEnabled",
                                                       @"SomeClientIsPlaying",
                                                       @"SomeClientIsPlayingLongFormAudio",
                                                       @"SomeLongFormVideoClientIsActiveOverAirPlayVideo",
                                                       @"SomeLongFormVideoClientIsPlaying",
                                                       @"SomeLongFormVideoClientIsPlayingOverAirPlayVideo",
                                                       @"SomeRecordingSessionPresentThatDisallowsSystemSounds",
                                                       @"SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlerts",
                                                       @"StarkMainAudioIsOwnedByiOSButBorrowedByCar",
                                                       @"SystemHasAudioInputDevice",
                                                       @"SystemHasAudioInputDeviceExcludingBluetooth",
                                                       @"SystemIsAnAppleTV",
                                                       @"UplinkMute",
                                                       @"VibeIntensity",
                                                       @"VoicePromptStyle",
                                                       @"WombatEnabled",
                                                       @"RemoteDeviceIDs",
                                                       0);
    gMXSystemControllerNonSerializedSetProperties = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"AirPlayScreenSuspended", @"AllowAppToFadeInTemporarily", @"AllowAppToInitiatePlaybackTemporarily", @"AllowAppToInitiateRecordingTemporarily", @"AppWantsVolumeChanges", @"CarSpeechStateChanged", @"ClientAuditToken", @"NowPlayingAppShouldResumeForCarPlay", @"PostInterruptionEndedNotification", @"StarkMainAudioIsOwnedByiOSButBorrowedByCar", @"SubscribeToNotifications", @"VibeIntensity", @"RemoteDeviceIDs", 0);
  }
}

- (void)dealloc
{
  uint64_t v3 = (void *)MEMORY[0x1997179E0](self, a2);
  int clientPID = self->_clientPID;
  +[MXSystemController updateMXSystemControllerList];

  self->_appsAllowedToInitiatePlayback = 0;
  self->_appsAllowedToInitiatePlaybackClientType = 0;

  self->_appsAllowedToInitiatePlaybackTimestamp = 0;
  self->_auditToken = 0;

  self->_bundleID = 0;
  self->_displayID = 0;

  self->_notificationsSubscribedTo = 0;
  self->_remoteDeviceID = 0;

  self->_remoteDeviceID = 0;
  int v5 = MXGetSerialQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __29__MXSystemController_dealloc__block_invoke;
  v7[3] = &__block_descriptor_36_e5_v8__0l;
  int v8 = clientPID;
  MXDispatchAsync((uint64_t)"-[MXSystemController dealloc]", (uint64_t)"MXSystemController_Embedded.m", 338, 0, 0, v5, (uint64_t)v7);
  v6.receiver = self;
  v6.super_class = (Class)MXSystemController;
  [(MXSystemController *)&v6 dealloc];
}

uint64_t __29__MXSystemController_dealloc__block_invoke(uint64_t a1)
{
  id v2 = +[MXNowPlayingAppManager sharedInstance];
  uint64_t v3 = *(unsigned int *)(a1 + 32);
  return [(MXNowPlayingAppManager *)v2 updateNowPlayingApp:v3 session:0 reasonForUpdate:0];
}

- (BOOL)phoneCallExists
{
  id v2 = (void *)MEMORY[0x1997179E0](self, a2);
  BOOL v3 = CMSMUtility_IsPhoneCallActive();
  return v3;
}

- (BOOL)isSomeoneRecording
{
  id v2 = (void *)MEMORY[0x1997179E0](self, a2);
  BOOL v3 = CMSMUtility_IsSomeClientRecording() != 0;
  return v3;
}

- (BOOL)someLongFormVideoClientIsPlaying
{
  id v2 = (void *)MEMORY[0x1997179E0](self, a2);
  BOOL v3 = CMSMUtility_IsAnyLongFormVideoSessionPlaying() != 0;
  return v3;
}

- (BOOL)someLongFormVideoClientIsActiveOverAirPlayVideo
{
  id v2 = (void *)MEMORY[0x1997179E0](self, a2);
  BOOL v3 = CMSMUtility_IsAnyLongFormVideoSessionActiveOverAirPlayVideo() != 0;
  return v3;
}

- (BOOL)someLongFormVideoClientIsPlayingOverAirPlayVideo
{
  id v2 = (void *)MEMORY[0x1997179E0](self, a2);
  BOOL v3 = CMSMUtility_IsAnyLongFormVideoSessionPlayingOverAirPlayVideo() != 0;
  return v3;
}

- (void)volumeCategoryAndMode:(id)a3 mode:(id)a4 outCategoryCopy:(id *)a5 outModeCopy:(id *)a6
{
  +[MXInitialization waitUntilMXIsFullyInitialized];
  CFStringRef v10 = [+[MXSessionManager sharedInstance] getUncustomizedCategory:a3];
  PVMCopyVolumeCategoryAndMode(v10, a4, a5, a6);
}

- (int)toggleInputMute
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  +[MXInitialization waitUntilMXIsFullyInitialized];
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    if (dword_1E9359E48)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    MXSimulateCrash((uint64_t)"This is unexpected. Please file a radar to MediaExperience (New Bugs) | All.");
    return -15685;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    int v13 = 0;
    if (MX_FeatureFlags_IsCallManagementMuteControlEnabled())
    {
      BOOL v3 = MXGetSerialQueue();
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      void v7[2] = __37__MXSystemController_toggleInputMute__block_invoke;
      v7[3] = &unk_1E57C5B30;
      void v7[4] = &v10;
      MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController toggleInputMute]", (uint64_t)"MXSystemController_Embedded.m", 433, 0, 0, v3, (uint64_t)v7);
    }
    else
    {
      *((_DWORD *)v11 + 6) = -15685;
      *(_DWORD *)os_log_type_t type = 0;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
      int v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    int v4 = *((_DWORD *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  return v4;
}

uint64_t __37__MXSystemController_toggleInputMute__block_invoke(uint64_t a1)
{
  id v2 = +[MXSessionManager sharedInstance];
  *(void *)&long long v3 = -1;
  *((void *)&v3 + 1) = -1;
  v5[0] = v3;
  v5[1] = v3;
  uint64_t result = [(MXSessionManager *)v2 updateMuteState:v5 muteValue:0];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (int)setInputMute:(id *)a3 muteValue:(BOOL)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  +[MXInitialization waitUntilMXIsFullyInitialized];
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    if (dword_1E9359E48)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    MXSimulateCrash((uint64_t)"This is unexpected. Please file a radar to MediaExperience (New Bugs) | All.");
    return -15685;
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    int v21 = 0;
    if (MX_FeatureFlags_IsCallManagementMuteControlEnabled())
    {
      uint64_t v7 = MXGetSerialQueue();
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      long long v8 = *(_OWORD *)&a3->var0[4];
      long long v13 = *(_OWORD *)a3->var0;
      v12[2] = __45__MXSystemController_setInputMute_muteValue___block_invoke;
      v12[3] = &unk_1E57C8E30;
      v12[4] = &v18;
      long long v14 = v8;
      BOOL v15 = a4;
      MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController setInputMute:muteValue:]", (uint64_t)"MXSystemController_Embedded.m", 462, 0, 0, v7, (uint64_t)v12);
    }
    else
    {
      *((_DWORD *)v19 + 6) = -15685;
      *(_DWORD *)os_log_type_t type = 0;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      uint64_t v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    int v9 = *((_DWORD *)v19 + 6);
    _Block_object_dispose(&v18, 8);
  }
  return v9;
}

uint64_t __45__MXSystemController_setInputMute_muteValue___block_invoke(uint64_t a1)
{
  id v2 = +[MXSessionManager sharedInstance];
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 72)];
  long long v4 = *(_OWORD *)(a1 + 56);
  v6[0] = *(_OWORD *)(a1 + 40);
  v6[1] = v4;
  uint64_t result = [(MXSessionManager *)v2 updateMuteState:v6 muteValue:v3];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (int)getInputMute:(id *)a3 outMuteValue:(BOOL *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  +[MXInitialization waitUntilMXIsFullyInitialized];
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    if (dword_1E9359E48)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    MXSimulateCrash((uint64_t)"This is unexpected. Please file a radar to MediaExperience (New Bugs) | All.");
    return -15685;
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    int v20 = 0;
    if (MX_FeatureFlags_IsCallManagementMuteControlEnabled())
    {
      uint64_t v7 = MXGetSerialQueue();
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __48__MXSystemController_getInputMute_outMuteValue___block_invoke;
      v12[3] = &unk_1E57C8E58;
      long long v8 = *(_OWORD *)&a3->var0[4];
      long long v13 = *(_OWORD *)a3->var0;
      long long v14 = v8;
      v12[4] = &v17;
      void v12[5] = a4;
      MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController getInputMute:outMuteValue:]", (uint64_t)"MXSystemController_Embedded.m", 490, 0, 0, v7, (uint64_t)v12);
    }
    else
    {
      *((_DWORD *)v18 + 6) = -15685;
      *a4 = 0;
      *(_DWORD *)os_log_type_t type = 0;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint64_t v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    int v9 = *((_DWORD *)v18 + 6);
    _Block_object_dispose(&v17, 8);
  }
  return v9;
}

uint64_t __48__MXSystemController_getInputMute_outMuteValue___block_invoke(uint64_t a1)
{
  id v2 = +[MXSessionManager sharedInstance];
  uint64_t v3 = *(void *)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 64);
  v6[0] = *(_OWORD *)(a1 + 48);
  v6[1] = v4;
  uint64_t result = [(MXSessionManager *)v2 getMuteState:v6 outMuteValue:v3];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (int)clearUplinkMutedCache
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  +[MXInitialization waitUntilMXIsFullyInitialized];
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    if (dword_1E9359E48)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    MXSimulateCrash((uint64_t)"This is unexpected. Please file a radar to MediaExperience (New Bugs) | All.");
    return -15685;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    int v14 = 0;
    if (MX_FeatureFlags_IsCallManagementMuteControlEnabled()
      && [(MXSystemController *)self hasEntitlementToClearCacheForFirstPartyPhoneCalls])
    {
      long long v4 = MXGetSerialQueue();
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __43__MXSystemController_clearUplinkMutedCache__block_invoke;
      v8[3] = &unk_1E57C5B30;
      v8[4] = &v11;
      MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController clearUplinkMutedCache]", (uint64_t)"MXSystemController_Embedded.m", 518, 0, 0, v4, (uint64_t)v8);
    }
    else
    {
      *((_DWORD *)v12 + 6) = -15685;
      *(_DWORD *)os_log_type_t type = 0;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      int v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    int v6 = *((_DWORD *)v12 + 6);
    _Block_object_dispose(&v11, 8);
  }
  return v6;
}

uint64_t __43__MXSystemController_clearUplinkMutedCache__block_invoke(uint64_t a1)
{
  uint64_t result = [+[MXSessionManager sharedInstance] clearUplinkMutedCache];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (int)copySessionIDsWithMuteValue:(id *)a3 muteValue:(BOOL *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *a4 = 0;
    id v6 = [+[MXSessionManager sharedInstance] copyPhoneCallBehaviorRecordingSession];
    if ([v6 prefersBluetoothAccessoryMuting])
    {
      *a4 = [v6 isRecordingMuted] ^ 1;
      uint64_t v7 = +[MXSessionManager sharedInstance];
      if (v6) {
        [v6 auditToken];
      }
      else {
        memset(v38, 0, sizeof(v38));
      }
      id obj = [(MXSessionManager *)v7 copySessionsWithAuditToken:v38];
      if (![obj count] && dword_1E9359E48)
      {
        unsigned int v40 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v11 = v40;
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
          unsigned int v12 = v11;
        }
        else {
          unsigned int v12 = v11 & 0xFFFFFFFE;
        }
        if (v12)
        {
          int v41 = 136315138;
          float v42 = "-[MXSystemController copySessionIDsWithMuteValue:muteValue:]";
          LODWORD(v28) = 12;
          uint64_t v26 = &v41;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      id v30 = v6;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v51, 16, v26, v28);
      uint64_t v15 = v31;
      if (v14)
      {
        uint64_t v16 = v14;
        uint64_t v33 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v35 != v33) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            objc_msgSend(v15, "addObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", objc_msgSend(v18, "audioSessionID", v27, v29)));
            if (dword_1E9359E48)
            {
              unsigned int v40 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              uint64_t v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v20 = v40;
              if (os_log_type_enabled(v19, type)) {
                unsigned int v21 = v20;
              }
              else {
                unsigned int v21 = v20 & 0xFFFFFFFE;
              }
              if (v21)
              {
                uint64_t v22 = [v18 info];
                BOOL v23 = *a4;
                int v24 = [v18 audioSessionID];
                int v41 = 136316162;
                float v42 = "-[MXSystemController copySessionIDsWithMuteValue:muteValue:]";
                __int16 v43 = 2048;
                v44 = v18;
                __int16 v45 = 2114;
                uint64_t v46 = v22;
                __int16 v47 = 1024;
                BOOL v48 = v23;
                uint64_t v15 = v31;
                __int16 v49 = 1024;
                int v50 = v24;
                LODWORD(v29) = 44;
                long long v27 = &v41;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v34 objects:v51 count:16];
        }
        while (v16);
      }
      *a3 = v15;
      [+[MXSessionManager sharedInstance] setAppendContextToMuteNotification:1];

      int v13 = 0;
      id v6 = v30;
    }
    else
    {
      [+[MXSessionManager sharedInstance] updateBluetoothFrameworkToPlayMuteChime:v6 playRejectTone:1];
      if (dword_1E9359E48)
      {
        unsigned int v40 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_type_t v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      int v13 = -15687;
    }
  }
  else
  {
    if (dword_1E9359E48)
    {
      long long v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return -15685;
  }
  return v13;
}

- (int)_performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 rampUpwardDuration:(id)a10 rampDownwardDuration:(id)a11 outVolume:(float *)a12 outSequenceNumber:(int64_t *)a13 outMuted:(BOOL *)a14 outCategoryCopy:(id *)a15 outModeCopy:(id *)a16
{
  +[MXInitialization waitUntilMXIsFullyInitialized];
  [a10 floatValue];
  float v21 = v20;
  [a11 floatValue];
  float v23 = v22;
  [a10 floatValue];
  if (v24 <= 0.0)
  {
    BOOL v26 = 0;
  }
  else
  {
    [a11 floatValue];
    BOOL v26 = v25 > 0.0;
  }
  int result = MXSMPerformVolumeOperation(a3, (__CFString *)a5, a7, a8, (const __CFString *)a9, v26, [(MXSystemController *)self clientPID], a12, a4, v21, v23, a14, (CFTypeRef *)a15, a13, 0, 0);
  if (a16) {
    *a16 = 0;
  }
  return result;
}

- (int)performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 rampUpwardDuration:(id)a10 rampDownwardDuration:(id)a11 outVolume:(float *)a12 outSequenceNumber:(int64_t *)a13 outMuted:(BOOL *)a14 outCategoryCopy:(id *)a15 outModeCopy:(id *)a16
{
  +[MXInitialization waitUntilMXIsFullyInitialized];
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  float v24 = MXGetSerialQueue();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __216__MXSystemController_performVolumeOperation_volume_category_mode_routeName_routeDeviceIdentifier_routeSubtype_rampUpwardDuration_rampDownwardDuration_outVolume_outSequenceNumber_outMuted_outCategoryCopy_outModeCopy___block_invoke;
  v26[3] = &unk_1E57C8E80;
  unsigned int v27 = a3;
  float v28 = a4;
  v26[4] = self;
  v26[5] = a5;
  v26[6] = a6;
  v26[7] = a7;
  v26[8] = a8;
  v26[9] = a9;
  v26[10] = a10;
  v26[11] = a11;
  v26[12] = &v29;
  v26[13] = a12;
  v26[14] = a13;
  v26[15] = a14;
  v26[16] = a15;
  v26[17] = a16;
  MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController performVolumeOperation:volume:category:mode:routeName:routeDeviceIdentifier:routeSubtype:rampUpwardDuration:rampDownwardDuration:outVolume:outSequenceNumber:outMuted:outCategoryCopy:outModeCopy:]", (uint64_t)"MXSystemController_Embedded.m", 652, 0, 0, v24, (uint64_t)v26);
  LODWORD(a9) = *((_DWORD *)v30 + 6);
  _Block_object_dispose(&v29, 8);
  return (int)a9;
}

uint64_t __216__MXSystemController_performVolumeOperation_volume_category_mode_routeName_routeDeviceIdentifier_routeSubtype_rampUpwardDuration_rampDownwardDuration_outVolume_outSequenceNumber_outMuted_outCategoryCopy_outModeCopy___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 148);
  uint64_t result = [*(id *)(a1 + 32) _performVolumeOperation:*(unsigned int *)(a1 + 144) volume:*(void *)(a1 + 40) category:*(void *)(a1 + 48) mode:*(void *)(a1 + 56) routeName:*(void *)(a1 + 64) routeDeviceIdentifier:*(void *)(a1 + 72) routeSubtype:a2 rampUpwardDuration:*(void *)(a1 + 80) rampDownwardDuration:*(void *)(a1 + 88) outVolume:*(void *)(a1 + 104) outSequenceNumber:*(void *)(a1 + 112) outMuted:*(void *)(a1 + 120) outCategoryCopy:*(void *)(a1 + 128) outModeCopy:*(void *)(a1 + 136)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = result;
  return result;
}

- (int)_performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 rampUpDuration:(float)a10 rampDownDuration:(float)a11 outVolume:(float *)a12 outSequenceNumber:(int64_t *)a13 outMuted:(BOOL *)a14 outCategoryCopy:(id *)a15 outModeCopy:(id *)a16
{
  uint64_t v24 = *(void *)&a3;
  +[MXInitialization waitUntilMXIsFullyInitialized];
  if (a10 < 0.0 || a11 < 0.0) {
    return -12981;
  }
  if (a10 == 0.0)
  {
    uint64_t v29 = 0;
  }
  else
  {
    id v27 = objc_alloc(MEMORY[0x1E4F28ED0]);
    *(float *)&double v28 = a10;
    uint64_t v29 = (void *)[v27 initWithFloat:v28];
  }
  if (a11 == 0.0)
  {
    uint64_t v33 = 0;
  }
  else
  {
    id v31 = objc_alloc(MEMORY[0x1E4F28ED0]);
    *(float *)&double v32 = a11;
    uint64_t v33 = (void *)[v31 initWithFloat:v32];
  }
  *(float *)&double v26 = a4;
  int v34 = [(MXSystemController *)self _performVolumeOperation:v24 volume:a5 category:a6 mode:a7 routeName:a8 routeDeviceIdentifier:a9 routeSubtype:v26 rampUpwardDuration:v29 rampDownwardDuration:v33 outVolume:a12 outSequenceNumber:a13 outMuted:a14 outCategoryCopy:a15 outModeCopy:a16];

  return v34;
}

- (int)performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 rampUpDuration:(float)a10 rampDownDuration:(float)a11 outVolume:(float *)a12 outSequenceNumber:(int64_t *)a13 outMuted:(BOOL *)a14 outCategoryCopy:(id *)a15 outModeCopy:(id *)a16
{
  +[MXInitialization waitUntilMXIsFullyInitialized];
  uint64_t v33 = 0;
  int v34 = &v33;
  uint64_t v35 = 0x2020000000;
  int v36 = 0;
  double v26 = MXGetSerialQueue();
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __208__MXSystemController_performVolumeOperation_volume_category_mode_routeName_routeDeviceIdentifier_routeSubtype_rampUpDuration_rampDownDuration_outVolume_outSequenceNumber_outMuted_outCategoryCopy_outModeCopy___block_invoke;
  v28[3] = &unk_1E57C8ED0;
  unsigned int v29 = a3;
  v28[4] = self;
  v28[5] = a5;
  v28[6] = a6;
  v28[7] = a7;
  v28[8] = a8;
  v28[9] = a9;
  float v30 = a4;
  float v31 = a10;
  float v32 = a11;
  v28[10] = &v33;
  v28[11] = a12;
  v28[12] = a13;
  v28[13] = a14;
  v28[14] = a15;
  v28[15] = a16;
  MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController performVolumeOperation:volume:category:mode:routeName:routeDeviceIdentifier:routeSubtype:rampUpDuration:rampDownDuration:outVolume:outSequenceNumber:outMuted:outCategoryCopy:outModeCopy:]", (uint64_t)"MXSystemController_Embedded.m", 837, 0, 0, v26, (uint64_t)v28);
  LODWORD(a9) = *((_DWORD *)v34 + 6);
  _Block_object_dispose(&v33, 8);
  return (int)a9;
}

uint64_t __208__MXSystemController_performVolumeOperation_volume_category_mode_routeName_routeDeviceIdentifier_routeSubtype_rampUpDuration_rampDownDuration_outVolume_outSequenceNumber_outMuted_outCategoryCopy_outModeCopy___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 132);
  LODWORD(a3) = *(_DWORD *)(a1 + 136);
  LODWORD(a4) = *(_DWORD *)(a1 + 140);
  uint64_t result = [*(id *)(a1 + 32) _performVolumeOperation:*(unsigned int *)(a1 + 128) volume:*(void *)(a1 + 40) category:*(void *)(a1 + 48) mode:*(void *)(a1 + 56) routeName:*(void *)(a1 + 64) routeDeviceIdentifier:*(void *)(a1 + 72) routeSubtype:a2 rampUpDuration:a3 rampDownDuration:a4 outVolume:*(void *)(a1 + 88) outSequenceNumber:*(void *)(a1 + 96) outMuted:*(void *)(a1 + 104) outCategoryCopy:*(void *)(a1 + 112) outModeCopy:*(void *)(a1 + 120)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = result;
  return result;
}

- (int)_performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 outVolume:(float *)a10 outSequenceNumber:(int64_t *)a11 outMuted:(BOOL *)a12 outCategoryCopy:(id *)a13 outModeCopy:(id *)a14
{
  +[MXInitialization waitUntilMXIsFullyInitialized];
  int result = MXSMPerformVolumeOperation(a3, (__CFString *)a5, a7, a8, (const __CFString *)a9, 0, [(MXSystemController *)self clientPID], a10, a4, 0.0, 0.0, a12, (CFTypeRef *)a13, a11, 0, 0);
  if (a14) {
    *a14 = 0;
  }
  return result;
}

- (int)performVolumeOperation:(unsigned int)a3 volume:(float)a4 category:(id)a5 mode:(id)a6 routeName:(id)a7 routeDeviceIdentifier:(id)a8 routeSubtype:(id)a9 outVolume:(float *)a10 outSequenceNumber:(int64_t *)a11 outMuted:(BOOL *)a12 outCategoryCopy:(id *)a13 outModeCopy:(id *)a14
{
  +[MXInitialization waitUntilMXIsFullyInitialized];
  uint64_t v27 = 0;
  double v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v30 = 0;
  float v22 = MXGetSerialQueue();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __176__MXSystemController_performVolumeOperation_volume_category_mode_routeName_routeDeviceIdentifier_routeSubtype_outVolume_outSequenceNumber_outMuted_outCategoryCopy_outModeCopy___block_invoke;
  v24[3] = &unk_1E57C8EF8;
  unsigned int v25 = a3;
  float v26 = a4;
  v24[4] = self;
  v24[5] = a5;
  v24[6] = a6;
  v24[7] = a7;
  v24[8] = a8;
  v24[9] = a9;
  v24[10] = &v27;
  v24[11] = a10;
  v24[12] = a11;
  v24[13] = a12;
  v24[14] = a13;
  v24[15] = a14;
  MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController performVolumeOperation:volume:category:mode:routeName:routeDeviceIdentifier:routeSubtype:outVolume:outSequenceNumber:outMuted:outCategoryCopy:outModeCopy:]", (uint64_t)"MXSystemController_Embedded.m", 926, 0, 0, v22, (uint64_t)v24);
  LODWORD(a9) = *((_DWORD *)v28 + 6);
  _Block_object_dispose(&v27, 8);
  return (int)a9;
}

uint64_t __176__MXSystemController_performVolumeOperation_volume_category_mode_routeName_routeDeviceIdentifier_routeSubtype_outVolume_outSequenceNumber_outMuted_outCategoryCopy_outModeCopy___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 132);
  uint64_t result = [*(id *)(a1 + 32) _performVolumeOperation:*(unsigned int *)(a1 + 128) volume:*(void *)(a1 + 40) category:*(void *)(a1 + 48) mode:*(void *)(a1 + 56) routeName:*(void *)(a1 + 64) routeDeviceIdentifier:*(void *)(a1 + 72) routeSubtype:a2 outVolume:*(void *)(a1 + 88) outSequenceNumber:*(void *)(a1 + 96) outMuted:*(void *)(a1 + 104) outCategoryCopy:*(void *)(a1 + 112) outModeCopy:*(void *)(a1 + 120)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = result;
  return result;
}

- (BOOL)someSharePlayCapableCallSessionIsActive
{
  id v2 = (void *)MEMORY[0x1997179E0](self, a2);
  BOOL v3 = CMSMUtility_IsSharePlayCapableCallSessionActive() != 0;
  return v3;
}

- (int)applyPIDToInheritAppStateFrom:(const void *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v5 = [(MXSystemController *)self clientPID];
    if ((int)v5 >= 1)
    {
      id v6 = (void *)MX_RunningBoardServices_CopyBundleInfoValueForKeyAndPID(@"CanInheritApplicationStateFromOtherProcesses", v5);
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        char v7 = [v6 BOOLValue];

        if ((v7 & 1) != 0
          && [(MXSystemController *)self hasEntitlementForPIDInheritance])
        {
          -[MXSystemController setPidToInheritAppStateFrom:](self, "setPidToInheritAppStateFrom:", [(id)a3 intValue]);
          +[MXSystemController mxSystemControllerListBeginIteration];
          long long v18 = 0u;
          long long v19 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          long long v8 = (void *)gMXSystemControllerList;
          uint64_t v9 = [(id)gMXSystemControllerList countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v17;
            do
            {
              uint64_t v12 = 0;
              do
              {
                if (*(void *)v17 != v11) {
                  objc_enumerationMutation(v8);
                }
                int v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
                if (v13)
                {
                  int v14 = [*(id *)(*((void *)&v16 + 1) + 8 * v12) clientPID];
                  if (v14 == [(MXSystemController *)self pidToInheritAppStateFrom])
                  {
                    if ([v13 pidToInheritAppStateFrom]) {
                      -[MXSystemController setPidToInheritAppStateFrom:](self, "setPidToInheritAppStateFrom:", [v13 pidToInheritAppStateFrom]);
                    }
                  }
                }
                ++v12;
              }
              while (v10 != v12);
              uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
            }
            while (v10);
          }
          +[MXSystemController mxSystemControllerListEndIteration];
          CMSMUtility_ApplyPIDToInheritAppStateFrom([(MXSystemController *)self clientPID], [(MXSystemController *)self pidToInheritAppStateFrom]);
          return 0;
        }
      }
      else
      {
      }
    }
  }
  return FigSignalErrorAt();
}

- (int)setSilentMode:(BOOL)a3 untilTime:(id)a4 reason:(id)a5 clientType:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  +[MXInitialization waitUntilMXIsFullyInitialized];
  if ([(MXSystemController *)self hasEntitlementToSetSilentMode])
  {
    if (v6 >= 0xA
      || CMSMDeviceState_DeviceHasHardwareRingerSwitch()
      && [+[MXSessionManager sharedInstance] clientTypeOverridesHardwareSwitch:v6])
    {
      int v22 = 0;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return -12981;
    }
    else
    {
      if (dword_1E9359E48)
      {
        int v22 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        int v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      id v14 = a4;
      id v15 = a5;
      long long v16 = MXGetSerialQueue();
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __64__MXSystemController_setSilentMode_untilTime_reason_clientType___block_invoke;
      v18[3] = &unk_1E57C5AD8;
      BOOL v20 = a3;
      v18[4] = a4;
      v18[5] = a5;
      int v19 = v6;
      MXDispatchAsyncAndWait((uint64_t)"-[MXSystemController setSilentMode:untilTime:reason:clientType:]", (uint64_t)"MXSystemController_Embedded.m", 1071, 0, 0, v16, (uint64_t)v18);
      return 0;
    }
  }
  else
  {
    uint64_t v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return -12988;
  }
}

void __64__MXSystemController_setSilentMode_untilTime_reason_clientType___block_invoke(uint64_t a1)
{
  [+[MXSessionManager sharedInstance] updateSilentModeState:*(unsigned __int8 *)(a1 + 52) untilTime:*(void *)(a1 + 32) withReason:*(void *)(a1 + 40) forClientType:*(unsigned int *)(a1 + 48) updateForStartup:0];

  id v2 = *(void **)(a1 + 40);
}

- (int)grantMediaEndowmentWithEnvironmentID:(id)a3 endowmentPayload:(id)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v8 = [(MXSystemController *)self auditToken];
  uint64_t v9 = [(MXSystemController *)self bundleID];
  uint64_t v10 = [a4 objectForKey:@"RecordingWebsite"];
  if (v8) {
    [v7 setObject:v8 forKey:@"AuditToken"];
  }
  if (v9) {
    [v7 setObject:v9 forKey:@"BundleID"];
  }
  if (v10) {
    [v7 setObject:v10 forKey:@"RecordingWebsite"];
  }
  int v11 = [+[MXMediaEndowmentManager sharedInstance] grantMediaEndowment:[(MXSystemController *)self clientPID] environmentID:a3 endowmentPayload:v7];

  return v11;
}

- (int)revokeMediaEndowmentWithEnvironmentID:(id)a3
{
  uint64_t v5 = +[MXMediaEndowmentManager sharedInstance];
  uint64_t v6 = [(MXSystemController *)self clientPID];
  return [(MXMediaEndowmentManager *)v5 revokeMediaEndowment:v6 environmentID:a3];
}

- (int)allowAppsToInitiatePlayback:(id)a3 clientType:(id)a4 isTemporary:(BOOL)a5
{
  BOOL v5 = a5;
  if ([(MXSystemController *)self hasEntitlementToAllowAppsToInitiatePlayback])
  {
    if (MX_FeatureFlags_IsAllowBackgroundPlaybackEnabled())
    {
      [(MXSystemController *)self setAppsAllowedToInitiatePlayback:a3];
      [(MXSystemController *)self setAppsAllowedToInitiatePlaybackClientType:a4];
      if (v5) {
        uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
      }
      else {
        uint64_t v9 = 0;
      }
      [(MXSystemController *)self setAppsAllowedToInitiatePlaybackTimestamp:v9];
      if (dword_1E9359E48)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return 0;
    }
    else
    {
      int v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return -15687;
    }
  }
  else
  {
    uint64_t v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return -12988;
  }
}

- (int)remoteDeviceControlIsAllowed:(unsigned int *)a3
{
  return 0;
}

- (int)getVolumeButtonDelta:(id)a3 outVolumeDelta:(float *)a4
{
  uint64_t v6 = +[MXSessionManager sharedInstance];
  return [(MXSessionManager *)v6 getVolumeButtonDelta:a3 outVolumeDelta:a4];
}

- (NSSet)appsAllowedToInitiatePlayback
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAppsAllowedToInitiatePlayback:(id)a3
{
}

- (NSString)appsAllowedToInitiatePlaybackClientType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAppsAllowedToInitiatePlaybackClientType:(id)a3
{
}

- (NSDate)appsAllowedToInitiatePlaybackTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAppsAllowedToInitiatePlaybackTimestamp:(id)a3
{
}

- (NSData)auditToken
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRemoteDeviceID:(id)a3
{
}

- (void)setRemoteDeviceIDs:(id)a3
{
}

- (void)setAppWantsVolumeChanges:(BOOL)a3
{
  self->_appWantsVolumeChanges = a3;
}

- (void)setClientPID:(int)a3
{
  self->_int clientPID = a3;
}

- (BOOL)hasEntitlementForPIDInheritance
{
  return self->_hasEntitlementForPIDInheritance;
}

- (BOOL)hasEntitlementToClearCacheForFirstPartyPhoneCalls
{
  return self->_hasEntitlementToClearCacheForFirstPartyPhoneCalls;
}

- (BOOL)hasEntitlementToSetSilentMode
{
  return self->_hasEntitlementToSetSilentMode;
}

- (BOOL)hasEntitlementForSilentModeNotifications
{
  return self->_hasEntitlementForSilentModeNotifications;
}

- (void)setPidToInheritAppStateFrom:(int)a3
{
  self->_pidToInheritAppStateFrom = a3;
}

- (BOOL)hasEntitlementToSetRelativeVoiceOverVolume
{
  return self->_hasEntitlementToSetRelativeVoiceOverVolume;
}

- (BOOL)hasEntitlementToAllowAppsToInitiatePlayback
{
  return self->_hasEntitlementToAllowAppsToInitiatePlayback;
}

void __71__MXSystemController_InternalUse__setAttributeForKeyInternal_andValue___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  +[MXSystemController mxSystemControllerListAddInstance:objc_loadWeak(&location) isSidekick:1];
  objc_destroyWeak(&location);
}

- (BOOL)isAppAllowedToInitiatePlayback:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v5 = [(MXSystemController *)self appsAllowedToInitiatePlaybackTimestamp];
    if (v5)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSinceDate:", v5);
      if (v6 > 10.0)
      {
        if (dword_1E9359E48)
        {
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        -[MXSystemController setAppsAllowedToInitiatePlayback:](self, "setAppsAllowedToInitiatePlayback:", 0, v10, v11);
        [(MXSystemController *)self setAppsAllowedToInitiatePlaybackClientType:0];
        [(MXSystemController *)self setAppsAllowedToInitiatePlaybackTimestamp:0];
      }
    }
    return [(NSSet *)[(MXSystemController *)self appsAllowedToInitiatePlayback] containsObject:a3];
  }
  else
  {
    long long v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
}

+ (BOOL)isAppAllowedToInitiatePlayback:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    +[MXSystemController mxSystemControllerListBeginIteration];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v4 = (void *)gMXSystemControllerList;
    uint64_t v5 = [(id)gMXSystemControllerList countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v12 + 1) + 8 * i) isAppAllowedToInitiatePlayback:a3])
          {
            BOOL v9 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    BOOL v9 = 0;
LABEL_12:
    +[MXSystemController mxSystemControllerListEndIteration];
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
  return v9;
}

+ (void)dumpInfoOfMXSystemControllers
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v2 = &qword_1E9359000;
  if (dword_1E9359E48)
  {
    unsigned int v44 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  +[MXSystemController mxSystemControllerListBeginIteration];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v4 = (void *)gMXSystemControllerList;
  uint64_t v5 = [(id)gMXSystemControllerList countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if (v9) {
          BOOL v10 = dword_1E9359E48 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        if (!v10)
        {
          unsigned int v44 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          uint64_t v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v12 = v44;
          if (os_log_type_enabled(v11, type)) {
            unsigned int v13 = v12;
          }
          else {
            unsigned int v13 = v12 & 0xFFFFFFFE;
          }
          if (v13)
          {
            uint64_t v14 = [v9 info];
            int v46 = 136315394;
            __int16 v47 = "+[MXSystemController(InternalUse) dumpInfoOfMXSystemControllers]";
            __int16 v48 = 2114;
            uint64_t v49 = v14;
            LODWORD(v33) = 22;
            int v30 = &v46;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          id v2 = &qword_1E9359000;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v39 objects:v50 count:16];
    }
    while (v6);
  }
  if (dword_1E9359E48)
  {
    unsigned int v44 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    long long v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v16 = v44;
    if (os_log_type_enabled(v15, type)) {
      unsigned int v17 = v16;
    }
    else {
      unsigned int v17 = v16 & 0xFFFFFFFE;
    }
    if (v17)
    {
      int v46 = 136315138;
      __int16 v47 = "+[MXSystemController(InternalUse) dumpInfoOfMXSystemControllers]";
      LODWORD(v33) = 12;
      int v30 = &v46;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v18 = (void *)gSidekickMXSystemControllerList;
  uint64_t v19 = objc_msgSend((id)gSidekickMXSystemControllerList, "countByEnumeratingWithState:objects:count:", &v35, v45, 16, v30, v33);
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        if (v23) {
          BOOL v24 = *((_DWORD *)v2 + 914) == 0;
        }
        else {
          BOOL v24 = 1;
        }
        if (!v24)
        {
          unsigned int v44 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          unsigned int v25 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v26 = v44;
          if (os_log_type_enabled(v25, type)) {
            unsigned int v27 = v26;
          }
          else {
            unsigned int v27 = v26 & 0xFFFFFFFE;
          }
          if (v27)
          {
            uint64_t v28 = [v23 info];
            int v46 = 136315394;
            __int16 v47 = "+[MXSystemController(InternalUse) dumpInfoOfMXSystemControllers]";
            __int16 v48 = 2114;
            uint64_t v49 = v28;
            LODWORD(v34) = 22;
            float v31 = &v46;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          id v2 = &qword_1E9359000;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v20);
  }
  +[MXSystemController mxSystemControllerListEndIteration];
}

+ (void)updateMXSystemControllerList
{
  dispatch_semaphore_wait((dispatch_semaphore_t)gMXSystemControllerListWriteSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  [(id)gMXSystemControllerList addPointer:0];
  [(id)gMXSystemControllerList compact];
  [(id)gMXSystemControllerList addPointer:0];
  [(id)gMXSystemControllerList compact];
  id v2 = gMXSystemControllerListWriteSemaphore;
  dispatch_semaphore_signal(v2);
}

@end