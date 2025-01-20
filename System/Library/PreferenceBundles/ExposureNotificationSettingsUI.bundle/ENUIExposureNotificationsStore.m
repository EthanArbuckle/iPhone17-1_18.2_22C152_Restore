@interface ENUIExposureNotificationsStore
- (ENManager)manager;
- (ENUIExposureNotificationsStore)init;
- (OS_dispatch_group)activationGroup;
- (void)dealloc;
- (void)fetchExposureCheckSessionsWithCompletion:(id)a3;
- (void)fetchExposureChecksWithCompletion:(id)a3;
- (void)fetchExposureLogsExistWithCompletion:(id)a3;
- (void)fetchExtraLoggingEnabledWithCompletion:(id)a3;
- (void)fetchSupportedWithCompletion:(id)a3;
- (void)fetchWeeklySummaryEnabledWithCompletion:(id)a3;
- (void)performAfterActivation:(id)a3;
- (void)resetAllDataWithCompletion:(id)a3;
- (void)resetDataWithFlags:(unsigned int)a3 completion:(id)a4;
- (void)setActivationGroup:(id)a3;
- (void)setManager:(id)a3;
@end

@implementation ENUIExposureNotificationsStore

- (ENUIExposureNotificationsStore)init
{
  v11.receiver = self;
  v11.super_class = (Class)ENUIExposureNotificationsStore;
  id v2 = [(ENUIExposureNotificationsStore *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)ENManager);
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    [*((id *)v2 + 1) setDispatchQueue:&_dispatch_main_q];
    dispatch_group_t v5 = dispatch_group_create();
    v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    dispatch_group_enter(*((dispatch_group_t *)v2 + 2));
    v7 = (void *)*((void *)v2 + 1);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_11414;
    v9[3] = &unk_2CF48;
    id v10 = v2;
    [v7 activateWithCompletionHandler:v9];
  }
  return (ENUIExposureNotificationsStore *)v2;
}

- (void)dealloc
{
  [(ENManager *)self->_manager invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ENUIExposureNotificationsStore;
  [(ENUIExposureNotificationsStore *)&v3 dealloc];
}

- (void)performAfterActivation:(id)a3
{
}

- (void)fetchExposureChecksWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_11588;
  v4[3] = &unk_2CA68;
  dispatch_group_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ENUIExposureNotificationsStore *)v5 performAfterActivation:v4];
}

- (void)fetchExposureCheckSessionsWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_117E4;
  v4[3] = &unk_2CA68;
  dispatch_group_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ENUIExposureNotificationsStore *)v5 performAfterActivation:v4];
}

- (void)resetDataWithFlags:(unsigned int)a3 completion:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_11A48;
  v5[3] = &unk_2CFC0;
  unsigned int v8 = a3;
  id v6 = self;
  id v7 = a4;
  id v4 = v7;
  [(ENUIExposureNotificationsStore *)v6 performAfterActivation:v5];
}

- (void)fetchExtraLoggingEnabledWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_11CC8;
  v4[3] = &unk_2CA68;
  dispatch_group_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ENUIExposureNotificationsStore *)v5 performAfterActivation:v4];
}

- (void)fetchWeeklySummaryEnabledWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_11EC8;
  v4[3] = &unk_2CA68;
  dispatch_group_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ENUIExposureNotificationsStore *)v5 performAfterActivation:v4];
}

- (void)fetchSupportedWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_120C8;
  v4[3] = &unk_2CA68;
  dispatch_group_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ENUIExposureNotificationsStore *)v5 performAfterActivation:v4];
}

- (void)fetchExposureLogsExistWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_122C8;
  v4[3] = &unk_2CA68;
  dispatch_group_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ENUIExposureNotificationsStore *)v5 performAfterActivation:v4];
}

- (void)resetAllDataWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_124D8;
  v4[3] = &unk_2CA68;
  dispatch_group_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ENUIExposureNotificationsStore *)v5 performAfterActivation:v4];
}

- (ENManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (OS_dispatch_group)activationGroup
{
  return self->_activationGroup;
}

- (void)setActivationGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationGroup, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

@end