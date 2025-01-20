@interface ShareAudioAcceptMainController
- (unint64_t)desiredHomeButtonEvents;
- (unsigned)btProductID;
- (void)dismiss:(int)a3;
- (void)dismiss:(int)a3 completion:(id)a4;
- (void)dismissWithAction:(int)a3;
- (void)setBtProductID:(unsigned int)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)xpcStarted:(id)a3;
@end

@implementation ShareAudioAcceptMainController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vcAsk, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);

  objc_storeStrong((id *)&self->_btClient, 0);
}

- (void)setBtProductID:(unsigned int)a3
{
  self->_btProductID = a3;
}

- (unsigned)btProductID
{
  return self->_btProductID;
}

- (void)dismissWithAction:(int)a3
{
  if (!self->_dismissed)
  {
    uint64_t v3 = *(void *)&a3;
    self->_dismissed = 1;
    v5 = self->super._proxCardSessionServer;
    if (v5)
    {
      if (dword_1001CCAA8 <= 30 && (dword_1001CCAA8 != -1 || _LogCategory_Initialize()))
      {
        if (v3 > 3) {
          v6 = "?";
        }
        else {
          v6 = off_1001A15D0[v3];
        }
        v8 = v6;
        LogPrintF();
      }
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10012BDC8;
      v11[3] = &unk_1001A15B0;
      int v12 = v3;
      v11[4] = self;
      -[SFProxCardSessionServer performAction:completion:](v5, "performAction:completion:", v3, v11, v8);
    }
    else
    {
      [(ShareAudioAcceptMainController *)self _remoteViewControllerProxy];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10012BEF8;
      v9[3] = &unk_1001A1BD8;
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v7 = v10;
      [(ShareAudioAcceptMainController *)self dismissViewControllerAnimated:1 completion:v9];
    }
  }
}

- (void)xpcStarted:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_1001CCAA8 <= 30)
  {
    id v5 = v3;
    if (dword_1001CCAA8 != -1 || (id v3 = (id)_LogCategory_Initialize(), v4 = v5, v3))
    {
      id v3 = (id)LogPrintF();
      id v4 = v5;
    }
  }

  _objc_release_x1(v3, v4);
}

- (void)dismiss:(int)a3 completion:(id)a4
{
  v6 = (void (**)(void))a4;
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    id v7 = [(ShareAudioAcceptMainController *)self _remoteViewControllerProxy];
    vcAsk = self->_vcAsk;
    if (vcAsk)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10012C0B4;
      v9[3] = &unk_1001A1AE8;
      v11 = v6;
      id v10 = v7;
      [(ShareAudioAcceptAskViewController *)vcAsk dismissViewControllerAnimated:a3 != 19 completion:v9];
    }
    else
    {
      if (v6) {
        v6[2](v6);
      }
      [v7 dismiss];
    }
  }
}

- (void)dismiss:(int)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CCAA8 <= 30 && (dword_1001CCAA8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(CUBluetoothClient *)self->_btClient invalidate];
  btClient = self->_btClient;
  self->_btClient = 0;

  if (!self->_dismissed)
  {
    if (dword_1001CCAA8 <= 30 && (dword_1001CCAA8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(ShareAudioAcceptMainController *)self dismiss:21];
  }
  storyboard = self->_storyboard;
  self->_storyboard = 0;

  [(ShareAudioAcceptAskViewController *)self->_vcAsk setMainController:0];
  vcAsk = self->_vcAsk;
  self->_vcAsk = 0;

  v8.receiver = self;
  v8.super_class = (Class)ShareAudioAcceptMainController;
  [(SVSBaseMainController *)&v8 viewDidDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CCAA8 <= 30 && (dword_1001CCAA8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v12.receiver = self;
  v12.super_class = (Class)ShareAudioAcceptMainController;
  [(ShareAudioAcceptMainController *)&v12 viewDidAppear:v3];
  id v5 = (CUBluetoothClient *)objc_alloc_init((Class)CUBluetoothClient);
  btClient = self->_btClient;
  self->_btClient = v5;

  [(CUBluetoothClient *)self->_btClient setFlags:16];
  [(CUBluetoothClient *)self->_btClient setLabel:@"ShareAudioAccept"];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10012C430;
  v11[3] = &unk_1001A1588;
  v11[4] = self;
  [(CUBluetoothClient *)self->_btClient setDeviceConnectedHandler:v11];
  [(CUBluetoothClient *)self->_btClient activate];
  id v7 = +[UIStoryboard storyboardWithName:@"ShareAudioProx" bundle:0];
  storyboard = self->_storyboard;
  self->_storyboard = v7;

  v9 = [(UIStoryboard *)self->_storyboard instantiateViewControllerWithIdentifier:@"ShareAudioProxAccept"];
  vcAsk = self->_vcAsk;
  self->_vcAsk = v9;

  [(ShareAudioAcceptAskViewController *)self->_vcAsk setMainController:self];
  [(ShareAudioAcceptAskViewController *)self->_vcAsk setModalPresentationStyle:4];
  [(ShareAudioAcceptAskViewController *)self->_vcAsk setModalTransitionStyle:2];
  [(ShareAudioAcceptAskViewController *)self->_vcAsk setTransitioningDelegate:self->_vcAsk];
  [(ShareAudioAcceptMainController *)self presentViewController:self->_vcAsk animated:1 completion:0];
}

- (unint64_t)desiredHomeButtonEvents
{
  return 0;
}

@end