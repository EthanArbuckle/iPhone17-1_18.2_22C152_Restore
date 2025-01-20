@interface ADMyriadSettingsManager
+ (id)sharedSettingsManager;
- (BOOL)trialTreatmentMultiDeviceConsensus;
- (NSString)treatmentId;
- (id)_init;
- (void)_setupTrialRefresh;
- (void)getSidekickBoostsFileWithCompletion:(id)a3;
- (void)getTrialEnables:(id)a3 doubleFactors:(id)a4 withCompletion:(id)a5;
- (void)refreshTrial;
- (void)setTrialTreatmentMultiDeviceConsensus:(BOOL)a3;
@end

@implementation ADMyriadSettingsManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)trialTreatmentMultiDeviceConsensus
{
  return self->_trialTreatmentMultiDeviceConsensus;
}

- (void)getSidekickBoostsFileWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100255738;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)getTrialEnables:(id)a3 doubleFactors:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100255BEC;
  v15[3] = &unk_10050E228;
  id v16 = v9;
  id v17 = v8;
  v18 = self;
  id v19 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(queue, v15);
}

- (void)refreshTrial
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100256348;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_setupTrialRefresh
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[ADMyriadSettingsManager _setupTrialRefresh]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Registering update handler", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002565B8;
  v6[3] = &unk_10050D5C8;
  objc_copyWeak(&v7, (id *)buf);
  id v4 = objc_retainBlock(v6);
  id v5 = [(TRIClient *)self->_trialClient addUpdateHandlerForNamespaceName:@"MYRIAD_BOOSTS" queue:self->_queue usingBlock:v4];

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)setTrialTreatmentMultiDeviceConsensus:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    BOOL trialTreatmentMultiDeviceConsensus = self->_trialTreatmentMultiDeviceConsensus;
    int v7 = 136315650;
    id v8 = "-[ADMyriadSettingsManager setTrialTreatmentMultiDeviceConsensus:]";
    __int16 v9 = 1024;
    BOOL v10 = trialTreatmentMultiDeviceConsensus;
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Consensus Updated From: %d To: %d", (uint8_t *)&v7, 0x18u);
  }
  if (self->_trialTreatmentMultiDeviceConsensus != v3)
  {
    self->_BOOL trialTreatmentMultiDeviceConsensus = v3;
    [(ADMyriadSettingsManager *)self refreshTrial];
  }
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)ADMyriadSettingsManager;
  v2 = [(ADMyriadSettingsManager *)&v9 init];
  if (v2)
  {
    BOOL v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ADMyriadSettingsManager", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = +[TRIClient clientWithIdentifier:294];
    trialClient = v2->_trialClient;
    v2->_trialClient = (TRIClient *)v6;

    v2->_BOOL trialTreatmentMultiDeviceConsensus = 0;
    if (+[AFFeatureFlags isSCDATrialEnabled]) {
      [(ADMyriadSettingsManager *)v2 _setupTrialRefresh];
    }
  }
  return v2;
}

- (NSString)treatmentId
{
  v2 = [(TRIClient *)self->_trialClient treatmentIdWithNamespaceName:@"MYRIAD_BOOSTS"];
  BOOL v3 = v2;
  if (!v2) {
    v2 = &stru_10050F7D8;
  }
  dispatch_queue_t v4 = v2;

  return v4;
}

+ (id)sharedSettingsManager
{
  if (qword_100586010 != -1) {
    dispatch_once(&qword_100586010, &stru_100508038);
  }
  v2 = (void *)qword_100586008;
  return v2;
}

@end