@interface CertInfoTrustDetailsViewController
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (NSArray)trustProperties;
- (void)_setupNavItem;
- (void)loadView;
- (void)setTrustProperties:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CertInfoTrustDetailsViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (void)loadView
{
  v3 = [CertInfoTrustDetailsView alloc];
  v4 = [(CertInfoTrustDetailsViewController *)self trustProperties];
  v5 = -[CertInfoTrustDetailsView initWithFrame:trustProperties:](v3, "initWithFrame:trustProperties:", v4, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  [(CertInfoTrustDetailsViewController *)self setView:v5];
}

- (void)_setupNavItem
{
  id v4 = [(CertInfoTrustDetailsViewController *)self navigationItem];
  v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CertInfo"];
  v3 = [v2 localizedStringForKey:@"DETAILS" value:&stru_26C9B5AF8 table:@"CertInfo"];
  [v4 setTitle:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CertInfoTrustDetailsViewController;
  [(CertInfoTrustDetailsViewController *)&v4 viewWillAppear:a3];
  [(CertInfoTrustDetailsViewController *)self _setupNavItem];
}

- (NSArray)trustProperties
{
  return self->_trustProperties;
}

- (void)setTrustProperties:(id)a3
{
}

- (void).cxx_destruct
{
}

@end