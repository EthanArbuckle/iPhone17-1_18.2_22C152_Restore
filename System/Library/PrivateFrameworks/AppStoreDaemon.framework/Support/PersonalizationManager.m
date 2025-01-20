@interface PersonalizationManager
- (PersonalizationManager)init;
- (id)createMetricsEventsForEventType:(unsigned __int8)a3 context:(id)a4;
- (void)_handleAnalyticsUsageSwitchChange:(id)a3;
- (void)decorateMetricsEvent:(id)a3 context:(id)a4;
@end

@implementation PersonalizationManager

- (PersonalizationManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)PersonalizationManager;
  v2 = [(AppUsageBaseManager *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_collectingMetrics = sub_10031A2D0((uint64_t)v2);
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.PersonalizationManager.callout", v4);
    calloutQueue = v3->_calloutQueue;
    v3->_calloutQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.appstored.PersonalizationManager.dispatch", v7);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v8;

    v10 = sub_1003DA6D4();
    unsigned __int8 v11 = [v10 isHRNMode];

    if ((v11 & 1) == 0)
    {
      v12 = +[NSNotificationCenter defaultCenter];
      [v12 addObserver:v3 selector:"_handleAnalyticsUsageSwitchChange:" name:MCEffectiveSettingsChangedNotification object:0];
    }
  }
  return v3;
}

- (id)createMetricsEventsForEventType:(unsigned __int8)a3 context:(id)a4
{
  unsigned int v4 = a3;
  id v6 = a4;
  v7 = sub_1002D73A8(self, v4, v6);
  dispatch_queue_t v8 = sub_1002D5A20(self, v4, v7, v6);

  return v8;
}

- (void)decorateMetricsEvent:(id)a3 context:(id)a4
{
  v12 = a3;
  dispatch_queue_t v5 = a4;
  if (v12) {
    id v6 = (void *)v12[9];
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  dispatch_queue_t v8 = v12;
  if (v7)
  {
    sub_1003F66B0(v12, 1);
    if (v5) {
      v9 = (void *)v5[2];
    }
    else {
      v9 = 0;
    }
    id v10 = v9;
    sub_1003F5058((id *)v12, v10);

    dispatch_queue_t v8 = v12;
  }
  [v8 setAnonymous:1];
  if (v5)
  {
    sub_1003F6640(v12, v5[15]);
    uint64_t v11 = v5[11];
  }
  else
  {
    sub_1003F6640(v12, 0);
    uint64_t v11 = 0;
  }
  sub_1003F65D0(v12, v11);
}

- (void)_handleAnalyticsUsageSwitchChange:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031C668;
  block[3] = &unk_100521388;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

@end