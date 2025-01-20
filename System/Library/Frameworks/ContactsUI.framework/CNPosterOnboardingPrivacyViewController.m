@interface CNPosterOnboardingPrivacyViewController
- (CNIDSDeviceListService)service;
- (CNPosterOnboardingPrivacyViewController)init;
- (_TtC10ContactsUI34CNPosterOnboardingPrivacyViewModel)model;
- (id)onCancel;
- (id)onContinue;
- (void)onboardingPrivacyViewDidTapCancel;
- (void)onboardingPrivacyViewDidTapContinue;
- (void)setModel:(id)a3;
- (void)setOnCancel:(id)a3;
- (void)setOnContinue:(id)a3;
- (void)setService:(id)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation CNPosterOnboardingPrivacyViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong(&self->_onContinue, 0);

  objc_storeStrong(&self->_onCancel, 0);
}

- (void)setModel:(id)a3
{
}

- (_TtC10ContactsUI34CNPosterOnboardingPrivacyViewModel)model
{
  return self->_model;
}

- (void)setService:(id)a3
{
}

- (CNIDSDeviceListService)service
{
  return self->_service;
}

- (void)setOnContinue:(id)a3
{
}

- (id)onContinue
{
  return self->_onContinue;
}

- (void)setOnCancel:(id)a3
{
}

- (id)onCancel
{
  return self->_onCancel;
}

- (void)onboardingPrivacyViewDidTapCancel
{
  v3 = [(CNPosterOnboardingPrivacyViewController *)self onCancel];

  if (v3)
  {
    v5 = [(CNPosterOnboardingPrivacyViewController *)self onCancel];
    v5[2](v5, self);
  }
  else
  {
    v4 = CNUILogPosters();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEFAULT, "Onboarding privacy view delegate is unexpectedly nil", buf, 2u);
    }

    [(CNPosterOnboardingPrivacyViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)onboardingPrivacyViewDidTapContinue
{
  v3 = [(CNPosterOnboardingPrivacyViewController *)self onContinue];

  if (v3)
  {
    v5 = [(CNPosterOnboardingPrivacyViewController *)self onContinue];
    v5[2](v5, self);
  }
  else
  {
    v4 = CNUILogPosters();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEFAULT, "Onboarding privacy view delegate is unexpectedly nil", buf, 2u);
    }

    [(CNPosterOnboardingPrivacyViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CNPosterOnboardingPrivacyViewController;
  [(CNPosterOnboardingPrivacyViewController *)&v3 viewIsAppearing:a3];
}

- (void)viewDidLoad
{
  v30[4] = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)CNPosterOnboardingPrivacyViewController;
  [(CNPosterOnboardingPrivacyViewController *)&v29 viewDidLoad];
  objc_super v3 = [(CNPosterOnboardingPrivacyViewController *)self navigationItem];
  [v3 _setBackgroundHidden:1];

  v28 = [[_TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper alloc] initWithDelegate:self];
  v4 = [(CNPosterOnboardingPrivacyViewWrapper *)v28 hostingController];
  v5 = [v4 view];

  v6 = [(CNPosterOnboardingPrivacyViewWrapper *)v28 model];
  [(CNPosterOnboardingPrivacyViewController *)self setModel:v6];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = [(CNPosterOnboardingPrivacyViewController *)self view];
  [v7 addSubview:v5];

  v20 = (void *)MEMORY[0x1E4F28DC8];
  v26 = [v5 leadingAnchor];
  v27 = [(CNPosterOnboardingPrivacyViewController *)self view];
  v25 = [v27 leadingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v30[0] = v24;
  v22 = [v5 trailingAnchor];
  v23 = [(CNPosterOnboardingPrivacyViewController *)self view];
  v21 = [v23 trailingAnchor];
  v19 = [v22 constraintEqualToAnchor:v21];
  v30[1] = v19;
  v18 = [v5 topAnchor];
  v8 = [(CNPosterOnboardingPrivacyViewController *)self view];
  v9 = [v8 topAnchor];
  v10 = [v18 constraintEqualToAnchor:v9];
  v30[2] = v10;
  v11 = [v5 bottomAnchor];
  v12 = [(CNPosterOnboardingPrivacyViewController *)self view];
  v13 = [v12 bottomAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  v30[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  [v20 activateConstraints:v15];

  v16 = [(CNPosterOnboardingPrivacyViewController *)self model];
  v17 = [(CNIDSDeviceListService *)self->_service fetch];
  [v16 setWithItems:v17];
}

- (CNPosterOnboardingPrivacyViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNPosterOnboardingPrivacyViewController;
  v2 = [(CNPosterOnboardingPrivacyViewController *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    service = v2->_service;
    v2->_service = (CNIDSDeviceListService *)v3;

    v5 = v2;
  }

  return v2;
}

@end