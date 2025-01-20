@interface CARSetupPromptPresenter
- (CARSetupPromptDirector)promptDirector;
- (CARSetupPromptPresenter)initWithPresentingViewController:(id)a3;
- (UINavigationController)genericNavigationController;
- (UINavigationController)proxNavigationController;
- (UIViewController)presentingViewController;
- (id)_passConfigurationFromDigitalCarKeyInfo:(id)a3 vehicleName:(id)a4;
- (void)_dismissFromGenericFlow;
- (void)_presentGenericViewController:(id)a3;
- (void)_presentPromptViewController:(id)a3;
- (void)promptDirector:(id)a3 wantsToPresentAllowWhileLockedPromptForVehicleName:(id)a4 responseHandler:(id)a5;
- (void)promptDirector:(id)a3 wantsToPresentAssetProgressPromptForVehicleName:(id)a4 progressReporter:(id)a5 cancelHandler:(id)a6;
- (void)promptDirector:(id)a3 wantsToPresentAssetReadyPromptForVehicleName:(id)a4 confirmationHandler:(id)a5;
- (void)promptDirector:(id)a3 wantsToPresentAssetReadySoonPromptForVehicleName:(id)a4 confirmationHandler:(id)a5;
- (void)promptDirector:(id)a3 wantsToPresentAssetSupportingConnectPromptWithBluetoothOnlyOption:(BOOL)a4 wirelessEnablement:(unint64_t)a5 responseHandler:(id)a6;
- (void)promptDirector:(id)a3 wantsToPresentAssetSupportingUseWirelessPromptWithWirelessEnablement:(unint64_t)a4 declineVariant:(unint64_t)a5 responseHandler:(id)a6;
- (void)promptDirector:(id)a3 wantsToPresentBluetoothConfirmationPromptForVehicleName:(id)a4 numericCode:(id)a5 responseHandler:(id)a6;
- (void)promptDirector:(id)a3 wantsToPresentBluetoothContactsSyncPromptWithResponseHandler:(id)a4;
- (void)promptDirector:(id)a3 wantsToPresentBluetoothFailedPromptForVehicleName:(id)a4 isTimeout:(BOOL)a5 responseHandler:(id)a6;
- (void)promptDirector:(id)a3 wantsToPresentConnectPromptWithBluetoothOnlyOption:(BOOL)a4 wirelessEnablement:(unint64_t)a5 responseHandler:(id)a6;
- (void)promptDirector:(id)a3 wantsToPresentEnhancedIntegrationPromptForVehicleName:(id)a4 responseHandler:(id)a5;
- (void)promptDirector:(id)a3 wantsToPresentSetupCarKeysPromptForVehicleName:(id)a4 carKeyInfo:(id)a5 cancelHandler:(id)a6;
- (void)promptDirector:(id)a3 wantsToPresentUseWirelessPromptWithWirelessEnablement:(unint64_t)a4 declineVariant:(unint64_t)a5 responseHandler:(id)a6;
- (void)promptDirectorWantsToPresentWaiting:(id)a3;
- (void)proxCardFlowDidDismiss;
- (void)proxCardFlowWillPresent;
- (void)setGenericNavigationController:(id)a3;
- (void)setProxNavigationController:(id)a3;
@end

@implementation CARSetupPromptPresenter

- (CARSetupPromptPresenter)initWithPresentingViewController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CARSetupPromptPresenter;
  v5 = [(CARSetupPromptPresenter *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_presentingViewController, v4);
    v7 = [[CARSetupPromptDirector alloc] initWithPresenter:v6];
    promptDirector = v6->_promptDirector;
    v6->_promptDirector = v7;
  }
  return v6;
}

- (void)_presentPromptViewController:(id)a3
{
  id v4 = a3;
  v5 = [(CARSetupPromptPresenter *)self proxNavigationController];

  v6 = CARSetupLogForCategory();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "pushing prox card view controller: %@", (uint8_t *)&v10, 0xCu);
    }

    v8 = [(CARSetupPromptPresenter *)self proxNavigationController];
    [v8 pushViewController:v4 animated:1];
  }
  else
  {
    if (v7)
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "starting prox card presentation for view controller: %@", (uint8_t *)&v10, 0xCu);
    }

    v9 = [(CARSetupPromptPresenter *)self presentingViewController];
    v8 = [v9 presentProxCardFlowWithDelegate:self initialViewController:v4];

    [(CARSetupPromptPresenter *)self setProxNavigationController:v8];
  }
}

- (void)_presentGenericViewController:(id)a3
{
  id v4 = a3;
  v5 = [(CARSetupPromptPresenter *)self proxNavigationController];

  if (v5)
  {
    [(CARSetupPromptPresenter *)self setProxNavigationController:0];
    v6 = [(CARSetupPromptPresenter *)self presentingViewController];
    [v6 dismissViewControllerAnimated:1 completion:0];

    BOOL v7 = CARSetupLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "dismissing prox card presentation", (uint8_t *)&v13, 2u);
    }
  }
  v8 = [(CARSetupPromptPresenter *)self genericNavigationController];

  v9 = CARSetupLogForCategory();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "pushing prox card view controller: %@", (uint8_t *)&v13, 0xCu);
    }

    id v11 = [(CARSetupPromptPresenter *)self genericNavigationController];
    [v11 pushViewController:v4 animated:1];
  }
  else
  {
    if (v10)
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "starting generic card presentation for view controller: %@", (uint8_t *)&v13, 0xCu);
    }

    id v11 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v4];
    [(CARSetupPromptPresenter *)self setGenericNavigationController:v11];
    v12 = [(CARSetupPromptPresenter *)self presentingViewController];
    [v12 presentViewController:v11 animated:1 completion:0];
  }
}

- (void)promptDirector:(id)a3 wantsToPresentBluetoothConfirmationPromptForVehicleName:(id)a4 numericCode:(id)a5 responseHandler:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000052EC;
  v11[3] = &unk_1000102A0;
  id v12 = a6;
  id v9 = v12;
  BOOL v10 = +[CARSetupPrompts bluetoothConfirmationPromptForVehicleName:a4 numericCode:a5 responseHandler:v11];
  [(CARSetupPromptPresenter *)self _presentPromptViewController:v10];
}

- (void)promptDirector:(id)a3 wantsToPresentBluetoothContactsSyncPromptWithResponseHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005488;
  v7[3] = &unk_1000102A0;
  id v8 = a4;
  id v5 = v8;
  v6 = +[CARSetupPrompts bluetoothContactsSyncPromptWithResponseHandler:v7];
  [(CARSetupPromptPresenter *)self _presentPromptViewController:v6];
}

- (void)promptDirector:(id)a3 wantsToPresentBluetoothFailedPromptForVehicleName:(id)a4 isTimeout:(BOOL)a5 responseHandler:(id)a6
{
  BOOL v6 = a5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000563C;
  v11[3] = &unk_1000102C8;
  id v12 = a6;
  id v9 = v12;
  BOOL v10 = +[CARSetupPrompts bluetoothFailedPromptForVehicleName:a4 isTimeout:v6 responseHandler:v11];
  [(CARSetupPromptPresenter *)self _presentPromptViewController:v10];
}

- (void)promptDirectorWantsToPresentWaiting:(id)a3
{
  id v4 = +[CARSetupPrompts waitingPrompt];
  [(CARSetupPromptPresenter *)self _presentPromptViewController:v4];
}

- (void)promptDirector:(id)a3 wantsToPresentAllowWhileLockedPromptForVehicleName:(id)a4 responseHandler:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000057DC;
  v9[3] = &unk_1000102A0;
  id v10 = a5;
  id v7 = v10;
  id v8 = +[CARSetupPrompts allowWhileLockedPromptForVehicleName:a4 responseHandler:v9];
  [(CARSetupPromptPresenter *)self _presentPromptViewController:v8];
}

- (void)promptDirector:(id)a3 wantsToPresentConnectPromptWithBluetoothOnlyOption:(BOOL)a4 wirelessEnablement:(unint64_t)a5 responseHandler:(id)a6
{
  BOOL v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005990;
  v11[3] = &unk_1000102A0;
  id v12 = a6;
  id v9 = v12;
  id v10 = +[CARSetupPrompts connectPromptWithBluetoothOnlyOption:v7 wirelessEnablement:a5 responseHandler:v11];
  [(CARSetupPromptPresenter *)self _presentPromptViewController:v10];
}

- (void)promptDirector:(id)a3 wantsToPresentUseWirelessPromptWithWirelessEnablement:(unint64_t)a4 declineVariant:(unint64_t)a5 responseHandler:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005B44;
  v11[3] = &unk_1000102A0;
  id v12 = a6;
  id v9 = v12;
  id v10 = +[CARSetupPrompts useWirelessPromptWithWirelessEnablement:a4 declineVariant:a5 responseHandler:v11];
  [(CARSetupPromptPresenter *)self _presentPromptViewController:v10];
}

- (void)promptDirector:(id)a3 wantsToPresentEnhancedIntegrationPromptForVehicleName:(id)a4 responseHandler:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005CE8;
  v9[3] = &unk_1000102A0;
  id v10 = a5;
  id v7 = v10;
  id v8 = +[CARSetupPrompts enhancedIntegrationPromptForVehicleName:a4 responseHandler:v9];
  [(CARSetupPromptPresenter *)self _presentPromptViewController:v8];
}

- (void)promptDirector:(id)a3 wantsToPresentAssetSupportingConnectPromptWithBluetoothOnlyOption:(BOOL)a4 wirelessEnablement:(unint64_t)a5 responseHandler:(id)a6
{
  BOOL v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005E9C;
  v11[3] = &unk_1000102A0;
  id v12 = a6;
  id v9 = v12;
  id v10 = +[CARSetupPrompts assetSupportingConnectPromptWithBluetoothOnlyOption:v7 wirelessEnablement:a5 responseHandler:v11];
  [(CARSetupPromptPresenter *)self _presentPromptViewController:v10];
}

- (void)promptDirector:(id)a3 wantsToPresentAssetSupportingUseWirelessPromptWithWirelessEnablement:(unint64_t)a4 declineVariant:(unint64_t)a5 responseHandler:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006050;
  v11[3] = &unk_1000102A0;
  id v12 = a6;
  id v9 = v12;
  id v10 = +[CARSetupPrompts assetSupportingUseWirelessPromptWithWirelessEnablement:a4 declineVariant:a5 responseHandler:v11];
  [(CARSetupPromptPresenter *)self _presentPromptViewController:v10];
}

- (void)promptDirector:(id)a3 wantsToPresentAssetProgressPromptForVehicleName:(id)a4 progressReporter:(id)a5 cancelHandler:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = objc_alloc((Class)CARSetupAssetProgressViewController);
  int v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_10000620C;
  v16 = &unk_1000102F0;
  v17 = self;
  id v18 = v8;
  id v11 = v8;
  id v12 = [v10 initWithProgressReporter:v9 cancelHandler:&v13];

  -[CARSetupPromptPresenter _presentGenericViewController:](self, "_presentGenericViewController:", v12, v13, v14, v15, v16, v17);
}

- (void)promptDirector:(id)a3 wantsToPresentAssetReadyPromptForVehicleName:(id)a4 confirmationHandler:(id)a5
{
  id v6 = a5;
  id v7 = objc_alloc((Class)CARSetupAssetReadyViewController);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006328;
  v10[3] = &unk_1000102C8;
  id v11 = v6;
  id v8 = v6;
  id v9 = [v7 initWithDoneHandler:v10];
  [(CARSetupPromptPresenter *)self _presentGenericViewController:v9];
}

- (void)promptDirector:(id)a3 wantsToPresentAssetReadySoonPromptForVehicleName:(id)a4 confirmationHandler:(id)a5
{
  id v6 = a5;
  id v7 = objc_alloc((Class)CARSetupAssetReadySoonViewController);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000646C;
  v10[3] = &unk_1000102C8;
  id v11 = v6;
  id v8 = v6;
  id v9 = [v7 initWithDoneHandler:v10];
  [(CARSetupPromptPresenter *)self _presentGenericViewController:v9];
}

- (void)promptDirector:(id)a3 wantsToPresentSetupCarKeysPromptForVehicleName:(id)a4 carKeyInfo:(id)a5 cancelHandler:(id)a6
{
  id v9 = a6;
  id v10 = [(CARSetupPromptPresenter *)self _passConfigurationFromDigitalCarKeyInfo:a5 vehicleName:a4];
  id v11 = objc_alloc_init((Class)PKPaymentService);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000065DC;
  v13[3] = &unk_100010340;
  v13[4] = self;
  id v14 = v9;
  id v12 = v9;
  +[PKVehicleInitiatedPairingViewController vehicleInitiatedPairingViewControllerForConfiguration:v10 paymentService:v11 completion:v13];
}

- (void)proxCardFlowWillPresent
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "prox card flow will present", v3, 2u);
  }
}

- (void)proxCardFlowDidDismiss
{
  v3 = CARSetupLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "prox card flow did dismiss", v6, 2u);
  }

  id v4 = [(CARSetupPromptPresenter *)self proxNavigationController];

  if (v4)
  {
    id v5 = [(CARSetupPromptPresenter *)self promptDirector];
    [v5 presenterDidDismiss];

    [(CARSetupPromptPresenter *)self setProxNavigationController:0];
  }
}

- (void)_dismissFromGenericFlow
{
  v3 = CARSetupLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "generic flow did dismiss", v6, 2u);
  }

  id v4 = [(CARSetupPromptPresenter *)self genericNavigationController];

  if (v4)
  {
    id v5 = [(CARSetupPromptPresenter *)self promptDirector];
    [v5 presenterDidDismiss];

    [(CARSetupPromptPresenter *)self setGenericNavigationController:0];
  }
}

- (id)_passConfigurationFromDigitalCarKeyInfo:(id)a3 vehicleName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)PKAddCarKeyPassConfiguration);
  [v7 setReferralSource:3];
  if (v6) {
    [v7 setVehicleName:v6];
  }
  v46 = v6;
  uint64_t v8 = kCFACCProperties_Endpoint_DigitalCarKey_VehicleIdentifier;
  objc_opt_class();
  id v9 = [v5 objectForKey:v8];
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  if (v10) {
    [v7 setPairedReaderIdentifier:v10];
  }
  v45 = v10;
  objc_opt_class();
  id v11 = [v5 objectForKey:kACCProperties_Endpoint_DigitalCarKey_CCCManufacturer];
  if (v11 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  if (v12) {
    [v7 setManufacturerIdentifier:v12];
  }
  v44 = v12;
  objc_opt_class();
  id v13 = [v5 objectForKey:kACCProperties_Endpoint_DigitalCarKey_CCCBrand];
  if (v13 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }

  if (v14) {
    [v7 setIssuerIdentifier:v14];
  }
  v43 = v14;
  objc_opt_class();
  id v15 = [v5 objectForKey:kACCProperties_Endpoint_DigitalCarKey_ProductPlanUID];
  if (v15 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }

  if (v16) {
    [v7 setProductPlanIdentifier:v16];
  }
  v42 = v16;
  objc_opt_class();
  id v17 = [v5 objectForKey:kACCProperties_Endpoint_DigitalCarKey_SupportedRadioTechnologies];
  if (v17 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }
  v47 = v7;
  v48 = v5;

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v19 = v18;
  id v20 = [v19 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = 0;
    uint64_t v23 = *(void *)v50;
    id v24 = (id)kACCProperties_Endpoint_DigitalCarKey_RadioTechnology_NearFieldCommunication;
    id v25 = (id)kACCProperties_Endpoint_DigitalCarKey_RadioTechnology_Bluetooth;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v50 != v23) {
          objc_enumerationMutation(v19);
        }
        v27 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        objc_opt_class();
        id v28 = v27;
        if (v28)
        {
          v29 = v28;
          if (objc_opt_isKindOfClass()) {
            id v30 = v29;
          }
          else {
            id v30 = 0;
          }

          id v31 = [v30 integerValue];
          uint64_t v32 = v22 | 2;
          if (v31 != v25) {
            uint64_t v32 = v22;
          }
          if (v31 == v24) {
            v22 |= 1uLL;
          }
          else {
            uint64_t v22 = v32;
          }
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v21);
  }
  else
  {
    uint64_t v22 = 0;
  }

  [v47 setSupportedRadioTechnologies:v22];
  objc_opt_class();
  id v33 = [v48 objectForKey:kACCProperties_Endpoint_DigitalCarKey_ProvisioningTemplate];
  if (v33 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v34 = v33;
  }
  else {
    id v34 = 0;
  }

  if (v34) {
    [v47 setProvisioningTemplateIdentifier:v34];
  }
  objc_opt_class();
  id v35 = [v48 objectForKey:kACCProperties_Endpoint_DigitalCarKey_OwnerKeyPairingAvailable];
  if (v35 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v36 = v35;
  }
  else {
    id v36 = 0;
  }

  if (v36) {
    [v47 setOwnerKeyPairingAvailable:[v36 BOOLValue]];
  }
  objc_opt_class();
  id v37 = [v48 objectForKey:kACCProperties_Endpoint_DigitalCarKey_OnlineServicesActivated];
  if (v37 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v38 = v37;
  }
  else {
    id v38 = 0;
  }

  if (v38) {
    [v47 setOnlineServicesActivated:[v38 BOOLValue]];
  }
  objc_opt_class();
  id v39 = [v48 objectForKey:kACCProperties_Endpoint_DigitalCarKey_ProofOfOwnershipPresent];
  if (v39 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v40 = v39;
  }
  else {
    id v40 = 0;
  }

  if (v40) {
    [v47 setProofOfOwnershipPresent:[v40 BOOLValue]];
  }

  return v47;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (CARSetupPromptDirector)promptDirector
{
  return self->_promptDirector;
}

- (UINavigationController)proxNavigationController
{
  return self->_proxNavigationController;
}

- (void)setProxNavigationController:(id)a3
{
}

- (UINavigationController)genericNavigationController
{
  return self->_genericNavigationController;
}

- (void)setGenericNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genericNavigationController, 0);
  objc_storeStrong((id *)&self->_proxNavigationController, 0);
  objc_storeStrong((id *)&self->_promptDirector, 0);

  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end