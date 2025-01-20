@interface HSPCSiriForEveryoneViewController
- (HSPCSiriForEveryoneViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (id)_enableMultiUser;
- (id)commitConfiguration;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
@end

@implementation HSPCSiriForEveryoneViewController

- (HSPCSiriForEveryoneViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)UIImageView);
  v9 = HUImageNamed();
  id v10 = [v8 initWithImage:v9];

  [v10 setContentMode:2];
  v21.receiver = self;
  v21.super_class = (Class)HSPCSiriForEveryoneViewController;
  v11 = [(HSPCFixedSizeCenterContentViewController *)&v21 initWithCenterContentView:v10];
  v12 = v11;
  if (v11)
  {
    [(HSPCSiriForEveryoneViewController *)v11 setConfig:v7];
    [(HSPCSiriForEveryoneViewController *)v12 setCoordinator:v6];
    v13 = [(HSPCSiriForEveryoneViewController *)v12 config];
    v14 = [v13 home];
    v15 = [v14 users];
    [v15 count];

    v16 = HULocalizedString();
    [(HSPCSiriForEveryoneViewController *)v12 setTitle:v16];

    v17 = HULocalizedString();
    id v18 = [(HSPCSiriForEveryoneViewController *)v12 addProminentButtonWithLocalizedTitle:v17 target:v12 futureSelector:"_enableMultiUser"];

    v19 = HULocalizedString();
    [(HSPCSiriForEveryoneViewController *)v12 setSubtitle:v19];
  }
  return v12;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:&off_1000B0178];
}

- (id)_enableMultiUser
{
  v3 = [(HSPCSiriForEveryoneViewController *)self config];
  v4 = [v3 home];

  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_1000249F8;
  v14 = &unk_1000A96F8;
  id v15 = v4;
  id v5 = v4;
  id v6 = +[NAFuture futureWithBlock:&v11];
  v16[0] = v6;
  id v7 = [(HSPCSiriForEveryoneViewController *)self commitConfiguration];
  v16[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v16 count:2];
  v9 = +[NAFuture chainFutures:v8];

  return v9;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfig:(id)a3
{
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end