@interface _ASAccountSharingGroupOnBoardingViewController
- (KCSharingGroup)group;
- (_ASAccountSharingGroupOnBoardingViewController)initWithContentType:(unint64_t)a3 group:(id)a4;
- (_ASAccountSharingGroupOnBoardingViewControllerDelegate)delegate;
- (unint64_t)contentType;
- (void)_addButtons;
- (void)_cancelButtonSelected;
- (void)_configureCancelButton;
- (void)_configureNotNowButton;
- (void)_continueButtonSelected;
- (void)_notNowButtonSelected;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation _ASAccountSharingGroupOnBoardingViewController

- (_ASAccountSharingGroupOnBoardingViewController)initWithContentType:(unint64_t)a3 group:(id)a4
{
  id v7 = a4;
  v8 = v7;
  switch(a3)
  {
    case 0uLL:
      v9 = +[_ASAccountSharingGroupOnBoardingCreateGroupContent headerTitle];
      uint64_t v10 = +[_ASAccountSharingGroupOnBoardingCreateGroupContent headerImage];
      goto LABEL_5;
    case 1uLL:
      v12 = [v7 displayName];
      v9 = +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent headerTitleForWelcomeViewWithGroupName:v12];

      uint64_t v10 = +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent headerImageForWelcomeView];
LABEL_5:
      v11 = (void *)v10;
      goto LABEL_6;
    case 2uLL:
      v9 = +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent headerTitleForMovingCredentialsToGroup];
      v11 = +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent headerImageForMovingCredentialsToGroup];
      v14 = [v8 displayName];
      uint64_t v15 = +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent descriptionForMovingCredentialsToGroup:v14];
      goto LABEL_9;
    case 3uLL:
      v9 = +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent headerTitleForRemovingDuplicateCredentialsInGroup];
      v11 = +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent headerImageForRemovingDuplicateCredentialsInGroup];
      v14 = [v8 displayName];
      uint64_t v15 = +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent descriptionForRemovingDuplicateCredentialsInGroup:v14];
LABEL_9:
      v13 = (void *)v15;

      break;
    default:
      v9 = 0;
      v11 = 0;
LABEL_6:
      v13 = 0;
      break;
  }
  v20.receiver = self;
  v20.super_class = (Class)_ASAccountSharingGroupOnBoardingViewController;
  v16 = [(_ASAccountSharingGroupOnBoardingViewController *)&v20 initWithTitle:v9 detailText:v13 icon:v11 contentLayout:2];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_group, a4);
    v17->_contentType = a3;
    v18 = v17;
  }

  return v17;
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)_ASAccountSharingGroupOnBoardingViewController;
  [(OBBaseWelcomeController *)&v24 viewDidLoad];
  unint64_t contentType = self->_contentType;
  if (contentType == 1)
  {
    v13 = +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent firstBulletTitleForWelcomeView];
    v14 = +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent firstBulletDescriptionForWelcomeView];
    uint64_t v15 = +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent firstBulletImageForWelcomeView];
    [(_ASAccountSharingGroupOnBoardingViewController *)self addBulletedListItemWithTitle:v13 description:v14 image:v15];

    v16 = [(KCSharingGroup *)self->_group currentUserParticipant];
    uint64_t v17 = [v16 permissionLevel];

    if (v17)
    {
      v18 = +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent secondBulletTitleForWelcomeView];
      v19 = +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent secondBulletDescriptionForWelcomeView];
      objc_super v20 = +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent secondBulletImageForWelcomeView];
      [(_ASAccountSharingGroupOnBoardingViewController *)self addBulletedListItemWithTitle:v18 description:v19 image:v20];
    }
    v21 = +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent thirdBulletTitleForWelcomeView];
    v22 = +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent thirdBulletDescriptionForWelcomeView];
    v23 = +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent thirdBulletImageForWelcomeView];
    [(_ASAccountSharingGroupOnBoardingViewController *)self addBulletedListItemWithTitle:v21 description:v22 image:v23];

    uint64_t v10 = [(OBBaseWelcomeController *)self navigationItem];
    [v10 setHidesBackButton:1 animated:1];
    goto LABEL_7;
  }
  if (!contentType)
  {
    v4 = +[_ASAccountSharingGroupOnBoardingCreateGroupContent firstBulletTitle];
    v5 = +[_ASAccountSharingGroupOnBoardingCreateGroupContent firstBulletDescription];
    v6 = +[_ASAccountSharingGroupOnBoardingCreateGroupContent firstBulletImage];
    [(_ASAccountSharingGroupOnBoardingViewController *)self addBulletedListItemWithTitle:v4 description:v5 image:v6];

    id v7 = +[_ASAccountSharingGroupOnBoardingCreateGroupContent secondBulletTitle];
    v8 = +[_ASAccountSharingGroupOnBoardingCreateGroupContent secondBulletDescription];
    v9 = +[_ASAccountSharingGroupOnBoardingCreateGroupContent secondBulletImage];
    [(_ASAccountSharingGroupOnBoardingViewController *)self addBulletedListItemWithTitle:v7 description:v8 image:v9];

    uint64_t v10 = +[_ASAccountSharingGroupOnBoardingCreateGroupContent thirdBulletTitle];
    v11 = +[_ASAccountSharingGroupOnBoardingCreateGroupContent thirdBulletDescription];
    v12 = +[_ASAccountSharingGroupOnBoardingCreateGroupContent thirdBulletImage];
    [(_ASAccountSharingGroupOnBoardingViewController *)self addBulletedListItemWithTitle:v10 description:v11 image:v12];

LABEL_7:
  }
  [(_ASAccountSharingGroupOnBoardingViewController *)self _addButtons];
}

- (void)_addButtons
{
  v3 = [MEMORY[0x263F5B898] boldButton];
  id v7 = v3;
  switch(self->_contentType)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
      v4 = _WBSLocalizedString();
      [v7 setTitle:v4 forState:0];

      v3 = v7;
      break;
    default:
      break;
  }
  [v3 addTarget:self action:sel__continueButtonSelected forControlEvents:64];
  v5 = [(_ASAccountSharingGroupOnBoardingViewController *)self buttonTray];
  [v5 addButton:v7];

  unint64_t contentType = self->_contentType;
  if (contentType - 2 >= 2)
  {
    if (!contentType) {
      [(_ASAccountSharingGroupOnBoardingViewController *)self _configureCancelButton];
    }
  }
  else
  {
    [(_ASAccountSharingGroupOnBoardingViewController *)self _configureNotNowButton];
  }
}

- (void)_configureCancelButton
{
  id v5 = [MEMORY[0x263F5B8D0] linkButton];
  v3 = _WBSLocalizedString();
  [v5 setTitle:v3 forState:0];

  [v5 addTarget:self action:sel__cancelButtonSelected forControlEvents:64];
  v4 = [(_ASAccountSharingGroupOnBoardingViewController *)self buttonTray];
  [v4 addButton:v5];
}

- (void)_configureNotNowButton
{
  id v5 = [MEMORY[0x263F5B8D0] linkButton];
  v3 = _WBSLocalizedString();
  [v5 setTitle:v3 forState:0];

  [v5 addTarget:self action:sel__notNowButtonSelected forControlEvents:64];
  v4 = [(_ASAccountSharingGroupOnBoardingViewController *)self buttonTray];
  [v4 addButton:v5];
}

- (void)_continueButtonSelected
{
  if (self->_contentType == 1)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    [v3 startAnimating];
    v4 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v3];
    id v5 = [(OBBaseWelcomeController *)self navigationItem];
    [v5 setRightBarButtonItem:v4];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained accountSharingGroupOnBoardingViewControllerDidSelectContinue:self];
}

- (void)_cancelButtonSelected
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained accountSharingGroupOnBoardingViewControllerDidSelectCancel:self];
}

- (void)_notNowButtonSelected
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained accountSharingGroupOnBoardingViewControllerDidSelectNotNow:self];
}

- (KCSharingGroup)group
{
  return self->_group;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (_ASAccountSharingGroupOnBoardingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_ASAccountSharingGroupOnBoardingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_group, 0);
}

@end