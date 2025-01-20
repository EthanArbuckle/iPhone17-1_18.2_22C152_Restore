@interface MatterhornUpsellManager
+ (id)log;
- (NSString)featureId;
- (id)completion;
- (void)launchUpgradeFlow:(id)a3 withCompletion:(id)a4;
- (void)matterhornUpsell:(id)a3 forFeatureId:(id)a4 withCompletion:(id)a5;
- (void)setCompletion:(id)a3;
- (void)setFeatureId:(id)a3;
- (void)upgradeFlowManagerDidCancel:(id)a3;
- (void)upgradeFlowManagerDidComplete:(id)a3;
- (void)verifyFeature:(id)a3 withCompletion:(id)a4;
@end

@implementation MatterhornUpsellManager

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_76B34;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D7548 != -1) {
    dispatch_once(&qword_D7548, block);
  }
  v2 = (void *)qword_D7540;

  return v2;
}

- (void)matterhornUpsell:(id)a3 forFeatureId:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_storeStrong((id *)&self->_featureId, a4);
  featureId = self->_featureId;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_76CD0;
  v14[3] = &unk_B99E0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v10;
  id v12 = v10;
  id v13 = v8;
  [(MatterhornUpsellManager *)self verifyFeature:featureId withCompletion:v14];
}

- (void)launchUpgradeFlow:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[MatterhornUpsellManager log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Launching quota journey with id: %@", buf, 0xCu);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_76EB8;
  v10[3] = &unk_B9D48;
  objc_copyWeak(&v12, (id *)buf);
  id v9 = v7;
  id v11 = v9;
  +[ICQUpgradeFlowManager flowManagerWithJourneyId:v6 params:0 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  v4 = +[MatterhornUpsellManager log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Matterhorn upgrade flow cancel", v7, 2u);
  }

  v5 = [(MatterhornUpsellManager *)self featureId];
  id v6 = [(MatterhornUpsellManager *)self completion];
  [(MatterhornUpsellManager *)self verifyFeature:v5 withCompletion:v6];
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  v4 = +[MatterhornUpsellManager log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Matterhorn upgrade flow complete", v7, 2u);
  }

  v5 = [(MatterhornUpsellManager *)self featureId];
  id v6 = [(MatterhornUpsellManager *)self completion];
  [(MatterhornUpsellManager *)self verifyFeature:v5 withCompletion:v6];
}

- (void)verifyFeature:(id)a3 withCompletion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_77310;
  v7[3] = &unk_B9D98;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  +[CSFFeatureManager requestFeatureWithId:v6 completion:v7];
}

- (id)completion
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCompletion:(id)a3
{
}

- (NSString)featureId
{
  return self->_featureId;
}

- (void)setFeatureId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureId, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end