@interface BTShareAudioConfirmViewController
- (BTMediaPlayerView)productMovieView;
- (NSString)deviceName;
- (UIButton)cancelButton;
- (UIButton)confirmButton;
- (UIImageView)productImageView;
- (UIImageView)shareImageView;
- (unsigned)colorCode;
- (unsigned)productID;
- (void)_updateDeviceVisual:(id)a3;
- (void)eventCancel:(id)a3;
- (void)eventPermanentButton:(id)a3;
- (void)eventTemporarilyShareButton:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setColorCode:(unsigned int)a3;
- (void)setConfirmButton:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setProductID:(unsigned int)a3;
- (void)setProductImageView:(id)a3;
- (void)setProductMovieView:(id)a3;
- (void)setShareImageView:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BTShareAudioConfirmViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v10.receiver = self;
  v10.super_class = (Class)BTShareAudioConfirmViewController;
  [(BTShareAudioBaseViewController *)&v10 viewWillAppear:v3];
  if (self->_deviceName)
  {
    -[UILabel setText:](self->super._titleLabel, "setText:");
  }
  else
  {
    if (self->_colorCode)
    {
      v5 = SFLocalizedNameForBluetoothProductID();
      [(UILabel *)self->super._titleLabel setText:v5];
    }
    else
    {
      v5 = [(BTShareAudioViewController *)self->super._mainController mainBundle];
      v6 = CULocalizedStringEx();
      [(UILabel *)self->super._titleLabel setText:v6];
    }
  }
  [(UILabel *)self->super._titleLabel setNumberOfLines:2];
  if (self->_colorCode)
  {
    if (gLogCategory_BTShareAudioViewController <= 30
      && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v7 = objc_alloc_init(MEMORY[0x263F6C1F8]);
    [v7 setBluetoothProductID:LOWORD(self->_colorCode)];
    [v7 setColorCode:*((unsigned int *)&self->super._viewActive + 1)];
    [v7 setTimeoutSeconds:5.0];
    id v8 = objc_alloc_init(MEMORY[0x263F6C1F0]);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __52__BTShareAudioConfirmViewController_viewWillAppear___block_invoke;
    v9[3] = &unk_265049E80;
    v9[4] = v8;
    v9[5] = self;
    [v8 getDeviceAssets:v7 completion:v9];
  }
  else
  {
    [(BTShareAudioConfirmViewController *)self _updateDeviceVisual:0];
  }
}

void __52__BTShareAudioConfirmViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) invalidate];
  if (*(unsigned char *)(*(void *)(a1 + 40) + 1000))
  {
    v6 = [v12 assetBundlePath];
    if (gLogCategory_BTShareAudioViewController <= 30
      && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      id v10 = v5;
      v11 = v6;
      uint64_t v8 = *(unsigned int *)(v7 + 1008);
      uint64_t v9 = *(unsigned int *)(v7 + 1004);
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 40), "_updateDeviceVisual:", v6, v8, v9, v10, v11);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)BTShareAudioConfirmViewController;
  [(BTShareAudioBaseViewController *)&v5 viewWillDisappear:v3];
  [(BTMediaPlayerView *)self->_productMovieView stop];
}

- (void)eventTemporarilyShareButton:(id)a3
{
  id v5 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v4 = [(BTShareAudioViewController *)self->super._mainController shareAudioSession];
  [v4 userConfirmed:0];
}

- (void)eventPermanentButton:(id)a3
{
  id v5 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v4 = [(BTShareAudioViewController *)self->super._mainController shareAudioSession];
  [v4 userConfirmed:1];
}

- (void)eventCancel:(id)a3
{
  id v4 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(BTShareAudioViewController *)self->super._mainController reportUserCancelled];
}

- (void)_updateDeviceVisual:(id)a3
{
  id v14 = [(BTShareAudioViewController *)self->super._mainController _moviePathForPID:self->_colorCode colorCode:*((unsigned int *)&self->super._viewActive + 1)];
  id v4 = (void *)[[NSString alloc] initWithFormat:@"%@-Loop", v14];
  id v5 = [(BTShareAudioViewController *)self->super._mainController mainBundle];
  v6 = [v5 pathForResource:v4 ofType:@"mov"];

  if (v6)
  {
    if (gLogCategory_BTShareAudioViewController <= 30
      && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
    {
      colorCode = v6;
      LogPrintF();
    }
    -[BTMediaPlayerView startMovieLoopWithPath:](self->_productMovieView, "startMovieLoopWithPath:", v6, colorCode);
    [(BTMediaPlayerView *)self->_productMovieView setHidden:0];
  }
  else
  {
    uint64_t v7 = [(BTShareAudioViewController *)self->super._mainController _imageForPID:self->_colorCode colorCode:*((unsigned int *)&self->super._viewActive + 1)];
    if (v7)
    {
      if (gLogCategory_BTShareAudioViewController <= 30
        && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
      {
        colorCode = (void *)self->_colorCode;
        uint64_t v13 = *((unsigned int *)&self->super._viewActive + 1);
        LogPrintF();
      }
      p_productImageView = &self->_productImageView;
      -[UIImageView setImage:](*p_productImageView, "setImage:", v7, colorCode, v13);
    }
    else
    {
      if (gLogCategory_BTShareAudioViewController <= 30
        && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v9 = (void *)MEMORY[0x263F1C6B0];
      id v10 = [(BTShareAudioViewController *)self->super._mainController mainBundle];
      v11 = [v9 imageNamed:@"ShareAudioAirPods" inBundle:v10 compatibleWithTraitCollection:0];
      p_productImageView = &self->_shareImageView;
      [(UIImageView *)*p_productImageView setImage:v11];
    }
    [(UIImageView *)*p_productImageView setHidden:0];
  }
}

- (UIImageView)productImageView
{
  return self->_productImageView;
}

- (void)setProductImageView:(id)a3
{
}

- (BTMediaPlayerView)productMovieView
{
  return self->_productMovieView;
}

- (void)setProductMovieView:(id)a3
{
}

- (UIButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setConfirmButton:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UIImageView)shareImageView
{
  return self->_shareImageView;
}

- (void)setShareImageView:(id)a3
{
}

- (unsigned)colorCode
{
  return *((_DWORD *)&self->super._viewActive + 1);
}

- (void)setColorCode:(unsigned int)a3
{
  *((_DWORD *)&self->super._viewActive + 1) = a3;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (unsigned)productID
{
  return self->_colorCode;
}

- (void)setProductID:(unsigned int)a3
{
  self->_colorCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_shareImageView, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_productMovieView, 0);
  objc_storeStrong((id *)&self->_productImageView, 0);
}

@end