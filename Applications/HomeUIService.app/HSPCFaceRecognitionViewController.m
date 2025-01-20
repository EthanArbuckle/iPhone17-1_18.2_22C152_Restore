@interface HSPCFaceRecognitionViewController
- (BOOL)isPreloaded;
- (HSPCFaceRecognitionViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (PRXFeature)identifyPeopleFeature;
- (id)commitConfiguration;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setIdentifyPeopleFeature:(id)a3;
- (void)setIsPreloaded:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HSPCFaceRecognitionViewController

- (HSPCFaceRecognitionViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)HSPCFaceRecognitionViewController;
  v9 = [(HSPCFaceRecognitionViewController *)&v28 init];
  v10 = v9;
  if (v9)
  {
    v9->_isPreloaded = 0;
    objc_storeStrong((id *)&v9->_config, a4);
    objc_storeStrong((id *)&v10->_coordinator, a3);
    v11 = HULocalizedString();
    [(HSPCFaceRecognitionViewController *)v10 setTitle:v11];

    id v12 = [(HSPCFaceRecognitionViewController *)v10 addProminentButtonWithTitleKey:@"HUContinueTitle" target:v10 futureSelector:"commitConfiguration"];
    v13 = [v8 home];
    objc_initWeak(&location, v10);
    id v14 = objc_alloc((Class)PRXFeature);
    v15 = HULocalizedString();
    v16 = HULocalizedString();
    v17 = +[UIColor systemBlueColor];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100012548;
    v24[3] = &unk_1000A9408;
    objc_copyWeak(&v26, &location);
    id v18 = v13;
    id v25 = v18;
    id v19 = [v14 initWithTitle:v15 detailText:v16 icon:0 tintColor:v17 valueChangedBlock:v24];

    v20 = [v18 personManagerSettings];
    id v21 = [v20 isFaceClassificationEnabled];

    [v19 setOn:v21];
    id v22 = [(HSPCFaceRecognitionViewController *)v10 addFeature:v19];
    [(HSPCFaceRecognitionViewController *)v10 setIdentifyPeopleFeature:v19];
    [(HSPCFaceRecognitionViewController *)v10 setIsPreloaded:1];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v10;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:&off_1000AFFC8];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)HSPCFaceRecognitionViewController;
  [(HSPCFaceRecognitionViewController *)&v4 viewDidLoad];
  v3 = [(HSPCFaceRecognitionViewController *)self tableView];
  [v3 setSeparatorStyle:0];
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfig:(id)a3
{
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (BOOL)isPreloaded
{
  return self->_isPreloaded;
}

- (void)setIsPreloaded:(BOOL)a3
{
  self->_isPreloaded = a3;
}

- (PRXFeature)identifyPeopleFeature
{
  return self->_identifyPeopleFeature;
}

- (void)setIdentifyPeopleFeature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifyPeopleFeature, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end