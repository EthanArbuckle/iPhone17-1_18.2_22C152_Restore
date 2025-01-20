@interface CNSharingProfileOnboardingFlowManager
+ (id)descriptorForRequiredKeys;
- (AVTAvatarRecord)avatarRecord;
- (BOOL)didPersistToMeCard;
- (BOOL)isRunning;
- (BOOL)shouldAnimateNavTransitions;
- (CNAvatarEditingManager)avatarEditingManager;
- (CNContact)contact;
- (CNPhotoPickerProviderItem)selectedVariantItem;
- (CNPhotoPickerVariantsManager)variantsManager;
- (CNSharingProfileAvatarItemProviderConfiguration)avatarItemProviderConfiguration;
- (CNSharingProfileLogger)logger;
- (CNSharingProfileOnboardingAudienceController)audienceViewController;
- (CNSharingProfileOnboardingFlowManager)initWithNavigationController:(id)a3 contact:(id)a4 avatarRecord:(id)a5 avatarItemProviderConfiguration:(id)a6;
- (CNSharingProfileOnboardingFlowManager)initWithNavigationController:(id)a3 contact:(id)a4 avatarRecord:(id)a5 avatarItemProviderConfiguration:(id)a6 logger:(id)a7;
- (CNSharingProfileOnboardingFlowManagerDelegate)delegate;
- (CNSharingProfileOnboardingPhotoSelectionResult)photoSelectionResult;
- (CNSharingProfileOnboardingPhotoSelectionViewController)photoSelectionController;
- (CNSharingProfileOnboardingPosePickerController)posePickerController;
- (CNSharingProfileOnboardingVariantViewController)variantController;
- (UINavigationController)navigationController;
- (id)mutableContactForResult:(id)a3;
- (id)prepareVariantsControllerForResult:(id)a3;
- (id)providerItemForPhotoResult:(id)a3;
- (unint64_t)imageTypeForAvatarType:(int64_t)a3;
- (void)audienceController:(id)a3 didFinishWithContact:(id)a4 sharingAudience:(unint64_t)a5;
- (void)avatarEditingManager:(id)a3 didFinishWithProviderItem:(id)a4;
- (void)notifyDelegateOfSetupLaterSelected;
- (void)onboardingVariantControllerDidTapBack:(id)a3;
- (void)onboardingVariantControllerDidTapContinue:(id)a3;
- (void)performSaveToMeCardAction;
- (void)photoSelectionViewControllerDidFinishWithResult:(id)a3;
- (void)posePickerController:(id)a3 didFinishWithProviderItem:(id)a4;
- (void)posePickerControllerDidSelectBack:(id)a3;
- (void)posePickerControllerDidSelectSetupLater:(id)a3;
- (void)presentAnimojiPoseCapture;
- (void)presentMeCardAlertForResult:(id)a3;
- (void)presentMeCardPersistanceAlertIfNeededWithCompletionBlock:(id)a3;
- (void)presentNameAndAudienceControllerForContact:(id)a3;
- (void)saveCurrentInfoToMeCard;
- (void)setAudienceViewController:(id)a3;
- (void)setAvatarEditingManager:(id)a3;
- (void)setAvatarItemProviderConfiguration:(id)a3;
- (void)setAvatarRecord:(id)a3;
- (void)setContact:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidPersistToMeCard:(BOOL)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)setLogger:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setPhotoSelectionController:(id)a3;
- (void)setPhotoSelectionResult:(id)a3;
- (void)setPosePickerController:(id)a3;
- (void)setSelectedVariantItem:(id)a3;
- (void)setShouldAnimateNavTransitions:(BOOL)a3;
- (void)setVariantController:(id)a3;
- (void)setVariantsManager:(id)a3;
- (void)startFlow;
@end

@implementation CNSharingProfileOnboardingFlowManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_avatarEditingManager, 0);
  objc_storeStrong((id *)&self->_selectedVariantItem, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_photoSelectionResult, 0);
  objc_storeStrong((id *)&self->_audienceViewController, 0);
  objc_storeStrong((id *)&self->_variantController, 0);
  objc_storeStrong((id *)&self->_posePickerController, 0);
  objc_storeStrong((id *)&self->_photoSelectionController, 0);
  objc_storeStrong((id *)&self->_avatarItemProviderConfiguration, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setLogger:(id)a3
{
}

- (CNSharingProfileLogger)logger
{
  return self->_logger;
}

- (void)setAvatarEditingManager:(id)a3
{
}

- (CNAvatarEditingManager)avatarEditingManager
{
  return self->_avatarEditingManager;
}

- (void)setSelectedVariantItem:(id)a3
{
}

- (CNPhotoPickerProviderItem)selectedVariantItem
{
  return self->_selectedVariantItem;
}

- (void)setVariantsManager:(id)a3
{
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setPhotoSelectionResult:(id)a3
{
}

- (CNSharingProfileOnboardingPhotoSelectionResult)photoSelectionResult
{
  return self->_photoSelectionResult;
}

- (void)setAudienceViewController:(id)a3
{
}

- (CNSharingProfileOnboardingAudienceController)audienceViewController
{
  return self->_audienceViewController;
}

- (void)setVariantController:(id)a3
{
}

- (CNSharingProfileOnboardingVariantViewController)variantController
{
  return self->_variantController;
}

- (void)setPosePickerController:(id)a3
{
}

- (CNSharingProfileOnboardingPosePickerController)posePickerController
{
  return self->_posePickerController;
}

- (void)setPhotoSelectionController:(id)a3
{
}

- (CNSharingProfileOnboardingPhotoSelectionViewController)photoSelectionController
{
  return self->_photoSelectionController;
}

- (void)setDidPersistToMeCard:(BOOL)a3
{
  self->_didPersistToMeCard = a3;
}

- (BOOL)didPersistToMeCard
{
  return self->_didPersistToMeCard;
}

- (void)setAvatarItemProviderConfiguration:(id)a3
{
}

- (CNSharingProfileAvatarItemProviderConfiguration)avatarItemProviderConfiguration
{
  return self->_avatarItemProviderConfiguration;
}

- (void)setAvatarRecord:(id)a3
{
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setNavigationController:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setShouldAnimateNavTransitions:(BOOL)a3
{
  self->_shouldAnimateNavTransitions = a3;
}

- (BOOL)shouldAnimateNavTransitions
{
  return self->_shouldAnimateNavTransitions;
}

- (void)setDelegate:(id)a3
{
}

- (CNSharingProfileOnboardingFlowManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNSharingProfileOnboardingFlowManagerDelegate *)WeakRetained;
}

- (void)audienceController:(id)a3 didFinishWithContact:(id)a4 sharingAudience:(unint64_t)a5
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__CNSharingProfileOnboardingFlowManager_audienceController_didFinishWithContact_sharingAudience___block_invoke;
  aBlock[3] = &unk_1E549A010;
  id v11 = v7;
  v12 = self;
  unint64_t v13 = a5;
  id v8 = v7;
  v9 = (void (**)(void))_Block_copy(aBlock);
  v9[2]();
}

void __97__CNSharingProfileOnboardingFlowManager_audienceController_didFinishWithContact_sharingAudience___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v10 = objc_alloc_init(CNSharingProfileOnboardingFlowResult);
    v2 = [*(id *)(a1 + 32) imageData];
    uint64_t v3 = [v2 length];

    if (!v3)
    {
      if ([*(id *)(a1 + 32) rawImageType])
      {
        if ([*(id *)(a1 + 32) rawImageType] != 2) {
          [*(id *)(*(void *)(a1 + 40) + 120) logOnboardingReturningEmptyImage];
        }
      }
      else
      {
        [*(id *)(*(void *)(a1 + 40) + 120) logOnboardingReturningDefaultMonogram];
      }
    }
    v4 = [*(id *)(a1 + 32) imageData];
    [(CNSharingProfileOnboardingFlowResult *)v10 setImageData:v4];

    [*(id *)(a1 + 32) cropRect];
    -[CNSharingProfileOnboardingFlowResult setCropRect:](v10, "setCropRect:");
    v5 = [*(id *)(a1 + 32) givenName];
    [(CNSharingProfileOnboardingFlowResult *)v10 setGivenName:v5];

    v6 = [*(id *)(a1 + 32) familyName];
    [(CNSharingProfileOnboardingFlowResult *)v10 setFamilyName:v6];

    id v7 = [*(id *)(a1 + 32) wallpaper];
    [(CNSharingProfileOnboardingFlowResult *)v10 setWallpaper:v7];

    [(CNSharingProfileOnboardingFlowResult *)v10 setSharingAudience:*(void *)(a1 + 48)];
    [(CNSharingProfileOnboardingFlowResult *)v10 setDidPersistImageToContact:*(unsigned __int8 *)(*(void *)(a1 + 40) + 10)];
    id v8 = [*(id *)(a1 + 40) delegate];
    [v8 flowManager:*(void *)(a1 + 40) didFinishWithResult:v10];
  }
  else
  {
    id v9 = (id)[*(id *)(*(void *)(a1 + 40) + 24) popViewControllerAnimated:*(unsigned __int8 *)(*(void *)(a1 + 40) + 8)];
  }
}

- (void)avatarEditingManager:(id)a3 didFinishWithProviderItem:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v6)
  {
    objc_storeStrong((id *)&self->_selectedVariantItem, a4);
    id v7 = [(CNSharingProfileOnboardingFlowManager *)self variantController];
    [v7 updateOriginalItem:v6];
  }
  id v8 = [v9 viewController];
  [v8 dismissViewControllerAnimated:1 completion:0];
}

- (void)posePickerControllerDidSelectSetupLater:(id)a3
{
  id v4 = [(CNSharingProfileOnboardingFlowManager *)self delegate];
  [v4 flowManagerDidSelectSetupLater:self];
}

- (void)posePickerControllerDidSelectBack:(id)a3
{
  id v5 = [(CNSharingProfileOnboardingFlowManager *)self navigationController];
  id v4 = (id)[v5 popViewControllerAnimated:self->_shouldAnimateNavTransitions];
}

- (void)posePickerController:(id)a3 didFinishWithProviderItem:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  if (!self->_variantsManager)
  {
    id v7 = objc_alloc_init(CNPhotoPickerVariantsManager);
    variantsManager = self->_variantsManager;
    self->_variantsManager = v7;
  }
  id v9 = (void *)MEMORY[0x1E4FB1818];
  v10 = [v6 imageData];
  id v11 = [v9 imageWithData:v10];

  v12 = +[CNAvatarImageUtilities croppedAndCenteredAvatarImageForImage:v11 widthMultiplier:1.0];
  unint64_t v13 = UIImagePNGRepresentation(v12);
  v14 = [CNPhotoPickerAnimojiProviderItem alloc];
  v15 = -[CNPhotoPickerAnimojiProviderItem initWithOriginalImageData:cropRect:](v14, "initWithOriginalImageData:cropRect:", v13, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  objc_opt_class();
  id v16 = v6;
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  if (v18)
  {
    v19 = [v18 avatarRecord];
    [(CNPhotoPickerAnimojiProviderItem *)v15 setAvatarRecord:v19];

    v20 = [v18 poseConfiguration];
    [(CNPhotoPickerAnimojiProviderItem *)v15 setPoseConfiguration:v20];

    [v18 edgeInsets];
    -[CNPhotoPickerAnimojiProviderItem setEdgeInsets:](v15, "setEdgeInsets:");
    [v18 originalImageSize];
    -[CNPhotoPickerAnimojiProviderItem setOriginalImageSize:](v15, "setOriginalImageSize:");
  }
  else
  {
    [(CNSharingProfileLogger *)self->_logger logOnboardingReturningNonAnimojiItem];
  }
  v21 = [[CNSharingProfileOnboardingVariantViewController alloc] initWithVariantsManager:self->_variantsManager originalItem:v15 selectedVariantIdentifier:0];
  objc_storeStrong((id *)&self->_variantController, v21);
  variantController = self->_variantController;
  if (variantController)
  {
    [(CNSharingProfileOnboardingVariantViewController *)variantController setOnboardingDelegate:self];
    [(UINavigationController *)self->_navigationController pushViewController:self->_variantController animated:self->_shouldAnimateNavTransitions];
  }
}

- (void)onboardingVariantControllerDidTapContinue:(id)a3
{
  id v4 = [a3 selectedItem];
  selectedVariantItem = self->_selectedVariantItem;
  self->_selectedVariantItem = v4;

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__CNSharingProfileOnboardingFlowManager_onboardingVariantControllerDidTapContinue___block_invoke;
  v6[3] = &unk_1E549B488;
  v6[4] = self;
  [(CNSharingProfileOnboardingFlowManager *)self presentMeCardPersistanceAlertIfNeededWithCompletionBlock:v6];
}

void __83__CNSharingProfileOnboardingFlowManager_onboardingVariantControllerDidTapContinue___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 32) mutableCopy];
  [*(id *)(*(void *)(a1 + 32) + 104) updateContact:v2];
  [*(id *)(a1 + 32) presentNameAndAudienceControllerForContact:v2];
}

- (void)onboardingVariantControllerDidTapBack:(id)a3
{
  id v3 = [(UINavigationController *)self->_navigationController popViewControllerAnimated:self->_shouldAnimateNavTransitions];
}

- (id)mutableContactForResult:(id)a3
{
  id v4 = [a3 compositedImage];
  id v5 = UIImagePNGRepresentation(v4);
  id v6 = (void *)[(CNContact *)self->_contact mutableCopy];
  [v6 setImageData:v5];
  objc_msgSend(v6, "setCropRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v6 setThumbnailImageData:v5];

  return v6;
}

- (void)presentMeCardAlertForResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__CNSharingProfileOnboardingFlowManager_presentMeCardAlertForResult___block_invoke;
  v6[3] = &unk_1E549BF80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CNSharingProfileOnboardingFlowManager *)self presentMeCardPersistanceAlertIfNeededWithCompletionBlock:v6];
}

void __69__CNSharingProfileOnboardingFlowManager_presentMeCardAlertForResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mutableContactForResult:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) presentNameAndAudienceControllerForContact:v2];
}

- (void)photoSelectionViewControllerDidFinishWithResult:(id)a3
{
  id v10 = a3;
  if (v10)
  {
    objc_storeStrong((id *)&self->_photoSelectionResult, a3);
    selectedVariantItem = self->_selectedVariantItem;
    self->_selectedVariantItem = 0;

    if ([v10 wasSelectedInFullPhotoPicker]
      || ([(CNSharingProfileOnboardingFlowManager *)self prepareVariantsControllerForResult:v10], v6 = (CNSharingProfileOnboardingVariantViewController *)objc_claimAutoreleasedReturnValue(), variantController = self->_variantController, self->_variantController = v6, variantController, (id v8 = self->_variantController) == 0))
    {
      [(CNSharingProfileOnboardingFlowManager *)self presentMeCardAlertForResult:v10];
    }
    else
    {
      [(CNSharingProfileOnboardingVariantViewController *)v8 setOnboardingDelegate:self];
      -[CNSharingProfileOnboardingVariantViewController setShouldShowPoseButton:](self->_variantController, "setShouldShowPoseButton:", [v10 avatarType] == 2);
      [(UINavigationController *)self->_navigationController pushViewController:self->_variantController animated:self->_shouldAnimateNavTransitions];
    }
  }
  else
  {
    id v9 = [(UINavigationController *)self->_navigationController popViewControllerAnimated:self->_shouldAnimateNavTransitions];
  }
}

- (void)notifyDelegateOfSetupLaterSelected
{
  id v3 = [(CNSharingProfileOnboardingFlowManager *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CNSharingProfileOnboardingFlowManager *)self delegate];
    [v5 flowManagerDidSelectSetupLater:self];
  }
}

- (void)presentAnimojiPoseCapture
{
  id v3 = [[CNAvatarEditingManager alloc] initWithAvatarRecord:self->_avatarRecord variantsManager:self->_variantsManager];
  avatarEditingManager = self->_avatarEditingManager;
  self->_avatarEditingManager = v3;

  id v5 = [CNPhotoPickerNavigationViewController alloc];
  id v6 = [(CNAvatarEditingManager *)self->_avatarEditingManager viewController];
  v15 = [(CNPhotoPickerNavigationViewController *)v5 initWithRootViewController:v6];

  [(CNAvatarEditingManager *)self->_avatarEditingManager setDelegate:self];
  id v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  id v8 = [(CNAvatarEditingManager *)self->_avatarEditingManager viewController];
  id v9 = [v8 view];
  [v9 setBackgroundColor:v7];

  +[CNVisualIdentityPickerViewController defaultContentSize];
  double v11 = v10;
  double v13 = v12;
  v14 = [(CNAvatarEditingManager *)self->_avatarEditingManager viewController];
  objc_msgSend(v14, "setPreferredContentSize:", v11, v13);

  [(UINavigationController *)self->_navigationController presentViewController:v15 animated:1 completion:0];
}

- (void)presentNameAndAudienceControllerForContact:(id)a3
{
  id v4 = a3;
  id v5 = [[CNSharingProfileOnboardingAudienceViewController alloc] initWithContact:v4 selectedSharingAudience:1];

  [(CNSharingProfileOnboardingAudienceViewController *)v5 setDelegate:self];
  audienceViewController = self->_audienceViewController;
  self->_audienceViewController = (CNSharingProfileOnboardingAudienceController *)v5;
  id v7 = v5;

  [(UINavigationController *)self->_navigationController pushViewController:v7 animated:self->_shouldAnimateNavTransitions];
}

- (void)saveCurrentInfoToMeCard
{
  v101[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  id v5 = (void *)[(CNContact *)self->_contact mutableCopy];
  selectedVariantItem = self->_selectedVariantItem;
  if (selectedVariantItem)
  {
    [(CNPhotoPickerProviderItem *)selectedVariantItem updateContact:v5];
  }
  else
  {
    id v7 = [(CNSharingProfileOnboardingPhotoSelectionResult *)self->_photoSelectionResult compositedImage];
    id v8 = UIImagePNGRepresentation(v7);

    [v5 setImageData:v8];
    [v5 setThumbnailImageData:v8];
    id v9 = objc_msgSend(v8, "_cn_md5Hash");
    [v5 setImageHash:v9];

    objc_msgSend(v5, "setCropRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    objc_msgSend(v5, "updateImageInfoWithType:", -[CNSharingProfileOnboardingFlowManager imageTypeForAvatarType:](self, "imageTypeForAvatarType:", -[CNSharingProfileOnboardingPhotoSelectionResult avatarType](self->_photoSelectionResult, "avatarType")));
    double v10 = [(CNSharingProfileOnboardingPhotoSelectionResult *)self->_photoSelectionResult memojiMetadata];
    [v5 setMemojiMetadata:v10];
  }
  if ([v5 hasBeenPersisted])
  {
    BOOL v11 = [(CNContact *)self->_contact rawImageType] != 1
       && [(CNContact *)self->_contact rawImageType] != 0;
    BOOL v16 = [(CNSharingProfileOnboardingPhotoSelectionResult *)self->_photoSelectionResult wasSelectedInFullPhotoPicker];
    if ([(CNContact *)self->_contact imageDataAvailable] && !v11 && !v16)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1B930]);
      id v18 = (void *)MEMORY[0x1E4F1B920];
      v19 = [(CNContact *)self->_contact identifier];
      v101[0] = v19;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:1];
      v21 = [v18 recentImagesRequestForContactIdenfitiers:v20];

      id v99 = 0;
      v22 = [v17 performFetchRequest:v21 error:&v99];
      id v23 = v99;
      v98[0] = MEMORY[0x1E4F143A8];
      v98[1] = 3221225472;
      v98[2] = __64__CNSharingProfileOnboardingFlowManager_saveCurrentInfoToMeCard__block_invoke;
      v98[3] = &unk_1E5499FC0;
      v98[4] = self;
      if ((objc_msgSend(v22, "_cn_any:", v98) & 1) == 0)
      {
        id v85 = v23;
        v87 = v21;
        id v89 = v3;
        logger = self->_logger;
        v25 = [(CNContact *)self->_contact identifier];
        [(CNSharingProfileLogger *)logger logOnboardingSavingMeCardImageToRecentsForIdentifier:v25];

        id v26 = objc_alloc(MEMORY[0x1E4F1B918]);
        v27 = [(CNContact *)self->_contact imageData];
        [(CNContact *)self->_contact cropRect];
        double v29 = v28;
        double v31 = v30;
        double v33 = v32;
        double v35 = v34;
        v36 = [MEMORY[0x1E4F1C9C8] date];
        v37 = objc_msgSend(v26, "initWithImageData:cropRect:lastUsedDate:", v27, v36, v29, v31, v33, v35);

        v38 = (void *)MEMORY[0x1E4F1B928];
        v39 = [(CNContact *)self->_contact identifier];
        v40 = [v38 saveRequestToCreateImage:v37 forContactIdentifier:v39];

        id v97 = 0;
        id v41 = v17;
        char v42 = [v17 performSaveRequest:v40 error:&v97];
        id v43 = v97;
        v44 = v43;
        v45 = self->_logger;
        if (v42)
        {
          [(CNSharingProfileLogger *)self->_logger logOnboardingSuccessSavingMeCardImageToRecents];
        }
        else
        {
          v52 = [v43 localizedDescription];
          [(CNSharingProfileLogger *)v45 logOnboardingErrorSavingMeCardImageToRecentsWithDescription:v52];
        }
        v21 = v87;
        id v3 = v89;
        id v17 = v41;
        id v23 = v85;
      }
    }
    v53 = [(CNContact *)self->_contact wallpaper];
    v54 = [v53 posterArchiveData];

    if (v54)
    {
      id v55 = objc_alloc_init(MEMORY[0x1E4F1B968]);
      v56 = (void *)MEMORY[0x1E4F1B958];
      v57 = [(CNContact *)self->_contact identifier];
      v100 = v57;
      v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
      v59 = [v56 recentPostersRequestForContactIdenfitiers:v58];

      id v96 = 0;
      v60 = [v55 performFetchRequest:v59 error:&v96];
      id v61 = v96;
      v95[0] = MEMORY[0x1E4F143A8];
      v95[1] = 3221225472;
      v95[2] = __64__CNSharingProfileOnboardingFlowManager_saveCurrentInfoToMeCard__block_invoke_2;
      v95[3] = &unk_1E5499FE8;
      v95[4] = self;
      if ((objc_msgSend(v60, "_cn_any:", v95) & 1) == 0)
      {
        id v84 = v61;
        v86 = v59;
        id v90 = v3;
        v62 = self->_logger;
        v63 = [(CNContact *)self->_contact identifier];
        [(CNSharingProfileLogger *)v62 logOnboardingSavingMeCardPosterToRecentsForIdentifier:v63];

        id v64 = objc_alloc(MEMORY[0x1E4F1B950]);
        v65 = [MEMORY[0x1E4F29128] UUID];
        v66 = [v65 UUIDString];
        v67 = [(CNContact *)self->_contact wallpaper];
        v68 = [v67 posterArchiveData];
        [MEMORY[0x1E4F1C9C8] date];
        v69 = v88 = v55;
        uint64_t v70 = [v64 initWithIdentifier:v66 posterData:v68 lastUsedDate:v69];

        v71 = (void *)v70;
        v72 = (void *)MEMORY[0x1E4F1B960];
        v73 = [(CNContact *)self->_contact identifier];
        v74 = [v72 saveRequestToCreatePoster:v70 forContactIdentifier:v73];

        id v55 = v88;
        id v94 = 0;
        LOBYTE(v72) = [v88 performSaveRequest:v74 error:&v94];
        id v75 = v94;
        v76 = v75;
        v77 = self->_logger;
        if (v72)
        {
          [(CNSharingProfileLogger *)self->_logger logOnboardingSuccessSavingMeCardPosterToRecents];
        }
        else
        {
          v78 = [v75 localizedDescription];
          [(CNSharingProfileLogger *)v77 logOnboardingErrorSavingMeCardPosterToRecentsWithDescription:v78];
        }
        id v3 = v90;
        id v61 = v84;
        v59 = v86;
      }
    }
    v79 = self->_logger;
    v80 = [v5 identifier];
    [(CNSharingProfileLogger *)v79 logOnboardingUpdatingContactWithIdentifier:v80];

    [v4 updateContact:v5];
    id v93 = 0;
    LOBYTE(v79) = [v3 executeSaveRequest:v4 error:&v93];
    id v81 = v93;
    v14 = v81;
    v82 = self->_logger;
    if (v79)
    {
      [(CNSharingProfileLogger *)v82 logOnboardingSuccessSavingContact];
    }
    else
    {
      v83 = [v81 localizedDescription];
      [(CNSharingProfileLogger *)v82 logOnboardingErrorSavingContactWithDescription:v83];
    }
  }
  else
  {
    [(CNSharingProfileLogger *)self->_logger logOnboardingAddingContact];
    [v4 addContact:v5 toContainerWithIdentifier:0];
    id v92 = 0;
    char v12 = [v3 executeSaveRequest:v4 error:&v92];
    id v13 = v92;
    v14 = v13;
    v15 = self->_logger;
    if (v12)
    {
      [(CNSharingProfileLogger *)self->_logger logOnboardingSuccessSavingContact];
    }
    else
    {
      v46 = [v13 localizedDescription];
      [(CNSharingProfileLogger *)v15 logOnboardingErrorSavingContactWithDescription:v46];
    }
    id v91 = 0;
    char v47 = [v3 setMeContact:v5 error:&v91];
    id v48 = v91;
    v49 = v48;
    if ((v47 & 1) == 0)
    {
      v50 = self->_logger;
      v51 = [v48 localizedDescription];
      [(CNSharingProfileLogger *)v50 logOnboardingErrorSettingMeContactWithDescription:v51];
    }
  }
}

uint64_t __64__CNSharingProfileOnboardingFlowManager_saveCurrentInfoToMeCard__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 imageData];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 32) imageData];
  uint64_t v5 = [v3 isEqualToData:v4];

  return v5;
}

uint64_t __64__CNSharingProfileOnboardingFlowManager_saveCurrentInfoToMeCard__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 posterData];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 32) wallpaper];
  uint64_t v5 = [v4 posterArchiveData];
  uint64_t v6 = [v3 isEqualToData:v5];

  return v6;
}

- (unint64_t)imageTypeForAvatarType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return 0;
  }
  else {
    return qword_18B9C3840[a3 - 1];
  }
}

- (void)performSaveToMeCardAction
{
  [(CNSharingProfileOnboardingFlowManager *)self saveCurrentInfoToMeCard];

  [(CNSharingProfileOnboardingFlowManager *)self setDidPersistToMeCard:1];
}

- (void)presentMeCardPersistanceAlertIfNeededWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  uint64_t v6 = [v5 featureFlags];
  int v7 = [v6 isFeatureEnabled:15];

  if (v7)
  {
    [(CNSharingProfileOnboardingFlowManager *)self performSaveToMeCardAction];
    v4[2](v4);
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4FB1418];
    id v9 = CNContactsUIBundle();
    double v10 = [v9 localizedStringForKey:@"SHARING_UPDATE_ME_CARD_PROMPT_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
    BOOL v11 = CNContactsUIBundle();
    char v12 = [v11 localizedStringForKey:@"SHARING_UPDATE_ME_CARD_PROMPT_MESSAGE" value:&stru_1ED8AC728 table:@"Localized"];
    id v13 = [v8 alertControllerWithTitle:v10 message:v12 preferredStyle:1];

    v14 = (void *)MEMORY[0x1E4FB1410];
    v15 = CNContactsUIBundle();
    BOOL v16 = [v15 localizedStringForKey:@"SHARING_UPDATE_ME_CARD_PROMPT_CONFIRM" value:&stru_1ED8AC728 table:@"Localized"];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __98__CNSharingProfileOnboardingFlowManager_presentMeCardPersistanceAlertIfNeededWithCompletionBlock___block_invoke;
    v30[3] = &unk_1E5499F98;
    v30[4] = self;
    id v17 = v4;
    id v31 = v17;
    id v18 = [v14 actionWithTitle:v16 style:0 handler:v30];
    [v13 addAction:v18];

    v19 = (void *)MEMORY[0x1E4FB1410];
    v20 = CNContactsUIBundle();
    v21 = [v20 localizedStringForKey:@"SHARING_UPDATE_ME_CARD_PROMPT_CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    id v26 = __98__CNSharingProfileOnboardingFlowManager_presentMeCardPersistanceAlertIfNeededWithCompletionBlock___block_invoke_2;
    v27 = &unk_1E5499F98;
    double v28 = self;
    double v29 = v17;
    v22 = [v19 actionWithTitle:v21 style:1 handler:&v24];
    objc_msgSend(v13, "addAction:", v22, v24, v25, v26, v27, v28);

    id v23 = [(CNSharingProfileOnboardingFlowManager *)self navigationController];
    [v23 presentViewController:v13 animated:1 completion:0];
  }
}

uint64_t __98__CNSharingProfileOnboardingFlowManager_presentMeCardPersistanceAlertIfNeededWithCompletionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) performSaveToMeCardAction];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

uint64_t __98__CNSharingProfileOnboardingFlowManager_presentMeCardPersistanceAlertIfNeededWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 10) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)providerItemForPhotoResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 avatarType];
  switch(v5)
  {
    case 1:
      double v10 = [[CNVisualIdentity alloc] initWithContact:self->_contact];
      +[CNPhotoPickerMonogramProvider providerItemForVisualIdentity:size:RTL:](CNPhotoPickerMonogramProvider, "providerItemForVisualIdentity:size:RTL:", v10, [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1, 500.0, 500.0);
      id v9 = (CNPhotoPickerAnimojiProviderItem *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4:
      id v18 = [CNPhotoPickerProviderItem alloc];
      double v10 = [v4 originalImage];
      BOOL v16 = UIImageJPEGRepresentation((UIImage *)v10, 0.8);
      id v9 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:](v18, "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", v16, 0, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
LABEL_9:

      goto LABEL_10;
    case 2:
      uint64_t v6 = [CNPhotoPickerAnimojiProviderItem alloc];
      int v7 = [v4 originalImage];
      id v8 = UIImagePNGRepresentation(v7);
      id v9 = -[CNPhotoPickerAnimojiProviderItem initWithOriginalImageData:cropRect:](v6, "initWithOriginalImageData:cropRect:", v8, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

      double v10 = +[CNPhotoPickerVariantsManager sharingProfileAvatarPoseConfigurationForAvatarRecord:self->_avatarRecord];
      BOOL v11 = [v4 originalImage];
      +[CNAvatarImageUtilities transparencyInsetsForImage:v11 requiringFullOpacity:0];
      -[CNPhotoPickerAnimojiProviderItem setEdgeInsets:](v9, "setEdgeInsets:");

      char v12 = [v4 originalImage];
      [v12 size];
      -[CNPhotoPickerAnimojiProviderItem setOriginalImageSize:](v9, "setOriginalImageSize:");

      [(CNPhotoPickerAnimojiProviderItem *)v9 setPoseConfiguration:v10];
      id v13 = [v4 memojiMetadata];

      if (v13)
      {
        v14 = (void *)MEMORY[0x1E4F1BA30];
        v15 = [v4 memojiMetadata];
        BOOL v16 = [v14 memojiMetadataFromData:v15];

        if (v16)
        {
          id v17 = [v16 avatarRecord];
          [(CNPhotoPickerAnimojiProviderItem *)v9 setAvatarRecord:v17];
        }
        goto LABEL_9;
      }
LABEL_10:

      goto LABEL_12;
  }
  id v9 = 0;
LABEL_12:

  return v9;
}

- (id)prepareVariantsControllerForResult:(id)a3
{
  id v4 = a3;
  if (!self->_variantsManager)
  {
    uint64_t v5 = objc_alloc_init(CNPhotoPickerVariantsManager);
    variantsManager = self->_variantsManager;
    self->_variantsManager = v5;
  }
  int v7 = [(CNSharingProfileOnboardingFlowManager *)self providerItemForPhotoResult:v4];
  if (v7)
  {
    id v8 = [CNSharingProfileOnboardingVariantViewController alloc];
    id v9 = self->_variantsManager;
    double v10 = [v4 variantName];
    BOOL v11 = [(CNSharingProfileOnboardingVariantViewController *)v8 initWithVariantsManager:v9 originalItem:v7 selectedVariantIdentifier:v10];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)startFlow
{
  if (![(CNSharingProfileOnboardingFlowManager *)self isRunning])
  {
    [(CNSharingProfileOnboardingFlowManager *)self setIsRunning:1];
    id v3 = [[CNSharingProfileOnboardingPhotoSelectionViewController alloc] initWithContact:self->_contact avatarRecord:self->_avatarRecord avatarItemProviderConfiguration:self->_avatarItemProviderConfiguration];
    photoSelectionController = self->_photoSelectionController;
    self->_photoSelectionController = v3;

    [(CNSharingProfileOnboardingPhotoSelectionViewController *)self->_photoSelectionController setDelegate:self];
    navigationController = self->_navigationController;
    uint64_t v6 = self->_photoSelectionController;
    BOOL shouldAnimateNavTransitions = self->_shouldAnimateNavTransitions;
    [(UINavigationController *)navigationController pushViewController:v6 animated:shouldAnimateNavTransitions];
  }
}

- (CNSharingProfileOnboardingFlowManager)initWithNavigationController:(id)a3 contact:(id)a4 avatarRecord:(id)a5 avatarItemProviderConfiguration:(id)a6 logger:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CNSharingProfileOnboardingFlowManager;
  BOOL v16 = [(CNSharingProfileOnboardingFlowManager *)&v22 init];
  id v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_navigationController, a3);
    objc_storeStrong((id *)&v17->_contact, a4);
    objc_storeStrong((id *)&v17->_avatarRecord, a5);
    objc_storeStrong((id *)&v17->_avatarItemProviderConfiguration, a6);
    id v18 = objc_alloc_init(CNSharingProfileLogger);
    logger = v17->_logger;
    v17->_logger = v18;

    v17->_BOOL shouldAnimateNavTransitions = 1;
    v20 = v17;
  }

  return v17;
}

- (CNSharingProfileOnboardingFlowManager)initWithNavigationController:(id)a3 contact:(id)a4 avatarRecord:(id)a5 avatarItemProviderConfiguration:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(CNSharingProfileLogger);
  id v15 = [(CNSharingProfileOnboardingFlowManager *)self initWithNavigationController:v13 contact:v12 avatarRecord:v11 avatarItemProviderConfiguration:v10 logger:v14];

  return v15;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1_47463 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1_47463, &__block_literal_global_47464);
  }
  id v2 = (void *)descriptorForRequiredKeys_cn_once_object_1_47465;

  return v2;
}

void __66__CNSharingProfileOnboardingFlowManager_descriptorForRequiredKeys__block_invoke()
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v0 = +[CNSharingProfileOnboardingPhotoSelectionViewController descriptorForRequiredKeys];
  v7[0] = v0;
  v1 = +[CNSharingProfileOnboardingAudienceViewController descriptorForRequiredKeys];
  v7[1] = v1;
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  id v3 = (void *)MEMORY[0x1E4F1B8F8];
  id v4 = [NSString stringWithUTF8String:"+[CNSharingProfileOnboardingFlowManager descriptorForRequiredKeys]_block_invoke"];
  uint64_t v5 = [v3 descriptorWithKeyDescriptors:v2 description:v4];

  uint64_t v6 = (void *)descriptorForRequiredKeys_cn_once_object_1_47465;
  descriptorForRequiredKeys_cn_once_object_1_47465 = v5;
}

@end