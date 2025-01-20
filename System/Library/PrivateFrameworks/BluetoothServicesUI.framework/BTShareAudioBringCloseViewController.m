@interface BTShareAudioBringCloseViewController
- (UIButton)cancelButton;
- (UIImageView)bannerImageView;
- (UIImageView)shareImageView;
- (UILabel)infoLabel;
- (UIView)productImageContainerView;
- (void)_cycleProductImage;
- (void)eventCancel:(id)a3;
- (void)setBannerImageView:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setInfoLabel:(id)a3;
- (void)setProductImageContainerView:(id)a3;
- (void)setShareImageView:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BTShareAudioBringCloseViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v9.receiver = self;
  v9.super_class = (Class)BTShareAudioBringCloseViewController;
  [(BTShareAudioBaseViewController *)&v9 viewWillAppear:v3];
  v5 = [(BTShareAudioViewController *)self->super._mainController mainBundle];
  v6 = CULocalizedStringEx();
  [(UILabel *)self->super._titleLabel setText:v6];

  [(BTShareAudioBringCloseViewController *)self _cycleProductImage];
  v7 = [(BTShareAudioViewController *)self->super._mainController mainBundle];
  v8 = CULocalizedStringEx();

  [(UIButton *)self->_cancelButton setTitle:v8 forState:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v8.receiver = self;
  v8.super_class = (Class)BTShareAudioBringCloseViewController;
  [(BTShareAudioBaseViewController *)&v8 viewWillDisappear:v3];
  cycleImageTimer = self->_cycleImageTimer;
  if (cycleImageTimer)
  {
    v6 = cycleImageTimer;
    dispatch_source_cancel(v6);
    v7 = self->_cycleImageTimer;
    self->_cycleImageTimer = 0;
  }
}

- (void)viewDidLayoutSubviews
{
  v11[2] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)BTShareAudioBringCloseViewController;
  [(BTShareAudioBringCloseViewController *)&v10 viewDidLayoutSubviews];
  BOOL v3 = [(UIView *)self->_productImageContainerView layer];
  v4 = [v3 mask];

  if (!v4)
  {
    v5 = [MEMORY[0x263F157D0] layer];
    [(UIView *)self->_productImageContainerView bounds];
    objc_msgSend(v5, "setFrame:");
    id v6 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.0];
    v11[0] = [v6 CGColor];
    id v7 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:1.0];
    v11[1] = [v7 CGColor];
    objc_super v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    [v5 setColors:v8];

    [v5 setLocations:&unk_26F2A6FC0];
    objc_msgSend(v5, "setStartPoint:", 0.0, 0.5);
    objc_msgSend(v5, "setEndPoint:", 1.0, 0.5);
    objc_super v9 = [(UIView *)self->_productImageContainerView layer];
    [v9 setMask:v5];
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

- (void)_cycleProductImage
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (!self->_cycleImageArray)
  {
    BOOL v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    cycleImageArray = self->_cycleImageArray;
    self->_cycleImageArray = v3;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v5 = [&unk_26F2A6FD8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v26;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v26 != v7) {
            objc_enumerationMutation(&unk_26F2A6FD8);
          }
          objc_super v9 = [MEMORY[0x263F1C6B0] systemImageNamed:*(void *)(*((void *)&v25 + 1) + 8 * v8)];
          [(NSMutableArray *)self->_cycleImageArray addObject:v9];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [&unk_26F2A6FD8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v6);
    }
    objc_super v10 = (void *)MEMORY[0x263F1C6C8];
    v11 = [MEMORY[0x263F1C550] whiteColor];
    v12 = [v10 configurationWithHierarchicalColor:v11];

    v13 = [MEMORY[0x263F1C6C8] configurationWithPointSize:3 weight:2 scale:160.0];
    v14 = [v12 configurationByApplyingConfiguration:v13];
    [(UIImageView *)self->_shareImageView setPreferredSymbolConfiguration:v14];
    v15 = [MEMORY[0x263F1C550] whiteColor];
    [(UIImageView *)self->_shareImageView setTintColor:v15];
  }
  [(UIImageView *)self->_shareImageView setContentMode:4];
  if (self->_cycleImageTimer)
  {
    v16 = [MEMORY[0x263F15910] animation];
    [v16 setDuration:0.5];
    [v16 setType:*MEMORY[0x263F16008]];
    [v16 setSubtype:*MEMORY[0x263F15FF0]];
    v17 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
    [v16 setTimingFunction:v17];

    v18 = [(UIImageView *)self->_shareImageView layer];
    [v18 addAnimation:v16 forKey:0];
  }
  else
  {
    v19 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    cycleImageTimer = self->_cycleImageTimer;
    self->_cycleImageTimer = v19;
    v16 = v19;

    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __58__BTShareAudioBringCloseViewController__cycleProductImage__block_invoke;
    handler[3] = &unk_265049E58;
    handler[4] = self;
    dispatch_source_set_event_handler(v16, handler);
    CUDispatchTimerSet();
    dispatch_activate(v16);
  }

  unint64_t cycleNextIndex = self->_cycleNextIndex;
  if ([(NSMutableArray *)self->_cycleImageArray count] > cycleNextIndex)
  {
    v22 = self->_cycleImageArray;
    ++self->_cycleNextIndex;
    v23 = -[NSMutableArray objectAtIndexedSubscript:](v22, "objectAtIndexedSubscript:");
    [(UIImageView *)self->_shareImageView setImage:v23];

    self->_cycleNextIndex %= (unint64_t)[(NSMutableArray *)self->_cycleImageArray count];
  }
}

uint64_t __58__BTShareAudioBringCloseViewController__cycleProductImage__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cycleProductImage];
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
}

- (UIImageView)bannerImageView
{
  return self->_bannerImageView;
}

- (void)setBannerImageView:(id)a3
{
}

- (UIView)productImageContainerView
{
  return self->_productImageContainerView;
}

- (void)setProductImageContainerView:(id)a3
{
}

- (UIImageView)shareImageView
{
  return self->_shareImageView;
}

- (void)setShareImageView:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_shareImageView, 0);
  objc_storeStrong((id *)&self->_productImageContainerView, 0);
  objc_storeStrong((id *)&self->_bannerImageView, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_cycleImageTimer, 0);
  objc_storeStrong((id *)&self->_cycleImageArray, 0);
}

@end