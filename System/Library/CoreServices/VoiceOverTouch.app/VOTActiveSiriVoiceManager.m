@interface VOTActiveSiriVoiceManager
+ (id)sharedInstance;
- (id)_init;
- (id)siriVoiceIdentifierForLanguage:(id)a3;
- (void)_deregisterForNotifications;
- (void)_handleSiriVoiceUpdate;
- (void)_registerForNotifications;
- (void)dealloc;
@end

@implementation VOTActiveSiriVoiceManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B2428;
  block[3] = &unk_1001B3580;
  block[4] = a1;
  if (qword_1001EBA20 != -1) {
    dispatch_once(&qword_1001EBA20, block);
  }
  v2 = (void *)qword_1001EBA28;

  return v2;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)VOTActiveSiriVoiceManager;
  v2 = [(VOTActiveSiriVoiceManager *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init((Class)NSLock);
    cachedSiriVoiceLock = v2->_cachedSiriVoiceLock;
    v2->_cachedSiriVoiceLock = v3;

    [(VOTActiveSiriVoiceManager *)v2 _registerForNotifications];
  }
  return v2;
}

- (void)dealloc
{
  [(VOTActiveSiriVoiceManager *)self _deregisterForNotifications];
  v3.receiver = self;
  v3.super_class = (Class)VOTActiveSiriVoiceManager;
  [(VOTActiveSiriVoiceManager *)&v3 dealloc];
}

- (void)_registerForNotifications
{
  p_gryphonInstallNotifyToken = &self->_gryphonInstallNotifyToken;
  if (self->_gryphonInstallNotifyToken == -1)
  {
    objc_initWeak(&location, self);
    id v4 = &_dispatch_main_q;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000B2640;
    v6[3] = &unk_1001B60A8;
    objc_copyWeak(&v7, &location);
    notify_register_dispatch("com.apple.MobileAsset.VoiceServices.GryphonVoice.ma.new-asset-installed", p_gryphonInstallNotifyToken, (dispatch_queue_t)&_dispatch_main_q, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1000B2680, @"com.apple.ttsasset.NewAssetNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_deregisterForNotifications
{
  int gryphonInstallNotifyToken = self->_gryphonInstallNotifyToken;
  if (gryphonInstallNotifyToken != -1)
  {
    notify_cancel(gryphonInstallNotifyToken);
    self->_int gryphonInstallNotifyToken = -1;
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.ttsasset.NewAssetNotification", 0);
}

- (void)_handleSiriVoiceUpdate
{
  objc_super v3 = AXLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Siri voice updated, refetching active siri", v5, 2u);
  }

  [(NSLock *)self->_cachedSiriVoiceLock lock];
  cachedSiriVoiceAsset = self->_cachedSiriVoiceAsset;
  self->_cachedSiriVoiceAsset = 0;

  [(NSLock *)self->_cachedSiriVoiceLock unlock];
}

- (id)siriVoiceIdentifierForLanguage:(id)a3
{
  id v4 = a3;
  v5 = +[AFConnection outputVoice];
  objc_super v6 = AXLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Active siri: %@", buf, 0xCu);
  }

  if (!v5)
  {
    id v8 = 0;
    goto LABEL_27;
  }
  [(NSLock *)self->_cachedSiriVoiceLock lock];
  if (![(TTSVoiceAsset *)self->_cachedSiriVoiceAsset isEligibleForVOTWithVoiceInfo:v5 language:v4])
  {
    [(NSLock *)self->_cachedSiriVoiceLock unlock];
    goto LABEL_9;
  }
  id v7 = [(TTSVoiceAsset *)self->_cachedSiriVoiceAsset identifier];
  [(NSLock *)self->_cachedSiriVoiceLock unlock];
  if (!v7)
  {
LABEL_9:
    +[TTSSiriAssetManager installedAssetsForLanguage:0 voiceType:4];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    v11 = "\"";
    if (v10)
    {
      id v12 = v10;
      id location = (id *)&self->_cachedSiriVoiceAsset;
      v21 = self;
      uint64_t v13 = *(void *)v23;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v9);
          }
          v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v16 = AXLogCommon();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v15;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "checking asset: %@", buf, 0xCu);
          }

          if ([v15 isEligibleForVOTWithVoiceInfo:v5 language:v4])
          {
            [(NSLock *)v21->_cachedSiriVoiceLock lock];
            objc_storeStrong(location, v15);
            [(NSLock *)v21->_cachedSiriVoiceLock unlock];
            v17 = [v15 identifier];
            goto LABEL_21;
          }
        }
        id v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16, location);
        if (v12) {
          continue;
        }
        break;
      }
      v17 = 0;
LABEL_21:
      v11 = "@\"NSUUID\"" + 8;
    }
    else
    {
      v17 = 0;
    }

    v18 = AXLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = *((void *)v11 + 155);
      v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Using siri identifier: %@", buf, 0xCu);
    }

    id v8 = v17;
    goto LABEL_26;
  }
  id v8 = v7;
LABEL_26:

LABEL_27:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSiriVoiceAsset, 0);

  objc_storeStrong((id *)&self->_cachedSiriVoiceLock, 0);
}

@end