@interface HSPCSelectRoomViewController
- (HSPCDataProvider)roomProvider;
- (HSPCSelectRoomViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (id)commitConfiguration;
- (id)hu_preloadContent;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)shouldSkip;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setRoomProvider:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HSPCSelectRoomViewController

- (HSPCSelectRoomViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HSPCSelectRoomViewController;
  v9 = [(HSPCSelectRoomViewController *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a4);
    objc_storeStrong((id *)&v10->_coordinator, a3);
    v11 = [v7 activeTuple];
    v12 = [v11 accessoryCategoryOrPrimaryServiceType];
    v13 = HFLocalizedCategoryOrPrimaryServiceTypeString();
    [(HSPCSelectRoomViewController *)v10 setTitle:v13];

    id v14 = [(HSPCSelectRoomViewController *)v10 addProminentButtonWithTitleKey:@"HUContinueTitle" target:v10 futureSelector:"commitConfiguration"];
  }

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HSPCSelectRoomViewController;
  [(HSPCSelectRoomViewController *)&v8 viewWillAppear:a3];
  v4 = [(HSPCSelectRoomViewController *)self roomProvider];
  id v5 = [v4 initialRowIndex];

  v6 = [(HSPCSelectRoomViewController *)self contentView];
  id v7 = [v6 pickerView];
  [v7 selectRow:v5 inComponent:0 animated:0];
}

- (id)commitConfiguration
{
  v3 = [(HSPCSelectRoomViewController *)self contentView];
  v4 = [v3 pickerView];
  id v5 = [v4 selectedRowInComponent:0];

  v6 = [(HSPCSelectRoomViewController *)self roomProvider];
  id v7 = [v6 items];
  id v8 = [v7 count];

  v9 = [(HSPCSelectRoomViewController *)self config];
  v10 = v9;
  if (v5 >= v8)
  {
    [v9 setRoomName:0];

    v18 = +[NAFuture futureWithResult:&off_1000B0430];
  }
  else
  {
    unsigned int v11 = [v9 isSetupInitiatedByOtherMatterEcosystem];

    if (v11)
    {
      uint64_t v12 = objc_opt_class();
      id v13 = [(HSPCSelectRoomViewController *)self config];
      if (v13)
      {
        if (objc_opt_isKindOfClass()) {
          id v14 = v13;
        }
        else {
          id v14 = 0;
        }
        id v15 = v14;
        if (!v15)
        {
          objc_super v16 = +[NSAssertionHandler currentHandler];
          v17 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
          [v16 handleFailureInFunction:v17, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v12, objc_opt_class() file lineNumber description];
        }
      }
      else
      {
        id v15 = 0;
      }

      v25 = [(HSPCSelectRoomViewController *)self roomProvider];
      v26 = [v25 items];
      v27 = [v26 objectAtIndexedSubscript:v5];
      [v15 setSelectedPartnerRoom:v27];

      v18 = +[NAFuture futureWithResult:&off_1000B0430];
    }
    else
    {
      v19 = [(HSPCSelectRoomViewController *)self roomProvider];
      v20 = [v19 items];
      v21 = [v20 objectAtIndexedSubscript:v5];
      v22 = [(HSPCSelectRoomViewController *)self config];
      [v22 setRoomName:v21];

      v23 = [(HSPCSelectRoomViewController *)self config];
      v24 = [v23 configureRoom];
      v18 = [v24 hs_commitConfigurationFutureWithContextMessage:@"Set Room"];
    }
  }

  return v18;
}

- (id)hu_preloadContent
{
  v3 = [(HSPCSelectRoomViewController *)self coordinator];
  v4 = [(HSPCSelectRoomViewController *)self config];
  id v5 = +[HSPCRoomProviderFactory providerForCoordinator:v3 config:v4];
  [(HSPCSelectRoomViewController *)self setRoomProvider:v5];

  v6 = [(HSPCSelectRoomViewController *)self roomProvider];
  id v7 = [v6 loadData];
  id v8 = +[NAScheduler mainThreadScheduler];
  v9 = [v7 reschedule:v8];

  return v9;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v5 = [(HSPCSelectRoomViewController *)self config];
  unsigned int v6 = [v5 isSetupInitiatedByOtherMatterEcosystem];

  id v7 = [(HSPCSelectRoomViewController *)self roomProvider];
  id v8 = [v7 items];
  id v9 = [v8 count];

  return (int64_t)v9 + (v6 ^ 1);
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v7 = [(HSPCSelectRoomViewController *)self roomProvider];
  id v8 = [v7 items];
  if ((unint64_t)[v8 count] <= a4)
  {
    id v13 = HULocalizedString();
  }
  else
  {
    id v9 = [(HSPCSelectRoomViewController *)self roomProvider];
    v10 = [(HSPCSelectRoomViewController *)self roomProvider];
    unsigned int v11 = [v10 items];
    uint64_t v12 = [v11 objectAtIndexedSubscript:a4];
    id v13 = [v9 userFacingStringForItem:v12];
  }

  return v13;
}

- (id)shouldSkip
{
  v3 = [(HSPCSelectRoomViewController *)self config];
  unsigned int v4 = [v3 isSetupInitiatedByOtherMatterEcosystem];

  id v5 = [(HSPCSelectRoomViewController *)self roomProvider];
  unsigned int v6 = [v5 items];
  id v7 = [v6 count];

  if ((unint64_t)v7 < 2) {
    uint64_t v8 = v4;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = +[NSNumber numberWithBool:v8];
  v10 = +[NAFuture futureWithResult:v9];

  return v10;
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

- (HSPCDataProvider)roomProvider
{
  return (HSPCDataProvider *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRoomProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomProvider, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end