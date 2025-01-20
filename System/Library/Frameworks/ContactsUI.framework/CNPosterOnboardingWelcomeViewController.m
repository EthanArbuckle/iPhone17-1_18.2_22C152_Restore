@interface CNPosterOnboardingWelcomeViewController
- (BOOL)hasExistingNickname;
- (BOOL)hasOptionToSkip;
- (CNContact)contact;
- (CNPosterOnboardingWelcomeViewController)initWithContact:(id)a3;
- (CNPosterOnboardingWelcomeViewControllerDelegate)delegate;
- (void)onboardingWelcomeViewDidTapCancel;
- (void)onboardingWelcomeViewDidTapContinue;
- (void)setContact:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasExistingNickname:(BOOL)a3;
- (void)setHasOptionToSkip:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation CNPosterOnboardingWelcomeViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)setDelegate:(id)a3
{
}

- (CNPosterOnboardingWelcomeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNPosterOnboardingWelcomeViewControllerDelegate *)WeakRetained;
}

- (void)setHasExistingNickname:(BOOL)a3
{
  self->_hasExistingNickname = a3;
}

- (BOOL)hasExistingNickname
{
  return self->_hasExistingNickname;
}

- (void)setHasOptionToSkip:(BOOL)a3
{
  self->_hasOptionToSkip = a3;
}

- (BOOL)hasOptionToSkip
{
  return self->_hasOptionToSkip;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)onboardingWelcomeViewDidTapCancel
{
  v3 = [(CNPosterOnboardingWelcomeViewController *)self delegate];

  if (v3)
  {
    id v5 = [(CNPosterOnboardingWelcomeViewController *)self delegate];
    [v5 posterOnboardingViewControllerDidDidTapCancel:self];
  }
  else
  {
    v4 = CNUILogPosters();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEFAULT, "Onboarding view delegate is unexpectedly nil", buf, 2u);
    }

    [(CNPosterOnboardingWelcomeViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)onboardingWelcomeViewDidTapContinue
{
  v3 = [(CNPosterOnboardingWelcomeViewController *)self delegate];

  if (v3)
  {
    id v5 = [(CNPosterOnboardingWelcomeViewController *)self delegate];
    [v5 posterOnboardingViewControllerDidTapContinue:self];
  }
  else
  {
    v4 = CNUILogPosters();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEFAULT, "Onboarding view delegate is unexpectedly nil", buf, 2u);
    }

    [(CNPosterOnboardingWelcomeViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  v38[4] = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)CNPosterOnboardingWelcomeViewController;
  [(CNPosterOnboardingWelcomeViewController *)&v37 viewIsAppearing:a3];
  v4 = [(CNPosterOnboardingWelcomeViewController *)self navigationItem];
  id v5 = [v4 navigationBar];
  [v5 frame];
  double v7 = v6;

  v8 = [_TtC10ContactsUI36CNPosterOnboardingWelcomeViewWrapper alloc];
  v9 = [(CNPosterOnboardingWelcomeViewController *)self contact];
  BOOL v10 = [(CNPosterOnboardingWelcomeViewController *)self hasOptionToSkip];
  BOOL v11 = [(CNPosterOnboardingWelcomeViewController *)self hasExistingNickname];
  v12 = [(CNPosterOnboardingWelcomeViewController *)self view];
  v13 = [v12 window];
  v14 = [v13 windowScene];
  v15 = [(CNPosterOnboardingWelcomeViewWrapper *)v8 initWithContact:v9 hasOptionToSkip:v10 hasExistingNickname:v11 navigationBarHeight:self delegate:v14 windowScene:v7];
  v16 = [(CNPosterOnboardingWelcomeViewWrapper *)v15 hostingController];
  v17 = [v16 view];

  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  v18 = [(CNPosterOnboardingWelcomeViewController *)self view];
  [v18 addSubview:v17];

  v29 = (void *)MEMORY[0x1E4F28DC8];
  v35 = [v17 leadingAnchor];
  v36 = [(CNPosterOnboardingWelcomeViewController *)self view];
  v34 = [v36 leadingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v38[0] = v33;
  v31 = [v17 trailingAnchor];
  v32 = [(CNPosterOnboardingWelcomeViewController *)self view];
  v30 = [v32 trailingAnchor];
  v28 = [v31 constraintEqualToAnchor:v30];
  v38[1] = v28;
  v19 = [v17 topAnchor];
  v20 = [(CNPosterOnboardingWelcomeViewController *)self view];
  v21 = [v20 topAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  v38[2] = v22;
  v23 = [v17 bottomAnchor];
  v24 = [(CNPosterOnboardingWelcomeViewController *)self view];
  v25 = [v24 bottomAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  v38[3] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
  [v29 activateConstraints:v27];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CNPosterOnboardingWelcomeViewController;
  [(CNPosterOnboardingWelcomeViewController *)&v4 viewDidLoad];
  v3 = [(CNPosterOnboardingWelcomeViewController *)self navigationItem];
  [v3 _setBackgroundHidden:1];
}

- (CNPosterOnboardingWelcomeViewController)initWithContact:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNPosterOnboardingWelcomeViewController;
  double v6 = [(CNPosterOnboardingWelcomeViewController *)&v10 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contact, a3);
    v8 = v7;
  }

  return v7;
}

@end