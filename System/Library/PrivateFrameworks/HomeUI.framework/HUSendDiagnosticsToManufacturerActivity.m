@interface HUSendDiagnosticsToManufacturerActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (HFAccessoryDiagnosticItem)diagnosticItem;
- (HUSendDiagnosticsToManufacturerActivity)initWithDiagnosticItem:(id)a3;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (void)prepareWithActivityItems:(id)a3;
- (void)setDiagnosticItem:(id)a3;
@end

@implementation HUSendDiagnosticsToManufacturerActivity

- (HUSendDiagnosticsToManufacturerActivity)initWithDiagnosticItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUSendDiagnosticsToManufacturerActivity;
  v6 = [(UIActivity *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_diagnosticItem, a3);
  }

  return v7;
}

- (id)activityType
{
  return @"com.apple.Home.sendDiagnosticsToManufacturerActivity";
}

- (id)activityTitle
{
  v2 = [(HUSendDiagnosticsToManufacturerActivity *)self diagnosticItem];
  v3 = [v2 manufacturer];
  v10 = HULocalizedStringWithFormat(@"HUSendDiagnosticsToManufacturerActivityTitle", @"%@", v4, v5, v6, v7, v8, v9, (uint64_t)v3);

  return v10;
}

- (id)activityImage
{
  return (id)[MEMORY[0x1E4F42A80] _systemImageNamed:@"apple.bubble.middle.bottom"];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Preparing with activity items :%@", (uint8_t *)&v5, 0xCu);
  }
}

- (id)activityViewController
{
  id v3 = [HUAccessoryDiagnosticsConsentViewController alloc];
  uint64_t v4 = [(HUSendDiagnosticsToManufacturerActivity *)self diagnosticItem];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__HUSendDiagnosticsToManufacturerActivity_activityViewController__block_invoke;
  v10[3] = &unk_1E6386730;
  v10[4] = self;
  int v5 = [(HUAccessoryDiagnosticsConsentViewController *)v3 initWithItem:v4 completionHandler:v10];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v5];
  uint64_t v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Returning activityViewController for HUSendDiagnosticsToManufacturerActivity", v9, 2u);
  }

  return v6;
}

uint64_t __65__HUSendDiagnosticsToManufacturerActivity_activityViewController__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = [MEMORY[0x1E4F68DF8] sharedManager];
    int v5 = [*(id *)(a1 + 32) diagnosticItem];
    [v4 uploadDiagnosticLogUsingItem:v5];
  }
  id v6 = *(void **)(a1 + 32);

  return [v6 activityDidFinish:a2];
}

- (HFAccessoryDiagnosticItem)diagnosticItem
{
  return self->_diagnosticItem;
}

- (void)setDiagnosticItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end