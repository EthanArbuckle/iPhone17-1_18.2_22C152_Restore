@interface CertInfoTrustSummaryController
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)showsDoneButton;
- (CertInfoTrustSummaryController)initWithTrustDescription:(id)a3;
- (CertInfoTrustSummaryControllerDelegate)delegate;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_cellForReuseIdentifier:(id)a3;
- (id)_descriptionCell;
- (id)_headerCell;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_actionButtonPressed:(id)a3;
- (void)_doneButtonPressed:(id)a3;
- (void)setActionButtonTitle:(id)a3 destructive:(BOOL)a4 animated:(BOOL)a5;
- (void)setDelegate:(id)a3;
- (void)setShowsDoneButton:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CertInfoTrustSummaryController

- (CertInfoTrustSummaryController)initWithTrustDescription:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"CertInfoTrustSummaryController.m" lineNumber:108 description:@"trust must be non-NULL"];
  }
  v14.receiver = self;
  v14.super_class = (Class)CertInfoTrustSummaryController;
  v7 = [(CertInfoTrustSummaryController *)&v14 initWithStyle:1];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_description, a3);
    v9 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CertInfo"];
    v10 = [v9 localizedStringForKey:@"CERTIFICATE" value:&stru_26C9B5AF8 table:@"CertInfo"];
    v11 = [(CertInfoTrustSummaryController *)v8 navigationItem];
    [v11 setTitle:v10];
  }
  return v8;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  int v4 = *((unsigned char *)self + 1064) & 0xFE | a3;
  *((unsigned char *)self + 1064) = *((unsigned char *)self + 1064) & 0xFE | a3;
  if (self->_doneButton)
  {
    v5 = [(CertInfoTrustSummaryController *)self navigationItem];
    id v6 = [v5 rightBarButtonItem];
    BOOL v7 = v6 != self->_doneButton;

    int v4 = *((unsigned __int8 *)self + 1064);
    if ((v4 & 1) == 0) {
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v7 = 1;
    if ((v4 & 1) == 0) {
      goto LABEL_9;
    }
  }
  if (v7)
  {
    doneButton = self->_doneButton;
    if (!doneButton)
    {
      v9 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel__doneButtonPressed_];
      v10 = self->_doneButton;
      self->_doneButton = v9;

      doneButton = self->_doneButton;
    }
    v11 = [(CertInfoTrustSummaryController *)self navigationItem];
    id v13 = v11;
    v12 = doneButton;
    goto LABEL_11;
  }
LABEL_9:
  if ((v4 | v7)) {
    return;
  }
  v11 = [(CertInfoTrustSummaryController *)self navigationItem];
  id v13 = v11;
  v12 = 0;
LABEL_11:
  [v11 setRightBarButtonItem:v12];
}

- (BOOL)showsDoneButton
{
  return *((unsigned char *)self + 1064) & 1;
}

- (void)setActionButtonTitle:(id)a3 destructive:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(CertInfoTrustSummaryController *)self _cellForReuseIdentifier:@"kCertInfoTrustSummaryHeaderIdentifier"];
  [v9 setActionButtonTitle:v8 destructive:v6 animated:v5];
}

- (void)_doneButtonPressed:(id)a3
{
  int v4 = [(CertInfoTrustSummaryController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CertInfoTrustSummaryController *)self delegate];
    [v6 trustSummaryControllerDidFinish:self];
  }
}

- (void)_actionButtonPressed:(id)a3
{
  int v4 = [(CertInfoTrustSummaryController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CertInfoTrustSummaryController *)self delegate];
    [v6 trustSummaryControllerPerformAction:self];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  int v4 = [(CertInfoTrustSummaryController *)self tableView];
  id v6 = [v4 indexPathForSelectedRow];

  if (v6)
  {
    char v5 = [(CertInfoTrustSummaryController *)self tableView];
    [v5 deselectRowAtIndexPath:v6 animated:1];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v7 row] > 2) {
    id v8 = 0;
  }
  else {
    id v8 = *sOrderedCellIdentifiers_0[[v7 row]];
  }
  id v9 = v8;
  v10 = [v6 dequeueReusableCellWithIdentifier:v9];
  if (!v10)
  {
    v10 = [(CertInfoTrustSummaryController *)self _cellForReuseIdentifier:v9];
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v11 = a4;
  if ((unint64_t)[v11 row] > 2) {
    char v5 = 0;
  }
  else {
    char v5 = *sOrderedCellIdentifiers_0[[v11 row]];
  }
  id v6 = v5;
  if ([v6 isEqualToString:@"kCertInfoTrustSummaryMoreDetailsIdentifier"])
  {
    unint64_t v7 = [(CertInfoTrustDescription *)self->_description certificateCount];
    if (v7 >= 2)
    {
      id v8 = [[CertInfoCertificateListController alloc] initWithTrustDescription:self->_description];
      if (!v8) {
        goto LABEL_11;
      }
LABEL_10:
      v10 = [(CertInfoTrustSummaryController *)self navigationController];
      [v10 pushViewController:v8 animated:1];

      goto LABEL_11;
    }
    if (v7 == 1)
    {
      id v9 = [(CertInfoTrustDescription *)self->_description certificatePropertiesAtIndex:0];
      id v8 = [[CertInfoCertificateDetailsController alloc] initWithCertificateProperties:v9];

      if (v8) {
        goto LABEL_10;
      }
    }
  }
LABEL_11:
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 rowHeight];
  double v8 = v7;
  if ((unint64_t)[v6 row] > 2) {
    id v9 = 0;
  }
  else {
    id v9 = *sOrderedCellIdentifiers_0[[v6 row]];
  }
  id v10 = v9;
  if ([v10 isEqualToString:@"kCertInfoTrustSummaryHeaderIdentifier"])
  {
    id v11 = [(CertInfoTrustSummaryController *)self _headerCell];
LABEL_8:
    v12 = v11;
    [v11 rowHeight];
    double v8 = v13;

    goto LABEL_9;
  }
  if ([v10 isEqualToString:@"kCertInfoTrustSummaryDescriptionIdentifier"])
  {
    id v11 = [(CertInfoTrustSummaryController *)self _descriptionCell];
    goto LABEL_8;
  }
LABEL_9:

  return v8;
}

- (id)_cellForReuseIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"kCertInfoTrustSummaryHeaderIdentifier"])
  {
    uint64_t v5 = [(CertInfoTrustSummaryController *)self _headerCell];
LABEL_5:
    id v6 = (void *)v5;
    goto LABEL_6;
  }
  if ([v4 isEqualToString:@"kCertInfoTrustSummaryDescriptionIdentifier"])
  {
    uint64_t v5 = [(CertInfoTrustSummaryController *)self _descriptionCell];
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"kCertInfoTrustSummaryMoreDetailsIdentifier"])
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:v4];
    double v8 = [v6 textLabel];
    id v9 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CertInfo"];
    id v10 = [v9 localizedStringForKey:@"MORE_DETAILS" value:&stru_26C9B5AF8 table:@"CertInfo"];
    [v8 setText:v10];

    [v6 setAccessoryType:1];
  }
  else
  {
    id v6 = 0;
  }
LABEL_6:

  return v6;
}

- (id)_headerCell
{
  headerCell = self->_headerCell;
  if (!headerCell)
  {
    id v4 = [[_CertInfoTrustSummaryHeaderCell alloc] initWithStyle:0 reuseIdentifier:@"kCertInfoTrustSummaryHeaderIdentifier"];
    uint64_t v5 = [(CertInfoTrustDescription *)self->_description summaryTitle];
    [(_CertInfoTrustSummaryHeaderCell *)v4 setTrustTitle:v5];

    id v6 = [(CertInfoTrustDescription *)self->_description summarySubtitle];
    [(_CertInfoTrustSummaryHeaderCell *)v4 setTrustSubtitle:v6];

    [(_CertInfoTrustSummaryHeaderCell *)v4 setTrusted:[(CertInfoTrustDescription *)self->_description isTrusted]];
    [(_CertInfoTrustSummaryHeaderCell *)v4 setExpired:0];
    [(_CertInfoTrustSummaryHeaderCell *)v4 setSelectionStyle:0];
    double v7 = [(_CertInfoTrustSummaryHeaderCell *)v4 actionButton];
    [v7 addTarget:self action:sel__actionButtonPressed_ forControlEvents:64];
    double v8 = self->_headerCell;
    self->_headerCell = &v4->super;

    headerCell = self->_headerCell;
  }
  return headerCell;
}

- (id)_descriptionCell
{
  descriptionCell = self->_descriptionCell;
  if (!descriptionCell)
  {
    id v4 = [[CertInfoCertificateSummaryDescriptionCell alloc] initWithStyle:0 reuseIdentifier:@"kCertInfoTrustSummaryDescriptionIdentifier"];
    uint64_t v5 = [(CertInfoTrustDescription *)self->_description summaryDescriptionItems];
    [(CertInfoCertificateSummaryDescriptionCell *)v4 setLabelsAndValues:v5];

    [(CertInfoCertificateSummaryDescriptionCell *)v4 setSelectionStyle:0];
    id v6 = self->_descriptionCell;
    self->_descriptionCell = &v4->super;

    descriptionCell = self->_descriptionCell;
  }
  return descriptionCell;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (CertInfoTrustSummaryControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CertInfoTrustSummaryControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionCell, 0);
  objc_storeStrong((id *)&self->_headerCell, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_description, 0);
}

@end