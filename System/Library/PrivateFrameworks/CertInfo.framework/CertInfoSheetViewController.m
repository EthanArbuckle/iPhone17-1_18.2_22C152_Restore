@interface CertInfoSheetViewController
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (CertInfoSheetViewControllerDelegate)delegate;
- (NSArray)trustProperties;
- (NSDate)trustExpiration;
- (NSString)serviceName;
- (NSString)trustPurpose;
- (NSString)trustSubtitle;
- (NSString)trustTitle;
- (void)_accept;
- (void)_cancel;
- (void)_dismissWithResult:(int)a3;
- (void)_pushDetailsView;
- (void)_setupNavItem;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setTrustExpiration:(id)a3;
- (void)setTrustProperties:(id)a3;
- (void)setTrustPurpose:(id)a3;
- (void)setTrustSubtitle:(id)a3;
- (void)setTrustTitle:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CertInfoSheetViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (void)_dismissWithResult:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 sheetViewController:self finishedWithReturnCode:v3];
  }
}

- (void)_cancel
{
}

- (void)_accept
{
}

- (void)_setupNavItem
{
  id v9 = [(CertInfoSheetViewController *)self navigationItem];
  uint64_t v3 = [(CertInfoSheetViewController *)self serviceName];
  [v9 setTitle:v3];

  v4 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel__cancel];
  id v5 = objc_alloc(MEMORY[0x263F1C468]);
  v6 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CertInfo"];
  char v7 = [v6 localizedStringForKey:@"ACCEPT" value:&stru_26C9B5AF8 table:@"CertInfo"];
  id v8 = (void *)[v5 initWithTitle:v7 style:1 target:self action:sel__accept];

  [v9 setLeftBarButtonItem:v4];
  [v9 setRightBarButtonItem:v8];
}

- (void)_pushDetailsView
{
  id v5 = [[CertInfoTrustDetailsViewController alloc] initWithNibName:0 bundle:0];
  uint64_t v3 = [(CertInfoSheetViewController *)self trustProperties];
  [(CertInfoTrustDetailsViewController *)v5 setTrustProperties:v3];

  v4 = [(CertInfoSheetViewController *)self navigationController];
  [v4 pushViewController:v5 animated:1];
}

- (void)loadView
{
  uint64_t v3 = [CertInfoCertificateSummaryView alloc];
  v4 = -[CertInfoCertificateSummaryView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  id v5 = [(CertInfoSheetViewController *)self trustTitle];
  [(CertInfoCertificateSummaryView *)v4 setTrustTitle:v5];

  v6 = [(CertInfoSheetViewController *)self trustSubtitle];
  [(CertInfoCertificateSummaryView *)v4 setTrustSubtitle:v6];

  char v7 = [(CertInfoSheetViewController *)self trustPurpose];
  [(CertInfoCertificateSummaryView *)v4 setPurpose:v7];

  id v8 = [(CertInfoSheetViewController *)self trustExpiration];
  [(CertInfoCertificateSummaryView *)v4 setExpirationDate:v8];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__CertInfoSheetViewController_loadView__block_invoke;
  v9[3] = &unk_26432C2D0;
  v9[4] = self;
  [(CertInfoCertificateSummaryView *)v4 setMoreDetailsSelectedBlock:v9];
  [(CertInfoSheetViewController *)self setView:v4];
}

uint64_t __39__CertInfoSheetViewController_loadView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pushDetailsView];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CertInfoSheetViewController;
  -[CertInfoSheetViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  [(CertInfoSheetViewController *)self _setupNavItem];
  id v5 = [(CertInfoSheetViewController *)self view];
  v6 = [v5 tableView];

  char v7 = [v6 indexPathForSelectedRow];
  if (v7) {
    [v6 deselectRowAtIndexPath:v7 animated:v3];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CertInfoSheetViewController;
  [(CertInfoSheetViewController *)&v4 viewDidDisappear:a3];
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"kCertInfoSheetViewControllerDismissedNotification" object:0];
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)trustTitle
{
  return self->_trustTitle;
}

- (void)setTrustTitle:(id)a3
{
}

- (NSString)trustSubtitle
{
  return self->_trustSubtitle;
}

- (void)setTrustSubtitle:(id)a3
{
}

- (NSString)trustPurpose
{
  return self->_trustPurpose;
}

- (void)setTrustPurpose:(id)a3
{
}

- (NSDate)trustExpiration
{
  return self->_trustExpiration;
}

- (void)setTrustExpiration:(id)a3
{
}

- (NSArray)trustProperties
{
  return self->_trustProperties;
}

- (void)setTrustProperties:(id)a3
{
}

- (CertInfoSheetViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CertInfoSheetViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trustProperties, 0);
  objc_storeStrong((id *)&self->_trustExpiration, 0);
  objc_storeStrong((id *)&self->_trustPurpose, 0);
  objc_storeStrong((id *)&self->_trustSubtitle, 0);
  objc_storeStrong((id *)&self->_trustTitle, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end