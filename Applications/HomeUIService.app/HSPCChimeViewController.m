@interface HSPCChimeViewController
+ (BOOL)_shouldShowHomePodChimeFeatureForHome:(id)a3;
+ (BOOL)_shouldShowTraditionalChimeFeatureForAccessory:(id)a3;
+ (BOOL)shouldSkipForAccessory:(id)a3 inHome:(id)a4;
+ (id)_muteCharacteristicForAccessory:(id)a3;
- (BOOL)initialHomePodChimeState;
- (BOOL)isHomePodChimeEnabled;
- (BOOL)isTraditionalChimeEnabled;
- (HSPCChimeViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (PRXFeature)homePodChimeFeature;
- (PRXFeature)traditionalChimeFeature;
- (id)commitConfiguration;
- (id)setHomePodChime:(BOOL)a3;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setHomePodChimeFeature:(id)a3;
- (void)setInitialHomePodChimeState:(BOOL)a3;
- (void)setTraditionalChimeFeature:(id)a3;
- (void)setTraditionalDoorbellChime:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HSPCChimeViewController

- (HSPCChimeViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v35.receiver = self;
  v35.super_class = (Class)HSPCChimeViewController;
  v9 = [(HSPCChimeViewController *)&v35 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a4);
    objc_storeStrong((id *)&v10->_coordinator, a3);
    v11 = [v8 home];
    unsigned int v12 = +[HSPCChimeViewController _shouldShowHomePodChimeFeatureForHome:v11];

    if (v12)
    {
      id v13 = objc_alloc((Class)PRXFeature);
      v14 = HULocalizedString();
      v15 = HULocalizedString();
      v16 = +[UIColor systemBlueColor];
      v17 = (PRXFeature *)[v13 initWithTitle:v14 detailText:v15 icon:0 tintColor:v16 valueChangedBlock:&stru_1000AA450];
      homePodChimeFeature = v10->_homePodChimeFeature;
      v10->_homePodChimeFeature = v17;

      [(HSPCChimeViewController *)v10 setInitialHomePodChimeState:[(HSPCChimeViewController *)v10 isHomePodChimeEnabled]];
      [(PRXFeature *)v10->_homePodChimeFeature setOn:[(HSPCChimeViewController *)v10 initialHomePodChimeState]];
      id v19 = [(HSPCChimeViewController *)v10 addFeature:v10->_homePodChimeFeature];
    }
    v20 = [v8 addedAccessory];
    unsigned int v21 = +[HSPCChimeViewController _shouldShowTraditionalChimeFeatureForAccessory:v20];

    if (v21)
    {
      id v22 = objc_alloc((Class)PRXFeature);
      v23 = HULocalizedString();
      v24 = HULocalizedString();
      v25 = +[UIColor systemBlueColor];
      v26 = (PRXFeature *)[v22 initWithTitle:v23 detailText:v24 icon:0 tintColor:v25 valueChangedBlock:&stru_1000AA470];
      traditionalChimeFeature = v10->_traditionalChimeFeature;
      v10->_traditionalChimeFeature = v26;

      [(PRXFeature *)v10->_traditionalChimeFeature setOn:[(HSPCChimeViewController *)v10 isTraditionalChimeEnabled]];
      id v28 = [(HSPCChimeViewController *)v10 addFeature:v10->_traditionalChimeFeature];
    }
    v29 = HULocalizedString();
    [(HSPCChimeViewController *)v10 setTitle:v29];

    v30 = [(HSPCChimeViewController *)v10 features];
    id v31 = [v30 count];

    if ((unint64_t)v31 >= 2)
    {
      v32 = HULocalizedString();
      [(HSPCChimeViewController *)v10 setSubtitle:v32];
    }
    id v33 = [(HSPCChimeViewController *)v10 addProminentButtonWithTitleKey:@"HUContinueTitle" target:v10 futureSelector:"commitConfiguration"];
  }

  return v10;
}

- (id)commitConfiguration
{
  v3 = [(HSPCChimeViewController *)self traditionalChimeFeature];

  if (v3)
  {
    v4 = [(HSPCChimeViewController *)self traditionalChimeFeature];
    -[HSPCChimeViewController setTraditionalDoorbellChime:](self, "setTraditionalDoorbellChime:", [v4 isOn]);
  }
  uint64_t v5 = [(HSPCChimeViewController *)self homePodChimeFeature];
  if (!v5
    || (v6 = (void *)v5,
        [(HSPCChimeViewController *)self homePodChimeFeature],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 isOn],
        unsigned int v9 = [(HSPCChimeViewController *)self initialHomePodChimeState],
        v7,
        v6,
        v8 == v9))
  {
    unsigned int v12 = +[NAFuture futureWithResult:&off_1000B0298];
  }
  else
  {
    v10 = [(HSPCChimeViewController *)self homePodChimeFeature];
    v11 = -[HSPCChimeViewController setHomePodChime:](self, "setHomePodChime:", [v10 isOn]);
    unsigned int v12 = [v11 hs_commitConfigurationFutureWithContextMessage:@"HomePod Chime"];
  }

  return v12;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)HSPCChimeViewController;
  [(HSPCChimeViewController *)&v7 viewDidLoad];
  v3 = [(HSPCChimeViewController *)self features];
  id v4 = [v3 count];

  if (v4 == (id)1)
  {
    id v5 = [(HSPCChimeViewController *)self tableView];
    [v5 setSeparatorStyle:0];
  }
  else
  {
    id v5 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 1.0];
    v6 = [(HSPCChimeViewController *)self tableView];
    [v6 setTableFooterView:v5];
  }
}

- (void)setTraditionalDoorbellChime:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HSPCChimeViewController *)self config];
  id v5 = [v4 cameraProfile];

  [v5 hf_updateDoorbellChime:v3];
}

- (id)setHomePodChime:(BOOL)a3
{
  id v4 = [(HSPCChimeViewController *)self config];
  id v5 = [v4 home];

  v6 = [v5 hf_characteristicValueManager];
  objc_super v7 = objc_msgSend(v5, "hf_allHomePodsOrStereoPairs");
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_100031164;
  v16 = &unk_1000AA498;
  id v17 = v6;
  BOOL v18 = a3;
  id v8 = v6;
  unsigned int v9 = [v7 na_map:&v13];
  v10 = +[NAScheduler mainThreadScheduler];
  v11 = +[NAFuture combineAllFutures:v9 ignoringErrors:1 scheduler:v10];

  return v11;
}

- (BOOL)isTraditionalChimeEnabled
{
  v2 = [(HSPCChimeViewController *)self config];
  BOOL v3 = [v2 addedAccessory];
  id v4 = +[HSPCChimeViewController _muteCharacteristicForAccessory:v3];

  objc_opt_class();
  id v5 = [v4 value];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7) {
    unsigned int v8 = [v7 BOOLValue] ^ 1;
  }
  else {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)isHomePodChimeEnabled
{
  v2 = [(HSPCChimeViewController *)self config];
  BOOL v3 = [v2 home];
  id v4 = [v3 hf_allHomePodsOrStereoPairsThatWillChime];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

+ (BOOL)_shouldShowHomePodChimeFeatureForHome:(id)a3
{
  BOOL v3 = [a3 hf_allHomePodProfileContainers];
  id v4 = [v3 na_filter:&stru_1000AA4D8];
  id v5 = [v4 count];

  return v5 != 0;
}

+ (id)_muteCharacteristicForAccessory:(id)a3
{
  BOOL v3 = [a3 cameraProfiles];
  id v4 = [v3 firstObject];

  id v5 = [v4 hf_doorbellChimeMuteCharacteristic];

  return v5;
}

+ (BOOL)_shouldShowTraditionalChimeFeatureForAccessory:(id)a3
{
  BOOL v3 = +[HSPCChimeViewController _muteCharacteristicForAccessory:a3];
  unsigned __int8 v4 = [v3 hf_isWritable];

  return v4;
}

+ (BOOL)shouldSkipForAccessory:(id)a3 inHome:(id)a4
{
  id v5 = a3;
  if (+[HSPCChimeViewController _shouldShowHomePodChimeFeatureForHome:a4])
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    unsigned int v6 = !+[HSPCChimeViewController _shouldShowTraditionalChimeFeatureForAccessory:v5];
  }

  return v6;
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

- (BOOL)initialHomePodChimeState
{
  return self->_initialHomePodChimeState;
}

- (void)setInitialHomePodChimeState:(BOOL)a3
{
  self->_initialHomePodChimeState = a3;
}

- (PRXFeature)homePodChimeFeature
{
  return self->_homePodChimeFeature;
}

- (void)setHomePodChimeFeature:(id)a3
{
}

- (PRXFeature)traditionalChimeFeature
{
  return self->_traditionalChimeFeature;
}

- (void)setTraditionalChimeFeature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traditionalChimeFeature, 0);
  objc_storeStrong((id *)&self->_homePodChimeFeature, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end