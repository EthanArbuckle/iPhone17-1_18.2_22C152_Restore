@interface HSPCSetupNetworkRouterAppPunchoutViewController
- (HFAppPunchoutRequest)punchoutRequest;
- (HFSetupPairingPopupDelegate)popupDelegate;
- (HMSetupAccessoryDescription)setupAccessoryDescription;
- (HSPCSetupNetworkRouterAppPunchoutViewController)initWithPopupDelegate:(id)a3 setupAccessoryDescription:(id)a4;
- (HULinkedApplicationItem)linkedApplicationItem;
- (PRXAction)punchOutAction;
- (id)_lookUpSoftwareAndUpdateUI;
- (unint64_t)popupType;
- (void)_cancelPressed:(id)a3;
- (void)setLinkedApplicationItem:(id)a3;
- (void)setPunchoutRequest:(id)a3;
- (void)viewDidLoad;
@end

@implementation HSPCSetupNetworkRouterAppPunchoutViewController

- (HSPCSetupNetworkRouterAppPunchoutViewController)initWithPopupDelegate:(id)a3 setupAccessoryDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HSPCSetupNetworkRouterAppPunchoutViewController;
  v8 = [(HSPCSetupNetworkRouterAppPunchoutViewController *)&v19 initWithContentView:0];
  if (v8)
  {
    v9 = HULocalizedWiFiString();
    [(HSPCSetupNetworkRouterAppPunchoutViewController *)v8 setTitle:v9];

    v10 = HULocalizedString();
    [(HSPCSetupNetworkRouterAppPunchoutViewController *)v8 setSubtitle:v10];

    objc_storeWeak((id *)&v8->_popupDelegate, v6);
    objc_storeStrong((id *)&v8->_setupAccessoryDescription, a4);
    linkedApplicationItem = v8->_linkedApplicationItem;
    v8->_linkedApplicationItem = 0;

    if (v6)
    {
      [(HSPCSetupNetworkRouterAppPunchoutViewController *)v8 setDismissalType:1];
    }
    else
    {
      v12 = HULocalizedString();
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10002DF30;
      v17[3] = &unk_1000AA270;
      v13 = v8;
      v18 = v13;
      v14 = +[PRXAction actionWithTitle:v12 style:0 handler:v17];
      id v15 = [(HSPCSetupNetworkRouterAppPunchoutViewController *)v13 addAction:v14];
    }
  }

  return v8;
}

- (unint64_t)popupType
{
  return 2;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)HSPCSetupNetworkRouterAppPunchoutViewController;
  [(HSPCSetupNetworkRouterAppPunchoutViewController *)&v4 viewDidLoad];
  id v3 = [(HSPCSetupNetworkRouterAppPunchoutViewController *)self _lookUpSoftwareAndUpdateUI];
}

- (id)_lookUpSoftwareAndUpdateUI
{
  id v3 = [(HSPCSetupNetworkRouterAppPunchoutViewController *)self setupAccessoryDescription];
  objc_super v4 = [v3 bundleID];

  v5 = [(HSPCSetupNetworkRouterAppPunchoutViewController *)self setupAccessoryDescription];
  id v6 = [v5 storeID];

  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v4;
    __int16 v23 = 2112;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Attempting to resolve linked application for bundleID %@ storeID %@", buf, 0x16u);
  }

  id v8 = [objc_alloc((Class)HUSoftwareLibraryLookupRequest) initWithBundleID:v4 storeID:v6];
  v9 = +[NSSet setWithObject:v8];
  v10 = +[HUSoftwareLibraryLookupResult resultForRequests:v9];

  objc_initWeak((id *)buf, self);
  v11 = +[NAScheduler mainThreadScheduler];
  v12 = [v10 reschedule:v11];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002E228;
  v17[3] = &unk_1000AA2C0;
  void v17[4] = self;
  id v13 = v6;
  id v18 = v13;
  id v14 = v4;
  id v19 = v14;
  objc_copyWeak(&v20, (id *)buf);
  id v15 = [v12 flatMap:v17];
  objc_destroyWeak(&v20);

  objc_destroyWeak((id *)buf);

  return v15;
}

- (void)_cancelPressed:(id)a3
{
  id v4 = [(HSPCSetupNetworkRouterAppPunchoutViewController *)self popupDelegate];
  [v4 pairingPopupDidCancel:self];
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

- (HFAppPunchoutRequest)punchoutRequest
{
  return self->_punchoutRequest;
}

- (void)setPunchoutRequest:(id)a3
{
}

- (HULinkedApplicationItem)linkedApplicationItem
{
  return self->_linkedApplicationItem;
}

- (void)setLinkedApplicationItem:(id)a3
{
}

- (PRXAction)punchOutAction
{
  return self->_punchOutAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punchOutAction, 0);
  objc_storeStrong((id *)&self->_linkedApplicationItem, 0);
  objc_storeStrong((id *)&self->_punchoutRequest, 0);
  objc_storeStrong((id *)&self->_setupAccessoryDescription, 0);

  objc_destroyWeak((id *)&self->_popupDelegate);
}

@end