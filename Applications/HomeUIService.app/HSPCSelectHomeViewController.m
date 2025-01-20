@interface HSPCSelectHomeViewController
- (HSPCDataProvider)homeProvider;
- (HSPCSelectHomeViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (id)commitConfiguration;
- (id)hu_preloadContent;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setHomeProvider:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HSPCSelectHomeViewController

- (HSPCSelectHomeViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HSPCSelectHomeViewController;
  v9 = [(HSPCSelectHomeViewController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a4);
    objc_storeStrong((id *)&v10->_coordinator, a3);
    v11 = HULocalizedString();
    [(HSPCSelectHomeViewController *)v10 setTitle:v11];

    id v12 = [(HSPCSelectHomeViewController *)v10 addProminentButtonWithTitleKey:@"HUContinueTitle" target:v10 futureSelector:"commitConfiguration"];
  }

  return v10;
}

- (id)commitConfiguration
{
  v3 = [(HSPCSelectHomeViewController *)self contentView];
  v4 = [v3 pickerView];
  id v5 = [v4 selectedRowInComponent:0];

  v6 = [(HSPCSelectHomeViewController *)self homeProvider];
  id v7 = [v6 items];
  id v8 = [v7 count];

  if (v5 < v8)
  {
    v9 = [(HSPCSelectHomeViewController *)self config];
    unsigned int v10 = [v9 isSetupInitiatedByOtherMatterEcosystem];

    v11 = [(HSPCSelectHomeViewController *)self homeProvider];
    id v12 = [v11 items];
    v13 = [v12 objectAtIndexedSubscript:v5];
    if (v10)
    {

      uint64_t v14 = objc_opt_class();
      id v15 = [(HSPCSelectHomeViewController *)self config];
      if (v15)
      {
        if (objc_opt_isKindOfClass()) {
          v16 = v15;
        }
        else {
          v16 = 0;
        }
        id v12 = v16;
        if (!v12)
        {
          v17 = +[NSAssertionHandler currentHandler];
          v18 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
          [v17 handleFailureInFunction:v18, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v14, objc_opt_class() file lineNumber description];
        }
      }
      else
      {
        id v12 = 0;
      }

      [v12 setSelectedPartnerHome:v13];
    }
    else
    {
      v19 = [(HSPCSelectHomeViewController *)self config];
      [v19 setHome:v13];

      v13 = v11;
    }
  }
  v20 = +[NAFuture futureWithResult:&off_1000AFFB0];

  return v20;
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HSPCSelectHomeViewController;
  [(HSPCSelectHomeViewController *)&v8 viewWillAppear:a3];
  v4 = [(HSPCSelectHomeViewController *)self contentView];
  id v5 = [v4 pickerView];
  [v5 reloadAllComponents];

  v6 = [(HSPCSelectHomeViewController *)self contentView];
  id v7 = [v6 pickerView];
  [v7 selectRow:0 inComponent:0 animated:0];
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v5 = [(HSPCSelectHomeViewController *)self coordinator];
  unsigned int v6 = [v5 isUsingCHIPCommunicationProtocol];

  id v7 = [(HSPCSelectHomeViewController *)self homeProvider];
  objc_super v8 = [v7 items];
  id v9 = [v8 count];

  LODWORD(v10) = v6 ^ 1;
  if (v9) {
    uint64_t v10 = v10;
  }
  else {
    uint64_t v10 = 1;
  }
  return (int64_t)v9 + v10;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v7 = [(HSPCSelectHomeViewController *)self homeProvider];
  objc_super v8 = [v7 items];
  if ((unint64_t)[v8 count] <= a4)
  {
    v13 = HULocalizedString();
  }
  else
  {
    id v9 = [(HSPCSelectHomeViewController *)self homeProvider];
    uint64_t v10 = [(HSPCSelectHomeViewController *)self homeProvider];
    v11 = [v10 items];
    id v12 = [v11 objectAtIndexedSubscript:a4];
    v13 = [v9 userFacingStringForItem:v12];
  }

  return v13;
}

- (id)hu_preloadContent
{
  v3 = [(HSPCSelectHomeViewController *)self coordinator];
  v4 = [(HSPCSelectHomeViewController *)self config];
  id v5 = +[HSPCHomeProviderFactory providerForCoordinator:v3 config:v4];
  [(HSPCSelectHomeViewController *)self setHomeProvider:v5];

  unsigned int v6 = [(HSPCSelectHomeViewController *)self homeProvider];
  id v7 = [v6 loadData];
  objc_super v8 = +[NAScheduler mainThreadScheduler];
  id v9 = [v7 reschedule:v8];

  return v9;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig:(id)a3
{
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (HSPCDataProvider)homeProvider
{
  return (HSPCDataProvider *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHomeProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeProvider, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end