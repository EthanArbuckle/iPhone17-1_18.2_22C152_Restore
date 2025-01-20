@interface ProximityAutoFillDoneViewController
- (NSError)error;
- (void)handleDoneButtonPressed:(id)a3;
- (void)handleReportButton:(id)a3;
- (void)setError:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ProximityAutoFillDoneViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_reportBugButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_descriptionLabel + 1), 0);

  objc_storeStrong((id *)(&self->_canceled + 1), 0);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return *(NSError **)((char *)&self->_titleLabel + 1);
}

- (void)handleReportButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super.super._mainController fileRadar:*(UILabel **)((char *)&self->_titleLabel + 1)];
}

- (void)handleDoneButtonPressed:(id)a3
{
  id v4 = a3;
  if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super.super._mainController ensureStoppedWithDismiss:1 reason:5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v30.receiver = self;
  v30.super_class = (Class)ProximityAutoFillDoneViewController;
  [(SVSBaseViewController *)&v30 viewWillAppear:a3];
  id v4 = *(UILabel **)((char *)&self->_titleLabel + 1);
  if (v4)
  {
    BOOL v5 = [v4 code] == (id)-6723;
    *(&self->super.super._didReactivateContainerViewAfterLayingOut + 1) = v5;
    if (v5)
    {
LABEL_3:
      v6 = +[NSBundle mainBundle];
      v7 = [v6 localizedStringForKey:@"PROX_AUTOFILL_CANCELED_DESCRIPTION" value:&stru_1001A1DC0 table:@"Localizable"];
      [*(id *)(&self->_canceled + 1) setText:v7];

      [*(id *)((char *)&self->_descriptionLabel + 1) setHidden:1];
      v8 = +[NSBundle mainBundle];
      v9 = v8;
      CFStringRef v10 = @"PROX_AUTOFILL_CANCELED_TITLE";
LABEL_4:
      v11 = [v8 localizedStringForKey:v10 value:&stru_1001A1DC0 table:@"Localizable"];
      [*(id *)((char *)&self->_reportBugButton + 1) setText:v11];
      goto LABEL_12;
    }
  }
  else if (*(&self->super.super._didReactivateContainerViewAfterLayingOut + 1))
  {
    goto LABEL_3;
  }
  uint64_t v12 = *(uint64_t *)((char *)&self->_titleLabel + 1);
  v13 = +[NSBundle mainBundle];
  v14 = v13;
  if (!v12)
  {
    v26 = [v13 localizedStringForKey:@"PROX_AUTOFILL_SUCCESS_DESCRIPTION_TV" value:&stru_1001A1DC0 table:@"Localizable"];
    [*(id *)(&self->_canceled + 1) setText:v26];

    v27 = +[UIImage imageNamed:@"DoneCheck.png"];
    v28 = +[UIColor systemBlueColor];
    v29 = [v27 _flatImageWithColor:v28];
    [*(id *)((char *)&self->_descriptionLabel + 1) setImage:v29];

    v8 = +[NSBundle mainBundle];
    v9 = v8;
    CFStringRef v10 = @"PROX_AUTOFILL_SUCCESS_TITLE";
    goto LABEL_4;
  }
  v9 = [v13 localizedStringForKey:@"PROX_AUTOFILL_FAILED_DESCRIPTION" value:&stru_1001A1DC0 table:@"Localizable"];

  if (IsAppleInternalBuild())
  {
    v15 = +[NSBundle mainBundle];
    v16 = [v15 localizedStringForKey:@"PROX_AUTOFILL_FAILED_DESCRIPTION_FORMAT" value:&stru_1001A1DC0 table:@"Localizable"];

    uint64_t v17 = [*(id *)((char *)&self->_titleLabel + 1) localizedDescription];
    v18 = (void *)v17;
    CFStringRef v19 = @"Unknown error";
    if (v17) {
      CFStringRef v19 = (const __CFString *)v17;
    }
    uint64_t v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v19);

    v9 = (void *)v20;
  }
  [*(id *)(&self->_canceled + 1) setText:v9];
  v21 = +[UIImage imageNamed:@"AlertCircle.png"];
  v22 = +[UIColor systemRedColor];
  v23 = [v21 _flatImageWithColor:v22];
  [*(id *)((char *)&self->_descriptionLabel + 1) setImage:v23];

  v11 = +[NSBundle mainBundle];
  v24 = [v11 localizedStringForKey:@"PROX_AUTOFILL_FAILED_TITLE" value:&stru_1001A1DC0 table:@"Localizable"];
  [*(id *)((char *)&self->_reportBugButton + 1) setText:v24];

LABEL_12:
  if (IsAppleInternalBuild()) {
    uint64_t v25 = (uint64_t)[self->super.super._mainController prefHideTTR];
  }
  else {
    uint64_t v25 = 1;
  }
  [*(id *)((char *)&self->_imageView + 1) setHidden:v25];
}

@end