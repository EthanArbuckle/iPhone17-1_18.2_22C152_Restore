@interface BTShareAudioConnectingViewController
- (BTMediaPlayerView)productMovieView;
- (NSString)deviceName;
- (UIActivityIndicatorView)progressActivity;
- (UIButton)cancelButton;
- (UIImageView)productImageView;
- (UIImageView)shareImageView;
- (UILabel)progressLabel;
- (UIView)progressView;
- (unsigned)colorCode;
- (unsigned)productID;
- (void)_updateDeviceVisual:(id)a3;
- (void)_updateForDeviceInfo;
- (void)eventCancel:(id)a3;
- (void)sessionProgressEvent:(int)a3 info:(id)a4;
- (void)setCancelButton:(id)a3;
- (void)setColorCode:(unsigned int)a3;
- (void)setDeviceName:(id)a3;
- (void)setProductID:(unsigned int)a3;
- (void)setProductImageView:(id)a3;
- (void)setProductMovieView:(id)a3;
- (void)setProgressActivity:(id)a3;
- (void)setProgressLabel:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setShareImageView:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BTShareAudioConnectingViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v7.receiver = self;
  v7.super_class = (Class)BTShareAudioConnectingViewController;
  [(BTShareAudioBaseViewController *)&v7 viewWillAppear:v3];
  [(BTShareAudioConnectingViewController *)self _updateForDeviceInfo];
  v5 = [(BTShareAudioViewController *)self->super._mainController mainBundle];
  [(UIView *)self->_progressView startAnimating];
  v6 = CULocalizedStringEx();
  [(UIActivityIndicatorView *)self->_progressActivity setText:v6];

  [(UILabel *)self->_progressLabel setHidden:1];
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
  v5.super_class = (Class)BTShareAudioConnectingViewController;
  [(BTShareAudioBaseViewController *)&v5 viewWillDisappear:v3];
  [(BTShareAudioViewController *)self->super._mainController setVcConnecting:0];
  [(UIImageView *)self->_productImageView stop];
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

- (void)sessionProgressEvent:(int)a3 info:(id)a4
{
  id v6 = a4;
  if (a3 == 300 || a3 == 220 || a3 == 200)
  {
    id v9 = v6;
    [(BTShareAudioConnectingViewController *)self _updateForDeviceInfo];
    objc_super v7 = [(BTShareAudioViewController *)self->super._mainController mainBundle];
    v8 = CULocalizedStringEx();
    [(UIActivityIndicatorView *)self->_progressActivity setText:v8];

    id v6 = v9;
  }
}

- (void)_updateForDeviceInfo
{
  BOOL v3 = self->_cancelButton;
  if (v3)
  {
    [(UILabel *)self->super._titleLabel setText:v3];
  }
  else
  {
    id v4 = [(BTShareAudioViewController *)self->super._mainController mainBundle];
    if (self->_colorCode) {
      SFLocalizedNameForBluetoothProductID();
    }
    else {
    objc_super v5 = CULocalizedStringEx();
    }
    [(UILabel *)self->super._titleLabel setText:v5];
  }
  [(UILabel *)self->super._titleLabel setNumberOfLines:2];
  unsigned int colorCode = self->_colorCode;
  if (colorCode)
  {
    if (colorCode != *((_DWORD *)&self->super._viewActive + 1))
    {
      *((_DWORD *)&self->super._viewActive + 1) = colorCode;
      if (gLogCategory_BTShareAudioViewController <= 30
        && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v7 = objc_alloc_init(MEMORY[0x263F6C1F8]);
      [v7 setBluetoothProductID:LOWORD(self->_colorCode)];
      [v7 setColorCode:self->_productIDActive];
      [v7 setTimeoutSeconds:5.0];
      id v8 = objc_alloc_init(MEMORY[0x263F6C1F0]);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __60__BTShareAudioConnectingViewController__updateForDeviceInfo__block_invoke;
      v9[3] = &unk_265049E80;
      v9[4] = v8;
      v9[5] = self;
      [v8 getDeviceAssets:v7 completion:v9];
    }
  }
  else
  {
    [(BTShareAudioConnectingViewController *)self _updateDeviceVisual:0];
  }
}

void __60__BTShareAudioConnectingViewController__updateForDeviceInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) invalidate];
  if (*(unsigned char *)(*(void *)(a1 + 40) + 1000))
  {
    id v6 = [v12 assetBundlePath];
    if (gLogCategory_BTShareAudioViewController <= 30
      && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      id v10 = v5;
      v11 = v6;
      uint64_t v8 = *(unsigned int *)(v7 + 1012);
      uint64_t v9 = *(unsigned int *)(v7 + 1008);
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 40), "_updateDeviceVisual:", v6, v8, v9, v10, v11);
  }
}

- (void)_updateDeviceVisual:(id)a3
{
  id v14 = [(BTShareAudioViewController *)self->super._mainController _moviePathForPID:self->_colorCode colorCode:self->_productIDActive];
  id v4 = (void *)[[NSString alloc] initWithFormat:@"%@-Loop", v14];
  id v5 = [(BTShareAudioViewController *)self->super._mainController mainBundle];
  id v6 = [v5 pathForResource:v4 ofType:@"mov"];

  if (v6)
  {
    if (gLogCategory_BTShareAudioViewController <= 30
      && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
    {
      unsigned int colorCode = v6;
      LogPrintF();
    }
    -[UIImageView startMovieLoopWithPath:](self->_productImageView, "startMovieLoopWithPath:", v6, colorCode);
    [(UIImageView *)self->_productImageView setHidden:0];
  }
  else
  {
    uint64_t v7 = [(BTShareAudioViewController *)self->super._mainController _imageForPID:self->_colorCode colorCode:self->_productIDActive];
    if (v7)
    {
      if (gLogCategory_BTShareAudioViewController <= 30
        && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
      {
        unsigned int colorCode = (void *)self->_colorCode;
        uint64_t productIDActive = self->_productIDActive;
        LogPrintF();
      }
      p_productID = (id *)&self->_productID;
      objc_msgSend(*p_productID, "setImage:", v7, colorCode, productIDActive);
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
      p_productID = (id *)&self->_productMovieView;
      [*p_productID setImage:v11];
    }
    [*p_productID setHidden:0];
  }
}

- (UIImageView)productImageView
{
  return *(UIImageView **)&self->_productID;
}

- (void)setProductImageView:(id)a3
{
}

- (BTMediaPlayerView)productMovieView
{
  return (BTMediaPlayerView *)self->_productImageView;
}

- (void)setProductMovieView:(id)a3
{
}

- (UIImageView)shareImageView
{
  return (UIImageView *)self->_productMovieView;
}

- (void)setShareImageView:(id)a3
{
}

- (UIView)progressView
{
  return &self->_shareImageView->super;
}

- (void)setProgressView:(id)a3
{
}

- (UIActivityIndicatorView)progressActivity
{
  return (UIActivityIndicatorView *)self->_progressView;
}

- (void)setProgressActivity:(id)a3
{
}

- (UILabel)progressLabel
{
  return (UILabel *)self->_progressActivity;
}

- (void)setProgressLabel:(id)a3
{
}

- (UIButton)cancelButton
{
  return (UIButton *)self->_progressLabel;
}

- (void)setCancelButton:(id)a3
{
}

- (unsigned)colorCode
{
  return self->_productIDActive;
}

- (void)setColorCode:(unsigned int)a3
{
  self->_uint64_t productIDActive = a3;
}

- (NSString)deviceName
{
  return (NSString *)&self->_cancelButton->super.super.super.super.isa;
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
  self->_unsigned int colorCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_progressActivity, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_shareImageView, 0);
  objc_storeStrong((id *)&self->_productMovieView, 0);
  objc_storeStrong((id *)&self->_productImageView, 0);
  objc_storeStrong((id *)&self->_productID, 0);
}

@end