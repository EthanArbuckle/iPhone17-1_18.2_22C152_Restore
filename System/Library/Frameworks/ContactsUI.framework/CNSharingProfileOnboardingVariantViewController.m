@interface CNSharingProfileOnboardingVariantViewController
- (BOOL)shouldShowPoseButton;
- (CNPhotoPickerProviderItem)item;
- (CNPhotoPickerProviderItem)selectedItem;
- (CNPhotoPickerVariantListController)variantListController;
- (CNPhotoPickerVariantsManager)variantsManager;
- (CNSharingProfileOnboardingVariantViewController)initWithVariantsManager:(id)a3 originalItem:(id)a4 selectedVariantIdentifier:(id)a5;
- (CNSharingProfileOnboardingVariantViewControllerDelegate)onboardingDelegate;
- (NSLayoutConstraint)heightLayoutConstraint;
- (NSString)variantName;
- (OBBoldTrayButton)backButton;
- (OBBoldTrayButton)continueButton;
- (OBLinkTrayButton)poseButton;
- (OBLinkTrayButton)setupLaterButton;
- (void)didTapBack:(id)a3;
- (void)didTapContinue:(id)a3;
- (void)didTapPose:(id)a3;
- (void)didTapSetupLater:(id)a3;
- (void)photoPickerVariantListController:(id)a3 didSelectProviderItem:(id)a4;
- (void)setBackButton:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setHeightLayoutConstraint:(id)a3;
- (void)setItem:(id)a3;
- (void)setOnboardingDelegate:(id)a3;
- (void)setPoseButton:(id)a3;
- (void)setSelectedItem:(id)a3;
- (void)setSetupLaterButton:(id)a3;
- (void)setShouldShowPoseButton:(BOOL)a3;
- (void)setVariantListController:(id)a3;
- (void)setVariantName:(id)a3;
- (void)setVariantsManager:(id)a3;
- (void)updateOriginalItem:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CNSharingProfileOnboardingVariantViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_poseButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_setupLaterButton, 0);
  objc_storeStrong((id *)&self->_variantListController, 0);
  objc_storeStrong((id *)&self->_variantName, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_selectedItem, 0);

  objc_destroyWeak((id *)&self->_onboardingDelegate);
}

- (void)setHeightLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)heightLayoutConstraint
{
  return self->_heightLayoutConstraint;
}

- (void)setPoseButton:(id)a3
{
}

- (OBLinkTrayButton)poseButton
{
  return self->_poseButton;
}

- (void)setContinueButton:(id)a3
{
}

- (OBBoldTrayButton)continueButton
{
  return self->_continueButton;
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

- (void)setVariantName:(id)a3
{
}

- (NSString)variantName
{
  return self->_variantName;
}

- (void)setItem:(id)a3
{
}

- (CNPhotoPickerProviderItem)item
{
  return self->_item;
}

- (void)setVariantsManager:(id)a3
{
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setSelectedItem:(id)a3
{
}

- (CNPhotoPickerProviderItem)selectedItem
{
  return self->_selectedItem;
}

- (void)setShouldShowPoseButton:(BOOL)a3
{
  self->_shouldShowPoseButton = a3;
}

- (BOOL)shouldShowPoseButton
{
  return self->_shouldShowPoseButton;
}

- (void)setOnboardingDelegate:(id)a3
{
}

- (CNSharingProfileOnboardingVariantViewControllerDelegate)onboardingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_onboardingDelegate);

  return (CNSharingProfileOnboardingVariantViewControllerDelegate *)WeakRetained;
}

- (void)photoPickerVariantListController:(id)a3 didSelectProviderItem:(id)a4
{
  objc_storeStrong((id *)&self->_selectedItem, a4);
  id v5 = [(CNSharingProfileOnboardingVariantViewController *)self onboardingDelegate];
  [v5 onboardingVariantControllerDidTapContinue:self];
}

- (void)didTapBack:(id)a3
{
  id v4 = [(CNSharingProfileOnboardingVariantViewController *)self onboardingDelegate];
  [v4 onboardingVariantControllerDidTapBack:self];
}

- (void)didTapPose:(id)a3
{
  id v4 = [(CNSharingProfileOnboardingVariantViewController *)self onboardingDelegate];
  [v4 onboardingVariantControllerDidTapPose:self];
}

- (void)didTapContinue:(id)a3
{
  id v3 = [(CNSharingProfileOnboardingVariantViewController *)self variantListController];
  [v3 didFinishSelectingVariant];
}

- (void)didTapSetupLater:(id)a3
{
  id v4 = [(CNSharingProfileOnboardingVariantViewController *)self onboardingDelegate];
  [v4 onboardingVariantControllerDidTapSetupLater:self];
}

- (void)updateOriginalItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CNSharingProfileOnboardingVariantViewController *)self variantListController];
  [v5 updateForNewOriginalItem:v4];
}

- (void)viewDidLayoutSubviews
{
  id v3 = [(CNSharingProfileOnboardingVariantViewController *)self variantListController];
  id v4 = [v3 collectionView];
  [v4 contentSize];
  double v6 = v5;
  v7 = [(CNSharingProfileOnboardingVariantViewController *)self heightLayoutConstraint];
  [v7 setConstant:v6];

  v8.receiver = self;
  v8.super_class = (Class)CNSharingProfileOnboardingVariantViewController;
  [(OBBaseWelcomeController *)&v8 viewDidLayoutSubviews];
}

- (void)viewDidLoad
{
  v58[4] = *MEMORY[0x1E4F143B8];
  v57.receiver = self;
  v57.super_class = (Class)CNSharingProfileOnboardingVariantViewController;
  [(OBBaseWelcomeController *)&v57 viewDidLoad];
  id v3 = [CNPhotoPickerVariantListController alloc];
  id v4 = [(CNSharingProfileOnboardingVariantViewController *)self variantsManager];
  double v5 = [(CNSharingProfileOnboardingVariantViewController *)self item];
  double v6 = [(CNSharingProfileOnboardingVariantViewController *)self variantName];
  v7 = [(CNPhotoPickerVariantListController *)v3 initWithVariantsManager:v4 originalItem:v5 selectedVariantIdentifier:v6];
  variantListController = self->_variantListController;
  self->_variantListController = v7;

  [(CNPhotoPickerVariantListController *)self->_variantListController setDelegate:self];
  v9 = [(CNPhotoPickerVariantListController *)self->_variantListController view];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = [(CNPhotoPickerVariantListController *)self->_variantListController collectionView];
  [v10 setShowsVerticalScrollIndicator:0];

  v11 = [(CNPhotoPickerVariantListController *)self->_variantListController collectionView];
  [v11 setShowsHorizontalScrollIndicator:0];

  v12 = [(CNPhotoPickerVariantListController *)self->_variantListController collectionView];
  [v12 setScrollEnabled:0];

  v13 = [(CNSharingProfileOnboardingVariantViewController *)self contentView];
  v14 = [(CNPhotoPickerVariantListController *)self->_variantListController view];
  [v13 addSubview:v14];

  [(CNSharingProfileOnboardingVariantViewController *)self addChildViewController:self->_variantListController];
  [(CNPhotoPickerVariantListController *)self->_variantListController didMoveToParentViewController:self];
  v56 = [(CNPhotoPickerVariantListController *)self->_variantListController view];
  v54 = [v56 topAnchor];
  v55 = [(CNSharingProfileOnboardingVariantViewController *)self contentView];
  v53 = [v55 topAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v58[0] = v52;
  v51 = [(CNPhotoPickerVariantListController *)self->_variantListController view];
  v49 = [v51 bottomAnchor];
  v50 = [(CNSharingProfileOnboardingVariantViewController *)self contentView];
  v48 = [v50 bottomAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v58[1] = v47;
  v46 = [(CNPhotoPickerVariantListController *)self->_variantListController view];
  v44 = [v46 leadingAnchor];
  v45 = [(CNSharingProfileOnboardingVariantViewController *)self contentView];
  v15 = [v45 leadingAnchor];
  v16 = [v44 constraintEqualToAnchor:v15];
  v58[2] = v16;
  v17 = [(CNPhotoPickerVariantListController *)self->_variantListController view];
  v18 = [v17 trailingAnchor];
  v19 = [(CNSharingProfileOnboardingVariantViewController *)self contentView];
  v20 = [v19 trailingAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  v58[3] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:4];

  v23 = [(CNPhotoPickerVariantListController *)self->_variantListController view];
  v24 = [v23 heightAnchor];
  v25 = [v24 constraintEqualToConstant:200.0];
  heightLayoutConstraint = self->_heightLayoutConstraint;
  self->_heightLayoutConstraint = v25;

  [(NSLayoutConstraint *)self->_heightLayoutConstraint setActive:1];
  [MEMORY[0x1E4F28DC8] activateConstraints:v22];
  v27 = objc_alloc_init(CNOnboardingBoldButtonProvider);
  v28 = [(CNOnboardingBoldButtonProvider *)v27 boldButton];
  continueButton = self->_continueButton;
  self->_continueButton = v28;

  v30 = self->_continueButton;
  v31 = CNContactsUIBundle();
  v32 = [v31 localizedStringForKey:@"SHARING_CONTINUE" value:&stru_1ED8AC728 table:@"Localized"];
  [(OBBoldTrayButton *)v30 setTitle:v32 forState:0];

  [(OBBoldTrayButton *)self->_continueButton addTarget:self action:sel_didTapContinue_ forControlEvents:64];
  v33 = [(CNSharingProfileOnboardingVariantViewController *)self buttonTray];
  [v33 addButton:self->_continueButton];

  if (self->_shouldShowPoseButton)
  {
    v34 = [MEMORY[0x1E4F83AB0] linkButton];
    poseButton = self->_poseButton;
    self->_poseButton = v34;

    v36 = self->_poseButton;
    v37 = CNContactsUIBundle();
    v38 = [v37 localizedStringForKey:@"SHARING_STRIKE_YOUR_POSE" value:&stru_1ED8AC728 table:@"Localized"];
    [(OBLinkTrayButton *)v36 setTitle:v38 forState:0];

    [(OBLinkTrayButton *)self->_poseButton addTarget:self action:sel_didTapPose_ forControlEvents:64];
    v39 = [(CNSharingProfileOnboardingVariantViewController *)self buttonTray];
    [v39 addButton:self->_poseButton];
  }
  v40 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v41 = [(CNSharingProfileOnboardingVariantViewController *)self view];
  [v41 setBackgroundColor:v40];

  v42 = [(OBBaseWelcomeController *)self navigationItem];
  [v42 setLeftBarButtonItem:0];

  v43 = [(OBBaseWelcomeController *)self navigationItem];
  [v43 setRightBarButtonItem:0];
}

- (CNSharingProfileOnboardingVariantViewController)initWithVariantsManager:(id)a3 originalItem:(id)a4 selectedVariantIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v10 localizedVariantsTitle];
  v16.receiver = self;
  v16.super_class = (Class)CNSharingProfileOnboardingVariantViewController;
  v13 = [(CNSharingProfileOnboardingVariantViewController *)&v16 initWithTitle:v12 detailText:0 icon:0];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_variantsManager, a3);
    objc_storeStrong((id *)&v13->_item, a4);
    objc_storeStrong((id *)&v13->_variantName, a5);
    v14 = v13;
  }

  return v13;
}

@end