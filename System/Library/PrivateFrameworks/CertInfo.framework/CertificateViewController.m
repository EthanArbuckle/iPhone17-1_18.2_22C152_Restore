@interface CertificateViewController
- (BOOL)certificateButtonIsDestructiveAction;
- (BOOL)certificateIsRoot;
- (BOOL)showCertificateButton;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (CertificateViewController)init;
- (CertificateViewController)initWithTrust:(__SecTrust *)a3 action:(int)a4;
- (NSArray)certificateProperties;
- (NSDate)certificateExpiration;
- (NSString)certificateButtonDescription;
- (NSString)certificateButtonTitle;
- (NSString)certificateIssuer;
- (NSString)certificatePurpose;
- (NSString)certificateTitle;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)certificateButtonActionHandler;
- (id)certificateTrust;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int)certUIAction;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)preferredContentSizeChanged:(id)a3;
- (void)setCertUIAction:(int)a3;
- (void)setCertificateButtonActionHandler:(id)a3;
- (void)setCertificateButtonDescription:(id)a3;
- (void)setCertificateButtonIsDestructiveAction:(BOOL)a3;
- (void)setCertificateButtonTitle:(id)a3;
- (void)setCertificateExpiration:(id)a3;
- (void)setCertificateIsRoot:(BOOL)a3;
- (void)setCertificateIssuer:(id)a3;
- (void)setCertificateProperties:(id)a3;
- (void)setCertificatePurpose:(id)a3;
- (void)setCertificateTitle:(id)a3;
- (void)setCertificateTitle:(id)a3 issuer:(id)a4 purpose:(id)a5 expiration:(id)a6 properties:(id)a7 isRoot:(BOOL)a8 action:(int)a9;
- (void)setCertificateTrust:(id)a3;
- (void)setShowCertificateButton:(BOOL)a3;
- (void)setShowCertificateButton:(BOOL)a3 localizedTitle:(id)a4 localizedDescription:(id)a5 destructive:(BOOL)a6 handler:(id)a7;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CertificateViewController

- (CertificateViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CertificateViewController;
  v2 = [(CertificateViewController *)&v7 initWithStyle:1];
  v3 = v2;
  if (v2)
  {
    id certificateTrust = v2->_certificateTrust;
    v2->_id certificateTrust = 0;

    v3->_certUIAction = 2;
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v3 selector:sel_preferredContentSizeChanged_ name:*MEMORY[0x263F1D158] object:0];
  }
  return v3;
}

- (CertificateViewController)initWithTrust:(__SecTrust *)a3 action:(int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CertificateViewController;
  v6 = [(CertificateViewController *)&v10 initWithStyle:1];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_certificateTrust, a3);
    v7->_certUIAction = a4;
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v7 selector:sel_preferredContentSizeChanged_ name:*MEMORY[0x263F1D158] object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CertificateViewController;
  [(CertificateViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)CertificateViewController;
  [(CertificateViewController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CertificateViewController;
  [(CertificateViewController *)&v5 viewWillAppear:a3];
  objc_super v4 = [(CertificateViewController *)self tableView];
  [v4 reloadData];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CertificateViewController;
  [(CertificateViewController *)&v4 viewDidDisappear:a3];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"kCertInfoSheetViewControllerDismissedNotification" object:0];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)CertificateViewController;
  [(CertificateViewController *)&v2 didReceiveMemoryWarning];
}

- (void)setCertificateTitle:(id)a3 issuer:(id)a4 purpose:(id)a5 expiration:(id)a6 properties:(id)a7 isRoot:(BOOL)a8 action:(int)a9
{
  BOOL v9 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  [(CertificateViewController *)self setCertificateTitle:a3];
  [(CertificateViewController *)self setCertificateIssuer:v18];

  [(CertificateViewController *)self setCertificatePurpose:v17];
  [(CertificateViewController *)self setCertificateExpiration:v16];

  [(CertificateViewController *)self setCertificateProperties:v15];
  [(CertificateViewController *)self setCertificateIsRoot:v9];
  [(CertificateViewController *)self setCertUIAction:a9];
  id v19 = [(CertificateViewController *)self tableView];
  [v19 reloadData];
}

- (void)setShowCertificateButton:(BOOL)a3 localizedTitle:(id)a4 localizedDescription:(id)a5 destructive:(BOOL)a6 handler:(id)a7
{
  BOOL v8 = a6;
  BOOL v10 = a3;
  id v15 = a4;
  id v12 = a5;
  id v13 = a7;
  [(CertificateViewController *)self setShowCertificateButton:v10];
  if (v10)
  {
    [(CertificateViewController *)self setCertificateButtonTitle:v15];
    [(CertificateViewController *)self setCertificateButtonDescription:v12];
    [(CertificateViewController *)self setCertificateButtonActionHandler:v13];
    [(CertificateViewController *)self setCertificateButtonIsDestructiveAction:v8];
  }
  else
  {
    [(CertificateViewController *)self setCertificateButtonTitle:0];
    [(CertificateViewController *)self setCertificateButtonDescription:0];
    [(CertificateViewController *)self setCertificateButtonActionHandler:0];
  }
  v14 = [(CertificateViewController *)self tableView];
  [v14 reloadData];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(CertificateViewController *)self showCertificateButton]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return a4 == 1;
  }
  else {
    return 3;
  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  BOOL v6 = [(CertificateViewController *)self showCertificateButton];
  objc_super v7 = 0;
  if (!a4 && v6)
  {
    objc_super v7 = [(CertificateViewController *)self certificateButtonDescription];
  }
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 section] && !objc_msgSend(v7, "row"))
  {
    id v16 = [v6 dequeueReusableCellWithIdentifier:@"CertificateTableCell"];
    if (!v16) {
      id v16 = [(CertUIItemSummaryCell *)[CertificateSummaryTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"CertificateTableCell"];
    }
    id certificateTrust = self->_certificateTrust;
    BOOL v9 = v16;
    if (certificateTrust)
    {
      id v18 = [(CertificateViewController *)self certificateTrust];
      [(CertificateSummaryTableViewCell *)v9 updateWithCertificateTrust:v18];
      id v19 = v9;
    }
    else
    {
      id v18 = [(CertificateViewController *)self certificateTitle];
      id v19 = [(CertificateViewController *)self certificateIssuer];
      [(CertificateSummaryTableViewCell *)v9 setCertificateName:v18 issuer:v19 isRoot:[(CertificateViewController *)self certificateIsRoot]];
    }
LABEL_27:

    goto LABEL_28;
  }
  if (![v7 section] && objc_msgSend(v7, "row") == 1)
  {
    BOOL v8 = [v6 dequeueReusableCellWithIdentifier:@"CertificateDetailsTableCell"];
    if (!v8) {
      BOOL v8 = [[CertificateDetailsSummaryCell alloc] initWithStyle:0 reuseIdentifier:@"CertificateDetailsTableCell"];
    }
    BOOL v9 = v8;
    BOOL v10 = [(CertificateViewController *)self certUIAction] == 1;
    v11 = [(CertificateViewController *)self certificateTrust];

    id v12 = [(CertificateViewController *)self certificateExpiration];
    [(CertificateSummaryTableViewCell *)v9 setCertificateTrust:v11 certificateExpiration:v12 certificateIsTrusted:v10];

    goto LABEL_28;
  }
  if ([v7 section] || objc_msgSend(v7, "row") != 2)
  {
    if ([v7 section] != 1 || objc_msgSend(v7, "row"))
    {
      BOOL v9 = 0;
      goto LABEL_28;
    }
    BOOL v9 = [v6 dequeueReusableCellWithIdentifier:@"CertificateInstallTableCell"];
    if (!v9) {
      BOOL v9 = (CertificateSummaryTableViewCell *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"CertificateInstallTableCell"];
    }
    v20 = [(CertificateViewController *)self certificateButtonTitle];
    v21 = [(CertificateSummaryTableViewCell *)v9 textLabel];
    [v21 setText:v20];

    v22 = [(CertificateSummaryTableViewCell *)v9 textLabel];
    [v22 setTextAlignment:1];

    if ([(CertificateViewController *)self certificateButtonIsDestructiveAction]) {
      [MEMORY[0x263F1C550] systemRedColor];
    }
    else {
    id v18 = [MEMORY[0x263F1C550] systemBlueColor];
    }
    id v19 = [(CertificateSummaryTableViewCell *)v9 textLabel];
    [v19 setTextColor:v18];
    goto LABEL_27;
  }
  BOOL v9 = [v6 dequeueReusableCellWithIdentifier:@"CertificateMoreDetailsTableCell"];
  if (!v9) {
    BOOL v9 = (CertificateSummaryTableViewCell *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"CertificateMoreDetailsTableCell"];
  }
  id v13 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CertInfo"];
  v14 = [v13 localizedStringForKey:@"MORE_DETAILS" value:&stru_26C9B5AF8 table:@"CertInfo"];
  id v15 = [(CertificateSummaryTableViewCell *)v9 textLabel];
  [v15 setText:v14];

  [(CertificateSummaryTableViewCell *)v9 setAccessoryType:1];
LABEL_28:

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (![v6 section] && objc_msgSend(v6, "row") == 2)
  {
    id certificateTrust = self->_certificateTrust;
    BOOL v8 = [CertificateDetailsViewController alloc];
    if (certificateTrust)
    {
      BOOL v9 = [(CertificateDetailsViewController *)v8 initWithTrust:self->_certificateTrust];
    }
    else
    {
      BOOL v9 = [(CertificateDetailsViewController *)v8 initWithStyle:1];
      v11 = [(CertificateViewController *)self certificateProperties];
      [(CertificateDetailsViewController *)v9 setCertificateProperties:v11];
    }
    id v12 = [(CertificateViewController *)self navigationController];
    [v12 pushViewController:v9 animated:1];

LABEL_11:
    goto LABEL_12;
  }
  if ([v6 section] == 1 && !objc_msgSend(v6, "row"))
  {
    uint64_t v10 = [(CertificateViewController *)self certificateButtonActionHandler];
    BOOL v9 = (CertificateDetailsViewController *)v10;
    if (v10) {
      (*(void (**)(uint64_t))(v10 + 16))(v10);
    }
    goto LABEL_11;
  }
LABEL_12:
  [v13 deselectRowAtIndexPath:v6 animated:1];
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  [a3 rowHeight];
  return result;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v4 = a4;
  BOOL v5 = ![v4 section] && objc_msgSend(v4, "row") == 2
    || [v4 section] == 1 && !objc_msgSend(v4, "row");

  return v5;
}

- (void)preferredContentSizeChanged:(id)a3
{
  id v3 = [(CertificateViewController *)self tableView];
  [v3 reloadData];
}

- (id)certificateTrust
{
  return self->_certificateTrust;
}

- (void)setCertificateTrust:(id)a3
{
}

- (int)certUIAction
{
  return self->_certUIAction;
}

- (void)setCertUIAction:(int)a3
{
  self->_certUIAction = a3;
}

- (NSString)certificateTitle
{
  return self->_certificateTitle;
}

- (void)setCertificateTitle:(id)a3
{
}

- (NSString)certificateIssuer
{
  return self->_certificateIssuer;
}

- (void)setCertificateIssuer:(id)a3
{
}

- (NSString)certificatePurpose
{
  return self->_certificatePurpose;
}

- (void)setCertificatePurpose:(id)a3
{
}

- (NSDate)certificateExpiration
{
  return self->_certificateExpiration;
}

- (void)setCertificateExpiration:(id)a3
{
}

- (NSArray)certificateProperties
{
  return self->_certificateProperties;
}

- (void)setCertificateProperties:(id)a3
{
}

- (BOOL)certificateIsRoot
{
  return self->_certificateIsRoot;
}

- (void)setCertificateIsRoot:(BOOL)a3
{
  self->_certificateIsRoot = a3;
}

- (BOOL)showCertificateButton
{
  return self->_showCertificateButton;
}

- (void)setShowCertificateButton:(BOOL)a3
{
  self->_showCertificateButton = a3;
}

- (NSString)certificateButtonTitle
{
  return self->_certificateButtonTitle;
}

- (void)setCertificateButtonTitle:(id)a3
{
}

- (NSString)certificateButtonDescription
{
  return self->_certificateButtonDescription;
}

- (void)setCertificateButtonDescription:(id)a3
{
}

- (BOOL)certificateButtonIsDestructiveAction
{
  return self->_certificateButtonIsDestructiveAction;
}

- (void)setCertificateButtonIsDestructiveAction:(BOOL)a3
{
  self->_certificateButtonIsDestructiveAction = a3;
}

- (id)certificateButtonActionHandler
{
  return self->_certificateButtonActionHandler;
}

- (void)setCertificateButtonActionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_certificateButtonActionHandler, 0);
  objc_storeStrong((id *)&self->_certificateButtonDescription, 0);
  objc_storeStrong((id *)&self->_certificateButtonTitle, 0);
  objc_storeStrong((id *)&self->_certificateProperties, 0);
  objc_storeStrong((id *)&self->_certificateExpiration, 0);
  objc_storeStrong((id *)&self->_certificatePurpose, 0);
  objc_storeStrong((id *)&self->_certificateIssuer, 0);
  objc_storeStrong((id *)&self->_certificateTitle, 0);
  objc_storeStrong(&self->_certificateTrust, 0);
}

@end