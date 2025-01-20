@interface PhotosMessagesExtensionViewController
+ (void)initialize;
- (AEPackageTransport)transport;
- (BOOL)_handleTextInputPayload:(id)a3 withPayloadID:(id)a4;
- (BOOL)_isDrawerViewController;
- (BOOL)displaysAfterAppearance;
- (CGSize)contentSizeThatFits:(CGSize)a3;
- (NSMutableDictionary)loadingProgresses;
- (NSOrderedSet)previouslySelectedObjectIDs;
- (PUPickerCoordinator)pickerCoordinator;
- (PXLoadingStatusManager)loadingStatusManager;
- (PhotosMessagesExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIEdgeInsets)safeAreaInsetsForBubble:(id)a3;
- (id)_assetCollectionForURL:(id)a3;
- (id)_contactsForConversation:(id)a3;
- (id)_recipientsForConversation:(id)a3;
- (int64_t)shareOriginForSession:(id)a3 workflowCoordinator:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_confirmPicking:(id)a3 completionHandler:(id)a4;
- (void)_contentReadyForDisplayTimeout;
- (void)_didRemoveAssetArchiveWithIdentifier:(id)a3;
- (void)_didStageBubble:(id)a3;
- (void)_dismissDrawerViewControllerWithDesiredState:(int64_t)a3;
- (void)_finishPicking:(id)a3 withPreparationOptions:(id)a4;
- (void)_pickerDidPerformCancelAction:(id)a3;
- (void)_pickerDidPerformConfirmationAction:(id)a3;
- (void)_presentChildViewController:(id)a3 animated:(BOOL)a4;
- (void)_presentViewControllerForConversation:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5;
- (void)_removeAllChildViewControllersAnimated:(BOOL)a3;
- (void)_stageMessageForConversation:(id)a3 withTemplateItem:(id)a4 messageURL:(id)a5 summaryText:(id)a6;
- (void)_updatePresentedViewController;
- (void)bubbleDidBecomeReadyForDisplay:(id)a3;
- (void)coordinator:(id)a3 didFinishPicking:(id)a4 additionalSelectionState:(id)a5;
- (void)didBecomeActiveWithConversation:(id)a3;
- (void)didCancelSendingMessage:(id)a3 conversation:(id)a4;
- (void)didResignActiveWithConversation:(id)a3;
- (void)didTransitionToPresentationStyle:(unint64_t)a3;
- (void)explorerViewController:(id)a3 dismissViewControllerAnimated:(BOOL)a4 completion:(id)a5;
- (void)explorerViewController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)incrementShareCountAndLogAnalyticsForStagedAssetIDs:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)packageTransport:(id)a3 didStagePackages:(id)a4;
- (void)packageTransport:(id)a3 didUnstagePackageWithIdentifier:(id)a4;
- (void)requestResizeForBubble:(id)a3;
- (void)setLoadingProgresses:(id)a3;
- (void)setLoadingStatusManager:(id)a3;
- (void)setPickerCoordinator:(id)a3;
- (void)setPreviouslySelectedObjectIDs:(id)a3;
- (void)setTransport:(id)a3;
- (void)transcriptBubbleViewController:(id)a3 didSelectMomentShare:(id)a4;
- (void)updateSnapshotWithCompletionBlock:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeActiveWithConversation:(id)a3;
- (void)willResignActiveWithConversation:(id)a3;
- (void)willTransitionToPresentationStyle:(unint64_t)a3;
- (void)workflowCoordinator:(id)a3 didPublishToURL:(id)a4;
- (void)workflowCoordinator:(id)a3 workflowViewController:(id)a4 didFinishSession:(id)a5 withActivityState:(unint64_t)a6;
@end

@implementation PhotosMessagesExtensionViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslySelectedObjectIDs, 0);
  objc_storeStrong((id *)&self->_loadingProgresses, 0);
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_storeStrong((id *)&self->_pickerCoordinator, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong(&self->_pendingDidPresentBlock, 0);
  objc_storeStrong((id *)&self->_workflowCoordinator, 0);

  objc_storeStrong((id *)&self->_transcriptBubbleViewController, 0);
}

- (void)setPreviouslySelectedObjectIDs:(id)a3
{
}

- (NSOrderedSet)previouslySelectedObjectIDs
{
  return self->_previouslySelectedObjectIDs;
}

- (void)setLoadingProgresses:(id)a3
{
}

- (NSMutableDictionary)loadingProgresses
{
  return self->_loadingProgresses;
}

- (void)setLoadingStatusManager:(id)a3
{
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (void)setPickerCoordinator:(id)a3
{
}

- (PUPickerCoordinator)pickerCoordinator
{
  return self->_pickerCoordinator;
}

- (void)setTransport:(id)a3
{
}

- (AEPackageTransport)transport
{
  return self->_transport;
}

- (void)viewSafeAreaInsetsDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)PhotosMessagesExtensionViewController;
  [(PhotosMessagesExtensionViewController *)&v6 viewSafeAreaInsetsDidChange];
  v3 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(PhotosMessagesExtensionViewController *)self view];
    [v4 safeAreaInsets];
    v5 = NSStringFromUIEdgeInsets(v9);
    *(_DWORD *)buf = 138543362;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received new safe area insets %{public}@", buf, 0xCu);
  }
}

- (void)_pickerDidPerformConfirmationAction:(id)a3
{
  v3 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_pickerDidPerformConfirmationAction not implemented", v4, 2u);
  }
}

- (void)_pickerDidPerformCancelAction:(id)a3
{
  v3 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_pickerDidPerformCancelAction not implemented", v4, 2u);
  }
}

- (void)coordinator:(id)a3 didFinishPicking:(id)a4 additionalSelectionState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t numberOfPreselectedAssets = self->_numberOfPreselectedAssets;
  if (numberOfPreselectedAssets < 1)
  {
    v13 = [(PhotosMessagesExtensionViewController *)self previouslySelectedObjectIDs];
    if (![v13 count] && !objc_msgSend(v9, "count"))
    {

      [(PhotosMessagesExtensionViewController *)self setPreviouslySelectedObjectIDs:v9];
      goto LABEL_12;
    }
    v14 = [(PhotosMessagesExtensionViewController *)self previouslySelectedObjectIDs];
    unsigned int v15 = [v14 isEqualToOrderedSet:v9];

    [(PhotosMessagesExtensionViewController *)self setPreviouslySelectedObjectIDs:v9];
    if (v15) {
      goto LABEL_12;
    }
  }
  else
  {
    id v12 = [v9 count];
    self->_int64_t numberOfPreselectedAssets = 0;
    [(PhotosMessagesExtensionViewController *)self setPreviouslySelectedObjectIDs:v9];
    if ((id)numberOfPreselectedAssets == v12)
    {
LABEL_12:
      v23 = [(PhotosMessagesExtensionViewController *)self traitCollection];
      if ([v23 userInterfaceIdiom] != (id)1)
      {
        v24 = [(PhotosMessagesExtensionViewController *)self traitCollection];
        if ([v24 userInterfaceIdiom] != (id)6)
        {
          v25 = [(PhotosMessagesExtensionViewController *)self view];
          v26 = [v25 window];
          v27 = [v26 windowScene];
          v28 = (char *)[v27 interfaceOrientation] - 3;

          if ((unint64_t)v28 >= 2)
          {
            v29 = [(PhotosMessagesExtensionViewController *)self pickerCoordinator];
            [v29 resignSearchBarAsFirstResponder];

            [(PhotosMessagesExtensionViewController *)self requestPresentationStyle:0];
            goto LABEL_17;
          }
          goto LABEL_16;
        }
      }
LABEL_16:
      [(PhotosMessagesExtensionViewController *)self dismiss];
      goto LABEL_17;
    }
  }
  id v16 = objc_alloc((Class)PHManualFetchResult);
  uint64_t v17 = [v9 array];
  v18 = (void *)v17;
  if (v17) {
    v19 = (void *)v17;
  }
  else {
    v19 = &__NSArray0__struct;
  }
  v20 = +[PHPhotoLibrary px_deprecated_appPhotoLibrary];
  id v21 = [v16 initWithOids:v19 photoLibrary:v20 fetchType:PHFetchTypeAsset fetchPropertySets:0 identifier:0 registerIfNeeded:0];

  objc_initWeak(&location, self);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100001928;
  v30[3] = &unk_10000C9A0;
  id v31 = v10;
  objc_copyWeak(&v33, &location);
  id v22 = v21;
  id v32 = v22;
  [(PhotosMessagesExtensionViewController *)self _confirmPicking:v22 completionHandler:v30];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

LABEL_17:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  v11 = v10;
  if (off_100011200 == a6)
  {
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    unsigned int v15 = sub_100001AD8;
    id v16 = &unk_10000C938;
    uint64_t v17 = self;
    id v18 = v10;
    px_dispatch_on_main_queue();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PhotosMessagesExtensionViewController;
    [(PhotosMessagesExtensionViewController *)&v12 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
}

- (void)_didStageBubble:(id)a3
{
}

- (void)didCancelSendingMessage:(id)a3 conversation:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PhotosMessagesExtensionViewController;
  id v5 = a3;
  [(PhotosMessagesExtensionViewController *)&v10 didCancelSendingMessage:v5 conversation:a4];
  objc_super v6 = objc_msgSend(v5, "URL", v10.receiver, v10.super_class);

  v7 = PLSharingGetLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      id v9 = objc_msgSend(v6, "pl_redactedShareURL");
      *(_DWORD *)buf = 138543362;
      objc_super v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "User cancelled send of CMM for URL: %{public}@", buf, 0xCu);
    }
    PXExpungeMomentShareForURL();
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "User cancelled send of CMM with no URL", buf, 2u);
    }
  }
}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PhotosMessagesExtensionViewController;
  -[PhotosMessagesExtensionViewController didTransitionToPresentationStyle:](&v9, "didTransitionToPresentationStyle:");
  id v5 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    unint64_t v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Did transition to presentation style %{public}lu", buf, 0xCu);
  }

  objc_super v6 = (void (**)(void))objc_retainBlock(self->_pendingDidPresentBlock);
  id pendingDidPresentBlock = self->_pendingDidPresentBlock;
  self->_id pendingDidPresentBlock = 0;

  if (v6) {
    v6[2](v6);
  }
  if (!a3)
  {
    BOOL v8 = +[PXMessagesExtensionViewModel sharedRootViewModel];
    [v8 performChanges:&stru_10000C910];
  }
  self->_transitioningPresentationStyles = 0;
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  self->_transitioningPresentationStyles = 1;
  v9.receiver = self;
  v9.super_class = (Class)PhotosMessagesExtensionViewController;
  -[PhotosMessagesExtensionViewController willTransitionToPresentationStyle:](&v9, "willTransitionToPresentationStyle:");
  id v5 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    unint64_t v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will transition to presentation style %{public}lu", buf, 0xCu);
  }

  if (!self->_supportsNavigationBarTransition)
  {
    objc_super v6 = [(PhotosMessagesExtensionViewController *)self pickerCoordinator];
    v7 = [v6 configuration];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100001F60;
    v8[3] = &unk_10000C8F0;
    v8[4] = a3;
    [v7 performChanges:v8];
  }
}

- (void)willResignActiveWithConversation:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PhotosMessagesExtensionViewController;
  [(PhotosMessagesExtensionViewController *)&v6 willResignActiveWithConversation:a3];
  v3 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Will resign active", v5, 2u);
  }

  v4 = +[PXMessagesExtensionViewModel sharedRootViewModel];
  [v4 performChanges:&stru_10000C8D0];
}

- (void)didResignActiveWithConversation:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PhotosMessagesExtensionViewController;
  [(PhotosMessagesExtensionViewController *)&v8 didResignActiveWithConversation:a3];
  v4 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Did resign active", v7, 2u);
  }

  if ([(PhotosMessagesExtensionViewController *)self _isDrawerViewController])
  {
    id v5 = +[PXMessagesExtensionViewModel sharedRootViewModel];
    [v5 performChanges:&stru_10000C8B0];

    objc_super v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self name:@"DidStageBubble" object:0];
  }
}

- (void)didBecomeActiveWithConversation:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PhotosMessagesExtensionViewController;
  [(PhotosMessagesExtensionViewController *)&v6 didBecomeActiveWithConversation:a3];
  v4 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Did become active", v5, 2u);
  }

  self->_didBecomeActive = 1;
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PhotosMessagesExtensionViewController;
  id v4 = a3;
  [(PhotosMessagesExtensionViewController *)&v11 willBecomeActiveWithConversation:v4];
  id v5 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will become active", v10, 2u);
  }

  id v6 = [(PhotosMessagesExtensionViewController *)self presentationStyle];
  if (v6 == (id)3)
  {
    objc_storeStrong((id *)&qword_100011510, self);
    self->_isModal = 1;
  }
  BOOL v7 = [(PhotosMessagesExtensionViewController *)self _isDrawerViewController];
  [(PhotosMessagesExtensionViewController *)self _presentViewControllerForConversation:v4 presentationStyle:v6 animated:v7];

  if (v7)
  {
    objc_super v8 = +[PXMessagesExtensionViewModel sharedRootViewModel];
    [v8 registerChangeObserver:self context:off_100011208];
    [v8 performChanges:&stru_10000C890];
    objc_super v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:self selector:"_didStageBubble:" name:@"DidStageBubble" object:0];

    +[AEPhotosAssetPackageGenerator deleteTemporaryStorageWithTimeout:1.0];
  }
}

- (BOOL)_handleTextInputPayload:(id)a3 withPayloadID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = PLUIGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v5;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Handle text input payload: %@ with payload ID: %@", buf, 0x16u);
  }

  if (([v6 isEqualToString:@"com.apple.messages.datadetectors.photos"] & 1) != 0
    || [v6 isEqualToString:@"com.apple.messages.photos"])
  {
    objc_super v8 = [v5 objectForKeyedSubscript:@"Photos"];
    objc_super v9 = v8;
    if (v8 && [v8 count])
    {
      objc_super v10 = [v9 objectAtIndexedSubscript:0];
      objc_super v11 = [v10 objectForKeyedSubscript:@"Text"];
      objc_super v12 = [v10 objectForKeyedSubscript:@"Timestamp"];
      v13 = +[PXMessagesExtensionViewModel sharedRootViewModel];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100002668;
      v17[3] = &unk_10000C870;
      id v18 = v11;
      id v19 = v12;
      id v14 = v12;
      id v15 = v11;
      [v13 performChanges:v17];
    }
    else
    {
      objc_super v10 = PLUIGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "No array of photos in payload: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    objc_super v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unexpected payload ID: %@", buf, 0xCu);
    }
  }

  return 0;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if (off_100011208 != a5) {
    abort();
  }
  if ((v6 & 0x19) != 0)
  {
    id v9 = v8;
    [(PhotosMessagesExtensionViewController *)self _updatePresentedViewController];
    id v8 = v9;
  }
}

- (void)transcriptBubbleViewController:(id)a3 didSelectMomentShare:(id)a4
{
  id v5 = a3;
  char v6 = [(PhotosMessagesExtensionViewController *)self activeConversation];
  BOOL v7 = [v6 selectedMessage];
  unsigned __int8 v8 = [v7 isPending];

  if ((v8 & 1) == 0)
  {
    if ([v5 isSender]) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 2;
    }
    objc_super v10 = +[PXMessagesExtensionViewModel sharedRootViewModel];
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_1000028D8;
    id v16 = &unk_10000C848;
    id v11 = v5;
    id v17 = v11;
    uint64_t v18 = v9;
    [v10 performChanges:&v13];
    if ((objc_msgSend(v10, "isDrawerActive", v13, v14, v15, v16) & 1) == 0)
    {
      objc_super v12 = PLSharingGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Presenting modal from bubble tap: %@", buf, 0xCu);
      }

      [(PhotosMessagesExtensionViewController *)self requestPresentationStyle:3];
    }
  }
}

- (void)requestResizeForBubble:(id)a3
{
  id v4 = a3;
  id v5 = PLSharingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resize requested by bubble: %@", (uint8_t *)&v6, 0xCu);
  }

  [(PhotosMessagesExtensionViewController *)self requestResize];
}

- (UIEdgeInsets)safeAreaInsetsForBubble:(id)a3
{
  [(PhotosMessagesExtensionViewController *)self _balloonMaskEdgeInsets];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)bubbleDidBecomeReadyForDisplay:(id)a3
{
  id v4 = a3;
  if (!self->_contentReadyForDisplay)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = Current - self->_displayStartTime;
      int v8 = 134218242;
      double v9 = v7;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Triggering display of live bubble after %lf seconds: %@", (uint8_t *)&v8, 0x16u);
    }

    self->_contentReadyForDisplay = 1;
    [(PhotosMessagesExtensionViewController *)self setReadyForDisplay];
  }
}

- (void)workflowCoordinator:(id)a3 didPublishToURL:(id)a4
{
  id v5 = a4;
  double v6 = [(PhotosMessagesExtensionViewController *)self activeConversation];
  id v7 = objc_alloc_init((Class)MSMessageTemplateLayout);
  int v8 = [(PhotosMessagesExtensionViewController *)self _assetCollectionForURL:v5];
  if ([v8 assetCollectionType] == (id)7)
  {
    v24 = v6;
    PXCMMTitleAndSubtitleForAssetCollection();
    id v9 = 0;
    id v23 = 0;
    [v7 setCaption:v9];
    [v8 aggregateMediaType];
    [v8 assetCount];
    __int16 v10 = PXLocalizedAssetCountForUsage();
    [v7 setSubcaption:v10];
    id v11 = 0;
    if (v9 && v10)
    {
      objc_super v12 = PXLocalizedString();
      id v21 = v9;
      __int16 v22 = v10;
      id v11 = PFStringWithValidatedFormat();
    }
    v13 = objc_msgSend(v8, "preview", v21, v22);
    uint64_t v14 = [v13 previewImageData];
    id v15 = [v14 firstObject];

    if (v15)
    {
      id v16 = +[UIImage imageWithData:v15];
      [v7 setImage:v16];
    }
    double v6 = v24;
  }
  else
  {
    id v17 = PXLocalizedString();
    uint64_t v18 = [v6 localParticipantIdentifier];
    id v19 = [v18 UUIDString];
    id v20 = PFStringWithValidatedFormat();
    objc_msgSend(v7, "setCaption:", v20, v19);

    id v11 = 0;
  }
  [(PhotosMessagesExtensionViewController *)self _stageMessageForConversation:v6 withTemplateItem:v7 messageURL:v5 summaryText:v11];
}

- (void)workflowCoordinator:(id)a3 workflowViewController:(id)a4 didFinishSession:(id)a5 withActivityState:(unint64_t)a6
{
  if ([(PhotosMessagesExtensionViewController *)self presentationStyle]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  [(PhotosMessagesExtensionViewController *)self _dismissDrawerViewControllerWithDesiredState:v8];
  id v9 = +[PXMessagesExtensionViewModel sharedRootViewModel];
  [v9 performChanges:&stru_10000C820];
  if (a6 != 1 && self->_isModal) {
    [(PhotosMessagesExtensionViewController *)self dismiss];
  }
}

- (int64_t)shareOriginForSession:(id)a3 workflowCoordinator:(id)a4
{
  return 2;
}

- (void)explorerViewController:(id)a3 dismissViewControllerAnimated:(BOOL)a4 completion:(id)a5
{
  id v6 = +[PXMessagesExtensionViewModel sharedRootViewModel];
  [v6 performChanges:&stru_10000C800];
  [(id)qword_100011510 dismiss];
  id v5 = (void *)qword_100011510;
  qword_100011510 = 0;
}

- (void)explorerViewController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  id v6 = a4;
  id v7 = +[PXMessagesExtensionViewModel sharedRootViewModel];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100002F34;
  v9[3] = &unk_10000C4B0;
  id v10 = v6;
  id v8 = v6;
  [v7 performChanges:v9];
}

- (void)_didRemoveAssetArchiveWithIdentifier:(id)a3
{
  id v4 = a3;
  if (!self->numberOfStagedAssetsBeforeSend)
  {
    id v5 = [(PhotosMessagesExtensionViewController *)self transport];
    id v6 = [v5 orderedStagedIdentifiers];
    self->unint64_t numberOfStagedAssetsBeforeSend = (unint64_t)[v6 count];
  }
  id v7 = [(PhotosMessagesExtensionViewController *)self transport];
  [v7 unstagePackageWithIdentifier:v4 andNotify:0];

  id v8 = [(PhotosMessagesExtensionViewController *)self transport];
  id v9 = [v8 orderedStagedIdentifiers];
  if ([v9 count])
  {
  }
  else
  {
    unint64_t numberOfStagedAssetsBeforeSend = self->numberOfStagedAssetsBeforeSend;

    if (numberOfStagedAssetsBeforeSend)
    {
      v19[0] = CPAnalyticsPayloadGenericAssetCountKey;
      id v11 = +[NSNumber numberWithUnsignedInteger:self->numberOfStagedAssetsBeforeSend];
      v20[0] = v11;
      v19[1] = CPAnalyticsPayloadClassNameKey;
      objc_super v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      v20[1] = v13;
      uint64_t v14 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
      +[CPAnalytics sendEvent:@"com.apple.photos.CPAnalytics.assetExplorerSharedInMessages" withPayload:v14];

      self->unint64_t numberOfStagedAssetsBeforeSend = 0;
    }
  }
  id v15 = [(PhotosMessagesExtensionViewController *)self pickerCoordinator];
  id v16 = +[PHAsset localIdentifierWithUUID:v4];
  uint64_t v18 = v16;
  id v17 = +[NSArray arrayWithObjects:&v18 count:1];
  [v15 deselectAssetsWithIdentifiers:v17];
}

- (void)packageTransport:(id)a3 didUnstagePackageWithIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(PhotosMessagesExtensionViewController *)self activeConversation];
  [v6 _removeAssetArchiveWithIdentifier:v5 completionHandler:&stru_10000C7C0];
  self->unint64_t numberOfStagedAssetsBeforeSend = 0;
  id v7 = [(PhotosMessagesExtensionViewController *)self pickerCoordinator];
  id v8 = +[PHAsset localIdentifierWithUUID:v5];

  id v10 = v8;
  id v9 = +[NSArray arrayWithObjects:&v10 count:1];
  [v7 deselectAssetsWithIdentifiers:v9];
}

- (void)packageTransport:(id)a3 didStagePackages:(id)a4
{
  id v5 = a4;
  id v17 = self;
  id v6 = [(PhotosMessagesExtensionViewController *)self activeConversation];
  id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v18 = 0;
        uint64_t v14 = +[NSKeyedArchiver archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v18];
        id v15 = v18;
        if (v14)
        {
          [v6 _insertAssetArchive:v14 completionHandler:&stru_10000C7A0];
          id v16 = [v13 identifier];
          [v7 addObject:v16];
        }
        else
        {
          id v16 = PLUIGetLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v24 = v15;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Archiving error: %@", buf, 0xCu);
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v10);
  }

  if ([v7 count]) {
    [(PhotosMessagesExtensionViewController *)v17 incrementShareCountAndLogAnalyticsForStagedAssetIDs:v7];
  }
  v17->unint64_t numberOfStagedAssetsBeforeSend = 0;
}

- (void)incrementShareCountAndLogAnalyticsForStagedAssetIDs:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)PHPhotoLibrary);
  id v5 = +[PHPhotoLibrary systemPhotoLibraryURL];
  id v6 = [v4 initWithPhotoLibraryURL:v5];

  long long v19 = v6;
  [v6 librarySpecificFetchOptions];
  id v18 = v20 = v3;
  id v7 = +[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v3);
  PXIncrementShareCountForAssets();
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    uint64_t v13 = CPAnalyticsPayloadAssetsKey;
    uint64_t v14 = CPAnalyticsPayloadClassNameKey;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v15);
        v26[0] = v13;
        v26[1] = v14;
        v27[0] = v16;
        v27[1] = v9;
        id v17 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
        +[CPAnalytics sendEvent:@"com.apple.photos.CPAnalytics.stagedForSharingInMessages" withPayload:v17];

        id v15 = (char *)v15 + 1;
      }
      while (v11 != v15);
      id v11 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v11);
  }
}

- (void)_dismissDrawerViewControllerWithDesiredState:(int64_t)a3
{
  if (a3 == 3)
  {
    if (![(PhotosMessagesExtensionViewController *)self presentationStyle]) {
      return;
    }
    uint64_t v5 = 0;
    char v4 = 1;
    goto LABEL_10;
  }
  if (a3 == 2)
  {
    if ([(PhotosMessagesExtensionViewController *)self presentationStyle] == (id)1) {
      return;
    }
    char v4 = 0;
    uint64_t v5 = 1;
    goto LABEL_10;
  }
  if (a3 == 1 && [(PhotosMessagesExtensionViewController *)self presentationStyle])
  {
    char v4 = 0;
    uint64_t v5 = 0;
LABEL_10:
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100003924;
    v8[3] = &unk_10000C780;
    char v10 = v4;
    objc_copyWeak(&v9, &location);
    id v6 = objc_retainBlock(v8);
    id pendingDidPresentBlock = self->_pendingDidPresentBlock;
    self->_id pendingDidPresentBlock = v6;

    [(PhotosMessagesExtensionViewController *)self requestPresentationStyle:v5];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_updatePresentedViewController
{
  id v3 = +[PXMessagesExtensionViewModel sharedRootViewModel];
  char v4 = [v3 selectedURL];
  uint64_t v5 = [v3 presentedViewController];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v9 = PXAssertGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Presenting a modal with both a CMM workflow and a presented view controller. Only one will be shown", (uint8_t *)&v12, 2u);
    }

    goto LABEL_13;
  }
  if (v4)
  {
LABEL_13:
    id v8 = PLSharingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_msgSend(v4, "pl_redactedShareURL");
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Requesting modal presentation for CMM flow: %{public}@", (uint8_t *)&v12, 0xCu);
    }
LABEL_15:

    [(PhotosMessagesExtensionViewController *)self requestPresentationStyle:3];
    goto LABEL_16;
  }
  if (v5)
  {
    id v8 = PLSharingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Requesting modal presentation for view controller: %@", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_15;
  }
LABEL_16:
}

- (void)_removeAllChildViewControllersAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  char v4 = [(PhotosMessagesExtensionViewController *)self childViewControllers];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(UIViewController **)(*((void *)&v15 + 1) + 8 * (void)v8);
        if (v3)
        {
          uint64_t v13 = &stru_10000C730;
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_100003DDC;
          v14[3] = &unk_10000C6F0;
          v14[4] = v9;
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          v12[2] = sub_100003E24;
          v12[3] = &unk_10000C758;
          v12[4] = v9;
          +[UIView animateWithDuration:v14 animations:v12 completion:0.3];
        }
        else
        {
          sub_100003E38(v5, v9);
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      id v6 = v5;
    }
    while (v5);
  }

  transcriptBubbleViewController = self->_transcriptBubbleViewController;
  self->_transcriptBubbleViewController = 0;
}

- (void)_presentChildViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(PhotosMessagesExtensionViewController *)self addChildViewController:v6];
  uint64_t v7 = [(PhotosMessagesExtensionViewController *)self view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  long long v16 = [v6 view];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  long long v17 = [v6 view];
  [v17 setAutoresizingMask:18];

  if (v4)
  {
    long long v18 = [v6 view];
    [v18 setAlpha:0.0];

    long long v19 = [(PhotosMessagesExtensionViewController *)self view];
    long long v20 = [v6 view];
    [v19 addSubview:v20];

    [v6 didMoveToParentViewController:self];
    [(PhotosMessagesExtensionViewController *)self _setNeedsUpdateOfSupportedInterfaceOrientations];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100004094;
    v23[3] = &unk_10000C6F0;
    id v24 = v6;
    +[UIView animateWithDuration:v23 animations:0.3];
  }
  else
  {
    long long v21 = [(PhotosMessagesExtensionViewController *)self view];
    long long v22 = [v6 view];
    [v21 addSubview:v22];

    [v6 didMoveToParentViewController:self];
    [(PhotosMessagesExtensionViewController *)self _setNeedsUpdateOfSupportedInterfaceOrientations];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  BOOL v3 = [(PhotosMessagesExtensionViewController *)self childViewControllers];
  if ([v3 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      unint64_t v7 = 0;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v4);
          }
          v7 |= (unint64_t)[*(id *)(*((void *)&v12 + 1) + 8 * i) supportedInterfaceOrientations];
        }
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    else
    {
      unint64_t v7 = 0;
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PhotosMessagesExtensionViewController;
    unint64_t v7 = [(PhotosMessagesExtensionViewController *)&v11 supportedInterfaceOrientations];
  }

  return v7;
}

- (void)_presentViewControllerForConversation:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v56 = a3;
  [(PhotosMessagesExtensionViewController *)self _removeAllChildViewControllersAnimated:v5];
  if (a4 == 3)
  {
    id v14 = +[PXMessagesExtensionViewModel sharedRootViewModel];
    long long v15 = [v14 presentedViewController];
    long long v16 = [v14 selectedURL];
    id v17 = [v14 selectedActivityType];
    if (v16
      && (id v18 = v17,
          [(PhotosMessagesExtensionViewController *)self _assetCollectionForURL:v16],
          (long long v19 = objc_claimAutoreleasedReturnValue()) != 0)
      && (id v20 = [objc_alloc((Class)PXCMMPhotoKitContext) initWithAssetCollection:v19 activityType:v18 sourceType:1], v19, v20))
    {
      [v20 setSourceType:1];
      long long v21 = [(PhotosMessagesExtensionViewController *)self _recipientsForConversation:v56];
      [v20 setRecipients:v21];

      workflowCoordinator = self->_workflowCoordinator;
      if (!workflowCoordinator)
      {
        long long v23 = (PXCMMWorkflowCoordinator *)objc_alloc_init((Class)PXCMMWorkflowCoordinator);
        id v24 = self->_workflowCoordinator;
        self->_workflowCoordinator = v23;

        [(PXCMMWorkflowCoordinator *)self->_workflowCoordinator setDelegate:self];
        workflowCoordinator = self->_workflowCoordinator;
      }
      long long v25 = [(PXCMMWorkflowCoordinator *)workflowCoordinator workflowViewControllerWithContext:v20 embedInNavigationControllerOfClass:objc_opt_class()];
      [(PhotosMessagesExtensionViewController *)self _presentChildViewController:v25 animated:1];
    }
    else if (v15)
    {
      [(PhotosMessagesExtensionViewController *)self _presentChildViewController:v15 animated:0];
    }
    else
    {
      v47 = PLUIGetLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Requested a full screen view controller to present over Messages but failed to load content for it", (uint8_t *)&buf, 2u);
      }

      if (v16)
      {
        v48 = PLSharingGetLog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          v49 = objc_msgSend(v16, "pl_redactedShareURL");
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v49;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Failed to load a CMM context for a CMM bubble URL %@", (uint8_t *)&buf, 0xCu);
        }
        v50 = PXLocalizedString();
        v51 = PXLocalizedString();
        uint64_t v52 = +[UIAlertController alertControllerWithTitle:v50 message:v51 preferredStyle:1];
      }
      else
      {
        v50 = PXLocalizedString();
        v51 = PXLocalizedString();
        uint64_t v52 = +[UIAlertController alertControllerWithTitle:v50 message:v51 preferredStyle:1];
      }
      v53 = (void *)v52;

      v54 = PXLocalizedString();
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_100004A9C;
      v57[3] = &unk_10000C620;
      v57[4] = self;
      v55 = +[UIAlertAction actionWithTitle:v54 style:0 handler:v57];
      [v53 addAction:v55];

      [(PhotosMessagesExtensionViewController *)self presentViewController:v53 animated:1 completion:0];
    }

    goto LABEL_38;
  }
  if (a4 == 2)
  {
    uint64_t v8 = [v56 selectedMessage];
    double v9 = [v8 senderParticipantIdentifier];
    double v10 = [v56 localParticipantIdentifier];
    id v11 = [v9 isEqual:v10];

    id v12 = objc_alloc((Class)PXCMMTranscriptBubbleViewController);
    long long v13 = [v8 URL];
    id v14 = [v12 initWithURL:v13 isSender:v11];

    [v14 setDelegate:self];
    [v14 setTouchDelegate:self];
    objc_storeStrong((id *)&self->_transcriptBubbleViewController, v14);
  }
  else
  {
    v26 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Presenting default picker", (uint8_t *)&buf, 2u);
    }

    id v27 = objc_alloc_init((Class)AEPackageTransport);
    [v27 setDelegate:self];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v61 = 0x2020000000;
    uint64_t v62 = 0;
    v28 = [v56 draftAssetArchives];
    v29 = PXMap();

    if ([v29 count])
    {
      v30 = PLAssetExplorerGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v58 = 134217984;
        id v59 = [v29 count];
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Selecting %lu initial asset draft(s)", v58, 0xCu);
      }

      [v27 stagePackages:v29 andNotify:0];
    }
    id v31 = objc_alloc((Class)PHPickerConfiguration);
    id v32 = +[PHPhotoLibrary px_deprecated_appPhotoLibrary];
    id v33 = [v31 initWithPhotoLibraryAndOnlyReturnsIdentifiers:v32];

    [v33 setSelectionLimit:20];
    [v33 setSelection:3];
    v34 = PXMap();
    [v33 setPreselectedAssetIdentifiers:v34];

    v35 = [v33 preselectedAssetIdentifiers];
    self->_int64_t numberOfPreselectedAssets = (int64_t)[v35 count];

    if (a4) {
      uint64_t v36 = 10;
    }
    else {
      uint64_t v36 = 15;
    }
    [v33 setEdgesWithoutContentMargins:v36];
    [v33 setDisabledCapabilities:18];
    [v33 _setAllowsEncodingPolicyModification:0];
    id v37 = objc_alloc_init((Class)PXLoadingStatusManager);
    id v38 = objc_alloc((Class)PUPickerConfiguration);
    v39 = [(PhotosMessagesExtensionViewController *)self extensionContext];
    v40 = [v39 _auxiliaryConnection];
    id v41 = [v38 initWithPHPickerConfiguration:v33 connection:v40];

    v42 = +[PXPhotoPickerSettings sharedInstance];
    if ([v42 useNavBarAnimatedTransition])
    {
      v43 = [(PhotosMessagesExtensionViewController *)self traitCollection];
      p_supportsNavigationBarTransition = &self->_supportsNavigationBarTransition;
      self->_supportsNavigationBarTransition = [v43 userInterfaceIdiom] == 0;
    }
    else
    {
      p_supportsNavigationBarTransition = &self->_supportsNavigationBarTransition;
      self->_supportsNavigationBarTransition = 0;
    }

    if (*p_supportsNavigationBarTransition) {
      [v41 performChanges:&stru_10000C6C8];
    }
    id v45 = [objc_alloc((Class)PUPickerCoordinator) initWithPUConfiguration:v41 coordinatorActionHandler:self loadingStatusManager:v37];
    id v14 = [v45 viewController];
    [(PhotosMessagesExtensionViewController *)self setPickerCoordinator:v45];
    [(PhotosMessagesExtensionViewController *)self setTransport:v27];
    [(PhotosMessagesExtensionViewController *)self setLoadingStatusManager:v37];
    id v46 = objc_alloc_init((Class)NSMutableDictionary);
    [(PhotosMessagesExtensionViewController *)self setLoadingProgresses:v46];

    _Block_object_dispose(&buf, 8);
  }
  if (v14)
  {
    [(PhotosMessagesExtensionViewController *)self _presentChildViewController:v14 animated:v5];
LABEL_38:
  }
}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    BOOL v5 = +[PXCompleteMyMomentSettings sharedInstance];
    unsigned __int8 v6 = [v5 useDebugColors];

    if ([(PhotosMessagesExtensionViewController *)self _isDrawerViewController]
      || (v6 & 1) != 0)
    {
      uint64_t v8 = [(PhotosMessagesExtensionViewController *)self view];
      [v8 bounds];
      double v10 = v9;
      double v12 = v11;

      id v13 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", v10, v12);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100004E5C;
      v15[3] = &unk_10000C5F8;
      unsigned __int8 v16 = v6;
      v15[4] = self;
      id v14 = [v13 imageWithActions:v15];
      v4[2](v4, v14);
    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)PhotosMessagesExtensionViewController;
      [(PhotosMessagesExtensionViewController *)&v17 updateSnapshotWithCompletionBlock:v4];
    }
  }
  else
  {
    unint64_t v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "updateSnapshotWithCompletionBlock called with missing completion block", buf, 2u);
    }
  }
}

- (BOOL)displaysAfterAppearance
{
  if (self->_contentReadyForDisplay) {
    return 1;
  }
  self->_displayStartTime = CFAbsoluteTimeGetCurrent();
  objc_initWeak(&location, self);
  dispatch_time_t v4 = dispatch_time(0, 5000000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005054;
  v5[3] = &unk_10000C5D0;
  objc_copyWeak(&v6, &location);
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return self->_contentReadyForDisplay;
}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  transcriptBubbleViewController = self->_transcriptBubbleViewController;
  if (transcriptBubbleViewController)
  {
    -[PXTranscriptBubbleViewController contentSizeThatFits:](transcriptBubbleViewController, "contentSizeThatFits:", a3.width, a3.height);
    CGFloat width = v6;
    CGFloat height = v7;
  }
  else
  {
    uint64_t v8 = PLSharingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Asked for a transcript bubble size without a PXTranscriptBubbleViewController", v11, 2u);
    }
  }
  double v9 = width;
  double v10 = height;
  result.CGFloat height = v10;
  result.CGFloat width = v9;
  return result;
}

- (void)_finishPicking:(id)a3 withPreparationOptions:(id)a4
{
  id v6 = a3;
  id v45 = a4;
  v50 = [(PhotosMessagesExtensionViewController *)self transport];
  v49 = [(PhotosMessagesExtensionViewController *)self loadingStatusManager];
  id v7 = objc_alloc((Class)NSMutableSet);
  uint64_t v8 = [v50 expectedPackageIdentifiers];
  id v46 = [v7 initWithSet:v8];

  if (plsGreenTeaEnabled() && [v6 count])
  {
    double v9 = [v6 fetchedObjects];
    double v10 = PXMap();

    double v11 = [v6 photoLibrary];
    uint64_t v12 = (uint64_t)+[PHAsset countOfAssetsWithLocationFromUUIDs:v10 photoLibrary:v11];

    if (v12 >= 1)
    {
      id v13 = +[NSBundle mainBundle];
      id v14 = [v13 bundleIdentifier];

      uint64_t v44 = v12;
      plslogGreenTea();
    }
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v6;
  id v15 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (v15)
  {
    uint64_t v48 = *(void *)v63;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v63 != v48) {
          objc_enumerationMutation(obj);
        }
        objc_super v17 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        id v18 = objc_msgSend(v17, "uuid", v44);
        long long v19 = [v50 expectedPackageIdentifiers];
        unsigned int v20 = [v19 containsObject:v18];

        if (v20)
        {
          [v46 removeObject:v18];
        }
        else
        {
          [v50 addPendingPackageIdentifier:v18];
          id v21 = [objc_alloc((Class)AEPhotosAssetPackageGenerator) initWithAsset:v17];
          [v21 setPreparationOptions:v45];
          id v22 = [v21 beginGenerating];
          objc_initWeak(&location, self);
          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472;
          v55[2] = sub_100005730;
          v55[3] = &unk_10000C5A8;
          id v56 = v50;
          id v23 = v18;
          id v57 = v23;
          objc_copyWeak(&v60, &location);
          id v24 = v49;
          id v58 = v24;
          id v59 = self;
          if (([v21 retrieveGeneratedPackageWithCompletion:v55] & 1) == 0)
          {
            long long v25 = [v17 uuid];
            v26 = [v24 willBeginLoadOperationWithItemIdentifier:v25];

            id v27 = [v21 progress];
            [v27 setUserInfoObject:v26 forKey:@"PhotosMessagesExtensionProgressTrackingIDKey"];

            v28 = [v21 progress];
            v29 = NSStringFromSelector("fractionCompleted");
            [v28 addObserver:self forKeyPath:v29 options:4 context:off_100011200];

            v30 = [v21 progress];
            id v31 = [(PhotosMessagesExtensionViewController *)self loadingProgresses];
            [v31 setObject:v30 forKeyedSubscript:v23];
          }
          objc_destroyWeak(&v60);

          objc_destroyWeak(&location);
        }
      }
      id v15 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
    }
    while (v15);
  }

  id v32 = [v46 allObjects];
  [v50 removeAllExpectedPackagesWithIdentifiers:v32];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v33 = v32;
  id v34 = [v33 countByEnumeratingWithState:&v51 objects:v66 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v52;
    do
    {
      for (j = 0; j != v34; j = (char *)j + 1)
      {
        if (*(void *)v52 != v35) {
          objc_enumerationMutation(v33);
        }
        uint64_t v37 = *(void *)(*((void *)&v51 + 1) + 8 * (void)j);
        id v38 = [(PhotosMessagesExtensionViewController *)self loadingProgresses];
        v39 = [v38 objectForKey:v37];

        if (v39)
        {
          v40 = [v39 userInfo];
          id v41 = [v40 objectForKeyedSubscript:@"PhotosMessagesExtensionProgressTrackingIDKey"];
          [v49 didCancelLoadOperationWithTrackingID:v41];

          v42 = NSStringFromSelector("fractionCompleted");
          [v39 removeObserver:self forKeyPath:v42];

          v43 = [(PhotosMessagesExtensionViewController *)self loadingProgresses];
          [v43 removeObjectForKey:v37];
        }
      }
      id v34 = [v33 countByEnumeratingWithState:&v51 objects:v66 count:16];
    }
    while (v34);
  }
}

- (void)_confirmPicking:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[PXSharingConfidentialityController confidentialityCheckRequired](PXSharingConfidentialityController, "confidentialityCheckRequired")&& ([v6 fetchedObjects], v8 = objc_claimAutoreleasedReturnValue(), unsigned int v9 = +[PXSharingConfidentialityController confidentialWarningRequiredForAssets:](PXSharingConfidentialityController, "confidentialWarningRequiredForAssets:", v8), v8, v9))
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100005B50;
    v16[3] = &unk_10000C540;
    id v17 = v7;
    double v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = sub_100005B64;
    id v14 = &unk_10000C540;
    id v15 = v17;
    double v10 = +[PXSharingConfidentialityController confidentialityAlertWithConfirmAction:v16 abortAction:&v11];
    -[PhotosMessagesExtensionViewController px_presentOverTopmostPresentedViewController:animated:completion:](self, "px_presentOverTopmostPresentedViewController:animated:completion:", v10, 1, 0, v11, v12, v13, v14);
  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
}

- (void)_contentReadyForDisplayTimeout
{
  if (!self->_contentReadyForDisplay)
  {
    BOOL v3 = PLUIGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      transcriptBubbleViewController = self->_transcriptBubbleViewController;
      int v5 = 138412290;
      id v6 = transcriptBubbleViewController;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Content ready for display timed out for bubble %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_stageMessageForConversation:(id)a3 withTemplateItem:(id)a4 messageURL:(id)a5 summaryText:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = objc_alloc_init((Class)MSMessage);
  id v15 = [objc_alloc((Class)MSMessageLiveLayout) initWithAlternateLayout:v13];

  [v14 setLayout:v15];
  if (v11)
  {
    [v14 setURL:v11];
  }
  else
  {
    unsigned __int8 v16 = PLSharingGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Staging message with no URL", buf, 2u);
    }
  }
  [v14 setSummaryText:v12];

  id v17 = +[PXCompleteMyMomentSettings sharedInstance];
  unsigned int v18 = [v17 directSendMessages];

  if (v18)
  {
    [v10 sendMessage:v14 completionHandler:&stru_10000C4F0];
  }
  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    void v19[2] = sub_100005DEC;
    v19[3] = &unk_10000C518;
    v19[4] = self;
    [v10 insertMessage:v14 completionHandler:v19];
  }
}

- (id)_contactsForConversation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [(PhotosMessagesExtensionViewController *)self _recipientsForConversation:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) contact];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_recipientsForConversation:(id)a3
{
  id v3 = a3;
  id v4 = +[PXMessagesExtensionViewModel sharedRootViewModel];
  id v5 = [v4 recipients];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = +[NSMutableArray array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v18 = v3;
    uint64_t v9 = [v3 recipientAddresses];
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [objc_alloc((Class)PXRecipient) initWithAddress:*(void *)(*((void *)&v21 + 1) + 8 * i) nameComponents:0 recipientKind:0];
          long long v15 = v14;
          if (v14)
          {
            long long v16 = [v14 invalidAddressString];

            if (!v16) {
              [v8 addObject:v15];
            }
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    void v19[2] = sub_1000062FC;
    v19[3] = &unk_10000C4B0;
    id v7 = v8;
    id v20 = v7;
    [v4 performChanges:v19];

    id v3 = v18;
  }

  return v7;
}

- (BOOL)_isDrawerViewController
{
  return !self->_isModal
      && (unint64_t)[(PhotosMessagesExtensionViewController *)self presentationStyle] < 2;
}

- (id)_assetCollectionForURL:(id)a3
{
  id v3 = a3;
  id v4 = PXFetchAssetCollectionForCMMShareURL();
  id v5 = [v4 firstObject];
  if (!v5)
  {
    id v6 = PLSharingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_msgSend(v3, "pl_redactedShareURL");
      int v9 = 138543362;
      id v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to find asset collection for URL: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_contentReadyForDisplay = [(PhotosMessagesExtensionViewController *)self presentationStyle] != (id)2;
  v5.receiver = self;
  v5.super_class = (Class)PhotosMessagesExtensionViewController;
  [(PhotosMessagesExtensionViewController *)&v5 viewWillAppear:v3];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PhotosMessagesExtensionViewController;
  [(PhotosMessagesExtensionViewController *)&v10 viewDidLoad];
  BOOL v3 = +[PXCompleteMyMomentSettings sharedInstance];
  unsigned int v4 = [v3 useDebugColors];

  if (v4)
  {
    uint64_t v5 = +[UIColor yellowColor];
  }
  else if ([(PhotosMessagesExtensionViewController *)self presentationStyle] == (id)2 {
         || ([(PhotosMessagesExtensionViewController *)self traitCollection],
  }
             id v6 = objc_claimAutoreleasedReturnValue(),
             id v7 = [v6 userInterfaceIdiom],
             v6,
             v7 == (id)6))
  {
    uint64_t v5 = +[UIColor clearColor];
  }
  else
  {
    uint64_t v5 = +[UIColor systemBackgroundColor];
  }
  id v8 = (void *)v5;
  int v9 = [(PhotosMessagesExtensionViewController *)self view];
  [v9 setBackgroundColor:v8];

  -[PhotosMessagesExtensionViewController setAdditionalSafeAreaInsets:](self, "setAdditionalSafeAreaInsets:", 0.0, 0.0, 1.0, 0.0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PhotosMessagesExtensionViewController;
  [(PhotosMessagesExtensionViewController *)&v3 viewDidAppear:a3];
  if (qword_100011528 != -1) {
    dispatch_once(&qword_100011528, &stru_10000C468);
  }
}

- (PhotosMessagesExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PhotosMessagesExtensionViewController;
  unsigned int v4 = [(PhotosMessagesExtensionViewController *)&v6 initWithNibName:a3 bundle:a4];
  if (v4 && qword_100011520 != -1) {
    dispatch_once(&qword_100011520, &stru_10000C448);
  }
  return v4;
}

+ (void)initialize
{
  if (qword_100011518 != -1) {
    dispatch_once(&qword_100011518, &stru_10000C428);
  }
}

@end