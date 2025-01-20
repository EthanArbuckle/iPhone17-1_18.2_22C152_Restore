@interface FBKBugFormTableViewController
- (BOOL)_tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)_useAttachmentCellRedesign;
- (BOOL)allowKeyboardDismissalForSnapshot;
- (BOOL)allowsAttachmentDragAndDrop;
- (BOOL)alternateImagePreviewEnabled;
- (BOOL)alwaysDeletesDrafts;
- (BOOL)attemptedSubmission;
- (BOOL)autoGathersDiagnosticExtensions;
- (BOOL)canOpenFeedbackInFBA;
- (BOOL)canShowTeamPicker;
- (BOOL)canShowTopicPicker;
- (BOOL)disableAccountSwitching;
- (BOOL)hasCandidateStubs;
- (BOOL)hasFileArea;
- (BOOL)hasLoadedFirstDraft;
- (BOOL)isBeingDismissedBySelf;
- (BOOL)isCaptiveModeEnabled;
- (BOOL)isCaptiveModeEnabledForLaunchAction:(id)a3;
- (BOOL)isEstablishingBugSession;
- (BOOL)isPresentedInSmallDetent;
- (BOOL)isReadyForDropSessionFromController:(id)a3 tableView:(id)a4 dropSessionDidUpdate:(id)a5 withDestinationIndexPath:(id)a6;
- (BOOL)isSubmissionPendingOnEnhancedLogging;
- (BOOL)isUpdatingTable;
- (BOOL)shouldDisplayChangeButton;
- (BOOL)shouldHideAllCells;
- (BOOL)shouldHideQuestions;
- (BOOL)shouldShowAttachmentButton;
- (BOOL)shouldShowAttachments;
- (BOOL)shouldShowForm;
- (BOOL)shouldShowFormPicker;
- (BOOL)shouldShowTeamPicker;
- (BOOL)shouldShowUserSwitcherInForm;
- (BOOL)showInlineUserInfo;
- (BOOL)showUserSwitcherLast;
- (BOOL)showsDraftDeletionMessage;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)useInlineChoices;
- (BOOL)viewHasBecomeVisible;
- (FBKBugForm)bugForm;
- (FBKBugFormDiffableDataSource)diffableDataSource;
- (FBKBugFormStub)pendingStub;
- (FBKBugFormTableViewController)initWithCoder:(id)a3;
- (FBKBugFormTableViewControllerProtocol)delegate;
- (FBKDeviceDiagnosticsController)devicesController;
- (FBKDraftingController)draftingController;
- (FBKFormResponse)formResponse;
- (FBKLargeSubmitButton)submitButtonLarge;
- (FBKLaunchAction)launchAction;
- (FBKManagedFeedbackObject)pendingFeedbackObject;
- (FBKTeam)pendingTeam;
- (NSArray)requestedPlugIns;
- (NSAttributedString)localizedAttributedLegalString;
- (NSDictionary)pendingAttachments;
- (NSDictionary)pendingQandA;
- (NSMutableDictionary)cellHeights;
- (NSPredicate)candidateFormStubsPredicate;
- (NSSet)extensions;
- (NSString)appToken;
- (NSString)firstDeviceSectionIdentifier;
- (NSString)largeTitleIcon;
- (NSString)localizedAttachmentLegalText;
- (NSString)onBoardingKitIdentifier;
- (NSString)questionGroupUnderAttachmentsSectionIdentifier;
- (NSString)sectionThatWillHostLegalTextFooterSectionIdentifier;
- (NSString)teamPickerRowIdentifier;
- (NSString)topicPickerRowIdentifier;
- (UIBarButtonItem)cancelBarButtonItem;
- (UIBarButtonItem)cancelButton;
- (UIBarButtonItem)submitBarButtonItem;
- (UIBarButtonItem)submitButton;
- (UITableViewCell)addAttachmentCell;
- (UITextView)textViewFirstResponder;
- (UIView)_cachedLegalFooterView;
- (UIView)_cachedOnboardingKitView;
- (_TtC12FeedbackCore27FBKAddAttachmentsController)addAttachmentsController;
- (double)_separatorInset;
- (double)keyboardHeight;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)alertControllerForDismissWithLaunchAction:(id)a3;
- (id)attachmentCellViewWithTableView:(id)a3 indexPath:(id)a4 reuseIdentifier:(id)a5 attachment:(id)a6;
- (id)cancelButtonOnRight;
- (id)currentTeam;
- (id)didRefreshFormStubsNotificationObserver;
- (id)dynamicAlertBody;
- (id)dynamicAlertTitle;
- (id)formIdentifier;
- (id)formStub;
- (id)itemFromDraft;
- (id)largeTitleView:(id)a3 icon:(id)a4;
- (id)legalText;
- (id)legalViewBelowAttachments;
- (id)loadDraftCompletion;
- (id)notificationObserver;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (id)questionGroupForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 withItemIdentifier:(id)a5;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (unint64_t)cachedCandidateStubsCount;
- (unint64_t)maxInlineChoices;
- (unint64_t)submissionStyle;
- (unsigned)whooshSoundID;
- (void)_changeToBugFormStub:(id)a3 force:(BOOL)a4;
- (void)_deleteCurrentDraftWithCompletion:(id)a3;
- (void)_handleLoadingError:(id)a3;
- (void)_hideDevices;
- (void)_reallyChangeToBugFormStub:(id)a3 withTeam:(id)a4 force:(BOOL)a5;
- (void)_resizeAndScrollTableAfterTextChangeInTextView:(id)a3;
- (void)_showFormPickerWithSender:(id)a3;
- (void)_showInternalToolbarIfNeeded;
- (void)_showSpinnerWithStatus:(id)a3 userInteractionEnabled:(BOOL)a4;
- (void)_stopSpinner;
- (void)_updateUI:(BOOL)a3 canDismissKeyboard:(BOOL)a4 overrideWindowCheck:(BOOL)a5 withCompletion:(id)a6;
- (void)adjustAttachmentLabelSpacing:(id)a3;
- (void)answerDidChangeForQuestion:(id)a3;
- (void)askDelegateToGoFullScreenIfNeeded;
- (void)attachmentsAlert:(id)a3 needsDeviceDiagnosticsController:(id)a4;
- (void)attachmentsAlertDidSelectOption:(id)a3;
- (void)awakeFromNib;
- (void)beginPresubmissionCheck:(id)a3;
- (void)bugFormPicker:(id)a3 didSelectBugFormStub:(id)a4;
- (void)bugFormPickerDidCancel:(id)a3;
- (void)checkEnhancedLoggingAndSubmit;
- (void)checkExplicitConfirmationAndSubmit;
- (void)checkLegalAndSubmit;
- (void)close;
- (void)closeDraftAndDelete:(BOOL)a3 completion:(id)a4;
- (void)closeDraftAndDelete:(BOOL)a3 withError:(id)a4 completion:(id)a5;
- (void)closeWithCompletion:(id)a3;
- (void)closeWithError:(id)a3 completion:(id)a4;
- (void)deviceDiagnosticsController:(id)a3 didAddAttachment:(id)a4 toDevice:(id)a5;
- (void)deviceDiagnosticsController:(id)a3 didAddDevice:(id)a4;
- (void)deviceDiagnosticsController:(id)a3 didAddDevices:(id)a4;
- (void)deviceDiagnosticsController:(id)a3 didChangeState:(int64_t)a4;
- (void)deviceDiagnosticsController:(id)a3 didFailToAttach:(id)a4 toDevice:(id)a5 error:(id)a6;
- (void)deviceDiagnosticsController:(id)a3 didFailToConnectToDevice:(id)a4;
- (void)deviceDiagnosticsController:(id)a3 didRemoveAttachment:(id)a4 fromDevice:(id)a5;
- (void)deviceDiagnosticsController:(id)a3 didRemoveDevice:(id)a4;
- (void)deviceDiagnosticsController:(id)a3 didUpdateAttachment:(id)a4 onDevice:(id)a5;
- (void)deviceDiagnosticsController:(id)a3 didUpdateDevice:(id)a4;
- (void)deviceDiagnosticsController:(id)a3 needsSelectionFromDevices:(id)a4 completion:(id)a5;
- (void)didPressChangeBugForm:(id)a3;
- (void)didTapAttachment:(id)a3 indexPath:(id)a4;
- (void)didTapDevice:(id)a3 indexPath:(id)a4;
- (void)didTapLargeSubmitButton:(id)a3;
- (void)dismiss:(id)a3;
- (void)draftingController:(id)a3 madeVisibilityUpdatesWithSnapshotDiff:(id)a4;
- (void)draftingControllerDidBeginLoading:(id)a3;
- (void)draftingControllerDidFinishLoading:(id)a3 withError:(id)a4;
- (void)editorDidDismissForQuestion:(id)a3;
- (void)fillInAnswers;
- (void)hideAllCells;
- (void)hideQuestions;
- (void)keyboardDidHide:(id)a3;
- (void)keyboardWasShown:(id)a3;
- (void)launchModalViewWithModalQuestion:(id)a3;
- (void)loadDraft:(id)a3;
- (void)loadNewResponseForBugFormStub:(id)a3 forTeam:(id)a4;
- (void)loadNewResponseForBugFormStub:(id)a3 forTeam:(id)a4 completion:(id)a5;
- (void)loadNewResponseForSurvey:(id)a3 forTeam:(id)a4;
- (void)postAttachFiles:(id)a3;
- (void)preAttachFiles:(id)a3;
- (void)prepareForSegue:(id)a3 sender:(id)a4;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)questionVisibilityDidUpdateForDraftingController:(id)a3;
- (void)registerApplicationNotifications;
- (void)registerForKeyboardNotifications;
- (void)saveDraftWithIsClosing:(BOOL)a3 completion:(id)a4;
- (void)saveFormForResigningActive:(id)a3;
- (void)setAddAttachmentCell:(id)a3;
- (void)setAddAttachmentsController:(id)a3;
- (void)setAllowKeyboardDismissalForSnapshot:(BOOL)a3;
- (void)setAllowsAttachmentDragAndDrop:(BOOL)a3;
- (void)setAlternateImagePreviewEnabled:(BOOL)a3;
- (void)setAlwaysDeletesDrafts:(BOOL)a3;
- (void)setAppToken:(id)a3;
- (void)setAttemptedSubmission:(BOOL)a3;
- (void)setAutoGathersDiagnosticExtensions:(BOOL)a3;
- (void)setCachedCandidateStubsCount:(unint64_t)a3;
- (void)setCanOpenFeedbackInFBA:(BOOL)a3;
- (void)setCanShowTeamPicker:(BOOL)a3;
- (void)setCanShowTopicPicker:(BOOL)a3;
- (void)setCancelBarButtonItem:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setCandidateFormStubsPredicate:(id)a3;
- (void)setCellHeights:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevicesController:(id)a3;
- (void)setDidRefreshFormStubsNotificationObserver:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setDisableAccountSwitching:(BOOL)a3;
- (void)setDraftingController:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setFirstDeviceSectionIdentifier:(id)a3;
- (void)setHasLoadedFirstDraft:(BOOL)a3;
- (void)setIsBeingDismissedBySelf:(BOOL)a3;
- (void)setIsEstablishingBugSession:(BOOL)a3;
- (void)setIsPresentedInSmallDetent:(BOOL)a3;
- (void)setIsSubmissionPendingOnEnhancedLogging:(BOOL)a3;
- (void)setIsUpdatingTable:(BOOL)a3;
- (void)setKeyboardHeight:(double)a3;
- (void)setLargeTitleIcon:(id)a3;
- (void)setLaunchAction:(id)a3;
- (void)setLoadDraftCompletion:(id)a3;
- (void)setLocalizedAttachmentLegalText:(id)a3;
- (void)setLocalizedAttributedLegalString:(id)a3;
- (void)setMaxInlineChoices:(unint64_t)a3;
- (void)setNotificationObserver:(id)a3;
- (void)setOnBoardingKitIdentifier:(id)a3;
- (void)setPendingAttachments:(id)a3;
- (void)setPendingFeedbackObject:(id)a3;
- (void)setPendingQandA:(id)a3;
- (void)setPendingStub:(id)a3;
- (void)setPendingTeam:(id)a3;
- (void)setQuestionGroupUnderAttachmentsSectionIdentifier:(id)a3;
- (void)setRequestedPlugIns:(id)a3;
- (void)setSectionThatWillHostLegalTextFooterSectionIdentifier:(id)a3;
- (void)setShouldHideAllCells:(BOOL)a3;
- (void)setShouldHideQuestions:(BOOL)a3;
- (void)setShouldShowAttachmentButton:(BOOL)a3;
- (void)setShouldShowUserSwitcherInForm:(BOOL)a3;
- (void)setShowInlineUserInfo:(BOOL)a3;
- (void)setShowUserSwitcherLast:(BOOL)a3;
- (void)setSubmissionStyle:(unint64_t)a3;
- (void)setSubmitBarButtonItem:(id)a3;
- (void)setSubmitButton:(id)a3;
- (void)setSubmitButtonLarge:(id)a3;
- (void)setTextViewFirstResponder:(id)a3;
- (void)setUseInlineChoices:(BOOL)a3;
- (void)setViewHasBecomeVisible:(BOOL)a3;
- (void)setWhooshSoundID:(unsigned int)a3;
- (void)set_cachedLegalFooterView:(id)a3;
- (void)set_cachedOnboardingKitView:(id)a3;
- (void)showQuestions;
- (void)showSpinnerWithStatus:(id)a3;
- (void)showSubmissionAlertWithCompletion:(id)a3;
- (void)showThankYouAlertWithCompletion:(id)a3;
- (void)submit;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)teamPicker:(id)a3 didSelectTeam:(id)a4;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)unregisterApplicationNotifications;
- (void)unregisterForKeyboardNotifications;
- (void)updateCachedCandidateStubsCount;
- (void)updateSubmitButtonState;
- (void)updateTitle;
- (void)updateUI:(BOOL)a3;
- (void)updateUI:(BOOL)a3 canDismissKeyboard:(BOOL)a4 withCompletion:(id)a5;
- (void)updateUIOverrideWindowCheck;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation FBKBugFormTableViewController

- (void)updateUI:(BOOL)a3
{
}

- (void)updateUIOverrideWindowCheck
{
}

- (void)updateUI:(BOOL)a3 canDismissKeyboard:(BOOL)a4 withCompletion:(id)a5
{
}

- (void)_updateUI:(BOOL)a3 canDismissKeyboard:(BOOL)a4 overrideWindowCheck:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a4;
  uint64_t v8 = a3;
  v100[1] = *MEMORY[0x263EF8340];
  id v10 = a6;
  v11 = +[FBKLog appHandle];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v92 = v8;
    *(_WORD *)&v92[4] = 1024;
    *(_DWORD *)&v92[6] = v7;
    _os_log_impl(&dword_22A36D000, v11, OS_LOG_TYPE_INFO, "updateUI animated? [%i] canDismiss? [%i]", buf, 0xEu);
  }

  v12 = [(FBKBugFormTableViewController *)self view];
  v13 = [v12 window];

  if (!v13 && !a5)
  {
    v14 = +[FBKLog appHandle];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v14, OS_LOG_TYPE_INFO, "Update UI came after VC was dismissed. Exiting", buf, 2u);
    }

    goto LABEL_75;
  }
  if (![(FBKBugFormTableViewController *)self isUpdatingTable])
  {
    [(FBKBugFormTableViewController *)self setAllowKeyboardDismissalForSnapshot:v7];
    [(FBKBugFormTableViewController *)self setIsUpdatingTable:1];
    id v17 = objc_alloc_init(MEMORY[0x263F82358]);
    v18 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:6];
    if ([(FBKBugFormTableViewController *)self shouldHideAllCells])
    {
      v19 = 0;
LABEL_74:
      v72 = [(FBKBugFormTableViewController *)self diffableDataSource];
      [v72 applySnapshot:v17 animatingDifferences:v8 completion:v10];

      [(FBKBugFormTableViewController *)self setIsUpdatingTable:0];
      goto LABEL_75;
    }
    if ([(FBKBugFormTableViewController *)self shouldShowUserSwitcherInForm]
      && ![(FBKBugFormTableViewController *)self showInlineUserInfo]
      && ![(FBKBugFormTableViewController *)self showUserSwitcherLast])
    {
      v20 = [[FBKSectionIdentifierGroup alloc] initWithSectionIdentifier:@"UserCell"];
      v100[0] = @"UserCell";
      v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v100 count:1];
      [(FBKSectionIdentifierGroup *)v20 setGivenRowIdentifiers:v21];

      [v18 addObject:v20];
    }
    if ([(FBKBugFormTableViewController *)self shouldShowTeamPicker])
    {
      v22 = [[FBKSectionIdentifierGroup alloc] initWithSectionIdentifier:@"TeamPicker"];
      v23 = [(FBKBugFormTableViewController *)self teamPickerRowIdentifier];
      v99 = v23;
      v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v99 count:1];
      [(FBKSectionIdentifierGroup *)v22 setGivenRowIdentifiers:v24];

      [v18 addObject:v22];
    }
    if ([(FBKBugFormTableViewController *)self shouldShowFormPicker])
    {
      v25 = [[FBKSectionIdentifierGroup alloc] initWithSectionIdentifier:@"FormPicker"];
      v26 = [(FBKBugFormTableViewController *)self topicPickerRowIdentifier];
      v98 = v26;
      v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v98 count:1];
      [(FBKSectionIdentifierGroup *)v25 setGivenRowIdentifiers:v27];

      [v18 addObject:v25];
    }
    id v77 = v10;
    v78 = v18;
    unsigned int v76 = v8;
    if ([(FBKBugFormTableViewController *)self shouldShowForm])
    {
      v28 = [(FBKBugFormTableViewController *)self draftingController];
      v29 = self;
      v30 = objc_msgSend(v28, "generateSnapshotIdentifiers:", -[FBKBugFormTableViewController attemptedSubmission](self, "attemptedSubmission"));

      v31 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v32 = v30;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v83 objects:v97 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        v19 = 0;
        uint64_t v35 = *(void *)v84;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v84 != v35) {
              objc_enumerationMutation(v32);
            }
            v37 = *(void **)(*((void *)&v83 + 1) + 8 * i);
            if ([v37 isSectionBelowAttachments])
            {
              id v38 = v37;

              v39 = [v38 sectionIdentifier];
              [(FBKBugFormTableViewController *)v29 setQuestionGroupUnderAttachmentsSectionIdentifier:v39];

              v19 = v38;
            }
            else
            {
              [v31 addObject:v37];
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v83 objects:v97 count:16];
        }
        while (v34);
      }
      else
      {
        v19 = 0;
      }

      [v78 addObjectsFromArray:v31];
      v40 = [v31 lastObject];
      v75 = [v40 sectionIdentifier];

      self = v29;
      uint64_t v8 = v76;
      id v10 = v77;
    }
    else
    {
      v75 = 0;
      v19 = 0;
    }
    if ([(FBKBugFormTableViewController *)self shouldShowAttachments])
    {
      v41 = [(FBKBugFormTableViewController *)self devicesController];
      v42 = [v41 generateSectionIdentifierGroupsWithDeviceSectionPrefix:@"DeviceAttachmentsSectionType" deferredDeviceSectionPrefix:@"DeviceAttachmentsSectionTypeDeferred"];

      v43 = [v42 firstObject];
      v44 = [v43 sectionIdentifier];
      [(FBKBugFormTableViewController *)self setFirstDeviceSectionIdentifier:v44];

      v45 = [v42 lastObject];
      v46 = [v45 sectionIdentifier];

      v18 = v78;
      [v78 addObjectsFromArray:v42];

      if (!v19) {
        goto LABEL_42;
      }
    }
    else
    {
      v46 = 0;
      v18 = v78;
      if (!v19)
      {
LABEL_42:
        if ([(FBKBugFormTableViewController *)self shouldShowAttachments]
          && [(FBKBugFormTableViewController *)self shouldShowAttachmentButton])
        {
          v47 = [[FBKSectionIdentifierGroup alloc] initWithSectionIdentifier:@"AddAttachments"];
          v96 = @"AddAttachmentsItem";
          v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v96 count:1];
          [(FBKSectionIdentifierGroup *)v47 setGivenRowIdentifiers:v48];

          [v18 addObject:v47];
        }
        if ([(FBKBugFormTableViewController *)self shouldShowUserSwitcherInForm]
          && ![(FBKBugFormTableViewController *)self showInlineUserInfo]
          && [(FBKBugFormTableViewController *)self showUserSwitcherLast])
        {
          v49 = [[FBKSectionIdentifierGroup alloc] initWithSectionIdentifier:@"UserCell"];
          v95 = @"UserCell";
          v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v95 count:1];
          [(FBKSectionIdentifierGroup *)v49 setGivenRowIdentifiers:v50];

          [v18 addObject:v49];
          v51 = [(FBKSectionIdentifierGroup *)v49 sectionIdentifier];
        }
        if ([(FBKBugFormTableViewController *)self shouldShowAttachmentButton])
        {
          v52 = @"AddAttachments";
          goto LABEL_51;
        }
        v54 = [(FBKBugFormTableViewController *)self questionGroupUnderAttachmentsSectionIdentifier];

        if (v54)
        {
          v55 = [(FBKBugFormTableViewController *)self questionGroupUnderAttachmentsSectionIdentifier];
          [(FBKBugFormTableViewController *)self setSectionThatWillHostLegalTextFooterSectionIdentifier:v55];
        }
        else
        {
          if (v46)
          {
            v53 = self;
            v52 = v46;
            goto LABEL_52;
          }
          v52 = v75;
          if (v75)
          {
LABEL_51:
            v53 = self;
LABEL_52:
            [(FBKBugFormTableViewController *)v53 setSectionThatWillHostLegalTextFooterSectionIdentifier:v52];
LABEL_56:
            v56 = DataSourceLog();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
              -[FBKBugFormTableViewController(DiffableDataSource) _updateUI:canDismissKeyboard:overrideWindowCheck:withCompletion:](v56);
            }

            if (v18)
            {
              v73 = v46;
              v74 = self;
              v57 = objc_msgSend(v18, "ded_mapWithBlock:", &__block_literal_global_26);
              [v17 appendSectionsWithIdentifiers:v57];

              long long v81 = 0u;
              long long v82 = 0u;
              long long v79 = 0u;
              long long v80 = 0u;
              id v58 = v18;
              uint64_t v59 = [v58 countByEnumeratingWithState:&v79 objects:v94 count:16];
              if (v59)
              {
                uint64_t v60 = v59;
                uint64_t v61 = *(void *)v80;
                do
                {
                  for (uint64_t j = 0; j != v60; ++j)
                  {
                    if (*(void *)v80 != v61) {
                      objc_enumerationMutation(v58);
                    }
                    v63 = *(void **)(*((void *)&v79 + 1) + 8 * j);
                    v64 = DataSourceLog();
                    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
                    {
                      v69 = [v63 sectionIdentifier];
                      v70 = [v63 rowIdentifiers];
                      *(_DWORD *)buf = 138543618;
                      *(void *)v92 = v69;
                      *(_WORD *)&v92[8] = 2114;
                      v93 = v70;
                      _os_log_debug_impl(&dword_22A36D000, v64, OS_LOG_TYPE_DEBUG, "[%{public}@]:[%{public}@]", buf, 0x16u);
                    }
                    v65 = [v63 rowIdentifiers];
                    uint64_t v66 = [v65 count];

                    if (v66)
                    {
                      v67 = [v63 rowIdentifiers];
                      v68 = [v63 sectionIdentifier];
                      [v17 appendItemsWithIdentifiers:v67 intoSectionWithIdentifier:v68];
                    }
                  }
                  uint64_t v60 = [v58 countByEnumeratingWithState:&v79 objects:v94 count:16];
                }
                while (v60);
              }

              id v10 = v77;
              v18 = v78;
              v46 = v73;
              self = v74;
              uint64_t v8 = v76;
            }
            v71 = DataSourceLog();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG)) {
              -[FBKBugFormTableViewController(DiffableDataSource) _updateUI:canDismissKeyboard:overrideWindowCheck:withCompletion:](v71);
            }

            goto LABEL_74;
          }
          v55 = DataSourceLog();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT)) {
            -[FBKBugFormTableViewController(DiffableDataSource) _updateUI:canDismissKeyboard:overrideWindowCheck:withCompletion:](v55);
          }
        }

        goto LABEL_56;
      }
    }
    [v18 addObject:v19];
    goto LABEL_42;
  }
  v15 = +[FBKLog appHandle];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A36D000, v15, OS_LOG_TYPE_INFO, "Already updating UI. Will defer to next run loop", buf, 2u);
  }

  v16 = [MEMORY[0x263F08A48] mainQueue];
  v87[0] = MEMORY[0x263EF8330];
  v87[1] = 3221225472;
  v87[2] = __117__FBKBugFormTableViewController_DiffableDataSource___updateUI_canDismissKeyboard_overrideWindowCheck_withCompletion___block_invoke;
  v87[3] = &unk_264874CF8;
  v87[4] = self;
  char v89 = v8;
  BOOL v90 = v7;
  id v88 = v10;
  [v16 addOperationWithBlock:v87];

LABEL_75:
}

uint64_t __117__FBKBugFormTableViewController_DiffableDataSource___updateUI_canDismissKeyboard_overrideWindowCheck_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateUI:*(unsigned __int8 *)(a1 + 48) canDismissKeyboard:*(unsigned __int8 *)(a1 + 49) withCompletion:*(void *)(a1 + 40)];
}

uint64_t __117__FBKBugFormTableViewController_DiffableDataSource___updateUI_canDismissKeyboard_overrideWindowCheck_withCompletion___block_invoke_23(uint64_t a1, void *a2)
{
  return [a2 sectionIdentifier];
}

- (FBKBugFormTableViewController)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FBKBugFormTableViewController;
  v3 = [(FBKBugFormTableViewController *)&v8 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    v3->_shouldHideQuestions = 0;
    v3->_attemptedSubmission = 0;
    v5 = objc_alloc_init(FBKDraftingController);
    draftingController = v4->_draftingController;
    v4->_draftingController = v5;

    [(FBKDraftingController *)v4->_draftingController setDelegate:v4];
    v4->_isUpdatingTable = 0;
    v4->_allowKeyboardDismissalForSnapshot = 0;
    v4->_canShowTopicPicker = 1;
    v4->_shouldShowUserSwitcherInForm = 0;
    v4->_canShowTeamPicker = 1;
    v4->_shouldHideAllCells = 0;
    v4->_canOpenFeedbackInFBA = 1;
    v4->_shouldShowAttachmentButton = 1;
    v4->_disableAccountSwitching = 0;
    v4->_allowsAttachmentDragAndDrop = 1;
    v4->_alternateImagePreviewEnabled = 0;
    v4->_isBeingDismissedBySelf = 0;
    v4->_autoGathersDiagnosticExtensions = 0;
    v4->_alwaysDeletesDrafts = 0;
    v4->_useInlineChoices = 0;
    v4->_isSubmissionPendingOnEnhancedLogging = 0;
    v4->_submissionStyle = 0;
    v4->_isPresentedInSmallDetent = 0;
  }
  return v4;
}

- (void)awakeFromNib
{
  v7.receiver = self;
  v7.super_class = (Class)FBKBugFormTableViewController;
  [(FBKBugFormTableViewController *)&v7 awakeFromNib];
  v3 = [(FBKBugFormTableViewController *)self splitViewController];

  if (v3)
  {
    v4 = [(FBKBugFormTableViewController *)self splitViewController];
    [v4 setPreferredDisplayMode:2];
  }
  v5 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 1) {
    -[FBKBugFormTableViewController setPreferredContentSize:](self, "setPreferredContentSize:", 414.0, 600.0);
  }
}

- (void)viewDidLoad
{
  v67.receiver = self;
  v67.super_class = (Class)FBKBugFormTableViewController;
  [(FBKBugFormTableViewController *)&v67 viewDidLoad];
  v3 = [(FBKBugFormTableViewController *)self submitButton];
  [v3 setEnabled:0];

  v4 = [(FBKBugFormTableViewController *)self submitButtonLarge];
  [v4 enableButton:0];

  v5 = [(FBKBugFormTableViewController *)self navigationItem];
  uint64_t v6 = [v5 leftBarButtonItem];
  [v6 setEnabled:0];

  [(FBKBugFormTableViewController *)self updateTitle];
  id v7 = objc_alloc(MEMORY[0x263F824A8]);
  objc_super v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"Back" value:&stru_26DDF6A30 table:0];
  id v10 = (void *)[v7 initWithTitle:v9 style:0 target:0 action:0];
  v11 = [(FBKBugFormTableViewController *)self navigationItem];
  [v11 setBackBarButtonItem:v10];

  double v12 = *MEMORY[0x263F839B8];
  v13 = [(FBKBugFormTableViewController *)self tableView];
  [v13 setRowHeight:v12];

  v14 = [(FBKBugFormTableViewController *)self tableView];
  [v14 setEstimatedRowHeight:80.0];

  v15 = [(FBKBugFormTableViewController *)self tableView];
  [v15 setEstimatedSectionFooterHeight:0.0];

  v16 = [(FBKBugFormTableViewController *)self tableView];
  [v16 setSectionFooterHeight:v12];

  id v17 = [(FBKBugFormTableViewController *)self addAttachmentsController];
  v18 = [(FBKBugFormTableViewController *)self tableView];
  [v18 setDropDelegate:v17];

  if (!+[FBKSharedConstants isRunningInFBA])
  {
    v19 = [FBKLargeSubmitButton alloc];
    v20 = [(FBKBugFormTableViewController *)self tableView];
    v21 = [(FBKLargeSubmitButton *)v19 initWithTableView:v20 target:self action:sel_didTapLargeSubmitButton_];
    [(FBKBugFormTableViewController *)self setSubmitButtonLarge:v21];
  }
  v22 = +[FBKDeviceDisplayCell reuseIdentifier];
  v23 = (void *)MEMORY[0x263F829D0];
  v24 = [MEMORY[0x263F086E0] feedbackCoreFramework];
  v25 = [v23 nibWithNibName:v22 bundle:v24];

  v26 = [(FBKBugFormTableViewController *)self tableView];
  [v26 registerNib:v25 forCellReuseIdentifier:v22];

  v27 = +[FBKAttachmentCell reuseIdentifier];

  v28 = (void *)MEMORY[0x263F829D0];
  v29 = [MEMORY[0x263F086E0] feedbackCoreFramework];
  v30 = [v28 nibWithNibName:v27 bundle:v29];

  v31 = [(FBKBugFormTableViewController *)self tableView];
  [v31 registerNib:v30 forCellReuseIdentifier:v27];

  if ([(FBKBugFormTableViewController *)self _useAttachmentCellRedesign])
  {
    id v32 = [(FBKBugFormTableViewController *)self tableView];
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = +[FBKAttachmentDiffableCellView reuseIdentifier];
    [v32 registerClass:v33 forCellReuseIdentifier:v34];
  }
  uint64_t v35 = [(FBKBugFormTableViewController *)self tableView];
  uint64_t v36 = objc_opt_class();
  v37 = +[FBKModalQuestionCell reuseIdentifier];
  [v35 registerClass:v36 forCellReuseIdentifier:v37];

  id v38 = [(FBKBugFormTableViewController *)self tableView];
  uint64_t v39 = objc_opt_class();
  v40 = +[FBKToggleQuestionCell reuseIdentifier];
  [v38 registerClass:v39 forCellReuseIdentifier:v40];

  v41 = [(FBKBugFormTableViewController *)self tableView];
  [v41 registerClass:objc_opt_class() forCellReuseIdentifier:@"AddAttachmentsItem"];

  v42 = [(FBKBugFormTableViewController *)self tableView];
  [v42 registerClass:objc_opt_class() forCellReuseIdentifier:@"UserCell"];

  v43 = [(FBKBugFormTableViewController *)self tableView];
  uint64_t v44 = objc_opt_class();
  v45 = +[FBKExpandedChoiceCell reuseIdentifier];
  [v43 registerClass:v44 forCellReuseIdentifier:v45];

  v46 = [(FBKBugFormTableViewController *)self tableView];
  uint64_t v47 = objc_opt_class();
  v48 = +[FBKInlineChoiceCell reuseIdentifier];
  [v46 registerClass:v47 forCellReuseIdentifier:v48];

  objc_initWeak(&location, self);
  v49 = [FBKBugFormDiffableDataSource alloc];
  v50 = [(FBKBugFormTableViewController *)self tableView];
  uint64_t v61 = MEMORY[0x263EF8330];
  uint64_t v62 = 3221225472;
  v63 = __44__FBKBugFormTableViewController_viewDidLoad__block_invoke;
  v64 = &unk_2648771C8;
  objc_copyWeak(&v65, &location);
  v51 = [(UITableViewDiffableDataSource *)v49 initWithTableView:v50 cellProvider:&v61];
  -[FBKBugFormTableViewController setDiffableDataSource:](self, "setDiffableDataSource:", v51, v61, v62, v63, v64);

  v52 = [(FBKBugFormTableViewController *)self diffableDataSource];
  [v52 setThisViewController:self];

  v53 = [(FBKBugFormTableViewController *)self tableView];
  [v53 setDelegate:self];

  MainBundle = CFBundleGetMainBundle();
  CFURLRef v55 = CFBundleCopyResourceURL(MainBundle, @"whoosh", @"caf", 0);
  CFURLRef v56 = v55;
  if (v55)
  {
    if (AudioServicesCreateSystemSoundID(v55, &self->_whooshSoundID)) {
      self->_whooshSoundID = 0;
    }
    CFRelease(v56);
  }
  v57 = [(FBKBugFormTableViewController *)self navigationController];
  id v58 = [v57 presentationController];
  [v58 setDelegate:self];

  id v59 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(FBKBugFormTableViewController *)self setCellHeights:v59];

  [(FBKBugFormTableViewController *)self registerApplicationNotifications];
  LODWORD(v59) = self->_useInlineChoices;
  uint64_t v60 = [(FBKBugFormTableViewController *)self draftingController];
  [v60 setUseInlineChoices:v59 != 0];

  objc_destroyWeak(&v65);
  objc_destroyWeak(&location);
}

id __44__FBKBugFormTableViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  v11 = [WeakRetained tableView:v9 cellForRowAtIndexPath:v8 withItemIdentifier:v7];

  [v11 setItemIdentifier:v7];

  return v11;
}

- (void)viewDidAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)FBKBugFormTableViewController;
  [(FBKBugFormTableViewController *)&v14 viewDidAppear:a3];
  [(FBKBugFormTableViewController *)self registerForKeyboardNotifications];
  [(FBKBugFormTableViewController *)self setViewHasBecomeVisible:1];
  v4 = [(FBKBugFormTableViewController *)self pendingFeedbackObject];

  if (v4)
  {
    uint64_t v5 = [(FBKBugFormTableViewController *)self appToken];
    id v7 = (void *)v5;
    if (v5 && (FBKIsInternalInstall(v5, v6) & 1) != 0)
    {
      id v8 = [(FBKBugFormTableViewController *)self pendingFeedbackObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v10 = [(FBKBugFormTableViewController *)self draftingController];
        v11 = [(FBKBugFormTableViewController *)self pendingFeedbackObject];
        double v12 = [(FBKBugFormTableViewController *)self requestedPlugIns];
        v13 = [(FBKBugFormTableViewController *)self appToken];
        [v10 loadNewResponseForBugFormStub:v11 requestPlugIns:v12 appToken:v13];

LABEL_8:
        [(FBKBugFormTableViewController *)self setPendingFeedbackObject:0];
        [(FBKBugFormTableViewController *)self setPendingTeam:0];
        return;
      }
    }
    else
    {
    }
    id v10 = [(FBKBugFormTableViewController *)self draftingController];
    v11 = [(FBKBugFormTableViewController *)self pendingFeedbackObject];
    double v12 = [(FBKBugFormTableViewController *)self pendingTeam];
    [v10 loadResponseForFeedbackObject:v11 withTeam:v12];
    goto LABEL_8;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FBKBugFormTableViewController;
  [(FBKBugFormTableViewController *)&v5 viewDidDisappear:a3];
  [(FBKBugFormTableViewController *)self unregisterForKeyboardNotifications];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:@"FBKDeviceListDidChange" object:0];
}

- (id)largeTitleView:(id)a3 icon:(id)a4
{
  v25[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  [v8 setAxis:0];
  [v8 setSpacing:1.17549435e-38];
  [v8 setAlignment:3];
  if (v6 && [v6 length])
  {
    id v9 = (void *)MEMORY[0x263F82818];
    id v10 = [MEMORY[0x263F825C8] systemBlackColor];
    v25[0] = v10;
    v11 = [MEMORY[0x263F825C8] systemYellowColor];
    v25[1] = v11;
    double v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
    v13 = [v9 configurationWithPaletteColors:v12];

    objc_super v14 = [MEMORY[0x263F82818] configurationWithPointSize:(uint64_t)*MEMORY[0x263F81800] weight:22.0];
    v15 = [v13 configurationByApplyingConfiguration:v14];

    v16 = [MEMORY[0x263F827E8] systemImageNamed:v6 withConfiguration:v15];
    if (v16)
    {
      id v17 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v16];
      [v8 addArrangedSubview:v17];
    }
    else
    {
      id v17 = Log_7();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[FBKBugFormTableViewController largeTitleView:icon:]((uint64_t)v6, v17);
      }
    }
  }
  id v18 = objc_alloc(MEMORY[0x263F828E0]);
  v19 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v19 setText:v7];

  v20 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83618]];
  [v19 setFont:v20];

  v21 = [MEMORY[0x263F81708] boldSystemFontOfSize:22.0];
  [v19 setFont:v21];
  [v19 sizeToFit];
  [v8 addArrangedSubview:v19];
  v22 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_askDelegateToGoFullScreenIfNeeded];
  [v8 addGestureRecognizer:v22];
  v23 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v8];

  return v23;
}

- (id)cancelButtonOnRight
{
  v3 = (void *)MEMORY[0x263F82818];
  v4 = [MEMORY[0x263F825C8] systemGrayColor];
  objc_super v5 = [v3 configurationWithHierarchicalColor:v4];

  id v6 = [MEMORY[0x263F82818] configurationWithPointSize:(uint64_t)*MEMORY[0x263F81840] weight:22.0];
  id v7 = [v5 configurationByApplyingConfiguration:v6];

  id v8 = objc_alloc(MEMORY[0x263F824A8]);
  id v9 = [MEMORY[0x263F827E8] systemImageNamed:@"xmark.circle.fill" withConfiguration:v7];
  id v10 = (void *)[v8 initWithImage:v9 style:0 target:self action:sel_dismiss_];

  return v10;
}

- (void)updateTitle
{
  v3 = [(FBKBugFormTableViewController *)self formStub];
  id v15 = [v3 name];

  if (!v15 || ![v15 length])
  {
    v4 = [(FBKBugFormTableViewController *)self formResponse];
    objc_super v5 = [v4 bugForm];
    uint64_t v6 = [v5 name];

    id v15 = (id)v6;
  }
  BOOL v7 = +[FBKSharedConstants isRunningInFBA];
  id v8 = [(FBKBugFormTableViewController *)self navigationItem];
  id v9 = v8;
  if (v7)
  {
    [v8 setTitleView:0];

    id v10 = [(FBKBugFormTableViewController *)self navigationItem];
    [v10 setTitle:v15];
  }
  else
  {
    [v8 setTitle:0];

    v11 = [(FBKBugFormTableViewController *)self largeTitleIcon];
    id v10 = [(FBKBugFormTableViewController *)self largeTitleView:v15 icon:v11];

    double v12 = [(FBKBugFormTableViewController *)self navigationItem];
    [v12 setLeftBarButtonItem:v10 animated:0];

    v13 = [(FBKBugFormTableViewController *)self cancelButtonOnRight];
    objc_super v14 = [(FBKBugFormTableViewController *)self navigationItem];
    [v14 setRightBarButtonItem:v13 animated:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FBKBugFormTableViewController;
  [(FBKBugFormTableViewController *)&v7 viewWillAppear:a3];
  v4 = [(FBKBugFormTableViewController *)self tableView];
  objc_super v5 = [(FBKBugFormTableViewController *)self tableView];
  uint64_t v6 = [v5 indexPathForSelectedRow];
  [v4 deselectRowAtIndexPath:v6 animated:0];
}

- (void)_hideDevices
{
  id v2 = +[FBKDeviceManager sharedInstance];
  [v2 setHidesNotConfiguredDevices:1];
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)FBKBugFormTableViewController;
  [(FBKBugFormTableViewController *)&v6 viewDidLayoutSubviews];
  v3 = [(FBKBugFormTableViewController *)self view];
  [v3 frame];
  double v5 = v4;

  [(FBKBugFormTableViewController *)self setIsPresentedInSmallDetent:v5 <= 65.0 + 65.0];
}

- (BOOL)hasCandidateStubs
{
  return [(FBKBugFormTableViewController *)self cachedCandidateStubsCount] > 1;
}

- (void)loadNewResponseForBugFormStub:(id)a3 forTeam:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  [(FBKBugFormTableViewController *)self setLoadDraftCompletion:a5];
  [(FBKBugFormTableViewController *)self loadNewResponseForBugFormStub:v9 forTeam:v8];
}

- (void)loadNewResponseForBugFormStub:(id)a3 forTeam:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = Log_7();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 debugDescription];
    id v10 = [v7 shortDescription];
    int v12 = 138543618;
    v13 = v9;
    __int16 v14 = 2114;
    id v15 = v10;
    _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "Loading new response with Form [%{public}@], team [%{public}@] ", (uint8_t *)&v12, 0x16u);
  }
  if ([(FBKBugFormTableViewController *)self viewHasBecomeVisible])
  {
    v11 = [(FBKBugFormTableViewController *)self draftingController];
    [v11 loadNewResponseForBugFormStub:v6 withTeam:v7];
  }
  else
  {
    [(FBKBugFormTableViewController *)self setPendingFeedbackObject:v6];
    [(FBKBugFormTableViewController *)self setPendingTeam:v7];
  }
}

- (void)loadNewResponseForSurvey:(id)a3 forTeam:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(FBKBugFormTableViewController *)self viewHasBecomeVisible])
  {
    id v7 = [(FBKBugFormTableViewController *)self draftingController];
    [v7 loadNewResponseForBugForm:v8 withTeam:v6];

    id v6 = v7;
  }
  else
  {
    [(FBKBugFormTableViewController *)self setPendingFeedbackObject:v8];
    [(FBKBugFormTableViewController *)self setPendingTeam:v6];
  }
}

- (void)loadDraft:(id)a3
{
  id v5 = a3;
  if ([(FBKBugFormTableViewController *)self viewHasBecomeVisible])
  {
    double v4 = [(FBKBugFormTableViewController *)self draftingController];
    [v4 loadFormResponseFromContentItem:v5];
  }
  else
  {
    [(FBKBugFormTableViewController *)self setPendingFeedbackObject:v5];
  }
}

- (void)preAttachFiles:(id)a3
{
  id v4 = +[FBKLaunchAction validateURLSchemeFilePathsDictionary:a3];
  [(FBKBugFormTableViewController *)self setPendingAttachments:v4];
}

- (void)postAttachFiles:(id)a3
{
  id v4 = a3;
  id v6 = [(FBKBugFormTableViewController *)self devicesController];
  id v5 = +[FBKLaunchAction validateURLSchemeFilePathsDictionary:v4];

  [v6 postLaunchAttachLocalFiles:v5];
}

- (void)setLaunchAction:(id)a3
{
  id v12 = a3;
  objc_storeStrong((id *)&self->_launchAction, a3);
  id v5 = [v12 attachments];

  if (v5)
  {
    id v6 = [v12 attachments];
    id v7 = (void *)[v6 copy];
    [(FBKBugFormTableViewController *)self preAttachFiles:v7];
  }
  id v8 = [v12 questionAnswerPairs];

  if (v8)
  {
    id v9 = [v12 questionAnswerPairs];
    [(FBKBugFormTableViewController *)self setPendingQandA:v9];
  }
  id v10 = [v12 extensions];

  if (v10)
  {
    v11 = [v12 extensions];
    [(FBKBugFormTableViewController *)self setExtensions:v11];
  }
}

- (void)close
{
}

- (void)closeWithCompletion:(id)a3
{
}

- (void)saveDraftWithIsClosing:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"SAVING_DRAFT" value:&stru_26DDF6A30 table:@"CommonStrings"];
  [(FBKBugFormTableViewController *)self showSpinnerWithStatus:v8];

  if (v4
    && +[FBKSharedConstants usesTemporaryDraftsDirectory])
  {
    id v9 = [(FBKBugFormTableViewController *)self devicesController];
    id v10 = [v9 currentDeviceAttachmentManager];
    v11 = [v10 fileCollector];
    [v11 saveDraftsDirectory];
  }
  objc_initWeak(&location, self);
  id v12 = +[FBKData sharedInstance];
  v13 = [(FBKBugFormTableViewController *)self formResponse];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__FBKBugFormTableViewController_saveDraftWithIsClosing_completion___block_invoke;
  v15[3] = &unk_2648771F0;
  BOOL v18 = v4;
  objc_copyWeak(&v17, &location);
  id v14 = v6;
  v15[4] = self;
  id v16 = v14;
  [v12 saveFormResponse:v13 completion:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __67__FBKBugFormTableViewController_saveDraftWithIsClosing_completion___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  if (!v13
    && *(unsigned char *)(a1 + 56)
    && !+[FBKSharedConstants isRunningInFBA])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v4 = [WeakRetained localizedAttachmentLegalText];
    if (v4)
    {
      id v5 = (void *)v4;
      id v6 = objc_loadWeakRetained((id *)(a1 + 48));
      id v7 = [v6 formResponse];
      id v8 = [v7 ID];

      if (!v8) {
        goto LABEL_2;
      }
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      id v9 = [WeakRetained localizedAttachmentLegalText];
      id v10 = objc_loadWeakRetained((id *)(a1 + 48));
      v11 = [v10 formResponse];
      id v12 = [v11 ID];
      +[FBKSharedConstants saveLocalizedAttachmentLegalText:v9 draftID:v12];
    }
  }
LABEL_2:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) hideSpinner];
}

- (void)closeDraftAndDelete:(BOOL)a3 completion:(id)a4
{
}

- (void)closeDraftAndDelete:(BOOL)a3 withError:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  [(FBKBugFormTableViewController *)self setIsBeingDismissedBySelf:1];
  id v10 = [(FBKBugFormTableViewController *)self formResponse];
  v11 = [v10 ID];
  int v12 = [v11 intValue];

  id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"CLOSING_FEEDBACK_EDITOR" value:&stru_26DDF6A30 table:@"CommonStrings"];
  [(FBKBugFormTableViewController *)self showSpinnerWithStatus:v14];

  id v15 = [(FBKBugFormTableViewController *)self navigationItem];
  id v16 = [v15 rightBarButtonItem];
  [v16 setEnabled:0];

  id v17 = [(FBKBugFormTableViewController *)self navigationItem];
  BOOL v18 = [v17 leftBarButtonItem];
  [v18 setEnabled:0];

  [(FBKBugFormTableViewController *)self setModalInPresentation:1];
  objc_initWeak(&location, self);
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = __74__FBKBugFormTableViewController_closeDraftAndDelete_withError_completion___block_invoke;
  v29 = &unk_264877218;
  objc_copyWeak(&v31, &location);
  int v32 = v12;
  BOOL v33 = a3;
  id v19 = v9;
  id v30 = v19;
  v20 = (void (**)(void *, id))_Block_copy(&v26);
  if (a3)
  {
    v21 = Log_7();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v36 = v12;
      _os_log_impl(&dword_22A36D000, v21, OS_LOG_TYPE_INFO, "Closing bug form for FR [%d], deleting", buf, 8u);
    }

    -[FBKBugFormTableViewController _deleteCurrentDraftWithCompletion:](self, "_deleteCurrentDraftWithCompletion:", v20, v26, v27, v28, v29);
    v22 = Log_7();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v36 = v12;
      _os_log_impl(&dword_22A36D000, v22, OS_LOG_TYPE_INFO, "will delete all sessions for form response [%i]", buf, 8u);
    }

    v23 = [(FBKBugFormTableViewController *)self devicesController];
    [v23 abortAllSessions];
  }
  else
  {
    v24 = Log_7();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v25)
      {
        *(_DWORD *)buf = 67109120;
        int v36 = v12;
        _os_log_impl(&dword_22A36D000, v24, OS_LOG_TYPE_INFO, "Closing bug form for FR [%d] after error, not saving", buf, 8u);
      }

      v20[2](v20, v8);
    }
    else
    {
      if (v25)
      {
        *(_DWORD *)buf = 67109120;
        int v36 = v12;
        _os_log_impl(&dword_22A36D000, v24, OS_LOG_TYPE_INFO, "Closing bug form for FR [%d], saving", buf, 8u);
      }

      -[FBKBugFormTableViewController saveDraftWithIsClosing:completion:](self, "saveDraftWithIsClosing:completion:", 1, v20, v26, v27, v28, v29);
    }
  }

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __74__FBKBugFormTableViewController_closeDraftAndDelete_withError_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained unregisterApplicationNotifications];

  id v6 = objc_loadWeakRetained(v4);
  [v6 setDevicesController:0];

  if (a2)
  {
    id v7 = Log_7();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __74__FBKBugFormTableViewController_closeDraftAndDelete_withError_completion___block_invoke_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  id v14 = objc_loadWeakRetained(v4);
  id v15 = [v14 delegate];
  id v16 = objc_loadWeakRetained(v4);
  [v15 controller:v16 didRequestDismissalWithSavedDraft:*(unsigned char *)(a1 + 52) == 0];

  uint64_t v17 = *(void *)(a1 + 32);
  if (v17) {
    (*(void (**)(void))(v17 + 16))();
  }
  id v18 = objc_loadWeakRetained(v4);
  [v18 hideSpinner];
}

- (void)_deleteCurrentDraftWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  BOOL v5 = [(FBKBugFormTableViewController *)self showsDraftDeletionMessage];
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = v6;
  if (v5) {
    uint64_t v8 = @"DELETING_DRAFT";
  }
  else {
    uint64_t v8 = @"CLOSING_FEEDBACK_EDITOR";
  }
  uint64_t v9 = [v6 localizedStringForKey:v8 value:&stru_26DDF6A30 table:@"CommonStrings"];
  [(FBKBugFormTableViewController *)self showSpinnerWithStatus:v9];

  uint64_t v10 = [(FBKBugFormTableViewController *)self itemFromDraft];

  if (v10)
  {
    uint64_t v11 = +[FBKData sharedInstance];
    uint64_t v12 = [(FBKBugFormTableViewController *)self itemFromDraft];
    [v11 deleteDraftFromContentItem:v12 completion:v4];
  }
  else
  {
    uint64_t v13 = Log_7();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[FBKBugFormTableViewController _deleteCurrentDraftWithCompletion:](v13);
    }

    v4[2](v4, 0);
  }
}

- (void)closeWithError:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  if ([(FBKBugFormTableViewController *)self alwaysDeletesDrafts])
  {
    uint64_t v8 = [(FBKBugFormTableViewController *)self draftingController];
    uint64_t v9 = [v8 isDirty] ^ 1;
  }
  else
  {
    uint64_t v9 = 1;
  }
  uint64_t v10 = Log_7();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = [(FBKBugFormTableViewController *)self alwaysDeletesDrafts];
    uint64_t v12 = [(FBKBugFormTableViewController *)self draftingController];
    int v13 = 136446978;
    id v14 = "-[FBKBugFormTableViewController closeWithError:completion:]";
    __int16 v15 = 1024;
    BOOL v16 = v11;
    __int16 v17 = 1024;
    int v18 = [v12 isDirty];
    __int16 v19 = 1024;
    int v20 = v9;
    _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}s self.alwaysDeletesDrafts [%i], self.draftingController.isDirty [%i], shouldDelete [%i]", (uint8_t *)&v13, 0x1Eu);
  }
  [(FBKBugFormTableViewController *)self closeDraftAndDelete:v9 withError:v7 completion:v6];
}

- (id)itemFromDraft
{
  id v2 = [(FBKBugFormTableViewController *)self draftingController];
  v3 = [v2 formResponse];
  uint64_t v4 = [v3 contentItem];

  return v4;
}

- (id)formStub
{
  id v2 = [(FBKBugFormTableViewController *)self draftingController];
  v3 = [v2 formStub];

  return v3;
}

- (FBKFormResponse)formResponse
{
  id v2 = [(FBKBugFormTableViewController *)self draftingController];
  v3 = [v2 formResponse];

  return (FBKFormResponse *)v3;
}

- (FBKBugForm)bugForm
{
  id v2 = [(FBKBugFormTableViewController *)self formResponse];
  v3 = [v2 bugForm];

  return (FBKBugForm *)v3;
}

- (void)draftingControllerDidBeginLoading:(id)a3
{
  [(FBKBugFormTableViewController *)self updateTitle];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v5 = [v4 localizedStringForKey:@"LOADING_DRAFT" value:&stru_26DDF6A30 table:@"CommonStrings"];
  [(FBKBugFormTableViewController *)self showSpinnerWithStatus:v5];

  [(FBKBugFormTableViewController *)self setModalInPresentation:1];

  [(FBKBugFormTableViewController *)self updateUI:1];
}

- (void)draftingControllerDidFinishLoading:(id)a3 withError:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = Log_7();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(FBKBugFormTableViewController *)self formResponse];
    uint64_t v10 = [v9 ID];
    *(_DWORD *)buf = 67109120;
    int v44 = [v10 intValue];
    _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "finished loading draft for form response [%i]", buf, 8u);
  }
  [(FBKBugFormTableViewController *)self setHasLoadedFirstDraft:1];
  [(FBKBugFormTableViewController *)self setModalInPresentation:[(FBKBugFormTableViewController *)self isCaptiveModeEnabled]];
  BOOL v11 = [(FBKBugFormTableViewController *)self bugForm];
  if ([v11 collectsFiles])
  {
    BOOL v12 = +[FBKSharedConstants isRunningInFBA];

    if (!v12) {
      goto LABEL_8;
    }
    int v13 = [v6 formResponse];
    id v14 = [v13 ID];
    BOOL v11 = +[FBKSharedConstants localizedAttachmentLegalTextForDraftID:v14];

    if (v11) {
      [(FBKBugFormTableViewController *)self setLocalizedAttachmentLegalText:v11];
    }
  }

LABEL_8:
  [(FBKBugFormTableViewController *)self updateUI:0];
  if (v7)
  {
    __int16 v15 = Log_7();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[FBKBugFormTableViewController draftingControllerDidFinishLoading:withError:](v7, v15);
    }

    [(FBKBugFormTableViewController *)self _handleLoadingError:v7];
  }
  else
  {
    BOOL v16 = [(FBKBugFormTableViewController *)self pendingQandA];

    if (v16)
    {
      __int16 v17 = +[FBKLog currentURLActionActivity];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __78__FBKBugFormTableViewController_draftingControllerDidFinishLoading_withError___block_invoke;
      block[3] = &unk_264873FE8;
      block[4] = self;
      os_activity_apply(v17, block);
    }
    int v18 = [(FBKBugFormTableViewController *)self bugForm];
    int v19 = [v18 collectsFiles];

    if (v19)
    {
      int v20 = [FBKDeviceDiagnosticsController alloc];
      uint64_t v21 = +[FBKDeviceManager sharedInstance];
      v22 = [(FBKBugFormTableViewController *)self formResponse];
      v23 = [(FBKBugFormTableViewController *)self pendingAttachments];
      v24 = [(FBKBugFormTableViewController *)self extensions];
      BOOL v25 = [(FBKBugFormTableViewController *)self formResponse];
      uint64_t v26 = [v25 draftDevices];
      LOBYTE(v41) = [(FBKBugFormTableViewController *)self autoGathersDiagnosticExtensions];
      uint64_t v27 = [(FBKDeviceDiagnosticsController *)v20 initWithDeviceManager:v21 delegate:self filerForm:v22 pendingFileUrls:v23 pendingURLExtensions:v24 draftDeviceIds:v26 attachmentDescriptors:0 autoGathersDiagnosticExtensions:v41];
      [(FBKBugFormTableViewController *)self setDevicesController:v27];

      [(FBKBugFormTableViewController *)self setExtensions:0];
    }
    else
    {
      v28 = Log_7();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = [(FBKBugFormTableViewController *)self bugForm];
        id v30 = [v29 ID];
        int v31 = [v30 intValue];
        *(_DWORD *)buf = 67109120;
        int v44 = v31;
        _os_log_impl(&dword_22A36D000, v28, OS_LOG_TYPE_INFO, "bug form [%i] does not collect files", buf, 8u);
      }
      [(FBKBugFormTableViewController *)self setDevicesController:0];
      [(FBKBugFormTableViewController *)self _stopSpinner];
    }
    [(FBKBugFormTableViewController *)self updateTitle];
    int v32 = [(FBKBugFormTableViewController *)self navigationItem];
    BOOL v33 = [v32 leftBarButtonItem];
    [v33 setEnabled:1];

    [(FBKBugFormTableViewController *)self setAttemptedSubmission:0];
    [(FBKBugFormTableViewController *)self updateSubmitButtonState];
    [(FBKBugFormTableViewController *)self showQuestions];
    [(FBKBugFormTableViewController *)self updateCachedCandidateStubsCount];
    uint64_t v34 = [(FBKBugFormTableViewController *)self loadDraftCompletion];

    if (v34)
    {
      uint64_t v35 = [(FBKBugFormTableViewController *)self loadDraftCompletion];
      v35[2](v35, 0);
    }
    int v36 = [(FBKBugFormTableViewController *)self submitButtonLarge];
    uint64_t v37 = [(FBKBugFormTableViewController *)self tableView];
    [v37 setTableFooterView:v36];

    id v38 = [(FBKBugFormTableViewController *)self delegate];
    uint64_t v39 = [(FBKBugFormTableViewController *)self formResponse];
    v40 = [(FBKBugFormTableViewController *)self devicesController];
    [v38 controller:self didFinishLoadingDraft:v39 devicesController:v40 draftingController:v6];
  }
}

void __78__FBKBugFormTableViewController_draftingControllerDidFinishLoading_withError___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) draftingController];
  id v2 = [*(id *)(a1 + 32) pendingQandA];
  [v3 attachAnswersToQuestionsWithGivenData:v2];
}

- (void)_handleLoadingError:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FBKBugFormTableViewController *)self navigationItem];
  id v6 = [v5 leftBarButtonItem];
  [v6 setEnabled:1];

  [(FBKBugFormTableViewController *)self _stopSpinner];
  id v7 = (void *)MEMORY[0x263F82418];
  uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:@"GENERIC_DRAFT_LOAD_ERROR_TITLE" value:&stru_26DDF6A30 table:0];
  uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v11 = [v10 localizedStringForKey:@"GENERIC_DRAFT_LOAD_ERROR_MESSAGE" value:&stru_26DDF6A30 table:0];
  BOOL v12 = [v7 fbaAlertControllerWithTitle:v9 message:v11 preferredStyle:1];

  int v13 = (void *)MEMORY[0x263F82400];
  id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  __int16 v15 = [v14 localizedStringForKey:@"OK" value:&stru_26DDF6A30 table:0];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __53__FBKBugFormTableViewController__handleLoadingError___block_invoke;
  v22 = &unk_264877240;
  v23 = self;
  id v16 = v4;
  id v24 = v16;
  __int16 v17 = [v13 actionWithTitle:v15 style:1 handler:&v19];
  objc_msgSend(v12, "addAction:", v17, v19, v20, v21, v22, v23);

  [(FBKBugFormTableViewController *)self presentViewController:v12 animated:1 completion:0];
  int v18 = Log_7();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[FBKBugFormTableViewController _handleLoadingError:](v16, v18);
  }
}

void __53__FBKBugFormTableViewController__handleLoadingError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) unregisterApplicationNotifications];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 controller:*(void *)(a1 + 32) didFailToLoadDraftWithError:*(void *)(a1 + 40)];
}

- (void)questionVisibilityDidUpdateForDraftingController:(id)a3
{
}

- (void)draftingController:(id)a3 madeVisibilityUpdatesWithSnapshotDiff:(id)a4
{
  -[FBKBugFormTableViewController updateUI:](self, "updateUI:", objc_msgSend(a4, "containsAnyAdditionsOrRemovals", a3));
  id v5 = [(FBKBugFormTableViewController *)self devicesController];
  [v5 reevaluateMatcherPredicates];
}

- (id)questionGroupForSection:(int64_t)a3
{
  id v5 = [(FBKBugFormTableViewController *)self diffableDataSource];
  id v6 = [v5 snapshot];
  id v7 = [v6 sectionIdentifiers];
  uint64_t v8 = [v7 objectAtIndexedSubscript:a3];

  uint64_t v9 = [(FBKBugFormTableViewController *)self draftingController];
  uint64_t v10 = [v9 questionGroupForSectionIdentifier:v8];

  return v10;
}

- (BOOL)_useAttachmentCellRedesign
{
  return !+[FBKSharedConstants isRunningInFBA];
}

- (double)_separatorInset
{
  if ([(FBKBugFormTableViewController *)self _useAttachmentCellRedesign])
  {
    id v3 = [(FBKBugFormTableViewController *)self tableView];
    [v3 separatorInset];
    double v5 = v4;
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__FBKBugFormTableViewController__separatorInset__block_invoke;
    block[3] = &unk_264873FE8;
    block[4] = self;
    if (_separatorInset_onceToken != -1) {
      dispatch_once(&_separatorInset_onceToken, block);
    }
    return *(double *)&_separatorInset_inset;
  }
  return v5;
}

void __48__FBKBugFormTableViewController__separatorInset__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) tableView];
  id v2 = +[FBKDeviceDisplayCell reuseIdentifier];
  id v4 = [v1 dequeueReusableCellWithIdentifier:v2];

  [v4 spaceFromSuperViewToLabel];
  _separatorInset_inset = v3;
}

- (void)adjustAttachmentLabelSpacing:(id)a3
{
  id v4 = a3;
  [(FBKBugFormTableViewController *)self _separatorInset];
  objc_msgSend(v4, "updateWithSeparatorSpacing:");
  [(FBKBugFormTableViewController *)self _separatorInset];
  objc_msgSend(v4, "updateSuperviewToAttachmentLabelSpacing:");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 withItemIdentifier:(id)a5
{
  uint64_t v204 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(FBKBugFormTableViewController *)self diffableDataSource];
  BOOL v12 = [v11 snapshot];
  int v13 = [v12 sectionIdentifierForSectionContainingItemIdentifier:v10];

  if (!v13)
  {
    [MEMORY[0x263EFF940] raise:@"FBK UI Exception", @"Section Identifier is nil, cannot proceed" format];
    id v14 = 0;
    goto LABEL_106;
  }
  if ([v13 isEqualToString:@"UserCell"])
  {
    id v14 = [v8 dequeueReusableCellWithIdentifier:@"UserCell" forIndexPath:v9];
    __int16 v15 = +[FBKData sharedInstance];
    id v16 = [v15 currentUser];

    [(FBKDiffableTableViewCell *)v14 updateWithUser:v16];
    if (self->_disableAccountSwitching)
    {
      [(FBKDiffableTableViewCell *)v14 setSelectionStyle:0];
      [(UITableViewCell *)v14 disableRemoteHoverEffect];
    }
    goto LABEL_5;
  }
  if ([v13 isEqualToString:@"TeamPicker"])
  {
    __int16 v17 = [(FBKBugFormTableViewController *)self teamPickerRowIdentifier];
    id v14 = [v8 dequeueReusableCellWithIdentifier:v17];

    if (!v14)
    {
      int v18 = [FBKDiffableTableViewCell alloc];
      uint64_t v19 = [(FBKBugFormTableViewController *)self teamPickerRowIdentifier];
      id v14 = [(FBKDiffableTableViewCell *)v18 initWithStyle:3 reuseIdentifier:v19];
    }
    uint64_t v20 = [(FBKBugFormTableViewController *)self formStub];
    uint64_t v21 = [v20 teamsMatchingFormID];

    v22 = [(FBKBugFormTableViewController *)self currentTeam];
    -[FBKDiffableTableViewCell configureForTeam:disclosesMoreTeams:](v14, "configureForTeam:disclosesMoreTeams:", v22, (unint64_t)[v21 count] > 1);

    goto LABEL_106;
  }
  if ([v13 isEqualToString:@"FormPicker"])
  {
    v23 = +[FBKTopicCell reuseIdentifier];
    id v14 = [v8 dequeueReusableCellWithIdentifier:v23 forIndexPath:v9];

    id v24 = [(FBKBugFormTableViewController *)self formStub];
    [(FBKDiffableTableViewCell *)v14 setFormStub:v24];

    [(FBKDiffableTableViewCell *)v14 setDisclosesMoreForms:[(FBKBugFormTableViewController *)self cachedCandidateStubsCount] > 1];
    goto LABEL_106;
  }
  if ([v13 hasPrefix:@"DeviceAttachmentsSectionType"])
  {
    BOOL v25 = [(FBKBugFormTableViewController *)self devicesController];
    id v16 = [v25 maybeAttachmentWithIdentifier:v10];

    uint64_t v26 = [(FBKBugFormTableViewController *)self devicesController];
    uint64_t v27 = [v26 maybeDeviceWithIdentifier:v10];

    if (v27)
    {
      v28 = +[FBKDeviceDisplayCell reuseIdentifier];
      id v14 = [v8 dequeueReusableCellWithIdentifier:v28 forIndexPath:v9];

      [(FBKDiffableTableViewCell *)v14 updateWithDevice:v27];
      [(FBKBugFormTableViewController *)self _separatorInset];
      -[UITableViewCell updateWithSeparatorSpacing:](v14, "updateWithSeparatorSpacing:");
LABEL_16:

LABEL_5:
      goto LABEL_106;
    }
    if (v16)
    {
      if ([(FBKBugFormTableViewController *)self _useAttachmentCellRedesign])
      {
        int v31 = +[FBKAttachmentDiffableCellView reuseIdentifier];
        id v14 = [(FBKBugFormTableViewController *)self attachmentCellViewWithTableView:v8 indexPath:v9 reuseIdentifier:v31 attachment:v16];
      }
      else
      {
        CFURLRef v55 = +[FBKAttachmentCell reuseIdentifier];
        id v14 = [v8 dequeueReusableCellWithIdentifier:v55 forIndexPath:v9];

        [(FBKDiffableTableViewCell *)v14 setShowsIcon:0];
        [(FBKDiffableTableViewCell *)v14 setAttachment:v16];
        if (+[FBKSharedConstants isRunningInFBA]
          || ([(FBKBugFormTableViewController *)self devicesController],
              CFURLRef v56 = objc_claimAutoreleasedReturnValue(),
              [v56 devicesInPlay],
              v57 = objc_claimAutoreleasedReturnValue(),
              unint64_t v195 = [v57 count],
              v57,
              v56,
              v195 >= 2))
        {
          [(FBKBugFormTableViewController *)self adjustAttachmentLabelSpacing:v14];
        }
        else
        {
          unsigned int v76 = [(FBKBugFormTableViewController *)self tableView];
          [v76 separatorInset];
          [(FBKDiffableTableViewCell *)v14 updateSuperviewToSeparatorSpacing:v77];
        }
      }
      goto LABEL_16;
    }
    [MEMORY[0x263EFF940] raise:@"FBK UI Exception" format:@"Received unexpected diffable object"];
LABEL_25:
    int v32 = [(FBKBugFormTableViewController *)self draftingController];
    BOOL v33 = [v32 questionChoiceForSectionIdentifier:v13 itemIdentifier:v10];

    if (v33)
    {
      uint64_t v34 = +[FBKInlineChoiceCell reuseIdentifier];
      id v14 = [v8 dequeueReusableCellWithIdentifier:v34 forIndexPath:v9];

      [(FBKDiffableTableViewCell *)v14 setChoice:v33];
      uint64_t v35 = [(FBKDiffableTableViewCell *)v14 textLabel];
      [v35 setLineBreakMode:0];

      int v36 = [(FBKDiffableTableViewCell *)v14 textLabel];
      [v36 setNumberOfLines:0];

      uint64_t v37 = [(FBKBugFormTableViewController *)self draftingController];
      id v38 = [v37 questionForVisibleChoice:v33 sectionIdentifier:v13];

      if (v38)
      {
        uint64_t v39 = [(FBKBugFormTableViewController *)self formResponse];
        v194 = [v39 answerForQuestion:v38];

        v40 = [v194 values];
        uint64_t v41 = [v33 value];
        v42 = v33;
        v43 = v38;
        uint64_t v44 = [v40 containsObject:v41];

        uint64_t v45 = v44;
        id v38 = v43;
        BOOL v33 = v42;
        [(FBKDiffableTableViewCell *)v14 showCheckmark:v45];
      }
      else
      {
        v54 = +[FBKLog appHandle];
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          -[FBKBugFormTableViewController tableView:cellForRowAtIndexPath:withItemIdentifier:]();
        }
      }
LABEL_105:

      goto LABEL_106;
    }
    v46 = [(FBKBugFormTableViewController *)self draftingController];
    id v38 = [v46 visibleQuestionForSectionIdentifier:v13 itemIdentifier:v10];

    uint64_t v47 = [(FBKBugFormTableViewController *)self formResponse];
    v187 = [v47 answerForQuestion:v38];

    if ([v38 answerType] == 8
      || [v38 answerType] == 10
      || [v38 answerType] == 9)
    {
      v48 = [(FBKBugFormTableViewController *)self tableView];
      v49 = _TtC12FeedbackCore15FBKDateTimeCell;
LABEL_32:
      v50 = [(__objc2_class *)v49 reuseIdentifier];
      id v14 = [v48 dequeueReusableCellWithIdentifier:v50 forIndexPath:v9];

      v51 = 0;
      goto LABEL_33;
    }
    if ([v38 answerType] == 7)
    {
      v48 = [(FBKBugFormTableViewController *)self tableView];
      v49 = _TtC12FeedbackCore13FBKSliderCell;
      goto LABEL_32;
    }
    if ([v38 answerType] == 6)
    {
      v48 = [(FBKBugFormTableViewController *)self tableView];
      v49 = FBKInformationCell;
      goto LABEL_32;
    }
    if ([v38 answerType] == 11)
    {
      v48 = [(FBKBugFormTableViewController *)self tableView];
      v49 = _TtC12FeedbackCore20FBKModalQuestionCell;
      goto LABEL_32;
    }
    if ([v38 answerType] == 12)
    {
      v48 = [(FBKBugFormTableViewController *)self tableView];
      v49 = _TtC12FeedbackCore21FBKToggleQuestionCell;
      goto LABEL_32;
    }
    v198 = v38;
    id v181 = v9;
    if (!self->_useInlineChoices) {
      goto LABEL_126;
    }
    unint64_t v150 = [(FBKBugFormTableViewController *)self maxInlineChoices];
    if (v150 != -1)
    {
      uint64_t v47 = [v38 visibleChoices];
      unint64_t v151 = [v47 count];
      if (v151 > [(FBKBugFormTableViewController *)self maxInlineChoices]) {
        goto LABEL_119;
      }
    }
    if ([v198 answerType] == 2
      || [v198 answerType] == 3
      || [v198 answerType] == 4)
    {
      char v152 = [v198 canDisplayChoicesInline];
      if (v150 != -1) {

      }
      if ((v152 & 1) == 0)
      {
        v177 = [(FBKBugFormTableViewController *)self tableView];
        v178 = +[FBKExpandedChoiceCell reuseIdentifier];
        id v14 = [v177 dequeueReusableCellWithIdentifier:v178 forIndexPath:v9];

        [(UITableViewCell *)v14 disableRemoteHoverEffectAndClearBackground];
        v51 = 0;
LABEL_139:
        BOOL v33 = 0;
        id v38 = v198;
LABEL_33:
        switch([v38 answerType])
        {
          case 0:
          case 1:
            v182 = v33;
            v196 = v38;
            uint64_t v58 = [v187 value];
            id v59 = v51;
            if (v58
              && (uint64_t v60 = (void *)v58,
                  [v187 value],
                  uint64_t v61 = objc_claimAutoreleasedReturnValue(),
                  uint64_t v62 = [v61 length],
                  v61,
                  v60,
                  v62))
            {
              v63 = [v187 value];
              v64 = [(FBKDiffableTableViewCell *)v59 answerTextView];
              [v64 setText:v63];

              id v65 = [MEMORY[0x263F825C8] labelColor];
              uint64_t v66 = [(FBKDiffableTableViewCell *)v59 answerTextView];
              [v66 setTextColor:v65];
            }
            else
            {
              uint64_t v78 = [v196 placeholder];
              if (v78
                && (long long v79 = (void *)v78,
                    [v196 placeholder],
                    long long v80 = objc_claimAutoreleasedReturnValue(),
                    uint64_t v190 = [v80 length],
                    v80,
                    v79,
                    v190))
              {
                v191 = [v196 placeholder];
                long long v81 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
                long long v82 = [v191 stringByTrimmingCharactersInSet:v81];
                long long v83 = [(FBKDiffableTableViewCell *)v59 answerTextView];
                [v83 setText:v82];

                long long v84 = v191;
              }
              else
              {
                long long v84 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                long long v81 = [v84 localizedStringForKey:@"TEXT_ANSWER_PLACEHOLDER" value:&stru_26DDF6A30 table:0];
                long long v82 = [(FBKDiffableTableViewCell *)v59 answerTextView];
                [v82 setText:v81];
              }

              v100 = [MEMORY[0x263F825C8] tertiaryLabelColor];
              v101 = [(FBKDiffableTableViewCell *)v59 answerTextView];
              [v101 setTextColor:v100];

              id v65 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
              uint64_t v66 = [(FBKDiffableTableViewCell *)v59 answerTextView];
              [v66 setFont:v65];
            }

            v102 = [(FBKDiffableTableViewCell *)v59 answerTextView];
            [v102 setDelegate:self];

            v103 = [(FBKDiffableTableViewCell *)v59 answerTextView];
            v104 = [v103 text];
            v105 = [(FBKDiffableTableViewCell *)v59 answerTextView];
            [v105 setAccessibilityIdentifier:v104];

            [(FBKDiffableTableViewCell *)v59 hideAccessoryView];
            id v38 = v196;
            v51 = v59;
            goto LABEL_102;
          case 2:
          case 3:
            objc_opt_class();
            v182 = v33;
            v197 = v38;
            if (objc_opt_isKindOfClass())
            {
              v185 = v51;
              objc_super v67 = v38;
              v68 = v14;
              [(FBKDiffableTableViewCell *)v68 setQuestion:v67];
              v69 = [(FBKBugFormTableViewController *)self formResponse];
              v70 = [v69 answerForQuestion:v67];
              [(FBKDiffableTableViewCell *)v68 setAnswer:v70];

              [(FBKDiffableTableViewCell *)v68 setDelegate:self];
              if (![(FBKBugFormTableViewController *)self attemptedSubmission]) {
                goto LABEL_70;
              }
              v71 = [(FBKBugFormTableViewController *)self draftingController];
              v72 = [v71 invalidQuestionIDs];
              v73 = [v197 ID];
              char v74 = [v72 containsObject:v73];

              if (v74) {
                uint64_t v75 = 1;
              }
              else {
LABEL_70:
              }
                uint64_t v75 = 0;
              v51 = v185;
              [(FBKDiffableTableViewCell *)v68 setShowError:v75];
              [(FBKDiffableTableViewCell *)v68 updateCellContent];

              BOOL v33 = v182;
              goto LABEL_89;
            }
            uint64_t v94 = [v38 displayTextForAnswer:v187];
            v192 = (void *)v94;
            if (v94)
            {
              uint64_t v95 = v94;
              [(FBKDiffableTableViewCell *)v51 answerTextView];
              v97 = v96 = v51;
              [v97 setText:v95];

              v98 = [MEMORY[0x263F825C8] labelColor];
              v99 = [(FBKDiffableTableViewCell *)v96 answerTextView];
              [v99 setTextColor:v98];
            }
            else
            {
              v96 = v51;
              v125 = [v38 allChoices];
              v126 = [MEMORY[0x263F08A98] predicateWithFormat:@"isPrompt = YES"];
              v127 = [v125 filteredArrayUsingPredicate:v126];

              id obja = v127;
              if ([v127 count])
              {
                v128 = [v127 firstObject];
                [v128 title];
              }
              else
              {
                v128 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                [v128 localizedStringForKey:@"CHOICE_ANSWER_PLACEHOLDER" value:&stru_26DDF6A30 table:0];
              v132 = };
              v133 = [(FBKDiffableTableViewCell *)v96 answerTextView];
              [v133 setText:v132];

              v134 = [MEMORY[0x263F825C8] tertiaryLabelColor];
              v135 = [(FBKDiffableTableViewCell *)v96 answerTextView];
              [v135 setTextColor:v134];

              v136 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
              v137 = [(FBKDiffableTableViewCell *)v96 answerTextView];
              [v137 setFont:v136];

              v99 = [(FBKDiffableTableViewCell *)v96 answerTextView];
              [v99 setDelegate:0];
              v98 = obja;
            }

            v138 = [(FBKDiffableTableViewCell *)v96 answerTextView];
            v139 = [v138 text];
            v140 = [(FBKDiffableTableViewCell *)v96 answerTextView];
            [v140 setAccessibilityIdentifier:v139];

            v51 = v96;
            [(FBKDiffableTableViewCell *)v96 showAccessoryView];
            id v38 = v197;
            if ([v197 canDisplayChoicesInline] && self->_useInlineChoices) {
              [(FBKDiffableTableViewCell *)v96 hideAccessoryView];
            }

LABEL_102:
            BOOL v33 = v182;
            goto LABEL_103;
          case 4:
            v197 = v38;
            objc_opt_class();
            v183 = v33;
            v186 = v51;
            if (objc_opt_isKindOfClass())
            {
              long long v85 = v14;
              [(FBKDiffableTableViewCell *)v85 setQuestion:v197];
              long long v86 = [(FBKBugFormTableViewController *)self formResponse];
              v87 = [v86 answerForQuestion:v197];
              [(FBKDiffableTableViewCell *)v85 setAnswer:v87];

              [(FBKDiffableTableViewCell *)v85 setDelegate:self];
              if (![(FBKBugFormTableViewController *)self attemptedSubmission]) {
                goto LABEL_87;
              }
              id v88 = [(FBKBugFormTableViewController *)self draftingController];
              char v89 = [v88 invalidQuestionIDs];
              BOOL v90 = [v197 ID];
              char v91 = [v89 containsObject:v90];

              if (v91) {
                uint64_t v92 = 1;
              }
              else {
LABEL_87:
              }
                uint64_t v92 = 0;
              [(FBKDiffableTableViewCell *)v85 setShowError:v92];
              [(FBKDiffableTableViewCell *)v85 updateCellContent];

              BOOL v33 = v183;
              v51 = v186;
LABEL_89:
              id v38 = v197;
LABEL_103:
              v53 = v187;
            }
            else
            {
              uint64_t v106 = [v187 values];
              if (v106
                && (v107 = (void *)v106,
                    [v187 values],
                    v108 = objc_claimAutoreleasedReturnValue(),
                    uint64_t v109 = [v108 count],
                    v108,
                    v107,
                    v109))
              {
                id v180 = v9;
                v110 = [(FBKBugFormTableViewController *)self formResponse];
                v111 = [v110 answerForQuestion:v197];

                v112 = (void *)MEMORY[0x263EFF980];
                v113 = [v111 values];
                v193 = objc_msgSend(v112, "arrayWithCapacity:", objc_msgSend(v113, "count"));

                long long v201 = 0u;
                long long v202 = 0u;
                long long v199 = 0u;
                long long v200 = 0u;
                v179 = v111;
                obuint64_t j = [v111 values];
                uint64_t v114 = [obj countByEnumeratingWithState:&v199 objects:v203 count:16];
                if (v114)
                {
                  uint64_t v115 = v114;
                  uint64_t v116 = *(void *)v200;
                  do
                  {
                    for (uint64_t i = 0; i != v115; ++i)
                    {
                      if (*(void *)v200 != v116) {
                        objc_enumerationMutation(obj);
                      }
                      v118 = [v197 displayTextForAnswer:*(void *)(*((void *)&v199 + 1) + 8 * i)];
                      v119 = [NSString stringWithFormat:@"• %@", v118];
                      [v193 addObject:v119];
                    }
                    uint64_t v115 = [obj countByEnumeratingWithState:&v199 objects:v203 count:16];
                  }
                  while (v115);
                }

                v120 = [v193 componentsJoinedByString:@"\n"];
                v121 = v186;
                v122 = [(FBKDiffableTableViewCell *)v186 answerTextView];
                [v122 setText:v120];

                v123 = [MEMORY[0x263F825C8] labelColor];
                v124 = [(FBKDiffableTableViewCell *)v186 answerTextView];
                [v124 setTextColor:v123];

                id v9 = v180;
              }
              else
              {
                v129 = v197;
                v130 = [v197 placeholder];
                if (v130)
                {
                  [v197 placeholder];
                }
                else
                {
                  v129 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                  [v129 localizedStringForKey:@"CHOICE_ANSWER_PLACEHOLDER" value:&stru_26DDF6A30 table:0];
                v131 = };
                v142 = [(FBKDiffableTableViewCell *)v186 answerTextView];
                [v142 setText:v131];

                if (!v130)
                {

                  v131 = v129;
                }

                v143 = [MEMORY[0x263F825C8] tertiaryLabelColor];
                v121 = v186;
                v144 = [(FBKDiffableTableViewCell *)v186 answerTextView];
                [v144 setTextColor:v143];

                v145 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
                v146 = [(FBKDiffableTableViewCell *)v186 answerTextView];
                [v146 setFont:v145];
              }
              v147 = [(FBKDiffableTableViewCell *)v121 answerTextView];
              v148 = [v147 text];
              v149 = [(FBKDiffableTableViewCell *)v121 answerTextView];
              [v149 setAccessibilityIdentifier:v148];

              [(FBKDiffableTableViewCell *)v121 showAccessoryView];
              id v38 = v197;
              v51 = v121;
              BOOL v33 = v183;
              v53 = v187;
              if ([v197 canDisplayChoicesInline] && self->_useInlineChoices) {
                [(FBKDiffableTableViewCell *)v51 hideAccessoryView];
              }
            }
LABEL_104:
            [(FBKDiffableTableViewCell *)v14 layoutIfNeeded];

            break;
          case 6:
            v93 = v14;
            [v93 setQuestion:v38];
            [v93 disableRemoteHoverEffectAndClearBackground];
            goto LABEL_61;
          case 7:
            v184 = v51;
            v52 = v14;
            [(FBKDiffableTableViewCell *)v52 setQuestion:v38];
            v53 = v187;
            [(FBKDiffableTableViewCell *)v52 setAnswer:v187];
            [(FBKDiffableTableViewCell *)v52 setEditorDelegate:self];
            [(UITableViewCell *)v52 disableRemoteHoverEffectAndClearBackground];
            [(FBKDiffableTableViewCell *)v52 updateSliderAndLabel];
            goto LABEL_65;
          case 8:
          case 9:
          case 10:
            v184 = v51;
            v52 = v14;
            [(FBKDiffableTableViewCell *)v52 setQuestion:v38];
            v53 = v187;
            [(FBKDiffableTableViewCell *)v52 setAnswer:v187];
            [(FBKDiffableTableViewCell *)v52 setEditorDelegate:self];
            [(UITableViewCell *)v52 disableRemoteHoverEffectAndClearBackground];
            goto LABEL_65;
          case 11:
            [(FBKDiffableTableViewCell *)v14 setQuestion:v38];
            goto LABEL_103;
          case 12:
            v184 = v51;
            v52 = v14;
            [(FBKDiffableTableViewCell *)v52 setSelectionStyle:0];
            [(FBKDiffableTableViewCell *)v52 setQuestion:v38];
            v53 = v187;
            [(FBKDiffableTableViewCell *)v52 setAnswer:v187];
            [(FBKDiffableTableViewCell *)v52 setEditorDelegate:self];
LABEL_65:

            v51 = v184;
            goto LABEL_104;
          default:
            v93 = Log_7();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
              -[FBKBugFormTableViewController tableView:cellForRowAtIndexPath:withItemIdentifier:](v38, v93);
            }
LABEL_61:

            goto LABEL_103;
        }
        goto LABEL_105;
      }
    }
    else if (v150 != -1)
    {
LABEL_119:
    }
LABEL_126:
    if ([v198 canDisplayChoicesInline] && self->_useInlineChoices)
    {
      v153 = [(FBKBugFormTableViewController *)self tableView];
      v154 = FBKQuestionOnlyCell;
    }
    else
    {
      v153 = [(FBKBugFormTableViewController *)self tableView];
      v154 = FBKQuestionAnswerCell;
    }
    v155 = [(__objc2_class *)v154 reuseIdentifier];
    v156 = [v153 dequeueReusableCellWithIdentifier:v155 forIndexPath:v9];

    v157 = v156;
    [(FBKDiffableTableViewCell *)v157 setQuestion:v198];
    [(FBKDiffableTableViewCell *)v157 setAnswer:v187];
    [(FBKDiffableTableViewCell *)v157 setBugFormEditorDelegate:self];
    [(FBKDiffableTableViewCell *)v157 setSelectionStyle:2];
    v158 = [v198 text];
    v159 = v157;
    v160 = [(FBKDiffableTableViewCell *)v157 questionLabel];
    [v160 setText:v158];

    if (FBKIsInternalInstall(v161, v162))
    {
      v163 = [MEMORY[0x263EFFA40] standardUserDefaults];
      int v164 = [v163 BOOLForKey:@"showSortOrderForDebugging"];

      if (v164)
      {
        v165 = NSString;
        v166 = [v198 text];
        v167 = [v198 sortOrder];
        v168 = [v167 stringValue];
        v169 = [v165 stringWithFormat:@"%@ (%@)", v166, v168];
        v170 = [(FBKDiffableTableViewCell *)v159 questionLabel];
        [v170 setText:v169];
      }
    }
    if (![(FBKBugFormTableViewController *)self attemptedSubmission]) {
      goto LABEL_136;
    }
    v171 = [(FBKBugFormTableViewController *)self draftingController];
    v172 = [v171 invalidQuestionIDs];
    v173 = [v198 ID];
    int v174 = [v172 containsObject:v173];

    if (v174)
    {
      v51 = v159;
      v175 = v159;
      uint64_t v176 = 1;
    }
    else
    {
LABEL_136:
      v51 = v159;
      v175 = v159;
      uint64_t v176 = 0;
    }
    [(FBKDiffableTableViewCell *)v175 setShowError:v176];
    id v14 = v159;
    id v9 = v181;
    goto LABEL_139;
  }
  if (![v13 isEqualToString:@"AddAttachments"]) {
    goto LABEL_25;
  }
  id v14 = [v8 dequeueReusableCellWithIdentifier:@"AddAttachmentsItem" forIndexPath:v9];
  if (+[FBKAddAttachmentsCell supportsMenu])
  {
    v29 = [(FBKBugFormTableViewController *)self addAttachmentsController];
    id v30 = [v29 menuForController:self];
    [(FBKDiffableTableViewCell *)v14 setMenu:v30];
  }
  [(FBKBugFormTableViewController *)self setAddAttachmentCell:v14];
LABEL_106:

  return v14;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(FBKBugFormTableViewController *)self diffableDataSource];
  id v8 = [v7 tableView:v6 titleForHeaderInSection:a4];

  id v9 = +[QuestionGroupTitleViewController viewWithTitle:v8];

  return v9;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(FBKBugFormTableViewController *)self cellHeights];
  id v7 = [v6 objectForKey:v5];

  if (v7)
  {
    [v7 doubleValue];
    double v9 = v8;
  }
  else
  {
    double v9 = *MEMORY[0x263F839B8];
  }

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = [(FBKBugFormTableViewController *)self questionGroupUnderAttachmentsSectionIdentifier];

  if (!v6) {
    return *MEMORY[0x263F839B8];
  }
  uint64_t v7 = [(FBKBugFormTableViewController *)self diffableDataSource];
  double v8 = [(id)v7 snapshot];
  double v9 = [v8 sectionIdentifiers];
  id v10 = [v9 objectAtIndexedSubscript:a4];

  BOOL v11 = [(FBKBugFormTableViewController *)self questionGroupUnderAttachmentsSectionIdentifier];
  LOBYTE(v7) = [v10 isEqualToString:v11];

  if (v7) {
    return 0.001;
  }
  else {
    return *MEMORY[0x263F839B8];
  }
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(FBKBugFormTableViewController *)self diffableDataSource];
  double v8 = [v7 snapshot];
  double v9 = [v8 sectionIdentifiers];
  id v10 = [v9 objectAtIndexedSubscript:a4];

  BOOL v11 = [(FBKBugFormTableViewController *)self sectionThatWillHostLegalTextFooterSectionIdentifier];
  LODWORD(v8) = [v10 isEqualToString:v11];

  if (v8)
  {
    [v6 frame];
    double v13 = v12 + 20.0 * -2.0;
    id v14 = [(FBKBugFormTableViewController *)self legalViewBelowAttachments];
    LODWORD(v15) = 1148846080;
    LODWORD(v16) = 1112014848;
    objc_msgSend(v14, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v13, *(double *)(MEMORY[0x263F83810] + 8), v15, v16);
    double v18 = v17;
  }
  else
  {
    double v18 = *MEMORY[0x263F839B8];
  }

  return v18;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = [(FBKBugFormTableViewController *)self diffableDataSource];
  uint64_t v7 = [v6 snapshot];
  double v8 = [v7 sectionIdentifiers];
  double v9 = [v8 objectAtIndexedSubscript:a4];

  id v10 = [(FBKBugFormTableViewController *)self sectionThatWillHostLegalTextFooterSectionIdentifier];
  LODWORD(v7) = [v9 isEqualToString:v10];

  if (v7)
  {
    BOOL v11 = [(FBKBugFormTableViewController *)self legalViewBelowAttachments];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v12 = [v11 onBoardingKitViewController];
      [v12 willMoveToParentViewController:self];
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v13 = [(FBKBugFormTableViewController *)self cellHeights];
  double v9 = NSNumber;
  [v8 frame];
  double v11 = v10;

  double v12 = [v9 numberWithDouble:v11];
  [v13 setObject:v12 forKey:v7];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FBKBugFormTableViewController *)self diffableDataSource];
  double v9 = [v8 itemIdentifierForIndexPath:v7];

  double v10 = [(FBKBugFormTableViewController *)self diffableDataSource];
  double v11 = [v10 snapshot];
  double v12 = [v11 sectionIdentifierForSectionContainingItemIdentifier:v9];

  id v13 = Log_7();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v75 = v9;
    __int16 v76 = 2112;
    double v77 = v12;
    _os_log_impl(&dword_22A36D000, v13, OS_LOG_TYPE_INFO, "Did select item with identifier [%@] in section [%@]", buf, 0x16u);
  }

  if (![v12 isEqualToString:@"UserCell"])
  {
    if ([v12 hasPrefix:@"DeviceAttachmentsSectionType"])
    {
      double v18 = [(FBKBugFormTableViewController *)self devicesController];
      double v17 = [v18 maybeAttachmentWithIdentifier:v9];

      uint64_t v19 = [(FBKBugFormTableViewController *)self devicesController];
      uint64_t v20 = [v19 maybeDeviceWithIdentifier:v9];

      if (v20)
      {
        [(FBKBugFormTableViewController *)self didTapDevice:v20 indexPath:v7];
      }
      else if (v17)
      {
        [(FBKBugFormTableViewController *)self didTapAttachment:v17 indexPath:v7];
      }
      goto LABEL_51;
    }
    if ([v12 isEqualToString:@"AddAttachments"])
    {
      uint64_t v21 = [(FBKBugFormTableViewController *)self addAttachmentsController];
      v22 = [(FBKBugFormTableViewController *)self addAttachmentCell];
      double v17 = [v21 sheetForController:self selectedIndexPath:v7 sender:v22];

      [(FBKBugFormTableViewController *)self presentViewController:v17 animated:1 completion:0];
      goto LABEL_52;
    }
    if ([v12 isEqualToString:@"FormPicker"])
    {
      double v17 = [v6 cellForRowAtIndexPath:v7];
      [(FBKBugFormTableViewController *)self didPressChangeBugForm:v17];
      goto LABEL_52;
    }
    if ([v12 isEqualToString:@"TeamPicker"])
    {
      double v17 = [v6 cellForRowAtIndexPath:v7];
      v23 = [(FBKBugFormTableViewController *)self formStub];
      id v24 = [v23 teamsMatchingFormID];
      unint64_t v25 = [v24 count];

      if (v25 < 2) {
        goto LABEL_52;
      }
      uint64_t v20 = [MEMORY[0x263F82C28] teamPickerViewController];
      [v20 setPickerDelegate:self];
      [v20 setShowsDismissButton:1];
      uint64_t v26 = [(FBKBugFormTableViewController *)self formStub];
      [v20 setFormStub:v26];

      uint64_t v27 = [(FBKBugFormTableViewController *)self currentTeam];
      [v20 setSelectedTeam:v27];

      v28 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v20];
      [v28 setModalPresentationStyle:7];
      v29 = [v28 popoverPresentationController];
      [v29 setSourceView:v17];

      [v17 bounds];
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;
      double v37 = v36;
      id v38 = [v28 popoverPresentationController];
      objc_msgSend(v38, "setSourceRect:", v31, v33, v35, v37);

      uint64_t v39 = [v28 popoverPresentationController];
      [v39 setPermittedArrowDirections:1];

      v71[0] = MEMORY[0x263EF8330];
      v71[1] = 3221225472;
      v71[2] = __67__FBKBugFormTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v71[3] = &unk_264874270;
      id v72 = v6;
      id v73 = v7;
      [(FBKBugFormTableViewController *)self presentViewController:v28 animated:1 completion:v71];

      goto LABEL_50;
    }
    v40 = [(FBKBugFormTableViewController *)self draftingController];
    double v17 = [v40 questionChoiceForSectionIdentifier:v12 itemIdentifier:v9];
    if (v17)
    {
      BOOL useInlineChoices = self->_useInlineChoices;

      if (useInlineChoices)
      {
        v42 = [v6 cellForRowAtIndexPath:v7];
        v43 = [(FBKBugFormTableViewController *)self draftingController];
        uint64_t v44 = [v43 questionForVisibleChoice:v17 sectionIdentifier:v12];

        if (!v44)
        {
          v46 = +[FBKLog appHandle];
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            -[FBKBugFormTableViewController tableView:cellForRowAtIndexPath:withItemIdentifier:]();
          }
          goto LABEL_58;
        }
        v70 = v42;
        uint64_t v45 = [(FBKBugFormTableViewController *)self formResponse];
        v46 = [v45 answerForQuestion:v44];

        uint64_t v47 = [v44 answerType];
        if (v47 == 4)
        {
          CFURLRef v55 = [v46 values];
          CFURLRef v56 = [v17 value];
          int v69 = [v55 containsObject:v56];

          int v57 = v69;
          uint64_t v58 = [v46 values];
          objc_super v67 = v58;
          if (v69)
          {
            id v59 = (void *)MEMORY[0x263F08A98];
            uint64_t v66 = [v17 value];
            uint64_t v60 = [v59 predicateWithFormat:@"SELF != %@", v66];
            uint64_t v61 = v58;
            uint64_t v62 = (void *)v60;
            v63 = [v61 filteredArrayUsingPredicate:v60];
            [v46 setValues:v63];

            int v57 = v69;
          }
          else
          {
            uint64_t v66 = [v17 value];
            uint64_t v62 = objc_msgSend(v58, "arrayByAddingObject:");
            [v46 setValues:v62];
          }

          v42 = v70;
          [v70 showCheckmark:v57 ^ 1u];
        }
        else
        {
          if (v47 != 3
            || ([v46 values],
                v48 = objc_claimAutoreleasedReturnValue(),
                [v17 value],
                v49 = objc_claimAutoreleasedReturnValue(),
                char v68 = [v48 containsObject:v49],
                v49,
                v48,
                (v68 & 1) != 0))
          {
            v42 = v70;
LABEL_58:

            goto LABEL_52;
          }
          v42 = v70;
          [v70 showCheckmark:1];
          id v65 = [v17 value];
          [v46 setValue:v65];
        }
        [(FBKBugFormTableViewController *)self answerDidChangeForQuestion:v44];
        goto LABEL_58;
      }
    }
    else
    {
    }
    v50 = [(FBKBugFormTableViewController *)self draftingController];
    uint64_t v20 = [v50 visibleQuestionForSectionIdentifier:v12 itemIdentifier:v9];

    v28 = [v6 cellForRowAtIndexPath:v7];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v20 canDisplayChoicesInline] & 1) == 0)
    {
      v53 = Log_7();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v75 = v9;
        _os_log_impl(&dword_22A36D000, v53, OS_LOG_TYPE_DEFAULT, "Tapped on Q&A with identifier [%@]", buf, 0xCu);
      }

      id v51 = v28;
      if (([v51 hasKeyboardFocus] & 1) == 0)
      {
        v54 = [(FBKBugFormTableViewController *)self tableView];
        [v54 endEditing:1];
      }
    }
    else
    {
      id v51 = 0;
    }
    v52 = [v6 cellForRowAtIndexPath:v7];

    switch([v20 answerType])
    {
      case 0:
      case 1:
        [v52 beginEditingQuestion];
        goto LABEL_47;
      case 2:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_45;
        }
        break;
      case 3:
      case 4:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 && !self->_useInlineChoices) {
LABEL_45:
          }
            [(FBKBugFormTableViewController *)self performSegueWithIdentifier:@"FBKBugFormDetailPresentation" sender:v52];
        }
        break;
      case 6:
        v64 = [(FBKBugFormTableViewController *)self tableView];
        [v64 endEditing:1];
        goto LABEL_48;
      case 11:
        [(FBKBugFormTableViewController *)self launchModalViewWithModalQuestion:v20];
LABEL_47:
        v64 = [(FBKBugFormTableViewController *)self tableView];
        [v64 deselectRowAtIndexPath:v7 animated:1];
LABEL_48:

        break;
      default:
        break;
    }

LABEL_50:
LABEL_51:

    goto LABEL_52;
  }
  if (!self->_disableAccountSwitching)
  {
    id v14 = [(FBKBugFormTableViewController *)self delegate];
    double v15 = +[FBKData sharedInstance];
    double v16 = [v15 currentUser];
    [v14 controller:self didClickSwitchAccountsWithCurrentUser:v16];

    double v17 = [(FBKBugFormTableViewController *)self tableView];
    [v17 deselectRowAtIndexPath:v7 animated:1];
LABEL_52:
  }
}

uint64_t __67__FBKBugFormTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deselectRowAtIndexPath:*(void *)(a1 + 40) animated:1];
}

- (BOOL)_tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(FBKBugFormTableViewController *)self diffableDataSource];
  id v7 = [v6 itemIdentifierForIndexPath:v5];

  id v8 = [(FBKBugFormTableViewController *)self diffableDataSource];
  double v9 = [v8 snapshot];
  double v10 = [v9 sectionIdentifierForSectionContainingItemIdentifier:v7];

  if ([v10 hasPrefix:@"DeviceAttachmentsSectionType"])
  {
    double v11 = [(FBKBugFormTableViewController *)self devicesController];
    double v12 = [v11 maybeAttachmentWithIdentifier:v7];

    id v13 = [(FBKBugFormTableViewController *)self devicesController];
    id v14 = v13;
    if (v12)
    {
      if ([v13 canCancelAttachmentCollection:v12])
      {
        char v15 = 1;
LABEL_11:

        goto LABEL_12;
      }
      double v17 = [(FBKBugFormTableViewController *)self devicesController];
      char v15 = [v17 canDeleteAttachment:v12];
    }
    else
    {
      uint64_t v16 = [v13 maybeDeviceWithIdentifier:v7];

      if (!v16)
      {
        char v15 = 0;
        id v14 = 0;
        goto LABEL_11;
      }
      double v17 = [(FBKBugFormTableViewController *)self devicesController];
      char v15 = [v17 canRemoveDevice:v16];
      id v14 = (void *)v16;
    }

    goto LABEL_11;
  }
  char v15 = 0;
LABEL_12:

  return v15;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(FBKBugFormTableViewController *)self diffableDataSource];
  id v7 = [v6 itemIdentifierForIndexPath:v5];

  id v8 = [(FBKBugFormTableViewController *)self diffableDataSource];
  double v9 = [v8 snapshot];
  double v10 = [v9 sectionIdentifierForSectionContainingItemIdentifier:v7];

  if ([v10 hasPrefix:@"DeviceAttachmentsSectionType"])
  {
    double v11 = [(FBKBugFormTableViewController *)self devicesController];
    double v12 = [v11 maybeAttachmentWithIdentifier:v7];

    id v13 = [(FBKBugFormTableViewController *)self devicesController];
    id v14 = v13;
    if (v12)
    {
      char v15 = [v13 trailingSwipeActionConfigurationWithAttachment:v12 fromViewController:self];
    }
    else
    {
      uint64_t v16 = [v13 maybeDeviceWithIdentifier:v7];

      if (v16)
      {
        double v17 = [(FBKBugFormTableViewController *)self devicesController];
        char v15 = [v17 trailingSwipeActionConfigurationWithDevice:v16 fromViewController:self];
      }
      else
      {
        char v15 = 0;
      }
      id v14 = (void *)v16;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (void)answerDidChangeForQuestion:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(FBKBugFormTableViewController *)self formResponse];
  id v6 = [v5 answerForQuestion:v4];

  int v7 = [v4 shouldHaveChoices];
  id v8 = Log_7();
  double v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = [v4 role];
      double v11 = [v6 values];
      double v12 = [v11 componentsJoinedByString:@","];
      int v17 = 138412546;
      double v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_impl(&dword_22A36D000, v9, OS_LOG_TYPE_DEFAULT, "Q: [%@] A: [%@]", (uint8_t *)&v17, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    [(FBKBugFormTableViewController *)v4 answerDidChangeForQuestion:v9];
  }

  [(FBKBugFormTableViewController *)self updateUI:0];
  id v13 = [(FBKBugFormTableViewController *)self draftingController];
  [v13 validate:0];

  id v14 = [(FBKBugFormTableViewController *)self draftingController];
  [v14 didChangeAnswerToQuestion:v4];

  char v15 = [(FBKBugFormTableViewController *)self draftingController];
  BOOL v16 = ([v15 isDirty] & 1) != 0
     || [(FBKBugFormTableViewController *)self isCaptiveModeEnabled];
  [(FBKBugFormTableViewController *)self setModalInPresentation:v16];

  [(FBKBugFormTableViewController *)self updateSubmitButtonState];
  if ([(FBKBugFormTableViewController *)self isSubmissionPendingOnEnhancedLogging])
  {
    [(FBKBugFormTableViewController *)self checkEnhancedLoggingAndSubmit];
  }
}

- (void)editorDidDismissForQuestion:(id)a3
{
  id v4 = a3;
  id v5 = [(FBKBugFormTableViewController *)self draftingController];
  objc_msgSend(v5, "identifierForVisibleQuestion:hasAttemptedSubmission:", v4, -[FBKBugFormTableViewController attemptedSubmission](self, "attemptedSubmission"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [(FBKBugFormTableViewController *)self diffableDataSource];
  int v7 = [v6 indexPathForItemIdentifier:v9];

  id v8 = [(FBKBugFormTableViewController *)self tableView];
  [v8 deselectRowAtIndexPath:v7 animated:1];
}

- (void)deviceDiagnosticsController:(id)a3 didFailToAttach:(id)a4 toDevice:(id)a5 error:(id)a6
{
}

- (void)deviceDiagnosticsController:(id)a3 needsSelectionFromDevices:(id)a4 completion:(id)a5
{
}

- (void)deviceDiagnosticsController:(id)a3 didFailToConnectToDevice:(id)a4
{
}

- (void)deviceDiagnosticsController:(id)a3 didAddDevices:(id)a4
{
}

- (void)deviceDiagnosticsController:(id)a3 didAddDevice:(id)a4
{
}

- (void)deviceDiagnosticsController:(id)a3 didRemoveDevice:(id)a4
{
}

- (void)deviceDiagnosticsController:(id)a3 didUpdateDevice:(id)a4
{
}

- (void)deviceDiagnosticsController:(id)a3 didAddAttachment:(id)a4 toDevice:(id)a5
{
}

- (void)deviceDiagnosticsController:(id)a3 didRemoveAttachment:(id)a4 fromDevice:(id)a5
{
}

- (void)deviceDiagnosticsController:(id)a3 didUpdateAttachment:(id)a4 onDevice:(id)a5
{
  id v10 = a4;
  [(FBKBugFormTableViewController *)self updateUI:0];
  if ([v10 state] == 2)
  {
    uint64_t v6 = [v10 originalLocalFileURL];
    if (v6)
    {
      int v7 = (void *)v6;
      int v8 = [v10 fileComesFromFBK];

      if (v8)
      {
        id v9 = [(FBKBugFormTableViewController *)self delegate];
        [v9 controller:self didAttachLocalFile:v10];
      }
    }
  }
}

- (void)deviceDiagnosticsController:(id)a3 didChangeState:(int64_t)a4
{
  id v6 = a3;
  int v7 = v6;
  switch(a4)
  {
    case 0:
      int v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v9 = [v8 localizedStringForKey:@"STARTING_BUG_SESSIONS" value:&stru_26DDF6A30 table:@"CommonStrings"];
      [(FBKBugFormTableViewController *)self _showSpinnerWithStatus:v9 userInteractionEnabled:1];

      goto LABEL_11;
    case 1:
      goto LABEL_6;
    case 2:
      id v10 = Log_7();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_INFO, "Device Diagnostics matched no device", buf, 2u);
      }

LABEL_6:
      [(FBKBugFormTableViewController *)self _stopSpinner];
      break;
    case 3:
      uint64_t v11 = [v6 filesBeingAttachedCount];
      if (v11 < 1)
      {
        id v14 = [MEMORY[0x263F086E0] FeedbackCore];
        [v14 localizedStringForKey:@"COPYING_FILES" value:@"Attaching files" table:0];
      }
      else
      {
        uint64_t v12 = v11;
        id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v14 = [v13 localizedStringForKey:@"Attaching %d files" value:&stru_26DDF6A30 table:@"Plurals"];

        objc_msgSend(NSString, "stringWithFormat:", v14, v12);
      int v8 = };

      [(FBKBugFormTableViewController *)self _showSpinnerWithStatus:v8 userInteractionEnabled:1];
LABEL_11:

      break;
    default:
      break;
  }
  [(FBKBugFormTableViewController *)self updateSubmitButtonState];
}

- (BOOL)shouldDisplayChangeButton
{
  uint64_t v3 = [(FBKBugFormTableViewController *)self bugForm];
  uint64_t v4 = [v3 role];

  BOOL result = 0;
  if (v4 != 1)
  {
    uint64_t v5 = [(FBKBugFormTableViewController *)self formResponse];
    if (v5)
    {
      id v6 = (void *)v5;
      BOOL v7 = [(FBKBugFormTableViewController *)self hasCandidateStubs];

      if (v7) {
        return 1;
      }
    }
  }
  return result;
}

- (void)didPressChangeBugForm:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(FBKBugFormTableViewController *)self view];
  [v4 endEditing:1];

  if ([(FBKBugFormTableViewController *)self shouldDisplayChangeButton]) {
    [(FBKBugFormTableViewController *)self _showFormPickerWithSender:v5];
  }
}

- (void)_changeToBugFormStub:(id)a3 force:(BOOL)a4
{
  id v9 = a3;
  id v5 = [(FBKBugFormTableViewController *)self currentTeam];
  id v6 = [v5 teamFormStubMatchingFromFormStub:v9];

  if (!v6) {
    id v6 = v9;
  }
  BOOL v7 = [(FBKBugFormTableViewController *)self currentTeam];
  int v8 = [v6 preferredTeamForStubPreferringTeam:v7];
  [(FBKBugFormTableViewController *)self _changeToBugFormStub:v6 withTeam:v8 force:1];
}

- (void)_reallyChangeToBugFormStub:(id)a3 withTeam:(id)a4 force:(BOOL)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  [(FBKBugFormTableViewController *)self setPendingStub:0];
  if (a5) {
    goto LABEL_3;
  }
  id v10 = [(FBKBugFormTableViewController *)self bugForm];
  uint64_t v11 = [v10 ID];
  uint64_t v12 = [v8 ID];
  char v13 = [v11 isEqual:v12];

  if ((v13 & 1) == 0)
  {
LABEL_3:
    id v14 = [(FBKBugFormTableViewController *)self formResponse];
    char v15 = [v14 ID];
    int v16 = [v15 intValue];

    [(FBKBugFormTableViewController *)self hideQuestions];
    int v17 = Log_7();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      double v18 = [(FBKBugFormTableViewController *)self bugForm];
      __int16 v19 = [v18 ID];
      int v20 = [v19 intValue];
      uint64_t v21 = [v8 ID];
      *(_DWORD *)buf = 67109376;
      int v51 = v20;
      __int16 v52 = 1024;
      int v53 = [v21 intValue];
      _os_log_impl(&dword_22A36D000, v17, OS_LOG_TYPE_INFO, "Form Swap: changing from form [%i] to form [%i]", buf, 0xEu);
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke;
    aBlock[3] = &unk_264877290;
    aBlock[4] = self;
    int v49 = v16;
    id v47 = v8;
    id v48 = v9;
    v22 = _Block_copy(aBlock);
    v23 = [(FBKBugFormTableViewController *)self draftingController];
    int v24 = [v23 isDirty];

    if (v24)
    {
      unint64_t v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v40 = [v25 localizedStringForKey:@"PROMPT_DELETE_DRAFT" value:&stru_26DDF6A30 table:0];

      uint64_t v26 = [MEMORY[0x263F82418] fbaAlertControllerWithTitle:v40 message:0 preferredStyle:1];
      uint64_t v27 = (void *)MEMORY[0x263F82400];
      [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v28 = id v41 = v9;
      v29 = [v28 localizedStringForKey:@"DELETE_DRAFT_CHOICE" value:&stru_26DDF6A30 table:0];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_188;
      v44[3] = &unk_2648772B8;
      v44[4] = self;
      id v30 = v22;
      id v45 = v30;
      double v31 = [v27 actionWithTitle:v29 style:2 handler:v44];

      [v26 addAction:v31];
      double v32 = (void *)MEMORY[0x263F82400];
      double v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v34 = [v33 localizedStringForKey:@"SAVE_DRAFT_CHOICE" value:&stru_26DDF6A30 table:0];
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_192;
      v42[3] = &unk_2648772B8;
      v42[4] = self;
      id v43 = v30;
      double v35 = [v32 actionWithTitle:v34 style:0 handler:v42];

      id v9 = v41;
      [v26 addAction:v35];
      [(FBKBugFormTableViewController *)self presentViewController:v26 animated:1 completion:0];
    }
    else
    {
      double v36 = Log_7();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        double v37 = [(FBKBugFormTableViewController *)self formResponse];
        id v38 = [v37 ID];
        int v39 = [v38 intValue];
        *(_DWORD *)buf = 67109120;
        int v51 = v39;
        _os_log_impl(&dword_22A36D000, v36, OS_LOG_TYPE_INFO, "_changeToBugForm, deleting the unused FR %d", buf, 8u);
      }
      (*((void (**)(void *, uint64_t))v22 + 2))(v22, 1);
    }
  }
}

void __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke(uint64_t a1, int a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v4 = [*(id *)(a1 + 32) navigationItem];
  id v5 = [v4 rightBarButtonItem];
  [v5 setEnabled:0];

  id v6 = [*(id *)(a1 + 32) navigationItem];
  BOOL v7 = [v6 leftBarButtonItem];
  [v7 setEnabled:0];

  id v8 = [*(id *)(a1 + 32) devicesController];
  [v8 removeAllAttachments];

  id v9 = [*(id *)(a1 + 32) formResponse];
  id v10 = [v9 ID];
  uint64_t v11 = [v10 intValue];

  if (!a2)
  {
    unint64_t v25 = *(void **)(a1 + 32);
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_180;
    v36[3] = &unk_264877268;
    int v39 = v11;
    v36[4] = v25;
    id v37 = *(id *)(a1 + 40);
    id v38 = *(id *)(a1 + 48);
    [v25 saveDraftWithIsClosing:1 completion:v36];

    int v24 = v37;
    goto LABEL_10;
  }
  uint64_t v12 = +[FBKLog ded];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = *(_DWORD *)(a1 + 56);
    *(_DWORD *)buf = 67109120;
    int v45 = v13;
    _os_log_impl(&dword_22A36D000, v12, OS_LOG_TYPE_INFO, "will delete all bug sessions for form [%i]", buf, 8u);
  }

  id v14 = [*(id *)(a1 + 32) devicesController];
  [v14 abortAllSessions];

  LODWORD(v14) = [*(id *)(a1 + 32) showsDraftDeletionMessage];
  char v15 = *(void **)(a1 + 32);
  int v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v17 = v16;
  if (v14) {
    double v18 = @"DELETING_DRAFT";
  }
  else {
    double v18 = @"CLOSING_FEEDBACK_EDITOR";
  }
  __int16 v19 = [v16 localizedStringForKey:v18 value:&stru_26DDF6A30 table:@"CommonStrings"];
  [v15 showSpinnerWithStatus:v19];

  int v20 = [*(id *)(a1 + 32) itemFromDraft];

  if (v20)
  {
    uint64_t v21 = +[FBKData sharedInstance];
    v22 = [*(id *)(a1 + 32) itemFromDraft];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_179;
    v40[3] = &unk_264877268;
    int v43 = v11;
    v23 = *(void **)(a1 + 40);
    v40[4] = *(void *)(a1 + 32);
    id v41 = v23;
    id v42 = *(id *)(a1 + 48);
    [v21 deleteDraftFromContentItem:v22 completion:v40];

    int v24 = v41;
LABEL_10:

    return;
  }
  uint64_t v26 = Log_7();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_cold_1(v11, v26, v27, v28, v29, v30, v31, v32);
  }

  double v34 = *(void **)(a1 + 32);
  double v33 = *(void **)(a1 + 40);
  double v35 = [v33 preferredTeamForStubPreferringTeam:0];
  [v34 loadNewResponseForBugFormStub:v33 forTeam:v35];
}

void __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_179(void *a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = Log_7();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_179_cold_1((uint64_t)a1, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  id v10 = (void *)a1[4];
  uint64_t v11 = (void *)a1[5];
  uint64_t v12 = [v11 preferredTeamForStubPreferringTeam:a1[6]];
  [v10 loadNewResponseForBugFormStub:v11 forTeam:v12];
}

void __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_180(void *a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = Log_7();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_180_cold_1((uint64_t)a1, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  id v10 = (void *)a1[4];
  uint64_t v11 = (void *)a1[5];
  uint64_t v12 = [v11 preferredTeamForStubPreferringTeam:a1[6]];
  [v10 loadNewResponseForBugFormStub:v11 forTeam:v12];
}

uint64_t __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_188(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = Log_7();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) formResponse];
    uint64_t v4 = [v3 ID];
    v6[0] = 67109120;
    v6[1] = [v4 intValue];
    _os_log_impl(&dword_22A36D000, v2, OS_LOG_TYPE_INFO, "_changeToBugForm, deleting FR %d", (uint8_t *)v6, 8u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_192(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = Log_7();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) formResponse];
    uint64_t v4 = [v3 ID];
    v6[0] = 67109120;
    v6[1] = [v4 intValue];
    _os_log_impl(&dword_22A36D000, v2, OS_LOG_TYPE_INFO, "_changeToBugForm, saving FR %d", (uint8_t *)v6, 8u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_showFormPickerWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = Log_7();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v13 = 0;
    _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_DEFAULT, "Showing Form Picker from draft view", v13, 2u);
  }

  uint64_t v6 = [_TtC12FeedbackCore26FBKBugFormPickerController alloc];
  uint64_t v7 = [(FBKBugFormTableViewController *)self candidateFormStubsPredicate];
  uint64_t v8 = [(FBKBugFormPickerController *)v6 initWithStubsPredicate:v7];

  [(FBKBugFormPickerController *)v8 setPickerDelegate:self];
  uint64_t v9 = [(FBKBugFormTableViewController *)self formStub];
  [(FBKBugFormPickerController *)v8 setCurrentSelection:v9];

  [(FBKBugFormPickerController *)v8 setContext:1];
  id v10 = [(FBKBugFormTableViewController *)self currentTeam];
  [(FBKBugFormPickerController *)v8 setTeam:v10];

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v8];
  [v11 setModalPresentationStyle:7];
  uint64_t v12 = [v11 popoverPresentationController];
  [v12 setPermittedArrowDirections:1];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 setBarButtonItem:v4];
    }
    else
    {
      [v12 setSourceView:v4];
      [v4 bounds];
      objc_msgSend(v12, "setSourceRect:");
    }
  }
  [(FBKBugFormTableViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)bugFormPicker:(id)a3 didSelectBugFormStub:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(FBKBugFormTableViewController *)self presentedViewController];
  uint64_t v9 = [v6 navigationController];

  if (v8 == v9)
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __68__FBKBugFormTableViewController_bugFormPicker_didSelectBugFormStub___block_invoke;
    v10[3] = &unk_2648765E0;
    objc_copyWeak(&v12, &location);
    id v11 = v7;
    [(FBKBugFormTableViewController *)self dismissViewControllerAnimated:1 completion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __68__FBKBugFormTableViewController_bugFormPicker_didSelectBugFormStub___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _changeToBugFormStub:*(void *)(a1 + 32) force:1];
}

- (void)bugFormPickerDidCancel:(id)a3
{
  id v4 = Log_7();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[FBKBugFormTableViewController bugFormPickerDidCancel:](v4);
  }

  uint64_t v5 = [(FBKBugFormTableViewController *)self tableView];
  id v6 = [(FBKBugFormTableViewController *)self tableView];
  id v7 = [v6 indexPathForSelectedRow];
  [v5 deselectRowAtIndexPath:v7 animated:1];
}

- (void)teamPicker:(id)a3 didSelectTeam:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__FBKBugFormTableViewController_teamPicker_didSelectTeam___block_invoke;
  v9[3] = &unk_2648765E0;
  objc_copyWeak(&v11, &location);
  id v8 = v7;
  id v10 = v8;
  [(FBKBugFormTableViewController *)self dismissViewControllerAnimated:1 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __58__FBKBugFormTableViewController_teamPicker_didSelectTeam___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v4 = (id *)(a1 + 32);
    id v6 = objc_loadWeakRetained(v2);
    id v7 = [v6 currentTeam];
    int v8 = [v5 isEqual:v7];

    if (v8)
    {
      uint64_t v9 = Log_7();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v16 = 0;
        _os_log_impl(&dword_22A36D000, v9, OS_LOG_TYPE_INFO, "Selected the current team, not switching.", v16, 2u);
      }
    }
    else
    {
      id v10 = *v4;
      id v11 = objc_loadWeakRetained(v2);
      id v12 = [v11 formStub];
      uint64_t v9 = [v10 teamFormStubMatchingFromFormStub:v12];

      if (!v9)
      {
        int v13 = Log_7();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          __58__FBKBugFormTableViewController_teamPicker_didSelectTeam___block_invoke_cold_1(v2, v4, v13);
        }

        id v14 = objc_loadWeakRetained(v2);
        uint64_t v9 = [v14 formStub];
      }
      id v15 = objc_loadWeakRetained(v2);
      [v15 _changeToBugFormStub:v9 withTeam:*v4 force:1];
    }
  }
}

- (void)didTapLargeSubmitButton:(id)a3
{
  id v6 = a3;
  id v4 = [(FBKBugFormTableViewController *)self textViewFirstResponder];

  if (v4)
  {
    uint64_t v5 = [(FBKBugFormTableViewController *)self textViewFirstResponder];
    [v5 resignFirstResponder];
  }
  [(FBKBugFormTableViewController *)self beginPresubmissionCheck:v6];
}

- (void)beginPresubmissionCheck:(id)a3
{
  [(FBKBugFormTableViewController *)self setAttemptedSubmission:1];
  id v4 = [(FBKBugFormTableViewController *)self draftingController];
  char v5 = [v4 validate:0];

  [(FBKBugFormTableViewController *)self updateUI:0];
  id v6 = [(FBKBugFormTableViewController *)self submitButton];
  [v6 setEnabled:0];

  id v7 = [(FBKBugFormTableViewController *)self submitButtonLarge];
  [v7 enableButton:0];

  int v8 = [(FBKBugFormTableViewController *)self navigationItem];
  uint64_t v9 = [v8 leftBarButtonItem];
  [v9 setEnabled:0];

  id v10 = [(FBKBugFormTableViewController *)self devicesController];
  id v11 = [v10 unreachableDevicesInPlay];

  if ((v5 & 1) == 0)
  {
    [(FBKBugFormTableViewController *)self updateSubmitButtonState];
    v23 = (void *)MEMORY[0x263F82418];
    int v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    unint64_t v25 = [v24 localizedStringForKey:@"MISSING_ANSWERS_TITLE" value:&stru_26DDF6A30 table:0];
    uint64_t v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v27 = [v26 localizedStringForKey:@"MISSING_ANSWERS_MESSAGE" value:&stru_26DDF6A30 table:0];
    id v22 = [v23 fbaAlertControllerWithTitle:v25 message:v27 preferredStyle:1];

    uint64_t v28 = (void *)MEMORY[0x263F82400];
    uint64_t v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v30 = [v29 localizedStringForKey:@"OK" value:&stru_26DDF6A30 table:0];
    uint64_t v31 = v28;
    uint64_t v32 = v30;
    double v33 = 0;
LABEL_7:
    double v34 = objc_msgSend(v31, "actionWithTitle:style:handler:", v32, 1, v33, v52, v53, v54, v55, v56);
    [v22 addAction:v34];

    [(FBKBugFormTableViewController *)self askDelegateToGoFullScreenIfNeeded];
    [(FBKBugFormTableViewController *)self presentViewController:v22 animated:1 completion:0];
    goto LABEL_8;
  }
  id v12 = [(FBKBugFormTableViewController *)self bugForm];
  if (![v12 collectsFiles] || !objc_msgSend(v11, "count"))
  {

LABEL_10:
    double v35 = [(FBKBugFormTableViewController *)self bugForm];
    if ([v35 collectsFiles])
    {
      double v36 = [(FBKBugFormTableViewController *)self devicesController];
      int v37 = [v36 hasUnmetRequirementAttachments];

      if (v37)
      {
        id v38 = (void *)MEMORY[0x263F82418];
        int v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v40 = [v39 localizedStringForKey:@"MISSING_REQ_FILES" value:&stru_26DDF6A30 table:0];
        id v41 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v42 = [v41 localizedStringForKey:@"MISSING_REQ_FILES_MESSAGE" value:&stru_26DDF6A30 table:0];
        id v22 = [v38 fbaAlertControllerWithTitle:v40 message:v42 preferredStyle:1];

        int v43 = (void *)MEMORY[0x263F82400];
        uint64_t v44 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        int v45 = [v44 localizedStringForKey:@"GATHER_AND_SUBMIT" value:&stru_26DDF6A30 table:0];
        v58[0] = MEMORY[0x263EF8330];
        v58[1] = 3221225472;
        v58[2] = __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_224;
        v58[3] = &unk_264877308;
        v58[4] = self;
        uint64_t v46 = [v43 actionWithTitle:v45 style:0 handler:v58];
        [v22 addAction:v46];

        id v47 = (void *)MEMORY[0x263F82400];
        id v48 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        int v49 = [v48 localizedStringForKey:@"SUBMIT_WO_FILES" value:&stru_26DDF6A30 table:0];
        v57[0] = MEMORY[0x263EF8330];
        v57[1] = 3221225472;
        v57[2] = __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_3;
        v57[3] = &unk_264877308;
        v57[4] = self;
        v50 = [v47 actionWithTitle:v49 style:0 handler:v57];
        [v22 addAction:v50];

        int v51 = (void *)MEMORY[0x263F82400];
        uint64_t v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v30 = [v29 localizedStringForKey:@"BACK_TO_DRAFT" value:&stru_26DDF6A30 table:0];
        uint64_t v52 = MEMORY[0x263EF8330];
        uint64_t v53 = 3221225472;
        uint64_t v54 = __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_228;
        CFURLRef v55 = &unk_264877308;
        CFURLRef v56 = self;
        double v33 = &v52;
        uint64_t v31 = v51;
        uint64_t v32 = v30;
        goto LABEL_7;
      }
    }
    else
    {
    }
    [(FBKBugFormTableViewController *)self checkLegalAndSubmit];
    goto LABEL_15;
  }
  int v13 = [(FBKBugFormTableViewController *)self formResponse];
  id v14 = [v13 matcherPredicates];
  uint64_t v15 = [v14 count];

  if (!v15) {
    goto LABEL_10;
  }
  int v16 = NSString;
  int v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v18 = [v17 localizedStringForKey:@"NOT_REACHABLE_SUBMIT_MESSAGE_NO_DEVICE_NAME" value:&stru_26DDF6A30 table:0];
  __int16 v19 = [v16 stringWithFormat:v18];

  os_activity_t v20 = _os_activity_create(&dword_22A36D000, "Submission on non reachable device", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke;
  block[3] = &unk_2648751D8;
  id v60 = v11;
  uint64_t v61 = self;
  id v62 = v19;
  os_activity_t v63 = v20;
  uint64_t v21 = v20;
  id v22 = v19;
  os_activity_apply(v21, block);

LABEL_8:
LABEL_15:
}

void __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v2)
  {
    uint64_t v4 = *(void *)v41;
    *(void *)&long long v3 = 138543618;
    long long v29 = v3;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v41 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v40 + 1) + 8 * v5);
        id v7 = +[FBKLog ded];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = [v6 publicLogDescription];
          uint64_t v9 = [*(id *)(a1 + 40) formResponse];
          id v10 = [v9 ID];
          int v11 = [v10 intValue];
          *(_DWORD *)buf = v29;
          int v45 = v8;
          __int16 v46 = 1024;
          int v47 = v11;
          _os_log_impl(&dword_22A36D000, v7, OS_LOG_TYPE_DEFAULT, "tried to submit on non reachable device [%{public}@] FR [%i]", buf, 0x12u);
        }
        ++v5;
      }
      while (v2 != v5);
      uint64_t v2 = [v1 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v2);
  }

  id v12 = (void *)MEMORY[0x263F82418];
  int v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"MISSING_REQ_FILES" value:&stru_26DDF6A30 table:0];
  uint64_t v15 = [v12 fbaAlertControllerWithTitle:v14 message:*(void *)(a1 + 48) preferredStyle:1];

  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  int v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v17 = [v16 localizedStringForKey:@"CANCEL" value:&stru_26DDF6A30 table:0];

  double v18 = (void *)MEMORY[0x263F82400];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_209;
  v37[3] = &unk_2648772E0;
  id v38 = *(id *)(a1 + 56);
  objc_copyWeak(&v39, (id *)buf);
  __int16 v19 = [v18 actionWithTitle:v17 style:1 handler:v37];
  [v15 addAction:v19];

  os_activity_t v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v21 = [v20 localizedStringForKey:@"SAVE_DRAFT" value:&stru_26DDF6A30 table:0];

  id v22 = (void *)MEMORY[0x263F82400];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_213;
  v34[3] = &unk_2648772E0;
  id v35 = *(id *)(a1 + 56);
  objc_copyWeak(&v36, (id *)buf);
  v23 = [v22 actionWithTitle:v21 style:0 handler:v34];
  [v15 addAction:v23];

  int v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  unint64_t v25 = [v24 localizedStringForKey:@"SUBMIT_WO_FILES" value:&stru_26DDF6A30 table:0];

  uint64_t v26 = (void *)MEMORY[0x263F82400];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_217;
  v31[3] = &unk_2648772E0;
  id v32 = *(id *)(a1 + 56);
  objc_copyWeak(&v33, (id *)buf);
  uint64_t v27 = [v26 actionWithTitle:v25 style:0 handler:v31];
  [v15 addAction:v27];

  [*(id *)(a1 + 40) askDelegateToGoFullScreenIfNeeded];
  id WeakRetained = objc_loadWeakRetained((id *)buf);
  [WeakRetained presentViewController:v15 animated:1 completion:0];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&v39);
  objc_destroyWeak((id *)buf);
}

void __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_209(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v10);
  uint64_t v4 = +[FBKLog ded];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = [WeakRetained formResponse];
    id v7 = [v6 ID];
    int v8 = [v7 intValue];
    *(_DWORD *)buf = 67109120;
    int v12 = v8;
    _os_log_impl(&dword_22A36D000, v4, OS_LOG_TYPE_DEFAULT, "Tapped [Cancel] for missing devices for FR [%i]", buf, 8u);
  }
  id v9 = objc_loadWeakRetained((id *)(a1 + 40));
  [v9 updateSubmitButtonState];

  os_activity_scope_leave(&v10);
}

void __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_213(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v10);
  uint64_t v4 = +[FBKLog ded];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = [WeakRetained formResponse];
    id v7 = [v6 ID];
    int v8 = [v7 intValue];
    *(_DWORD *)buf = 67109120;
    int v12 = v8;
    _os_log_impl(&dword_22A36D000, v4, OS_LOG_TYPE_DEFAULT, "Tapped [Save] for missing devices for FR [%i]", buf, 8u);
  }
  id v9 = objc_loadWeakRetained((id *)(a1 + 40));
  [v9 closeWithCompletion:0];

  os_activity_scope_leave(&v10);
}

void __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_217(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v18.opaque[0] = 0;
  v18.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v18);
  uint64_t v4 = +[FBKLog ded];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = [WeakRetained formResponse];
    id v7 = [v6 ID];
    int v8 = [v7 intValue];
    *(_DWORD *)buf = 67109120;
    int v20 = v8;
    _os_log_impl(&dword_22A36D000, v4, OS_LOG_TYPE_DEFAULT, "Tapped [Without Files] for FR [%i]", buf, 8u);
  }
  id v9 = (id *)(a1 + 40);
  id v10 = objc_loadWeakRetained(v9);
  int v11 = [v10 formResponse];
  int v12 = [v11 bugForm];
  uint64_t v13 = [v12 questionWithRole:@":required_file_zone"];

  id v14 = objc_loadWeakRetained(v9);
  uint64_t v15 = [v14 formResponse];
  int v16 = [v15 answerForQuestion:v13];

  [v16 setOptedOut:1];
  id v17 = objc_loadWeakRetained(v9);
  [v17 checkLegalAndSubmit];

  os_activity_scope_leave(&v18);
}

void __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_224(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_2;
  block[3] = &unk_264873FE8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) devicesController];
  id v3 = [*(id *)(a1 + 32) formResponse];
  uint64_t v4 = [v3 answersDictionary];
  [v2 gatherAllMissingRequirementsWithAnswers:v4];

  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 checkLegalAndSubmit];
}

void __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = Log_7();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) formResponse];
    uint64_t v4 = [v3 ID];
    v10[0] = 67109120;
    v10[1] = [v4 intValue];
    _os_log_impl(&dword_22A36D000, v2, OS_LOG_TYPE_DEFAULT, "Presubmission: chose to submit without files for FR [%d]", (uint8_t *)v10, 8u);
  }
  uint64_t v5 = [*(id *)(a1 + 32) formResponse];
  id v6 = [v5 bugForm];
  id v7 = [v6 questionWithRole:@":required_file_zone"];

  int v8 = [*(id *)(a1 + 32) formResponse];
  id v9 = [v8 answerForQuestion:v7];

  [v9 setOptedOut:1];
  [*(id *)(a1 + 32) checkLegalAndSubmit];
}

void __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_228(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_2_229;
  block[3] = &unk_264873FE8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __57__FBKBugFormTableViewController_beginPresubmissionCheck___block_invoke_2_229(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F088C8];
  id v3 = [*(id *)(a1 + 32) tableView];
  objc_msgSend(v2, "indexPathForRow:inSection:", 0, objc_msgSend(v3, "numberOfSections") - 1);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v4 = [*(id *)(a1 + 32) tableView];
  [v4 scrollToRowAtIndexPath:v5 atScrollPosition:1 animated:1];

  [*(id *)(a1 + 32) updateSubmitButtonState];
}

- (void)checkLegalAndSubmit
{
  id v3 = [(FBKBugFormTableViewController *)self bugForm];
  if ([v3 collectsFiles])
  {
    uint64_t v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    char v5 = [v4 BOOLForKey:@"FBKSuppressPrivacyNotice"];

    if ((v5 & 1) == 0)
    {
      id v6 = (void *)MEMORY[0x263F82418];
      id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v8 = [v7 localizedStringForKey:@"SUBMISSION_PII_TITLE" value:&stru_26DDF6A30 table:0];
      id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v10 = [v9 localizedStringForKey:@"SUBMISSION_PII_MESSAGE" value:&stru_26DDF6A30 table:0];
      uint64_t v11 = [v6 fbaAlertControllerWithTitle:v8 message:v10 preferredStyle:1];

      int v12 = (void *)MEMORY[0x263F82400];
      uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v14 = [v13 localizedStringForKey:@"GO_BACK" value:&stru_26DDF6A30 table:0];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __52__FBKBugFormTableViewController_checkLegalAndSubmit__block_invoke;
      v21[3] = &unk_264877308;
      v21[4] = self;
      uint64_t v15 = [v12 actionWithTitle:v14 style:0 handler:v21];
      [v11 addAction:v15];

      int v16 = (void *)MEMORY[0x263F82400];
      id v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      os_activity_scope_state_s v18 = [v17 localizedStringForKey:@"SUBMIT_BUTTON" value:&stru_26DDF6A30 table:0];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __52__FBKBugFormTableViewController_checkLegalAndSubmit__block_invoke_2;
      v20[3] = &unk_264877308;
      v20[4] = self;
      __int16 v19 = [v16 actionWithTitle:v18 style:0 handler:v20];
      [v11 addAction:v19];

      [(FBKBugFormTableViewController *)self askDelegateToGoFullScreenIfNeeded];
      [(FBKBugFormTableViewController *)self presentViewController:v11 animated:1 completion:0];

      return;
    }
  }
  else
  {
  }

  [(FBKBugFormTableViewController *)self checkExplicitConfirmationAndSubmit];
}

uint64_t __52__FBKBugFormTableViewController_checkLegalAndSubmit__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[FBKSharedConstants sharedUserDefaults];
  [v2 setBool:0 forKey:@"FBKSuppressPrivacyNotice"];

  id v3 = *(void **)(a1 + 32);

  return [v3 updateSubmitButtonState];
}

uint64_t __52__FBKBugFormTableViewController_checkLegalAndSubmit__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[FBKSharedConstants sharedUserDefaults];
  [v2 setBool:1 forKey:@"FBKSuppressPrivacyNotice"];

  id v3 = *(void **)(a1 + 32);

  return [v3 checkEnhancedLoggingAndSubmit];
}

- (void)checkEnhancedLoggingAndSubmit
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = Log_7();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [(FBKBugFormTableViewController *)self formResponse];
    char v5 = [v4 ID];
    int v12 = 67109120;
    LODWORD(v13) = [v5 intValue];
    _os_log_impl(&dword_22A36D000, v3, OS_LOG_TYPE_INFO, "Checking EL before submission on FR: %d", (uint8_t *)&v12, 8u);
  }
  id v6 = [(FBKBugFormTableViewController *)self draftingController];
  id v7 = [v6 unansweredRequiredModalQuestions];

  if ([v7 count])
  {
    int v8 = [v7 firstObject];
    id v9 = Log_7();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v7 valueForKeyPath:@"tat"];
      uint64_t v11 = [v8 tat];
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      _os_log_impl(&dword_22A36D000, v9, OS_LOG_TYPE_DEFAULT, "Found unanswered modal questions [%{public}@]. Showing [%{public}@]", (uint8_t *)&v12, 0x16u);
    }
    [(FBKBugFormTableViewController *)self setIsSubmissionPendingOnEnhancedLogging:1];
    [(FBKBugFormTableViewController *)self askDelegateToGoFullScreenIfNeeded];
    [(FBKBugFormTableViewController *)self launchModalViewWithModalQuestion:v8];
  }
  else
  {
    [(FBKBugFormTableViewController *)self setIsSubmissionPendingOnEnhancedLogging:0];
    [(FBKBugFormTableViewController *)self submit];
  }
}

- (void)checkExplicitConfirmationAndSubmit
{
  id v3 = [(FBKBugFormTableViewController *)self dynamicAlertTitle];
  uint64_t v4 = [(FBKBugFormTableViewController *)self dynamicAlertBody];
  char v5 = (void *)v4;
  if (v3 && v4)
  {
    id v6 = [MEMORY[0x263F82418] fbaAlertControllerWithTitle:v3 message:v4 preferredStyle:0];
    id v7 = (void *)MEMORY[0x263F82400];
    int v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"SUBMIT_REPORT" value:&stru_26DDF6A30 table:0];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __67__FBKBugFormTableViewController_checkExplicitConfirmationAndSubmit__block_invoke;
    v16[3] = &unk_264877308;
    v16[4] = self;
    id v10 = [v7 actionWithTitle:v9 style:0 handler:v16];
    [v6 addAction:v10];

    uint64_t v11 = (void *)MEMORY[0x263F82400];
    int v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v13 = [v12 localizedStringForKey:@"GO_BACK" value:&stru_26DDF6A30 table:0];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __67__FBKBugFormTableViewController_checkExplicitConfirmationAndSubmit__block_invoke_2;
    v15[3] = &unk_264877308;
    v15[4] = self;
    __int16 v14 = [v11 actionWithTitle:v13 style:1 handler:v15];
    [v6 addAction:v14];

    [(FBKBugFormTableViewController *)self askDelegateToGoFullScreenIfNeeded];
    [(FBKBugFormTableViewController *)self presentViewController:v6 animated:1 completion:0];
  }
  else
  {
    [(FBKBugFormTableViewController *)self checkEnhancedLoggingAndSubmit];
  }
}

uint64_t __67__FBKBugFormTableViewController_checkExplicitConfirmationAndSubmit__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkEnhancedLoggingAndSubmit];
}

uint64_t __67__FBKBugFormTableViewController_checkExplicitConfirmationAndSubmit__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSubmitButtonState];
}

- (void)submit
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = Log_7();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [(FBKBugFormTableViewController *)self formResponse];
    char v5 = [v4 ID];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = [v5 intValue];
    _os_log_impl(&dword_22A36D000, v3, OS_LOG_TYPE_INFO, "Starting submit for FR %d", buf, 8u);
  }
  [(FBKBugFormTableViewController *)self unregisterApplicationNotifications];
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"SUBMITTING_FEEDBACK" value:&stru_26DDF6A30 table:@"CommonStrings"];
  [(FBKBugFormTableViewController *)self showSpinnerWithStatus:v7];

  int v8 = [MEMORY[0x263F82438] sharedApplication];
  id v9 = [(FBKBugFormTableViewController *)self formResponse];
  id v10 = [v9 ID];

  *(void *)buf = 0;
  int v45 = buf;
  uint64_t v46 = 0x2020000000;
  uint64_t v47 = 0;
  uint64_t v11 = [MEMORY[0x263F82438] sharedApplication];
  int v12 = [NSString stringWithFormat:@"%@", v10];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __39__FBKBugFormTableViewController_submit__block_invoke;
  v40[3] = &unk_264876590;
  id v13 = v10;
  id v41 = v13;
  id v14 = v8;
  id v42 = v14;
  long long v43 = buf;
  uint64_t v15 = [v11 beginBackgroundTaskWithName:v12 expirationHandler:v40];

  *((void *)v45 + 3) = v15;
  [(FBKBugFormTableViewController *)self hideAllCells];
  uint64_t v16 = [(FBKBugFormTableViewController *)self tableView];
  [v16 setTableFooterView:0];

  id v17 = [(FBKBugFormTableViewController *)self devicesController];
  os_activity_scope_state_s v18 = [(FBKBugFormTableViewController *)self draftingController];
  [v18 setIsSubmitting:1];

  [(FBKBugFormTableViewController *)self setModalInPresentation:1];
  if (+[FBKSharedConstants usesTemporaryDraftsDirectory])
  {
    __int16 v19 = [v17 currentDeviceAttachmentManager];
    int v20 = [v19 fileCollector];
    [v20 saveDraftsDirectory];
  }
  uint64_t v21 = [(FBKBugFormTableViewController *)self formIdentifier];
  id v22 = [(FBKBugFormTableViewController *)self bugForm];
  BOOL v23 = [v22 role] == 1;

  int v24 = [(FBKBugFormTableViewController *)self bugForm];
  unint64_t v25 = [v24 surveyContentItem];

  unsigned int v26 = [(FBKBugFormTableViewController *)self whooshSoundID];
  uint64_t v27 = +[FBKData sharedInstance];
  uint64_t v28 = [(FBKBugFormTableViewController *)self formResponse];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __39__FBKBugFormTableViewController_submit__block_invoke_257;
  v32[3] = &unk_2648773A8;
  id v29 = v14;
  int v37 = buf;
  id v33 = v29;
  double v34 = self;
  id v30 = v21;
  id v35 = v30;
  BOOL v39 = v23;
  unsigned int v38 = v26;
  id v31 = v25;
  id v36 = v31;
  [v27 beginSubmissionForFormResponse:v28 withCollector:v17 completion:v32];

  _Block_object_dispose(buf, 8);
}

uint64_t __39__FBKBugFormTableViewController_submit__block_invoke(uint64_t a1)
{
  uint64_t v2 = Log_7();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __39__FBKBugFormTableViewController_submit__block_invoke_cold_1(a1, v2);
  }

  uint64_t result = [*(id *)(a1 + 40) endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *MEMORY[0x263F833E0];
  return result;
}

void __39__FBKBugFormTableViewController_submit__block_invoke_257(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(a1 + 32) endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *MEMORY[0x263F833E0];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v5 = [v4 localizedStringForKey:@"GENERIC_SUBMIT_ERROR_TITLE" value:&stru_26DDF6A30 table:0];

    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"GENERIC_SUBMIT_ERROR_MESSAGE" value:&stru_26DDF6A30 table:0];

    int v8 = Log_7();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __39__FBKBugFormTableViewController_submit__block_invoke_257_cold_1(a1, v8);
    }

    id v9 = [MEMORY[0x263F82418] fbaAlertControllerWithTitle:v5 message:v7 preferredStyle:1];
    id v10 = (void *)MEMORY[0x263F82400];
    uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v12 = [v11 localizedStringForKey:@"OK" value:&stru_26DDF6A30 table:0];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __39__FBKBugFormTableViewController_submit__block_invoke_264;
    v43[3] = &unk_264877358;
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v13 = a1 + 40;
    v43[4] = v14;
    id v44 = v3;
    id v45 = *(id *)(v13 + 8);
    char v46 = *(unsigned char *)(v13 + 36);
    uint64_t v15 = [v10 actionWithTitle:v12 style:0 handler:v43];
    [v9 addAction:v15];

    [*(id *)v13 askDelegateToGoFullScreenIfNeeded];
    [*(id *)v13 presentViewController:v9 animated:1 completion:0];
  }
  else
  {
    [*(id *)(a1 + 40) _stopSpinner];
    uint64_t v16 = Log_7();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = [*(id *)(a1 + 40) formResponse];
      os_activity_scope_state_s v18 = [v17 ID];
      *(_DWORD *)buf = 67109120;
      LODWORD(v48) = [v18 intValue];
      _os_log_impl(&dword_22A36D000, v16, OS_LOG_TYPE_INFO, "Submission callback for FR %d: success", buf, 8u);
    }
    SystemSoundID v19 = *(_DWORD *)(a1 + 72);
    if (v19)
    {
      Main = CFRunLoopGetMain();
      AudioServicesAddSystemSoundCompletion(v19, Main, 0, (AudioServicesSystemSoundCompletionProc)didFinishPlayingWhooshSound, 0);
      AudioServicesPlaySystemSound(*(_DWORD *)(a1 + 72));
    }
    [*(id *)(a1 + 40) setIsBeingDismissedBySelf:1];
    uint64_t v21 = [*(id *)(a1 + 40) delegate];
    [v21 controllerWillFinishSubmission:*(void *)(a1 + 40)];

    objc_initWeak(&location, *(id *)(a1 + 40));
    uint64_t v33 = MEMORY[0x263EF8330];
    uint64_t v34 = 3221225472;
    id v35 = __39__FBKBugFormTableViewController_submit__block_invoke_266;
    id v36 = &unk_264877380;
    objc_copyWeak(&v40, &location);
    id v22 = *(id *)(a1 + 48);
    uint64_t v23 = *(void *)(a1 + 40);
    id v37 = v22;
    uint64_t v38 = v23;
    char v41 = *(unsigned char *)(a1 + 76);
    id v39 = *(id *)(a1 + 56);
    int v24 = (void (**)(void))_Block_copy(&v33);
    unint64_t v25 = Log_7();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v26 = objc_msgSend(*(id *)(a1 + 40), "formResponse", v33, v34, v35, v36, v37, v38);
      uint64_t v27 = [v26 contentItem];
      uint64_t v28 = [v27 ID];
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = v28;
      _os_log_impl(&dword_22A36D000, v25, OS_LOG_TYPE_DEFAULT, "Submitted [ FB%{public}@ ]", buf, 0xCu);
    }
    uint64_t v29 = [*(id *)(a1 + 40) submissionStyle];
    if (v29)
    {
      if (v29 == 1)
      {
        id v32 = Log_7();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22A36D000, v32, OS_LOG_TYPE_DEFAULT, "Showing submission alert with options", buf, 2u);
        }

        [*(id *)(a1 + 40) askDelegateToGoFullScreenIfNeeded];
        [*(id *)(a1 + 40) showSubmissionAlertWithCompletion:v24];
      }
      else if (v29 == 2)
      {
        id v30 = Log_7();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22A36D000, v30, OS_LOG_TYPE_DEFAULT, "Submission complete (not showing any confirmation UI)", buf, 2u);
        }

        v24[2](v24);
      }
    }
    else
    {
      id v31 = Log_7();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22A36D000, v31, OS_LOG_TYPE_DEFAULT, "Showing thank you alert view", buf, 2u);
      }

      [*(id *)(a1 + 40) askDelegateToGoFullScreenIfNeeded];
      [*(id *)(a1 + 40) showThankYouAlertWithCompletion:v24];
    }

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }
}

void __39__FBKBugFormTableViewController_submit__block_invoke_264(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__FBKBugFormTableViewController_submit__block_invoke_2;
  v8[3] = &unk_264877330;
  id v9 = *(id *)(a1 + 48);
  char v13 = *(unsigned char *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v6;
  uint64_t v11 = v7;
  objc_copyWeak(&v12, &location);
  [v4 closeWithError:v5 completion:v8];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

void __39__FBKBugFormTableViewController_submit__block_invoke_2(uint64_t a1)
{
  +[FBKTargetedSurvey didFinishSubmissionWithFormIdentifier:*(void *)(a1 + 32) feedbackId:0 isSurvey:*(unsigned __int8 *)(a1 + 64) error:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = +[FBKData sharedInstance];
    id v3 = [*(id *)(a1 + 48) bugForm];
    uint64_t v4 = [v3 surveyContentItem];
    [v2 deleteTargetedSurveyItemFromInboxIfNeeded:v4];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained setIsBeingDismissedBySelf:1];

  id v8 = objc_loadWeakRetained((id *)(a1 + 56));
  id v6 = [v8 delegate];
  id v7 = objc_loadWeakRetained((id *)(a1 + 56));
  [v6 controller:v7 didFinishSubmissionWithError:*(void *)(a1 + 40)];
}

void __39__FBKBugFormTableViewController_submit__block_invoke_266(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained setDevicesController:0];

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) formResponse];
  id v6 = [v5 contentItem];
  id v7 = [v6 ID];
  +[FBKTargetedSurvey didFinishSubmissionWithFormIdentifier:v4 feedbackId:v7 isSurvey:*(unsigned __int8 *)(a1 + 64) error:0];

  if (*(unsigned char *)(a1 + 64))
  {
    id v8 = +[FBKData sharedInstance];
    [v8 deleteTargetedSurveyItemFromInboxIfNeeded:*(void *)(a1 + 48)];
  }
  id v11 = objc_loadWeakRetained(v2);
  id v9 = [v11 delegate];
  id v10 = objc_loadWeakRetained(v2);
  [v9 controller:v10 didFinishSubmissionWithError:0];
}

- (id)formIdentifier
{
  id v3 = [(FBKBugFormTableViewController *)self bugForm];
  uint64_t v4 = [v3 surveyContentItem];

  uint64_t v5 = [v4 formTat];
  id v6 = v5;
  if (!v5 || ![(__CFString *)v5 length])
  {
    id v7 = [(FBKBugFormTableViewController *)self formStub];
    uint64_t v8 = [v7 tat];

    id v6 = (__CFString *)v8;
  }
  id v9 = &stru_26DDF6A30;
  if (v6) {
    id v9 = v6;
  }
  id v10 = v9;

  return v10;
}

- (void)showSubmissionAlertWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F086E0] FeedbackCore];
  id v6 = [v5 localizedStringForKey:@"Feedback Sent" value:@"Feedback Sent" table:0];

  id v7 = [MEMORY[0x263F086E0] FeedbackCore];
  uint64_t v8 = [v7 localizedStringForKey:@"Thank you for sending your feedback to Apple. You can view the status of your report in Feedback Assistant." value:@"Thank you for sending your feedback to Apple. You can view the status of your report in Feedback Assistant." table:0];

  id v9 = [MEMORY[0x263F82418] fbaAlertControllerWithTitle:v6 message:v8 preferredStyle:1];
  id v10 = [(FBKBugFormTableViewController *)self formResponse];
  id v11 = [v10 contentItem];
  id v12 = [v11 ID];
  char v13 = [v12 stringValue];

  uint64_t v14 = +[FBKLaunchAction urlSchemeForFeedbackID:v13];
  if ([(FBKBugFormTableViewController *)self canOpenFeedbackInFBA])
  {
    uint64_t v15 = [MEMORY[0x263F82438] sharedApplication];
    int v16 = [v15 canOpenURL:v14];

    if (v16)
    {
      id v17 = [MEMORY[0x263F086E0] FeedbackCore];
      unsigned int v26 = [v17 localizedStringForKey:@"Open Feedback Assistant" value:@"Open Feedback Assistant" table:0];

      uint64_t v27 = v4;
      os_activity_scope_state_s v18 = (void *)MEMORY[0x263F82400];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __67__FBKBugFormTableViewController_showSubmissionAlertWithCompletion___block_invoke;
      v30[3] = &unk_2648773D0;
      id v19 = v27;
      id v32 = v19;
      id v31 = v14;
      int v20 = [v18 actionWithTitle:v26 style:0 handler:v30];
      [v9 addAction:v20];

      uint64_t v21 = [MEMORY[0x263F086E0] FeedbackCore];
      id v22 = [v21 localizedStringForKey:@"OK" value:@"OK" table:0];

      uint64_t v23 = (void *)MEMORY[0x263F82400];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __67__FBKBugFormTableViewController_showSubmissionAlertWithCompletion___block_invoke_2;
      v28[3] = &unk_2648773F8;
      id v29 = v19;
      int v24 = v23;
      id v4 = v27;
      unint64_t v25 = [v24 actionWithTitle:v22 style:1 handler:v28];
      [v9 addAction:v25];
    }
  }
  [(FBKBugFormTableViewController *)self presentViewController:v9 animated:1 completion:0];
}

void __67__FBKBugFormTableViewController_showSubmissionAlertWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [MEMORY[0x263F82438] sharedApplication];
  [v2 openURL:*(void *)(a1 + 32) withCompletionHandler:0];
}

uint64_t __67__FBKBugFormTableViewController_showSubmissionAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showThankYouAlertWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKBugFormTableViewController *)self devicesController];
  id v6 = (void *)MEMORY[0x263F82418];
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"THANK_YOU" value:&stru_26DDF6A30 table:0];
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"THANK_YOU_MESSAGE" value:&stru_26DDF6A30 table:0];
  id v11 = [v6 fbaAlertControllerWithTitle:v8 message:v10 preferredStyle:1];

  if (v5 && [v5 hasAttachmentsCollecting])
  {
    id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v13 = [v12 localizedStringForKey:@"THANK_YOU_SUBMITTING_MESSAGE" value:&stru_26DDF6A30 table:0];
    [v11 setMessage:v13];
  }
  [(FBKBugFormTableViewController *)self presentViewController:v11 animated:1 completion:0];
  uint64_t v14 = [(FBKBugFormTableViewController *)self formResponse];
  uint64_t v15 = [v14 ID];
  int v16 = [v15 intValue];

  dispatch_time_t v17 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__FBKBugFormTableViewController_showThankYouAlertWithCompletion___block_invoke;
  block[3] = &unk_264877448;
  int v23 = v16;
  id v21 = v11;
  id v22 = v4;
  id v18 = v4;
  id v19 = v11;
  dispatch_after(v17, MEMORY[0x263EF83A0], block);
}

void __65__FBKBugFormTableViewController_showThankYouAlertWithCompletion___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __65__FBKBugFormTableViewController_showThankYouAlertWithCompletion___block_invoke_2;
  v2[3] = &unk_264877420;
  int v4 = *(_DWORD *)(a1 + 48);
  id v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 dismissViewControllerAnimated:1 completion:v2];
}

uint64_t __65__FBKBugFormTableViewController_showThankYouAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = Log_7();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 40);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_22A36D000, v2, OS_LOG_TYPE_DEFAULT, "did dismiss feedback draft editor for form %d", (uint8_t *)v5, 8u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 identifier];
  int v9 = [v8 isEqualToString:@"FBKBugFormDetailPresentation"];

  if (v9)
  {
    id v10 = [v6 destinationViewController];
    id v11 = [v10 topViewController];

    id v12 = [v7 question];
    char v13 = [(FBKBugFormTableViewController *)self formResponse];
    uint64_t v14 = [v13 answerForQuestion:v12];
    [v11 setAnswer:v14];

    [v11 setQuestion:v12];
    [v11 setDelegate:self];
    uint64_t v15 = Log_7();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = [v12 ID];
      v40[0] = 67109120;
      v40[1] = [v16 unsignedIntValue];
      _os_log_impl(&dword_22A36D000, v15, OS_LOG_TYPE_INFO, "will show choices for question [%u]", (uint8_t *)v40, 8u);
    }
    dispatch_time_t v17 = [(FBKBugFormTableViewController *)self traitCollection];
    uint64_t v18 = [v17 horizontalSizeClass];
    id v19 = [v6 destinationViewController];
    int v20 = v19;
    if (v18 == 1) {
      uint64_t v21 = 2;
    }
    else {
      uint64_t v21 = 7;
    }
    [v19 setModalPresentationStyle:v21];

    id v22 = [v6 destinationViewController];
    [v22 setTransitioningDelegate:self];

    int v23 = [v6 destinationViewController];
    int v24 = [v23 popoverPresentationController];

    if (v24)
    {
      id v25 = v7;
      unsigned int v26 = [v6 destinationViewController];
      uint64_t v27 = [v26 popoverPresentationController];
      [v27 setSourceView:v25];

      [v25 bounds];
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;

      id v36 = [v6 destinationViewController];
      id v37 = [v36 popoverPresentationController];
      objc_msgSend(v37, "setSourceRect:", v29, v31, v33, v35);

      uint64_t v38 = [v6 destinationViewController];
      id v39 = [v38 popoverPresentationController];
      [v39 setPermittedArrowDirections:0];
    }
  }
}

- (void)didTapDevice:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[FBKLog ded];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[FBKBugFormTableViewController didTapDevice:indexPath:]((uint64_t)v6, v8);
  }

  int v9 = [(FBKBugFormTableViewController *)self tableView];
  [v9 deselectRowAtIndexPath:v7 animated:1];
}

- (void)didTapAttachment:(id)a3 indexPath:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = Log_7();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v6 displayName];
    *(_DWORD *)buf = 138543362;
    id v25 = v9;
    _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "Tapped on attachment [%{public}@]", buf, 0xCu);
  }
  id v10 = [(FBKBugFormTableViewController *)self view];
  [v10 endEditing:1];

  if ([v6 canStartGathering])
  {
    id v11 = [(FBKBugFormTableViewController *)self devicesController];
    id v12 = [(FBKBugFormTableViewController *)self formResponse];
    char v13 = [v12 answersDictionary];
    [v11 gatherAttachment:v6 answers:v13];

    [(FBKBugFormTableViewController *)self updateUI:0 canDismissKeyboard:1 withCompletion:0];
  }
  else if ([v6 isReadyToDisplayContents])
  {
    uint64_t v14 = +[FBKLog attachHandle];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v6 displayName];
      *(_DWORD *)buf = 138543362;
      id v25 = v15;
      _os_log_impl(&dword_22A36D000, v14, OS_LOG_TYPE_DEFAULT, "Will show attachment contents for [%{public}@]", buf, 0xCu);
    }
    if (self->_alternateImagePreviewEnabled)
    {
      [(UITableViewController *)self presentAttachmentWithImagePush:v6 fromIndexPath:v7];
    }
    else
    {
      BOOL v16 = [(FBKBugFormTableViewController *)self _useAttachmentCellRedesign];
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      int v20 = __60__FBKBugFormTableViewController_didTapAttachment_indexPath___block_invoke;
      uint64_t v21 = &unk_264877498;
      id v22 = self;
      id v23 = v6;
      [(UITableViewController *)self presentAttachment:v23 fromIndexPath:v7 useRedesign:v16 deleteHandler:&v18];
    }
  }
  dispatch_time_t v17 = [(FBKBugFormTableViewController *)self tableView];
  [v17 deselectRowAtIndexPath:v7 animated:1];
}

void __60__FBKBugFormTableViewController_didTapAttachment_indexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setInteractionEnabled:0];
  int v4 = [*(id *)(a1 + 32) devicesController];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__FBKBugFormTableViewController_didTapAttachment_indexPath___block_invoke_2;
  v8[3] = &unk_264877470;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  [v4 removeAttachmentWithAttachment:v6 viewController:v7 completion:v8];
}

void __60__FBKBugFormTableViewController_didTapAttachment_indexPath___block_invoke_2(id *a1, int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [a1[4] setInteractionEnabled:1];
  if (a2)
  {
    [a1[5] updateUIOverrideWindowCheck];
    int v4 = [a1[5] navigationController];
    id v5 = [v4 visibleViewController];
    id v6 = a1[4];

    if (v5 == v6)
    {
      id v10 = [a1[5] navigationController];
      id v7 = (id)[v10 popViewControllerAnimated:1];
    }
  }
  else
  {
    uint64_t v8 = Log_7();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [a1[6] displayName];
      *(_DWORD *)buf = 138543362;
      id v12 = v9;
      _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_INFO, "Unable to remove attachment [%{public}@]", buf, 0xCu);
    }
  }
}

- (void)registerApplicationNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_saveFormForResigningActive_ name:*MEMORY[0x263F833C0] object:0];

  objc_initWeak(&location, self);
  int v4 = +[FBKData sharedInstance];
  id v5 = [v4 notificationCenter];
  id v6 = [MEMORY[0x263F08A48] mainQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _DWORD v10[2] = __65__FBKBugFormTableViewController_registerApplicationNotifications__block_invoke;
  v10[3] = &unk_2648774C0;
  objc_copyWeak(&v11, &location);
  id v7 = [v5 addObserverForName:@"FBKDidRefreshFormStubsNotification" object:0 queue:v6 usingBlock:v10];
  [(FBKBugFormTableViewController *)self setDidRefreshFormStubsNotificationObserver:v7];

  uint64_t v8 = Log_7();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_INFO, "Registered for application state notifications", v9, 2u);
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __65__FBKBugFormTableViewController_registerApplicationNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateCachedCandidateStubsCount];
}

- (void)unregisterApplicationNotifications
{
  id v3 = Log_7();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_22A36D000, v3, OS_LOG_TYPE_INFO, "Unregistering for application state notifications", v9, 2u);
  }

  int v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F833C0] object:0];

  id v5 = [(FBKBugFormTableViewController *)self didRefreshFormStubsNotificationObserver];

  if (v5)
  {
    id v6 = +[FBKData sharedInstance];
    id v7 = [v6 notificationCenter];
    uint64_t v8 = [(FBKBugFormTableViewController *)self didRefreshFormStubsNotificationObserver];
    [v7 removeObserver:v8];
  }
}

- (void)saveFormForResigningActive:(id)a3
{
  int v4 = _os_activity_create(&dword_22A36D000, "Resign Active Save", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__FBKBugFormTableViewController_saveFormForResigningActive___block_invoke;
  block[3] = &unk_264873FE8;
  void block[4] = self;
  os_activity_apply(v4, block);
}

void __60__FBKBugFormTableViewController_saveFormForResigningActive___block_invoke(uint64_t a1)
{
  id v2 = Log_7();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A36D000, v2, OS_LOG_TYPE_INFO, "Resigning active: Saving form.", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) firstResponder];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      id v5 = [v4 superviewWithClass:objc_opt_class()];
      [v5 saveAnswer];
      id v6 = Log_7();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_INFO, "Found and saved in-progress answer.", v8, 2u);
      }
    }
  }
  id v7 = [*(id *)(a1 + 32) delegate];
  [v7 controllerWillResignFirstActive:*(void *)(a1 + 32)];
}

- (void)registerForKeyboardNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_keyboardWasShown_ name:*MEMORY[0x263F837A8] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_keyboardDidHide_ name:*MEMORY[0x263F837A0] object:0];
}

- (void)unregisterForKeyboardNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F837A8] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F837A0] object:0];
}

- (void)keyboardWasShown:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F837B8]];
  [v5 CGRectValue];
  double v7 = v6;

  uint64_t v8 = Log_7();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    id v10 = "-[FBKBugFormTableViewController keyboardWasShown:]";
    __int16 v11 = 2048;
    double v12 = v7;
    _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_INFO, "%s: keyboardFrame.size.height: %f", (uint8_t *)&v9, 0x16u);
  }

  [(FBKBugFormTableViewController *)self setKeyboardHeight:v7];
}

- (void)keyboardDidHide:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = Log_7();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    double v6 = "-[FBKBugFormTableViewController keyboardDidHide:]";
    _os_log_impl(&dword_22A36D000, v4, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(FBKBugFormTableViewController *)self setKeyboardHeight:0.0];
}

- (BOOL)showsDraftDeletionMessage
{
  return ![(FBKBugFormTableViewController *)self alwaysDeletesDrafts];
}

- (id)legalViewBelowAttachments
{
  id v3 = [(FBKBugFormTableViewController *)self onBoardingKitIdentifier];

  if (v3)
  {
    id v4 = [(FBKBugFormTableViewController *)self _cachedOnboardingKitView];

    if (!v4)
    {
      int v5 = [_TtC12FeedbackCore29FBKOnBoardingKitLegalTextView alloc];
      double v6 = [(FBKBugFormTableViewController *)self onBoardingKitIdentifier];
      id v7 = [(FBKOnBoardingKitLegalTextView *)v5 initOnBoardingKitIdentifier:v6];
      [(FBKBugFormTableViewController *)self set_cachedOnboardingKitView:v7];
    }
    uint64_t v8 = [(FBKBugFormTableViewController *)self _cachedOnboardingKitView];
  }
  else
  {
    int v9 = [(FBKBugFormTableViewController *)self _cachedLegalFooterView];

    if (!v9)
    {
      id v10 = [(FBKBugFormTableViewController *)self legalText];
      __int16 v11 = +[FBKAttributedStringViewController viewWithAttributedText:v10];
      [(FBKBugFormTableViewController *)self set_cachedLegalFooterView:v11];
    }
    uint64_t v8 = [(FBKBugFormTableViewController *)self _cachedLegalFooterView];
  }

  return v8;
}

- (id)legalText
{
  uint64_t v3 = [(FBKBugFormTableViewController *)self localizedAttributedLegalString];
  if (v3
    && (id v4 = (void *)v3,
        [(FBKBugFormTableViewController *)self localizedAttributedLegalString],
        int v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        v4,
        v6))
  {
    if (legalText_onceToken != -1) {
      dispatch_once(&legalText_onceToken, &__block_literal_global_297);
    }
    id v7 = [(FBKBugFormTableViewController *)self localizedAttributedLegalString];
  }
  else
  {
    uint64_t v8 = [(FBKBugFormTableViewController *)self localizedAttachmentLegalText];
    if (v8
      && (int v9 = (void *)v8,
          [(FBKBugFormTableViewController *)self localizedAttachmentLegalText],
          id v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 length],
          v10,
          v9,
          v11))
    {
      if (legalText_onceToken_298 != -1) {
        dispatch_once(&legalText_onceToken_298, &__block_literal_global_301);
      }
      id v12 = objc_alloc(MEMORY[0x263F086A0]);
      uint64_t v13 = [(FBKBugFormTableViewController *)self localizedAttachmentLegalText];
      id v7 = (void *)[v12 initWithString:v13];
    }
    else
    {
      id v14 = objc_alloc(MEMORY[0x263F086A0]);
      uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      BOOL v16 = [v15 localizedStringForKey:@"SHORT_SUBMISSION_PII_MESSAGE" value:&stru_26DDF6A30 table:0];
      id v7 = (void *)[v14 initWithString:v16];
    }
  }

  return v7;
}

void __42__FBKBugFormTableViewController_legalText__block_invoke()
{
  v0 = +[FBKLog appHandle];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_22A36D000, v0, OS_LOG_TYPE_DEFAULT, "Using attributed string attachment legal text", v1, 2u);
  }
}

void __42__FBKBugFormTableViewController_legalText__block_invoke_299()
{
  v0 = +[FBKLog appHandle];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_22A36D000, v0, OS_LOG_TYPE_DEFAULT, "Using alternate attachment legal text", v1, 2u);
  }
}

- (id)alertControllerForDismissWithLaunchAction:(id)a3
{
  id v4 = a3;
  int v5 = (void *)MEMORY[0x263F82418];
  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"PROMPT_DELETE_DRAFT" value:&stru_26DDF6A30 table:0];
  uint64_t v8 = [v5 fbaAlertControllerWithTitle:v7 message:0 preferredStyle:1];

  int v9 = +[FBKData sharedInstance];
  id v10 = [v9 currentUser];
  int v11 = [v10 isUnauthenticatedUser];

  id v12 = (void *)MEMORY[0x263F82400];
  uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"SAVE_DRAFT_CHOICE" value:&stru_26DDF6A30 table:0];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __75__FBKBugFormTableViewController_alertControllerForDismissWithLaunchAction___block_invoke;
  v38[3] = &unk_264877308;
  v38[4] = self;
  uint64_t v33 = [v12 actionWithTitle:v14 style:0 handler:v38];

  char v15 = [v4 isCaptive];
  char v16 = [v4 shouldMakeFBAVisible];
  if (v11)
  {
    dispatch_time_t v17 = [MEMORY[0x263F086E0] feedbackCoreFramework];
    uint64_t v18 = v17;
    uint64_t v19 = @"DELETE";
    int v20 = @"Delete";
  }
  else
  {
    dispatch_time_t v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v18 = v17;
    uint64_t v19 = @"DELETE_DRAFT_CHOICE";
    int v20 = &stru_26DDF6A30;
  }
  uint64_t v21 = objc_msgSend(v17, "localizedStringForKey:value:table:", v19, v20, 0, v33);

  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __75__FBKBugFormTableViewController_alertControllerForDismissWithLaunchAction___block_invoke_2;
  v35[3] = &unk_264877508;
  char v36 = v15;
  v35[4] = self;
  char v37 = v16;
  id v22 = [MEMORY[0x263F82400] actionWithTitle:v21 style:2 handler:v35];
  id v23 = (void *)MEMORY[0x263F82400];
  int v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v25 = [v24 localizedStringForKey:@"CANCEL" value:&stru_26DDF6A30 table:0];
  uint64_t v26 = [v23 actionWithTitle:v25 style:1 handler:&__block_literal_global_320];

  [v8 addAction:v22];
  if (v11)
  {
    [v8 addAction:v26];
    uint64_t v27 = [MEMORY[0x263F086E0] feedbackCoreFramework];
    double v28 = [v27 localizedStringForKey:@"CLOSE_DRAFT_PROMPT_NO_SAVE" value:@"Do you want to delete this feedback report?" table:0];
    [v8 setTitle:v28];

    double v29 = [MEMORY[0x263F086E0] feedbackCoreFramework];
    double v30 = [v29 localizedStringForKey:@"CLOSE_DRAFT_MESSAGE_NO_SAVE" value:@"Your responses will be deleted and will not be sent to Apple." table:0];
    [v8 setMessage:v30];

    double v31 = v34;
  }
  else
  {
    double v31 = v34;
    if (!v4 || ([v4 isCaptive] & 1) == 0) {
      [v8 addAction:v34];
    }
    [v8 addAction:v26];
  }

  return v8;
}

uint64_t __75__FBKBugFormTableViewController_alertControllerForDismissWithLaunchAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeDraftAndDelete:0 withError:0 completion:0];
}

void __75__FBKBugFormTableViewController_alertControllerForDismissWithLaunchAction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(unsigned char *)(a1 + 40))
  {
    uint64_t v8 = *(void **)(a1 + 32);
    int v9 = 0;
LABEL_8:
    [v8 closeDraftAndDelete:1 withError:0 completion:v9];
    goto LABEL_9;
  }
  id v4 = [MEMORY[0x263F08AB0] processInfo];
  int v5 = [v4 environment];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"FBK_UNIT_TEST"];

  if (!v6)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    _DWORD v10[2] = __75__FBKBugFormTableViewController_alertControllerForDismissWithLaunchAction___block_invoke_316;
    v10[3] = &__block_descriptor_33_e5_v8__0l;
    char v11 = *(unsigned char *)(a1 + 41);
    int v9 = v10;
    goto LABEL_8;
  }
  id v7 = Log_7();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A36D000, v7, OS_LOG_TYPE_DEFAULT, "Unit test in progress, cannot log out.", buf, 2u);
  }

LABEL_9:
}

uint64_t __75__FBKBugFormTableViewController_alertControllerForDismissWithLaunchAction___block_invoke_316(uint64_t a1)
{
  id v2 = Log_7();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22A36D000, v2, OS_LOG_TYPE_DEFAULT, "Draft deleted, exiting restricted mode.", v4, 2u);
  }

  return +[iFBKUtils exitCaptiveModeRemovingFromHomeScreen:*(unsigned __int8 *)(a1 + 32)];
}

- (void)dismiss:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(FBKBugFormTableViewController *)self alwaysDeletesDrafts])
  {
    int v5 = 0;
  }
  else
  {
    uint64_t v6 = [(FBKBugFormTableViewController *)self draftingController];
    if ([v6 isDirty])
    {
      int v5 = 1;
    }
    else
    {
      id v7 = [(FBKBugFormTableViewController *)self launchAction];
      int v5 = [v7 isCaptive];
    }
  }
  uint64_t v8 = Log_7();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(FBKBugFormTableViewController *)self draftingController];
    int v10 = [v9 isDirty];
    char v11 = [(FBKBugFormTableViewController *)self launchAction];
    int v17 = 136447234;
    uint64_t v18 = "-[FBKBugFormTableViewController dismiss:]";
    __int16 v19 = 1024;
    int v20 = v10;
    __int16 v21 = 1024;
    int v22 = [v11 isCaptive];
    __int16 v23 = 1024;
    BOOL v24 = [(FBKBugFormTableViewController *)self alwaysDeletesDrafts];
    __int16 v25 = 1024;
    int v26 = v5;
    _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}s, self.draftingController.isDirty [%i] self.launchAction.isCaptive [%i] self.alwaysDeletesDrafts [%i], shouldPromptToSave [%i]", (uint8_t *)&v17, 0x24u);
  }
  id v12 = Log_7();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v13)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_22A36D000, v12, OS_LOG_TYPE_DEFAULT, "User is dismissing draft. Will prompt for confirmation", (uint8_t *)&v17, 2u);
    }

    [(FBKBugFormTableViewController *)self askDelegateToGoFullScreenIfNeeded];
    id v14 = [(FBKBugFormTableViewController *)self launchAction];
    char v15 = [(FBKBugFormTableViewController *)self alertControllerForDismissWithLaunchAction:v14];

    char v16 = [v15 popoverPresentationController];
    [v16 setBarButtonItem:v4];

    [(FBKBugFormTableViewController *)self presentViewController:v15 animated:1 completion:0];
  }
  else
  {
    if (v13)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_22A36D000, v12, OS_LOG_TYPE_DEFAULT, "User is dismissing draft. Will close and delete", (uint8_t *)&v17, 2u);
    }

    [(FBKBugFormTableViewController *)self closeDraftAndDelete:1 withError:0 completion:0];
  }
}

- (void)hideQuestions
{
  [(FBKBugFormTableViewController *)self setShouldHideQuestions:1];

  [(FBKBugFormTableViewController *)self updateUI:0];
}

- (void)showQuestions
{
  [(FBKBugFormTableViewController *)self setShouldHideQuestions:0];

  [(FBKBugFormTableViewController *)self updateUI:0];
}

- (void)hideAllCells
{
  [(FBKBugFormTableViewController *)self setShouldHideAllCells:1];

  [(FBKBugFormTableViewController *)self updateUI:0];
}

- (void)_showSpinnerWithStatus:(id)a3 userInteractionEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = Log_7();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(FBKBugFormTableViewController *)self formResponse];
    int v9 = [v8 ID];
    int v10 = 134218242;
    char v11 = v9;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_22A36D000, v7, OS_LOG_TYPE_DEFAULT, "feedback editor for form [%li] change to state [%{public}@]", (uint8_t *)&v10, 0x16u);
  }
  [(UIViewController *)self showSpinnerWithStatus:v6 userInteractionEnabled:v4];
}

- (void)showSpinnerWithStatus:(id)a3
{
}

- (void)_stopSpinner
{
  [(UIViewController *)self hideSpinner];

  [(FBKBugFormTableViewController *)self _showInternalToolbarIfNeeded];
}

- (void)_showInternalToolbarIfNeeded
{
  id v12 = (id)objc_opt_new();
  if (FBKIsInternalInstall(v12, v3))
  {
    BOOL v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v5 = [v4 BOOLForKey:@"showsAutoFillButton"];

    if (v5)
    {
      id v6 = [(FBKBugFormTableViewController *)self navigationController];
      [v6 setToolbarHidden:0 animated:1];

      id v7 = objc_alloc(MEMORY[0x263F824A8]);
      uint64_t v8 = LocalizationNotNeeded(@"Fill in all answers");
      int v9 = (void *)[v7 initWithTitle:v8 style:0 target:self action:sel_fillInAnswers];

      [v12 addObject:v9];
      int v10 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:5 target:0 action:0];
      [v12 addObject:v10];
    }
    if ([v12 count])
    {
      char v11 = [MEMORY[0x263EFF8C0] arrayWithArray:v12];
      [(FBKBugFormTableViewController *)self setToolbarItems:v11];
    }
  }
}

- (void)updateSubmitButtonState
{
  uint64_t v3 = [(FBKBugFormTableViewController *)self devicesController];
  if (!v3) {
    goto LABEL_4;
  }
  BOOL v4 = (void *)v3;
  int v5 = [(FBKBugFormTableViewController *)self devicesController];
  if (![v5 state])
  {

    goto LABEL_7;
  }
  id v6 = [(FBKBugFormTableViewController *)self devicesController];
  uint64_t v7 = [v6 state];

  if (v7 == 3)
  {
LABEL_7:
    id v13 = [(FBKBugFormTableViewController *)self submitButton];
    [v13 setEnabled:0];

    uint64_t v14 = [(FBKBugFormTableViewController *)self submitButtonLarge];
    id v17 = v14;
    uint64_t v15 = 0;
    goto LABEL_9;
  }
LABEL_4:
  if (self->_attemptedSubmission)
  {
    uint64_t v8 = [(FBKBugFormTableViewController *)self draftingController];
    uint64_t v9 = [v8 validate:0];

    int v10 = [(FBKBugFormTableViewController *)self submitButton];
    [v10 setEnabled:v9];

    char v11 = [(FBKBugFormTableViewController *)self submitButtonLarge];
    [v11 enableButton:v9];

    id v17 = [(FBKBugFormTableViewController *)self navigationItem];
    id v12 = [v17 leftBarButtonItem];
    [v12 setEnabled:1];

    goto LABEL_10;
  }
  char v16 = [(FBKBugFormTableViewController *)self submitButton];
  [v16 setEnabled:1];

  uint64_t v14 = [(FBKBugFormTableViewController *)self submitButtonLarge];
  id v17 = v14;
  uint64_t v15 = 1;
LABEL_9:
  [v14 enableButton:v15];
LABEL_10:
}

- (BOOL)hasFileArea
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(FBKBugFormTableViewController *)self bugForm];
  uint64_t v3 = [v2 questionGroups];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) isFileCollectionGroup])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)shouldShowFormPicker
{
  if (![(FBKBugFormTableViewController *)self canShowTopicPicker]) {
    return 0;
  }
  uint64_t v3 = [(FBKBugFormTableViewController *)self formStub];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)shouldShowTeamPicker
{
  if (![(FBKBugFormTableViewController *)self canShowTeamPicker]
    || ![(FBKBugFormTableViewController *)self shouldShowFormPicker])
  {
    return 0;
  }
  uint64_t v3 = +[FBKData sharedInstance];
  BOOL v4 = [v3 currentUser];
  char v5 = [v4 hasManagedTeams];

  return v5;
}

- (NSString)teamPickerRowIdentifier
{
  uint64_t v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  id v6 = [(FBKBugFormTableViewController *)self currentTeam];
  uint64_t v7 = [v6 name];
  long long v8 = [(FBKBugFormTableViewController *)self formStub];
  long long v9 = [v8 teamsMatchingFormID];
  long long v10 = [v3 stringWithFormat:@"%@-%@-%i", v5, v7, (unint64_t)objc_msgSend(v9, "count") > 1];

  return (NSString *)v10;
}

- (NSString)topicPickerRowIdentifier
{
  uint64_t v3 = NSString;
  BOOL v4 = [(FBKBugFormTableViewController *)self formStub];
  uint64_t v5 = [v4 name];
  id v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  else {
    uint64_t v7 = &stru_26DDF6A30;
  }
  long long v8 = [v3 stringWithFormat:@"%@-%lu", v7, -[FBKBugFormTableViewController cachedCandidateStubsCount](self, "cachedCandidateStubsCount")];

  return (NSString *)v8;
}

- (BOOL)shouldShowForm
{
  if ([(FBKBugFormTableViewController *)self shouldHideQuestions]) {
    return 0;
  }
  BOOL v4 = [(FBKBugFormTableViewController *)self draftingController];
  if ([v4 isLoading])
  {
    BOOL v3 = 0;
  }
  else
  {
    uint64_t v5 = [(FBKBugFormTableViewController *)self formResponse];
    BOOL v3 = v5 != 0;
  }
  return v3;
}

- (BOOL)shouldShowAttachments
{
  BOOL v3 = [(FBKBugFormTableViewController *)self shouldShowForm];
  if (v3)
  {
    BOOL v4 = [(FBKBugFormTableViewController *)self bugForm];
    char v5 = [v4 collectsFiles];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (_TtC12FeedbackCore27FBKAddAttachmentsController)addAttachmentsController
{
  addAttachmentsController = self->_addAttachmentsController;
  if (!addAttachmentsController)
  {
    BOOL v4 = [[_TtC12FeedbackCore27FBKAddAttachmentsController alloc] initWithDelegate:self supportsDragAndDrop:[(FBKBugFormTableViewController *)self allowsAttachmentDragAndDrop]];
    char v5 = self->_addAttachmentsController;
    self->_addAttachmentsController = v4;

    addAttachmentsController = self->_addAttachmentsController;
  }

  return addAttachmentsController;
}

- (void)updateCachedCandidateStubsCount
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v3 = +[FBKData sharedInstance];
  BOOL v4 = [v3 currentUser];
  char v5 = [(FBKBugFormTableViewController *)self candidateFormStubsPredicate];
  id v6 = [(FBKBugFormTableViewController *)self currentTeam];
  uint64_t v7 = [v4 bugFormStubsForPickerWithPredicate:v5 team:v6];
  -[FBKBugFormTableViewController setCachedCandidateStubsCount:](self, "setCachedCandidateStubsCount:", [v7 count]);

  long long v8 = Log_7();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    unint64_t v10 = [(FBKBugFormTableViewController *)self cachedCandidateStubsCount];
    _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "Draft has [%lu] candidate stubs", (uint8_t *)&v9, 0xCu);
  }

  [(FBKBugFormTableViewController *)self updateUI:0];
}

- (void)fillInAnswers
{
  [(FBKBugFormTableViewController *)self setAttemptedSubmission:1];
  id v3 = [(FBKBugFormTableViewController *)self draftingController];
  [v3 automaticallyFillInAllAnswers];
}

- (id)currentTeam
{
  id v2 = [(FBKBugFormTableViewController *)self itemFromDraft];
  id v3 = [v2 singleTeam];

  return v3;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v13 = a3;
  [(FBKBugFormTableViewController *)self setTextViewFirstResponder:v13];
  BOOL v4 = [v13 superview];
  if (v4)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v5 = [v4 superview];

      BOOL v4 = (void *)v5;
    }
    while (v5);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 setShowError:0];
    [(FBKBugFormTableViewController *)self setModalInPresentation:1];
  }
  id v6 = [(FBKBugFormTableViewController *)self navigationItem];
  uint64_t v7 = [v6 leftBarButtonItem];
  [(FBKBugFormTableViewController *)self setCancelBarButtonItem:v7];

  long long v8 = [(FBKBugFormTableViewController *)self navigationItem];
  int v9 = [v8 rightBarButtonItem];
  [(FBKBugFormTableViewController *)self setSubmitBarButtonItem:v9];

  if (+[FBKSharedConstants isRunningInFBA])
  {
    unint64_t v10 = [(FBKBugFormTableViewController *)self navigationItem];
    [v10 setLeftBarButtonItem:0 animated:0];
  }
  uint64_t v11 = [(FBKBugFormTableViewController *)self navigationItem];
  id v12 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:v13 action:sel_resignFirstResponder];
  [v11 setRightBarButtonItem:v12 animated:1];

  [(FBKBugFormTableViewController *)self _resizeAndScrollTableAfterTextChangeInTextView:v13];
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = [v8 superviewWithClass:objc_opt_class()];
  uint64_t v11 = [v10 question];
  uint64_t v12 = [v11 answerType];

  if (!v12)
  {
    if ([v9 isEqualToString:@"\n"])
    {
      BOOL v13 = 0;
      goto LABEL_3;
    }
    if ([v9 containsString:@"\n"])
    {
      uint64_t v15 = [v9 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

      char v16 = [v8 beginningOfDocument];
      id v17 = [v8 positionFromPosition:v16 offset:location];
      uint64_t v18 = [v8 positionFromPosition:v17 offset:length];
      __int16 v19 = [v8 textRangeFromPosition:v17 toPosition:v18];
      [v8 replaceRange:v19 withText:v15];

      BOOL v13 = 0;
      id v9 = (id)v15;
      goto LABEL_3;
    }
  }
  BOOL v13 = 1;
LABEL_3:

  return v13;
}

- (void)_resizeAndScrollTableAfterTextChangeInTextView:(id)a3
{
  id v4 = a3;
  if ([(FBKBugFormTableViewController *)self isUpdatingTable])
  {
    uint64_t v5 = Log_7();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_INFO, "Is updating table, will resize cell later", (uint8_t *)buf, 2u);
    }

    id v6 = [MEMORY[0x263F08A48] mainQueue];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __80__FBKBugFormTableViewController__resizeAndScrollTableAfterTextChangeInTextView___block_invoke;
    v16[3] = &unk_264874270;
    v16[4] = self;
    id v17 = v4;
    [v6 addOperationWithBlock:v16];
  }
  else
  {
    id v7 = objc_initWeak(buf, self);
    id v8 = [(FBKBugFormTableViewController *)self diffableDataSource];
    id v9 = [v8 snapshot];

    id WeakRetained = objc_loadWeakRetained(buf);
    uint64_t v11 = [WeakRetained diffableDataSource];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __80__FBKBugFormTableViewController__resizeAndScrollTableAfterTextChangeInTextView___block_invoke_2;
    v12[3] = &unk_264877550;
    id v13 = v4;
    objc_copyWeak(&v14, buf);
    [v11 applySnapshot:v9 animatingDifferences:0 completion:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);
  }
}

uint64_t __80__FBKBugFormTableViewController__resizeAndScrollTableAfterTextChangeInTextView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resizeAndScrollTableAfterTextChangeInTextView:*(void *)(a1 + 40)];
}

void __80__FBKBugFormTableViewController__resizeAndScrollTableAfterTextChangeInTextView___block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained tableView];
  id v4 = objc_loadWeakRetained(v2);
  [v4 keyboardHeight];
  objc_msgSend(v1, "scrollTableToAvoidKeyboardInTableView:keyboardHeight:withPadding:", v3);
}

- (void)askDelegateToGoFullScreenIfNeeded
{
  if ([(FBKBugFormTableViewController *)self isPresentedInSmallDetent])
  {
    id v3 = [(FBKBugFormTableViewController *)self delegate];

    if (v3)
    {
      id v4 = Log_7();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_22A36D000, v4, OS_LOG_TYPE_DEFAULT, "Asking delegate to go full screen", v6, 2u);
      }

      uint64_t v5 = [(FBKBugFormTableViewController *)self delegate];
      [v5 controllerDidRequestFullScreenWithController:self];
    }
  }
}

- (void)textViewDidEndEditing:(id)a3
{
  uint64_t v4 = [a3 superview];
  if (v4)
  {
    while (1)
    {
      id v12 = (id)v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v5 = [v12 superview];

      uint64_t v4 = v5;
      if (!v5) {
        goto LABEL_4;
      }
    }
  }
  else
  {
LABEL_4:
    id v12 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v12 endEditingQuestion];
    id v6 = [(FBKBugFormTableViewController *)self draftingController];
    BOOL v7 = ([v6 isDirty] & 1) != 0
      || [(FBKBugFormTableViewController *)self isCaptiveModeEnabled];
    [(FBKBugFormTableViewController *)self setModalInPresentation:v7];
  }
  id v8 = [(FBKBugFormTableViewController *)self navigationItem];
  id v9 = [(FBKBugFormTableViewController *)self cancelBarButtonItem];
  [v8 setLeftBarButtonItem:v9 animated:0];

  unint64_t v10 = [(FBKBugFormTableViewController *)self navigationItem];
  uint64_t v11 = [(FBKBugFormTableViewController *)self submitBarButtonItem];
  [v10 setRightBarButtonItem:v11 animated:0];

  [(FBKBugFormTableViewController *)self setCancelBarButtonItem:0];
  [(FBKBugFormTableViewController *)self setSubmitBarButtonItem:0];
  [(FBKBugFormTableViewController *)self setTextViewFirstResponder:0];
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  uint64_t v5 = Log_7();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[FBKBugFormTableViewController presentationControllerForPresentedViewController:presentingViewController:sourceViewController:](v5);
  }

  return 0;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v10 = a3;
  uint64_t v5 = [(FBKBugFormTableViewController *)self presentedViewController];
  if (v5)
  {
    id v6 = (void *)v5;
    BOOL v7 = [(FBKBugFormTableViewController *)self traitCollection];
    uint64_t v8 = [v7 horizontalSizeClass];
    uint64_t v9 = [v10 horizontalSizeClass];

    if (v8 != v9) {
      [(FBKBugFormTableViewController *)self dismissViewControllerAnimated:0 completion:0];
    }
  }
}

- (BOOL)isReadyForDropSessionFromController:(id)a3 tableView:(id)a4 dropSessionDidUpdate:(id)a5 withDestinationIndexPath:(id)a6
{
  BOOL v7 = [(FBKBugFormTableViewController *)self hasFileArea];
  if (v7)
  {
    LOBYTE(v7) = [(FBKBugFormTableViewController *)self shouldShowForm];
  }
  return v7;
}

- (void)attachmentsAlert:(id)a3 needsDeviceDiagnosticsController:(id)a4
{
  id v6 = a4;
  id v7 = [(FBKBugFormTableViewController *)self devicesController];
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)attachmentsAlertDidSelectOption:(id)a3
{
  id v3 = [(FBKBugFormTableViewController *)self view];
  [v3 endEditing:1];
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F08A48], "mainQueue", a3);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __75__FBKBugFormTableViewController_presentationControllerDidAttemptToDismiss___block_invoke;
  v5[3] = &unk_264873FE8;
  v5[4] = self;
  [v4 addOperationWithBlock:v5];
}

void __75__FBKBugFormTableViewController_presentationControllerDidAttemptToDismiss___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 endEditing:1];

  id v9 = [*(id *)(a1 + 32) navigationController];
  id v3 = [v9 topViewController];
  uint64_t v4 = v3;
  if (v3 == *(void **)(a1 + 32))
  {
    uint64_t v5 = [v3 navigationItem];
    id v6 = [v5 leftBarButtonItem];
    int v7 = [v6 isEnabled];

    if (!v7) {
      return;
    }
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = [v8 navigationItem];
    uint64_t v4 = [v9 leftBarButtonItem];
    [v8 dismiss:v4];
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (BOOL)isCaptiveModeEnabled
{
  id v2 = self;
  id v3 = [(FBKBugFormTableViewController *)self launchAction];
  LOBYTE(v2) = [(FBKBugFormTableViewController *)v2 isCaptiveModeEnabledForLaunchAction:v3];

  return (char)v2;
}

- (BOOL)isCaptiveModeEnabledForLaunchAction:(id)a3
{
  if (a3) {
    return [a3 isCaptive];
  }
  else {
    return 0;
  }
}

- (NSDictionary)pendingQandA
{
  return (NSDictionary *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setPendingQandA:(id)a3
{
}

- (NSSet)extensions
{
  return (NSSet *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setExtensions:(id)a3
{
}

- (NSPredicate)candidateFormStubsPredicate
{
  return self->_candidateFormStubsPredicate;
}

- (void)setCandidateFormStubsPredicate:(id)a3
{
}

- (FBKDraftingController)draftingController
{
  return self->_draftingController;
}

- (void)setDraftingController:(id)a3
{
}

- (FBKLaunchAction)launchAction
{
  return self->_launchAction;
}

- (NSString)localizedAttachmentLegalText
{
  return self->_localizedAttachmentLegalText;
}

- (void)setLocalizedAttachmentLegalText:(id)a3
{
}

- (NSAttributedString)localizedAttributedLegalString
{
  return self->_localizedAttributedLegalString;
}

- (void)setLocalizedAttributedLegalString:(id)a3
{
}

- (NSString)largeTitleIcon
{
  return self->_largeTitleIcon;
}

- (void)setLargeTitleIcon:(id)a3
{
}

- (NSArray)requestedPlugIns
{
  return self->_requestedPlugIns;
}

- (void)setRequestedPlugIns:(id)a3
{
}

- (NSString)appToken
{
  return self->_appToken;
}

- (void)setAppToken:(id)a3
{
}

- (UITextView)textViewFirstResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textViewFirstResponder);

  return (UITextView *)WeakRetained;
}

- (void)setTextViewFirstResponder:(id)a3
{
}

- (BOOL)alwaysDeletesDrafts
{
  return self->_alwaysDeletesDrafts;
}

- (void)setAlwaysDeletesDrafts:(BOOL)a3
{
  self->_alwaysDeletesDrafts = a3;
}

- (FBKBugFormTableViewControllerProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FBKBugFormTableViewControllerProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)canShowTopicPicker
{
  return self->_canShowTopicPicker;
}

- (void)setCanShowTopicPicker:(BOOL)a3
{
  self->_canShowTopicPicker = a3;
}

- (BOOL)shouldShowUserSwitcherInForm
{
  return self->_shouldShowUserSwitcherInForm;
}

- (void)setShouldShowUserSwitcherInForm:(BOOL)a3
{
  self->_shouldShowUserSwitcherInForm = a3;
}

- (BOOL)showInlineUserInfo
{
  return self->_showInlineUserInfo;
}

- (void)setShowInlineUserInfo:(BOOL)a3
{
  self->_showInlineUserInfo = a3;
}

- (BOOL)showUserSwitcherLast
{
  return self->_showUserSwitcherLast;
}

- (void)setShowUserSwitcherLast:(BOOL)a3
{
  self->_showUserSwitcherLast = a3;
}

- (BOOL)canShowTeamPicker
{
  return self->_canShowTeamPicker;
}

- (void)setCanShowTeamPicker:(BOOL)a3
{
  self->_canShowTeamPicker = a3;
}

- (unint64_t)submissionStyle
{
  return self->_submissionStyle;
}

- (void)setSubmissionStyle:(unint64_t)a3
{
  self->_submissionStyle = a3;
}

- (BOOL)canOpenFeedbackInFBA
{
  return self->_canOpenFeedbackInFBA;
}

- (void)setCanOpenFeedbackInFBA:(BOOL)a3
{
  self->_canOpenFeedbackInFBA = a3;
}

- (BOOL)shouldShowAttachmentButton
{
  return self->_shouldShowAttachmentButton;
}

- (void)setShouldShowAttachmentButton:(BOOL)a3
{
  self->_shouldShowAttachmentButton = a3;
}

- (BOOL)disableAccountSwitching
{
  return self->_disableAccountSwitching;
}

- (void)setDisableAccountSwitching:(BOOL)a3
{
  self->_disableAccountSwitching = a3;
}

- (BOOL)alternateImagePreviewEnabled
{
  return self->_alternateImagePreviewEnabled;
}

- (void)setAlternateImagePreviewEnabled:(BOOL)a3
{
  self->_alternateImagePreviewEnabled = a3;
}

- (BOOL)useInlineChoices
{
  return self->_useInlineChoices;
}

- (void)setUseInlineChoices:(BOOL)a3
{
  self->_BOOL useInlineChoices = a3;
}

- (unint64_t)maxInlineChoices
{
  return self->_maxInlineChoices;
}

- (void)setMaxInlineChoices:(unint64_t)a3
{
  self->_maxInlineChoices = a3;
}

- (NSString)onBoardingKitIdentifier
{
  return self->_onBoardingKitIdentifier;
}

- (void)setOnBoardingKitIdentifier:(id)a3
{
}

- (FBKDeviceDiagnosticsController)devicesController
{
  return self->_devicesController;
}

- (void)setDevicesController:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cancelButton);

  return (UIBarButtonItem *)WeakRetained;
}

- (void)setCancelButton:(id)a3
{
}

- (UIBarButtonItem)submitButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_submitButton);

  return (UIBarButtonItem *)WeakRetained;
}

- (void)setSubmitButton:(id)a3
{
}

- (FBKLargeSubmitButton)submitButtonLarge
{
  return self->_submitButtonLarge;
}

- (void)setSubmitButtonLarge:(id)a3
{
}

- (BOOL)attemptedSubmission
{
  return self->_attemptedSubmission;
}

- (void)setAttemptedSubmission:(BOOL)a3
{
  self->_attemptedSubmission = a3;
}

- (BOOL)isSubmissionPendingOnEnhancedLogging
{
  return self->_isSubmissionPendingOnEnhancedLogging;
}

- (void)setIsSubmissionPendingOnEnhancedLogging:(BOOL)a3
{
  self->_isSubmissionPendingOnEnhancedLogging = a3;
}

- (NSDictionary)pendingAttachments
{
  return (NSDictionary *)objc_getProperty(self, a2, 1208, 1);
}

- (void)setPendingAttachments:(id)a3
{
}

- (id)loadDraftCompletion
{
  return self->_loadDraftCompletion;
}

- (void)setLoadDraftCompletion:(id)a3
{
}

- (unsigned)whooshSoundID
{
  return self->_whooshSoundID;
}

- (void)setWhooshSoundID:(unsigned int)a3
{
  self->_whooshSoundID = a3;
}

- (BOOL)hasLoadedFirstDraft
{
  return self->_hasLoadedFirstDraft;
}

- (void)setHasLoadedFirstDraft:(BOOL)a3
{
  self->_hasLoadedFirstDraft = a3;
}

- (BOOL)isEstablishingBugSession
{
  return self->_isEstablishingBugSession;
}

- (void)setIsEstablishingBugSession:(BOOL)a3
{
  self->_isEstablishingBugSession = a3;
}

- (BOOL)isPresentedInSmallDetent
{
  return self->_isPresentedInSmallDetent;
}

- (void)setIsPresentedInSmallDetent:(BOOL)a3
{
  self->_isPresentedInSmallDetent = a3;
}

- (BOOL)isBeingDismissedBySelf
{
  return self->_isBeingDismissedBySelf;
}

- (void)setIsBeingDismissedBySelf:(BOOL)a3
{
  self->_isBeingDismissedBySelf = a3;
}

- (NSString)firstDeviceSectionIdentifier
{
  return self->_firstDeviceSectionIdentifier;
}

- (void)setFirstDeviceSectionIdentifier:(id)a3
{
}

- (NSString)sectionThatWillHostLegalTextFooterSectionIdentifier
{
  return self->_sectionThatWillHostLegalTextFooterSectionIdentifier;
}

- (void)setSectionThatWillHostLegalTextFooterSectionIdentifier:(id)a3
{
}

- (NSString)questionGroupUnderAttachmentsSectionIdentifier
{
  return self->_questionGroupUnderAttachmentsSectionIdentifier;
}

- (void)setQuestionGroupUnderAttachmentsSectionIdentifier:(id)a3
{
}

- (unint64_t)cachedCandidateStubsCount
{
  return self->_cachedCandidateStubsCount;
}

- (void)setCachedCandidateStubsCount:(unint64_t)a3
{
  self->_cachedCandidateStubsCount = a3;
}

- (id)didRefreshFormStubsNotificationObserver
{
  return self->_didRefreshFormStubsNotificationObserver;
}

- (void)setDidRefreshFormStubsNotificationObserver:(id)a3
{
}

- (BOOL)isUpdatingTable
{
  return self->_isUpdatingTable;
}

- (void)setIsUpdatingTable:(BOOL)a3
{
  self->_isUpdatingTable = a3;
}

- (BOOL)allowKeyboardDismissalForSnapshot
{
  return self->_allowKeyboardDismissalForSnapshot;
}

- (void)setAllowKeyboardDismissalForSnapshot:(BOOL)a3
{
  self->_allowKeyboardDismissalForSnapshot = a3;
}

- (UIBarButtonItem)cancelBarButtonItem
{
  return self->_cancelBarButtonItem;
}

- (void)setCancelBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)submitBarButtonItem
{
  return self->_submitBarButtonItem;
}

- (void)setSubmitBarButtonItem:(id)a3
{
}

- (BOOL)autoGathersDiagnosticExtensions
{
  return self->_autoGathersDiagnosticExtensions;
}

- (void)setAutoGathersDiagnosticExtensions:(BOOL)a3
{
  self->_autoGathersDiagnosticExtensions = a3;
}

- (BOOL)allowsAttachmentDragAndDrop
{
  return self->_allowsAttachmentDragAndDrop;
}

- (void)setAllowsAttachmentDragAndDrop:(BOOL)a3
{
  self->_allowsAttachmentDragAndDrop = a3;
}

- (BOOL)shouldHideQuestions
{
  return self->_shouldHideQuestions;
}

- (void)setShouldHideQuestions:(BOOL)a3
{
  self->_shouldHideQuestions = a3;
}

- (BOOL)shouldHideAllCells
{
  return self->_shouldHideAllCells;
}

- (void)setShouldHideAllCells:(BOOL)a3
{
  self->_shouldHideAllCells = a3;
}

- (id)notificationObserver
{
  return objc_getProperty(self, a2, 1280, 1);
}

- (void)setNotificationObserver:(id)a3
{
}

- (double)keyboardHeight
{
  return self->_keyboardHeight;
}

- (void)setKeyboardHeight:(double)a3
{
  self->_keyboardHeight = a3;
}

- (NSMutableDictionary)cellHeights
{
  return self->_cellHeights;
}

- (void)setCellHeights:(id)a3
{
}

- (FBKBugFormStub)pendingStub
{
  return self->_pendingStub;
}

- (void)setPendingStub:(id)a3
{
}

- (FBKManagedFeedbackObject)pendingFeedbackObject
{
  return self->_pendingFeedbackObject;
}

- (void)setPendingFeedbackObject:(id)a3
{
}

- (FBKTeam)pendingTeam
{
  return self->_pendingTeam;
}

- (void)setPendingTeam:(id)a3
{
}

- (BOOL)viewHasBecomeVisible
{
  return self->_viewHasBecomeVisible;
}

- (void)setViewHasBecomeVisible:(BOOL)a3
{
  self->_viewHasBecomeVisible = a3;
}

- (UITableViewCell)addAttachmentCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addAttachmentCell);

  return (UITableViewCell *)WeakRetained;
}

- (void)setAddAttachmentCell:(id)a3
{
}

- (FBKBugFormDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (void)setAddAttachmentsController:(id)a3
{
}

- (UIView)_cachedOnboardingKitView
{
  return self->__cachedOnboardingKitView;
}

- (void)set_cachedOnboardingKitView:(id)a3
{
}

- (UIView)_cachedLegalFooterView
{
  return self->__cachedLegalFooterView;
}

- (void)set_cachedLegalFooterView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedLegalFooterView, 0);
  objc_storeStrong((id *)&self->__cachedOnboardingKitView, 0);
  objc_storeStrong((id *)&self->_addAttachmentsController, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_destroyWeak((id *)&self->_addAttachmentCell);
  objc_storeStrong((id *)&self->_pendingTeam, 0);
  objc_storeStrong((id *)&self->_pendingFeedbackObject, 0);
  objc_storeStrong((id *)&self->_pendingStub, 0);
  objc_storeStrong((id *)&self->_cellHeights, 0);
  objc_storeStrong(&self->_notificationObserver, 0);
  objc_storeStrong((id *)&self->_submitBarButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
  objc_storeStrong(&self->_didRefreshFormStubsNotificationObserver, 0);
  objc_storeStrong((id *)&self->_questionGroupUnderAttachmentsSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionThatWillHostLegalTextFooterSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_firstDeviceSectionIdentifier, 0);
  objc_storeStrong(&self->_loadDraftCompletion, 0);
  objc_storeStrong((id *)&self->_pendingAttachments, 0);
  objc_storeStrong((id *)&self->_submitButtonLarge, 0);
  objc_destroyWeak((id *)&self->_submitButton);
  objc_destroyWeak((id *)&self->_cancelButton);
  objc_storeStrong((id *)&self->_devicesController, 0);
  objc_storeStrong((id *)&self->_onBoardingKitIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_textViewFirstResponder);
  objc_storeStrong((id *)&self->_appToken, 0);
  objc_storeStrong((id *)&self->_requestedPlugIns, 0);
  objc_storeStrong((id *)&self->_largeTitleIcon, 0);
  objc_storeStrong((id *)&self->_localizedAttributedLegalString, 0);
  objc_storeStrong((id *)&self->_localizedAttachmentLegalText, 0);
  objc_storeStrong((id *)&self->_launchAction, 0);
  objc_storeStrong((id *)&self->_draftingController, 0);
  objc_storeStrong((id *)&self->_candidateFormStubsPredicate, 0);
  objc_storeStrong((id *)&self->_extensions, 0);

  objc_storeStrong((id *)&self->_pendingQandA, 0);
}

- (id)attachmentCellViewWithTableView:(id)a3 indexPath:(id)a4 reuseIdentifier:(id)a5 attachment:(id)a6
{
  uint64_t v9 = sub_22A4B25F8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A4B25B8();
  uint64_t v13 = sub_22A4B3458();
  uint64_t v15 = v14;
  id v16 = a3;
  id v17 = a6;
  uint64_t v18 = self;
  id v19 = _sSo29FBKBugFormTableViewControllerC12FeedbackCoreE014attachmentCellD005tableD09indexPath15reuseIdentifier0H0So07UITabledI0CSo0oD0C_10Foundation05IndexL0VSSSo13FBKAttachmentCtF_0(v16, (uint64_t)v12, v13, v15, (uint64_t)v17);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

  return v19;
}

- (void)launchModalViewWithModalQuestion:(id)a3
{
  uint64_t v4 = (FBKQuestion *)a3;
  uint64_t v5 = self;
  FBKBugFormTableViewController.launchModalView(modalQuestion:)(v4);
}

- (id)dynamicAlertTitle
{
  return sub_22A485AA0(self, (uint64_t)a2, (void (*)(void))FBKBugFormTableViewController.dynamicAlertTitle());
}

- (id)dynamicAlertBody
{
  return sub_22A485AA0(self, (uint64_t)a2, (void (*)(void))FBKBugFormTableViewController.dynamicAlertBody());
}

- (void)largeTitleView:(uint64_t)a1 icon:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Failed to generate image from [%{public}@]", (uint8_t *)&v2, 0xCu);
}

void __74__FBKBugFormTableViewController_closeDraftAndDelete_withError_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_deleteCurrentDraftWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "Cannot delete draft because content item is nil", v1, 2u);
}

- (void)draftingControllerDidFinishLoading:(void *)a1 withError:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "draftingControllerDidFinishLoading with error %{public}@", (uint8_t *)&v4, 0xCu);
}

- (void)_handleLoadingError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  int v5 = 136315394;
  uint64_t v6 = "-[FBKBugFormTableViewController _handleLoadingError:]";
  __int16 v7 = 2114;
  uint64_t v8 = v3;
  OUTLINED_FUNCTION_3(&dword_22A36D000, a2, v4, "%s %{public}@", (uint8_t *)&v5);
}

- (void)tableView:(void *)a1 cellForRowAtIndexPath:(NSObject *)a2 withItemIdentifier:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = 134218242;
  uint64_t v5 = [a1 answerType];
  __int16 v6 = 2082;
  __int16 v7 = "-[FBKBugFormTableViewController tableView:cellForRowAtIndexPath:withItemIdentifier:]";
  OUTLINED_FUNCTION_3(&dword_22A36D000, a2, v3, "[%lu] question type not handled in [%{public}s]", (uint8_t *)&v4);
}

- (void)tableView:cellForRowAtIndexPath:withItemIdentifier:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3(&dword_22A36D000, v0, (uint64_t)v0, "No question found for choice identifier [%@] in section [%@]", v1);
}

- (void)answerDidChangeForQuestion:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 role];
  __int16 v6 = [a2 values];
  __int16 v7 = [v6 componentsJoinedByString:@","];
  int v8 = 138412546;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_debug_impl(&dword_22A36D000, a3, OS_LOG_TYPE_DEBUG, "Q: [%@] A: [%@]", (uint8_t *)&v8, 0x16u);
}

void __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_179_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __75__FBKBugFormTableViewController__reallyChangeToBugFormStub_withTeam_force___block_invoke_180_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)bugFormPickerDidCancel:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[FBKBugFormTableViewController bugFormPickerDidCancel:]";
  _os_log_debug_impl(&dword_22A36D000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

void __58__FBKBugFormTableViewController_teamPicker_didSelectTeam___block_invoke_cold_1(id *a1, id *a2, NSObject *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1);
  __int16 v6 = [WeakRetained currentTeam];
  __int16 v7 = [v6 ID];
  int v8 = [v7 stringValue];
  uint64_t v9 = [*a2 ID];
  __int16 v10 = [v9 stringValue];
  id v11 = objc_loadWeakRetained(a1);
  uint64_t v12 = [v11 formStub];
  uint64_t v13 = [v12 serverID];
  uint64_t v14 = [v13 stringValue];
  *(_DWORD *)buf = 138543874;
  id v17 = v8;
  __int16 v18 = 2114;
  id v19 = v10;
  __int16 v20 = 2114;
  uint64_t v21 = v14;
  _os_log_error_impl(&dword_22A36D000, a3, OS_LOG_TYPE_ERROR, "Attempted to switch from team [%{public}@] to team [%{public}@] for stub [%{public}@] but new team does not have a matching form stub. Falling back to old stub.", buf, 0x20u);
}

void __39__FBKBugFormTableViewController_submit__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = [*(id *)(a1 + 32) intValue];
  v4[0] = 67109120;
  v4[1] = v3;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "background task expired for form response [%d]", (uint8_t *)v4, 8u);
}

void __39__FBKBugFormTableViewController_submit__block_invoke_257_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v3 = [*(id *)(a1 + 40) formResponse];
  int v4 = [v3 ID];
  v5[0] = 67109376;
  v5[1] = [v4 intValue];
  __int16 v6 = 1024;
  int v7 = 1;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Submission callback for FR [%i] with error? [%i]", (uint8_t *)v5, 0xEu);
}

- (void)didTapDevice:(uint64_t)a1 indexPath:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  int v3 = "-[FBKBugFormTableViewController didTapDevice:indexPath:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_22A36D000, a2, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v2, 0x16u);
}

- (void)presentationControllerForPresentedViewController:(os_log_t)log presentingViewController:sourceViewController:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  int v2 = "-[FBKBugFormTableViewController presentationControllerForPresentedViewController:presentingViewController:sourceViewController:]";
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "[%{public}s", (uint8_t *)&v1, 0xCu);
}

@end