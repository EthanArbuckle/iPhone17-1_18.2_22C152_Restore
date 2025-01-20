@interface AVSystemController
+ (id)compatibleAudioRouteForRoute:(id)a3;
+ (id)sharedAVSystemController;
+ (id)sharedInstance;
+ (void)initialize;
+ (void)postNotificationOnMainQueue:(id)a3 notification:(id)a4 object:(id)a5;
- (AVSystemController)init;
- (BOOL)addRemoteDeviceID:(id)a3;
- (BOOL)allowUserToExceedEUVolumeLimit;
- (BOOL)changeActiveCategoryVolume:(BOOL)a3;
- (BOOL)changeActiveCategoryVolume:(BOOL)a3 fallbackCategory:(id)a4 resultVolume:(float *)a5 affectedCategory:(id *)a6;
- (BOOL)changeActiveCategoryVolume:(BOOL)a3 forRoute:(id)a4 andDeviceIdentifier:(id)a5;
- (BOOL)changeActiveCategoryVolumeBy:(float)a3;
- (BOOL)changeActiveCategoryVolumeBy:(float)a3 fallbackCategory:(id)a4 resultVolume:(float *)a5 affectedCategory:(id *)a6;
- (BOOL)changeActiveCategoryVolumeBy:(float)a3 forRoute:(id)a4 andDeviceIdentifier:(id)a5;
- (BOOL)changeVolume:(BOOL)a3 forCategory:(id)a4;
- (BOOL)changeVolume:(BOOL)a3 forCategory:(id)a4 mode:(id)a5;
- (BOOL)changeVolumeBy:(float)a3 forCategory:(id)a4;
- (BOOL)changeVolumeForRoute:(BOOL)a3 forCategory:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 andRouteSubtype:(id)a8;
- (BOOL)changeVolumeForRouteBy:(float)a3 forCategory:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 andRouteSubtype:(id)a8;
- (BOOL)currentRouteHasVolumeControl;
- (BOOL)didCancelRoutePicking:(id)a3;
- (BOOL)getActiveCategoryMuted:(BOOL *)a3;
- (BOOL)getActiveCategoryMuted:(BOOL *)a3 forRoute:(id)a4 andDeviceIdentifier:(id)a5;
- (BOOL)getActiveCategoryVolume:(float *)a3 andName:(id *)a4;
- (BOOL)getActiveCategoryVolume:(float *)a3 andName:(id *)a4 fallbackCategory:(id)a5;
- (BOOL)getActiveCategoryVolume:(float *)a3 andName:(id *)a4 forRoute:(id)a5 andDeviceIdentifier:(id)a6;
- (BOOL)getSilentMode;
- (BOOL)getSilentMode:(BOOL *)a3 error:(id *)a4;
- (BOOL)getVibeIntensity:(float *)a3;
- (BOOL)getVolume:(float *)a3 forCategory:(id)a4;
- (BOOL)getVolume:(float *)a3 forCategory:(id)a4 mode:(id)a5;
- (BOOL)getVolumeForRoute:(float *)a3 forCategory:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 andRouteSubtype:(id)a8;
- (BOOL)hasRouteSharingPolicyLongFormVideo:(id)a3;
- (BOOL)overrideToPartnerRoute;
- (BOOL)remoteDeviceControlIsAllowed:(unsigned int *)a3;
- (BOOL)removeRemoteDeviceID:(id)a3;
- (BOOL)setActiveCategoryVolumeTo:(float)a3;
- (BOOL)setActiveCategoryVolumeTo:(float)a3 fallbackCategory:(id)a4 resultVolume:(float *)a5 affectedCategory:(id *)a6;
- (BOOL)setActiveCategoryVolumeTo:(float)a3 forRoute:(id)a4 andDeviceIdentifier:(id)a5;
- (BOOL)setAttribute:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setBTHFPRoute:(id)a3 availableForVoicePrompts:(BOOL)a4;
- (BOOL)setPickedRouteWithPassword:(id)a3 withPassword:(id)a4;
- (BOOL)setSilentMode:(BOOL)a3 untilTime:(id)a4 reason:(id)a5 clientType:(unsigned int)a6;
- (BOOL)setVibeIntensityTo:(float)a3;
- (BOOL)setVolumeForRouteTo:(float)a3 forCategory:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 andRouteSubtype:(id)a8;
- (BOOL)setVolumeTo:(float)a3 forCategory:(id)a4;
- (BOOL)setVolumeTo:(float)a3 forCategory:(id)a4 mode:(id)a5;
- (BOOL)setVolumeTo:(float)a3 forCategory:(id)a4 retainFullMute:(BOOL)a5;
- (BOOL)shouldClientWithAudioScore:(int)a3 hijackRoute:(id)a4 hijackDeniedReason:(id *)a5;
- (BOOL)toggleActiveCategoryMuted;
- (BOOL)toggleActiveCategoryMutedForRoute:(id)a3 andDeviceIdentifier:(id)a4;
- (id)attributeForKey:(id)a3;
- (id)errorWithCode:(int)a3 description:(id)a4;
- (id)pickableRoutesForCategory:(id)a3;
- (id)pickableRoutesForCategory:(id)a3 andMode:(id)a4;
- (id)routeForCategory:(id)a3;
- (id)topOfNowPlayingAppStack;
- (id)volumeCategoryForAudioCategory:(id)a3;
- (int)allowAppToInitiateRecordingTemporarily:(id)a3;
- (int)allowAppsToInitiatePlayback:(id)a3 clientType:(id)a4 isTemporary:(BOOL)a5;
- (int)clearUplinkMutedCache;
- (int)getDuckScalarForVoiceOver:(float *)a3;
- (int)getInputMute:(id *)a3 outMuteValue:(BOOL *)a4;
- (int)getVolume:(float *)a3 category:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 routeSubtype:(id)a8;
- (int)getVolumeButtonDelta:(id)a3 outVolumeDelta:(float *)a4;
- (int)grantMediaEndowmentWithEnvironmentID:(id)a3 endowmentPayload:(id)a4;
- (int)popNowPlayingAppStack;
- (int)revokeMediaEndowmentWithEnvironmentID:(id)a3;
- (int)setDuckScalarForVoiceOver:(float)a3;
- (int)setInputMute:(id *)a3 muteValue:(BOOL)a4;
- (int)setVolume:(float)a3 category:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 routeSubtype:(id)a8 rampUpDuration:(float)a9 rampDownDuration:(float)a10;
- (int)setVolume:(float)a3 category:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 routeSubtype:(id)a8 rampUpDuration:(float)a9 rampDownDuration:(float)a10 retainFullMute:(BOOL)a11;
- (int)setVolume:(float)a3 category:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 routeSubtype:(id)a8 rampUpwardDuration:(id)a9 rampDownwardDuration:(id)a10;
- (int)toggleInputMute;
- (int)volumeCategoryAndMode:(id)a3 mode:(id)a4 outCategory:(id *)a5 outMode:(id *)a6;
- (void)dealloc;
- (void)handleServerDied;
- (void)postEffectiveVolumeNotification:(id)a3;
- (void)postFullMuteDidChangeNotification:(id)a3;
- (void)releaseSharedInstance;
@end

@implementation AVSystemController

+ (id)sharedAVSystemController
{
  return +[AVSystemController sharedInstance];
}

void __83__AVSystemController_InternalUse__postNotificationOnMainQueue_notification_object___block_invoke(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 48));
  if (Weak) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", *(void *)(a1 + 32), Weak, *(void *)(a1 + 40));
  }
  v3 = *(void **)(a1 + 40);
}

- (BOOL)getVolume:(float *)a3 forCategory:(id)a4
{
  return [(AVSystemController *)self getVolume:a3 forCategory:a4 mode:0];
}

- (void)postEffectiveVolumeNotification:(id)a3
{
  int v23 = 1065353216;
  v5 = (void *)[a3 objectForKey:@"Volume"];
  v6 = (void *)[a3 objectForKey:@"AudioCategory"];
  id v24 = v6;
  uint64_t v7 = [a3 objectForKey:@"Reason"];
  uint64_t v8 = [a3 objectForKey:@"SilenceVolumeHUD"];
  uint64_t v9 = [a3 objectForKey:@"ActiveAudioCategory"];
  if (!v8) {
    uint64_t v8 = [NSNumber numberWithBool:0];
  }
  mCategory = self->mCategory;
  if (!mCategory)
  {
    if (v6)
    {
      if (v5)
      {
        [v5 floatValue];
LABEL_16:
        self->float mVolume = v13;
        id v14 = v24;
        self->mCategory = (NSString *)v24;
        goto LABEL_17;
      }
      [(AVSystemController *)self getVolume:&v23 forCategory:v6 mode:0];
    }
    else
    {
      [(AVSystemController *)self getActiveCategoryVolume:&v23 andName:&v24];
    }
    float v13 = *(float *)&v23;
    goto LABEL_16;
  }
  if (v6)
  {

    id v11 = v6;
    self->mCategory = (NSString *)v6;
  }
  if (v5)
  {
    [v5 floatValue];
  }
  else
  {
    [(AVSystemController *)self getActiveCategoryVolume:&v23 andName:&v24];
    float v12 = *(float *)&v23;
  }
  self->float mVolume = v12;
LABEL_17:
  v15 = self->mCategory;
  float mVolume = 0.0;
  if (!self->mFullMute) {
    float mVolume = self->mVolume;
  }
  int v23 = LODWORD(mVolume);
  if (v7) {
    v17 = (__CFString *)v7;
  }
  else {
    v17 = @"FullMuteChange";
  }
  id v18 = objc_alloc(NSNumber);
  LODWORD(v19) = v23;
  v20 = (void *)[v18 initWithFloat:v19];
  id v21 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v22 = objc_msgSend(v21, "initWithObjectsAndKeys:", v15, AVSystemController_EffectiveVolumeNotificationParameter_Category, v20, AVSystemController_EffectiveVolumeNotificationParameter_Volume, v17, AVSystemController_EffectiveVolumeNotificationParameter_VolumeChangeReason, v8, AVSystemController_EffectiveVolumeNotificationParameter_SilenceVolumeHUD, v9, AVSystemController_EffectiveVolumeNotificationParameter_ActiveAudioCategory, 0);
  +[AVSystemController postNotificationOnMainQueue:v22 notification:AVSystemController_EffectiveVolumeDidChangeNotification object:self];
}

+ (void)postNotificationOnMainQueue:(id)a3 notification:(id)a4 object:(id)a5
{
  id v8 = a3;
  objc_initWeak(&location, a5);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__AVSystemController_InternalUse__postNotificationOnMainQueue_notification_object___block_invoke;
  v9[3] = &unk_1E57C9BE8;
  objc_copyWeak(&v10, &location);
  v9[4] = a4;
  v9[5] = a3;
  MXDispatchAsync((uint64_t)"+[AVSystemController(InternalUse) postNotificationOnMainQueue:notification:object:]", (uint64_t)"AVSystemController.m", 2452, 0, 0, MEMORY[0x1E4F14428], (uint64_t)v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (BOOL)getVolume:(float *)a3 forCategory:(id)a4 mode:(id)a5
{
  mFigController = self->mFigController;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, id, id, void, void, void, float *, double, double, double, void, void, void, _BYTE))(v10 + 8);
  return v11 && v11(mFigController, 13, a4, a5, 0, 0, 0, a3, 0.0, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (id)volumeCategoryForAudioCategory:(id)a3
{
  if (volumeCategoryForAudioCategory__onceToken != -1) {
    dispatch_once(&volumeCategoryForAudioCategory__onceToken, &__block_literal_global_749);
  }
  if (!a3) {
    a3 = @"Audio/Video";
  }
  [(id)volumeCategoryForAudioCategory__volumeCategoryForAudioCategoryCacheLock lock];
  id v10 = (id)[(id)volumeCategoryForAudioCategory__volumeCategoryForAudioCategoryCache valueForKey:a3];
  [(id)volumeCategoryForAudioCategory__volumeCategoryForAudioCategoryCacheLock unlock];
  if (!v10)
  {
    mFigController = self->mFigController;
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = *(unsigned int (**)(OpaqueFigSystemController *, id, void, id *, void))(v8 + 24);
    if (v9 && !v9(mFigController, a3, 0, &v10, 0))
    {
      [(id)volumeCategoryForAudioCategory__volumeCategoryForAudioCategoryCacheLock lock];
      [(id)volumeCategoryForAudioCategory__volumeCategoryForAudioCategoryCache setValue:v10 forKey:a3];
      [(id)volumeCategoryForAudioCategory__volumeCategoryForAudioCategoryCacheLock unlock];
    }
  }
  return v10;
}

- (id)pickableRoutesForCategory:(id)a3
{
  id v11 = 0;
  if (a3) {
    v3 = (__CFString *)a3;
  }
  else {
    v3 = @"Audio/Video";
  }
  mFigController = self->mFigController;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void (**)(OpaqueFigSystemController *, __CFString *, __CFString *, void **))(v6 + 32);
  if (v7)
  {
    v7(mFigController, v3, @"Default", &v11);
    uint64_t v8 = v11;
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = v8;
  if (v11) {
    return v11;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (BOOL)getActiveCategoryVolume:(float *)a3 andName:(id *)a4
{
  return [(AVSystemController *)self getActiveCategoryVolume:a3 andName:a4 fallbackCategory:0];
}

- (BOOL)getActiveCategoryVolume:(float *)a3 andName:(id *)a4 fallbackCategory:(id)a5
{
  if (a4) {
    *a4 = 0;
  }
  mFigController = self->mFigController;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, id, void, void, void, void, float *, double, double, double, void, id *, void, _BYTE))(v10 + 8);
  if (v11)
  {
    int v12 = v11(mFigController, 3, a5, 0, 0, 0, 0, a3, 0.0, 0.0, 0.0, 0, a4, 0, 0);
    if (!a4) {
      return v12 == 0;
    }
    goto LABEL_10;
  }
  int v12 = -12782;
  if (a4) {
LABEL_10:
  }
    id v13 = *a4;
  return v12 == 0;
}

- (BOOL)setAttribute:(id)a3 forKey:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0;
  }
  if ([a4 isEqualToString:AVSystemController_IAmTheiPodAppAttribute]) {
    return 1;
  }
  uint64_t v10 = [(id)sSetAttributeForKeyMappingToFig valueForKey:a4];
  if (v10)
  {
    uint64_t v11 = v10;
    mFigController = self->mFigController;
    uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v13) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    double v19 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, id))(v14 + 56);
    if (v19) {
      uint64_t v17 = v19(mFigController, v11, a3);
    }
    else {
      uint64_t v17 = 4294954514;
    }
    uint64_t v16 = 0;
    if (a5 && v17)
    {
      id v18 = @"setAttribute failed: '%@'";
      goto LABEL_21;
    }
  }
  else
  {
    int v15 = [a4 isEqualToString:AVSystemController_PostNotificationsFromMainThreadOnly];
    uint64_t v16 = 0;
    if (v15) {
      uint64_t v17 = 0;
    }
    else {
      uint64_t v17 = 4294967246;
    }
    if ((v15 & 1) == 0 && a5)
    {
      id v18 = @"unsupported attribute: '%@'";
      uint64_t v17 = 4294967246;
LABEL_21:
      uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", v18, 0, a4);
    }
  }
  if (a5)
  {
    if (v17) {
      *a5 = [(AVSystemController *)self errorWithCode:v17 description:v16];
    }
  }
  return v17 == 0;
}

- (id)pickableRoutesForCategory:(id)a3 andMode:(id)a4
{
  uint64_t v13 = 0;
  if (a3) {
    v4 = (__CFString *)a3;
  }
  else {
    v4 = @"Audio/Video";
  }
  if (a4) {
    uint64_t v5 = (__CFString *)a4;
  }
  else {
    uint64_t v5 = @"Default";
  }
  mFigController = self->mFigController;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void (**)(OpaqueFigSystemController *, __CFString *, __CFString *, void **))(v8 + 32);
  if (v9)
  {
    v9(mFigController, v4, v5, &v13);
    uint64_t v10 = v13;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = v10;
  if (v13) {
    return v13;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (id)attributeForKey:(id)a3
{
  uint64_t v17 = 0;
  uint64_t v5 = objc_msgSend((id)sAttributeForKeyMappingToFig, "valueForKey:");
  if (v5)
  {
    uint64_t v6 = v5;
    mFigController = self->mFigController;
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    int v12 = *(void (**)(OpaqueFigSystemController *, uint64_t, void, void **))(v9 + 48);
    if (v12)
    {
      v12(mFigController, v6, *MEMORY[0x1E4F1CF80], &v17);
      uint64_t v13 = v17;
    }
    else
    {
      uint64_t v13 = 0;
    }
    id v14 = v13;
    int v15 = [a3 isEqualToString:AVSystemController_ActiveAudioRouteAttribute];
    uint64_t v16 = v17;
    if (v15) {
      return +[AVSystemController compatibleAudioRouteForRoute:v17];
    }
    return v16;
  }
  if (![a3 isEqualToString:AVSystemController_PostNotificationsFromMainThreadOnly]
    && ![a3 isEqualToString:AVSystemController_DeviceManufacturedForEURegion])
  {
    return 0;
  }
  uint64_t v10 = NSNumber;
  return (id)[v10 numberWithBool:0];
}

+ (id)compatibleAudioRouteForRoute:(id)a3
{
  if (compatibleAudioRouteForRoute__onceToken != -1) {
    dispatch_once(&compatibleAudioRouteForRoute__onceToken, &__block_literal_global_35);
  }
  id result = (id)[(id)compatibleAudioRouteForRoute__sRouteMap objectForKey:a3];
  if (!result) {
    return a3;
  }
  return result;
}

id __36__AVSystemController_sharedInstance__block_invoke()
{
  id result = objc_alloc_init(MEMORY[0x1E4F28FD0]);
  gSharedInstanceLock = (uint64_t)result;
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_733);
  }
  [(id)gSharedInstanceLock lock];
  v2 = (AVSystemController *)gSharedInstance;
  if (!gSharedInstance)
  {
    unsigned int v5 = 1;
    do
    {
      v2 = objc_alloc_init(AVSystemController);
      gSharedInstance = (uint64_t)v2;
      if (v2) {
        break;
      }
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v2 = (AVSystemController *)gSharedInstance;
      if (gSharedInstance) {
        break;
      }
    }
    while (v5++ < 3);
  }
  v3 = v2;
  [(id)gSharedInstanceLock unlock];
  return (id)gSharedInstance;
}

- (AVSystemController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AVSystemController;
  v2 = [(AVSystemController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->mCategory = 0;
    v2->mFullMute = 0;
    v2->float mVolume = 0.0;
    v2->mRemoteDeviceIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v3->mRemoteDeviceIDsLock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    p_mFigController = &v3->mFigController;
    if (FigSystemControllerRemoteCreate(*MEMORY[0x1E4F1CF80], 0, &v3->mFigController)
      || !*p_mFigController
      || (CMNotificationCenterGetDefaultLocalCenter(), FigNotificationCenterAddWeakListeners())
      || !*p_mFigController)
    {

      return 0;
    }
  }
  return v3;
}

- (BOOL)currentRouteHasVolumeControl
{
  CFTypeRef cf = 0;
  mFigController = self->mFigController;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  unsigned int v5 = *(uint64_t (**)(OpaqueFigSystemController *, __CFString *, void, CFTypeRef *))(v4 + 48);
  if (!v5) {
    return 1;
  }
  int v6 = v5(mFigController, @"CurrentRouteHasVolumeControl", *MEMORY[0x1E4F1CF80], &cf);
  CFTypeRef v7 = cf;
  if (v6) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = cf == 0;
  }
  if (!v8)
  {
    CFTypeID v9 = CFGetTypeID(cf);
    CFTypeID TypeID = CFBooleanGetTypeID();
    CFTypeRef v7 = cf;
    if (v9 == TypeID)
    {
      BOOL v11 = CFBooleanGetValue((CFBooleanRef)cf) != 0;
      CFTypeRef v7 = cf;
      if (!cf) {
        return v11;
      }
      goto LABEL_14;
    }
  }
  BOOL v11 = 1;
  if (v7) {
LABEL_14:
  }
    CFRelease(v7);
  return v11;
}

+ (void)initialize
{
  if (self == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
    id v2 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    sAttributeForKeyMappingToFig = objc_msgSend(v2, "initWithObjectsAndKeys:", @"HeadphoneJackIsConnected", AVSystemController_HeadphoneJackIsConnectedAttribute, @"HeadphoneJackHasInput", AVSystemController_HeadphoneJackHasInputAttribute, @"SystemHasAudioInputDevice", AVSystemController_SystemHasAudioInputDeviceAttribute, @"SystemHasAudioInputDeviceExcludingBluetooth", AVSystemController_SystemHasAudioInputDeviceExcludingBluetoothAttribute, @"HeadphoneVolumeLimit", AVSystemController_HeadphoneVolumeLimitAttribute, @"CurrentExternalScreen", AVSystemController_CurrentExternalScreenAttribute, @"ActiveAudioRoute", AVSystemController_ActiveAudioRouteAttribute, @"PickableRoutes", AVSystemController_PickableRoutesAttribute, @"CurrentlyActiveCategory",
                                     AVSystemController_CurrentlyActiveCategoryAttribute,
                                     @"CurrentlyActiveMode",
                                     AVSystemController_CurrentlyActiveModeAttribute,
                                     @"PickedRoute",
                                     AVSystemController_PickedRouteAttribute,
                                     @"SomeClientIsPlayingLongFormAudio",
                                     AVSystemController_SomeClientIsPlayingLongFormAudioAttribute,
                                     @"ActiveClientPIDsThatHideTheSpeechDetectionDevice",
                                     AVSystemController_ActiveClientPIDsThatHideTheSpeechDetectionDeviceAttribute,
                                     @"FullMute",
                                     AVSystemController_FullMuteAttribute,
                                     @"RecordingClientPIDs",
                                     AVSystemController_RecordingClientPIDsAttribute,
                                     @"UplinkMute",
                                     AVSystemController_UplinkMuteAttribute,
                                     @"DownlinkMute",
                                     AVSystemController_DownlinkMuteAttribute,
                                     @"ThermalControlInfo",
                                     AVSystemController_ThermalControlInfoAttribute,
                                     @"MeasuredHDMILatency",
                                     AVSystemController_MeasuredHDMILatencyAttribute,
                                     @"VoicePromptStyle",
                                     AVSystemController_VoicePromptStyleAttribute,
                                     @"NowPlayingAppShouldPlayOnCarPlayConnect",
                                     AVSystemController_NowPlayingAppShouldPlayOnCarPlayConnectAttribute,
                                     @"CarPlayIsConnected",
                                     AVSystemController_CarPlayIsConnectedAttribute,
                                     @"CarPlayAuxStreamSupport",
                                     AVSystemController_CarPlayAuxStreamSupportAttribute,
                                     @"CarPlaySupportsMixableSiri",
                                     AVSystemController_CarPlaySupportsMixableSiriAttribute,
                                     @"CarPlayIsPlayingLongerDurationSession",
                                     AVSystemController_CarPlayIsPlayingLongerDurationSession,
                                     @"CanBeNowPlayingApp",
                                     AVSystemController_CanBeNowPlayingAppAttribute,
                                     @"AppWantsVolumeChanges",
                                     AVSystemController_AppWantsVolumeChangesAttribute,
                                     @"ActiveInputRouteForPlayAndRecordNoBluetooth",
                                     AVSystemController_ActiveInputRouteForPlayAndRecordNoBluetoothAttribute,
                                     @"NowPlayingAppPID",
                                     AVSystemController_NowPlayingAppPIDAttribute,
                                     @"NowPlayingAppDisplayID",
                                     AVSystemController_NowPlayingAppDisplayIDAttribute,
                                     @"CallIsActive");
    id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    sSetAttributeForKeyMappingToFig = objc_msgSend(v3, "initWithObjectsAndKeys:", @"HeadphoneVolumeLimit", AVSystemController_HeadphoneVolumeLimitAttribute, @"PickedRoute", AVSystemController_PickedRouteAttribute, @"RouteAwayFromAirPlay", AVSystemController_RouteAwayFromAirPlayAttribute, @"FullMute", AVSystemController_FullMuteAttribute, @"UplinkMute", AVSystemController_UplinkMuteAttribute, @"DownlinkMute", AVSystemController_DownlinkMuteAttribute, @"ThermalControlInfo", AVSystemController_ThermalControlInfoAttribute, @"MeasuredHDMILatency", AVSystemController_MeasuredHDMILatencyAttribute, @"PIDToInheritApplicationStateFrom",
                                        AVSystemController_PIDToInheritApplicationStateFrom,
                                        @"CanBeNowPlayingApp",
                                        AVSystemController_CanBeNowPlayingAppAttribute,
                                        @"AllowAppToInitiatePlaybackTemporarily",
                                        AVSystemController_AllowAppToInitiatePlaybackTemporarilyAttribute,
                                        @"AppWantsVolumeChanges",
                                        AVSystemController_AppWantsVolumeChangesAttribute,
                                        @"AirPlayScreenSuspended",
                                        AVSystemController_AirPlayScreenSuspended,
                                        @"AppToInterruptCurrentNowPlayingSession",
                                        AVSystemController_AppToInterruptCurrentNowPlayingSessionAttribute,
                                        @"InterruptAudioSessionIDForHandoff",
                                        AVSystemController_InterruptAudioSessionIDForHandoff,
                                        @"AllowAppToFadeInTemporarily",
                                        AVSystemController_AllowAppToFadeInTemporarilyAttribute,
                                        @"SubscribeToNotifications",
                                        AVSystemController_SubscribeToNotificationsAttribute,
                                        @"PostInterruptionEndedNotification",
                                        AVSystemController_PostInterruptionEndedNotification,
                                        @"WombatEnabled",
                                        AVSystemController_WombatEnabledAttribute,
                                        @"CallScreeningStatus",
                                        AVSystemController_CallScreeningStatusAttribute,
                                        @"MaximumSpeakerVolumeLimit",
                                        AVSystemController_MaximumSpeakerVolumeLimitAttribute,
                                        0);
  }
}

uint64_t __51__AVSystemController_compatibleAudioRouteForRoute___block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"Receiver", @"ReceiverAndMicrophone", @"Headset", @"HeadsetInOut", @"Headphone", @"HeadphonesAndMicrophone", @"Speaker", @"SpeakerAndMicrophone", @"BestSpeaker", @"BestSpeakerAndMicrophone", @"LineOut", @"LineInOut", 0);
  compatibleAudioRouteForRoute__sRouteMap = result;
  return result;
}

- (void)dealloc
{
  if (self->mFigController)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterRemoveWeakListeners();
    mFigController = self->mFigController;
    if (mFigController)
    {
      CFRelease(mFigController);
      self->mFigController = 0;
    }
  }
  mCategory = self->mCategory;
  if (mCategory) {
    CFRelease(mCategory);
  }

  self->mRemoteDeviceIDs = 0;
  self->mRemoteDeviceIDsLock = 0;
  v5.receiver = self;
  v5.super_class = (Class)AVSystemController;
  [(AVSystemController *)&v5 dealloc];
}

- (BOOL)changeActiveCategoryVolumeBy:(float)a3 fallbackCategory:(id)a4 resultVolume:(float *)a5 affectedCategory:(id *)a6
{
  if (a6) {
    *a6 = 0;
  }
  mFigController = self->mFigController;
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  int v12 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, void, void, void, void, void, float *, float, double, double, void, id *, void, _BYTE))(v11 + 8);
  if (v12)
  {
    int v13 = v12(mFigController, 1, 0, 0, 0, 0, 0, a5, a3, 0.0, 0.0, 0, a6, 0, 0);
    if (!a6) {
      return v13 == 0;
    }
    goto LABEL_10;
  }
  int v13 = -12782;
  if (a6) {
LABEL_10:
  }
    id v14 = *a6;
  return v13 == 0;
}

- (BOOL)changeActiveCategoryVolume:(BOOL)a3 fallbackCategory:(id)a4 resultVolume:(float *)a5 affectedCategory:(id *)a6
{
  if (a6) {
    *a6 = 0;
  }
  if (a3) {
    float v8 = 0.0625;
  }
  else {
    float v8 = -0.0625;
  }
  mFigController = self->mFigController;
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  int v12 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, void, void, void, void, void, float *, float, double, double, void, id *, void, _BYTE))(v11 + 8);
  if (v12)
  {
    int v13 = v12(mFigController, 1, 0, 0, 0, 0, 0, a5, v8, 0.0, 0.0, 0, a6, 0, 0);
    if (!a6) {
      return v13 == 0;
    }
    goto LABEL_13;
  }
  int v13 = -12782;
  if (a6) {
LABEL_13:
  }
    id v14 = *a6;
  return v13 == 0;
}

- (BOOL)setVibeIntensityTo:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  CFTypeRef v7 = (void *)[v5 initWithFloat:v6];
  mFigController = self->mFigController;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = *(unsigned int (**)(OpaqueFigSystemController *, __CFString *, void *))(v10 + 56);
  if (v11) {
    BOOL v12 = v11(mFigController, @"VibeIntensity", v7) == 0;
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)getVibeIntensity:(float *)a3
{
  id v12 = 0;
  mFigController = self->mFigController;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  CFTypeRef v7 = *(uint64_t (**)(OpaqueFigSystemController *, __CFString *, void, id *))(v6 + 48);
  if (v7)
  {
    int v8 = v7(mFigController, @"VibeIntensity", *MEMORY[0x1E4F1CF80], &v12);
    id v9 = v12;
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v9 = 0;
  int v8 = -12782;
  if (a3)
  {
LABEL_8:
    [v9 floatValue];
    *(_DWORD *)a3 = v10;
    id v9 = v12;
  }
LABEL_9:

  return v8 == 0;
}

- (BOOL)changeActiveCategoryVolumeBy:(float)a3
{
  int v4 = 0;
  return -[AVSystemController changeActiveCategoryVolumeBy:fallbackCategory:resultVolume:affectedCategory:](self, "changeActiveCategoryVolumeBy:fallbackCategory:resultVolume:affectedCategory:", 0, &v4, 0);
}

- (BOOL)changeActiveCategoryVolume:(BOOL)a3
{
  int v4 = 0;
  return [(AVSystemController *)self changeActiveCategoryVolume:a3 fallbackCategory:0 resultVolume:&v4 affectedCategory:0];
}

- (BOOL)setActiveCategoryVolumeTo:(float)a3 fallbackCategory:(id)a4 resultVolume:(float *)a5 affectedCategory:(id *)a6
{
  if (a6) {
    *a6 = 0;
  }
  mFigController = self->mFigController;
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  int v13 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, id, void, void, void, void, float *, float, double, double, void, id *, void, _BYTE))(v12 + 8);
  if (v13)
  {
    int v14 = v13(mFigController, 2, a4, 0, 0, 0, 0, a5, a3, 0.0, 0.0, 0, a6, 0, 0);
    if (!a6) {
      return v14 == 0;
    }
    goto LABEL_10;
  }
  int v14 = -12782;
  if (a6) {
LABEL_10:
  }
    id v15 = *a6;
  return v14 == 0;
}

- (BOOL)setActiveCategoryVolumeTo:(float)a3
{
  int v4 = 0;
  return -[AVSystemController setActiveCategoryVolumeTo:fallbackCategory:resultVolume:affectedCategory:](self, "setActiveCategoryVolumeTo:fallbackCategory:resultVolume:affectedCategory:", 0, &v4, 0);
}

- (BOOL)changeActiveCategoryVolumeBy:(float)a3 forRoute:(id)a4 andDeviceIdentifier:(id)a5
{
  mFigController = self->mFigController;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, void, void, id, id, void, void, float, double, double, void, void, void, _BYTE))(v10 + 8);
  return v11 && v11(mFigController, 4, 0, 0, a4, a5, 0, 0, a3, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (BOOL)changeActiveCategoryVolume:(BOOL)a3 forRoute:(id)a4 andDeviceIdentifier:(id)a5
{
  if (a3) {
    float v7 = 0.0625;
  }
  else {
    float v7 = -0.0625;
  }
  mFigController = self->mFigController;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, void, void, id, id, void, void, float, double, double, void, void, void, _BYTE))(v10 + 8);
  return v11 && v11(mFigController, 4, 0, 0, a4, a5, 0, 0, v7, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (BOOL)setActiveCategoryVolumeTo:(float)a3 forRoute:(id)a4 andDeviceIdentifier:(id)a5
{
  mFigController = self->mFigController;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, void, void, id, id, void, void, float, double, double, void, void, void, _BYTE))(v10 + 8);
  return v11 && v11(mFigController, 5, 0, 0, a4, a5, 0, 0, a3, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (BOOL)getActiveCategoryVolume:(float *)a3 andName:(id *)a4 forRoute:(id)a5 andDeviceIdentifier:(id)a6
{
  mFigController = self->mFigController;
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, void, void, id, id, void, float *, double, double, double, void, void, void, _BYTE))(v11 + 8);
  return v12 && v12(mFigController, 6, 0, 0, a5, a6, 0, a3, 0.0, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (BOOL)changeVolumeForRouteBy:(float)a3 forCategory:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 andRouteSubtype:(id)a8
{
  mFigController = self->mFigController;
  uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, id, void, id, id, id, void, float, double, double, void, void, void, _BYTE))(v15 + 8);
  return v16 && v16(mFigController, 11, a4, 0, a6, a7, a8, 0, a3, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (BOOL)changeVolumeForRoute:(BOOL)a3 forCategory:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 andRouteSubtype:(id)a8
{
  if (a3) {
    float v12 = 0.0625;
  }
  else {
    float v12 = -0.0625;
  }
  mFigController = self->mFigController;
  uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, id, void, id, id, id, void, float, double, double, void, void, void, _BYTE))(v15 + 8);
  return v16 && v16(mFigController, 11, a4, 0, a6, a7, a8, 0, v12, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (BOOL)setVolumeForRouteTo:(float)a3 forCategory:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 andRouteSubtype:(id)a8
{
  mFigController = self->mFigController;
  uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, id, void, id, id, id, void, float, double, double, void, void, void, _BYTE))(v15 + 8);
  return v16 && v16(mFigController, 12, a4, 0, a6, a7, a8, 0, a3, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (int)setVolume:(float)a3 category:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 routeSubtype:(id)a8 rampUpwardDuration:(id)a9 rampDownwardDuration:(id)a10
{
  mFigController = self->mFigController;
  objc_msgSend(a9, "floatValue", a4, a5);
  float v17 = v16;
  [a10 floatValue];
  float v19 = v18;
  uint64_t v20 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v20) {
    uint64_t v21 = v20;
  }
  else {
    uint64_t v21 = 0;
  }
  v22 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, id, void, id, id, id, void, float, float, float, void, void, void, _BYTE))(v21 + 8);
  if (v22) {
    return v22(mFigController, 12, a4, 0, a6, a7, a8, 0, a3, v17, v19, 0, 0, 0, 0);
  }
  else {
    return -12782;
  }
}

- (int)setVolume:(float)a3 category:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 routeSubtype:(id)a8 rampUpDuration:(float)a9 rampDownDuration:(float)a10
{
  int result = -12981;
  if (a9 >= 0.0 && a10 >= 0.0)
  {
    mFigController = self->mFigController;
    uint64_t v20 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v20) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = 0;
    }
    v22 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, id, void, id, id, id, void, float, float, float, void, void, void, _BYTE))(v21 + 8);
    if (v22) {
      return v22(mFigController, 12, a4, 0, a6, a7, a8, 0, a3, a9, a10, 0, 0, 0, 0);
    }
    else {
      return -12782;
    }
  }
  return result;
}

- (int)setVolume:(float)a3 category:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 routeSubtype:(id)a8 rampUpDuration:(float)a9 rampDownDuration:(float)a10 retainFullMute:(BOOL)a11
{
  int result = -12981;
  if (a9 >= 0.0 && a10 >= 0.0)
  {
    mFigController = self->mFigController;
    uint64_t v22 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v22) {
      uint64_t v23 = v22;
    }
    else {
      uint64_t v23 = 0;
    }
    id v24 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, id, void, id, id, id, void, float, float, float, void, void, void, BOOL))(v23 + 8);
    if (v24) {
      return v24(mFigController, 12, a4, 0, a6, a7, a8, 0, a3, a9, a10, 0, 0, 0, a11);
    }
    else {
      return -12782;
    }
  }
  return result;
}

- (BOOL)getVolumeForRoute:(float *)a3 forCategory:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 andRouteSubtype:(id)a8
{
  mFigController = self->mFigController;
  uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  float v16 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, id, void, id, id, id, float *, double, double, double, void, void, void, _BYTE))(v15 + 8);
  return v16 && v16(mFigController, 13, a4, 0, a6, a7, a8, a3, 0.0, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (int)getVolume:(float *)a3 category:(id)a4 mode:(id)a5 route:(id)a6 deviceIdentifier:(id)a7 routeSubtype:(id)a8
{
  mFigController = self->mFigController;
  uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  float v16 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, id, void, id, id, id, float *, double, double, double, void, void, void, _BYTE))(v15 + 8);
  if (v16) {
    return v16(mFigController, 13, a4, 0, a6, a7, a8, a3, 0.0, 0.0, 0.0, 0, 0, 0, 0);
  }
  else {
    return -12782;
  }
}

- (int)volumeCategoryAndMode:(id)a3 mode:(id)a4 outCategory:(id *)a5 outMode:(id *)a6
{
  v22[22] = *MEMORY[0x1E4F143B8];
  int v6 = -12980;
  if (a5 && a6)
  {
    id v21 = 0;
    v22[0] = 0;
    mFigController = self->mFigController;
    uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v14 = *(uint64_t (**)(OpaqueFigSystemController *, id, id, void *, id *))(v13 + 24);
    if (v14)
    {
      int v6 = v14(mFigController, a3, a4, v22, &v21);
      if (!v6)
      {
        id v16 = v21;
        uint64_t v15 = (void *)v22[0];
        *a5 = (id)v22[0];
        *a6 = v16;
        id v17 = v15;
        id v18 = v21;
        return v6;
      }
    }
    else
    {
      int v6 = -12782;
    }
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v6;
}

- (int)setDuckScalarForVoiceOver:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  float v7 = (void *)[v5 initWithFloat:v6];
  mFigController = self->mFigController;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = *(uint64_t (**)(OpaqueFigSystemController *, __CFString *, void *))(v10 + 56);
  if (v11)
  {
    int v12 = v11(mFigController, @"DuckScalarForVoiceOver", v7);
    if (!v12) {
      goto LABEL_9;
    }
  }
  else
  {
    int v12 = -12782;
  }
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_9:

  return v12;
}

- (int)getDuckScalarForVoiceOver:(float *)a3
{
  v12[22] = *(id *)MEMORY[0x1E4F143B8];
  v12[0] = 0;
  mFigController = self->mFigController;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  float v7 = *(uint64_t (**)(OpaqueFigSystemController *, __CFString *, void, id *))(v6 + 48);
  if (!v7)
  {
    int v8 = -12782;
    goto LABEL_9;
  }
  int v8 = v7(mFigController, @"DuckScalarForVoiceOver", *MEMORY[0x1E4F1CF80], v12);
  if (v8)
  {
LABEL_9:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_10;
  }
  if (a3)
  {
    [v12[0] floatValue];
    int v8 = 0;
    *(_DWORD *)a3 = v9;
  }
  else
  {
    int v8 = 0;
  }
LABEL_10:

  return v8;
}

- (int)popNowPlayingAppStack
{
  mFigController = self->mFigController;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(uint64_t (**)(OpaqueFigSystemController *, __CFString *, void))(v4 + 56);
  if (v5)
  {
    int v6 = v5(mFigController, @"PopNowPlayingAppStack", 0);
    if (!v6) {
      return v6;
    }
  }
  else
  {
    int v6 = -12782;
  }
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  return v6;
}

- (id)topOfNowPlayingAppStack
{
  v9[22] = *(id *)MEMORY[0x1E4F143B8];
  v9[0] = 0;
  mFigController = self->mFigController;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(unsigned int (**)(OpaqueFigSystemController *, __CFString *, void, id *))(v4 + 48);
  if (!v5 || v5(mFigController, @"TopOfNowPlayingAppStackDisplayID", *MEMORY[0x1E4F1CF80], v9))
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v7 = v9[0];
  return v9[0];
}

- (BOOL)toggleActiveCategoryMuted
{
  mFigController = self->mFigController;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, void, void, void, void, void, void, double, double, double, void, void, void, _BYTE))(v4 + 8);
  return v5 && v5(mFigController, 7, 0, 0, 0, 0, 0, 0, 0.0, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (BOOL)toggleActiveCategoryMutedForRoute:(id)a3 andDeviceIdentifier:(id)a4
{
  mFigController = self->mFigController;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  int v9 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, void, void, id, id, void, void, double, double, double, void, void, void, _BYTE))(v8 + 8);
  return v9 && v9(mFigController, 9, 0, 0, a3, a4, 0, 0, 0.0, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (BOOL)getActiveCategoryMuted:(BOOL *)a3
{
  HIBYTE(v10) = 0;
  mFigController = self->mFigController;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, void, void, void, void, void, void, double, double, double, char *, void, void, uint64_t))(v6 + 8);
  if (!v7) {
    return 0;
  }
  LOBYTE(v10) = 0;
  int v8 = v7(mFigController, 8, 0, 0, 0, 0, 0, 0, 0.0, 0.0, 0.0, (char *)&v10 + 7, 0, 0, v10);
  BOOL result = 0;
  if (!v8)
  {
    *a3 = HIBYTE(v10) != 0;
    return 1;
  }
  return result;
}

- (BOOL)getActiveCategoryMuted:(BOOL *)a3 forRoute:(id)a4 andDeviceIdentifier:(id)a5
{
  HIBYTE(v14) = 0;
  mFigController = self->mFigController;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, void, void, id, id, void, void, double, double, double, char *, void, void, uint64_t))(v10 + 8);
  if (!v11) {
    return 0;
  }
  LOBYTE(v14) = 0;
  int v12 = v11(mFigController, 10, 0, 0, a4, a5, 0, 0, 0.0, 0.0, 0.0, (char *)&v14 + 7, 0, 0, v14);
  BOOL result = 0;
  if (!v12)
  {
    *a3 = HIBYTE(v14) != 0;
    return 1;
  }
  return result;
}

- (BOOL)changeVolumeBy:(float)a3 forCategory:(id)a4
{
  mFigController = self->mFigController;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, id, void, void, void, void, void, float, double, double, void, void, void, _BYTE))(v8 + 8);
  return v9 && v9(mFigController, 11, a4, 0, 0, 0, 0, 0, a3, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (BOOL)changeVolume:(BOOL)a3 forCategory:(id)a4
{
  return [(AVSystemController *)self changeVolume:a3 forCategory:a4 mode:0];
}

- (BOOL)changeVolume:(BOOL)a3 forCategory:(id)a4 mode:(id)a5
{
  if (a3) {
    float v7 = 0.0625;
  }
  else {
    float v7 = -0.0625;
  }
  mFigController = self->mFigController;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, id, id, void, void, void, void, float, double, double, void, void, void, _BYTE))(v10 + 8);
  return v11 && v11(mFigController, 11, a4, a5, 0, 0, 0, 0, v7, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (BOOL)setVolumeTo:(float)a3 forCategory:(id)a4
{
  return -[AVSystemController setVolumeTo:forCategory:mode:](self, "setVolumeTo:forCategory:mode:", a4, 0);
}

- (BOOL)setVolumeTo:(float)a3 forCategory:(id)a4 retainFullMute:(BOOL)a5
{
  mFigController = self->mFigController;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, id, void, void, void, void, void, float, double, double, void, void, void, BOOL))(v10 + 8);
  return v11 && v11(mFigController, 12, a4, 0, 0, 0, 0, 0, a3, 0.0, 0.0, 0, 0, 0, a5) == 0;
}

- (BOOL)setVolumeTo:(float)a3 forCategory:(id)a4 mode:(id)a5
{
  mFigController = self->mFigController;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = *(unsigned int (**)(OpaqueFigSystemController *, uint64_t, id, id, void, void, void, void, float, double, double, void, void, void, _BYTE))(v10 + 8);
  return v11 && v11(mFigController, 12, a4, a5, 0, 0, 0, 0, a3, 0.0, 0.0, 0, 0, 0, 0) == 0;
}

- (BOOL)setBTHFPRoute:(id)a3 availableForVoicePrompts:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = v7;
  if (a3)
  {
    [v7 addEntriesFromDictionary:a3];
    [v8 removeObjectForKey:@"BTDetails_IsAvailableForVoicePrompts"];
    objc_msgSend(v8, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithBool:", v4), @"BTDetails_IsAvailableForVoicePrompts");
    mFigController = self->mFigController;
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v13 = *(unsigned int (**)(OpaqueFigSystemController *, __CFString *, void *))(v11 + 56);
    if (v13) {
      BOOL v12 = v13(mFigController, @"AvailableForVoicePrompts", v8) == 0;
    }
    else {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (BOOL)didCancelRoutePicking:(id)a3
{
  return 0;
}

- (BOOL)setPickedRouteWithPassword:(id)a3 withPassword:(id)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = v7;
  if (a3)
  {
    [v7 addEntriesFromDictionary:a3];
    [v8 setObject:a4 forKey:@"PortPassword"];
    mFigController = self->mFigController;
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v13 = *(unsigned int (**)(OpaqueFigSystemController *, __CFString *, void *))(v11 + 56);
    if (v13) {
      BOOL v12 = v13(mFigController, @"PickedRouteWithPassword", v8) == 0;
    }
    else {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (BOOL)setSilentMode:(BOOL)a3 untilTime:(id)a4 reason:(id)a5 clientType:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v9 = a3;
  mFigController = self->mFigController;
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = *(unsigned int (**)(OpaqueFigSystemController *, BOOL, id, id, uint64_t))(v12 + 112);
  if (v13 && !v13(mFigController, v9, a4, a5, v6)) {
    return 1;
  }
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  return 0;
}

- (BOOL)getSilentMode
{
  id v2 = [(AVSystemController *)self attributeForKey:AVSystemController_SilentModeEnabledAttribute];
  return [v2 BOOLValue];
}

- (BOOL)getSilentMode:(BOOL *)a3 error:(id *)a4
{
  id v14 = 0;
  mFigController = self->mFigController;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(uint64_t (**)(OpaqueFigSystemController *, __CFString *, void, id *))(v9 + 48);
  if (!v10)
  {
    id v12 = 0;
    uint64_t v11 = 4294954514;
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v11 = v10(mFigController, @"SilentModeEnabled", *MEMORY[0x1E4F1CF80], &v14);
  id v12 = v14;
  if (a3)
  {
LABEL_8:
    *a3 = [v12 BOOLValue];
    id v12 = v14;
  }
LABEL_9:

  if (a4) {
    *a4 = -[AVSystemController errorWithCode:description:](self, "errorWithCode:description:", v11, objc_msgSend(NSString, "stringWithFormat:", @"Error querying SilentModeEnabled with err = %d", v11));
  }
  return v11 == 0;
}

- (id)routeForCategory:(id)a3
{
  uint64_t v11 = 0;
  mFigController = self->mFigController;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = *(void (**)(OpaqueFigSystemController *, id, void **, void))(v6 + 16);
  if (v7)
  {
    v7(mFigController, a3, &v11, 0);
    uint64_t v8 = v11;
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = v8;
  return +[AVSystemController compatibleAudioRouteForRoute:v11];
}

id __53__AVSystemController_volumeCategoryForAudioCategory___block_invoke()
{
  volumeCategoryForAudioCategory__volumeCategoryForAudioCategoryCache = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id result = objc_alloc_init(MEMORY[0x1E4F28E08]);
  volumeCategoryForAudioCategory__volumeCategoryForAudioCategoryCacheLock = (uint64_t)result;
  return result;
}

- (int)toggleInputMute
{
  mFigController = self->mFigController;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(uint64_t (**)(OpaqueFigSystemController *))(v4 + 56);
  if (!v5) {
    return -12782;
  }
  return v5(mFigController);
}

- (int)setInputMute:(id *)a3 muteValue:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  mFigController = self->mFigController;
  long long v6 = *(_OWORD *)&a3->var0[4];
  long long v12 = *(_OWORD *)a3->var0;
  long long v13 = v6;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = *(uint64_t (**)(OpaqueFigSystemController *, _OWORD *, BOOL))(v8 + 64);
  if (!v9) {
    return -12782;
  }
  v11[0] = v12;
  v11[1] = v13;
  return v9(mFigController, v11, v4);
}

- (int)getInputMute:(id *)a3 outMuteValue:(BOOL *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  mFigController = self->mFigController;
  long long v6 = *(_OWORD *)&a3->var0[4];
  long long v12 = *(_OWORD *)a3->var0;
  long long v13 = v6;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = *(uint64_t (**)(OpaqueFigSystemController *, _OWORD *, BOOL *))(v8 + 72);
  if (!v9) {
    return -12782;
  }
  v11[0] = v12;
  v11[1] = v13;
  return v9(mFigController, v11, a4);
}

- (int)clearUplinkMutedCache
{
  mFigController = self->mFigController;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(uint64_t (**)(OpaqueFigSystemController *))(v4 + 80);
  if (!v5) {
    return -12782;
  }
  return v5(mFigController);
}

- (int)allowAppToInitiateRecordingTemporarily:(id)a3
{
  mFigController = self->mFigController;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(OpaqueFigSystemController *, id))(v6 + 88);
  if (v7)
  {
    int v8 = v7(mFigController, a3);
    if (!v8) {
      return v8;
    }
  }
  else
  {
    int v8 = -12782;
  }
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  return v8;
}

- (int)grantMediaEndowmentWithEnvironmentID:(id)a3 endowmentPayload:(id)a4
{
  mFigController = self->mFigController;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = *(uint64_t (**)(OpaqueFigSystemController *, id, id))(v8 + 96);
  if (v9)
  {
    int v10 = v9(mFigController, a3, a4);
    if (!v10) {
      return v10;
    }
  }
  else
  {
    int v10 = -12782;
  }
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  return v10;
}

- (int)revokeMediaEndowmentWithEnvironmentID:(id)a3
{
  mFigController = self->mFigController;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(OpaqueFigSystemController *, id))(v6 + 104);
  if (v7)
  {
    int v8 = v7(mFigController, a3);
    if (!v8) {
      return v8;
    }
  }
  else
  {
    int v8 = -12782;
  }
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  return v8;
}

- (BOOL)overrideToPartnerRoute
{
  mFigController = self->mFigController;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(unsigned int (**)(OpaqueFigSystemController *, __CFString *, void))(v4 + 56);
  return v5 && v5(mFigController, @"OverrideToPartnerRoute", 0) == 0;
}

- (BOOL)allowUserToExceedEUVolumeLimit
{
  return 0;
}

- (BOOL)hasRouteSharingPolicyLongFormVideo:(id)a3
{
  char v10 = 0;
  mFigController = self->mFigController;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(unsigned int (**)(OpaqueFigSystemController *, id, char *))(v6 + 40);
  if (!v7) {
    return 0;
  }
  if (v7(mFigController, a3, &v10)) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v10 == 0;
  }
  return !v8;
}

- (BOOL)shouldClientWithAudioScore:(int)a3 hijackRoute:(id)a4 hijackDeniedReason:(id *)a5
{
  uint64_t v7 = *(void *)&a3;
  char v13 = 0;
  mFigController = self->mFigController;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = *(void (**)(OpaqueFigSystemController *, uint64_t, id, char *, id *))(v10 + 48);
  if (!v11) {
    return 0;
  }
  v11(mFigController, v7, a4, &v13, a5);
  return v13 != 0;
}

- (BOOL)remoteDeviceControlIsAllowed:(unsigned int *)a3
{
  unsigned int v11 = 1;
  mFigController = self->mFigController;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(OpaqueFigSystemController *, unsigned int *))(v6 + 120);
  if (v7)
  {
    int v8 = v7(mFigController, &v11);
    int v9 = v11;
    if (a3 && !v8) {
      *a3 = v11;
    }
  }
  else
  {
    int v9 = 1;
  }
  return v9 == 0;
}

- (BOOL)addRemoteDeviceID:(id)a3
{
  if (!a3) {
    return 0;
  }
  [(NSLock *)self->mRemoteDeviceIDsLock lock];
  [(NSMutableSet *)self->mRemoteDeviceIDs addObject:a3];
  id v5 = (id)[(NSMutableSet *)self->mRemoteDeviceIDs allObjects];
  [(NSLock *)self->mRemoteDeviceIDsLock unlock];
  mFigController = self->mFigController;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v10 = *(unsigned int (**)(OpaqueFigSystemController *, __CFString *, id))(v8 + 56);
  if (v10 && !v10(mFigController, @"RemoteDeviceIDs", v5))
  {
    BOOL v9 = 1;
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)removeRemoteDeviceID:(id)a3
{
  if (!a3) {
    return 0;
  }
  [(NSLock *)self->mRemoteDeviceIDsLock lock];
  [(NSMutableSet *)self->mRemoteDeviceIDs removeObject:a3];
  id v5 = (id)[(NSMutableSet *)self->mRemoteDeviceIDs allObjects];
  [(NSLock *)self->mRemoteDeviceIDsLock unlock];
  mFigController = self->mFigController;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v10 = *(unsigned int (**)(OpaqueFigSystemController *, __CFString *, id))(v8 + 56);
  if (v10 && !v10(mFigController, @"RemoteDeviceIDs", v5))
  {
    BOOL v9 = 1;
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    BOOL v9 = 0;
  }

  return v9;
}

- (int)getVolumeButtonDelta:(id)a3 outVolumeDelta:(float *)a4
{
  if (!a4) {
    return -12980;
  }
  mFigController = self->mFigController;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v10 = *(uint64_t (**)(OpaqueFigSystemController *, id, float *))(v8 + 128);
  if (!v10) {
    return -12782;
  }
  return v10(mFigController, a3, a4);
}

- (int)allowAppsToInitiatePlayback:(id)a3 clientType:(id)a4 isTemporary:(BOOL)a5
{
  BOOL v5 = a5;
  mFigController = self->mFigController;
  uint64_t v8 = [a3 allObjects];
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  unsigned int v11 = *(uint64_t (**)(OpaqueFigSystemController *, uint64_t, id, BOOL))(v10 + 136);
  if (!v11) {
    return -12782;
  }
  return v11(mFigController, v8, a4, v5);
}

- (id)errorWithCode:(int)a3 description:(id)a4
{
  id v4 = a4;
  if (a4)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v4 = (id)objc_msgSend(v6, "initWithObjectsAndKeys:", v4, *MEMORY[0x1E4F28568], 0);
  }
  uint64_t v7 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:a3 userInfo:v4];

  return v7;
}

- (void)releaseSharedInstance
{
  [(id)gSharedInstanceLock lock];
  if ((AVSystemController *)gSharedInstance == self)
  {
    uint64_t v3 = self;
    gSharedInstance = 0;
  }
  id v4 = (void *)gSharedInstanceLock;
  [v4 unlock];
}

- (void)handleServerDied
{
  [(AVSystemController *)self releaseSharedInstance];
  uint64_t v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = AVSystemController_ServerConnectionDiedNotification;
  [v3 postNotificationName:v4 object:self];
}

- (void)postFullMuteDidChangeNotification:(id)a3
{
  uint64_t v4 = [a3 objectForKey:@"FullMuted"];
  if (v4) {
    CFBooleanRef v5 = (const __CFBoolean *)v4;
  }
  else {
    CFBooleanRef v5 = (const __CFBoolean *)*MEMORY[0x1E4F1CFC8];
  }
  id v6 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v7 = (id)objc_msgSend(v6, "initWithObjectsAndKeys:", v5, AVSystemController_AudioFullMutedNotificationParameter, 0);
  self->mFullMute = CFBooleanGetValue(v5) != 0;
  +[AVSystemController postNotificationOnMainQueue:v7 notification:AVSystemController_FullMuteDidChangeNotification object:self];
}

@end