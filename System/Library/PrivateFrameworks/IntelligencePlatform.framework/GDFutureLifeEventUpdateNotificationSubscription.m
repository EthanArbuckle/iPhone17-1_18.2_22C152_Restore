@interface GDFutureLifeEventUpdateNotificationSubscription
- (GDFutureLifeEventUpdateNotificationSubscription)initWithSystemwideUniqueSubscriptionIdentifier:(id)a3 targetQueue:(id)a4 onReceiveUpdateNotificationBlock:(id)a5;
- (GDInternalViewUpdateNotificationSubscription)viewUpdateNotificationSubscription;
- (void)cancelSubscription;
- (void)setViewUpdateNotificationSubscription:(id)a3;
@end

@implementation GDFutureLifeEventUpdateNotificationSubscription

- (void).cxx_destruct
{
}

- (void)setViewUpdateNotificationSubscription:(id)a3
{
}

- (GDInternalViewUpdateNotificationSubscription)viewUpdateNotificationSubscription
{
  return self->_viewUpdateNotificationSubscription;
}

- (void)cancelSubscription
{
  objc_msgSend_viewUpdateNotificationSubscription(self, a2, v2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancelSubscription(v9, v5, v6, v7, v8);
}

- (GDFutureLifeEventUpdateNotificationSubscription)initWithSystemwideUniqueSubscriptionIdentifier:(id)a3 targetQueue:(id)a4 onReceiveUpdateNotificationBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)GDFutureLifeEventUpdateNotificationSubscription;
  v11 = [(GDFutureLifeEventUpdateNotificationSubscription *)&v17 init];
  if (v11)
  {
    v12 = [GDInternalViewUpdateNotificationSubscription alloc];
    uint64_t updated = objc_msgSend_initForViewName_systemwideUniqueSubscriptionIdentifier_useCase_targetQueue_onReceiveUpdateNotificationBlock_(v12, v13, @"futureLifeEventMap", (uint64_t)v8, @"FutureLifeEvent", v9, v10);
    viewUpdateNotificationSubscription = v11->_viewUpdateNotificationSubscription;
    v11->_viewUpdateNotificationSubscription = (GDInternalViewUpdateNotificationSubscription *)updated;
  }
  return v11;
}

@end