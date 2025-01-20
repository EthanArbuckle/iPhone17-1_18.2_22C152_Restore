@interface QLPDFPermissionViewController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (QLPDFPermissionCell)passwordCell;
- (QLPDFPermissionCell)verifyCell;
- (QLPDFPermissionViewController)init;
- (QLPDFPermissionViewControllerDelegate)delegate;
- (UIBarButtonItem)cancelButton;
- (UIBarButtonItem)doneButton;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)buildCells;
- (void)doneButtonTapped;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setPasswordCell:(id)a3;
- (void)setVerifyCell:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation QLPDFPermissionViewController

- (QLPDFPermissionViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)QLPDFPermissionViewController;
  return [(QLPDFPermissionViewController *)&v3 initWithStyle:2];
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)QLPDFPermissionViewController;
  [(QLPDFPermissionViewController *)&v24 viewDidLoad];
  objc_super v3 = objc_opt_new();
  v4 = [(QLPDFPermissionViewController *)self tableView];
  [v4 setTableFooterView:v3];

  v5 = [(QLPDFPermissionViewController *)self tableView];
  [v5 setRowHeight:UITableViewAutomaticDimension];

  v6 = [(QLPDFPermissionViewController *)self tableView];
  [v6 setEstimatedRowHeight:44.0];

  objc_initWeak(&location, self);
  id v7 = objc_alloc((Class)UIBarButtonItem);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000D32C;
  v21[3] = &unk_100024A20;
  objc_copyWeak(&v22, &location);
  v8 = +[UIAction actionWithHandler:v21];
  id v9 = [v7 initWithBarButtonSystemItem:1 primaryAction:v8];
  [(QLPDFPermissionViewController *)self setCancelButton:v9];

  v10 = [(QLPDFPermissionViewController *)self cancelButton];
  v11 = [(QLPDFPermissionViewController *)self navigationItem];
  [v11 setLeftBarButtonItem:v10];

  id v12 = objc_alloc((Class)UIBarButtonItem);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000D3B0;
  v19[3] = &unk_100024A20;
  objc_copyWeak(&v20, &location);
  v13 = +[UIAction actionWithHandler:v19];
  id v14 = [v12 initWithBarButtonSystemItem:0 primaryAction:v13];
  [(QLPDFPermissionViewController *)self setDoneButton:v14];

  v15 = [(QLPDFPermissionViewController *)self doneButton];
  v16 = [(QLPDFPermissionViewController *)self navigationItem];
  [v16 setRightBarButtonItem:v15];

  v17 = QLLocalizedStringWithDefaultValue();
  v18 = [(QLPDFPermissionViewController *)self navigationItem];
  [v18 setTitle:v17];

  [(QLPDFPermissionViewController *)self buildCells];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)QLPDFPermissionViewController;
  [(QLPDFPermissionViewController *)&v6 viewWillAppear:a3];
  dispatch_time_t v4 = dispatch_time(0, 50000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D49C;
  block[3] = &unk_100024670;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  if (objc_msgSend(a4, "row", a3)) {
    [(QLPDFPermissionViewController *)self verifyCell];
  }
  else {
  v5 = [(QLPDFPermissionViewController *)self passwordCell];
  }

  return v5;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  dispatch_time_t v4 = [(QLPDFPermissionViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(QLPDFPermissionViewController *)self delegate];
    [v6 permissionViewControllerWasCancelled:self];
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  char v5 = [(QLPDFPermissionViewController *)self passwordCell];
  id v6 = [v5 textField];

  [v4 resignFirstResponder];
  if (v6 == v4)
  {
    id v7 = [(QLPDFPermissionViewController *)self verifyCell];
    v8 = [v7 textField];
    [v8 becomeFirstResponder];
  }
  else
  {
    [(QLPDFPermissionViewController *)self doneButtonTapped];
  }
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  return objc_msgSend(a5, "canBeConvertedToEncoding:", 1, a4.location, a4.length);
}

- (void)buildCells
{
  objc_super v3 = objc_alloc_init(QLPDFPermissionCell);
  [(QLPDFPermissionViewController *)self setPasswordCell:v3];

  id v4 = QLLocalizedStringWithDefaultValue();
  char v5 = [(QLPDFPermissionViewController *)self passwordCell];
  id v6 = [v5 label];
  [v6 setText:v4];

  id v7 = [(QLPDFPermissionViewController *)self passwordCell];
  v8 = [v7 label];
  [v8 setAdjustsFontSizeToFitWidth:1];

  id v9 = QLLocalizedStringWithDefaultValue();
  v10 = [(QLPDFPermissionViewController *)self passwordCell];
  v11 = [v10 textField];
  [v11 setPlaceholder:v9];

  id v12 = [(QLPDFPermissionViewController *)self passwordCell];
  v13 = [v12 textField];
  [v13 setAutocapitalizationType:0];

  id v14 = [(QLPDFPermissionViewController *)self passwordCell];
  v15 = [v14 textField];
  [v15 setAutocorrectionType:1];

  uint64_t v16 = QLPDFViewControllerPasswordTextFieldAccessibilityIdentifier;
  v17 = [(QLPDFPermissionViewController *)self passwordCell];
  v18 = [v17 textField];
  [v18 setAccessibilityIdentifier:v16];

  v19 = [(QLPDFPermissionViewController *)self passwordCell];
  id v20 = [v19 textField];
  [v20 setDelegate:self];

  v21 = [(QLPDFPermissionViewController *)self passwordCell];
  id v22 = [v21 textField];
  [v22 setReturnKeyType:4];

  v23 = [(QLPDFPermissionViewController *)self passwordCell];
  objc_super v24 = [v23 textField];
  [v24 setAdjustsFontSizeToFitWidth:1];

  v25 = objc_alloc_init(QLPDFPermissionCell);
  [(QLPDFPermissionViewController *)self setVerifyCell:v25];

  v26 = QLLocalizedStringWithDefaultValue();
  v27 = [(QLPDFPermissionViewController *)self verifyCell];
  v28 = [v27 label];
  [v28 setText:v26];

  v29 = [(QLPDFPermissionViewController *)self verifyCell];
  v30 = [v29 label];
  [v30 setAdjustsFontSizeToFitWidth:1];

  v31 = QLLocalizedStringWithDefaultValue();
  v32 = [(QLPDFPermissionViewController *)self verifyCell];
  v33 = [v32 textField];
  [v33 setPlaceholder:v31];

  v34 = [(QLPDFPermissionViewController *)self verifyCell];
  v35 = [v34 textField];
  [v35 setAutocapitalizationType:0];

  v36 = [(QLPDFPermissionViewController *)self verifyCell];
  v37 = [v36 textField];
  [v37 setAutocorrectionType:1];

  uint64_t v38 = QLPDFViewControllerVerifyPasswordTextFieldAccessibilityIdentifier;
  v39 = [(QLPDFPermissionViewController *)self verifyCell];
  v40 = [v39 textField];
  [v40 setAccessibilityIdentifier:v38];

  v41 = [(QLPDFPermissionViewController *)self verifyCell];
  v42 = [v41 textField];
  [v42 setDelegate:self];

  v43 = [(QLPDFPermissionViewController *)self verifyCell];
  v44 = [v43 textField];
  [v44 setReturnKeyType:9];

  v45 = [(QLPDFPermissionViewController *)self verifyCell];
  v46 = [v45 textField];
  [v46 setAdjustsFontSizeToFitWidth:1];

  v47 = [(QLPDFPermissionViewController *)self passwordCell];
  v48 = [v47 label];
  v49 = [v48 text];
  NSAttributedStringKey v69 = NSFontAttributeName;
  v50 = [(QLPDFPermissionViewController *)self passwordCell];
  v51 = [v50 label];
  v52 = [v51 font];
  v70 = v52;
  v53 = +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
  [v49 sizeWithAttributes:v53];
  double v55 = v54;

  v56 = [(QLPDFPermissionViewController *)self verifyCell];
  v57 = [v56 label];
  v58 = [v57 text];
  NSAttributedStringKey v67 = NSFontAttributeName;
  v59 = [(QLPDFPermissionViewController *)self verifyCell];
  v60 = [v59 label];
  v61 = [v60 font];
  v68 = v61;
  v62 = +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
  [v58 sizeWithAttributes:v62];
  double v64 = v63;

  if (v55 < v64) {
    double v55 = v64;
  }
  v65 = [(QLPDFPermissionViewController *)self passwordCell];
  [v65 installConstraintsWithWidth:v55];

  v66 = [(QLPDFPermissionViewController *)self verifyCell];
  [v66 installConstraintsWithWidth:v55];
}

- (void)doneButtonTapped
{
  objc_super v3 = [(QLPDFPermissionViewController *)self passwordCell];
  id v4 = [v3 textField];
  [v4 resignFirstResponder];

  char v5 = [(QLPDFPermissionViewController *)self verifyCell];
  id v6 = [v5 textField];
  [v6 resignFirstResponder];

  id v7 = [(QLPDFPermissionViewController *)self passwordCell];
  v8 = [v7 textField];
  id v9 = [v8 text];

  v10 = [(QLPDFPermissionViewController *)self verifyCell];
  v11 = [v10 textField];
  id v12 = [v11 text];

  if (([v9 isEqualToString:v12] & 1) == 0)
  {
    v15 = QLLocalizedStringWithDefaultValue();
    uint64_t v16 = +[UIAlertController alertControllerWithTitle:0 message:v15 preferredStyle:1];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000E024;
    v20[3] = &unk_1000249A0;
    v20[4] = self;
    v17 = v20;
LABEL_7:
    v18 = +[UIAlertAction actionWithTitle:@"OK" style:0 handler:v17];
    [v16 addAction:v18];
    [(QLPDFPermissionViewController *)self presentViewController:v16 animated:1 completion:0];

    goto LABEL_8;
  }
  if (![v9 length])
  {
    v15 = QLLocalizedStringWithDefaultValue();
    uint64_t v16 = +[UIAlertController alertControllerWithTitle:0 message:v15 preferredStyle:1];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000E080;
    v19[3] = &unk_1000249A0;
    void v19[4] = self;
    v17 = v19;
    goto LABEL_7;
  }
  v13 = [(QLPDFPermissionViewController *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    v15 = [(QLPDFPermissionViewController *)self delegate];
    v21[0] = PDFDocumentUserPasswordOption;
    v21[1] = PDFDocumentOwnerPasswordOption;
    v22[0] = v9;
    v22[1] = v9;
    uint64_t v16 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    [v15 permissionViewController:self didPickOptions:v16];
LABEL_8:
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = [(QLPDFPermissionViewController *)self passwordCell];
  char v5 = [v4 label];
  id v6 = [v5 text];
  NSAttributedStringKey v26 = NSFontAttributeName;
  id v7 = [(QLPDFPermissionViewController *)self passwordCell];
  v8 = [v7 label];
  id v9 = [v8 font];
  v27 = v9;
  v10 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  [v6 sizeWithAttributes:v10];
  double v12 = v11;

  v13 = [(QLPDFPermissionViewController *)self verifyCell];
  char v14 = [v13 label];
  v15 = [v14 text];
  NSAttributedStringKey v24 = NSFontAttributeName;
  uint64_t v16 = [(QLPDFPermissionViewController *)self verifyCell];
  v17 = [v16 label];
  v18 = [v17 font];
  v25 = v18;
  v19 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  [v15 sizeWithAttributes:v19];
  double v21 = v20;

  if (v12 < v21) {
    double v12 = v21;
  }
  id v22 = [(QLPDFPermissionViewController *)self passwordCell];
  [v22 installConstraintsWithWidth:v12];

  v23 = [(QLPDFPermissionViewController *)self verifyCell];
  [v23 installConstraintsWithWidth:v12];
}

- (QLPDFPermissionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (QLPDFPermissionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (QLPDFPermissionCell)passwordCell
{
  return self->_passwordCell;
}

- (void)setPasswordCell:(id)a3
{
}

- (QLPDFPermissionCell)verifyCell
{
  return self->_verifyCell;
}

- (void)setVerifyCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifyCell, 0);
  objc_storeStrong((id *)&self->_passwordCell, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end