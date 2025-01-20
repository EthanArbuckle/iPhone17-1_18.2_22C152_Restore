@interface NCSettingsGatewayController
+ (id)sharedInstance;
- (NCSettingsGatewayController)init;
- (id)activeSectionInfo;
- (id)effectiveGlobalScheduledDeliveryTimes;
- (int64_t)effectiveGlobalAnnounceCarPlaySetting;
- (int64_t)effectiveGlobalAnnounceHeadphonesSetting;
- (int64_t)effectiveGlobalAnnounceSetting;
- (int64_t)effectiveGlobalContentPreviewsSetting;
- (int64_t)effectiveGlobalHighlightsSetting;
- (int64_t)effectiveGlobalNotificationListDisplayStyleSetting;
- (int64_t)effectiveGlobalScheduledDeliverySetting;
- (int64_t)effectiveGlobalScheduledDeliveryShowNextSummarySetting;
- (int64_t)effectiveGlobalSummarizationSetting;
- (void)_applicationDidEnterBackgroundNotification:(id)a3;
- (void)_applicationWillEnterForegroundNotification:(id)a3;
- (void)_createSettingsObserverIfNeeded;
- (void)_invalidateSettingsObserver;
- (void)_queue_addObserver:(id)a3;
- (void)_queue_applicationDidEnterBackgroundNotification:(id)a3;
- (void)_queue_removeObserver:(id)a3;
- (void)addObserver:(id)a3;
- (void)observer:(id)a3 updateGlobalSettings:(id)a4;
- (void)observer:(id)a3 updateSectionInfo:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setEffectiveGlobalAnnounceCarPlaySetting:(int64_t)a3;
- (void)setEffectiveGlobalAnnounceHeadphonesSetting:(int64_t)a3;
- (void)setEffectiveGlobalAnnounceSetting:(int64_t)a3;
- (void)setEffectiveGlobalContentPreviewsSetting:(int64_t)a3;
- (void)setEffectiveGlobalHighlightsSetting:(int64_t)a3;
- (void)setEffectiveGlobalNotificationListDisplayStyleSetting:(int64_t)a3;
- (void)setEffectiveGlobalScheduledDeliverySetting:(int64_t)a3;
- (void)setEffectiveGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3;
- (void)setEffectiveGlobalScheduledDeliveryTimes:(id)a3;
- (void)setEffectiveGlobalSummarizationSetting:(int64_t)a3;
- (void)setSectionInfo:(id)a3 forSectionID:(id)a4;
@end

@implementation NCSettingsGatewayController

+ (id)sharedInstance
{
  if (qword_50138 != -1) {
    dispatch_once(&qword_50138, &stru_410A0);
  }
  v2 = (void *)qword_50130;

  return v2;
}

- (NCSettingsGatewayController)init
{
  v13.receiver = self;
  v13.super_class = (Class)NCSettingsGatewayController;
  v2 = [(NCSettingsGatewayController *)&v13 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.notificationssettings.gateway", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (BBSettingsGateway *)[objc_alloc((Class)BBSettingsGateway) initWithQueue:v2->_queue];
    gateway = v2->_gateway;
    v2->_gateway = v6;

    uint64_t v8 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (NSMutableArray *)v8;

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v2 selector:"_applicationWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:0];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"_applicationDidEnterBackgroundNotification:" name:UIApplicationDidEnterBackgroundNotification object:0];

    [(NCSettingsGatewayController *)v2 _createSettingsObserverIfNeeded];
  }
  return v2;
}

- (void)_createSettingsObserverIfNeeded
{
  if (!self->_settingsObserver)
  {
    v3 = (BBObserver *)[objc_alloc((Class)BBObserver) initWithQueue:self->_queue];
    settingsObserver = self->_settingsObserver;
    self->_settingsObserver = v3;

    [(BBObserver *)self->_settingsObserver setObserverFeed:512];
    v5 = self->_settingsObserver;
    [(BBObserver *)v5 setDelegate:self];
  }
}

- (void)_invalidateSettingsObserver
{
  [(BBObserver *)self->_settingsObserver invalidate];
  settingsObserver = self->_settingsObserver;
  self->_settingsObserver = 0;
}

- (void)setSectionInfo:(id)a3 forSectionID:(id)a4
{
}

- (id)activeSectionInfo
{
  return [(BBSettingsGateway *)self->_gateway activeSectionInfo];
}

- (int64_t)effectiveGlobalContentPreviewsSetting
{
  return (int64_t)[(BBSettingsGateway *)self->_gateway effectiveGlobalContentPreviewsSetting];
}

- (void)setEffectiveGlobalContentPreviewsSetting:(int64_t)a3
{
}

- (int64_t)effectiveGlobalAnnounceSetting
{
  return (int64_t)[(BBSettingsGateway *)self->_gateway effectiveGlobalAnnounceSetting];
}

- (void)setEffectiveGlobalAnnounceSetting:(int64_t)a3
{
}

- (int64_t)effectiveGlobalAnnounceHeadphonesSetting
{
  return (int64_t)[(BBSettingsGateway *)self->_gateway effectiveGlobalAnnounceHeadphonesSetting];
}

- (void)setEffectiveGlobalAnnounceHeadphonesSetting:(int64_t)a3
{
}

- (int64_t)effectiveGlobalAnnounceCarPlaySetting
{
  return (int64_t)[(BBSettingsGateway *)self->_gateway effectiveGlobalAnnounceCarPlaySetting];
}

- (void)setEffectiveGlobalAnnounceCarPlaySetting:(int64_t)a3
{
}

- (int64_t)effectiveGlobalScheduledDeliverySetting
{
  return (int64_t)[(BBSettingsGateway *)self->_gateway effectiveGlobalScheduledDeliverySetting];
}

- (void)setEffectiveGlobalScheduledDeliverySetting:(int64_t)a3
{
}

- (id)effectiveGlobalScheduledDeliveryTimes
{
  return [(BBSettingsGateway *)self->_gateway effectiveGlobalScheduledDeliveryTimes];
}

- (void)setEffectiveGlobalScheduledDeliveryTimes:(id)a3
{
}

- (int64_t)effectiveGlobalScheduledDeliveryShowNextSummarySetting
{
  return (int64_t)[(BBSettingsGateway *)self->_gateway effectiveGlobalScheduledDeliveryShowNextSummarySetting];
}

- (void)setEffectiveGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3
{
}

- (int64_t)effectiveGlobalNotificationListDisplayStyleSetting
{
  return (int64_t)[(BBSettingsGateway *)self->_gateway effectiveGlobalNotificationListDisplayStyleSetting];
}

- (void)setEffectiveGlobalNotificationListDisplayStyleSetting:(int64_t)a3
{
}

- (int64_t)effectiveGlobalSummarizationSetting
{
  return (int64_t)[(BBSettingsGateway *)self->_gateway effectiveGlobalSummarizationSetting];
}

- (void)setEffectiveGlobalSummarizationSetting:(int64_t)a3
{
}

- (int64_t)effectiveGlobalHighlightsSetting
{
  return (int64_t)[(BBSettingsGateway *)self->_gateway effectiveGlobalHighlightsSetting];
}

- (void)setEffectiveGlobalHighlightsSetting:(int64_t)a3
{
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_D400;
  v7[3] = &unk_40D08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_D4A4;
  v7[3] = &unk_40D08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_D548;
  v7[3] = &unk_40D08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_D5EC;
  v7[3] = &unk_40D08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)_queue_applicationDidEnterBackgroundNotification:(id)a3
{
}

- (void)_queue_addObserver:(id)a3
{
}

- (void)_queue_removeObserver:(id)a3
{
}

- (void)observer:(id)a3 updateSectionInfo:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_D6A8;
  v8[3] = &unk_40D08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)queue, v8);
}

- (void)observer:(id)a3 updateGlobalSettings:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D874;
  block[3] = &unk_40F58;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_settingsObserver, 0);
  objc_storeStrong((id *)&self->_gateway, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end