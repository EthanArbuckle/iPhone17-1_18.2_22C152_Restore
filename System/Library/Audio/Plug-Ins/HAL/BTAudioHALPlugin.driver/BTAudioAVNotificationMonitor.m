@interface BTAudioAVNotificationMonitor
+ (id)sharedInstance;
- (BOOL)isBluetoothRoute;
- (BOOL)isRouteAvailable;
- (BOOL)isVolumeUpdateToAccessoryRequired:(id)a3;
- (BTAudioAVNotificationMonitor)init;
- (MXSystemController)systemController;
- (NSMutableSet)deviceList;
- (NSNumber)isPersonalizedVolumeUpdate;
- (NSNumber)processManualVolumeUpdates;
- (NSString)currentActiveVolumeAudioCategory;
- (NSString)currentDeviceUID;
- (NSString)nowPlayingBundleID;
- (NSString)reasonForManualVolumeUpdate;
- (OS_dispatch_queue)manualVolumeUpdatesQueue;
- (OS_dispatch_queue)mediaAVNotificationQueue;
- (id).cxx_construct;
- (id)getPersonalizedVolumeDevice:(id)a3;
- (void)choosePickableRoute;
- (void)dealloc;
- (void)nowPlayingAppChanged:(id)a3;
- (void)personalizedVolumeEnabled:(BOOL)a3;
- (void)processManualVolumeUpdates:(BOOL)a3;
- (void)refreshNowPlayingAppBundleID;
- (void)registerNowPlayingListener:(unsigned int)a3;
- (void)registerPersonalizedVolumeListener:(unsigned int)a3 deviceUID:(id)a4;
- (void)registerVolumeChangedListener:(unsigned int)a3;
- (void)sendManualVolumeUpdate:(unsigned __int8)a3;
- (void)setCurrentActiveVolumeAudioCategory:(id)a3;
- (void)setCurrentDeviceUID:(id)a3;
- (void)setDeviceList:(id)a3;
- (void)setIsPersonalizedVolumeUpdate:(id)a3;
- (void)setManualVolumeUpdatesQueue:(id)a3;
- (void)setMediaAVNotificationQueue:(id)a3;
- (void)setNowPlayingBundleID:(id)a3;
- (void)setProcessManualVolumeUpdates:(id)a3;
- (void)setReasonForManualVolumeUpdate:(id)a3;
- (void)setSystemController:(id)a3;
- (void)unRegisterNowPlayingListener:(unsigned int)a3;
- (void)unRegisterPersonalizedVolumeListener:(unsigned int)a3 deviceUID:(id)a4;
- (void)unregisterRouteChangeListener;
- (void)unregisterVolumeChangedListener:(unsigned int)a3;
- (void)updateVolumeDelta:(float)a3 uid:(__CFString *)a4;
- (void)updateVolumeForCategories:(float)a3 telephoneVolume:(float)a4 voiceCommandVolume:(float)a5 uid:(__CFString *)a6 rampUpDuration:(float)a7 rampDownDuration:(float)a8;
@end

@implementation BTAudioAVNotificationMonitor

+ (id)sharedInstance
{
  v4[0] = 0;
  v4[1] = 0;
  sub_5CDCC((uint64_t)v4, (uint64_t)&unk_A1A30);
  v2 = (BTAudioAVNotificationMonitor *)qword_A1A70;
  if (!qword_A1A70)
  {
    v2 = objc_alloc_init(BTAudioAVNotificationMonitor);
    qword_A1A70 = (uint64_t)v2;
  }
  sub_5CF10(v4);
  return v2;
}

- (BTAudioAVNotificationMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)BTAudioAVNotificationMonitor;
  v2 = [(BTAudioAVNotificationMonitor *)&v6 init];
  if (v2)
  {
    v2->_mediaAVNotificationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.BTAudioHALPlugin.BTAudioAVNotificationMonitor.MainQueue", 0);
    v2->_manualVolumeUpdatesQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.BTAudioHALPlugin.BTAudioAVNotificationMonitor.ManaualVolumeUpdatesQueue", 0);
    v2->_systemController = (MXSystemController *)[objc_alloc((Class)MXSystemController) initWithPID:getpid()];
    mediaAVNotificationQueue = v2->_mediaAVNotificationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_192D4;
    block[3] = &unk_8DC00;
    block[4] = v2;
    dispatch_async(mediaAVNotificationQueue, block);
  }
  return v2;
}

- (void)dealloc
{
  if (self->_systemController)
  {
    CMSessionGetNotificationCenter();
    FigNotificationCenterRemoveWeakListener();
    if (_os_feature_enabled_impl())
    {
      CMSessionGetNotificationCenter();
      FigNotificationCenterRemoveWeakListener();
    }
    [(BTAudioAVNotificationMonitor *)self unregisterRouteChangeListener];

    self->_systemController = 0;
  }

  v3 = qword_A1A28;
  if (os_log_type_enabled((os_log_t)qword_A1A28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "BTAudioAVNotificationMonitor: dealloc", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)BTAudioAVNotificationMonitor;
  [(BTAudioAVNotificationMonitor *)&v4 dealloc];
}

- (void)registerVolumeChangedListener:(unsigned int)a3
{
  mediaAVNotificationQueue = self->_mediaAVNotificationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_19C2C;
  v4[3] = &unk_8DED0;
  unsigned int v5 = a3;
  v4[4] = self;
  dispatch_async((dispatch_queue_t)mediaAVNotificationQueue, v4);
}

- (void)unregisterVolumeChangedListener:(unsigned int)a3
{
  mediaAVNotificationQueue = self->_mediaAVNotificationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_19DA0;
  v4[3] = &unk_8DED0;
  unsigned int v5 = a3;
  v4[4] = self;
  dispatch_async((dispatch_queue_t)mediaAVNotificationQueue, v4);
}

- (void)choosePickableRoute
{
  id location = 0;
  objc_initWeak(&location, self->_systemController);
  mediaAVNotificationQueue = self->_mediaAVNotificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_19F2C;
  block[3] = &unk_8DEF8;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async((dispatch_queue_t)mediaAVNotificationQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)registerPersonalizedVolumeListener:(unsigned int)a3 deviceUID:(id)a4
{
  manualVolumeUpdatesQueue = self->_manualVolumeUpdatesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1A1C8;
  block[3] = &unk_8DF20;
  block[4] = a4;
  void block[5] = self;
  unsigned int v6 = a3;
  dispatch_async((dispatch_queue_t)manualVolumeUpdatesQueue, block);
}

- (id)getPersonalizedVolumeDevice:(id)a3
{
  if (a3)
  {
    id v4 = -[NSMutableDictionary objectForKey:](self->_btAudioDeviceDict, "objectForKey:", objc_msgSend(objc_msgSend(a3, "componentsSeparatedByString:", @"-"), "firstObject"));

    return v4;
  }
  else
  {
    unsigned int v6 = qword_A1A28;
    if (os_log_type_enabled((os_log_t)qword_A1A28, OS_LOG_TYPE_ERROR)) {
      sub_651F0(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    return 0;
  }
}

- (void)unRegisterPersonalizedVolumeListener:(unsigned int)a3 deviceUID:(id)a4
{
  manualVolumeUpdatesQueue = self->_manualVolumeUpdatesQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1A408;
  v5[3] = &unk_8DBD8;
  v5[4] = a4;
  v5[5] = self;
  dispatch_async((dispatch_queue_t)manualVolumeUpdatesQueue, v5);
}

- (void)personalizedVolumeEnabled:(BOOL)a3
{
  self->_personalizedVolumeEnabled = a3;
}

- (BOOL)isBluetoothRoute
{
  if (self->_currentDeviceUID)
  {
    btAudioDeviceDict = self->_btAudioDeviceDict;
    if (btAudioDeviceDict) {
      LOBYTE(btAudioDeviceDict) = -[NSMutableDictionary objectForKey:](btAudioDeviceDict, "objectForKey:") != 0;
    }
  }
  else
  {
    LOBYTE(btAudioDeviceDict) = 0;
  }
  return (char)btAudioDeviceDict;
}

- (void)setCurrentActiveVolumeAudioCategory:(id)a3
{
  self->_currentActiveVolumeAudioCategory = (NSString *)a3;
}

- (void)processManualVolumeUpdates:(BOOL)a3
{
  mediaAVNotificationQueue = self->_mediaAVNotificationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_1A5FC;
  v4[3] = &unk_8DF48;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)mediaAVNotificationQueue, v4);
}

- (void)sendManualVolumeUpdate:(unsigned __int8)a3
{
  isPersonalizedVolumeUpdate = self->_isPersonalizedVolumeUpdate;
  currentDeviceUID = self->_currentDeviceUID;
  currentActiveVolumeAudioCategory = self->_currentActiveVolumeAudioCategory;
  v13[0] = @"CurrentAudioCategory";
  v13[1] = @"IsPersonalizedVolumeUpdate";
  v14[0] = currentActiveVolumeAudioCategory;
  v14[1] = isPersonalizedVolumeUpdate;
  v13[2] = @"ManualVolumeUpdate";
  v14[2] = +[NSNumber numberWithInt:a3];
  v14[3] = &off_91668;
  v13[3] = @"RampInProgress";
  v13[4] = @"PersonalizedVolumeEnabled";
  uint64_t v7 = +[NSNumber numberWithInt:self->_personalizedVolumeEnabled];
  CFStringRef nowPlayingBundleID = (const __CFString *)self->_nowPlayingBundleID;
  if (!nowPlayingBundleID) {
    CFStringRef nowPlayingBundleID = &stru_90900;
  }
  v14[4] = v7;
  v14[5] = nowPlayingBundleID;
  v13[5] = @"BundleID";
  v13[6] = @"ReasonForManualUpdate";
  v14[6] = self->_reasonForManualVolumeUpdate;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:7];
  uint64_t v10 = currentDeviceUID;
  manualVolumeUpdatesQueue = self->_manualVolumeUpdatesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1A814;
  block[3] = &unk_8DF70;
  block[4] = self;
  void block[5] = currentDeviceUID;
  void block[6] = v9;
  block[7] = isPersonalizedVolumeUpdate;
  dispatch_async((dispatch_queue_t)manualVolumeUpdatesQueue, block);
}

- (void)registerNowPlayingListener:(unsigned int)a3
{
  mediaAVNotificationQueue = self->_mediaAVNotificationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_1A8FC;
  v4[3] = &unk_8DED0;
  unsigned int v5 = a3;
  v4[4] = self;
  dispatch_async((dispatch_queue_t)mediaAVNotificationQueue, v4);
}

- (void)updateVolumeDelta:(float)a3 uid:(__CFString *)a4
{
  id location = 0;
  objc_initWeak(&location, self->_systemController);
  mediaAVNotificationQueue = self->_mediaAVNotificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1AAE8;
  block[3] = &unk_8DF98;
  objc_copyWeak(v9, &location);
  float v10 = a3;
  v9[1] = a4;
  block[4] = self;
  dispatch_async((dispatch_queue_t)mediaAVNotificationQueue, block);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)updateVolumeForCategories:(float)a3 telephoneVolume:(float)a4 voiceCommandVolume:(float)a5 uid:(__CFString *)a6 rampUpDuration:(float)a7 rampDownDuration:(float)a8
{
  id location = 0;
  objc_initWeak(&location, self->_systemController);
  mediaAVNotificationQueue = self->_mediaAVNotificationQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1AD8C;
  v16[3] = &unk_8DFC0;
  objc_copyWeak(v17, &location);
  float v18 = a3;
  float v19 = a4;
  float v20 = a5;
  float v21 = a7;
  float v22 = a8;
  v17[1] = a6;
  dispatch_async((dispatch_queue_t)mediaAVNotificationQueue, v16);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

- (void)unRegisterNowPlayingListener:(unsigned int)a3
{
  mediaAVNotificationQueue = self->_mediaAVNotificationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_1AFEC;
  v4[3] = &unk_8DED0;
  unsigned int v5 = a3;
  v4[4] = self;
  dispatch_async((dispatch_queue_t)mediaAVNotificationQueue, v4);
}

- (void)nowPlayingAppChanged:(id)a3
{
  id v19 = 0;
  unsigned int v5 = qword_A1A28;
  if (os_log_type_enabled((os_log_t)qword_A1A28, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef nowPlayingBundleID = self->_nowPlayingBundleID;
    *(_DWORD *)buf = 138412546;
    float v22 = nowPlayingBundleID;
    __int16 v23 = 2112;
    id v24 = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "BTAudioAVNotificationMonitor: via nowPlayingAppBundleID,  Now Playing App changed  %@ -> %@ ", buf, 0x16u);
  }
  if (a3)
  {
    id v19 = a3;
  }
  else
  {
    uint64_t v7 = [(BTAudioAVNotificationMonitor *)self systemController];
    [(MXSystemController *)v7 copyAttributeForKey:kMXSystemControllerProperty_NowPlayingAppDisplayID withValueOut:&v19];
    uint64_t v8 = qword_A1A28;
    BOOL v9 = os_log_type_enabled((os_log_t)qword_A1A28, OS_LOG_TYPE_DEFAULT);
    a3 = v19;
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      float v22 = (NSString *)v19;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "BTAudioAVNotificationMonitor: Bundle ID for Now Playing App was NULL. Querying directly. Value received %@", buf, 0xCu);
      a3 = v19;
    }
  }
  [(BTAudioAVNotificationMonitor *)self setNowPlayingBundleID:a3];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  deviceList = self->_deviceList;
  id v11 = [(NSMutableSet *)deviceList countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(deviceList);
        }
        sub_44B38(qword_A2350, [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) unsignedIntValue]);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSMutableSet *)deviceList countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v12);
  }
}

- (void)refreshNowPlayingAppBundleID
{
  uint64_t v5 = 0;
  v3 = [(BTAudioAVNotificationMonitor *)self systemController];
  [(MXSystemController *)v3 copyAttributeForKey:kMXSystemControllerProperty_NowPlayingAppDisplayID withValueOut:&v5];
  id v4 = qword_A1A28;
  if (os_log_type_enabled((os_log_t)qword_A1A28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "BTAudioAVNotificationMonitor: Refresh Now playing Bundle ID %@", buf, 0xCu);
  }
  if (v5) {
    -[BTAudioAVNotificationMonitor nowPlayingAppChanged:](self, "nowPlayingAppChanged:");
  }
}

- (BOOL)isRouteAvailable
{
  uint64_t v5 = 0;
  v2 = [(BTAudioAVNotificationMonitor *)self systemController];
  [(MXSystemController *)v2 copyAttributeForKey:kMXSystemControllerProperty_ActiveAudioRoute withValueOut:&v5];
  v3 = qword_A1A28;
  if (os_log_type_enabled((os_log_t)qword_A1A28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "BTAudioAVNotificationMonitor: Refresh Route Info %@", buf, 0xCu);
  }
  return v5 != 0;
}

- (void)unregisterRouteChangeListener
{
  v2 = qword_A1A28;
  if (os_log_type_enabled((os_log_t)qword_A1A28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "BTAudioAVNotificationMonitor: Unregister Route listner", v3, 2u);
  }
  CMSessionGetNotificationCenter();
  FigNotificationCenterRemoveWeakListener();
}

- (BOOL)isVolumeUpdateToAccessoryRequired:(id)a3
{
  uint64_t v5 = qword_A1A28;
  if (os_log_type_enabled((os_log_t)qword_A1A28, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [(NSMutableArray *)self->_sequenceArray containsObject:a3];
    uint64_t v7 = "No";
    if (v6) {
      uint64_t v7 = "Yes";
    }
    int v12 = 138412546;
    id v13 = a3;
    __int16 v14 = 2080;
    long long v15 = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "BTAudioAVNotificationMonitor: is sequenceNumber %@ in _sequenceArray %s", (uint8_t *)&v12, 0x16u);
  }
  unsigned int v8 = [(NSMutableArray *)self->_sequenceArray containsObject:a3];
  if (v8)
  {
    [(NSMutableArray *)self->_sequenceArray removeObject:a3];
    BOOL v9 = qword_A1A28;
    if (os_log_type_enabled((os_log_t)qword_A1A28, OS_LOG_TYPE_DEFAULT))
    {
      sequenceArray = self->_sequenceArray;
      int v12 = 138412290;
      id v13 = sequenceArray;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "BTAudioAVNotificationMonitor: sequenceArray contents %@", (uint8_t *)&v12, 0xCu);
    }
  }
  return v8 ^ 1;
}

- (NSString)nowPlayingBundleID
{
  return self->_nowPlayingBundleID;
}

- (void)setNowPlayingBundleID:(id)a3
{
}

- (MXSystemController)systemController
{
  return self->_systemController;
}

- (void)setSystemController:(id)a3
{
}

- (NSMutableSet)deviceList
{
  return self->_deviceList;
}

- (void)setDeviceList:(id)a3
{
}

- (NSString)currentActiveVolumeAudioCategory
{
  return self->_currentActiveVolumeAudioCategory;
}

- (NSNumber)processManualVolumeUpdates
{
  return self->_processManualVolumeUpdates;
}

- (void)setProcessManualVolumeUpdates:(id)a3
{
}

- (NSNumber)isPersonalizedVolumeUpdate
{
  return self->_isPersonalizedVolumeUpdate;
}

- (void)setIsPersonalizedVolumeUpdate:(id)a3
{
}

- (OS_dispatch_queue)mediaAVNotificationQueue
{
  return self->_mediaAVNotificationQueue;
}

- (void)setMediaAVNotificationQueue:(id)a3
{
}

- (NSString)currentDeviceUID
{
  return self->_currentDeviceUID;
}

- (void)setCurrentDeviceUID:(id)a3
{
}

- (NSString)reasonForManualVolumeUpdate
{
  return self->_reasonForManualVolumeUpdate;
}

- (void)setReasonForManualVolumeUpdate:(id)a3
{
}

- (OS_dispatch_queue)manualVolumeUpdatesQueue
{
  return self->_manualVolumeUpdatesQueue;
}

- (void)setManualVolumeUpdatesQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end