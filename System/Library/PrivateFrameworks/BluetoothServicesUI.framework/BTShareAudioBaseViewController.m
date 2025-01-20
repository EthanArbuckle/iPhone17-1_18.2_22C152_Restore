@interface BTShareAudioBaseViewController
- (BOOL)viewActive;
- (BTShareAudioViewController)mainController;
- (UILabel)titleLabel;
- (UIView)cardView;
- (void)_handleMenuButton:(id)a3;
- (void)setCardView:(id)a3;
- (void)setMainController:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setViewActive:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BTShareAudioBaseViewController

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BTShareAudioBaseViewController;
  [(BTShareAudioBaseViewController *)&v8 viewWillAppear:a3];
  [(BTShareAudioBaseViewController *)self setTitle:0];
  self->_viewActive = 1;
  char v4 = [(BTShareAudioViewController *)self->_mainController flags];
  if ((v4 & 2) != 0)
  {
    v5 = [MEMORY[0x263F1C550] darkGrayColor];
    [(UIView *)self->_cardView setBackgroundColor:v5];
  }
  if (v4) {
    [(UIView *)self->_cardView _setContinuousCornerRadius:0.0];
  }
  v6 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__handleMenuButton_];
  [v6 setAllowedPressTypes:&unk_26F2A6FA8];
  [v6 setNumberOfTapsRequired:1];
  v7 = [(BTShareAudioBaseViewController *)self view];
  [v7 addGestureRecognizer:v6];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BTShareAudioBaseViewController;
  [(BTShareAudioBaseViewController *)&v4 viewWillDisappear:a3];
  self->_viewActive = 0;
}

- (void)_handleMenuButton:(id)a3
{
  id v4 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(BTShareAudioViewController *)self->_mainController reportUserCancelled];
}

- (BTShareAudioViewController)mainController
{
  return self->_mainController;
}

- (void)setMainController:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIView)cardView
{
  return self->_cardView;
}

- (void)setCardView:(id)a3
{
}

- (BOOL)viewActive
{
  return self->_viewActive;
}

- (void)setViewActive:(BOOL)a3
{
  self->_viewActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_mainController, 0);
}

@end