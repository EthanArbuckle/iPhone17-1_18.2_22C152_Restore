@interface MXNowPlayingAppManager
+ (id)getNowPlayingAppUpdateReasonString:(unsigned int)a3;
+ (id)sharedInstance;
+ (void)actuallyWriteNowPlayingAppDisplayIDToDisk:(id)a3;
+ (void)processNowPlayingAppPIDChangeIfNeeded:(BOOL)a3;
- (BOOL)doesNowPlayingAppStackContain:(id)a3;
- (BOOL)ignoreNowPlayingAppUpdates;
- (BOOL)resetNowPlayingAppIfNeeded:(unsigned int)a3 allowedToBeNowPlaying:(BOOL)a4 canBeNowPlayingApp:(BOOL)a5;
- (BOOL)setIsNowPlayingApp:(int)a3;
- (MXNowPlayingAppManager)init;
- (NSDate)nowPlayingAppStopTime;
- (NSString)nowPlayingAppDisplayID;
- (OS_dispatch_source)writeNowPlayingAppToDiskTimer;
- (id)copyTopOfNowPlayingAppStack;
- (int)nowPlayingAppPID;
- (unint64_t)nowPlayingAppStackSize;
- (void)clearNowPlayingAppStack;
- (void)dealloc;
- (void)dumpNowPlayingAppInfo;
- (void)popNowPlayingAppStack;
- (void)popNowPlayingAppStackOldestDisplayID;
- (void)populateNowPlayingAppStack:(id)a3 hostProcessAttributionBundleID:(id)a4;
- (void)pushToNowPlayingAppStack:(id)a3 hostProcessAttributionBundleID:(id)a4;
- (void)removeFromNowPlayingAppStack:(id)a3;
- (void)resetNowPlayingApp:(id)a3;
- (void)resetNowPlayingAppToDefaultMusicApp;
- (void)saveNowPlayingAppStackToDisk;
- (void)setIgnoreNowPlayingAppUpdates:(BOOL)a3;
- (void)setNowPlayingAppDisplayID:(id)a3;
- (void)setNowPlayingAppPID:(int)a3;
- (void)setNowPlayingAppStopTime:(id)a3;
- (void)setWriteNowPlayingAppToDiskTimer:(id)a3;
- (void)updateNowPlayingApp:(int)a3 session:(id)a4 reasonForUpdate:(unsigned int)a5;
- (void)updateNowPlayingAppStackFromDisk;
- (void)writeNowPlayingAppInfoToDisk;
@end

@implementation MXNowPlayingAppManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_36);
  }
  return (id)sharedInstance_sSharedInstance_5;
}

- (int)nowPlayingAppPID
{
  return self->_nowPlayingAppPID;
}

- (void)updateNowPlayingApp:(int)a3 session:(id)a4 reasonForUpdate:(unsigned int)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v5 = *(void *)&a5;
    uint64_t v6 = *(void *)&a3;
    if (![(MXNowPlayingAppManager *)self ignoreNowPlayingAppUpdates])
    {
      int v8 = [(MXNowPlayingAppManager *)self nowPlayingAppPID];
      v9 = (void *)MEMORY[0x1997179E0]();
      BOOL v10 = +[MXSystemController getCanBeNowPlayingAppForPID:v6];
      if (!v10)
      {
        [+[MXSessionManager sharedInstance] updateBadgeType:@"NotApplicable" matchingPID:v6];
        v11 = +[MXSessionManager sharedInstance];
        -[MXSessionManager updateSupportedOutputChannelLayouts:matchingPID:](v11, "updateSupportedOutputChannelLayouts:matchingPID:", [MEMORY[0x1E4F1C978] array], v6);
      }
      BOOL v12 = [+[MXSessionManager sharedInstance] isPIDAllowedToBeNowPlayingApp:v6];
      if (!CMSNP_IsCurrentNowPlayingSessionAirPlayingLongFormMedia()
        || CMSUtility_IsSessionWithPIDAllowedToInterruptCurrentlyAirPlayingNowPlayingSession(v6)
        || v8 == v6)
      {
        unint64_t v13 = 0x1EC297000;
        if (dword_1E9359ED0)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          unint64_t v13 = 0x1EC297000uLL;
        }
        if (v10 && v12 || v8 != v6)
        {
          char v16 = !v10 || !v12;
          if (v8 == v6) {
            char v16 = 1;
          }
          if ((v16 & 1) != 0 || !CMSUtility_SessionWithPIDIsPlaying(v6))
          {
            BOOL v17 = 0;
            goto LABEL_20;
          }
          BOOL v15 = [(MXNowPlayingAppManager *)self setIsNowPlayingApp:v6];
        }
        else
        {
          [(MXNowPlayingAppManager *)self setNowPlayingAppPID:0];
          BOOL v15 = [(MXNowPlayingAppManager *)self resetNowPlayingAppIfNeeded:v5 allowedToBeNowPlaying:v12 canBeNowPlayingApp:v10];
        }
        BOOL v17 = v15;
LABEL_20:
        objc_msgSend((id)(v13 + 3728), "processNowPlayingAppPIDChangeIfNeeded:", v17, v19, v20);
        if ([(MXNowPlayingAppManager *)self nowPlayingAppPID] == v6
          && CMSUtility_SessionWithPIDIsPlaying(v6))
        {
          if (dword_1E9359ED0)
          {
            v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          cmsmUpdateInEarBasedPlaybackState(0, 0, 1);
        }
      }
    }
  }
}

- (BOOL)ignoreNowPlayingAppUpdates
{
  return self->_ignoreNowPlayingAppUpdates;
}

- (id)copyTopOfNowPlayingAppStack
{
  [(NSLock *)self->mLock lock];
  id v3 = (id)[(NSMutableArray *)self->mNowPlayingAppDisplayIDStack lastObject];
  [(NSLock *)self->mLock unlock];
  return v3;
}

+ (void)processNowPlayingAppPIDChangeIfNeeded:(BOOL)a3
{
  if (a3)
  {
    CMSMUtility_UpdateSharePlayVolumeBehaviours();
    CMSMNotificationUtility_PostNowPlayingAppPIDDidChange();
    CMSMNotificationUtility_PostNowPlayingAppDidChange();
    CMSMNotificationUtility_PostSomeSessionIsPlayingDidChange();
    [+[MXSessionManager sharedInstance] updateSupportedOutputChannelLayouts];
  }
  CMSMNotificationUtility_PostNowPlayingAppIsPlayingDidChange();
  CMSMNotificationUtility_PostNowPlayingAppStackDidChange();
}

+ (id)getNowPlayingAppUpdateReasonString:(unsigned int)a3
{
  if (a3 >= 8) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN reason = %d", *(void *)&a3);
  }
  else {
    return *(&off_1E57C9C08 + (int)a3);
  }
}

- (void)setIgnoreNowPlayingAppUpdates:(BOOL)a3
{
  self->_ignoreNowPlayingAppUpdates = a3;
}

MXNowPlayingAppManager *__40__MXNowPlayingAppManager_sharedInstance__block_invoke()
{
  result = objc_alloc_init(MXNowPlayingAppManager);
  sharedInstance_sSharedInstance_5 = (uint64_t)result;
  return result;
}

- (MXNowPlayingAppManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)MXNowPlayingAppManager;
  v2 = [(MXNowPlayingAppManager *)&v4 init];
  if (v2)
  {
    v2->mLock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    v2->_nowPlayingAppDisplayID = 0;
    v2->_nowPlayingAppStopTime = 0;
    v2->_writeNowPlayingAppToDiskTimer = 0;
    v2->mNowPlayingAppDisplayIDStack = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->mNowPlayingAppHostProcessAttributionBundleID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

- (void)dealloc
{
  self->_nowPlayingAppDisplayID = 0;
  self->_nowPlayingAppStopTime = 0;

  self->_writeNowPlayingAppToDiskTimer = 0;
  self->mNowPlayingAppDisplayIDStack = 0;

  self->mNowPlayingAppHostProcessAttributionBundleID = 0;
  self->mLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)MXNowPlayingAppManager;
  [(MXNowPlayingAppManager *)&v3 dealloc];
}

- (void)setWriteNowPlayingAppToDiskTimer:(id)a3
{
  [(NSLock *)self->mLock lock];
  writeNowPlayingAppToDiskTimer = self->_writeNowPlayingAppToDiskTimer;
  if (writeNowPlayingAppToDiskTimer)
  {
    dispatch_source_cancel(writeNowPlayingAppToDiskTimer);
    uint64_t v6 = self->_writeNowPlayingAppToDiskTimer;
    if (v6)
    {
      dispatch_release(v6);
      self->_writeNowPlayingAppToDiskTimer = 0;
    }
  }
  self->_writeNowPlayingAppToDiskTimer = (OS_dispatch_source *)a3;
  mLock = self->mLock;
  [(NSLock *)mLock unlock];
}

+ (void)actuallyWriteNowPlayingAppDisplayIDToDisk:(id)a3
{
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  MXCFPreferencesSetAndSynchronizeUserPreference(@"nowPlayingAppDisplayID", a3);
}

- (void)writeNowPlayingAppInfoToDisk
{
  objc_super v3 = MXGetSerialQueue();
  objc_super v4 = FigRoutingManagerCreateOneShotTimer(v3, 5.0, (uint64_t)&__block_literal_global_37, 0, 0);
  [(MXNowPlayingAppManager *)self setWriteNowPlayingAppToDiskTimer:v4];
}

uint64_t __54__MXNowPlayingAppManager_writeNowPlayingAppInfoToDisk__block_invoke()
{
  +[MXNowPlayingAppManager actuallyWriteNowPlayingAppDisplayIDToDisk:](MXNowPlayingAppManager, "actuallyWriteNowPlayingAppDisplayIDToDisk:", [+[MXNowPlayingAppManager sharedInstance] nowPlayingAppDisplayID]);
  if (MX_FeatureFlags_IsNowPlayingAppStackEnabled()) {
    [+[MXNowPlayingAppManager sharedInstance] saveNowPlayingAppStackToDisk];
  }
  v0 = +[MXNowPlayingAppManager sharedInstance];
  return [(MXNowPlayingAppManager *)v0 setWriteNowPlayingAppToDiskTimer:0];
}

- (void)resetNowPlayingAppToDefaultMusicApp
{
  [(MXNowPlayingAppManager *)self setNowPlayingAppDisplayID:[+[MXSessionManager sharedInstance] defaultMusicApp]];
  [(MXNowPlayingAppManager *)self setNowPlayingAppPID:0];
  [(MXNowPlayingAppManager *)self setNowPlayingAppStopTime:0];
}

- (void)resetNowPlayingApp:(id)a3
{
  if (MX_FeatureFlags_IsNowPlayingAppStackEnabled())
  {
    objc_super v4 = [+[MXNowPlayingAppManager sharedInstance] copyTopOfNowPlayingAppStack];
    [+[MXNowPlayingAppManager sharedInstance] popNowPlayingAppStack];
    uint64_t v5 = [+[MXNowPlayingAppManager sharedInstance] copyTopOfNowPlayingAppStack];
  }
  else
  {
    objc_super v4 = [(MXNowPlayingAppManager *)self nowPlayingAppDisplayID];
    uint64_t v5 = [+[MXSessionManager sharedInstance] defaultMusicApp];
    [(MXNowPlayingAppManager *)self resetNowPlayingAppToDefaultMusicApp];
  }
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (BOOL)resetNowPlayingAppIfNeeded:(unsigned int)a3 allowedToBeNowPlaying:(BOOL)a4 canBeNowPlayingApp:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v9 = [(MXNowPlayingAppManager *)self nowPlayingAppDisplayID];
  BOOL v10 = [+[MXSessionManager sharedInstance] defaultMusicApp];
  int v11 = [(NSString *)v9 isEqualToString:v10];
  if (MX_FeatureFlags_IsNowPlayingAppStackEnabled())
  {
    if (objc_msgSend(-[MXNowPlayingAppManager copyTopOfNowPlayingAppStack](self, "copyTopOfNowPlayingAppStack"), "isEqualToString:", v10))BOOL v12 = -[MXNowPlayingAppManager nowPlayingAppStackSize](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "nowPlayingAppStackSize") == 1; {
    else
    }
      BOOL v12 = 0;
    v11 &= v12;
  }
  if (!a3 || v11)
  {
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return 0;
  }
  else
  {
    if (a3 == 3 && !v6)
    {
      unint64_t v13 = @"of new interruption style";
LABEL_22:
      [(MXNowPlayingAppManager *)self resetNowPlayingApp:v13];
      [(MXNowPlayingAppManager *)self writeNowPlayingAppInfoToDisk];
      return 1;
    }
    if (a3 == 4 && !v5)
    {
      unint64_t v13 = @"of canBeNowPlayingApp changed to false";
      goto LABEL_22;
    }
    if (a3 == 2)
    {
      unint64_t v13 = @"app went into background";
      goto LABEL_22;
    }
    int IsNowPlayingAppStackEnabled = MX_FeatureFlags_IsNowPlayingAppStackEnabled();
    BOOL result = 0;
    if (a3 == 7 && IsNowPlayingAppStackEnabled)
    {
      unint64_t v13 = @"Now Playing app stack is being popped";
      goto LABEL_22;
    }
  }
  return result;
}

- (BOOL)setIsNowPlayingApp:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v5 = [(MXNowPlayingAppManager *)self nowPlayingAppPID];
  if (v5 != v3)
  {
    [(MXNowPlayingAppManager *)self setNowPlayingAppPID:0];
    id v6 = [+[MXSessionManager sharedInstance] copySessionEligibleForNowPlayingAppConsideration:v3];
    if (v6)
    {
      [(MXNowPlayingAppManager *)self setNowPlayingAppPID:v3];
      if (!-[NSString isEqualToString:](-[MXNowPlayingAppManager nowPlayingAppDisplayID](self, "nowPlayingAppDisplayID"), "isEqualToString:", [v6 displayID]))
      {
        if (dword_1E9359ED0)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        -[MXNowPlayingAppManager setNowPlayingAppDisplayID:](self, "setNowPlayingAppDisplayID:", objc_msgSend(v6, "displayID", v10, v11));
        if (MX_FeatureFlags_IsNowPlayingAppStackEnabled())
        {
          id v8 = CMSUtility_CopyBundleID(v6);
          -[MXNowPlayingAppManager pushToNowPlayingAppStack:hostProcessAttributionBundleID:](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "pushToNowPlayingAppStack:hostProcessAttributionBundleID:", [v6 displayID], v8);
        }
        [(MXNowPlayingAppManager *)self writeNowPlayingAppInfoToDisk];
      }
    }
  }
  return v5 != v3;
}

- (unint64_t)nowPlayingAppStackSize
{
  [(NSLock *)self->mLock lock];
  unint64_t v3 = [(NSMutableArray *)self->mNowPlayingAppDisplayIDStack count];
  [(NSLock *)self->mLock unlock];
  return v3;
}

- (BOOL)doesNowPlayingAppStackContain:(id)a3
{
  if (a3)
  {
    [(NSLock *)self->mLock lock];
    uint64_t v5 = [(NSMutableDictionary *)self->mNowPlayingAppHostProcessAttributionBundleID objectForKey:a3];
    if (v5) {
      id v6 = (id)v5;
    }
    else {
      id v6 = a3;
    }
    char v7 = [(NSMutableArray *)self->mNowPlayingAppDisplayIDStack containsObject:v6];
    [(NSLock *)self->mLock unlock];
    return v7;
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
}

- (void)pushToNowPlayingAppStack:(id)a3 hostProcessAttributionBundleID:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    unint64_t v7 = [(MXNowPlayingAppManager *)self nowPlayingAppStackSize];
    [(NSLock *)self->mLock lock];
    [(NSMutableArray *)self->mNowPlayingAppDisplayIDStack removeObject:a3];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    mNowPlayingAppHostProcessAttributionBundleID = self->mNowPlayingAppHostProcessAttributionBundleID;
    uint64_t v9 = [(NSMutableDictionary *)mNowPlayingAppHostProcessAttributionBundleID countByEnumeratingWithState:&v21 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(mNowPlayingAppHostProcessAttributionBundleID);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          if (objc_msgSend(a3, "isEqualToString:", -[NSMutableDictionary objectForKey:](self->mNowPlayingAppHostProcessAttributionBundleID, "objectForKey:", v13)))
          {
            [(NSMutableDictionary *)self->mNowPlayingAppHostProcessAttributionBundleID removeObjectForKey:v13];
            goto LABEL_12;
          }
        }
        uint64_t v10 = [(NSMutableDictionary *)mNowPlayingAppHostProcessAttributionBundleID countByEnumeratingWithState:&v21 objects:v37 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_12:
    [(NSMutableArray *)self->mNowPlayingAppDisplayIDStack addObject:a3];
    if (a4) {
      [(NSMutableDictionary *)self->mNowPlayingAppHostProcessAttributionBundleID setObject:a3 forKey:a4];
    }
    [(NSLock *)self->mLock unlock];
    if (dword_1E9359ED0)
    {
      unsigned int v26 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v15 = v26;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
        unsigned int v16 = v15;
      }
      else {
        unsigned int v16 = v15 & 0xFFFFFFFE;
      }
      if (v16)
      {
        unint64_t v17 = [(MXNowPlayingAppManager *)self nowPlayingAppStackSize];
        int v27 = 136316162;
        v28 = "-[MXNowPlayingAppManager pushToNowPlayingAppStack:hostProcessAttributionBundleID:]";
        __int16 v29 = 2114;
        id v30 = a3;
        __int16 v31 = 2114;
        id v32 = a4;
        __int16 v33 = 2048;
        unint64_t v34 = v7;
        __int16 v35 = 2048;
        unint64_t v36 = v17;
        LODWORD(v20) = 52;
        uint64_t v19 = &v27;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if ([(MXNowPlayingAppManager *)self nowPlayingAppStackSize] >= 6) {
      [(MXNowPlayingAppManager *)self popNowPlayingAppStackOldestDisplayID];
    }
    [(MXNowPlayingAppManager *)self writeNowPlayingAppInfoToDisk];
  }
  else
  {
    v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)popNowPlayingAppStack
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->mLock lock];
  if (dword_1E9359ED0)
  {
    int v18 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ([(NSMutableArray *)self->mNowPlayingAppDisplayIDStack count])
  {
    objc_super v4 = (void *)[(NSMutableArray *)self->mNowPlayingAppDisplayIDStack lastObject];
    [(NSMutableArray *)self->mNowPlayingAppDisplayIDStack removeObject:v4];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    mNowPlayingAppHostProcessAttributionBundleID = self->mNowPlayingAppHostProcessAttributionBundleID;
    uint64_t v6 = [(NSMutableDictionary *)mNowPlayingAppHostProcessAttributionBundleID countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(mNowPlayingAppHostProcessAttributionBundleID);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v4, "isEqualToString:", -[NSMutableDictionary objectForKey:](self->mNowPlayingAppHostProcessAttributionBundleID, "objectForKey:", v10)))
          {
            [(NSMutableDictionary *)self->mNowPlayingAppHostProcessAttributionBundleID removeObjectForKey:v10];
            goto LABEL_14;
          }
        }
        uint64_t v7 = [(NSMutableDictionary *)mNowPlayingAppHostProcessAttributionBundleID countByEnumeratingWithState:&v13 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
LABEL_14:
  if (![(NSMutableArray *)self->mNowPlayingAppDisplayIDStack count]) {
    [(NSMutableArray *)self->mNowPlayingAppDisplayIDStack addObject:[+[MXSessionManager sharedInstance] defaultMusicApp]];
  }
  [(MXNowPlayingAppManager *)self setNowPlayingAppDisplayID:[(NSMutableArray *)self->mNowPlayingAppDisplayIDStack lastObject]];
  [(MXNowPlayingAppManager *)self setNowPlayingAppPID:0];
  [(MXNowPlayingAppManager *)self setNowPlayingAppStopTime:0];
  [(NSLock *)self->mLock unlock];
  [(MXNowPlayingAppManager *)self writeNowPlayingAppInfoToDisk];
}

- (void)removeFromNowPlayingAppStack:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [(NSLock *)self->mLock lock];
    uint64_t v5 = [(NSMutableArray *)self->mNowPlayingAppDisplayIDStack lastObject];
    uint64_t v6 = [(NSMutableDictionary *)self->mNowPlayingAppHostProcessAttributionBundleID objectForKey:a3];
    if (v6) {
      id v7 = (id)v6;
    }
    else {
      id v7 = a3;
    }
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[NSMutableArray removeObject:](self->mNowPlayingAppDisplayIDStack, "removeObject:", v7, v12, v13);
    [(NSMutableDictionary *)self->mNowPlayingAppHostProcessAttributionBundleID removeObjectForKey:a3];
    if (![(NSMutableArray *)self->mNowPlayingAppDisplayIDStack count]) {
      [(NSMutableArray *)self->mNowPlayingAppDisplayIDStack addObject:[+[MXSessionManager sharedInstance] defaultMusicApp]];
    }
    uint64_t v10 = (void *)[(NSMutableArray *)self->mNowPlayingAppDisplayIDStack lastObject];
    int v11 = [v10 isEqualToString:v5];
    if ((v11 & 1) == 0)
    {
      [(MXNowPlayingAppManager *)self setNowPlayingAppDisplayID:v10];
      [(MXNowPlayingAppManager *)self setNowPlayingAppPID:0];
      [(MXNowPlayingAppManager *)self setNowPlayingAppStopTime:0];
    }
    [(NSLock *)self->mLock unlock];
    +[MXNowPlayingAppManager processNowPlayingAppPIDChangeIfNeeded:v11 ^ 1u];
    [(MXNowPlayingAppManager *)self writeNowPlayingAppInfoToDisk];
  }
  else
  {
    uint64_t v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)populateNowPlayingAppStack:(id)a3 hostProcessAttributionBundleID:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(a3);
        }
        -[MXNowPlayingAppManager pushToNowPlayingAppStack:hostProcessAttributionBundleID:](self, "pushToNowPlayingAppStack:hostProcessAttributionBundleID:", *(void *)(*((void *)&v11 + 1) + 8 * v10), [a4 objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * v10)]);
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
  if (![(MXNowPlayingAppManager *)self nowPlayingAppStackSize]) {
    [(MXNowPlayingAppManager *)self pushToNowPlayingAppStack:[+[MXSessionManager sharedInstance] defaultMusicApp] hostProcessAttributionBundleID:0];
  }
  [(MXNowPlayingAppManager *)self writeNowPlayingAppInfoToDisk];
}

- (void)popNowPlayingAppStackOldestDisplayID
{
  [(NSLock *)self->mLock lock];
  uint64_t v3 = [(NSMutableArray *)self->mNowPlayingAppDisplayIDStack objectAtIndex:0];
  [(NSMutableDictionary *)self->mNowPlayingAppHostProcessAttributionBundleID removeObjectForKey:v3];
  [(NSMutableArray *)self->mNowPlayingAppDisplayIDStack removeObject:v3];
  mLock = self->mLock;
  [(NSLock *)mLock unlock];
}

- (void)saveNowPlayingAppStackToDisk
{
  [(NSLock *)self->mLock lock];
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  MXCFPreferencesSetAndSynchronizeUserPreference(@"nowPlayingAppDisplayIDStack", self->mNowPlayingAppDisplayIDStack);
  MXCFPreferencesSetAndSynchronizeUserPreference(@"nowPlayingAppHostProcessAttributionBundleID", self->mNowPlayingAppHostProcessAttributionBundleID);
  [(NSLock *)self->mLock unlock];
}

- (void)clearNowPlayingAppStack
{
  [(NSLock *)self->mLock lock];
  [(NSMutableArray *)self->mNowPlayingAppDisplayIDStack removeAllObjects];
  [(NSMutableDictionary *)self->mNowPlayingAppHostProcessAttributionBundleID removeAllObjects];
  mLock = self->mLock;
  [(NSLock *)mLock unlock];
}

- (void)updateNowPlayingAppStackFromDisk
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_super v4 = (void *)MXCFPreferencesCopyPreference(@"nowPlayingAppDisplayIDStack");
  uint64_t v5 = (void *)MXCFPreferencesCopyPreference(@"nowPlayingAppHostProcessAttributionBundleID");
  [(MXNowPlayingAppManager *)self clearNowPlayingAppStack];
  if (v4)
  {
    if (!v5) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (!v5)
    {
LABEL_7:
      uint64_t v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  -[MXNowPlayingAppManager populateNowPlayingAppStack:hostProcessAttributionBundleID:](self, "populateNowPlayingAppStack:hostProcessAttributionBundleID:", v4, v5, v8, v9);
}

- (void)dumpNowPlayingAppInfo
{
  [(NSLock *)self->mLock lock];
  uint64_t v3 = (void *)[(NSMutableArray *)self->mNowPlayingAppDisplayIDStack copy];
  objc_super v4 = (void *)[(NSMutableDictionary *)self->mNowPlayingAppHostProcessAttributionBundleID copy];
  [(NSLock *)self->mLock unlock];
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1E9359ED0)
    {
      uint64_t v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      if (dword_1E9359ED0)
      {
        uint64_t v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
  }
  CMSMDebugUtility_PrintCollection(v3);
  if (dword_1E9359ED0)
  {
    uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CMSMDebugUtility_PrintDictionary(v4);
  if (dword_1E9359ED0)
  {
    uint64_t v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (OS_dispatch_source)writeNowPlayingAppToDiskTimer
{
  return self->_writeNowPlayingAppToDiskTimer;
}

- (void)setNowPlayingAppPID:(int)a3
{
  self->_nowPlayingAppPID = a3;
}

- (NSString)nowPlayingAppDisplayID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNowPlayingAppDisplayID:(id)a3
{
}

- (NSDate)nowPlayingAppStopTime
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNowPlayingAppStopTime:(id)a3
{
}

@end