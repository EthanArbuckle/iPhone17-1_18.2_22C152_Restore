@interface BTShareAudioHoldButtonViewController
- (BTMediaPlayerView)productMovieView;
- (UIButton)cancelButton;
- (UIImageView)productImageView;
- (UIImageView)shareImageView;
- (UILabel)infoLabel;
- (UIView)productMovieContainerView;
- (id)_holdImageForPID:(unsigned int)a3 colorCode:(unsigned int)a4;
- (unsigned)colorCode;
- (unsigned)productID;
- (void)_updateDeviceVisual:(id)a3;
- (void)eventCancel:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setColorCode:(unsigned int)a3;
- (void)setInfoLabel:(id)a3;
- (void)setProductID:(unsigned int)a3;
- (void)setProductImageView:(id)a3;
- (void)setProductMovieContainerView:(id)a3;
- (void)setProductMovieView:(id)a3;
- (void)setShareImageView:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BTShareAudioHoldButtonViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v10.receiver = self;
  v10.super_class = (Class)BTShareAudioHoldButtonViewController;
  [(BTShareAudioBaseViewController *)&v10 viewWillAppear:v3];
  v5 = [(BTShareAudioViewController *)self->super._mainController mainBundle];
  v6 = CULocalizedStringEx();
  [(UILabel *)self->_infoLabel setText:v6];

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
    v9[2] = __55__BTShareAudioHoldButtonViewController_viewWillAppear___block_invoke;
    v9[3] = &unk_265049E80;
    v9[4] = v8;
    v9[5] = self;
    [v8 getDeviceAssets:v7 completion:v9];
  }
  else
  {
    [(BTShareAudioHoldButtonViewController *)self _updateDeviceVisual:0];
  }
}

void __55__BTShareAudioHoldButtonViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v5.super_class = (Class)BTShareAudioHoldButtonViewController;
  [(BTShareAudioBaseViewController *)&v5 viewWillDisappear:v3];
  [(BTMediaPlayerView *)self->_productMovieView stop];
}

- (void)viewDidLayoutSubviews
{
  v13[4] = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)BTShareAudioHoldButtonViewController;
  [(BTShareAudioHoldButtonViewController *)&v12 viewDidLayoutSubviews];
  BOOL v3 = [(UIView *)self->_productMovieContainerView layer];
  uint64_t v4 = [v3 mask];
  if (v4)
  {
    objc_super v5 = (void *)v4;
  }
  else
  {
    unsigned int colorCode = self->_colorCode;

    if (colorCode != 8202) {
      return;
    }
    BOOL v3 = [MEMORY[0x263F157D0] layer];
    [(UIView *)self->_productMovieContainerView bounds];
    objc_msgSend(v3, "setFrame:");
    id v7 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.0];
    v13[0] = [v7 CGColor];
    id v8 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:1.0];
    v13[1] = [v8 CGColor];
    id v9 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:1.0];
    v13[2] = [v9 CGColor];
    id v10 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.0];
    v13[3] = [v10 CGColor];
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:4];
    [v3 setColors:v11];

    [v3 setLocations:&unk_26F2A6FF0];
    objc_msgSend(v3, "setStartPoint:", 0.5, 0.0);
    objc_msgSend(v3, "setEndPoint:", 0.5, 1.0);
    objc_super v5 = [(UIView *)self->_productMovieContainerView layer];
    [v5 setMask:v3];
  }
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

- (id)_holdImageForPID:(unsigned int)a3 colorCode:(unsigned int)a4
{
  uint64_t v5 = a3 - 8194;
  if (v5 <= 0x22)
  {
    if (((1 << (a3 - 2)) & 0x472863101) != 0)
    {
      uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"ShareAudioDetail-PID-%u-CL_0-Hold", *(void *)&a3);
LABEL_4:
      id v7 = (void *)v6;
      id v8 = (void *)MEMORY[0x263F1C6B0];
      id v9 = [(BTShareAudioViewController *)self->super._mainController mainBundle];
      id v10 = [v8 imageNamed:v7 inBundle:v9 compatibleWithTraitCollection:0];

      goto LABEL_5;
    }
    if (v5 == 9)
    {
      uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"ShareAudioDetail-PID-%u-CL_1-Hold", 8203);
      goto LABEL_4;
    }
  }
  id v10 = [(BTShareAudioViewController *)self->super._mainController _imageForPID:*(void *)&a3 colorCode:*(void *)&a4];
LABEL_5:
  return v10;
}

- (void)_updateDeviceVisual:(id)a3
{
  id v14 = [(BTShareAudioViewController *)self->super._mainController _moviePathForPID:self->_colorCode colorCode:*((unsigned int *)&self->super._viewActive + 1)];
  id v4 = (void *)[[NSString alloc] initWithFormat:@"%@-Hold", v14];
  uint64_t v5 = [(BTShareAudioViewController *)self->super._mainController mainBundle];
  uint64_t v6 = [v5 pathForResource:v4 ofType:@"mov"];

  if (v6)
  {
    if (gLogCategory_BTShareAudioViewController <= 30
      && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
    {
      unsigned int colorCode = v6;
      LogPrintF();
    }
    -[BTMediaPlayerView startMovieLoopWithPath:](self->_productMovieView, "startMovieLoopWithPath:", v6, colorCode);
    [(BTMediaPlayerView *)self->_productMovieView setHidden:0];
  }
  else
  {
    id v7 = [(BTShareAudioViewController *)self->super._mainController _imageForPID:self->_colorCode colorCode:*((unsigned int *)&self->super._viewActive + 1)];
    if (v7)
    {
      if (gLogCategory_BTShareAudioViewController <= 30
        && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
      {
        unsigned int colorCode = (void *)self->_colorCode;
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
      [(UIImageView *)self->_productImageView setHidden:1];
      id v9 = (void *)MEMORY[0x263F1C6B0];
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

- (UIView)productMovieContainerView
{
  return self->_productMovieContainerView;
}

- (void)setProductMovieContainerView:(id)a3
{
}

- (UIImageView)shareImageView
{
  return self->_shareImageView;
}

- (void)setShareImageView:(id)a3
{
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
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
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_shareImageView, 0);
  objc_storeStrong((id *)&self->_productMovieContainerView, 0);
  objc_storeStrong((id *)&self->_productMovieView, 0);
  objc_storeStrong((id *)&self->_productImageView, 0);
}

@end