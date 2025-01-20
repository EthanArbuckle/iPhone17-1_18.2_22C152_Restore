@interface CNSNaPSetupFlowManager
+ (id)descriptorForRequiredKeys;
+ (id)log;
- (BOOL)currentAvatarPosterPairIsBackedByRecents;
- (BOOL)isCreatingNewAvatar;
- (BOOL)isEditingContactCard;
- (BOOL)isOnboarding;
- (BOOL)multiplePhoneNumbersTiedToAppleID;
- (BOOL)shouldShowItemEditorForContactImage:(id)a3;
- (CNAvatarPosterCarouselEditingContext)avatarPosterEditingContext;
- (CNContactImage)currentContactImage;
- (CNContactImage)pendingRecentImage;
- (CNContactImageStore)contactImageStore;
- (CNContactPoster)currentContactPoster;
- (CNContactStore)contactStore;
- (CNMeCardSharingEditAvatarFlowManager)avatarEditFlowManager;
- (CNMutableContact)editingContact;
- (CNPRUISPosterSnapshotController)snapshotController;
- (CNPresenterDelegate)presenterDelegate;
- (CNSNaPSetupFlowManager)initWithBaseViewController:(id)a3 contactStore:(id)a4 mode:(int64_t)a5;
- (CNSNaPSetupFlowManager)initWithBaseViewController:(id)a3 contactStore:(id)a4 mode:(int64_t)a5 presenterDelegate:(id)a6;
- (CNSNaPSetupFlowManager)initWithPresenterDelegate:(id)a3 contactStore:(id)a4 mode:(int64_t)a5;
- (CNSNaPSetupFlowManagerDelegate)delegate;
- (CNScheduler)providerItemCallbackQueue;
- (CNScheduler)providerItemRenderingQueue;
- (CNVisualIdentity)pendingVisualIdentity;
- (CNVisualIdentityImagePickerController)imagePickerController;
- (UINavigationController)galleryNavigationController;
- (UINavigationController)onboardingWelcomeNavigationController;
- (UINavigationController)posterEditOptionsNavigationController;
- (UIViewController)baseViewController;
- (_TtC10ContactsUI22PosterEditFlowReporter)editFlowReporter;
- (id)contactPosterFromWallpaper:(id)a3;
- (id)posterEditOptionsNavigationControllerForContact:(id)a3;
- (id)posterOnboardingWelcomeNavigationControllerForContact:(id)a3 hasOptionToSkip:(BOOL)a4 hasExistingNickname:(BOOL)a5;
- (id)posterPreviewControllerWithPosterConfiguration:(id)a3 providerItem:(id)a4 mode:(int64_t)a5;
- (id)providerItemForRecentAvatar:(id)a3 inView:(id)a4;
- (id)recentAvatarFromPendingVisualIdentity;
- (id)recentPosterFromPendingVisualIdentity;
- (id)sharingSettingsViewControllerForOnboarding;
- (id)wallpaperGalleryNavigationController;
- (id)wallpaperGalleryNavigationControllerForMode:(int64_t)a3;
- (int64_t)defaultModalPresentationStyle;
- (int64_t)editingState;
- (int64_t)mode;
- (unint64_t)recentAvatarsCountForContactIdentifier:(id)a3;
- (void)avatarEditingDidFinishWithProviderItem:(id)a3 fromViewController:(id)a4;
- (void)avatarPreviewViewController:(id)a3 didFinishWithContactImage:(id)a4;
- (void)avatarPreviewViewControllerDidCancel:(id)a3;
- (void)avatarPreviewViewControllerDidSelectCustomizeLater:(id)a3;
- (void)cleanupTemporaryPosterArchiveDataIfNeededFromURL:(id)a3 fileManager:(id)a4;
- (void)cleanupTemporaryPosterConfigurationsFromURL:(id)a3 fileManager:(id)a4;
- (void)cleanupTemporaryPosterData;
- (void)dealloc;
- (void)dismissNavigationController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)dismissOnboardingIfNeeded;
- (void)dismissPosterEditingFlow;
- (void)dismissViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)editAvatar:(id)a3 inView:(id)a4;
- (void)finishFlow;
- (void)finishFlowAndSaveAsRecent:(BOOL)a3;
- (void)imagePickerController:(id)a3 didFinishWithProviderItem:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)notifyDelegateOfUpdatesAndDismissIfNeeded;
- (void)posterEditOptionsViewController:(id)a3 didEditPosterWithContext:(id)a4;
- (void)posterEditOptionsViewController:(id)a3 didLoadCurrentAvatar:(id)a4 poster:(id)a5 backedByRecents:(BOOL)a6;
- (void)posterEditOptionsViewController:(id)a3 didSelectAvatar:(id)a4 poster:(id)a5;
- (void)posterEditOptionsViewController:(id)a3 didSelectEditAvatarWithContext:(id)a4;
- (void)posterEditOptionsViewControllerDidCancel:(id)a3;
- (void)posterEditOptionsViewControllerDidDeleteCurrentPosterPair:(id)a3;
- (void)posterEditOptionsViewControllerDidDeleteExistingPosterPair:(id)a3;
- (void)posterEditOptionsViewControllerDidSelectCreateNew:(id)a3;
- (void)posterOnboardingViewControllerDidDidTapCancel:(id)a3;
- (void)posterOnboardingViewControllerDidTapContinue:(id)a3;
- (void)posterPreviewViewController:(id)a3 didFinishWithPosterConfiguration:(id)a4;
- (void)posterPreviewViewControllerDidSelectCustomizeLater:(id)a3;
- (void)posterPreviewViewControllerDidSelectUseDifferentPoster:(id)a3;
- (void)presentCreateNewAvatarViewController;
- (void)presentCreateNewAvatarViewControllerFromViewController:(id)a3;
- (void)presentNavigationController:(id)a3;
- (void)previewPendingPoster:(id)a3;
- (void)pushNextStepWithViewController:(id)a3;
- (void)resetEditingState;
- (void)saveCurrentVisualIdentityIfNeeded;
- (void)saveRecentAvatar:(id)a3 withPairedPoster:(id)a4 ignoreExisting:(BOOL)a5;
- (void)saveRecentPoster:(id)a3;
- (void)saveRecentVisualIdentity;
- (void)setAvatarEditFlowManager:(id)a3;
- (void)setAvatarPosterEditingContext:(id)a3;
- (void)setBaseViewController:(id)a3;
- (void)setContactImageStore:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setCurrentAvatarPosterPairIsBackedByRecents:(BOOL)a3;
- (void)setCurrentContactImage:(id)a3;
- (void)setCurrentContactPoster:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditFlowReporter:(id)a3;
- (void)setEditingContact:(id)a3;
- (void)setEditingState:(int64_t)a3;
- (void)setGalleryNavigationController:(id)a3;
- (void)setImagePickerController:(id)a3;
- (void)setIsCreatingNewAvatar:(BOOL)a3;
- (void)setIsEditingContactCard:(BOOL)a3;
- (void)setIsOnboarding:(BOOL)a3;
- (void)setMode:(int64_t)a3;
- (void)setOnboardingWelcomeNavigationController:(id)a3;
- (void)setPendingRecentImage:(id)a3;
- (void)setPendingVisualIdentity:(id)a3;
- (void)setPosterEditOptionsNavigationController:(id)a3;
- (void)setPresenterDelegate:(id)a3;
- (void)setSnapshotController:(id)a3;
- (void)sharingEditAvatarFlowManager:(id)a3 didFinishWithProviderItem:(id)a4 fromViewController:(id)a5;
- (void)sharingEditAvatarFlowManagerDidCancel:(id)a3;
- (void)sharingSettingsViewController:(id)a3 didSelectSharingAudience:(unint64_t)a4;
- (void)sharingSettingsViewController:(id)a3 didUpdateSharingState:(BOOL)a4;
- (void)sharingSettingsViewController:(id)a3 didUpdateWithSharingResult:(id)a4;
- (void)startContactCardFlowForContact:(id)a3 isEditing:(BOOL)a4;
- (void)startEditFlowWithSNaPContact:(id)a3;
- (void)startOnboardingFlowWithNicknameContact:(id)a3 meContact:(id)a4;
- (void)submitAndResetFlowReporter;
- (void)suggestionsGalleryViewController:(id)a3 didFinishWithPosterConfiguration:(id)a4 name:(id)a5;
- (void)suggestionsGalleryViewController:(id)a3 didSelectAvatarSourceType:(int64_t)a4 name:(id)a5;
- (void)suggestionsGalleryViewController:(id)a3 didSelectSuggestedAvatar:(id)a4 name:(id)a5;
- (void)suggestionsGalleryViewControllerDidCancel:(id)a3;
- (void)suggestionsGalleryViewControllerDidSelectCustomizeLater:(id)a3;
- (void)updateEditingContact:(id)a3 watchWallpaperImageDataForConfiguration:(id)a4 completion:(id)a5;
- (void)updateEditingContactWithVisualIdentity:(id)a3;
- (void)updateEditingContextWithPendingPoster:(id)a3;
- (void)updateEditingStateForAction:(int64_t)a3;
- (void)updateEditingStateForRevertedAction:(int64_t)a3 dismissingSetupFlow:(BOOL)a4;
- (void)updatePendingVisualIdentityWithAvatar:(id)a3 contactPoster:(id)a4 viewController:(id)a5;
- (void)updatePendingVisualIdentityWithAvatar:(id)a3 pendingPosterEdit:(id)a4 viewController:(id)a5;
- (void)updatePendingVisualIdentityWithWallpaper:(id)a3;
- (void)validateAndUpdateAvatarDataForVisualIdentity:(id)a3;
- (void)viewControllerDidSelectCustomizePosterLater:(id)a3;
- (void)writeToDefaultsPosterSkippedIfNeeded;
@end

@implementation CNSNaPSetupFlowManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerItemCallbackQueue, 0);
  objc_storeStrong((id *)&self->_providerItemRenderingQueue, 0);
  objc_storeStrong((id *)&self->_pendingRecentImage, 0);
  objc_storeStrong((id *)&self->_currentContactPoster, 0);
  objc_storeStrong((id *)&self->_currentContactImage, 0);
  objc_storeStrong((id *)&self->_editFlowReporter, 0);
  objc_storeStrong((id *)&self->_contactImageStore, 0);
  objc_storeStrong((id *)&self->_snapshotController, 0);
  objc_storeStrong((id *)&self->_imagePickerController, 0);
  objc_storeStrong((id *)&self->_avatarEditFlowManager, 0);
  objc_storeStrong((id *)&self->_baseViewController, 0);
  objc_storeStrong((id *)&self->_onboardingWelcomeNavigationController, 0);
  objc_storeStrong((id *)&self->_galleryNavigationController, 0);
  objc_storeStrong((id *)&self->_posterEditOptionsNavigationController, 0);
  objc_storeStrong((id *)&self->_avatarPosterEditingContext, 0);
  objc_storeStrong((id *)&self->_pendingVisualIdentity, 0);
  objc_storeStrong((id *)&self->_editingContact, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_destroyWeak((id *)&self->_presenterDelegate);

  objc_destroyWeak((id *)&self->_delegate);
}

- (CNScheduler)providerItemCallbackQueue
{
  return self->_providerItemCallbackQueue;
}

- (CNScheduler)providerItemRenderingQueue
{
  return self->_providerItemRenderingQueue;
}

- (void)setPendingRecentImage:(id)a3
{
}

- (CNContactImage)pendingRecentImage
{
  return self->_pendingRecentImage;
}

- (void)setCurrentAvatarPosterPairIsBackedByRecents:(BOOL)a3
{
  self->_currentAvatarPosterPairIsBackedByRecents = a3;
}

- (BOOL)currentAvatarPosterPairIsBackedByRecents
{
  return self->_currentAvatarPosterPairIsBackedByRecents;
}

- (void)setCurrentContactPoster:(id)a3
{
}

- (CNContactPoster)currentContactPoster
{
  return self->_currentContactPoster;
}

- (void)setCurrentContactImage:(id)a3
{
}

- (CNContactImage)currentContactImage
{
  return self->_currentContactImage;
}

- (void)setEditFlowReporter:(id)a3
{
}

- (_TtC10ContactsUI22PosterEditFlowReporter)editFlowReporter
{
  return self->_editFlowReporter;
}

- (void)setContactImageStore:(id)a3
{
}

- (void)setSnapshotController:(id)a3
{
}

- (CNPRUISPosterSnapshotController)snapshotController
{
  return self->_snapshotController;
}

- (void)setImagePickerController:(id)a3
{
}

- (CNVisualIdentityImagePickerController)imagePickerController
{
  return self->_imagePickerController;
}

- (void)setAvatarEditFlowManager:(id)a3
{
}

- (CNMeCardSharingEditAvatarFlowManager)avatarEditFlowManager
{
  return self->_avatarEditFlowManager;
}

- (void)setBaseViewController:(id)a3
{
}

- (UIViewController)baseViewController
{
  return self->_baseViewController;
}

- (void)setOnboardingWelcomeNavigationController:(id)a3
{
}

- (UINavigationController)onboardingWelcomeNavigationController
{
  return self->_onboardingWelcomeNavigationController;
}

- (UINavigationController)galleryNavigationController
{
  return self->_galleryNavigationController;
}

- (void)setPosterEditOptionsNavigationController:(id)a3
{
}

- (UINavigationController)posterEditOptionsNavigationController
{
  return self->_posterEditOptionsNavigationController;
}

- (void)setIsCreatingNewAvatar:(BOOL)a3
{
  self->_isCreatingNewAvatar = a3;
}

- (BOOL)isCreatingNewAvatar
{
  return self->_isCreatingNewAvatar;
}

- (void)setIsEditingContactCard:(BOOL)a3
{
  self->_isEditingContactCard = a3;
}

- (BOOL)isEditingContactCard
{
  return self->_isEditingContactCard;
}

- (void)setIsOnboarding:(BOOL)a3
{
  self->_isOnboarding = a3;
}

- (BOOL)isOnboarding
{
  return self->_isOnboarding;
}

- (void)setAvatarPosterEditingContext:(id)a3
{
}

- (CNAvatarPosterCarouselEditingContext)avatarPosterEditingContext
{
  return self->_avatarPosterEditingContext;
}

- (void)setEditingState:(int64_t)a3
{
  self->_editingState = a3;
}

- (int64_t)editingState
{
  return self->_editingState;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setPendingVisualIdentity:(id)a3
{
}

- (CNVisualIdentity)pendingVisualIdentity
{
  return self->_pendingVisualIdentity;
}

- (void)setEditingContact:(id)a3
{
}

- (CNMutableContact)editingContact
{
  return self->_editingContact;
}

- (void)setContactStore:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setPresenterDelegate:(id)a3
{
}

- (CNPresenterDelegate)presenterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenterDelegate);

  return (CNPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CNSNaPSetupFlowManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNSNaPSetupFlowManagerDelegate *)WeakRetained;
}

- (BOOL)multiplePhoneNumbersTiedToAppleID
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getIMNicknameControllerClass_softClass_10716;
  uint64_t v9 = getIMNicknameControllerClass_softClass_10716;
  if (!getIMNicknameControllerClass_softClass_10716)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getIMNicknameControllerClass_block_invoke_10717;
    v5[3] = &unk_1E549AD00;
    v5[4] = &v6;
    __getIMNicknameControllerClass_block_invoke_10717((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  return [v3 multiplePhoneNumbersTiedToAppleID];
}

- (void)cleanupTemporaryPosterConfigurationsFromURL:(id)a3 fileManager:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [a3 URLByAppendingPathComponent:@"PosterConfigurations"];
  v7 = [v6 path];
  int v8 = [v5 fileExistsAtPath:v7];

  if (v8)
  {
    id v13 = 0;
    char v9 = [v5 removeItemAtURL:v6 error:&v13];
    id v10 = v13;
    if ((v9 & 1) == 0)
    {
      v11 = CNUILogPosters();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = [v10 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v15 = v12;
        _os_log_error_impl(&dword_18B625000, v11, OS_LOG_TYPE_ERROR, "Failed to clean up poster configurations from temporary directory, %@", buf, 0xCu);
      }
    }
  }
}

- (void)cleanupTemporaryPosterArchiveDataIfNeededFromURL:(id)a3 fileManager:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if (([v7 BOOLForKey:@"CNPostersHasPerformedTemporaryArchiveCleanup"] & 1) == 0)
  {
    v20 = v7;
    v32[0] = *MEMORY[0x1E4F1C6E8];
    int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    id v21 = v5;
    char v9 = [v6 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:v8 options:0 error:0];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v16 = [v15 pathExtension];
          if (([v16 isEqualToString:@"apa"] & 1) != 0
            || [v16 isEqualToString:@"zapa"])
          {
            id v22 = 0;
            char v17 = [v6 removeItemAtURL:v15 error:&v22];
            id v18 = v22;
            if ((v17 & 1) == 0)
            {
              v19 = CNUILogPosters();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v28 = v16;
                __int16 v29 = 2112;
                id v30 = v18;
                _os_log_error_impl(&dword_18B625000, v19, OS_LOG_TYPE_ERROR, "Failed to clean up %@ type file from temporary directory, %@", buf, 0x16u);
              }
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v12);
    }

    v7 = v20;
    [v20 setBool:1 forKey:@"CNPostersHasPerformedTemporaryArchiveCleanup"];

    id v5 = v21;
  }
}

- (void)cleanupTemporaryPosterData
{
  id v3 = [MEMORY[0x1E4F5A4F0] defaultProvider];
  v4 = [v3 backgroundScheduler];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__CNSNaPSetupFlowManager_cleanupTemporaryPosterData__block_invoke;
  v5[3] = &unk_1E549B488;
  v5[4] = self;
  [v4 performBlock:v5];
}

void __52__CNSNaPSetupFlowManager_cleanupTemporaryPosterData__block_invoke(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v2 = NSTemporaryDirectory();
  id v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2];
  [*(id *)(a1 + 32) cleanupTemporaryPosterArchiveDataIfNeededFromURL:v3 fileManager:v4];
  [*(id *)(a1 + 32) cleanupTemporaryPosterConfigurationsFromURL:v3 fileManager:v4];
}

- (void)resetEditingState
{
  [(CNSNaPSetupFlowManager *)self setEditingState:0];

  [(CNSNaPSetupFlowManager *)self setAvatarPosterEditingContext:0];
}

- (void)updateEditingStateForRevertedAction:(int64_t)a3 dismissingSetupFlow:(BOOL)a4
{
  BOOL v4 = a4;
  [(CNSNaPSetupFlowManager *)self setEditingState:+[CNMeCardSharingSettingsEditingStateMachine stateAfterRevertingAction:a3 onState:[(CNSNaPSetupFlowManager *)self editingState]]];
  if (v4)
  {
    [(CNSNaPSetupFlowManager *)self setAvatarPosterEditingContext:0];
  }
}

- (void)updateEditingStateForAction:(int64_t)a3
{
  int64_t v4 = +[CNMeCardSharingSettingsEditingStateMachine stateAfterPerformingAction:a3 onState:[(CNSNaPSetupFlowManager *)self editingState]];

  [(CNSNaPSetupFlowManager *)self setEditingState:v4];
}

- (id)providerItemForRecentAvatar:(id)a3 inView:(id)a4
{
  id v6 = a3;
  BOOL v7 = [a4 effectiveUserInterfaceLayoutDirection] == 1;
  int v8 = [CNPhotoPickerRecentsProvider alloc];
  char v9 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
  id v10 = [(CNPhotoPickerRecentsProvider *)v8 initWithVisualIdentity:v9];

  uint64_t v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v11 scale];
  double v13 = v12;
  v14 = [(CNSNaPSetupFlowManager *)self providerItemRenderingQueue];
  v15 = [(CNSNaPSetupFlowManager *)self providerItemCallbackQueue];
  uint64_t v16 = -[CNPhotoPickerRecentsProvider providerItemForContactImage:size:scale:RTL:renderingQueue:callbackQueue:fallbackToDefaultItem:](v10, "providerItemForContactImage:size:scale:RTL:renderingQueue:callbackQueue:fallbackToDefaultItem:", v6, v7, v14, v15, 1, 250.0, 250.0, v13);

  return v16;
}

- (void)saveRecentPoster:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1B968]);
    id v6 = (void *)MEMORY[0x1E4F1B960];
    BOOL v7 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
    int v8 = [v7 identifier];
    char v9 = [v6 saveRequestToCreatePoster:v4 forContactIdentifier:v8];

    id v14 = 0;
    [v5 performSaveRequest:v9 error:&v14];
    id v10 = v14;
    if (v10)
    {
      uint64_t v11 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        double v12 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
        double v13 = [v12 identifier];
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v13;
        _os_log_impl(&dword_18B625000, v11, OS_LOG_TYPE_INFO, "Failed to save item to recent poster store for contact identifier <%@>", buf, 0xCu);
      }
    }
  }
  else
  {
    id v5 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B625000, v5, OS_LOG_TYPE_INFO, "Contact poster is nil, not saving to recents", buf, 2u);
    }
  }
}

- (void)saveRecentAvatar:(id)a3 withPairedPoster:(id)a4 ignoreExisting:(BOOL)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    if (a5)
    {
      id v10 = 0;
    }
    else
    {
      double v12 = [(CNSNaPSetupFlowManager *)self avatarPosterEditingContext];
      id v10 = [v12 existingAvatar];
    }
    [v8 setPairedPoster:v9];
    double v13 = [(CNSNaPSetupFlowManager *)self contactImageStore];
    id v14 = [(CNSNaPSetupFlowManager *)self editingContact];
    v15 = [v14 identifier];

    if (v10)
    {
      uint64_t v16 = (void *)MEMORY[0x1E4F1B928];
      uint64_t v17 = [v10 identifier];
      id v18 = [v16 saveRequestToDeleteImageForIdentifier:v17];

      id v26 = 0;
      LOBYTE(v17) = [v13 performSaveRequest:v18 error:&v26];
      id v19 = v26;
      if ((v17 & 1) == 0)
      {
        v20 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_18B625000, v20, OS_LOG_TYPE_ERROR, "Failed to delete existing edited item", buf, 2u);
        }
      }
    }
    else
    {
      id v19 = 0;
    }
    id v21 = [MEMORY[0x1E4F1B928] saveRequestToCreateImage:v8 forContactIdentifier:v15];
    id v25 = v19;
    char v22 = [v13 performSaveRequest:v21 error:&v25];
    id v23 = v25;

    if ((v22 & 1) == 0)
    {
      long long v24 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v15;
        _os_log_impl(&dword_18B625000, v24, OS_LOG_TYPE_INFO, "Failed to save item to recent image store for contact identifier <%@>", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v11 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B625000, v11, OS_LOG_TYPE_INFO, "Contact image is nil, saving poster without any paired avatar", buf, 2u);
    }

    [(CNSNaPSetupFlowManager *)self saveRecentPoster:v9];
  }
}

- (id)contactPosterFromWallpaper:(id)a3
{
  id v3 = a3;
  id v4 = [v3 posterArchiveData];
  if (v4)
  {
    id v5 = +[CNPRSPosterArchiver unarchiveCNConfigurationFromData:v4 error:0];
    id v6 = [v5 serverUUID];
    BOOL v7 = [v6 UUIDString];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
      id v9 = [v11 UUIDString];
    }
    id v12 = objc_alloc(MEMORY[0x1E4F1B950]);
    double v13 = [MEMORY[0x1E4F1C9C8] now];
    id v10 = (void *)[v12 initWithIdentifier:v9 posterData:v4 lastUsedDate:v13];

    id v14 = [v3 visualFingerprintData];
    [v10 setVisualFingerprintData:v14];

    objc_msgSend(v10, "setContentIsSensitive:", objc_msgSend(v3, "contentIsSensitive"));
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)recentPosterFromPendingVisualIdentity
{
  id v3 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
  id v4 = [v3 wallpaper];
  id v5 = [(CNSNaPSetupFlowManager *)self contactPosterFromWallpaper:v4];

  return v5;
}

- (id)recentAvatarFromPendingVisualIdentity
{
  id v3 = [(CNSNaPSetupFlowManager *)self avatarPosterEditingContext];
  id v4 = [v3 updatedAvatar];

  if (v4) {
    goto LABEL_4;
  }
  id v5 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
  id v6 = [v5 imageData];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1B918]);
    id v8 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
    [v8 cropRect];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    uint64_t v17 = [MEMORY[0x1E4F1C9C8] now];
    id v4 = objc_msgSend(v7, "initWithImageData:cropRect:lastUsedDate:", v6, v17, v10, v12, v14, v16);

    id v18 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
    objc_msgSend(v4, "setSource:", objc_msgSend(v18, "contactImageSource"));

LABEL_4:
    id v19 = (void *)MEMORY[0x1E4F1BAD8];
    v20 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
    id v21 = [v20 thumbnailImageData];
    char v22 = [v19 fingerprintForData:v21];

    [v4 setVisualFingerprint:v22];
    id v23 = v4;

    goto LABEL_5;
  }
  id v23 = 0;
LABEL_5:

  return v23;
}

- (void)saveRecentVisualIdentity
{
  id v4 = [(CNSNaPSetupFlowManager *)self recentAvatarFromPendingVisualIdentity];
  id v3 = [(CNSNaPSetupFlowManager *)self recentPosterFromPendingVisualIdentity];
  [(CNSNaPSetupFlowManager *)self saveRecentAvatar:v4 withPairedPoster:v3 ignoreExisting:0];
}

- (void)saveCurrentVisualIdentityIfNeeded
{
  id v3 = [(CNSNaPSetupFlowManager *)self currentContactImage];
  if (v3)
  {
  }
  else
  {
    id v4 = [(CNSNaPSetupFlowManager *)self currentContactPoster];

    if (!v4) {
      return;
    }
  }
  id v5 = (void *)MEMORY[0x1E4F1BAB8];
  id v6 = [(CNSNaPSetupFlowManager *)self currentContactPoster];
  id v7 = [(CNSNaPSetupFlowManager *)self editingContact];
  LODWORD(v5) = [v5 shouldSaveCurrentPoster:v6 toRecentsForContact:v7];

  if (v5)
  {
    id v9 = [(CNSNaPSetupFlowManager *)self currentContactImage];
    id v8 = [(CNSNaPSetupFlowManager *)self currentContactPoster];
    [(CNSNaPSetupFlowManager *)self saveRecentAvatar:v9 withPairedPoster:v8 ignoreExisting:1];
  }
}

- (unint64_t)recentAvatarsCountForContactIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1B920];
  id v12 = a3;
  id v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a3;
  id v7 = [v5 arrayWithObjects:&v12 count:1];
  id v8 = objc_msgSend(v4, "recentImagesRequestForContactIdenfitiers:", v7, v12, v13);

  id v9 = [(CNSNaPSetupFlowManager *)self contactImageStore];
  unint64_t v10 = [v9 countForFetchRequest:v8 error:0];

  return v10;
}

- (CNContactImageStore)contactImageStore
{
  v2 = cn_objectResultWithObjectLock();

  return (CNContactImageStore *)v2;
}

id __43__CNSNaPSetupFlowManager_contactImageStore__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1104);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1B930]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 1104);
    *(void *)(v4 + 1104) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 1104);
  }

  return v2;
}

- (void)imagePickerController:(id)a3 didFinishWithProviderItem:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__CNSNaPSetupFlowManager_imagePickerController_didFinishWithProviderItem___block_invoke;
  v8[3] = &unk_1E549BF80;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 dismissViewControllerAnimated:1 completion:v8];
}

void __74__CNSNaPSetupFlowManager_imagePickerController_didFinishWithProviderItem___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) posterEditOptionsNavigationController];
  id v3 = [*(id *)(a1 + 32) avatarEditFlowManager];
  [v3 setBaseNavigationController:v2];

  id v4 = [*(id *)(a1 + 32) avatarEditFlowManager];
  [v4 presentAvatarEditorViewControllerForProviderItem:*(void *)(a1 + 40)];
}

- (void)imagePickerControllerDidCancel:(id)a3
{
}

- (void)presentCreateNewAvatarViewControllerFromViewController:(id)a3
{
  id v4 = a3;
  id v5 = [CNSNaPSuggestionsGalleryViewController alloc];
  id v6 = [(CNSNaPSetupFlowManager *)self editingContact];
  id v7 = [(CNSNaPSuggestionsGalleryViewController *)v5 initWithMode:0 contact:v6 isEditingSNaP:[(CNSNaPSetupFlowManager *)self isEditingContactCard] ^ 1 isOnboarding:[(CNSNaPSetupFlowManager *)self isOnboarding]];

  [(CNSNaPSuggestionsGalleryViewController *)v7 setDelegate:self];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v7];
  objc_msgSend(v8, "setModalPresentationStyle:", -[CNSNaPSetupFlowManager defaultModalPresentationStyle](self, "defaultModalPresentationStyle"));
  if (v4)
  {
    id v9 = v4;
  }
  else
  {
    unint64_t v10 = [(CNSNaPSetupFlowManager *)self galleryNavigationController];
    double v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [(CNSNaPSetupFlowManager *)self posterEditOptionsNavigationController];
    }
    id v9 = v12;
  }
  uint64_t v13 = [v9 presentedViewController];

  if (v13)
  {
    double v14 = [v9 presentedViewController];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __81__CNSNaPSetupFlowManager_presentCreateNewAvatarViewControllerFromViewController___block_invoke;
    id v19 = &unk_1E549BF80;
    id v20 = v9;
    id v21 = v8;
    [v14 dismissViewControllerAnimated:1 completion:&v16];
  }
  else
  {
    [v9 presentViewController:v8 animated:1 completion:0];
  }
  double v15 = [(CNSNaPSetupFlowManager *)self avatarEditFlowManager];
  [v15 setBaseNavigationController:v8];
}

uint64_t __81__CNSNaPSetupFlowManager_presentCreateNewAvatarViewControllerFromViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)presentCreateNewAvatarViewController
{
}

- (void)avatarPreviewViewControllerDidSelectCustomizeLater:(id)a3
{
  uint64_t v4 = [(CNSNaPSetupFlowManager *)self avatarPosterEditingContext];
  if (v4 && (v5 = (void *)v4, int64_t v6 = [(CNSNaPSetupFlowManager *)self editingState], v5, v6))
  {
    [(PosterEditFlowReporter *)self->_editFlowReporter didSkipAvatar];
    id v7 = [(CNSNaPSetupFlowManager *)self avatarPosterEditingContext];
    char v8 = [v7 isEditingExisting];

    if (v8)
    {
      id v9 = [(CNSNaPSetupFlowManager *)self avatarPosterEditingContext];
      unint64_t v10 = [v9 existingAvatar];
      double v11 = [(CNSNaPSetupFlowManager *)self avatarPosterEditingContext];
      [v11 setUpdatedAvatar:v10];
    }
    else
    {
      uint64_t v13 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
      [v13 clearImage];

      id v9 = [(CNSNaPSetupFlowManager *)self avatarPosterEditingContext];
      [v9 setUpdatedAvatar:0];
    }

    [(CNSNaPSetupFlowManager *)self finishFlow];
  }
  else
  {
    id v12 = CNUILogPosters();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v14 = 0;
      _os_log_impl(&dword_18B625000, v12, OS_LOG_TYPE_DEFAULT, "Attempted to skip with empty editing state and context", v14, 2u);
    }
  }
}

- (void)avatarPreviewViewController:(id)a3 didFinishWithContactImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CNSNaPSetupFlowManager *)self updateEditingStateForAction:0];
  char v8 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
  [v8 clearImage];

  id v9 = objc_msgSend(MEMORY[0x1E4F1B8F8], "imageTypeStringIdentifierForImageSource:", objc_msgSend(v7, "source"));
  unint64_t v10 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
  [v10 setImageType:v9];

  if ([v7 source] == 3)
  {
    double v11 = [CNPhotoPickerAnimojiProviderItem alloc];
    id v12 = [v7 imageData];
    [v7 cropRect];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    id v21 = [v7 variant];
    char v22 = +[CNPhotoPickerVariantsManager colorVariantWithColorNamed:v21];
    id v23 = -[CNPhotoPickerAnimojiProviderItem initWithOriginalImageData:cropRect:backgroundColorVariant:](v11, "initWithOriginalImageData:cropRect:backgroundColorVariant:", v12, v22, v14, v16, v18, v20);

    long long v24 = (void *)MEMORY[0x1E4F1BA30];
    id v25 = [v7 sourceIdentifier];
    id v26 = [v24 avatarRecordForIdentifier:v25];

    [(CNPhotoPickerAnimojiProviderItem *)v23 setAvatarRecord:v26];
    v27 = +[CNPhotoPickerRecentsProvider poseConfigurationFromContactImage:v7];
    [(CNPhotoPickerAnimojiProviderItem *)v23 setPoseConfiguration:v27];

    [(CNPhotoPickerAnimojiProviderItem *)v23 generateAllImageDatasIfNeeded];
    v28 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
    [(CNPhotoPickerAnimojiProviderItem *)v23 updateVisualIdentity:v28];
  }
  else
  {
    uint64_t v29 = [v7 imageData];
    id v30 = [v7 variant];
    v31 = +[CNPhotoPickerProviderItem generateImageDataWithData:v29 filterName:v30];
    v32 = v31;
    if (v31)
    {
      v33 = v31;
    }
    else
    {
      v33 = [v7 imageData];
    }
    id v23 = v33;

    v34 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
    [v34 setImageData:v23];

    [v7 cropRect];
    v35 = +[CNPhotoPickerProviderItem generateThumbnailImageDataWithData:cropRect:](CNPhotoPickerProviderItem, "generateThumbnailImageDataWithData:cropRect:", v23);
    v36 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
    [v36 setThumbnailImageData:v35];

    [v7 cropRect];
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    id v26 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
    objc_msgSend(v26, "setCropRect:", v38, v40, v42, v44);
  }

  v45 = [(CNSNaPSetupFlowManager *)self avatarPosterEditingContext];
  [v45 setUpdatedAvatar:v7];

  [(PosterEditFlowReporter *)self->_editFlowReporter didModifyAvatar];
  if ([(CNSNaPSetupFlowManager *)self editingState] == 1
    && ([MEMORY[0x1E4FB16C8] currentDevice],
        v46 = objc_claimAutoreleasedReturnValue(),
        uint64_t v47 = [v46 userInterfaceIdiom],
        v46,
        (v47 & 0xFFFFFFFFFFFFFFFBLL) != 1))
  {
    v50 = [(CNSNaPSetupFlowManager *)self avatarPosterEditingContext];
    v51 = [v50 existingPoster];
    v52 = [v51 posterData];
    v53 = v52;
    if (v52)
    {
      id v54 = v52;
    }
    else
    {
      v55 = [(CNSNaPSetupFlowManager *)self editingContact];
      v56 = [v55 wallpaper];
      id v54 = [v56 posterArchiveData];
    }
    if (v54)
    {
      v57 = +[CNPRSPosterArchiver unarchiveCNConfigurationFromData:v54 error:0];
    }
    else
    {
      v57 = 0;
    }
    v58 = [(CNSNaPSetupFlowManager *)self posterPreviewControllerWithPosterConfiguration:v57 providerItem:0 mode:[(CNSNaPSetupFlowManager *)self mode]];
    v59 = [v6 navigationController];
    [v59 pushViewController:v58 animated:1];
  }
  else
  {
    v48 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v49 = [v48 userInterfaceIdiom];

    if ((v49 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __80__CNSNaPSetupFlowManager_avatarPreviewViewController_didFinishWithContactImage___block_invoke;
      v60[3] = &unk_1E549B488;
      v60[4] = self;
      [v6 dismissViewControllerAnimated:1 completion:v60];
    }
    else
    {
      [(CNSNaPSetupFlowManager *)self finishFlow];
    }
  }
}

uint64_t __80__CNSNaPSetupFlowManager_avatarPreviewViewController_didFinishWithContactImage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishFlow];
}

- (void)posterOnboardingViewControllerDidDidTapCancel:(id)a3
{
  editFlowReporter = self->_editFlowReporter;
  id v5 = a3;
  [(PosterEditFlowReporter *)editFlowReporter didCancelFromOnboardingWelcome];
  [(CNSNaPSetupFlowManager *)self submitAndResetFlowReporter];
  [(CNPRUISPosterSnapshotController *)self->_snapshotController releaseKeepActiveAssertionForReason:@"CNMeCardSharingEditPosterAvatarFlowManager"];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)posterOnboardingViewControllerDidTapContinue:(id)a3
{
  id v7 = a3;
  if ([(CNSNaPSetupFlowManager *)self isOnboarding])
  {
    uint64_t v4 = [(CNSNaPSetupFlowManager *)self wallpaperGalleryNavigationController];
    [(CNSNaPSetupFlowManager *)self setGalleryNavigationController:v4];

    id v5 = [(CNSNaPSetupFlowManager *)self onboardingWelcomeNavigationController];
    id v6 = [(CNSNaPSetupFlowManager *)self galleryNavigationController];
    [v5 presentViewController:v6 animated:1 completion:0];
  }
  else
  {
    [v7 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)sharingEditAvatarFlowManagerDidCancel:(id)a3
{
  [(PosterEditFlowReporter *)self->_editFlowReporter didCancelFromAvatarEditor];

  [(CNSNaPSetupFlowManager *)self updateEditingStateForRevertedAction:0 dismissingSetupFlow:0];
}

- (void)avatarEditingDidFinishWithProviderItem:(id)a3 fromViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 contactImageForMetadataStore];
  id v9 = [(CNSNaPSetupFlowManager *)self avatarPosterEditingContext];
  [v9 setUpdatedAvatar:v8];

  unint64_t v10 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
  [v6 updateVisualIdentity:v10];

  double v11 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
  [(CNSNaPSetupFlowManager *)self updateEditingContactWithVisualIdentity:v11];

  [(CNSNaPSetupFlowManager *)self updateEditingStateForAction:0];
  if ([(CNSNaPSetupFlowManager *)self editingState] == 1)
  {
    [(PosterEditFlowReporter *)self->_editFlowReporter didModifyAvatar];
    id v12 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v13 = [v12 userInterfaceIdiom];

    if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      if ([(CNSNaPSetupFlowManager *)self isCreatingNewAvatar])
      {
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __84__CNSNaPSetupFlowManager_avatarEditingDidFinishWithProviderItem_fromViewController___block_invoke;
        v40[3] = &unk_1E549B488;
        v40[4] = self;
        [(CNSNaPSetupFlowManager *)self dismissViewController:v7 animated:1 completion:v40];
      }
      else if ([(CNSNaPSetupFlowManager *)self isOnboarding] {
             || [(CNSNaPSetupFlowManager *)self isEditingContactCard])
      }
      {
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __84__CNSNaPSetupFlowManager_avatarEditingDidFinishWithProviderItem_fromViewController___block_invoke_2;
        v39[3] = &unk_1E549B488;
        v39[4] = self;
        [v7 dismissViewControllerAnimated:1 completion:v39];
      }
      else
      {
        [(CNSNaPSetupFlowManager *)self finishFlow];
      }
    }
    else
    {
      if ([v6 imageType] == 4
        || [v6 imageType] == 1
        && (uint64_t v28 = *MEMORY[0x1E4F5A298],
            [v6 assetIdentifier],
            uint64_t v29 = objc_claimAutoreleasedReturnValue(),
            LODWORD(v28) = (*(uint64_t (**)(uint64_t, void *))(v28 + 16))(v28, v29),
            v29,
            v28))
      {
        double v19 = [CNSNaPSuggestionsGalleryViewController alloc];
        double v20 = [(CNSNaPSetupFlowManager *)self editingContact];
        uint64_t v21 = [(CNSNaPSetupFlowManager *)self isEditingContactCard] ^ 1;
        BOOL v22 = [(CNSNaPSetupFlowManager *)self isOnboarding];
        id v23 = [v6 assetIdentifier];
        long long v24 = [(CNSNaPSuggestionsGalleryViewController *)v19 initWithMode:1 contact:v20 isEditingSNaP:v21 isOnboarding:v22 photoLibraryAssetID:v23];

        [(CNSNaPSuggestionsGalleryViewController *)v24 setDelegate:self];
      }
      else
      {
        id v30 = [(CNSNaPSetupFlowManager *)self avatarPosterEditingContext];
        v31 = [v30 existingPoster];
        v32 = [v31 posterData];
        v33 = v32;
        if (v32)
        {
          id v34 = v32;
        }
        else
        {
          v35 = [(CNSNaPSetupFlowManager *)self editingContact];
          v36 = [v35 wallpaper];
          id v34 = [v36 posterArchiveData];
        }
        if (v34)
        {
          double v37 = +[CNPRSPosterArchiver unarchiveCNConfigurationFromData:v34 error:0];
        }
        else
        {
          double v37 = 0;
        }
        long long v24 = [(CNSNaPSetupFlowManager *)self posterPreviewControllerWithPosterConfiguration:v37 providerItem:v6 mode:[(CNSNaPSetupFlowManager *)self mode]];
      }
      double v38 = [v7 navigationController];
      [v38 pushViewController:v24 animated:1];
    }
  }
  else
  {
    objc_opt_class();
    double v14 = [(CNSNaPSetupFlowManager *)self galleryNavigationController];
    double v15 = [v14 topViewController];
    if (objc_opt_isKindOfClass()) {
      double v16 = v15;
    }
    else {
      double v16 = 0;
    }
    id v17 = v16;

    if (v17)
    {
      [v17 updateWithProviderItem:v6];
      double v18 = [(CNSNaPSetupFlowManager *)self galleryNavigationController];
      [v18 dismissViewControllerAnimated:1 completion:0];
    }
    else
    {
      [(PosterEditFlowReporter *)self->_editFlowReporter didModifyAvatar];
      id v25 = objc_msgSend(MEMORY[0x1E4F1B8F8], "stringIdentifierForImageType:", objc_msgSend(v6, "imageType"));
      [(CNVisualIdentity *)self->_pendingVisualIdentity setImageType:v25];

      id v26 = [v6 imageData];
      [(CNVisualIdentity *)self->_pendingVisualIdentity setImageData:v26];

      [v6 cropRect];
      -[CNVisualIdentity setCropRect:](self->_pendingVisualIdentity, "setCropRect:");
      if ([(CNSNaPSetupFlowManager *)self isEditingContactCard])
      {
        v27 = [(CNSNaPSetupFlowManager *)self posterEditOptionsNavigationController];
        [v27 dismissViewControllerAnimated:1 completion:0];
      }
      [(CNSNaPSetupFlowManager *)self finishFlow];
    }
  }
}

uint64_t __84__CNSNaPSetupFlowManager_avatarEditingDidFinishWithProviderItem_fromViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishFlow];
}

uint64_t __84__CNSNaPSetupFlowManager_avatarEditingDidFinishWithProviderItem_fromViewController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishFlow];
}

- (void)sharingEditAvatarFlowManager:(id)a3 didFinishWithProviderItem:(id)a4 fromViewController:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  [(CNSNaPSetupFlowManager *)self updateEditingStateForAction:0];
  [(CNSNaPSetupFlowManager *)self avatarEditingDidFinishWithProviderItem:v8 fromViewController:v7];
}

- (void)suggestionsGalleryViewControllerDidSelectCustomizeLater:(id)a3
{
  [(CNSNaPSetupFlowManager *)self viewControllerDidSelectCustomizePosterLater:a3];

  [(CNSNaPSetupFlowManager *)self writeToDefaultsPosterSkippedIfNeeded];
}

- (void)suggestionsGalleryViewControllerDidCancel:(id)a3
{
  id v9 = a3;
  if ([(CNSNaPSetupFlowManager *)self isOnboarding])
  {
    [(PosterEditFlowReporter *)self->_editFlowReporter didCancelFromOnboardingNew];
  }
  else
  {
    uint64_t v4 = [v9 mode];
    editFlowReporter = self->_editFlowReporter;
    if (v4) {
      [(PosterEditFlowReporter *)editFlowReporter didCancelFromPosterEditor];
    }
    else {
      [(PosterEditFlowReporter *)editFlowReporter didCancelFromAvatarEditor];
    }
  }
  id v6 = [(CNSNaPSetupFlowManager *)self galleryNavigationController];
  id v7 = [v6 viewControllers];
  id v8 = [v7 firstObject];

  if (v8 == v9) {
    [(CNSNaPSetupFlowManager *)self dismissViewController:v9 animated:1 completion:0];
  }
  else {
    [v9 dismissViewControllerAnimated:1 completion:0];
  }
  -[CNSNaPSetupFlowManager updateEditingStateForRevertedAction:dismissingSetupFlow:](self, "updateEditingStateForRevertedAction:dismissingSetupFlow:", [v9 mode] != 0, v8 == v9);
}

- (void)suggestionsGalleryViewController:(id)a3 didFinishWithPosterConfiguration:(id)a4 name:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(CNSNaPSetupFlowManager *)self updateEditingStateForAction:1];
  double v11 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
  id v12 = [v8 given];
  uint64_t v13 = [v8 family];

  [v11 updateContactWithGivenName:v12 familyName:v13];
  if (![(CNSNaPSetupFlowManager *)self isEditingContactCard])
  {
    double v14 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
    [(CNSNaPSetupFlowManager *)self updateEditingContactWithVisualIdentity:v14];
  }
  -[CNSNaPSetupFlowManager posterPreviewControllerWithPosterConfiguration:providerItem:mode:](self, "posterPreviewControllerWithPosterConfiguration:providerItem:mode:", v9, 0, [v10 mode]);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  double v15 = [v10 navigationController];

  [v15 pushViewController:v16 animated:1];
}

- (void)suggestionsGalleryViewController:(id)a3 didSelectSuggestedAvatar:(id)a4 name:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
  id v12 = [v8 given];
  uint64_t v13 = [v8 family];

  [v11 updateContactWithGivenName:v12 familyName:v13];
  double v14 = [CNPhotoPickerRecentsProvider alloc];
  double v15 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
  long long v24 = [(CNPhotoPickerRecentsProvider *)v14 initWithVisualIdentity:v15];

  id v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v16 scale];
  double v18 = v17;
  double v19 = [v10 view];
  BOOL v20 = [v19 effectiveUserInterfaceLayoutDirection] == 1;
  uint64_t v21 = [(CNSNaPSetupFlowManager *)self providerItemRenderingQueue];
  BOOL v22 = [(CNSNaPSetupFlowManager *)self providerItemCallbackQueue];
  id v23 = -[CNPhotoPickerRecentsProvider providerItemForContactImage:size:scale:RTL:renderingQueue:callbackQueue:fallbackToDefaultItem:](v24, "providerItemForContactImage:size:scale:RTL:renderingQueue:callbackQueue:fallbackToDefaultItem:", v9, v20, v21, v22, 1, 250.0, 250.0, v18);

  [(CNSNaPSetupFlowManager *)self avatarEditingDidFinishWithProviderItem:v23 fromViewController:v10];
}

- (void)suggestionsGalleryViewController:(id)a3 didSelectAvatarSourceType:(int64_t)a4 name:(id)a5
{
  id v17 = a3;
  id v8 = a5;
  id v9 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
  id v10 = [v8 given];
  double v11 = [v8 family];

  [v9 updateContactWithGivenName:v10 familyName:v11];
  int64_t v12 = [(CNSNaPSetupFlowManager *)self mode];
  if (v12 != [v17 mode])
  {
    uint64_t v13 = [v17 navigationController];
    double v14 = [(CNSNaPSetupFlowManager *)self avatarEditFlowManager];
    [v14 setBaseNavigationController:v13];
  }
  double v15 = [(CNSNaPSetupFlowManager *)self avatarEditFlowManager];
  id v16 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
  [v15 presentEditorForAvatarSourceType:a4 visualIdentity:v16 fromGalleryViewController:v17];
}

- (void)sharingSettingsViewController:(id)a3 didSelectSharingAudience:(unint64_t)a4
{
  id v6 = [(CNSNaPSetupFlowManager *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CNSNaPSetupFlowManager *)self delegate];
    [v8 onboardingFromFlowManager:self didSelectSharingAudience:a4];
  }
}

- (void)sharingSettingsViewController:(id)a3 didUpdateSharingState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(CNSNaPSetupFlowManager *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CNSNaPSetupFlowManager *)self delegate];
    [v8 onboardingFromFlowManager:self didUpdateSharingState:v4];
  }
}

- (void)sharingSettingsViewController:(id)a3 didUpdateWithSharingResult:(id)a4
{
  id v9 = a4;
  id v5 = [(CNSNaPSetupFlowManager *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(CNSNaPSetupFlowManager *)self delegate];
    [v7 onboardingFromFlowManager:self didUpdateWithSharingResult:v9];

    id v8 = [(CNSNaPSetupFlowManager *)self onboardingWelcomeNavigationController];
    [(CNSNaPSetupFlowManager *)self dismissNavigationController:v8 animated:1 completion:0];
  }
}

- (void)updateEditingContact:(id)a3 watchWallpaperImageDataForConfiguration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  editingContact = self->_editingContact;
  id v11 = a4;
  int64_t v12 = [(CNMutableContact *)editingContact wallpaper];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__CNSNaPSetupFlowManager_updateEditingContact_watchWallpaperImageDataForConfiguration_completion___block_invoke;
  v15[3] = &unk_1E549B568;
  id v16 = v8;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  [v12 snapshotImageDataForWatchForContact:v14 posterConfiguration:v11 completion:v15];
}

uint64_t __98__CNSNaPSetupFlowManager_updateEditingContact_watchWallpaperImageDataForConfiguration_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setWatchWallpaperImageData:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)dismissPosterEditingFlow
{
  BOOL v4 = [(CNSNaPSetupFlowManager *)self galleryNavigationController];

  if (v4)
  {
    id v5 = [(CNSNaPSetupFlowManager *)self galleryNavigationController];
    [(CNSNaPSetupFlowManager *)self dismissNavigationController:v5 animated:1 completion:0];
  }
  char v6 = [(CNSNaPSetupFlowManager *)self posterEditOptionsNavigationController];

  if (v6)
  {
    id v11 = [(CNSNaPSetupFlowManager *)self posterEditOptionsNavigationController];
    char v7 = [(CNSNaPSetupFlowManager *)self posterEditOptionsNavigationController];
    id v8 = [v7 presentedViewController];
    if (v8
      || ([(CNSNaPSetupFlowManager *)self galleryNavigationController],
          (v2 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v9 = [(CNSNaPSetupFlowManager *)self posterEditOptionsNavigationController];
      id v10 = [v9 presentingViewController];

      if (v8) {
      else
      }

      if (!v10) {
        goto LABEL_13;
      }
      [v11 presentingViewController];
      char v7 = v11;
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_13:
    [(CNSNaPSetupFlowManager *)self dismissViewController:v11 animated:1 completion:0];
  }
}

- (void)notifyDelegateOfUpdatesAndDismissIfNeeded
{
  id v3 = [(CNSNaPSetupFlowManager *)self delegate];
  BOOL v4 = [(CNSNaPSetupFlowManager *)self editingContact];
  id v5 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
  [v3 avatarPosterEditorFromFlowManager:self didUpdateContact:v4 withVisualIdentity:v5];

  if ([(CNSNaPSetupFlowManager *)self isEditingContactCard])
  {
    [(CNSNaPSetupFlowManager *)self dismissPosterEditingFlow];
  }
}

- (void)pushNextStepWithViewController:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNSNaPSetupFlowManager *)self isOnboarding];
  char v6 = [(CNSNaPSetupFlowManager *)self galleryNavigationController];
  if (v5)
  {
    id v8 = v6;
    char v7 = [v6 presentingViewController];

    if (v7) {
      [(CNSNaPSetupFlowManager *)self galleryNavigationController];
    }
    else {
    char v6 = [(CNSNaPSetupFlowManager *)self onboardingWelcomeNavigationController];
    }
  }
  id v9 = v6;
  [v6 pushViewController:v4 animated:1];
}

- (void)finishFlowAndSaveAsRecent:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = *MEMORY[0x1E4F5A2B0];
  char v6 = [(CNSNaPSetupFlowManager *)self avatarPosterEditingContext];
  char v7 = [v6 pendingWallpaperFuture];
  id v8 = [v7 result:0];
  id v9 = (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);
  [(CNSNaPSetupFlowManager *)self updatePendingVisualIdentityWithWallpaper:v9];

  id v10 = [(CNSNaPSetupFlowManager *)self avatarPosterEditingContext];
  id v11 = [v10 pendingPosterEdit];
  int64_t v12 = [v11 posterConfiguration];

  if (![(CNSNaPSetupFlowManager *)self currentAvatarPosterPairIsBackedByRecents])[(CNSNaPSetupFlowManager *)self saveCurrentVisualIdentityIfNeeded]; {
  if (v3)
  }
    [(CNSNaPSetupFlowManager *)self saveRecentVisualIdentity];
  id v13 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
  id v14 = [v13 wallpaper];

  if (v14)
  {
    double v15 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
    id v16 = [v15 wallpaper];
    v35 = [v16 posterArchiveData];

    id v17 = [MEMORY[0x1E4F1BAE0] reducedSizePosterArchiveDataFromData:v35 posterConfiguration:v12];
    id v18 = objc_alloc(MEMORY[0x1E4F1BAE0]);
    double v19 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
    [v19 wallpaper];
    uint64_t v21 = v20 = v12;
    BOOL v22 = [v21 metadata];
    id v23 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
    long long v24 = [v23 wallpaper];
    id v25 = objc_msgSend(v18, "initWithPosterArchiveData:metadata:contentIsSensitive:", v17, v22, objc_msgSend(v24, "contentIsSensitive"));
    id v26 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
    [v26 setWallpaper:v25];

    int64_t v12 = v20;
  }
  v27 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
  [(CNSNaPSetupFlowManager *)self updateEditingContactWithVisualIdentity:v27];

  uint64_t v28 = +[CNUIContactsEnvironment currentEnvironment];
  uint64_t v29 = [v28 likenessCarouselFingerprintCache];
  id v30 = [(CNSNaPSetupFlowManager *)self editingContact];
  [v29 removeObjectForContact:v30];

  [(CNSNaPSetupFlowManager *)self submitAndResetFlowReporter];
  [(CNSNaPSetupFlowManager *)self cleanupTemporaryPosterData];
  if (!self->_isOnboarding)
  {
    [(CNSNaPSetupFlowManager *)self resetEditingState];
    v32 = [(CNSNaPSetupFlowManager *)self delegate];
    char v33 = objc_opt_respondsToSelector();

    if (v33)
    {
      id v34 = [(CNMutableContact *)self->_editingContact wallpaper];

      if (v34)
      {
        v31 = [(CNSNaPSetupFlowManager *)self editingContact];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __52__CNSNaPSetupFlowManager_finishFlowAndSaveAsRecent___block_invoke;
        v36[3] = &unk_1E549B488;
        v36[4] = self;
        [(CNSNaPSetupFlowManager *)self updateEditingContact:v31 watchWallpaperImageDataForConfiguration:v12 completion:v36];
        goto LABEL_9;
      }
      [(CNSNaPSetupFlowManager *)self notifyDelegateOfUpdatesAndDismissIfNeeded];
    }
    [(CNSNaPSetupFlowManager *)self setGalleryNavigationController:0];
    goto LABEL_15;
  }
  v31 = [(CNSNaPSetupFlowManager *)self sharingSettingsViewControllerForOnboarding];
  [v31 setDelegate:self];
  [(CNSNaPSetupFlowManager *)self pushNextStepWithViewController:v31];
LABEL_9:

LABEL_15:
  [(CNPRUISPosterSnapshotController *)self->_snapshotController releaseKeepActiveAssertionForReason:@"CNMeCardSharingEditPosterAvatarFlowManager"];
}

uint64_t __52__CNSNaPSetupFlowManager_finishFlowAndSaveAsRecent___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyDelegateOfUpdatesAndDismissIfNeeded];
  v2 = *(void **)(a1 + 32);

  return [v2 setGalleryNavigationController:0];
}

- (void)finishFlow
{
}

- (void)updateEditingContextWithPendingPoster:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNSNaPSetupFlowManager *)self avatarPosterEditingContext];

  if (!v5)
  {
    char v6 = +[CNAvatarPosterCarouselEditingContext contextForCreateNew];
    [(CNSNaPSetupFlowManager *)self setAvatarPosterEditingContext:v6];
  }
  id v7 = [(CNSNaPSetupFlowManager *)self avatarPosterEditingContext];
  [v7 setPendingPosterEdit:v4];
}

- (void)writeToDefaultsPosterSkippedIfNeeded
{
  if (![(CNSNaPSetupFlowManager *)self isEditingContactCard]
    || ([MEMORY[0x1E4F5A6D8] unifiedMeContactMonitor],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        [(CNSNaPSetupFlowManager *)self editingContact],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v3 isMeContact:v4],
        v4,
        v3,
        v5))
  {
    +[CNSharedProfileOnboardingController writeToDefaultsDidSkipPosterSetup:1];
  }
}

- (void)viewControllerDidSelectCustomizePosterLater:(id)a3
{
  id v4 = a3;
  [(PosterEditFlowReporter *)self->_editFlowReporter didSkipPoster];
  if ([(CNSNaPSetupFlowManager *)self isOnboarding]
    || [(CNSNaPSetupFlowManager *)self isEditingContactCard])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __70__CNSNaPSetupFlowManager_viewControllerDidSelectCustomizePosterLater___block_invoke;
    v5[3] = &unk_1E549B488;
    v5[4] = self;
    [v4 dismissViewControllerAnimated:1 completion:v5];
  }
  else
  {
    [(CNSNaPSetupFlowManager *)self finishFlow];
  }
}

uint64_t __70__CNSNaPSetupFlowManager_viewControllerDidSelectCustomizePosterLater___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishFlow];
}

- (void)avatarPreviewViewControllerDidCancel:(id)a3
{
}

- (void)posterPreviewViewControllerDidSelectUseDifferentPoster:(id)a3
{
  id v4 = a3;
  int v5 = [CNSNaPSuggestionsGalleryViewController alloc];
  char v6 = [(CNSNaPSetupFlowManager *)self editingContact];
  id v8 = [(CNSNaPSuggestionsGalleryViewController *)v5 initWithMode:1 contact:v6 isEditingSNaP:[(CNSNaPSetupFlowManager *)self isEditingContactCard] ^ 1 isOnboarding:[(CNSNaPSetupFlowManager *)self isOnboarding]];

  [(CNSNaPSuggestionsGalleryViewController *)v8 setDelegate:self];
  id v7 = [v4 navigationController];

  [v7 pushViewController:v8 animated:1];
}

- (void)posterPreviewViewControllerDidSelectCustomizeLater:(id)a3
{
  [(CNSNaPSetupFlowManager *)self viewControllerDidSelectCustomizePosterLater:a3];

  [(CNSNaPSetupFlowManager *)self writeToDefaultsPosterSkippedIfNeeded];
}

- (void)posterPreviewViewController:(id)a3 didFinishWithPosterConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PosterEditFlowReporter *)self->_editFlowReporter didModifyPoster];
  [(CNSNaPSetupFlowManager *)self updateEditingStateForAction:1];
  id v8 = +[CNAvatarPosterCarouselPendingPosterEdit pendingEditFromPosterConfiguration:v7];
  [(CNSNaPSetupFlowManager *)self updateEditingContextWithPendingPoster:v8];

  if ([(CNSNaPSetupFlowManager *)self editingState] == 2)
  {
    id v9 = [CNPosterSetupAvatarPreviewViewController alloc];
    id v10 = [(CNSNaPSetupFlowManager *)self editingContact];
    id v11 = [(CNPosterSetupAvatarPreviewViewController *)v9 initWithPosterConfiguration:v7 forEditingContact:v10];

    [(CNPosterSetupAvatarPreviewViewController *)v11 setDelegate:self];
    int64_t v12 = [v6 navigationController];
    [v12 pushViewController:v11 animated:1];
  }
  else if ([(CNSNaPSetupFlowManager *)self isOnboarding] {
         || [(CNSNaPSetupFlowManager *)self isEditingContactCard])
  }
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __87__CNSNaPSetupFlowManager_posterPreviewViewController_didFinishWithPosterConfiguration___block_invoke;
    v13[3] = &unk_1E549B488;
    v13[4] = self;
    [v6 dismissViewControllerAnimated:1 completion:v13];
  }
  else
  {
    [(CNSNaPSetupFlowManager *)self finishFlow];
  }
}

uint64_t __87__CNSNaPSetupFlowManager_posterPreviewViewController_didFinishWithPosterConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishFlow];
}

- (void)posterEditOptionsViewControllerDidCancel:(id)a3
{
  [(PosterEditFlowReporter *)self->_editFlowReporter didCancelFromCarousel];
  [(CNSNaPSetupFlowManager *)self submitAndResetFlowReporter];
  id v4 = [(CNSNaPSetupFlowManager *)self posterEditOptionsNavigationController];
  [(CNSNaPSetupFlowManager *)self dismissNavigationController:v4 animated:1 completion:0];

  [(CNSNaPSetupFlowManager *)self cleanupTemporaryPosterData];
  int v5 = [(CNSNaPSetupFlowManager *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CNSNaPSetupFlowManager *)self delegate];
    [v7 avatarPosterEditorFromFlowManagerDidCancel:self];
  }
}

- (void)updatePendingVisualIdentityWithWallpaper:(id)a3
{
  id v4 = a3;
  id v5 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
  [v5 setWallpaper:v4];
}

- (void)updatePendingVisualIdentityWithAvatar:(id)a3 pendingPosterEdit:(id)a4 viewController:(id)a5
{
  id v24 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
  [v10 clearImageAndWallpaper];

  id v11 = [v9 view];

  uint64_t v12 = [v11 effectiveUserInterfaceLayoutDirection];
  if (v24)
  {
    BOOL v13 = v12 == 1;
    id v14 = [CNPhotoPickerRecentsProvider alloc];
    double v15 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
    id v16 = [(CNPhotoPickerRecentsProvider *)v14 initWithVisualIdentity:v15];

    id v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v17 scale];
    double v19 = v18;
    BOOL v20 = [(CNSNaPSetupFlowManager *)self providerItemRenderingQueue];
    uint64_t v21 = [(CNSNaPSetupFlowManager *)self providerItemCallbackQueue];
    BOOL v22 = -[CNPhotoPickerRecentsProvider providerItemForContactImage:size:scale:RTL:renderingQueue:callbackQueue:fallbackToDefaultItem:](v16, "providerItemForContactImage:size:scale:RTL:renderingQueue:callbackQueue:fallbackToDefaultItem:", v24, v13, v20, v21, 1, 250.0, 250.0, v19);

    id v23 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
    [v22 updateVisualIdentity:v23];
  }
  if (v8) {
    [(CNSNaPSetupFlowManager *)self updateEditingContextWithPendingPoster:v8];
  }
}

- (void)updatePendingVisualIdentityWithAvatar:(id)a3 contactPoster:(id)a4 viewController:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = +[CNAvatarPosterCarouselPendingPosterEdit pendingEditFromContactPoster:a4];
  [(CNSNaPSetupFlowManager *)self updatePendingVisualIdentityWithAvatar:v9 pendingPosterEdit:v10 viewController:v8];
}

- (void)posterEditOptionsViewControllerDidDeleteExistingPosterPair:(id)a3
{
}

- (void)posterEditOptionsViewControllerDidDeleteCurrentPosterPair:(id)a3
{
  [(CNSNaPSetupFlowManager *)self setCurrentContactImage:0];
  [(CNSNaPSetupFlowManager *)self setCurrentContactPoster:0];

  [(CNSNaPSetupFlowManager *)self setCurrentAvatarPosterPairIsBackedByRecents:0];
}

- (void)posterEditOptionsViewController:(id)a3 didLoadCurrentAvatar:(id)a4 poster:(id)a5 backedByRecents:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  [(CNSNaPSetupFlowManager *)self setCurrentContactImage:a4];
  [(CNSNaPSetupFlowManager *)self setCurrentContactPoster:v9];

  [(CNSNaPSetupFlowManager *)self setCurrentAvatarPosterPairIsBackedByRecents:v6];
}

- (void)posterEditOptionsViewController:(id)a3 didSelectAvatar:(id)a4 poster:(id)a5
{
  [(CNSNaPSetupFlowManager *)self updatePendingVisualIdentityWithAvatar:a4 contactPoster:a5 viewController:a3];

  [(CNSNaPSetupFlowManager *)self finishFlowAndSaveAsRecent:0];
}

- (void)posterEditOptionsViewControllerDidSelectCreateNew:(id)a3
{
  [(PosterEditFlowReporter *)self->_editFlowReporter willEditCreatingNew];
  id v4 = [(CNSNaPSetupFlowManager *)self pendingVisualIdentity];
  [v4 clearImageAndWallpaper];

  id v5 = [(CNSNaPSetupFlowManager *)self wallpaperGalleryNavigationController];
  [(CNSNaPSetupFlowManager *)self setGalleryNavigationController:v5];

  BOOL v6 = +[CNAvatarPosterCarouselEditingContext contextForCreateNew];
  [(CNSNaPSetupFlowManager *)self setAvatarPosterEditingContext:v6];

  id v8 = [(CNSNaPSetupFlowManager *)self posterEditOptionsNavigationController];
  id v7 = [(CNSNaPSetupFlowManager *)self galleryNavigationController];
  [v8 presentViewController:v7 animated:1 completion:0];
}

- (void)previewPendingPoster:(id)a3
{
  id v4 = a3;
  id v5 = [v4 posterConfiguration];

  if (v5)
  {
    [v4 posterConfiguration];
  }
  else
  {
    BOOL v6 = [v4 contactPoster];

    id v4 = [v6 posterData];

    +[CNPRSPosterArchiver unarchiveCNConfigurationFromData:v4 error:0];
  }
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = [(CNSNaPSetupFlowManager *)self posterPreviewControllerWithPosterConfiguration:v9 providerItem:0 mode:1];
  id v8 = [(CNSNaPSetupFlowManager *)self posterEditOptionsNavigationController];
  [v8 pushViewController:v7 animated:1];
}

- (void)posterEditOptionsViewController:(id)a3 didEditPosterWithContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CNSNaPSetupFlowManager *)self setAvatarPosterEditingContext:v6];
  id v12 = [v6 pendingPosterEdit];
  [(CNSNaPSetupFlowManager *)self updateEditingStateForAction:1];
  id v8 = [v6 existingAvatar];

  [(CNSNaPSetupFlowManager *)self updatePendingVisualIdentityWithAvatar:v8 pendingPosterEdit:v12 viewController:v7];
  if (v12)
  {
    -[CNSNaPSetupFlowManager previewPendingPoster:](self, "previewPendingPoster:");
  }
  else
  {
    id v9 = [(CNSNaPSetupFlowManager *)self wallpaperGalleryNavigationControllerForMode:1];
    [(CNSNaPSetupFlowManager *)self setGalleryNavigationController:v9];

    id v10 = [(CNSNaPSetupFlowManager *)self posterEditOptionsNavigationController];
    id v11 = [(CNSNaPSetupFlowManager *)self galleryNavigationController];
    [v10 presentViewController:v11 animated:1 completion:0];
  }
}

- (BOOL)shouldShowItemEditorForContactImage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 source];
  if (v4 == 3)
  {
    id v6 = [v3 variant];
    LOBYTE(v7) = v6 != 0;
  }
  else
  {
    if (v4 != 2)
    {
      LOBYTE(v7) = 1;
      goto LABEL_7;
    }
    uint64_t v5 = *MEMORY[0x1E4F5A268];
    id v6 = [v3 imageData];
    int v7 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6) ^ 1;
  }

LABEL_7:
  return v7;
}

- (void)editAvatar:(id)a3 inView:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (![(CNSNaPSetupFlowManager *)self shouldShowItemEditorForContactImage:v16])goto LABEL_6; {
  uint64_t v7 = [v16 source];
  }
  if ((unint64_t)(v7 - 3) < 2 || v7 == 1)
  {
    id v10 = [(CNSNaPSetupFlowManager *)self providerItemForRecentAvatar:v16 inView:v6];
    BOOL v13 = [(CNSNaPSetupFlowManager *)self posterEditOptionsNavigationController];
    id v14 = [(CNSNaPSetupFlowManager *)self avatarEditFlowManager];
    [v14 setBaseNavigationController:v13];

    double v15 = [(CNSNaPSetupFlowManager *)self avatarEditFlowManager];
    [v15 presentAvatarEditorViewControllerForProviderItem:v10];

    goto LABEL_8;
  }
  if (v7 != 2)
  {
LABEL_6:
    [(CNSNaPSetupFlowManager *)self presentCreateNewAvatarViewController];
    goto LABEL_9;
  }
  id v8 = [CNPosterSetupAvatarPreviewViewController alloc];
  id v9 = [(CNSNaPSetupFlowManager *)self editingContact];
  id v10 = [(CNPosterSetupAvatarPreviewViewController *)v8 initWithContactImage:v16 imageType:1 forEditingContact:v9];

  [(CNPosterSetupAvatarPreviewViewController *)v10 setDelegate:self];
  [(CNPosterSetupAvatarPreviewViewController *)v10 setHideSkipOption:1];
  [(CNPosterSetupAvatarPreviewViewController *)v10 setShouldShowCancelButton:1];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v10];
  objc_msgSend(v11, "setModalPresentationStyle:", -[CNSNaPSetupFlowManager defaultModalPresentationStyle](self, "defaultModalPresentationStyle"));
  id v12 = [(CNSNaPSetupFlowManager *)self posterEditOptionsNavigationController];
  [v12 presentViewController:v11 animated:1 completion:0];

LABEL_8:
LABEL_9:
}

- (void)posterEditOptionsViewController:(id)a3 didSelectEditAvatarWithContext:(id)a4
{
  editFlowReporter = self->_editFlowReporter;
  id v7 = a4;
  id v8 = a3;
  [(PosterEditFlowReporter *)editFlowReporter willEditAvatar];
  [(CNSNaPSetupFlowManager *)self setAvatarPosterEditingContext:v7];
  id v11 = [v7 existingAvatar];
  [(CNSNaPSetupFlowManager *)self updateEditingStateForAction:0];
  id v9 = [v7 existingPoster];

  [(CNSNaPSetupFlowManager *)self updatePendingVisualIdentityWithAvatar:v11 contactPoster:v9 viewController:v8];
  id v10 = [v8 view];

  [(CNSNaPSetupFlowManager *)self editAvatar:v11 inView:v10];
}

- (void)validateAndUpdateAvatarDataForVisualIdentity:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 imageData];

  uint64_t v5 = [v3 thumbnailImageData];

  id v6 = [v3 fullscreenImageData];

  if (!(v4 | v5))
  {
    [v3 clearImage];
    goto LABEL_16;
  }
  if (v4)
  {
    if (v5) {
      goto LABEL_4;
    }
  }
  else
  {
    id v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v3 imageType];
      int v17 = 138412290;
      double v18 = v8;
    }
    id v9 = [v3 thumbnailImageData];
    [v3 setImageData:v9];

    objc_msgSend(v3, "setCropRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    if (v5)
    {
LABEL_4:
      if (v6) {
        goto LABEL_16;
      }
      goto LABEL_13;
    }
  }
  id v10 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v3 imageType];
    int v17 = 138412290;
    double v18 = v11;
  }
  id v12 = [v3 imageData];
  [v3 cropRect];
  BOOL v13 = CNImageUtilsCroppedImageDataFromFullSizeImageData();
  [v3 setThumbnailImageData:v13];

  if (!v6)
  {
LABEL_13:
    id v14 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      double v15 = [v3 imageType];
      int v17 = 138412290;
      double v18 = v15;
    }
    id v16 = [v3 imageData];
    [v3 setFullscreenImageData:v16];
  }
LABEL_16:
}

- (void)updateEditingContactWithVisualIdentity:(id)a3
{
  id v4 = a3;
  [(CNSNaPSetupFlowManager *)self validateAndUpdateAvatarDataForVisualIdentity:v4];
  uint64_t v5 = [(CNSNaPSetupFlowManager *)self editingContact];
  [v4 updateImageForContact:v5];

  id v6 = [v4 contacts];

  id v11 = [v6 firstObject];

  id v7 = [v11 givenName];
  id v8 = [(CNSNaPSetupFlowManager *)self editingContact];
  [v8 setGivenName:v7];

  id v9 = [v11 familyName];
  id v10 = [(CNSNaPSetupFlowManager *)self editingContact];
  [v10 setFamilyName:v9];
}

- (id)sharingSettingsViewControllerForOnboarding
{
  id v3 = [[CNMeCardSharingContactNameProvider alloc] initWithContact:self->_editingContact];
  id v4 = [[CNMeCardSharingContactAvatarProvider alloc] initWithContact:self->_editingContact];
  uint64_t v5 = [CNMeCardSharingSettingsViewController alloc];
  id v6 = [(CNSNaPSetupFlowManager *)self contactStore];
  LOBYTE(v9) = 1;
  id v7 = [(CNMeCardSharingSettingsViewController *)v5 initForOnboardingWithContactStore:v6 contact:self->_editingContact avatarProvider:v4 nameProvider:v3 sharingEnabled:1 selectedSharingAudience:1 showsWallpaperSuggestionsGalleryPicker:v9 headerMode:[(CNSNaPSetupFlowManager *)self mode]];

  return v7;
}

- (id)posterPreviewControllerWithPosterConfiguration:(id)a3 providerItem:(id)a4 mode:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [CNPosterPreviewViewController alloc];
  id v10 = [(CNSNaPSetupFlowManager *)self editingContact];
  id v11 = [(CNPosterPreviewViewController *)v9 initWithPosterConfiguration:v8 fromProviderItem:v7 contact:v10 editingState:[(CNSNaPSetupFlowManager *)self editingState] isEditingSNaP:[(CNSNaPSetupFlowManager *)self isEditingContactCard] ^ 1];

  [(CNPosterPreviewViewController *)v11 setDelegate:self];

  return v11;
}

- (id)wallpaperGalleryNavigationControllerForMode:(int64_t)a3
{
  uint64_t v5 = [CNSNaPSuggestionsGalleryViewController alloc];
  id v6 = [(CNSNaPSetupFlowManager *)self editingContact];
  id v7 = [(CNSNaPSuggestionsGalleryViewController *)v5 initWithMode:a3 contact:v6 isEditingSNaP:[(CNSNaPSetupFlowManager *)self isEditingContactCard] ^ 1 isOnboarding:[(CNSNaPSetupFlowManager *)self isOnboarding]];

  [(CNSNaPSuggestionsGalleryViewController *)v7 setDelegate:self];
  +[CNVisualIdentityPickerViewController defaultContentSize];
  -[CNSNaPSuggestionsGalleryViewController setPreferredContentSize:](v7, "setPreferredContentSize:");
  id v8 = [[CNPhotoPickerNavigationViewController alloc] initWithRootViewController:v7];
  [(CNPhotoPickerNavigationViewController *)v8 setAllowRotation:0];
  [(CNPhotoPickerNavigationViewController *)v8 setModalPresentationStyle:[(CNSNaPSetupFlowManager *)self defaultModalPresentationStyle]];

  return v8;
}

- (id)wallpaperGalleryNavigationController
{
  int64_t v3 = [(CNSNaPSetupFlowManager *)self mode];

  return [(CNSNaPSetupFlowManager *)self wallpaperGalleryNavigationControllerForMode:v3];
}

- (id)posterEditOptionsNavigationControllerForContact:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[CNPosterEditOptionsViewController alloc] initWithContact:v4 mode:[(CNSNaPSetupFlowManager *)self mode]];

  [(CNPosterEditOptionsViewController *)v5 setDelegate:self];
  +[CNVisualIdentityPickerViewController defaultContentSize];
  -[CNPosterEditOptionsViewController setPreferredContentSize:](v5, "setPreferredContentSize:");
  id v6 = [[CNPhotoPickerNavigationViewController alloc] initWithRootViewController:v5];
  [(CNPhotoPickerNavigationViewController *)v6 setAllowRotation:0];
  [(CNPhotoPickerNavigationViewController *)v6 setModalPresentationStyle:[(CNSNaPSetupFlowManager *)self defaultModalPresentationStyle]];

  return v6;
}

- (void)dealloc
{
  if ([(CNSNaPSetupFlowManager *)self isOnboarding]) {
    [(CNSNaPSetupFlowManager *)self dismissOnboardingIfNeeded];
  }
  int64_t v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && ![(CNSNaPSetupFlowManager *)self isEditingContactCard])
  {
    uint64_t v5 = [(CNSNaPSetupFlowManager *)self posterEditOptionsNavigationController];
    id v6 = [v5 presentingViewController];

    if (v6) {
      [(CNSNaPSetupFlowManager *)self dismissPosterEditingFlow];
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)CNSNaPSetupFlowManager;
  [(CNSNaPSetupFlowManager *)&v7 dealloc];
}

- (id)posterOnboardingWelcomeNavigationControllerForContact:(id)a3 hasOptionToSkip:(BOOL)a4 hasExistingNickname:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = [[CNPosterOnboardingWelcomeViewController alloc] initWithContact:v8];

  [(CNPosterOnboardingWelcomeViewController *)v9 setHasOptionToSkip:v6];
  [(CNPosterOnboardingWelcomeViewController *)v9 setHasExistingNickname:v5];
  [(CNPosterOnboardingWelcomeViewController *)v9 setDelegate:self];
  +[CNVisualIdentityPickerViewController defaultContentSize];
  -[CNPosterOnboardingWelcomeViewController setPreferredContentSize:](v9, "setPreferredContentSize:");
  id v10 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v11 = [v10 featureFlags];
  if ([v11 isFeatureEnabled:14])
  {
    BOOL v12 = [(CNSNaPSetupFlowManager *)self multiplePhoneNumbersTiedToAppleID];

    if (v12)
    {
      BOOL v13 = objc_opt_new();
      id v14 = [[CNPhotoPickerNavigationViewController alloc] initWithRootViewController:v13];
      [(CNPhotoPickerNavigationViewController *)v14 setAllowRotation:0];
      [(CNPhotoPickerNavigationViewController *)v14 setModalPresentationStyle:[(CNSNaPSetupFlowManager *)self defaultModalPresentationStyle]];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __116__CNSNaPSetupFlowManager_posterOnboardingWelcomeNavigationControllerForContact_hasOptionToSkip_hasExistingNickname___block_invoke;
      v18[3] = &unk_1E5497398;
      v18[4] = self;
      [v13 setOnCancel:v18];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __116__CNSNaPSetupFlowManager_posterOnboardingWelcomeNavigationControllerForContact_hasOptionToSkip_hasExistingNickname___block_invoke_258;
      v16[3] = &unk_1E54973C0;
      v16[4] = self;
      int v17 = v9;
      [v13 setOnContinue:v16];

      goto LABEL_6;
    }
  }
  else
  {
  }
  id v14 = [[CNPhotoPickerNavigationViewController alloc] initWithRootViewController:v9];
  [(CNPhotoPickerNavigationViewController *)v14 setAllowRotation:0];
  [(CNPhotoPickerNavigationViewController *)v14 setModalPresentationStyle:[(CNSNaPSetupFlowManager *)self defaultModalPresentationStyle]];
LABEL_6:

  return v14;
}

void __116__CNSNaPSetupFlowManager_posterOnboardingWelcomeNavigationControllerForContact_hasOptionToSkip_hasExistingNickname___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int64_t v3 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_18B625000, v3, OS_LOG_TYPE_INFO, "Detected that multiple numbers/devices are associated with Apple ID, user chose to cancel", v4, 2u);
  }

  [v2 dismissViewControllerAnimated:1 completion:0];
}

void __116__CNSNaPSetupFlowManager_posterOnboardingWelcomeNavigationControllerForContact_hasOptionToSkip_hasExistingNickname___block_invoke_258(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_18B625000, v4, OS_LOG_TYPE_INFO, "Detected that multiple numbers/devices are associated with Apple ID, user chose to continue", v6, 2u);
  }

  BOOL v5 = [v3 navigationController];

  [v5 pushViewController:*(void *)(a1 + 40) animated:1];
}

- (void)submitAndResetFlowReporter
{
  [(PosterEditFlowReporter *)self->_editFlowReporter didFinish];
  id v3 = objc_alloc_init(_TtC10ContactsUI22PosterEditFlowReporter);
  editFlowReporter = self->_editFlowReporter;
  self->_editFlowReporter = v3;
}

- (void)dismissViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v13 = a3;
  id v7 = a5;
  [(CNPRUISPosterSnapshotController *)self->_snapshotController releaseKeepActiveAssertionForReason:@"CNMeCardSharingEditPosterAvatarFlowManager"];
  if (v7) {
    id v8 = (void (**)(void))_Block_copy(v7);
  }
  else {
    id v8 = (void (**)(void))&__block_literal_global_251;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenterDelegate);

  if (WeakRetained)
  {
    id v10 = [(CNSNaPSetupFlowManager *)self presenterDelegate];
    [v10 sender:self dismissViewController:v13 completionHandler:v8];
  }
  else
  {
    id v11 = [v13 presentingViewController];

    if (v11)
    {
      BOOL v12 = [v13 presentingViewController];
      [v12 dismissViewControllerAnimated:0 completion:v8];
    }
    else
    {
      v8[2](v8);
    }
  }
}

- (void)dismissNavigationController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v12 = a3;
  id v8 = a5;
  [(CNPRUISPosterSnapshotController *)self->_snapshotController releaseKeepActiveAssertionForReason:@"CNMeCardSharingEditPosterAvatarFlowManager"];
  baseViewController = self->_baseViewController;
  if (baseViewController)
  {
    [(UIViewController *)baseViewController dismissViewControllerAnimated:v6 completion:v8];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenterDelegate);

    if (WeakRetained)
    {
      id v11 = [(CNSNaPSetupFlowManager *)self presenterDelegate];
      [v11 sender:self dismissViewController:v12];
    }
  }
}

- (void)dismissOnboardingIfNeeded
{
  id v3 = [(CNSNaPSetupFlowManager *)self onboardingWelcomeNavigationController];

  if (v3)
  {
    uint64_t v4 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing onboarding if needed", v6, 2u);
    }

    BOOL v5 = [(CNSNaPSetupFlowManager *)self onboardingWelcomeNavigationController];
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)presentNavigationController:(id)a3
{
  id v4 = a3;
  baseViewController = self->_baseViewController;
  id v8 = v4;
  if (baseViewController)
  {
    [(UIViewController *)baseViewController presentViewController:v4 animated:1 completion:0];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenterDelegate);

    if (WeakRetained)
    {
      id v7 = [(CNSNaPSetupFlowManager *)self presenterDelegate];
      [v7 sender:self presentViewController:v8];
    }
  }
}

- (void)startOnboardingFlowWithNicknameContact:(id)a3 meContact:(id)a4
{
  BOOL v7 = a3 != 0;
  if (a3) {
    id v8 = a3;
  }
  else {
    id v8 = a4;
  }
  self->_isOnboarding = 1;
  id v9 = v8;
  id v10 = a4;
  id v24 = a3;
  id v11 = (CNMutableContact *)[v10 mutableCopy];
  editingContact = self->_editingContact;
  self->_editingContact = v11;

  id v13 = [[CNVisualIdentity alloc] initWithContact:v9];
  pendingVisualIdentity = self->_pendingVisualIdentity;
  self->_pendingVisualIdentity = v13;

  double v15 = +[CNAvatarPosterCarouselEditingContext contextForCreateNew];
  [(CNSNaPSetupFlowManager *)self setAvatarPosterEditingContext:v15];

  id v16 = [MEMORY[0x1E4F5A6D8] unifiedMeContactMonitor];
  uint64_t v17 = [v16 isMeContact:v10];
  double v18 = [(CNSNaPSetupFlowManager *)self imagePickerController];
  [v18 setIsMeContact:v17];

  uint64_t v19 = (void *)[v9 mutableCopy];
  BOOL v20 = [(CNSNaPSetupFlowManager *)self posterOnboardingWelcomeNavigationControllerForContact:v19 hasOptionToSkip:1 hasExistingNickname:v7];
  [(CNSNaPSetupFlowManager *)self setOnboardingWelcomeNavigationController:v20];

  [(CNPRUISPosterSnapshotController *)self->_snapshotController acquireKeepActiveAssertionForReason:@"CNMeCardSharingEditPosterAvatarFlowManager"];
  editFlowReporter = self->_editFlowReporter;
  BOOL v22 = [(CNSNaPSetupFlowManager *)self imagePickerController];
  -[PosterEditFlowReporter startingFromOnboardingWithMeCard:](editFlowReporter, "startingFromOnboardingWithMeCard:", [v22 isMeContact]);

  id v23 = [(CNSNaPSetupFlowManager *)self onboardingWelcomeNavigationController];
  [(CNSNaPSetupFlowManager *)self presentNavigationController:v23];
}

- (void)startContactCardFlowForContact:(id)a3 isEditing:(BOOL)a4
{
  BOOL v4 = a4;
  id v23 = a3;
  objc_storeStrong((id *)&self->_editingContact, a3);
  BOOL v7 = [[CNVisualIdentity alloc] initWithContact:v23];
  pendingVisualIdentity = self->_pendingVisualIdentity;
  self->_pendingVisualIdentity = v7;

  self->_isEditingContactCard = 1;
  [(CNPRUISPosterSnapshotController *)self->_snapshotController acquireKeepActiveAssertionForReason:@"CNMeCardSharingEditPosterAvatarFlowManager"];
  editFlowReporter = self->_editFlowReporter;
  id v10 = [(CNSNaPSetupFlowManager *)self imagePickerController];
  -[PosterEditFlowReporter startingFromContactsWithMeCard:isEditing:](editFlowReporter, "startingFromContactsWithMeCard:isEditing:", [v10 isMeContact], v4);

  uint64_t v11 = *MEMORY[0x1E4F5A268];
  id v12 = [v23 imageData];
  if (!(*(unsigned int (**)(uint64_t, void *))(v11 + 16))(v11, v12)) {
    goto LABEL_6;
  }
  id v13 = [v23 wallpaper];
  id v14 = [v13 posterArchiveData];
  if (((*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v14) & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  double v15 = [v23 identifier];
  unint64_t v16 = [(CNSNaPSetupFlowManager *)self recentAvatarsCountForContactIdentifier:v15];

  if (!v16)
  {
    uint64_t v17 = [(CNSNaPSetupFlowManager *)self wallpaperGalleryNavigationController];
    [(CNSNaPSetupFlowManager *)self setGalleryNavigationController:v17];

    double v18 = [(CNSNaPSetupFlowManager *)self galleryNavigationController];
    [(CNSNaPSetupFlowManager *)self presentNavigationController:v18];

    [(CNSNaPSetupFlowManager *)self setIsCreatingNewAvatar:1];
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v19 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v20 = [v19 userInterfaceIdiom];

  if ((v20 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    [(CNSNaPSetupFlowManager *)self setMode:1];
  }
  uint64_t v21 = [(CNSNaPSetupFlowManager *)self posterEditOptionsNavigationControllerForContact:self->_editingContact];
  [(CNSNaPSetupFlowManager *)self setPosterEditOptionsNavigationController:v21];

  BOOL v22 = [(CNSNaPSetupFlowManager *)self posterEditOptionsNavigationController];
  [(CNSNaPSetupFlowManager *)self presentNavigationController:v22];

LABEL_10:
}

- (void)startEditFlowWithSNaPContact:(id)a3
{
  p_editingContact = &self->_editingContact;
  objc_storeStrong((id *)&self->_editingContact, a3);
  id v6 = a3;
  BOOL v7 = [[CNVisualIdentity alloc] initWithContact:v6];
  pendingVisualIdentity = self->_pendingVisualIdentity;
  self->_pendingVisualIdentity = v7;

  id v9 = [MEMORY[0x1E4F5A6D8] unifiedMeContactMonitor];
  uint64_t v10 = [v9 isMeContact:v6];
  uint64_t v11 = [(CNSNaPSetupFlowManager *)self imagePickerController];
  [v11 setIsMeContact:v10];

  editFlowReporter = self->_editFlowReporter;
  id v13 = [(CNSNaPSetupFlowManager *)self imagePickerController];
  -[PosterEditFlowReporter startingFromSNAPWithMeCard:](editFlowReporter, "startingFromSNAPWithMeCard:", [v13 isMeContact]);

  id v14 = [(CNSNaPSetupFlowManager *)self posterEditOptionsNavigationControllerForContact:*p_editingContact];
  [(CNSNaPSetupFlowManager *)self setPosterEditOptionsNavigationController:v14];

  [(CNPRUISPosterSnapshotController *)self->_snapshotController acquireKeepActiveAssertionForReason:@"CNMeCardSharingEditPosterAvatarFlowManager"];
  id v15 = [(CNSNaPSetupFlowManager *)self posterEditOptionsNavigationController];
  [(CNSNaPSetupFlowManager *)self presentNavigationController:v15];
}

- (int64_t)defaultModalPresentationStyle
{
  id v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return -2;
  }
  else {
    return 0;
  }
}

- (void)setGalleryNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_galleryNavigationController, a3);
  id v5 = a3;
  id v6 = [(CNSNaPSetupFlowManager *)self avatarEditFlowManager];
  [v6 setBaseNavigationController:v5];
}

- (CNSNaPSetupFlowManager)initWithBaseViewController:(id)a3 contactStore:(id)a4 mode:(int64_t)a5 presenterDelegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v35.receiver = self;
  v35.super_class = (Class)CNSNaPSetupFlowManager;
  id v14 = [(CNSNaPSetupFlowManager *)&v35 initWithNibName:0 bundle:0];
  id v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_baseViewController, a3);
    objc_storeWeak((id *)&v15->_presenterDelegate, v13);
    objc_storeStrong((id *)&v15->_contactStore, a4);
    unint64_t v16 = objc_alloc_init(CNMeCardSharingEditAvatarFlowManager);
    avatarEditFlowManager = v15->_avatarEditFlowManager;
    v15->_avatarEditFlowManager = v16;

    [(CNMeCardSharingEditAvatarFlowManager *)v15->_avatarEditFlowManager setDelegate:v15];
    double v18 = objc_alloc_init(CNVisualIdentityImagePickerController);
    imagePickerController = v15->_imagePickerController;
    v15->_imagePickerController = v18;

    [(CNVisualIdentityImagePickerController *)v15->_imagePickerController setDelegate:v15];
    uint64_t v20 = [MEMORY[0x1E4F5A4F0] defaultProvider];
    uint64_t v21 = [v20 newSerialSchedulerWithName:@"com.apple.ContactsUI.sharedProfileSetup.providerItem.workQueue"];
    providerItemRenderingQueue = v15->_providerItemRenderingQueue;
    v15->_providerItemRenderingQueue = (CNScheduler *)v21;

    id v23 = [MEMORY[0x1E4F5A4F0] defaultProvider];
    uint64_t v24 = [v23 mainThreadScheduler];
    providerItemCallbackQueue = v15->_providerItemCallbackQueue;
    v15->_providerItemCallbackQueue = (CNScheduler *)v24;

    id v26 = objc_alloc_init(CNPRUISPosterSnapshotController);
    snapshotController = v15->_snapshotController;
    v15->_snapshotController = v26;

    uint64_t v28 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v29 = [v28 userInterfaceIdiom];

    if ((v29 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      int64_t v30 = 0;
    }
    else {
      int64_t v30 = a5;
    }
    v15->_mode = v30;
    v15->_editingState = 0;
    v31 = objc_alloc_init(_TtC10ContactsUI22PosterEditFlowReporter);
    editFlowReporter = v15->_editFlowReporter;
    v15->_editFlowReporter = v31;

    char v33 = v15;
  }

  return v15;
}

- (CNSNaPSetupFlowManager)initWithPresenterDelegate:(id)a3 contactStore:(id)a4 mode:(int64_t)a5
{
  return [(CNSNaPSetupFlowManager *)self initWithBaseViewController:0 contactStore:a4 mode:a5 presenterDelegate:a3];
}

- (CNSNaPSetupFlowManager)initWithBaseViewController:(id)a3 contactStore:(id)a4 mode:(int64_t)a5
{
  return [(CNSNaPSetupFlowManager *)self initWithBaseViewController:a3 contactStore:a4 mode:a5 presenterDelegate:0];
}

+ (id)log
{
  if (log_cn_once_token_25 != -1) {
    dispatch_once(&log_cn_once_token_25, &__block_literal_global_233);
  }
  id v2 = (void *)log_cn_once_object_25;

  return v2;
}

void __29__CNSNaPSetupFlowManager_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNMeCardSharingEditPosterAvatarFlowManager");
  v1 = (void *)log_cn_once_object_25;
  log_cn_once_object_25 = (uint64_t)v0;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_24[0] != -1) {
    dispatch_once(descriptorForRequiredKeys_cn_once_token_24, &__block_literal_global_10740);
  }
  id v2 = (void *)descriptorForRequiredKeys_cn_once_object_24;

  return v2;
}

void __51__CNSNaPSetupFlowManager_descriptorForRequiredKeys__block_invoke()
{
  v14[17] = *MEMORY[0x1E4F143B8];
  os_log_t v0 = objc_msgSend(MEMORY[0x1E4F1B910], "descriptorForRequiredKeysForStyle:", 0, *MEMORY[0x1E4F1AE08]);
  uint64_t v1 = *MEMORY[0x1E4F1AE28];
  v14[1] = v0;
  v14[2] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1ADA8];
  v14[3] = *MEMORY[0x1E4F1AF98];
  v14[4] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1ADE8];
  v14[5] = *MEMORY[0x1E4F1AE98];
  v14[6] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1AE48];
  v14[7] = *MEMORY[0x1E4F1AE20];
  v14[8] = v4;
  v14[9] = *MEMORY[0x1E4F1AE30];
  v14[10] = v1;
  uint64_t v5 = *MEMORY[0x1E4F1AFC8];
  v14[11] = *MEMORY[0x1E4F1AF70];
  v14[12] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1AFC0];
  v14[13] = *MEMORY[0x1E4F1AFB8];
  v14[14] = v6;
  BOOL v7 = [MEMORY[0x1E4F1BAB8] descriptorForRequiredKeys];
  v14[15] = v7;
  id v8 = +[CNVisualIdentityPickerViewController descriptorForRequiredKeys];
  uint8_t v14[16] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:17];

  uint64_t v10 = (void *)MEMORY[0x1E4F1B8F8];
  id v11 = [NSString stringWithUTF8String:"+[CNSNaPSetupFlowManager descriptorForRequiredKeys]_block_invoke"];
  uint64_t v12 = [v10 descriptorWithKeyDescriptors:v9 description:v11];

  id v13 = (void *)descriptorForRequiredKeys_cn_once_object_24;
  descriptorForRequiredKeys_cn_once_object_24 = v12;
}

@end