@interface TrustCertificateViewController
- (BOOL)allowCertificateTrust;
- (CertificateViewController)certificateViewController;
- (TrustCertificateViewController)initWithTrust:(__SecTrust *)a3 action:(int)a4 delegate:(id)a5;
- (TrustCertificateViewController)initWithTrust:(__SecTrust *)a3 action:(int)a4 delegate:(id)a5 allowTrust:(BOOL)a6;
- (TrustCertificateViewController)initWithTrustCertificateDelegate:(id)a3;
- (TrustCertificateViewController)initWithTrustCertificateDelegate:(id)a3 allowTrust:(BOOL)a4;
- (TrustCertificateViewControllerDelegate)trustCertificateDelegate;
- (void)_accept;
- (void)_cancel;
- (void)_dismissWithResult:(int)a3;
- (void)_setupNavItem;
- (void)didReceiveMemoryWarning;
- (void)setAllowCertificateTrust:(BOOL)a3;
- (void)setCertificateInfo:(id)a3 issuer:(id)a4 purpose:(id)a5 expiration:(id)a6 isRoot:(BOOL)a7 properties:(id)a8 action:(int)a9;
- (void)setCertificateViewController:(id)a3;
- (void)setShowCertificateButton:(BOOL)a3 localizedTitle:(id)a4 localizedDescription:(id)a5 destructive:(BOOL)a6 handler:(id)a7;
- (void)setTrustCertificateDelegate:(id)a3;
@end

@implementation TrustCertificateViewController

- (TrustCertificateViewController)initWithTrustCertificateDelegate:(id)a3
{
  return [(TrustCertificateViewController *)self initWithTrustCertificateDelegate:a3 allowTrust:1];
}

- (TrustCertificateViewController)initWithTrustCertificateDelegate:(id)a3 allowTrust:(BOOL)a4
{
  id v6 = a3;
  v7 = [[CertificateViewController alloc] initWithStyle:1];
  v11.receiver = self;
  v11.super_class = (Class)TrustCertificateViewController;
  v8 = [(TrustCertificateViewController *)&v11 initWithRootViewController:v7];
  v9 = v8;
  if (v8)
  {
    v8->_allowCertificateTrust = a4;
    objc_storeWeak((id *)&v8->_trustCertificateDelegate, v6);
    objc_storeStrong((id *)&v9->_certificateViewController, v7);
    [(TrustCertificateViewController *)v9 _setupNavItem];
  }

  return v9;
}

- (TrustCertificateViewController)initWithTrust:(__SecTrust *)a3 action:(int)a4 delegate:(id)a5
{
  return [(TrustCertificateViewController *)self initWithTrust:a3 action:*(void *)&a4 delegate:a5 allowTrust:1];
}

- (TrustCertificateViewController)initWithTrust:(__SecTrust *)a3 action:(int)a4 delegate:(id)a5 allowTrust:(BOOL)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a5;
  objc_super v11 = [[CertificateViewController alloc] initWithTrust:a3 action:v7];
  v15.receiver = self;
  v15.super_class = (Class)TrustCertificateViewController;
  v12 = [(TrustCertificateViewController *)&v15 initWithRootViewController:v11];
  v13 = v12;
  if (v12)
  {
    v12->_allowCertificateTrust = a6;
    objc_storeWeak((id *)&v12->_trustCertificateDelegate, v10);
    objc_storeStrong((id *)&v13->_certificateViewController, v11);
    [(TrustCertificateViewController *)v13 _setupNavItem];
  }

  return v13;
}

- (void)_setupNavItem
{
  v3 = [(TrustCertificateViewController *)self certificateViewController];
  id v11 = [v3 navigationItem];

  v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CertInfo"];
  v5 = [v4 localizedStringForKey:@"CERTIFICATE" value:&stru_26C9B5AF8 table:@"CertInfo"];
  [v11 setTitle:v5];

  id v6 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel__cancel];
  [v11 setLeftBarButtonItem:v6];
  if (self->_allowCertificateTrust)
  {
    id v7 = objc_alloc(MEMORY[0x263F1C468]);
    v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CertInfo"];
    v9 = [v8 localizedStringForKey:@"TRUST" value:&stru_26C9B5AF8 table:@"CertInfo"];
    id v10 = (void *)[v7 initWithTitle:v9 style:2 target:self action:sel__accept];

    [v11 setRightBarButtonItem:v10];
  }
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)TrustCertificateViewController;
  [(TrustCertificateViewController *)&v2 didReceiveMemoryWarning];
}

- (void)_dismissWithResult:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trustCertificateDelegate);
  [WeakRetained trustCertificateViewController:self finishedWithReturnCode:v3];
}

- (void)_cancel
{
}

- (void)_accept
{
}

- (void)setCertificateInfo:(id)a3 issuer:(id)a4 purpose:(id)a5 expiration:(id)a6 isRoot:(BOOL)a7 properties:(id)a8 action:(int)a9
{
  BOOL v9 = a7;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v21 = [(TrustCertificateViewController *)self certificateViewController];
  LODWORD(v20) = a9;
  [v21 setCertificateTitle:v19 issuer:v18 purpose:v17 expiration:v16 properties:v15 isRoot:v9 action:v20];
}

- (void)setShowCertificateButton:(BOOL)a3 localizedTitle:(id)a4 localizedDescription:(id)a5 destructive:(BOOL)a6 handler:(id)a7
{
  BOOL v7 = a6;
  BOOL v10 = a3;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = [(TrustCertificateViewController *)self certificateViewController];
  [v15 setShowCertificateButton:v10 localizedTitle:v14 localizedDescription:v13 destructive:v7 handler:v12];
}

- (TrustCertificateViewControllerDelegate)trustCertificateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trustCertificateDelegate);
  return (TrustCertificateViewControllerDelegate *)WeakRetained;
}

- (void)setTrustCertificateDelegate:(id)a3
{
}

- (BOOL)allowCertificateTrust
{
  return self->_allowCertificateTrust;
}

- (void)setAllowCertificateTrust:(BOOL)a3
{
  self->_allowCertificateTrust = a3;
}

- (CertificateViewController)certificateViewController
{
  return self->_certificateViewController;
}

- (void)setCertificateViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateViewController, 0);
  objc_destroyWeak((id *)&self->_trustCertificateDelegate);
}

@end