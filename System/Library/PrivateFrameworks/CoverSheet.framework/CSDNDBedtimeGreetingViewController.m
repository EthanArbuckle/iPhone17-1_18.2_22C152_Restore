@interface CSDNDBedtimeGreetingViewController
- (BOOL)handleEvent:(id)a3;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (CSDNDBedtimeGreetingDelegate)delegate;
- (CSDNDBedtimeGreetingViewController)initWithLegibilityPrimaryColor:(id)a3;
- (id)_greetingString;
- (void)aggregateAppearance:(id)a3;
- (void)dealloc;
- (void)handleSecondaryActionForView:(id)a3;
- (void)loadView;
- (void)setDelegate:(id)a3;
@end

@implementation CSDNDBedtimeGreetingViewController

- (CSDNDBedtimeGreetingViewController)initWithLegibilityPrimaryColor:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSDNDBedtimeGreetingViewController;
  v6 = [(CSDNDBedtimeGreetingViewController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_legibilityPrimaryColor, a3);
    uint64_t v8 = [MEMORY[0x1E4F1E5E8] newAssertionForBundleIdentifier:@"com.apple.weather" withReason:@"DND bedtime greeting" level:0];
    weatherInUseAssertion = v7->_weatherInUseAssertion;
    v7->_weatherInUseAssertion = (CLInUseAssertion *)v8;
  }
  return v7;
}

- (void)dealloc
{
  [(CLInUseAssertion *)self->_weatherInUseAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CSDNDBedtimeGreetingViewController;
  [(CSCoverSheetViewControllerBase *)&v3 dealloc];
}

- (void)loadView
{
  objc_super v3 = [CSModalView alloc];
  v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 bounds];
  v9 = -[CSModalView initWithFrame:](v3, "initWithFrame:");

  [(CSModalView *)v9 setShowsStatusText:0];
  [(CSModalView *)v9 setDelegate:self];
  [(CSModalView *)v9 setAutoresizingMask:18];
  [(CSModalView *)v9 setWantsEnhancedSecondaryActionButton:1];
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"DND_BEDTIME_DISMISS" value:&stru_1F3020248 table:@"CoverSheet"];
  [(CSModalView *)v9 setSecondaryActionButtonText:v6];

  [(CSModalView *)v9 setSecondaryActionButtonTextColor:self->_legibilityPrimaryColor];
  v7 = [(CSDNDBedtimeGreetingViewController *)self _greetingString];
  [(CSModalView *)v9 setTitleText:v7];

  [(CSModalView *)v9 setTitleTextColor:self->_legibilityPrimaryColor];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB52E0]) initWithColor:self->_legibilityPrimaryColor];
  [(CSModalView *)v9 setDetailView:v8];
  [(CSDNDBedtimeGreetingViewController *)self setView:v9];
}

- (void)aggregateAppearance:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSDNDBedtimeGreetingViewController;
  id v3 = a3;
  [(CSModalViewControllerBase *)&v7 aggregateAppearance:v3];
  v4 = +[CSComponent footerCallToActionLabel];
  id v5 = [v4 priority:40];
  v6 = [v5 hidden:1];
  [v3 addComponent:v6];
}

- (void)handleSecondaryActionForView:(id)a3
{
  id v4 = [(CSDNDBedtimeGreetingViewController *)self delegate];
  [v4 dismissDNDBedtimeGreetingViewController:self animated:1];
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSDNDBedtimeGreetingViewController;
  if (![(CSCoverSheetViewControllerBase *)&v8 handleEvent:v4]
    || ([v4 isConsumable] & 1) == 0)
  {
    if ([v4 type] != 27)
    {
      char v6 = 0;
      goto LABEL_7;
    }
    id v5 = [(CSDNDBedtimeGreetingViewController *)self delegate];
    [v5 dismissDNDBedtimeGreetingViewController:self animated:1];
  }
  char v6 = [v4 isConsumable];
LABEL_7:

  return v6;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return [a3 type] == 27;
}

- (id)_greetingString
{
  v2 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  unint64_t v5 = objc_msgSend(v2, "bs_dayPeriodForDate:inLocale:", v3, v4);

  if (v5 > 0xA) {
    char v6 = 0;
  }
  else {
    char v6 = off_1E6ADADB0[v5];
  }
  objc_super v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  objc_super v8 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  [v7 setTimeZone:v8];

  v9 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v10 = [v7 component:32 fromDate:v9];

  if ((unint64_t)(v10 - 3) <= 6
    && [(__CFString *)v6 isEqualToString:@"DND_BEDTIME_EVENING_GREETING"])
  {
    char v6 = @"DND_BEDTIME_MORNING_GREETING";
  }
  objc_super v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:v6 value:&stru_1F3020248 table:@"CoverSheet"];

  return v12;
}

- (CSDNDBedtimeGreetingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDNDBedtimeGreetingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_weatherInUseAssertion, 0);

  objc_storeStrong((id *)&self->_legibilityPrimaryColor, 0);
}

@end