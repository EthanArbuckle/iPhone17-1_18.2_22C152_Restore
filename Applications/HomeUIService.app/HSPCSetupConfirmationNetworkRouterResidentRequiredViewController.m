@interface HSPCSetupConfirmationNetworkRouterResidentRequiredViewController
- (HFSetupPairingPopupDelegate)popupDelegate;
- (HMSetupAccessoryDescription)setupAccessoryDescription;
- (HSPCSetupConfirmationNetworkRouterResidentRequiredViewController)initWithPopupDelegate:(id)a3 setupAccessoryDescription:(id)a4;
- (HSPCSetupConfirmationNetworkRouterResidentRequiredViewController)initWithSetupAccessoryDescription:(id)a3;
- (unint64_t)popupType;
@end

@implementation HSPCSetupConfirmationNetworkRouterResidentRequiredViewController

- (HSPCSetupConfirmationNetworkRouterResidentRequiredViewController)initWithPopupDelegate:(id)a3 setupAccessoryDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100060C64(@"HSSetupConfirmationNetworkRouterResidentRequiredViewControllerTitle");
  v9 = HFLocalizedWiFiStringKeyForKey();
  v10 = sub_100060C64(v9);

  v11 = HUImageNamed();
  v22.receiver = self;
  v22.super_class = (Class)HSPCSetupConfirmationNetworkRouterResidentRequiredViewController;
  v12 = [(HSPCSetupConfirmationNetworkRouterResidentRequiredViewController *)&v22 initWithTitle:v8 detailText:v10 contentImage:v11];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_popupDelegate, v6);
    objc_storeStrong((id *)&v13->_setupAccessoryDescription, a4);
    v14 = HULocalizedString();
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100036AE4;
    v20[3] = &unk_1000AA270;
    v15 = v13;
    v21 = v15;
    v16 = +[PRXAction actionWithTitle:v14 style:0 handler:v20];
    id v17 = [(HSPCSetupConfirmationNetworkRouterResidentRequiredViewController *)v15 addAction:v16];

    v18 = +[NSURL hf_learnAboutNetworkProtectionURL];
    [(HSPCSetupConfirmationNetworkRouterResidentRequiredViewController *)v15 addLearnMoreButtonWithURL:v18];
  }
  return v13;
}

- (HSPCSetupConfirmationNetworkRouterResidentRequiredViewController)initWithSetupAccessoryDescription:(id)a3
{
  return [(HSPCSetupConfirmationNetworkRouterResidentRequiredViewController *)self initWithPopupDelegate:0 setupAccessoryDescription:a3];
}

- (unint64_t)popupType
{
  return 0;
}

- (HFSetupPairingPopupDelegate)popupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_popupDelegate);

  return (HFSetupPairingPopupDelegate *)WeakRetained;
}

- (HMSetupAccessoryDescription)setupAccessoryDescription
{
  return self->_setupAccessoryDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupAccessoryDescription, 0);

  objc_destroyWeak((id *)&self->_popupDelegate);
}

@end