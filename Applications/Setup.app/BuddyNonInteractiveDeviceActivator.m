@interface BuddyNonInteractiveDeviceActivator
+ (id)activatorUsingWiFi;
- (BOOL)isActivated;
- (BOOL)isActivating;
- (BuddyActivationConfiguration)activationConfiguration;
- (BuddyActivationEngine)activationEngine;
- (BuddyNonInteractiveDeviceActivator)initWithActivationConfiguration:(id)a3 activationEngine:(id)a4;
- (void)activateWithCompletion:(id)a3;
- (void)activateWithData:(id)a3 headers:(id)a4 completion:(id)a5;
- (void)activationFinishedWithData:(id)a3 responseHeaders:(id)a4 error:(id)a5 completionHandler:(id)a6;
- (void)dealloc;
- (void)setActivating:(BOOL)a3;
@end

@implementation BuddyNonInteractiveDeviceActivator

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  v2 = [(BuddyNonInteractiveDeviceActivator *)self activationEngine];
  [(BuddyActivationEngine *)v2 cancel];

  v3.receiver = v5;
  v3.super_class = (Class)BuddyNonInteractiveDeviceActivator;
  [(BuddyNonInteractiveDeviceActivator *)&v3 dealloc];
}

- (BuddyNonInteractiveDeviceActivator)initWithActivationConfiguration:(id)a3 activationEngine:(id)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id obj = 0;
  objc_storeStrong(&obj, a4);
  id v5 = v11;
  id v11 = 0;
  v8.receiver = v5;
  v8.super_class = (Class)BuddyNonInteractiveDeviceActivator;
  id v11 = [(BuddyNonInteractiveDeviceActivator *)&v8 init];
  objc_storeStrong(&v11, v11);
  if (v11)
  {
    objc_storeStrong((id *)v11 + 2, location[0]);
    objc_storeStrong((id *)v11 + 3, obj);
  }
  v6 = (BuddyNonInteractiveDeviceActivator *)v11;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v11, 0);
  return v6;
}

+ (id)activatorUsingWiFi
{
  id v2 = objc_alloc((Class)a1);
  objc_super v3 = objc_alloc_init(BuddyActivationConfiguration);
  id v4 = +[BuddyActivationEngine wifiActivationEngineWithOverrideActivationURL:sessionURL:](BuddyActivationEngine, "wifiActivationEngineWithOverrideActivationURL:sessionURL:", 0, 0, a2, a1);
  id v5 = [v2 initWithActivationConfiguration:v3 activationEngine:v4];

  return v5;
}

- (BOOL)isActivated
{
  id v2 = [(BuddyNonInteractiveDeviceActivator *)self activationConfiguration];
  unsigned __int8 v3 = [(BuddyActivationConfiguration *)v2 isActivated];

  return v3 & 1;
}

- (void)activateWithCompletion:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_100115AB4;
  objc_super v8 = &unk_1002B0CD0;
  v9 = v12;
  id v10 = location[0];
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)activationFinishedWithData:(id)a3 responseHeaders:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  id v21 = 0;
  objc_storeStrong(&v21, a5);
  id v20 = 0;
  objc_storeStrong(&v20, a6);
  v9 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  v13 = sub_100115F24;
  v14 = &unk_1002B3488;
  id v15 = v21;
  id v19 = v20;
  id v16 = v22;
  v17 = v24;
  id v18 = location[0];
  dispatch_async((dispatch_queue_t)v9, &block);

  objc_storeStrong(&v18, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)activateWithData:(id)a3 headers:(id)a4 completion:(id)a5
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  id v17 = 0;
  objc_storeStrong(&v17, a5);
  v7 = dispatch_get_global_queue(25, 0);
  block = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  int v11 = sub_100116488;
  int v12 = &unk_1002B34B0;
  id v13 = v18;
  id v14 = location[0];
  id v15 = v20;
  id v16 = v17;
  dispatch_async(v7, &block);

  objc_storeStrong(&v16, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (BuddyActivationConfiguration)activationConfiguration
{
  return self->_activationConfiguration;
}

- (BuddyActivationEngine)activationEngine
{
  return self->_activationEngine;
}

- (BOOL)isActivating
{
  return self->_activating;
}

- (void)setActivating:(BOOL)a3
{
  self->_activating = a3;
}

- (void).cxx_destruct
{
}

@end