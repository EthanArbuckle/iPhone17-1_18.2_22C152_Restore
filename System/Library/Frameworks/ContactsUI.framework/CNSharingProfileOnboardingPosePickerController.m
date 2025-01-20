@interface CNSharingProfileOnboardingPosePickerController
- (AVTAvatarRecord)avatarRecord;
- (CNPhotoPickerVariantListController)variantListController;
- (CNPhotoPickerVariantsManager)variantsManager;
- (CNSharingProfileOnboardingPosePickerController)initWithAvatarRecord:(id)a3 variantsManager:(id)a4;
- (CNSharingProfileOnboardingPosePickerControllerDelegate)delegate;
- (NSLayoutConstraint)heightConstraint;
- (OBBoldTrayButton)backButton;
- (OBBoldTrayButton)nextButton;
- (OBLinkTrayButton)setupLaterButton;
- (void)didTapBack:(id)a3;
- (void)didTapContinue:(id)a3;
- (void)didTapSetupLater:(id)a3;
- (void)photoPickerVariantListController:(id)a3 didSelectProviderItem:(id)a4;
- (void)photoPickerVariantListControllerDidCancel:(id)a3;
- (void)setAvatarRecord:(id)a3;
- (void)setBackButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setNextButton:(id)a3;
- (void)setSetupLaterButton:(id)a3;
- (void)setVariantListController:(id)a3;
- (void)setVariantsManager:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CNSharingProfileOnboardingPosePickerController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_setupLaterButton, 0);
  objc_storeStrong((id *)&self->_variantListController, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setNextButton:(id)a3
{
}

- (OBBoldTrayButton)nextButton
{
  return self->_nextButton;
}

- (void)setBackButton:(id)a3
{
}

- (OBBoldTrayButton)backButton
{
  return self->_backButton;
}

- (void)setSetupLaterButton:(id)a3
{
}

- (OBLinkTrayButton)setupLaterButton
{
  return self->_setupLaterButton;
}

- (void)setVariantListController:(id)a3
{
}

- (CNPhotoPickerVariantListController)variantListController
{
  return self->_variantListController;
}

- (void)setVariantsManager:(id)a3
{
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setAvatarRecord:(id)a3
{
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setDelegate:(id)a3
{
}

- (CNSharingProfileOnboardingPosePickerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNSharingProfileOnboardingPosePickerControllerDelegate *)WeakRetained;
}

- (void)photoPickerVariantListController:(id)a3 didSelectProviderItem:(id)a4
{
  id v5 = a4;
  id v6 = [(CNSharingProfileOnboardingPosePickerController *)self delegate];
  [v6 posePickerController:self didFinishWithProviderItem:v5];
}

- (void)photoPickerVariantListControllerDidCancel:(id)a3
{
  id v4 = [(CNSharingProfileOnboardingPosePickerController *)self delegate];
  [v4 posePickerControllerDidSelectBack:self];
}

- (void)didTapContinue:(id)a3
{
  id v3 = [(CNSharingProfileOnboardingPosePickerController *)self variantListController];
  [v3 didFinishSelectingVariant];
}

- (void)didTapBack:(id)a3
{
  id v4 = [(CNSharingProfileOnboardingPosePickerController *)self delegate];
  [v4 posePickerControllerDidSelectBack:self];
}

- (void)didTapSetupLater:(id)a3
{
  id v4 = [(CNSharingProfileOnboardingPosePickerController *)self delegate];
  [v4 posePickerControllerDidSelectSetupLater:self];
}

- (void)viewDidLayoutSubviews
{
  id v3 = [(CNSharingProfileOnboardingPosePickerController *)self variantListController];
  id v4 = [v3 collectionView];
  [v4 contentSize];
  double v6 = v5;
  v7 = [(CNSharingProfileOnboardingPosePickerController *)self heightConstraint];
  [v7 setConstant:v6];

  v8.receiver = self;
  v8.super_class = (Class)CNSharingProfileOnboardingPosePickerController;
  [(OBBaseWelcomeController *)&v8 viewDidLayoutSubviews];
}

- (void)viewDidLoad
{
  v63[4] = *MEMORY[0x1E4F143B8];
  v62.receiver = self;
  v62.super_class = (Class)CNSharingProfileOnboardingPosePickerController;
  [(OBBaseWelcomeController *)&v62 viewDidLoad];
  id v3 = [CNPhotoPickerVariantListController alloc];
  id v4 = [(CNSharingProfileOnboardingPosePickerController *)self variantsManager];
  double v5 = [(CNSharingProfileOnboardingPosePickerController *)self avatarRecord];
  double v6 = +[CNPhotoPickerAnimojiProvider providerItemForAvatarRecord:v5];
  v7 = [(CNPhotoPickerVariantListController *)v3 initWithVariantsManager:v4 originalItem:v6];

  [(CNPhotoPickerVariantListController *)v7 setDelegate:self];
  [(CNPhotoPickerVariantListController *)v7 setShowPreview:0];
  [(CNPhotoPickerVariantListController *)v7 setCellStyle:0];
  [(CNPhotoPickerVariantListController *)v7 setNumberOfItemsPerRowProvider:&__block_literal_global_7487];
  objc_super v8 = [(CNPhotoPickerVariantListController *)v7 view];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  variantListController = self->_variantListController;
  self->_variantListController = v7;
  v61 = v7;

  v10 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v11 = [(CNPhotoPickerVariantListController *)self->_variantListController view];
  [v11 setBackgroundColor:v10];

  v12 = [(CNSharingProfileOnboardingPosePickerController *)self contentView];
  v13 = [(CNPhotoPickerVariantListController *)self->_variantListController view];
  [v12 addSubview:v13];

  [(CNSharingProfileOnboardingPosePickerController *)self addChildViewController:self->_variantListController];
  [(CNPhotoPickerVariantListController *)self->_variantListController didMoveToParentViewController:self];
  v14 = objc_alloc_init(CNOnboardingBoldButtonProvider);
  v15 = [MEMORY[0x1E4F83AB0] linkButton];
  setupLaterButton = self->_setupLaterButton;
  self->_setupLaterButton = v15;

  v17 = self->_setupLaterButton;
  v18 = CNContactsUIBundle();
  v19 = [v18 localizedStringForKey:@"SHARING_SET_UP_LATER" value:&stru_1ED8AC728 table:@"Localized"];
  [(OBLinkTrayButton *)v17 setTitle:v19 forState:0];

  [(OBLinkTrayButton *)self->_setupLaterButton addTarget:self action:sel_didTapSetupLater_ forControlEvents:64];
  v20 = [(CNSharingProfileOnboardingPosePickerController *)self buttonTray];
  [v20 addButton:self->_setupLaterButton];

  v60 = v14;
  v21 = [(CNOnboardingBoldButtonProvider *)v14 boldAlternateButton];
  backButton = self->_backButton;
  self->_backButton = v21;

  v23 = self->_backButton;
  v24 = CNContactsUIBundle();
  v25 = [v24 localizedStringForKey:@"SHARING_BACK" value:&stru_1ED8AC728 table:@"Localized"];
  [(OBBoldTrayButton *)v23 setTitle:v25 forState:0];

  [(OBBoldTrayButton *)self->_backButton addTarget:self action:sel_didTapBack_ forControlEvents:64];
  v26 = [(CNSharingProfileOnboardingPosePickerController *)self buttonTray];
  [v26 addButton:self->_backButton];

  v27 = [(CNOnboardingBoldButtonProvider *)v14 boldButton];
  nextButton = self->_nextButton;
  self->_nextButton = v27;

  v29 = self->_nextButton;
  v30 = CNContactsUIBundle();
  v31 = [v30 localizedStringForKey:@"SHARING_CONTINUE" value:&stru_1ED8AC728 table:@"Localized"];
  [(OBBoldTrayButton *)v29 setTitle:v31 forState:0];

  [(OBBoldTrayButton *)self->_nextButton addTarget:self action:sel_didTapContinue_ forControlEvents:64];
  v32 = [(CNSharingProfileOnboardingPosePickerController *)self buttonTray];
  [v32 addButton:self->_nextButton];

  v59 = [(CNPhotoPickerVariantListController *)self->_variantListController view];
  v57 = [v59 leadingAnchor];
  v58 = [(CNSharingProfileOnboardingPosePickerController *)self contentView];
  v56 = [v58 leadingAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v63[0] = v55;
  v54 = [(CNPhotoPickerVariantListController *)self->_variantListController view];
  v52 = [v54 trailingAnchor];
  v53 = [(CNSharingProfileOnboardingPosePickerController *)self contentView];
  v50 = [v53 trailingAnchor];
  v49 = [v52 constraintEqualToAnchor:v50];
  v63[1] = v49;
  v48 = [(CNPhotoPickerVariantListController *)self->_variantListController view];
  v33 = [v48 topAnchor];
  v34 = [(CNSharingProfileOnboardingPosePickerController *)self contentView];
  v35 = [v34 topAnchor];
  v36 = [v33 constraintEqualToAnchor:v35];
  v63[2] = v36;
  v37 = [(CNPhotoPickerVariantListController *)self->_variantListController view];
  v38 = [v37 bottomAnchor];
  v39 = [(CNSharingProfileOnboardingPosePickerController *)self contentView];
  v40 = [v39 bottomAnchor];
  v41 = [v38 constraintEqualToAnchor:v40];
  v63[3] = v41;
  v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:4];

  v42 = [(CNPhotoPickerVariantListController *)self->_variantListController view];
  v43 = [v42 heightAnchor];
  v44 = [v43 constraintEqualToConstant:200.0];
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v44;

  v46 = (void *)MEMORY[0x1E4F28DC8];
  v47 = [v51 arrayByAddingObject:self->_heightConstraint];
  [v46 activateConstraints:v47];
}

uint64_t __61__CNSharingProfileOnboardingPosePickerController_viewDidLoad__block_invoke()
{
  return 4;
}

- (CNSharingProfileOnboardingPosePickerController)initWithAvatarRecord:(id)a3 variantsManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = CNContactsUIBundle();
  v10 = [v9 localizedStringForKey:@"SHARING_CHOOSE_YOUR_POSE" value:&stru_1ED8AC728 table:@"Localized"];
  v14.receiver = self;
  v14.super_class = (Class)CNSharingProfileOnboardingPosePickerController;
  v11 = [(CNSharingProfileOnboardingPosePickerController *)&v14 initWithTitle:v10 detailText:0 icon:0];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_avatarRecord, a3);
    objc_storeStrong((id *)&v11->_variantsManager, a4);
    v12 = v11;
  }

  return v11;
}

@end