@interface CARSetupPromptPresenterProxy
- (CARSetupPromptDirector)director;
- (NSProgress)progress;
- (void)presentAllowWhileLockedPromptForVehicleName:(id)a3 responseHandler:(id)a4;
- (void)presentAssetProgressPromptForVehicleName:(id)a3 cancelHandler:(id)a4;
- (void)presentAssetReadyPromptForVehicleName:(id)a3 confirmationHandler:(id)a4;
- (void)presentAssetReadySoonPromptForVehicleName:(id)a3 confirmationHandler:(id)a4;
- (void)presentAssetSupportingConnectPromptWithBluetoothOnlyOption:(BOOL)a3 wirelessEnablement:(unint64_t)a4 responseHandler:(id)a5;
- (void)presentAssetSupportingUseWirelessPromptWithWirelessEnablement:(unint64_t)a3 declineVariant:(unint64_t)a4 responseHandler:(id)a5;
- (void)presentBluetoothConfirmationPromptForVehicleName:(id)a3 numericCode:(id)a4 responseHandler:(id)a5;
- (void)presentBluetoothContactsSyncPromptWithResponseHandler:(id)a3;
- (void)presentBluetoothFailedPromptForVehicleName:(id)a3 isTimeout:(BOOL)a4 responseHandler:(id)a5;
- (void)presentConnectPromptWithBluetoothOnlyOption:(BOOL)a3 wirelessEnablement:(unint64_t)a4 responseHandler:(id)a5;
- (void)presentEnhancedIntegrationPromptForVehicleName:(id)a3 responseHandler:(id)a4;
- (void)presentSetupCarKeysPromptForVehicleName:(id)a3 carKeyInfo:(id)a4 cancelHandler:(id)a5;
- (void)presentUseWirelessPromptWithWirelessEnablement:(unint64_t)a3 declineVariant:(unint64_t)a4 responseHandler:(id)a5;
- (void)presentWaitingPrompt;
- (void)setDirector:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation CARSetupPromptPresenterProxy

- (void)presentBluetoothConfirmationPromptForVehicleName:(id)a3 numericCode:(id)a4 responseHandler:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000074E0;
  v10[3] = &unk_1000103A8;
  v10[4] = self;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v7 = v13;
  id v8 = v12;
  id v9 = v11;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v10);
}

- (void)presentBluetoothContactsSyncPromptWithResponseHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000077A0;
  v4[3] = &unk_1000103D0;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)presentBluetoothFailedPromptForVehicleName:(id)a3 isTimeout:(BOOL)a4 responseHandler:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007A80;
  v9[3] = &unk_1000103F8;
  v9[4] = self;
  id v10 = a3;
  BOOL v12 = a4;
  id v11 = a5;
  id v7 = v11;
  id v8 = v10;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)presentWaitingPrompt
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007CBC;
  block[3] = &unk_100010420;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)presentAllowWhileLockedPromptForVehicleName:(id)a3 responseHandler:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007E54;
  block[3] = &unk_100010448;
  block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)presentConnectPromptWithBluetoothOnlyOption:(BOOL)a3 wirelessEnablement:(unint64_t)a4 responseHandler:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000811C;
  v8[3] = &unk_100010470;
  BOOL v11 = a3;
  id v9 = a5;
  unint64_t v10 = a4;
  v8[4] = self;
  id v7 = v9;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v8);
}

- (void)presentUseWirelessPromptWithWirelessEnablement:(unint64_t)a3 declineVariant:(unint64_t)a4 responseHandler:(id)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000083F0;
  v6[3] = &unk_100010498;
  unint64_t v8 = a3;
  unint64_t v9 = a4;
  v6[4] = self;
  id v7 = a5;
  id v5 = v7;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)presentEnhancedIntegrationPromptForVehicleName:(id)a3 responseHandler:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000086DC;
  block[3] = &unk_100010448;
  id v9 = a3;
  unint64_t v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)presentAssetSupportingConnectPromptWithBluetoothOnlyOption:(BOOL)a3 wirelessEnablement:(unint64_t)a4 responseHandler:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000089E4;
  v8[3] = &unk_100010470;
  BOOL v11 = a3;
  id v9 = a5;
  unint64_t v10 = a4;
  v8[4] = self;
  id v7 = v9;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v8);
}

- (void)presentAssetSupportingUseWirelessPromptWithWirelessEnablement:(unint64_t)a3 declineVariant:(unint64_t)a4 responseHandler:(id)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008CB8;
  v6[3] = &unk_100010498;
  unint64_t v8 = a3;
  unint64_t v9 = a4;
  v6[4] = self;
  id v7 = a5;
  id v5 = v7;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)presentAssetProgressPromptForVehicleName:(id)a3 cancelHandler:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008FA4;
  block[3] = &unk_100010448;
  id v9 = a3;
  unint64_t v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)presentAssetReadyPromptForVehicleName:(id)a3 confirmationHandler:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000092AC;
  block[3] = &unk_100010448;
  id v9 = a3;
  unint64_t v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)presentAssetReadySoonPromptForVehicleName:(id)a3 confirmationHandler:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009574;
  block[3] = &unk_100010448;
  id v9 = a3;
  unint64_t v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)presentSetupCarKeysPromptForVehicleName:(id)a3 carKeyInfo:(id)a4 cancelHandler:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100009850;
  v11[3] = &unk_1000103A8;
  id v12 = a3;
  id v13 = self;
  id v14 = a4;
  id v15 = a5;
  id v8 = v15;
  id v9 = v14;
  id v10 = v12;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v11);
}

- (CARSetupPromptDirector)director
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_director);

  return (CARSetupPromptDirector *)WeakRetained;
}

- (void)setDirector:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);

  objc_destroyWeak((id *)&self->_director);
}

@end