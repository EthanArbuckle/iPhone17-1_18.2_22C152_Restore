@interface HSPCPairingViewController
- (HSPCPairingViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (id)commitConfiguration;
- (id)iconDescriptor;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)updatePairingStatus:(id)a3 phase:(unint64_t)a4;
@end

@implementation HSPCPairingViewController

- (HSPCPairingViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HSPCPairingViewController;
  v9 = [(HSPCCenterIconViewController *)&v17 initWithCoordinator:v7 config:v8];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a4);
    objc_storeStrong((id *)&v10->_coordinator, a3);
    v11 = [v7 activeTuple];
    v12 = [v11 accessoryCategoryOrPrimaryServiceType];
    v13 = HFLocalizedCategoryOrPrimaryServiceTypeString();
    [(HSPCPairingViewController *)v10 setTitle:v13];

    v14 = HULocalizedString();
    [(HSPCPairingViewController *)v10 setSubtitle:v14];

    v15 = HFLocalizedString();
    [(HSPCPairingViewController *)v10 showActivityIndicatorWithStatus:v15];
  }
  return v10;
}

- (id)iconDescriptor
{
  v3 = [(HSPCPairingViewController *)self coordinator];
  v4 = [v3 activeTuple];
  v5 = [v4 accessoryCategoryOrPrimaryServiceType];
  v6 = +[HFServiceIconFactory iconDescriptorForAccessoryCategoryOrServiceType:v5];

  id v7 = [(HSPCPairingViewController *)self coordinator];
  id v8 = [v7 activeTuple];
  v9 = [v8 accessory];
  v10 = +[HFServiceIconFactory overrideIconDescriptorForMultiServiceAccessory:v9 iconDescriptor:v6];

  return v10;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:&off_1000B03B8];
}

- (void)updatePairingStatus:(id)a3 phase:(unint64_t)a4
{
  if (a4 == 2) {
    [(HSPCPairingViewController *)self setSubtitle:a3];
  }
  else {
    [(HSPCPairingViewController *)self showActivityIndicatorWithStatus:a3];
  }
  id v5 = [(HSPCPairingViewController *)self view];
  [v5 layoutIfNeeded];
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConfig:(id)a3
{
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 72, 1);
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