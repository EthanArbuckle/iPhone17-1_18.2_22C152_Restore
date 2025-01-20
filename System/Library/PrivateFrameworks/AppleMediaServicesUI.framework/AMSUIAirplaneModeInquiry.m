@interface AMSUIAirplaneModeInquiry
+ (NSURL)settingsURL;
- (AMSUIAirplaneModeInquiry)init;
- (AMSUIAirplaneModeInquiryDelegate)delegate;
- (BOOL)isEnabled;
- (RadiosPreferences)radiosPreferences;
- (void)airplaneModeChanged;
- (void)setDelegate:(id)a3;
@end

@implementation AMSUIAirplaneModeInquiry

- (AMSUIAirplaneModeInquiry)init
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUIAirplaneModeInquiry;
  v2 = [(AMSUIAirplaneModeInquiry *)&v6 init];
  if (v2)
  {
    v3 = (RadiosPreferences *)objc_alloc_init(MEMORY[0x263F255D8]);
    radiosPreferences = v2->_radiosPreferences;
    v2->_radiosPreferences = v3;

    [(RadiosPreferences *)v2->_radiosPreferences setDelegate:v2];
  }
  return v2;
}

+ (NSURL)settingsURL
{
  return (NSURL *)[MEMORY[0x263F5FAD0] preferencesURL];
}

- (BOOL)isEnabled
{
  v2 = [(AMSUIAirplaneModeInquiry *)self radiosPreferences];
  char v3 = [v2 airplaneMode];

  return v3;
}

- (void)airplaneModeChanged
{
  id v3 = [(AMSUIAirplaneModeInquiry *)self delegate];
  [v3 airplaneModeInquiryDidObserveChange:self];
}

- (AMSUIAirplaneModeInquiryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSUIAirplaneModeInquiryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RadiosPreferences)radiosPreferences
{
  return self->_radiosPreferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end