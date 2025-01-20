@interface _UIShareInvitationViewServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
+ (void)initialize;
- (BOOL)_collaborationUIEnabled;
- (BOOL)_getTitle:(id *)a3 getMessage:(id *)a4 forError:(id)a5;
- (BOOL)_legacyAppearance;
- (BOOL)_primaryAuxiliarySwitchState;
- (BOOL)_secondaryAuxiliarySwitchState;
- (BOOL)_setContainerFromID:(id)a3;
- (BOOL)_shouldPresentError:(id)a3;
- (BOOL)_showAddPeople;
- (BOOL)_showRootFolder;
- (BOOL)allowInvitingOthers;
- (BOOL)currentUserIsOwner;
- (BOOL)currentUserIsOwnerOrAdmin;
- (BOOL)hasBeenRepresentedInFullscreen;
- (BOOL)hasPreparedForFolderSharing;
- (BOOL)initialSharing;
- (BOOL)isFolderShare;
- (BOOL)isPartOfCloudKitSharedFolder;
- (BOOL)isShowAddPeople;
- (BOOL)isShowingSpinner;
- (BOOL)itemIsInsideFolderShare;
- (BOOL)itemIsShareRoot;
- (BOOL)presentingError;
- (BOOL)serviceIndicatesAlreadyShared;
- (BOOL)shareURLUnreachable;
- (BOOL)shareViewControllerFolderShareIsPrepared:(id)a3;
- (BOOL)shareViewControllerInCollaborationMode:(id)a3;
- (BOOL)shareViewControllerIsDocumentShare:(id)a3;
- (BOOL)shareViewControllerIsFolderShare:(id)a3;
- (BOOL)shareViewControllerIsNotesOrRemindersOrDocSharing:(id)a3;
- (BOOL)shareViewControllerPrimaryAuxiliarySwitchState;
- (BOOL)shareViewControllerSecondaryAuxiliarySwitchState;
- (BOOL)shareViewControllerShowFullSettingsControls;
- (BOOL)useFileProviderFramework;
- (BRReachabilityMonitor)reachabilityMonitor;
- (CKContainer)container;
- (CKContainerSetupInfo)containerSetupInfo;
- (CKShare)originalShare;
- (CKShare)share;
- (NSDate)shareInvitationViewStartDate;
- (NSDictionary)participantDetails;
- (NSError)folderSharingPreparationError;
- (NSOperationQueue)workerQueue;
- (NSString)_auxiliaryActionTitle;
- (NSString)_folderSubitemName;
- (NSString)_headerActionTitle;
- (NSString)_headerSubtitle;
- (NSString)_initialHeaderSubtitle;
- (NSString)_mailSubject;
- (NSString)_mailTemplate;
- (NSString)_messageTemplate;
- (NSString)_primaryAuxiliarySwitchTitle;
- (NSString)_rootFolderTitle;
- (NSString)_secondaryAuxiliarySwitchTitle;
- (NSString)_sectionTitleForAuxiliarySwitches;
- (NSString)appName;
- (NSString)itemName;
- (NSString)itemUTI;
- (NSString)sharedByModifiedByText;
- (NSURL)itemURL;
- (NSURL)shareURL;
- (OS_dispatch_group)folderSharingPreparationGroup;
- (OS_dispatch_group)fullscreenRepresentationGroup;
- (OS_dispatch_semaphore)shareCreationSema;
- (UIImage)_headerPrimaryImage;
- (UIImage)_headerSecondaryImage;
- (UIImage)thumbnail;
- (UIViewController)unreachableViewController;
- (_UIShareInvitationViewControllerHost)hostingViewController;
- (_UIShareInvitationViewServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_UIShareOverviewController)viewController;
- (id)_alertControllerForLegacyApplication:(id)a3;
- (id)_fetchTopLevelSharedFolderURLWithError:(id *)a3;
- (id)_itemName;
- (id)editableParticipants;
- (id)fetchFPItemForID:(id)a3;
- (id)fileObserver;
- (id)modifiedByStringForSharedByMe:(BOOL)a3 owner:(id)a4 modifiedByMe:(BOOL)a5 lastEditor:(id)a6;
- (id)ownerNameComponents;
- (id)ownerStringForPerson:(id)a3;
- (id)rootItemName;
- (id)shareRootItemURL;
- (id)shareViewControllerAuxiliaryActionTitle:(id)a3;
- (id)shareViewControllerHeaderActionTitle:(id)a3;
- (id)shareViewControllerHeaderPrimaryImage;
- (id)shareViewControllerHeaderSecondaryImage;
- (id)shareViewControllerItemUTI:(id)a3;
- (id)shareViewControllerParticipantDetails;
- (id)shareViewControllerPrimaryAuxilarySwitchTitle;
- (id)shareViewControllerSecondaryAuxilarySwitchTitle;
- (id)shareViewControllerSubtitle:(id)a3;
- (id)shareViewControllerThumbnail:(id)a3;
- (id)sharingAppBundleIdentifier;
- (id)sharingAppBundleIdentifierOverride;
- (id)sharingAppName;
- (int)popoverPresentationMode;
- (int64_t)_hostApplicationType;
- (int64_t)mode;
- (int64_t)shareViewControllerCurrentParticipantsState;
- (unint64_t)_availablePermissions;
- (unint64_t)shareViewControllerAllowedPermissions:(id)a3;
- (void)_actuallyStopSharing;
- (void)_addParticipantsAndSaveForController:(id)a3 participants:(id)a4 permission:(int64_t)a5 completion:(id)a6;
- (void)_copyShareFromURLWithForceCreate:(BOOL)a3 completion:(id)a4;
- (void)_dismissForRecordWithError:(id)a3;
- (void)_enqueueCopyShareURLOperation:(id)a3 completion:(id)a4;
- (void)_getTitle:(id *)a3 getMessage:(id *)a4 forMAIDError:(id)a5;
- (void)_handleCopyShareURLError:(id)a3;
- (void)_loadInitialViewController;
- (void)_loadThumbnailForFileURL:(id)a3;
- (void)_makeExistingSubsharePreflightCheckWithCompletion:(id)a3;
- (void)_modifyAndSaveShare:(id)a3 existingError:(id)a4 controller:(id)a5 modifyBlock:(id)a6 completion:(id)a7;
- (void)_prepareForDisplayWithCompletion:(id)a3;
- (void)_prepareForFolderSharingIfNeeded;
- (void)_presentedURLChanged;
- (void)_presentedURLDeleted;
- (void)_processSubitemsWithProcessType:(unint64_t)a3 completion:(id)a4;
- (void)_refetchShareAndRetry:(id)a3;
- (void)_registerObserver;
- (void)_sanitizeForAvailablePermissions:(id)a3;
- (void)_saveShare:(id)a3 completion:(id)a4;
- (void)_setAppName:(id)a3;
- (void)_setAuxiliaryActionTitle:(id)a3;
- (void)_setAvailablePermissions:(unint64_t)a3;
- (void)_setCloudKitContainerSetupInfo:(id)a3;
- (void)_setCloudKitShare:(id)a3 containerID:(id)a4;
- (void)_setCloudKitThumbnail:(id)a3 title:(id)a4 type:(id)a5;
- (void)_setCollaborationUIEnabled:(BOOL)a3;
- (void)_setFolderSubitemName:(id)a3;
- (void)_setHeaderActionTitle:(id)a3;
- (void)_setHeaderPrimaryImage:(id)a3;
- (void)_setHeaderSecondaryImage:(id)a3;
- (void)_setHeaderSubtitle:(id)a3;
- (void)_setInitialHeaderSubtitle:(id)a3;
- (void)_setIsInPopoverMode:(BOOL)a3;
- (void)_setItemName:(id)a3;
- (void)_setLegacyAppearance:(BOOL)a3;
- (void)_setLinkedSystemVersion:(unsigned int)a3;
- (void)_setMailSubject:(id)a3;
- (void)_setMailSubject:(id)a3 template:(id)a4;
- (void)_setMailTemplate:(id)a3;
- (void)_setMessageTemplate:(id)a3;
- (void)_setParticipantDetails:(id)a3;
- (void)_setPrimaryAuxiliarySwitchState:(BOOL)a3;
- (void)_setPrimaryAuxiliarySwitchTitle:(id)a3;
- (void)_setRootFolderTitle:(id)a3;
- (void)_setSandboxingURLWrapper:(id)a3;
- (void)_setSecondaryAuxiliarySwitchState:(BOOL)a3;
- (void)_setSecondaryAuxiliarySwitchTitle:(id)a3;
- (void)_setSectionTitleForAuxiliarySwitches:(id)a3;
- (void)_setShowAddPeople:(BOOL)a3;
- (void)_setShowRootFolder:(BOOL)a3;
- (void)_setThumbnail:(id)a3;
- (void)_setTintColor:(id)a3;
- (void)_setupDocumentURL:(id)a3;
- (void)_setupViewControllerInContainedNavController;
- (void)_setupWithShare:(id)a3 error:(id)a4 initialShare:(BOOL)a5;
- (void)_updateAllowInvitingFromShare;
- (void)_updateCloudDocsShare;
- (void)_updateCloudKitShare;
- (void)_updateReachabilityStatus:(BOOL)a3;
- (void)_willAppearInRemoteViewController:(id)a3;
- (void)changeToTopLevelSharedFolderURL;
- (void)createUnreachableViewControllerIfNecessary;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)didReceiveMessageNamed:(id)a3 userInfo:(id)a4 reply:(id)a5;
- (void)dismissAction:(id)a3;
- (void)invalidate;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)performAfterFullscreenPresentation:(id)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)preflightAndPrepareIfFolderShare:(id)a3 completion:(id)a4;
- (void)reachabilityMonitor:(id)a3 didChangeReachabilityStatusTo:(BOOL)a4;
- (void)setAllowInvitingOthers:(BOOL)a3;
- (void)setAppName:(id)a3;
- (void)setContainer:(id)a3;
- (void)setContainerSetupInfo:(id)a3;
- (void)setFileObserver:(id)a3;
- (void)setFolderSharingPreparationError:(id)a3;
- (void)setFolderSharingPreparationGroup:(id)a3;
- (void)setFullscreenRepresentationGroup:(id)a3;
- (void)setHasBeenRepresentedInFullscreen:(BOOL)a3;
- (void)setHasPreparedForFolderSharing:(BOOL)a3;
- (void)setInitialSharing:(BOOL)a3;
- (void)setItemName:(id)a3;
- (void)setItemURL:(id)a3;
- (void)setItemUTI:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setOriginalShare:(id)a3;
- (void)setPopoverPresentationMode:(int)a3;
- (void)setPresentingError:(BOOL)a3;
- (void)setReachabilityMonitor:(id)a3;
- (void)setServiceIndicatesAlreadyShared:(BOOL)a3;
- (void)setShare:(id)a3;
- (void)setShareCreationSema:(id)a3;
- (void)setShareInvitationViewStartDate:(id)a3;
- (void)setShareURL:(id)a3;
- (void)setShareURLUnreachable:(BOOL)a3;
- (void)setSharedByModifiedByText:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setUnreachableViewController:(id)a3;
- (void)setViewController:(id)a3;
- (void)setWorkerQueue:(id)a3;
- (void)shareViewController:(id)a3 activityType:(id)a4 waitForUploadWithProgress:(id)a5 completion:(id)a6;
- (void)shareViewController:(id)a3 addParticipants:(id)a4 activityType:(id)a5 permission:(int64_t)a6 completion:(id)a7;
- (void)shareViewController:(id)a3 modifyShare:(id)a4 completion:(id)a5;
- (void)shareViewController:(id)a3 prepareActivity:(id)a4 completion:(id)a5;
- (void)shareViewController:(id)a3 presentError:(id)a4;
- (void)shareViewController:(id)a3 setFolderShareIsPrepared:(BOOL)a4;
- (void)shareViewController:(id)a3 willStartActivity:(id)a4 completion:(id)a5;
- (void)shareViewControllerCopyShareURL:(id)a3 completion:(id)a4;
- (void)shareViewControllerDidActivateShowSharedFolder;
- (void)shareViewControllerDidChooseTransport:(id)a3;
- (void)shareViewControllerDidFinishActivity:(id)a3;
- (void)shareViewControllerDidTogglePrimarySwitch:(BOOL)a3;
- (void)shareViewControllerDidToggleSecondarySwitch:(BOOL)a3;
- (void)shareViewControllerDismiss:(id)a3;
- (void)shareViewControllerLeaveShare:(id)a3;
- (void)shareViewControllerPerformAuxiliaryAction:(id)a3 completion:(id)a4;
- (void)shareViewControllerPerformHeaderAction:(id)a3 completion:(id)a4;
- (void)shareViewControllerStopSharing:(id)a3 overrideAlert:(BOOL)a4;
- (void)turnShowAddPeopleOn:(BOOL)a3;
- (void)updateSharedOrModifiedByForURL:(id)a3;
- (void)updateTemplateStrings;
@end

@implementation _UIShareInvitationViewServiceViewController

+ (void)initialize
{
  id v2 = +[BRUITestMessageCenter defaultCenter];
  [v2 startReceiver];
}

- (_UIShareInvitationViewServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v23.receiver = self;
  v23.super_class = (Class)_UIShareInvitationViewServiceViewController;
  v4 = [(_UIShareInvitationViewServiceViewController *)&v23 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = +[BRUITestMessageCenter defaultCenter];
    [v5 setHandler:v4 forMessageNamed:BRUITestSharingControllerUIValidationMessageName];
    id v6 = +[_UIShareInvitationAddParticipantController contactStore];
    v4->_popoverPresentationMode = 0;
    if (!qword_100061C98)
    {
      uint64_t v7 = UTTypeCreatePreferredIdentifierForTag(&stru_10004DE30, &stru_10004DE30, kUTTypeContent);
      v8 = (void *)qword_100061C98;
      qword_100061C98 = v7;
    }
    CDAddLocalizedSuffixForType();
    CDAddLocalizedSuffixForType();
    CDAddLocalizedSuffixForType();
    CDAddLocalizedSuffixForType();
    CDAddLocalizedSuffixForType();
    CDAddLocalizedSuffixForType();
    CDAddLocalizedSuffixForType();
    CDAddLocalizedSuffixForType();
    CDAddLocalizedSuffixForType();
    id v9 = objc_alloc_init((Class)NSOperationQueue);
    [(_UIShareInvitationViewServiceViewController *)v4 setWorkerQueue:v9];

    v10 = [(_UIShareInvitationViewServiceViewController *)v4 workerQueue];
    [v10 setMaxConcurrentOperationCount:1];

    [(_UIShareInvitationViewServiceViewController *)v4 setAppName:@"Unknown app"];
    v11 = [(_UIShareInvitationViewServiceViewController *)v4 containedNavController];
    [v11 setDelegate:v4];

    v12 = [(_UIShareOverviewController *)[_UIWaitingForShareViewController alloc] initWithDelegate:v4];
    [(_UIShareInvitationViewServiceViewController *)v4 setViewController:v12];

    v13 = +[BRReachabilityMonitor sharedReachabilityMonitor];
    [(_UIShareInvitationViewServiceViewController *)v4 setReachabilityMonitor:v13];

    v14 = [(_UIShareInvitationViewServiceViewController *)v4 reachabilityMonitor];
    [v14 addObserver:v4];

    [(_UIShareInvitationViewServiceViewController *)v4 _setAvailablePermissions:0];
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    [(_UIShareInvitationViewServiceViewController *)v4 setShareCreationSema:v15];

    dispatch_group_t v16 = dispatch_group_create();
    [(_UIShareInvitationViewServiceViewController *)v4 setFullscreenRepresentationGroup:v16];

    dispatch_group_t v17 = dispatch_group_create();
    [(_UIShareInvitationViewServiceViewController *)v4 setFolderSharingPreparationGroup:v17];

    [(_UIShareInvitationViewServiceViewController *)v4 setSharedByModifiedByText:&stru_10004DE30];
    v18 = +[UIShareFeature coOwners];
    unsigned int v19 = [v18 isEnabled];

    if (v19) {
      [(_UIShareInvitationViewServiceViewController *)v4 setAllowInvitingOthers:1];
    }
    v20 = cdui_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[INFO] Cloud sharing invitation view controller is ready and waiting", v22, 2u);
    }
  }
  return v4;
}

- (void)didReceiveMessageNamed:(id)a3 userInfo:(id)a4 reply:(id)a5
{
  id v6 = (void (**)(id, void *))a5;
  id v7 = objc_alloc((Class)BRGeometry);
  v8 = [(_UIShareInvitationViewServiceViewController *)self view];
  id v9 = [v8 window];
  id v10 = [v7 initWithView:v9];

  v11 = +[NSKeyedArchiver archivedDataWithRootObject:v10];
  v17[0] = v11;
  v16[0] = BRUITestViewHierarchyRecursiveDescription;
  v16[1] = BRUITestViewHierarchyLayerSnapshot;
  v12 = [(_UIShareInvitationViewServiceViewController *)self view];
  v13 = [v12 window];
  v14 = BRLayerSnapshot();
  v17[1] = v14;
  dispatch_semaphore_t v15 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v6[2](v6, v15);
}

- (void)invalidate
{
  [self->_fileObserver finishObserving];
  id fileObserver = self->_fileObserver;
  self->_id fileObserver = 0;

  if (self->_itemURL)
  {
    v4 = (void *)_CFURLPromiseCopyPhysicalURL();
    [(NSURL *)self->_itemURL stopAccessingSecurityScopedResource];
    [v4 stopAccessingSecurityScopedResource];
    itemURL = self->_itemURL;
    self->_itemURL = 0;
  }
  [(BRReachabilityMonitor *)self->_reachabilityMonitor removeObserver:self];
  reachabilityMonitor = self->_reachabilityMonitor;
  self->_reachabilityMonitor = 0;
}

- (void)dealloc
{
  [(_UIShareInvitationViewServiceViewController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_UIShareInvitationViewServiceViewController;
  [(_UIShareInvitationViewServiceViewController *)&v3 dealloc];
}

- (void)didMoveToParentViewController:(id)a3
{
  if (!a3)
  {
    v4 = [(_UIShareInvitationViewServiceViewController *)self hostingViewController];

    if (!v4)
    {
      [(_UIShareInvitationViewServiceViewController *)self invalidate];
    }
  }
}

- (void)_setLinkedSystemVersion:(unsigned int)a3
{
}

- (void)_setLegacyAppearance:(BOOL)a3
{
  self->_legacyAppearance = a3;
}

- (void)shareViewControllerDismiss:(id)a3
{
  if ([(_UIShareInvitationViewServiceViewController *)self initialSharing])
  {
    v4 = [(_UIShareInvitationViewServiceViewController *)self workerQueue];
    [v4 cancelAllOperations];
  }
  id v5 = [(_UIShareInvitationViewServiceViewController *)self hostingViewController];
  [v5 _dismissViewControllerWithError:0];
}

- (void)setInitialSharing:(BOOL)a3
{
  self->_initialSharing = a3;
}

+ (id)_exportedInterface
{
  id v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____UIShareInvitationViewController];
  Class v3 = NSClassFromString(@"_UIShareParticipantDetails");
  if (v3)
  {
    Class v4 = v3;
    uint64_t v5 = objc_opt_class();
    id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, objc_opt_class(), 0);
    [v2 setClasses:v6 forSelector:"_setParticipantDetails:" argumentIndex:0 ofReply:0];
  }

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____UIShareInvitationViewControllerHost];
}

- (_UIShareInvitationViewControllerHost)hostingViewController
{
  return (_UIShareInvitationViewControllerHost *)[(_UIShareInvitationViewServiceViewController *)self _remoteViewControllerProxy];
}

- (void)shareViewControllerPerformAuxiliaryAction:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [(_UIShareInvitationViewServiceViewController *)self hostingViewController];
  [v6 _performAuxiliaryActionWithCompletion:v5];
}

- (void)shareViewControllerPerformHeaderAction:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [(_UIShareInvitationViewServiceViewController *)self hostingViewController];
  [v6 _performHeaderActionWithCompletion:v5];
}

- (BOOL)useFileProviderFramework
{
  return _FPIsCloudDocsWithFPFSEnabled(self, a2);
}

- (void)_setupDocumentURL:(id)a3
{
  Class v4 = (NSString *)a3;
  [(_UIShareInvitationViewServiceViewController *)self setItemURL:v4];
  id v5 = cdui_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] Initializing for BR sharing with item %@", buf, 0xCu);
  }

  id v6 = [(_UIShareInvitationViewServiceViewController *)self itemURL];
  id v7 = (void *)_CFURLPromiseCopyPhysicalURL();

  v8 = [(_UIShareInvitationViewServiceViewController *)self itemURL];
  [v8 startAccessingSecurityScopedResource];

  [v7 startAccessingSecurityScopedResource];
  id v19 = 0;
  [(NSString *)v4 getPromisedItemResourceValue:&v19 forKey:NSURLLocalizedNameKey error:0];
  id v9 = v19;
  id v18 = 0;
  id v17 = 0;
  [(NSString *)v4 getPromisedItemResourceValue:&v18 forKey:NSURLTypeIdentifierKey error:&v17];
  id v10 = v18;
  id v11 = v17;
  [(_UIShareInvitationViewServiceViewController *)self setItemUTI:v10];
  if (v11)
  {
    v12 = [(_UIShareInvitationViewServiceViewController *)self viewController];
    [v12 presentError:v11];
  }
  else
  {
    [(_UIShareInvitationViewServiceViewController *)self setItemName:v9];
    v13 = [(_UIShareInvitationViewServiceViewController *)self viewController];
    [v13 setItemName:v9];

    v14 = cdui_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      itemName = self->_itemName;
      itemUTI = self->_itemUTI;
      *(_DWORD *)buf = 138412546;
      v21 = itemName;
      __int16 v22 = 2112;
      objc_super v23 = itemUTI;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[INFO] got item name %@, uti %@", buf, 0x16u);
    }

    [(_UIShareInvitationViewServiceViewController *)self _updateCloudDocsShare];
    [(_UIShareInvitationViewServiceViewController *)self _presentedURLChanged];
    [(_UIShareInvitationViewServiceViewController *)self _registerObserver];
    [(_UIShareInvitationViewServiceViewController *)self updateTemplateStrings];
  }
}

- (void)_setSandboxingURLWrapper:(id)a3
{
  id v4 = a3;
  [(_UIShareInvitationViewServiceViewController *)self setMode:0];
  id v5 = [v4 url];

  [(_UIShareInvitationViewServiceViewController *)self _setupDocumentURL:v5];
}

- (BOOL)isPartOfCloudKitSharedFolder
{
  id v2 = [(_UIShareInvitationViewServiceViewController *)self _rootFolderTitle];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)changeToTopLevelSharedFolderURL
{
  if ([(_UIShareInvitationViewServiceViewController *)self isPartOfCloudKitSharedFolder])
  {
    [(_UIShareInvitationViewServiceViewController *)self shareViewControllerDidActivateShowSharedFolder];
    [(_UIShareInvitationViewServiceViewController *)self shareViewControllerDismiss:0];
  }
  else
  {
    id v7 = [(_UIShareInvitationViewServiceViewController *)self shareRootItemURL];
    if (v7)
    {
      topLevelSharedFolderURL = self->_topLevelSharedFolderURL;
      self->_topLevelSharedFolderURL = 0;

      share = self->_share;
      self->_share = 0;

      shareURL = self->_shareURL;
      self->_shareURL = 0;

      self->_shareURLUnreachable = 0;
      originalShare = self->_originalShare;
      self->_originalShare = 0;

      [(_UIShareInvitationViewServiceViewController *)self _setupDocumentURL:v7];
    }
  }
}

- (void)_prepareForFolderSharingIfNeeded
{
  uint64_t v3 = [(_UIShareInvitationViewServiceViewController *)self itemURL];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(_UIShareInvitationViewServiceViewController *)self viewController];
    id v6 = [v5 delegate];
    id v7 = [(_UIShareInvitationViewServiceViewController *)self viewController];
    unsigned int v8 = [v6 shareViewControllerIsFolderShare:v7];

    if (v8)
    {
      id v9 = cdui_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[INFO] preparing for folder sharing", (uint8_t *)buf, 2u);
      }

      id v10 = self;
      objc_sync_enter(v10);
      if ([(_UIShareInvitationViewServiceViewController *)v10 hasPreparedForFolderSharing]&& ([(_UIShareInvitationViewServiceViewController *)v10 folderSharingPreparationError], id v11 = objc_claimAutoreleasedReturnValue(), v11, !v11))
      {
        objc_sync_exit(v10);
      }
      else
      {
        [(_UIShareInvitationViewServiceViewController *)v10 setHasPreparedForFolderSharing:1];
        [(_UIShareInvitationViewServiceViewController *)v10 setFolderSharingPreparationError:0];
        objc_sync_exit(v10);

        id v12 = objc_alloc((Class)BRSharePrepFolderForSharing);
        v13 = [(_UIShareInvitationViewServiceViewController *)v10 itemURL];
        v14 = (_UIShareInvitationViewServiceViewController *)[v12 initWithURL:v13];

        dispatch_semaphore_t v15 = [(_UIShareInvitationViewServiceViewController *)v10 folderSharingPreparationGroup];
        dispatch_group_enter(v15);
        objc_initWeak(buf, v14);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1000165EC;
        v18[3] = &unk_10004CF58;
        v18[4] = v10;
        objc_copyWeak(&v20, buf);
        dispatch_group_t v16 = v15;
        id v19 = v16;
        [(_UIShareInvitationViewServiceViewController *)v14 setPrepFolderSharingCompletionBlock:v18];
        id v17 = [(_UIShareInvitationViewServiceViewController *)v10 workerQueue];
        [v17 addOperation:v14];

        objc_destroyWeak(&v20);
        objc_destroyWeak(buf);

        id v10 = v14;
      }
    }
  }
}

- (void)_copyShareFromURLWithForceCreate:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)BRShareCopyOperation);
  id v7 = [(_UIShareInvitationViewServiceViewController *)self itemURL];
  id v8 = [v6 initWithURL:v7];

  id v9 = cdui_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[INFO] copying BR share", buf, 2u);
  }

  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_1000168C0;
  dispatch_semaphore_t v15 = &unk_10004CFA8;
  dispatch_group_t v16 = self;
  id v17 = v5;
  id v10 = v5;
  [v8 setRootShareCopyCompletionBlock:&v12];
  objc_msgSend(v8, "setQualityOfService:", 25, v12, v13, v14, v15, v16);
  id v11 = [(_UIShareInvitationViewServiceViewController *)self workerQueue];
  [v11 addOperation:v8];
}

- (void)_updateCloudDocsShare
{
  uint64_t v3 = [(_UIShareInvitationViewServiceViewController *)self unreachableViewController];

  if (v3)
  {
    self->_updateCloudDocsShareSkipped = 1;
  }
  else
  {
    self->_updateCloudDocsShareSkipped = 0;
    self->_refetchShareOnChange = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100016BF0;
    v8[3] = &unk_10004CFF8;
    v8[4] = self;
    id v4 = objc_retainBlock(v8);
    [(_UIShareInvitationViewServiceViewController *)self useFileProviderFramework];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100016FE0;
    v6[3] = &unk_10004D048;
    v6[4] = self;
    id v7 = v4;
    id v5 = v4;
    [(_UIShareInvitationViewServiceViewController *)self _copyShareFromURLWithForceCreate:0 completion:v6];
  }
}

- (void)preflightAndPrepareIfFolderShare:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSDate date];
  shareInvitationViewStartDate = self->_shareInvitationViewStartDate;
  self->_shareInvitationViewStartDate = v8;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100017540;
  v12[3] = &unk_10004D098;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(_UIShareInvitationViewServiceViewController *)self _makeExistingSubsharePreflightCheckWithCompletion:v12];
}

- (id)fetchFPItemForID:(id)a3
{
  id v3 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  dispatch_semaphore_t v15 = sub_1000178BC;
  dispatch_group_t v16 = sub_1000178CC;
  id v17 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = +[FPItemManager defaultManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000178D4;
  v9[3] = &unk_10004D0C0;
  id v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 fetchItemForItemID:v3 completionHandler:v9];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)_makeExistingSubsharePreflightCheckWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIShareInvitationViewServiceViewController *)self itemURL];
  if (!v5) {
    goto LABEL_4;
  }
  id v6 = (void *)v5;
  id v7 = [(_UIShareInvitationViewServiceViewController *)self viewController];
  id v8 = [v7 delegate];
  id v9 = [(_UIShareInvitationViewServiceViewController *)self viewController];
  unsigned __int8 v10 = [v8 shareViewControllerIsFolderShare:v9];

  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100017A64;
    v11[3] = &unk_10004D160;
    v11[4] = self;
    id v12 = v4;
    [(_UIShareInvitationViewServiceViewController *)self _processSubitemsWithProcessType:1 completion:v11];
  }
  else
  {
LABEL_4:
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)_processSubitemsWithProcessType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(_UIShareInvitationViewServiceViewController *)self itemURL];
  id v8 = [objc_alloc((Class)BRShareProcessSubitems) initWithURL:v7 processType:a3];
  [v8 setMaxSharedSubitemsBeforeFailure:4];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100018270;
  v11[3] = &unk_10004D0E8;
  id v12 = v6;
  id v9 = v6;
  [v8 setProcessSubitemsCompletionBlock:v11];
  [v8 setQualityOfService:25];
  unsigned __int8 v10 = [(_UIShareInvitationViewServiceViewController *)self workerQueue];
  [v10 addOperation:v8];
}

- (void)_setupWithShare:(id)a3 error:(id)a4 initialShare:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  [(_UIShareInvitationViewServiceViewController *)self setShare:a3];
  [(_UIShareInvitationViewServiceViewController *)self setInitialSharing:v5];
  id v9 = [(_UIShareInvitationViewServiceViewController *)self itemURL];
  [(_UIShareInvitationViewServiceViewController *)self updateSharedOrModifiedByForURL:v9];

  if ([(_UIShareInvitationViewServiceViewController *)self isShowingSpinner]) {
    [(_UIShareInvitationViewServiceViewController *)self _loadInitialViewController];
  }
  unsigned __int8 v10 = [(_UIShareInvitationViewServiceViewController *)self viewController];
  [v10 shareDidChange];

  if (v5)
  {
    id v11 = [(_UIShareInvitationViewServiceViewController *)self viewController];
    [v11 updatePermissionOptions];
  }
  if (v8)
  {
    id v12 = [(_UIShareInvitationViewServiceViewController *)self viewController];
    [v12 presentError:v8];
  }
  id v13 = cdui_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[INFO] share setup finished", v14, 2u);
  }
}

- (int64_t)_hostApplicationType
{
  id v2 = [(_UIShareInvitationViewServiceViewController *)self _hostApplicationBundleIdentifier];
  id v3 = [v2 lowercaseString];

  if ([v3 isEqualToString:@"com.apple.pages"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"com.apple.numbers"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"com.apple.keynote"])
  {
    int64_t v4 = 4;
  }
  else
  {
    int64_t v4 = 1;
  }

  return v4;
}

- (id)_alertControllerForLegacyApplication:(id)a3
{
  int64_t v4 = [(_UIShareInvitationViewServiceViewController *)self _hostApplicationType];
  switch(v4)
  {
    case 4:
      id v8 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      id v6 = [v8 localizedStringForKey:@"IWORK_LEGACY_TEXT_KEYNOTE", @"To share this presentation, get the latest version of Keynote from the App Store.", @"Localizable" value table];

      CFStringRef v7 = @"http://itunes.apple.com/app/keynote/id361285480?mt=8";
      goto LABEL_7;
    case 3:
      id v9 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      id v6 = [v9 localizedStringForKey:@"IWORK_LEGACY_TEXT_NUMBERS", @"To share this spreadsheet, get the latest version of Numbers from the App Store.", @"Localizable" value table];

      CFStringRef v7 = @"http://itunes.apple.com/app/numbers/id361304891?mt=8";
      goto LABEL_7;
    case 2:
      BOOL v5 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      id v6 = [v5 localizedStringForKey:@"IWORK_LEGACY_TEXT_PAGES", @"To share this document, get the latest version of Pages from the App Store.", @"Localizable" value table];

      CFStringRef v7 = @"http://itunes.apple.com/app/pages/id361309726?mt=8";
LABEL_7:
      unsigned __int8 v10 = +[NSURL URLWithString:v7];
      goto LABEL_9;
  }
  id v11 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v6 = [v11 localizedStringForKey:@"LEGACY_TEXT_OTHER" value:@"This application is too old and does not support this type of sharing. An update may be available." table:@"Localizable"];

  unsigned __int8 v10 = 0;
LABEL_9:
  id v12 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v13 = [v12 localizedStringForKey:@"IWORK_LEGACY_TITLE" value:@"Time to Update" table:@"Localizable"];
  uint64_t v14 = +[UIAlertController alertControllerWithTitle:v13 message:v6 preferredStyle:1];

  dispatch_semaphore_t v15 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  dispatch_group_t v16 = [v15 localizedStringForKey:@"ALERT_CANCEL_BUTTON_TITLE" value:@"Cancel" table:@"Localizable"];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100018800;
  v25[3] = &unk_10004D188;
  v25[4] = self;
  id v17 = +[UIAlertAction actionWithTitle:v16 style:1 handler:v25];
  [v14 addAction:v17];

  if (v10)
  {
    id v18 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    id v19 = [v18 localizedStringForKey:@"ALERT_APPSTORE_BUTTON_TITLE" value:@"App Store" table:@"Localizable"];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10001880C;
    v22[3] = &unk_10004CB68;
    id v23 = v10;
    v24 = self;
    id v20 = +[UIAlertAction actionWithTitle:v19 style:0 handler:v22];
    [v14 addAction:v20];
  }

  return v14;
}

- (BOOL)isShowingSpinner
{
  id v2 = [(_UIShareInvitationViewServiceViewController *)self viewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_setupViewControllerInContainedNavController
{
  uint64_t v3 = [(_UIShareInvitationViewServiceViewController *)self containedNavController];
  if (v3)
  {
    int64_t v4 = (void *)v3;
    BOOL v5 = [(_UIShareInvitationViewServiceViewController *)self containedNavController];
    id v6 = [v5 viewControllers];
    CFStringRef v7 = [v6 firstObject];
    id v8 = [(_UIShareInvitationViewServiceViewController *)self viewController];

    if (v7 != v8)
    {
      id v9 = [(_UIShareInvitationViewServiceViewController *)self containedNavController];
      unsigned __int8 v10 = [(_UIShareInvitationViewServiceViewController *)self viewController];
      id v17 = v10;
      id v11 = +[NSArray arrayWithObjects:&v17 count:1];
      [v9 setViewControllers:v11 animated:0];

      id v12 = [(_UIShareInvitationViewServiceViewController *)self unreachableViewController];
      if (![(_UIShareInvitationViewServiceViewController *)self isShowingSpinner]
        && (v12
         || ([(BRReachabilityMonitor *)self->_reachabilityMonitor isNetworkReachable] & 1) == 0))
      {
        id v13 = [v12 presentingViewController];
        uint64_t v14 = [(_UIShareInvitationViewServiceViewController *)self viewController];

        if (v13 != v14)
        {
          if (v12)
          {
            if (v13) {
              [v13 dismissViewControllerAnimated:0 completion:0];
            }
          }
          [(_UIShareInvitationViewServiceViewController *)self setUnreachableViewController:0];
          [(_UIShareInvitationViewServiceViewController *)self createUnreachableViewControllerIfNecessary];
          dispatch_semaphore_t v15 = [(_UIShareInvitationViewServiceViewController *)self viewController];
          dispatch_group_t v16 = [(_UIShareInvitationViewServiceViewController *)self unreachableViewController];
          [v15 presentReachabilityViewController:v16 animated:0];
        }
      }
    }
  }
}

- (void)setAllowInvitingOthers:(BOOL)a3
{
  self->_allowInvitingOthers = a3 & [(_UIShareInvitationViewServiceViewController *)self shareViewControllerIsNotesOrRemindersOrDocSharing:0];
}

- (void)_updateAllowInvitingFromShare
{
  BOOL v3 = [(_UIShareInvitationViewServiceViewController *)self currentUserIsOwnerOrAdmin];

  [(_UIShareInvitationViewServiceViewController *)self setAllowInvitingOthers:v3];
}

- (void)_loadInitialViewController
{
  if (self->_legacyAppearance)
  {
    BOOL v3 = [(_UIShareOverviewController *)[_UIShareOverviewLegacyController alloc] initWithDelegate:self];
    [(_UIShareInvitationViewServiceViewController *)self setViewController:v3];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100018CA0;
    v9[3] = &unk_10004C918;
    void v9[4] = self;
    [(_UIShareInvitationViewServiceViewController *)self performAfterFullscreenPresentation:v9];
  }
  else
  {
    [(_UIShareInvitationViewServiceViewController *)self _updateAllowInvitingFromShare];
    unsigned __int8 v4 = [(_UIShareInvitationViewServiceViewController *)self initialSharing];
    BOOL v5 = off_10004C7E0;
    if ((v4 & 1) == 0 && !self->_showAddPeople) {
      BOOL v5 = &off_10004C7E8;
    }
    id v6 = [objc_alloc(*v5) initWithDelegate:self];
    [(_UIShareInvitationViewServiceViewController *)self setViewController:v6];

    CFStringRef v7 = [(_UIShareInvitationViewServiceViewController *)self itemName];
    id v8 = [(_UIShareInvitationViewServiceViewController *)self viewController];
    [v8 setItemName:v7];

    [(_UIShareInvitationViewServiceViewController *)self _setupViewControllerInContainedNavController];
    [(_UIShareInvitationViewServiceViewController *)self _updateReachabilityStatus:0];
  }
}

- (void)_presentedURLChanged
{
  BOOL v3 = [(_UIShareInvitationViewServiceViewController *)self itemURL];
  [(_UIShareInvitationViewServiceViewController *)self _loadThumbnailForFileURL:v3];

  if (self->_refetchShareOnChange)
  {
    unsigned __int8 v4 = [(_UIShareInvitationViewServiceViewController *)self itemURL];
    id v6 = 0;
    [v4 getPromisedItemResourceValue:&v6 forKey:NSURLUbiquitousItemIsUploadedKey error:0];
    id v5 = v6;

    LODWORD(v4) = [v5 BOOLValue];
    if (v4) {
      [(_UIShareInvitationViewServiceViewController *)self _updateCloudDocsShare];
    }
  }
}

- (void)_presentedURLDeleted
{
}

- (void)_registerObserver
{
  if (!self->_mode && !self->_fileObserver)
  {
    objc_initWeak(&location, self);
    BOOL v3 = +[BRObservableFile observerForKey:0 onFileURL:self->_itemURL];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100018F08;
    v6[3] = &unk_10004C9D0;
    objc_copyWeak(&v7, &location);
    unsigned __int8 v4 = [v3 addObserverBlock:v6];
    id fileObserver = self->_fileObserver;
    self->_id fileObserver = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_loadThumbnailForFileURL:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 startAccessingSecurityScopedResource];
  id v6 = [(_UIShareInvitationViewServiceViewController *)self traitCollection];
  [v6 displayScale];
  double v8 = v7;

  if (self->_legacyAppearance) {
    double v9 = 72.0;
  }
  else {
    double v9 = 160.0;
  }
  if (self->_legacyAppearance) {
    double v10 = 72.0;
  }
  else {
    double v10 = 128.0;
  }
  id v11 = objc_msgSend(objc_alloc((Class)QLThumbnailGenerationRequest), "initWithFileAtURL:size:scale:representationTypes:", v4, -1, v9, v10, v8);
  id v12 = +[QLThumbnailGenerator sharedGenerator];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100019138;
  v14[3] = &unk_10004D1B0;
  id v15 = v4;
  dispatch_group_t v16 = self;
  unsigned __int8 v17 = v5;
  id v13 = v4;
  [v12 generateBestRepresentationForRequest:v11 completionHandler:v14];
}

- (void)_setThumbnail:(id)a3
{
  [(_UIShareInvitationViewServiceViewController *)self setThumbnail:a3];
  id v4 = [(_UIShareInvitationViewServiceViewController *)self viewController];
  [v4 updateThumbnail];
}

- (void)_setTintColor:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIShareInvitationViewServiceViewController *)self view];
  [v5 setTintColor:v4];
}

- (void)_setAppName:(id)a3
{
  [(_UIShareInvitationViewServiceViewController *)self setAppName:a3];

  [(_UIShareInvitationViewServiceViewController *)self _updateAllowInvitingFromShare];
}

- (void)_prepareForDisplayWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = +[UIColor systemGroupedBackgroundColor];
  id v6 = [(_UIShareInvitationViewServiceViewController *)self viewController];
  double v7 = [v6 view];
  [v7 setBackgroundColor:v5];

  double v8 = [(_UIShareInvitationViewServiceViewController *)self viewController];
  [v8 setDelegate:self];

  [(_UIShareInvitationViewServiceViewController *)self _setupViewControllerInContainedNavController];
  id v9 = [(_UIShareInvitationViewServiceViewController *)self viewController];
  [v9 preferredContentSize];
  v4[2](v4);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UIShareInvitationViewServiceViewController;
  id v4 = a3;
  [(_UIShareInvitationViewServiceViewController *)&v10 preferredContentSizeDidChangeForChildContentContainer:v4];
  id v5 = [(_UIShareInvitationViewServiceViewController *)self hostingViewController];
  [v4 preferredContentSize];
  double v7 = v6;
  double v9 = v8;

  objc_msgSend(v5, "_requestContentSize:", v7, v9);
}

- (void)_setMailSubject:(id)a3 template:(id)a4
{
  id v6 = a4;
  [(_UIShareInvitationViewServiceViewController *)self _setMailSubject:a3];
  [(_UIShareInvitationViewServiceViewController *)self _setMailTemplate:v6];
}

- (void)_setParticipantDetails:(id)a3
{
  if (self->_participantDetails != a3) {
    objc_storeStrong((id *)&self->_participantDetails, a3);
  }

  _objc_release_x1();
}

- (void)_setIsInPopoverMode:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  self->_popoverPresentationMode = v3;
  id v4 = [(_UIShareInvitationViewServiceViewController *)self viewController];
  [v4 setPopoverPresentationMode:v3];
}

- (void)_setCloudKitContainerSetupInfo:(id)a3
{
  if (a3) {
    -[_UIShareInvitationViewServiceViewController setContainerSetupInfo:](self, "setContainerSetupInfo:");
  }
}

- (void)_willAppearInRemoteViewController:(id)a3
{
  id v4 = [(_UIShareInvitationViewServiceViewController *)self view];
  uint64_t v3 = [v4 window];
  [v3 makeKeyWindow];
}

- (void)_updateCloudKitShare
{
  self->_refetchShareOnChange = 0;
  uint64_t v3 = [(CKShare *)self->_share participants];
  id v4 = [v3 count];

  share = self->_share;
  if ((unint64_t)v4 > 1)
  {
    if (share && self->_container)
    {
      +[NSDate timeIntervalSinceReferenceDate];
      double v7 = self->_share;
      container = self->_container;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100019820;
      v10[3] = &unk_10004D1D8;
      v10[4] = self;
      BOOL v11 = (unint64_t)v4 < 2;
      [(CKShare *)v7 _getDecryptedShareInContainer:container completionHandler:v10];
    }
  }
  else
  {
    [(_UIShareInvitationViewServiceViewController *)self _sanitizeForAvailablePermissions:share];
    [(_UIShareInvitationViewServiceViewController *)self _setupWithShare:self->_share error:0 initialShare:1];
    id v9 = [(_UIShareInvitationViewServiceViewController *)self itemName];
    id v6 = [(_UIShareInvitationViewServiceViewController *)self viewController];
    [v6 setItemName:v9];
  }
}

- (BOOL)_setContainerFromID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_containerSetupInfo)
  {
    id v6 = [objc_alloc((Class)CKContainer) initWithContainerSetupInfo:self->_containerSetupInfo];
    goto LABEL_5;
  }
  if (v4)
  {
    id v6 = [objc_alloc((Class)CKContainer) initWithContainerID:v4];
LABEL_5:
    double v7 = v6;
    [(_UIShareInvitationViewServiceViewController *)self setContainer:v6];

    double v8 = [(_UIShareInvitationViewServiceViewController *)self _hostApplicationBundleIdentifier];
    id v9 = [(_UIShareInvitationViewServiceViewController *)self container];
    [v9 setSourceApplicationBundleIdentifier:v8];

    objc_super v10 = cdui_default_log();
    BOOL v11 = 1;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v12 = [(_UIShareInvitationViewServiceViewController *)self container];
      id v13 = [v12 sourceApplicationBundleIdentifier];
      int v16 = 138412546;
      unsigned __int8 v17 = v5;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[INFO] Set up container with ID %@, source app id %@", (uint8_t *)&v16, 0x16u);
    }
    goto LABEL_10;
  }
  uint64_t v14 = cdui_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
    sub_10002E050();
  }

  objc_super v10 = +[NSError errorWithDomain:@"_UIShareErrorDomain" code:1 userInfo:0];
  [(_UIShareInvitationViewServiceViewController *)self shareViewController:0 presentError:v10];
  BOOL v11 = 0;
LABEL_10:

  return v11;
}

- (void)_setCloudKitThumbnail:(id)a3 title:(id)a4 type:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  [(_UIShareInvitationViewServiceViewController *)self setMode:1];
  if (v8)
  {
    [(_UIShareInvitationViewServiceViewController *)self setItemName:v8];
  }
  else
  {
    objc_super v10 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    BOOL v11 = [v10 localizedStringForKey:@"Untitled" value:@"Untitled" table:@"Localizable"];
    [(_UIShareInvitationViewServiceViewController *)self setItemName:v11];
  }
  if (v9) {
    uint64_t v12 = (uint64_t)v9;
  }
  else {
    uint64_t v12 = qword_100061C98;
  }
  [(_UIShareInvitationViewServiceViewController *)self setItemUTI:v12];

  if (v16)
  {
    id v13 = +[UIImage imageWithData:v16];
    [(_UIShareInvitationViewServiceViewController *)self setThumbnail:v13];

    uint64_t v14 = [(_UIShareInvitationViewServiceViewController *)self viewController];
    [v14 updateThumbnail];
  }
  if (v8)
  {
    [(_UIShareInvitationViewServiceViewController *)self setItemName:v8];
    id v15 = [(_UIShareInvitationViewServiceViewController *)self viewController];
    [v15 setItemName:v8];
  }
  [(_UIShareInvitationViewServiceViewController *)self setInitialSharing:1];
  [(_UIShareInvitationViewServiceViewController *)self updateTemplateStrings];
  [(_UIShareInvitationViewServiceViewController *)self _loadInitialViewController];
}

- (void)_setCloudKitShare:(id)a3 containerID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(_UIShareInvitationViewServiceViewController *)self setMode:1];
  id v8 = [v6 valueForKey:CKShareTitleKey];
  if (v8) {
    [(_UIShareInvitationViewServiceViewController *)self setItemName:v8];
  }
  [(_UIShareInvitationViewServiceViewController *)self setItemUTI:qword_100061C98];
  id v9 = [v6 objectForKeyedSubscript:CKShareTypeKey];
  if (([v9 isEqualToString:@"com.apple.notes.note"] & 1) != 0
    || [v9 isEqualToString:@"com.apple.notes.folder"])
  {
    [(_UIShareInvitationViewServiceViewController *)self setItemUTI:v9];
  }
  objc_super v10 = [v6 valueForKey:CKShareThumbnailImageDataKey];
  BOOL v11 = +[UIImage imageWithData:v10];

  if (v11) {
    [(_UIShareInvitationViewServiceViewController *)self setThumbnail:v11];
  }
  [(_UIShareInvitationViewServiceViewController *)self setShare:v6];
  unsigned int v12 = [(_UIShareInvitationViewServiceViewController *)self _setContainerFromID:v7];

  if (v12)
  {
    id v13 = cdui_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [(_UIShareInvitationViewServiceViewController *)self itemName];
      share = self->_share;
      int v17 = 138412546;
      __int16 v18 = v14;
      __int16 v19 = 2112;
      id v20 = share;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[INFO] Initializing for CK sharing with item name %@, share %@", (uint8_t *)&v17, 0x16u);
    }
    [(_UIShareInvitationViewServiceViewController *)self _updateCloudKitShare];
    [(_UIShareInvitationViewServiceViewController *)self updateTemplateStrings];
  }
  id v16 = [(_UIShareInvitationViewServiceViewController *)self shareCreationSema];
  dispatch_semaphore_signal(v16);
}

- (void)updateTemplateStrings
{
  uint64_t v3 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v4 = [v3 localizedStringForKey:@"MAIL_TEMPLATE_BODY" value:@"<br><br>#LINK_FRAGMENT#" table:@"Localizable"];
  id v5 = [(_UIShareInvitationViewServiceViewController *)self itemUTI];
  id v6 = _CDAdaptLocalizedStringForItemType();
  [(_UIShareInvitationViewServiceViewController *)self _setMailTemplate:v6];

  id v7 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v8 = [v7 localizedStringForKey:@"MAIL_TEMPLATE_SUBJECT" value:@"“#ITEM_NAME#”" table:@"Localizable"];
  id v9 = [(_UIShareInvitationViewServiceViewController *)self itemUTI];
  objc_super v10 = _CDAdaptLocalizedStringForItemType();
  [(_UIShareInvitationViewServiceViewController *)self _setMailSubject:v10];

  [(_UIShareInvitationViewServiceViewController *)self _setMessageTemplate:&stru_10004DE30];
}

- (void)_setAvailablePermissions:(unint64_t)a3
{
  if ((~(_BYTE)a3 & 3) != 0) {
    unint64_t v3 = a3;
  }
  else {
    unint64_t v3 = a3 ^ 3;
  }
  if ((~(_BYTE)v3 & 0xC) == 0) {
    v3 ^= 0xCuLL;
  }
  if (self->_hasValidPermissionOptions)
  {
    unint64_t availablePermissions = self->_availablePermissions;
    self->_unint64_t availablePermissions = v3;
    self->_hasValidPermissionOptions = 1;
    if (availablePermissions == v3) {
      return;
    }
  }
  else
  {
    self->_unint64_t availablePermissions = v3;
    self->_hasValidPermissionOptions = 1;
  }
  id v5 = [(_UIShareInvitationViewServiceViewController *)self viewController];
  [v5 updatePermissionOptions];
}

- (void)_sanitizeForAvailablePermissions:(id)a3
{
  id v10 = a3;
  id v4 = [v10 owner];
  unsigned int v5 = [v4 isCurrentUser];

  id v6 = v10;
  if (v5)
  {
    unint64_t availablePermissions = self->_availablePermissions;
    if ((availablePermissions & 2) != 0)
    {
      BOOL v8 = [v10 publicPermission] == (id)1;
      id v6 = v10;
      if (v8) {
        goto LABEL_15;
      }
      uint64_t v9 = 1;
      goto LABEL_14;
    }
    if ((availablePermissions & 4) != 0)
    {
      if ([v10 publicPermission] == (id)3)
      {
        BOOL v8 = [v10 publicPermission] == (id)2;
        id v6 = v10;
        if (v8) {
          goto LABEL_15;
        }
        uint64_t v9 = 2;
        goto LABEL_14;
      }
      unint64_t availablePermissions = self->_availablePermissions;
    }
    id v6 = v10;
    if ((availablePermissions & 8) != 0)
    {
      BOOL v8 = [v10 publicPermission] == (id)2;
      id v6 = v10;
      if (v8)
      {
        uint64_t v9 = 3;
LABEL_14:
        [v6 setPublicPermission:v9];
        id v6 = v10;
      }
    }
  }
LABEL_15:
}

- (void)_dismissForRecordWithError:(id)a3
{
  id v4 = a3;
  if ([(_UIShareInvitationViewServiceViewController *)self initialSharing])
  {
    unsigned int v5 = [(_UIShareInvitationViewServiceViewController *)self workerQueue];
    [v5 cancelAllOperations];
  }
  id v6 = cdui_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] record: dismissing because of error (%@)", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(_UIShareInvitationViewServiceViewController *)self hostingViewController];
  [v7 _dismissViewControllerWithError:v4];
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v9 = a4;
  if ([v9 conformsToProtocol:&OBJC_PROTOCOL___BRShareInvitationNavigationStackController])
  {
    id v6 = v9;
    id v7 = [(_UIShareInvitationViewServiceViewController *)self containedNavController];
    int v8 = [v7 disappearingViewController];
    [v6 willNavigateFromViewController:v8];
  }
}

- (void)reachabilityMonitor:(id)a3 didChangeReachabilityStatusTo:(BOOL)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001A554;
  v4[3] = &unk_10004D200;
  v4[4] = self;
  BOOL v5 = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)_updateReachabilityStatus:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(_UIShareInvitationViewServiceViewController *)self unreachableViewController];

  if ([(BRReachabilityMonitor *)self->_reachabilityMonitor isNetworkReachable]) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    id v10 = [(_UIShareInvitationViewServiceViewController *)self unreachableViewController];
    BOOL v11 = [v10 presentingViewController];
    [v11 dismissViewControllerAnimated:v3 completion:0];

    [(_UIShareInvitationViewServiceViewController *)self setUnreachableViewController:0];
    if (self->_updateCloudDocsShareSkipped
      && [(_UIShareInvitationViewServiceViewController *)self isShowingSpinner])
    {
      dispatch_time_t v12 = dispatch_time(0, 2000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001A7D0;
      block[3] = &unk_10004C918;
      block[4] = self;
      dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    int v8 = cdui_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] Network is reachable, and we are displaying the unreachable view controller; dismissing",
        v13,
        2u);
    }
    goto LABEL_17;
  }
  if (([(BRReachabilityMonitor *)self->_reachabilityMonitor isNetworkReachable] & 1) == 0
    && !v5)
  {
    id v7 = cdui_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[INFO] Network is not reachable, and we are not displaying the unreachable view controller; presenting",
        v13,
        2u);
    }

    if (![(_UIShareInvitationViewServiceViewController *)self isShowingSpinner])
    {
      [(_UIShareInvitationViewServiceViewController *)self createUnreachableViewControllerIfNecessary];
      int v8 = [(_UIShareInvitationViewServiceViewController *)self viewController];
      id v9 = [(_UIShareInvitationViewServiceViewController *)self unreachableViewController];
      [v8 presentReachabilityViewController:v9 animated:v3];

LABEL_17:
    }
  }
}

- (void)createUnreachableViewControllerIfNecessary
{
  BOOL v3 = [(_UIShareInvitationViewServiceViewController *)self unreachableViewController];

  if (!v3)
  {
    id v7 = [[BRNetworkUnreachableViewController alloc] initForInitialSharing:[(_UIShareInvitationViewServiceViewController *)self initialSharing]];
    id v4 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:24 target:self action:"dismissAction:"];
    BOOL v5 = [v7 topViewController];
    BOOL v6 = [v5 navigationItem];
    [v6 setRightBarButtonItem:v4];

    [v7 setModalTransitionStyle:2];
    [(_UIShareInvitationViewServiceViewController *)self setUnreachableViewController:v7];
  }
}

- (void)dismissAction:(id)a3
{
}

- (id)shareViewControllerAuxiliaryActionTitle:(id)a3
{
  return [(_UIShareInvitationViewServiceViewController *)self _auxiliaryActionTitle];
}

- (BOOL)shareViewControllerInCollaborationMode:(id)a3
{
  return [(_UIShareInvitationViewServiceViewController *)self _collaborationUIEnabled];
}

- (id)shareViewControllerSubtitle:(id)a3
{
  if ([(_UIShareInvitationViewServiceViewController *)self initialSharing]) {
    [(_UIShareInvitationViewServiceViewController *)self _initialHeaderSubtitle];
  }
  else {
  id v4 = [(_UIShareInvitationViewServiceViewController *)self _headerSubtitle];
  }

  return v4;
}

- (id)shareViewControllerHeaderActionTitle:(id)a3
{
  return [(_UIShareInvitationViewServiceViewController *)self _headerActionTitle];
}

- (unint64_t)shareViewControllerAllowedPermissions:(id)a3
{
  return self->_availablePermissions;
}

- (id)shareViewControllerThumbnail:(id)a3
{
  return [(_UIShareInvitationViewServiceViewController *)self thumbnail];
}

- (id)shareViewControllerParticipantDetails
{
  return [(_UIShareInvitationViewServiceViewController *)self participantDetails];
}

- (id)shareViewControllerPrimaryAuxilarySwitchTitle
{
  return [(_UIShareInvitationViewServiceViewController *)self _primaryAuxiliarySwitchTitle];
}

- (BOOL)shareViewControllerPrimaryAuxiliarySwitchState
{
  return [(_UIShareInvitationViewServiceViewController *)self _primaryAuxiliarySwitchState];
}

- (id)shareViewControllerSecondaryAuxilarySwitchTitle
{
  return [(_UIShareInvitationViewServiceViewController *)self _secondaryAuxiliarySwitchTitle];
}

- (BOOL)shareViewControllerSecondaryAuxiliarySwitchState
{
  return [(_UIShareInvitationViewServiceViewController *)self _secondaryAuxiliarySwitchState];
}

- (void)shareViewControllerDidTogglePrimarySwitch:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIShareInvitationViewServiceViewController *)self hostingViewController];
  [v4 _cloudSharingControllerDidModifyPrimarySwitch:v3];
}

- (void)shareViewControllerDidToggleSecondarySwitch:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIShareInvitationViewServiceViewController *)self hostingViewController];
  [v4 _cloudSharingControllerDidModifySecondarySwitch:v3];
}

- (void)shareViewControllerDidActivateShowSharedFolder
{
  id v2 = [(_UIShareInvitationViewServiceViewController *)self hostingViewController];
  [v2 _cloudSharingControllerDidActivateShowSharedFolder];
}

- (int64_t)shareViewControllerCurrentParticipantsState
{
  BOOL v3 = [(_UIShareInvitationViewServiceViewController *)self editableParticipants];
  id v4 = v3;
  if (self->_share && (unint64_t)[v3 count] > 1)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      int64_t v5 = 0;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          BOOL v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v11, "isCurrentUser", (void)v13) & 1) == 0)
          {
            if ([v11 role] == (id)2)
            {
              if (v5 == 2) {
                goto LABEL_21;
              }
              int64_t v5 = 1;
            }
            else if ([v11 role] == (id)3)
            {
              if (v5 == 1)
              {
LABEL_21:

                int64_t v5 = 3;
                goto LABEL_24;
              }
              int64_t v5 = 2;
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      int64_t v5 = 0;
    }
  }
  else if ([(_UIShareInvitationViewServiceViewController *)self shareViewControllerAllowOthersToInvite])
  {
    int64_t v5 = 1;
  }
  else
  {
    int64_t v5 = 2;
  }
LABEL_24:

  return v5;
}

- (BOOL)shareViewControllerShowFullSettingsControls
{
  if (self->_initialSharing && !self->_share) {
    return 1;
  }
  BOOL v3 = [(_UIShareInvitationViewServiceViewController *)self share];
  id v4 = [v3 publicPermission];

  if (v4 != (id)1) {
    return 0;
  }

  return [(_UIShareInvitationViewServiceViewController *)self currentUserIsOwner];
}

- (void)shareViewControllerDidChooseTransport:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIShareInvitationViewServiceViewController *)self hostingViewController];
  [v5 _cloudSharingControllerDidChooseTransport:v4];
}

- (id)shareViewControllerHeaderPrimaryImage
{
  return [(_UIShareInvitationViewServiceViewController *)self _headerPrimaryImage];
}

- (id)shareViewControllerHeaderSecondaryImage
{
  return [(_UIShareInvitationViewServiceViewController *)self _headerSecondaryImage];
}

- (void)performAfterFullscreenPresentation:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (self->_hasBeenRepresentedInFullscreen)
  {
    id v5 = dispatch_get_global_queue(25, 0);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001B0EC;
    v11[3] = &unk_10004D228;
    id v6 = &v12;
    void v11[4] = self;
    id v12 = v4;
    id v7 = v4;
    dispatch_async(v5, v11);
  }
  else
  {
    id v8 = cdui_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] Requesting that the host app dissmisses us to be represented in fullscreen", buf, 2u);
    }

    self->_hasBeenRepresentedInFullscreen = 1;
    uint64_t v9 = [(_UIShareInvitationViewServiceViewController *)self fullscreenRepresentationGroup];
    dispatch_group_enter(v9);

    id v5 = [(_UIShareInvitationViewServiceViewController *)self hostingViewController];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001AEAC;
    v13[3] = &unk_10004D228;
    id v6 = &v14;
    v13[4] = self;
    id v14 = v4;
    id v10 = v4;
    [v5 _dismissForActivityRepresentation:v13];
  }
}

- (void)shareViewController:(id)a3 willStartActivity:(id)a4 completion:(id)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001B1D8;
  v6[3] = &unk_10004D250;
  id v7 = self;
  id v8 = a5;
  id v5 = v8;
  [(_UIShareInvitationViewServiceViewController *)v7 performAfterFullscreenPresentation:v6];
}

- (id)sharingAppBundleIdentifierOverride
{
  id v2 = [(_UIShareInvitationViewServiceViewController *)self share];
  BOOL v3 = [v2 objectForKeyedSubscript:CKShareTypeKey];

  if (v3)
  {
    if ([v3 isEqualToString:@"pages"])
    {
      CFStringRef v4 = @"com.apple.Pages";
    }
    else if ([v3 isEqualToString:@"numbers"])
    {
      CFStringRef v4 = @"com.apple.Numbers";
    }
    else if ([v3 isEqualToString:@"key"])
    {
      CFStringRef v4 = @"com.apple.Keynote";
    }
    else
    {
      CFStringRef v4 = 0;
    }
  }
  else
  {
    CFStringRef v4 = 0;
  }

  return (id)v4;
}

- (id)sharingAppBundleIdentifier
{
  BOOL v3 = [(_UIShareInvitationViewServiceViewController *)self sharingAppBundleIdentifierOverride];
  CFStringRef v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(_UIShareInvitationViewServiceViewController *)self _hostApplicationBundleIdentifier];
  }
  id v6 = v5;

  return v6;
}

- (id)sharingAppName
{
  BOOL v3 = [(_UIShareInvitationViewServiceViewController *)self shareURL];
  CFStringRef v4 = v3;
  if (v3)
  {
    id v5 = [v3 path];
    id v6 = [v5 componentsSeparatedByString:@"/"];

    if ((unint64_t)[v6 count] < 2)
    {
      id v8 = 0;
    }
    else
    {
      id v7 = [v6 objectAtIndexedSubscript:1];
      id v8 = [v7 capitalizedString];
    }
    if ([v8 isEqualToString:@"Iclouddrive"])
    {
      uint64_t v9 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      uint64_t v10 = [v9 localizedStringForKey:@"MAIL_TEMPLATE_BRICK_ICLOUD_DRIVE" value:@"iCloud Drive" table:@"Localizable"];

      id v8 = (void *)v10;
    }
    else if ([v8 isEqualToString:@"Share"])
    {
      id v11 = [(_UIShareInvitationViewServiceViewController *)self appName];
LABEL_11:
      id v12 = v11;

      goto LABEL_14;
    }
    if (v8)
    {
      id v11 = v8;
      id v8 = v11;
      goto LABEL_11;
    }
  }
  id v12 = [(_UIShareInvitationViewServiceViewController *)self appName];
LABEL_14:

  return v12;
}

- (void)shareViewController:(id)a3 prepareActivity:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001B544;
  v10[3] = &unk_10004D278;
  id v11 = a4;
  id v12 = a5;
  v10[4] = self;
  id v8 = v11;
  id v9 = v12;
  [(_UIShareInvitationViewServiceViewController *)self shareViewControllerCopyShareURL:a3 completion:v10];
}

- (void)shareViewControllerDidFinishActivity:(id)a3
{
  if (![(_UIShareInvitationViewServiceViewController *)self presentingError])
  {
    CFStringRef v4 = [(_UIShareInvitationViewServiceViewController *)self hostingViewController];
    [v4 _dismissViewControllerWithError:0];

    [(_UIShareInvitationViewServiceViewController *)self setViewController:0];
  }
}

- (void)_getTitle:(id *)a3 getMessage:(id *)a4 forMAIDError:(id)a5
{
  id v12 = a5;
  if (a3)
  {
    id v8 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    *a3 = [v8 localizedStringForKey:@"ERROR_TITLE_MAID" value:@"Couldn’t Complete Request" table:@"Localizable"];
  }
  if (a4)
  {
    id v9 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    uint64_t v10 = [v9 localizedStringForKey:@"ERROR_MESSAGE_MAID" value:@"This account has restrictions on the people you can share with." table:@"Localizable"];
    id v11 = [(_UIShareInvitationViewServiceViewController *)self itemUTI];
    _CDAdaptLocalizedStringForItemType();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)_getTitle:(id *)a3 getMessage:(id *)a4 forError:(id)a5
{
  id v8 = a5;
  id v9 = [v8 domain];
  if ([v9 isEqualToString:@"_UIShareErrorDomain"])
  {
    id v10 = [v8 code];

    if (!v10)
    {
      id v11 = [v8 userInfo];
      id v12 = [v11 objectForKey:NSUnderlyingErrorKey];

      if (v12)
      {
        id v62 = 0;
        id v63 = 0;
        unsigned __int8 v13 = [(_UIShareInvitationViewServiceViewController *)self _getTitle:&v63 getMessage:&v62 forError:v12];
        id v14 = (__CFString *)v63;
        long long v15 = (__CFString *)v62;
        if (v13) {
          goto LABEL_50;
        }
      }
      else
      {
        long long v15 = 0;
        id v14 = 0;
      }
      v32 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      uint64_t v33 = [v32 localizedStringForKey:@"ERROR_TITLE_COULD_NOT_ADD_PARTICIPANTS" value:@"Couldn’t Add People" table:@"Localizable"];

      v34 = [v8 userInfo];
      v35 = [v34 objectForKeyedSubscript:@"addr"];

      id v36 = [v35 count];
      if (v36 == (id)1)
      {
        v38 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        [v38 localizedStringForKey:@"ERROR_MESSAGE_COULD_NOT_ADD_PARTICIPANTS_WITH_SINGLE_ADDRESS", @"“%@” is not valid. Please enter a valid email address or phone number, then try sharing again.", @"Localizable" value table];
        uint64_t v41 = v57 = v33;
        v42 = [v35 firstObject];
        uint64_t v43 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v41, v42);

        long long v15 = (__CFString *)v41;
        uint64_t v33 = v57;
      }
      else
      {
        if (v36)
        {
          v37 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          v38 = v37;
          CFStringRef v39 = @"ERROR_MESSAGE_COULD_NOT_ADD_PARTICIPANTS_WITH_ADDRESSES";
          CFStringRef v40 = @"Some email addresses or phone numbers you entered are not valid. Please enter valid email addresses or phone numbers, then try sharing again.";
        }
        else
        {
          v37 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          v38 = v37;
          CFStringRef v39 = @"ERROR_MESSAGE_COULD_NOT_ADD_PARTICIPANTS";
          CFStringRef v40 = @"Your invitations weren’t sent.";
        }
        uint64_t v43 = [v37 localizedStringForKey:v39 value:v40 table:@"Localizable"];
      }

      long long v15 = (__CFString *)v43;
      id v14 = (__CFString *)v33;
LABEL_50:

      if (!a3) {
        goto LABEL_52;
      }
      goto LABEL_51;
    }
  }
  else
  {
  }
  long long v16 = [v8 domain];
  unsigned int v17 = [v16 isEqualToString:BRCloudDocsErrorDomain];

  if (v17)
  {
    if ([v8 code] == (id)17)
    {
      __int16 v18 = [v8 userInfo];
      id v12 = [v18 objectForKey:NSUnderlyingErrorKey];

      v60 = 0;
      id v61 = 0;
      [(_UIShareInvitationViewServiceViewController *)self _getTitle:&v61 getMessage:&v60 forError:v12];
      id v14 = (__CFString *)v61;
      __int16 v19 = v60;
LABEL_10:
      long long v15 = v19;
      goto LABEL_50;
    }
LABEL_26:
    long long v15 = 0;
    id v14 = 0;
    if (!a3) {
      goto LABEL_52;
    }
LABEL_51:
    *a3 = v14;
    goto LABEL_52;
  }
  id v20 = [v8 domain];
  unsigned int v21 = [v20 isEqualToString:CKErrorDomain];

  if (v21)
  {
    id v12 = [(_UIShareInvitationViewServiceViewController *)self appName];
    unsigned int v22 = [(_UIShareInvitationViewServiceViewController *)self initialSharing];
    uint64_t v23 = (uint64_t)[v8 code];
    long long v15 = 0;
    if (v23 > 28)
    {
      switch(v23)
      {
        case 29:
          v44 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          id v14 = [v44 localizedStringForKey:@"ERROR_TITLE_TOO_MANY_PARTICIPANTS" value:@"Maximum Invites Reached" table:@"Localizable"];

          v45 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          v46 = v45;
          CFStringRef v47 = @"ERROR_MESSAGE_TOO_MANY_PARTICIPANTS";
          CFStringRef v48 = @"New invitations can’t be sent. Reduce the number of people you’re inviting or have previously invited, then try again.";
          break;
        case 30:
          v49 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          id v14 = [v49 localizedStringForKey:@"ERROR_TITLE_FILE_ALREADY_SHARED" value:@"Can’t Share Document" table:@"Localizable"];

          v45 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          v46 = v45;
          CFStringRef v47 = @"ERROR_MESSAGE_FILE_ALREADY_SHARED";
          CFStringRef v48 = @"This file is inside a shared folder and cannot be shared on its own.";
          break;
        case 32:
          v58 = 0;
          id v59 = 0;
          [(_UIShareInvitationViewServiceViewController *)self _getTitle:&v59 getMessage:&v58 forMAIDError:v8];
          id v14 = (__CFString *)v59;
          __int16 v19 = v58;
          goto LABEL_10;
        default:
LABEL_46:
          id v14 = 0;
          goto LABEL_50;
      }
      long long v15 = [v45 localizedStringForKey:v47 value:v48 table:@"Localizable"];

      goto LABEL_50;
    }
    if (v23 == 3)
    {
      v50 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v51 = v50;
      if (!v22)
      {
        id v14 = [v50 localizedStringForKey:@"ERROR_TITLE_NETWORK_UNAVAILABLE" value:@"Couldn’t Connect" table:@"Localizable"];

        v29 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v30 = v29;
        CFStringRef v31 = @"ERROR_MESSAGE_NETWORK_UNAVAILABLE";
        CFStringRef v52 = @"You can’t manage settings offline. There may be a problem with the server or network. Please try again later. ";
        goto LABEL_49;
      }
      id v14 = [v50 localizedStringForKey:@"ERROR_TITLE_INITIAL_NETWORK_UNAVAILABLE" value:@"Couldn’t Connect" table:@"Localizable"];

      v29 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v30 = v29;
      CFStringRef v31 = @"ERROR_MESSAGE_INITIAL_NETWORK_UNAVAILABLE";
    }
    else
    {
      if (v23 != 4) {
        goto LABEL_46;
      }
      v27 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v28 = v27;
      if (!v22)
      {
        id v14 = [v27 localizedStringForKey:@"ERROR_TITLE_NETWORK_FAILURE" value:@"Couldn’t Connect" table:@"Localizable"];

        v29 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v30 = v29;
        CFStringRef v31 = @"ERROR_MESSAGE_NETWORK_FAILURE";
        CFStringRef v52 = @"You can’t manage settings offline. There may be a problem with the server or network. Please try again later.";
        goto LABEL_49;
      }
      id v14 = [v27 localizedStringForKey:@"ERROR_TITLE_INITIAL_NETWORK_FAILURE" value:@"Couldn’t Connect" table:@"Localizable"];

      v29 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v30 = v29;
      CFStringRef v31 = @"ERROR_MESSAGE_INITIAL_NETWORK_FAILURE";
    }
    CFStringRef v52 = @"%@ couldn’t connect to iCloud. There may be a problem with the server or network. Please try again later.";
LABEL_49:
    v53 = [v29 localizedStringForKey:v31 value:v52 table:@"Localizable"];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v53, v12);
    long long v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_50;
  }
  v24 = [v8 domain];
  unsigned int v25 = [v24 isEqualToString:NSCocoaErrorDomain];

  if (!v25) {
    goto LABEL_26;
  }
  id v26 = [v8 code];
  if (v26 == (id)3328) {
    long long v15 = @"This feature is not supported yet.";
  }
  else {
    long long v15 = 0;
  }
  if (v26 == (id)3328) {
    id v14 = @"Not implemented yet";
  }
  else {
    id v14 = 0;
  }
  if (a3) {
    goto LABEL_51;
  }
LABEL_52:
  if (a4) {
    *a4 = v15;
  }
  if (v14) {
    BOOL v54 = v15 == 0;
  }
  else {
    BOOL v54 = 1;
  }
  BOOL v55 = !v54;

  return v55;
}

- (BOOL)_shouldPresentError:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIShareInvitationViewServiceViewController *)self unreachableViewController];
  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    id v7 = [v4 domain];
    if ([v7 isEqualToString:NSCocoaErrorDomain]) {
      BOOL v6 = [v4 code] == (id)3072;
    }
    else {
      BOOL v6 = 0;
    }
  }
  return !v6;
}

- (void)shareViewController:(id)a3 presentError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(_UIShareInvitationViewServiceViewController *)self _shouldPresentError:v7])
  {
    if (!v6) {
      BRTelemetryReportShareInvitation();
    }
    [(_UIShareInvitationViewServiceViewController *)self setPresentingError:1];
    if (self->_mode == 1)
    {
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10001C83C;
      v40[3] = &unk_10004CA00;
      v40[4] = self;
      id v41 = v7;
      [(_UIShareInvitationViewServiceViewController *)self performAfterFullscreenPresentation:v40];
    }
    else
    {
      id v38 = 0;
      id v39 = 0;
      unsigned __int8 v8 = [(_UIShareInvitationViewServiceViewController *)self _getTitle:&v39 getMessage:&v38 forError:v7];
      id v9 = v39;
      id v10 = v38;
      if ((v8 & 1) == 0)
      {
        unsigned int v11 = [(_UIShareInvitationViewServiceViewController *)self initialSharing];
        id v12 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        unsigned __int8 v13 = v12;
        if (v11)
        {
          uint64_t v14 = [v12 localizedStringForKey:@"ERROR_TITLE_INITIAL_DEFAULT", @"Sorry, this document can’t be shared right now.", @"Localizable" value table];

          long long v15 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          long long v16 = v15;
          CFStringRef v17 = @"ERROR_MESSAGE_INITIAL_DEFAULT";
        }
        else
        {
          uint64_t v14 = [v12 localizedStringForKey:@"ERROR_TITLE_DEFAULT", @"Sorry, you can’t manage settings right now", @"Localizable" value table];

          long long v15 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          long long v16 = v15;
          CFStringRef v17 = @"ERROR_MESSAGE_DEFAULT";
        }
        uint64_t v18 = [v15 localizedStringForKey:v17 value:@"Please try again later." table:@"Localizable"];
        id v9 = (id)v14;

        id v10 = (id)v18;
      }
      __int16 v19 = cdui_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        sub_10002E090((uint64_t)v7, v19, v20, v21, v22, v23, v24, v25);
      }

      if (CPIsInternalDevice())
      {
        id v26 = [v7 localizedDescription];
        uint64_t v27 = +[NSString stringWithFormat:@"%@ (INTERNAL: %@)", v10, v26];

        id v10 = (id)v27;
      }
      v28 = +[UIAlertController alertControllerWithTitle:v9 message:v10 preferredStyle:1];
      v29 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v30 = [v29 localizedStringForKey:@"ERROR_ACTION_DEFAULT" value:@"OK" table:@"Localizable"];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10001C848;
      v36[3] = &unk_10004CB68;
      v36[4] = self;
      id v37 = v6;
      CFStringRef v31 = +[UIAlertAction actionWithTitle:v30 style:0 handler:v36];
      [v28 addAction:v31];

      v32 = [(_UIShareInvitationViewServiceViewController *)self presentedViewController];

      if (v32) {
        [(_UIShareInvitationViewServiceViewController *)self dismissViewControllerAnimated:0 completion:0];
      }
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10001C854;
      v34[3] = &unk_10004CA00;
      v34[4] = self;
      id v35 = v28;
      id v33 = v28;
      [(_UIShareInvitationViewServiceViewController *)self performAfterFullscreenPresentation:v34];
    }
  }
}

- (BOOL)shareViewControllerIsDocumentShare:(id)a3
{
  return self->_mode == 0;
}

- (BOOL)shareViewControllerIsFolderShare:(id)a3
{
  if (self->_mode)
  {
    id v4 = [(_UIShareInvitationViewServiceViewController *)self _folderSubitemName];
    if (v4)
    {
      BOOL v5 = 0;
    }
    else
    {
      id v6 = [(_UIShareInvitationViewServiceViewController *)self _rootFolderTitle];
      BOOL v5 = v6 != 0;
    }
  }
  else
  {
    if (!BRAllowFolderSharing()) {
      return 0;
    }
    id v4 = [(_UIShareInvitationViewServiceViewController *)self itemUTI];
    BOOL v5 = UTTypeConformsTo(kUTTypeFolder, v4) != 0;
  }

  return v5;
}

- (BOOL)shareViewControllerFolderShareIsPrepared:(id)a3
{
  return self->_hasPreparedForFolderSharing;
}

- (void)shareViewController:(id)a3 setFolderShareIsPrepared:(BOOL)a4
{
  self->_hasPreparedForFolderSharing = a4;
}

- (id)shareViewControllerItemUTI:(id)a3
{
  id v4 = [(_UIShareInvitationViewServiceViewController *)self _hostApplicationBundleIdentifier];
  unsigned __int8 v5 = [v4 isEqualToString:@"com.apple.reminders"];

  if (v5)
  {
    id v6 = @"com.apple.reminders.list";
  }
  else
  {
    id v6 = [(_UIShareInvitationViewServiceViewController *)self itemUTI];
  }

  return v6;
}

- (BOOL)shareViewControllerIsNotesOrRemindersOrDocSharing:(id)a3
{
  id v4 = [(_UIShareInvitationViewServiceViewController *)self shareViewControllerItemUTI:0];
  unsigned __int8 v5 = v4;
  if (!self->_mode
    || ([v4 isEqualToString:@"com.apple.notes.note"] & 1) != 0
    || ([v5 isEqualToString:@"com.apple.reminders.list"] & 1) != 0)
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    unsigned __int8 v6 = [v5 isEqualToString:@"com.apple.notes.folder"];
  }

  return v6;
}

- (id)ownerNameComponents
{
  share = self->_share;
  if (share)
  {
    BOOL v3 = [(CKShare *)share owner];
    id v4 = v3;
    if (v3)
    {
      unsigned __int8 v5 = [v3 userIdentity];

      if (v5)
      {
        unsigned __int8 v6 = [v4 userIdentity];
        unsigned __int8 v5 = [v6 nameComponents];
      }
    }
    else
    {
      unsigned __int8 v5 = 0;
    }
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)ownerStringForPerson:(id)a3
{
  if (a3)
  {
    id v4 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:a3 style:0 options:0];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)modifiedByStringForSharedByMe:(BOOL)a3 owner:(id)a4 modifiedByMe:(BOOL)a5 lastEditor:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a3;
  id v10 = a4;
  if (v7)
  {
    unsigned int v11 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    id v12 = [v11 localizedStringForKey:@"MODIFIED_BY_ME_TEXT" value:@"Modified by Me" table:@"Localizable"];
    goto LABEL_10;
  }
  unsigned int v11 = [(_UIShareInvitationViewServiceViewController *)self ownerStringForPerson:a6];
  if (v11)
  {
    unsigned __int8 v13 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    uint64_t v14 = [v13 localizedStringForKey:@"MODIFIED_BY_OTHER_TEXT" value:@"Modified by %@" table:@"Localizable"];
    id v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v11);
LABEL_8:

    goto LABEL_9;
  }
  if (!v8)
  {
    unsigned __int8 v13 = [(_UIShareInvitationViewServiceViewController *)self ownerStringForPerson:v10];
    uint64_t v14 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    long long v15 = [v14 localizedStringForKey:@"SHARED_BY_OTHER_TEXT" value:@"Shared by %@" table:@"Localizable"];
    id v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v13);

    goto LABEL_8;
  }
  unsigned __int8 v13 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v12 = [v13 localizedStringForKey:@"SHARED_BY_ME_TEXT" value:@"Shared by Me" table:@"Localizable"];
LABEL_9:

LABEL_10:

  return v12;
}

- (void)updateSharedOrModifiedByForURL:(id)a3
{
  id v4 = a3;
  if ([(_UIShareInvitationViewServiceViewController *)self isFolderShare]
    || !FPURLMightBeInFileProvider())
  {
    if ([(_UIShareInvitationViewServiceViewController *)self currentUserIsOwner])
    {
      unsigned __int8 v6 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      id v5 = [v6 localizedStringForKey:@"SHARED_BY_ME_TEXT" value:@"Shared by Me" table:@"Localizable"];
    }
    else
    {
      BOOL v7 = [(_UIShareInvitationViewServiceViewController *)self ownerNameComponents];
      unsigned __int8 v6 = [(_UIShareInvitationViewServiceViewController *)self ownerStringForPerson:v7];

      BOOL v8 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      if (v6)
      {
        id v9 = [v8 localizedStringForKey:@"SHARED_BY_OTHER_TEXT" value:@"Shared by %@" table:@"Localizable"];
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v6);
        id v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v5 = [v8 localizedStringForKey:@"SHARED_BY_UNKNOWN_OTHER_TEXT" value:@"Shared" table:@"Localizable"];
      }
    }
    if (v5)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001D1F8;
      block[3] = &unk_10004CA00;
      block[4] = self;
      id v5 = v5;
      id v11 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    id v5 = +[FPItemManager defaultManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001CFAC;
    v12[3] = &unk_10004D2A0;
    v12[4] = self;
    [v5 fetchItemForURL:v4 completionHandler:v12];
  }
}

- (BOOL)isShowAddPeople
{
  return self->_showAddPeople;
}

- (void)turnShowAddPeopleOn:(BOOL)a3
{
  self->_showAddPeople = a3;
}

- (id)editableParticipants
{
  id v2 = [(_UIShareInvitationViewServiceViewController *)self share];
  uint64_t v3 = [v2 allParticipants];
  id v4 = +[NSMutableArray arrayWithArray:v3];

  return v4;
}

- (id)_fetchTopLevelSharedFolderURLWithError:(id *)a3
{
  topLevelSharedFolderURL = self->_topLevelSharedFolderURL;
  if (topLevelSharedFolderURL)
  {
    id v4 = topLevelSharedFolderURL;
  }
  else
  {
    BOOL v7 = +[NSFileManager defaultManager];
    itemURL = self->_itemURL;
    id v15 = 0;
    objc_msgSend(v7, "br_topLevelSharedFolderForURL:error:", itemURL, &v15);
    id v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
    id v10 = v15;
    id v11 = self->_topLevelSharedFolderURL;
    self->_topLevelSharedFolderURL = v9;

    if (self->_topLevelSharedFolderURL) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v10 == 0;
    }
    if (!v12)
    {
      unsigned __int8 v13 = cdui_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        sub_10002E0FC();
      }

      if (a3) {
        *a3 = v10;
      }
    }
    id v4 = self->_topLevelSharedFolderURL;
  }

  return v4;
}

- (BOOL)itemIsShareRoot
{
  if (self->_itemURL)
  {
    uint64_t v6 = 0;
    uint64_t v2 = [(_UIShareInvitationViewServiceViewController *)self _fetchTopLevelSharedFolderURLWithError:&v6];
    BOOL v3 = (v2 | v6) == 0;
  }
  else
  {
    uint64_t v2 = [(_UIShareInvitationViewServiceViewController *)self _folderSubitemName];
    BOOL v3 = v2 == 0;
  }
  BOOL v4 = v3;

  return v4;
}

- (BOOL)itemIsInsideFolderShare
{
  if ([(_UIShareInvitationViewServiceViewController *)self itemIsShareRoot]) {
    return 0;
  }
  BOOL v4 = [(_UIShareInvitationViewServiceViewController *)self shareRootItemURL];
  if (v4)
  {
    BOOL v3 = 1;
  }
  else
  {
    id v5 = [(_UIShareInvitationViewServiceViewController *)self _rootFolderTitle];
    BOOL v3 = v5 != 0;
  }
  return v3;
}

- (id)shareRootItemURL
{
  return [(_UIShareInvitationViewServiceViewController *)self _fetchTopLevelSharedFolderURLWithError:0];
}

- (id)rootItemName
{
  BOOL v3 = [(_UIShareInvitationViewServiceViewController *)self shareRootItemURL];
  BOOL v4 = v3;
  if (v3)
  {
    id v8 = 0;
    [v3 getPromisedItemResourceValue:&v8 forKey:NSURLLocalizedNameKey error:0];
    id v5 = v8;
  }
  else
  {
    id v5 = [(_UIShareInvitationViewServiceViewController *)self _rootFolderTitle];
  }
  uint64_t v6 = v5;

  return v6;
}

- (void)_setRootFolderTitle:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_ckRootFolderTitle, a3);
  id v5 = v6;
  if (v6 && !self->_ckFolderSubitemName)
  {
    objc_storeStrong((id *)&self->_itemName, a3);
    id v5 = v6;
  }
}

- (void)_setFolderSubitemName:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_ckFolderSubitemName, a3);
  if (v5) {
    objc_storeStrong((id *)&self->_itemName, a3);
  }
}

- (void)_setItemName:(id)a3
{
  id v5 = a3;
  if (*(_OWORD *)&self->_ckRootFolderTitle == 0)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_itemName, a3);
    id v5 = v6;
  }
}

- (id)_itemName
{
  return self->_itemName;
}

- (BOOL)isFolderShare
{
  BOOL v3 = [(_UIShareInvitationViewServiceViewController *)self _rootFolderTitle];

  if (v3)
  {
    BOOL v4 = [(_UIShareInvitationViewServiceViewController *)self _folderSubitemName];
    unsigned __int8 v5 = v4 == 0;
  }
  else
  {
    BOOL v4 = [(_UIShareInvitationViewServiceViewController *)self viewController];
    id v6 = [v4 delegate];
    BOOL v7 = [(_UIShareInvitationViewServiceViewController *)self viewController];
    unsigned __int8 v5 = [v6 shareViewControllerIsFolderShare:v7];
  }
  return v5;
}

- (BOOL)currentUserIsOwner
{
  share = self->_share;
  if (!share) {
    return 0;
  }
  BOOL v4 = [(CKShare *)share currentUserParticipant];
  unsigned __int8 v5 = [(CKShare *)self->_share owner];
  if (v5) {
    unsigned __int8 v6 = [v4 isEqual:v5];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)currentUserIsOwnerOrAdmin
{
  share = self->_share;
  if (share)
  {
    BOOL v4 = [(CKShare *)share currentUserParticipant];
    unsigned __int8 v5 = [(CKShare *)self->_share owner];
    if ([v4 role] == (id)2)
    {
      unsigned __int8 v6 = 1;
    }
    else if (v5)
    {
      unsigned __int8 v6 = [v4 isEqual:v5];
    }
    else
    {
      unsigned __int8 v6 = 0;
    }

    return v6;
  }
  else
  {
    return [(_UIShareInvitationViewServiceViewController *)self initialSharing];
  }
}

- (void)shareViewController:(id)a3 activityType:(id)a4 waitForUploadWithProgress:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v36 = a5;
  id v12 = a6;
  unsigned __int8 v13 = dispatch_group_create();
  uint64_t v54 = 0;
  BOOL v55 = &v54;
  uint64_t v56 = 0x3032000000;
  uint64_t v57 = sub_1000178BC;
  v58 = sub_1000178CC;
  id v59 = 0;
  if (self->_mode)
  {
    uint64_t v14 = [(_UIShareInvitationViewServiceViewController *)self container];
    BOOL v15 = v14 == 0;

    if (v15)
    {
      v28 = cdui_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        sub_10002E198();
      }

      dispatch_group_enter(v13);
      v29 = [(_UIShareInvitationViewServiceViewController *)self hostingViewController];
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_10001E070;
      v46[3] = &unk_10004D340;
      v46[4] = self;
      CFStringRef v47 = v13;
      [v29 _requestSavedShareWithCompletion:v46];
    }
    else
    {
      long long v16 = cdui_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_10002E1CC();
      }
    }
    uint64_t v20 = 0;
  }
  else
  {
    CFStringRef v17 = cdui_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = [(_UIShareInvitationViewServiceViewController *)self itemURL];
      *(_DWORD *)buf = 138412290;
      id v61 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[INFO] subscribing for progress on %@", buf, 0xCu);
    }
    __int16 v19 = [(_UIShareInvitationViewServiceViewController *)self itemURL];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10001DE88;
    v52[3] = &unk_10004D2F0;
    id v53 = v36;
    uint64_t v20 = +[NSProgress _addSubscriberForFileURL:v19 withPublishingHandler:v52];

    uint64_t v21 = [(_UIShareInvitationViewServiceViewController *)self itemURL];
    id v51 = 0;
    [v21 getPromisedItemResourceValue:&v51 forKey:NSURLUbiquitousItemIsUploadedKey error:0];
    id v22 = v51;

    if (([v22 BOOLValue] & 1) == 0)
    {
      dispatch_group_enter(v13);
      uint64_t v23 = cdui_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        sub_10002E164();
      }

      uint64_t v24 = [(_UIShareInvitationViewServiceViewController *)self itemURL];
      uint64_t v25 = +[BRObservableFile observerForKey:NSURLUbiquitousItemIsUploadedKey onFileURL:v24];
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_10001DFA8;
      v48[3] = &unk_10004D318;
      v50 = &v54;
      v48[4] = self;
      v49 = v13;
      uint64_t v26 = [v25 addObserverBlock:v48];
      uint64_t v27 = (void *)v55[5];
      v55[5] = v26;
    }
  }
  v30 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E114;
  block[3] = &unk_10004C918;
  block[4] = self;
  dispatch_group_async(v13, v30, block);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10001E15C;
  v37[3] = &unk_10004D3D8;
  id v38 = v13;
  id v39 = self;
  id v40 = v10;
  id v41 = v11;
  id v42 = v20;
  id v43 = v12;
  v44 = &v54;
  id v31 = v20;
  id v32 = v12;
  id v33 = v11;
  id v34 = v10;
  id v35 = v13;
  dispatch_async(v30, v37);

  _Block_object_dispose(&v54, 8);
}

- (void)shareViewControllerStopSharing:(id)a3 overrideAlert:(BOOL)a4
{
  if (a4)
  {
    [(_UIShareInvitationViewServiceViewController *)self _actuallyStopSharing];
  }
  else
  {
    void v6[5] = v4;
    v6[6] = v5;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001E69C;
    v6[3] = &unk_10004C918;
    void v6[4] = self;
    [(_UIShareInvitationViewServiceViewController *)self performAfterFullscreenPresentation:v6];
  }
}

- (void)_actuallyStopSharing
{
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10001ED68;
  v32[3] = &unk_10004D400;
  v32[4] = self;
  BOOL v3 = objc_retainBlock(v32);
  uint64_t v4 = cdui_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[INFO] stopping sharing", buf, 2u);
  }

  int64_t v5 = [(_UIShareInvitationViewServiceViewController *)self mode];
  unsigned __int8 v6 = cdui_default_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] record: destroying share", buf, 2u);
    }

    id v8 = objc_alloc((Class)CKModifyRecordsOperation);
    id v9 = [(_UIShareInvitationViewServiceViewController *)self share];
    id v10 = [v9 recordID];
    id v33 = v10;
    id v11 = +[NSArray arrayWithObjects:&v33 count:1];
    id v12 = [v8 initWithRecordsToSave:&__NSArray0__struct recordIDsToDelete:v11];

    uint64_t v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    uint64_t v26 = sub_10001EF18;
    uint64_t v27 = &unk_10004D428;
    unsigned __int8 v13 = (id *)&v28;
    v28 = v3;
    uint64_t v14 = v3;
    [v12 setModifyRecordsCompletionBlock:&v24];
    objc_msgSend(v12, "setQualityOfService:", 25, v24, v25, v26, v27);
    BOOL v15 = [(_UIShareInvitationViewServiceViewController *)self share];
    long long v16 = [v15 currentUserParticipant];
    id v17 = [v16 type];

    uint64_t v18 = [(_UIShareInvitationViewServiceViewController *)self container];
    __int16 v19 = v18;
    if (v17 == (id)1) {
      [v18 privateCloudDatabase];
    }
    else {
    uint64_t v23 = [v18 sharedCloudDatabase];
    }
    [v23 addOperation:v12];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] document: unsharing", buf, 2u);
    }

    id v20 = objc_alloc((Class)BRShareUnshareOperation);
    uint64_t v21 = [(_UIShareInvitationViewServiceViewController *)self share];
    id v12 = [v20 initWithShare:v21];

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10001EF08;
    v29[3] = &unk_10004D0E8;
    unsigned __int8 v13 = (id *)&v30;
    v30 = v3;
    id v22 = v3;
    [v12 setUnshareCompletionBlock:v29];
    [v12 setQualityOfService:25];
    __int16 v19 = [(_UIShareInvitationViewServiceViewController *)self workerQueue];
    [v19 addOperation:v12];
  }
}

- (void)shareViewControllerLeaveShare:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001EF98;
  v3[3] = &unk_10004C918;
  v3[4] = self;
  [(_UIShareInvitationViewServiceViewController *)self performAfterFullscreenPresentation:v3];
}

- (void)_refetchShareAndRetry:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(_UIShareInvitationViewServiceViewController *)self mode];
  unsigned __int8 v6 = cdui_default_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] Refetching CK share after recoverable error", buf, 2u);
    }

    id v8 = objc_alloc((Class)CKFetchRecordsOperation);
    id v9 = [(_UIShareInvitationViewServiceViewController *)self share];
    id v10 = [v9 recordID];
    v30 = v10;
    id v11 = +[NSArray arrayWithObjects:&v30 count:1];
    id v12 = [v8 initWithRecordIDs:v11];

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10001F654;
    v25[3] = &unk_10004D478;
    v25[4] = self;
    id v26 = v4;
    id v13 = v4;
    [v12 setFetchRecordsCompletionBlock:v25];
    [v12 setQualityOfService:25];
    uint64_t v14 = [(_UIShareInvitationViewServiceViewController *)self share];
    BOOL v15 = [v14 currentUserParticipant];
    id v16 = [v15 type];

    id v17 = [(_UIShareInvitationViewServiceViewController *)self container];
    uint64_t v18 = v17;
    if (v16 == (id)1) {
      [v17 privateCloudDatabase];
    }
    else {
    uint64_t v24 = [v17 sharedCloudDatabase];
    }
    [v24 addOperation:v12];

    uint64_t v23 = v26;
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] Refetching document share after recoverable error", buf, 2u);
    }

    id v19 = objc_alloc((Class)BRShareCopyOperation);
    id v20 = [(_UIShareInvitationViewServiceViewController *)self itemURL];
    id v12 = [v19 initWithURL:v20];

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10001F638;
    v27[3] = &unk_10004D450;
    id v28 = v4;
    id v21 = v4;
    [v12 setRootShareCopyCompletionBlock:v27];
    [v12 setQualityOfService:25];
    id v22 = [(_UIShareInvitationViewServiceViewController *)self workerQueue];
    [v22 addOperation:v12];

    uint64_t v23 = v28;
  }
}

- (void)_modifyAndSaveShare:(id)a3 existingError:(id)a4 controller:(id)a5 modifyBlock:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void (**)(void *, id, id))a7;
  BOOL v15 = v14;
  if (a4)
  {
    id v16 = v14[2];
    id v17 = a3;
    v16(v15, v17, a4);
  }
  else
  {
    uint64_t v18 = (void (*)(void *, id))v13[2];
    id v19 = a3;
    v18(v13, v19);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10001F858;
    v20[3] = &unk_10004D4A0;
    v20[4] = self;
    id v21 = v12;
    id v22 = v13;
    uint64_t v23 = v15;
    [(_UIShareInvitationViewServiceViewController *)self _saveShare:v19 completion:v20];
  }
}

- (void)_saveShare:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = cdui_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] saving share", buf, 2u);
  }

  +[NSDate timeIntervalSinceReferenceDate];
  if ([(_UIShareInvitationViewServiceViewController *)self mode])
  {
    id v9 = objc_alloc((Class)CKModifyRecordsOperation);
    id v31 = v6;
    id v10 = +[NSArray arrayWithObjects:&v31 count:1];
    id v11 = [v9 initWithRecordsToSave:v10 recordIDsToDelete:&__NSArray0__struct];

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100020028;
    v23[3] = &unk_10004D518;
    id v12 = &v24;
    v23[4] = self;
    id v24 = v7;
    id v13 = v7;
    [v11 setModifyRecordsCompletionBlock:v23];
    [v11 setQualityOfService:25];
    uint64_t v14 = [v6 currentUserParticipant];
    id v15 = [v14 type];

    id v16 = [(_UIShareInvitationViewServiceViewController *)self container];
    id v17 = v16;
    if (v15 == (id)1) {
      [v16 privateCloudDatabase];
    }
    else {
    id v22 = [v16 sharedCloudDatabase];
    }
    [v22 addOperation:v11];
  }
  else
  {
    id v18 = [objc_alloc((Class)BRShareSaveOperation) initWithShare:v6];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10001FE48;
    v28[3] = &unk_10004D048;
    v28[4] = self;
    id v12 = &v29;
    id v19 = v7;
    id v29 = v19;
    [v18 setShareSaveCompletionBlock:v28];
    [v18 setQualityOfService:25];
    id v20 = [(_UIShareInvitationViewServiceViewController *)self folderSharingPreparationGroup];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001FF70;
    block[3] = &unk_10004D4F0;
    id v26 = v18;
    id v27 = v19;
    block[4] = self;
    id v21 = v19;
    id v11 = v18;
    dispatch_group_notify(v20, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)shareViewController:(id)a3 modifyShare:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(_UIShareInvitationViewServiceViewController *)self share];
  [(_UIShareInvitationViewServiceViewController *)self _modifyAndSaveShare:v11 existingError:0 controller:v10 modifyBlock:v9 completion:v8];
}

- (void)_handleCopyShareURLError:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (!self->_showAddPeople)
  {
    int64_t v5 = [v4 domain];
    if ([v5 isEqualToString:BRCloudDocsErrorDomain])
    {
      id v6 = [v8 code];

      if (v6 == (id)8)
      {
        [(_UIShareInvitationViewServiceViewController *)self setShareURL:0];
        [(_UIShareInvitationViewServiceViewController *)self setShareURLUnreachable:1];
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v7 = [(_UIShareInvitationViewServiceViewController *)self viewController];
  [v7 presentError:v8];

LABEL_7:
}

- (void)_enqueueCopyShareURLOperation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_UIShareInvitationViewServiceViewController *)self originalShare];

  id v9 = objc_alloc((Class)BRShareCopyShareURLOperation);
  if (v8)
  {
    id v10 = [(_UIShareInvitationViewServiceViewController *)self itemURL];
    id v11 = [(_UIShareInvitationViewServiceViewController *)self itemUTI];
    id v12 = [v9 initWithFileURL:v10 documentType:v11];

    [(_UIShareInvitationViewServiceViewController *)self originalShare];
    id v13 = v6;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = [(_UIShareInvitationViewServiceViewController *)self itemUTI];
    id v12 = [v9 initWithShare:v6 documentType:v13];
  }

  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = sub_100020448;
  id v19 = &unk_10004D540;
  id v20 = self;
  id v21 = v7;
  id v14 = v7;
  [v12 setCopyShareURLCompletionBlock:&v16];
  objc_msgSend(v12, "setQualityOfService:", 33, v16, v17, v18, v19, v20);
  id v15 = [(_UIShareInvitationViewServiceViewController *)self workerQueue];
  [v15 addOperation:v12];
}

- (void)shareViewControllerCopyShareURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100020814;
  v21[3] = &unk_10004D540;
  v21[4] = self;
  id v8 = v7;
  id v22 = v8;
  id v9 = objc_retainBlock(v21);
  id v10 = [(_UIShareInvitationViewServiceViewController *)self shareURL];
  if (v10)
  {

LABEL_4:
    id v11 = [(_UIShareInvitationViewServiceViewController *)self shareURL];
    ((void (*)(void *, void *, void))v9[2])(v9, v11, 0);
    goto LABEL_5;
  }
  if ([(_UIShareInvitationViewServiceViewController *)self shareURLUnreachable]) {
    goto LABEL_4;
  }
  if ([(_UIShareInvitationViewServiceViewController *)self mode])
  {
    id v12 = [(_UIShareInvitationViewServiceViewController *)self share];
    id v13 = [v12 URL];

    if (v13)
    {
      id v11 = [(_UIShareInvitationViewServiceViewController *)self share];
      id v14 = [v11 URL];
      ((void (*)(void *, void *, void))v9[2])(v9, v14, 0);
    }
    else
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      void v17[2] = sub_100020A54;
      v17[3] = &unk_10004D588;
      v17[4] = self;
      id v18 = v9;
      [(_UIShareInvitationViewServiceViewController *)self shareViewController:v6 modifyShare:&stru_10004D560 completion:v17];
      id v11 = v18;
    }
  }
  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10002095C;
    v19[3] = &unk_10004D250;
    v19[4] = self;
    id v20 = v9;
    id v15 = +[NSBlockOperation blockOperationWithBlock:v19];
    [v15 setQualityOfService:33];
    id v16 = [(_UIShareInvitationViewServiceViewController *)self workerQueue];
    [v16 addOperation:v15];

    id v11 = v20;
  }
LABEL_5:
}

- (void)shareViewController:(id)a3 addParticipants:(id)a4 activityType:(id)a5 permission:(int64_t)a6 completion:(id)a7
{
  id v39 = a3;
  id v41 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = objc_alloc_init(BRModalProgressController);
  id v15 = [(_UIShareInvitationViewServiceViewController *)self view];
  uint64_t v16 = [v15 window];
  if (v16)
  {
    uint64_t v17 = (void *)v16;
  }
  else
  {
    id v18 = [(_UIShareInvitationViewServiceViewController *)self presentedViewController];
    id v19 = [v18 view];
    uint64_t v17 = [v19 window];

    if (!v17)
    {
      id v20 = cdui_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        sub_10002E404();
      }

      uint64_t v17 = 0;
    }
  }
  id v21 = [(BRModalProgressController *)v14 view];
  [v17 addSubview:v21];

  id v22 = [(BRModalProgressController *)v14 view];
  [v22 setAutoresizingMask:18];

  [v17 bounds];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  id v31 = [(BRModalProgressController *)v14 view];
  objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);

  id v32 = [v12 pathExtension];
  BRTelemetryReportShareInvitation();
  [(_UIShareInvitationViewServiceViewController *)self shareViewControllerDidChooseTransport:v12];
  +[NSDate timeIntervalSinceReferenceDate];
  id v33 = self->_shareInvitationViewStartDate;
  objc_initWeak(&location, self);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100020E08;
  v42[3] = &unk_10004D5B0;
  id v34 = v14;
  id v43 = v34;
  id v35 = v13;
  id v47 = v35;
  id v36 = v32;
  id v44 = v36;
  id v37 = v33;
  v45 = v37;
  v48[1] = (id)a6;
  objc_copyWeak(v48, &location);
  id v38 = v40;
  id v46 = v38;
  [(_UIShareInvitationViewServiceViewController *)self _addParticipantsAndSaveForController:v38 participants:v41 permission:a6 completion:v42];

  objc_destroyWeak(v48);
  objc_destroyWeak(&location);
}

- (void)_addParticipantsAndSaveForController:(id)a3 participants:(id)a4 permission:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  id v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v12 count]);
  id v14 = objc_opt_new();
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000212A0;
  v41[3] = &unk_10004D5D8;
  id v15 = v13;
  id v42 = v15;
  id v16 = v14;
  id v43 = v16;
  [v12 enumerateObjectsUsingBlock:v41];

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000214D4;
  v39[3] = &unk_10004D600;
  id v17 = v11;
  id v40 = v17;
  id v18 = objc_retainBlock(v39);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000215C4;
  v35[3] = &unk_10004D678;
  id v19 = v17;
  id v37 = v19;
  v35[4] = self;
  id v20 = v10;
  id v36 = v20;
  int64_t v38 = a5;
  id v21 = objc_retainBlock(v35);
  if ([v16 count])
  {
    ((void (*)(void *, void, id))v18[2])(v18, 0, v16);
  }
  else if ([(_UIShareInvitationViewServiceViewController *)self mode])
  {
    id v22 = [objc_alloc((Class)CKFetchShareParticipantsOperation) initWithUserIdentityLookupInfos:v15];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100021CA0;
    v30[3] = &unk_10004D6C8;
    int64_t v32 = a5;
    id v23 = (id)objc_opt_new();
    id v31 = v23;
    [v22 setShareParticipantFetchedBlock:v30];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100021D1C;
    v27[3] = &unk_10004D6F0;
    id v28 = v23;
    double v29 = v21;
    id v24 = v23;
    [v22 setFetchShareParticipantsCompletionBlock:v27];
    [v22 setQualityOfService:25];
    [(CKContainer *)self->_container addOperation:v22];
  }
  else
  {
    id v25 = [objc_alloc((Class)BRShareLookupParticipantsOperation) initWithUserIdentities:v15];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100021C90;
    v33[3] = &unk_10004D6A0;
    id v34 = v21;
    [v25 setLookupParticipantsCompletionBlock:v33];
    [v25 setQualityOfService:25];
    double v26 = [(_UIShareInvitationViewServiceViewController *)self workerQueue];
    [v26 addOperation:v25];
  }
}

- (NSString)itemName
{
  return self->_itemName;
}

- (void)setItemName:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
}

- (int)popoverPresentationMode
{
  return self->_popoverPresentationMode;
}

- (void)setPopoverPresentationMode:(int)a3
{
  self->_popoverPresentationMode = a3;
}

- (_UIShareOverviewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (BOOL)initialSharing
{
  return self->_initialSharing;
}

- (BOOL)allowInvitingOthers
{
  return self->_allowInvitingOthers;
}

- (NSOperationQueue)workerQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWorkerQueue:(id)a3
{
}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (void)setItemURL:(id)a3
{
}

- (NSString)itemUTI
{
  return self->_itemUTI;
}

- (void)setItemUTI:(id)a3
{
}

- (CKShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
}

- (CKShare)originalShare
{
  return self->_originalShare;
}

- (void)setOriginalShare:(id)a3
{
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
}

- (BOOL)shareURLUnreachable
{
  return self->_shareURLUnreachable;
}

- (void)setShareURLUnreachable:(BOOL)a3
{
  self->_shareURLUnreachable = a3;
}

- (NSString)sharedByModifiedByText
{
  return self->_sharedByModifiedByText;
}

- (void)setSharedByModifiedByText:(id)a3
{
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (CKContainerSetupInfo)containerSetupInfo
{
  return self->_containerSetupInfo;
}

- (void)setContainerSetupInfo:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (BOOL)presentingError
{
  return self->_presentingError;
}

- (void)setPresentingError:(BOOL)a3
{
  self->_presentingError = a3;
}

- (BOOL)hasBeenRepresentedInFullscreen
{
  return self->_hasBeenRepresentedInFullscreen;
}

- (void)setHasBeenRepresentedInFullscreen:(BOOL)a3
{
  self->_hasBeenRepresentedInFullscreen = a3;
}

- (OS_dispatch_group)fullscreenRepresentationGroup
{
  return self->_fullscreenRepresentationGroup;
}

- (void)setFullscreenRepresentationGroup:(id)a3
{
}

- (BOOL)serviceIndicatesAlreadyShared
{
  return self->_serviceIndicatesAlreadyShared;
}

- (void)setServiceIndicatesAlreadyShared:(BOOL)a3
{
  self->_serviceIndicatesAlreadyShared = a3;
}

- (BRReachabilityMonitor)reachabilityMonitor
{
  return self->_reachabilityMonitor;
}

- (void)setReachabilityMonitor:(id)a3
{
}

- (UIViewController)unreachableViewController
{
  return self->_unreachableViewController;
}

- (void)setUnreachableViewController:(id)a3
{
}

- (OS_dispatch_semaphore)shareCreationSema
{
  return self->_shareCreationSema;
}

- (void)setShareCreationSema:(id)a3
{
}

- (id)fileObserver
{
  return self->_fileObserver;
}

- (void)setFileObserver:(id)a3
{
}

- (NSDictionary)participantDetails
{
  return self->_participantDetails;
}

- (OS_dispatch_group)folderSharingPreparationGroup
{
  return self->_folderSharingPreparationGroup;
}

- (void)setFolderSharingPreparationGroup:(id)a3
{
}

- (BOOL)hasPreparedForFolderSharing
{
  return self->_hasPreparedForFolderSharing;
}

- (void)setHasPreparedForFolderSharing:(BOOL)a3
{
  self->_hasPreparedForFolderSharing = a3;
}

- (NSError)folderSharingPreparationError
{
  return self->_folderSharingPreparationError;
}

- (void)setFolderSharingPreparationError:(id)a3
{
}

- (BOOL)_collaborationUIEnabled
{
  return self->_collaborationUIEnabled;
}

- (void)_setCollaborationUIEnabled:(BOOL)a3
{
  self->_collaborationUIEnabled = a3;
}

- (NSString)_initialHeaderSubtitle
{
  return self->_initialHeaderSubtitle;
}

- (void)_setInitialHeaderSubtitle:(id)a3
{
}

- (NSString)_headerSubtitle
{
  return self->_headerSubtitle;
}

- (void)_setHeaderSubtitle:(id)a3
{
}

- (NSString)_headerActionTitle
{
  return self->_headerActionTitle;
}

- (void)_setHeaderActionTitle:(id)a3
{
}

- (NSString)_auxiliaryActionTitle
{
  return self->_auxiliaryActionTitle;
}

- (void)_setAuxiliaryActionTitle:(id)a3
{
}

- (NSString)_sectionTitleForAuxiliarySwitches
{
  return self->_sectionTitleForAuxiliarySwitches;
}

- (void)_setSectionTitleForAuxiliarySwitches:(id)a3
{
}

- (NSString)_primaryAuxiliarySwitchTitle
{
  return self->_primaryAuxiliarySwitchTitle;
}

- (void)_setPrimaryAuxiliarySwitchTitle:(id)a3
{
}

- (NSString)_secondaryAuxiliarySwitchTitle
{
  return self->_secondaryAuxiliarySwitchTitle;
}

- (void)_setSecondaryAuxiliarySwitchTitle:(id)a3
{
}

- (BOOL)_primaryAuxiliarySwitchState
{
  return self->_primaryAuxiliarySwitchState;
}

- (void)_setPrimaryAuxiliarySwitchState:(BOOL)a3
{
  self->_primaryAuxiliarySwitchState = a3;
}

- (BOOL)_secondaryAuxiliarySwitchState
{
  return self->_secondaryAuxiliarySwitchState;
}

- (void)_setSecondaryAuxiliarySwitchState:(BOOL)a3
{
  self->_secondaryAuxiliarySwitchState = a3;
}

- (NSString)_messageTemplate
{
  return self->_messageTemplate;
}

- (void)_setMessageTemplate:(id)a3
{
}

- (NSString)_mailTemplate
{
  return self->_mailTemplate;
}

- (void)_setMailTemplate:(id)a3
{
}

- (NSString)_mailSubject
{
  return self->_mailSubject;
}

- (void)_setMailSubject:(id)a3
{
}

- (BOOL)_legacyAppearance
{
  return self->_legacyAppearance;
}

- (BOOL)_showAddPeople
{
  return self->_showAddPeople;
}

- (void)_setShowAddPeople:(BOOL)a3
{
  self->_showAddPeople = a3;
}

- (BOOL)_showRootFolder
{
  return self->_showRootFolder;
}

- (void)_setShowRootFolder:(BOOL)a3
{
  self->_showRootFolder = a3;
}

- (unint64_t)_availablePermissions
{
  return self->_availablePermissions;
}

- (NSString)_rootFolderTitle
{
  return self->_ckRootFolderTitle;
}

- (NSString)_folderSubitemName
{
  return self->_ckFolderSubitemName;
}

- (UIImage)_headerPrimaryImage
{
  return self->_ckHeaderPrimaryImage;
}

- (void)_setHeaderPrimaryImage:(id)a3
{
}

- (UIImage)_headerSecondaryImage
{
  return self->_ckHeaderSecondaryImage;
}

- (void)_setHeaderSecondaryImage:(id)a3
{
}

- (NSDate)shareInvitationViewStartDate
{
  return self->_shareInvitationViewStartDate;
}

- (void)setShareInvitationViewStartDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareInvitationViewStartDate, 0);
  objc_storeStrong((id *)&self->_ckHeaderSecondaryImage, 0);
  objc_storeStrong((id *)&self->_ckHeaderPrimaryImage, 0);
  objc_storeStrong((id *)&self->_ckFolderSubitemName, 0);
  objc_storeStrong((id *)&self->_ckRootFolderTitle, 0);
  objc_storeStrong((id *)&self->_mailSubject, 0);
  objc_storeStrong((id *)&self->_mailTemplate, 0);
  objc_storeStrong((id *)&self->_messageTemplate, 0);
  objc_storeStrong((id *)&self->_secondaryAuxiliarySwitchTitle, 0);
  objc_storeStrong((id *)&self->_primaryAuxiliarySwitchTitle, 0);
  objc_storeStrong((id *)&self->_sectionTitleForAuxiliarySwitches, 0);
  objc_storeStrong((id *)&self->_auxiliaryActionTitle, 0);
  objc_storeStrong((id *)&self->_headerActionTitle, 0);
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_initialHeaderSubtitle, 0);
  objc_storeStrong((id *)&self->_folderSharingPreparationError, 0);
  objc_storeStrong((id *)&self->_folderSharingPreparationGroup, 0);
  objc_storeStrong((id *)&self->_participantDetails, 0);
  objc_storeStrong(&self->_fileObserver, 0);
  objc_storeStrong((id *)&self->_shareCreationSema, 0);
  objc_storeStrong((id *)&self->_unreachableViewController, 0);
  objc_storeStrong((id *)&self->_reachabilityMonitor, 0);
  objc_storeStrong((id *)&self->_fullscreenRepresentationGroup, 0);
  objc_storeStrong((id *)&self->_containerSetupInfo, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_sharedByModifiedByText, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_originalShare, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_itemUTI, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_itemName, 0);

  objc_storeStrong((id *)&self->_topLevelSharedFolderURL, 0);
}

@end