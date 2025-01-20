@interface SKBackgroundAssetConsentViewController
- (BOOL)isModalInPresentation;
- (SKBackgroundAssetConsentViewController)init;
- (id)responseBlock;
- (int64_t)modalPresentationStyle;
- (void)_continueButtonPressed;
- (void)dealloc;
- (void)setResponseBlock:(id)a3;
- (void)viewDidLoad;
@end

@implementation SKBackgroundAssetConsentViewController

- (SKBackgroundAssetConsentViewController)init
{
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"BACKGROUND_ASSETS_CONSENT_TITLE" value:&stru_1F08A7B80 table:0];

  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"BACKGROUND_ASSETS_CONSENT_DESCRIPTION" value:&stru_1F08A7B80 table:0];

  v7 = (void *)MEMORY[0x1E4FB1818];
  v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v9 = [v7 imageNamed:@"square.and.arrow.down.settings" inBundle:v8 withConfiguration:0];
  v12.receiver = self;
  v12.super_class = (Class)SKBackgroundAssetConsentViewController;
  v10 = [(SKBackgroundAssetConsentViewController *)&v12 initWithTitle:v4 detailText:v6 icon:v9 contentLayout:2];

  return v10;
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (int64_t)modalPresentationStyle
{
  return 2;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)SKBackgroundAssetConsentViewController;
  [(OBBaseWelcomeController *)&v7 viewDidLoad];
  v3 = [MEMORY[0x1E4F83A80] boldButton];
  v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"BACKGROUND_ASSETS_CONSENT_CONTINUE" value:&stru_1F08A7B80 table:0];
  [v3 setTitle:v5 forState:0];

  [v3 addTarget:self action:sel__continueButtonPressed forControlEvents:64];
  v6 = [(SKBackgroundAssetConsentViewController *)self buttonTray];
  [v6 addButton:v3];
}

- (void)dealloc
{
  v3 = [(SKBackgroundAssetConsentViewController *)self responseBlock];

  if (v3)
  {
    v4 = [(SKBackgroundAssetConsentViewController *)self responseBlock];
    v4[2](v4, 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)SKBackgroundAssetConsentViewController;
  [(SKBackgroundAssetConsentViewController *)&v5 dealloc];
}

- (void)_continueButtonPressed
{
  v3 = [(SKBackgroundAssetConsentViewController *)self responseBlock];

  if (v3)
  {
    v4 = [(SKBackgroundAssetConsentViewController *)self responseBlock];
    v4[2](v4, MEMORY[0x1E4F1CC38]);
  }

  [(SKBackgroundAssetConsentViewController *)self setResponseBlock:0];
}

- (id)responseBlock
{
  return self->_responseBlock;
}

- (void)setResponseBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end